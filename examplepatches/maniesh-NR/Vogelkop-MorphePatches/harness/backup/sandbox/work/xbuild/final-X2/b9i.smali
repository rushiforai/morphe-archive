.class public final Lb9i;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Bitmap;

.field public final c:Landroid/graphics/BitmapShader;

.field public final d:Landroid/graphics/Matrix;

.field public e:Landroid/graphics/Path;

.field public final synthetic f:Lcom/opera/android/widget/RoundedImageView;


# direct methods
.method public constructor <init>(Lcom/opera/android/widget/RoundedImageView;Landroid/graphics/Bitmap;)V
    .registers 6

    iput-object p1, p0, Lb9i;->f:Lcom/opera/android/widget/RoundedImageView;

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Lb9i;->a:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lb9i;->d:Landroid/graphics/Matrix;

    iput-object p2, p0, Lb9i;->b:Landroid/graphics/Bitmap;

    new-instance v1, Landroid/graphics/BitmapShader;

    sget-object v2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v1, p2, v2, v2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v1, p0, Lb9i;->c:Landroid/graphics/BitmapShader;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 22

    move-object/from16 v0, p0

    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v1

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    int-to-float v2, v2

    iget-object v3, v0, Lb9i;->b:Landroid/graphics/Bitmap;

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v2, v4

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v2, v4}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    neg-int v3, v3

    int-to-float v3, v3

    div-float/2addr v3, v5

    iget-object v5, v0, Lb9i;->d:Landroid/graphics/Matrix;

    invoke-virtual {v5, v4, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v5, v2, v2}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerX()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v5, v2, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v2, v0, Lb9i;->c:Landroid/graphics/BitmapShader;

    invoke-virtual {v2, v5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v2, v0, Lb9i;->f:Lcom/opera/android/widget/RoundedImageView;

    iget v3, v2, Lcom/opera/android/widget/RoundedImageView;->k:I

    iget v4, v2, Lcom/opera/android/widget/RoundedImageView;->l:I

    iget-object v12, v0, Lb9i;->a:Landroid/graphics/Paint;

    if-ne v3, v4, :cond_6a

    iget v0, v1, Landroid/graphics/Rect;->left:I

    int-to-float v6, v0

    iget v0, v1, Landroid/graphics/Rect;->top:I

    int-to-float v7, v0

    iget v0, v1, Landroid/graphics/Rect;->right:I

    int-to-float v8, v0

    iget v0, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v9, v0

    int-to-float v10, v3

    move v11, v10

    move-object/from16 v5, p1

    invoke-virtual/range {v5 .. v12}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void

    :cond_6a
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->getLayoutDirection()I

    move-result v3

    const/4 v4, 0x1

    if-ne v3, v4, :cond_78

    iget v3, v2, Lcom/opera/android/widget/RoundedImageView;->l:I

    int-to-float v3, v3

    iget v2, v2, Lcom/opera/android/widget/RoundedImageView;->k:I

    :goto_76
    int-to-float v2, v2

    goto :goto_7e

    :cond_78
    iget v3, v2, Lcom/opera/android/widget/RoundedImageView;->k:I

    int-to-float v3, v3

    iget v2, v2, Lcom/opera/android/widget/RoundedImageView;->l:I

    goto :goto_76

    :goto_7e
    iget-object v4, v0, Lb9i;->e:Landroid/graphics/Path;

    if-nez v4, :cond_89

    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    iput-object v4, v0, Lb9i;->e:Landroid/graphics/Path;

    :cond_89
    invoke-virtual {v4}, Landroid/graphics/Path;->rewind()V

    iget-object v4, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v5, v1, Landroid/graphics/Rect;->right:I

    int-to-float v5, v5

    iget v6, v1, Landroid/graphics/Rect;->top:I

    int-to-float v6, v6

    add-float/2addr v6, v2

    invoke-virtual {v4, v5, v6}, Landroid/graphics/Path;->moveTo(FF)V

    iget-object v13, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v4, v1, Landroid/graphics/Rect;->right:I

    int-to-float v14, v4

    iget v4, v1, Landroid/graphics/Rect;->top:I

    int-to-float v4, v4

    add-float v5, v4, v2

    sget v6, Lcom/opera/android/widget/RoundedImageView;->n:I

    const v6, 0x3f0d6289

    mul-float v7, v2, v6

    sub-float v15, v5, v7

    sub-float v18, v14, v2

    add-float v16, v18, v7

    move/from16 v19, v4

    move/from16 v17, v4

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v4, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v5, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    add-float/2addr v5, v3

    iget v8, v1, Landroid/graphics/Rect;->top:I

    int-to-float v8, v8

    invoke-virtual {v4, v5, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v13, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v4, v1, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    add-float v5, v4, v3

    mul-float/2addr v6, v3

    sub-float v14, v5, v6

    iget v5, v1, Landroid/graphics/Rect;->top:I

    int-to-float v15, v5

    add-float v19, v15, v3

    sub-float v17, v19, v6

    move/from16 v18, v4

    move/from16 v16, v4

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v4, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v5, v1, Landroid/graphics/Rect;->left:I

    int-to-float v5, v5

    iget v8, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v8, v8

    sub-float/2addr v8, v3

    invoke-virtual {v4, v5, v8}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v13, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v4, v1, Landroid/graphics/Rect;->left:I

    int-to-float v14, v4

    iget v4, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v4, v4

    sub-float v5, v4, v3

    add-float v15, v5, v6

    add-float v18, v14, v3

    sub-float v16, v18, v6

    move/from16 v19, v4

    move/from16 v17, v4

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v3, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v4, v1, Landroid/graphics/Rect;->right:I

    int-to-float v4, v4

    sub-float/2addr v4, v2

    iget v5, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v5, v5

    invoke-virtual {v3, v4, v5}, Landroid/graphics/Path;->lineTo(FF)V

    iget-object v13, v0, Lb9i;->e:Landroid/graphics/Path;

    iget v3, v1, Landroid/graphics/Rect;->right:I

    int-to-float v3, v3

    sub-float v4, v3, v2

    add-float v14, v4, v7

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v15, v1

    sub-float v19, v15, v2

    add-float v17, v19, v7

    move/from16 v18, v3

    move/from16 v16, v3

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    iget-object v1, v0, Lb9i;->e:Landroid/graphics/Path;

    invoke-virtual {v1}, Landroid/graphics/Path;->close()V

    iget-object v0, v0, Lb9i;->e:Landroid/graphics/Path;

    move-object/from16 v5, p1

    invoke-virtual {v5, v0, v12}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    iget-object p0, p0, Lb9i;->a:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-object p0, p0, Lb9i;->a:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
