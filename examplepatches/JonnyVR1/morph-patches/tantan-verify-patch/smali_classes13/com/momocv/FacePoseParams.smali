.class public Lcom/momocv/FacePoseParams;
.super Lcom/momocv/BaseParams;
.source "SourceFile"


# instance fields
.field public focal_length_multiply_:F

.field public fov_:D

.field public image_height_:I

.field public image_width_:I

.field public landmarks_:[F

.field public zFar_:D

.field public zNear_:D


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
    iput v0, p0, Lcom/momocv/FacePoseParams;->image_width_:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momocv/FacePoseParams;->image_height_:I

    .line 8
    .line 9
    const-wide v0, 0x4046800000000000L    # 45.0

    .line 10
    .line 11
    .line 12
    .line 13
    .line 14
    iput-wide v0, p0, Lcom/momocv/FacePoseParams;->fov_:D

    .line 15
    .line 16
    const-wide v0, 0x40b3880000000000L    # 5000.0

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    iput-wide v0, p0, Lcom/momocv/FacePoseParams;->zFar_:D

    .line 22
    .line 23
    const-wide v0, 0x3fa999999999999aL    # 0.05

    .line 24
    .line 25
    .line 26
    .line 27
    .line 28
    iput-wide v0, p0, Lcom/momocv/FacePoseParams;->zNear_:D

    .line 29
    .line 30
    const/high16 v0, 0x3f800000    # 1.0f

    .line 31
    .line 32
    iput v0, p0, Lcom/momocv/FacePoseParams;->focal_length_multiply_:F

    .line 33
    .line 34
    return-void
.end method
