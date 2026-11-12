.class public Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;
.super Landroidx/appcompat/widget/AppCompatImageView;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/RectF;

.field public final b:Landroid/graphics/Matrix;

.field public final c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public final e:Z

.field public final f:Landroid/graphics/drawable/shapes/RoundRectShape;

.field public final g:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    const/4 v2, 0x0

    move-object/from16 v3, p1

    invoke-direct {v0, v3, v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3}, Landroid/graphics/RectF;-><init>()V

    iput-object v3, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a:Landroid/graphics/RectF;

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    iput-object v3, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->b:Landroid/graphics/Matrix;

    new-instance v3, Landroid/graphics/Paint;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v3, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->c:Landroid/graphics/Paint;

    iput v2, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->g:I

    iput-boolean v4, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->e:Z

    const/4 v5, 0x6

    const/4 v6, 0x2

    const/4 v7, 0x3

    const/4 v8, 0x4

    if-eqz v1, :cond_4c

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    sget-object v10, Lphh;->f:[I

    invoke-virtual {v9, v1, v10, v2, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    move-result-object v1

    invoke-virtual {v1, v8, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v9

    invoke-virtual {v1, v7, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v10

    invoke-virtual {v1, v6, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v11

    invoke-virtual {v1, v4, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    move-result v12

    invoke-virtual {v1, v5, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    move-result v13

    invoke-virtual {v1}, Landroid/content/res/TypedArray;->recycle()V

    goto :goto_51

    :cond_4c
    move v9, v2

    move v10, v9

    move v11, v10

    move v12, v11

    move v13, v12

    :goto_51
    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutDirection()I

    move-result v1

    const/4 v14, 0x7

    const/4 v15, 0x5

    move/from16 v16, v2

    const/16 v2, 0x8

    if-nez v1, :cond_76

    new-array v1, v2, [F

    int-to-float v2, v9

    aput v2, v1, v16

    aput v2, v1, v4

    int-to-float v2, v10

    aput v2, v1, v6

    aput v2, v1, v7

    int-to-float v2, v12

    aput v2, v1, v8

    aput v2, v1, v15

    int-to-float v2, v11

    aput v2, v1, v5

    aput v2, v1, v14

    goto :goto_8c

    :cond_76
    new-array v1, v2, [F

    int-to-float v2, v10

    aput v2, v1, v16

    aput v2, v1, v4

    int-to-float v2, v9

    aput v2, v1, v6

    aput v2, v1, v7

    int-to-float v2, v11

    aput v2, v1, v8

    aput v2, v1, v15

    int-to-float v2, v12

    aput v2, v1, v5

    aput v2, v1, v14

    :goto_8c
    new-instance v2, Landroid/graphics/drawable/shapes/RoundRectShape;

    const/4 v4, 0x0

    invoke-direct {v2, v1, v4, v4}, Landroid/graphics/drawable/shapes/RoundRectShape;-><init>([FLandroid/graphics/RectF;[F)V

    iput-object v2, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->f:Landroid/graphics/drawable/shapes/RoundRectShape;

    iput v13, v0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->g:I

    invoke-virtual {v3, v13}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    invoke-virtual {v0}, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a()V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 6

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    iget-boolean v1, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->e:Z

    if-nez v1, :cond_9

    return-void

    :cond_9
    instance-of v1, v0, Landroid/graphics/drawable/ColorDrawable;

    const/4 v2, 0x0

    iget-object v3, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->c:Landroid/graphics/Paint;

    if-eqz v1, :cond_20

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    check-cast v0, Landroid/graphics/drawable/ColorDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/ColorDrawable;->getColor()I

    move-result v0

    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v2, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    return-void

    :cond_20
    instance-of v1, v0, Landroid/graphics/drawable/BitmapDrawable;

    iget v4, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->g:I

    if-eqz v1, :cond_4a

    check-cast v0, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_4a

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v0

    iget-object p0, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, v0, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void

    :cond_4a
    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->setColor(I)V

    iput-object v2, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    return-void
.end method

.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 11

    iget-object v0, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->c:Landroid/graphics/Paint;

    iget-object v1, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a:Landroid/graphics/RectF;

    iget-object v2, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->b:Landroid/graphics/Matrix;

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v3

    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    sub-int/2addr v3, v4

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    sub-int/2addr v4, v5

    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    move-result v5

    sub-int/2addr v4, v5

    if-lez v3, :cond_b0

    if-lez v4, :cond_b0

    int-to-float v3, v3

    int-to-float v4, v4

    iget-object v5, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->f:Landroid/graphics/drawable/shapes/RoundRectShape;

    invoke-virtual {v5, v3, v4}, Landroid/graphics/drawable/shapes/Shape;->resize(FF)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v3

    :try_start_31
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {p1, v4, v6}, Landroid/graphics/Canvas;->translate(FF)V

    invoke-virtual {v0}, Landroid/graphics/Paint;->getColor()I

    move-result v4

    if-eqz v4, :cond_4f

    invoke-virtual {v5, p1, v0}, Landroid/graphics/drawable/shapes/Shape;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    instance-of v0, v0, Landroid/graphics/drawable/ColorDrawable;

    if-nez v0, :cond_a7

    :cond_4f
    iget-object v0, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    if-nez v0, :cond_5a

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    goto :goto_a7

    :cond_5a
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v0

    if-eqz v0, :cond_a2

    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v4

    move-object v6, v4

    check-cast v6, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v6}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v6

    invoke-virtual {p0}, Landroid/widget/ImageView;->getImageMatrix()Landroid/graphics/Matrix;

    move-result-object v7

    invoke-virtual {v2, v7}, Landroid/graphics/Matrix;->set(Landroid/graphics/Matrix;)V

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v7, v8

    invoke-virtual {v4}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    int-to-float v8, v8

    div-float/2addr v4, v8

    invoke-virtual {v2, v7, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    invoke-virtual {v0, v2}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-float v0, v0

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    const/4 v6, 0x0

    invoke-virtual {v1, v6, v6, v0, v4}, Landroid/graphics/RectF;->set(FFFF)V

    invoke-virtual {v2, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    invoke-virtual {p1, v1}, Landroid/graphics/Canvas;->clipRect(Landroid/graphics/RectF;)Z

    :cond_a2
    iget-object p0, p0, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->d:Landroid/graphics/Paint;

    invoke-virtual {v5, p1, p0}, Landroid/graphics/drawable/shapes/Shape;->draw(Landroid/graphics/Canvas;Landroid/graphics/Paint;)V
    :try_end_a7
    .catchall {:try_start_31 .. :try_end_a7} :catchall_ab

    :cond_a7
    :goto_a7
    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void

    :catchall_ab
    move-exception p0

    invoke-virtual {p1, v3}, Landroid/graphics/Canvas;->restoreToCount(I)V

    throw p0

    :cond_b0
    return-void
.end method

.method public final setImageBitmap(Landroid/graphics/Bitmap;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageBitmap(Landroid/graphics/Bitmap;)V

    invoke-virtual {p0}, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a()V

    return-void
.end method

.method public final setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {p0}, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a()V

    return-void
.end method

.method public final setImageResource(I)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    invoke-virtual {p0}, Lorg/chromium/components/browser_ui/widget/RoundedCornerImageView;->a()V

    return-void
.end method
