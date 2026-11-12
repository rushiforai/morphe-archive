.class public final Lc9i;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:F

.field public b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public final f:F

.field public g:I

.field public final h:Landroid/graphics/Paint;


# direct methods
.method public synthetic constructor <init>(FI)V
    .registers 10

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v3, -0x1

    const/4 v4, -0x1

    move-object v0, p0

    move v1, p1

    move v2, p2

    .line 28
    invoke-direct/range {v0 .. v6}, Lc9i;-><init>(FIIIIF)V

    return-void
.end method

.method public constructor <init>(FIIIIF)V
    .registers 7

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput p1, p0, Lc9i;->a:F

    iput p2, p0, Lc9i;->b:I

    iput p3, p0, Lc9i;->c:I

    iput p4, p0, Lc9i;->d:I

    iput p5, p0, Lc9i;->e:I

    iput p6, p0, Lc9i;->f:F

    const/16 p1, 0xff

    iput p1, p0, Lc9i;->g:I

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lc9i;->h:Landroid/graphics/Paint;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 15

    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    iget-object v8, p0, Lc9i;->h:Landroid/graphics/Paint;

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v0, p0, Lc9i;->b:I

    iget v1, p0, Lc9i;->g:I

    int-to-float v1, v1

    const/high16 v9, 0x437f0000    # 255.0f

    div-float/2addr v1, v9

    invoke-static {v1, v0}, Lp37;->a0(FI)I

    move-result v0

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    iget v0, p0, Lc9i;->f:F

    const/4 v10, 0x0

    cmpl-float v1, v0, v10

    iget v11, p0, Lc9i;->e:I

    if-lez v1, :cond_2c

    if-eqz v11, :cond_2c

    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    move-result v1

    const/16 v2, 0xff

    if-ne v1, v2, :cond_2c

    const/high16 v1, 0x3f000000    # 0.5f

    goto :goto_2d

    :cond_2c
    move v1, v10

    :goto_2d
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v2

    iget v2, v2, Landroid/graphics/Rect;->left:I

    int-to-float v2, v2

    add-float/2addr v2, v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v3

    iget v3, v3, Landroid/graphics/Rect;->top:I

    int-to-float v3, v3

    add-float/2addr v3, v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sub-float/2addr v4, v1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    sub-float/2addr v5, v1

    iget v12, p0, Lc9i;->a:F

    sub-float v1, v12, v1

    cmpg-float v6, v1, v10

    if-gez v6, :cond_59

    move v6, v10

    move-object v1, p1

    move v7, v6

    goto :goto_5c

    :cond_59
    move v6, v1

    move v7, v6

    move-object v1, p1

    :goto_5c
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    cmpl-float p1, v0, v10

    if-lez p1, :cond_ac

    if-eqz v11, :cond_ac

    sget-object p1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget p1, p0, Lc9i;->g:I

    int-to-float p1, p1

    div-float/2addr p1, v9

    invoke-static {p1, v11}, Lp37;->a0(FI)I

    move-result p1

    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/high16 p1, 0x40000000    # 2.0f

    div-float/2addr v0, p1

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->left:I

    int-to-float p1, p1

    add-float v2, p1, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->top:I

    int-to-float p1, p1

    add-float v3, p1, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p1

    iget p1, p1, Landroid/graphics/Rect;->right:I

    int-to-float p1, p1

    sub-float v4, p1, v0

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    int-to-float p0, p0

    sub-float v5, p0, v0

    sub-float/2addr v12, v0

    cmpg-float p0, v12, v10

    if-gez p0, :cond_a7

    move v6, v10

    :goto_a5
    move v7, v6

    goto :goto_a9

    :cond_a7
    move v6, v12

    goto :goto_a5

    :goto_a9
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    :cond_ac
    return-void
.end method

.method public final getAlpha()I
    .registers 1

    iget p0, p0, Lc9i;->g:I

    return p0
.end method

.method public final getColorFilter()Landroid/graphics/ColorFilter;
    .registers 1

    iget-object p0, p0, Lc9i;->h:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object p0

    return-object p0
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget p0, p0, Lc9i;->d:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget p0, p0, Lc9i;->c:I

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 3

    iget v0, p0, Lc9i;->g:I

    if-ne p1, v0, :cond_5

    return-void

    :cond_5
    iput p1, p0, Lc9i;->g:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 4

    iget-object v0, p0, Lc9i;->h:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColorFilter()Landroid/graphics/ColorFilter;

    move-result-object v1

    invoke-static {p1, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_d

    return-void

    :cond_d
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method
