.class public final Lw05;
.super Landroid/graphics/drawable/Drawable;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:F

.field public c:F

.field public final d:Landroid/graphics/Paint;

.field public e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lw05;->a:B

    .line 255
    invoke-direct {p0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v1, -0x41000000    # -0.5f

    iput v1, p0, Lw05;->b:F

    .line 256
    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v1, p0, Lw05;->d:Landroid/graphics/Paint;

    .line 257
    new-instance v1, Lv05;

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    filled-new-array {v0}, [I

    move-result-object v4

    new-array v2, v2, [F

    const/4 v5, 0x0

    aput v5, v2, v0

    invoke-direct {v1, v3, v4, v2}, Lv05;-><init>(Landroid/graphics/Rect;[I[F)V

    iput-object v1, p0, Lw05;->e:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(FFFFF)V
    .registers 22

    move-object/from16 v0, p0

    move/from16 v1, p3

    move/from16 v2, p4

    move/from16 v3, p5

    const/4 v4, 0x1

    iput-byte v4, v0, Lw05;->a:B

    invoke-direct {v0}, Landroid/graphics/drawable/Drawable;-><init>()V

    const/high16 v5, 0x40000000    # 2.0f

    div-float v6, v1, v5

    add-float/2addr v6, v2

    add-float/2addr v6, v3

    iput v6, v0, Lw05;->b:F

    add-float v7, p1, p2

    iput v7, v0, Lw05;->c:F

    new-instance v8, Landroid/graphics/Paint;

    const/4 v9, 0x2

    invoke-direct {v8, v9}, Landroid/graphics/Paint;-><init>(I)V

    iput-object v8, v0, Lw05;->d:Landroid/graphics/Paint;

    new-instance v8, Landroid/graphics/Paint;

    invoke-direct {v8, v4}, Landroid/graphics/Paint;-><init>(I)V

    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v8, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/4 v4, -0x1

    invoke-virtual {v8, v4}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    const/high16 v1, -0x1000000

    const/high16 v4, 0x3e800000    # 0.25f

    invoke-static {v4, v1}, Lp37;->j0(FI)I

    move-result v1

    const/4 v4, 0x0

    invoke-virtual {v8, v2, v4, v3, v1}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    mul-float v1, v6, v5

    add-float/2addr v1, v7

    float-to-double v1, v1

    invoke-static {v1, v2}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v1

    double-to-float v1, v1

    float-to-int v1, v1

    add-float/2addr v7, v6

    new-instance v2, Landroid/graphics/Path;

    invoke-direct {v2}, Landroid/graphics/Path;-><init>()V

    add-float v3, v6, p1

    add-float v9, v3, p2

    invoke-virtual {v2, v6, v9}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v2, v6, v3}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v10, Landroid/graphics/RectF;

    mul-float v5, v5, p1

    add-float v11, v6, v5

    invoke-direct {v10, v6, v6, v11, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v12, 0x43340000    # 180.0f

    const/high16 v13, 0x42b40000    # 90.0f

    invoke-virtual {v2, v10, v12, v13}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    invoke-virtual {v2, v9, v6}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v10, Landroid/graphics/Path;

    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V

    sub-float v12, v7, p1

    sub-float v14, v12, p2

    invoke-virtual {v10, v14, v6}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v10, v12, v6}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v15, Landroid/graphics/RectF;

    sub-float v5, v7, v5

    invoke-direct {v15, v5, v6, v7, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/high16 v4, 0x43870000    # 270.0f

    invoke-virtual {v10, v15, v4, v13}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    invoke-virtual {v10, v7, v9}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v4, Landroid/graphics/Path;

    invoke-direct {v4}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v4, v7, v14}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v4, v7, v12}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v12, Landroid/graphics/RectF;

    invoke-direct {v12, v5, v5, v7, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    const/4 v15, 0x0

    invoke-virtual {v4, v12, v15, v13}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    invoke-virtual {v4, v14, v7}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v12, Landroid/graphics/Path;

    invoke-direct {v12}, Landroid/graphics/Path;-><init>()V

    invoke-virtual {v12, v9, v7}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v12, v3, v7}, Landroid/graphics/Path;->lineTo(FF)V

    new-instance v3, Landroid/graphics/RectF;

    invoke-direct {v3, v6, v5, v11, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    invoke-virtual {v12, v3, v13, v13}, Landroid/graphics/Path;->arcTo(Landroid/graphics/RectF;FF)V

    invoke-virtual {v12, v6, v14}, Landroid/graphics/Path;->lineTo(FF)V

    filled-new-array {v2, v10, v4, v12}, [Landroid/graphics/Path;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    check-cast v2, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v2, v4}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_da
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_fc

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/graphics/Path;

    sget-object v5, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v5}, Lz5i;->u(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v5

    if-eqz v5, :cond_f7

    new-instance v6, Landroid/graphics/Canvas;

    invoke-direct {v6, v5}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-virtual {v6, v4, v8}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    goto :goto_f8

    :cond_f7
    const/4 v5, 0x0

    :goto_f8
    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_da

    :cond_fc
    iput-object v3, v0, Lw05;->e:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final draw(Landroid/graphics/Canvas;)V
    .registers 14

    iget-byte v2, p0, Lw05;->a:B

    iget v3, p0, Lw05;->b:F

    packed-switch v2, :pswitch_data_e8

    iget v2, p0, Lw05;->c:F

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v4

    iget v4, v4, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v5

    iget v5, v5, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v6

    iget v6, v6, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getBounds()Landroid/graphics/Rect;

    move-result-object v7

    iget v7, v7, Landroid/graphics/Rect;->bottom:I

    int-to-float v7, v7

    iget-object v8, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v8, Ljava/util/ArrayList;

    const/4 v9, 0x0

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/Bitmap;

    iget-object v0, p0, Lw05;->d:Landroid/graphics/Paint;

    if-eqz v9, :cond_3b

    sub-float v10, v4, v3

    sub-float v11, v5, v3

    invoke-virtual {p1, v9, v10, v11, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_3b
    const/4 v9, 0x1

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Landroid/graphics/Bitmap;

    if-eqz v9, :cond_4b

    sub-float v10, v6, v3

    sub-float/2addr v10, v2

    sub-float/2addr v5, v3

    invoke-virtual {p1, v9, v10, v5, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_4b
    const/4 v5, 0x2

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    if-eqz v5, :cond_5c

    sub-float/2addr v6, v3

    sub-float/2addr v6, v2

    sub-float v9, v7, v3

    sub-float/2addr v9, v2

    invoke-virtual {p1, v5, v6, v9, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_5c
    const/4 v5, 0x3

    invoke-virtual {v8, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/graphics/Bitmap;

    if-eqz v5, :cond_6b

    sub-float/2addr v4, v3

    sub-float/2addr v7, v3

    sub-float/2addr v7, v2

    invoke-virtual {p1, v5, v4, v7, v0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_6b
    return-void

    :pswitch_6c
    iget-object v8, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {v8}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    move-result-object v2

    if-nez v2, :cond_b9

    new-instance v2, Landroid/graphics/SweepGradient;

    iget-object v4, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v4, Lv05;

    iget-object v4, v4, Lv05;->a:Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v4

    iget-object v5, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v5, Lv05;

    iget-object v5, v5, Lv05;->a:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v5

    iget-object v6, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v6, Lv05;

    iget-object v7, v6, Lv05;->b:[I

    iget-object v6, v6, Lv05;->c:[F

    invoke-direct {v2, v4, v5, v7, v6}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    new-instance v4, Landroid/graphics/Matrix;

    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    iget-object v5, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v5, Lv05;

    iget-object v5, v5, Lv05;->a:Landroid/graphics/Rect;

    invoke-virtual {v5}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v5

    iget-object v6, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v6, Lv05;

    iget-object v6, v6, Lv05;->a:Landroid/graphics/Rect;

    invoke-virtual {v6}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v6

    const/high16 v7, -0x3d4c0000    # -90.0f

    invoke-virtual {v4, v7, v5, v6}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    invoke-virtual {v2, v4}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_b9
    iget-object v2, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v2, Lv05;

    iget-object v2, v2, Lv05;->a:Landroid/graphics/Rect;

    iget v4, v2, Landroid/graphics/Rect;->left:I

    int-to-float v4, v4

    add-float/2addr v4, v3

    iget v5, v2, Landroid/graphics/Rect;->top:I

    int-to-float v5, v5

    add-float/2addr v5, v3

    iget v6, v2, Landroid/graphics/Rect;->right:I

    int-to-float v6, v6

    sub-float/2addr v6, v3

    iget v2, v2, Landroid/graphics/Rect;->bottom:I

    int-to-float v2, v2

    sub-float/2addr v2, v3

    iget v0, p0, Lw05;->c:F

    const/4 v3, 0x0

    const/high16 v7, 0x3f800000    # 1.0f

    invoke-static {v0, v3, v7}, Ldjh;->b(FFF)F

    move-result v0

    const/high16 v3, 0x43b40000    # 360.0f

    mul-float/2addr v0, v3

    const/4 v7, 0x1

    move v1, v4

    move v4, v2

    move v2, v5

    const/high16 v5, -0x3d4c0000    # -90.0f

    move v3, v6

    move v6, v0

    move-object v0, p1

    invoke-virtual/range {v0 .. v8}, Landroid/graphics/Canvas;->drawArc(FFFFFFZLandroid/graphics/Paint;)V

    return-void

    :pswitch_data_e8
    .packed-switch 0x0
        :pswitch_6c
    .end packed-switch
.end method

.method public final getAlpha()I
    .registers 2

    iget-byte v0, p0, Lw05;->a:B

    packed-switch v0, :pswitch_data_12

    invoke-super {p0}, Landroid/graphics/drawable/Drawable;->getAlpha()I

    move-result p0

    return p0

    :pswitch_a
    iget-object p0, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {p0}, Landroid/graphics/Paint;->getAlpha()I

    move-result p0

    return p0

    nop

    :pswitch_data_12
    .packed-switch 0x0
        :pswitch_a
    .end packed-switch
.end method

.method public final getOpacity()I
    .registers 1

    iget-byte p0, p0, Lw05;->a:B

    const/4 p0, -0x3

    return p0
.end method

.method public final onBoundsChange(Landroid/graphics/Rect;)V
    .registers 5

    iget-byte v0, p0, Lw05;->a:B

    packed-switch v0, :pswitch_data_2e

    invoke-super {p0, p1}, Landroid/graphics/drawable/Drawable;->onBoundsChange(Landroid/graphics/Rect;)V

    return-void

    :pswitch_9
    iget-object v0, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v0, Lv05;

    new-instance v1, Landroid/graphics/Rect;

    invoke-direct {v1, p1}, Landroid/graphics/Rect;-><init>(Landroid/graphics/Rect;)V

    const/4 p1, 0x6

    const/4 v2, 0x0

    invoke-static {v0, v1, v2, v2, p1}, Lv05;->a(Lv05;Landroid/graphics/Rect;[I[FI)Lv05;

    move-result-object p1

    iget-object v0, p0, Lw05;->e:Ljava/lang/Object;

    check-cast v0, Lv05;

    invoke-virtual {p1, v0}, Lv05;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2c

    iput-object p1, p0, Lw05;->e:Ljava/lang/Object;

    iget-object p1, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_2c
    return-void

    nop

    :pswitch_data_2e
    .packed-switch 0x0
        :pswitch_9
    .end packed-switch
.end method

.method public final setAlpha(I)V
    .registers 4

    iget-byte v0, p0, Lw05;->a:B

    iget-object v1, p0, Lw05;->d:Landroid/graphics/Paint;

    packed-switch v0, :pswitch_data_1c

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_e
    invoke-virtual {v1}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    if-eq p1, v0, :cond_1a

    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    :cond_1a
    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method

.method public final setColorFilter(Landroid/graphics/ColorFilter;)V
    .registers 3

    iget-byte v0, p0, Lw05;->a:B

    packed-switch v0, :pswitch_data_18

    iget-object v0, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    :pswitch_e
    iget-object v0, p0, Lw05;->d:Landroid/graphics/Paint;

    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColorFilter(Landroid/graphics/ColorFilter;)Landroid/graphics/ColorFilter;

    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->invalidateSelf()V

    return-void

    nop

    :pswitch_data_18
    .packed-switch 0x0
        :pswitch_e
    .end packed-switch
.end method
