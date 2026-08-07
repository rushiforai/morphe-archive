.class public Lcom/momocv/handlandmark/HandLandmarkParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public debug_on_:Z

.field public debug_output_:Ljava/lang/String;

.field public detect3d_switch_:Z

.field public detect_single_frame_:Z

.field public proj_matrix_:[F

.field public use_cpu_only_:Z

.field public use_tracking_:Z

.field public version_:I


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
    iput v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->version_:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->use_tracking_:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->debug_on_:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->detect_single_frame_:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->detect3d_switch_:Z

    .line 14
    .line 15
    const-string v1, "/sdcard/momocv_debug.log"

    .line 16
    .line 17
    iput-object v1, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->debug_output_:Ljava/lang/String;

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->use_cpu_only_:Z

    .line 20
    .line 21
    const/16 v0, 0x10

    .line 22
    .line 23
    new-array v0, v0, [F

    .line 24
    .line 25
    fill-array-data v0, :array_0

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Lcom/momocv/handlandmark/HandLandmarkParams;->proj_matrix_:[F

    .line 29
    .line 30
    return-void

    .line 31
    :array_0
    .array-data 4
        0x4089691d
        0x0
        0x0
        0x0
        0x0
        0x401a8277
        0x0
        0x0
        0x0
        0x0
        0x3f866666    # 1.05f
        -0x43dc28f6    # -0.01f
        0x0
        0x0
        0x3f800000    # 1.0f
        0x0
    .end array-data
.end method
