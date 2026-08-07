.class public Lcom/momocv/SingleFaceInfo;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public camera_matrix_:[F

.field public euler_angles_:[F

.field public face_covered_rate:F

.field public face_mask:[B

.field public face_mask_height:I

.field public face_mask_width:I

.field public face_prob_:F

.field public face_rect_:[F

.field public face_rotate_degree_2d_:F

.field public face_warp_mat:[F

.field public facepose_type_:I

.field public feature_quality_score_:F

.field public features_:[B

.field public features_quality_:I

.field public landmarks137_occprobe_:[F

.field public landmarks_104_:[F

.field public landmarks_106_:[F

.field public landmarks_137_:[F

.field public landmarks_222_:[F

.field public landmarks_240_:[F

.field public landmarks_68_:[F

.field public landmarks_87_:[F

.field public landmarks_96_:[F

.field public liveness_:I

.field public modelview_matrix_:[F

.field public mouth_covered_rate:F

.field public mouth_mask:[B

.field public mouth_mask_height:I

.field public mouth_mask_width:I

.field public mouth_warp_mat:[F

.field public occflag_:I

.field public occtype_:I

.field public orig_face_rect_:[F

.field public orig_face_rotate_degree_2d_:F

.field public orig_landmarks_104_:[F

.field public orig_landmarks_106_:[F

.field public orig_landmarks_137_:[F

.field public orig_landmarks_222_:[F

.field public orig_landmarks_240_:[F

.field public orig_landmarks_68_:[F

.field public orig_landmarks_87_:[F

.field public orig_landmarks_96_:[F

.field public projection_matrix_:[F

.field public projection_matrix_opengl_:[F

.field public quality_:I

.field public rotation_matrix_:[F

.field public rotation_vector_:[F

.field public tracking_id_:I

.field public translation_vector_:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/momocv/SingleFaceInfo;->occflag_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/SingleFaceInfo;->occtype_:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momocv/SingleFaceInfo;->liveness_:I

    .line 10
    .line 11
    return-void
.end method
