.class public final Lc69;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Le2m;


# instance fields
.field public final synthetic a:B

.field public final b:I

.field public final c:I


# direct methods
.method public synthetic constructor <init>(IIB)V
    .registers 4

    iput-byte p3, p0, Lc69;->a:B

    iput p1, p0, Lc69;->b:I

    iput p2, p0, Lc69;->c:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lc69;->a:B

    iget v3, v0, Lc69;->b:I

    iget v0, v0, Lc69;->c:I

    const/4 v4, 0x1

    packed-switch v2, :pswitch_data_234

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    if-ne v2, v3, :cond_1d

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-ne v2, v0, :cond_1d

    move-object v0, v1

    goto/16 :goto_1f2

    :cond_1d
    int-to-float v2, v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float v5, v2, v5

    int-to-float v6, v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-float v7, v7

    div-float v7, v6, v7

    cmpg-float v8, v5, v7

    const/4 v9, 0x0

    const/4 v12, 0x0

    if-gez v8, :cond_f6

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v8

    div-int/lit8 v8, v8, 0x4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    div-int/lit8 v13, v13, 0x2

    sub-int/2addr v13, v8

    invoke-virtual {v1, v13, v12}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    add-int/2addr v14, v8

    invoke-virtual {v1, v14, v12}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v14

    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v15

    div-int/lit8 v15, v15, 0x2

    sub-int/2addr v15, v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v16

    const-wide/high16 v17, 0x4030000000000000L    # 16.0

    add-int/lit8 v10, v16, -0x1

    invoke-virtual {v1, v15, v10}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    add-int/2addr v11, v8

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    sub-int/2addr v8, v4

    invoke-virtual {v1, v11, v8}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v13, v14, v10, v4}, [Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Ljava/lang/Iterable;

    instance-of v10, v8, Ljava/util/Collection;

    if-eqz v10, :cond_9a

    move-object v10, v8

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_ee

    :cond_9a
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_9e
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_ee

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    invoke-static {v10}, Landroid/graphics/Color;->red(I)I

    move-result v13

    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    move-result v14

    sub-int/2addr v13, v14

    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    move-result v14

    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    move-result v15

    sub-int/2addr v14, v15

    invoke-static {v10}, Landroid/graphics/Color;->blue(I)I

    move-result v15

    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    move-result v16

    sub-int v15, v15, v16

    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    move-result v10

    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    move-result v11

    sub-int/2addr v10, v11

    mul-int/2addr v13, v13

    mul-int/2addr v14, v14

    add-int/2addr v14, v13

    mul-int/2addr v15, v15

    add-int/2addr v15, v14

    mul-int/2addr v10, v10

    add-int/2addr v10, v15

    int-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    cmpg-double v10, v10, v17

    if-gez v10, :cond_1af

    goto :goto_9e

    :cond_ee
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    goto/16 :goto_1b7

    :cond_f6
    const-wide/high16 v17, 0x4030000000000000L    # 16.0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v8

    div-int/lit8 v8, v8, 0x4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v10

    div-int/lit8 v10, v10, 0x2

    sub-int/2addr v10, v8

    invoke-virtual {v1, v12, v10}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v10

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v11

    div-int/lit8 v11, v11, 0x2

    add-int/2addr v11, v8

    invoke-virtual {v1, v12, v11}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v11

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v13

    sub-int/2addr v13, v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v14

    div-int/lit8 v14, v14, 0x2

    sub-int/2addr v14, v8

    invoke-virtual {v1, v13, v14}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v13

    invoke-static {v13}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v13

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v14

    sub-int/2addr v14, v4

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    div-int/lit8 v4, v4, 0x2

    add-int/2addr v4, v8

    invoke-virtual {v1, v14, v4}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    filled-new-array {v10, v11, v13, v4}, [Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Ljava/lang/Iterable;

    instance-of v10, v8, Ljava/util/Collection;

    if-eqz v10, :cond_15c

    move-object v10, v8

    check-cast v10, Ljava/util/Collection;

    invoke-interface {v10}, Ljava/util/Collection;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_1b1

    :cond_15c
    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :cond_160
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1b1

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/lang/Number;

    invoke-virtual {v10}, Ljava/lang/Number;->intValue()I

    move-result v10

    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/lang/Number;

    invoke-virtual {v11}, Ljava/lang/Number;->intValue()I

    move-result v11

    invoke-static {v10}, Landroid/graphics/Color;->red(I)I

    move-result v13

    invoke-static {v11}, Landroid/graphics/Color;->red(I)I

    move-result v14

    sub-int/2addr v13, v14

    invoke-static {v10}, Landroid/graphics/Color;->green(I)I

    move-result v14

    invoke-static {v11}, Landroid/graphics/Color;->green(I)I

    move-result v15

    sub-int/2addr v14, v15

    invoke-static {v10}, Landroid/graphics/Color;->blue(I)I

    move-result v15

    invoke-static {v11}, Landroid/graphics/Color;->blue(I)I

    move-result v16

    sub-int v15, v15, v16

    invoke-static {v10}, Landroid/graphics/Color;->alpha(I)I

    move-result v10

    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    move-result v11

    sub-int/2addr v10, v11

    mul-int/2addr v13, v13

    mul-int/2addr v14, v14

    add-int/2addr v14, v13

    mul-int/2addr v15, v15

    add-int/2addr v15, v14

    mul-int/2addr v10, v10

    add-int/2addr v10, v15

    int-to-double v10, v10

    invoke-static {v10, v11}, Ljava/lang/Math;->sqrt(D)D

    move-result-wide v10

    cmpg-double v10, v10, v17

    if-ltz v10, :cond_160

    :cond_1af
    move-object v4, v9

    goto :goto_1b7

    :cond_1b1
    invoke-static {v4}, Lkotlin/collections/CollectionsKt;->K(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/Integer;

    :goto_1b7
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->hasAlpha()Z

    move-result v8

    if-eqz v8, :cond_1ce

    invoke-virtual {v1, v12, v12}, Landroid/graphics/Bitmap;->getPixel(II)I

    move-result v8

    invoke-static {v8}, Landroid/graphics/Color;->alpha(I)I

    move-result v8

    const/16 v10, 0x80

    if-ge v8, v10, :cond_1ce

    const/4 v4, -0x1

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    :cond_1ce
    if-eqz v4, :cond_1ea

    invoke-static {v5, v7}, Ljava/lang/Math;->min(FF)F

    move-result v5

    const/high16 v7, 0x3f800000    # 1.0f

    cmpg-float v8, v5, v7

    if-lez v8, :cond_1e5

    div-float/2addr v2, v5

    invoke-static {v2}, Lzed;->b(F)I

    move-result v3

    div-float/2addr v6, v5

    invoke-static {v6}, Lzed;->b(F)I

    move-result v0

    move v5, v7

    :cond_1e5
    invoke-static {v1, v4, v5, v3, v0}, Lzch;->h(Landroid/graphics/Bitmap;Ljava/lang/Integer;FII)Landroid/graphics/Bitmap;

    move-result-object v0

    goto :goto_1f2

    :cond_1ea
    invoke-static {v5, v7}, Ljava/lang/Math;->max(FF)F

    move-result v2

    invoke-static {v1, v9, v2, v3, v0}, Lzch;->h(Landroid/graphics/Bitmap;Ljava/lang/Integer;FII)Landroid/graphics/Bitmap;

    move-result-object v0

    :goto_1f2
    return-object v0

    :pswitch_1f3
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    if-le v2, v5, :cond_21b

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    if-le v2, v0, :cond_233

    :try_start_203
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    mul-int/2addr v2, v0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    div-int/2addr v2, v3

    invoke-static {v1, v2, v0, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_233

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    goto :goto_232

    :cond_21b
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    mul-int/2addr v0, v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    div-int/2addr v0, v2

    invoke-static {v1, v3, v0, v4}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_233

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V
    :try_end_232
    .catch Ljava/lang/OutOfMemoryError; {:try_start_203 .. :try_end_232} :catch_233

    :goto_232
    move-object v1, v0

    :catch_233
    :cond_233
    return-object v1

    :pswitch_data_234
    .packed-switch 0x0
        :pswitch_1f3
    .end packed-switch
.end method

.method public final key()Ljava/lang/String;
    .registers 5

    iget-byte v0, p0, Lc69;->a:B

    packed-switch v0, :pswitch_data_24

    const-string v0, "x"

    const-string v1, ")"

    iget v2, p0, Lc69;->b:I

    iget p0, p0, Lc69;->c:I

    const-string v3, "SiteImageScaleAndPrettifyTransform("

    invoke-static {v2, p0, v3, v0, v1}, Lfki;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_14
    const-string v0, "x"

    const-string v1, ")"

    iget v2, p0, Lc69;->b:I

    iget p0, p0, Lc69;->c:I

    const-string v3, "FitShortSideTransform("

    invoke-static {v2, p0, v3, v0, v1}, Lfki;->o(IILjava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    nop

    :pswitch_data_24
    .packed-switch 0x0
        :pswitch_14
    .end packed-switch
.end method
