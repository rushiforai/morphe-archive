.class public final Le/e/a/CommentInk192;
.super Ljava/lang/Object;
.source "CommentInk192.java"


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V
    .registers 11

    .line 4
    invoke-virtual {p4}, Landroid/graphics/Paint;->getAlpha()I

    move-result v0

    mul-int p5, p5, v0

    int-to-float p5, p5

    const/high16 v1, 0x42c80000    # 100.0f

    div-float/2addr p5, v1

    invoke-static {p5}, Ljava/lang/Math;->round(F)I

    move-result p5

    invoke-virtual {p4, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    invoke-virtual {p4}, Landroid/graphics/Paint;->getStyle()Landroid/graphics/Paint$Style;

    move-result-object p5

    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    const/4 v2, 0x0

    if-ne p5, v1, :cond_28

    invoke-virtual {p4, p6}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    cmpg-float p5, p6, v2

    if-lez p5, :cond_23

    if-eqz p7, :cond_38

    :cond_23
    const/4 p5, 0x0

    invoke-virtual {p4, p5}, Landroid/graphics/Paint;->setAlpha(I)V

    goto :goto_38

    :cond_28
    const/4 p5, 0x1

    if-ne p7, p5, :cond_35

    cmpl-float p5, p6, v2

    if-lez p5, :cond_35

    const/high16 p5, -0x1000000

    invoke-virtual {p4, p6, v2, v2, p5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    goto :goto_38

    :cond_35
    invoke-virtual {p4}, Landroid/graphics/Paint;->clearShadowLayer()V

    :cond_38
    :goto_38
    invoke-virtual {p0, p1, p2, p3, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    invoke-virtual {p4, v0}, Landroid/graphics/Paint;->setAlpha(I)V

    return-void
.end method

.method public static nativeText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;Landroid/content/Context;)V
    .registers 20

    .line 5
    const-string v0, "comment_opacity_percent"

    if-nez p5, :cond_8

    invoke-virtual/range {p0 .. p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    return-void

    :cond_8
    invoke-static/range {p5 .. p5}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object v1

    const/16 v2, 0x64

    :try_start_e
    invoke-interface {v1, v0}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_19

    invoke-interface {v1, v0, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    goto :goto_35

    :cond_19
    const-string v0, "comment_alpha"

    const-string v3, "255"

    invoke-interface {v1, v0, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v0

    int-to-float v0, v0

    const/high16 v3, 0x42c80000    # 100.0f

    mul-float v0, v0, v3

    const/high16 v3, 0x437f0000    # 255.0f

    div-float/2addr v0, v3

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_31} :catch_32

    goto :goto_35

    :catch_32
    move-exception v0

    const/16 v0, 0x64

    :goto_35
    const-string v3, "comment_shadow_tenths"

    const/4 v4, 0x7

    invoke-interface {v1, v3, v4}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v3

    const/16 v4, 0x32

    invoke-static {v4, v3}, Ljava/lang/Math;->min(II)I

    move-result v3

    const/4 v4, 0x1

    invoke-static {v4, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    int-to-float v3, v3

    const/high16 v5, 0x41200000    # 10.0f

    div-float/2addr v3, v5

    invoke-virtual/range {p5 .. p5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v12, v3, v5

    const-string v3, "comment_shadow"

    const-string v5, "0"

    invoke-interface {v1, v3, v5}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v2, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    const/4 v2, 0x0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v11

    const-string v0, "1"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    const/4 v13, 0x1

    goto :goto_7e

    :cond_72
    const-string v0, "2"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7d

    const/4 v4, 0x2

    const/4 v13, 0x2

    goto :goto_7e

    :cond_7d
    const/4 v13, 0x0

    :goto_7e
    move-object v6, p0

    move-object v7, p1

    move/from16 v8, p2

    move/from16 v9, p3

    move-object/from16 v10, p4

    invoke-static/range {v6 .. v13}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    return-void
.end method
