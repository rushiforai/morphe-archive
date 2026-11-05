.class final Le/e/a/CommentSettings194$Preview;
.super Landroid/view/View;
.source "CommentSettings194.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings194;
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

.field face:Landroid/graphics/Typeface;

.field final paint:Landroid/graphics/Paint;

.field scheduled:Z


# direct methods
.method constructor <init>(Landroid/content/Context;Le/e/a/CommentAppearance192;)V
    .registers 4

    .line 658
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 659
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x3

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    .line 660
    iput-object p2, p0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    .line 661
    const/4 p1, 0x1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Le/e/a/CommentSettings194$Preview;->setLayerType(ILandroid/graphics/Paint;)V

    .line 662
    const-string p1, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-static {p1}, Le/e/a/CommentSettings194;->tr(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings194$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 663
    return-void
.end method


# virtual methods
.method changed()V
    .registers 3

    .line 666
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->invalidate()V

    .line 667
    iget-boolean v0, p0, Le/e/a/CommentSettings194$Preview;->animate:Z

    if-eqz v0, :cond_25

    iget-boolean v0, p0, Le/e/a/CommentSettings194$Preview;->scheduled:Z

    if-nez v0, :cond_25

    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_25

    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_25

    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_25

    .line 668
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Preview;->scheduled:Z

    .line 669
    const-wide/16 v0, 0x21

    invoke-virtual {p0, p0, v0, v1}, Le/e/a/CommentSettings194$Preview;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 671
    :cond_25
    return-void
.end method

.method draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .registers 22

    .line 756
    move-object/from16 v0, p0

    .line 757
    const-string v1, "\n"

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move/from16 v3, p4

    const/4 v12, 0x0

    :goto_f
    if-lt v12, v2, :cond_12

    .line 770
    return-void

    .line 757
    :cond_12
    aget-object v13, v1, v12

    .line 758
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 759
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const/16 v5, 0xff

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 760
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 761
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 762
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x41200000    # 10.0f

    div-float/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v14, v4, v5

    .line 763
    nop

    .line 764
    iget-object v8, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/4 v15, 0x2

    aget v9, v4, v15

    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v11, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move/from16 v6, p3

    move v7, v3

    move v10, v14

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    .line 765
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 766
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    move/from16 v11, p5

    invoke-virtual {v4, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 767
    iget-object v8, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v9, v4, v15

    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v15, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move v11, v15

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    .line 768
    iget-object v4, v0, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getTextSize()F

    move-result v4

    const v5, 0x3f970a3d    # 1.18f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    .line 757
    add-int/lit8 v12, v12, 0x1

    goto :goto_f
.end method

.method moving(Z)V
    .registers 4

    .line 674
    iput-boolean p1, p0, Le/e/a/CommentSettings194$Preview;->animate:Z

    .line 675
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/CommentSettings194$Preview;->epoch:J

    .line 676
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->stop()V

    .line 677
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 678
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .line 682
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->stop()V

    .line 683
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 684
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 726
    move-object/from16 v6, p0

    iget v0, v6, Le/e/a/CommentSettings194$Preview;->background:I

    const/4 v1, 0x2

    const/4 v7, 0x1

    if-ne v0, v7, :cond_d

    .line 727
    nop

    .line 728
    const v0, -0x212128

    goto :goto_18

    .line 729
    :cond_d
    iget v0, v6, Le/e/a/CommentSettings194$Preview;->background:I

    if-ne v0, v1, :cond_15

    const v0, -0xdcc2b8

    goto :goto_18

    :cond_15
    const v0, -0xefece4

    .line 731
    :goto_18
    move-object/from16 v14, p1

    invoke-virtual {v14, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 732
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 733
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 734
    iget v0, v6, Le/e/a/CommentSettings194$Preview;->background:I

    const v15, 0x3df5c28f    # 0.12f

    if-ne v0, v1, :cond_81

    .line 735
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xa692a0

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 736
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f19999a    # 0.6f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v0

    int-to-float v11, v0

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const/4 v9, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 737
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xccb2be

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 738
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float v9, v0, v15

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e8f5c29    # 0.28f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e99999a    # 0.3f

    mul-float v11, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 740
    :cond_81
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41400000    # 12.0f

    div-float/2addr v1, v2

    iget-object v2, v6, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v3, 0x0

    aget v2, v2, v3

    int-to-float v2, v2

    mul-float v1, v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    invoke-static {v6, v0}, Le/e/a/Revision201;->previewFont(Ljava/lang/Object;Landroid/graphics/Paint;)V

    .line 741
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, v6, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v7

    iget-object v2, v6, Le/e/a/CommentSettings194$Preview;->face:Landroid/graphics/Typeface;

    invoke-static {v0, v1, v2}, Le/e/a/CommentStyle;->applyFont(Landroid/graphics/Paint;ILandroid/graphics/Typeface;)Z

    .line 742
    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    const v1, 0x3f970a3d    # 1.18f

    mul-float v8, v0, v1

    .line 743
    iget-boolean v0, v6, Le/e/a/CommentSettings194$Preview;->animate:Z

    if-eqz v0, :cond_db

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v4, v6, Le/e/a/CommentSettings194$Preview;->epoch:J

    sub-long/2addr v0, v4

    iget-object v2, v6, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v4, 0x4

    aget v2, v2, v4

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v9, v2

    rem-long/2addr v0, v9

    long-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v4

    int-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float v1, v1, v2

    div-float/2addr v0, v1

    move v9, v0

    goto :goto_e1

    :cond_db
    const v0, 0x3eb33333    # 0.35f

    const v9, 0x3eb33333    # 0.35f

    .line 744
    :goto_e1
    const-string v0, "\u8272\u4ed8\u304d\u30b3\u30e1\u30f3\u30c8"

    const-string v1, "\u8907\u6570\u884c\u30b3\u30e1\u30f3\u30c8\n2\u884c\u76ee"

    const-string v2, "\u901a\u5e38\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v10

    .line 745
    iget-boolean v0, v6, Le/e/a/CommentSettings194$Preview;->dense:Z

    if-eqz v0, :cond_f8

    iget-object v0, v6, Le/e/a/CommentSettings194$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v0, v0, Le/e/a/CommentAppearance192;->values:[I

    const/4 v1, 0x5

    aget v0, v0, v1

    move v11, v0

    goto :goto_fa

    :cond_f8
    const/4 v0, 0x3

    const/4 v11, 0x3

    .line 746
    :goto_fa
    const/4 v12, 0x0

    :goto_fb
    if-lt v12, v11, :cond_14a

    .line 751
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const-string v2, "\u4e0a\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    sub-float/2addr v0, v1

    const/high16 v7, 0x40000000    # 2.0f

    div-float/2addr v0, v7

    const/4 v9, 0x0

    invoke-static {v9, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    const/4 v5, -0x1

    const-string v2, "\u4e0a\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v4, v8

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings194$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 752
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    const-string v2, "\u4e0b\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v1

    sub-float/2addr v0, v1

    div-float/2addr v0, v7

    invoke-static {v9, v0}, Ljava/lang/Math;->max(FF)F

    move-result v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v1}, Landroid/graphics/Paint;->descent()F

    move-result v1

    sub-float v4, v0, v1

    const/16 v5, -0x100

    const-string v2, "\u4e0b\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings194$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 753
    return-void

    .line 747
    :cond_14a
    rem-int/lit8 v0, v12, 0x3

    .line 748
    aget-object v2, v10, v0

    iget-boolean v1, v6, Le/e/a/CommentSettings194$Preview;->dense:Z

    invoke-static {v2, v1}, Le/e/a/Revision201;->previewLabel(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    .line 749
    iget-boolean v1, v6, Le/e/a/CommentSettings194$Preview;->animate:Z

    if-eqz v1, :cond_177

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v1

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v3

    int-to-float v3, v3

    iget-object v4, v6, Le/e/a/CommentSettings194$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v4

    add-float/2addr v3, v4

    int-to-float v4, v12

    const v5, 0x3e2e147b    # 0.17f

    mul-float v4, v4, v5

    add-float/2addr v4, v9

    const/high16 v5, 0x3f800000    # 1.0f

    rem-float/2addr v4, v5

    mul-float v3, v3, v4

    sub-float/2addr v1, v3

    goto :goto_18c

    :cond_177
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getContext()Landroid/content/Context;

    move-result-object v1

    const/16 v3, 0xc

    invoke-static {v1, v3}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v1

    int-to-float v1, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings194$Preview;->getWidth()I

    move-result v3

    mul-int v3, v3, v0

    int-to-float v3, v3

    mul-float v3, v3, v15

    add-float/2addr v1, v3

    :goto_18c
    move v3, v1

    iget-boolean v1, v6, Le/e/a/CommentSettings194$Preview;->dense:Z

    invoke-static {v6, v12, v11, v8, v1}, Le/e/a/Revision201;->previewY(Landroid/view/View;IIFZ)F

    move-result v1

    move v4, v1

    if-ne v0, v7, :cond_19d

    const v0, -0x9a2e54

    const v5, -0x9a2e54

    goto :goto_19f

    :cond_19d
    const/4 v0, -0x1

    const/4 v5, -0x1

    :goto_19f
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings194$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 746
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_fb
.end method

.method protected onMeasure(II)V
    .registers 6

    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result v0

    invoke-static {p0, v0}, Le/e/a/Revision201;->previewSize(Landroid/view/View;I)[I

    move-result-object v0

    const/4 v1, 0x0

    aget v1, v0, v1

    const/4 v2, 0x1

    aget v2, v0, v2

    invoke-virtual {p0, v1, v2}, Le/e/a/CommentSettings194$Preview;->setMeasuredDimension(II)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2

    .line 694
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 695
    if-nez p1, :cond_9

    .line 696
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->stop()V

    goto :goto_11

    .line 697
    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings194$Preview;->animate:Z

    if-eqz p1, :cond_11

    .line 698
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->changed()V

    goto :goto_12

    .line 697
    :cond_11
    :goto_11
    nop

    .line 700
    :goto_12
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .registers 2

    .line 704
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 705
    if-eqz p1, :cond_9

    .line 706
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->stop()V

    goto :goto_11

    .line 707
    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings194$Preview;->animate:Z

    if-eqz p1, :cond_11

    .line 708
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->changed()V

    goto :goto_12

    .line 707
    :cond_11
    :goto_11
    nop

    .line 710
    :goto_12
    return-void
.end method

.method public run()V
    .registers 2

    .line 714
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Preview;->scheduled:Z

    .line 715
    invoke-virtual {p0}, Le/e/a/CommentSettings194$Preview;->changed()V

    .line 716
    return-void
.end method

.method stop()V
    .registers 2

    .line 719
    invoke-virtual {p0, p0}, Le/e/a/CommentSettings194$Preview;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 720
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings194$Preview;->scheduled:Z

    .line 721
    return-void
.end method
