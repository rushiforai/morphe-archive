.class public Lcom/bef/effectsdk/text/TextLayoutUtils;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Lcom/amazing/annotation/EffectKeep;
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;
    }
.end annotation


# static fields
.field private static final FONT_SIZE_INCREMENT:I = 0x2

.field private static final FONT_SIZE_INIT:I = 0xa

.field private static final MAX_BITMAP_HEIGHT:I = 0x800

.field private static final MAX_BITMAP_WIDTH:I = 0x800


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

.method public static generateBitmapAtlasAlphaUTF32([ILcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 3
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([III)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_ALPHA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 16
    .line 17
    invoke-static {v0, p1, p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapAtlasUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static generateBitmapAtlasAlphaUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_ALPHA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapAtlasUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static generateBitmapAtlasRGBAUTF32([ILcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 3
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([III)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_RGBA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 16
    .line 17
    invoke-static {v0, p1, p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapAtlasUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static generateBitmapAtlasRGBAUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_RGBA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapAtlasUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method private static generateBitmapAtlasUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 34

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    const/4 v3, 0x0

    .line 10
    if-eqz v2, :cond_0

    .line 11
    .line 12
    return-object v3

    .line 13
    :cond_0
    sget-object v2, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 14
    .line 15
    iget-object v4, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v4, :cond_2

    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v4

    .line 23
    if-nez v4, :cond_2

    .line 24
    .line 25
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v2, :cond_1

    .line 28
    .line 29
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v4, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2, v4}, Lcom/bef/effectsdk/text/FontCache;->getFromFile(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 45
    .line 46
    iget v4, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontStyle:I

    .line 47
    .line 48
    invoke-static {v2, v4}, Lcom/bef/effectsdk/text/FontCache;->getFromSystem(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    :cond_2
    :goto_0
    iget v4, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textColor:I

    .line 53
    .line 54
    iget v5, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->backColor:I

    .line 55
    .line 56
    iget v6, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowColor:I

    .line 57
    .line 58
    sget-object v7, Lcom/bef/effectsdk/text/TextLayoutUtils$1;->$SwitchMap$com$bef$effectsdk$text$TextLayoutUtils$COLOR_TYPE:[I

    .line 59
    .line 60
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 61
    .line 62
    .line 63
    move-result v8

    .line 64
    aget v7, v7, v8

    .line 65
    .line 66
    const/4 v8, 0x1

    .line 67
    if-eq v7, v8, :cond_3

    .line 68
    .line 69
    and-int/lit16 v7, v4, 0xff

    .line 70
    .line 71
    shl-int/lit8 v7, v7, 0x18

    .line 72
    .line 73
    shr-int/lit8 v4, v4, 0x8

    .line 74
    .line 75
    const v9, 0xffffff

    .line 76
    .line 77
    .line 78
    and-int/2addr v4, v9

    .line 79
    add-int/2addr v7, v4

    .line 80
    and-int/lit16 v4, v5, 0xff

    .line 81
    .line 82
    shl-int/lit8 v4, v4, 0x18

    .line 83
    .line 84
    shr-int/lit8 v5, v5, 0x8

    .line 85
    .line 86
    and-int/2addr v5, v9

    .line 87
    add-int/2addr v4, v5

    .line 88
    and-int/lit16 v5, v6, 0xff

    .line 89
    .line 90
    shl-int/lit8 v5, v5, 0x18

    .line 91
    .line 92
    shr-int/lit8 v6, v6, 0x8

    .line 93
    .line 94
    and-int/2addr v6, v9

    .line 95
    add-int/2addr v5, v6

    .line 96
    goto :goto_1

    .line 97
    :cond_3
    and-int/lit16 v4, v4, 0xff

    .line 98
    .line 99
    shl-int/lit8 v7, v4, 0x18

    .line 100
    .line 101
    and-int/lit16 v4, v5, 0xff

    .line 102
    .line 103
    shl-int/lit8 v4, v4, 0x18

    .line 104
    .line 105
    and-int/lit16 v5, v6, 0xff

    .line 106
    .line 107
    shl-int/lit8 v5, v5, 0x18

    .line 108
    .line 109
    :goto_1
    sget-object v6, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 110
    .line 111
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->paintStyle:I

    .line 112
    .line 113
    const/4 v10, 0x2

    .line 114
    const/4 v11, 0x0

    .line 115
    if-eqz v9, :cond_4

    .line 116
    .line 117
    if-eq v9, v8, :cond_6

    .line 118
    .line 119
    if-eq v9, v10, :cond_5

    .line 120
    .line 121
    :cond_4
    move v9, v11

    .line 122
    goto :goto_2

    .line 123
    :cond_5
    sget-object v6, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 124
    .line 125
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->strokeWidth:F

    .line 126
    .line 127
    goto :goto_2

    .line 128
    :cond_6
    sget-object v6, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 129
    .line 130
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->strokeWidth:F

    .line 131
    .line 132
    :goto_2
    new-instance v12, Landroid/text/TextPaint;

    .line 133
    .line 134
    invoke-direct {v12, v8}, Landroid/text/TextPaint;-><init>(I)V

    .line 135
    .line 136
    .line 137
    if-eqz v2, :cond_7

    .line 138
    .line 139
    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 140
    .line 141
    .line 142
    :cond_7
    invoke-virtual {v12, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {v12, v6}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 146
    .line 147
    .line 148
    invoke-virtual {v12, v9}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 149
    .line 150
    .line 151
    iget v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 152
    .line 153
    invoke-virtual {v12, v2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 154
    .line 155
    .line 156
    iget v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 157
    .line 158
    iget v6, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 159
    .line 160
    iget v7, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 161
    .line 162
    invoke-virtual {v12, v2, v6, v7, v5}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 163
    .line 164
    .line 165
    iget v2, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 166
    .line 167
    const/16 v5, 0x800

    .line 168
    .line 169
    if-gt v2, v5, :cond_8

    .line 170
    .line 171
    if-nez v2, :cond_9

    .line 172
    .line 173
    :cond_8
    move v2, v5

    .line 174
    :cond_9
    new-instance v5, Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 175
    .line 176
    invoke-direct {v5}, Lcom/bef/effectsdk/text/data/TextBitmapResult;-><init>()V

    .line 177
    .line 178
    .line 179
    const/4 v6, 0x4

    .line 180
    iput v6, v5, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 181
    .line 182
    const/4 v7, 0x0

    .line 183
    iput v7, v5, Lcom/bef/effectsdk/text/data/TextBitmapResult;->lineCount:I

    .line 184
    .line 185
    iput v8, v5, Lcom/bef/effectsdk/text/data/TextBitmapResult;->type:I

    .line 186
    .line 187
    new-instance v9, Ljava/util/ArrayList;

    .line 188
    .line 189
    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    .line 190
    .line 191
    .line 192
    new-instance v13, Ljava/util/HashMap;

    .line 193
    .line 194
    invoke-direct {v13}, Ljava/util/HashMap;-><init>()V

    .line 195
    .line 196
    .line 197
    new-instance v14, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-direct {v14}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .line 201
    .line 202
    iget v15, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 203
    .line 204
    invoke-static {v15}, Ljava/lang/Math;->abs(F)F

    .line 205
    .line 206
    .line 207
    move-result v15

    .line 208
    move/from16 v16, v10

    .line 209
    .line 210
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 211
    .line 212
    const/high16 v17, 0x40000000    # 2.0f

    .line 213
    .line 214
    div-float v10, v10, v17

    .line 215
    .line 216
    add-float/2addr v15, v10

    .line 217
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 218
    .line 219
    invoke-static {v10}, Ljava/lang/Math;->abs(F)F

    .line 220
    .line 221
    .line 222
    move-result v10

    .line 223
    move-object/from16 v18, v3

    .line 224
    .line 225
    iget v3, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 226
    .line 227
    div-float v19, v3, v17

    .line 228
    .line 229
    add-float v10, v10, v19

    .line 230
    .line 231
    iget v6, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->letterSpacing:F

    .line 232
    .line 233
    cmpl-float v20, v6, v11

    .line 234
    .line 235
    if-lez v20, :cond_a

    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_a
    move v6, v11

    .line 239
    :goto_3
    float-to-int v6, v6

    .line 240
    move/from16 v20, v8

    .line 241
    .line 242
    iget v8, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingAdd:F

    .line 243
    .line 244
    cmpl-float v21, v8, v11

    .line 245
    .line 246
    if-lez v21, :cond_b

    .line 247
    .line 248
    goto :goto_4

    .line 249
    :cond_b
    move v8, v11

    .line 250
    :goto_4
    float-to-int v8, v8

    .line 251
    iget v7, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 252
    .line 253
    neg-float v7, v7

    .line 254
    div-float v3, v3, v17

    .line 255
    .line 256
    add-float/2addr v7, v3

    .line 257
    invoke-static {v7, v11}, Ljava/lang/Math;->max(FF)F

    .line 258
    .line 259
    .line 260
    move-result v3

    .line 261
    float-to-int v3, v3

    .line 262
    add-int/2addr v3, v6

    .line 263
    add-int/lit8 v3, v3, 0x1

    .line 264
    .line 265
    iget v7, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 266
    .line 267
    neg-float v7, v7

    .line 268
    iget v11, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 269
    .line 270
    div-float v11, v11, v17

    .line 271
    .line 272
    add-float/2addr v7, v11

    .line 273
    const/4 v11, 0x0

    .line 274
    invoke-static {v7, v11}, Ljava/lang/Math;->max(FF)F

    .line 275
    .line 276
    .line 277
    move-result v7

    .line 278
    iget v11, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 279
    .line 280
    add-float/2addr v7, v11

    .line 281
    float-to-int v7, v7

    .line 282
    add-int/2addr v7, v8

    .line 283
    add-int/lit8 v7, v7, 0x1

    .line 284
    .line 285
    move/from16 v22, v10

    .line 286
    .line 287
    move/from16 v23, v15

    .line 288
    .line 289
    const/4 v10, 0x0

    .line 290
    const/4 v11, 0x0

    .line 291
    :goto_5
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 292
    .line 293
    .line 294
    move-result v15

    .line 295
    if-ge v11, v15, :cond_13

    .line 296
    .line 297
    new-instance v15, Lcom/bef/effectsdk/text/data/CharLayout;

    .line 298
    .line 299
    invoke-direct {v15}, Lcom/bef/effectsdk/text/data/CharLayout;-><init>()V

    .line 300
    .line 301
    .line 302
    move/from16 v24, v4

    .line 303
    .line 304
    const/4 v4, 0x0

    .line 305
    iput v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 306
    .line 307
    iput-boolean v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->isEmoji:Z

    .line 308
    .line 309
    add-int/lit8 v4, v10, 0x1

    .line 310
    .line 311
    iput v10, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charId:I

    .line 312
    .line 313
    move/from16 v25, v4

    .line 314
    .line 315
    move/from16 v10, v20

    .line 316
    .line 317
    :goto_6
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 318
    .line 319
    .line 320
    move-result v4

    .line 321
    move/from16 v26, v10

    .line 322
    .line 323
    add-int v10, v26, v11

    .line 324
    .line 325
    move-object/from16 v27, v5

    .line 326
    .line 327
    add-int/lit8 v5, v10, 0x1

    .line 328
    .line 329
    if-le v4, v5, :cond_e

    .line 330
    .line 331
    add-int/lit8 v4, v10, -0x1

    .line 332
    .line 333
    invoke-virtual {v0, v4, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 334
    .line 335
    .line 336
    move-result-object v4

    .line 337
    invoke-virtual {v0, v10, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v5

    .line 341
    const-string v10, "\ud800"

    .line 342
    .line 343
    invoke-virtual {v4, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 344
    .line 345
    .line 346
    move-result v28

    .line 347
    move-object/from16 v29, v9

    .line 348
    .line 349
    const-string v9, "\udbff"

    .line 350
    .line 351
    if-ltz v28, :cond_d

    .line 352
    .line 353
    invoke-virtual {v4, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 354
    .line 355
    .line 356
    move-result v4

    .line 357
    if-gtz v4, :cond_d

    .line 358
    .line 359
    const-string v4, "\udc00"

    .line 360
    .line 361
    invoke-virtual {v5, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 362
    .line 363
    .line 364
    move-result v4

    .line 365
    if-ltz v4, :cond_d

    .line 366
    .line 367
    const-string v4, "\udfff"

    .line 368
    .line 369
    invoke-virtual {v5, v4}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    move-result v4

    .line 373
    if-gtz v4, :cond_d

    .line 374
    .line 375
    move/from16 v4, v20

    .line 376
    .line 377
    iput-boolean v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->isEmoji:Z

    .line 378
    .line 379
    add-int/lit8 v4, v26, 0x1

    .line 380
    .line 381
    int-to-short v4, v4

    .line 382
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 383
    .line 384
    .line 385
    move-result v5

    .line 386
    move/from16 v26, v4

    .line 387
    .line 388
    add-int/lit8 v4, v11, 0x3

    .line 389
    .line 390
    if-ge v5, v4, :cond_d

    .line 391
    .line 392
    :goto_7
    move-object/from16 v28, v14

    .line 393
    .line 394
    :cond_c
    move/from16 v10, v26

    .line 395
    .line 396
    goto :goto_8

    .line 397
    :cond_d
    add-int v4, v11, v26

    .line 398
    .line 399
    add-int/lit8 v5, v4, 0x1

    .line 400
    .line 401
    move-object/from16 v28, v14

    .line 402
    .line 403
    invoke-virtual {v0, v4, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v14

    .line 407
    add-int/lit8 v4, v4, 0x2

    .line 408
    .line 409
    invoke-virtual {v0, v5, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object v4

    .line 413
    const-string v5, "\u200d"

    .line 414
    .line 415
    invoke-virtual {v14, v5}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 416
    .line 417
    .line 418
    move-result v5

    .line 419
    if-nez v5, :cond_c

    .line 420
    .line 421
    invoke-virtual {v4, v10}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 422
    .line 423
    .line 424
    move-result v5

    .line 425
    if-ltz v5, :cond_c

    .line 426
    .line 427
    invoke-virtual {v4, v9}, Ljava/lang/String;->compareTo(Ljava/lang/String;)I

    .line 428
    .line 429
    .line 430
    move-result v4

    .line 431
    if-gtz v4, :cond_c

    .line 432
    .line 433
    add-int/lit8 v4, v26, 0x2

    .line 434
    .line 435
    int-to-short v10, v4

    .line 436
    move-object/from16 v5, v27

    .line 437
    .line 438
    move-object/from16 v14, v28

    .line 439
    .line 440
    move-object/from16 v9, v29

    .line 441
    .line 442
    const/16 v20, 0x1

    .line 443
    .line 444
    goto :goto_6

    .line 445
    :cond_e
    move-object/from16 v29, v9

    .line 446
    .line 447
    goto :goto_7

    .line 448
    :goto_8
    iget-boolean v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->isEmoji:Z

    .line 449
    .line 450
    if-nez v4, :cond_f

    .line 451
    .line 452
    add-int v4, v11, v10

    .line 453
    .line 454
    invoke-virtual {v0, v11, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 455
    .line 456
    .line 457
    move-result-object v4

    .line 458
    invoke-virtual {v4}, Ljava/lang/String;->getBytes()[B

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    const/4 v5, 0x0

    .line 463
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 464
    .line 465
    const/4 v5, 0x0

    .line 466
    :goto_9
    array-length v9, v4

    .line 467
    if-ge v5, v9, :cond_f

    .line 468
    .line 469
    iget v9, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 470
    .line 471
    aget-byte v14, v4, v5

    .line 472
    .line 473
    and-int/lit16 v14, v14, 0xff

    .line 474
    .line 475
    move/from16 v26, v5

    .line 476
    .line 477
    array-length v5, v4

    .line 478
    sub-int v5, v5, v26

    .line 479
    .line 480
    const/16 v20, 0x1

    .line 481
    .line 482
    add-int/lit8 v5, v5, -0x1

    .line 483
    .line 484
    mul-int/lit8 v5, v5, 0x8

    .line 485
    .line 486
    shl-int v5, v14, v5

    .line 487
    .line 488
    add-int/2addr v9, v5

    .line 489
    iput v9, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 490
    .line 491
    add-int/lit8 v5, v26, 0x1

    .line 492
    .line 493
    goto :goto_9

    .line 494
    :cond_f
    iget v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 495
    .line 496
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 497
    .line 498
    .line 499
    move-result-object v4

    .line 500
    invoke-interface {v13, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    move-result-object v4

    .line 504
    check-cast v4, Lcom/bef/effectsdk/text/data/CharLayout;

    .line 505
    .line 506
    if-eqz v4, :cond_11

    .line 507
    .line 508
    iget-boolean v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->isEmoji:Z

    .line 509
    .line 510
    if-eqz v5, :cond_10

    .line 511
    .line 512
    goto :goto_b

    .line 513
    :cond_10
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->pos_left:F

    .line 514
    .line 515
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_left:F

    .line 516
    .line 517
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->pos_top:F

    .line 518
    .line 519
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_top:F

    .line 520
    .line 521
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->pos_right:F

    .line 522
    .line 523
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_right:F

    .line 524
    .line 525
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->pos_bottom:F

    .line 526
    .line 527
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_bottom:F

    .line 528
    .line 529
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 530
    .line 531
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 532
    .line 533
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 534
    .line 535
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 536
    .line 537
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 538
    .line 539
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 540
    .line 541
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 542
    .line 543
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 544
    .line 545
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 546
    .line 547
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 548
    .line 549
    iget v5, v4, Lcom/bef/effectsdk/text/data/CharLayout;->origin:F

    .line 550
    .line 551
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->origin:F

    .line 552
    .line 553
    iget v4, v4, Lcom/bef/effectsdk/text/data/CharLayout;->advance:F

    .line 554
    .line 555
    iput v4, v15, Lcom/bef/effectsdk/text/data/CharLayout;->advance:F

    .line 556
    .line 557
    move/from16 v26, v10

    .line 558
    .line 559
    move-object/from16 v31, v28

    .line 560
    .line 561
    :goto_a
    move-object/from16 v4, v29

    .line 562
    .line 563
    goto/16 :goto_d

    .line 564
    .line 565
    :cond_11
    :goto_b
    new-instance v4, Landroid/graphics/Rect;

    .line 566
    .line 567
    invoke-direct {v4}, Landroid/graphics/Rect;-><init>()V

    .line 568
    .line 569
    .line 570
    add-int v5, v11, v10

    .line 571
    .line 572
    invoke-virtual {v12, v0, v11, v5, v4}, Landroid/graphics/Paint;->getTextBounds(Ljava/lang/String;IILandroid/graphics/Rect;)V

    .line 573
    .line 574
    .line 575
    iget v9, v4, Landroid/graphics/Rect;->left:I

    .line 576
    .line 577
    int-to-float v9, v9

    .line 578
    iget v14, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 579
    .line 580
    move/from16 v26, v9

    .line 581
    .line 582
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 583
    .line 584
    div-float v9, v9, v17

    .line 585
    .line 586
    sub-float/2addr v14, v9

    .line 587
    const/4 v9, 0x0

    .line 588
    invoke-static {v14, v9}, Ljava/lang/Math;->min(FF)F

    .line 589
    .line 590
    .line 591
    move-result v14

    .line 592
    add-float v14, v26, v14

    .line 593
    .line 594
    float-to-int v14, v14

    .line 595
    iput v14, v4, Landroid/graphics/Rect;->left:I

    .line 596
    .line 597
    iget v14, v4, Landroid/graphics/Rect;->right:I

    .line 598
    .line 599
    int-to-float v14, v14

    .line 600
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 601
    .line 602
    move/from16 v26, v9

    .line 603
    .line 604
    iget v9, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 605
    .line 606
    div-float v9, v9, v17

    .line 607
    .line 608
    add-float v9, v26, v9

    .line 609
    .line 610
    move/from16 v26, v10

    .line 611
    .line 612
    const/4 v10, 0x0

    .line 613
    invoke-static {v9, v10}, Ljava/lang/Math;->max(FF)F

    .line 614
    .line 615
    .line 616
    move-result v9

    .line 617
    add-float/2addr v14, v9

    .line 618
    float-to-int v9, v14

    .line 619
    iput v9, v4, Landroid/graphics/Rect;->right:I

    .line 620
    .line 621
    iget v9, v4, Landroid/graphics/Rect;->bottom:I

    .line 622
    .line 623
    int-to-float v9, v9

    .line 624
    iget v14, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 625
    .line 626
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 627
    .line 628
    div-float v10, v10, v17

    .line 629
    .line 630
    add-float/2addr v14, v10

    .line 631
    const/4 v10, 0x0

    .line 632
    invoke-static {v14, v10}, Ljava/lang/Math;->max(FF)F

    .line 633
    .line 634
    .line 635
    move-result v14

    .line 636
    add-float/2addr v9, v14

    .line 637
    float-to-int v9, v9

    .line 638
    iput v9, v4, Landroid/graphics/Rect;->bottom:I

    .line 639
    .line 640
    iget v9, v4, Landroid/graphics/Rect;->top:I

    .line 641
    .line 642
    int-to-float v9, v9

    .line 643
    iget v14, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 644
    .line 645
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 646
    .line 647
    div-float v10, v10, v17

    .line 648
    .line 649
    sub-float/2addr v14, v10

    .line 650
    const/4 v10, 0x0

    .line 651
    invoke-static {v14, v10}, Ljava/lang/Math;->min(FF)F

    .line 652
    .line 653
    .line 654
    move-result v14

    .line 655
    add-float/2addr v9, v14

    .line 656
    float-to-int v9, v9

    .line 657
    iput v9, v4, Landroid/graphics/Rect;->top:I

    .line 658
    .line 659
    invoke-virtual {v12, v0, v11, v5}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    .line 660
    .line 661
    .line 662
    move-result v9

    .line 663
    iput v9, v15, Lcom/bef/effectsdk/text/data/CharLayout;->advance:F

    .line 664
    .line 665
    int-to-float v10, v3

    .line 666
    add-float/2addr v10, v9

    .line 667
    add-float v10, v10, v23

    .line 668
    .line 669
    int-to-float v14, v6

    .line 670
    add-float/2addr v10, v14

    .line 671
    const/high16 v30, 0x3f800000    # 1.0f

    .line 672
    .line 673
    add-float v10, v10, v30

    .line 674
    .line 675
    move/from16 v31, v3

    .line 676
    .line 677
    int-to-float v3, v2

    .line 678
    cmpl-float v3, v10, v3

    .line 679
    .line 680
    if-ltz v3, :cond_12

    .line 681
    .line 682
    iget v3, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 683
    .line 684
    neg-float v3, v3

    .line 685
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 686
    .line 687
    div-float v10, v10, v17

    .line 688
    .line 689
    add-float/2addr v3, v10

    .line 690
    const/4 v10, 0x0

    .line 691
    invoke-static {v3, v10}, Ljava/lang/Math;->max(FF)F

    .line 692
    .line 693
    .line 694
    move-result v3

    .line 695
    float-to-int v3, v3

    .line 696
    add-int/2addr v3, v6

    .line 697
    const/16 v20, 0x1

    .line 698
    .line 699
    add-int/lit8 v3, v3, 0x1

    .line 700
    .line 701
    int-to-float v7, v7

    .line 702
    iget v10, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 703
    .line 704
    add-float v10, v10, v22

    .line 705
    .line 706
    move/from16 v31, v3

    .line 707
    .line 708
    int-to-float v3, v8

    .line 709
    add-float/2addr v10, v3

    .line 710
    add-float v10, v10, v30

    .line 711
    .line 712
    add-float/2addr v7, v10

    .line 713
    float-to-int v7, v7

    .line 714
    const/high16 v3, 0x400000

    .line 715
    .line 716
    div-int/2addr v3, v2

    .line 717
    if-lt v7, v3, :cond_12

    .line 718
    .line 719
    move-object/from16 v31, v28

    .line 720
    .line 721
    move-object/from16 v4, v29

    .line 722
    .line 723
    :goto_c
    const/4 v5, 0x0

    .line 724
    goto/16 :goto_e

    .line 725
    .line 726
    :cond_12
    move/from16 v3, v31

    .line 727
    .line 728
    new-instance v10, Landroid/graphics/Rect;

    .line 729
    .line 730
    invoke-direct {v10, v11, v5, v3, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 731
    .line 732
    .line 733
    move-object/from16 v5, v28

    .line 734
    .line 735
    invoke-interface {v5, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 736
    .line 737
    .line 738
    int-to-float v10, v7

    .line 739
    iput v10, v15, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 740
    .line 741
    int-to-float v10, v3

    .line 742
    iput v10, v15, Lcom/bef/effectsdk/text/data/CharLayout;->origin:F

    .line 743
    .line 744
    move/from16 v28, v3

    .line 745
    .line 746
    iget v3, v4, Landroid/graphics/Rect;->left:I

    .line 747
    .line 748
    move-object/from16 v31, v5

    .line 749
    .line 750
    int-to-float v5, v3

    .line 751
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_left:F

    .line 752
    .line 753
    iget v5, v4, Landroid/graphics/Rect;->top:I

    .line 754
    .line 755
    move/from16 v32, v3

    .line 756
    .line 757
    int-to-float v3, v5

    .line 758
    iput v3, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_top:F

    .line 759
    .line 760
    iget v3, v4, Landroid/graphics/Rect;->right:I

    .line 761
    .line 762
    move/from16 v33, v5

    .line 763
    .line 764
    int-to-float v5, v3

    .line 765
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_right:F

    .line 766
    .line 767
    iget v4, v4, Landroid/graphics/Rect;->bottom:I

    .line 768
    .line 769
    int-to-float v5, v4

    .line 770
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->pos_bottom:F

    .line 771
    .line 772
    add-int v5, v32, v28

    .line 773
    .line 774
    int-to-float v5, v5

    .line 775
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 776
    .line 777
    add-int v5, v33, v7

    .line 778
    .line 779
    int-to-float v5, v5

    .line 780
    iput v5, v15, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 781
    .line 782
    add-int v3, v3, v28

    .line 783
    .line 784
    int-to-float v3, v3

    .line 785
    iput v3, v15, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 786
    .line 787
    add-int/2addr v4, v7

    .line 788
    int-to-float v3, v4

    .line 789
    iput v3, v15, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 790
    .line 791
    iget v3, v15, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 792
    .line 793
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 794
    .line 795
    .line 796
    move-result-object v3

    .line 797
    invoke-interface {v13, v3, v15}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 798
    .line 799
    .line 800
    add-float v9, v9, v23

    .line 801
    .line 802
    add-float/2addr v9, v14

    .line 803
    add-float v9, v9, v30

    .line 804
    .line 805
    add-float/2addr v10, v9

    .line 806
    float-to-int v3, v10

    .line 807
    goto/16 :goto_a

    .line 808
    .line 809
    :goto_d
    invoke-interface {v4, v15}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 810
    .line 811
    .line 812
    add-int v11, v11, v26

    .line 813
    .line 814
    move-object v9, v4

    .line 815
    move/from16 v4, v24

    .line 816
    .line 817
    move/from16 v10, v25

    .line 818
    .line 819
    move-object/from16 v5, v27

    .line 820
    .line 821
    move-object/from16 v14, v31

    .line 822
    .line 823
    const/16 v20, 0x1

    .line 824
    .line 825
    goto/16 :goto_5

    .line 826
    .line 827
    :cond_13
    move/from16 v24, v4

    .line 828
    .line 829
    move-object/from16 v27, v5

    .line 830
    .line 831
    move-object v4, v9

    .line 832
    move-object/from16 v31, v14

    .line 833
    .line 834
    goto :goto_c

    .line 835
    :goto_e
    new-array v3, v5, [Lcom/bef/effectsdk/text/data/CharLayout;

    .line 836
    .line 837
    invoke-interface {v4, v3}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 838
    .line 839
    .line 840
    move-result-object v3

    .line 841
    check-cast v3, [Lcom/bef/effectsdk/text/data/CharLayout;

    .line 842
    .line 843
    move-object/from16 v4, v27

    .line 844
    .line 845
    iput-object v3, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 846
    .line 847
    iget v1, v1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 848
    .line 849
    float-to-int v1, v1

    .line 850
    add-int/2addr v7, v1

    .line 851
    sget-object v1, Lcom/bef/effectsdk/text/TextLayoutUtils$1;->$SwitchMap$com$bef$effectsdk$text$TextLayoutUtils$COLOR_TYPE:[I

    .line 852
    .line 853
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 854
    .line 855
    .line 856
    move-result v3

    .line 857
    aget v1, v1, v3

    .line 858
    .line 859
    const/4 v3, 0x1

    .line 860
    if-eq v1, v3, :cond_14

    .line 861
    .line 862
    sget-object v1, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 863
    .line 864
    invoke-static {v2, v7, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 865
    .line 866
    .line 867
    move-result-object v1

    .line 868
    const/4 v3, 0x4

    .line 869
    iput v3, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 870
    .line 871
    goto :goto_f

    .line 872
    :cond_14
    sget-object v1, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 873
    .line 874
    invoke-static {v2, v7, v1}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 875
    .line 876
    .line 877
    move-result-object v1

    .line 878
    iput v3, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 879
    .line 880
    :goto_f
    if-nez v1, :cond_15

    .line 881
    .line 882
    return-object v18

    .line 883
    :cond_15
    new-instance v3, Landroid/graphics/Paint;

    .line 884
    .line 885
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 886
    .line 887
    .line 888
    move/from16 v5, v24

    .line 889
    .line 890
    invoke-virtual {v3, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 891
    .line 892
    .line 893
    new-instance v5, Landroid/graphics/Canvas;

    .line 894
    .line 895
    invoke-direct {v5, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 896
    .line 897
    .line 898
    new-instance v6, Landroid/graphics/Rect;

    .line 899
    .line 900
    const/4 v8, 0x0

    .line 901
    invoke-direct {v6, v8, v8, v2, v7}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 902
    .line 903
    .line 904
    invoke-virtual {v5, v6, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 905
    .line 906
    .line 907
    invoke-interface/range {v31 .. v31}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 908
    .line 909
    .line 910
    move-result-object v3

    .line 911
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 912
    .line 913
    .line 914
    move-result v6

    .line 915
    if-eqz v6, :cond_16

    .line 916
    .line 917
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 918
    .line 919
    .line 920
    move-result-object v6

    .line 921
    check-cast v6, Landroid/graphics/Rect;

    .line 922
    .line 923
    iget v9, v6, Landroid/graphics/Rect;->left:I

    .line 924
    .line 925
    iget v10, v6, Landroid/graphics/Rect;->top:I

    .line 926
    .line 927
    invoke-virtual {v0, v9, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 928
    .line 929
    .line 930
    move-result-object v9

    .line 931
    iget v10, v6, Landroid/graphics/Rect;->right:I

    .line 932
    .line 933
    int-to-float v10, v10

    .line 934
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 935
    .line 936
    int-to-float v6, v6

    .line 937
    invoke-virtual {v5, v9, v10, v6, v12}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 938
    .line 939
    .line 940
    goto :goto_10

    .line 941
    :cond_16
    iput-object v1, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 942
    .line 943
    :goto_11
    iget-object v0, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 944
    .line 945
    array-length v1, v0

    .line 946
    if-ge v8, v1, :cond_17

    .line 947
    .line 948
    aget-object v0, v0, v8

    .line 949
    .line 950
    iget v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 951
    .line 952
    int-to-float v3, v7

    .line 953
    div-float/2addr v1, v3

    .line 954
    iput v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 955
    .line 956
    iget v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 957
    .line 958
    div-float/2addr v1, v3

    .line 959
    iput v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 960
    .line 961
    iget v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 962
    .line 963
    int-to-float v3, v2

    .line 964
    div-float/2addr v1, v3

    .line 965
    iput v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 966
    .line 967
    iget v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 968
    .line 969
    div-float/2addr v1, v3

    .line 970
    iput v1, v0, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 971
    .line 972
    add-int/lit8 v8, v8, 0x1

    .line 973
    .line 974
    goto :goto_11

    .line 975
    :cond_17
    move-object/from16 v0, v18

    .line 976
    .line 977
    invoke-virtual {v5, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 978
    .line 979
    .line 980
    return-object v4
.end method

.method public static generateBitmapNeonAlphaUTF32([ILcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 3
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([III)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, p1}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapNeonAlphaUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0

    .line 20
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public static generateBitmapNeonAlphaUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 2
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    iget v0, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->bitmapType:I

    .line 2
    .line 3
    invoke-static {v0}, Lcom/bef/effectsdk/text/data/BitmapType;->valueOf(I)Lcom/bef/effectsdk/text/data/BitmapType;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sget-object v1, Lcom/bef/effectsdk/text/TextLayoutUtils$1;->$SwitchMap$com$bef$effectsdk$text$data$BitmapType:[I

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    aget v0, v1, v0

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eq v0, v1, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    if-eq v0, v1, :cond_0

    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    .line 23
    :cond_0
    invoke-static {p0, p1}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateTextAutoSizedNeonBitmap(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_1
    invoke-static {p0, p1}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateTextAutoSizedShakeBitmap(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static generateBitmapNormalAlphaUTF32([ILcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 3
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([III)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_ALPHA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 16
    .line 17
    invoke-static {v0, p1, p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapNormalUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static generateBitmapNormalAlphaUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_ALPHA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapNormalUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method public static generateBitmapNormalRGBAUTF32([ILcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 3
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x1

    .line 5
    if-ge v0, v1, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    new-instance v0, Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    array-length v2, p0

    .line 12
    invoke-direct {v0, p0, v1, v2}, Ljava/lang/String;-><init>([III)V

    .line 13
    .line 14
    .line 15
    sget-object p0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_RGBA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 16
    .line 17
    invoke-static {v0, p1, p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapNormalUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0

    .line 22
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 23
    return-object p0
.end method

.method public static generateBitmapNormalRGBAUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 1
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;->COLOR_TYPE_RGBA:Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;

    .line 11
    .line 12
    invoke-static {p0, p1, v0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->generateBitmapNormalUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0

    .line 17
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 18
    return-object p0
.end method

.method private static generateBitmapNormalUTF8(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;Lcom/bef/effectsdk/text/TextLayoutUtils$COLOR_TYPE;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v11, p1

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    const/4 v12, 0x0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-object v12

    .line 13
    :cond_0
    sget-object v0, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 14
    .line 15
    iget-object v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz v2, :cond_2

    .line 18
    .line 19
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    if-nez v2, :cond_2

    .line 24
    .line 25
    iget-object v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    if-nez v0, :cond_1

    .line 34
    .line 35
    iget-object v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 36
    .line 37
    iget-object v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v0, v2}, Lcom/bef/effectsdk/text/FontCache;->getFromFile(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    iget-object v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 45
    .line 46
    iget v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontStyle:I

    .line 47
    .line 48
    invoke-static {v0, v2}, Lcom/bef/effectsdk/text/FontCache;->getFromSystem(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    :cond_2
    :goto_0
    iget v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textColor:I

    .line 53
    .line 54
    iget v3, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->backColor:I

    .line 55
    .line 56
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowColor:I

    .line 57
    .line 58
    sget-object v5, Lcom/bef/effectsdk/text/TextLayoutUtils$1;->$SwitchMap$com$bef$effectsdk$text$TextLayoutUtils$COLOR_TYPE:[I

    .line 59
    .line 60
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 61
    .line 62
    .line 63
    move-result v6

    .line 64
    aget v5, v5, v6

    .line 65
    .line 66
    const/4 v13, 0x1

    .line 67
    if-eq v5, v13, :cond_3

    .line 68
    .line 69
    and-int/lit16 v5, v2, 0xff

    .line 70
    .line 71
    shl-int/lit8 v5, v5, 0x18

    .line 72
    .line 73
    shr-int/lit8 v2, v2, 0x8

    .line 74
    .line 75
    const v6, 0xffffff

    .line 76
    .line 77
    .line 78
    and-int/2addr v2, v6

    .line 79
    add-int/2addr v5, v2

    .line 80
    and-int/lit16 v2, v3, 0xff

    .line 81
    .line 82
    shl-int/lit8 v2, v2, 0x18

    .line 83
    .line 84
    shr-int/lit8 v3, v3, 0x8

    .line 85
    .line 86
    and-int/2addr v3, v6

    .line 87
    add-int/2addr v2, v3

    .line 88
    and-int/lit16 v3, v4, 0xff

    .line 89
    .line 90
    shl-int/lit8 v3, v3, 0x18

    .line 91
    .line 92
    shr-int/lit8 v4, v4, 0x8

    .line 93
    .line 94
    and-int/2addr v4, v6

    .line 95
    add-int/2addr v3, v4

    .line 96
    :goto_1
    move v14, v2

    .line 97
    goto :goto_2

    .line 98
    :cond_3
    and-int/lit16 v2, v2, 0xff

    .line 99
    .line 100
    shl-int/lit8 v5, v2, 0x18

    .line 101
    .line 102
    and-int/lit16 v2, v3, 0xff

    .line 103
    .line 104
    shl-int/lit8 v2, v2, 0x18

    .line 105
    .line 106
    and-int/lit16 v3, v4, 0xff

    .line 107
    .line 108
    shl-int/lit8 v3, v3, 0x18

    .line 109
    .line 110
    goto :goto_1

    .line 111
    :goto_2
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 112
    .line 113
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->paintStyle:I

    .line 114
    .line 115
    const/4 v6, 0x2

    .line 116
    if-eqz v4, :cond_4

    .line 117
    .line 118
    if-eq v4, v13, :cond_6

    .line 119
    .line 120
    if-eq v4, v6, :cond_5

    .line 121
    .line 122
    :cond_4
    const/4 v4, 0x0

    .line 123
    goto :goto_3

    .line 124
    :cond_5
    sget-object v2, Landroid/graphics/Paint$Style;->FILL_AND_STROKE:Landroid/graphics/Paint$Style;

    .line 125
    .line 126
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->strokeWidth:F

    .line 127
    .line 128
    goto :goto_3

    .line 129
    :cond_6
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 130
    .line 131
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->strokeWidth:F

    .line 132
    .line 133
    :goto_3
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 134
    .line 135
    iget v8, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textAlign:I

    .line 136
    .line 137
    if-eqz v8, :cond_9

    .line 138
    .line 139
    if-eq v8, v13, :cond_8

    .line 140
    .line 141
    if-eq v8, v6, :cond_7

    .line 142
    .line 143
    goto :goto_4

    .line 144
    :cond_7
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_CENTER:Landroid/text/Layout$Alignment;

    .line 145
    .line 146
    goto :goto_4

    .line 147
    :cond_8
    sget-object v7, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 148
    .line 149
    :cond_9
    :goto_4
    iget v8, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->maxLine:I

    .line 150
    .line 151
    iget v9, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 152
    .line 153
    const/16 v16, 0x0

    .line 154
    .line 155
    if-nez v9, :cond_a

    .line 156
    .line 157
    move v8, v13

    .line 158
    const/16 v9, 0x800

    .line 159
    .line 160
    const/16 v10, 0x800

    .line 161
    .line 162
    const/16 v17, 0x0

    .line 163
    .line 164
    :goto_5
    move-object/from16 v18, v12

    .line 165
    .line 166
    goto :goto_6

    .line 167
    :cond_a
    move v10, v9

    .line 168
    move/from16 v17, v13

    .line 169
    .line 170
    goto :goto_5

    .line 171
    :goto_6
    const/4 v12, 0x4

    .line 172
    if-ne v8, v13, :cond_f

    .line 173
    .line 174
    iget v15, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineBreakMode:I

    .line 175
    .line 176
    if-eqz v15, :cond_e

    .line 177
    .line 178
    if-eq v15, v13, :cond_e

    .line 179
    .line 180
    if-eq v15, v6, :cond_d

    .line 181
    .line 182
    const/4 v6, 0x3

    .line 183
    if-eq v15, v6, :cond_c

    .line 184
    .line 185
    if-eq v15, v12, :cond_b

    .line 186
    .line 187
    move-object/from16 v6, v18

    .line 188
    .line 189
    :goto_7
    const/16 v15, 0x800

    .line 190
    .line 191
    const/16 v17, 0x0

    .line 192
    .line 193
    goto :goto_8

    .line 194
    :cond_b
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->END:Landroid/text/TextUtils$TruncateAt;

    .line 195
    .line 196
    goto :goto_7

    .line 197
    :cond_c
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MIDDLE:Landroid/text/TextUtils$TruncateAt;

    .line 198
    .line 199
    goto :goto_7

    .line 200
    :cond_d
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->START:Landroid/text/TextUtils$TruncateAt;

    .line 201
    .line 202
    goto :goto_7

    .line 203
    :cond_e
    sget-object v6, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 204
    .line 205
    goto :goto_7

    .line 206
    :cond_f
    move-object/from16 v6, v18

    .line 207
    .line 208
    const/16 v15, 0x800

    .line 209
    .line 210
    :goto_8
    if-le v10, v15, :cond_10

    .line 211
    .line 212
    move v10, v15

    .line 213
    :cond_10
    if-le v9, v15, :cond_11

    .line 214
    .line 215
    const/16 v9, 0x800

    .line 216
    .line 217
    :cond_11
    if-nez v8, :cond_12

    .line 218
    .line 219
    const v8, 0x7fffffff

    .line 220
    .line 221
    .line 222
    :cond_12
    move v15, v8

    .line 223
    new-instance v8, Landroid/text/TextPaint;

    .line 224
    .line 225
    invoke-direct {v8, v13}, Landroid/text/TextPaint;-><init>(I)V

    .line 226
    .line 227
    .line 228
    if-eqz v0, :cond_13

    .line 229
    .line 230
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 231
    .line 232
    .line 233
    :cond_13
    invoke-virtual {v8, v5}, Landroid/graphics/Paint;->setColor(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v8, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 237
    .line 238
    .line 239
    invoke-virtual {v8, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 240
    .line 241
    .line 242
    iget v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 243
    .line 244
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 245
    .line 246
    .line 247
    iget v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowRadius:F

    .line 248
    .line 249
    iget v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDx:F

    .line 250
    .line 251
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->shadowDy:F

    .line 252
    .line 253
    invoke-virtual {v8, v0, v2, v4, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 254
    .line 255
    .line 256
    iget v0, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->letterSpacing:F

    .line 257
    .line 258
    invoke-virtual {v8, v0}, Landroid/graphics/Paint;->setLetterSpacing(F)V

    .line 259
    .line 260
    .line 261
    move-object v4, v7

    .line 262
    invoke-static {v1, v8}, Landroid/text/BoringLayout;->isBoring(Ljava/lang/CharSequence;Landroid/text/TextPaint;)Landroid/text/BoringLayout$Metrics;

    .line 263
    .line 264
    .line 265
    move-result-object v7

    .line 266
    if-ne v15, v13, :cond_14

    .line 267
    .line 268
    if-eqz v7, :cond_14

    .line 269
    .line 270
    sget-object v0, Landroid/text/TextUtils$TruncateAt;->MARQUEE:Landroid/text/TextUtils$TruncateAt;

    .line 271
    .line 272
    if-eq v6, v0, :cond_14

    .line 273
    .line 274
    new-instance v0, Landroid/text/BoringLayout;

    .line 275
    .line 276
    iget v5, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingMult:F

    .line 277
    .line 278
    move v3, v9

    .line 279
    move-object v9, v6

    .line 280
    iget v6, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingAdd:F

    .line 281
    .line 282
    move-object v2, v8

    .line 283
    const/4 v8, 0x1

    .line 284
    const/4 v12, 0x0

    .line 285
    invoke-direct/range {v0 .. v10}, Landroid/text/BoringLayout;-><init>(Ljava/lang/CharSequence;Landroid/text/TextPaint;ILandroid/text/Layout$Alignment;FFLandroid/text/BoringLayout$Metrics;ZLandroid/text/TextUtils$TruncateAt;I)V

    .line 286
    .line 287
    .line 288
    goto :goto_9

    .line 289
    :cond_14
    move-object v2, v8

    .line 290
    move v3, v9

    .line 291
    const/4 v12, 0x0

    .line 292
    move-object v9, v6

    .line 293
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    invoke-static {v1, v12, v0, v2, v3}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    invoke-virtual {v0, v4}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 302
    .line 303
    .line 304
    move-result-object v0

    .line 305
    iget v1, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingAdd:F

    .line 306
    .line 307
    iget v4, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingMult:F

    .line 308
    .line 309
    invoke-virtual {v0, v1, v4}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    .line 310
    .line 311
    .line 312
    move-result-object v0

    .line 313
    invoke-virtual {v0, v13}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-virtual {v0, v9}, Landroid/text/StaticLayout$Builder;->setEllipsize(Landroid/text/TextUtils$TruncateAt;)Landroid/text/StaticLayout$Builder;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    invoke-virtual {v0, v10}, Landroid/text/StaticLayout$Builder;->setEllipsizedWidth(I)Landroid/text/StaticLayout$Builder;

    .line 322
    .line 323
    .line 324
    move-result-object v0

    .line 325
    invoke-virtual {v0}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    :goto_9
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    .line 330
    .line 331
    .line 332
    move-result v1

    .line 333
    invoke-static {v1, v15}, Ljava/lang/Math;->min(II)I

    .line 334
    .line 335
    .line 336
    move-result v1

    .line 337
    if-nez v1, :cond_15

    .line 338
    .line 339
    return-object v18

    .line 340
    :cond_15
    if-eqz v17, :cond_16

    .line 341
    .line 342
    move v10, v3

    .line 343
    :cond_16
    move v15, v10

    .line 344
    move v3, v12

    .line 345
    move v4, v3

    .line 346
    move v10, v4

    .line 347
    :goto_a
    if-ge v10, v1, :cond_18

    .line 348
    .line 349
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineBottom(I)I

    .line 350
    .line 351
    .line 352
    move-result v5

    .line 353
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    .line 354
    .line 355
    .line 356
    move-result v5

    .line 357
    const/16 v6, 0x800

    .line 358
    .line 359
    if-le v5, v6, :cond_17

    .line 360
    .line 361
    goto :goto_b

    .line 362
    :cond_17
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineRight(I)F

    .line 363
    .line 364
    .line 365
    move-result v5

    .line 366
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineLeft(I)F

    .line 367
    .line 368
    .line 369
    move-result v6

    .line 370
    sub-float/2addr v5, v6

    .line 371
    float-to-int v5, v5

    .line 372
    invoke-static {v5, v15}, Ljava/lang/Math;->max(II)I

    .line 373
    .line 374
    .line 375
    move-result v15

    .line 376
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineBottom(I)I

    .line 377
    .line 378
    .line 379
    move-result v5

    .line 380
    invoke-static {v5, v3}, Ljava/lang/Math;->max(II)I

    .line 381
    .line 382
    .line 383
    move-result v3

    .line 384
    add-int/lit8 v4, v4, 0x1

    .line 385
    .line 386
    add-int/lit8 v10, v10, 0x1

    .line 387
    .line 388
    goto :goto_a

    .line 389
    :cond_18
    const/16 v6, 0x800

    .line 390
    .line 391
    :goto_b
    if-le v15, v6, :cond_19

    .line 392
    .line 393
    move v15, v6

    .line 394
    :cond_19
    invoke-virtual {v0, v12}, Landroid/text/Layout;->getLineBottom(I)I

    .line 395
    .line 396
    .line 397
    move-result v1

    .line 398
    if-nez v1, :cond_1a

    .line 399
    .line 400
    return-object v18

    .line 401
    :cond_1a
    if-nez v4, :cond_1b

    .line 402
    .line 403
    move v3, v6

    .line 404
    move v4, v13

    .line 405
    :cond_1b
    invoke-virtual {v0}, Landroid/text/Layout;->getLineCount()I

    .line 406
    .line 407
    .line 408
    move-result v1

    .line 409
    if-ne v4, v1, :cond_1c

    .line 410
    .line 411
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 412
    .line 413
    .line 414
    move-result-object v1

    .line 415
    iget v2, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingAdd:F

    .line 416
    .line 417
    iget v5, v11, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineSpacingMult:F

    .line 418
    .line 419
    iget v6, v1, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 420
    .line 421
    iget v7, v1, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 422
    .line 423
    invoke-static {v7}, Ljava/lang/Math;->abs(F)F

    .line 424
    .line 425
    .line 426
    move-result v7

    .line 427
    add-float/2addr v6, v7

    .line 428
    iget v1, v1, Landroid/graphics/Paint$FontMetrics;->leading:F

    .line 429
    .line 430
    add-float/2addr v6, v1

    .line 431
    mul-float/2addr v5, v6

    .line 432
    add-float/2addr v2, v5

    .line 433
    add-int/lit8 v1, v4, -0x1

    .line 434
    .line 435
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineBottom(I)I

    .line 436
    .line 437
    .line 438
    move-result v5

    .line 439
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineTop(I)I

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    sub-int/2addr v5, v1

    .line 444
    int-to-float v1, v5

    .line 445
    sub-float/2addr v2, v1

    .line 446
    cmpl-float v1, v2, v16

    .line 447
    .line 448
    if-lez v1, :cond_1c

    .line 449
    .line 450
    const/high16 v1, 0x3f000000    # 0.5f

    .line 451
    .line 452
    add-float/2addr v1, v2

    .line 453
    int-to-float v2, v3

    .line 454
    add-float/2addr v2, v1

    .line 455
    float-to-int v3, v2

    .line 456
    move/from16 v16, v1

    .line 457
    .line 458
    :cond_1c
    new-instance v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 459
    .line 460
    invoke-direct {v1}, Lcom/bef/effectsdk/text/data/TextBitmapResult;-><init>()V

    .line 461
    .line 462
    .line 463
    const/4 v2, 0x4

    .line 464
    iput v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 465
    .line 466
    iput v4, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->lineCount:I

    .line 467
    .line 468
    iput v13, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->type:I

    .line 469
    .line 470
    new-array v2, v4, [Lcom/bef/effectsdk/text/data/CharLayout;

    .line 471
    .line 472
    iput-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 473
    .line 474
    move v10, v12

    .line 475
    :goto_c
    if-ge v10, v4, :cond_1e

    .line 476
    .line 477
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 478
    .line 479
    new-instance v5, Lcom/bef/effectsdk/text/data/CharLayout;

    .line 480
    .line 481
    invoke-direct {v5}, Lcom/bef/effectsdk/text/data/CharLayout;-><init>()V

    .line 482
    .line 483
    .line 484
    aput-object v5, v2, v10

    .line 485
    .line 486
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 487
    .line 488
    aget-object v2, v2, v10

    .line 489
    .line 490
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineBaseline(I)I

    .line 491
    .line 492
    .line 493
    move-result v5

    .line 494
    int-to-float v5, v5

    .line 495
    int-to-float v6, v3

    .line 496
    div-float/2addr v5, v6

    .line 497
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 498
    .line 499
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 500
    .line 501
    aget-object v2, v2, v10

    .line 502
    .line 503
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineLeft(I)F

    .line 504
    .line 505
    .line 506
    move-result v5

    .line 507
    int-to-float v7, v15

    .line 508
    div-float/2addr v5, v7

    .line 509
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 510
    .line 511
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->pos_left:F

    .line 512
    .line 513
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 514
    .line 515
    aget-object v2, v2, v10

    .line 516
    .line 517
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineTop(I)I

    .line 518
    .line 519
    .line 520
    move-result v5

    .line 521
    int-to-float v5, v5

    .line 522
    div-float/2addr v5, v6

    .line 523
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 524
    .line 525
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->pos_top:F

    .line 526
    .line 527
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 528
    .line 529
    aget-object v2, v2, v10

    .line 530
    .line 531
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineRight(I)F

    .line 532
    .line 533
    .line 534
    move-result v5

    .line 535
    div-float/2addr v5, v7

    .line 536
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 537
    .line 538
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->pos_right:F

    .line 539
    .line 540
    add-int/lit8 v2, v4, -0x1

    .line 541
    .line 542
    iget-object v5, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 543
    .line 544
    if-ne v10, v2, :cond_1d

    .line 545
    .line 546
    aget-object v2, v5, v10

    .line 547
    .line 548
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineBottom(I)I

    .line 549
    .line 550
    .line 551
    move-result v5

    .line 552
    int-to-float v5, v5

    .line 553
    add-float v5, v5, v16

    .line 554
    .line 555
    div-float/2addr v5, v6

    .line 556
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 557
    .line 558
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->pos_bottom:F

    .line 559
    .line 560
    goto :goto_d

    .line 561
    :cond_1d
    aget-object v2, v5, v10

    .line 562
    .line 563
    invoke-virtual {v0, v10}, Landroid/text/Layout;->getLineBottom(I)I

    .line 564
    .line 565
    .line 566
    move-result v5

    .line 567
    int-to-float v5, v5

    .line 568
    div-float/2addr v5, v6

    .line 569
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 570
    .line 571
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->pos_bottom:F

    .line 572
    .line 573
    :goto_d
    iget-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 574
    .line 575
    aget-object v2, v2, v10

    .line 576
    .line 577
    const/4 v5, -0x2

    .line 578
    iput v5, v2, Lcom/bef/effectsdk/text/data/CharLayout;->charCode:I

    .line 579
    .line 580
    add-int/lit8 v10, v10, 0x1

    .line 581
    .line 582
    goto :goto_c

    .line 583
    :cond_1e
    sget-object v2, Lcom/bef/effectsdk/text/TextLayoutUtils$1;->$SwitchMap$com$bef$effectsdk$text$TextLayoutUtils$COLOR_TYPE:[I

    .line 584
    .line 585
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Enum;->ordinal()I

    .line 586
    .line 587
    .line 588
    move-result v4

    .line 589
    aget v2, v2, v4

    .line 590
    .line 591
    if-eq v2, v13, :cond_1f

    .line 592
    .line 593
    sget-object v2, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 594
    .line 595
    invoke-static {v15, v3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 596
    .line 597
    .line 598
    move-result-object v2

    .line 599
    const/4 v4, 0x4

    .line 600
    iput v4, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 601
    .line 602
    goto :goto_e

    .line 603
    :cond_1f
    sget-object v2, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 604
    .line 605
    invoke-static {v15, v3, v2}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 606
    .line 607
    .line 608
    move-result-object v2

    .line 609
    iput v13, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 610
    .line 611
    :goto_e
    invoke-virtual {v2, v13}, Landroid/graphics/Bitmap;->setPremultiplied(Z)V

    .line 612
    .line 613
    .line 614
    new-instance v4, Landroid/graphics/Canvas;

    .line 615
    .line 616
    invoke-direct {v4, v2}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 617
    .line 618
    .line 619
    new-instance v5, Landroid/graphics/Paint;

    .line 620
    .line 621
    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 622
    .line 623
    .line 624
    invoke-virtual {v5, v14}, Landroid/graphics/Paint;->setColor(I)V

    .line 625
    .line 626
    .line 627
    new-instance v6, Landroid/graphics/Rect;

    .line 628
    .line 629
    invoke-direct {v6, v12, v12, v15, v3}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 630
    .line 631
    .line 632
    invoke-virtual {v4, v6, v5}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 633
    .line 634
    .line 635
    invoke-virtual {v0, v4}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 636
    .line 637
    .line 638
    iput-object v2, v1, Lcom/bef/effectsdk/text/data/TextBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 639
    .line 640
    move-object/from16 v0, v18

    .line 641
    .line 642
    invoke-virtual {v4, v0}, Landroid/graphics/Canvas;->setBitmap(Landroid/graphics/Bitmap;)V

    .line 643
    .line 644
    .line 645
    return-object v1
.end method

.method public static generateTextAutoSizedNeonBitmap(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 13
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    invoke-static {p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->splitLyric(Ljava/lang/String;)[Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-nez p0, :cond_8

    .line 10
    .line 11
    if-nez p1, :cond_0

    .line 12
    .line 13
    goto/16 :goto_7

    .line 14
    .line 15
    :cond_0
    new-instance p0, Landroid/text/TextPaint;

    .line 16
    .line 17
    invoke-direct {p0}, Landroid/text/TextPaint;-><init>()V

    .line 18
    .line 19
    .line 20
    sget-object v1, Landroid/graphics/Paint$Align;->LEFT:Landroid/graphics/Paint$Align;

    .line 21
    .line 22
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 23
    .line 24
    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 27
    .line 28
    .line 29
    iget-object v2, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v2

    .line 35
    if-nez v2, :cond_1

    .line 36
    .line 37
    iget-object v2, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 38
    .line 39
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 40
    .line 41
    .line 42
    move-result v2

    .line 43
    if-nez v2, :cond_1

    .line 44
    .line 45
    iget-object v2, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 46
    .line 47
    iget-object v3, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {v2, v3}, Lcom/bef/effectsdk/text/FontCache;->getFromFile(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 54
    .line 55
    .line 56
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    iget v2, v2, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 61
    .line 62
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    iget v3, v3, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 67
    .line 68
    cmpg-float v2, v2, v3

    .line 69
    .line 70
    const/4 v3, 0x0

    .line 71
    if-gez v2, :cond_2

    .line 72
    .line 73
    move v2, v1

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    move v2, v3

    .line 76
    :goto_0
    new-instance v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 77
    .line 78
    invoke-direct {v4}, Lcom/bef/effectsdk/text/data/TextBitmapResult;-><init>()V

    .line 79
    .line 80
    .line 81
    iput v1, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 82
    .line 83
    array-length v1, v0

    .line 84
    iput v1, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->lineCount:I

    .line 85
    .line 86
    iput v3, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->type:I

    .line 87
    .line 88
    array-length v1, v0

    .line 89
    new-array v1, v1, [Lcom/bef/effectsdk/text/data/CharLayout;

    .line 90
    .line 91
    iput-object v1, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 92
    .line 93
    array-length v1, v0

    .line 94
    new-array v1, v1, [I

    .line 95
    .line 96
    const/4 v5, 0x0

    .line 97
    move v6, v3

    .line 98
    move v7, v5

    .line 99
    :goto_1
    array-length v8, v0

    .line 100
    if-ge v6, v8, :cond_5

    .line 101
    .line 102
    aget-object v8, v0, v6

    .line 103
    .line 104
    const/high16 v9, 0x41200000    # 10.0f

    .line 105
    .line 106
    invoke-virtual {p0, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    invoke-virtual {p0, v8, v3, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    .line 114
    .line 115
    .line 116
    move-result v9

    .line 117
    const/16 v10, 0xa

    .line 118
    .line 119
    :goto_2
    iget v11, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 120
    .line 121
    int-to-float v11, v11

    .line 122
    cmpg-float v9, v9, v11

    .line 123
    .line 124
    if-gtz v9, :cond_3

    .line 125
    .line 126
    add-int/lit8 v10, v10, 0x2

    .line 127
    .line 128
    int-to-float v9, v10

    .line 129
    invoke-virtual {p0, v9}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 130
    .line 131
    .line 132
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result v9

    .line 136
    invoke-virtual {p0, v8, v3, v9}, Landroid/graphics/Paint;->measureText(Ljava/lang/String;II)F

    .line 137
    .line 138
    .line 139
    move-result v9

    .line 140
    goto :goto_2

    .line 141
    :cond_3
    add-int/lit8 v10, v10, -0x2

    .line 142
    .line 143
    aput v10, v1, v6

    .line 144
    .line 145
    int-to-float v8, v10

    .line 146
    invoke-virtual {p0, v8}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 147
    .line 148
    .line 149
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 150
    .line 151
    .line 152
    move-result-object v8

    .line 153
    if-eqz v2, :cond_4

    .line 154
    .line 155
    iget v9, v8, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 156
    .line 157
    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 158
    .line 159
    :goto_3
    sub-float/2addr v9, v8

    .line 160
    goto :goto_4

    .line 161
    :cond_4
    iget v9, v8, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 162
    .line 163
    iget v8, v8, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 164
    .line 165
    goto :goto_3

    .line 166
    :goto_4
    add-float/2addr v7, v9

    .line 167
    add-int/lit8 v6, v6, 0x1

    .line 168
    .line 169
    goto :goto_1

    .line 170
    :cond_5
    iget p1, p1, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 171
    .line 172
    float-to-int v6, v7

    .line 173
    sget-object v8, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 174
    .line 175
    invoke-static {p1, v6, v8}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    new-instance v6, Landroid/graphics/Canvas;

    .line 180
    .line 181
    invoke-direct {v6, p1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 182
    .line 183
    .line 184
    iput-object p1, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 185
    .line 186
    move p1, v3

    .line 187
    move v8, v5

    .line 188
    :goto_5
    array-length v9, v0

    .line 189
    if-ge p1, v9, :cond_7

    .line 190
    .line 191
    aget-object v9, v0, p1

    .line 192
    .line 193
    aget v10, v1, p1

    .line 194
    .line 195
    int-to-float v10, v10

    .line 196
    invoke-virtual {p0, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p0}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 200
    .line 201
    .line 202
    move-result-object v10

    .line 203
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 204
    .line 205
    .line 206
    move-result v11

    .line 207
    invoke-virtual {v6}, Landroid/graphics/Canvas;->getWidth()I

    .line 208
    .line 209
    .line 210
    move-result v12

    .line 211
    invoke-static {v9, v3, v11, p0, v12}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 212
    .line 213
    .line 214
    move-result-object v9

    .line 215
    sget-object v11, Landroid/text/Layout$Alignment;->ALIGN_NORMAL:Landroid/text/Layout$Alignment;

    .line 216
    .line 217
    invoke-virtual {v9, v11}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 218
    .line 219
    .line 220
    move-result-object v9

    .line 221
    const/high16 v11, 0x3f800000    # 1.0f

    .line 222
    .line 223
    invoke-virtual {v9, v5, v11}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    .line 224
    .line 225
    .line 226
    move-result-object v9

    .line 227
    invoke-virtual {v9, v3}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 228
    .line 229
    .line 230
    move-result-object v9

    .line 231
    invoke-virtual {v9}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 232
    .line 233
    .line 234
    move-result-object v9

    .line 235
    invoke-virtual {v9, v6}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 236
    .line 237
    .line 238
    new-instance v9, Lcom/bef/effectsdk/text/data/CharLayout;

    .line 239
    .line 240
    invoke-direct {v9}, Lcom/bef/effectsdk/text/data/CharLayout;-><init>()V

    .line 241
    .line 242
    .line 243
    if-eqz v2, :cond_6

    .line 244
    .line 245
    iget v12, v10, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 246
    .line 247
    iget v10, v10, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 248
    .line 249
    sub-float/2addr v12, v10

    .line 250
    sub-float v10, v8, v10

    .line 251
    .line 252
    div-float/2addr v10, v7

    .line 253
    iput v10, v9, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 254
    .line 255
    goto :goto_6

    .line 256
    :cond_6
    iget v12, v10, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 257
    .line 258
    iget v10, v10, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 259
    .line 260
    sub-float/2addr v12, v10

    .line 261
    sub-float v10, v8, v10

    .line 262
    .line 263
    div-float/2addr v10, v7

    .line 264
    iput v10, v9, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 265
    .line 266
    :goto_6
    div-float v10, v8, v7

    .line 267
    .line 268
    iput v10, v9, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 269
    .line 270
    add-float/2addr v8, v12

    .line 271
    div-float v10, v8, v7

    .line 272
    .line 273
    iput v10, v9, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 274
    .line 275
    iput v5, v9, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 276
    .line 277
    iput v11, v9, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 278
    .line 279
    iget-object v10, v4, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 280
    .line 281
    aput-object v9, v10, p1

    .line 282
    .line 283
    invoke-virtual {v6, v5, v12}, Landroid/graphics/Canvas;->translate(FF)V

    .line 284
    .line 285
    .line 286
    add-int/lit8 p1, p1, 0x1

    .line 287
    .line 288
    goto :goto_5

    .line 289
    :cond_7
    return-object v4

    .line 290
    :cond_8
    :goto_7
    const/4 p0, 0x0

    .line 291
    return-object p0
.end method

.method public static generateTextAutoSizedShakeBitmap(Ljava/lang/String;Lcom/bef/effectsdk/text/data/TextLayoutParam;)Lcom/bef/effectsdk/text/data/TextBitmapResult;
    .locals 20
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    invoke-static/range {p0 .. p0}, Lcom/bef/effectsdk/text/TextLayoutUtils;->lyricShakeSplit(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-static/range {p0 .. p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    return-object v0

    .line 15
    :cond_0
    new-instance v2, Landroid/text/TextPaint;

    .line 16
    .line 17
    invoke-direct {v2}, Landroid/text/TextPaint;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v3, 0x1

    .line 21
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 22
    .line 23
    .line 24
    iget-object v4, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 25
    .line 26
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 27
    .line 28
    .line 29
    move-result v4

    .line 30
    if-nez v4, :cond_1

    .line 31
    .line 32
    iget-object v4, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 33
    .line 34
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    if-nez v4, :cond_1

    .line 39
    .line 40
    iget-object v4, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontPath:Ljava/lang/String;

    .line 41
    .line 42
    iget-object v5, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->familyName:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v4, v5}, Lcom/bef/effectsdk/text/FontCache;->getFromFile(Ljava/lang/String;Ljava/lang/String;)Landroid/graphics/Typeface;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 49
    .line 50
    .line 51
    :cond_1
    iget v4, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->fontSize:F

    .line 52
    .line 53
    invoke-virtual {v2, v4}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    iget v4, v4, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 61
    .line 62
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 63
    .line 64
    .line 65
    move-result-object v5

    .line 66
    iget v5, v5, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 67
    .line 68
    cmpg-float v4, v4, v5

    .line 69
    .line 70
    const/4 v5, 0x0

    .line 71
    if-gez v4, :cond_2

    .line 72
    .line 73
    move v4, v3

    .line 74
    goto :goto_0

    .line 75
    :cond_2
    move v4, v5

    .line 76
    :goto_0
    invoke-virtual {v2}, Landroid/graphics/Paint;->getFontMetrics()Landroid/graphics/Paint$FontMetrics;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    new-instance v7, Ljava/util/ArrayList;

    .line 81
    .line 82
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 83
    .line 84
    .line 85
    iget v8, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 86
    .line 87
    int-to-float v8, v8

    .line 88
    const/4 v9, 0x0

    .line 89
    move v10, v5

    .line 90
    move v11, v10

    .line 91
    move v12, v9

    .line 92
    :goto_1
    array-length v13, v1

    .line 93
    const/high16 v14, 0x3f800000    # 1.0f

    .line 94
    .line 95
    if-ge v10, v13, :cond_3

    .line 96
    .line 97
    aget-object v13, v1, v10

    .line 98
    .line 99
    invoke-virtual {v13}, Ljava/lang/String;->length()I

    .line 100
    .line 101
    .line 102
    move-result v15

    .line 103
    float-to-int v3, v8

    .line 104
    invoke-static {v13, v5, v15, v2, v3}, Landroid/text/StaticLayout$Builder;->obtain(Ljava/lang/CharSequence;IILandroid/text/TextPaint;I)Landroid/text/StaticLayout$Builder;

    .line 105
    .line 106
    .line 107
    move-result-object v3

    .line 108
    sget-object v13, Landroid/text/Layout$Alignment;->ALIGN_OPPOSITE:Landroid/text/Layout$Alignment;

    .line 109
    .line 110
    invoke-virtual {v3, v13}, Landroid/text/StaticLayout$Builder;->setAlignment(Landroid/text/Layout$Alignment;)Landroid/text/StaticLayout$Builder;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v3, v9, v14}, Landroid/text/StaticLayout$Builder;->setLineSpacing(FF)Landroid/text/StaticLayout$Builder;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    invoke-virtual {v3, v5}, Landroid/text/StaticLayout$Builder;->setIncludePad(Z)Landroid/text/StaticLayout$Builder;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-virtual {v3}, Landroid/text/StaticLayout$Builder;->build()Landroid/text/StaticLayout;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v3}, Landroid/text/StaticLayout;->getLineCount()I

    .line 127
    .line 128
    .line 129
    move-result v13

    .line 130
    add-int/2addr v11, v13

    .line 131
    invoke-interface {v7, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    invoke-virtual {v3}, Landroid/text/Layout;->getHeight()I

    .line 135
    .line 136
    .line 137
    move-result v3

    .line 138
    int-to-float v3, v3

    .line 139
    add-float/2addr v12, v3

    .line 140
    add-int/lit8 v10, v10, 0x1

    .line 141
    .line 142
    const/4 v3, 0x1

    .line 143
    goto :goto_1

    .line 144
    :cond_3
    new-instance v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;

    .line 145
    .line 146
    invoke-direct {v2}, Lcom/bef/effectsdk/text/data/TextBitmapResult;-><init>()V

    .line 147
    .line 148
    .line 149
    const/4 v3, 0x1

    .line 150
    iput v3, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->channel:I

    .line 151
    .line 152
    iput v11, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->lineCount:I

    .line 153
    .line 154
    iput v5, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->type:I

    .line 155
    .line 156
    new-array v3, v11, [Lcom/bef/effectsdk/text/data/CharLayout;

    .line 157
    .line 158
    iput-object v3, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 159
    .line 160
    iget v3, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->lineWidth:I

    .line 161
    .line 162
    float-to-int v10, v12

    .line 163
    sget-object v11, Landroid/graphics/Bitmap$Config;->ALPHA_8:Landroid/graphics/Bitmap$Config;

    .line 164
    .line 165
    invoke-static {v3, v10, v11}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    new-instance v10, Landroid/graphics/Canvas;

    .line 170
    .line 171
    invoke-direct {v10, v3}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 172
    .line 173
    .line 174
    iput-object v3, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->bitmap:Landroid/graphics/Bitmap;

    .line 175
    .line 176
    move v3, v5

    .line 177
    move v13, v3

    .line 178
    move v11, v9

    .line 179
    :goto_2
    array-length v15, v1

    .line 180
    if-ge v3, v15, :cond_7

    .line 181
    .line 182
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v15

    .line 186
    check-cast v15, Landroid/text/StaticLayout;

    .line 187
    .line 188
    invoke-virtual {v15}, Landroid/text/Layout;->getHeight()I

    .line 189
    .line 190
    .line 191
    move-result v15

    .line 192
    int-to-float v15, v15

    .line 193
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v16

    .line 197
    check-cast v16, Landroid/text/StaticLayout;

    .line 198
    .line 199
    invoke-virtual/range {v16 .. v16}, Landroid/text/StaticLayout;->getLineCount()I

    .line 200
    .line 201
    .line 202
    move-result v5

    .line 203
    int-to-float v5, v5

    .line 204
    div-float v5, v15, v5

    .line 205
    .line 206
    const/4 v14, 0x0

    .line 207
    :goto_3
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object v17

    .line 211
    check-cast v17, Landroid/text/StaticLayout;

    .line 212
    .line 213
    invoke-virtual/range {v17 .. v17}, Landroid/text/StaticLayout;->getLineCount()I

    .line 214
    .line 215
    .line 216
    move-result v9

    .line 217
    if-ge v14, v9, :cond_6

    .line 218
    .line 219
    new-instance v9, Lcom/bef/effectsdk/text/data/CharLayout;

    .line 220
    .line 221
    invoke-direct {v9}, Lcom/bef/effectsdk/text/data/CharLayout;-><init>()V

    .line 222
    .line 223
    .line 224
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 225
    .line 226
    .line 227
    move-result-object v17

    .line 228
    move-object/from16 v18, v1

    .line 229
    .line 230
    move-object/from16 v1, v17

    .line 231
    .line 232
    check-cast v1, Landroid/text/StaticLayout;

    .line 233
    .line 234
    invoke-virtual {v1, v14}, Landroid/text/Layout;->getLineWidth(I)F

    .line 235
    .line 236
    .line 237
    move-result v1

    .line 238
    if-eqz v4, :cond_4

    .line 239
    .line 240
    move/from16 v17, v1

    .line 241
    .line 242
    iget v1, v6, Landroid/graphics/Paint$FontMetrics;->top:F

    .line 243
    .line 244
    sub-float v1, v11, v1

    .line 245
    .line 246
    div-float/2addr v1, v12

    .line 247
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_4
    move/from16 v17, v1

    .line 251
    .line 252
    iget v1, v6, Landroid/graphics/Paint$FontMetrics;->ascent:F

    .line 253
    .line 254
    sub-float v1, v11, v1

    .line 255
    .line 256
    div-float/2addr v1, v12

    .line 257
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->baseline:F

    .line 258
    .line 259
    :goto_4
    div-float v1, v11, v12

    .line 260
    .line 261
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->top:F

    .line 262
    .line 263
    add-float/2addr v11, v5

    .line 264
    iget v1, v6, Landroid/graphics/Paint$FontMetrics;->bottom:F

    .line 265
    .line 266
    move/from16 v19, v1

    .line 267
    .line 268
    iget v1, v6, Landroid/graphics/Paint$FontMetrics;->descent:F

    .line 269
    .line 270
    sub-float v1, v19, v1

    .line 271
    .line 272
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 273
    .line 274
    .line 275
    move-result v1

    .line 276
    const/high16 v19, 0x40000000    # 2.0f

    .line 277
    .line 278
    div-float v1, v1, v19

    .line 279
    .line 280
    sub-float v1, v11, v1

    .line 281
    .line 282
    div-float/2addr v1, v12

    .line 283
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->bottom:F

    .line 284
    .line 285
    iget v1, v0, Lcom/bef/effectsdk/text/data/TextLayoutParam;->textAlign:I

    .line 286
    .line 287
    if-nez v1, :cond_5

    .line 288
    .line 289
    const/4 v1, 0x0

    .line 290
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 291
    .line 292
    sub-float v1, v8, v17

    .line 293
    .line 294
    div-float/2addr v1, v8

    .line 295
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 296
    .line 297
    goto :goto_5

    .line 298
    :cond_5
    sub-float v1, v8, v17

    .line 299
    .line 300
    div-float/2addr v1, v8

    .line 301
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->left:F

    .line 302
    .line 303
    const/high16 v1, 0x3f800000    # 1.0f

    .line 304
    .line 305
    iput v1, v9, Lcom/bef/effectsdk/text/data/CharLayout;->right:F

    .line 306
    .line 307
    :goto_5
    iget-object v1, v2, Lcom/bef/effectsdk/text/data/TextBitmapResult;->charLayouts:[Lcom/bef/effectsdk/text/data/CharLayout;

    .line 308
    .line 309
    aput-object v9, v1, v13

    .line 310
    .line 311
    add-int/lit8 v13, v13, 0x1

    .line 312
    .line 313
    add-int/lit8 v14, v14, 0x1

    .line 314
    .line 315
    move-object/from16 v1, v18

    .line 316
    .line 317
    const/4 v9, 0x0

    .line 318
    goto :goto_3

    .line 319
    :cond_6
    move-object/from16 v18, v1

    .line 320
    .line 321
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 322
    .line 323
    .line 324
    move-result-object v1

    .line 325
    check-cast v1, Landroid/text/StaticLayout;

    .line 326
    .line 327
    invoke-virtual {v1, v10}, Landroid/text/Layout;->draw(Landroid/graphics/Canvas;)V

    .line 328
    .line 329
    .line 330
    invoke-interface {v7, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v1

    .line 334
    check-cast v1, Landroid/text/StaticLayout;

    .line 335
    .line 336
    invoke-virtual {v1}, Landroid/text/StaticLayout;->getLineCount()I

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    int-to-float v1, v1

    .line 341
    mul-float/2addr v15, v1

    .line 342
    const/4 v1, 0x0

    .line 343
    invoke-virtual {v10, v1, v15}, Landroid/graphics/Canvas;->translate(FF)V

    .line 344
    .line 345
    .line 346
    add-int/lit8 v3, v3, 0x1

    .line 347
    .line 348
    move v9, v1

    .line 349
    move-object/from16 v1, v18

    .line 350
    .line 351
    const/4 v5, 0x0

    .line 352
    const/high16 v14, 0x3f800000    # 1.0f

    .line 353
    .line 354
    goto/16 :goto_2

    .line 355
    .line 356
    :cond_7
    return-object v2
.end method

.method public static lyricShakeSplit(Ljava/lang/String;)[Ljava/lang/String;
    .locals 14
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_10

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    const-string v0, "\n"

    .line 12
    .line 13
    const-string v1, " "

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, ","

    .line 20
    .line 21
    const-string v2, ""

    .line 22
    .line 23
    invoke-virtual {p0, v0, v2}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "\r"

    .line 28
    .line 29
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    new-instance v0, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    new-instance v2, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    move v4, v3

    .line 49
    :goto_0
    array-length v5, p0

    .line 50
    if-ge v4, v5, :cond_e

    .line 51
    .line 52
    aget-object v5, p0, v4

    .line 53
    .line 54
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    .line 55
    .line 56
    .line 57
    move-result v5

    .line 58
    const/4 v6, 0x1

    .line 59
    if-eqz v5, :cond_1

    .line 60
    .line 61
    goto/16 :goto_5

    .line 62
    .line 63
    :cond_1
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result v5

    .line 71
    const/16 v7, 0xa

    .line 72
    .line 73
    if-nez v5, :cond_b

    .line 74
    .line 75
    aget-object v5, p0, v4

    .line 76
    .line 77
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 78
    .line 79
    .line 80
    move-result v5

    .line 81
    if-ge v5, v7, :cond_2

    .line 82
    .line 83
    aget-object v5, p0, v4

    .line 84
    .line 85
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    goto/16 :goto_5

    .line 89
    .line 90
    :cond_2
    aget-object v5, p0, v4

    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 93
    .line 94
    .line 95
    move-result v5

    .line 96
    if-ne v5, v7, :cond_3

    .line 97
    .line 98
    aget-object v5, p0, v4

    .line 99
    .line 100
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    goto/16 :goto_5

    .line 104
    .line 105
    :cond_3
    aget-object v5, p0, v4

    .line 106
    .line 107
    invoke-virtual {v5, v3, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v5

    .line 111
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 112
    .line 113
    .line 114
    aget-object v5, p0, v4

    .line 115
    .line 116
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    sub-int/2addr v5, v7

    .line 121
    rem-int/lit8 v5, v5, 0x9

    .line 122
    .line 123
    if-nez v5, :cond_4

    .line 124
    .line 125
    move v5, v6

    .line 126
    goto :goto_1

    .line 127
    :cond_4
    move v5, v3

    .line 128
    :goto_1
    if-eqz v5, :cond_5

    .line 129
    .line 130
    aget-object v8, p0, v4

    .line 131
    .line 132
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 133
    .line 134
    .line 135
    move-result v8

    .line 136
    sub-int/2addr v8, v7

    .line 137
    div-int/lit8 v8, v8, 0x9

    .line 138
    .line 139
    goto :goto_2

    .line 140
    :cond_5
    aget-object v8, p0, v4

    .line 141
    .line 142
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 143
    .line 144
    .line 145
    move-result v8

    .line 146
    sub-int/2addr v8, v7

    .line 147
    div-int/lit8 v8, v8, 0x9

    .line 148
    .line 149
    add-int/2addr v8, v6

    .line 150
    :goto_2
    move v9, v3

    .line 151
    :goto_3
    if-ge v9, v8, :cond_d

    .line 152
    .line 153
    const/16 v10, 0x13

    .line 154
    .line 155
    const-string v11, "-"

    .line 156
    .line 157
    if-nez v9, :cond_8

    .line 158
    .line 159
    if-eqz v5, :cond_6

    .line 160
    .line 161
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    aget-object v11, p0, v4

    .line 165
    .line 166
    invoke-virtual {v11, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v10

    .line 170
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 171
    .line 172
    .line 173
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v10

    .line 177
    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 181
    .line 182
    .line 183
    move-result v10

    .line 184
    invoke-virtual {v2, v3, v10}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    goto/16 :goto_4

    .line 188
    .line 189
    :cond_6
    if-ne v8, v6, :cond_7

    .line 190
    .line 191
    aget-object v10, p0, v4

    .line 192
    .line 193
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 194
    .line 195
    .line 196
    move-result v10

    .line 197
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 198
    .line 199
    .line 200
    aget-object v11, p0, v4

    .line 201
    .line 202
    invoke-virtual {v11, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v10

    .line 206
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    goto :goto_4

    .line 210
    :cond_7
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 211
    .line 212
    .line 213
    aget-object v11, p0, v4

    .line 214
    .line 215
    invoke-virtual {v11, v7, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v10

    .line 219
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 220
    .line 221
    .line 222
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v10

    .line 226
    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 227
    .line 228
    .line 229
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 230
    .line 231
    .line 232
    move-result v10

    .line 233
    invoke-virtual {v2, v3, v10}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 234
    .line 235
    .line 236
    goto :goto_4

    .line 237
    :cond_8
    add-int/lit8 v12, v9, -0x1

    .line 238
    .line 239
    mul-int/lit8 v12, v12, 0x9

    .line 240
    .line 241
    add-int/2addr v12, v10

    .line 242
    add-int/lit8 v13, v8, -0x1

    .line 243
    .line 244
    if-ge v9, v13, :cond_9

    .line 245
    .line 246
    mul-int/lit8 v13, v9, 0x9

    .line 247
    .line 248
    add-int/2addr v13, v10

    .line 249
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    aget-object v10, p0, v4

    .line 253
    .line 254
    invoke-virtual {v10, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v10

    .line 258
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v10

    .line 265
    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 266
    .line 267
    .line 268
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 269
    .line 270
    .line 271
    move-result v10

    .line 272
    invoke-virtual {v2, v3, v10}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    goto :goto_4

    .line 276
    :cond_9
    if-eqz v5, :cond_a

    .line 277
    .line 278
    mul-int/lit8 v13, v9, 0x9

    .line 279
    .line 280
    add-int/2addr v13, v10

    .line 281
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 282
    .line 283
    .line 284
    aget-object v10, p0, v4

    .line 285
    .line 286
    invoke-virtual {v10, v12, v13}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v10

    .line 290
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v10

    .line 297
    invoke-interface {v0, v10}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 301
    .line 302
    .line 303
    move-result v10

    .line 304
    invoke-virtual {v2, v3, v10}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 305
    .line 306
    .line 307
    goto :goto_4

    .line 308
    :cond_a
    aget-object v10, p0, v4

    .line 309
    .line 310
    invoke-virtual {v10}, Ljava/lang/String;->length()I

    .line 311
    .line 312
    .line 313
    move-result v10

    .line 314
    invoke-virtual {v2, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 315
    .line 316
    .line 317
    aget-object v11, p0, v4

    .line 318
    .line 319
    invoke-virtual {v11, v12, v10}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v10

    .line 323
    invoke-virtual {v2, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    :goto_4
    add-int/lit8 v9, v9, 0x1

    .line 327
    .line 328
    goto/16 :goto_3

    .line 329
    .line 330
    :cond_b
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v8

    .line 334
    invoke-virtual {v8}, Ljava/lang/String;->length()I

    .line 335
    .line 336
    .line 337
    move-result v8

    .line 338
    aget-object v9, p0, v4

    .line 339
    .line 340
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 341
    .line 342
    .line 343
    move-result v9

    .line 344
    add-int/2addr v8, v9

    .line 345
    add-int/2addr v8, v6

    .line 346
    if-gt v8, v7, :cond_c

    .line 347
    .line 348
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 349
    .line 350
    .line 351
    aget-object v5, p0, v4

    .line 352
    .line 353
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 354
    .line 355
    .line 356
    goto :goto_5

    .line 357
    :cond_c
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v7

    .line 361
    invoke-interface {v0, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    invoke-virtual {v2, v3, v5}, Ljava/lang/StringBuilder;->delete(II)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    add-int/lit8 v4, v4, -0x1

    .line 368
    .line 369
    :cond_d
    :goto_5
    add-int/2addr v4, v6

    .line 370
    goto/16 :goto_0

    .line 371
    .line 372
    :cond_e
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    .line 377
    .line 378
    .line 379
    move-result p0

    .line 380
    if-eqz p0, :cond_f

    .line 381
    .line 382
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    :cond_f
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    new-array p0, p0, [Ljava/lang/String;

    .line 394
    .line 395
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    check-cast p0, [Ljava/lang/String;

    .line 400
    .line 401
    return-object p0

    .line 402
    :cond_10
    :goto_6
    const/4 p0, 0x0

    .line 403
    return-object p0
.end method

.method public static splitLyric(Ljava/lang/String;)[Ljava/lang/String;
    .locals 10
    .annotation build Lcom/amazing/annotation/EffectKeep;
    .end annotation

    .line 1
    if-eqz p0, :cond_6

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    const-string v0, "\n"

    .line 12
    .line 13
    const-string v1, " "

    .line 14
    .line 15
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "\r"

    .line 20
    .line 21
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    new-instance v0, Ljava/util/ArrayList;

    .line 30
    .line 31
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 32
    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    move v3, v2

    .line 36
    move v4, v3

    .line 37
    :goto_0
    array-length v5, p0

    .line 38
    if-ge v3, v5, :cond_5

    .line 39
    .line 40
    new-instance v5, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    rem-int/lit8 v6, v4, 0x5

    .line 46
    .line 47
    const/4 v7, 0x3

    .line 48
    rem-int/2addr v6, v7

    .line 49
    if-nez v6, :cond_1

    .line 50
    .line 51
    const/4 v6, 0x6

    .line 52
    goto :goto_1

    .line 53
    :cond_1
    const/16 v6, 0xa

    .line 54
    .line 55
    :goto_1
    move v8, v2

    .line 56
    :goto_2
    array-length v9, p0

    .line 57
    if-ge v3, v9, :cond_4

    .line 58
    .line 59
    aget-object v9, p0, v3

    .line 60
    .line 61
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result v9

    .line 65
    add-int/2addr v9, v8

    .line 66
    add-int/lit8 v9, v9, 0x1

    .line 67
    .line 68
    if-le v9, v6, :cond_2

    .line 69
    .line 70
    if-gt v8, v7, :cond_4

    .line 71
    .line 72
    :cond_2
    aget-object v9, p0, v3

    .line 73
    .line 74
    invoke-virtual {v9}, Ljava/lang/String;->length()I

    .line 75
    .line 76
    .line 77
    move-result v9

    .line 78
    add-int/lit8 v9, v9, 0x1

    .line 79
    .line 80
    add-int/2addr v8, v9

    .line 81
    add-int/lit8 v9, v3, 0x1

    .line 82
    .line 83
    aget-object v3, p0, v3

    .line 84
    .line 85
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    array-length v3, p0

    .line 92
    add-int/lit8 v3, v3, -0x1

    .line 93
    .line 94
    if-ne v9, v3, :cond_3

    .line 95
    .line 96
    aget-object v3, p0, v9

    .line 97
    .line 98
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    if-ge v3, v7, :cond_3

    .line 103
    .line 104
    aget-object v3, p0, v9

    .line 105
    .line 106
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    :cond_3
    move v3, v9

    .line 110
    goto :goto_2

    .line 111
    :cond_4
    add-int/lit8 v4, v4, 0x1

    .line 112
    .line 113
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->length()I

    .line 114
    .line 115
    .line 116
    move-result v6

    .line 117
    add-int/lit8 v6, v6, -0x1

    .line 118
    .line 119
    invoke-virtual {v5, v2, v6}, Ljava/lang/StringBuilder;->substring(II)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v5

    .line 123
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 124
    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_5
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    new-array p0, p0, [Ljava/lang/String;

    .line 132
    .line 133
    invoke-interface {v0, p0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    check-cast p0, [Ljava/lang/String;

    .line 138
    .line 139
    return-object p0

    .line 140
    :cond_6
    :goto_3
    const/4 p0, 0x0

    .line 141
    return-object p0
.end method
