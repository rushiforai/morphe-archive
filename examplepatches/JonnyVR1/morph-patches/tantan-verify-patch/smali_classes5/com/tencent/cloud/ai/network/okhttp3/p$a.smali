.class public final Lcom/tencent/cloud/ai/network/okhttp3/p$a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/tencent/cloud/ai/network/okhttp3/p;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "a"
.end annotation


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:I

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public g:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public h:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, ""

    .line 5
    .line 6
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 7
    .line 8
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 9
    .line 10
    const/4 v1, -0x1

    .line 11
    iput v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 12
    .line 13
    new-instance v1, Ljava/util/ArrayList;

    .line 14
    .line 15
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 19
    .line 20
    invoke-interface {v1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static a(Ljava/lang/String;II)Ljava/lang/String;
    .locals 1

    const/4 v0, 0x0

    .line 860
    invoke-static {p0, p1, p2, v0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IIZ)Ljava/lang/String;

    move-result-object p0

    .line 861
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public a(I)Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    .locals 1

    if-lez p1, :cond_0

    const v0, 0xffff

    if-gt p1, v0, :cond_0

    .line 858
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    return-object p0

    .line 859
    :cond_0
    const-string p0, "unexpected port: "

    invoke-static {p0, p1}, Ll/za50;->a(Ljava/lang/String;I)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public a(Lcom/tencent/cloud/ai/network/okhttp3/p;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    .locals 23

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
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    const/4 v10, 0x0

    .line 12
    invoke-static {v2, v10, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->b(Ljava/lang/String;II)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    .line 17
    .line 18
    .line 19
    move-result v3

    .line 20
    invoke-static {v2, v4, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c(Ljava/lang/String;II)I

    .line 21
    .line 22
    .line 23
    move-result v11

    .line 24
    sub-int v3, v11, v4

    .line 25
    .line 26
    const/16 v12, 0x3a

    .line 27
    .line 28
    const/4 v13, -0x1

    .line 29
    const/4 v14, 0x1

    .line 30
    const/4 v8, 0x2

    .line 31
    if-ge v3, v8, :cond_0

    .line 32
    .line 33
    goto :goto_2

    .line 34
    :cond_0
    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/16 v5, 0x5a

    .line 39
    .line 40
    const/16 v6, 0x41

    .line 41
    .line 42
    const/16 v7, 0x7a

    .line 43
    .line 44
    const/16 v9, 0x61

    .line 45
    .line 46
    if-lt v3, v9, :cond_1

    .line 47
    .line 48
    if-le v3, v7, :cond_2

    .line 49
    .line 50
    :cond_1
    if-lt v3, v6, :cond_8

    .line 51
    .line 52
    if-le v3, v5, :cond_2

    .line 53
    .line 54
    goto :goto_2

    .line 55
    :cond_2
    move v3, v4

    .line 56
    :goto_0
    add-int/2addr v3, v14

    .line 57
    if-ge v3, v11, :cond_8

    .line 58
    .line 59
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 60
    .line 61
    .line 62
    move-result v15

    .line 63
    if-lt v15, v9, :cond_3

    .line 64
    .line 65
    if-le v15, v7, :cond_7

    .line 66
    .line 67
    :cond_3
    if-lt v15, v6, :cond_4

    .line 68
    .line 69
    if-le v15, v5, :cond_7

    .line 70
    .line 71
    :cond_4
    const/16 v5, 0x30

    .line 72
    .line 73
    if-lt v15, v5, :cond_5

    .line 74
    .line 75
    const/16 v5, 0x39

    .line 76
    .line 77
    if-le v15, v5, :cond_7

    .line 78
    .line 79
    :cond_5
    const/16 v5, 0x2b

    .line 80
    .line 81
    if-eq v15, v5, :cond_7

    .line 82
    .line 83
    const/16 v5, 0x2d

    .line 84
    .line 85
    if-eq v15, v5, :cond_7

    .line 86
    .line 87
    const/16 v5, 0x2e

    .line 88
    .line 89
    if-ne v15, v5, :cond_6

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_6
    if-ne v15, v12, :cond_8

    .line 93
    .line 94
    move v9, v3

    .line 95
    goto :goto_3

    .line 96
    :cond_7
    :goto_1
    const/16 v5, 0x5a

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_8
    :goto_2
    move v9, v13

    .line 100
    :goto_3
    const/4 v15, 0x0

    .line 101
    if-eq v9, v13, :cond_b

    .line 102
    .line 103
    const/4 v6, 0x0

    .line 104
    const/4 v7, 0x6

    .line 105
    const/4 v3, 0x1

    .line 106
    const-string v5, "https:"

    .line 107
    .line 108
    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    if-eqz v3, :cond_9

    .line 113
    .line 114
    const-string v2, "https"

    .line 115
    .line 116
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 117
    .line 118
    add-int/lit8 v4, v4, 0x6

    .line 119
    .line 120
    move-object/from16 v2, p2

    .line 121
    .line 122
    goto :goto_4

    .line 123
    :cond_9
    const/4 v6, 0x0

    .line 124
    const/4 v7, 0x5

    .line 125
    const/4 v3, 0x1

    .line 126
    const-string v5, "http:"

    .line 127
    .line 128
    move-object/from16 v2, p2

    .line 129
    .line 130
    invoke-virtual/range {v2 .. v7}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    .line 131
    .line 132
    .line 133
    move-result v3

    .line 134
    if-eqz v3, :cond_a

    .line 135
    .line 136
    const-string v3, "http"

    .line 137
    .line 138
    iput-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 139
    .line 140
    add-int/lit8 v4, v4, 0x5

    .line 141
    .line 142
    goto :goto_4

    .line 143
    :cond_a
    invoke-virtual {v2, v10, v9}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    const-string v1, "\'"

    .line 148
    .line 149
    const-string v2, "Expected URL scheme \'http\' or \'https\' but was \'"

    .line 150
    .line 151
    invoke-static {v2, v0, v1}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 152
    .line 153
    .line 154
    return-object v15

    .line 155
    :cond_b
    if-eqz v1, :cond_2e

    .line 156
    .line 157
    iget-object v3, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 158
    .line 159
    iput-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 160
    .line 161
    :goto_4
    move v3, v4

    .line 162
    move v5, v10

    .line 163
    :goto_5
    const/16 v6, 0x2f

    .line 164
    .line 165
    const/16 v7, 0x5c

    .line 166
    .line 167
    if-ge v3, v11, :cond_d

    .line 168
    .line 169
    invoke-virtual {v2, v3}, Ljava/lang/String;->charAt(I)C

    .line 170
    .line 171
    .line 172
    move-result v9

    .line 173
    if-eq v9, v7, :cond_c

    .line 174
    .line 175
    if-ne v9, v6, :cond_d

    .line 176
    .line 177
    :cond_c
    add-int/lit8 v5, v5, 0x1

    .line 178
    .line 179
    add-int/lit8 v3, v3, 0x1

    .line 180
    .line 181
    goto :goto_5

    .line 182
    :cond_d
    const/16 v3, 0x3f

    .line 183
    .line 184
    const/16 v9, 0x23

    .line 185
    .line 186
    if-ge v5, v8, :cond_11

    .line 187
    .line 188
    if-eqz v1, :cond_11

    .line 189
    .line 190
    iget-object v8, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->a:Ljava/lang/String;

    .line 191
    .line 192
    iget-object v10, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v8, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v8

    .line 198
    if-nez v8, :cond_e

    .line 199
    .line 200
    goto :goto_6

    .line 201
    :cond_e
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->e()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v5

    .line 211
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 212
    .line 213
    iget-object v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->d:Ljava/lang/String;

    .line 214
    .line 215
    iput-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 216
    .line 217
    iget v5, v1, Lcom/tencent/cloud/ai/network/okhttp3/p;->e:I

    .line 218
    .line 219
    iput v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 220
    .line 221
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 222
    .line 223
    invoke-interface {v5}, Ljava/util/List;->clear()V

    .line 224
    .line 225
    .line 226
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 227
    .line 228
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->c()Ljava/util/List;

    .line 229
    .line 230
    .line 231
    move-result-object v8

    .line 232
    invoke-interface {v5, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 233
    .line 234
    .line 235
    if-eq v4, v11, :cond_f

    .line 236
    .line 237
    invoke-virtual {v2, v4}, Ljava/lang/String;->charAt(I)C

    .line 238
    .line 239
    .line 240
    move-result v5

    .line 241
    if-ne v5, v9, :cond_10

    .line 242
    .line 243
    :cond_f
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->d()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;

    .line 248
    .line 249
    .line 250
    :cond_10
    move-object v1, v2

    .line 251
    move/from16 v22, v14

    .line 252
    .line 253
    goto/16 :goto_10

    .line 254
    .line 255
    :cond_11
    :goto_6
    add-int/2addr v4, v5

    .line 256
    const/4 v10, 0x0

    .line 257
    const/16 v16, 0x0

    .line 258
    .line 259
    :goto_7
    const-string v1, "@/\\?#"

    .line 260
    .line 261
    invoke-static {v2, v4, v11, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    if-eq v1, v11, :cond_12

    .line 266
    .line 267
    invoke-virtual {v2, v1}, Ljava/lang/String;->charAt(I)C

    .line 268
    .line 269
    .line 270
    move-result v5

    .line 271
    goto :goto_8

    .line 272
    :cond_12
    move v5, v13

    .line 273
    :goto_8
    if-eq v5, v13, :cond_17

    .line 274
    .line 275
    if-eq v5, v9, :cond_17

    .line 276
    .line 277
    if-eq v5, v6, :cond_17

    .line 278
    .line 279
    if-eq v5, v7, :cond_17

    .line 280
    .line 281
    if-eq v5, v3, :cond_17

    .line 282
    .line 283
    const/16 v8, 0x40

    .line 284
    .line 285
    if-eq v5, v8, :cond_13

    .line 286
    .line 287
    goto :goto_7

    .line 288
    :cond_13
    const-string v5, "%40"

    .line 289
    .line 290
    if-nez v10, :cond_16

    .line 291
    .line 292
    move v8, v3

    .line 293
    invoke-static {v2, v4, v1, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 294
    .line 295
    .line 296
    move-result v3

    .line 297
    move/from16 v17, v8

    .line 298
    .line 299
    const/4 v8, 0x1

    .line 300
    move/from16 v18, v9

    .line 301
    .line 302
    const/4 v9, 0x0

    .line 303
    move v2, v4

    .line 304
    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    .line 305
    .line 306
    move-object/from16 v19, v5

    .line 307
    .line 308
    const/4 v5, 0x1

    .line 309
    move/from16 v20, v6

    .line 310
    .line 311
    const/4 v6, 0x0

    .line 312
    move/from16 v21, v7

    .line 313
    .line 314
    const/4 v7, 0x0

    .line 315
    move/from16 v22, v14

    .line 316
    .line 317
    move-object/from16 v17, v15

    .line 318
    .line 319
    move-object/from16 v15, v19

    .line 320
    .line 321
    move v14, v1

    .line 322
    move-object/from16 v1, p2

    .line 323
    .line 324
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object v2

    .line 328
    if-eqz v16, :cond_14

    .line 329
    .line 330
    new-instance v1, Ljava/lang/StringBuilder;

    .line 331
    .line 332
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 333
    .line 334
    .line 335
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 341
    .line 342
    .line 343
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 344
    .line 345
    .line 346
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    :cond_14
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 351
    .line 352
    if-eq v3, v14, :cond_15

    .line 353
    .line 354
    add-int/lit8 v2, v3, 0x1

    .line 355
    .line 356
    const/4 v8, 0x1

    .line 357
    const/4 v9, 0x0

    .line 358
    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    .line 359
    .line 360
    const/4 v5, 0x1

    .line 361
    const/4 v6, 0x0

    .line 362
    const/4 v7, 0x0

    .line 363
    move-object/from16 v1, p2

    .line 364
    .line 365
    move v3, v14

    .line 366
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v2

    .line 370
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 371
    .line 372
    move/from16 v10, v22

    .line 373
    .line 374
    goto :goto_9

    .line 375
    :cond_15
    move v3, v14

    .line 376
    :goto_9
    move-object/from16 v1, p2

    .line 377
    .line 378
    move/from16 v16, v22

    .line 379
    .line 380
    goto :goto_a

    .line 381
    :cond_16
    move v3, v1

    .line 382
    move v2, v4

    .line 383
    move/from16 v22, v14

    .line 384
    .line 385
    move-object/from16 v17, v15

    .line 386
    .line 387
    move-object v15, v5

    .line 388
    new-instance v14, Ljava/lang/StringBuilder;

    .line 389
    .line 390
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 391
    .line 392
    .line 393
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 394
    .line 395
    invoke-virtual {v14, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 396
    .line 397
    .line 398
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 399
    .line 400
    .line 401
    const/4 v8, 0x1

    .line 402
    const/4 v9, 0x0

    .line 403
    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    .line 404
    .line 405
    const/4 v5, 0x1

    .line 406
    const/4 v6, 0x0

    .line 407
    const/4 v7, 0x0

    .line 408
    move-object/from16 v1, p2

    .line 409
    .line 410
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object v2

    .line 414
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v2

    .line 421
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 422
    .line 423
    :goto_a
    add-int/lit8 v4, v3, 0x1

    .line 424
    .line 425
    move-object v2, v1

    .line 426
    move-object/from16 v15, v17

    .line 427
    .line 428
    move/from16 v14, v22

    .line 429
    .line 430
    const/16 v3, 0x3f

    .line 431
    .line 432
    const/16 v6, 0x2f

    .line 433
    .line 434
    const/16 v7, 0x5c

    .line 435
    .line 436
    const/16 v9, 0x23

    .line 437
    .line 438
    goto/16 :goto_7

    .line 439
    .line 440
    :cond_17
    move v3, v1

    .line 441
    move-object v1, v2

    .line 442
    move v10, v4

    .line 443
    move/from16 v22, v14

    .line 444
    .line 445
    move-object/from16 v17, v15

    .line 446
    .line 447
    move v4, v10

    .line 448
    :goto_b
    if-ge v4, v3, :cond_1b

    .line 449
    .line 450
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 451
    .line 452
    .line 453
    move-result v2

    .line 454
    if-eq v2, v12, :cond_1a

    .line 455
    .line 456
    const/16 v5, 0x5b

    .line 457
    .line 458
    if-eq v2, v5, :cond_18

    .line 459
    .line 460
    goto :goto_c

    .line 461
    :cond_18
    add-int/lit8 v4, v4, 0x1

    .line 462
    .line 463
    if-ge v4, v3, :cond_19

    .line 464
    .line 465
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 466
    .line 467
    .line 468
    move-result v2

    .line 469
    const/16 v5, 0x5d

    .line 470
    .line 471
    if-ne v2, v5, :cond_18

    .line 472
    .line 473
    :cond_19
    :goto_c
    add-int/lit8 v4, v4, 0x1

    .line 474
    .line 475
    goto :goto_b

    .line 476
    :cond_1a
    move v12, v4

    .line 477
    goto :goto_d

    .line 478
    :cond_1b
    move v12, v3

    .line 479
    :goto_d
    add-int/lit8 v2, v12, 0x1

    .line 480
    .line 481
    const/16 v14, 0x22

    .line 482
    .line 483
    if-ge v2, v3, :cond_1e

    .line 484
    .line 485
    invoke-static {v1, v10, v12}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Ljava/lang/String;II)Ljava/lang/String;

    .line 486
    .line 487
    .line 488
    move-result-object v4

    .line 489
    iput-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 490
    .line 491
    :try_start_0
    const-string v4, ""

    .line 492
    .line 493
    const/4 v8, 0x1

    .line 494
    const/4 v9, 0x0

    .line 495
    const/4 v5, 0x0

    .line 496
    const/4 v6, 0x0

    .line 497
    const/4 v7, 0x0

    .line 498
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v4

    .line 502
    invoke-static {v4}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 503
    .line 504
    .line 505
    move-result v4
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    .line 506
    if-lez v4, :cond_1c

    .line 507
    .line 508
    const v5, 0xffff

    .line 509
    .line 510
    .line 511
    if-gt v4, v5, :cond_1c

    .line 512
    .line 513
    goto :goto_e

    .line 514
    :catch_0
    :cond_1c
    move v4, v13

    .line 515
    :goto_e
    iput v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 516
    .line 517
    if-eq v4, v13, :cond_1d

    .line 518
    .line 519
    goto :goto_f

    .line 520
    :cond_1d
    const-string v0, "Invalid URL port: \""

    .line 521
    .line 522
    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v1

    .line 526
    invoke-static {v0, v1, v14}, Ll/qnl;->a(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 527
    .line 528
    .line 529
    return-object v17

    .line 530
    :cond_1e
    invoke-static {v1, v10, v12}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Ljava/lang/String;II)Ljava/lang/String;

    .line 531
    .line 532
    .line 533
    move-result-object v2

    .line 534
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 535
    .line 536
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 537
    .line 538
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    .line 539
    .line 540
    .line 541
    move-result v2

    .line 542
    iput v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 543
    .line 544
    :goto_f
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 545
    .line 546
    if-eqz v2, :cond_2d

    .line 547
    .line 548
    move v4, v3

    .line 549
    :goto_10
    const-string v2, "?#"

    .line 550
    .line 551
    invoke-static {v1, v4, v11, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    .line 552
    .line 553
    .line 554
    move-result v10

    .line 555
    if-ne v4, v10, :cond_1f

    .line 556
    .line 557
    goto/16 :goto_18

    .line 558
    .line 559
    :cond_1f
    invoke-virtual {v1, v4}, Ljava/lang/String;->charAt(I)C

    .line 560
    .line 561
    .line 562
    move-result v2

    .line 563
    const-string v12, ""

    .line 564
    .line 565
    const/16 v3, 0x2f

    .line 566
    .line 567
    if-eq v2, v3, :cond_21

    .line 568
    .line 569
    const/16 v3, 0x5c

    .line 570
    .line 571
    if-ne v2, v3, :cond_20

    .line 572
    .line 573
    goto :goto_12

    .line 574
    :cond_20
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 575
    .line 576
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 577
    .line 578
    .line 579
    move-result v3

    .line 580
    add-int/lit8 v3, v3, -0x1

    .line 581
    .line 582
    invoke-interface {v2, v3, v12}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 583
    .line 584
    .line 585
    :goto_11
    move v2, v4

    .line 586
    goto :goto_13

    .line 587
    :cond_21
    :goto_12
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 588
    .line 589
    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 590
    .line 591
    .line 592
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 593
    .line 594
    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 595
    .line 596
    .line 597
    add-int/lit8 v4, v4, 0x1

    .line 598
    .line 599
    goto :goto_11

    .line 600
    :goto_13
    if-ge v2, v10, :cond_2a

    .line 601
    .line 602
    const-string v3, "/\\"

    .line 603
    .line 604
    invoke-static {v1, v2, v10, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IILjava/lang/String;)I

    .line 605
    .line 606
    .line 607
    move-result v3

    .line 608
    if-ge v3, v10, :cond_22

    .line 609
    .line 610
    move/from16 v13, v22

    .line 611
    .line 612
    goto :goto_14

    .line 613
    :cond_22
    const/4 v13, 0x0

    .line 614
    :goto_14
    const/4 v8, 0x1

    .line 615
    const/4 v9, 0x0

    .line 616
    const-string v4, " \"<>^`{}|/\\?#"

    .line 617
    .line 618
    const/4 v5, 0x1

    .line 619
    const/4 v6, 0x0

    .line 620
    const/4 v7, 0x0

    .line 621
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 622
    .line 623
    .line 624
    move-result-object v2

    .line 625
    const-string v4, "."

    .line 626
    .line 627
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 628
    .line 629
    .line 630
    move-result v4

    .line 631
    if-nez v4, :cond_28

    .line 632
    .line 633
    const-string v4, "%2e"

    .line 634
    .line 635
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 636
    .line 637
    .line 638
    move-result v4

    .line 639
    if-eqz v4, :cond_23

    .line 640
    .line 641
    goto/16 :goto_17

    .line 642
    .line 643
    :cond_23
    const-string v4, ".."

    .line 644
    .line 645
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 646
    .line 647
    .line 648
    move-result v4

    .line 649
    if-nez v4, :cond_26

    .line 650
    .line 651
    const-string v4, "%2e."

    .line 652
    .line 653
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 654
    .line 655
    .line 656
    move-result v4

    .line 657
    if-nez v4, :cond_26

    .line 658
    .line 659
    const-string v4, ".%2e"

    .line 660
    .line 661
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 662
    .line 663
    .line 664
    move-result v4

    .line 665
    if-nez v4, :cond_26

    .line 666
    .line 667
    const-string v4, "%2e%2e"

    .line 668
    .line 669
    invoke-virtual {v2, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 670
    .line 671
    .line 672
    move-result v4

    .line 673
    if-eqz v4, :cond_24

    .line 674
    .line 675
    goto :goto_16

    .line 676
    :cond_24
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 677
    .line 678
    invoke-interface {v4}, Ljava/util/List;->size()I

    .line 679
    .line 680
    .line 681
    move-result v5

    .line 682
    add-int/lit8 v5, v5, -0x1

    .line 683
    .line 684
    invoke-interface {v4, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 685
    .line 686
    .line 687
    move-result-object v4

    .line 688
    check-cast v4, Ljava/lang/String;

    .line 689
    .line 690
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    .line 691
    .line 692
    .line 693
    move-result v4

    .line 694
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 695
    .line 696
    if-eqz v4, :cond_25

    .line 697
    .line 698
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 699
    .line 700
    .line 701
    move-result v4

    .line 702
    add-int/lit8 v4, v4, -0x1

    .line 703
    .line 704
    invoke-interface {v5, v4, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 705
    .line 706
    .line 707
    goto :goto_15

    .line 708
    :cond_25
    invoke-interface {v5, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 709
    .line 710
    .line 711
    :goto_15
    if-eqz v13, :cond_28

    .line 712
    .line 713
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 714
    .line 715
    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 716
    .line 717
    .line 718
    goto :goto_17

    .line 719
    :cond_26
    :goto_16
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 720
    .line 721
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 722
    .line 723
    .line 724
    move-result v4

    .line 725
    add-int/lit8 v4, v4, -0x1

    .line 726
    .line 727
    invoke-interface {v2, v4}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 728
    .line 729
    .line 730
    move-result-object v2

    .line 731
    check-cast v2, Ljava/lang/String;

    .line 732
    .line 733
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 734
    .line 735
    .line 736
    move-result v2

    .line 737
    if-eqz v2, :cond_27

    .line 738
    .line 739
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 740
    .line 741
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    .line 742
    .line 743
    .line 744
    move-result v2

    .line 745
    if-nez v2, :cond_27

    .line 746
    .line 747
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 748
    .line 749
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 750
    .line 751
    .line 752
    move-result v4

    .line 753
    add-int/lit8 v4, v4, -0x1

    .line 754
    .line 755
    invoke-interface {v2, v4, v12}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 756
    .line 757
    .line 758
    goto :goto_17

    .line 759
    :cond_27
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 760
    .line 761
    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 762
    .line 763
    .line 764
    :cond_28
    :goto_17
    if-eqz v13, :cond_29

    .line 765
    .line 766
    add-int/lit8 v3, v3, 0x1

    .line 767
    .line 768
    :cond_29
    move v2, v3

    .line 769
    goto/16 :goto_13

    .line 770
    .line 771
    :cond_2a
    :goto_18
    if-ge v10, v11, :cond_2b

    .line 772
    .line 773
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 774
    .line 775
    .line 776
    move-result v2

    .line 777
    const/16 v8, 0x3f

    .line 778
    .line 779
    if-ne v2, v8, :cond_2b

    .line 780
    .line 781
    const/16 v12, 0x23

    .line 782
    .line 783
    invoke-static {v1, v10, v11, v12}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;IIC)I

    .line 784
    .line 785
    .line 786
    move-result v3

    .line 787
    add-int/lit8 v2, v10, 0x1

    .line 788
    .line 789
    const/4 v8, 0x1

    .line 790
    const/4 v9, 0x0

    .line 791
    const-string v4, " \"\'<>#"

    .line 792
    .line 793
    const/4 v5, 0x1

    .line 794
    const/4 v6, 0x0

    .line 795
    const/4 v7, 0x1

    .line 796
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 797
    .line 798
    .line 799
    move-result-object v2

    .line 800
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/p;->b(Ljava/lang/String;)Ljava/util/List;

    .line 801
    .line 802
    .line 803
    move-result-object v2

    .line 804
    iput-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 805
    .line 806
    move v10, v3

    .line 807
    goto :goto_19

    .line 808
    :cond_2b
    const/16 v12, 0x23

    .line 809
    .line 810
    :goto_19
    if-ge v10, v11, :cond_2c

    .line 811
    .line 812
    invoke-virtual {v1, v10}, Ljava/lang/String;->charAt(I)C

    .line 813
    .line 814
    .line 815
    move-result v2

    .line 816
    if-ne v2, v12, :cond_2c

    .line 817
    .line 818
    add-int/lit8 v2, v10, 0x1

    .line 819
    .line 820
    const/4 v8, 0x0

    .line 821
    const/4 v9, 0x0

    .line 822
    const-string v4, ""

    .line 823
    .line 824
    const/4 v5, 0x1

    .line 825
    const/4 v6, 0x0

    .line 826
    const/4 v7, 0x0

    .line 827
    move v3, v11

    .line 828
    invoke-static/range {v1 .. v9}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    .line 829
    .line 830
    .line 831
    move-result-object v1

    .line 832
    iput-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 833
    .line 834
    :cond_2c
    return-object v0

    .line 835
    :cond_2d
    const-string v0, "Invalid URL host: \""

    .line 836
    .line 837
    invoke-virtual {v1, v10, v12}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 838
    .line 839
    .line 840
    move-result-object v1

    .line 841
    invoke-static {v0, v1, v14}, Ll/qnl;->a(Ljava/lang/String;Ljava/lang/Object;I)V

    .line 842
    .line 843
    .line 844
    return-object v17

    .line 845
    :cond_2e
    move-object/from16 v17, v15

    .line 846
    .line 847
    const-string v0, "Expected URL scheme \'http\' or \'https\' but no colon was found"

    .line 848
    .line 849
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 850
    .line 851
    .line 852
    return-object v17
.end method

.method public a(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    .locals 9

    if-eqz p1, :cond_0

    .line 862
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v1, 0x0

    const/4 v8, 0x0

    .line 863
    const-string v3, " \"\'<>#"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v8}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;IILjava/lang/String;ZZZZLjava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object p1

    .line 864
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->b(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 865
    :goto_0
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    return-object p0
.end method

.method public a()Lcom/tencent/cloud/ai/network/okhttp3/p;
    .locals 1

    .line 853
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    if-eqz v0, :cond_1

    .line 854
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    if-eqz v0, :cond_0

    .line 855
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/p;

    invoke-direct {v0, p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/p$a;)V

    return-object v0

    .line 856
    :cond_0
    const-string p0, "host == null"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    :goto_0
    const/4 p0, 0x0

    return-object p0

    .line 857
    :cond_1
    const-string p0, "scheme == null"

    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    goto :goto_0
.end method

.method public b()I
    .locals 2

    .line 34
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public b(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p1, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a(Ljava/lang/String;II)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 16
    .line 17
    return-object p0

    .line 18
    :cond_0
    const-string p0, "unexpected host: "

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-object v0

    .line 28
    :cond_1
    const-string p0, "host == null"

    .line 29
    .line 30
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-object v0
.end method

.method public c(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/p$a;
    .locals 2

    .line 1
    const-string v0, "http"

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-string v0, "https"

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 21
    .line 22
    return-object p0

    .line 23
    :cond_1
    const-string p0, "unexpected scheme: "

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .locals 5

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 7
    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, "://"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    const-string v1, "//"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/16 v2, 0x3a

    .line 31
    .line 32
    if-eqz v1, :cond_1

    .line 33
    .line 34
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v1

    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    :cond_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->b:Ljava/lang/String;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->c:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    :cond_2
    const/16 v1, 0x40

    .line 64
    .line 65
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    :cond_3
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 69
    .line 70
    const/4 v3, -0x1

    .line 71
    if-eqz v1, :cond_5

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(I)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    if-eq v1, v3, :cond_4

    .line 78
    .line 79
    const/16 v1, 0x5b

    .line 80
    .line 81
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    const/16 v1, 0x5d

    .line 90
    .line 91
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    goto :goto_1

    .line 95
    :cond_4
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->d:Ljava/lang/String;

    .line 96
    .line 97
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    :cond_5
    :goto_1
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->e:I

    .line 101
    .line 102
    if-ne v1, v3, :cond_6

    .line 103
    .line 104
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v4, :cond_9

    .line 107
    .line 108
    :cond_6
    if-eq v1, v3, :cond_7

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_7
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 112
    .line 113
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v1

    .line 117
    :goto_2
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->a:Ljava/lang/String;

    .line 118
    .line 119
    if-eqz v3, :cond_8

    .line 120
    .line 121
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v3

    .line 125
    if-eq v1, v3, :cond_9

    .line 126
    .line 127
    :cond_8
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 131
    .line 132
    .line 133
    :cond_9
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->f:Ljava/util/List;

    .line 134
    .line 135
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 136
    .line 137
    .line 138
    move-result v2

    .line 139
    const/4 v3, 0x0

    .line 140
    :goto_3
    if-ge v3, v2, :cond_a

    .line 141
    .line 142
    const/16 v4, 0x2f

    .line 143
    .line 144
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v4

    .line 151
    check-cast v4, Ljava/lang/String;

    .line 152
    .line 153
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    add-int/lit8 v3, v3, 0x1

    .line 157
    .line 158
    goto :goto_3

    .line 159
    :cond_a
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 160
    .line 161
    if-eqz v1, :cond_b

    .line 162
    .line 163
    const/16 v1, 0x3f

    .line 164
    .line 165
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->g:Ljava/util/List;

    .line 169
    .line 170
    invoke-static {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 171
    .line 172
    .line 173
    :cond_b
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz v1, :cond_c

    .line 176
    .line 177
    const/16 v1, 0x23

    .line 178
    .line 179
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/p$a;->h:Ljava/lang/String;

    .line 183
    .line 184
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    :cond_c
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    return-object p0
.end method
