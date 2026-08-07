.class public Lcom/momocv/videoprocessor/VideoParams;
.super Lcom/momocv/FaceParams;
.source "SourceFile"


# instance fields
.field public beauty_switch_:Z

.field public expression_switch_:Z

.field public eye_classify_switch_:Z

.field public face_warp_gradual_switch_:Z

.field public face_warp_gradual_thresh_:I

.field public multifaces_switch_:Z

.field public skin_switch_:Z

.field public track_switch_:Z

.field public video_processor_frame_skip_:I

.field public warp_level1_:F

.field public warp_level2_:F

.field public warp_level_group_:Lcom/momocv/beauty/XCameraWarpLevelParams;

.field public warp_type_:I


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momocv/FaceParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->expression_switch_:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->eye_classify_switch_:Z

    .line 8
    .line 9
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->beauty_switch_:Z

    .line 10
    .line 11
    iput v0, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_type_:I

    .line 12
    .line 13
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->multifaces_switch_:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput v1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_level1_:F

    .line 17
    .line 18
    iput v1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_level2_:F

    .line 19
    .line 20
    new-instance v1, Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 21
    .line 22
    invoke-direct {v1}, Lcom/momocv/beauty/XCameraWarpLevelParams;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Lcom/momocv/videoprocessor/VideoParams;->warp_level_group_:Lcom/momocv/beauty/XCameraWarpLevelParams;

    .line 26
    .line 27
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->skin_switch_:Z

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->face_warp_gradual_switch_:Z

    .line 30
    .line 31
    const/16 v1, 0xa

    .line 32
    .line 33
    iput v1, p0, Lcom/momocv/videoprocessor/VideoParams;->face_warp_gradual_thresh_:I

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/momocv/videoprocessor/VideoParams;->track_switch_:Z

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    iput v0, p0, Lcom/momocv/videoprocessor/VideoParams;->video_processor_frame_skip_:I

    .line 39
    .line 40
    return-void
.end method
