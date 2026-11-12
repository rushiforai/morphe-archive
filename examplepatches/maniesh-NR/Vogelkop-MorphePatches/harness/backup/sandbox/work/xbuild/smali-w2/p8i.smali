.class public final Lp8i;
.super Ls8i;
.source "SourceFile"


# instance fields
.field public final f:Lo8i;

.field public final g:Ln8i;

.field public final h:Landroid/graphics/Paint;

.field public final i:Landroid/graphics/RectF;

.field public final j:Landroid/graphics/Bitmap;

.field public final k:I

.field public l:I

.field public final m:I

.field public n:Z


# direct methods
.method public constructor <init>(IILandroid/content/Context;Landroid/graphics/Bitmap;)V
    .registers 5

    invoke-direct {p0, p4, p1}, Ls8i;-><init>(Landroid/graphics/Bitmap;I)V

    new-instance p1, Landroid/graphics/RectF;

    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    iput-object p1, p0, Lp8i;->i:Landroid/graphics/RectF;

    new-instance p1, Lo8i;

    invoke-direct {p1, p0, p2}, Lo8i;-><init>(Lp8i;I)V

    iput-object p1, p0, Lp8i;->f:Lo8i;

    new-instance p1, Ln8i;

    invoke-direct {p1, p0}, Ln8i;-><init>(Lp8i;)V

    iput-object p1, p0, Lp8i;->g:Ln8i;

    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lp8i;->h:Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    const p1, 0x7f0809a2

    invoke-static {p1, p3}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p1

    const/high16 p2, 0x40800000    # 4.0f

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p4

    invoke-static {p2, p4}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p2

    check-cast p1, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {p1}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object p1

    iput-object p1, p0, Lp8i;->j:Landroid/graphics/Bitmap;

    iput p2, p0, Lp8i;->k:I

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    const/high16 p1, 0x3f800000    # 1.0f

    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-static {p1, p2}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result p1

    iput p1, p0, Lp8i;->m:I

    return-void
.end method


# virtual methods
.method public final a(I)V
    .registers 4

    const/4 v0, 0x1

    iput-boolean v0, p0, Lp8i;->n:Z

    iput p1, p0, Lp8i;->l:I

    iget-object p0, p0, Lp8i;->g:Ln8i;

    iget-object p1, p0, Ln8i;->a:Landroid/animation/ValueAnimator;

    iget-short v0, p0, Ln8i;->e:S

    const/16 v1, 0xff

    if-ne v0, v1, :cond_10

    return-void

    :cond_10
    iput-short v1, p0, Ln8i;->e:S

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->cancel()V

    iget-object v0, p0, Ln8i;->a:Landroid/animation/ValueAnimator;

    invoke-virtual {v0}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Integer;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    iget-short p0, p0, Ln8i;->e:S

    filled-new-array {v0, p0}, [I

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/animation/ValueAnimator;->setIntValues([I)V

    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->end()V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 15

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v0

    int-to-float v0, v0

    iget-object v2, p0, Lp8i;->f:Lo8i;

    iget-object v3, v2, Lo8i;->a:Landroid/animation/ValueAnimator;

    invoke-virtual {v3}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Integer;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v3

    sget v4, Ln8i;->f:I

    iget-object v4, p0, Lp8i;->g:Ln8i;

    iget-object v5, v4, Ln8i;->a:Landroid/animation/ValueAnimator;

    iget-object v4, v4, Ln8i;->c:Landroid/graphics/Paint;

    invoke-virtual {v5}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    const/16 v6, 0xff

    if-ne v5, v6, :cond_8a

    iget v5, p0, Lp8i;->l:I

    if-nez v5, :cond_8a

    iget-object v5, p0, Lp8i;->j:Landroid/graphics/Bitmap;

    if-eqz v5, :cond_8a

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerX()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v6}, Landroid/graphics/Rect;->centerY()I

    move-result v6

    int-to-float v6, v6

    iget-object v2, v2, Lo8i;->a:Landroid/animation/ValueAnimator;

    invoke-virtual {v2}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    shl-int/lit8 v8, v2, 0x1

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v9

    iget v10, p0, Lp8i;->k:I

    shl-int/lit8 v11, v10, 0x1

    sub-int/2addr v9, v11

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    shl-int/lit8 v12, v10, 0x1

    sub-int/2addr v11, v12

    int-to-float v8, v8

    int-to-float v9, v9

    div-float v9, v8, v9

    int-to-float v11, v11

    div-float/2addr v8, v11

    int-to-float v2, v2

    sub-float v11, v7, v2

    int-to-float v10, v10

    mul-float/2addr v9, v10

    sub-float/2addr v11, v9

    iget-object v12, p0, Lp8i;->i:Landroid/graphics/RectF;

    iput v11, v12, Landroid/graphics/RectF;->left:F

    sub-float v11, v6, v2

    mul-float/2addr v10, v8

    sub-float/2addr v11, v10

    iput v11, v12, Landroid/graphics/RectF;->top:F

    add-float/2addr v7, v2

    add-float/2addr v7, v9

    iput v7, v12, Landroid/graphics/RectF;->right:F

    add-float/2addr v6, v2

    add-float/2addr v6, v10

    iput v6, v12, Landroid/graphics/RectF;->bottom:F

    const/4 v2, 0x0

    iget-object v6, p0, Lp8i;->h:Landroid/graphics/Paint;

    invoke-virtual {p1, v5, v2, v12, v6}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    :cond_8a
    invoke-virtual {v4}, Landroid/graphics/Paint;->getAlpha()I

    move-result v2

    if-eqz v2, :cond_94

    int-to-float v2, v3

    invoke-virtual {p1, v1, v0, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_94
    iget-object v2, p0, Ls8i;->c:Landroid/graphics/Paint;

    iget v4, p0, Ls8i;->b:I

    if-eqz v4, :cond_cd

    iget-object v5, p0, Ls8i;->a:Landroid/graphics/Bitmap;

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    if-ne v4, v6, :cond_a8

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    if-eq v4, v6, :cond_cd

    :cond_a8
    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    int-to-float v4, v4

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float v6, v4, v6

    invoke-virtual {v5}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-virtual {p1, v6, v4}, Landroid/graphics/Canvas;->scale(FF)V

    div-float v5, v1, v6

    div-float v7, v0, v4

    int-to-float v8, v3

    invoke-static {v6, v4}, Ljava/lang/Math;->min(FF)F

    move-result v4

    div-float/2addr v8, v4

    invoke-virtual {p1, v5, v7, v8, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    goto :goto_d1

    :cond_cd
    int-to-float v4, v3

    invoke-virtual {p1, v1, v0, v4, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :goto_d1
    iget v2, p0, Lp8i;->l:I

    if-eqz v2, :cond_101

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    iget v4, p0, Lp8i;->l:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget v4, p0, Lp8i;->m:I

    int-to-float v4, v4

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    const/4 v5, 0x1

    invoke-virtual {v2, v5}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    iget-boolean p0, p0, Lp8i;->n:Z

    const/high16 v5, 0x40000000    # 2.0f

    if-eqz p0, :cond_fb

    int-to-float p0, v3

    div-float/2addr v4, v5

    sub-float/2addr p0, v4

    invoke-virtual {p1, v1, v0, p0, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void

    :cond_fb
    int-to-float p0, v3

    div-float/2addr v4, v5

    add-float/2addr v4, p0

    invoke-virtual {p1, v1, v0, v4, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :cond_101
    return-void
.end method
