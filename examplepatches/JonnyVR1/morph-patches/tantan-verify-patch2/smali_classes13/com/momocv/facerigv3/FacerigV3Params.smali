.class public Lcom/momocv/facerigv3/FacerigV3Params;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public face_processor_eulers_:[F

.field public orig_landmarks_87_:[F

.field public orig_landmarks_96_:[F

.field public stable_coef_:F

.field public use_stable_:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/momocv/BaseParams;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput-boolean v0, p0, Lcom/momocv/facerigv3/FacerigV3Params;->use_stable_:Z

    .line 6
    .line 7
    const/high16 v0, 0x40400000    # 3.0f

    .line 8
    .line 9
    iput v0, p0, Lcom/momocv/facerigv3/FacerigV3Params;->stable_coef_:F

    .line 10
    .line 11
    return-void
.end method
