.class Lcom/p1/mobile/putong/data/CommonData$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/CommonData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/CommonData;",
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
    const-class p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/CommonData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/CommonData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/CommonData$2;->newInstance()Lcom/p1/mobile/putong/data/CommonData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/CommonData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/CommonData;",
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
    const-string p0, "devices"

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
    const/16 v2, 0x1d

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "newGuide"

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
    const/16 v2, 0x1c

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "showEntrance"

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
    const/16 v2, 0x1b

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "visitorCounter"

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
    const/16 v2, 0x1a

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "userActivityInfo"

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
    const/16 v2, 0x19

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "captcha"

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
    const/16 v2, 0x18

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "liveRightCDN"

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
    const/16 v2, 0x17

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "showDialog"

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
    const/16 v2, 0x16

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "users"

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
    const/16 v2, 0x15

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "token"

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
    const/16 v2, 0x14

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "stage"

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
    const/16 v2, 0x13

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "media"

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
    const/16 v2, 0x12

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "links"

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
    const/16 v2, 0x11

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "email"

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
    const/16 v2, 0x10

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "type"

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
    const/16 v2, 0xf

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "thirdpartyEmail"

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
    goto/16 :goto_0

    .line 235
    .line 236
    :cond_f
    const/16 v2, 0xe

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "adConfiguration"

    .line 241
    .line 242
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-nez p0, :cond_10

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :cond_10
    const/16 v2, 0xd

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "connector"

    .line 255
    .line 256
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    if-nez p0, :cond_11

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :cond_11
    const/16 v2, 0xc

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "avatarFrameConfiguration"

    .line 269
    .line 270
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 271
    .line 272
    .line 273
    move-result p0

    .line 274
    if-nez p0, :cond_12

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :cond_12
    const/16 v2, 0xb

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "visitorStatistics"

    .line 283
    .line 284
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 285
    .line 286
    .line 287
    move-result p0

    .line 288
    if-nez p0, :cond_13

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :cond_13
    const/16 v2, 0xa

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "verificationTokens"

    .line 297
    .line 298
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result p0

    .line 302
    if-nez p0, :cond_14

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :cond_14
    const/16 v2, 0x9

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "thirdparty"

    .line 311
    .line 312
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 313
    .line 314
    .line 315
    move-result p0

    .line 316
    if-nez p0, :cond_15

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :cond_15
    const/16 v2, 0x8

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_16
    const-string p0, "visitorInfo"

    .line 325
    .line 326
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 327
    .line 328
    .line 329
    move-result p0

    .line 330
    if-nez p0, :cond_16

    .line 331
    .line 332
    goto :goto_0

    .line 333
    :cond_16
    const/4 v2, 0x7

    .line 334
    goto :goto_0

    .line 335
    :sswitch_17
    const-string p0, "popUps"

    .line 336
    .line 337
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 338
    .line 339
    .line 340
    move-result p0

    .line 341
    if-nez p0, :cond_17

    .line 342
    .line 343
    goto :goto_0

    .line 344
    :cond_17
    const/4 v2, 0x6

    .line 345
    goto :goto_0

    .line 346
    :sswitch_18
    const-string p0, "mobile"

    .line 347
    .line 348
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 349
    .line 350
    .line 351
    move-result p0

    .line 352
    if-nez p0, :cond_18

    .line 353
    .line 354
    goto :goto_0

    .line 355
    :cond_18
    const/4 v2, 0x5

    .line 356
    goto :goto_0

    .line 357
    :sswitch_19
    const-string p0, "pictureTags"

    .line 358
    .line 359
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 360
    .line 361
    .line 362
    move-result p0

    .line 363
    if-nez p0, :cond_19

    .line 364
    .line 365
    goto :goto_0

    .line 366
    :cond_19
    const/4 v2, 0x4

    .line 367
    goto :goto_0

    .line 368
    :sswitch_1a
    const-string p0, "detect"

    .line 369
    .line 370
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 371
    .line 372
    .line 373
    move-result p0

    .line 374
    if-nez p0, :cond_1a

    .line 375
    .line 376
    goto :goto_0

    .line 377
    :cond_1a
    const/4 v2, 0x3

    .line 378
    goto :goto_0

    .line 379
    :sswitch_1b
    const-string p0, "recommendMessage"

    .line 380
    .line 381
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result p0

    .line 385
    if-nez p0, :cond_1b

    .line 386
    .line 387
    goto :goto_0

    .line 388
    :cond_1b
    const/4 v2, 0x2

    .line 389
    goto :goto_0

    .line 390
    :sswitch_1c
    const-string p0, "adReward"

    .line 391
    .line 392
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result p0

    .line 396
    if-nez p0, :cond_1c

    .line 397
    .line 398
    goto :goto_0

    .line 399
    :cond_1c
    move v2, v1

    .line 400
    goto :goto_0

    .line 401
    :sswitch_1d
    const-string p0, "raySequences"

    .line 402
    .line 403
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 404
    .line 405
    .line 406
    move-result p0

    .line 407
    if-nez p0, :cond_1d

    .line 408
    .line 409
    goto :goto_0

    .line 410
    :cond_1d
    move v2, v0

    .line 411
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 412
    .line 413
    .line 414
    return v0

    .line 415
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/Device;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 416
    .line 417
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 422
    .line 423
    return v1

    .line 424
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 425
    .line 426
    .line 427
    move-result p0

    .line 428
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 429
    .line 430
    return v1

    .line 431
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 432
    .line 433
    .line 434
    move-result p0

    .line 435
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 436
    .line 437
    return v1

    .line 438
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/VisitorCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 439
    .line 440
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    check-cast p0, Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 445
    .line 446
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 447
    .line 448
    return v1

    .line 449
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/UserActivityInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 450
    .line 451
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    check-cast p0, Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 456
    .line 457
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 458
    .line 459
    return v1

    .line 460
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/SliderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 461
    .line 462
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    check-cast p0, Lcom/p1/mobile/putong/data/SliderData;

    .line 467
    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/LiveRightCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    .line 473
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    check-cast p0, Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 478
    .line 479
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 480
    .line 481
    return v1

    .line 482
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 483
    .line 484
    .line 485
    move-result p0

    .line 486
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 487
    .line 488
    return v1

    .line 489
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 490
    .line 491
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 492
    .line 493
    .line 494
    move-result-object p0

    .line 495
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 496
    .line 497
    return v1

    .line 498
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/Token;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 499
    .line 500
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 501
    .line 502
    .line 503
    move-result-object p0

    .line 504
    check-cast p0, Lcom/p1/mobile/putong/data/Token;

    .line 505
    .line 506
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 507
    .line 508
    return v1

    .line 509
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 510
    .line 511
    .line 512
    move-result-object p0

    .line 513
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 514
    .line 515
    return v1

    .line 516
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 517
    .line 518
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 519
    .line 520
    .line 521
    move-result-object p0

    .line 522
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 523
    .line 524
    return v1

    .line 525
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/Link;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 526
    .line 527
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 528
    .line 529
    .line 530
    move-result-object p0

    .line 531
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 532
    .line 533
    return v1

    .line 534
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 539
    .line 540
    return v1

    .line 541
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 542
    .line 543
    .line 544
    move-result-object p0

    .line 545
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 546
    .line 547
    return v1

    .line 548
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 549
    .line 550
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 551
    .line 552
    .line 553
    move-result-object p0

    .line 554
    check-cast p0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 555
    .line 556
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 557
    .line 558
    return v1

    .line 559
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/AdConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 560
    .line 561
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 562
    .line 563
    .line 564
    move-result-object p0

    .line 565
    check-cast p0, Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 566
    .line 567
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 568
    .line 569
    return v1

    .line 570
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/Connector;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 571
    .line 572
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object p0

    .line 576
    check-cast p0, Lcom/p1/mobile/putong/data/Connector;

    .line 577
    .line 578
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 579
    .line 580
    return v1

    .line 581
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 582
    .line 583
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 584
    .line 585
    .line 586
    move-result-object p0

    .line 587
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 588
    .line 589
    return v1

    .line 590
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/VisitorStatistics;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 591
    .line 592
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 593
    .line 594
    .line 595
    move-result-object p0

    .line 596
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 597
    .line 598
    return v1

    .line 599
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/VerificationToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 600
    .line 601
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 602
    .line 603
    .line 604
    move-result-object p0

    .line 605
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 606
    .line 607
    return v1

    .line 608
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/ThirdParty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 609
    .line 610
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object p0

    .line 614
    check-cast p0, Lcom/p1/mobile/putong/data/ThirdParty;

    .line 615
    .line 616
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 617
    .line 618
    return v1

    .line 619
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 620
    .line 621
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 622
    .line 623
    .line 624
    move-result-object p0

    .line 625
    check-cast p0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 626
    .line 627
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 628
    .line 629
    return v1

    .line 630
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 631
    .line 632
    .line 633
    move-result p0

    .line 634
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 635
    .line 636
    return v1

    .line 637
    :pswitch_18
    sget-object p0, Lcom/p1/mobile/putong/data/Mobile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 638
    .line 639
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    move-result-object p0

    .line 643
    check-cast p0, Lcom/p1/mobile/putong/data/Mobile;

    .line 644
    .line 645
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 646
    .line 647
    return v1

    .line 648
    :pswitch_19
    sget-object p0, Lcom/p1/mobile/putong/data/UserPictureTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 649
    .line 650
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 651
    .line 652
    .line 653
    move-result-object p0

    .line 654
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 655
    .line 656
    return v1

    .line 657
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/data/Detect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 658
    .line 659
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 660
    .line 661
    .line 662
    move-result-object p0

    .line 663
    check-cast p0, Lcom/p1/mobile/putong/data/Detect;

    .line 664
    .line 665
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 666
    .line 667
    return v1

    .line 668
    :pswitch_1b
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 669
    .line 670
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 671
    .line 672
    .line 673
    move-result-object p0

    .line 674
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 675
    .line 676
    return v1

    .line 677
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/data/AdRewardResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 678
    .line 679
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 680
    .line 681
    .line 682
    move-result-object p0

    .line 683
    check-cast p0, Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 684
    .line 685
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 686
    .line 687
    return v1

    .line 688
    :pswitch_1d
    sget-object p0, Lcom/p1/mobile/putong/data/ReflectResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 689
    .line 690
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 691
    .line 692
    .line 693
    move-result-object p0

    .line 694
    iput-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 695
    .line 696
    return v1

    .line 697
    :sswitch_data_0
    .sparse-switch
        -0x7c758838 -> :sswitch_1d
        -0x680a9ece -> :sswitch_1c
        -0x63678455 -> :sswitch_1b
        -0x4f95d95d -> :sswitch_1a
        -0x4bdaa9c9 -> :sswitch_19
        -0x3fb56f5e -> :sswitch_18
        -0x3a90d2d9 -> :sswitch_17
        -0x3a36d9c4 -> :sswitch_16
        -0x380d2221 -> :sswitch_15
        -0x30c4f86b -> :sswitch_14
        -0x22eb6fcf -> :sswitch_13
        -0x22d2523e -> :sswitch_12
        -0x22860bb3 -> :sswitch_11
        -0x1667566d -> :sswitch_10
        -0x128af03 -> :sswitch_f
        0x368f3a -> :sswitch_e
        0x5c24b9c -> :sswitch_d
        0x6234fb9 -> :sswitch_c
        0x62f6fe4 -> :sswitch_b
        0x68ac2fe -> :sswitch_a
        0x696b9f9 -> :sswitch_9
        0x6a68e08 -> :sswitch_8
        0x1471d2a5 -> :sswitch_7
        0x17da257d -> :sswitch_6
        0x20ef827a -> :sswitch_5
        0x32f093c8 -> :sswitch_4
        0x501c81ae -> :sswitch_3
        0x50627cd3 -> :sswitch_2
        0x50c6a53c -> :sswitch_1
        0x5cf8acdd -> :sswitch_0
    .end sparse-switch

    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    .line 794
    .line 795
    .line 796
    .line 797
    .line 798
    .line 799
    .line 800
    .line 801
    .line 802
    .line 803
    .line 804
    .line 805
    .line 806
    .line 807
    .line 808
    .line 809
    .line 810
    .line 811
    .line 812
    .line 813
    .line 814
    .line 815
    .line 816
    .line 817
    .line 818
    .line 819
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
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

    .line 697
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/CommonData$2;->parseField(Lcom/p1/mobile/putong/data/CommonData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/CommonData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/CommonData;",
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
    const-string v0, "devices"

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
    const/16 v2, 0x1d

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "newGuide"

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
    const/16 v2, 0x1c

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "showEntrance"

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
    const/16 v2, 0x1b

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "visitorCounter"

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
    const/16 v2, 0x1a

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "userActivityInfo"

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
    const/16 v2, 0x19

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "captcha"

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
    const/16 v2, 0x18

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "liveRightCDN"

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
    const/16 v2, 0x17

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "showDialog"

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
    const/16 v2, 0x16

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "users"

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
    const/16 v2, 0x15

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "token"

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
    const/16 v2, 0x14

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "stage"

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
    const/16 v2, 0x13

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_b
    const-string v0, "media"

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
    const/16 v2, 0x12

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_c
    const-string v0, "links"

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
    const/16 v2, 0x11

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_d
    const-string v0, "email"

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
    const/16 v2, 0x10

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_e
    const-string v0, "type"

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
    const/16 v2, 0xf

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_f
    const-string v0, "thirdpartyEmail"

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
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_f
    const/16 v2, 0xe

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_10
    const-string v0, "adConfiguration"

    .line 240
    .line 241
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    if-nez v0, :cond_10

    .line 246
    .line 247
    goto/16 :goto_0

    .line 248
    .line 249
    :cond_10
    const/16 v2, 0xd

    .line 250
    .line 251
    goto/16 :goto_0

    .line 252
    .line 253
    :sswitch_11
    const-string v0, "connector"

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_11

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :cond_11
    const/16 v2, 0xc

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_12
    const-string v0, "avatarFrameConfiguration"

    .line 268
    .line 269
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move-result v0

    .line 273
    if-nez v0, :cond_12

    .line 274
    .line 275
    goto/16 :goto_0

    .line 276
    .line 277
    :cond_12
    const/16 v2, 0xb

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_13
    const-string v0, "visitorStatistics"

    .line 282
    .line 283
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_13

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_13
    const/16 v2, 0xa

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_14
    const-string v0, "verificationTokens"

    .line 296
    .line 297
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    if-nez v0, :cond_14

    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :cond_14
    const/16 v2, 0x9

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_15
    const-string v0, "thirdparty"

    .line 310
    .line 311
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 312
    .line 313
    .line 314
    move-result v0

    .line 315
    if-nez v0, :cond_15

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :cond_15
    const/16 v2, 0x8

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_16
    const-string v0, "visitorInfo"

    .line 324
    .line 325
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result v0

    .line 329
    if-nez v0, :cond_16

    .line 330
    .line 331
    goto :goto_0

    .line 332
    :cond_16
    const/4 v2, 0x7

    .line 333
    goto :goto_0

    .line 334
    :sswitch_17
    const-string v0, "popUps"

    .line 335
    .line 336
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-nez v0, :cond_17

    .line 341
    .line 342
    goto :goto_0

    .line 343
    :cond_17
    const/4 v2, 0x6

    .line 344
    goto :goto_0

    .line 345
    :sswitch_18
    const-string v0, "mobile"

    .line 346
    .line 347
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result v0

    .line 351
    if-nez v0, :cond_18

    .line 352
    .line 353
    goto :goto_0

    .line 354
    :cond_18
    const/4 v2, 0x5

    .line 355
    goto :goto_0

    .line 356
    :sswitch_19
    const-string v0, "pictureTags"

    .line 357
    .line 358
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-nez v0, :cond_19

    .line 363
    .line 364
    goto :goto_0

    .line 365
    :cond_19
    const/4 v2, 0x4

    .line 366
    goto :goto_0

    .line 367
    :sswitch_1a
    const-string v0, "detect"

    .line 368
    .line 369
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    if-nez v0, :cond_1a

    .line 374
    .line 375
    goto :goto_0

    .line 376
    :cond_1a
    const/4 v2, 0x3

    .line 377
    goto :goto_0

    .line 378
    :sswitch_1b
    const-string v0, "recommendMessage"

    .line 379
    .line 380
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 381
    .line 382
    .line 383
    move-result v0

    .line 384
    if-nez v0, :cond_1b

    .line 385
    .line 386
    goto :goto_0

    .line 387
    :cond_1b
    const/4 v2, 0x2

    .line 388
    goto :goto_0

    .line 389
    :sswitch_1c
    const-string v0, "adReward"

    .line 390
    .line 391
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    if-nez v0, :cond_1c

    .line 396
    .line 397
    goto :goto_0

    .line 398
    :cond_1c
    move v2, v1

    .line 399
    goto :goto_0

    .line 400
    :sswitch_1d
    const-string v0, "raySequences"

    .line 401
    .line 402
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    if-nez v0, :cond_1d

    .line 407
    .line 408
    goto :goto_0

    .line 409
    :cond_1d
    const/4 v2, 0x0

    .line 410
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 411
    .line 412
    .line 413
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 414
    .line 415
    .line 416
    move-result p0

    .line 417
    return p0

    .line 418
    :pswitch_0
    return v1

    .line 419
    :sswitch_data_0
    .sparse-switch
        -0x7c758838 -> :sswitch_1d
        -0x680a9ece -> :sswitch_1c
        -0x63678455 -> :sswitch_1b
        -0x4f95d95d -> :sswitch_1a
        -0x4bdaa9c9 -> :sswitch_19
        -0x3fb56f5e -> :sswitch_18
        -0x3a90d2d9 -> :sswitch_17
        -0x3a36d9c4 -> :sswitch_16
        -0x380d2221 -> :sswitch_15
        -0x30c4f86b -> :sswitch_14
        -0x22eb6fcf -> :sswitch_13
        -0x22d2523e -> :sswitch_12
        -0x22860bb3 -> :sswitch_11
        -0x1667566d -> :sswitch_10
        -0x128af03 -> :sswitch_f
        0x368f3a -> :sswitch_e
        0x5c24b9c -> :sswitch_d
        0x6234fb9 -> :sswitch_c
        0x62f6fe4 -> :sswitch_b
        0x68ac2fe -> :sswitch_a
        0x696b9f9 -> :sswitch_9
        0x6a68e08 -> :sswitch_8
        0x1471d2a5 -> :sswitch_7
        0x17da257d -> :sswitch_6
        0x20ef827a -> :sswitch_5
        0x32f093c8 -> :sswitch_4
        0x501c81ae -> :sswitch_3
        0x50627cd3 -> :sswitch_2
        0x50c6a53c -> :sswitch_1
        0x5cf8acdd -> :sswitch_0
    .end sparse-switch

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
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
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
    .line 538
    .line 539
    .line 540
    .line 541
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

    .line 419
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/CommonData$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/CommonData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/CommonData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p0, "users"

    .line 6
    .line 7
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 11
    .line 12
    sget-object v0, Lcom/p1/mobile/putong/data/User;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 13
    .line 14
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string p0, "media"

    .line 22
    .line 23
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 29
    .line 30
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 31
    .line 32
    .line 33
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_2

    .line 36
    .line 37
    const-string p0, "devices"

    .line 38
    .line 39
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 43
    .line 44
    sget-object v0, Lcom/p1/mobile/putong/data/Device;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 45
    .line 46
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "connector"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/data/Connector;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "verificationTokens"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/data/VerificationToken;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "links"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 92
    .line 93
    sget-object v1, Lcom/p1/mobile/putong/data/Link;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "detect"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/data/Detect;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "recommendMessage"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendMessage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string p0, "raySequences"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 140
    .line 141
    sget-object v1, Lcom/p1/mobile/putong/data/ReflectResponse;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string v1, "stage"

    .line 151
    .line 152
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string p0, "captcha"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/data/SliderData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 167
    .line 168
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "visitorInfo"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/data/VisitorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 183
    .line 184
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 188
    .line 189
    if-eqz p0, :cond_c

    .line 190
    .line 191
    const-string p0, "visitorStatistics"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 197
    .line 198
    sget-object v1, Lcom/p1/mobile/putong/data/VisitorStatistics;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 199
    .line 200
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 201
    .line 202
    .line 203
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 204
    .line 205
    if-eqz p0, :cond_d

    .line 206
    .line 207
    const-string p0, "visitorCounter"

    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    sget-object p0, Lcom/p1/mobile/putong/data/VisitorCounter;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    .line 214
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 215
    .line 216
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 217
    .line 218
    .line 219
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 220
    .line 221
    if-eqz p0, :cond_e

    .line 222
    .line 223
    const-string p0, "avatarFrameConfiguration"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 229
    .line 230
    sget-object v1, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 231
    .line 232
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 233
    .line 234
    .line 235
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 236
    .line 237
    if-eqz p0, :cond_f

    .line 238
    .line 239
    const-string p0, "liveRightCDN"

    .line 240
    .line 241
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    sget-object p0, Lcom/p1/mobile/putong/data/LiveRightCDN;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 245
    .line 246
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 247
    .line 248
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 249
    .line 250
    .line 251
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 252
    .line 253
    if-eqz p0, :cond_10

    .line 254
    .line 255
    const-string p0, "adConfiguration"

    .line 256
    .line 257
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    sget-object p0, Lcom/p1/mobile/putong/data/AdConfiguration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    .line 262
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 263
    .line 264
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 265
    .line 266
    .line 267
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 268
    .line 269
    if-eqz p0, :cond_11

    .line 270
    .line 271
    const-string p0, "adReward"

    .line 272
    .line 273
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    sget-object p0, Lcom/p1/mobile/putong/data/AdRewardResult;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 277
    .line 278
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 279
    .line 280
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 281
    .line 282
    .line 283
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 284
    .line 285
    if-eqz p0, :cond_12

    .line 286
    .line 287
    const-string p0, "pictureTags"

    .line 288
    .line 289
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 293
    .line 294
    sget-object v1, Lcom/p1/mobile/putong/data/UserPictureTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 295
    .line 296
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 297
    .line 298
    .line 299
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 300
    .line 301
    if-eqz p0, :cond_13

    .line 302
    .line 303
    const-string p0, "userActivityInfo"

    .line 304
    .line 305
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 306
    .line 307
    .line 308
    sget-object p0, Lcom/p1/mobile/putong/data/UserActivityInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 309
    .line 310
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 311
    .line 312
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 313
    .line 314
    .line 315
    :cond_13
    const-string p0, "newGuide"

    .line 316
    .line 317
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 318
    .line 319
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 320
    .line 321
    .line 322
    const-string p0, "popUps"

    .line 323
    .line 324
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 325
    .line 326
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 327
    .line 328
    .line 329
    const-string p0, "showDialog"

    .line 330
    .line 331
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 332
    .line 333
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 334
    .line 335
    .line 336
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 337
    .line 338
    if-eqz p0, :cond_14

    .line 339
    .line 340
    const-string v1, "type"

    .line 341
    .line 342
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 343
    .line 344
    .line 345
    :cond_14
    const-string p0, "showEntrance"

    .line 346
    .line 347
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 348
    .line 349
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 350
    .line 351
    .line 352
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 353
    .line 354
    if-eqz p0, :cond_15

    .line 355
    .line 356
    const-string p0, "mobile"

    .line 357
    .line 358
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 359
    .line 360
    .line 361
    sget-object p0, Lcom/p1/mobile/putong/data/Mobile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 362
    .line 363
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 364
    .line 365
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 366
    .line 367
    .line 368
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 369
    .line 370
    if-eqz p0, :cond_16

    .line 371
    .line 372
    const-string v1, "email"

    .line 373
    .line 374
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 375
    .line 376
    .line 377
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 378
    .line 379
    if-eqz p0, :cond_17

    .line 380
    .line 381
    const-string p0, "thirdparty"

    .line 382
    .line 383
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    sget-object p0, Lcom/p1/mobile/putong/data/ThirdParty;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 387
    .line 388
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 389
    .line 390
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 391
    .line 392
    .line 393
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 394
    .line 395
    if-eqz p0, :cond_18

    .line 396
    .line 397
    const-string p0, "token"

    .line 398
    .line 399
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    sget-object p0, Lcom/p1/mobile/putong/data/Token;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 403
    .line 404
    iget-object v1, p1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 405
    .line 406
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 407
    .line 408
    .line 409
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 410
    .line 411
    if-eqz p0, :cond_19

    .line 412
    .line 413
    const-string p0, "thirdpartyEmail"

    .line 414
    .line 415
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    sget-object p0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 419
    .line 420
    iget-object p1, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 421
    .line 422
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 423
    .line 424
    .line 425
    :cond_19
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 426
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/CommonData$2;->serializeFields(Lcom/p1/mobile/putong/data/CommonData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
