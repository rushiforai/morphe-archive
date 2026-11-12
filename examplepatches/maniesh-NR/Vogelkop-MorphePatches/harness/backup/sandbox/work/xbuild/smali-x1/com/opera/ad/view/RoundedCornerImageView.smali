.class public Lcom/opera/ad/view/RoundedCornerImageView;
.super Lcom/opera/ad/view/RestrainImageView;
.source "SourceFile"


# instance fields
.field public b:I

.field public final c:Landroid/graphics/Matrix;

.field public final d:Z

.field public final e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Bitmap;

.field public g:Landroid/graphics/BitmapShader;

.field public h:Landroid/graphics/Bitmap;

.field public i:Landroid/graphics/RectF;

.field public j:F


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .registers 6

    const/4 v0, 0x0

    invoke-direct {p0, p1, p2, v0}, Lcom/opera/ad/view/RestrainImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    new-instance v1, Landroid/graphics/Matrix;

    invoke-direct {v1}, Landroid/graphics/Matrix;-><init>()V

    iput-object v1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->c:Landroid/graphics/Matrix;

    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->e:Landroid/graphics/Paint;

    sget-object v1, Ljhh;->b:[I

    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    move-result-object p1

    const/4 p2, 0x5

    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    move-result p2

    iput-boolean p2, p0, Lcom/opera/ad/view/RoundedCornerImageView;->d:Z

    const/high16 v1, -0x40800000    # -1.0f

    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    move-result v0

    iput v0, p0, Lcom/opera/ad/view/RoundedCornerImageView;->j:F

    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    if-eqz p2, :cond_31

    const/high16 p1, 0x3f800000    # 1.0f

    iput p1, p0, Lcom/opera/ad/view/RestrainImageView;->a:F

    :cond_31
    return-void
.end method


# virtual methods
.method public final onDraw(Landroid/graphics/Canvas;)V
    .registers 12

    const/4 v0, 0x0

    iget-boolean v1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->d:Z

    if-nez v1, :cond_f

    iget v2, p0, Lcom/opera/ad/view/RoundedCornerImageView;->j:F

    cmpg-float v2, v2, v0

    if-gtz v2, :cond_f

    invoke-super {p0, p1}, Landroid/widget/ImageView;->onDraw(Landroid/graphics/Canvas;)V

    return-void

    :cond_f
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    move-result-object v2

    if-eqz v2, :cond_64

    instance-of v3, v2, Landroid/graphics/drawable/BitmapDrawable;

    const/4 v4, 0x0

    if-eqz v3, :cond_21

    check-cast v2, Landroid/graphics/drawable/BitmapDrawable;

    invoke-virtual {v2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    move-result-object v2

    goto :goto_62

    :cond_21
    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    move-result v5

    iget-object v6, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    if-eqz v6, :cond_42

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v6

    if-ne v6, v3, :cond_3b

    iget-object v6, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v6

    if-eq v6, v5, :cond_42

    :cond_3b
    iget-object v6, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    invoke-virtual {v6}, Landroid/graphics/Bitmap;->recycle()V

    iput-object v4, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    :cond_42
    iget-object v6, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    if-nez v6, :cond_52

    sget-object v6, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    invoke-static {v3, v5, v6}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v6

    iput-object v6, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    if-nez v6, :cond_52

    move-object v2, v4

    goto :goto_62

    :cond_52
    new-instance v6, Landroid/graphics/Canvas;

    iget-object v7, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    invoke-direct {v6, v7}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    const/4 v7, 0x0

    invoke-virtual {v2, v7, v7, v3, v5}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    invoke-virtual {v2, v6}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    iget-object v2, p0, Lcom/opera/ad/view/RoundedCornerImageView;->f:Landroid/graphics/Bitmap;

    :goto_62
    if-nez v2, :cond_65

    :cond_64
    return-void

    :cond_65
    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    move-result v3

    iget v5, p0, Lcom/opera/ad/view/RoundedCornerImageView;->b:I

    int-to-float v5, v5

    const/high16 v6, 0x40000000    # 2.0f

    mul-float/2addr v5, v6

    const/4 v7, 0x1

    invoke-static {v3, v7}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    div-float/2addr v5, v3

    iget-object v3, p0, Lcom/opera/ad/view/RoundedCornerImageView;->c:Landroid/graphics/Matrix;

    invoke-virtual {v3, v5, v5}, Landroid/graphics/Matrix;->setScale(FF)V

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    move-result v7

    int-to-float v7, v7

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    int-to-float v8, v8

    mul-float/2addr v8, v5

    sub-float/2addr v7, v8

    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v8

    int-to-float v8, v8

    invoke-virtual {v2}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-float v9, v9

    mul-float/2addr v9, v5

    sub-float/2addr v8, v9

    div-float/2addr v7, v6

    div-float/2addr v8, v6

    invoke-virtual {v3, v7, v8}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    iget-object v5, p0, Lcom/opera/ad/view/RoundedCornerImageView;->g:Landroid/graphics/BitmapShader;

    if-eqz v5, :cond_ac

    iget-object v5, p0, Lcom/opera/ad/view/RoundedCornerImageView;->h:Landroid/graphics/Bitmap;

    if-eq v5, v2, :cond_ac

    iput-object v4, p0, Lcom/opera/ad/view/RoundedCornerImageView;->g:Landroid/graphics/BitmapShader;

    iput-object v4, p0, Lcom/opera/ad/view/RoundedCornerImageView;->h:Landroid/graphics/Bitmap;

    :cond_ac
    iget-object v4, p0, Lcom/opera/ad/view/RoundedCornerImageView;->g:Landroid/graphics/BitmapShader;

    if-nez v4, :cond_bd

    new-instance v4, Landroid/graphics/BitmapShader;

    sget-object v5, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    sget-object v6, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    invoke-direct {v4, v2, v5, v6}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    iput-object v4, p0, Lcom/opera/ad/view/RoundedCornerImageView;->g:Landroid/graphics/BitmapShader;

    iput-object v2, p0, Lcom/opera/ad/view/RoundedCornerImageView;->h:Landroid/graphics/Bitmap;

    :cond_bd
    invoke-virtual {v4, v3}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    iget-object v2, p0, Lcom/opera/ad/view/RoundedCornerImageView;->g:Landroid/graphics/BitmapShader;

    iget-object v3, p0, Lcom/opera/ad/view/RoundedCornerImageView;->e:Landroid/graphics/Paint;

    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    if-eqz v1, :cond_d0

    iget p0, p0, Lcom/opera/ad/view/RoundedCornerImageView;->b:I

    int-to-float p0, p0

    invoke-virtual {p1, p0, p0, p0, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    return-void

    :cond_d0
    iget-object v1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->i:Landroid/graphics/RectF;

    if-nez v1, :cond_db

    new-instance v1, Landroid/graphics/RectF;

    invoke-direct {v1}, Landroid/graphics/RectF;-><init>()V

    iput-object v1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->i:Landroid/graphics/RectF;

    :cond_db
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result v2

    int-to-float v2, v2

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual {v1, v0, v0, v2, v4}, Landroid/graphics/RectF;->set(FFFF)V

    iget-object v0, p0, Lcom/opera/ad/view/RoundedCornerImageView;->i:Landroid/graphics/RectF;

    iget p0, p0, Lcom/opera/ad/view/RoundedCornerImageView;->j:F

    invoke-virtual {p1, v0, p0, p0, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    return-void
.end method

.method public final onMeasure(II)V
    .registers 3

    invoke-super {p0, p1, p2}, Lcom/opera/ad/view/RestrainImageView;->onMeasure(II)V

    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    move-result p1

    div-int/lit8 p1, p1, 0x2

    iput p1, p0, Lcom/opera/ad/view/RoundedCornerImageView;->b:I

    return-void
.end method
