.class Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;",
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
    const/16 v2, 0x14

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
    const/16 v2, 0x13

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "animationUrl"

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
    const/16 v2, 0x12

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "fontSize"

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
    const/16 v2, 0x11

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "version"

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
    const/16 v2, 0x10

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "color"

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
    const/16 v2, 0xf

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "category"

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
    const/16 v2, 0xe

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "giftCfg"

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
    const/16 v2, 0xd

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "rank"

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
    const/16 v2, 0xc

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "name"

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
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v2, 0xb

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "url"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result p0

    .line 162
    if-nez p0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v2, 0xa

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "id"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result p0

    .line 176
    if-nez p0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v2, 0x9

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "contentArea"

    .line 185
    .line 186
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result p0

    .line 190
    if-nez p0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v2, 0x8

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "createdTime"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result p0

    .line 204
    if-nez p0, :cond_d

    .line 205
    .line 206
    goto :goto_0

    .line 207
    :cond_d
    const/4 v2, 0x7

    .line 208
    goto :goto_0

    .line 209
    :sswitch_e
    const-string p0, "maxWordCount"

    .line 210
    .line 211
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result p0

    .line 215
    if-nez p0, :cond_e

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_e
    const/4 v2, 0x6

    .line 219
    goto :goto_0

    .line 220
    :sswitch_f
    const-string p0, "updatedTime"

    .line 221
    .line 222
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p0

    .line 226
    if-nez p0, :cond_f

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_f
    const/4 v2, 0x5

    .line 230
    goto :goto_0

    .line 231
    :sswitch_10
    const-string p0, "status"

    .line 232
    .line 233
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    if-nez p0, :cond_10

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_10
    const/4 v2, 0x4

    .line 241
    goto :goto_0

    .line 242
    :sswitch_11
    const-string p0, "defaultContent"

    .line 243
    .line 244
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result p0

    .line 248
    if-nez p0, :cond_11

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_11
    const/4 v2, 0x3

    .line 252
    goto :goto_0

    .line 253
    :sswitch_12
    const-string p0, "defaultPosition"

    .line 254
    .line 255
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result p0

    .line 259
    if-nez p0, :cond_12

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_12
    const/4 v2, 0x2

    .line 263
    goto :goto_0

    .line 264
    :sswitch_13
    const-string p0, "adminUserName"

    .line 265
    .line 266
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result p0

    .line 270
    if-nez p0, :cond_13

    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_13
    move v2, v1

    .line 274
    goto :goto_0

    .line 275
    :sswitch_14
    const-string p0, "clickable"

    .line 276
    .line 277
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result p0

    .line 281
    if-nez p0, :cond_14

    .line 282
    .line 283
    goto :goto_0

    .line 284
    :cond_14
    move v2, v0

    .line 285
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 286
    .line 287
    .line 288
    return v0

    .line 289
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 290
    .line 291
    .line 292
    move-result p0

    .line 293
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 297
    .line 298
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 303
    .line 304
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 305
    .line 306
    return v1

    .line 307
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 312
    .line 313
    return v1

    .line 314
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 322
    .line 323
    .line 324
    move-result-wide p2

    .line 325
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 326
    .line 327
    return v1

    .line 328
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 333
    .line 334
    return v1

    .line 335
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 340
    .line 341
    return v1

    .line 342
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 343
    .line 344
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 349
    .line 350
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 351
    .line 352
    return v1

    .line 353
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 354
    .line 355
    .line 356
    move-result p0

    .line 357
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 358
    .line 359
    return v1

    .line 360
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 365
    .line 366
    return v1

    .line 367
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object p0

    .line 371
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 372
    .line 373
    return v1

    .line 374
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 379
    .line 380
    return v0

    .line 381
    :pswitch_c
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 382
    .line 383
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 388
    .line 389
    return v1

    .line 390
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 391
    .line 392
    .line 393
    move-result-wide p2

    .line 394
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 395
    .line 396
    return v1

    .line 397
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 398
    .line 399
    .line 400
    move-result p0

    .line 401
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 402
    .line 403
    return v1

    .line 404
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 405
    .line 406
    .line 407
    move-result-wide p2

    .line 408
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 409
    .line 410
    return v1

    .line 411
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object p0

    .line 415
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 416
    .line 417
    return v1

    .line 418
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 419
    .line 420
    .line 421
    move-result-object p0

    .line 422
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 423
    .line 424
    return v1

    .line 425
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 426
    .line 427
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 428
    .line 429
    .line 430
    move-result-object p0

    .line 431
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 432
    .line 433
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 434
    .line 435
    return v1

    .line 436
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 441
    .line 442
    return v1

    .line 443
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 444
    .line 445
    .line 446
    move-result p0

    .line 447
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 448
    .line 449
    return v1

    .line 450
    nop

    .line 451
    :sswitch_data_0
    .sparse-switch
        -0x751aa91e -> :sswitch_14
        -0x5e195a9b -> :sswitch_13
        -0x5c54fd76 -> :sswitch_12
        -0x4fd46508 -> :sswitch_11
        -0x3532300e -> :sswitch_10
        -0x21f62dd8 -> :sswitch_f
        -0x215444df -> :sswitch_e
        -0x1d336e2b -> :sswitch_d
        -0x173a6b5a -> :sswitch_c
        0xd1b -> :sswitch_b
        0x1c56f -> :sswitch_a
        0x337a8b -> :sswitch_9
        0x354c2c -> :sswitch_8
        0x1a1d114 -> :sswitch_7
        0x302bcfe -> :sswitch_6
        0x5a72f63 -> :sswitch_5
        0x14f51cd8 -> :sswitch_4
        0x15caa0f0 -> :sswitch_3
        0x45f8534b -> :sswitch_2
        0x715cfd38 -> :sswitch_1
        0x71fb2952 -> :sswitch_0
    .end sparse-switch

    .line 452
    .line 453
    .line 454
    .line 455
    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    .line 496
    .line 497
    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    .line 503
    .line 504
    .line 505
    .line 506
    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    .line 512
    .line 513
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    .line 521
    .line 522
    .line 523
    .line 524
    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    .line 530
    .line 531
    .line 532
    .line 533
    .line 534
    .line 535
    .line 536
    .line 537
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
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

    .line 451
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->id:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "id"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->category:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "category"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->url:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "url"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->animationUrl:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "animationUrl"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    const-string p0, "maxWordCount"

    .line 47
    .line 48
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->maxWordCount:I

    .line 49
    .line 50
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultContent:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const-string v0, "defaultContent"

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    const-string p0, "rank"

    .line 63
    .line 64
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->rank:I

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 67
    .line 68
    .line 69
    const-string p0, "clickable"

    .line 70
    .line 71
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->clickable:Z

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 74
    .line 75
    .line 76
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 77
    .line 78
    const/4 v0, 0x1

    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const-string p0, "defaultPosition"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePosition;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    .line 88
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->defaultPosition:Lcom/p1/mobile/putong/live/base/data/BLivePosition;

    .line 89
    .line 90
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 91
    .line 92
    .line 93
    :cond_6
    const-string p0, "version"

    .line 94
    .line 95
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->version:J

    .line 96
    .line 97
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 98
    .line 99
    .line 100
    const-string p0, "createdTime"

    .line 101
    .line 102
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->createdTime:J

    .line 103
    .line 104
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 105
    .line 106
    .line 107
    const-string p0, "updatedTime"

    .line 108
    .line 109
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->updatedTime:J

    .line 110
    .line 111
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->status:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string v1, "status"

    .line 119
    .line 120
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->adminUserName:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string v1, "adminUserName"

    .line 128
    .line 129
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_8
    const-string p0, "fontSize"

    .line 133
    .line 134
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->fontSize:I

    .line 135
    .line 136
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->color:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const-string v1, "color"

    .line 144
    .line 145
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    :cond_9
    const-string p0, "boldText"

    .line 149
    .line 150
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->boldText:Z

    .line 151
    .line 152
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string p0, "giftCfg"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->giftCfg:Lcom/p1/mobile/putong/live/base/data/BLiveGiftCfg;

    .line 167
    .line 168
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "stretchRange"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->stretchRange:Lcom/p1/mobile/putong/live/base/data/BLiveStretchRange;

    .line 183
    .line 184
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 188
    .line 189
    if-eqz p0, :cond_c

    .line 190
    .line 191
    const-string p0, "contentArea"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;->contentArea:Ljava/util/List;

    .line 197
    .line 198
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 199
    .line 200
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 201
    .line 202
    .line 203
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

    .line 204
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveStickerMetaDataItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
