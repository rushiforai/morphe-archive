.class public final Ll/cc5;
.super Ll/tp50;
.source "SourceFile"


# static fields
.field public static final a:[C

.field public static final b:[C

.field public static final c:[C

.field public static final d:C


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    const/4 v0, 0x4

    .line 2
    new-array v1, v0, [C

    .line 3
    .line 4
    fill-array-data v1, :array_0

    .line 5
    .line 6
    .line 7
    sput-object v1, Ll/cc5;->a:[C

    .line 8
    .line 9
    new-array v2, v0, [C

    .line 10
    .line 11
    fill-array-data v2, :array_1

    .line 12
    .line 13
    .line 14
    sput-object v2, Ll/cc5;->b:[C

    .line 15
    .line 16
    new-array v0, v0, [C

    .line 17
    .line 18
    fill-array-data v0, :array_2

    .line 19
    .line 20
    .line 21
    sput-object v0, Ll/cc5;->c:[C

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    aget-char v0, v1, v0

    .line 25
    .line 26
    sput-char v0, Ll/cc5;->d:C

    .line 27
    .line 28
    return-void

    .line 29
    :array_0
    .array-data 2
        0x41s
        0x42s
        0x43s
        0x44s
    .end array-data

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    :array_1
    .array-data 2
        0x54s
        0x4es
        0x2as
        0x45s
    .end array-data

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    :array_2
    .array-data 2
        0x2fs
        0x3as
        0x2bs
        0x2es
    .end array-data
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/tp50;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c(Ljava/lang/String;)[Z
    .locals 9

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x2

    .line 6
    const/4 v1, 0x0

    .line 7
    const/4 v2, 0x1

    .line 8
    if-ge p0, v0, :cond_0

    .line 9
    .line 10
    new-instance p0, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 13
    .line 14
    .line 15
    sget-char v0, Ll/cc5;->d:C

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p1, v1}, Ljava/lang/String;->charAt(I)C

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    invoke-static {p0}, Ljava/lang/Character;->toUpperCase(C)C

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sub-int/2addr v0, v2

    .line 44
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    invoke-static {v0}, Ljava/lang/Character;->toUpperCase(C)C

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    sget-object v3, Ll/cc5;->a:[C

    .line 53
    .line 54
    invoke-static {v3, p0}, Ll/bc5;->g([CC)Z

    .line 55
    .line 56
    .line 57
    move-result v4

    .line 58
    invoke-static {v3, v0}, Ll/bc5;->g([CC)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    sget-object v5, Ll/cc5;->b:[C

    .line 63
    .line 64
    invoke-static {v5, p0}, Ll/bc5;->g([CC)Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    invoke-static {v5, v0}, Ll/bc5;->g([CC)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    const/4 v5, 0x0

    .line 73
    const-string v6, "Invalid start/end guards: "

    .line 74
    .line 75
    if-eqz v4, :cond_2

    .line 76
    .line 77
    if-eqz v3, :cond_1

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :cond_1
    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-object v5

    .line 88
    :cond_2
    if-eqz p0, :cond_4

    .line 89
    .line 90
    if-eqz v0, :cond_3

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :cond_3
    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-object v5

    .line 101
    :cond_4
    if-nez v3, :cond_16

    .line 102
    .line 103
    if-nez v0, :cond_16

    .line 104
    .line 105
    new-instance p0, Ljava/lang/StringBuilder;

    .line 106
    .line 107
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 108
    .line 109
    .line 110
    sget-char v0, Ll/cc5;->d:C

    .line 111
    .line 112
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 116
    .line 117
    .line 118
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    :goto_0
    const/16 p0, 0x14

    .line 126
    .line 127
    move v0, v2

    .line 128
    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    sub-int/2addr v3, v2

    .line 133
    if-ge v0, v3, :cond_8

    .line 134
    .line 135
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 136
    .line 137
    .line 138
    move-result v3

    .line 139
    invoke-static {v3}, Ljava/lang/Character;->isDigit(C)Z

    .line 140
    .line 141
    .line 142
    move-result v3

    .line 143
    if-nez v3, :cond_7

    .line 144
    .line 145
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 146
    .line 147
    .line 148
    move-result v3

    .line 149
    const/16 v4, 0x2d

    .line 150
    .line 151
    if-eq v3, v4, :cond_7

    .line 152
    .line 153
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 154
    .line 155
    .line 156
    move-result v3

    .line 157
    const/16 v4, 0x24

    .line 158
    .line 159
    if-ne v3, v4, :cond_5

    .line 160
    .line 161
    goto :goto_2

    .line 162
    :cond_5
    sget-object v3, Ll/cc5;->c:[C

    .line 163
    .line 164
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 165
    .line 166
    .line 167
    move-result v4

    .line 168
    invoke-static {v3, v4}, Ll/bc5;->g([CC)Z

    .line 169
    .line 170
    .line 171
    move-result v3

    .line 172
    if-eqz v3, :cond_6

    .line 173
    .line 174
    add-int/lit8 p0, p0, 0xa

    .line 175
    .line 176
    goto :goto_3

    .line 177
    :cond_6
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 178
    .line 179
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 180
    .line 181
    .line 182
    move-result p1

    .line 183
    new-instance v0, Ljava/lang/StringBuilder;

    .line 184
    .line 185
    const-string v1, "Cannot encode : \'"

    .line 186
    .line 187
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 191
    .line 192
    .line 193
    const/16 p1, 0x27

    .line 194
    .line 195
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 196
    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    throw p0

    .line 206
    :cond_7
    :goto_2
    add-int/lit8 p0, p0, 0x9

    .line 207
    .line 208
    :goto_3
    add-int/lit8 v0, v0, 0x1

    .line 209
    .line 210
    goto :goto_1

    .line 211
    :cond_8
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    sub-int/2addr v0, v2

    .line 216
    add-int/2addr p0, v0

    .line 217
    new-array p0, p0, [Z

    .line 218
    .line 219
    move v0, v1

    .line 220
    move v3, v0

    .line 221
    :goto_4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 222
    .line 223
    .line 224
    move-result v4

    .line 225
    if-ge v0, v4, :cond_15

    .line 226
    .line 227
    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    invoke-static {v4}, Ljava/lang/Character;->toUpperCase(C)C

    .line 232
    .line 233
    .line 234
    move-result v4

    .line 235
    if-eqz v0, :cond_9

    .line 236
    .line 237
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    sub-int/2addr v5, v2

    .line 242
    if-ne v0, v5, :cond_e

    .line 243
    .line 244
    :cond_9
    const/16 v5, 0x2a

    .line 245
    .line 246
    if-eq v4, v5, :cond_d

    .line 247
    .line 248
    const/16 v5, 0x45

    .line 249
    .line 250
    if-eq v4, v5, :cond_c

    .line 251
    .line 252
    const/16 v5, 0x4e

    .line 253
    .line 254
    if-eq v4, v5, :cond_b

    .line 255
    .line 256
    const/16 v5, 0x54

    .line 257
    .line 258
    if-eq v4, v5, :cond_a

    .line 259
    .line 260
    goto :goto_5

    .line 261
    :cond_a
    const/16 v4, 0x41

    .line 262
    .line 263
    goto :goto_5

    .line 264
    :cond_b
    const/16 v4, 0x42

    .line 265
    .line 266
    goto :goto_5

    .line 267
    :cond_c
    const/16 v4, 0x44

    .line 268
    .line 269
    goto :goto_5

    .line 270
    :cond_d
    const/16 v4, 0x43

    .line 271
    .line 272
    :cond_e
    :goto_5
    move v5, v1

    .line 273
    :goto_6
    sget-object v6, Ll/bc5;->d:[C

    .line 274
    .line 275
    array-length v7, v6

    .line 276
    if-ge v5, v7, :cond_10

    .line 277
    .line 278
    aget-char v6, v6, v5

    .line 279
    .line 280
    if-ne v4, v6, :cond_f

    .line 281
    .line 282
    sget-object v4, Ll/bc5;->e:[I

    .line 283
    .line 284
    aget v4, v4, v5

    .line 285
    .line 286
    goto :goto_7

    .line 287
    :cond_f
    add-int/lit8 v5, v5, 0x1

    .line 288
    .line 289
    goto :goto_6

    .line 290
    :cond_10
    move v4, v1

    .line 291
    :goto_7
    move v5, v1

    .line 292
    move v7, v5

    .line 293
    move v6, v2

    .line 294
    :goto_8
    const/4 v8, 0x7

    .line 295
    if-ge v5, v8, :cond_13

    .line 296
    .line 297
    aput-boolean v6, p0, v3

    .line 298
    .line 299
    add-int/lit8 v3, v3, 0x1

    .line 300
    .line 301
    rsub-int/lit8 v8, v5, 0x6

    .line 302
    .line 303
    shr-int v8, v4, v8

    .line 304
    .line 305
    and-int/2addr v8, v2

    .line 306
    if-eqz v8, :cond_12

    .line 307
    .line 308
    if-ne v7, v2, :cond_11

    .line 309
    .line 310
    goto :goto_9

    .line 311
    :cond_11
    add-int/lit8 v7, v7, 0x1

    .line 312
    .line 313
    goto :goto_8

    .line 314
    :cond_12
    :goto_9
    xor-int/lit8 v6, v6, 0x1

    .line 315
    .line 316
    add-int/lit8 v5, v5, 0x1

    .line 317
    .line 318
    move v7, v1

    .line 319
    goto :goto_8

    .line 320
    :cond_13
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 321
    .line 322
    .line 323
    move-result v4

    .line 324
    sub-int/2addr v4, v2

    .line 325
    if-ge v0, v4, :cond_14

    .line 326
    .line 327
    aput-boolean v1, p0, v3

    .line 328
    .line 329
    add-int/lit8 v3, v3, 0x1

    .line 330
    .line 331
    :cond_14
    add-int/lit8 v0, v0, 0x1

    .line 332
    .line 333
    goto :goto_4

    .line 334
    :cond_15
    return-object p0

    .line 335
    :cond_16
    invoke-virtual {v6, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 340
    .line 341
    .line 342
    return-object v5
.end method
