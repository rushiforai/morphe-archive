.class public final Lz9h;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:F

.field public e:F

.field public final f:Landroid/graphics/RectF;

.field public final g:Landroid/graphics/RectF;

.field public final h:Landroid/graphics/Paint;

.field public final i:Landroid/graphics/Path;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput v0, p0, Lz9h;->a:I

    iput v0, p0, Lz9h;->b:I

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lz9h;->f:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lz9h;->g:Landroid/graphics/RectF;

    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lz9h;->h:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/Path;

    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    iput-object v1, p0, Lz9h;->i:Landroid/graphics/Path;

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const/4 p0, 0x4

    invoke-virtual {v1, p0}, Landroid/graphics/Path;->incReserve(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;FF)V
    .registers 9

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v0

    iget-object v1, p0, Lz9h;->f:Landroid/graphics/RectF;

    iget v2, v1, Landroid/graphics/RectF;->left:F

    iget v3, p0, Lz9h;->d:F

    const/high16 v4, 0x40000000    # 2.0f

    div-float/2addr v3, v4

    add-float/2addr v2, v3

    iget v1, v1, Landroid/graphics/RectF;->top:F

    add-float/2addr v3, v1

    invoke-virtual {p1, v2, v3}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {p1, p2}, Landroid/graphics/Canvas;->rotate(F)V

    const/high16 p2, 0x40400000    # 3.0f

    mul-float/2addr p3, p2

    iget p2, p0, Lz9h;->e:F

    mul-float/2addr p3, p2

    iget-object p2, p0, Lz9h;->g:Landroid/graphics/RectF;

    invoke-virtual {p2}, Landroid/graphics/RectF;->width()F

    move-result p2

    div-float/2addr p2, v4

    iget-object v1, p0, Lz9h;->i:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->rewind()V

    div-float v2, p3, v4

    sub-float v3, p2, v2

    const/high16 v4, -0x40800000    # -1.0f

    invoke-virtual {v1, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    add-float/2addr v2, p2

    invoke-virtual {v1, v2, v4}, Landroid/graphics/Path;->lineTo(FF)V

    const v2, 0x3f2b851f    # 0.67f

    mul-float/2addr p3, v2

    invoke-virtual {v1, p2, p3}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget p2, p0, Lz9h;->c:I

    iget-object p0, p0, Lz9h;->h:Landroid/graphics/Paint;

    invoke-virtual {p0, p2}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p1, v1, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public final b(Landroid/graphics/Canvas;FF)V
    .registers 11

    const/4 v0, 0x0

    cmpl-float v0, p3, v0

    if-nez v0, :cond_6

    return-void

    :cond_6
    iget v0, p0, Lz9h;->c:I

    iget-object v6, p0, Lz9h;->h:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v2, p0, Lz9h;->g:Landroid/graphics/RectF;

    const/4 v5, 0x0

    move-object v1, p1

    move v3, p2

    move v4, p3

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method public final c(Landroid/graphics/Canvas;FF)V
    .registers 12

    sget v0, Lcom/opera/android/custom_views/PullSpinner;->u:I

    const/high16 v0, 0x40000000    # 2.0f

    mul-float v1, p3, v0

    const/high16 v2, 0x3f800000    # 1.0f

    cmpl-float v3, v1, v2

    if-lez v3, :cond_f

    sub-float v3, v0, v1

    goto :goto_10

    :cond_f
    move v3, v1

    :goto_10
    mul-float/2addr v3, v0

    cmpg-float v2, v3, v2

    const/high16 v4, 0x3f000000    # 0.5f

    if-gez v2, :cond_1c

    mul-float v2, v3, v4

    mul-float/2addr v2, v3

    mul-float/2addr v2, v3

    goto :goto_22

    :cond_1c
    sub-float/2addr v3, v0

    mul-float v2, v3, v3

    mul-float/2addr v2, v3

    add-float/2addr v2, v0

    mul-float/2addr v2, v4

    :goto_22
    const v3, 0x3f333333    # 0.7f

    mul-float/2addr v2, v3

    const v3, 0x3d4ccccd    # 0.05f

    add-float/2addr v2, v3

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v2, v3

    cmpg-float v5, p3, v4

    const-wide v6, 0x4076800000000000L    # 360.0

    if-gtz v5, :cond_3e

    const/high16 p3, 0x42b40000    # 90.0f

    mul-float/2addr v1, p3

    add-float/2addr v1, p2

    float-to-double p2, v1

    :goto_3b
    rem-double/2addr p2, v6

    double-to-float p2, p2

    goto :goto_48

    :cond_3e
    sub-float/2addr p3, v4

    mul-float/2addr p3, v0

    const/high16 v0, 0x41900000    # 18.0f

    mul-float/2addr p3, v0

    add-float/2addr p3, p2

    sub-float/2addr p3, v2

    add-float/2addr p3, v3

    float-to-double p2, p3

    goto :goto_3b

    :goto_48
    iget p3, p0, Lz9h;->a:I

    if-eqz p3, :cond_5b

    iget-object v0, p0, Lz9h;->h:Landroid/graphics/Paint;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    sget-object p3, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object p3, p0, Lz9h;->g:Landroid/graphics/RectF;

    invoke-virtual {p1, p3, v0}, Landroid/graphics/Canvas;->drawOval(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_5b
    invoke-virtual {p0, p1}, Lz9h;->d(Landroid/graphics/Canvas;)V

    invoke-virtual {p0, p1, p2, v2}, Lz9h;->b(Landroid/graphics/Canvas;FF)V

    return-void
.end method

.method public final d(Landroid/graphics/Canvas;)V
    .registers 9

    iget v0, p0, Lz9h;->b:I

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v6, p0, Lz9h;->h:Landroid/graphics/Paint;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v4, 0x43b40000    # 360.0f

    const/4 v5, 0x0

    iget-object v2, p0, Lz9h;->g:Landroid/graphics/RectF;

    const/4 v3, 0x0

    move-object v1, p1

    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    sget-object p0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v6, p0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    return-void
.end method

.method public final e(FFFFFFF)V
    .registers 8

    iput p5, p0, Lz9h;->d:F

    iput p6, p0, Lz9h;->e:F

    iget-object p5, p0, Lz9h;->f:Landroid/graphics/RectF;

    invoke-virtual {p5, p1, p2, p3, p4}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object p1, p0, Lz9h;->g:Landroid/graphics/RectF;

    invoke-virtual {p1, p5}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    iget p2, p0, Lz9h;->d:F

    const/high16 p3, 0x3f800000    # 1.0f

    sub-float/2addr p3, p7

    mul-float/2addr p3, p2

    const/high16 p2, 0x40000000    # 2.0f

    div-float/2addr p3, p2

    invoke-virtual {p1, p3, p3}, Landroid/graphics/RectF;->inset(FF)V

    iget-object p0, p0, Lz9h;->h:Landroid/graphics/Paint;

    invoke-virtual {p0, p6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    return-void
.end method
