.class public Lcom/ss/android/ttvecamera/f;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static a:Ljava/lang/String;

.field private static b:Z

.field private static c:[Ljava/lang/String;

.field private static d:[Ljava/lang/String;

.field private static e:Z

.field private static f:Ljava/lang/Class;

.field private static g:Ljava/lang/reflect/Field;

.field private static h:Ljava/lang/reflect/Method;

.field public static i:B

.field static final j:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 23

    .line 1
    const-string v16, "Exynos 9810"

    .line 2
    .line 3
    const-string v17, "Exynos 8895"

    .line 4
    .line 5
    const-string v1, "SDM632"

    .line 6
    .line 7
    const-string v2, "SDM636"

    .line 8
    .line 9
    const-string v3, "SDM638"

    .line 10
    .line 11
    const-string v4, "SDM660"

    .line 12
    .line 13
    const-string v5, "SDM670"

    .line 14
    .line 15
    const-string v6, "SDM710"

    .line 16
    .line 17
    const-string v7, "SDM720"

    .line 18
    .line 19
    const-string v8, "MSM8996"

    .line 20
    .line 21
    const-string v9, "MSM8998"

    .line 22
    .line 23
    const-string v10, "SDM845"

    .line 24
    .line 25
    const-string v11, "KIRIN980"

    .line 26
    .line 27
    const-string v12, "KIRIN970"

    .line 28
    .line 29
    const-string v13, "KIRIN710"

    .line 30
    .line 31
    const-string v14, "HI3660"

    .line 32
    .line 33
    const-string v15, "MT6771"

    .line 34
    .line 35
    filled-new-array/range {v1 .. v17}, [Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    sput-object v0, Lcom/ss/android/ttvecamera/f;->c:[Ljava/lang/String;

    .line 40
    .line 41
    const-string v0, "ANE-AL00"

    .line 42
    .line 43
    const-string v1, "HWI-AL00"

    .line 44
    .line 45
    const-string v2, "BAC-AL00"

    .line 46
    .line 47
    filled-new-array {v2, v0, v1}, [Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    sput-object v0, Lcom/ss/android/ttvecamera/f;->d:[Ljava/lang/String;

    .line 52
    .line 53
    const/4 v0, 0x0

    .line 54
    sput-boolean v0, Lcom/ss/android/ttvecamera/f;->e:Z

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    sput-object v1, Lcom/ss/android/ttvecamera/f;->f:Ljava/lang/Class;

    .line 58
    .line 59
    sput-object v1, Lcom/ss/android/ttvecamera/f;->g:Ljava/lang/reflect/Field;

    .line 60
    .line 61
    sput-object v1, Lcom/ss/android/ttvecamera/f;->h:Ljava/lang/reflect/Method;

    .line 62
    .line 63
    sput-byte v0, Lcom/ss/android/ttvecamera/f;->i:B

    .line 64
    .line 65
    new-instance v1, Ljava/util/ArrayList;

    .line 66
    .line 67
    new-instance v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 68
    .line 69
    const/16 v3, 0x78

    .line 70
    .line 71
    const/16 v4, 0xa0

    .line 72
    .line 73
    invoke-direct {v2, v4, v3}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 74
    .line 75
    .line 76
    new-instance v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 77
    .line 78
    const/16 v5, 0xf0

    .line 79
    .line 80
    invoke-direct {v3, v5, v4}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 81
    .line 82
    .line 83
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 84
    .line 85
    const/16 v6, 0x140

    .line 86
    .line 87
    invoke-direct {v4, v6, v5}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 88
    .line 89
    .line 90
    new-instance v7, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 91
    .line 92
    const/16 v8, 0x190

    .line 93
    .line 94
    invoke-direct {v7, v8, v5}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 95
    .line 96
    .line 97
    new-instance v5, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 98
    .line 99
    const/16 v8, 0x1e0

    .line 100
    .line 101
    invoke-direct {v5, v8, v6}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 102
    .line 103
    .line 104
    move-object v6, v5

    .line 105
    move-object v5, v7

    .line 106
    new-instance v7, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 107
    .line 108
    const/16 v9, 0x168

    .line 109
    .line 110
    const/16 v10, 0x280

    .line 111
    .line 112
    invoke-direct {v7, v10, v9}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 113
    .line 114
    .line 115
    new-instance v9, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 116
    .line 117
    invoke-direct {v9, v10, v8}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 118
    .line 119
    .line 120
    move-object v11, v9

    .line 121
    new-instance v9, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 122
    .line 123
    const/16 v12, 0x300

    .line 124
    .line 125
    invoke-direct {v9, v12, v8}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 126
    .line 127
    .line 128
    new-instance v12, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 129
    .line 130
    const/16 v13, 0x356

    .line 131
    .line 132
    invoke-direct {v12, v13, v8}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 133
    .line 134
    .line 135
    move-object v8, v11

    .line 136
    new-instance v11, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 137
    .line 138
    const/16 v13, 0x320

    .line 139
    .line 140
    const/16 v14, 0x258

    .line 141
    .line 142
    invoke-direct {v11, v13, v14}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 143
    .line 144
    .line 145
    move-object v13, v12

    .line 146
    new-instance v12, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 147
    .line 148
    const/16 v15, 0x21c

    .line 149
    .line 150
    const/16 v0, 0x3c0

    .line 151
    .line 152
    invoke-direct {v12, v0, v15}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 153
    .line 154
    .line 155
    move-object v15, v13

    .line 156
    new-instance v13, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 157
    .line 158
    invoke-direct {v13, v0, v10}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 159
    .line 160
    .line 161
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 162
    .line 163
    const/16 v10, 0x240

    .line 164
    .line 165
    const/16 v14, 0x400

    .line 166
    .line 167
    invoke-direct {v0, v14, v10}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 168
    .line 169
    .line 170
    move-object v10, v15

    .line 171
    new-instance v15, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 172
    .line 173
    move-object/from16 v17, v0

    .line 174
    .line 175
    const/16 v0, 0x258

    .line 176
    .line 177
    invoke-direct {v15, v14, v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 178
    .line 179
    .line 180
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 181
    .line 182
    const/16 v14, 0x2d0

    .line 183
    .line 184
    move-object/from16 v18, v2

    .line 185
    .line 186
    const/16 v2, 0x500

    .line 187
    .line 188
    invoke-direct {v0, v2, v14}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 189
    .line 190
    .line 191
    new-instance v14, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 192
    .line 193
    move-object/from16 v19, v0

    .line 194
    .line 195
    const/16 v0, 0x400

    .line 196
    .line 197
    invoke-direct {v14, v2, v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 198
    .line 199
    .line 200
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 201
    .line 202
    const/16 v2, 0x438

    .line 203
    .line 204
    move-object/from16 v16, v3

    .line 205
    .line 206
    const/16 v3, 0x780

    .line 207
    .line 208
    invoke-direct {v0, v3, v2}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 209
    .line 210
    .line 211
    new-instance v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 212
    .line 213
    move-object/from16 v20, v0

    .line 214
    .line 215
    const/16 v0, 0x5a0

    .line 216
    .line 217
    invoke-direct {v2, v3, v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 218
    .line 219
    .line 220
    new-instance v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 221
    .line 222
    move-object/from16 v21, v2

    .line 223
    .line 224
    const/16 v2, 0xa00

    .line 225
    .line 226
    invoke-direct {v3, v2, v0}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 227
    .line 228
    .line 229
    new-instance v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 230
    .line 231
    const/16 v2, 0xf00

    .line 232
    .line 233
    move-object/from16 v22, v3

    .line 234
    .line 235
    const/16 v3, 0x870

    .line 236
    .line 237
    invoke-direct {v0, v2, v3}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 238
    .line 239
    .line 240
    move-object/from16 v2, v17

    .line 241
    .line 242
    move-object/from16 v17, v14

    .line 243
    .line 244
    move-object v14, v2

    .line 245
    move-object/from16 v3, v16

    .line 246
    .line 247
    move-object/from16 v2, v18

    .line 248
    .line 249
    move-object/from16 v16, v19

    .line 250
    .line 251
    move-object/from16 v18, v20

    .line 252
    .line 253
    move-object/from16 v19, v21

    .line 254
    .line 255
    move-object/from16 v20, v22

    .line 256
    .line 257
    move-object/from16 v21, v0

    .line 258
    .line 259
    filled-new-array/range {v2 .. v21}, [Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 264
    .line 265
    .line 266
    move-result-object v0

    .line 267
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 268
    .line 269
    .line 270
    sput-object v1, Lcom/ss/android/ttvecamera/f;->j:Ljava/util/ArrayList;

    .line 271
    .line 272
    invoke-static {}, Lcom/ss/android/ttvecamera/f;->l()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 277
    .line 278
    .line 279
    move-result v1

    .line 280
    const/4 v2, 0x1

    .line 281
    if-nez v1, :cond_1

    .line 282
    .line 283
    invoke-virtual {v0}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    sget-object v1, Lcom/ss/android/ttvecamera/f;->c:[Ljava/lang/String;

    .line 288
    .line 289
    array-length v3, v1

    .line 290
    const/4 v4, 0x0

    .line 291
    :goto_0
    if-ge v4, v3, :cond_1

    .line 292
    .line 293
    aget-object v5, v1, v4

    .line 294
    .line 295
    invoke-virtual {v0, v5}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 296
    .line 297
    .line 298
    move-result v5

    .line 299
    if-eqz v5, :cond_0

    .line 300
    .line 301
    sput-boolean v2, Lcom/ss/android/ttvecamera/f;->b:Z

    .line 302
    .line 303
    goto :goto_1

    .line 304
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 305
    .line 306
    goto :goto_0

    .line 307
    :cond_1
    :goto_1
    sget-object v1, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 308
    .line 309
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 310
    .line 311
    .line 312
    move-result v3

    .line 313
    if-nez v3, :cond_3

    .line 314
    .line 315
    invoke-virtual {v1}, Ljava/lang/String;->toUpperCase()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    sget-object v3, Lcom/ss/android/ttvecamera/f;->d:[Ljava/lang/String;

    .line 320
    .line 321
    array-length v4, v3

    .line 322
    const/4 v5, 0x0

    .line 323
    :goto_2
    if-ge v5, v4, :cond_3

    .line 324
    .line 325
    aget-object v6, v3, v5

    .line 326
    .line 327
    invoke-virtual {v6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v6

    .line 331
    if-eqz v6, :cond_2

    .line 332
    .line 333
    sput-boolean v2, Lcom/ss/android/ttvecamera/f;->e:Z

    .line 334
    .line 335
    goto :goto_3

    .line 336
    :cond_2
    add-int/lit8 v5, v5, 0x1

    .line 337
    .line 338
    goto :goto_2

    .line 339
    :cond_3
    :goto_3
    new-instance v2, Ljava/lang/StringBuilder;

    .line 340
    .line 341
    const-string v3, "cpuHardware: "

    .line 342
    .line 343
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 344
    .line 345
    .line 346
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 347
    .line 348
    .line 349
    const-string v0, ", isHighPerformanceCpu: "

    .line 350
    .line 351
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 352
    .line 353
    .line 354
    sget-boolean v0, Lcom/ss/android/ttvecamera/f;->b:Z

    .line 355
    .line 356
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 357
    .line 358
    .line 359
    const-string v0, "model: "

    .line 360
    .line 361
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v0, ", isInAbortCapturesBlockList: "

    .line 368
    .line 369
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    sget-boolean v0, Lcom/ss/android/ttvecamera/f;->e:Z

    .line 373
    .line 374
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 378
    .line 379
    .line 380
    move-result-object v0

    .line 381
    const-string v1, "TECameraUtils"

    .line 382
    .line 383
    invoke-static {v1, v0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 6
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ")",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    move-object v1, v0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_3

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    check-cast v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 18
    .line 19
    iget v3, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 20
    .line 21
    iget v4, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 22
    .line 23
    if-le v3, v4, :cond_0

    .line 24
    .line 25
    iget v4, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 26
    .line 27
    iget v5, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 28
    .line 29
    if-gt v4, v5, :cond_1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    if-eqz v1, :cond_2

    .line 33
    .line 34
    iget v4, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 35
    .line 36
    if-ge v3, v4, :cond_0

    .line 37
    .line 38
    :cond_2
    move-object v1, v2

    .line 39
    goto :goto_0

    .line 40
    :cond_3
    if-eqz v1, :cond_4

    .line 41
    .line 42
    return-object v1

    .line 43
    :cond_4
    return-object v0
.end method

.method public static b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 8
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ")",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_b

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-lez v1, :cond_b

    .line 9
    .line 10
    iget v1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 11
    .line 12
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 13
    .line 14
    int-to-float v2, v1

    .line 15
    int-to-float v3, p1

    .line 16
    div-float/2addr v2, v3

    .line 17
    new-instance v3, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    new-instance v4, Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v5

    .line 41
    check-cast v5, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 42
    .line 43
    iget v6, v5, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 44
    .line 45
    int-to-float v6, v6

    .line 46
    iget v7, v5, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 47
    .line 48
    int-to-float v7, v7

    .line 49
    div-float/2addr v6, v7

    .line 50
    invoke-static {v2, v6}, Ljava/lang/Float;->compare(FF)I

    .line 51
    .line 52
    .line 53
    move-result v6

    .line 54
    if-nez v6, :cond_0

    .line 55
    .line 56
    invoke-interface {v3, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_0
    invoke-interface {v4, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_1
    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    .line 65
    .line 66
    .line 67
    move-result p0

    .line 68
    if-nez p0, :cond_7

    .line 69
    .line 70
    new-instance p0, Lcom/ss/android/ttvecamera/f$h;

    .line 71
    .line 72
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/f$h;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-static {v3, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 76
    .line 77
    .line 78
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    :cond_2
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 83
    .line 84
    .line 85
    move-result v2

    .line 86
    if-eqz v2, :cond_6

    .line 87
    .line 88
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    check-cast v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 93
    .line 94
    if-nez v0, :cond_3

    .line 95
    .line 96
    :goto_2
    move-object v0, v2

    .line 97
    goto :goto_1

    .line 98
    :cond_3
    iget v3, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 99
    .line 100
    if-ne v3, v1, :cond_4

    .line 101
    .line 102
    iget v4, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 103
    .line 104
    if-ne v4, p1, :cond_4

    .line 105
    .line 106
    return-object v2

    .line 107
    :cond_4
    if-le v3, v1, :cond_5

    .line 108
    .line 109
    iget v4, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 110
    .line 111
    if-ge v3, v4, :cond_5

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    if-ge v3, v1, :cond_2

    .line 115
    .line 116
    :cond_6
    return-object v0

    .line 117
    :cond_7
    new-instance p0, Lcom/ss/android/ttvecamera/f$i;

    .line 118
    .line 119
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/f$i;-><init>()V

    .line 120
    .line 121
    .line 122
    invoke-static {v4, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 123
    .line 124
    .line 125
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    :cond_8
    :goto_3
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 130
    .line 131
    .line 132
    move-result v2

    .line 133
    if-eqz v2, :cond_b

    .line 134
    .line 135
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 140
    .line 141
    if-nez v0, :cond_9

    .line 142
    .line 143
    :goto_4
    move-object v0, v2

    .line 144
    goto :goto_3

    .line 145
    :cond_9
    iget v3, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 146
    .line 147
    if-lt v3, v1, :cond_a

    .line 148
    .line 149
    iget v4, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 150
    .line 151
    if-lt v4, p1, :cond_a

    .line 152
    .line 153
    goto :goto_4

    .line 154
    :cond_a
    if-ge v3, v1, :cond_8

    .line 155
    .line 156
    iget v2, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 157
    .line 158
    if-ge v2, p1, :cond_8

    .line 159
    .line 160
    :cond_b
    return-object v0
.end method

.method public static c(Ljava/util/List;F)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;F)",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    cmpg-float v0, p1, v0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    if-eqz p0, :cond_8

    .line 9
    .line 10
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-lez v0, :cond_8

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    new-instance v1, Ljava/util/ArrayList;

    .line 22
    .line 23
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 24
    .line 25
    .line 26
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_2

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    check-cast v2, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 41
    .line 42
    iget v3, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 43
    .line 44
    int-to-float v3, v3

    .line 45
    iget v4, v2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 46
    .line 47
    int-to-float v4, v4

    .line 48
    div-float/2addr v3, v4

    .line 49
    invoke-static {p1, v3}, Ljava/lang/Float;->compare(FF)I

    .line 50
    .line 51
    .line 52
    move-result v3

    .line 53
    if-nez v3, :cond_1

    .line 54
    .line 55
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :cond_1
    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_2
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 64
    .line 65
    .line 66
    move-result p0

    .line 67
    const/16 p1, 0x10

    .line 68
    .line 69
    const/16 v2, 0xe

    .line 70
    .line 71
    if-nez p0, :cond_5

    .line 72
    .line 73
    sget-object p0, Lcom/ss/android/ttvecamera/f;->j:Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    if-eqz v1, :cond_3

    .line 84
    .line 85
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_3
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 97
    .line 98
    .line 99
    move-result v1

    .line 100
    if-eqz v1, :cond_4

    .line 101
    .line 102
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 107
    .line 108
    return-object p0

    .line 109
    :cond_4
    new-instance p0, Lcom/ss/android/ttvecamera/f$a;

    .line 110
    .line 111
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/f$a;-><init>()V

    .line 112
    .line 113
    .line 114
    invoke-static {v0, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 115
    .line 116
    .line 117
    const/4 p0, 0x0

    .line 118
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object p0

    .line 122
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_5
    sget-object p0, Lcom/ss/android/ttvecamera/f;->j:Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-interface {v1, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v3

    .line 135
    if-eqz v3, :cond_6

    .line 136
    .line 137
    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object p0

    .line 141
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_6
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    if-eqz v2, :cond_7

    .line 153
    .line 154
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object p0

    .line 158
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_7
    new-instance p0, Lcom/ss/android/ttvecamera/f$b;

    .line 162
    .line 163
    invoke-direct {p0}, Lcom/ss/android/ttvecamera/f$b;-><init>()V

    .line 164
    .line 165
    .line 166
    invoke-static {v1, p0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 167
    .line 168
    .line 169
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    div-int/lit8 p0, p0, 0x2

    .line 174
    .line 175
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    check-cast p0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 180
    .line 181
    return-object p0

    .line 182
    :cond_8
    return-object v1
.end method

.method public static d(I)I
    .locals 2

    .line 1
    const/16 v0, -0x3e8

    .line 2
    .line 3
    const/16 v1, 0x3e8

    .line 4
    .line 5
    invoke-static {p0, v0, v1}, Lcom/ss/android/ttvecamera/f;->e(III)I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public static e(III)I
    .locals 0

    .line 1
    if-le p0, p2, :cond_0

    return p2

    :cond_0
    if-ge p0, p1, :cond_1

    return p1

    :cond_1
    return p0
.end method

.method public static f([II)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    array-length v1, p0

    .line 6
    move v2, v0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_2

    .line 8
    .line 9
    aget v3, p0, v2

    .line 10
    .line 11
    if-ne v3, p1, :cond_1

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_2
    return v0
.end method

.method public static g([Ljava/lang/String;Ljava/lang/String;)Z
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-nez p0, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    array-length v1, p0

    .line 6
    move v2, v0

    .line 7
    :goto_0
    if-ge v2, v1, :cond_2

    .line 8
    .line 9
    aget-object v3, p0, v2

    .line 10
    .line 11
    invoke-virtual {v3, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    if-eqz v3, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_2
    return v0
.end method

.method public static h([Landroid/util/Range;)Ljava/util/List;
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Range<",
            "Ljava/lang/Integer;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameRateRange;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    array-length v1, p0

    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    array-length v1, p0

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_1

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameRateRange;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/util/Range;->getLower()Ljava/lang/Comparable;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    check-cast v5, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    invoke-virtual {v3}, Landroid/util/Range;->getUpper()Ljava/lang/Comparable;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Ljava/lang/Integer;

    .line 34
    .line 35
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    invoke-direct {v4, v5, v3}, Lcom/ss/android/ttvecamera/TEFrameRateRange;-><init>(II)V

    .line 40
    .line 41
    .line 42
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    add-int/lit8 v2, v2, 0x1

    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    return-object v0
.end method

.method public static i([Landroid/util/Size;)Ljava/util/List;
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Landroid/util/Size;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    array-length v1, p0

    .line 8
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 9
    .line 10
    .line 11
    array-length v1, p0

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_1

    .line 14
    .line 15
    aget-object v3, p0, v2

    .line 16
    .line 17
    new-instance v4, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 18
    .line 19
    invoke-virtual {v3}, Landroid/util/Size;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    invoke-direct {v4, v5, v3}, Lcom/ss/android/ttvecamera/TEFrameSizei;-><init>(II)V

    .line 28
    .line 29
    .line 30
    invoke-interface {v0, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    add-int/lit8 v2, v2, 0x1

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_1
    return-object v0
.end method

.method public static j(Ljava/lang/String;ILandroid/content/Context;Lcom/ss/android/ttvecamera/c$a;Landroid/os/Handler;Lcom/ss/android/ttvecamera/c$d;)Ljava/lang/Object;
    .locals 10
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    invoke-static {p0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 7
    .line 8
    .line 9
    move-result-object v3

    .line 10
    const-string v4, "create"

    .line 11
    .line 12
    sget-object v5, Ljava/lang/Integer;->TYPE:Ljava/lang/Class;

    .line 13
    .line 14
    const-class v6, Landroid/content/Context;

    .line 15
    .line 16
    const-class v7, Lcom/ss/android/ttvecamera/c$a;

    .line 17
    .line 18
    const-class v8, Landroid/os/Handler;

    .line 19
    .line 20
    const-class v9, Lcom/ss/android/ttvecamera/c$d;

    .line 21
    .line 22
    filled-new-array {v5, v6, v7, v8, v9}, [Ljava/lang/Class;

    .line 23
    .line 24
    .line 25
    move-result-object v5

    .line 26
    invoke-virtual {v3, v4, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const/4 v4, 0x1

    .line 31
    invoke-virtual {v3, v4}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    filled-new-array {p1, p2, p3, p4, p5}, [Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v3, v2, p1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    :catch_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string p2, "createCameraInstance for "

    .line 49
    .line 50
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string p0, ", cost time = "

    .line 57
    .line 58
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 62
    .line 63
    .line 64
    move-result-wide p2

    .line 65
    sub-long/2addr p2, v0

    .line 66
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string p0, "ms, cameraInstance = "

    .line 70
    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const-string p1, "TECameraUtils"

    .line 82
    .line 83
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-object v2
.end method

.method public static k(Ljava/lang/Object;)Z
    .locals 5

    .line 1
    const-string v0, "TECameraUtils"

    .line 2
    .line 3
    :try_start_0
    sget-object v1, Lcom/ss/android/ttvecamera/f;->f:Ljava/lang/Class;

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    sget-object v1, Lcom/ss/android/ttvecamera/f;->g:Ljava/lang/reflect/Field;

    .line 10
    .line 11
    if-eqz v1, :cond_0

    .line 12
    .line 13
    sget-object v1, Lcom/ss/android/ttvecamera/f;->h:Ljava/lang/reflect/Method;

    .line 14
    .line 15
    if-nez v1, :cond_1

    .line 16
    .line 17
    :cond_0
    const-string v1, "android.hardware.camera2.impl.CameraMetadataNative"

    .line 18
    .line 19
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    sput-object v1, Lcom/ss/android/ttvecamera/f;->f:Ljava/lang/Class;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    const-string v4, "mResults"

    .line 34
    .line 35
    invoke-virtual {v1, v4}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    sput-object v1, Lcom/ss/android/ttvecamera/f;->g:Ljava/lang/reflect/Field;

    .line 40
    .line 41
    sget-object v1, Lcom/ss/android/ttvecamera/f;->f:Ljava/lang/Class;

    .line 42
    .line 43
    const-string v4, "finalize"

    .line 44
    .line 45
    invoke-virtual {v1, v4, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    sput-object v1, Lcom/ss/android/ttvecamera/f;->h:Ljava/lang/reflect/Method;

    .line 50
    .line 51
    invoke-virtual {v1, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 52
    .line 53
    .line 54
    sget-object v1, Lcom/ss/android/ttvecamera/f;->g:Ljava/lang/reflect/Field;

    .line 55
    .line 56
    invoke-virtual {v1, v3}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 57
    .line 58
    .line 59
    :cond_1
    sget-object v1, Lcom/ss/android/ttvecamera/f;->g:Ljava/lang/reflect/Field;

    .line 60
    .line 61
    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    sget-object v1, Lcom/ss/android/ttvecamera/f;->h:Ljava/lang/reflect/Method;

    .line 66
    .line 67
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_5
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 68
    .line 69
    .line 70
    return v3

    .line 71
    :catch_0
    const-string p0, "unknown error"

    .line 72
    .line 73
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    goto :goto_0

    .line 77
    :catch_1
    const-string p0, "method invoke error"

    .line 78
    .line 79
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    goto :goto_0

    .line 83
    :catch_2
    const-string p0, "illegal access"

    .line 84
    .line 85
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    goto :goto_0

    .line 89
    :catch_3
    const-string p0, "mResults field not found"

    .line 90
    .line 91
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    goto :goto_0

    .line 95
    :catch_4
    const-string p0, "finalize method not found"

    .line 96
    .line 97
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :catch_5
    const-string p0, "CameraMetadataNative class not found"

    .line 102
    .line 103
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :goto_0
    const/4 p0, 0x0

    .line 107
    return p0
.end method

.method public static l()Ljava/lang/String;
    .locals 4

    .line 1
    sget-object v0, Lcom/ss/android/ttvecamera/f;->a:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/ss/android/ttvecamera/f;->a:Ljava/lang/String;

    .line 10
    .line 11
    return-object v0

    .line 12
    :cond_0
    const-string v0, "/proc/cpuinfo"

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    :try_start_0
    new-instance v2, Ljava/io/BufferedReader;

    .line 16
    .line 17
    new-instance v3, Ljava/io/FileReader;

    .line 18
    .line 19
    invoke-direct {v3, v0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 23
    .line 24
    .line 25
    :cond_1
    :goto_0
    :try_start_1
    invoke-virtual {v2}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    if-eqz v0, :cond_3

    .line 30
    .line 31
    const-string v1, "Hardware"

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-nez v1, :cond_2

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    const-string v1, ":"

    .line 41
    .line 42
    invoke-virtual {v0, v1}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    array-length v1, v0

    .line 47
    const/4 v3, 0x1

    .line 48
    if-le v1, v3, :cond_1

    .line 49
    .line 50
    aget-object v0, v0, v3

    .line 51
    .line 52
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    sput-object v0, Lcom/ss/android/ttvecamera/f;->a:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    .line 58
    :try_start_2
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 59
    .line 60
    .line 61
    return-object v0

    .line 62
    :catch_0
    move-exception v1

    .line 63
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 64
    .line 65
    .line 66
    return-object v0

    .line 67
    :catchall_0
    move-exception v0

    .line 68
    move-object v1, v2

    .line 69
    goto :goto_3

    .line 70
    :catch_1
    move-exception v0

    .line 71
    move-object v1, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_3
    :try_start_3
    invoke-virtual {v2}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 74
    .line 75
    .line 76
    goto :goto_2

    .line 77
    :catch_2
    move-exception v0

    .line 78
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :catchall_1
    move-exception v0

    .line 83
    goto :goto_3

    .line 84
    :catch_3
    move-exception v0

    .line 85
    :goto_1
    :try_start_4
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 86
    .line 87
    .line 88
    if-eqz v1, :cond_4

    .line 89
    .line 90
    :try_start_5
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 91
    .line 92
    .line 93
    :cond_4
    :goto_2
    sget-object v0, Landroid/os/Build;->HARDWARE:Ljava/lang/String;

    .line 94
    .line 95
    sput-object v0, Lcom/ss/android/ttvecamera/f;->a:Ljava/lang/String;

    .line 96
    .line 97
    return-object v0

    .line 98
    :goto_3
    if-eqz v1, :cond_5

    .line 99
    .line 100
    :try_start_6
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 101
    .line 102
    .line 103
    goto :goto_4

    .line 104
    :catch_4
    move-exception v1

    .line 105
    invoke-virtual {v1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 106
    .line 107
    .line 108
    :cond_5
    :goto_4
    throw v0
.end method

.method public static m([ILjava/util/List;)[I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/List<",
            "[I>;)[I"
        }
    .end annotation

    .line 1
    const-string v0, "TECameraUtils"

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-eqz p1, :cond_7

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-lez v4, :cond_7

    .line 14
    .line 15
    new-instance v4, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v5, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    if-eqz v7, :cond_3

    .line 34
    .line 35
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    check-cast v7, [I

    .line 40
    .line 41
    aget v8, p0, v3

    .line 42
    .line 43
    const/16 v9, 0x3e8

    .line 44
    .line 45
    if-le v8, v9, :cond_1

    .line 46
    .line 47
    aget v8, v7, v2

    .line 48
    .line 49
    const/16 v9, 0x7530

    .line 50
    .line 51
    if-ne v8, v9, :cond_0

    .line 52
    .line 53
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_1
    aget v8, v7, v2

    .line 62
    .line 63
    if-ne v8, v1, :cond_2

    .line 64
    .line 65
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    goto :goto_0

    .line 69
    :cond_2
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    goto :goto_0

    .line 73
    :cond_3
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-nez v1, :cond_5

    .line 78
    .line 79
    new-instance v1, Lcom/ss/android/ttvecamera/f$c;

    .line 80
    .line 81
    invoke-direct {v1}, Lcom/ss/android/ttvecamera/f$c;-><init>()V

    .line 82
    .line 83
    .line 84
    invoke-static {v4, v1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 85
    .line 86
    .line 87
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 88
    .line 89
    .line 90
    move-result-object v1

    .line 91
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 92
    .line 93
    .line 94
    move-result v4

    .line 95
    if-eqz v4, :cond_5

    .line 96
    .line 97
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v4

    .line 101
    check-cast v4, [I

    .line 102
    .line 103
    aget v5, v4, v3

    .line 104
    .line 105
    aget v6, p0, v3

    .line 106
    .line 107
    if-gt v5, v6, :cond_4

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    const/4 v4, 0x0

    .line 111
    :goto_1
    if-nez v4, :cond_6

    .line 112
    .line 113
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->n([ILjava/util/List;)[I

    .line 114
    .line 115
    .line 116
    move-result-object v4

    .line 117
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string p1, "calculate fps range = ["

    .line 120
    .line 121
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    aget p1, v4, v3

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p1, ","

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    aget p1, v4, v2

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string p1, "]"

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v4

    .line 152
    :cond_7
    const-string p0, "supported fpsRange is null,use [7,30]"

    .line 153
    .line 154
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const/4 p0, 0x2

    .line 158
    new-array p0, p0, [I

    .line 159
    .line 160
    const/4 p1, 0x7

    .line 161
    aput p1, p0, v3

    .line 162
    .line 163
    aput v1, p0, v2

    .line 164
    .line 165
    return-object p0
.end method

.method public static n([ILjava/util/List;)[I
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/List<",
            "[I>;)[I"
        }
    .end annotation

    .line 1
    new-instance v0, Lcom/ss/android/ttvecamera/f$d;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/ss/android/ttvecamera/f$d;-><init>([I)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ljava/util/Collections;->min(Ljava/util/Collection;Ljava/util/Comparator;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    check-cast p0, [I

    .line 11
    .line 12
    return-object p0
.end method

.method public static o(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;IF)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 5
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # I
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            "IF)",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFrameSizei;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 14
    .line 15
    int-to-float v1, v1

    .line 16
    const/high16 v2, 0x3f800000    # 1.0f

    .line 17
    .line 18
    mul-float/2addr v1, v2

    .line 19
    iget v3, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 20
    .line 21
    int-to-float v3, v3

    .line 22
    div-float/2addr v1, v3

    .line 23
    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    if-eqz v3, :cond_1

    .line 28
    .line 29
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    check-cast v3, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 34
    .line 35
    iget v4, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 36
    .line 37
    int-to-float v4, v4

    .line 38
    mul-float/2addr v4, v2

    .line 39
    iget v3, v3, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 40
    .line 41
    int-to-float v3, v3

    .line 42
    div-float/2addr v4, v3

    .line 43
    sub-float v3, v1, v4

    .line 44
    .line 45
    invoke-static {v3}, Ljava/lang/Math;->abs(F)F

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    cmpl-float v3, v3, p3

    .line 50
    .line 51
    if-lez v3, :cond_0

    .line 52
    .line 53
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    new-instance v0, Lcom/ss/android/ttvecamera/f$g;

    .line 58
    .line 59
    invoke-direct {v0}, Lcom/ss/android/ttvecamera/f$g;-><init>()V

    .line 60
    .line 61
    .line 62
    invoke-static {p0, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :cond_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    if-eqz v1, :cond_3

    .line 74
    .line 75
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    check-cast v1, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 80
    .line 81
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 82
    .line 83
    if-gt v2, p2, :cond_2

    .line 84
    .line 85
    goto :goto_1

    .line 86
    :cond_3
    const/4 v1, 0x0

    .line 87
    :goto_1
    sget-byte v0, Lcom/ss/android/ttvecamera/f;->i:B

    .line 88
    .line 89
    and-int/lit8 v0, v0, 0x8

    .line 90
    .line 91
    if-eqz v0, :cond_5

    .line 92
    .line 93
    if-eqz v1, :cond_4

    .line 94
    .line 95
    iget v0, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 96
    .line 97
    iget v2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 98
    .line 99
    if-le v0, v2, :cond_4

    .line 100
    .line 101
    iget v0, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 102
    .line 103
    iget v2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 104
    .line 105
    if-gt v0, v2, :cond_7

    .line 106
    .line 107
    :cond_4
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->a(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    if-eqz p0, :cond_7

    .line 112
    .line 113
    goto :goto_2

    .line 114
    :cond_5
    if-eqz v1, :cond_6

    .line 115
    .line 116
    iget v0, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 117
    .line 118
    iget v2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 119
    .line 120
    if-lt v0, v2, :cond_6

    .line 121
    .line 122
    iget v0, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 123
    .line 124
    iget v2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 125
    .line 126
    if-ge v0, v2, :cond_7

    .line 127
    .line 128
    :cond_6
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->a(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    if-eqz p0, :cond_7

    .line 133
    .line 134
    :goto_2
    move-object v1, p0

    .line 135
    :cond_7
    if-nez v1, :cond_8

    .line 136
    .line 137
    new-instance p0, Ljava/lang/StringBuilder;

    .line 138
    .line 139
    const-string v0, "getClosestSupportedSize failed, maxWidth: "

    .line 140
    .line 141
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    const-string p2, ", accuracy: "

    .line 148
    .line 149
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, p3}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    const-string p2, ", previewSize: "

    .line 156
    .line 157
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 161
    .line 162
    .line 163
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    const-string p1, "TECameraUtils"

    .line 168
    .line 169
    invoke-static {p1, p0}, Lcom/ss/android/ttvecamera/g;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    :cond_8
    return-object v1
.end method

.method public static p(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;
    .locals 4
    .param p0    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/android/ttvecamera/TEFrameSizei;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ")",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/ss/android/ttvecamera/TEFrameSizei;->a()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1, p2}, Lcom/ss/android/ttvecamera/TEFrameSizei;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p0, p2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    return-object p2

    .line 22
    :cond_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 37
    .line 38
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 39
    .line 40
    iget v3, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 41
    .line 42
    mul-int/2addr v2, v3

    .line 43
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 44
    .line 45
    iget v3, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 46
    .line 47
    mul-int/2addr v1, v3

    .line 48
    if-eq v2, v1, :cond_1

    .line 49
    .line 50
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    new-instance p1, Lcom/ss/android/ttvecamera/f$f;

    .line 55
    .line 56
    invoke-direct {p1}, Lcom/ss/android/ttvecamera/f$f;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-static {p0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 60
    .line 61
    .line 62
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    const/4 p1, 0x0

    .line 67
    :cond_3
    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_7

    .line 72
    .line 73
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    check-cast v0, Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 78
    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    :goto_2
    move-object p1, v0

    .line 82
    goto :goto_1

    .line 83
    :cond_4
    iget v1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 84
    .line 85
    iget v2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 86
    .line 87
    if-ne v1, v2, :cond_5

    .line 88
    .line 89
    iget v1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 90
    .line 91
    iget v2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 92
    .line 93
    if-ne v1, v2, :cond_5

    .line 94
    .line 95
    return-object v0

    .line 96
    :cond_5
    iget v1, v0, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 97
    .line 98
    iget v2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 99
    .line 100
    if-le v1, v2, :cond_6

    .line 101
    .line 102
    iget v3, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 103
    .line 104
    if-ge v1, v3, :cond_6

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_6
    if-ge v1, v2, :cond_3

    .line 108
    .line 109
    :cond_7
    return-object p1
.end method

.method public static q(Landroid/content/Context;)I
    .locals 1

    .line 1
    const-string v0, "window"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Landroid/view/WindowManager;

    .line 8
    .line 9
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    const/4 v0, 0x1

    .line 18
    if-eq p0, v0, :cond_2

    .line 19
    .line 20
    const/4 v0, 0x2

    .line 21
    if-eq p0, v0, :cond_1

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    if-eq p0, v0, :cond_0

    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_0
    const/16 p0, 0x10e

    .line 29
    .line 30
    return p0

    .line 31
    :cond_1
    const/16 p0, 0xb4

    .line 32
    .line 33
    return p0

    .line 34
    :cond_2
    const/16 p0, 0x5a

    .line 35
    .line 36
    return p0
.end method

.method public static r([ILjava/util/List;)[I
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([I",
            "Ljava/util/List<",
            "[I>;)[I"
        }
    .end annotation

    .line 1
    const-string v0, "TECameraUtils"

    .line 2
    .line 3
    const/16 v1, 0x1e

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eqz p1, :cond_7

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 10
    .line 11
    .line 12
    move-result v4

    .line 13
    if-lez v4, :cond_7

    .line 14
    .line 15
    new-instance v4, Ljava/util/ArrayList;

    .line 16
    .line 17
    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 18
    .line 19
    .line 20
    new-instance v5, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    :goto_0
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 30
    .line 31
    .line 32
    move-result v7

    .line 33
    if-eqz v7, :cond_1

    .line 34
    .line 35
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v7

    .line 39
    check-cast v7, [I

    .line 40
    .line 41
    aget v8, v7, v3

    .line 42
    .line 43
    aget v9, v7, v2

    .line 44
    .line 45
    if-ne v8, v9, :cond_0

    .line 46
    .line 47
    invoke-interface {v4, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_0
    invoke-interface {v5, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_1
    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    .line 56
    .line 57
    .line 58
    move-result v5

    .line 59
    if-nez v5, :cond_5

    .line 60
    .line 61
    new-instance v5, Lcom/ss/android/ttvecamera/f$e;

    .line 62
    .line 63
    invoke-direct {v5}, Lcom/ss/android/ttvecamera/f$e;-><init>()V

    .line 64
    .line 65
    .line 66
    invoke-static {v4, v5}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 67
    .line 68
    .line 69
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 70
    .line 71
    .line 72
    move-result-object v4

    .line 73
    :cond_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 74
    .line 75
    .line 76
    move-result v5

    .line 77
    if-eqz v5, :cond_5

    .line 78
    .line 79
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v5

    .line 83
    check-cast v5, [I

    .line 84
    .line 85
    aget v6, v5, v2

    .line 86
    .line 87
    const/16 v7, 0xf

    .line 88
    .line 89
    if-lt v6, v7, :cond_3

    .line 90
    .line 91
    if-le v6, v1, :cond_4

    .line 92
    .line 93
    :cond_3
    const/16 v7, 0x3a98

    .line 94
    .line 95
    if-lt v6, v7, :cond_2

    .line 96
    .line 97
    aget v6, v5, v3

    .line 98
    .line 99
    const/16 v7, 0x7530

    .line 100
    .line 101
    if-gt v6, v7, :cond_2

    .line 102
    .line 103
    :cond_4
    aget v6, p0, v3

    .line 104
    .line 105
    aget v7, v5, v3

    .line 106
    .line 107
    if-ne v6, v7, :cond_2

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    const/4 v5, 0x0

    .line 111
    :goto_1
    if-nez v5, :cond_6

    .line 112
    .line 113
    invoke-static {p0, p1}, Lcom/ss/android/ttvecamera/f;->n([ILjava/util/List;)[I

    .line 114
    .line 115
    .line 116
    move-result-object v5

    .line 117
    :cond_6
    new-instance p0, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    const-string p1, "calculate fps range = ["

    .line 120
    .line 121
    invoke-direct {p0, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    aget p1, v5, v2

    .line 125
    .line 126
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    const-string p1, ","

    .line 130
    .line 131
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 132
    .line 133
    .line 134
    aget p1, v5, v3

    .line 135
    .line 136
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 137
    .line 138
    .line 139
    const-string p1, "]"

    .line 140
    .line 141
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 142
    .line 143
    .line 144
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object p0

    .line 148
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    return-object v5

    .line 152
    :cond_7
    const-string p0, "supported fpsRange is null,use [30,30]"

    .line 153
    .line 154
    invoke-static {v0, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 155
    .line 156
    .line 157
    const/4 p0, 0x2

    .line 158
    new-array p0, p0, [I

    .line 159
    .line 160
    aput v1, p0, v2

    .line 161
    .line 162
    aput v1, p0, v3

    .line 163
    .line 164
    return-object p0
.end method

.method public static s(II[ILjava/util/List;)[I
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II[I",
            "Ljava/util/List<",
            "[I>;)[I"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "requiredFpsRange : ["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    aget v2, p2, v1

    .line 10
    .line 11
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v2, ","

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const/4 v2, 0x1

    .line 20
    aget v3, p2, v2

    .line 21
    .line 22
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    const-string v3, "]"

    .line 26
    .line 27
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const-string v3, "TECameraUtils"

    .line 35
    .line 36
    invoke-static {v3, v0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    if-ne p0, v2, :cond_0

    .line 40
    .line 41
    const-string p0, "fixed framerate for all cameras"

    .line 42
    .line 43
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->r([ILjava/util/List;)[I

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    return-object p0

    .line 51
    :cond_0
    const/4 v0, 0x2

    .line 52
    if-ne p0, v0, :cond_2

    .line 53
    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    const-string p0, "fixed framerate for rear camera"

    .line 57
    .line 58
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->r([ILjava/util/List;)[I

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0

    .line 66
    :cond_1
    const-string p0, "dynamic framerate for front camera"

    .line 67
    .line 68
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->m([ILjava/util/List;)[I

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    return-object p0

    .line 76
    :cond_2
    const/4 p1, 0x3

    .line 77
    if-ne p0, p1, :cond_3

    .line 78
    .line 79
    const-string p0, "dynamic framerate without select"

    .line 80
    .line 81
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->n([ILjava/util/List;)[I

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    return-object p0

    .line 89
    :cond_3
    const/4 p1, 0x4

    .line 90
    if-ne p0, p1, :cond_7

    .line 91
    .line 92
    const-string p0, "framerate by user"

    .line 93
    .line 94
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    :cond_4
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_5

    .line 106
    .line 107
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, [I

    .line 112
    .line 113
    aget v0, p1, v1

    .line 114
    .line 115
    aget v3, p2, v1

    .line 116
    .line 117
    if-ne v0, v3, :cond_4

    .line 118
    .line 119
    aget p1, p1, v2

    .line 120
    .line 121
    aget v0, p2, v2

    .line 122
    .line 123
    if-ne p1, v0, :cond_4

    .line 124
    .line 125
    move-object p0, p2

    .line 126
    goto :goto_0

    .line 127
    :cond_5
    const/4 p0, 0x0

    .line 128
    :goto_0
    if-nez p0, :cond_6

    .line 129
    .line 130
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->m([ILjava/util/List;)[I

    .line 131
    .line 132
    .line 133
    move-result-object p0

    .line 134
    :cond_6
    return-object p0

    .line 135
    :cond_7
    const-string p0, "dynamic framerate"

    .line 136
    .line 137
    invoke-static {v3, p0}, Lcom/ss/android/ttvecamera/g;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-static {p2, p3}, Lcom/ss/android/ttvecamera/f;->m([ILjava/util/List;)[I

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    return-object p0
.end method

.method public static t(Ljava/util/List;Ljava/util/List;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;"
        }
    .end annotation

    .line 1
    invoke-interface {p0, p1}, Ljava/util/List;->retainAll(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public static u(Landroid/content/Context;)Z
    .locals 7

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    const-string v1, "supportsCamera2ApiLocked"

    .line 3
    .line 4
    const-string v2, "0"

    .line 5
    .line 6
    const-string v3, "camera"

    .line 7
    .line 8
    invoke-virtual {p0, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Landroid/hardware/camera2/CameraManager;

    .line 13
    .line 14
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    const/16 v4, 0x1c

    .line 17
    .line 18
    const-class v5, Ljava/lang/String;

    .line 19
    .line 20
    if-ge v3, v4, :cond_1

    .line 21
    .line 22
    const/16 v4, 0x1b

    .line 23
    .line 24
    if-ne v3, v4, :cond_0

    .line 25
    .line 26
    :try_start_1
    sget v3, Landroid/os/Build$VERSION;->PREVIEW_SDK_INT:I

    .line 27
    .line 28
    if-lez v3, :cond_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception p0

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-virtual {v3, v1, v4}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 46
    .line 47
    .line 48
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    check-cast p0, Ljava/lang/Boolean;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0

    .line 63
    :cond_1
    :goto_0
    const-class v3, Ljava/lang/Class;

    .line 64
    .line 65
    const-string v4, "getDeclaredMethod"

    .line 66
    .line 67
    const-class v6, [Ljava/lang/Class;

    .line 68
    .line 69
    filled-new-array {v5, v6}, [Ljava/lang/Class;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-virtual {v3, v4, v6}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 74
    .line 75
    .line 76
    move-result-object v3

    .line 77
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    filled-new-array {v1, v5}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-virtual {v3, v4, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    check-cast v1, Ljava/lang/reflect/Method;

    .line 90
    .line 91
    invoke-virtual {v1, v0}, Ljava/lang/reflect/AccessibleObject;->setAccessible(Z)V

    .line 92
    .line 93
    .line 94
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-virtual {v1, p0, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    check-cast p0, Ljava/lang/Boolean;

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 105
    .line 106
    .line 107
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 108
    return p0

    .line 109
    :goto_1
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 110
    .line 111
    .line 112
    return v0
.end method

.method public static v(Landroid/graphics/Rect;)Z
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/graphics/Rect;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget v0, p0, Landroid/graphics/Rect;->left:I

    .line 10
    .line 11
    if-ltz v0, :cond_0

    .line 12
    .line 13
    iget v0, p0, Landroid/graphics/Rect;->right:I

    .line 14
    .line 15
    if-ltz v0, :cond_0

    .line 16
    .line 17
    iget v0, p0, Landroid/graphics/Rect;->top:I

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    iget p0, p0, Landroid/graphics/Rect;->bottom:I

    .line 22
    .line 23
    if-ltz p0, :cond_0

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static w(ILandroid/graphics/Rect;Landroid/graphics/Rect;)V
    .locals 4

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    neg-int p0, p0

    .line 7
    int-to-float p0, p0

    .line 8
    invoke-virtual {v0, p0}, Landroid/graphics/Matrix;->setRotate(F)V

    .line 9
    .line 10
    .line 11
    new-instance p0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {p0, p1}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 14
    .line 15
    .line 16
    new-instance v1, Landroid/graphics/RectF;

    .line 17
    .line 18
    invoke-direct {v1, p2}, Landroid/graphics/RectF;-><init>(Landroid/graphics/Rect;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 28
    .line 29
    .line 30
    iget v2, p0, Landroid/graphics/RectF;->left:F

    .line 31
    .line 32
    neg-float v2, v2

    .line 33
    iget v3, p0, Landroid/graphics/RectF;->top:F

    .line 34
    .line 35
    neg-float v3, v3

    .line 36
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Matrix;->setTranslate(FF)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p0}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0, v1}, Landroid/graphics/Matrix;->mapRect(Landroid/graphics/RectF;)Z

    .line 43
    .line 44
    .line 45
    iget v0, p0, Landroid/graphics/RectF;->left:F

    .line 46
    .line 47
    float-to-int v0, v0

    .line 48
    iget v2, p0, Landroid/graphics/RectF;->top:F

    .line 49
    .line 50
    float-to-int v2, v2

    .line 51
    iget v3, p0, Landroid/graphics/RectF;->right:F

    .line 52
    .line 53
    float-to-int v3, v3

    .line 54
    iget p0, p0, Landroid/graphics/RectF;->bottom:F

    .line 55
    .line 56
    float-to-int p0, p0

    .line 57
    invoke-virtual {p1, v0, v2, v3, p0}, Landroid/graphics/Rect;->set(IIII)V

    .line 58
    .line 59
    .line 60
    iget p0, v1, Landroid/graphics/RectF;->left:F

    .line 61
    .line 62
    float-to-int p0, p0

    .line 63
    iget p1, v1, Landroid/graphics/RectF;->top:F

    .line 64
    .line 65
    float-to-int p1, p1

    .line 66
    iget v0, v1, Landroid/graphics/RectF;->right:F

    .line 67
    .line 68
    float-to-int v0, v0

    .line 69
    iget v1, v1, Landroid/graphics/RectF;->bottom:F

    .line 70
    .line 71
    float-to-int v1, v1

    .line 72
    invoke-virtual {p2, p0, p1, v0, v1}, Landroid/graphics/Rect;->set(IIII)V

    .line 73
    .line 74
    .line 75
    return-void
.end method
