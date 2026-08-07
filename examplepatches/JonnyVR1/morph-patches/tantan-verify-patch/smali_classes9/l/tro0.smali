.class public Ll/tro0;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"

# interfaces
.implements Ll/brl;


# instance fields
.field public a:Landroid/graphics/RectF;

.field public b:Ljava/lang/String;

.field public c:I

.field public d:I

.field public e:Z

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Landroid/graphics/Rect;

.field public o:I

.field public p:Ljava/lang/String;

.field public q:I

.field public r:I


# direct methods
.method public constructor <init>(Ljava/lang/String;Ljava/lang/String;IIIII)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x41000000    # 8.0f

    .line 5
    .line 6
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    iput v0, p0, Ll/tro0;->f:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput v0, p0, Ll/tro0;->g:I

    .line 14
    .line 15
    const/16 v1, 0x14

    .line 16
    .line 17
    iput v1, p0, Ll/tro0;->h:I

    .line 18
    .line 19
    const-string v1, "#33ffffff"

    .line 20
    .line 21
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    iput v1, p0, Ll/tro0;->l:I

    .line 26
    .line 27
    const/high16 v1, 0x3f800000    # 1.0f

    .line 28
    .line 29
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    iput v1, p0, Ll/tro0;->m:I

    .line 34
    .line 35
    const/high16 v1, 0x41a80000    # 21.0f

    .line 36
    .line 37
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    iput v1, p0, Ll/tro0;->o:I

    .line 42
    .line 43
    const-string v1, ""

    .line 44
    .line 45
    iput-object v1, p0, Ll/tro0;->p:Ljava/lang/String;

    .line 46
    .line 47
    iput v0, p0, Ll/tro0;->q:I

    .line 48
    .line 49
    const/high16 v0, 0x41500000    # 13.0f

    .line 50
    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, p0, Ll/tro0;->r:I

    .line 56
    .line 57
    iput-object p1, p0, Ll/tro0;->b:Ljava/lang/String;

    .line 58
    .line 59
    iput-object p2, p0, Ll/tro0;->p:Ljava/lang/String;

    .line 60
    .line 61
    iput p3, p0, Ll/tro0;->i:I

    .line 62
    .line 63
    iput p4, p0, Ll/tro0;->c:I

    .line 64
    .line 65
    iput p5, p0, Ll/tro0;->d:I

    .line 66
    .line 67
    new-instance p1, Landroid/graphics/RectF;

    .line 68
    .line 69
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Ll/tro0;->a:Landroid/graphics/RectF;

    .line 73
    .line 74
    new-instance p1, Landroid/graphics/Rect;

    .line 75
    .line 76
    invoke-direct {p1}, Landroid/graphics/Rect;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Ll/tro0;->n:Landroid/graphics/Rect;

    .line 80
    .line 81
    iput p6, p0, Ll/tro0;->j:I

    .line 82
    .line 83
    iput p7, p0, Ll/tro0;->k:I

    .line 84
    .line 85
    return-void
.end method


# virtual methods
.method public final a(FFFF)Landroid/graphics/LinearGradient;
    .locals 8

    .line 1
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 2
    .line 3
    iget v5, p0, Ll/tro0;->j:I

    .line 4
    .line 5
    iget v6, p0, Ll/tro0;->k:I

    .line 6
    .line 7
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 8
    .line 9
    move v1, p1

    .line 10
    move v2, p2

    .line 11
    move v3, p3

    .line 12
    move v4, p4

    .line 13
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public b()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/tro0;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public final c()I
    .locals 2

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Ll/tro0;->i:I

    .line 7
    .line 8
    int-to-float v1, v1

    .line 9
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    int-to-float v1, v1

    .line 14
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 15
    .line 16
    .line 17
    iget-object p0, p0, Ll/tro0;->p:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;)F

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    float-to-int p0, p0

    .line 24
    invoke-static {}, Ll/bnl0;->y0()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    const/high16 v1, 0x43330000    # 179.0f

    .line 29
    .line 30
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    sub-int/2addr v0, v1

    .line 35
    sub-int/2addr v0, p0

    .line 36
    div-int/lit8 v0, v0, 0x2

    .line 37
    .line 38
    return v0
.end method

.method public final d(IF)I
    .locals 2

    .line 1
    iget v0, p0, Ll/tro0;->q:I

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-ne v0, v1, :cond_0

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/tro0;->e()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/high16 p0, 0x41f00000    # 30.0f

    .line 13
    .line 14
    invoke-static {p0}, Ll/qa00;->d(F)I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-lez p1, :cond_0

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    cmpl-float p1, p2, p1

    .line 22
    .line 23
    if-nez p1, :cond_0

    .line 24
    .line 25
    int-to-float p0, p0

    .line 26
    sub-float/2addr p0, p2

    .line 27
    float-to-int p0, p0

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 16

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    move/from16 v3, p3

    .line 8
    .line 9
    move/from16 v4, p4

    .line 10
    .line 11
    move/from16 v5, p5

    .line 12
    .line 13
    move/from16 v6, p6

    .line 14
    .line 15
    move-object/from16 v7, p9

    .line 16
    .line 17
    iget-boolean v8, v0, Ll/tro0;->e:Z

    .line 18
    .line 19
    if-eqz v8, :cond_0

    .line 20
    .line 21
    return-void

    .line 22
    :cond_0
    invoke-virtual {v7}, Landroid/graphics/Paint;->getColor()I

    .line 23
    .line 24
    .line 25
    move-result v8

    .line 26
    iget v9, v0, Ll/tro0;->c:I

    .line 27
    .line 28
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 29
    .line 30
    .line 31
    iget v9, v0, Ll/tro0;->i:I

    .line 32
    .line 33
    int-to-float v9, v9

    .line 34
    invoke-static {v9}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v9

    .line 38
    int-to-float v9, v9

    .line 39
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v9

    .line 46
    iget-object v10, v0, Ll/tro0;->n:Landroid/graphics/Rect;

    .line 47
    .line 48
    invoke-virtual {v7, v9, v3, v4, v10}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 49
    .line 50
    .line 51
    iget-object v9, v0, Ll/tro0;->n:Landroid/graphics/Rect;

    .line 52
    .line 53
    invoke-virtual {v9}, Landroid/graphics/Rect;->height()I

    .line 54
    .line 55
    .line 56
    move-result v9

    .line 57
    iget v10, v0, Ll/tro0;->g:I

    .line 58
    .line 59
    mul-int/lit8 v10, v10, 0x2

    .line 60
    .line 61
    add-int/2addr v9, v10

    .line 62
    sub-int v10, p8, v6

    .line 63
    .line 64
    div-int/lit8 v11, v10, 0x2

    .line 65
    .line 66
    sub-int v11, p8, v11

    .line 67
    .line 68
    iget v12, v0, Ll/tro0;->o:I

    .line 69
    .line 70
    div-int/lit8 v13, v12, 0x2

    .line 71
    .line 72
    sub-int v13, v11, v13

    .line 73
    .line 74
    div-int/lit8 v12, v12, 0x2

    .line 75
    .line 76
    add-int/2addr v11, v12

    .line 77
    sub-int/2addr v10, v9

    .line 78
    div-int/lit8 v10, v10, 0x2

    .line 79
    .line 80
    const/4 v9, 0x0

    .line 81
    cmpl-float v9, v5, v9

    .line 82
    .line 83
    if-eqz v9, :cond_1

    .line 84
    .line 85
    iget v6, v0, Ll/tro0;->h:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_1
    invoke-virtual {v0, v6, v5}, Ll/tro0;->d(IF)I

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    :goto_0
    iget-object v9, v0, Ll/tro0;->a:Landroid/graphics/RectF;

    .line 93
    .line 94
    int-to-float v6, v6

    .line 95
    add-float v12, v5, v6

    .line 96
    .line 97
    int-to-float v13, v13

    .line 98
    invoke-virtual {v7, v2, v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 99
    .line 100
    .line 101
    move-result v14

    .line 102
    float-to-int v14, v14

    .line 103
    iget v15, v0, Ll/tro0;->f:I

    .line 104
    .line 105
    mul-int/lit8 v15, v15, 0x2

    .line 106
    .line 107
    add-int/2addr v14, v15

    .line 108
    int-to-float v14, v14

    .line 109
    add-float/2addr v14, v12

    .line 110
    int-to-float v11, v11

    .line 111
    invoke-virtual {v9, v12, v13, v14, v11}, Landroid/graphics/RectF;->set(FFFF)V

    .line 112
    .line 113
    .line 114
    iget v9, v0, Ll/tro0;->j:I

    .line 115
    .line 116
    if-eqz v9, :cond_2

    .line 117
    .line 118
    iget v9, v0, Ll/tro0;->k:I

    .line 119
    .line 120
    if-eqz v9, :cond_2

    .line 121
    .line 122
    invoke-virtual {v7, v2, v3, v4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 123
    .line 124
    .line 125
    move-result v9

    .line 126
    float-to-int v9, v9

    .line 127
    iget v14, v0, Ll/tro0;->f:I

    .line 128
    .line 129
    mul-int/lit8 v14, v14, 0x2

    .line 130
    .line 131
    add-int/2addr v9, v14

    .line 132
    int-to-float v9, v9

    .line 133
    add-float/2addr v9, v12

    .line 134
    invoke-virtual {v0, v12, v13, v9, v11}, Ll/tro0;->a(FFFF)Landroid/graphics/LinearGradient;

    .line 135
    .line 136
    .line 137
    move-result-object v9

    .line 138
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 139
    .line 140
    .line 141
    goto :goto_1

    .line 142
    :cond_2
    iget v9, v0, Ll/tro0;->c:I

    .line 143
    .line 144
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 145
    .line 146
    .line 147
    :goto_1
    iget-object v9, v0, Ll/tro0;->a:Landroid/graphics/RectF;

    .line 148
    .line 149
    iget v11, v0, Ll/tro0;->r:I

    .line 150
    .line 151
    int-to-float v12, v11

    .line 152
    int-to-float v11, v11

    .line 153
    invoke-virtual {v1, v9, v12, v11, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 154
    .line 155
    .line 156
    const/4 v9, 0x0

    .line 157
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 158
    .line 159
    .line 160
    iget v9, v0, Ll/tro0;->d:I

    .line 161
    .line 162
    invoke-virtual {v7, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 163
    .line 164
    .line 165
    iget v9, v0, Ll/tro0;->f:I

    .line 166
    .line 167
    int-to-float v9, v9

    .line 168
    add-float/2addr v5, v9

    .line 169
    add-float/2addr v5, v6

    .line 170
    iget v6, v0, Ll/tro0;->g:I

    .line 171
    .line 172
    sub-int v6, p8, v6

    .line 173
    .line 174
    sub-int/2addr v6, v10

    .line 175
    iget-object v9, v0, Ll/tro0;->n:Landroid/graphics/Rect;

    .line 176
    .line 177
    iget v9, v9, Landroid/graphics/Rect;->bottom:I

    .line 178
    .line 179
    sub-int/2addr v6, v9

    .line 180
    int-to-float v6, v6

    .line 181
    invoke-virtual/range {v1 .. v7}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 182
    .line 183
    .line 184
    iget v2, v0, Ll/tro0;->q:I

    .line 185
    .line 186
    const/4 v3, 0x3

    .line 187
    if-ne v2, v3, :cond_3

    .line 188
    .line 189
    iget v2, v0, Ll/tro0;->l:I

    .line 190
    .line 191
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 192
    .line 193
    .line 194
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 195
    .line 196
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 197
    .line 198
    .line 199
    iget v2, v0, Ll/tro0;->m:I

    .line 200
    .line 201
    int-to-float v2, v2

    .line 202
    invoke-virtual {v7, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 203
    .line 204
    .line 205
    iget-object v2, v0, Ll/tro0;->a:Landroid/graphics/RectF;

    .line 206
    .line 207
    iget v0, v0, Ll/tro0;->r:I

    .line 208
    .line 209
    int-to-float v3, v0

    .line 210
    int-to-float v0, v0

    .line 211
    invoke-virtual {v1, v2, v3, v0, v7}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 212
    .line 213
    .line 214
    :cond_3
    invoke-virtual {v7, v8}, Landroid/graphics/Paint;->setColor(I)V

    .line 215
    .line 216
    .line 217
    return-void
.end method

.method public final e()Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tro0;->b:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "voiceCallApply"

    .line 4
    .line 5
    invoke-static {v0, v1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    iget-object p0, p0, Ll/tro0;->b:Ljava/lang/String;

    .line 12
    .line 13
    const-string v0, "settleApprove"

    .line 14
    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    const/4 p0, 0x0

    .line 23
    return p0

    .line 24
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 25
    return p0
.end method

.method public final f()Z
    .locals 1

    .line 1
    iget p0, p0, Ll/tro0;->q:I

    .line 2
    .line 3
    const/4 v0, 0x2

    .line 4
    if-ne p0, v0, :cond_0

    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    return p0

    .line 8
    :cond_0
    const/4 p0, 0x0

    .line 9
    return p0
.end method

.method public g(I)V
    .locals 3

    .line 1
    iput p1, p0, Ll/tro0;->q:I

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    const/high16 v1, 0x40c00000    # 6.0f

    .line 5
    .line 6
    const/high16 v2, 0x41000000    # 8.0f

    .line 7
    .line 8
    if-eq p1, v0, :cond_2

    .line 9
    .line 10
    const/4 v0, 0x2

    .line 11
    if-eq p1, v0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    iput p1, p0, Ll/tro0;->f:I

    .line 21
    .line 22
    const/high16 p1, 0x41500000    # 13.0f

    .line 23
    .line 24
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    iput p1, p0, Ll/tro0;->r:I

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    iput p1, p0, Ll/tro0;->f:I

    .line 36
    .line 37
    const/high16 p1, 0x41600000    # 14.0f

    .line 38
    .line 39
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    iput p1, p0, Ll/tro0;->o:I

    .line 44
    .line 45
    const/high16 p1, 0x40a00000    # 5.0f

    .line 46
    .line 47
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    iput p1, p0, Ll/tro0;->r:I

    .line 52
    .line 53
    return-void

    .line 54
    :cond_1
    invoke-virtual {p0}, Ll/tro0;->c()I

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    iput p1, p0, Ll/tro0;->f:I

    .line 59
    .line 60
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    iput p1, p0, Ll/tro0;->g:I

    .line 65
    .line 66
    const/high16 p1, 0x42080000    # 34.0f

    .line 67
    .line 68
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    iput p1, p0, Ll/tro0;->o:I

    .line 73
    .line 74
    const/high16 p1, 0x41200000    # 10.0f

    .line 75
    .line 76
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 77
    .line 78
    .line 79
    move-result p1

    .line 80
    iput p1, p0, Ll/tro0;->r:I

    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Ll/tro0;->f:I

    .line 88
    .line 89
    const/high16 p1, 0x41b00000    # 22.0f

    .line 90
    .line 91
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Ll/tro0;->o:I

    .line 96
    .line 97
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    iput p1, p0, Ll/tro0;->r:I

    .line 102
    .line 103
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/tro0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    iget v0, p0, Ll/tro0;->i:I

    .line 8
    .line 9
    int-to-float v0, v0

    .line 10
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    int-to-float v0, v0

    .line 15
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 16
    .line 17
    .line 18
    const/16 v0, 0x14

    .line 19
    .line 20
    iput v0, p0, Ll/tro0;->h:I

    .line 21
    .line 22
    if-eqz p5, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/tro0;->f()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget v0, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 31
    .line 32
    const/high16 v1, 0x41d80000    # 27.0f

    .line 33
    .line 34
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 35
    .line 36
    .line 37
    move-result v1

    .line 38
    add-int/2addr v0, v1

    .line 39
    iput v0, p5, Landroid/graphics/Paint$FontMetricsInt;->descent:I

    .line 40
    .line 41
    :cond_1
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 42
    .line 43
    .line 44
    move-result p1

    .line 45
    float-to-int p1, p1

    .line 46
    iget p2, p0, Ll/tro0;->f:I

    .line 47
    .line 48
    mul-int/lit8 p2, p2, 0x2

    .line 49
    .line 50
    add-int/2addr p1, p2

    .line 51
    iget p0, p0, Ll/tro0;->h:I

    .line 52
    .line 53
    add-int/2addr p1, p0

    .line 54
    return p1
.end method

.method public setVisible(Z)V
    .locals 0

    .line 1
    xor-int/lit8 p1, p1, 0x1

    .line 2
    .line 3
    iput-boolean p1, p0, Ll/tro0;->e:Z

    .line 4
    .line 5
    return-void
.end method
