.class public Ll/rmd0;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"

# interfaces
.implements Ll/brl;


# instance fields
.field public a:Ljava/lang/String;

.field public b:I

.field public c:I

.field public d:Z

.field public e:I

.field public f:I

.field public g:I

.field public h:I


# direct methods
.method public constructor <init>(Ljava/lang/String;III)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x40a00000    # 5.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/rmd0;->e:I

    .line 11
    .line 12
    const/high16 v0, 0x40000000    # 2.0f

    .line 13
    .line 14
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iput v0, p0, Ll/rmd0;->f:I

    .line 19
    .line 20
    const/high16 v0, 0x40800000    # 4.0f

    .line 21
    .line 22
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    iput v0, p0, Ll/rmd0;->g:I

    .line 27
    .line 28
    iput-object p1, p0, Ll/rmd0;->a:Ljava/lang/String;

    .line 29
    .line 30
    iput p2, p0, Ll/rmd0;->h:I

    .line 31
    .line 32
    iput p3, p0, Ll/rmd0;->b:I

    .line 33
    .line 34
    iput p4, p0, Ll/rmd0;->c:I

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rmd0;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 12

    .line 1
    move v2, p3

    .line 2
    move/from16 v3, p4

    .line 3
    .line 4
    move-object/from16 v6, p9

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/rmd0;->d:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return-void

    .line 11
    :cond_0
    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I

    .line 12
    .line 13
    .line 14
    move-result v7

    .line 15
    iget v0, p0, Ll/rmd0;->b:I

    .line 16
    .line 17
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 18
    .line 19
    .line 20
    iget v0, p0, Ll/rmd0;->h:I

    .line 21
    .line 22
    int-to-float v0, v0

    .line 23
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    int-to-float v0, v0

    .line 28
    invoke-virtual {v6, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Landroid/graphics/Rect;

    .line 32
    .line 33
    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    invoke-virtual {v6, v1, p3, v3, v0}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0}, Landroid/graphics/Rect;->height()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    iget v4, p0, Ll/rmd0;->f:I

    .line 48
    .line 49
    mul-int/lit8 v4, v4, 0x2

    .line 50
    .line 51
    add-int/2addr v1, v4

    .line 52
    sub-int v4, p8, p6

    .line 53
    .line 54
    sub-int/2addr v4, v1

    .line 55
    div-int/lit8 v4, v4, 0x2

    .line 56
    .line 57
    const/4 v1, 0x0

    .line 58
    cmpl-float v1, p5, v1

    .line 59
    .line 60
    if-eqz v1, :cond_1

    .line 61
    .line 62
    iget v1, p0, Ll/rmd0;->g:I

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    const/4 v1, 0x0

    .line 66
    :goto_0
    new-instance v5, Landroid/graphics/RectF;

    .line 67
    .line 68
    int-to-float v1, v1

    .line 69
    add-float v8, p5, v1

    .line 70
    .line 71
    iget v9, p0, Ll/rmd0;->f:I

    .line 72
    .line 73
    add-int v9, p6, v9

    .line 74
    .line 75
    int-to-float v9, v9

    .line 76
    invoke-virtual {v6, p2, p3, v3}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 77
    .line 78
    .line 79
    move-result v10

    .line 80
    float-to-int v10, v10

    .line 81
    iget v11, p0, Ll/rmd0;->e:I

    .line 82
    .line 83
    mul-int/lit8 v11, v11, 0x2

    .line 84
    .line 85
    add-int/2addr v10, v11

    .line 86
    int-to-float v10, v10

    .line 87
    add-float/2addr v10, v8

    .line 88
    iget v11, p0, Ll/rmd0;->f:I

    .line 89
    .line 90
    sub-int v11, p8, v11

    .line 91
    .line 92
    int-to-float v11, v11

    .line 93
    invoke-direct {v5, v8, v9, v10, v11}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 94
    .line 95
    .line 96
    const/high16 v8, 0x40800000    # 4.0f

    .line 97
    .line 98
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 99
    .line 100
    .line 101
    move-result v9

    .line 102
    int-to-float v9, v9

    .line 103
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v8

    .line 107
    int-to-float v8, v8

    .line 108
    invoke-virtual {p1, v5, v9, v8, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    iget v5, p0, Ll/rmd0;->c:I

    .line 112
    .line 113
    invoke-virtual {v6, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 114
    .line 115
    .line 116
    iget v5, p0, Ll/rmd0;->e:I

    .line 117
    .line 118
    int-to-float v5, v5

    .line 119
    add-float v5, p5, v5

    .line 120
    .line 121
    add-float/2addr v5, v1

    .line 122
    iget p0, p0, Ll/rmd0;->f:I

    .line 123
    .line 124
    sub-int p0, p8, p0

    .line 125
    .line 126
    sub-int/2addr p0, v4

    .line 127
    iget v0, v0, Landroid/graphics/Rect;->bottom:I

    .line 128
    .line 129
    sub-int/2addr p0, v0

    .line 130
    int-to-float p0, p0

    .line 131
    move-object v0, p1

    .line 132
    move-object v1, p2

    .line 133
    move v4, v5

    .line 134
    move v5, p0

    .line 135
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 136
    .line 137
    .line 138
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 0

    .line 1
    iget-boolean p5, p0, Ll/rmd0;->d:Z

    .line 2
    .line 3
    if-eqz p5, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget p5, p0, Ll/rmd0;->h:I

    .line 8
    .line 9
    int-to-float p5, p5

    .line 10
    invoke-static {p5}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result p5

    .line 14
    int-to-float p5, p5

    .line 15
    invoke-virtual {p1, p5}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    float-to-int p1, p1

    .line 23
    iget p2, p0, Ll/rmd0;->e:I

    .line 24
    .line 25
    mul-int/lit8 p2, p2, 0x2

    .line 26
    .line 27
    add-int/2addr p1, p2

    .line 28
    iget p0, p0, Ll/rmd0;->g:I

    .line 29
    .line 30
    add-int/2addr p1, p0

    .line 31
    return p1
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    xor-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/rmd0;->d:Z

    .line 4
    .line 5
    return-void
.end method
