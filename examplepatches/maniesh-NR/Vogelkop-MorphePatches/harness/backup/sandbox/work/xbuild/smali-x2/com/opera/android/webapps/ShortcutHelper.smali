.class public final Lcom/opera/android/webapps/ShortcutHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Ldx3;Lumi;Ljava/lang/String;Landroid/net/Uri;ZLandroid/graphics/Bitmap;ZIIJJLjava/lang/String;Ljava/lang/String;)V
    .registers 30

    move-object/from16 v0, p1

    invoke-static {}, Lm5h;->q()Z

    move-result v1

    if-nez v1, :cond_e

    move-object/from16 v1, p2

    invoke-static {p0, v1}, Lm5h;->B(Landroid/content/Context;Ljava/lang/String;)V

    return-void

    :cond_e
    move-object/from16 v1, p2

    new-instance v2, Lkhj;

    move-object v3, p0

    move-object/from16 v4, p3

    move/from16 v5, p4

    move-object/from16 v6, p5

    move/from16 v7, p7

    move/from16 v8, p8

    move-wide/from16 v9, p9

    move-wide/from16 v11, p11

    move-object/from16 v13, p13

    move-object/from16 v14, p14

    invoke-direct/range {v2 .. v14}, Lkhj;-><init>(Ldx3;Landroid/net/Uri;ZLandroid/graphics/Bitmap;IIJJLjava/lang/String;Ljava/lang/String;)V

    invoke-interface {v0, v2}, Ltcl;->b(Lesk;)Lnml;

    move-result-object v2

    new-instance v3, Lis6;

    const/4 v4, 0x3

    move-object/from16 p8, p0

    move-object/from16 p10, p5

    move/from16 p11, p6

    move-object/from16 p9, v1

    move-object/from16 p7, v3

    move/from16 p12, v4

    invoke-direct/range {p7 .. p12}, Lis6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;ZB)V

    move-object/from16 p0, p7

    invoke-virtual {v0, p0}, Lumi;->f(Ln5o;)Lnml;

    move-result-object p0

    invoke-virtual {v2, p0}, Lnml;->b(Lnml;)V

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void
.end method

.method public static b(Ldx3;Landroid/graphics/Bitmap;Ljava/lang/String;II)Landroid/graphics/Bitmap;
    .registers 17

    const-string v0, "activity"

    invoke-virtual {p0, v0}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/ActivityManager;

    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLauncherLargeIconSize()I

    move-result v1

    const/4 v2, 0x0

    :try_start_d
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v1, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v3
    :try_end_13
    .catch Ljava/lang/OutOfMemoryError; {:try_start_d .. :try_end_13} :catch_88

    :try_start_13
    new-instance v4, Landroid/graphics/Canvas;

    invoke-direct {v4, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    if-eqz p1, :cond_33

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    div-int/lit8 v6, v1, 0x2

    if-lt v5, v6, :cond_33

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    div-int/lit8 v1, v1, 0x2

    if-lt v5, v1, :cond_33

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-static {p1, v4, v0}, Lcom/opera/android/webapps/ShortcutHelper;->d(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;F)V

    invoke-static {p0, v4}, Lm5h;->z(Ldx3;Landroid/graphics/Canvas;)V

    goto :goto_83

    :cond_33
    invoke-virtual {v0}, Landroid/app/ActivityManager;->getLauncherLargeIconDensity()I

    move-result p0

    int-to-float p0, p0

    const/high16 p1, 0x43200000    # 160.0f

    div-float/2addr p0, p1

    const/high16 p1, 0x42200000    # 40.0f

    mul-float/2addr p1, p0

    float-to-int v6, p1

    const/high16 p1, 0x40000000    # 2.0f

    mul-float v0, p0, p1

    float-to-int v8, v0

    const/high16 v0, 0x41800000    # 16.0f

    mul-float/2addr p0, v0

    float-to-int p0, p0

    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_83

    new-instance v5, La9i;

    int-to-float v11, p0

    move v7, v6

    move v9, p3

    move/from16 v10, p4

    invoke-direct/range {v5 .. v11}, La9i;-><init>(IIIIIF)V

    invoke-virtual {v5, p2}, La9i;->a(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {v4}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    invoke-virtual {v4}, Landroid/graphics/Canvas;->getHeight()I

    move-result v5

    const/4 v6, 0x0

    invoke-direct {v0, v6, v6, v1, v5}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterX()F

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, p1

    sub-float/2addr v1, v5

    invoke-virtual {v0}, Landroid/graphics/Rect;->exactCenterY()F

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    div-float/2addr v5, p1

    sub-float/2addr v0, v5

    invoke-virtual {v4, p0, v1, v0, v2}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;FFLandroid/graphics/Paint;)V

    :cond_83
    :goto_83
    invoke-virtual {v4, v2}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_86
    .catch Ljava/lang/OutOfMemoryError; {:try_start_13 .. :try_end_86} :catch_87

    return-object v3

    :catch_87
    move-object v2, v3

    :catch_88
    return-object v2
.end method

.method public static c(IILandroid/content/Context;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 9

    const/4 v0, 0x0

    if-nez p3, :cond_4

    return-object v0

    :cond_4
    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    int-to-float v2, p0

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    div-float v1, v2, v1

    float-to-int v1, v1

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v3, v3

    int-to-float v1, v1

    div-float/2addr v3, v1

    const v1, 0x3f19999a    # 0.6f

    cmpl-float v1, v3, v1

    if-ltz v1, :cond_77

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p2

    invoke-virtual {p2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p2

    iget p2, p2, Landroid/util/DisplayMetrics;->density:F

    div-float/2addr v2, p2

    float-to-int p2, v2

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p3}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x3fa00000    # 1.25f

    mul-float/2addr v1, v2

    int-to-float p2, p2

    div-float/2addr v1, p2

    const/high16 p2, 0x3f800000    # 1.0f

    cmpg-float v1, v1, p2

    if-gez v1, :cond_57

    const/high16 v1, 0x3f400000    # 0.75f

    goto :goto_58

    :cond_57
    move v1, p2

    :goto_58
    :try_start_58
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {p0, p0, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_5e
    .catch Ljava/lang/OutOfMemoryError; {:try_start_58 .. :try_end_5e} :catch_77

    cmpg-float p2, v1, p2

    if-gez p2, :cond_66

    :try_start_62
    invoke-static {p0, p3, p1}, Lcom/opera/android/webapps/ShortcutHelper;->e(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;I)V

    goto :goto_6a

    :cond_66
    invoke-static {p0, p3, p1}, Lcom/opera/android/webapps/ShortcutHelper;->f(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;I)F

    move-result v1

    :goto_6a
    new-instance p1, Landroid/graphics/Canvas;

    invoke-direct {p1, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    invoke-static {p3, p1, v1}, Lcom/opera/android/webapps/ShortcutHelper;->d(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;F)V

    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V
    :try_end_75
    .catch Ljava/lang/OutOfMemoryError; {:try_start_62 .. :try_end_75} :catch_76

    return-object p0

    :catch_76
    move-object v0, p0

    :catch_77
    :cond_77
    return-object v0
.end method

.method public static d(Landroid/graphics/Bitmap;Landroid/graphics/Canvas;F)V
    .registers 10

    new-instance v0, Landroid/graphics/Rect;

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    const/4 v3, 0x0

    invoke-direct {v0, v3, v3, v1, v2}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v2

    int-to-float v2, v2

    sub-float/2addr v1, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v2

    int-to-float v2, v2

    mul-float/2addr v2, p2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result p2

    int-to-float p2, p2

    sub-float/2addr v2, p2

    new-instance p2, Landroid/graphics/RectF;

    neg-float v4, v1

    neg-float v5, v2

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    move-result v6

    int-to-float v6, v6

    add-float/2addr v6, v1

    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    move-result v1

    int-to-float v1, v1

    add-float/2addr v1, v2

    invoke-direct {p2, v4, v5, v6, v1}, Landroid/graphics/RectF;-><init>(FFFF)V

    new-instance v1, Landroid/graphics/Paint;

    const/4 v2, 0x1

    invoke-direct {v1, v2}, Landroid/graphics/Paint;-><init>(I)V

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setFilterBitmap(Z)V

    invoke-virtual {p1}, Landroid/graphics/Canvas;->save()I

    move-result v2

    sget-object v4, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p0, v4, v3}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    move-result-object v3

    invoke-virtual {p1, v3, v0, p2, v1}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    if-eq v3, p0, :cond_54

    invoke-virtual {v3}, Landroid/graphics/Bitmap;->recycle()V

    :cond_54
    invoke-virtual {p1, v2}, Landroid/graphics/Canvas;->restoreToCount(I)V

    return-void
.end method

.method public static e(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;I)V
    .registers 5

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v0

    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    if-ne v0, v1, :cond_1e

    new-instance v0, Llhj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, v0}, LJ/N;->MKfuIv9y(Ljava/lang/Object;Ljava/lang/Object;)V

    iget v0, v0, Llhj;->c:F

    const v1, 0x3f3ae148    # 0.73f

    cmpg-float v0, v0, v1

    if-gez v0, :cond_1e

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return-void

    :cond_1e
    new-instance v0, Lrn9;

    const/4 v1, 0x1

    invoke-direct {v0, p1, v1}, Lrn9;-><init>(Landroid/graphics/Bitmap;I)V

    invoke-virtual {v0}, Lrn9;->A()Z

    move-result p1

    if-eqz p1, :cond_3b

    invoke-virtual {v0}, Lrn9;->z()Z

    move-result p1

    if-eqz p1, :cond_3b

    iget-object p1, v0, Lrn9;->c:Ljava/lang/Object;

    check-cast p1, [I

    const/4 p2, 0x0

    aget p1, p1, p2

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return-void

    :cond_3b
    invoke-virtual {p0, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return-void
.end method

.method public static f(Landroid/graphics/Bitmap;Landroid/graphics/Bitmap;I)F
    .registers 10

    new-instance v0, Llhj;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1, v0}, LJ/N;->MKfuIv9y(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    move-result-object v1

    sget-object v2, Landroid/graphics/Bitmap$Config;->RGB_565:Landroid/graphics/Bitmap$Config;

    const/high16 v3, 0x3f800000    # 1.0f

    if-eq v1, v2, :cond_92

    iget v1, v0, Llhj;->c:F

    const v2, 0x3f3ae148    # 0.73f

    cmpg-float v1, v1, v2

    if-gez v1, :cond_20

    const/4 p1, -0x1

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return v3

    :cond_20
    iget v1, v0, Llhj;->b:I

    const/4 v2, 0x1

    if-le v1, v2, :cond_92

    new-instance v1, Lrn9;

    invoke-direct {v1, p1, v2}, Lrn9;-><init>(Landroid/graphics/Bitmap;I)V

    iget-object p1, v1, Lrn9;->c:Ljava/lang/Object;

    check-cast p1, [I

    iget v2, v0, Llhj;->c:F

    cmpl-float v2, v2, v3

    const/4 v4, 0x0

    if-nez v2, :cond_59

    invoke-virtual {v1}, Lrn9;->z()Z

    move-result v2

    if-eqz v2, :cond_59

    move v2, v4

    :goto_3c
    iget-object v5, v1, Lrn9;->d:Ljava/lang/Object;

    check-cast v5, [I

    array-length v6, v5

    if-ge v2, v6, :cond_59

    aget v5, v5, v2

    aget v6, p1, v4

    invoke-static {v5, v6}, Lrn9;->h(II)Z

    move-result v5

    if-nez v5, :cond_56

    aget p1, p1, v4

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    const p0, 0x3f59999a    # 0.85f

    return p0

    :cond_56
    add-int/lit8 v2, v2, 0x1

    goto :goto_3c

    :cond_59
    iget-boolean v2, v1, Lrn9;->b:Z

    if-eqz v2, :cond_73

    invoke-virtual {v1}, Lrn9;->A()Z

    move-result v2

    if-eqz v2, :cond_73

    invoke-virtual {v1}, Lrn9;->z()Z

    move-result p2

    if-eqz p2, :cond_6f

    aget p1, p1, v4

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return v3

    :cond_6f
    const p0, 0x3f866666    # 1.05f

    return p0

    :cond_73
    iget p1, v0, Llhj;->c:F

    cmpg-float p1, p1, v3

    if-gez p1, :cond_89

    iget p1, v0, Llhj;->a:I

    invoke-static {p1}, Landroid/graphics/Color;->alpha(I)I

    move-result p1

    const/16 v1, 0xff

    if-ne p1, v1, :cond_89

    iget p1, v0, Llhj;->a:I

    invoke-virtual {p0, p1}, Landroid/graphics/Bitmap;->eraseColor(I)V

    return v3

    :cond_89
    iget p1, v0, Llhj;->c:F

    cmpg-float p1, p1, v3

    if-gez p1, :cond_92

    invoke-virtual {p0, p2}, Landroid/graphics/Bitmap;->eraseColor(I)V

    :cond_92
    return v3
.end method

.method public static setColorInfo(Ljava/lang/Object;IIF)V
    .registers 4
    .param p0    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    check-cast p0, Llhj;

    iput p1, p0, Llhj;->a:I

    iput p2, p0, Llhj;->b:I

    iput p3, p0, Llhj;->c:F

    return-void
.end method
