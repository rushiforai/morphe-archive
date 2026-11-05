.class final Le/e/a/CommentSettings192$Preview;
.super Landroid/view/View;
.source "CommentSettings192.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings192;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Preview"
.end annotation


# instance fields
.field animate:Z

.field background:I

.field dense:Z

.field final draft:Le/e/a/CommentAppearance192;

.field epoch:J

.field frames:I

.field final paint:Landroid/graphics/Paint;

.field scheduled:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Le/e/a/CommentAppearance192;)V
    .registers 4

    .line 23
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 22
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    .line 23
    iput-object p2, p0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Le/e/a/CommentSettings192$Preview;->setLayerType(ILandroid/graphics/Paint;)V

    const-string p1, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings192$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    return-void
.end method


# virtual methods
.method changed()V
    .registers 3

    .line 25
    iget-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->scheduled:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->scheduled:Z

    const-wide/16 v0, 0x21

    invoke-virtual {p0, p0, v0, v1}, Le/e/a/CommentSettings192$Preview;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_c
    return-void
.end method

.method draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .registers 23

    .line 30
    move-object/from16 v0, p0

    const-string v1, "\\n"

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move/from16 v3, p4

    const/4 v12, 0x0

    :goto_f
    if-lt v12, v2, :cond_12

    return-void

    :cond_12
    aget-object v13, v1, v12

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->clearShadowLayer()V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const/16 v14, 0xff

    invoke-virtual {v4, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x41200000    # 10.0f

    div-float/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v15, v4, v5

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v8, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/16 v16, 0x2

    aget v9, v4, v16

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v11, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move/from16 v6, p3

    move v7, v3

    move v10, v15

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    move/from16 v11, p5

    invoke-virtual {v4, v11}, Landroid/graphics/Paint;->setColor(I)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    iget-object v8, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v9, v4, v16

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v14, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move v11, v14

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    iget-object v4, v0, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getTextSize()F

    move-result v4

    const v5, 0x3f970a3d    # 1.18f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_f
.end method

.method moving(Z)V
    .registers 4

    .line 24
    iput-boolean p1, p0, Le/e/a/CommentSettings192$Preview;->animate:Z

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/CommentSettings192$Preview;->epoch:J

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->stop()V

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->changed()V

    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .line 28
    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->stop()V

    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 29
    move-object/from16 v6, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    iget v0, v6, Le/e/a/CommentSettings192$Preview;->frames:I

    const/4 v7, 0x1

    add-int/2addr v0, v7

    iput v0, v6, Le/e/a/CommentSettings192$Preview;->frames:I

    iget v0, v6, Le/e/a/CommentSettings192$Preview;->background:I

    const/4 v1, 0x2

    if-ne v0, v7, :cond_14

    const v0, -0x212128

    goto :goto_1f

    :cond_14
    iget v0, v6, Le/e/a/CommentSettings192$Preview;->background:I

    if-ne v0, v1, :cond_1c

    const v0, -0xdcc4c0

    goto :goto_1f

    :cond_1c
    const v0, -0xefedec

    :goto_1f
    move-object/from16 v14, p1

    invoke-virtual {v14, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    iget v0, v6, Le/e/a/CommentSettings192$Preview;->background:I

    const v15, 0x3df5c28f    # 0.12f

    if-ne v0, v1, :cond_a4

    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xa6939e

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f0ccccd    # 0.55f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v11, v0

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const/4 v9, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xccb4be

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float v9, v0, v15

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e8f5c29    # 0.28f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e99999a    # 0.3f

    mul-float v11, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f266666    # 0.65f

    mul-float v9, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e3851ec    # 0.18f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f51eb85    # 0.82f

    mul-float v11, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    :cond_a4
    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v2, 0x12

    invoke-static {v1, v2}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    iget-object v2, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v8, 0x0

    aget v2, v2, v8

    mul-int v1, v1, v2

    int-to-float v1, v1

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v7

    invoke-static {v0, v1}, Le/e/a/CommentStyle;->applyWeight(Landroid/graphics/Paint;I)Z

    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    const v1, 0x3f970a3d    # 1.18f

    mul-float v9, v0, v1

    iget-boolean v0, v6, Le/e/a/CommentSettings192$Preview;->animate:Z

    if-eqz v0, :cond_fb

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, v6, Le/e/a/CommentSettings192$Preview;->epoch:J

    sub-long/2addr v0, v2

    iget-object v2, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v3, 0x4

    aget v2, v2, v3

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v4, v2

    rem-long/2addr v0, v4

    long-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v3

    int-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float v1, v1, v2

    div-float/2addr v0, v1

    move v10, v0

    goto :goto_101

    :cond_fb
    const v0, 0x3eb33333    # 0.35f

    const v10, 0x3eb33333    # 0.35f

    :goto_101
    const-string v0, "\u8272\u4ed8\u304d\u30b3\u30e1\u30f3\u30c8"

    const-string v1, "\u8907\u6570\u884c\u30b3\u30e1\u30f3\u30c8\n2\u884c\u76ee"

    const-string v2, "\u901a\u5e38\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v11

    const/4 v12, 0x0

    :goto_10c
    iget-boolean v0, v6, Le/e/a/CommentSettings192$Preview;->dense:Z

    const/4 v1, 0x5

    if-eqz v0, :cond_118

    iget-object v0, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v0, v0, Le/e/a/CommentAppearance192;->values:[I

    aget v0, v0, v1

    goto :goto_119

    :cond_118
    const/4 v0, 0x3

    :goto_119
    if-lt v12, v0, :cond_14d

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3ef5c28f    # 0.48f

    mul-float v3, v0, v1

    const/4 v5, -0x1

    const-string v2, "\u4e0a\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v4, v9

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings192$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3ed70a3d    # 0.42f

    mul-float v3, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, -0x6

    int-to-float v4, v0

    const/16 v5, -0x9a

    const-string v2, "\u4e0b\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings192$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    return-void

    :cond_14d
    rem-int/lit8 v0, v12, 0x3

    aget-object v2, v11, v0

    iget-object v3, v6, Le/e/a/CommentSettings192$Preview;->paint:Landroid/graphics/Paint;

    const-string v4, "\\n"

    invoke-virtual {v2, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v8

    invoke-virtual {v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v3

    iget-boolean v4, v6, Le/e/a/CommentSettings192$Preview;->animate:Z

    if-eqz v4, :cond_17d

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v4

    int-to-float v4, v4

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v5

    int-to-float v5, v5

    add-float/2addr v5, v3

    int-to-float v3, v12

    const v13, 0x3e2e147b    # 0.17f

    mul-float v3, v3, v13

    add-float/2addr v3, v10

    const/high16 v13, 0x3f800000    # 1.0f

    rem-float/2addr v3, v13

    mul-float v5, v5, v3

    sub-float/2addr v4, v5

    move v3, v4

    goto :goto_192

    :cond_17d
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0xc

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getWidth()I

    move-result v4

    mul-int v4, v4, v0

    int-to-float v4, v4

    mul-float v4, v4, v15

    add-float/2addr v3, v4

    :goto_192
    iget-boolean v4, v6, Le/e/a/CommentSettings192$Preview;->dense:Z

    if-eqz v4, :cond_1bf

    iget-object v4, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v4, v4, v1

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    rem-int v4, v12, v4

    int-to-float v4, v4

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings192$Preview;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v9

    iget-object v13, v6, Le/e/a/CommentSettings192$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v13, v13, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v13, v1

    invoke-static {v7, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    div-float/2addr v5, v1

    const/high16 v1, 0x40c00000    # 6.0f

    invoke-static {v1, v5}, Ljava/lang/Math;->max(FF)F

    move-result v1

    mul-float v4, v4, v1

    add-float/2addr v4, v9

    goto :goto_1c7

    :cond_1bf
    int-to-float v1, v12

    const v4, 0x3fb33333    # 1.4f

    add-float/2addr v1, v4

    mul-float v1, v1, v9

    move v4, v1

    :goto_1c7
    if-ne v0, v7, :cond_1d0

    const v0, -0x9a2b54

    const v5, -0x9a2b54

    goto :goto_1d2

    :cond_1d0
    const/4 v0, -0x1

    const/4 v5, -0x1

    :goto_1d2
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings192$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_10c
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2

    .line 28
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    if-nez p1, :cond_9

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->stop()V

    goto :goto_10

    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings192$Preview;->animate:Z

    if-eqz p1, :cond_10

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->changed()V

    :cond_10
    :goto_10
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .registers 2

    .line 28
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    if-eqz p1, :cond_9

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->stop()V

    goto :goto_10

    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings192$Preview;->animate:Z

    if-eqz p1, :cond_10

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->changed()V

    :cond_10
    :goto_10
    return-void
.end method

.method public run()V
    .registers 3

    .line 26
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->scheduled:Z

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->invalidate()V

    iget-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->animate:Z

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings192$Preview;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_24

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->scheduled:Z

    const-wide/16 v0, 0x22

    invoke-virtual {p0, p0, v0, v1}, Le/e/a/CommentSettings192$Preview;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_24
    return-void
.end method

.method stop()V
    .registers 2

    .line 27
    invoke-virtual {p0, p0}, Le/e/a/CommentSettings192$Preview;->removeCallbacks(Ljava/lang/Runnable;)Z

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings192$Preview;->scheduled:Z

    return-void
.end method
