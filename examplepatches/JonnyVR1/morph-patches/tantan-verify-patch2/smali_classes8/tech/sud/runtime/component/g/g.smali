.class public Ltech/sud/runtime/component/g/g;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private final a:Ltech/sud/runtime/core/g;

.field private final b:Ltech/sud/runtime/component/g/a;

.field private c:Landroid/text/TextPaint;

.field private d:I

.field private e:I

.field private f:Z


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/g;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ltech/sud/runtime/component/g/g;->a:Ltech/sud/runtime/core/g;

    .line 5
    .line 6
    invoke-virtual {p1}, Ltech/sud/runtime/core/g;->b()Ltech/sud/runtime/component/g/a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Ltech/sud/runtime/component/g/g;->b:Ltech/sud/runtime/component/g/a;

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 14
    .line 15
    return-void
.end method

.method private static a(I)I
    .locals 1

    const v0, 0xffffff

    and-int/2addr p0, v0

    const/high16 v0, -0x1000000

    or-int/2addr p0, v0

    return p0
.end method


# virtual methods
.method public cutTextWithWidth(Ljava/lang/String;F)I
    .locals 3

    .line 1
    iget-object v0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setSubpixelText(Z)V

    .line 5
    .line 6
    .line 7
    const/16 v0, 0x9

    .line 8
    .line 9
    const/16 v2, 0x20

    .line 10
    .line 11
    invoke-virtual {p1, v0, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iget-object p0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 16
    .line 17
    const/4 v0, 0x0

    .line 18
    invoke-virtual {p0, p1, v1, p2, v0}, Landroid/graphics/Paint;->breakText(Ljava/lang/String;ZF[F)I

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    const/4 p2, 0x0

    .line 23
    invoke-virtual {p1, p2, p0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    array-length p0, p0

    .line 32
    return p0
.end method

.method public fontAscent()F
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/g/g;->e:I

    .line 2
    .line 3
    neg-int p0, p0

    .line 4
    int-to-float p0, p0

    .line 5
    return p0
.end method

.method public fontDescent()F
    .locals 1

    .line 1
    iget v0, p0, Ltech/sud/runtime/component/g/g;->d:I

    .line 2
    .line 3
    iget p0, p0, Ltech/sud/runtime/component/g/g;->e:I

    .line 4
    .line 5
    neg-int p0, p0

    .line 6
    sub-int/2addr v0, p0

    .line 7
    int-to-float p0, v0

    .line 8
    return p0
.end method

.method public generateTextBitmapData(Ljava/lang/String;IZFF)V
    .locals 12

    .line 1
    move/from16 v0, p4

    .line 2
    .line 3
    const/16 v1, 0x9

    .line 4
    .line 5
    const/16 v2, 0x20

    .line 6
    .line 7
    invoke-virtual {p1, v1, v2}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v4

    .line 11
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 12
    .line 13
    invoke-virtual {p1, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget v1, p0, Ltech/sud/runtime/component/g/g;->d:I

    .line 22
    .line 23
    if-eqz p3, :cond_0

    .line 24
    .line 25
    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    add-int/2addr p1, v2

    .line 30
    add-int/2addr v1, v2

    .line 31
    :cond_0
    move v10, v1

    .line 32
    if-eqz p1, :cond_6

    .line 33
    .line 34
    if-eqz v10, :cond_6

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    if-eqz p3, :cond_1

    .line 38
    .line 39
    cmpl-float v2, v0, v1

    .line 40
    .line 41
    if-nez v2, :cond_1

    .line 42
    .line 43
    goto/16 :goto_3

    .line 44
    .line 45
    :cond_1
    int-to-float v2, p1

    .line 46
    mul-float v3, v2, p5

    .line 47
    .line 48
    float-to-int v3, v3

    .line 49
    int-to-float v5, v10

    .line 50
    mul-float v6, v5, p5

    .line 51
    .line 52
    float-to-int v6, v6

    .line 53
    iget-object v7, p0, Ltech/sud/runtime/component/g/g;->b:Ltech/sud/runtime/component/g/a;

    .line 54
    .line 55
    invoke-virtual {v7}, Ltech/sud/runtime/component/g/a;->b()I

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    if-le v3, v7, :cond_2

    .line 60
    .line 61
    int-to-float v3, v7

    .line 62
    div-float/2addr v3, v2

    .line 63
    move v2, v7

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    move v2, v3

    .line 66
    move/from16 v3, p5

    .line 67
    .line 68
    :goto_0
    if-le v6, v7, :cond_3

    .line 69
    .line 70
    int-to-float v6, v7

    .line 71
    div-float v5, v6, v5

    .line 72
    .line 73
    move v11, v7

    .line 74
    goto :goto_1

    .line 75
    :cond_3
    move/from16 v5, p5

    .line 76
    .line 77
    move v11, v6

    .line 78
    :goto_1
    iget-object v6, p0, Ltech/sud/runtime/component/g/g;->b:Ltech/sud/runtime/component/g/a;

    .line 79
    .line 80
    invoke-virtual {v6, v2, v11}, Ltech/sud/runtime/component/g/a;->a(II)Landroid/graphics/Canvas;

    .line 81
    .line 82
    .line 83
    move-result-object v6

    .line 84
    const/4 v7, 0x0

    .line 85
    invoke-virtual {v6, v7}, Landroid/graphics/Canvas;->setMatrix(Landroid/graphics/Matrix;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v6, v3, v5}, Landroid/graphics/Canvas;->scale(FF)V

    .line 89
    .line 90
    .line 91
    if-eqz p3, :cond_4

    .line 92
    .line 93
    cmpl-float v1, v0, v1

    .line 94
    .line 95
    if-eqz v1, :cond_4

    .line 96
    .line 97
    const/high16 v1, 0x3f000000    # 0.5f

    .line 98
    .line 99
    mul-float/2addr v1, v0

    .line 100
    invoke-virtual {v6, v1, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 101
    .line 102
    .line 103
    :cond_4
    iget-object v1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 104
    .line 105
    if-eqz p3, :cond_5

    .line 106
    .line 107
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 108
    .line 109
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 110
    .line 111
    .line 112
    iget-object v1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 113
    .line 114
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 118
    .line 119
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 120
    .line 121
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 125
    .line 126
    sget-object v1, Landroid/graphics/Paint$Join;->ROUND:Landroid/graphics/Paint$Join;

    .line 127
    .line 128
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeJoin(Landroid/graphics/Paint$Join;)V

    .line 129
    .line 130
    .line 131
    goto :goto_2

    .line 132
    :cond_5
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 133
    .line 134
    invoke-virtual {v1, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 135
    .line 136
    .line 137
    :goto_2
    iget-object v0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 138
    .line 139
    invoke-static {p2}, Ltech/sud/runtime/component/g/g;->a(I)I

    .line 140
    .line 141
    .line 142
    move-result p2

    .line 143
    invoke-virtual {v0, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    .line 145
    .line 146
    move-object v3, v6

    .line 147
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 148
    .line 149
    .line 150
    move-result v6

    .line 151
    iget p2, p0, Ltech/sud/runtime/component/g/g;->e:I

    .line 152
    .line 153
    neg-int p2, p2

    .line 154
    int-to-float v8, p2

    .line 155
    iget-object v9, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 156
    .line 157
    const/4 v5, 0x0

    .line 158
    const/4 v7, 0x0

    .line 159
    invoke-virtual/range {v3 .. v9}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;IIFFLandroid/graphics/Paint;)V

    .line 160
    .line 161
    .line 162
    iget-object v5, p0, Ltech/sud/runtime/component/g/g;->a:Ltech/sud/runtime/core/g;

    .line 163
    .line 164
    iget-object p0, p0, Ltech/sud/runtime/component/g/g;->b:Ltech/sud/runtime/component/g/a;

    .line 165
    .line 166
    invoke-virtual {p0}, Ltech/sud/runtime/component/g/a;->c()Landroid/graphics/Bitmap;

    .line 167
    .line 168
    .line 169
    move-result-object v8

    .line 170
    move v9, p1

    .line 171
    move v6, v2

    .line 172
    move v7, v11

    .line 173
    invoke-virtual/range {v5 .. v10}, Ltech/sud/runtime/core/g;->a(IILandroid/graphics/Bitmap;II)V

    .line 174
    .line 175
    .line 176
    :cond_6
    :goto_3
    return-void
.end method

.method public init(FZZLjava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Landroid/text/TextPaint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/TextPaint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 7
    .line 8
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 9
    .line 10
    .line 11
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 12
    .line 13
    sget-object v0, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 14
    .line 15
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    .line 23
    .line 24
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 25
    .line 26
    iget-object v0, p0, Ltech/sud/runtime/component/g/g;->b:Ltech/sud/runtime/component/g/a;

    .line 27
    .line 28
    invoke-virtual {v0, p4}, Ltech/sud/runtime/component/g/a;->a(Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 29
    .line 30
    .line 31
    move-result-object p4

    .line 32
    invoke-virtual {p1, p4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 36
    .line 37
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 38
    .line 39
    .line 40
    if-eqz p3, :cond_0

    .line 41
    .line 42
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 43
    .line 44
    const p3, -0x420a3d71    # -0.12f

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 48
    .line 49
    .line 50
    :cond_0
    iput-boolean p2, p0, Ltech/sud/runtime/component/g/g;->f:Z

    .line 51
    .line 52
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 59
    .line 60
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Ltech/sud/runtime/component/g/g;->e:I

    .line 65
    .line 66
    iget-object p1, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iget p1, p1, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 73
    .line 74
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 75
    .line 76
    .line 77
    move-result p1

    .line 78
    iget p2, p0, Ltech/sud/runtime/component/g/g;->e:I

    .line 79
    .line 80
    sub-int/2addr p1, p2

    .line 81
    iput p1, p0, Ltech/sud/runtime/component/g/g;->d:I

    .line 82
    .line 83
    return-void
.end method

.method public textHeight(Ljava/lang/String;)F
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/runtime/component/g/g;->d:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    return p0
.end method

.method public textWidth(Ljava/lang/String;)F
    .locals 2

    .line 1
    const/16 v0, 0x9

    .line 2
    .line 3
    const/16 v1, 0x20

    .line 4
    .line 5
    invoke-virtual {p1, v0, v1}, Ljava/lang/String;->replace(CC)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iget-object p0, p0, Ltech/sud/runtime/component/g/g;->c:Landroid/text/TextPaint;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method
