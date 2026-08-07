.class public Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public debug_on_:Z

.field public debug_output_:Ljava/lang/String;

.field public detect3d_switch_:Z

.field public detect_single_frame_:Z

.field public orig_landmarks_222_:[F

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
    iput v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->version_:I

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->use_tracking_:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->debug_on_:Z

    .line 10
    .line 11
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->detect_single_frame_:Z

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->detect3d_switch_:Z

    .line 14
    .line 15
    const-string v1, "/sdcard/momocv_debug.log"

    .line 16
    .line 17
    iput-object v1, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->debug_output_:Ljava/lang/String;

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/momocv/handdetectlandmark/HandDetectLandmarkParams;->use_cpu_only_:Z

    .line 20
    .line 21
    return-void
.end method
