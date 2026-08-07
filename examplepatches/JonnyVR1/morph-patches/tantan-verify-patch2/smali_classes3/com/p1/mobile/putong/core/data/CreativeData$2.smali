.class Lcom/p1/mobile/putong/core/data/CreativeData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CreativeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/CreativeData;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/CreativeData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CreativeData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CreativeData$2;->newInstance()Lcom/p1/mobile/putong/core/data/CreativeData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/CreativeData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CreativeData;",
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
    const-string p0, "positionPicture"

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
    const/16 v2, 0x16

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "displayPrice"

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
    const/16 v2, 0x15

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "currencyCode"

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
    const/16 v2, 0x14

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "payPlatform"

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
    const/16 v2, 0x13

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "autoRenewable"

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
    const/16 v2, 0x12

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "popUpWindow"

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
    const/16 v2, 0x11

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "promotionName"

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
    const/16 v2, 0x10

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "currency"

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
    const/16 v2, 0xf

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "buttonText"

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
    const/16 v2, 0xe

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "textContent"

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
    const/16 v2, 0xd

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "terms"

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
    const/16 v2, 0xc

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "skuID"

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
    const/16 v2, 0xb

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "discountPrice"

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
    const/16 v2, 0xa

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "normalPrice"

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
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v2, 0x9

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "textTitle"

    .line 213
    .line 214
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result p0

    .line 218
    if-nez p0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v2, 0x8

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "itemID"

    .line 227
    .line 228
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-nez p0, :cond_f

    .line 233
    .line 234
    goto :goto_0

    .line 235
    :cond_f
    const/4 v2, 0x7

    .line 236
    goto :goto_0

    .line 237
    :sswitch_10
    const-string p0, "iconPicture"

    .line 238
    .line 239
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result p0

    .line 243
    if-nez p0, :cond_10

    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_10
    const/4 v2, 0x6

    .line 247
    goto :goto_0

    .line 248
    :sswitch_11
    const-string p0, "clause"

    .line 249
    .line 250
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result p0

    .line 254
    if-nez p0, :cond_11

    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_11
    const/4 v2, 0x5

    .line 258
    goto :goto_0

    .line 259
    :sswitch_12
    const-string p0, "productType"

    .line 260
    .line 261
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    if-nez p0, :cond_12

    .line 266
    .line 267
    goto :goto_0

    .line 268
    :cond_12
    const/4 v2, 0x4

    .line 269
    goto :goto_0

    .line 270
    :sswitch_13
    const-string p0, "backgroundPicture"

    .line 271
    .line 272
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    if-nez p0, :cond_13

    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_13
    const/4 v2, 0x3

    .line 280
    goto :goto_0

    .line 281
    :sswitch_14
    const-string p0, "endTime"

    .line 282
    .line 283
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p0

    .line 287
    if-nez p0, :cond_14

    .line 288
    .line 289
    goto :goto_0

    .line 290
    :cond_14
    const/4 v2, 0x2

    .line 291
    goto :goto_0

    .line 292
    :sswitch_15
    const-string p0, "buttonTexts"

    .line 293
    .line 294
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result p0

    .line 298
    if-nez p0, :cond_15

    .line 299
    .line 300
    goto :goto_0

    .line 301
    :cond_15
    move v2, v1

    .line 302
    goto :goto_0

    .line 303
    :sswitch_16
    const-string p0, "startTime"

    .line 304
    .line 305
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result p0

    .line 309
    if-nez p0, :cond_16

    .line 310
    .line 311
    goto :goto_0

    .line 312
    :cond_16
    move v2, v0

    .line 313
    :goto_0
    const/4 p0, 0x0

    .line 314
    packed-switch v2, :pswitch_data_0

    .line 315
    .line 316
    .line 317
    return v0

    .line 318
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 319
    .line 320
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 325
    .line 326
    return v1

    .line 327
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 328
    .line 329
    .line 330
    move-result p0

    .line 331
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 332
    .line 333
    return v1

    .line 334
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 339
    .line 340
    return v1

    .line 341
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 342
    .line 343
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 348
    .line 349
    return v1

    .line 350
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 355
    .line 356
    return v1

    .line 357
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 358
    .line 359
    .line 360
    move-result p0

    .line 361
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 362
    .line 363
    return v1

    .line 364
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 369
    .line 370
    return v1

    .line 371
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 376
    .line 377
    return v1

    .line 378
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 379
    .line 380
    .line 381
    move-result-object p0

    .line 382
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 383
    .line 384
    return v1

    .line 385
    :pswitch_9
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 386
    .line 387
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 388
    .line 389
    .line 390
    move-result-object p0

    .line 391
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 392
    .line 393
    return v1

    .line 394
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 399
    .line 400
    return v1

    .line 401
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 406
    .line 407
    return v1

    .line 408
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 409
    .line 410
    .line 411
    move-result-object p2

    .line 412
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 413
    .line 414
    if-ne p2, p4, :cond_17

    .line 415
    .line 416
    goto :goto_1

    .line 417
    :cond_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 418
    .line 419
    .line 420
    move-result-wide p2

    .line 421
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 422
    .line 423
    .line 424
    move-result-object p0

    .line 425
    :goto_1
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 426
    .line 427
    return v1

    .line 428
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 429
    .line 430
    .line 431
    move-result-object p2

    .line 432
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 433
    .line 434
    if-ne p2, p4, :cond_18

    .line 435
    .line 436
    goto :goto_2

    .line 437
    :cond_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 438
    .line 439
    .line 440
    move-result-wide p2

    .line 441
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 442
    .line 443
    .line 444
    move-result-object p0

    .line 445
    :goto_2
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 446
    .line 447
    return v1

    .line 448
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object p0

    .line 452
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 453
    .line 454
    return v1

    .line 455
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 456
    .line 457
    .line 458
    move-result-object p0

    .line 459
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 460
    .line 461
    return v1

    .line 462
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 463
    .line 464
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_11
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    .line 473
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 478
    .line 479
    return v1

    .line 480
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 481
    .line 482
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    check-cast p0, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 487
    .line 488
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 489
    .line 490
    return v1

    .line 491
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 492
    .line 493
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 494
    .line 495
    .line 496
    move-result-object p0

    .line 497
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 498
    .line 499
    return v1

    .line 500
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 501
    .line 502
    .line 503
    move-result-object p2

    .line 504
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 505
    .line 506
    if-ne p2, p4, :cond_19

    .line 507
    .line 508
    goto :goto_3

    .line 509
    :cond_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 510
    .line 511
    .line 512
    move-result-wide p2

    .line 513
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 514
    .line 515
    .line 516
    move-result-object p0

    .line 517
    :goto_3
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 518
    .line 519
    return v1

    .line 520
    :pswitch_15
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 521
    .line 522
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 523
    .line 524
    .line 525
    move-result-object p0

    .line 526
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 527
    .line 528
    return v1

    .line 529
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getCurrentToken()Lcom/fasterxml/jackson/core/JsonToken;

    .line 530
    .line 531
    .line 532
    move-result-object p2

    .line 533
    sget-object p4, Lcom/fasterxml/jackson/core/JsonToken;->VALUE_NULL:Lcom/fasterxml/jackson/core/JsonToken;

    .line 534
    .line 535
    if-ne p2, p4, :cond_1a

    .line 536
    .line 537
    goto :goto_4

    .line 538
    :cond_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 539
    .line 540
    .line 541
    move-result-wide p2

    .line 542
    invoke-static {p2, p3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 543
    .line 544
    .line 545
    move-result-object p0

    .line 546
    :goto_4
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 547
    .line 548
    return v1

    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_16
        -0x6980072c -> :sswitch_15
        -0x5fcc95b8 -> :sswitch_14
        -0x5c72f010 -> :sswitch_13
        -0x58e83f37 -> :sswitch_12
        -0x50f07291 -> :sswitch_11
        -0x489591bb -> :sswitch_10
        -0x4640f492 -> :sswitch_f
        -0x3e77ded5 -> :sswitch_e
        -0x1065035e -> :sswitch_d
        -0x8bf9378 -> :sswitch_c
        0x686f2f8 -> :sswitch_b
        0x6924987 -> :sswitch_a
        0x6a6ca8c -> :sswitch_9
        0x155ef77f -> :sswitch_8
        0x224bf011 -> :sswitch_7
        0x2a9ce1ce -> :sswitch_6
        0x2ac56bdc -> :sswitch_5
        0x2f12c878 -> :sswitch_4
        0x3bd2553b -> :sswitch_3
        0x3be3a19e -> :sswitch_2
        0x5f72d1a7 -> :sswitch_1
        0x62d86b95 -> :sswitch_0
    .end sparse-switch

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_16
        :pswitch_15
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

    .line 549
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CreativeData$2;->parseField(Lcom/p1/mobile/putong/core/data/CreativeData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/CreativeData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CreativeData;",
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

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/String;->hashCode()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "positionPicture"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0x16

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "displayPrice"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0x15

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "currencyCode"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0x14

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "payPlatform"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x13

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "autoRenewable"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0x12

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "popUpWindow"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0x11

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "promotionName"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0x10

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "currency"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0xf

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "buttonText"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0xe

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "textContent"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0xd

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "terms"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_a
    const/16 v2, 0xc

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "skuID"

    .line 170
    .line 171
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    if-nez v0, :cond_b

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    const/16 v2, 0xb

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "discountPrice"

    .line 184
    .line 185
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    if-nez v0, :cond_c

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_c
    const/16 v2, 0xa

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "normalPrice"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_d

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :cond_d
    const/16 v2, 0x9

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "textTitle"

    .line 212
    .line 213
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result v0

    .line 217
    if-nez v0, :cond_e

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :cond_e
    const/16 v2, 0x8

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "itemID"

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_f

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_f
    const/4 v2, 0x7

    .line 235
    goto :goto_0

    .line 236
    :sswitch_10
    const-string v0, "iconPicture"

    .line 237
    .line 238
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-nez v0, :cond_10

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_10
    const/4 v2, 0x6

    .line 246
    goto :goto_0

    .line 247
    :sswitch_11
    const-string v0, "clause"

    .line 248
    .line 249
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_11

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_11
    const/4 v2, 0x5

    .line 257
    goto :goto_0

    .line 258
    :sswitch_12
    const-string v0, "productType"

    .line 259
    .line 260
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    if-nez v0, :cond_12

    .line 265
    .line 266
    goto :goto_0

    .line 267
    :cond_12
    const/4 v2, 0x4

    .line 268
    goto :goto_0

    .line 269
    :sswitch_13
    const-string v0, "backgroundPicture"

    .line 270
    .line 271
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    if-nez v0, :cond_13

    .line 276
    .line 277
    goto :goto_0

    .line 278
    :cond_13
    const/4 v2, 0x3

    .line 279
    goto :goto_0

    .line 280
    :sswitch_14
    const-string v0, "endTime"

    .line 281
    .line 282
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    if-nez v0, :cond_14

    .line 287
    .line 288
    goto :goto_0

    .line 289
    :cond_14
    const/4 v2, 0x2

    .line 290
    goto :goto_0

    .line 291
    :sswitch_15
    const-string v0, "buttonTexts"

    .line 292
    .line 293
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    if-nez v0, :cond_15

    .line 298
    .line 299
    goto :goto_0

    .line 300
    :cond_15
    move v2, v1

    .line 301
    goto :goto_0

    .line 302
    :sswitch_16
    const-string v0, "startTime"

    .line 303
    .line 304
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-nez v0, :cond_16

    .line 309
    .line 310
    goto :goto_0

    .line 311
    :cond_16
    const/4 v2, 0x0

    .line 312
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 313
    .line 314
    .line 315
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 316
    .line 317
    .line 318
    move-result p0

    .line 319
    return p0

    .line 320
    :pswitch_0
    return v1

    .line 321
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_16
        -0x6980072c -> :sswitch_15
        -0x5fcc95b8 -> :sswitch_14
        -0x5c72f010 -> :sswitch_13
        -0x58e83f37 -> :sswitch_12
        -0x50f07291 -> :sswitch_11
        -0x489591bb -> :sswitch_10
        -0x4640f492 -> :sswitch_f
        -0x3e77ded5 -> :sswitch_e
        -0x1065035e -> :sswitch_d
        -0x8bf9378 -> :sswitch_c
        0x686f2f8 -> :sswitch_b
        0x6924987 -> :sswitch_a
        0x6a6ca8c -> :sswitch_9
        0x155ef77f -> :sswitch_8
        0x224bf011 -> :sswitch_7
        0x2a9ce1ce -> :sswitch_6
        0x2ac56bdc -> :sswitch_5
        0x2f12c878 -> :sswitch_4
        0x3bd2553b -> :sswitch_3
        0x3be3a19e -> :sswitch_2
        0x5f72d1a7 -> :sswitch_1
        0x62d86b95 -> :sswitch_0
    .end sparse-switch

    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    .line 363
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
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 321
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CreativeData$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/CreativeData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/CreativeData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "startTime"

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    invoke-virtual {p2, v0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 15
    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string v0, "endTime"

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 21
    .line 22
    .line 23
    move-result-wide v1

    .line 24
    invoke-virtual {p2, v0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "productType"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 39
    .line 40
    const/4 v1, 0x1

    .line 41
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 42
    .line 43
    .line 44
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_3

    .line 47
    .line 48
    const-string v0, "promotionName"

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    const-string p0, "payPlatform"

    .line 58
    .line 59
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 63
    .line 64
    sget-object v0, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 65
    .line 66
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 70
    .line 71
    if-eqz p0, :cond_5

    .line 72
    .line 73
    const-string v0, "normalPrice"

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 76
    .line 77
    .line 78
    move-result-wide v1

    .line 79
    invoke-virtual {p2, v0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 80
    .line 81
    .line 82
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 83
    .line 84
    if-eqz p0, :cond_6

    .line 85
    .line 86
    const-string v0, "discountPrice"

    .line 87
    .line 88
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 89
    .line 90
    .line 91
    move-result-wide v1

    .line 92
    invoke-virtual {p2, v0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 93
    .line 94
    .line 95
    :cond_6
    const-string p0, "popUpWindow"

    .line 96
    .line 97
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 98
    .line 99
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 100
    .line 101
    .line 102
    const-string p0, "autoRenewable"

    .line 103
    .line 104
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 105
    .line 106
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 107
    .line 108
    .line 109
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_7

    .line 112
    .line 113
    const-string v0, "currencyCode"

    .line 114
    .line 115
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 119
    .line 120
    if-eqz p0, :cond_8

    .line 121
    .line 122
    const-string v0, "textTitle"

    .line 123
    .line 124
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 128
    .line 129
    if-eqz p0, :cond_9

    .line 130
    .line 131
    const-string p0, "textContent"

    .line 132
    .line 133
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 137
    .line 138
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 139
    .line 140
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 144
    .line 145
    if-eqz p0, :cond_a

    .line 146
    .line 147
    const-string v0, "terms"

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 150
    .line 151
    .line 152
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 153
    .line 154
    if-eqz p0, :cond_b

    .line 155
    .line 156
    const-string p0, "clause"

    .line 157
    .line 158
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 162
    .line 163
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 164
    .line 165
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 166
    .line 167
    .line 168
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 169
    .line 170
    if-eqz p0, :cond_c

    .line 171
    .line 172
    const-string v0, "buttonText"

    .line 173
    .line 174
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 178
    .line 179
    if-eqz p0, :cond_d

    .line 180
    .line 181
    const-string p0, "buttonTexts"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 187
    .line 188
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 189
    .line 190
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 191
    .line 192
    .line 193
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 194
    .line 195
    if-eqz p0, :cond_e

    .line 196
    .line 197
    const-string p0, "backgroundPicture"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 203
    .line 204
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 205
    .line 206
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 207
    .line 208
    .line 209
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 210
    .line 211
    if-eqz p0, :cond_f

    .line 212
    .line 213
    const-string p0, "iconPicture"

    .line 214
    .line 215
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 219
    .line 220
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 221
    .line 222
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 223
    .line 224
    .line 225
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 226
    .line 227
    if-eqz p0, :cond_10

    .line 228
    .line 229
    const-string p0, "positionPicture"

    .line 230
    .line 231
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 235
    .line 236
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 237
    .line 238
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 239
    .line 240
    .line 241
    :cond_10
    const-string p0, "displayPrice"

    .line 242
    .line 243
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 244
    .line 245
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 246
    .line 247
    .line 248
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 249
    .line 250
    if-eqz p0, :cond_11

    .line 251
    .line 252
    const-string v0, "currency"

    .line 253
    .line 254
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 258
    .line 259
    if-eqz p0, :cond_12

    .line 260
    .line 261
    const-string v0, "skuID"

    .line 262
    .line 263
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 267
    .line 268
    if-eqz p0, :cond_13

    .line 269
    .line 270
    const-string p1, "itemID"

    .line 271
    .line 272
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    :cond_13
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 276
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CreativeData$2;->serializeFields(Lcom/p1/mobile/putong/core/data/CreativeData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
