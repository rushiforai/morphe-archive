.class Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public getDataClass()Ljava/lang/Class;
    .locals 0

    .line 1
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;",
            "Ljava/lang/String;",
            "Lcom/fasterxml/jackson/core/JsonParser;",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tantanapp/common/data/BaseData;",
            ">;",
            "Lcom/tantanapp/common/data/DataChecker;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x1

    .line 10
    const/4 v2, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "boldText"

    .line 17
    .line 18
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    if-nez p0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v2, 0x10

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "stretchRange"

    .line 31
    .line 32
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-nez p0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v2, 0xf

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "templateId"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    if-nez p0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v2, 0xe

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "animationUrl"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-nez p0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v2, 0xd

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "content"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v2, 0xc

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "giftIcon"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v2, 0xb

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "position"

    .line 101
    .line 102
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result p0

    .line 106
    if-nez p0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v2, 0xa

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "maxCount"

    .line 115
    .line 116
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result p0

    .line 120
    if-nez p0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v2, 0x9

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "fontSize"

    .line 129
    .line 130
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    if-nez p0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v2, 0x8

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "version"

    .line 143
    .line 144
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result p0

    .line 148
    if-nez p0, :cond_9

    .line 149
    .line 150
    goto :goto_0

    .line 151
    :cond_9
    const/4 v2, 0x7

    .line 152
    goto :goto_0

    .line 153
    :sswitch_a
    const-string p0, "color"

    .line 154
    .line 155
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_a

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_a
    const/4 v2, 0x6

    .line 163
    goto :goto_0

    .line 164
    :sswitch_b
    const-string p0, "category"

    .line 165
    .line 166
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    if-nez p0, :cond_b

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_b
    const/4 v2, 0x5

    .line 174
    goto :goto_0

    .line 175
    :sswitch_c
    const-string p0, "type"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-nez p0, :cond_c

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_c
    const/4 v2, 0x4

    .line 185
    goto :goto_0

    .line 186
    :sswitch_d
    const-string p0, "url"

    .line 187
    .line 188
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-nez p0, :cond_d

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_d
    const/4 v2, 0x3

    .line 196
    goto :goto_0

    .line 197
    :sswitch_e
    const-string p0, "id"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-nez p0, :cond_e

    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_e
    const/4 v2, 0x2

    .line 207
    goto :goto_0

    .line 208
    :sswitch_f
    const-string p0, "contentArea"

    .line 209
    .line 210
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    if-nez p0, :cond_f

    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_f
    move v2, v1

    .line 218
    goto :goto_0

    .line 219
    :sswitch_10
    const-string p0, "giftId"

    .line 220
    .line 221
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-nez p0, :cond_10

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_10
    move v2, v0

    .line 229
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 230
    .line 231
    .line 232
    return v0

    .line 233
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 238
    .line 239
    return v1

    .line 240
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 241
    .line 242
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 247
    .line 248
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 249
    .line 250
    return v1

    .line 251
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 256
    .line 257
    return v1

    .line 258
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 263
    .line 264
    return v1

    .line 265
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 270
    .line 271
    return v1

    .line 272
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 277
    .line 278
    return v1

    .line 279
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 280
    .line 281
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 286
    .line 287
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 288
    .line 289
    return v1

    .line 290
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 291
    .line 292
    .line 293
    move-result p0

    .line 294
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 295
    .line 296
    return v1

    .line 297
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 302
    .line 303
    return v1

    .line 304
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 305
    .line 306
    .line 307
    move-result-wide p2

    .line 308
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 309
    .line 310
    return v1

    .line 311
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 316
    .line 317
    return v1

    .line 318
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 323
    .line 324
    return v1

    .line 325
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 330
    .line 331
    return v1

    .line 332
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 337
    .line 338
    return v1

    .line 339
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 344
    .line 345
    return v0

    .line 346
    :pswitch_f
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    .line 348
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 353
    .line 354
    return v1

    .line 355
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 360
    .line 361
    return v1

    .line 362
    nop

    .line 363
    :sswitch_data_0
    .sparse-switch
        -0x4a451995 -> :sswitch_10
        -0x173a6b5a -> :sswitch_f
        0xd1b -> :sswitch_e
        0x1c56f -> :sswitch_d
        0x368f3a -> :sswitch_c
        0x302bcfe -> :sswitch_b
        0x5a72f63 -> :sswitch_a
        0x14f51cd8 -> :sswitch_9
        0x15caa0f0 -> :sswitch_8
        0x16c67a0b -> :sswitch_7
        0x2c929929 -> :sswitch_6
        0x329b01c9 -> :sswitch_5
        0x38b73479 -> :sswitch_4
        0x45f8534b -> :sswitch_3
        0x4db99f35 -> :sswitch_2
        0x715cfd38 -> :sswitch_1
        0x71fb2952 -> :sswitch_0
    .end sparse-switch

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    .line 375
    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseField(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 363
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->content:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "content"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->id:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "id"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 20
    .line 21
    const/4 v0, 0x1

    .line 22
    if-eqz p0, :cond_2

    .line 23
    .line 24
    const-string p0, "position"

    .line 25
    .line 26
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 30
    .line 31
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->position:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 32
    .line 33
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 34
    .line 35
    .line 36
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->templateId:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string v1, "templateId"

    .line 41
    .line 42
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->type:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "type"

    .line 50
    .line 51
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    const-string p0, "version"

    .line 55
    .line 56
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->version:J

    .line 57
    .line 58
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->category:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string v1, "category"

    .line 66
    .line 67
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->url:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const-string v1, "url"

    .line 75
    .line 76
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->animationUrl:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    const-string v1, "animationUrl"

    .line 84
    .line 85
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_7
    const-string p0, "maxCount"

    .line 89
    .line 90
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->maxCount:I

    .line 91
    .line 92
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 93
    .line 94
    .line 95
    const-string p0, "fontSize"

    .line 96
    .line 97
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->fontSize:I

    .line 98
    .line 99
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->color:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p0, :cond_8

    .line 105
    .line 106
    const-string v1, "color"

    .line 107
    .line 108
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_8
    const-string p0, "boldText"

    .line 112
    .line 113
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->boldText:Z

    .line 114
    .line 115
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 116
    .line 117
    .line 118
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftId:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    const-string v1, "giftId"

    .line 123
    .line 124
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->giftIcon:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const-string v1, "giftIcon"

    .line 132
    .line 133
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 137
    .line 138
    if-eqz p0, :cond_b

    .line 139
    .line 140
    const-string p0, "stretchRange"

    .line 141
    .line 142
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 146
    .line 147
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 148
    .line 149
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 150
    .line 151
    .line 152
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 153
    .line 154
    if-eqz p0, :cond_c

    .line 155
    .line 156
    const-string p0, "contentArea"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;->contentArea:Ljava/util/List;

    .line 162
    .line 163
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 164
    .line 165
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 166
    .line 167
    .line 168
    :cond_c
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 169
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveAddStickerResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
