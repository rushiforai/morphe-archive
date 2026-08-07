.class public Lv/fresco/subscaleview/ImageViewState;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;


# instance fields
.field private centerX:F

.field private centerY:F

.field private orientation:I

.field private scale:F


# direct methods
.method public constructor <init>(FLandroid/graphics/PointF;I)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lv/fresco/subscaleview/ImageViewState;->scale:F

    .line 5
    .line 6
    iget p1, p2, Landroid/graphics/PointF;->x:F

    .line 7
    .line 8
    iput p1, p0, Lv/fresco/subscaleview/ImageViewState;->centerX:F

    .line 9
    .line 10
    iget p1, p2, Landroid/graphics/PointF;->y:F

    .line 11
    .line 12
    iput p1, p0, Lv/fresco/subscaleview/ImageViewState;->centerY:F

    .line 13
    .line 14
    iput p3, p0, Lv/fresco/subscaleview/ImageViewState;->orientation:I

    .line 15
    .line 16
    return-void
.end method


# virtual methods
.method public getCenter()Landroid/graphics/PointF;
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/PointF;

    .line 2
    .line 3
    iget v1, p0, Lv/fresco/subscaleview/ImageViewState;->centerX:F

    .line 4
    .line 5
    iget p0, p0, Lv/fresco/subscaleview/ImageViewState;->centerY:F

    .line 6
    .line 7
    invoke-direct {v0, v1, p0}, Landroid/graphics/PointF;-><init>(FF)V

    .line 8
    .line 9
    .line 10
    return-object v0
.end method

.method public getOrientation()I
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/ImageViewState;->orientation:I

    .line 2
    .line 3
    return p0
.end method

.method public getScale()F
    .locals 0

    .line 1
    iget p0, p0, Lv/fresco/subscaleview/ImageViewState;->scale:F

    .line 2
    .line 3
    return p0
.end method
