.class public Lcom/momocv/facequality/FaceQualityParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public evaluate_single_frame_:Z

.field public face_occlusion_switch_:Z

.field public liveness_detect_switch_:Z

.field public motion_blur_detect_switch_:Z

.field public motion_blur_result_threshold_:F

.field public multi_euler_angles_:[[F

.field public multi_origin_landmarks_222_:[[F

.field public multi_origin_landmarks_96_:[[F

.field public multi_tracking_id_:[I

.field public strict_quality_switch_:Z


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
    iput-boolean v0, p0, Lcom/momocv/facequality/FaceQualityParams;->evaluate_single_frame_:Z

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/momocv/facequality/FaceQualityParams;->strict_quality_switch_:Z

    .line 9
    .line 10
    iput-boolean v0, p0, Lcom/momocv/facequality/FaceQualityParams;->face_occlusion_switch_:Z

    .line 11
    .line 12
    iput-boolean v0, p0, Lcom/momocv/facequality/FaceQualityParams;->motion_blur_detect_switch_:Z

    .line 13
    .line 14
    const/high16 v1, 0x3f000000    # 0.5f

    .line 15
    .line 16
    iput v1, p0, Lcom/momocv/facequality/FaceQualityParams;->motion_blur_result_threshold_:F

    .line 17
    .line 18
    iput-boolean v0, p0, Lcom/momocv/facequality/FaceQualityParams;->liveness_detect_switch_:Z

    .line 19
    .line 20
    return-void
.end method
