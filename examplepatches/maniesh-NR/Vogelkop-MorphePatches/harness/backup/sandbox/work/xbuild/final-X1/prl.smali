.class public final Lprl;
.super Lua7;
.source "SourceFile"


# instance fields
.field public e:Landroid/graphics/PointF;


# virtual methods
.method public final y(Lg3d;)Ljava/lang/Object;
    .registers 7

    iget-object v0, p1, Lg3d;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/PointF;

    iget v0, v0, Landroid/graphics/PointF;->x:F

    iget-object v1, p1, Lg3d;->d:Ljava/lang/Object;

    check-cast v1, Landroid/graphics/PointF;

    iget v1, v1, Landroid/graphics/PointF;->x:F

    iget p1, p1, Lg3d;->f:F

    const/4 v2, 0x0

    const/high16 v3, 0x3f800000    # 1.0f

    invoke-static {p1, v2, v3}, Ldjh;->b(FFF)F

    move-result p1

    cmpl-float v4, v0, v1

    if-lez v4, :cond_1b

    sub-float p1, v3, p1

    :cond_1b
    iget-object p0, p0, Lprl;->e:Landroid/graphics/PointF;

    new-instance v3, Landroid/graphics/PointF;

    sub-float/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    move-result v0

    mul-float/2addr v0, p1

    invoke-direct {v3, v0, v2}, Landroid/graphics/PointF;-><init>(FF)V

    new-instance p1, Landroid/graphics/PointF;

    iget v0, p0, Landroid/graphics/PointF;->x:F

    iget p0, p0, Landroid/graphics/PointF;->y:F

    invoke-direct {p1, v0, p0}, Landroid/graphics/PointF;-><init>(FF)V

    iget p0, v3, Landroid/graphics/PointF;->x:F

    iget v0, v3, Landroid/graphics/PointF;->y:F

    invoke-virtual {p1, p0, v0}, Landroid/graphics/PointF;->offset(FF)V

    return-object p1
.end method
