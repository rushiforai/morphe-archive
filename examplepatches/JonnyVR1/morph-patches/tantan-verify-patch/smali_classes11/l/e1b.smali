.class public Ll/e1b;
.super Ll/c17;
.source "SourceFile"


# static fields
.field public static i:[Ljava/lang/String;

.field public static final j:Ljava/text/DecimalFormat;

.field public static final k:[I


# direct methods
.method static constructor <clinit>()V
    .locals 28

    .line 1
    const-string v26, "Z"

    .line 2
    .line 3
    const-string v27, "#"

    .line 4
    .line 5
    const-string v1, "A"

    .line 6
    .line 7
    const-string v2, "B"

    .line 8
    .line 9
    const-string v3, "C"

    .line 10
    .line 11
    const-string v4, "D"

    .line 12
    .line 13
    const-string v5, "E"

    .line 14
    .line 15
    const-string v6, "F"

    .line 16
    .line 17
    const-string v7, "G"

    .line 18
    .line 19
    const-string v8, "H"

    .line 20
    .line 21
    const-string v9, "I"

    .line 22
    .line 23
    const-string v10, "J"

    .line 24
    .line 25
    const-string v11, "K"

    .line 26
    .line 27
    const-string v12, "L"

    .line 28
    .line 29
    const-string v13, "M"

    .line 30
    .line 31
    const-string v14, "N"

    .line 32
    .line 33
    const-string v15, "O"

    .line 34
    .line 35
    const-string v16, "P"

    .line 36
    .line 37
    const-string v17, "Q"

    .line 38
    .line 39
    const-string v18, "R"

    .line 40
    .line 41
    const-string v19, "S"

    .line 42
    .line 43
    const-string v20, "T"

    .line 44
    .line 45
    const-string v21, "U"

    .line 46
    .line 47
    const-string v22, "V"

    .line 48
    .line 49
    const-string v23, "W"

    .line 50
    .line 51
    const-string v24, "X"

    .line 52
    .line 53
    const-string v25, "Y"

    .line 54
    .line 55
    filled-new-array/range {v1 .. v27}, [Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    sput-object v0, Ll/e1b;->i:[Ljava/lang/String;

    .line 60
    .line 61
    new-instance v0, Ljava/text/DecimalFormat;

    .line 62
    .line 63
    const-string v1, "#.#"

    .line 64
    .line 65
    invoke-direct {v0, v1}, Ljava/text/DecimalFormat;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sput-object v0, Ll/e1b;->j:Ljava/text/DecimalFormat;

    .line 69
    .line 70
    const/16 v0, 0x8

    .line 71
    .line 72
    new-array v0, v0, [I

    .line 73
    .line 74
    fill-array-data v0, :array_0

    .line 75
    .line 76
    .line 77
    sput-object v0, Ll/e1b;->k:[I

    .line 78
    .line 79
    return-void

    .line 80
    nop

    .line 81
    :array_0
    .array-data 4
        -0xd04f36
        -0x2662be
        -0x245b9
        -0x30964e
        -0x5b38be
        -0x485e0
        -0x7b460e
        -0x676952
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/c17;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static varargs A0(Landroid/app/Activity;Ljava/lang/String;I[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 6
    .param p2    # I
        .annotation build Landroidx/annotation/ColorRes;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    :goto_0
    array-length v2, p3

    .line 8
    if-ge v1, v2, :cond_1

    .line 9
    .line 10
    aget-object v2, p3, v1

    .line 11
    .line 12
    add-int/lit8 v3, v1, 0x1

    .line 13
    .line 14
    aget-object v3, p3, v3

    .line 15
    .line 16
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 17
    .line 18
    .line 19
    move-result v4

    .line 20
    if-lez v4, :cond_0

    .line 21
    .line 22
    new-instance v4, Ll/e1b$b;

    .line 23
    .line 24
    invoke-direct {v4, p0, v2, v3, p2}, Ll/e1b$b;-><init>(Landroid/app/Activity;Ljava/lang/String;Ljava/lang/String;I)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-int/2addr v5, v2

    .line 40
    const/16 v2, 0x21

    .line 41
    .line 42
    invoke-virtual {v0, v4, v3, v5, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 43
    .line 44
    .line 45
    :cond_0
    add-int/lit8 v1, v1, 0x2

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-object v0
.end method

.method public static B0(Lcom/p1/mobile/android/app/Act;IILcom/p1/mobile/putong/core/data/Figure;)Ljava/lang/CharSequence;
    .locals 7

    .line 1
    const-string v0, "m"

    .line 2
    .line 3
    const-string v1, "km"

    .line 4
    .line 5
    iget-object v2, p3, Lcom/p1/mobile/putong/core/data/Figure;->name:Ljava/lang/String;

    .line 6
    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/ab/IntlCountryCodeController;->f()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_2

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    :try_start_0
    iget-object v4, p3, Lcom/p1/mobile/putong/core/data/Figure;->name:Ljava/lang/String;

    .line 15
    .line 16
    invoke-virtual {v4, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 17
    .line 18
    .line 19
    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    iget-object v5, p3, Lcom/p1/mobile/putong/core/data/Figure;->name:Ljava/lang/String;

    .line 21
    .line 22
    const-string v6, ""

    .line 23
    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    :try_start_1
    invoke-virtual {v5, v1, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    const/high16 v1, 0x447a0000    # 1000.0f

    .line 35
    .line 36
    mul-float/2addr v0, v1

    .line 37
    :goto_0
    float-to-int v0, v0

    .line 38
    goto :goto_2

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    goto :goto_1

    .line 41
    :cond_0
    invoke-virtual {v5, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    if-eqz v1, :cond_1

    .line 46
    .line 47
    iget-object v1, p3, Lcom/p1/mobile/putong/core/data/Figure;->name:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1, v0, v6}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-static {v0}, Ljava/lang/Float;->parseFloat(Ljava/lang/String;)F

    .line 54
    .line 55
    .line 56
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    goto :goto_0

    .line 58
    :goto_1
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 59
    .line 60
    .line 61
    :cond_1
    move v0, v3

    .line 62
    :goto_2
    if-le v0, v3, :cond_2

    .line 63
    .line 64
    const/4 v1, 0x0

    .line 65
    invoke-static {v0, v1}, Ll/q8g0;->p(IZ)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    :cond_2
    const/4 v0, 0x1

    .line 70
    const/4 v1, 0x3

    .line 71
    const-string v3, "sans-serif"

    .line 72
    .line 73
    if-nez p2, :cond_e

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object p2

    .line 83
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->N8()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    const-string v4, "#FE7E1D"

    .line 88
    .line 89
    if-eqz p2, :cond_6

    .line 90
    .line 91
    if-ne p1, v0, :cond_3

    .line 92
    .line 93
    sget p1, Lcom/p1/mobile/putong/core/R$string;->S5:I

    .line 94
    .line 95
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object p0

    .line 107
    filled-new-array {v2}, [Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result p2

    .line 119
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 120
    .line 121
    .line 122
    move-result-object p3

    .line 123
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 124
    .line 125
    .line 126
    move-result-object p0

    .line 127
    return-object p0

    .line 128
    :cond_3
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 129
    .line 130
    if-ne p1, p2, :cond_4

    .line 131
    .line 132
    sget p2, Lcom/p1/mobile/putong/core/R$string;->P5:I

    .line 133
    .line 134
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 135
    .line 136
    .line 137
    move-result-object p0

    .line 138
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object p0

    .line 150
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 155
    .line 156
    .line 157
    move-result-object p1

    .line 158
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 159
    .line 160
    .line 161
    move-result p2

    .line 162
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 163
    .line 164
    .line 165
    move-result-object p3

    .line 166
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    return-object p0

    .line 171
    :cond_4
    if-le p1, v0, :cond_5

    .line 172
    .line 173
    if-ne p2, v0, :cond_5

    .line 174
    .line 175
    sget p2, Lcom/p1/mobile/putong/core/R$string;->Q5:I

    .line 176
    .line 177
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object p2

    .line 189
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 202
    .line 203
    .line 204
    move-result p2

    .line 205
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 206
    .line 207
    .line 208
    move-result-object p3

    .line 209
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 210
    .line 211
    .line 212
    move-result-object p0

    .line 213
    return-object p0

    .line 214
    :cond_5
    sget p2, Lcom/p1/mobile/putong/core/R$string;->R5:I

    .line 215
    .line 216
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p0

    .line 220
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 225
    .line 226
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object p2

    .line 230
    filled-new-array {p1, p2, v2}, [Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object p3

    .line 234
    invoke-static {p0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    filled-new-array {p1, p2, v2}, [Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 243
    .line 244
    .line 245
    move-result-object p1

    .line 246
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result p2

    .line 250
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 251
    .line 252
    .line 253
    move-result-object p3

    .line 254
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    return-object p0

    .line 259
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 260
    .line 261
    .line 262
    move-result-object p2

    .line 263
    invoke-virtual {p2}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 264
    .line 265
    .line 266
    move-result-object p2

    .line 267
    invoke-interface {p2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 268
    .line 269
    .line 270
    move-result p2

    .line 271
    if-eqz p2, :cond_a

    .line 272
    .line 273
    if-ne p1, v0, :cond_7

    .line 274
    .line 275
    sget p1, Lcom/p1/mobile/putong/core/R$string;->W5:I

    .line 276
    .line 277
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p1

    .line 285
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    filled-new-array {v2}, [Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 298
    .line 299
    .line 300
    move-result p2

    .line 301
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 302
    .line 303
    .line 304
    move-result-object p3

    .line 305
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    return-object p0

    .line 310
    :cond_7
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 311
    .line 312
    if-ne p1, p2, :cond_8

    .line 313
    .line 314
    sget p2, Lcom/p1/mobile/putong/core/R$string;->T5:I

    .line 315
    .line 316
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 317
    .line 318
    .line 319
    move-result-object p0

    .line 320
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p1

    .line 324
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object p2

    .line 328
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p1

    .line 336
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 341
    .line 342
    .line 343
    move-result p2

    .line 344
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 345
    .line 346
    .line 347
    move-result-object p3

    .line 348
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    return-object p0

    .line 353
    :cond_8
    if-le p1, v0, :cond_9

    .line 354
    .line 355
    if-ne p2, v0, :cond_9

    .line 356
    .line 357
    sget p2, Lcom/p1/mobile/putong/core/R$string;->U5:I

    .line 358
    .line 359
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 364
    .line 365
    .line 366
    move-result-object p1

    .line 367
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object p2

    .line 371
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object p1

    .line 379
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 380
    .line 381
    .line 382
    move-result-object p1

    .line 383
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 384
    .line 385
    .line 386
    move-result p2

    .line 387
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 388
    .line 389
    .line 390
    move-result-object p3

    .line 391
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    return-object p0

    .line 396
    :cond_9
    sget p2, Lcom/p1/mobile/putong/core/R$string;->V5:I

    .line 397
    .line 398
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object p0

    .line 402
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 407
    .line 408
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    filled-new-array {p1, p2, v2}, [Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object p3

    .line 416
    invoke-static {p0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    filled-new-array {p1, p2, v2}, [Ljava/lang/String;

    .line 421
    .line 422
    .line 423
    move-result-object p1

    .line 424
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 429
    .line 430
    .line 431
    move-result p2

    .line 432
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 433
    .line 434
    .line 435
    move-result-object p3

    .line 436
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    return-object p0

    .line 441
    :cond_a
    if-ne p1, v0, :cond_b

    .line 442
    .line 443
    sget p1, Lcom/p1/mobile/putong/core/R$string;->g6:I

    .line 444
    .line 445
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object p0

    .line 449
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    filled-new-array {v2}, [Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 466
    .line 467
    .line 468
    move-result p2

    .line 469
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 470
    .line 471
    .line 472
    move-result-object p3

    .line 473
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    return-object p0

    .line 478
    :cond_b
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 479
    .line 480
    if-ne p1, p2, :cond_c

    .line 481
    .line 482
    sget p2, Lcom/p1/mobile/putong/core/R$string;->d6:I

    .line 483
    .line 484
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 485
    .line 486
    .line 487
    move-result-object p0

    .line 488
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 489
    .line 490
    .line 491
    move-result-object p1

    .line 492
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 493
    .line 494
    .line 495
    move-result-object p2

    .line 496
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object p0

    .line 500
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object p1

    .line 504
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 505
    .line 506
    .line 507
    move-result-object p1

    .line 508
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 509
    .line 510
    .line 511
    move-result p2

    .line 512
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 513
    .line 514
    .line 515
    move-result-object p3

    .line 516
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 517
    .line 518
    .line 519
    move-result-object p0

    .line 520
    return-object p0

    .line 521
    :cond_c
    if-le p1, v0, :cond_d

    .line 522
    .line 523
    if-ne p2, v0, :cond_d

    .line 524
    .line 525
    sget p2, Lcom/p1/mobile/putong/core/R$string;->e6:I

    .line 526
    .line 527
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 532
    .line 533
    .line 534
    move-result-object p1

    .line 535
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 536
    .line 537
    .line 538
    move-result-object p2

    .line 539
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object p0

    .line 543
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 544
    .line 545
    .line 546
    move-result-object p1

    .line 547
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 548
    .line 549
    .line 550
    move-result-object p1

    .line 551
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 552
    .line 553
    .line 554
    move-result p2

    .line 555
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 556
    .line 557
    .line 558
    move-result-object p3

    .line 559
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 560
    .line 561
    .line 562
    move-result-object p0

    .line 563
    return-object p0

    .line 564
    :cond_d
    sget p2, Lcom/p1/mobile/putong/core/R$string;->f6:I

    .line 565
    .line 566
    invoke-virtual {p0, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 567
    .line 568
    .line 569
    move-result-object p0

    .line 570
    invoke-static {p1}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object p1

    .line 574
    iget p2, p3, Lcom/p1/mobile/putong/core/data/Figure;->total:I

    .line 575
    .line 576
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 577
    .line 578
    .line 579
    move-result-object p2

    .line 580
    filled-new-array {p1, p2, v2}, [Ljava/lang/Object;

    .line 581
    .line 582
    .line 583
    move-result-object p3

    .line 584
    invoke-static {p0, p3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object p0

    .line 588
    filled-new-array {p1, p2, v2}, [Ljava/lang/String;

    .line 589
    .line 590
    .line 591
    move-result-object p1

    .line 592
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    invoke-static {v4}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 597
    .line 598
    .line 599
    move-result p2

    .line 600
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 601
    .line 602
    .line 603
    move-result-object p3

    .line 604
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 605
    .line 606
    .line 607
    move-result-object p0

    .line 608
    return-object p0

    .line 609
    :cond_e
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 610
    .line 611
    .line 612
    move-result-object p1

    .line 613
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 614
    .line 615
    .line 616
    move-result-object p1

    .line 617
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->N8()Z

    .line 618
    .line 619
    .line 620
    move-result p1

    .line 621
    const-string p3, "#ff3200"

    .line 622
    .line 623
    if-eqz p1, :cond_10

    .line 624
    .line 625
    if-ne p2, v0, :cond_f

    .line 626
    .line 627
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Y5:I

    .line 628
    .line 629
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 630
    .line 631
    .line 632
    move-result-object p0

    .line 633
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 634
    .line 635
    .line 636
    move-result-object p1

    .line 637
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 638
    .line 639
    .line 640
    move-result-object p0

    .line 641
    filled-new-array {v2}, [Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object p1

    .line 645
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 646
    .line 647
    .line 648
    move-result-object p1

    .line 649
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 650
    .line 651
    .line 652
    move-result p2

    .line 653
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 654
    .line 655
    .line 656
    move-result-object p3

    .line 657
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 658
    .line 659
    .line 660
    move-result-object p0

    .line 661
    return-object p0

    .line 662
    :cond_f
    sget p1, Lcom/p1/mobile/putong/core/R$string;->X5:I

    .line 663
    .line 664
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 665
    .line 666
    .line 667
    move-result-object p0

    .line 668
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 669
    .line 670
    .line 671
    move-result-object p1

    .line 672
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 673
    .line 674
    .line 675
    move-result-object p2

    .line 676
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 677
    .line 678
    .line 679
    move-result-object p0

    .line 680
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 681
    .line 682
    .line 683
    move-result-object p1

    .line 684
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 685
    .line 686
    .line 687
    move-result-object p1

    .line 688
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 689
    .line 690
    .line 691
    move-result p2

    .line 692
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 693
    .line 694
    .line 695
    move-result-object p3

    .line 696
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 697
    .line 698
    .line 699
    move-result-object p0

    .line 700
    return-object p0

    .line 701
    :cond_10
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 702
    .line 703
    .line 704
    move-result-object p1

    .line 705
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 706
    .line 707
    .line 708
    move-result-object p1

    .line 709
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 710
    .line 711
    .line 712
    move-result p1

    .line 713
    if-eqz p1, :cond_12

    .line 714
    .line 715
    if-ne p2, v0, :cond_11

    .line 716
    .line 717
    sget p1, Lcom/p1/mobile/putong/core/R$string;->a6:I

    .line 718
    .line 719
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 720
    .line 721
    .line 722
    move-result-object p0

    .line 723
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 724
    .line 725
    .line 726
    move-result-object p1

    .line 727
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 728
    .line 729
    .line 730
    move-result-object p0

    .line 731
    filled-new-array {v2}, [Ljava/lang/String;

    .line 732
    .line 733
    .line 734
    move-result-object p1

    .line 735
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 736
    .line 737
    .line 738
    move-result-object p1

    .line 739
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 740
    .line 741
    .line 742
    move-result p2

    .line 743
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 744
    .line 745
    .line 746
    move-result-object p3

    .line 747
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 748
    .line 749
    .line 750
    move-result-object p0

    .line 751
    return-object p0

    .line 752
    :cond_11
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Z5:I

    .line 753
    .line 754
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 755
    .line 756
    .line 757
    move-result-object p0

    .line 758
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 759
    .line 760
    .line 761
    move-result-object p1

    .line 762
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 763
    .line 764
    .line 765
    move-result-object p2

    .line 766
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 767
    .line 768
    .line 769
    move-result-object p0

    .line 770
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 771
    .line 772
    .line 773
    move-result-object p1

    .line 774
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 775
    .line 776
    .line 777
    move-result-object p1

    .line 778
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 779
    .line 780
    .line 781
    move-result p2

    .line 782
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 783
    .line 784
    .line 785
    move-result-object p3

    .line 786
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 787
    .line 788
    .line 789
    move-result-object p0

    .line 790
    return-object p0

    .line 791
    :cond_12
    if-ne p2, v0, :cond_13

    .line 792
    .line 793
    sget p1, Lcom/p1/mobile/putong/core/R$string;->c6:I

    .line 794
    .line 795
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 796
    .line 797
    .line 798
    move-result-object p0

    .line 799
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 800
    .line 801
    .line 802
    move-result-object p1

    .line 803
    invoke-static {p0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    filled-new-array {v2}, [Ljava/lang/String;

    .line 808
    .line 809
    .line 810
    move-result-object p1

    .line 811
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 812
    .line 813
    .line 814
    move-result-object p1

    .line 815
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 816
    .line 817
    .line 818
    move-result p2

    .line 819
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 820
    .line 821
    .line 822
    move-result-object p3

    .line 823
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 824
    .line 825
    .line 826
    move-result-object p0

    .line 827
    return-object p0

    .line 828
    :cond_13
    sget p1, Lcom/p1/mobile/putong/core/R$string;->b6:I

    .line 829
    .line 830
    invoke-virtual {p0, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 831
    .line 832
    .line 833
    move-result-object p0

    .line 834
    invoke-static {p2}, Ll/q8g0;->G(I)Ljava/lang/String;

    .line 835
    .line 836
    .line 837
    move-result-object p1

    .line 838
    filled-new-array {p1, v2}, [Ljava/lang/Object;

    .line 839
    .line 840
    .line 841
    move-result-object p2

    .line 842
    invoke-static {p0, p2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 843
    .line 844
    .line 845
    move-result-object p0

    .line 846
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 847
    .line 848
    .line 849
    move-result-object p1

    .line 850
    filled-new-array {p1, v2}, [Ljava/lang/String;

    .line 851
    .line 852
    .line 853
    move-result-object p1

    .line 854
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 855
    .line 856
    .line 857
    move-result-object p1

    .line 858
    invoke-static {p3}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 859
    .line 860
    .line 861
    move-result p2

    .line 862
    invoke-static {v3, v1}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 863
    .line 864
    .line 865
    move-result-object p3

    .line 866
    invoke-static {p0, p1, p2, p3}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 867
    .line 868
    .line 869
    move-result-object p0

    .line 870
    return-object p0
.end method

.method public static C0(Lcom/p1/mobile/putong/core/data/Figure;)Ljava/lang/CharSequence;
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Figure;->message:Lcom/p1/mobile/putong/core/data/FigureMessage;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessage;->template:Ljava/lang/String;

    .line 4
    .line 5
    const-string v1, "%@"

    .line 6
    .line 7
    const-string v2, "%s"

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Figure;->message:Lcom/p1/mobile/putong/core/data/FigureMessage;

    .line 14
    .line 15
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/FigureMessage;->args:Ljava/util/List;

    .line 16
    .line 17
    new-instance v2, Ll/d1b;

    .line 18
    .line 19
    invoke-direct {v2}, Ll/d1b;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-static {v1, v2}, Ll/jyb;->n(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    const/4 v2, 0x0

    .line 27
    new-array v3, v2, [Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x1

    .line 38
    if-ne v4, v5, :cond_0

    .line 39
    .line 40
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    check-cast p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 47
    .line 48
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 61
    .line 62
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    goto/16 :goto_0

    .line 68
    .line 69
    :cond_0
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 70
    .line 71
    .line 72
    move-result v4

    .line 73
    const/4 v6, 0x2

    .line 74
    if-ne v4, v6, :cond_1

    .line 75
    .line 76
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    check-cast p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 81
    .line 82
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 83
    .line 84
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    check-cast v4, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 89
    .line 90
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 91
    .line 92
    filled-new-array {p0, v4}, [Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 105
    .line 106
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 107
    .line 108
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 109
    .line 110
    .line 111
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 116
    .line 117
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 118
    .line 119
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_1
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 124
    .line 125
    .line 126
    move-result v4

    .line 127
    const/4 v7, 0x3

    .line 128
    if-ne v4, v7, :cond_2

    .line 129
    .line 130
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    check-cast p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 135
    .line 136
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 137
    .line 138
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v4

    .line 142
    check-cast v4, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 143
    .line 144
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 145
    .line 146
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v7

    .line 150
    check-cast v7, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 151
    .line 152
    iget-object v7, v7, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 153
    .line 154
    filled-new-array {p0, v4, v7}, [Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object p0

    .line 162
    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 167
    .line 168
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 169
    .line 170
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    .line 172
    .line 173
    invoke-interface {v1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 178
    .line 179
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    check-cast v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;

    .line 189
    .line 190
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->value:Ljava/lang/String;

    .line 191
    .line 192
    invoke-virtual {v3, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 193
    .line 194
    .line 195
    goto :goto_0

    .line 196
    :cond_2
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Figure;->message:Lcom/p1/mobile/putong/core/data/FigureMessage;

    .line 197
    .line 198
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FigureMessage;->template:Ljava/lang/String;

    .line 199
    .line 200
    :goto_0
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    const-string v1, "#FE7E1D"

    .line 205
    .line 206
    if-nez v0, :cond_3

    .line 207
    .line 208
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    const/4 v1, 0x0

    .line 213
    invoke-static {p0, v0, v1}, Ll/e1b;->O0(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    return-object p0

    .line 218
    :cond_3
    invoke-static {v1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    const-string v1, "sans-serif"

    .line 223
    .line 224
    invoke-static {v1, v5}, Landroid/graphics/Typeface;->create(Ljava/lang/String;I)Landroid/graphics/Typeface;

    .line 225
    .line 226
    .line 227
    move-result-object v1

    .line 228
    invoke-static {p0, v3, v0, v1}, Ll/q8g0;->f0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    return-object p0
.end method

.method public static D0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 5

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/Location;->isHideUpdateTime()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, ""

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-object v1

    .line 12
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 13
    .line 14
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/ina;->w3(Lcom/p1/mobile/putong/data/User;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/4 v2, 0x1

    .line 21
    if-eqz v0, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isHideActiveFromSVip()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    sget v0, Lcom/p1/mobile/putong/core/R$string;->Sk:I

    .line 30
    .line 31
    invoke-static {p1}, Ll/wtd0;->d(Lcom/p1/mobile/putong/data/User;)J

    .line 32
    .line 33
    .line 34
    move-result-wide v3

    .line 35
    long-to-double v3, v3

    .line 36
    invoke-static {v3, v4, v2}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 49
    .line 50
    .line 51
    move-result p1

    .line 52
    if-eqz p1, :cond_1

    .line 53
    .line 54
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    sget v0, Lcom/p1/mobile/putong/core/R$string;->m3:I

    .line 63
    .line 64
    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_1
    return-object v0

    .line 77
    :cond_2
    return-object v1

    .line 78
    :cond_3
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 79
    .line 80
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ll/ina;->x3(Lcom/p1/mobile/putong/data/User;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    return-object v1

    .line 89
    :cond_4
    invoke-static {p1}, Ll/d79;->r0(Lcom/p1/mobile/putong/data/User;)Z

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    if-eqz v0, :cond_5

    .line 94
    .line 95
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Sk:I

    .line 96
    .line 97
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 98
    .line 99
    .line 100
    move-result-wide v0

    .line 101
    long-to-double v0, v0

    .line 102
    invoke-static {v0, v1, v2}, Ll/pzi0;->I(DZ)Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    invoke-virtual {p0, p1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object p0

    .line 114
    return-object p0

    .line 115
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 116
    .line 117
    iget-wide p0, p0, Lcom/p1/mobile/putong/data/Location;->updatedTime:D

    .line 118
    .line 119
    invoke-static {p0, p1, v2}, Ll/pzi0;->J(DZ)Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    return-object p0
.end method

.method public static E0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)Z
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 5
    .line 6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->otherReadUntil:Ljava/lang/String;

    .line 13
    .line 14
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 15
    .line 16
    .line 17
    move-result-wide v1

    .line 18
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 19
    .line 20
    invoke-static {p0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 21
    .line 22
    .line 23
    move-result-wide p0

    .line 24
    cmp-long p0, p0, v1

    .line 25
    .line 26
    if-gtz p0, :cond_0

    .line 27
    .line 28
    const/4 p0, 0x1

    .line 29
    return p0

    .line 30
    :cond_0
    return v0
.end method

.method public static F0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    if-eqz p0, :cond_0

    .line 13
    .line 14
    iget p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->unreadMessages:I

    .line 15
    .line 16
    if-gtz p0, :cond_0

    .line 17
    .line 18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 19
    .line 20
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result p0

    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 27
    .line 28
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 29
    .line 30
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    :cond_0
    return v0
.end method

.method public static G0()Z
    .locals 2

    .line 1
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "zh"

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    return v0

    .line 22
    :cond_0
    const/4 v0, 0x0

    .line 23
    return v0
.end method

.method public static H0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/CharSequence;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/e1b;->I0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static I0(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;
    .locals 9

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-object v0

    .line 6
    :cond_0
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 7
    .line 8
    const-string v2, "hide_for_fake_user"

    .line 9
    .line 10
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    if-eqz v1, :cond_2

    .line 15
    .line 16
    invoke-static {}, Ll/h39;->K()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-nez p0, :cond_1

    .line 21
    .line 22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0

    .line 35
    :cond_1
    const-string p0, "\u5bf9\u65b9\u53d1\u6765\u4e00\u6761\u6d88\u606f"

    .line 36
    .line 37
    return-object p0

    .line 38
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 39
    .line 40
    const-string v2, "exclusive_chat_invite"

    .line 41
    .line 42
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    const/4 v2, 0x0

    .line 47
    const-wide/16 v3, 0x0

    .line 48
    .line 49
    if-eqz v1, :cond_5

    .line 50
    .line 51
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {p1, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageChatHeat;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 60
    .line 61
    move-object v2, p0

    .line 62
    goto :goto_0

    .line 63
    :catch_0
    move-exception p0

    .line 64
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    :goto_0
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide p0

    .line 77
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 78
    .line 79
    double-to-long v0, v0

    .line 80
    cmp-long p0, p0, v0

    .line 81
    .line 82
    if-lez p0, :cond_3

    .line 83
    .line 84
    iget-wide p0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 85
    .line 86
    double-to-long p0, p0

    .line 87
    cmp-long p0, p0, v3

    .line 88
    .line 89
    if-gtz p0, :cond_3

    .line 90
    .line 91
    const-string p0, "\u672a\u53ca\u65f6\u63a5\u53d7\uff0c\u4e13\u5c5e\u804a\u5929\u9080\u8bf7\u5df2\u5931\u6548"

    .line 92
    .line 93
    return-object p0

    .line 94
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 95
    .line 96
    .line 97
    move-result-wide p0

    .line 98
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteTime:D

    .line 99
    .line 100
    double-to-long v0, v0

    .line 101
    cmp-long p0, p0, v0

    .line 102
    .line 103
    if-lez p0, :cond_4

    .line 104
    .line 105
    invoke-static {}, Ll/pzi0;->o()J

    .line 106
    .line 107
    .line 108
    move-result-wide p0

    .line 109
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 110
    .line 111
    double-to-long v0, v0

    .line 112
    cmp-long p0, p0, v0

    .line 113
    .line 114
    if-gez p0, :cond_4

    .line 115
    .line 116
    iget-wide p0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatStartTime:D

    .line 117
    .line 118
    double-to-long p0, p0

    .line 119
    cmp-long p0, p0, v3

    .line 120
    .line 121
    if-gtz p0, :cond_4

    .line 122
    .line 123
    new-instance p0, Ljava/lang/StringBuilder;

    .line 124
    .line 125
    const-string p1, "1v1\u4e13\u5c5e\u804a\u5929\u9080\u8bf7 "

    .line 126
    .line 127
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    iget-wide v0, v2, Lcom/p1/mobile/putong/core/data/MessageChatHeat;->exclusiveChatInviteExpireTime:D

    .line 131
    .line 132
    double-to-long v0, v0

    .line 133
    invoke-static {}, Ll/pzi0;->o()J

    .line 134
    .line 135
    .line 136
    move-result-wide v2

    .line 137
    sub-long/2addr v0, v2

    .line 138
    invoke-static {v0, v1}, Lcom/p1/mobile/putong/core/api/c0;->l(J)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p0

    .line 149
    return-object p0

    .line 150
    :cond_4
    const-string p0, "1v1\u4e13\u5c5e\u804a\u5929\u9080\u8bf7"

    .line 151
    .line 152
    return-object p0

    .line 153
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 154
    .line 155
    const-string v5, "voice_call_invitation"

    .line 156
    .line 157
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result v1

    .line 161
    if-eqz v1, :cond_6

    .line 162
    .line 163
    invoke-static {p0, p1}, Ll/rum0;->a(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/Conversation;)Ljava/lang/CharSequence;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    return-object p0

    .line 168
    :cond_6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    const-string v5, "common_tip"

    .line 173
    .line 174
    invoke-static {v1, v5}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    const/4 v5, 0x2

    .line 179
    const/4 v6, 0x1

    .line 180
    const/4 v7, 0x0

    .line 181
    if-nez v1, :cond_7

    .line 182
    .line 183
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const-string v8, "common_tip_list_show"

    .line 188
    .line 189
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    if-nez v1, :cond_7

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const-string v8, "local_intl_prompt_message_type"

    .line 200
    .line 201
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-eqz v1, :cond_9

    .line 206
    .line 207
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 208
    .line 209
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    if-nez v1, :cond_9

    .line 214
    .line 215
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 222
    .line 223
    const-string v0, "<a>"

    .line 224
    .line 225
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    array-length v0, p0

    .line 230
    if-le v0, v6, :cond_8

    .line 231
    .line 232
    aget-object p0, p0, v6

    .line 233
    .line 234
    const-string v0, "</a>"

    .line 235
    .line 236
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 237
    .line 238
    .line 239
    move-result-object p0

    .line 240
    array-length v0, p0

    .line 241
    if-lez v0, :cond_8

    .line 242
    .line 243
    aget-object p0, p0, v7

    .line 244
    .line 245
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object p1

    .line 249
    filled-new-array {p0}, [Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-static {p0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    const v0, -0x181e3

    .line 258
    .line 259
    .line 260
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 261
    .line 262
    .line 263
    move-result-object v1

    .line 264
    invoke-static {p1, p0, v0, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    return-object p0

    .line 269
    :cond_8
    return-object p1

    .line 270
    :cond_9
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 271
    .line 272
    const-string v8, "conversation_notification"

    .line 273
    .line 274
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 275
    .line 276
    .line 277
    move-result v1

    .line 278
    if-eqz v1, :cond_c

    .line 279
    .line 280
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 281
    .line 282
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result p1

    .line 286
    if-eqz p1, :cond_b

    .line 287
    .line 288
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 289
    .line 290
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 291
    .line 292
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-eqz p1, :cond_b

    .line 297
    .line 298
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 299
    .line 300
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 301
    .line 302
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationNotification;->localeKey:Ljava/lang/String;

    .line 303
    .line 304
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_b

    .line 309
    .line 310
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 311
    .line 312
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 313
    .line 314
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationNotification;->localeKey:Ljava/lang/String;

    .line 315
    .line 316
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/e;->J6(Ljava/lang/String;)I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    if-lez v0, :cond_b

    .line 321
    .line 322
    :try_start_1
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ConversationNotification;->params:Ljava/util/List;

    .line 323
    .line 324
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 325
    .line 326
    .line 327
    move-result v1

    .line 328
    if-nez v1, :cond_a

    .line 329
    .line 330
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 331
    .line 332
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ConversationNotification;->params:Ljava/util/List;

    .line 333
    .line 334
    invoke-interface {p1}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    invoke-virtual {v1, v0, p1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    return-object p0

    .line 343
    :catch_1
    move-exception p1

    .line 344
    goto :goto_1

    .line 345
    :cond_a
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 346
    .line 347
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 348
    .line 349
    .line 350
    move-result-object p0
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 351
    return-object p0

    .line 352
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 353
    .line 354
    .line 355
    :cond_b
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 356
    .line 357
    return-object p0

    .line 358
    :cond_c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 359
    .line 360
    const-string v8, "red_packet"

    .line 361
    .line 362
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 363
    .line 364
    .line 365
    move-result v1

    .line 366
    if-eqz v1, :cond_e

    .line 367
    .line 368
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 369
    .line 370
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    sget v0, Lcom/p1/mobile/putong/core/R$string;->s1:I

    .line 375
    .line 376
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 381
    .line 382
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 383
    .line 384
    .line 385
    move-result v0

    .line 386
    if-nez v0, :cond_d

    .line 387
    .line 388
    :try_start_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 389
    .line 390
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 391
    .line 392
    invoke-virtual {v0, p0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    check-cast p0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;

    .line 397
    .line 398
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->redPacketTitle:Ljava/lang/String;

    .line 399
    .line 400
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 401
    .line 402
    .line 403
    move-result v0

    .line 404
    if-nez v0, :cond_d

    .line 405
    .line 406
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageRedPacketStatus;->redPacketTitle:Ljava/lang/String;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 407
    .line 408
    goto :goto_2

    .line 409
    :catch_2
    move-exception p0

    .line 410
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 411
    .line 412
    .line 413
    :cond_d
    :goto_2
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 414
    .line 415
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    sget v0, Lcom/p1/mobile/putong/core/R$string;->s1:I

    .line 420
    .line 421
    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    invoke-static {p0, p1}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    return-object p0

    .line 430
    :cond_e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 431
    .line 432
    const-string v8, "red_packet_notification"

    .line 433
    .line 434
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 435
    .line 436
    .line 437
    move-result v1

    .line 438
    if-eqz v1, :cond_f

    .line 439
    .line 440
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 441
    .line 442
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 443
    .line 444
    .line 445
    move-result v1

    .line 446
    if-nez v1, :cond_f

    .line 447
    .line 448
    :try_start_3
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageRedPacketNotificationStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 449
    .line 450
    iget-object v8, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 451
    .line 452
    invoke-virtual {v1, v8}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object v1

    .line 456
    check-cast v1, Lcom/p1/mobile/putong/core/data/MessageRedPacketNotificationStatus;

    .line 457
    .line 458
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/MessageRedPacketNotificationStatus;->msg:Ljava/lang/String;
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 459
    .line 460
    return-object p0

    .line 461
    :catch_3
    move-exception v1

    .line 462
    invoke-static {v1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 463
    .line 464
    .line 465
    :cond_f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 466
    .line 467
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 468
    .line 469
    .line 470
    move-result v1

    .line 471
    if-eqz v1, :cond_11

    .line 472
    .line 473
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 474
    .line 475
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 476
    .line 477
    .line 478
    move-result v1

    .line 479
    if-eqz v1, :cond_11

    .line 480
    .line 481
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 482
    .line 483
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 484
    .line 485
    .line 486
    move-result p1

    .line 487
    if-eqz p1, :cond_10

    .line 488
    .line 489
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 490
    .line 491
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageExtData;->recallText:Ljava/lang/String;

    .line 492
    .line 493
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 494
    .line 495
    .line 496
    move-result p1

    .line 497
    if-nez p1, :cond_10

    .line 498
    .line 499
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 500
    .line 501
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->recallText:Ljava/lang/String;

    .line 502
    .line 503
    goto/16 :goto_d

    .line 504
    .line 505
    :cond_10
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 506
    .line 507
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 508
    .line 509
    .line 510
    move-result-object p0

    .line 511
    sget p1, Lcom/p1/mobile/putong/core/R$string;->bj:I

    .line 512
    .line 513
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 514
    .line 515
    .line 516
    move-result-object p0

    .line 517
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 518
    .line 519
    .line 520
    move-result-object v0

    .line 521
    goto/16 :goto_d

    .line 522
    .line 523
    :cond_11
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 524
    .line 525
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 526
    .line 527
    .line 528
    move-result v1

    .line 529
    if-eqz v1, :cond_13

    .line 530
    .line 531
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 532
    .line 533
    .line 534
    move-result p0

    .line 535
    if-eqz p0, :cond_12

    .line 536
    .line 537
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 538
    .line 539
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 540
    .line 541
    .line 542
    move-result-object p0

    .line 543
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Zn:I

    .line 544
    .line 545
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    :goto_3
    move-object v0, p0

    .line 550
    goto/16 :goto_d

    .line 551
    .line 552
    :cond_12
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 553
    .line 554
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 555
    .line 556
    .line 557
    move-result-object p0

    .line 558
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Yn:I

    .line 559
    .line 560
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 561
    .line 562
    .line 563
    move-result-object p0

    .line 564
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 565
    .line 566
    .line 567
    move-result-object p0

    .line 568
    goto :goto_3

    .line 569
    :cond_13
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 570
    .line 571
    const-string v8, "card"

    .line 572
    .line 573
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 574
    .line 575
    .line 576
    move-result v1

    .line 577
    if-eqz v1, :cond_14

    .line 578
    .line 579
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 580
    .line 581
    goto/16 :goto_d

    .line 582
    .line 583
    :cond_14
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 584
    .line 585
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 586
    .line 587
    .line 588
    move-result v1

    .line 589
    if-eqz v1, :cond_16

    .line 590
    .line 591
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 592
    .line 593
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->d0:Ll/kua;

    .line 594
    .line 595
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->question:Ljava/lang/String;

    .line 596
    .line 597
    invoke-virtual {p1, p0}, Ll/kua;->o3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Question;

    .line 598
    .line 599
    .line 600
    move-result-object p0

    .line 601
    if-nez p0, :cond_15

    .line 602
    .line 603
    goto/16 :goto_d

    .line 604
    .line 605
    :cond_15
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Question;->text:Ljava/lang/String;

    .line 606
    .line 607
    goto/16 :goto_d

    .line 608
    .line 609
    :cond_16
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->sticker:Ljava/lang/String;

    .line 610
    .line 611
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    move-result v1

    .line 615
    if-eqz v1, :cond_17

    .line 616
    .line 617
    sget p0, Lcom/p1/mobile/putong/core/R$string;->B9:I

    .line 618
    .line 619
    invoke-static {p0}, Ll/k3d0;->c(I)Ljava/lang/String;

    .line 620
    .line 621
    .line 622
    move-result-object v0

    .line 623
    goto/16 :goto_d

    .line 624
    .line 625
    :cond_17
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 626
    .line 627
    .line 628
    move-result-object v1

    .line 629
    const-string v8, "real_shot"

    .line 630
    .line 631
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 632
    .line 633
    .line 634
    move-result v1

    .line 635
    if-eqz v1, :cond_1a

    .line 636
    .line 637
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    move-result v0

    .line 641
    if-eqz v0, :cond_19

    .line 642
    .line 643
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 644
    .line 645
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 646
    .line 647
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->cid:Ljava/lang/String;

    .line 648
    .line 649
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    invoke-static {v0, p1}, Ll/dek0;->d(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 654
    .line 655
    .line 656
    move-result p1

    .line 657
    if-eqz p1, :cond_19

    .line 658
    .line 659
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 660
    .line 661
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 662
    .line 663
    .line 664
    move-result p1

    .line 665
    if-eqz p1, :cond_18

    .line 666
    .line 667
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 668
    .line 669
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 670
    .line 671
    .line 672
    move-result-object p0

    .line 673
    sget p1, Lcom/p1/mobile/putong/core/R$string;->tk:I

    .line 674
    .line 675
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 676
    .line 677
    .line 678
    move-result-object v0

    .line 679
    goto/16 :goto_d

    .line 680
    .line 681
    :cond_18
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 682
    .line 683
    goto/16 :goto_d

    .line 684
    .line 685
    :cond_19
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 686
    .line 687
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 688
    .line 689
    .line 690
    move-result-object p1

    .line 691
    sget v0, Lcom/p1/mobile/putong/core/R$string;->tk:I

    .line 692
    .line 693
    invoke-virtual {p1, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 694
    .line 695
    .line 696
    move-result-object p1

    .line 697
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 698
    .line 699
    invoke-static {p1, p0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    goto/16 :goto_d

    .line 704
    .line 705
    :cond_1a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 706
    .line 707
    const-string v8, "group_invitation"

    .line 708
    .line 709
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 710
    .line 711
    .line 712
    move-result v1

    .line 713
    if-eqz v1, :cond_1c

    .line 714
    .line 715
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 716
    .line 717
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 718
    .line 719
    .line 720
    move-result p1

    .line 721
    if-eqz p1, :cond_1b

    .line 722
    .line 723
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 724
    .line 725
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 726
    .line 727
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 728
    .line 729
    .line 730
    move-result p1

    .line 731
    if-eqz p1, :cond_1b

    .line 732
    .line 733
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 734
    .line 735
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 736
    .line 737
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->title:Ljava/lang/String;

    .line 738
    .line 739
    goto/16 :goto_d

    .line 740
    .line 741
    :cond_1b
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 742
    .line 743
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 744
    .line 745
    .line 746
    move-result-object p0

    .line 747
    sget p1, Lcom/p1/mobile/putong/core/R$string;->o1:I

    .line 748
    .line 749
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 750
    .line 751
    .line 752
    move-result-object v0

    .line 753
    goto/16 :goto_d

    .line 754
    .line 755
    :cond_1c
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 756
    .line 757
    const-string v8, "picture_compliment"

    .line 758
    .line 759
    invoke-static {v1, v8}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 760
    .line 761
    .line 762
    move-result v1

    .line 763
    if-eqz v1, :cond_1d

    .line 764
    .line 765
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 766
    .line 767
    goto/16 :goto_d

    .line 768
    .line 769
    :cond_1d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 770
    .line 771
    if-eqz v1, :cond_23

    .line 772
    .line 773
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    .line 774
    .line 775
    .line 776
    move-result v1

    .line 777
    if-nez v1, :cond_23

    .line 778
    .line 779
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 780
    .line 781
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 782
    .line 783
    .line 784
    move-result-object v1

    .line 785
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Video;

    .line 786
    .line 787
    if-eqz v1, :cond_1f

    .line 788
    .line 789
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 790
    .line 791
    .line 792
    move-result p0

    .line 793
    if-eqz p0, :cond_1e

    .line 794
    .line 795
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 796
    .line 797
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 798
    .line 799
    .line 800
    move-result-object p0

    .line 801
    sget p1, Lcom/p1/mobile/putong/core/R$string;->xi:I

    .line 802
    .line 803
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 804
    .line 805
    .line 806
    move-result-object p0

    .line 807
    goto/16 :goto_3

    .line 808
    .line 809
    :cond_1e
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 810
    .line 811
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 812
    .line 813
    .line 814
    move-result-object p0

    .line 815
    sget p1, Lcom/p1/mobile/putong/core/R$string;->wi:I

    .line 816
    .line 817
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 818
    .line 819
    .line 820
    move-result-object p0

    .line 821
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 822
    .line 823
    .line 824
    move-result-object p0

    .line 825
    goto/16 :goto_3

    .line 826
    .line 827
    :cond_1f
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 828
    .line 829
    invoke-interface {v1, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 830
    .line 831
    .line 832
    move-result-object v1

    .line 833
    instance-of v1, v1, Lcom/p1/mobile/putong/data/Picture;

    .line 834
    .line 835
    if-eqz v1, :cond_21

    .line 836
    .line 837
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 838
    .line 839
    .line 840
    move-result p0

    .line 841
    if-eqz p0, :cond_20

    .line 842
    .line 843
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 844
    .line 845
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 846
    .line 847
    .line 848
    move-result-object p0

    .line 849
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ui:I

    .line 850
    .line 851
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 852
    .line 853
    .line 854
    move-result-object p0

    .line 855
    goto/16 :goto_3

    .line 856
    .line 857
    :cond_20
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 858
    .line 859
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 860
    .line 861
    .line 862
    move-result-object p0

    .line 863
    sget p1, Lcom/p1/mobile/putong/core/R$string;->ti:I

    .line 864
    .line 865
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 866
    .line 867
    .line 868
    move-result-object p0

    .line 869
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 870
    .line 871
    .line 872
    move-result-object p0

    .line 873
    goto/16 :goto_3

    .line 874
    .line 875
    :cond_21
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->media:Ljava/util/List;

    .line 876
    .line 877
    invoke-interface {p0, v7}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 878
    .line 879
    .line 880
    move-result-object p0

    .line 881
    instance-of p0, p0, Lcom/p1/mobile/putong/data/Audio;

    .line 882
    .line 883
    if-eqz p0, :cond_4f

    .line 884
    .line 885
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 886
    .line 887
    .line 888
    move-result p0

    .line 889
    if-eqz p0, :cond_22

    .line 890
    .line 891
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 892
    .line 893
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 894
    .line 895
    .line 896
    move-result-object p0

    .line 897
    sget p1, Lcom/p1/mobile/putong/core/R$string;->gi:I

    .line 898
    .line 899
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 900
    .line 901
    .line 902
    move-result-object p0

    .line 903
    goto/16 :goto_3

    .line 904
    .line 905
    :cond_22
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 906
    .line 907
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 908
    .line 909
    .line 910
    move-result-object p0

    .line 911
    sget p1, Lcom/p1/mobile/putong/core/R$string;->fi:I

    .line 912
    .line 913
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 914
    .line 915
    .line 916
    move-result-object p0

    .line 917
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 918
    .line 919
    .line 920
    move-result-object p0

    .line 921
    goto/16 :goto_3

    .line 922
    .line 923
    :cond_23
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->likeOfMoment:Ljava/lang/String;

    .line 924
    .line 925
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 926
    .line 927
    .line 928
    move-result v1

    .line 929
    if-eqz v1, :cond_25

    .line 930
    .line 931
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 932
    .line 933
    .line 934
    move-result p0

    .line 935
    if-eqz p0, :cond_24

    .line 936
    .line 937
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 938
    .line 939
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 940
    .line 941
    .line 942
    move-result-object p0

    .line 943
    sget p1, Lcom/p1/mobile/putong/core/R$string;->cj:I

    .line 944
    .line 945
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 946
    .line 947
    .line 948
    move-result-object p0

    .line 949
    invoke-static {p0}, Ll/hmj0;->c(Ljava/lang/String;)Landroid/text/Spannable;

    .line 950
    .line 951
    .line 952
    move-result-object v0

    .line 953
    goto/16 :goto_d

    .line 954
    .line 955
    :cond_24
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 956
    .line 957
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 958
    .line 959
    .line 960
    move-result-object p0

    .line 961
    sget p1, Lcom/p1/mobile/putong/core/R$string;->dj:I

    .line 962
    .line 963
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 964
    .line 965
    .line 966
    move-result-object p0

    .line 967
    invoke-static {p0}, Ll/hmj0;->c(Ljava/lang/String;)Landroid/text/Spannable;

    .line 968
    .line 969
    .line 970
    move-result-object v0

    .line 971
    goto/16 :goto_d

    .line 972
    .line 973
    :cond_25
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->messageType()Lcom/p1/mobile/putong/core/data/MessageType;

    .line 974
    .line 975
    .line 976
    move-result-object v1

    .line 977
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/MessageType;->isUnknownType()Z

    .line 978
    .line 979
    .line 980
    move-result v1

    .line 981
    if-eqz v1, :cond_26

    .line 982
    .line 983
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 984
    .line 985
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 986
    .line 987
    .line 988
    move-result-object p0

    .line 989
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 990
    .line 991
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 992
    .line 993
    .line 994
    move-result-object v0

    .line 995
    goto/16 :goto_d

    .line 996
    .line 997
    :cond_26
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 998
    .line 999
    const-string v7, "voice_call"

    .line 1000
    .line 1001
    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1002
    .line 1003
    .line 1004
    move-result v1

    .line 1005
    if-eqz v1, :cond_28

    .line 1006
    .line 1007
    invoke-static {}, Ll/rum0;->c()Z

    .line 1008
    .line 1009
    .line 1010
    move-result p0

    .line 1011
    if-eqz p0, :cond_27

    .line 1012
    .line 1013
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1014
    .line 1015
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1016
    .line 1017
    .line 1018
    move-result-object p0

    .line 1019
    sget p1, Lcom/p1/mobile/putong/core/R$string;->pt:I

    .line 1020
    .line 1021
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1022
    .line 1023
    .line 1024
    move-result-object p0

    .line 1025
    invoke-static {p0, v0}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1026
    .line 1027
    .line 1028
    move-result-object v0

    .line 1029
    goto/16 :goto_d

    .line 1030
    .line 1031
    :cond_27
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1032
    .line 1033
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1034
    .line 1035
    .line 1036
    move-result-object p0

    .line 1037
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 1038
    .line 1039
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1040
    .line 1041
    .line 1042
    move-result-object v0

    .line 1043
    goto/16 :goto_d

    .line 1044
    .line 1045
    :cond_28
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1046
    .line 1047
    const-string v7, "call_2_buy"

    .line 1048
    .line 1049
    invoke-static {v1, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1050
    .line 1051
    .line 1052
    move-result v1

    .line 1053
    if-eqz v1, :cond_2a

    .line 1054
    .line 1055
    :try_start_4
    sget-object p1, Lcom/p1/mobile/putong/data/MessageCallToBuy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 1056
    .line 1057
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 1058
    .line 1059
    invoke-virtual {p1, v0}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Ljava/lang/String;)Ljava/lang/Object;

    .line 1060
    .line 1061
    .line 1062
    move-result-object p1

    .line 1063
    check-cast p1, Lcom/p1/mobile/putong/data/MessageCallToBuy;
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 1064
    .line 1065
    move-object v2, p1

    .line 1066
    goto :goto_4

    .line 1067
    :catch_4
    move-exception p1

    .line 1068
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1069
    .line 1070
    .line 1071
    :goto_4
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1072
    .line 1073
    .line 1074
    move-result p1

    .line 1075
    if-eqz p1, :cond_29

    .line 1076
    .line 1077
    iget-object p0, v2, Lcom/p1/mobile/putong/data/MessageCallToBuy;->previewText:Ljava/lang/String;

    .line 1078
    .line 1079
    goto/16 :goto_3

    .line 1080
    .line 1081
    :cond_29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1082
    .line 1083
    goto/16 :goto_3

    .line 1084
    .line 1085
    :cond_2a
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1086
    .line 1087
    const-string v2, "tickle"

    .line 1088
    .line 1089
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1090
    .line 1091
    .line 1092
    move-result v1

    .line 1093
    if-eqz v1, :cond_30

    .line 1094
    .line 1095
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isOtherUser()Z

    .line 1096
    .line 1097
    .line 1098
    move-result v0

    .line 1099
    if-eqz v0, :cond_2f

    .line 1100
    .line 1101
    const-wide v0, 0x7fffffffffffffffL

    .line 1102
    .line 1103
    .line 1104
    .line 1105
    .line 1106
    const-wide/high16 v7, -0x8000000000000000L

    .line 1107
    .line 1108
    :try_start_5
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1109
    .line 1110
    .line 1111
    move-result v2

    .line 1112
    if-eqz v2, :cond_2b

    .line 1113
    .line 1114
    iget-object v2, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 1115
    .line 1116
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1117
    .line 1118
    .line 1119
    move-result v2

    .line 1120
    if-nez v2, :cond_2b

    .line 1121
    .line 1122
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->readUntil:Ljava/lang/String;

    .line 1123
    .line 1124
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 1125
    .line 1126
    .line 1127
    move-result-wide v3
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_5

    .line 1128
    goto :goto_5

    .line 1129
    :catch_5
    move-exception p1

    .line 1130
    goto :goto_6

    .line 1131
    :cond_2b
    :goto_5
    :try_start_6
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1132
    .line 1133
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1134
    .line 1135
    .line 1136
    move-result p1

    .line 1137
    if-nez p1, :cond_2c

    .line 1138
    .line 1139
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1140
    .line 1141
    const-string v0, "fake_id_"

    .line 1142
    .line 1143
    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 1144
    .line 1145
    .line 1146
    move-result p1

    .line 1147
    if-nez p1, :cond_2c

    .line 1148
    .line 1149
    iget-object p1, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1150
    .line 1151
    invoke-static {p1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 1152
    .line 1153
    .line 1154
    move-result-wide v7
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_6

    .line 1155
    goto :goto_7

    .line 1156
    :catch_6
    move-exception p1

    .line 1157
    move-wide v0, v3

    .line 1158
    :goto_6
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 1159
    .line 1160
    .line 1161
    move-wide v3, v0

    .line 1162
    :cond_2c
    :goto_7
    cmp-long p1, v3, v7

    .line 1163
    .line 1164
    if-gez p1, :cond_2e

    .line 1165
    .line 1166
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/b;->h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 1167
    .line 1168
    .line 1169
    move-result-object p0

    .line 1170
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1171
    .line 1172
    sget v0, Lcom/p1/mobile/putong/core/R$string;->I1:I

    .line 1173
    .line 1174
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1175
    .line 1176
    .line 1177
    move-result-object p1

    .line 1178
    filled-new-array {p1}, [Ljava/lang/String;

    .line 1179
    .line 1180
    .line 1181
    move-result-object p1

    .line 1182
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 1183
    .line 1184
    .line 1185
    move-result-object p1

    .line 1186
    const v0, -0xdededf

    .line 1187
    .line 1188
    .line 1189
    invoke-static {v5}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 1190
    .line 1191
    .line 1192
    move-result-object v1

    .line 1193
    invoke-static {p0, p1, v0, v1}, Ll/q8g0;->b0(Ljava/lang/String;Ljava/util/ArrayList;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;

    .line 1194
    .line 1195
    .line 1196
    move-result-object p0

    .line 1197
    invoke-virtual {p0}, Landroid/text/SpannableStringBuilder;->toString()Ljava/lang/String;

    .line 1198
    .line 1199
    .line 1200
    move-result-object p1

    .line 1201
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1202
    .line 1203
    sget v1, Lcom/p1/mobile/putong/core/R$string;->I1:I

    .line 1204
    .line 1205
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1206
    .line 1207
    .line 1208
    move-result-object v0

    .line 1209
    invoke-virtual {p1, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 1210
    .line 1211
    .line 1212
    move-result p1

    .line 1213
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1214
    .line 1215
    sget v1, Lcom/p1/mobile/putong/core/R$string;->I1:I

    .line 1216
    .line 1217
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 1218
    .line 1219
    .line 1220
    move-result-object v0

    .line 1221
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 1222
    .line 1223
    .line 1224
    move-result v0

    .line 1225
    add-int/2addr v0, p1

    .line 1226
    if-ltz p1, :cond_2d

    .line 1227
    .line 1228
    new-instance v1, Landroid/text/style/StyleSpan;

    .line 1229
    .line 1230
    invoke-direct {v1, v6}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 1231
    .line 1232
    .line 1233
    const/16 v2, 0x11

    .line 1234
    .line 1235
    invoke-virtual {p0, v1, p1, v0, v2}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 1236
    .line 1237
    .line 1238
    :cond_2d
    return-object p0

    .line 1239
    :cond_2e
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/b;->h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 1240
    .line 1241
    .line 1242
    move-result-object v0

    .line 1243
    goto/16 :goto_d

    .line 1244
    .line 1245
    :cond_2f
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/messages/b;->h(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;

    .line 1246
    .line 1247
    .line 1248
    move-result-object v0

    .line 1249
    goto/16 :goto_d

    .line 1250
    .line 1251
    :cond_30
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1252
    .line 1253
    const-string v2, "oneweekcp_task"

    .line 1254
    .line 1255
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1256
    .line 1257
    .line 1258
    move-result v1

    .line 1259
    if-eqz v1, :cond_31

    .line 1260
    .line 1261
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1262
    .line 1263
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1264
    .line 1265
    .line 1266
    move-result-object p0

    .line 1267
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 1268
    .line 1269
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1270
    .line 1271
    .line 1272
    move-result-object v0

    .line 1273
    goto/16 :goto_d

    .line 1274
    .line 1275
    :cond_31
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1276
    .line 1277
    const-string v2, "chat_gift"

    .line 1278
    .line 1279
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1280
    .line 1281
    .line 1282
    move-result v1

    .line 1283
    if-nez v1, :cond_32

    .line 1284
    .line 1285
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1286
    .line 1287
    const-string v3, "moment_gift"

    .line 1288
    .line 1289
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1290
    .line 1291
    .line 1292
    move-result v1

    .line 1293
    if-eqz v1, :cond_3d

    .line 1294
    .line 1295
    :cond_32
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1296
    .line 1297
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1298
    .line 1299
    .line 1300
    move-result v1

    .line 1301
    if-eqz v1, :cond_3d

    .line 1302
    .line 1303
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1304
    .line 1305
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1306
    .line 1307
    .line 1308
    move-result v1

    .line 1309
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1310
    .line 1311
    if-eqz v1, :cond_33

    .line 1312
    .line 1313
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 1314
    .line 1315
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1316
    .line 1317
    .line 1318
    move-result v1

    .line 1319
    if-eqz v1, :cond_34

    .line 1320
    .line 1321
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1322
    .line 1323
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 1324
    .line 1325
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->id:Ljava/lang/String;

    .line 1326
    .line 1327
    goto :goto_8

    .line 1328
    :cond_33
    iget-object v1, v2, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 1329
    .line 1330
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1331
    .line 1332
    .line 1333
    move-result v1

    .line 1334
    if-eqz v1, :cond_34

    .line 1335
    .line 1336
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1337
    .line 1338
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 1339
    .line 1340
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->id:Ljava/lang/String;

    .line 1341
    .line 1342
    goto :goto_8

    .line 1343
    :cond_34
    move-object p0, v0

    .line 1344
    :goto_8
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1345
    .line 1346
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f1:Ll/lu8;

    .line 1347
    .line 1348
    invoke-virtual {v1, p0}, Ll/lu8;->R3(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/CoreGiftInfo;

    .line 1349
    .line 1350
    .line 1351
    move-result-object p0

    .line 1352
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1353
    .line 1354
    .line 1355
    move-result v1

    .line 1356
    const-wide/16 v2, 0x0

    .line 1357
    .line 1358
    if-eqz v1, :cond_38

    .line 1359
    .line 1360
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->name:Ljava/lang/String;

    .line 1361
    .line 1362
    invoke-static {}, Ll/spl0;->n()Z

    .line 1363
    .line 1364
    .line 1365
    move-result v4

    .line 1366
    if-eqz v4, :cond_36

    .line 1367
    .line 1368
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 1369
    .line 1370
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->blessingText:Ljava/lang/String;

    .line 1371
    .line 1372
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1373
    .line 1374
    .line 1375
    move-result v1

    .line 1376
    const-string v4, "hi\uff0c"

    .line 1377
    .line 1378
    if-nez v1, :cond_35

    .line 1379
    .line 1380
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1381
    .line 1382
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1383
    .line 1384
    .line 1385
    iget-object v4, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->extra:Lcom/p1/mobile/putong/core/data/GiftInfoExtra;

    .line 1386
    .line 1387
    iget-object v4, v4, Lcom/p1/mobile/putong/core/data/GiftInfoExtra;->blessingText:Ljava/lang/String;

    .line 1388
    .line 1389
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1390
    .line 1391
    .line 1392
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1393
    .line 1394
    .line 1395
    move-result-object v1

    .line 1396
    goto :goto_9

    .line 1397
    :cond_35
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1398
    .line 1399
    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1400
    .line 1401
    .line 1402
    invoke-static {}, Ll/c7d0;->g0()Ljava/lang/String;

    .line 1403
    .line 1404
    .line 1405
    move-result-object v4

    .line 1406
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1407
    .line 1408
    .line 1409
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1410
    .line 1411
    .line 1412
    move-result-object v1

    .line 1413
    goto :goto_9

    .line 1414
    :cond_36
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 1415
    .line 1416
    cmpl-double v4, v4, v2

    .line 1417
    .line 1418
    const-string v5, "hi\uff0c\u9001\u4f60\u4e00\u4e2a "

    .line 1419
    .line 1420
    if-nez v4, :cond_37

    .line 1421
    .line 1422
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1423
    .line 1424
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1425
    .line 1426
    .line 1427
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1428
    .line 1429
    .line 1430
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1431
    .line 1432
    .line 1433
    move-result-object v1

    .line 1434
    goto :goto_9

    .line 1435
    :cond_37
    new-instance v4, Ljava/lang/StringBuilder;

    .line 1436
    .line 1437
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1438
    .line 1439
    .line 1440
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1441
    .line 1442
    .line 1443
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1444
    .line 1445
    .line 1446
    move-result-object v1

    .line 1447
    goto :goto_9

    .line 1448
    :cond_38
    move-object v1, v0

    .line 1449
    :goto_9
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1450
    .line 1451
    .line 1452
    move-result v4

    .line 1453
    if-eqz v4, :cond_3a

    .line 1454
    .line 1455
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/data/CoreGiftInfo;->unitCoinPrice:D

    .line 1456
    .line 1457
    cmpl-double p0, v4, v2

    .line 1458
    .line 1459
    if-eqz p0, :cond_39

    .line 1460
    .line 1461
    goto :goto_a

    .line 1462
    :catch_7
    :cond_39
    move-object v0, v1

    .line 1463
    goto/16 :goto_d

    .line 1464
    .line 1465
    :cond_3a
    :goto_a
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1466
    .line 1467
    .line 1468
    move-result p0

    .line 1469
    if-eqz p0, :cond_3c

    .line 1470
    .line 1471
    new-instance p0, Ljava/lang/StringBuilder;

    .line 1472
    .line 1473
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1474
    .line 1475
    .line 1476
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1477
    .line 1478
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1479
    .line 1480
    .line 1481
    move-result-object p1

    .line 1482
    sget v2, Lcom/p1/mobile/putong/core/R$string;->k1:I

    .line 1483
    .line 1484
    invoke-virtual {p1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1485
    .line 1486
    .line 1487
    move-result-object p1

    .line 1488
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1489
    .line 1490
    .line 1491
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1492
    .line 1493
    .line 1494
    move-result p1

    .line 1495
    if-eqz p1, :cond_3b

    .line 1496
    .line 1497
    goto :goto_b

    .line 1498
    :cond_3b
    const-string p1, " \u00b7 "

    .line 1499
    .line 1500
    invoke-virtual {p1, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 1501
    .line 1502
    .line 1503
    move-result-object v0

    .line 1504
    :goto_b
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1505
    .line 1506
    .line 1507
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1508
    .line 1509
    .line 1510
    move-result-object p0

    .line 1511
    goto/16 :goto_3

    .line 1512
    .line 1513
    :cond_3c
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1514
    .line 1515
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1516
    .line 1517
    .line 1518
    move-result-object p0

    .line 1519
    sget p1, Lcom/p1/mobile/putong/core/R$string;->j1:I

    .line 1520
    .line 1521
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1522
    .line 1523
    .line 1524
    move-result-object p0

    .line 1525
    invoke-static {p0, v1}, Ll/c17;->n0(Ljava/lang/String;Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 1526
    .line 1527
    .line 1528
    move-result-object p0

    .line 1529
    goto/16 :goto_3

    .line 1530
    .line 1531
    :cond_3d
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1532
    .line 1533
    const-string v2, "state_like"

    .line 1534
    .line 1535
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1536
    .line 1537
    .line 1538
    move-result v1

    .line 1539
    if-eqz v1, :cond_3e

    .line 1540
    .line 1541
    const-string v0, "\u8d5e\u4e86\u4f60\u7684\u72b6\u6001"

    .line 1542
    .line 1543
    goto/16 :goto_d

    .line 1544
    .line 1545
    :cond_3e
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1546
    .line 1547
    const-string v2, "wanwan_invite"

    .line 1548
    .line 1549
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1550
    .line 1551
    .line 1552
    move-result v1

    .line 1553
    const-string v2, "receiverSummary"

    .line 1554
    .line 1555
    const-string v3, "senderSummary"

    .line 1556
    .line 1557
    if-eqz v1, :cond_41

    .line 1558
    .line 1559
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 1560
    .line 1561
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1562
    .line 1563
    .line 1564
    move-result v0

    .line 1565
    const-string v1, "[\u73a9\u6447\u9ab0\u5b50\u6e38\u620f\u9080\u8bf7]"

    .line 1566
    .line 1567
    if-eqz v0, :cond_3f

    .line 1568
    .line 1569
    return-object v1

    .line 1570
    :cond_3f
    :try_start_7
    new-instance v0, Lorg/json/JSONObject;

    .line 1571
    .line 1572
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1573
    .line 1574
    .line 1575
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1576
    .line 1577
    .line 1578
    move-result p0

    .line 1579
    if-eqz p0, :cond_40

    .line 1580
    .line 1581
    move-object v2, v3

    .line 1582
    :cond_40
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 1583
    .line 1584
    .line 1585
    move-result-object p0
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_7

    .line 1586
    goto/16 :goto_3

    .line 1587
    .line 1588
    :cond_41
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1589
    .line 1590
    const-string v4, "zuju_offline"

    .line 1591
    .line 1592
    invoke-static {v1, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1593
    .line 1594
    .line 1595
    move-result v1

    .line 1596
    if-eqz v1, :cond_44

    .line 1597
    .line 1598
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->msgData:Ljava/lang/String;

    .line 1599
    .line 1600
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1601
    .line 1602
    .line 1603
    move-result v0

    .line 1604
    const-string v1, "[\u6d3b\u52a8\u5361\u7247]"

    .line 1605
    .line 1606
    if-eqz v0, :cond_42

    .line 1607
    .line 1608
    return-object v1

    .line 1609
    :cond_42
    :try_start_8
    new-instance v0, Lorg/json/JSONObject;

    .line 1610
    .line 1611
    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 1612
    .line 1613
    .line 1614
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1615
    .line 1616
    .line 1617
    move-result p0

    .line 1618
    if-eqz p0, :cond_43

    .line 1619
    .line 1620
    move-object v2, v3

    .line 1621
    :cond_43
    invoke-virtual {v0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    .line 1622
    .line 1623
    .line 1624
    move-result-object p0
    :try_end_8
    .catch Lorg/json/JSONException; {:try_start_8 .. :try_end_8} :catch_7

    .line 1625
    goto/16 :goto_3

    .line 1626
    .line 1627
    :cond_44
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1628
    .line 1629
    const-string v2, "wooden_fish"

    .line 1630
    .line 1631
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1632
    .line 1633
    .line 1634
    move-result v1

    .line 1635
    if-eqz v1, :cond_45

    .line 1636
    .line 1637
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 1638
    .line 1639
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 1640
    .line 1641
    .line 1642
    move-result-object p0

    .line 1643
    sget p1, Lcom/p1/mobile/putong/core/R$string;->Oq:I

    .line 1644
    .line 1645
    invoke-virtual {p0, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 1646
    .line 1647
    .line 1648
    move-result-object v0

    .line 1649
    goto/16 :goto_d

    .line 1650
    .line 1651
    :cond_45
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1652
    .line 1653
    const-string v2, "chat_assistant_question"

    .line 1654
    .line 1655
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1656
    .line 1657
    .line 1658
    move-result v1

    .line 1659
    if-eqz v1, :cond_46

    .line 1660
    .line 1661
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1662
    .line 1663
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1664
    .line 1665
    .line 1666
    move-result v1

    .line 1667
    if-nez v1, :cond_46

    .line 1668
    .line 1669
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1670
    .line 1671
    const-string p1, "\u4f60\u597d\u5440\uff0c\u95ee\u4e2a\u95ee\u9898\uff5e\n"

    .line 1672
    .line 1673
    invoke-virtual {p0, p1, v0}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 1674
    .line 1675
    .line 1676
    move-result-object v0

    .line 1677
    goto/16 :goto_d

    .line 1678
    .line 1679
    :cond_46
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1680
    .line 1681
    const-string v2, "two_sides_different_tip"

    .line 1682
    .line 1683
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1684
    .line 1685
    .line 1686
    move-result v1

    .line 1687
    if-eqz v1, :cond_49

    .line 1688
    .line 1689
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1690
    .line 1691
    .line 1692
    move-result p1

    .line 1693
    if-eqz p1, :cond_47

    .line 1694
    .line 1695
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1696
    .line 1697
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1698
    .line 1699
    .line 1700
    move-result p1

    .line 1701
    if-eqz p1, :cond_47

    .line 1702
    .line 1703
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1704
    .line 1705
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1706
    .line 1707
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1708
    .line 1709
    .line 1710
    move-result p1

    .line 1711
    if-eqz p1, :cond_47

    .line 1712
    .line 1713
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1714
    .line 1715
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1716
    .line 1717
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1718
    .line 1719
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1720
    .line 1721
    .line 1722
    move-result p1

    .line 1723
    if-eqz p1, :cond_47

    .line 1724
    .line 1725
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1726
    .line 1727
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1728
    .line 1729
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1730
    .line 1731
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 1732
    .line 1733
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1734
    .line 1735
    .line 1736
    move-result p1

    .line 1737
    if-nez p1, :cond_47

    .line 1738
    .line 1739
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1740
    .line 1741
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1742
    .line 1743
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->selfShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1744
    .line 1745
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 1746
    .line 1747
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1748
    .line 1749
    goto :goto_c

    .line 1750
    :cond_47
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1751
    .line 1752
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1753
    .line 1754
    .line 1755
    move-result p1

    .line 1756
    if-eqz p1, :cond_48

    .line 1757
    .line 1758
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1759
    .line 1760
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1761
    .line 1762
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1763
    .line 1764
    .line 1765
    move-result p1

    .line 1766
    if-eqz p1, :cond_48

    .line 1767
    .line 1768
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1769
    .line 1770
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1771
    .line 1772
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1773
    .line 1774
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 1775
    .line 1776
    .line 1777
    move-result p1

    .line 1778
    if-eqz p1, :cond_48

    .line 1779
    .line 1780
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1781
    .line 1782
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1783
    .line 1784
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1785
    .line 1786
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 1787
    .line 1788
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 1789
    .line 1790
    .line 1791
    move-result p1

    .line 1792
    if-nez p1, :cond_48

    .line 1793
    .line 1794
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->additionalData:Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 1795
    .line 1796
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 1797
    .line 1798
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatTips;->otherShown:Lcom/p1/mobile/putong/core/data/MessageTipsContent;

    .line 1799
    .line 1800
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/MessageTipsContent;->value:Ljava/lang/String;

    .line 1801
    .line 1802
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1803
    .line 1804
    :cond_48
    :goto_c
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1805
    .line 1806
    goto/16 :goto_d

    .line 1807
    .line 1808
    :cond_49
    iget-object v1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1809
    .line 1810
    const-string v2, "love_letter"

    .line 1811
    .line 1812
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1813
    .line 1814
    .line 1815
    move-result v1

    .line 1816
    if-eqz v1, :cond_4d

    .line 1817
    .line 1818
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 1819
    .line 1820
    .line 1821
    move-result v1

    .line 1822
    if-eqz v1, :cond_4c

    .line 1823
    .line 1824
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1825
    .line 1826
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 1827
    .line 1828
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 1829
    .line 1830
    const-string v2, "opened"

    .line 1831
    .line 1832
    invoke-static {v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1833
    .line 1834
    .line 1835
    move-result v1

    .line 1836
    const-string v2, "\u5df2\u67e5\u770b\u60c5\u4e66"

    .line 1837
    .line 1838
    if-eqz v1, :cond_4a

    .line 1839
    .line 1840
    new-instance p0, Ljava/lang/StringBuilder;

    .line 1841
    .line 1842
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1843
    .line 1844
    .line 1845
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1846
    .line 1847
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1848
    .line 1849
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1850
    .line 1851
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 1852
    .line 1853
    .line 1854
    move-result-object p1

    .line 1855
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 1856
    .line 1857
    .line 1858
    move-result-object p1

    .line 1859
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1860
    .line 1861
    .line 1862
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1863
    .line 1864
    .line 1865
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1866
    .line 1867
    .line 1868
    move-result-object v0

    .line 1869
    goto :goto_d

    .line 1870
    :cond_4a
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/Conversation;->additional:Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 1871
    .line 1872
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 1873
    .line 1874
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->state:Lcom/p1/mobile/putong/core/data/LoveLetterMessageState;

    .line 1875
    .line 1876
    const-string v3, "default"

    .line 1877
    .line 1878
    invoke-static {v1, v3}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1879
    .line 1880
    .line 1881
    move-result v1

    .line 1882
    if-eqz v1, :cond_4f

    .line 1883
    .line 1884
    invoke-static {p1, p0}, Ll/e1b;->E0(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;)Z

    .line 1885
    .line 1886
    .line 1887
    move-result p0

    .line 1888
    if-eqz p0, :cond_4b

    .line 1889
    .line 1890
    new-instance p0, Ljava/lang/StringBuilder;

    .line 1891
    .line 1892
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1893
    .line 1894
    .line 1895
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 1896
    .line 1897
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 1898
    .line 1899
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 1900
    .line 1901
    invoke-virtual {v0, p1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 1902
    .line 1903
    .line 1904
    move-result-object p1

    .line 1905
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->getPronoun()Ljava/lang/String;

    .line 1906
    .line 1907
    .line 1908
    move-result-object p1

    .line 1909
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1910
    .line 1911
    .line 1912
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1913
    .line 1914
    .line 1915
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1916
    .line 1917
    .line 1918
    move-result-object v0

    .line 1919
    goto :goto_d

    .line 1920
    :cond_4b
    const-string v0, "\u5df2\u4e3a\u4f60\u9001\u8fbe"

    .line 1921
    .line 1922
    goto :goto_d

    .line 1923
    :cond_4c
    const-string v0, "\u552f\u4e00\u7684\u60c5\u4e66\u9001\u7ed9\u4f60"

    .line 1924
    .line 1925
    goto :goto_d

    .line 1926
    :cond_4d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 1927
    .line 1928
    const-string v0, "ai_chat_analysis"

    .line 1929
    .line 1930
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 1931
    .line 1932
    .line 1933
    move-result p1

    .line 1934
    if-eqz p1, :cond_4e

    .line 1935
    .line 1936
    const-string v0, "[\u5bf9\u8bdd\u5206\u6790]"

    .line 1937
    .line 1938
    goto :goto_d

    .line 1939
    :cond_4e
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->value:Ljava/lang/String;

    .line 1940
    .line 1941
    :cond_4f
    :goto_d
    return-object v0
.end method

.method public static J0(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Bj:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/core/R$string;->Cj:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->batchSize:I

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, ""

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v1, "20"

    .line 60
    .line 61
    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static K0(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)Ljava/lang/String;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string p0, ""

    .line 24
    .line 25
    :goto_0
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0

    .line 33
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 34
    .line 35
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 36
    .line 37
    .line 38
    iget p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->batchSize:I

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, "+"

    .line 44
    .line 45
    goto :goto_0
.end method

.method public static L0(Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;)Ljava/lang/String;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->next:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 10
    .line 11
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ul:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->lookups:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-virtual {v0, v1, p0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0

    .line 32
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 33
    .line 34
    sget v1, Lcom/p1/mobile/putong/core/R$string;->vl:I

    .line 35
    .line 36
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    new-instance v1, Ljava/lang/StringBuilder;

    .line 41
    .line 42
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 43
    .line 44
    .line 45
    iget p0, p0, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->batchSize:I

    .line 46
    .line 47
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    const-string p0, ""

    .line 51
    .line 52
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string v1, "20"

    .line 60
    .line 61
    invoke-virtual {v0, v1, p0}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public static M0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;
    .locals 4

    .line 1
    invoke-static {p0, p1}, Ll/e1b;->D0(Landroid/content/Context;Lcom/p1/mobile/putong/data/User;)Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 6
    .line 7
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->E0:Ll/ina;

    .line 8
    .line 9
    invoke-virtual {v0, p1}, Ll/ina;->B3(Lcom/p1/mobile/putong/data/User;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_4

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isMe()Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    goto/16 :goto_0

    .line 22
    .line 23
    :cond_0
    invoke-static {p1}, Ll/d79;->r0(Lcom/p1/mobile/putong/data/User;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    const/4 v1, 0x1

    .line 28
    const/4 v2, 0x0

    .line 29
    if-eqz v0, :cond_2

    .line 30
    .line 31
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    iget-object v0, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 54
    .line 55
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 56
    .line 57
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 58
    .line 59
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_2

    .line 64
    .line 65
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    if-eqz v0, :cond_1

    .line 80
    .line 81
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 82
    .line 83
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 84
    .line 85
    invoke-static {p1, v1, v2}, Ll/q8g0;->s(IZZ)Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    goto :goto_1

    .line 90
    :cond_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 99
    .line 100
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Location;->region:Lcom/p1/mobile/putong/data/Region;

    .line 101
    .line 102
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Region;->city:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_1

    .line 105
    :cond_2
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    iget-object p1, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 120
    .line 121
    if-eqz v0, :cond_3

    .line 122
    .line 123
    iget p1, p1, Lcom/p1/mobile/putong/data/Location;->distance:I

    .line 124
    .line 125
    invoke-static {p1, v1, v2}, Ll/q8g0;->s(IZZ)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    goto :goto_1

    .line 130
    :cond_3
    const/4 v0, 0x0

    .line 131
    invoke-static {p1, v2, v0, v2, v1}, Ll/q8g0;->U(Lcom/p1/mobile/putong/data/Location;ZLandroid/text/style/CharacterStyle;ZZ)Ljava/lang/CharSequence;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    goto :goto_1

    .line 136
    :cond_4
    :goto_0
    const-string p1, ""

    .line 137
    .line 138
    :goto_1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 139
    .line 140
    .line 141
    move-result v0

    .line 142
    if-eqz v0, :cond_5

    .line 143
    .line 144
    return-object p0

    .line 145
    :cond_5
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    if-eqz v0, :cond_6

    .line 150
    .line 151
    invoke-static {p1}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    return-object p0

    .line 156
    :cond_6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    const-string p1, " \u00b7 "

    .line 165
    .line 166
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    return-object p0
.end method

.method public static N0(Ljava/util/List;Ljava/util/List;IZIZ)Landroid/text/SpannableStringBuilder;
    .locals 33
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/data/Tag;",
            ">;IZIZ)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    new-instance v0, Landroid/text/SpannableStringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/text/SpannableStringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static/range {p0 .. p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const-string v2, " "

    .line 11
    .line 12
    const/16 v3, 0x21

    .line 13
    .line 14
    const/high16 v4, 0x42300000    # 44.0f

    .line 15
    .line 16
    const-string v5, "1"

    .line 17
    .line 18
    const/4 v6, 0x0

    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    invoke-interface/range {p0 .. p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 26
    .line 27
    .line 28
    move-result v7

    .line 29
    if-eqz v7, :cond_1

    .line 30
    .line 31
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v7

    .line 35
    check-cast v7, Lcom/p1/mobile/putong/data/Tag;

    .line 36
    .line 37
    if-eqz p3, :cond_0

    .line 38
    .line 39
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 40
    .line 41
    .line 42
    iget-object v8, v7, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 43
    .line 44
    invoke-static {v8}, Lcom/p1/mobile/putong/data/Profile;->categoryToIndex(Ljava/lang/String;)I

    .line 45
    .line 46
    .line 47
    new-instance v9, Ll/df00;

    .line 48
    .line 49
    sget-object v10, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 50
    .line 51
    iget-object v11, v7, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 52
    .line 53
    const/16 v18, 0x1

    .line 54
    .line 55
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 56
    .line 57
    .line 58
    move-result v19

    .line 59
    const/4 v12, -0x1

    .line 60
    const v13, -0x181e3

    .line 61
    .line 62
    .line 63
    const/16 v15, 0x8

    .line 64
    .line 65
    const/high16 v17, 0x41500000    # 13.0f

    .line 66
    .line 67
    move/from16 v14, p2

    .line 68
    .line 69
    move/from16 v16, p4

    .line 70
    .line 71
    invoke-direct/range {v9 .. v19}, Ll/df00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFZI)V

    .line 72
    .line 73
    .line 74
    add-int/lit8 v7, v6, 0x1

    .line 75
    .line 76
    invoke-virtual {v0, v9, v6, v7, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 77
    .line 78
    .line 79
    move v6, v7

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 82
    .line 83
    .line 84
    goto :goto_0

    .line 85
    :cond_1
    invoke-static/range {p1 .. p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 86
    .line 87
    .line 88
    move-result v1

    .line 89
    if-eqz v1, :cond_5

    .line 90
    .line 91
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    if-eqz v7, :cond_5

    .line 100
    .line 101
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v7

    .line 105
    check-cast v7, Lcom/p1/mobile/putong/data/Tag;

    .line 106
    .line 107
    if-eqz p3, :cond_4

    .line 108
    .line 109
    invoke-virtual {v0, v5}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 110
    .line 111
    .line 112
    iget-object v8, v7, Lcom/p1/mobile/putong/data/Tag;->category:Ljava/lang/String;

    .line 113
    .line 114
    invoke-static {v8}, Lcom/p1/mobile/putong/data/Profile;->categoryToIndex(Ljava/lang/String;)I

    .line 115
    .line 116
    .line 117
    new-instance v20, Ll/df00;

    .line 118
    .line 119
    sget-object v21, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 120
    .line 121
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Tag;->value:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz p5, :cond_2

    .line 124
    .line 125
    const v8, -0x666667

    .line 126
    .line 127
    .line 128
    :goto_2
    move/from16 v23, v8

    .line 129
    .line 130
    goto :goto_3

    .line 131
    :cond_2
    const/high16 v8, -0x34000000    # -3.3554432E7f

    .line 132
    .line 133
    goto :goto_2

    .line 134
    :goto_3
    if-eqz p5, :cond_3

    .line 135
    .line 136
    const/4 v8, -0x1

    .line 137
    :goto_4
    move/from16 v24, v8

    .line 138
    .line 139
    goto :goto_5

    .line 140
    :cond_3
    const v8, 0xffffff

    .line 141
    .line 142
    .line 143
    goto :goto_4

    .line 144
    :goto_5
    const/high16 v8, 0x40400000    # 3.0f

    .line 145
    .line 146
    invoke-static {v8}, Ll/qa00;->d(F)I

    .line 147
    .line 148
    .line 149
    move-result v8

    .line 150
    int-to-float v8, v8

    .line 151
    const/16 v31, 0x1

    .line 152
    .line 153
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 154
    .line 155
    .line 156
    move-result v32

    .line 157
    const/16 v26, 0x8

    .line 158
    .line 159
    const/high16 v28, 0x41500000    # 13.0f

    .line 160
    .line 161
    const/high16 v29, 0x7000000

    .line 162
    .line 163
    move/from16 v25, p2

    .line 164
    .line 165
    move/from16 v27, p4

    .line 166
    .line 167
    move-object/from16 v22, v7

    .line 168
    .line 169
    move/from16 v30, v8

    .line 170
    .line 171
    invoke-direct/range {v20 .. v32}, Ll/df00;-><init>(Landroid/content/Context;Ljava/lang/String;IIIIIFIFZI)V

    .line 172
    .line 173
    .line 174
    move-object/from16 v7, v20

    .line 175
    .line 176
    add-int/lit8 v8, v6, 0x1

    .line 177
    .line 178
    invoke-virtual {v0, v7, v6, v8, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 179
    .line 180
    .line 181
    move v6, v8

    .line 182
    goto :goto_1

    .line 183
    :cond_4
    invoke-virtual {v0, v2}, Landroid/text/SpannableStringBuilder;->append(Ljava/lang/CharSequence;)Landroid/text/SpannableStringBuilder;

    .line 184
    .line 185
    .line 186
    goto :goto_1

    .line 187
    :cond_5
    return-object v0
.end method

.method public static O0(Ljava/lang/String;ILandroid/graphics/Typeface;)Landroid/text/SpannableStringBuilder;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, p1, p2, v0}, Ll/e1b;->P0(Ljava/lang/String;ILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    return-object p0
.end method

.method public static P0(Ljava/lang/String;ILandroid/graphics/Typeface;I)Landroid/text/SpannableStringBuilder;
    .locals 6

    .line 1
    const-string v0, "-?[0-9]\\d*"

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
    move-result-object v0

    .line 11
    new-instance v1, Landroid/text/SpannableStringBuilder;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 14
    .line 15
    .line 16
    :goto_0
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/16 v3, 0x21

    .line 21
    .line 22
    const-string v4, "sans-serif"

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    new-instance v2, Lv/text/CustomTypefaceSpan;

    .line 27
    .line 28
    invoke-direct {v2, v4, p2, p1, p3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->start()I

    .line 32
    .line 33
    .line 34
    move-result v4

    .line 35
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->end()I

    .line 36
    .line 37
    .line 38
    move-result v5

    .line 39
    invoke-virtual {v1, v2, v4, v5, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    const-string v0, "+"

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    const/4 v0, -0x1

    .line 50
    if-eq p0, v0, :cond_1

    .line 51
    .line 52
    new-instance v0, Lv/text/CustomTypefaceSpan;

    .line 53
    .line 54
    invoke-direct {v0, v4, p2, p1, p3}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;II)V

    .line 55
    .line 56
    .line 57
    add-int/lit8 p1, p0, 0x1

    .line 58
    .line 59
    invoke-virtual {v1, v0, p0, p1, v3}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 60
    .line 61
    .line 62
    :cond_1
    return-object v1
.end method

.method public static Q0(Landroid/widget/TextView;I)V
    .locals 1

    .line 1
    new-instance v0, Ll/c1b;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/c1b;-><init>(Landroid/widget/TextView;I)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static R0(Lcom/p1/mobile/putong/core/data/Message;)Ljava/lang/String;
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->recalled:Ljava/lang/Boolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 10
    .line 11
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 18
    .line 19
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/MessageExtData;->recallText:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-nez v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Message;->extData:Lcom/p1/mobile/putong/core/data/MessageExtData;

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/MessageExtData;->recallText:Ljava/lang/String;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isMe()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 39
    .line 40
    sget v0, Lcom/p1/mobile/putong/core/R$string;->ej:I

    .line 41
    .line 42
    sget v1, Lcom/p1/mobile/putong/core/R$string;->fj:I

    .line 43
    .line 44
    invoke-virtual {p0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    return-object p0

    .line 57
    :cond_1
    invoke-static {}, Ll/gra;->V1()Z

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-eqz v0, :cond_2

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 70
    .line 71
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->getHostId()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 78
    .line 79
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/core/api/e;->W8(Ljava/lang/String;Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 80
    .line 81
    .line 82
    move-result-object v0

    .line 83
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    if-eqz v1, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupMemberName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    goto :goto_0

    .line 94
    :cond_2
    const-string v0, ""

    .line 95
    .line 96
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 97
    .line 98
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 99
    .line 100
    iget-object v2, p0, Lcom/p1/mobile/putong/core/data/Message;->owner:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v1, v2}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 107
    .line 108
    .line 109
    move-result v2

    .line 110
    if-eqz v2, :cond_3

    .line 111
    .line 112
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v2

    .line 116
    if-eqz v2, :cond_3

    .line 117
    .line 118
    iget-object v0, v1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 119
    .line 120
    :cond_3
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v2

    .line 124
    if-eqz v2, :cond_4

    .line 125
    .line 126
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 129
    .line 130
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 131
    .line 132
    invoke-virtual {v2, v1}, Ll/dkb;->y7(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v1

    .line 136
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    if-nez v2, :cond_4

    .line 141
    .line 142
    move-object v0, v1

    .line 143
    :cond_4
    invoke-static {}, Ll/gra;->V1()Z

    .line 144
    .line 145
    .line 146
    move-result v1

    .line 147
    if-eqz v1, :cond_5

    .line 148
    .line 149
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/Message;->isGroupMessage()Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-eqz p0, :cond_5

    .line 154
    .line 155
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    const/16 v1, 0x8

    .line 160
    .line 161
    if-le p0, v1, :cond_5

    .line 162
    .line 163
    const/4 p0, 0x0

    .line 164
    invoke-virtual {v0, p0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 165
    .line 166
    .line 167
    move-result-object p0

    .line 168
    const-string v0, "\u2026"

    .line 169
    .line 170
    invoke-virtual {p0, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    :cond_5
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 175
    .line 176
    sget v1, Lcom/p1/mobile/putong/core/R$string;->ej:I

    .line 177
    .line 178
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {p0, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p0

    .line 186
    return-object p0
.end method

.method public static S0(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Ljava/lang/CharSequence;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string p1, " "

    .line 10
    .line 11
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    new-instance v0, Landroid/text/SpannableString;

    .line 19
    .line 20
    invoke-direct {v0, p1}, Landroid/text/SpannableString;-><init>(Ljava/lang/CharSequence;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    sget v1, Ll/dbc0;->Tc:I

    .line 28
    .line 29
    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/high16 v1, 0x41000000    # 8.0f

    .line 34
    .line 35
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    add-int/2addr v3, v1

    .line 48
    invoke-virtual {p0}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    const/4 v4, 0x0

    .line 53
    invoke-virtual {p0, v2, v4, v3, v1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/v9l0;

    .line 57
    .line 58
    invoke-direct {v1, p0}, Ll/v9l0;-><init>(Landroid/graphics/drawable/Drawable;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 62
    .line 63
    .line 64
    move-result p0

    .line 65
    add-int/lit8 p0, p0, -0x1

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 68
    .line 69
    .line 70
    move-result p1

    .line 71
    const/16 v2, 0x12

    .line 72
    .line 73
    invoke-virtual {v0, v1, p0, p1, v2}, Landroid/text/SpannableString;->setSpan(Ljava/lang/Object;III)V

    .line 74
    .line 75
    .line 76
    return-object v0
.end method

.method public static T0(Ljava/lang/String;Ljava/lang/String;ILl/qcj;)Landroid/text/SpannableStringBuilder;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "I",
            "Ll/qcj<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Landroid/text/SpannableStringBuilder;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    :catch_0
    :goto_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_0

    .line 19
    .line 20
    :try_start_0
    invoke-virtual {p1}, Ljava/util/regex/Matcher;->group()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    if-eqz p1, :cond_1

    .line 33
    .line 34
    invoke-interface {p3, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Ljava/lang/String;

    .line 39
    .line 40
    :cond_1
    new-instance p1, Landroid/text/SpannableStringBuilder;

    .line 41
    .line 42
    invoke-direct {p1, p0}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 46
    .line 47
    .line 48
    move-result p3

    .line 49
    if-lez p3, :cond_3

    .line 50
    .line 51
    const/4 p3, 0x0

    .line 52
    move v1, p3

    .line 53
    :goto_1
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-ge p3, v2, :cond_3

    .line 58
    .line 59
    invoke-virtual {v0, p3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    check-cast v2, Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {p0, v2, v1}, Ljava/lang/String;->indexOf(Ljava/lang/String;I)I

    .line 66
    .line 67
    .line 68
    move-result v1

    .line 69
    const/4 v3, -0x1

    .line 70
    if-eq v1, v3, :cond_2

    .line 71
    .line 72
    new-instance v3, Lv/text/CustomTypefaceSpan;

    .line 73
    .line 74
    const-string v4, "sans-serif"

    .line 75
    .line 76
    sget-object v5, Landroid/graphics/Typeface;->DEFAULT:Landroid/graphics/Typeface;

    .line 77
    .line 78
    invoke-direct {v3, v4, v5, p2}, Lv/text/CustomTypefaceSpan;-><init>(Ljava/lang/String;Landroid/graphics/Typeface;I)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 82
    .line 83
    .line 84
    move-result v4

    .line 85
    add-int/2addr v4, v1

    .line 86
    const/16 v5, 0x21

    .line 87
    .line 88
    invoke-virtual {p1, v3, v1, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 89
    .line 90
    .line 91
    new-instance v3, Landroid/text/style/StyleSpan;

    .line 92
    .line 93
    const/4 v4, 0x3

    .line 94
    invoke-direct {v3, v4}, Landroid/text/style/StyleSpan;-><init>(I)V

    .line 95
    .line 96
    .line 97
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    add-int/2addr v4, v1

    .line 102
    invoke-virtual {p1, v3, v1, v4, v5}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 106
    .line 107
    .line 108
    move-result v2

    .line 109
    add-int/2addr v1, v2

    .line 110
    :cond_2
    add-int/lit8 p3, p3, 0x1

    .line 111
    .line 112
    goto :goto_1

    .line 113
    :cond_3
    return-object p1
.end method

.method public static U0(Landroid/text/Spanned;)Ljava/lang/String;
    .locals 3

    .line 1
    invoke-interface {p0}, Ljava/lang/CharSequence;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-class v1, Ll/s2i0;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    invoke-interface {p0, v2, v0, v1}, Landroid/text/Spanned;->getSpans(IILjava/lang/Class;)[Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, [Ll/s2i0;

    .line 13
    .line 14
    const-string v0, ", "

    .line 15
    .line 16
    invoke-static {p0, v0}, Ll/jyb;->V([Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public static synthetic w0(Lcom/p1/mobile/putong/core/data/FigureMessageArg;)Ljava/lang/Boolean;
    .locals 1

    .line 1
    const-string v0, "highlight"

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/FigureMessageArg;->displayType:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic x0(Landroid/widget/TextView;I)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Landroid/widget/TextView;->getLineCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x4

    .line 6
    if-ge v0, v1, :cond_0

    .line 7
    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {p0}, Landroid/widget/TextView;->getLayout()Landroid/text/Layout;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x2

    .line 14
    invoke-virtual {v0, v1}, Landroid/text/Layout;->getLineEnd(I)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v2, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const-string v2, "%s"

    .line 27
    .line 28
    invoke-virtual {p1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-nez v3, :cond_1

    .line 33
    .line 34
    :goto_0
    return-void

    .line 35
    :cond_1
    invoke-virtual {p1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    add-int/2addr v2, v1

    .line 40
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    invoke-virtual {p1, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    add-int/lit8 v1, v0, -0x3

    .line 49
    .line 50
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    sub-int/2addr v1, v2

    .line 55
    const-string v2, "..."

    .line 56
    .line 57
    const/4 v3, 0x0

    .line 58
    if-gez v1, :cond_2

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 66
    .line 67
    .line 68
    move-result-object v4

    .line 69
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    add-int/lit8 v0, v0, -0x1

    .line 74
    .line 75
    invoke-virtual {v4, v3, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    goto :goto_1

    .line 93
    :cond_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 96
    .line 97
    .line 98
    invoke-virtual {p0}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    .line 99
    .line 100
    .line 101
    move-result-object v4

    .line 102
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v4

    .line 106
    invoke-virtual {v4, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    :goto_1
    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 124
    .line 125
    .line 126
    return-void
.end method

.method public static varargs y0(Lcom/p1/mobile/android/app/Act;Landroid/text/SpannableStringBuilder;IZZI[Ljava/lang/String;)Landroid/text/SpannableStringBuilder;
    .locals 6
    .param p2    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .param p5    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 1
    if-eqz p3, :cond_1

    .line 2
    .line 3
    if-eqz p4, :cond_0

    .line 4
    .line 5
    sget p3, Lcom/p1/mobile/putong/core/R$string;->Ji:I

    .line 6
    .line 7
    sget p4, Lcom/p1/mobile/putong/core/R$string;->j8:I

    .line 8
    .line 9
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p4

    .line 17
    invoke-virtual {p0, p3, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p3

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    sget p3, Lcom/p1/mobile/putong/core/R$string;->i8:I

    .line 23
    .line 24
    sget p4, Lcom/p1/mobile/putong/core/R$string;->j8:I

    .line 25
    .line 26
    invoke-virtual {p0, p4}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p4

    .line 30
    filled-new-array {p4}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p4

    .line 34
    invoke-virtual {p0, p3, p4}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p3

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    new-instance p3, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string p4, "\n \n"

    .line 42
    .line 43
    invoke-direct {p3, p4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    sget p4, Lcom/p1/mobile/putong/core/R$string;->i8:I

    .line 47
    .line 48
    sget v0, Lcom/p1/mobile/putong/core/R$string;->j8:I

    .line 49
    .line 50
    invoke-virtual {p0, v0}, Lcom/p1/mobile/android/app/Act;->string(I)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-virtual {p0, p4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p4

    .line 62
    invoke-virtual {p3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p3

    .line 69
    :goto_0
    new-instance p4, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {p4}, Ljava/lang/StringBuilder;-><init>()V

    .line 72
    .line 73
    .line 74
    invoke-virtual {p4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p4, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    new-instance p4, Landroid/text/SpannableStringBuilder;

    .line 85
    .line 86
    invoke-direct {p4, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    .line 87
    .line 88
    .line 89
    new-instance v0, Landroid/text/style/ForegroundColorSpan;

    .line 90
    .line 91
    invoke-direct {v0, p2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    .line 92
    .line 93
    .line 94
    invoke-virtual {p1, p3}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result p2

    .line 98
    invoke-virtual {p3}, Ljava/lang/String;->length()I

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    add-int/2addr p3, p2

    .line 103
    new-instance v1, Landroid/text/style/AbsoluteSizeSpan;

    .line 104
    .line 105
    const/16 v2, 0xe

    .line 106
    .line 107
    const/4 v3, 0x1

    .line 108
    invoke-direct {v1, v2, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 109
    .line 110
    .line 111
    const/4 v2, 0x0

    .line 112
    const/16 v4, 0x22

    .line 113
    .line 114
    invoke-virtual {p4, v1, v2, p2, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 115
    .line 116
    .line 117
    const/16 v1, 0x21

    .line 118
    .line 119
    invoke-virtual {p4, v0, p2, p3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 120
    .line 121
    .line 122
    new-instance v0, Landroid/text/style/AbsoluteSizeSpan;

    .line 123
    .line 124
    const/16 v5, 0xa

    .line 125
    .line 126
    invoke-direct {v0, v5, v3}, Landroid/text/style/AbsoluteSizeSpan;-><init>(IZ)V

    .line 127
    .line 128
    .line 129
    invoke-virtual {p4, v0, p2, p3, v4}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 130
    .line 131
    .line 132
    :goto_1
    array-length p2, p6

    .line 133
    if-ge v2, p2, :cond_2

    .line 134
    .line 135
    aget-object p2, p6, v2

    .line 136
    .line 137
    add-int/lit8 p3, v2, 0x1

    .line 138
    .line 139
    aget-object p3, p6, p3

    .line 140
    .line 141
    new-instance v0, Ll/e1b$a;

    .line 142
    .line 143
    invoke-direct {v0, p0, p2, p3, p5}, Ll/e1b$a;-><init>(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;I)V

    .line 144
    .line 145
    .line 146
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result p3

    .line 150
    invoke-virtual {p1, p2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    invoke-virtual {p2}, Ljava/lang/String;->length()I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    add-int/2addr v3, p2

    .line 159
    invoke-virtual {p4, v0, p3, v3, v1}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    .line 160
    .line 161
    .line 162
    add-int/lit8 v2, v2, 0x2

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_2
    return-object p4
.end method

.method public static z0(Lcom/p1/mobile/putong/data/DoublePair;)I
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->E:Lcom/p1/mobile/putong/location/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/a;->q()Lcom/p1/mobile/putong/location/Location;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    new-instance v1, Lcom/p1/mobile/putong/location/Location;

    .line 13
    .line 14
    const-string v2, "me"

    .line 15
    .line 16
    invoke-direct {v1, v2}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 27
    .line 28
    .line 29
    move-result-wide v2

    .line 30
    invoke-virtual {v1, v2, v3}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 31
    .line 32
    .line 33
    new-instance v0, Lcom/p1/mobile/putong/location/Location;

    .line 34
    .line 35
    const-string v2, "other"

    .line 36
    .line 37
    invoke-direct {v0, v2}, Lcom/p1/mobile/putong/location/Location;-><init>(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/DoublePair;->first:D

    .line 41
    .line 42
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/location/Location;->K(D)V

    .line 43
    .line 44
    .line 45
    iget-wide v2, p0, Lcom/p1/mobile/putong/data/DoublePair;->second:D

    .line 46
    .line 47
    invoke-virtual {v0, v2, v3}, Lcom/p1/mobile/putong/location/Location;->M(D)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/location/Location;->r(Lcom/p1/mobile/putong/location/Location;)F

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    float-to-int p0, p0

    .line 55
    return p0

    .line 56
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 57
    return p0
.end method
