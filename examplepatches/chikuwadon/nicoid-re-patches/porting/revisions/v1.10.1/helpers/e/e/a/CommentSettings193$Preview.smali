.class final Le/e/a/CommentSettings193$Preview;
.super Landroid/view/View;
.source "CommentSettings193.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CommentSettings193;
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

    .line 61
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 62
    new-instance p1, Landroid/graphics/Paint;

    const/4 v0, 0x1

    invoke-direct {p1, v0}, Landroid/graphics/Paint;-><init>(I)V

    iput-object p1, p0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    .line 63
    iput-object p2, p0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    .line 64
    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Le/e/a/CommentSettings193$Preview;->setLayerType(ILandroid/graphics/Paint;)V

    .line 65
    const-string p1, "\u30b3\u30e1\u30f3\u30c8\u8868\u793a\u30d7\u30ec\u30d3\u30e5\u30fc"

    invoke-static {p1}, Le/e/a/UiStrings;->translate(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Le/e/a/CommentSettings193$Preview;->setContentDescription(Ljava/lang/CharSequence;)V

    .line 66
    return-void
.end method


# virtual methods
.method changed()V
    .registers 3

    .line 76
    iget-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->scheduled:Z

    if-eqz v0, :cond_5

    .line 77
    return-void

    .line 79
    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->scheduled:Z

    .line 80
    const-wide/16 v0, 0x21

    invoke-virtual {p0, p0, v0, v1}, Le/e/a/CommentSettings193$Preview;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 81
    return-void
.end method

.method draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V
    .registers 23

    .line 165
    move-object/from16 v0, p0

    .line 166
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

    .line 180
    return-void

    .line 166
    :cond_12
    aget-object v13, v1, v12

    .line 167
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 168
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const/16 v14, 0xff

    invoke-virtual {v4, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 169
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/4 v5, 0x3

    aget v4, v4, v5

    int-to-float v4, v4

    const/high16 v5, 0x41200000    # 10.0f

    div-float/2addr v4, v5

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getResources()Landroid/content/res/Resources;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v5

    iget v5, v5, Landroid/util/DisplayMetrics;->density:F

    mul-float v15, v4, v5

    .line 170
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 171
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const/high16 v5, -0x1000000

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 172
    nop

    .line 173
    iget-object v8, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    const/16 v16, 0x2

    aget v9, v4, v16

    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v11, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move/from16 v6, p3

    move v7, v3

    move v10, v15

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    .line 174
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    sget-object v5, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 175
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    move/from16 v11, p5

    invoke-virtual {v4, v11}, Landroid/graphics/Paint;->setColor(I)V

    .line 176
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4, v14}, Landroid/graphics/Paint;->setAlpha(I)V

    .line 177
    iget-object v8, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v9, v4, v16

    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget v14, v4, Le/e/a/CommentAppearance192;->shadow:I

    move-object/from16 v4, p1

    move-object v5, v13

    move v11, v14

    invoke-static/range {v4 .. v11}, Le/e/a/CommentInk192;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;IFI)V

    .line 178
    iget-object v4, v0, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v4}, Landroid/graphics/Paint;->getTextSize()F

    move-result v4

    const v5, 0x3f970a3d    # 1.18f

    mul-float v4, v4, v5

    add-float/2addr v3, v4

    .line 166
    add-int/lit8 v12, v12, 0x1

    goto/16 :goto_f
.end method

.method moving(Z)V
    .registers 4

    .line 69
    iput-boolean p1, p0, Le/e/a/CommentSettings193$Preview;->animate:Z

    .line 70
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/CommentSettings193$Preview;->epoch:J

    .line 71
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->stop()V

    .line 72
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->changed()V

    .line 73
    return-void
.end method

.method protected onDetachedFromWindow()V
    .registers 1

    .line 100
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->stop()V

    .line 101
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 102
    return-void
.end method

.method protected onDraw(Landroid/graphics/Canvas;)V
    .registers 18

    .line 129
    move-object/from16 v6, p0

    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 130
    iget v0, v6, Le/e/a/CommentSettings193$Preview;->frames:I

    const/4 v7, 0x1

    add-int/2addr v0, v7

    iput v0, v6, Le/e/a/CommentSettings193$Preview;->frames:I

    .line 131
    iget v0, v6, Le/e/a/CommentSettings193$Preview;->background:I

    const/4 v1, 0x2

    if-ne v0, v7, :cond_15

    .line 132
    nop

    .line 133
    const v0, -0x212128

    goto :goto_20

    .line 134
    :cond_15
    iget v0, v6, Le/e/a/CommentSettings193$Preview;->background:I

    if-ne v0, v1, :cond_1d

    const v0, -0xdcc4c0

    goto :goto_20

    :cond_1d
    const v0, -0xefedec

    .line 136
    :goto_20
    move-object/from16 v14, p1

    invoke-virtual {v14, v0}, Landroid/graphics/Canvas;->drawColor(I)V

    .line 137
    iget v0, v6, Le/e/a/CommentSettings193$Preview;->background:I

    const v15, 0x3df5c28f    # 0.12f

    if-ne v0, v1, :cond_a5

    .line 138
    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xa6939e

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 139
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f0ccccd    # 0.55f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v11, v0

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const/4 v9, 0x0

    move-object/from16 v8, p1

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 140
    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const v1, -0xccb4be

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 141
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    mul-float v9, v0, v15

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e8f5c29    # 0.28f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e99999a    # 0.3f

    mul-float v11, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 142
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f266666    # 0.65f

    mul-float v9, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3e3851ec    # 0.18f

    mul-float v10, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3f51eb85    # 0.82f

    mul-float v11, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    int-to-float v12, v0

    iget-object v13, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawRect(FFFFLandroid/graphics/Paint;)V

    .line 144
    :cond_a5
    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x41400000    # 12.0f

    div-float/2addr v1, v2

    iget-object v2, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v8, 0x0

    aget v2, v2, v8

    int-to-float v2, v2

    mul-float v1, v1, v2

    const/high16 v2, 0x42c80000    # 100.0f

    div-float/2addr v1, v2

    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 145
    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    iget-object v1, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v7

    invoke-static {v0, v1}, Le/e/a/CommentStyle;->applyWeight(Landroid/graphics/Paint;I)Z

    .line 146
    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    invoke-virtual {v0}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    const v1, 0x3f970a3d    # 1.18f

    mul-float v9, v0, v1

    .line 147
    iget-boolean v0, v6, Le/e/a/CommentSettings193$Preview;->animate:Z

    if-eqz v0, :cond_fa

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, v6, Le/e/a/CommentSettings193$Preview;->epoch:J

    sub-long/2addr v0, v2

    iget-object v2, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v2, v2, Le/e/a/CommentAppearance192;->values:[I

    const/4 v3, 0x4

    aget v2, v2, v3

    mul-int/lit16 v2, v2, 0x3e8

    int-to-long v4, v2

    rem-long/2addr v0, v4

    long-to-float v0, v0

    iget-object v1, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v1, v1, Le/e/a/CommentAppearance192;->values:[I

    aget v1, v1, v3

    int-to-float v1, v1

    const/high16 v2, 0x447a0000    # 1000.0f

    mul-float v1, v1, v2

    div-float/2addr v0, v1

    move v10, v0

    goto :goto_100

    :cond_fa
    const v0, 0x3eb33333    # 0.35f

    const v10, 0x3eb33333    # 0.35f

    .line 148
    :goto_100
    const-string v0, "\u8272\u4ed8\u304d\u30b3\u30e1\u30f3\u30c8"

    const-string v1, "\u8907\u6570\u884c\u30b3\u30e1\u30f3\u30c8\n2\u884c\u76ee"

    const-string v2, "\u901a\u5e38\u30b3\u30e1\u30f3\u30c8"

    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    move-result-object v11

    .line 149
    const/4 v12, 0x0

    .line 151
    :goto_10b
    iget-boolean v0, v6, Le/e/a/CommentSettings193$Preview;->dense:Z

    const/4 v1, 0x5

    if-eqz v0, :cond_117

    iget-object v0, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v0, v0, Le/e/a/CommentAppearance192;->values:[I

    aget v0, v0, v1

    goto :goto_118

    :cond_117
    const/4 v0, 0x3

    :goto_118
    if-lt v12, v0, :cond_14c

    .line 152
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3ef5c28f    # 0.48f

    mul-float v3, v0, v1

    const/4 v5, -0x1

    const-string v2, "\u4e0a\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move v4, v9

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings193$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 153
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v0

    int-to-float v0, v0

    const v1, 0x3ed70a3d    # 0.42f

    mul-float v3, v0, v1

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v0

    add-int/lit8 v0, v0, -0x6

    int-to-float v4, v0

    const/16 v5, -0x9a

    const-string v2, "\u4e0b\u56fa\u5b9a\u30b3\u30e1\u30f3\u30c8"

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings193$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 154
    return-void

    .line 156
    :cond_14c
    rem-int/lit8 v0, v12, 0x3

    .line 157
    aget-object v2, v11, v0

    .line 158
    iget-boolean v3, v6, Le/e/a/CommentSettings193$Preview;->animate:Z

    if-eqz v3, :cond_17b

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v3

    int-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v4

    int-to-float v4, v4

    iget-object v5, v6, Le/e/a/CommentSettings193$Preview;->paint:Landroid/graphics/Paint;

    const-string v13, "\\n"

    invoke-virtual {v2, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v13

    aget-object v13, v13, v8

    invoke-virtual {v5, v13}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    move-result v5

    add-float/2addr v4, v5

    int-to-float v5, v12

    const v13, 0x3e2e147b    # 0.17f

    mul-float v5, v5, v13

    add-float/2addr v5, v10

    const/high16 v13, 0x3f800000    # 1.0f

    rem-float/2addr v5, v13

    mul-float v4, v4, v5

    sub-float/2addr v3, v4

    goto :goto_190

    :cond_17b
    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getContext()Landroid/content/Context;

    move-result-object v3

    const/16 v4, 0xc

    invoke-static {v3, v4}, Le/e/a/PanelUi;->dp(Landroid/content/Context;I)I

    move-result v3

    int-to-float v3, v3

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getWidth()I

    move-result v4

    mul-int v4, v4, v0

    int-to-float v4, v4

    mul-float v4, v4, v15

    add-float/2addr v3, v4

    :goto_190
    iget-boolean v4, v6, Le/e/a/CommentSettings193$Preview;->dense:Z

    if-eqz v4, :cond_1bd

    iget-object v4, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

    iget-object v4, v4, Le/e/a/CommentAppearance192;->values:[I

    aget v4, v4, v1

    invoke-static {v7, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    rem-int v4, v12, v4

    int-to-float v4, v4

    invoke-virtual/range {p0 .. p0}, Le/e/a/CommentSettings193$Preview;->getHeight()I

    move-result v5

    int-to-float v5, v5

    sub-float/2addr v5, v9

    iget-object v13, v6, Le/e/a/CommentSettings193$Preview;->draft:Le/e/a/CommentAppearance192;

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

    goto :goto_1c5

    :cond_1bd
    int-to-float v1, v12

    const v4, 0x3fb33333    # 1.4f

    add-float/2addr v1, v4

    mul-float v1, v1, v9

    move v4, v1

    :goto_1c5
    if-ne v0, v7, :cond_1ce

    const v0, -0x9a2b54

    const v5, -0x9a2b54

    goto :goto_1d0

    :cond_1ce
    const/4 v0, -0x1

    const/4 v5, -0x1

    :goto_1d0
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/CommentSettings193$Preview;->draw(Landroid/graphics/Canvas;Ljava/lang/String;FFI)V

    .line 159
    add-int/lit8 v12, v12, 0x1

    .line 150
    goto/16 :goto_10b
.end method

.method protected onMeasure(II)V
    .registers 4

    .line 124
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    move-result p1

    int-to-float p2, p1

    const/high16 v0, 0x41100000    # 9.0f

    mul-float p2, p2, v0

    const/high16 v0, 0x41800000    # 16.0f

    div-float/2addr p2, v0

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    invoke-virtual {p0, p1, p2}, Le/e/a/CommentSettings193$Preview;->setMeasuredDimension(II)V

    return-void
.end method

.method public onWindowFocusChanged(Z)V
    .registers 2

    .line 106
    invoke-super {p0, p1}, Landroid/view/View;->onWindowFocusChanged(Z)V

    .line 107
    if-nez p1, :cond_9

    .line 108
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->stop()V

    goto :goto_11

    .line 109
    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings193$Preview;->animate:Z

    if-eqz p1, :cond_11

    .line 110
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->changed()V

    goto :goto_12

    .line 109
    :cond_11
    :goto_11
    nop

    .line 112
    :goto_12
    return-void
.end method

.method protected onWindowVisibilityChanged(I)V
    .registers 2

    .line 116
    invoke-super {p0, p1}, Landroid/view/View;->onWindowVisibilityChanged(I)V

    .line 117
    if-eqz p1, :cond_9

    .line 118
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->stop()V

    goto :goto_11

    .line 119
    :cond_9
    iget-boolean p1, p0, Le/e/a/CommentSettings193$Preview;->animate:Z

    if-eqz p1, :cond_11

    .line 120
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->changed()V

    goto :goto_12

    .line 119
    :cond_11
    :goto_11
    nop

    .line 122
    :goto_12
    return-void
.end method

.method public run()V
    .registers 3

    .line 85
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->scheduled:Z

    .line 86
    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->invalidate()V

    .line 87
    iget-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->animate:Z

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->isAttachedToWindow()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->getWindowVisibility()I

    move-result v0

    if-nez v0, :cond_24

    invoke-virtual {p0}, Le/e/a/CommentSettings193$Preview;->hasWindowFocus()Z

    move-result v0

    if-eqz v0, :cond_24

    .line 88
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->scheduled:Z

    .line 89
    const-wide/16 v0, 0x22

    invoke-virtual {p0, p0, v0, v1}, Le/e/a/CommentSettings193$Preview;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 91
    :cond_24
    return-void
.end method

.method stop()V
    .registers 2

    .line 94
    invoke-virtual {p0, p0}, Le/e/a/CommentSettings193$Preview;->removeCallbacks(Ljava/lang/Runnable;)Z

    .line 95
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/CommentSettings193$Preview;->scheduled:Z

    .line 96
    return-void
.end method
