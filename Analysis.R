# Myofibroblast 10X genomics experiment - Processing pipeline

# Load required packages
library(rmarkdown)

# Define paths for data
barcodes_path <- "/Users/yutongli/Desktop/Data for R/filtered_feature_bc_matrix/barcodes.tsv.gz"
features_path <- "/Users/yutongli/Desktop/Data for R/filtered_feature_bc_matrix/features.tsv.gz"
matrix_path <- "/Users/yutongli/Desktop/Data for R/filtered_feature_bc_matrix/matrix.mtx.gz"

# Render Data Loading report
rmarkdown::render("scripts/Data-loading.Rmd", output_file = "reports/data_loading.html", 
                  params = list(barcodes_path = barcodes_path,
                                features_path = features_path,
                                matrix_path = matrix_path))

# Load the Seurat object saved in Data-loading.Rmd
seurat_object <- readRDS("path_to_saved_seurat_object.rds")

# Render Data Preprocessing and Checking report
rmarkdown::render("scripts/Data-Preprocessing-and-checking.Rmd", output_file = "reports/data_preprocessing.html", 
                  params = list(seurat_object = seurat_object))

# Render Visualization and Marker Identification report
rmarkdown::render("scripts/Visualization-and-marker-identification.Rmd", output_file = "reports/visualization_marker_identification.html", 
                  params = list(seurat_object = seurat_object))

# Render Clustering report
rmarkdown::render("scripts/Clustering.Rmd", output_file = "reports/clustering.html", 
                  params = list(seurat_object = seurat_object))

# Render Cell Cycle Analysis report
rmarkdown::render("scripts/Cellcycle-analysis.Rmd", output_file = "reports/cellcycle_analysis.html", 
                  params = list(seurat_object = seurat_object))
