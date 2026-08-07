.class public Ll/smd0;
.super Landroid/text/style/ReplacementSpan;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/smd0$a;
    }
.end annotation


# instance fields
.field public a:I

.field public b:I

.field public c:[I

.field public d:I

.field public e:I

.field public f:F

.field public g:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ll/smd0$a;",
            ">;"
        }
    .end annotation
.end field

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:Z


# direct methods
.method public constructor <init>(IIIIF)V
    .locals 7

    const/4 v6, 0x0

    move-object v0, p0

    move v1, p1

    move v2, p2

    move v3, p3

    move v4, p4

    move v5, p5

    .line 51
    invoke-direct/range {v0 .. v6}, Ll/smd0;-><init>(IIIIF[I)V

    return-void
.end method

.method public constructor <init>(IIIIF[I)V
    .locals 3

    .line 1
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/smd0;->g:Ljava/util/ArrayList;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Ll/smd0;->h:I

    .line 13
    .line 14
    sget v2, Ll/qa00;->f:I

    .line 15
    .line 16
    iput v2, p0, Ll/smd0;->i:I

    .line 17
    .line 18
    iput v2, p0, Ll/smd0;->j:I

    .line 19
    .line 20
    iput v1, p0, Ll/smd0;->k:I

    .line 21
    .line 22
    iput v1, p0, Ll/smd0;->l:I

    .line 23
    .line 24
    iput v1, p0, Ll/smd0;->m:I

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    iput-boolean v1, p0, Ll/smd0;->n:Z

    .line 28
    .line 29
    iput p1, p0, Ll/smd0;->a:I

    .line 30
    .line 31
    iput p2, p0, Ll/smd0;->b:I

    .line 32
    .line 33
    iput-object p6, p0, Ll/smd0;->c:[I

    .line 34
    .line 35
    iput p3, p0, Ll/smd0;->d:I

    .line 36
    .line 37
    iput p4, p0, Ll/smd0;->e:I

    .line 38
    .line 39
    iput p5, p0, Ll/smd0;->f:F

    .line 40
    .line 41
    new-instance p0, Ll/smd0$a;

    .line 42
    .line 43
    const/4 p1, -0x1

    .line 44
    invoke-direct {p0, p4, p5, p1}, Ll/smd0$a;-><init>(IFI)V

    .line 45
    .line 46
    .line 47
    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public varargs constructor <init>(III[Ll/smd0$a;)V
    .locals 3

    .line 52
    invoke-direct {p0}, Landroid/text/style/ReplacementSpan;-><init>()V

    .line 53
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Ll/smd0;->g:Ljava/util/ArrayList;

    const/4 v1, 0x0

    .line 54
    iput v1, p0, Ll/smd0;->h:I

    .line 55
    sget v2, Ll/qa00;->f:I

    iput v2, p0, Ll/smd0;->i:I

    .line 56
    iput v2, p0, Ll/smd0;->j:I

    .line 57
    iput v1, p0, Ll/smd0;->k:I

    .line 58
    iput v1, p0, Ll/smd0;->l:I

    .line 59
    iput v1, p0, Ll/smd0;->m:I

    const/4 v1, 0x1

    .line 60
    iput-boolean v1, p0, Ll/smd0;->n:Z

    .line 61
    iput p1, p0, Ll/smd0;->a:I

    .line 62
    iput p2, p0, Ll/smd0;->b:I

    .line 63
    iput p3, p0, Ll/smd0;->d:I

    .line 64
    invoke-static {p4}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method


# virtual methods
.method public a(Z)Ll/smd0;
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/smd0;->n:Z

    .line 2
    .line 3
    return-object p0
.end method

.method public final b(Landroid/graphics/Paint;Ljava/lang/CharSequence;II)F
    .locals 0

    .line 1
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Paint;->measureText(Ljava/lang/CharSequence;II)F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public c(IIII)V
    .locals 0

    .line 1
    iput p1, p0, Ll/smd0;->i:I

    .line 2
    .line 3
    iput p3, p0, Ll/smd0;->j:I

    .line 4
    .line 5
    iput p2, p0, Ll/smd0;->k:I

    .line 6
    .line 7
    iput p4, p0, Ll/smd0;->l:I

    .line 8
    .line 9
    return-void
.end method

.method public d(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/smd0;->m:I

    .line 2
    .line 3
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;Ljava/lang/CharSequence;IIFIIILandroid/graphics/Paint;)V
    .locals 20

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move/from16 v1, p7

    .line 4
    .line 5
    move-object/from16 v6, p9

    .line 6
    .line 7
    invoke-virtual {v6}, Landroid/graphics/Paint;->getColor()I

    .line 8
    .line 9
    .line 10
    move-result v9

    .line 11
    iget v2, v0, Ll/smd0;->b:I

    .line 12
    .line 13
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 14
    .line 15
    .line 16
    iget-object v2, v0, Ll/smd0;->c:[I

    .line 17
    .line 18
    const/4 v10, 0x0

    .line 19
    const/4 v11, 0x1

    .line 20
    if-eqz v2, :cond_0

    .line 21
    .line 22
    array-length v2, v2

    .line 23
    if-le v2, v11, :cond_0

    .line 24
    .line 25
    new-instance v12, Landroid/graphics/LinearGradient;

    .line 26
    .line 27
    iget v2, v0, Ll/smd0;->m:I

    .line 28
    .line 29
    int-to-float v3, v2

    .line 30
    add-float v13, p5, v3

    .line 31
    .line 32
    iget v3, v0, Ll/smd0;->h:I

    .line 33
    .line 34
    int-to-float v3, v3

    .line 35
    add-float v3, p5, v3

    .line 36
    .line 37
    int-to-float v2, v2

    .line 38
    sub-float v15, v3, v2

    .line 39
    .line 40
    iget-object v2, v0, Ll/smd0;->c:[I

    .line 41
    .line 42
    aget v17, v2, v10

    .line 43
    .line 44
    aget v18, v2, v11

    .line 45
    .line 46
    sget-object v19, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 47
    .line 48
    const/4 v14, 0x0

    .line 49
    const/16 v16, 0x0

    .line 50
    .line 51
    invoke-direct/range {v12 .. v19}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 55
    .line 56
    .line 57
    :cond_0
    invoke-virtual {v6}, Landroid/graphics/Paint;->getTextSize()F

    .line 58
    .line 59
    .line 60
    move-result v12

    .line 61
    invoke-virtual {v6}, Landroid/graphics/Paint;->getFlags()I

    .line 62
    .line 63
    .line 64
    move-result v13

    .line 65
    new-instance v2, Landroid/graphics/RectF;

    .line 66
    .line 67
    iget v3, v0, Ll/smd0;->m:I

    .line 68
    .line 69
    int-to-float v4, v3

    .line 70
    add-float v4, p5, v4

    .line 71
    .line 72
    iget v5, v0, Ll/smd0;->k:I

    .line 73
    .line 74
    sub-int v5, p6, v5

    .line 75
    .line 76
    int-to-float v5, v5

    .line 77
    iget v7, v0, Ll/smd0;->h:I

    .line 78
    .line 79
    int-to-float v7, v7

    .line 80
    add-float v7, p5, v7

    .line 81
    .line 82
    int-to-float v3, v3

    .line 83
    sub-float/2addr v7, v3

    .line 84
    sget v3, Ll/qa00;->a:I

    .line 85
    .line 86
    sub-int v3, p8, v3

    .line 87
    .line 88
    iget v8, v0, Ll/smd0;->l:I

    .line 89
    .line 90
    add-int/2addr v3, v8

    .line 91
    int-to-float v3, v3

    .line 92
    invoke-direct {v2, v4, v5, v7, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 93
    .line 94
    .line 95
    iget v3, v0, Ll/smd0;->a:I

    .line 96
    .line 97
    int-to-float v4, v3

    .line 98
    int-to-float v3, v3

    .line 99
    move-object/from16 v5, p1

    .line 100
    .line 101
    invoke-virtual {v5, v2, v4, v3, v6}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 102
    .line 103
    .line 104
    const/4 v2, 0x0

    .line 105
    invoke-virtual {v6, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 106
    .line 107
    .line 108
    iget v2, v0, Ll/smd0;->i:I

    .line 109
    .line 110
    int-to-float v2, v2

    .line 111
    add-float v2, p5, v2

    .line 112
    .line 113
    iget v3, v0, Ll/smd0;->m:I

    .line 114
    .line 115
    int-to-float v3, v3

    .line 116
    add-float/2addr v2, v3

    .line 117
    iget v3, v0, Ll/smd0;->d:I

    .line 118
    .line 119
    if-eqz v3, :cond_1

    .line 120
    .line 121
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 122
    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_1
    const/4 v3, -0x1

    .line 126
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 127
    .line 128
    .line 129
    :goto_0
    iget-object v3, v0, Ll/smd0;->g:Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-virtual {v3}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 132
    .line 133
    .line 134
    move-result-object v14

    .line 135
    move v4, v2

    .line 136
    move/from16 v2, p3

    .line 137
    .line 138
    :goto_1
    invoke-interface {v14}, Ljava/util/Iterator;->hasNext()Z

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    if-eqz v3, :cond_a

    .line 143
    .line 144
    invoke-interface {v14}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v3

    .line 148
    move-object v15, v3

    .line 149
    check-cast v15, Ll/smd0$a;

    .line 150
    .line 151
    iget v3, v15, Ll/smd0$a;->a:I

    .line 152
    .line 153
    and-int/2addr v3, v11

    .line 154
    if-eqz v3, :cond_2

    .line 155
    .line 156
    move v3, v11

    .line 157
    goto :goto_2

    .line 158
    :cond_2
    move v3, v10

    .line 159
    :goto_2
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setFakeBoldText(Z)V

    .line 160
    .line 161
    .line 162
    iget v3, v15, Ll/smd0$a;->a:I

    .line 163
    .line 164
    and-int/lit8 v3, v3, 0x2

    .line 165
    .line 166
    const/4 v7, 0x0

    .line 167
    if-eqz v3, :cond_3

    .line 168
    .line 169
    const v3, -0x41e66666    # -0.15f

    .line 170
    .line 171
    .line 172
    goto :goto_3

    .line 173
    :cond_3
    move v3, v7

    .line 174
    :goto_3
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setTextSkewX(F)V

    .line 175
    .line 176
    .line 177
    iget v3, v15, Ll/smd0$a;->e:I

    .line 178
    .line 179
    if-ltz v3, :cond_4

    .line 180
    .line 181
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setFlags(I)V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_4
    invoke-virtual {v6, v13}, Landroid/graphics/Paint;->setFlags(I)V

    .line 186
    .line 187
    .line 188
    :goto_4
    iget v3, v15, Ll/smd0$a;->b:F

    .line 189
    .line 190
    cmpl-float v7, v3, v7

    .line 191
    .line 192
    if-lez v7, :cond_5

    .line 193
    .line 194
    invoke-virtual {v6, v3}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 195
    .line 196
    .line 197
    goto :goto_5

    .line 198
    :cond_5
    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 199
    .line 200
    .line 201
    :goto_5
    invoke-virtual {v6}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 202
    .line 203
    .line 204
    move-result-object v3

    .line 205
    if-eqz v3, :cond_6

    .line 206
    .line 207
    int-to-float v3, v1

    .line 208
    invoke-virtual {v6}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 209
    .line 210
    .line 211
    move-result-object v7

    .line 212
    iget v7, v7, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 213
    .line 214
    add-float/2addr v3, v7

    .line 215
    sget v7, Ll/qa00;->a:I

    .line 216
    .line 217
    add-int v8, p6, v7

    .line 218
    .line 219
    int-to-float v8, v8

    .line 220
    cmpg-float v3, v3, v8

    .line 221
    .line 222
    if-gez v3, :cond_6

    .line 223
    .line 224
    add-int v3, v1, v7

    .line 225
    .line 226
    goto :goto_6

    .line 227
    :cond_6
    move v3, v1

    .line 228
    :goto_6
    iget-boolean v7, v15, Ll/smd0$a;->d:Z

    .line 229
    .line 230
    if-eqz v7, :cond_7

    .line 231
    .line 232
    sget v7, Ll/qa00;->a:I

    .line 233
    .line 234
    sub-int/2addr v3, v7

    .line 235
    :cond_7
    iget v7, v0, Ll/smd0;->k:I

    .line 236
    .line 237
    iget v8, v0, Ll/smd0;->l:I

    .line 238
    .line 239
    sub-int/2addr v7, v8

    .line 240
    div-int/lit8 v7, v7, 0x2

    .line 241
    .line 242
    add-int/2addr v3, v7

    .line 243
    iget v5, v15, Ll/smd0$a;->c:I

    .line 244
    .line 245
    if-gez v5, :cond_9

    .line 246
    .line 247
    iget-boolean v0, v0, Ll/smd0;->n:Z

    .line 248
    .line 249
    if-eqz v0, :cond_8

    .line 250
    .line 251
    add-int/lit8 v0, p4, 0x1

    .line 252
    .line 253
    goto :goto_7

    .line 254
    :cond_8
    move/from16 v0, p4

    .line 255
    .line 256
    :goto_7
    int-to-float v5, v3

    .line 257
    move-object/from16 v1, p2

    .line 258
    .line 259
    move v3, v0

    .line 260
    move-object/from16 v0, p1

    .line 261
    .line 262
    invoke-virtual/range {v0 .. v6}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 263
    .line 264
    .line 265
    move-object/from16 v6, p9

    .line 266
    .line 267
    goto :goto_8

    .line 268
    :cond_9
    move v6, v4

    .line 269
    int-to-float v7, v3

    .line 270
    move-object/from16 v3, p2

    .line 271
    .line 272
    move-object/from16 v8, p9

    .line 273
    .line 274
    move v4, v2

    .line 275
    move-object/from16 v2, p1

    .line 276
    .line 277
    invoke-virtual/range {v2 .. v8}, Landroid/graphics/Canvas;->drawText(Ljava/lang/CharSequence;IIFFLandroid/graphics/Paint;)V

    .line 278
    .line 279
    .line 280
    move v2, v4

    .line 281
    move v4, v6

    .line 282
    move-object v6, v8

    .line 283
    iget v3, v15, Ll/smd0$a;->c:I

    .line 284
    .line 285
    move-object/from16 v5, p2

    .line 286
    .line 287
    invoke-virtual {v0, v6, v5, v2, v3}, Ll/smd0;->b(Landroid/graphics/Paint;Ljava/lang/CharSequence;II)F

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    const/high16 v3, 0x3f800000    # 1.0f

    .line 292
    .line 293
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    int-to-float v3, v3

    .line 298
    add-float/2addr v2, v3

    .line 299
    add-float/2addr v4, v2

    .line 300
    iget v2, v15, Ll/smd0$a;->c:I

    .line 301
    .line 302
    move-object/from16 v5, p1

    .line 303
    .line 304
    goto/16 :goto_1

    .line 305
    .line 306
    :cond_a
    :goto_8
    invoke-virtual {v6, v9}, Landroid/graphics/Paint;->setColor(I)V

    .line 307
    .line 308
    .line 309
    invoke-virtual {v6, v12}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 310
    .line 311
    .line 312
    invoke-virtual {v6, v13}, Landroid/graphics/Paint;->setFlags(I)V

    .line 313
    .line 314
    .line 315
    return-void
.end method

.method public getSize(Landroid/graphics/Paint;Ljava/lang/CharSequence;IILandroid/graphics/Paint$FontMetricsInt;)I
    .locals 4

    .line 1
    const/4 p5, 0x0

    .line 2
    iput p5, p0, Ll/smd0;->h:I

    .line 3
    .line 4
    iget-object p5, p0, Ll/smd0;->g:Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-virtual {p5}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 7
    .line 8
    .line 9
    move-result-object p5

    .line 10
    :goto_0
    invoke-interface {p5}, Ljava/util/Iterator;->hasNext()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    const/4 v1, 0x0

    .line 15
    if-eqz v0, :cond_3

    .line 16
    .line 17
    invoke-interface {p5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/smd0$a;

    .line 22
    .line 23
    iget v2, v0, Ll/smd0$a;->b:F

    .line 24
    .line 25
    cmpl-float v3, v2, v1

    .line 26
    .line 27
    if-lez v3, :cond_0

    .line 28
    .line 29
    invoke-virtual {p1, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget v2, v0, Ll/smd0$a;->c:I

    .line 33
    .line 34
    iget v3, p0, Ll/smd0;->h:I

    .line 35
    .line 36
    if-gez v2, :cond_2

    .line 37
    .line 38
    int-to-float p5, v3

    .line 39
    iget-boolean v0, p0, Ll/smd0;->n:Z

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    add-int/lit8 p4, p4, 0x1

    .line 44
    .line 45
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/smd0;->b(Landroid/graphics/Paint;Ljava/lang/CharSequence;II)F

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    add-float/2addr p5, p2

    .line 50
    float-to-int p2, p5

    .line 51
    iput p2, p0, Ll/smd0;->h:I

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    int-to-float v1, v3

    .line 55
    invoke-virtual {p0, p1, p2, p3, v2}, Ll/smd0;->b(Landroid/graphics/Paint;Ljava/lang/CharSequence;II)F

    .line 56
    .line 57
    .line 58
    move-result p3

    .line 59
    sget v2, Ll/qa00;->a:I

    .line 60
    .line 61
    int-to-float v2, v2

    .line 62
    add-float/2addr p3, v2

    .line 63
    add-float/2addr v1, p3

    .line 64
    float-to-int p3, v1

    .line 65
    iput p3, p0, Ll/smd0;->h:I

    .line 66
    .line 67
    iget p3, v0, Ll/smd0$a;->c:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_3
    :goto_1
    iget p2, p0, Ll/smd0;->f:F

    .line 71
    .line 72
    cmpl-float p3, p2, v1

    .line 73
    .line 74
    if-lez p3, :cond_4

    .line 75
    .line 76
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 77
    .line 78
    .line 79
    goto :goto_2

    .line 80
    :cond_4
    invoke-virtual {p1}, Landroid/graphics/Paint;->getTextSize()F

    .line 81
    .line 82
    .line 83
    move-result p1

    .line 84
    iput p1, p0, Ll/smd0;->f:F

    .line 85
    .line 86
    :goto_2
    iget p1, p0, Ll/smd0;->h:I

    .line 87
    .line 88
    iget p2, p0, Ll/smd0;->i:I

    .line 89
    .line 90
    iget p3, p0, Ll/smd0;->j:I

    .line 91
    .line 92
    add-int/2addr p2, p3

    .line 93
    iget p3, p0, Ll/smd0;->m:I

    .line 94
    .line 95
    mul-int/lit8 p3, p3, 0x2

    .line 96
    .line 97
    add-int/2addr p2, p3

    .line 98
    add-int/2addr p1, p2

    .line 99
    iput p1, p0, Ll/smd0;->h:I

    .line 100
    .line 101
    return p1
.end method
