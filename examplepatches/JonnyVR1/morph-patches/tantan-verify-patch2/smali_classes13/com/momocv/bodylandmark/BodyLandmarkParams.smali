.class public Lcom/momocv/bodylandmark/BodyLandmarkParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public debug_on_:Z

.field public debug_output_:Ljava/lang/String;

.field public detect_single_frame_:Z

.field public use_tracking_:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/bodylandmark/BodyLandmarkParams;->use_tracking_:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/bodylandmark/BodyLandmarkParams;->debug_on_:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/bodylandmark/BodyLandmarkParams;->detect_single_frame_:Z

    .line 10
    .line 11
    const-string v0, "/sdcard/momocv_debug.log"

    .line 12
    .line 13
    iput-object v0, p0, Lcom/momocv/bodylandmark/BodyLandmarkParams;->debug_output_:Ljava/lang/String;

    .line 14
    .line 15
    return-void
.end method
