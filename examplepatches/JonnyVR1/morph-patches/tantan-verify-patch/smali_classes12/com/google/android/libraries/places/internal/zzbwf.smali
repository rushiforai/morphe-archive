.class public Lcom/google/android/libraries/places/internal/zzbwf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final zza:Lcom/google/android/libraries/places/internal/zzbwe;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public static final zzb:Lcom/google/android/libraries/places/internal/zzbwf;
    .annotation build Lkotlin/jvm/JvmField;
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private final zzc:[B
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private transient zzd:I

.field private transient zze:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwe;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbwe;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zza:Lcom/google/android/libraries/places/internal/zzbwe;

    .line 8
    .line 9
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    new-array v1, v1, [B

    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 15
    .line 16
    .line 17
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zzb:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>([B)V
    .locals 0
    .param p1    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    return-void
.end method


# virtual methods
.method public final bridge synthetic compareTo(Ljava/lang/Object;)I
    .locals 8

    .line 1
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    const/4 v3, 0x0

    .line 19
    move v4, v3

    .line 20
    :goto_0
    const/4 v5, 0x1

    .line 21
    if-ge v4, v2, :cond_1

    .line 22
    .line 23
    invoke-virtual {p0, v4}, Lcom/google/android/libraries/places/internal/zzbwf;->zza(I)B

    .line 24
    .line 25
    .line 26
    move-result v6

    .line 27
    and-int/lit16 v6, v6, 0xff

    .line 28
    .line 29
    invoke-virtual {p1, v4}, Lcom/google/android/libraries/places/internal/zzbwf;->zza(I)B

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    and-int/lit16 v7, v7, 0xff

    .line 34
    .line 35
    if-ne v6, v7, :cond_0

    .line 36
    .line 37
    add-int/lit8 v4, v4, 0x1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    if-lt v6, v7, :cond_3

    .line 41
    .line 42
    return v5

    .line 43
    :cond_1
    if-ne v0, v1, :cond_2

    .line 44
    .line 45
    return v3

    .line 46
    :cond_2
    if-lt v0, v1, :cond_3

    .line 47
    .line 48
    return v5

    .line 49
    :cond_3
    const/4 p0, -0x1

    .line 50
    return p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4
    .param p1    # Ljava/lang/Object;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p1, p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    instance-of v1, p1, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    check-cast p1, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 17
    .line 18
    array-length v3, p0

    .line 19
    if-ne v1, v3, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1, v2, p0, v2, v3}, Lcom/google/android/libraries/places/internal/zzbwf;->zzl(I[BII)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    return v2

    .line 28
    :cond_1
    return v0

    .line 29
    :cond_2
    return v2
.end method

.method public hashCode()I
    .locals 1

    .line 1
    iget v0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzd:I

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return v0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 7
    .line 8
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzd:I

    .line 13
    .line 14
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 19
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 4
    .line 5
    array-length v2, v1

    .line 6
    if-nez v2, :cond_0

    .line 7
    .line 8
    const-string v0, "[size=0]"

    .line 9
    .line 10
    return-object v0

    .line 11
    :cond_0
    sget v3, Lcom/google/android/libraries/places/internal/zzbwy;->zza:I

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v6, 0x0

    .line 16
    :goto_0
    const/16 v8, 0x40

    .line 17
    .line 18
    if-ge v4, v2, :cond_1f

    .line 19
    .line 20
    aget-byte v9, v1, v4

    .line 21
    .line 22
    if-ltz v9, :cond_7

    .line 23
    .line 24
    add-int/lit8 v10, v5, 0x1

    .line 25
    .line 26
    if-ne v5, v8, :cond_1

    .line 27
    .line 28
    goto/16 :goto_6

    .line 29
    .line 30
    :cond_1
    const/16 v5, 0x7f

    .line 31
    .line 32
    const/16 v11, 0x20

    .line 33
    .line 34
    const/16 v12, 0xd

    .line 35
    .line 36
    const/16 v13, 0xa

    .line 37
    .line 38
    if-eq v9, v13, :cond_3

    .line 39
    .line 40
    if-eq v9, v12, :cond_3

    .line 41
    .line 42
    if-ge v9, v11, :cond_2

    .line 43
    .line 44
    :goto_1
    const/4 v6, -0x1

    .line 45
    goto/16 :goto_6

    .line 46
    .line 47
    :cond_2
    if-lt v9, v5, :cond_3

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_3
    add-int/lit8 v6, v6, 0x1

    .line 51
    .line 52
    add-int/lit8 v4, v4, 0x1

    .line 53
    .line 54
    :goto_2
    if-ge v4, v2, :cond_6

    .line 55
    .line 56
    aget-byte v9, v1, v4

    .line 57
    .line 58
    if-ltz v9, :cond_6

    .line 59
    .line 60
    add-int/lit8 v4, v4, 0x1

    .line 61
    .line 62
    add-int/lit8 v14, v10, 0x1

    .line 63
    .line 64
    if-eq v10, v8, :cond_1f

    .line 65
    .line 66
    if-eq v9, v13, :cond_5

    .line 67
    .line 68
    if-eq v9, v12, :cond_5

    .line 69
    .line 70
    if-ge v9, v11, :cond_4

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_4
    if-lt v9, v5, :cond_5

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 77
    .line 78
    move v10, v14

    .line 79
    goto :goto_2

    .line 80
    :cond_6
    :goto_3
    move v5, v10

    .line 81
    goto :goto_0

    .line 82
    :cond_7
    shr-int/lit8 v10, v9, 0x5

    .line 83
    .line 84
    const v11, 0xfffd

    .line 85
    .line 86
    .line 87
    const/high16 v12, 0x10000

    .line 88
    .line 89
    const/4 v13, -0x2

    .line 90
    const/16 v15, 0x80

    .line 91
    .line 92
    const/16 v16, 0x1

    .line 93
    .line 94
    if-ne v10, v13, :cond_e

    .line 95
    .line 96
    add-int/lit8 v10, v4, 0x1

    .line 97
    .line 98
    if-gt v2, v10, :cond_8

    .line 99
    .line 100
    if-eq v5, v8, :cond_1f

    .line 101
    .line 102
    goto :goto_1

    .line 103
    :cond_8
    aget-byte v10, v1, v10

    .line 104
    .line 105
    and-int/lit16 v13, v10, 0xc0

    .line 106
    .line 107
    if-ne v13, v15, :cond_d

    .line 108
    .line 109
    xor-int/lit16 v10, v10, 0xf80

    .line 110
    .line 111
    shl-int/lit8 v9, v9, 0x6

    .line 112
    .line 113
    xor-int/2addr v9, v10

    .line 114
    if-ge v9, v15, :cond_9

    .line 115
    .line 116
    if-eq v5, v8, :cond_1f

    .line 117
    .line 118
    goto :goto_1

    .line 119
    :cond_9
    add-int/lit8 v10, v5, 0x1

    .line 120
    .line 121
    if-eq v5, v8, :cond_1f

    .line 122
    .line 123
    const/16 v5, 0xa0

    .line 124
    .line 125
    if-ge v9, v5, :cond_a

    .line 126
    .line 127
    goto :goto_1

    .line 128
    :cond_a
    if-ne v9, v11, :cond_b

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_b
    add-int/lit8 v4, v4, 0x2

    .line 132
    .line 133
    if-ge v9, v12, :cond_c

    .line 134
    .line 135
    move/from16 v14, v16

    .line 136
    .line 137
    goto :goto_4

    .line 138
    :cond_c
    const/4 v14, 0x2

    .line 139
    :goto_4
    add-int/2addr v6, v14

    .line 140
    sget-object v5, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 141
    .line 142
    goto :goto_3

    .line 143
    :cond_d
    if-eq v5, v8, :cond_1f

    .line 144
    .line 145
    goto :goto_1

    .line 146
    :cond_e
    shr-int/lit8 v10, v9, 0x4

    .line 147
    .line 148
    const v14, 0xe000

    .line 149
    .line 150
    .line 151
    const v3, 0xd800

    .line 152
    .line 153
    .line 154
    if-ne v10, v13, :cond_16

    .line 155
    .line 156
    add-int/lit8 v10, v4, 0x2

    .line 157
    .line 158
    if-gt v2, v10, :cond_f

    .line 159
    .line 160
    if-eq v5, v8, :cond_1f

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_f
    add-int/lit8 v13, v4, 0x1

    .line 164
    .line 165
    aget-byte v13, v1, v13

    .line 166
    .line 167
    and-int/lit16 v7, v13, 0xc0

    .line 168
    .line 169
    if-ne v7, v15, :cond_15

    .line 170
    .line 171
    aget-byte v7, v1, v10

    .line 172
    .line 173
    and-int/lit16 v10, v7, 0xc0

    .line 174
    .line 175
    if-ne v10, v15, :cond_14

    .line 176
    .line 177
    const v10, -0x1e080

    .line 178
    .line 179
    .line 180
    xor-int/2addr v7, v10

    .line 181
    shl-int/lit8 v10, v13, 0x6

    .line 182
    .line 183
    shl-int/lit8 v9, v9, 0xc

    .line 184
    .line 185
    xor-int/2addr v7, v10

    .line 186
    xor-int/2addr v7, v9

    .line 187
    const/16 v9, 0x800

    .line 188
    .line 189
    if-ge v7, v9, :cond_10

    .line 190
    .line 191
    if-eq v5, v8, :cond_1f

    .line 192
    .line 193
    goto/16 :goto_1

    .line 194
    .line 195
    :cond_10
    if-lt v7, v3, :cond_11

    .line 196
    .line 197
    if-ge v7, v14, :cond_11

    .line 198
    .line 199
    if-eq v5, v8, :cond_1f

    .line 200
    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_11
    add-int/lit8 v3, v5, 0x1

    .line 204
    .line 205
    move v10, v3

    .line 206
    if-eq v5, v8, :cond_1f

    .line 207
    .line 208
    if-ne v7, v11, :cond_12

    .line 209
    .line 210
    goto/16 :goto_1

    .line 211
    .line 212
    :cond_12
    add-int/lit8 v4, v4, 0x3

    .line 213
    .line 214
    if-ge v7, v12, :cond_13

    .line 215
    .line 216
    move/from16 v14, v16

    .line 217
    .line 218
    goto :goto_5

    .line 219
    :cond_13
    const/4 v14, 0x2

    .line 220
    :goto_5
    add-int/2addr v6, v14

    .line 221
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 222
    .line 223
    goto/16 :goto_3

    .line 224
    .line 225
    :cond_14
    if-eq v5, v8, :cond_1f

    .line 226
    .line 227
    goto/16 :goto_1

    .line 228
    .line 229
    :cond_15
    if-eq v5, v8, :cond_1f

    .line 230
    .line 231
    goto/16 :goto_1

    .line 232
    .line 233
    :cond_16
    shr-int/lit8 v7, v9, 0x3

    .line 234
    .line 235
    if-ne v7, v13, :cond_1e

    .line 236
    .line 237
    add-int/lit8 v7, v4, 0x3

    .line 238
    .line 239
    if-gt v2, v7, :cond_17

    .line 240
    .line 241
    if-eq v5, v8, :cond_1f

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :cond_17
    add-int/lit8 v10, v4, 0x1

    .line 246
    .line 247
    aget-byte v10, v1, v10

    .line 248
    .line 249
    and-int/lit16 v11, v10, 0xc0

    .line 250
    .line 251
    if-ne v11, v15, :cond_1d

    .line 252
    .line 253
    add-int/lit8 v11, v4, 0x2

    .line 254
    .line 255
    aget-byte v11, v1, v11

    .line 256
    .line 257
    and-int/lit16 v13, v11, 0xc0

    .line 258
    .line 259
    if-ne v13, v15, :cond_1c

    .line 260
    .line 261
    aget-byte v7, v1, v7

    .line 262
    .line 263
    and-int/lit16 v13, v7, 0xc0

    .line 264
    .line 265
    if-ne v13, v15, :cond_1b

    .line 266
    .line 267
    const v13, 0x381f80

    .line 268
    .line 269
    .line 270
    xor-int/2addr v7, v13

    .line 271
    shl-int/lit8 v11, v11, 0x6

    .line 272
    .line 273
    shl-int/lit8 v10, v10, 0xc

    .line 274
    .line 275
    shl-int/lit8 v9, v9, 0x12

    .line 276
    .line 277
    xor-int/2addr v7, v11

    .line 278
    xor-int/2addr v7, v10

    .line 279
    xor-int/2addr v7, v9

    .line 280
    const v9, 0x10ffff

    .line 281
    .line 282
    .line 283
    if-le v7, v9, :cond_18

    .line 284
    .line 285
    if-eq v5, v8, :cond_1f

    .line 286
    .line 287
    goto/16 :goto_1

    .line 288
    .line 289
    :cond_18
    if-lt v7, v3, :cond_19

    .line 290
    .line 291
    if-ge v7, v14, :cond_19

    .line 292
    .line 293
    if-eq v5, v8, :cond_1f

    .line 294
    .line 295
    goto/16 :goto_1

    .line 296
    .line 297
    :cond_19
    if-ge v7, v12, :cond_1a

    .line 298
    .line 299
    if-eq v5, v8, :cond_1f

    .line 300
    .line 301
    goto/16 :goto_1

    .line 302
    .line 303
    :cond_1a
    add-int/lit8 v10, v5, 0x1

    .line 304
    .line 305
    if-eq v5, v8, :cond_1f

    .line 306
    .line 307
    add-int/lit8 v6, v6, 0x2

    .line 308
    .line 309
    sget-object v3, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    .line 310
    .line 311
    add-int/lit8 v4, v4, 0x4

    .line 312
    .line 313
    goto/16 :goto_3

    .line 314
    .line 315
    :cond_1b
    if-eq v5, v8, :cond_1f

    .line 316
    .line 317
    goto/16 :goto_1

    .line 318
    .line 319
    :cond_1c
    if-eq v5, v8, :cond_1f

    .line 320
    .line 321
    goto/16 :goto_1

    .line 322
    .line 323
    :cond_1d
    if-eq v5, v8, :cond_1f

    .line 324
    .line 325
    goto/16 :goto_1

    .line 326
    .line 327
    :cond_1e
    if-eq v5, v8, :cond_1f

    .line 328
    .line 329
    goto/16 :goto_1

    .line 330
    .line 331
    :cond_1f
    :goto_6
    const-string v1, "\u2026]"

    .line 332
    .line 333
    const-string v2, "[size="

    .line 334
    .line 335
    const-string v3, "]"

    .line 336
    .line 337
    const/4 v4, -0x1

    .line 338
    if-ne v6, v4, :cond_23

    .line 339
    .line 340
    iget-object v4, v0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 341
    .line 342
    array-length v5, v4

    .line 343
    if-gt v5, v8, :cond_20

    .line 344
    .line 345
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zze()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object v0

    .line 349
    new-instance v1, Ljava/lang/StringBuilder;

    .line 350
    .line 351
    const-string v2, "[hex="

    .line 352
    .line 353
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 354
    .line 355
    .line 356
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    return-object v0

    .line 367
    :cond_20
    array-length v3, v4

    .line 368
    if-lt v3, v8, :cond_22

    .line 369
    .line 370
    if-eq v3, v8, :cond_21

    .line 371
    .line 372
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 373
    .line 374
    const/4 v3, 0x0

    .line 375
    invoke-static {v4, v3, v8}, Lkotlin/collections/ArraysKt;->copyOfRange([BII)[B

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    invoke-direct {v0, v3}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 380
    .line 381
    .line 382
    :cond_21
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zze()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    new-instance v3, Ljava/lang/StringBuilder;

    .line 387
    .line 388
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 389
    .line 390
    .line 391
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 392
    .line 393
    .line 394
    const-string v2, " hex="

    .line 395
    .line 396
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 397
    .line 398
    .line 399
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 403
    .line 404
    .line 405
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 406
    .line 407
    .line 408
    move-result-object v0

    .line 409
    return-object v0

    .line 410
    :cond_22
    const-string v0, "endIndex > length("

    .line 411
    .line 412
    const-string v1, ")"

    .line 413
    .line 414
    invoke-static {v0, v3, v1}, Ll/vic0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 415
    .line 416
    .line 417
    const/4 v0, 0x0

    .line 418
    return-object v0

    .line 419
    :cond_23
    invoke-virtual {v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzf()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object v4

    .line 423
    const/4 v5, 0x0

    .line 424
    invoke-virtual {v4, v5, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v7

    .line 428
    const/4 v11, 0x4

    .line 429
    const/4 v12, 0x0

    .line 430
    const-string v8, "\\"

    .line 431
    .line 432
    const-string v9, "\\\\"

    .line 433
    .line 434
    const/4 v10, 0x0

    .line 435
    invoke-static/range {v7 .. v12}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 436
    .line 437
    .line 438
    move-result-object v13

    .line 439
    const/16 v17, 0x4

    .line 440
    .line 441
    const/16 v18, 0x0

    .line 442
    .line 443
    const-string v14, "\n"

    .line 444
    .line 445
    const-string v15, "\\n"

    .line 446
    .line 447
    const/16 v16, 0x0

    .line 448
    .line 449
    invoke-static/range {v13 .. v18}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 450
    .line 451
    .line 452
    move-result-object v7

    .line 453
    const-string v8, "\r"

    .line 454
    .line 455
    const-string v9, "\\r"

    .line 456
    .line 457
    invoke-static/range {v7 .. v12}, Lkotlin/text/d;->F(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    .line 458
    .line 459
    .line 460
    move-result-object v5

    .line 461
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 462
    .line 463
    .line 464
    move-result v4

    .line 465
    if-ge v6, v4, :cond_24

    .line 466
    .line 467
    iget-object v0, v0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 468
    .line 469
    array-length v0, v0

    .line 470
    new-instance v3, Ljava/lang/StringBuilder;

    .line 471
    .line 472
    invoke-direct {v3, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 473
    .line 474
    .line 475
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 476
    .line 477
    .line 478
    const-string v0, " text="

    .line 479
    .line 480
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 481
    .line 482
    .line 483
    invoke-virtual {v3, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 484
    .line 485
    .line 486
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 487
    .line 488
    .line 489
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object v0

    .line 493
    return-object v0

    .line 494
    :cond_24
    new-instance v0, Ljava/lang/StringBuilder;

    .line 495
    .line 496
    const-string v1, "[text="

    .line 497
    .line 498
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 502
    .line 503
    .line 504
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 505
    .line 506
    .line 507
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object v0

    .line 511
    return-object v0
.end method

.method public zza(I)B
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 2
    .line 3
    aget-byte p0, p0, p1

    .line 4
    .line 5
    return p0
.end method

.method public final zzb()I
    .locals 0

    iget p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzd:I

    return p0
.end method

.method public zzc()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 2
    .line 3
    array-length p0, p0

    .line 4
    return p0
.end method

.method public final zzd()Ljava/lang/String;
    .locals 2
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    const/4 v1, 0x1

    .line 5
    invoke-static {p0, v0, v1, v0}, Lcom/google/android/libraries/places/internal/zzbvu;->zza([B[BILjava/lang/Object;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public zze()Ljava/lang/String;
    .locals 8
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    add-int v1, v0, v0

    .line 5
    .line 6
    new-array v1, v1, [C

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    move v3, v2

    .line 10
    :goto_0
    if-ge v2, v0, :cond_0

    .line 11
    .line 12
    aget-byte v4, p0, v2

    .line 13
    .line 14
    add-int/lit8 v5, v3, 0x1

    .line 15
    .line 16
    shr-int/lit8 v6, v4, 0x4

    .line 17
    .line 18
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwy;->zza()[C

    .line 19
    .line 20
    .line 21
    move-result-object v7

    .line 22
    and-int/lit8 v6, v6, 0xf

    .line 23
    .line 24
    aget-char v6, v7, v6

    .line 25
    .line 26
    aput-char v6, v1, v3

    .line 27
    .line 28
    and-int/lit8 v4, v4, 0xf

    .line 29
    .line 30
    invoke-static {}, Lcom/google/android/libraries/places/internal/zzbwy;->zza()[C

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    aget-char v4, v6, v4

    .line 35
    .line 36
    aput-char v4, v1, v5

    .line 37
    .line 38
    add-int/lit8 v3, v3, 0x2

    .line 39
    .line 40
    add-int/lit8 v2, v2, 0x1

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    invoke-static {v1}, Lkotlin/text/d;->r([C)Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    return-object p0
.end method

.method public final zzf()Ljava/lang/String;
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zze:Ljava/lang/String;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzo()[B

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbww;->zza([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zze:Ljava/lang/String;

    .line 14
    .line 15
    :cond_0
    return-object v0
.end method

.method public zzg()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 7
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    iget-object v1, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 3
    .line 4
    array-length v2, v1

    .line 5
    if-ge v0, v2, :cond_5

    .line 6
    .line 7
    add-int/lit8 v3, v0, 0x1

    .line 8
    .line 9
    aget-byte v4, v1, v0

    .line 10
    .line 11
    const/16 v5, 0x41

    .line 12
    .line 13
    if-lt v4, v5, :cond_4

    .line 14
    .line 15
    const/16 v6, 0x5a

    .line 16
    .line 17
    if-le v4, v6, :cond_0

    .line 18
    .line 19
    goto :goto_3

    .line 20
    :cond_0
    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    add-int/lit8 v4, v4, 0x20

    .line 25
    .line 26
    int-to-byte v1, v4

    .line 27
    aput-byte v1, p0, v0

    .line 28
    .line 29
    :goto_1
    array-length v0, p0

    .line 30
    if-ge v3, v0, :cond_3

    .line 31
    .line 32
    add-int/lit8 v0, v3, 0x1

    .line 33
    .line 34
    aget-byte v1, p0, v3

    .line 35
    .line 36
    if-lt v1, v5, :cond_2

    .line 37
    .line 38
    if-le v1, v6, :cond_1

    .line 39
    .line 40
    goto :goto_2

    .line 41
    :cond_1
    add-int/lit8 v1, v1, 0x20

    .line 42
    .line 43
    int-to-byte v1, v1

    .line 44
    aput-byte v1, p0, v3

    .line 45
    .line 46
    :cond_2
    :goto_2
    move v3, v0

    .line 47
    goto :goto_1

    .line 48
    :cond_3
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbwf;

    .line 49
    .line 50
    invoke-direct {v0, p0}, Lcom/google/android/libraries/places/internal/zzbwf;-><init>([B)V

    .line 51
    .line 52
    .line 53
    return-object v0

    .line 54
    :cond_4
    :goto_3
    move v0, v3

    .line 55
    goto :goto_0

    .line 56
    :cond_5
    return-object p0
.end method

.method public final zzh(I)V
    .locals 0

    iput p1, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzd:I

    return-void
.end method

.method public final zzi(Ljava/lang/String;)V
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    iput-object p1, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zze:Ljava/lang/String;

    return-void
.end method

.method public zzj(Lcom/google/android/libraries/places/internal/zzbwb;II)V
    .locals 0
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwb;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    sget p2, Lcom/google/android/libraries/places/internal/zzbwy;->zza:I

    .line 5
    .line 6
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 10
    .line 11
    const/4 p2, 0x0

    .line 12
    invoke-virtual {p1, p0, p2, p3}, Lcom/google/android/libraries/places/internal/zzbwb;->zzl([BII)Lcom/google/android/libraries/places/internal/zzbwb;

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public zzk(ILcom/google/android/libraries/places/internal/zzbwf;II)Z
    .locals 0
    .param p2    # Lcom/google/android/libraries/places/internal/zzbwf;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x0

    .line 5
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 6
    .line 7
    invoke-virtual {p2, p1, p0, p1, p4}, Lcom/google/android/libraries/places/internal/zzbwf;->zzl(I[BII)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public zzl(I[BII)Z
    .locals 1
    .param p2    # [B
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    if-ltz p1, :cond_0

    .line 5
    .line 6
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 7
    .line 8
    array-length v0, p0

    .line 9
    sub-int/2addr v0, p4

    .line 10
    if-gt p1, v0, :cond_0

    .line 11
    .line 12
    if-ltz p3, :cond_0

    .line 13
    .line 14
    array-length v0, p2

    .line 15
    sub-int/2addr v0, p4

    .line 16
    if-gt p3, v0, :cond_0

    .line 17
    .line 18
    invoke-static {p0, p1, p2, p3, p4}, Lcom/google/android/libraries/places/internal/zzbvv;->zzc([BI[BII)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const/4 p0, 0x1

    .line 25
    return p0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final zzm(Lcom/google/android/libraries/places/internal/zzbwf;)Z
    .locals 2
    .param p1    # Lcom/google/android/libraries/places/internal/zzbwf;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 5
    .line 6
    array-length v0, v0

    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p0, v1, p1, v1, v0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzk(ILcom/google/android/libraries/places/internal/zzbwf;II)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0
.end method

.method public final zzn()[B
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    return-object p0
.end method

.method public zzo()[B
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    return-object p0
.end method

.method public zzp()[B
    .locals 1
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/google/android/libraries/places/internal/zzbwf;->zzc:[B

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0
.end method
