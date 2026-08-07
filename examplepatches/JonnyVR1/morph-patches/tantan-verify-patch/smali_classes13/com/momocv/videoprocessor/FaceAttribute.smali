.class public Lcom/momocv/videoprocessor/FaceAttribute;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field public dst_warp_points_:[F

.field public expression_:I

.field public left_eye_close_prob_:F

.field public right_eye_close_prob_:F

.field public skin_threshold_:[I

.field public src_warp_points_:[F

.field public warped_landmarks104_:[F

.field public warped_landmarks106_:[F

.field public warped_landmarks240_:[F

.field public warped_landmarks68_:[F

.field public warped_landmarks96_:[F


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, -0x40800000    # -1.0f

    .line 5
    .line 6
    iput v0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->left_eye_close_prob_:F

    .line 7
    .line 8
    iput v0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->right_eye_close_prob_:F

    .line 9
    .line 10
    const/4 v0, -0x1

    .line 11
    iput v0, p0, Lcom/momocv/videoprocessor/FaceAttribute;->expression_:I

    .line 12
    .line 13
    return-void
.end method
