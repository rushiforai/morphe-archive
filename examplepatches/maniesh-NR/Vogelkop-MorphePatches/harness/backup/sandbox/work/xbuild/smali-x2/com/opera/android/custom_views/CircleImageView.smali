.class public Lcom/opera/android/custom_views/CircleImageView;
.super Lcom/opera/android/custom_views/StylingImageView;
.source "SourceFile"


# instance fields
.field public k:I

.field public l:I

.field public m:I

.field public final n:Landroid/graphics/Paint;

.field public final o:Landroid/graphics/Paint;

.field public final p:Landroid/graphics/Matrix;

.field public q:Landroid/graphics/Bitmap;

.field public r:Landroid/graphics/BitmapShader;

.field public s:Landroid/graphics/Bitmap;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 5

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/android/custom_views/StylingImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance p1, Landroid/graphics/Paint;

    const/4 p2, 0x1

    invoke-direct {p1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lcom/opera/android/custom_views/CircleImageView;->n:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/Paint;

    invoke-direct {v1, p2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/opera/android/custom_views/CircleImageView;->o:Landroid/graphics/Paint;

    new-instance p2, Landroid/graphics/Matrix;

    invoke-direct {p2}, Landroid/graphics/Matrix;-><init>()V

    iput-object p2, p0, Lcom/opera/android/custom_views/CircleImageView;->p:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 10

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    if-eqz v0, :cond_58

    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v2, 0x0

    if-eqz v1, :cond_12

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_56

    :cond_12
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v3

    iget-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    if-eqz v4, :cond_33

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    if-ne v4, v1, :cond_2c

    iget-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    if-eq v4, v3, :cond_33

    :cond_2c
    iget-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v2, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    :cond_33
    iget-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    const/4 v5, 0x0

    if-nez v4, :cond_44

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v3, v4}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v4

    iput-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    if-nez v4, :cond_47

    move-object v0, v2

    goto :goto_56

    :cond_44
    invoke-virtual {v4, v5}, Landroid/graphics/Bitmap;->eraseColor(I)V

    :cond_47
    new-instance v4, Landroid/graphics/Canvas;

    iget-object v6, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    invoke-direct {v4, v6}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v0, v5, v5, v1, v3}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v0, v4}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/CircleImageView;->q:Landroid/graphics/Bitmap;

    :goto_56
    if-nez v0, :cond_59

    :cond_58
    return-void

    :cond_59
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v1, v3}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget v3, p0, Lcom/opera/android/custom_views/CircleImageView;->k:I

    int-to-float v3, v3

    const/high16 v4, 0x40000000    # 2.0f

    mul-float/2addr v3, v4

    const/4 v5, 0x1

    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v3, v1

    iget-object v1, p0, Lcom/opera/android/custom_views/CircleImageView;->p:Landroid/graphics/Matrix;

    invoke-virtual {v1, v3, v3}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    mul-float/2addr v6, v3

    sub-float/2addr v5, v6

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-float v7, v7

    mul-float/2addr v7, v3

    sub-float/2addr v6, v7

    div-float/2addr v5, v4

    div-float/2addr v6, v4

    invoke-virtual {v1, v5, v6}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v3, p0, Lcom/opera/android/custom_views/CircleImageView;->r:Landroid/graphics/BitmapShader;

    if-eqz v3, :cond_a0

    iget-object v3, p0, Lcom/opera/android/custom_views/CircleImageView;->s:Landroid/graphics/Bitmap;

    if-eq v3, v0, :cond_a0

    iput-object v2, p0, Lcom/opera/android/custom_views/CircleImageView;->r:Landroid/graphics/BitmapShader;

    iput-object v2, p0, Lcom/opera/android/custom_views/CircleImageView;->s:Landroid/graphics/Bitmap;

    :cond_a0
    iget-object v2, p0, Lcom/opera/android/custom_views/CircleImageView;->r:Landroid/graphics/BitmapShader;

    if-nez v2, :cond_b1

    new-instance v2, Landroid/graphics/BitmapShader;

    sget-object v3, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    sget-object v4, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-direct {v2, v0, v3, v4}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v2, p0, Lcom/opera/android/custom_views/CircleImageView;->r:Landroid/graphics/BitmapShader;

    iput-object v0, p0, Lcom/opera/android/custom_views/CircleImageView;->s:Landroid/graphics/Bitmap;

    :cond_b1
    invoke-virtual {v2, v1}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v0, p0, Lcom/opera/android/custom_views/CircleImageView;->r:Landroid/graphics/BitmapShader;

    iget-object v1, p0, Lcom/opera/android/custom_views/CircleImageView;->o:Landroid/graphics/Paint;

    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    iget v0, p0, Lcom/opera/android/custom_views/CircleImageView;->l:I

    int-to-float v2, v0

    int-to-float v3, v0

    int-to-float v0, v0

    iget-object v4, p0, Lcom/opera/android/custom_views/CircleImageView;->n:Landroid/graphics/Paint;

    invoke-virtual {p1, v2, v3, v0, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    iget v0, p0, Lcom/opera/android/custom_views/CircleImageView;->k:I

    iget p0, p0, Lcom/opera/android/custom_views/CircleImageView;->m:I

    add-int v2, v0, p0

    int-to-float v2, v2

    add-int/2addr p0, v0

    int-to-float p0, p0

    int-to-float v0, v0

    invoke-virtual {p1, v2, p0, v0, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 6

    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result p2

    invoke-static {p1, p2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result p2

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {p2, v0, v1, v2}, [Ljava/lang/Integer;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-static {p2}, Ljava/util/Collections;->max(Ljava/util/Collection;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/Integer;

    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    move-result p2

    iput p2, p0, Lcom/opera/android/custom_views/CircleImageView;->m:I

    div-int/lit8 v0, p1, 0x2

    sub-int p2, v0, p2

    iput p2, p0, Lcom/opera/android/custom_views/CircleImageView;->k:I

    iput v0, p0, Lcom/opera/android/custom_views/CircleImageView;->l:I

    invoke-virtual {p0, p1, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    return-void
.end method

.method public final setBackgroundColor(I)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/CircleImageView;->n:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/custom_views/CircleImageView;->o:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method
