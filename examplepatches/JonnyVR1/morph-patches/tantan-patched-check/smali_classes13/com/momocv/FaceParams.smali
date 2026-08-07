.class public Lcom/momocv/FaceParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momocv/FaceParams$PoseEstimationType;
    }
.end annotation


# instance fields
.field public asynchronous_face_detect_:Z

.field public asynchronous_save_features_:Z

.field public constraint_euler_angles_:[F

.field public debug_on_:Z

.field public debug_output_:Ljava/lang/String;

.field public detect_single_frame_:Z

.field public do_facedect_corp_center_:Z

.field public extract_feature_id_:I

.field public face_alignment_version_:I

.field public face_register_mode_:Z

.field public feature_strict_:Z

.field public focal_length_multiply_:F

.field public fov_:D

.field public frame_interval_:I

.field public image_quality_controller_:Z

.field public img_crop_type_:I

.field public keypoints_stable_coef_:F

.field public max_faces_:I

.field public motion_blur_result_threshold_:F

.field public mouth_sg:Z

.field public mouth_sg_smooth:Z

.field public npd_accelerate_:Z

.field public pose_estimation_type_:I

.field public pose_stable_coef_:F

.field public reset_feature_id_:I

.field public save_features_:Z

.field public save_features_version_:I

.field public supper_stable_mode_:Z

.field public use_mix_:Z

.field public use_npd_:Z

.field public zFar_:D

.field public zNear_:D


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momocv/FaceParams;->img_crop_type_:I

    .line 6
    .line 7
    const/4 v1, 0x5

    .line 8
    iput v1, p0, Lcom/momocv/FaceParams;->frame_interval_:I

    .line 9
    .line 10
    iput v0, p0, Lcom/momocv/FaceParams;->face_alignment_version_:I

    .line 11
    .line 12
    const/4 v1, 0x3

    .line 13
    iput v1, p0, Lcom/momocv/FaceParams;->max_faces_:I

    .line 14
    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    iput v2, p0, Lcom/momocv/FaceParams;->keypoints_stable_coef_:F

    .line 18
    .line 19
    iput v0, p0, Lcom/momocv/FaceParams;->pose_estimation_type_:I

    .line 20
    .line 21
    iput v2, p0, Lcom/momocv/FaceParams;->pose_stable_coef_:F

    .line 22
    .line 23
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->detect_single_frame_:Z

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->image_quality_controller_:Z

    .line 26
    .line 27
    const/4 v2, 0x1

    .line 28
    iput-boolean v2, p0, Lcom/momocv/FaceParams;->use_npd_:Z

    .line 29
    .line 30
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->use_mix_:Z

    .line 31
    .line 32
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->npd_accelerate_:Z

    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/momocv/FaceParams;->asynchronous_face_detect_:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->do_facedect_corp_center_:Z

    .line 37
    .line 38
    iput-boolean v2, p0, Lcom/momocv/FaceParams;->supper_stable_mode_:Z

    .line 39
    .line 40
    const-wide v2, 0x4046800000000000L    # 45.0

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    iput-wide v2, p0, Lcom/momocv/FaceParams;->fov_:D

    .line 46
    .line 47
    const-wide v2, 0x40b3880000000000L    # 5000.0

    .line 48
    .line 49
    .line 50
    .line 51
    .line 52
    iput-wide v2, p0, Lcom/momocv/FaceParams;->zFar_:D

    .line 53
    .line 54
    const-wide v2, 0x3fa999999999999aL    # 0.05

    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    iput-wide v2, p0, Lcom/momocv/FaceParams;->zNear_:D

    .line 60
    .line 61
    const/high16 v2, 0x3f800000    # 1.0f

    .line 62
    .line 63
    iput v2, p0, Lcom/momocv/FaceParams;->focal_length_multiply_:F

    .line 64
    .line 65
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->save_features_:Z

    .line 66
    .line 67
    iput v0, p0, Lcom/momocv/FaceParams;->extract_feature_id_:I

    .line 68
    .line 69
    iput v0, p0, Lcom/momocv/FaceParams;->reset_feature_id_:I

    .line 70
    .line 71
    new-array v1, v1, [F

    .line 72
    .line 73
    fill-array-data v1, :array_0

    .line 74
    .line 75
    .line 76
    iput-object v1, p0, Lcom/momocv/FaceParams;->constraint_euler_angles_:[F

    .line 77
    .line 78
    const v1, 0x5f3759ee

    .line 79
    .line 80
    .line 81
    iput v1, p0, Lcom/momocv/FaceParams;->save_features_version_:I

    .line 82
    .line 83
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->asynchronous_save_features_:Z

    .line 84
    .line 85
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->feature_strict_:Z

    .line 86
    .line 87
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->debug_on_:Z

    .line 88
    .line 89
    const-string v1, "/sdcard/momocv_debug.log"

    .line 90
    .line 91
    iput-object v1, p0, Lcom/momocv/FaceParams;->debug_output_:Ljava/lang/String;

    .line 92
    .line 93
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->face_register_mode_:Z

    .line 94
    .line 95
    const/high16 v1, 0x3f000000    # 0.5f

    .line 96
    .line 97
    iput v1, p0, Lcom/momocv/FaceParams;->motion_blur_result_threshold_:F

    .line 98
    .line 99
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->mouth_sg:Z

    .line 100
    .line 101
    iput-boolean v0, p0, Lcom/momocv/FaceParams;->mouth_sg_smooth:Z

    .line 102
    .line 103
    return-void

    .line 104
    nop

    .line 105
    :array_0
    .array-data 4
        0x42200000    # 40.0f
        0x42340000    # 45.0f
        0x42480000    # 50.0f
    .end array-data
.end method
