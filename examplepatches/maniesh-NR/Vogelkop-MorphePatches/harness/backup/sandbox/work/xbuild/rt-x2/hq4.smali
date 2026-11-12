.class public final Lhq4;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final a:Lf26;

.field public final b:Landroid/graphics/BitmapShader;

.field public final c:Landroid/graphics/Paint;

.field public final d:Landroid/graphics/Matrix;

.field public final synthetic e:B


# direct methods
.method public synthetic constructor <init>(FIILandroid/graphics/Bitmap;)V
    .registers 11

    const/4 v0, 0x1

    iput-byte v0, p0, Lhq4;->e:B

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_8

    const/4 p2, -0x1

    :cond_8
    move v2, p2

    const/high16 v3, 0x3f000000    # 0.5f

    const/high16 v4, 0x3f000000    # 0.5f

    move-object v0, p0

    move v5, p1

    move-object v1, p4

    .line 41
    invoke-direct/range {v0 .. v5}, Lhq4;-><init>(Landroid/graphics/Bitmap;IFFF)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;I)V
    .registers 5

    const/4 v0, 0x0

    iput-byte v0, p0, Lhq4;->e:B

    .line 38
    new-instance v0, Lgq4;

    const/high16 v1, 0x3f000000    # 0.5f

    .line 39
    invoke-direct {v0, p1, p2, v1, v1}, Lf26;-><init>(Landroid/graphics/Bitmap;IFF)V

    .line 40
    invoke-direct {p0, v0}, Lhq4;-><init>(Lf26;)V

    return-void
.end method

.method public constructor <init>(Landroid/graphics/Bitmap;IFFF)V
    .registers 13

    const/4 v0, 0x1

    iput-byte v0, p0, Lhq4;->e:B

    .line 42
    new-instance v1, Lg26;

    move-object v2, p1

    move v3, p2

    move v4, p3

    move v5, p4

    move v6, p5

    invoke-direct/range {v1 .. v6}, Lg26;-><init>(Landroid/graphics/Bitmap;IFFF)V

    .line 43
    invoke-direct {p0, v1}, Lhq4;-><init>(Lf26;)V

    return-void
.end method

.method public constructor <init>(Lf26;)V
    .registers 4

    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    iput-object p1, p0, Lhq4;->a:Lf26;

    new-instance v0, Landroid/graphics/BitmapShader;

    iget-object p1, p1, Lf26;->a:Landroid/graphics/Bitmap;

    sget-object v1, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    invoke-direct {v0, p1, v1, v1}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v0, p0, Lhq4;->b:Landroid/graphics/BitmapShader;

    new-instance p1, Landroid/graphics/Paint;

    const/4 v1, 0x1

    invoke-direct {p1, v1}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {p1, v1}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    iput-object p1, p0, Lhq4;->c:Landroid/graphics/Paint;

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lhq4;->d:Landroid/graphics/Matrix;

    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 10

    iget-object v0, p0, Lhq4;->a:Lf26;

    iget-object v1, v0, Lf26;->a:Landroid/graphics/Bitmap;

    iget v2, v0, Lf26;->c:F

    iget v3, v0, Lf26;->d:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    int-to-float v6, v6

    div-float/2addr v5, v6

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v6

    int-to-float v6, v6

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float/2addr v6, v7

    invoke-static {v5, v6}, Ljava/lang/Math;->max(FF)F

    move-result v5

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    neg-int v6, v6

    int-to-float v6, v6

    mul-float/2addr v6, v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    neg-int v1, v1

    int-to-float v1, v1

    mul-float/2addr v1, v3

    iget-object v7, p0, Lhq4;->d:Landroid/graphics/Matrix;

    invoke-virtual {v7, v6, v1}, Landroid/graphics/Matrix;->setTranslate(FF)V

    invoke-virtual {v7, v5, v5}, Landroid/graphics/Matrix;->postScale(FF)Z

    iget v1, v4, Landroid/graphics/Rect;->left:I

    int-to-float v1, v1

    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v5

    int-to-float v5, v5

    mul-float/2addr v5, v2

    add-float/2addr v5, v1

    iget v1, v4, Landroid/graphics/Rect;->top:I

    int-to-float v1, v1

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, v3

    add-float/2addr v2, v1

    invoke-virtual {v7, v5, v2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v1, p0, Lhq4;->b:Landroid/graphics/BitmapShader;

    invoke-virtual {v1, v7}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-byte v1, p0, Lhq4;->e:B

    iget-object p0, p0, Lhq4;->c:Landroid/graphics/Paint;

    packed-switch v1, :pswitch_data_88

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1, v4}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    check-cast v0, Lg26;

    iget v0, v0, Lg26;->e:F

    invoke-virtual {p1, v1, v0, v0, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    goto :goto_87

    :pswitch_6c
    invoke-virtual {v4}, Landroid/graphics/Rect;->width()I

    move-result v0

    invoke-virtual {v4}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v0

    int-to-float v0, v0

    const/high16 v1, 0x40000000    # 2.0f

    div-float/2addr v0, v1

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v2

    invoke-virtual {p1, v1, v2, v0, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    :goto_87
    return-void

    :pswitch_data_88
    .packed-switch 0x0
        :pswitch_6c
    .end packed-switch
.end method

.method public final getAlpha()I
    .registers 1

    iget-object p0, p0, Lhq4;->c:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    move-result p0

    return p0
.end method

.method public final getConstantState()Landroid/graphics/drawable/Drawable$ConstantState;
    .registers 1

    iget-object p0, p0, Lhq4;->a:Lf26;

    return-object p0
.end method

.method public final getIntrinsicHeight()I
    .registers 1

    iget-object p0, p0, Lhq4;->a:Lf26;

    iget p0, p0, Lf26;->b:I

    return p0
.end method

.method public final getIntrinsicWidth()I
    .registers 1

    iget-object p0, p0, Lhq4;->a:Lf26;

    iget p0, p0, Lf26;->b:I

    return p0
.end method

.method public final getOpacity()I
    .registers 1

    const/4 p0, -0x3

    return p0
.end method

.method public final getOutline(Landroid/graphics/Outline;)V
    .registers 3

    iget-byte v0, p0, Lhq4;->e:B

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v0

    iget-object p0, p0, Lhq4;->a:Lf26;

    check-cast p0, Lg26;

    iget p0, p0, Lg26;->e:F

    invoke-virtual {p1, v0, p0}, Landroid/graphics/Outline;->setRoundRect(Landroid/graphics/Rect;F)V

    return-void

    :pswitch_13
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/graphics/Outline;->setOval(Landroid/graphics/Rect;)V

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_13
    .end packed-switch
.end method

.method public final setAlpha(I)V
    .registers 4

    iget-object v0, p0, Lhq4;->c:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getAlpha()I

    move-result v1

    if-ne p1, v1, :cond_9

    return-void

    :cond_9
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 2

    iget-object p0, p0, Lhq4;->c:Landroid/graphics/Paint;

    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    return-void
.end method
