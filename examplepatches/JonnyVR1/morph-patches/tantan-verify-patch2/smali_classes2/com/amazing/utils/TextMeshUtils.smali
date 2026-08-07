.class public Lcom/amazing/utils/TextMeshUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static callIStaticGenerateBitmapForEmoji([BI)Landroid/graphics/Bitmap;
    .locals 4
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 4
    .line 5
    .line 6
    new-instance p0, Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 9
    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 13
    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 17
    .line 18
    .line 19
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 22
    .line 23
    .line 24
    sget-object p1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 25
    .line 26
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 27
    .line 28
    .line 29
    new-instance p1, Landroid/graphics/Rect;

    .line 30
    .line 31
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v1, 0x0

    .line 35
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p0, v0, v1, v2, p1}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Landroid/graphics/Rect;->width()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-virtual {p1}, Landroid/graphics/Rect;->height()I

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 51
    .line 52
    invoke-static {v1, v2, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    new-instance v2, Landroid/graphics/Canvas;

    .line 57
    .line 58
    invoke-direct {v2, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 59
    .line 60
    .line 61
    iget v3, p1, Landroid/graphics/Rect;->left:I

    .line 62
    .line 63
    neg-int v3, v3

    .line 64
    int-to-float v3, v3

    .line 65
    iget p1, p1, Landroid/graphics/Rect;->top:I

    .line 66
    .line 67
    neg-int p1, p1

    .line 68
    int-to-float p1, p1

    .line 69
    invoke-virtual {v2, v0, v3, p1, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/graphics/Canvas;->save()I

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2}, Landroid/graphics/Canvas;->restore()V

    .line 76
    .line 77
    .line 78
    return-object v1
.end method

.method private static callIStaticGenerateBitmapFromTextMesh([BLjava/lang/String;IIIFIFIFFFIIII)Landroid/graphics/Bitmap;
    .locals 19
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    move/from16 v0, p4

    move/from16 v1, p13

    move/from16 v2, p14

    move/from16 v3, p15

    .line 1
    new-instance v4, Ljava/lang/String;

    move-object/from16 v5, p0

    invoke-direct {v4, v5}, Ljava/lang/String;-><init>([B)V

    .line 2
    new-instance v5, Landroid/graphics/Rect;

    const/4 v6, 0x0

    invoke-direct {v5, v6, v6, v2, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 3
    sget-object v7, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    invoke-static {v2, v3, v7}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 4
    new-instance v3, Landroid/graphics/Paint;

    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 5
    invoke-virtual {v3, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    sget-object v7, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 7
    new-instance v3, Landroid/graphics/Canvas;

    invoke-direct {v3, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 8
    new-instance v8, Landroid/text/TextPaint;

    invoke-direct {v8}, Landroid/text/TextPaint;-><init>()V

    move/from16 v9, p3

    .line 9
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setColor(I)V

    move/from16 v9, p2

    int-to-float v9, v9

    .line 10
    invoke-virtual {v8, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    const/4 v10, 0x1

    .line 11
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    if-nez v1, :cond_0

    .line 13
    sget-object v7, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    :cond_0
    if-ne v1, v10, :cond_1

    .line 14
    sget-object v7, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    goto :goto_0

    .line 15
    :cond_1
    sget-object v7, Landroid/graphics/Paint$Align;->RIGHT:Landroid/graphics/Paint$Align;

    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    :goto_0
    and-int/lit8 v7, p6, 0x10

    const/16 v11, 0x10

    if-ne v7, v11, :cond_2

    .line 16
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setUnderlineText(Z)V

    :cond_2
    and-int/lit8 v7, p6, 0x20

    const/16 v11, 0x20

    if-ne v7, v11, :cond_3

    .line 17
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setStrikeThruText(Z)V

    :cond_3
    and-int/lit8 v7, p6, 0x4

    const/4 v11, 0x4

    if-ne v7, v11, :cond_4

    move/from16 v7, p5

    neg-float v7, v7

    const/high16 v11, 0x42b40000    # 90.0f

    div-float/2addr v7, v11

    .line 18
    invoke-virtual {v8, v7}, Landroid/graphics/Paint;->setTextSkewX(F)V

    :cond_4
    and-int/lit8 v7, p6, 0x8

    const/16 v11, 0x8

    if-ne v7, v11, :cond_5

    .line 19
    invoke-virtual {v8, v10}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    :cond_5
    and-int/lit8 v7, p6, 0x2

    const/4 v11, 0x2

    if-ne v7, v11, :cond_6

    move/from16 v7, p9

    move/from16 v11, p10

    move/from16 v12, p11

    move/from16 v13, p12

    .line 20
    invoke-virtual {v8, v7, v11, v12, v13}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 21
    :cond_6
    invoke-virtual {v8}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    move-result-object v7

    .line 22
    iget v11, v7, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 23
    iget v12, v7, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 24
    const-string v13, "\n"

    invoke-virtual {v4, v13}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v4

    .line 25
    array-length v13, v4

    and-int/lit8 v14, p6, 0x1

    const v16, 0x3dcccccd    # 0.1f

    const/high16 v17, 0x40000000    # 2.0f

    if-ne v14, v10, :cond_a

    .line 26
    new-instance v14, Landroid/text/TextPaint;

    invoke-direct {v14}, Landroid/text/TextPaint;-><init>()V

    move/from16 v15, p8

    const-wide/high16 p0, 0x3fe0000000000000L    # 0.5

    .line 27
    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setColor(I)V

    .line 28
    invoke-virtual {v8}, Landroid/graphics/Paint;->getTextSize()F

    move-result v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 29
    invoke-virtual {v8}, Landroid/graphics/Paint;->isAntiAlias()Z

    move-result v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 30
    sget-object v15, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    const/high16 v15, 0x40a00000    # 5.0f

    mul-float v15, v15, p7

    div-float/2addr v15, v9

    .line 31
    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 32
    invoke-virtual {v8}, Landroid/graphics/Paint;->getTextAlign()Landroid/graphics/Paint$Align;

    move-result-object v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 33
    invoke-virtual {v8}, Landroid/graphics/Paint;->getTextSkewX()F

    move-result v15

    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 34
    invoke-virtual {v8, v6}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 35
    invoke-virtual {v14, v10}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    int-to-float v15, v0

    div-float/2addr v15, v9

    .line 36
    iget v6, v7, Landroid/graphics/Paint$FontMetrics;->ascent:F

    neg-float v6, v6

    iget v10, v7, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v6, v10

    mul-float v10, v6, v16

    move-object/from16 p14, v2

    const/4 v2, 0x0

    :goto_1
    move-object/from16 p3, v4

    if-ge v2, v13, :cond_9

    .line 37
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    div-float v18, v11, v17

    sub-float v4, v4, v18

    div-float v18, v12, v17

    sub-float v4, v4, v18

    float-to-int v4, v4

    move/from16 v18, v9

    move/from16 p5, v10

    int-to-double v9, v4

    add-int/lit8 v4, v13, -0x1

    move-wide/from16 p6, v9

    int-to-double v9, v4

    mul-double v9, v9, p0

    move-wide/from16 p8, v9

    int-to-double v9, v2

    sub-double v9, p8, v9

    add-float v4, p5, v6

    move-wide/from16 p8, v9

    float-to-double v9, v4

    mul-double v9, v9, p8

    sub-double v9, p6, v9

    double-to-int v4, v9

    .line 38
    invoke-virtual {v14, v15}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    if-nez v1, :cond_7

    .line 39
    aget-object v9, p3, v2

    iget v10, v5, Landroid/graphics/Rect;->left:I

    int-to-float v10, v10

    int-to-float v4, v4

    invoke-virtual {v3, v9, v10, v4, v14}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_2

    :cond_7
    const/4 v9, 0x1

    if-ne v1, v9, :cond_8

    .line 40
    aget-object v9, p3, v2

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v10

    int-to-float v10, v10

    int-to-float v4, v4

    invoke-virtual {v3, v9, v10, v4, v14}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_2

    .line 41
    :cond_8
    aget-object v9, p3, v2

    iget v10, v5, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    int-to-float v4, v4

    invoke-virtual {v3, v9, v10, v4, v14}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :goto_2
    add-int/lit8 v2, v2, 0x1

    move-object/from16 v4, p3

    move/from16 v10, p5

    move/from16 v9, v18

    goto :goto_1

    :cond_9
    :goto_3
    move/from16 v18, v9

    goto :goto_4

    :cond_a
    move-object/from16 p14, v2

    const-wide/high16 p0, 0x3fe0000000000000L    # 0.5

    move-object/from16 p3, v4

    goto :goto_3

    :goto_4
    int-to-float v0, v0

    div-float v0, v0, v18

    .line 42
    iget v2, v7, Landroid/graphics/Paint$FontMetrics;->ascent:F

    neg-float v2, v2

    iget v4, v7, Landroid/graphics/Paint$FontMetrics;->descent:F

    add-float/2addr v2, v4

    mul-float v16, v16, v2

    const/4 v6, 0x0

    :goto_5
    if-ge v6, v13, :cond_d

    .line 43
    invoke-virtual {v5}, Landroid/graphics/Rect;->centerY()I

    move-result v4

    int-to-float v4, v4

    div-float v7, v11, v17

    sub-float/2addr v4, v7

    div-float v7, v12, v17

    sub-float/2addr v4, v7

    float-to-int v4, v4

    int-to-double v9, v4

    add-int/lit8 v4, v13, -0x1

    int-to-double v14, v4

    mul-double v14, v14, p0

    move-wide/from16 p4, v9

    int-to-double v9, v6

    sub-double/2addr v14, v9

    add-float v4, v16, v2

    float-to-double v9, v4

    mul-double/2addr v14, v9

    sub-double v9, p4, v14

    double-to-int v4, v9

    .line 44
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    if-nez v1, :cond_b

    .line 45
    aget-object v7, p3, v6

    iget v9, v5, Landroid/graphics/Rect;->left:I

    int-to-float v9, v9

    int-to-float v4, v4

    invoke-virtual {v3, v7, v9, v4, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    const/4 v9, 0x1

    goto :goto_6

    :cond_b
    const/4 v9, 0x1

    if-ne v1, v9, :cond_c

    .line 46
    aget-object v7, p3, v6

    invoke-virtual {v5}, Landroid/graphics/Rect;->centerX()I

    move-result v10

    int-to-float v10, v10

    int-to-float v4, v4

    invoke-virtual {v3, v7, v10, v4, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    goto :goto_6

    .line 47
    :cond_c
    aget-object v7, p3, v6

    iget v10, v5, Landroid/graphics/Rect;->right:I

    int-to-float v10, v10

    int-to-float v4, v4

    invoke-virtual {v3, v7, v10, v4, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    :goto_6
    add-int/lit8 v6, v6, 0x1

    goto :goto_5

    .line 48
    :cond_d
    invoke-virtual {v3}, Landroid/graphics/Canvas;->save()I

    .line 49
    invoke-virtual {v3}, Landroid/graphics/Canvas;->restore()V

    return-object p14
.end method

.method private static drawKernedText(Landroid/graphics/Canvas;Ljava/lang/String;FFLandroid/graphics/Paint;I)I
    .locals 10

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 7
    .line 8
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    const-string v3, "the text space is: %d\n"

    .line 17
    .line 18
    invoke-virtual {v1, v3, v2}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 19
    .line 20
    .line 21
    sget-object v1, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 22
    .line 23
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    const-string v3, "the text length is: %d\n"

    .line 36
    .line 37
    invoke-virtual {v1, v3, v2}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 38
    .line 39
    .line 40
    const/4 v1, 0x0

    .line 41
    move v2, v1

    .line 42
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-ge v1, v3, :cond_7

    .line 47
    .line 48
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v4

    .line 56
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v5

    .line 60
    invoke-virtual {p4, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 61
    .line 62
    .line 63
    move-result v5

    .line 64
    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    .line 65
    .line 66
    .line 67
    const v5, 0xd800

    .line 68
    .line 69
    .line 70
    const/4 v6, 0x1

    .line 71
    if-le v3, v5, :cond_2

    .line 72
    .line 73
    add-int/lit8 v4, v1, 0x1

    .line 74
    .line 75
    new-instance v5, Ljava/lang/StringBuilder;

    .line 76
    .line 77
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 78
    .line 79
    .line 80
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v4}, Ljava/lang/String;->charAt(I)C

    .line 88
    .line 89
    .line 90
    move-result v3

    .line 91
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 95
    .line 96
    .line 97
    move-result-object v3

    .line 98
    if-ne v4, v6, :cond_0

    .line 99
    .line 100
    goto :goto_1

    .line 101
    :cond_0
    add-int/lit8 v1, v1, 0x2

    .line 102
    .line 103
    invoke-virtual {p4, p1, v4, v1, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 107
    .line 108
    .line 109
    :goto_1
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    div-int/lit8 v5, p5, 0x2

    .line 114
    .line 115
    add-int/2addr v1, v5

    .line 116
    int-to-float v5, v1

    .line 117
    add-float/2addr p2, v5

    .line 118
    add-int/2addr v2, v1

    .line 119
    if-eqz p0, :cond_1

    .line 120
    .line 121
    invoke-virtual {p0, v3, p2, p3, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 122
    .line 123
    .line 124
    :cond_1
    move v1, v4

    .line 125
    goto/16 :goto_5

    .line 126
    .line 127
    :cond_2
    const/16 v5, 0x20

    .line 128
    .line 129
    if-ne v3, v5, :cond_3

    .line 130
    .line 131
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    invoke-virtual {p4, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    add-int/2addr v3, p5

    .line 148
    goto :goto_4

    .line 149
    :cond_3
    add-int/lit8 v5, v1, 0x1

    .line 150
    .line 151
    invoke-virtual {p4, p1, v1, v5, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 152
    .line 153
    .line 154
    const/16 v5, 0x80

    .line 155
    .line 156
    if-ge v3, v5, :cond_5

    .line 157
    .line 158
    invoke-static {v4}, Lcom/amazing/utils/TextMeshUtils;->isNumOrLetters(Ljava/lang/String;)Z

    .line 159
    .line 160
    .line 161
    move-result v4

    .line 162
    if-eqz v4, :cond_4

    .line 163
    .line 164
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    add-int/2addr v4, p5

    .line 169
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 170
    .line 171
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 172
    .line 173
    .line 174
    move-result-object v3

    .line 175
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object v3

    .line 179
    const-string v7, "%s is NumOrLetters\n"

    .line 180
    .line 181
    invoke-virtual {v5, v7, v3}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 182
    .line 183
    .line 184
    :goto_2
    move v3, v4

    .line 185
    goto :goto_3

    .line 186
    :cond_4
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 187
    .line 188
    .line 189
    move-result v3

    .line 190
    mul-int/lit8 v4, p5, 0x2

    .line 191
    .line 192
    add-int/2addr v3, v4

    .line 193
    goto :goto_3

    .line 194
    :cond_5
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 195
    .line 196
    .line 197
    move-result v4

    .line 198
    div-int/lit8 v5, p5, 0x2

    .line 199
    .line 200
    add-int/2addr v4, v5

    .line 201
    sget-object v5, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 202
    .line 203
    invoke-static {v3}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 204
    .line 205
    .line 206
    move-result-object v3

    .line 207
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v3

    .line 211
    const-string v7, "%s is not NumOrLetters\n"

    .line 212
    .line 213
    invoke-virtual {v5, v7, v3}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :goto_3
    sget-object v4, Ljava/lang/System;->out:Ljava/io/PrintStream;

    .line 218
    .line 219
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    invoke-static {v5}, Ljava/lang/Character;->valueOf(C)Ljava/lang/Character;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v7

    .line 231
    invoke-static {p5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 232
    .line 233
    .line 234
    move-result-object v8

    .line 235
    invoke-virtual {v0}, Landroid/graphics/Rect;->width()I

    .line 236
    .line 237
    .line 238
    move-result v9

    .line 239
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 240
    .line 241
    .line 242
    move-result-object v9

    .line 243
    filled-new-array {v5, v7, v8, v9}, [Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v5

    .line 247
    const-string v7, "%s is: %d, space is: %d, text is %d\n"

    .line 248
    .line 249
    invoke-virtual {v4, v7, v5}, Ljava/io/PrintStream;->printf(Ljava/lang/String;[Ljava/lang/Object;)Ljava/io/PrintStream;

    .line 250
    .line 251
    .line 252
    :goto_4
    int-to-float v4, v3

    .line 253
    add-float/2addr p2, v4

    .line 254
    add-int/2addr v2, v3

    .line 255
    if-eqz p0, :cond_6

    .line 256
    .line 257
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 258
    .line 259
    .line 260
    move-result v3

    .line 261
    invoke-static {v3}, Ljava/lang/String;->valueOf(C)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    invoke-virtual {p0, v3, p2, p3, p4}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 266
    .line 267
    .line 268
    :cond_6
    :goto_5
    add-int/2addr v1, v6

    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :cond_7
    return v2
.end method

.method private static generateImage(Ljava/lang/String;F[BIZFIZFFIF)Landroid/graphics/Bitmap;
    .locals 10
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/String;-><init>([B)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/text/TextPaint;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 16
    .line 17
    .line 18
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 19
    .line 20
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    .line 22
    .line 23
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 24
    .line 25
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v2}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    new-array v3, v3, [F

    .line 41
    .line 42
    invoke-virtual {p2, p0, v3}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    const/4 v5, 0x0

    .line 50
    invoke-virtual {p2, p0, v5, v4, v2}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 51
    .line 52
    .line 53
    aget v3, v3, v5

    .line 54
    .line 55
    const/4 v3, 0x0

    .line 56
    if-nez p4, :cond_0

    .line 57
    .line 58
    move v4, v3

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    move v4, p5

    .line 61
    :goto_0
    if-nez p7, :cond_1

    .line 62
    .line 63
    move v5, v3

    .line 64
    move v6, v5

    .line 65
    goto :goto_1

    .line 66
    :cond_1
    move/from16 v3, p8

    .line 67
    .line 68
    move/from16 v5, p9

    .line 69
    .line 70
    move/from16 v6, p11

    .line 71
    .line 72
    :goto_1
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result v8

    .line 80
    invoke-static {v7, v8}, Ljava/lang/Math;->max(FF)F

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    add-float/2addr v7, v4

    .line 85
    new-instance v8, Landroid/text/TextPaint;

    .line 86
    .line 87
    invoke-direct {v8}, Landroid/text/TextPaint;-><init>()V

    .line 88
    .line 89
    .line 90
    const/high16 v9, 0x40000000    # 2.0f

    .line 91
    .line 92
    if-nez p4, :cond_2

    .line 93
    .line 94
    if-eqz p7, :cond_3

    .line 95
    .line 96
    :cond_2
    invoke-virtual {v8, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 100
    .line 101
    .line 102
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 103
    .line 104
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {v8, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 108
    .line 109
    .line 110
    mul-float/2addr v4, v9

    .line 111
    mul-float/2addr v4, p1

    .line 112
    invoke-virtual {v8, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 113
    .line 114
    .line 115
    move/from16 v0, p6

    .line 116
    .line 117
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 118
    .line 119
    .line 120
    if-eqz p7, :cond_3

    .line 121
    .line 122
    mul-float/2addr v6, p1

    .line 123
    mul-float/2addr v3, p1

    .line 124
    mul-float/2addr v5, p1

    .line 125
    move/from16 v0, p10

    .line 126
    .line 127
    invoke-virtual {v8, v6, v3, v5, v0}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 128
    .line 129
    .line 130
    :cond_3
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    int-to-float v0, v0

    .line 135
    mul-float/2addr v9, v7

    .line 136
    mul-float/2addr v9, p1

    .line 137
    add-float/2addr v0, v9

    .line 138
    float-to-int v0, v0

    .line 139
    invoke-virtual {v2}, Landroid/graphics/Rect;->height()I

    .line 140
    .line 141
    .line 142
    move-result v1

    .line 143
    int-to-float v1, v1

    .line 144
    add-float/2addr v1, v9

    .line 145
    float-to-int v1, v1

    .line 146
    sget-object v3, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 147
    .line 148
    invoke-static {v0, v1, v3}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Landroid/graphics/Canvas;

    .line 153
    .line 154
    invoke-direct {v1, v0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 155
    .line 156
    .line 157
    if-nez p4, :cond_4

    .line 158
    .line 159
    if-eqz p7, :cond_5

    .line 160
    .line 161
    :cond_4
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 162
    .line 163
    neg-int v3, v3

    .line 164
    int-to-float v3, v3

    .line 165
    mul-float v4, v7, p1

    .line 166
    .line 167
    add-float/2addr v3, v4

    .line 168
    iget v5, v2, Landroid/graphics/Rect;->top:I

    .line 169
    .line 170
    neg-int v5, v5

    .line 171
    int-to-float v5, v5

    .line 172
    add-float/2addr v5, v4

    .line 173
    invoke-virtual {v1, p0, v3, v5, v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 174
    .line 175
    .line 176
    :cond_5
    iget v3, v2, Landroid/graphics/Rect;->left:I

    .line 177
    .line 178
    neg-int v3, v3

    .line 179
    int-to-float v3, v3

    .line 180
    mul-float/2addr v7, p1

    .line 181
    add-float/2addr v3, v7

    .line 182
    iget p1, v2, Landroid/graphics/Rect;->top:I

    .line 183
    .line 184
    neg-int p1, p1

    .line 185
    int-to-float p1, p1

    .line 186
    add-float/2addr p1, v7

    .line 187
    invoke-virtual {v1, p0, v3, p1, p2}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v1}, Landroid/graphics/Canvas;->save()I

    .line 191
    .line 192
    .line 193
    invoke-virtual {v1}, Landroid/graphics/Canvas;->restore()V

    .line 194
    .line 195
    .line 196
    return-object v0
.end method

.method private static generateImageSize(Ljava/lang/String;F[BIZFIZFFIF)[F
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    new-instance p0, Ljava/lang/String;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Ljava/lang/String;-><init>([B)V

    .line 4
    .line 5
    .line 6
    new-instance p2, Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-direct {p2}, Landroid/text/TextPaint;-><init>()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p2, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 12
    .line 13
    .line 14
    const/4 p6, 0x1

    .line 15
    invoke-virtual {p2, p6}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 16
    .line 17
    .line 18
    sget-object p10, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 19
    .line 20
    invoke-virtual {p2, p10}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    .line 22
    .line 23
    sget-object p10, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 24
    .line 25
    invoke-virtual {p2, p10}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    new-instance p3, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {p3}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 37
    .line 38
    .line 39
    move-result p10

    .line 40
    new-array p10, p10, [F

    .line 41
    .line 42
    invoke-virtual {p2, p0, p10}, Landroid/graphics/Paint;->getTextWidths(Ljava/lang/String;[F)I

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 46
    .line 47
    .line 48
    move-result p11

    .line 49
    const/4 v0, 0x0

    .line 50
    invoke-virtual {p2, p0, v0, p11, p3}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 51
    .line 52
    .line 53
    const/4 p0, 0x0

    .line 54
    if-nez p4, :cond_0

    .line 55
    .line 56
    move p5, p0

    .line 57
    :cond_0
    if-nez p7, :cond_1

    .line 58
    .line 59
    move p8, p0

    .line 60
    move p9, p8

    .line 61
    :cond_1
    invoke-static {p8}, Ljava/lang/Math;->abs(F)F

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    invoke-static {p9}, Ljava/lang/Math;->abs(F)F

    .line 66
    .line 67
    .line 68
    move-result p4

    .line 69
    invoke-static {p0, p4}, Ljava/lang/Math;->max(FF)F

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    add-float/2addr p5, p0

    .line 74
    iget p0, p3, Landroid/graphics/Rect;->left:I

    .line 75
    .line 76
    int-to-float p0, p0

    .line 77
    iget p4, p3, Landroid/graphics/Rect;->right:I

    .line 78
    .line 79
    int-to-float p4, p4

    .line 80
    iget p7, p3, Landroid/graphics/Rect;->bottom:I

    .line 81
    .line 82
    neg-int p7, p7

    .line 83
    int-to-float p7, p7

    .line 84
    iget p3, p3, Landroid/graphics/Rect;->top:I

    .line 85
    .line 86
    neg-int p3, p3

    .line 87
    int-to-float p3, p3

    .line 88
    aget p8, p10, v0

    .line 89
    .line 90
    mul-float/2addr p5, p1

    .line 91
    invoke-virtual {p2}, Landroid/graphics/Paint;->ascent()F

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    invoke-virtual {p2}, Landroid/graphics/Paint;->descent()F

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    const/16 p9, 0x8

    .line 100
    .line 101
    new-array p9, p9, [F

    .line 102
    .line 103
    aput p0, p9, v0

    .line 104
    .line 105
    aput p4, p9, p6

    .line 106
    .line 107
    const/4 p0, 0x2

    .line 108
    aput p7, p9, p0

    .line 109
    .line 110
    const/4 p0, 0x3

    .line 111
    aput p3, p9, p0

    .line 112
    .line 113
    const/4 p0, 0x4

    .line 114
    aput p8, p9, p0

    .line 115
    .line 116
    const/4 p0, 0x5

    .line 117
    aput p5, p9, p0

    .line 118
    .line 119
    const/4 p0, 0x6

    .line 120
    aput p1, p9, p0

    .line 121
    .line 122
    const/4 p0, 0x7

    .line 123
    aput p2, p9, p0

    .line 124
    .line 125
    return-object p9
.end method

.method private static getAndroidSystemFontPaths()[Ljava/lang/String;
    .locals 10
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    invoke-static {}, Landroid/util/Xml;->newPullParser()Lorg/xmlpull/v1/XmlPullParser;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    new-instance v2, Ljava/io/File;

    .line 7
    .line 8
    const-string v3, "/system/etc/fonts.xml"

    .line 9
    .line 10
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v3, Ljava/io/FileInputStream;

    .line 14
    .line 15
    invoke-direct {v3, v2}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 16
    .line 17
    .line 18
    :try_start_1
    const-string v2, "utf-8"

    .line 19
    .line 20
    invoke-interface {v1, v3, v2}, Lorg/xmlpull/v1/XmlPullParser;->setInput(Ljava/io/InputStream;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 24
    .line 25
    .line 26
    move-result v2

    .line 27
    new-instance v4, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    new-instance v5, Ljava/util/ArrayList;

    .line 33
    .line 34
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    .line 37
    move-object v6, v0

    .line 38
    :goto_0
    const/4 v7, 0x1

    .line 39
    if-eq v2, v7, :cond_9

    .line 40
    .line 41
    const/4 v7, 0x2

    .line 42
    const-string v8, "family"

    .line 43
    .line 44
    if-eq v2, v7, :cond_7

    .line 45
    .line 46
    const/4 v7, 0x3

    .line 47
    if-eq v2, v7, :cond_1

    .line 48
    .line 49
    const/4 v7, 0x4

    .line 50
    if-eq v2, v7, :cond_0

    .line 51
    .line 52
    goto/16 :goto_3

    .line 53
    .line 54
    :cond_0
    :try_start_2
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getText()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v6

    .line 58
    goto/16 :goto_3

    .line 59
    .line 60
    :catchall_0
    move-exception v0

    .line 61
    goto/16 :goto_4

    .line 62
    .line 63
    :cond_1
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v2

    .line 71
    if-eqz v2, :cond_5

    .line 72
    .line 73
    const/4 v2, 0x0

    .line 74
    move v7, v2

    .line 75
    :goto_1
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 76
    .line 77
    .line 78
    move-result v8

    .line 79
    if-ge v7, v8, :cond_3

    .line 80
    .line 81
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    check-cast v8, Ljava/lang/String;

    .line 86
    .line 87
    const-string v9, "Regular"

    .line 88
    .line 89
    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 90
    .line 91
    .line 92
    move-result v8

    .line 93
    if-eqz v8, :cond_2

    .line 94
    .line 95
    goto :goto_2

    .line 96
    :cond_2
    add-int/lit8 v7, v7, 0x1

    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_3
    const/4 v7, -0x1

    .line 100
    :goto_2
    new-instance v8, Ljava/lang/String;

    .line 101
    .line 102
    const-string v9, "/system/fonts/"

    .line 103
    .line 104
    invoke-direct {v8, v9}, Ljava/lang/String;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    if-ltz v7, :cond_4

    .line 108
    .line 109
    invoke-interface {v5, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Ljava/lang/String;

    .line 114
    .line 115
    invoke-virtual {v8, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :cond_4
    invoke-interface {v5, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v8, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    invoke-interface {v4, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    goto :goto_3

    .line 137
    :cond_5
    const-string v2, "font"

    .line 138
    .line 139
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v2

    .line 147
    if-eqz v2, :cond_6

    .line 148
    .line 149
    invoke-interface {v5, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_6
    const-string v2, "familyset"

    .line 154
    .line 155
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-virtual {v2, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_8

    .line 164
    .line 165
    const-string v6, "ending"

    .line 166
    .line 167
    goto :goto_3

    .line 168
    :cond_7
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v8, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v2

    .line 176
    if-eqz v2, :cond_8

    .line 177
    .line 178
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 179
    .line 180
    .line 181
    :cond_8
    :goto_3
    invoke-interface {v1}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 182
    .line 183
    .line 184
    move-result v2

    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_9
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 188
    .line 189
    .line 190
    move-result v1

    .line 191
    new-array v1, v1, [Ljava/lang/String;

    .line 192
    .line 193
    invoke-interface {v4, v1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_3
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 194
    .line 195
    .line 196
    :try_start_3
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 197
    .line 198
    .line 199
    :catch_0
    return-object v1

    .line 200
    :catchall_1
    move-exception v1

    .line 201
    move-object v3, v0

    .line 202
    move-object v0, v1

    .line 203
    goto :goto_4

    .line 204
    :catch_1
    move-object v3, v0

    .line 205
    goto :goto_5

    .line 206
    :goto_4
    if-eqz v3, :cond_a

    .line 207
    .line 208
    :try_start_4
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 209
    .line 210
    .line 211
    :catch_2
    :cond_a
    throw v0

    .line 212
    :catch_3
    :goto_5
    if-eqz v3, :cond_b

    .line 213
    .line 214
    :try_start_5
    invoke-virtual {v3}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_4

    .line 215
    .line 216
    .line 217
    :catch_4
    :cond_b
    return-object v0
.end method

.method private static getDeviceDpi()F
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    invoke-static {}, Landroid/content/res/Resources;->getSystem()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget v0, v0, Landroid/util/DisplayMetrics;->densityDpi:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    return v0
.end method

.method public static isNumOrLetters(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "^[A-Za-z0-9_]+$"

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ljava/util/regex/Matcher;->matches()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
