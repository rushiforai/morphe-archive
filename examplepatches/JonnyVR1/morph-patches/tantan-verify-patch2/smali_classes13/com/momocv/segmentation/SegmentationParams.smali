.class public Lcom/momocv/segmentation/SegmentationParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public debug_on_:Z

.field public debug_output_:Ljava/lang/String;

.field public min_object_ratio_:F

.field public reset_:Z

.field public sg_version:I

.field public video_mode_:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/segmentation/SegmentationParams;->reset_:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    iput-boolean v1, p0, Lcom/momocv/segmentation/SegmentationParams;->video_mode_:Z

    .line 9
    .line 10
    const/high16 v1, 0x3e000000    # 0.125f

    .line 11
    .line 12
    iput v1, p0, Lcom/momocv/segmentation/SegmentationParams;->min_object_ratio_:F

    .line 13
    .line 14
    iput-boolean v0, p0, Lcom/momocv/segmentation/SegmentationParams;->debug_on_:Z

    .line 15
    .line 16
    iput v0, p0, Lcom/momocv/segmentation/SegmentationParams;->sg_version:I

    .line 17
    .line 18
    const-string v0, "/sdcard/momocv_debug.log"

    .line 19
    .line 20
    iput-object v0, p0, Lcom/momocv/segmentation/SegmentationParams;->debug_output_:Ljava/lang/String;

    .line 21
    .line 22
    return-void
.end method
