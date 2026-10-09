.class final Le/e/a/VideoCounts$CountIcon;
.super Landroid/text/style/ReplacementSpan;
.source "VideoCounts.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/VideoCounts;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "CountIcon"
.end annotation


# instance fields
.field private final color:I

.field private final kind:I


# direct methods
.method constructor <init>(II)V
    .registers 3
    .param p1, "kind"    # I
    .param p2, "color"    # I

    .line 63
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    iput p1, p0, Le/e/a/VideoCounts$CountIcon;->kind:I

    iput p2, p0, Le/e/a/VideoCounts$CountIcon;->color:I

    return-void
.end method


# virtual methods
.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .registers 30
    .param p1, "canvas"    # Landroid/graphics/Canvas;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "x"    # F
    .param p6, "top"    # I
    .param p7, "baseline"    # I
    .param p8, "bottom"    # I
    .param p9, "textPaint"    # Landroid/graphics/Paint;

    .line 71
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Landroid/graphics/Paint;

    move-object/from16 v3, p9

    invoke-direct {v2, v3}, Landroid/graphics/Paint;-><init>(Landroid/graphics/Paint;)V

    .line 72
    .local v2, "paint":Landroid/graphics/Paint;
    iget v4, v0, Le/e/a/VideoCounts$CountIcon;->color:I

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 73
    sget-object v4, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 74
    const/4 v4, 0x1

    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 75
    invoke-virtual {v3}, Landroid/graphics/Paint;->getTextSize()F

    move-result v5

    .line 76
    .local v5, "size":F
    invoke-virtual {v3}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v6

    .line 77
    .local v6, "metrics":Landroid/graphics/Paint$FontMetrics;
    move/from16 v7, p7

    int-to-float v8, v7

    iget v9, v6, Landroid/graphics/Paint$FontMetrics;->ascent:F

    iget v10, v6, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v9, v10

    const/high16 v10, 0x40000000    # 2.0f

    div-float/2addr v9, v10

    add-float/2addr v8, v9

    .line 78
    .local v8, "center":F
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    move-result v9

    .line 79
    .local v9, "saved":I
    div-float v11, v5, v10

    sub-float v11, v8, v11

    move/from16 v12, p5

    invoke-virtual {v1, v12, v11}, Landroid/graphics/Canvas;->translate(FF)V

    .line 80
    const/high16 v11, 0x41c00000    # 24.0f

    div-float v13, v5, v11

    div-float v11, v5, v11

    invoke-virtual {v1, v13, v11}, Landroid/graphics/Canvas;->scale(FF)V

    .line 81
    new-instance v11, Landroid/graphics/Path;

    invoke-direct {v11}, Landroid/graphics/Path;-><init>()V

    move-object v13, v11

    .line 82
    .local v13, "path":Landroid/graphics/Path;
    iget v11, v0, Le/e/a/VideoCounts$CountIcon;->kind:I

    const/high16 v14, 0x41400000    # 12.0f

    const/high16 v15, 0x41b00000    # 22.0f

    const/high16 v10, 0x40400000    # 3.0f

    const/high16 v4, 0x41a80000    # 21.0f

    if-nez v11, :cond_65

    .line 83
    const/high16 v11, 0x40a00000    # 5.0f

    invoke-virtual {v13, v11, v10}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v13, v15, v14}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13, v11, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13}, Landroid/graphics/Path;->close()V

    goto/16 :goto_f7

    .line 84
    :cond_65
    iget v11, v0, Le/e/a/VideoCounts$CountIcon;->kind:I

    const/4 v14, 0x1

    if-ne v11, v14, :cond_89

    .line 85
    invoke-virtual {v13, v10, v10}, Landroid/graphics/Path;->moveTo(FF)V

    invoke-virtual {v13, v4, v10}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v11, 0x41880000    # 17.0f

    invoke-virtual {v13, v4, v11}, Landroid/graphics/Path;->lineTo(FF)V

    .line 86
    const/high16 v4, 0x41300000    # 11.0f

    invoke-virtual {v13, v4, v11}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v4, 0x40c00000    # 6.0f

    invoke-virtual {v13, v4, v15}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13, v4, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13, v10, v11}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13}, Landroid/graphics/Path;->close()V

    goto :goto_f7

    .line 87
    :cond_89
    iget v10, v0, Le/e/a/VideoCounts$CountIcon;->kind:I

    const/4 v11, 0x2

    if-ne v10, v11, :cond_d3

    .line 88
    const/high16 v10, 0x41400000    # 12.0f

    invoke-virtual {v13, v10, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 89
    const/high16 v18, 0x40000000    # 2.0f

    const/high16 v19, 0x41000000    # 8.0f

    const/high16 v14, 0x41200000    # 10.0f

    const/high16 v15, 0x41980000    # 19.0f

    const/high16 v16, 0x40000000    # 2.0f

    const/high16 v17, 0x41500000    # 13.0f

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 90
    const/high16 v18, 0x41400000    # 12.0f

    const/high16 v19, 0x40c00000    # 6.0f

    const/high16 v14, 0x40000000    # 2.0f

    const/high16 v15, 0x40000000    # 2.0f

    const/high16 v16, 0x41100000    # 9.0f

    const/high16 v17, 0x3f800000    # 1.0f

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 91
    const/high16 v18, 0x41b00000    # 22.0f

    const/high16 v19, 0x41000000    # 8.0f

    const/high16 v14, 0x41700000    # 15.0f

    const/high16 v15, 0x3f800000    # 1.0f

    const/high16 v16, 0x41b00000    # 22.0f

    const/high16 v17, 0x40000000    # 2.0f

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 92
    const/high16 v18, 0x41400000    # 12.0f

    const/high16 v19, 0x41a80000    # 21.0f

    const/high16 v14, 0x41b00000    # 22.0f

    const/high16 v15, 0x41500000    # 13.0f

    const/high16 v16, 0x41600000    # 14.0f

    const/high16 v17, 0x41980000    # 19.0f

    invoke-virtual/range {v13 .. v19}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    invoke-virtual {v13}, Landroid/graphics/Path;->close()V

    goto :goto_f7

    .line 93
    :cond_d3
    iget v10, v0, Le/e/a/VideoCounts$CountIcon;->kind:I

    const/4 v11, 0x3

    if-ne v10, v11, :cond_f7

    .line 94
    const/high16 v10, 0x40800000    # 4.0f

    const/high16 v11, 0x40000000    # 2.0f

    invoke-virtual {v13, v11, v10}, Landroid/graphics/Path;->moveTo(FF)V

    const/high16 v14, 0x41200000    # 10.0f

    invoke-virtual {v13, v14, v10}, Landroid/graphics/Path;->lineTo(FF)V

    const/high16 v10, 0x41500000    # 13.0f

    const/high16 v14, 0x40e00000    # 7.0f

    invoke-virtual {v13, v10, v14}, Landroid/graphics/Path;->lineTo(FF)V

    .line 95
    invoke-virtual {v13, v15, v14}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13, v15, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13, v11, v4}, Landroid/graphics/Path;->lineTo(FF)V

    invoke-virtual {v13}, Landroid/graphics/Path;->close()V

    .line 97
    :cond_f7
    :goto_f7
    invoke-virtual {v1, v13, v2}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 98
    invoke-virtual {v1, v9}, Landroid/graphics/Canvas;->restoreToCount(I)V

    .line 99
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .registers 8
    .param p1, "paint"    # Landroid/graphics/Paint;
    .param p2, "text"    # Ljava/lang/CharSequence;
    .param p3, "start"    # I
    .param p4, "end"    # I
    .param p5, "fm"    # Landroid/graphics/Paint$FontMetricsInt;

    .line 66
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    move-result v0

    float-to-double v0, v0

    invoke-static {v0, v1}, Ljava/lang/Math;->ceil(D)D

    move-result-wide v0

    double-to-int v0, v0

    return v0
.end method
