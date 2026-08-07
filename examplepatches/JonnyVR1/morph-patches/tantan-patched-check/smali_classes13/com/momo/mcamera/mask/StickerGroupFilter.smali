.class public Lcom/momo/mcamera/mask/StickerGroupFilter;
.super Lcom/momo/mcamera/mask/FaceDetectGroupFilter;
.source "SourceFile"


# static fields
.field public static final ADJUST_VALUE:F = 0.5833333f


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/FaceDetectGroupFilter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getCenterPoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)Landroid/graphics/PointF;
    .locals 2

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr v0, p0

    .line 6
    const/high16 v1, 0x40000000    # 2.0f

    .line 7
    .line 8
    div-float/2addr v0, v1

    .line 9
    add-float/2addr p0, v0

    .line 10
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 13
    .line 14
    sub-float/2addr p2, p1

    .line 15
    div-float/2addr p2, v1

    .line 16
    add-float/2addr p1, p2

    .line 17
    new-instance p2, Landroid/graphics/PointF;

    .line 18
    .line 19
    invoke-direct {p2, p0, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 20
    .line 21
    .line 22
    return-object p2
.end method

.method public getmDistancePoint(Landroid/graphics/PointF;Landroid/graphics/PointF;)D
    .locals 1

    .line 1
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 2
    .line 3
    iget v0, p2, Landroid/graphics/PointF;->x:F

    .line 4
    .line 5
    sub-float/2addr p0, v0

    .line 6
    iget p1, p1, Landroid/graphics/PointF;->y:F

    .line 7
    .line 8
    iget p2, p2, Landroid/graphics/PointF;->y:F

    .line 9
    .line 10
    sub-float/2addr p1, p2

    .line 11
    mul-float/2addr p0, p0

    .line 12
    mul-float/2addr p1, p1

    .line 13
    add-float/2addr p0, p1

    .line 14
    float-to-double p0, p0

    .line 15
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 16
    .line 17
    .line 18
    move-result-wide p0

    .line 19
    return-wide p0
.end method

.method public rotatePoint(Landroid/graphics/PointF;F)V
    .locals 12

    .line 1
    float-to-double v0, p2

    .line 2
    const-wide v2, 0x3f91df46a2529d39L    # 0.017453292519943295

    .line 3
    .line 4
    .line 5
    .line 6
    .line 7
    mul-double/2addr v0, v2

    .line 8
    double-to-float p0, v0

    .line 9
    float-to-double v0, p0

    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v2

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget p0, p1, Landroid/graphics/PointF;->x:F

    .line 19
    .line 20
    iget p2, p1, Landroid/graphics/PointF;->y:F

    .line 21
    .line 22
    float-to-double v4, p0

    .line 23
    mul-double v6, v4, v2

    .line 24
    .line 25
    float-to-double v8, p2

    .line 26
    mul-double v10, v8, v0

    .line 27
    .line 28
    sub-double/2addr v6, v10

    .line 29
    double-to-float p0, v6

    .line 30
    iput p0, p1, Landroid/graphics/PointF;->x:F

    .line 31
    .line 32
    mul-double/2addr v4, v0

    .line 33
    mul-double/2addr v8, v2

    .line 34
    add-double/2addr v4, v8

    .line 35
    double-to-float p0, v4

    .line 36
    iput p0, p1, Landroid/graphics/PointF;->y:F

    .line 37
    .line 38
    return-void
.end method

.method public setMMCVInfo(Ll/omw;)V
    .locals 0

    .line 1
    return-void
.end method
