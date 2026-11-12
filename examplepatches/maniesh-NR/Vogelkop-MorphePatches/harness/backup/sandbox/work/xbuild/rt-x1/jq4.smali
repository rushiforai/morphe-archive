.class public final Ljq4;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:I

.field public final b:Landroid/graphics/Paint;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Bitmap;

.field public final e:Landroid/graphics/BitmapShader;

.field public final f:Landroid/graphics/Matrix;

.field public final g:F

.field public final h:B


# direct methods
.method public constructor <init>(FIILandroid/graphics/Bitmap;)V
    .registers 9

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    new-instance v0, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v0, p0, Ljq4;->b:Landroid/graphics/Paint;

    new-instance v2, Landroid/graphics/Paint;

    invoke-direct {v2, v1}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v2, p0, Ljq4;->c:Landroid/graphics/Paint;

    new-instance v3, Landroid/graphics/Matrix;

    invoke-direct {v3}, Landroid/graphics/Matrix;-><init>()V

    iput-object v3, p0, Ljq4;->f:Landroid/graphics/Matrix;

    iput p2, p0, Ljq4;->a:I

    iput p1, p0, Ljq4;->g:F

    const/4 p1, 0x2

    iput-byte p1, p0, Ljq4;->h:B

    iput-object p4, p0, Ljq4;->d:Landroid/graphics/Bitmap;

    if-eqz p4, :cond_2c

    new-instance p1, Landroid/graphics/BitmapShader;

    sget-object p2, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {p1, p4, p2, p2}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    goto :goto_2d

    :cond_2c
    const/4 p1, 0x0

    :goto_2d
    iput-object p1, p0, Ljq4;->e:Landroid/graphics/BitmapShader;

    invoke-virtual {v2, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {v0, p3}, Landroid/graphics/Paint;->setColor(I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V
    .registers 22

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    iget-byte v2, v0, Ljq4;->h:B

    if-eqz v2, :cond_40

    const/4 v3, 0x1

    if-eq v2, v3, :cond_26

    const/4 v3, 0x2

    if-eq v2, v3, :cond_f

    return-void

    :cond_f
    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v4, v2

    iget v2, v1, Landroid/graphics/Rect;->top:I

    int-to-float v5, v2

    iget v2, v1, Landroid/graphics/Rect;->right:I

    int-to-float v6, v2

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v1

    iget v8, v0, Ljq4;->g:F

    move v9, v8

    move-object/from16 v3, p1

    move-object/from16 v10, p3

    invoke-virtual/range {v3 .. v10}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void

    :cond_26
    iget v2, v1, Landroid/graphics/Rect;->left:I

    int-to-float v11, v2

    iget v2, v1, Landroid/graphics/Rect;->top:I

    int-to-float v12, v2

    iget v2, v1, Landroid/graphics/Rect;->right:I

    int-to-float v13, v2

    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v1, v1

    iget v15, v0, Ljq4;->g:F

    add-float v14, v1, v15

    move/from16 v16, v15

    move-object/from16 v10, p1

    move-object/from16 v17, p3

    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void

    :cond_40
    iget v2, v1, Landroid/graphics/Rect;->left:I

    iget v3, v1, Landroid/graphics/Rect;->right:I

    iget v4, v0, Ljq4;->a:I

    iget v15, v0, Ljq4;->g:F

    if-nez v4, :cond_4e

    int-to-float v0, v2

    sub-float/2addr v0, v15

    float-to-int v2, v0

    goto :goto_51

    :cond_4e
    int-to-float v0, v3

    add-float/2addr v0, v15

    float-to-int v3, v0

    :goto_51
    int-to-float v11, v2

    iget v0, v1, Landroid/graphics/Rect;->top:I

    int-to-float v12, v0

    int-to-float v13, v3

    iget v0, v1, Landroid/graphics/Rect;->bottom:I

    int-to-float v14, v0

    move/from16 v16, v15

    move-object/from16 v10, p1

    move-object/from16 v17, p3

    invoke-virtual/range {v10 .. v17}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final draw(Landroid/graphics/Canvas;)V
    .registers 8

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    iget v1, v0, Landroid/graphics/Rect;->left:I

    iget v2, v0, Landroid/graphics/Rect;->top:I

    iget v3, v0, Landroid/graphics/Rect;->right:I

    iget v4, v0, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {p1, v1, v2, v3, v4}, Landroid/graphics/Canvas;->clipRect(IIII)Z

    iget-object v1, p0, Ljq4;->b:Landroid/graphics/Paint;

    invoke-virtual {p0, p1, v0, v1}, Ljq4;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    iget-object v1, p0, Ljq4;->d:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_66

    iget-object v2, p0, Ljq4;->e:Landroid/graphics/BitmapShader;

    if-eqz v2, :cond_66

    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    int-to-float v4, v4

    div-float/2addr v3, v4

    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v4, v5

    invoke-static {v3, v4}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    neg-int v4, v4

    int-to-float v4, v4

    const/high16 v5, 0x40000000    # 2.0f

    div-float/2addr v4, v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    div-float/2addr v1, v5

    iget-object v5, p0, Ljq4;->f:Landroid/graphics/Matrix;

    invoke-virtual {v5, v4, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v5, v3, v3}, Landroid/graphics/Matrix;->postScale(FF)Z

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerY()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual {v5, v1, v3}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    invoke-virtual {v2, v5}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v1, p0, Ljq4;->c:Landroid/graphics/Paint;

    invoke-virtual {p0, p1, v0, v1}, Ljq4;->a(Landroid/graphics/Canvas;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    :cond_66
    invoke-virtual {p1}, Landroid/graphics/Canvas;->restore()V

    return-void
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final setAlpha(I)V
    .registers 2

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    return-void
.end method
