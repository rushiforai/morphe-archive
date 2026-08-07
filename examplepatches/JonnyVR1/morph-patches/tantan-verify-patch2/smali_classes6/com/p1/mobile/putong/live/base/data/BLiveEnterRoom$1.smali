.class Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;",
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
    const-string p0, "isWealthHierarchy"

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
    const/16 v2, 0x1c

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "showDuration"

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
    const/16 v2, 0x1b

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "avatarGradients"

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
    const/16 v2, 0x1a

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "animationSizeType"

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
    const/16 v2, 0x19

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "contentTextColor"

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
    const/16 v2, 0x18

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "backgroundGradientDirection"

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
    const/16 v2, 0x17

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "avatarGradientDirection"

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
    const/16 v2, 0x16

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "videoEffectExtras"

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
    const/16 v2, 0x15

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "userGradeIcon"

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
    const/16 v2, 0x14

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "userImage"

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
    const/16 v2, 0x13

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "userGrade"

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
    const/16 v2, 0x12

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "bgUrl"

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
    const/16 v2, 0x11

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "uid"

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
    const/16 v2, 0x10

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "userName"

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
    const/16 v2, 0xf

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "enterVersion"

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
    const/16 v2, 0xe

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string p0, "contentText"

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
    const/16 v2, 0xd

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "newResourceId"

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
    const/16 v2, 0xc

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "backgroundGradients"

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
    const/16 v2, 0xb

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "newFloatingUrl"

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
    const/16 v2, 0xa

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_13
    const-string p0, "roomId"

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
    const/16 v2, 0x9

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_14
    const-string p0, "userNameGradientColors"

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
    const/16 v2, 0x8

    .line 307
    .line 308
    goto/16 :goto_0

    .line 309
    .line 310
    :sswitch_15
    const-string p0, "effectId"

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
    goto :goto_0

    .line 319
    :cond_15
    const/4 v2, 0x7

    .line 320
    goto :goto_0

    .line 321
    :sswitch_16
    const-string p0, "floatBgUrl"

    .line 322
    .line 323
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result p0

    .line 327
    if-nez p0, :cond_16

    .line 328
    .line 329
    goto :goto_0

    .line 330
    :cond_16
    const/4 v2, 0x6

    .line 331
    goto :goto_0

    .line 332
    :sswitch_17
    const-string p0, "userNameColor"

    .line 333
    .line 334
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 335
    .line 336
    .line 337
    move-result p0

    .line 338
    if-nez p0, :cond_17

    .line 339
    .line 340
    goto :goto_0

    .line 341
    :cond_17
    const/4 v2, 0x5

    .line 342
    goto :goto_0

    .line 343
    :sswitch_18
    const-string p0, "resourceId"

    .line 344
    .line 345
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 346
    .line 347
    .line 348
    move-result p0

    .line 349
    if-nez p0, :cond_18

    .line 350
    .line 351
    goto :goto_0

    .line 352
    :cond_18
    const/4 v2, 0x4

    .line 353
    goto :goto_0

    .line 354
    :sswitch_19
    const-string p0, "enterRoomEffectId"

    .line 355
    .line 356
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    if-nez p0, :cond_19

    .line 361
    .line 362
    goto :goto_0

    .line 363
    :cond_19
    const/4 v2, 0x3

    .line 364
    goto :goto_0

    .line 365
    :sswitch_1a
    const-string p0, "backgroundUrlEndMargin"

    .line 366
    .line 367
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 368
    .line 369
    .line 370
    move-result p0

    .line 371
    if-nez p0, :cond_1a

    .line 372
    .line 373
    goto :goto_0

    .line 374
    :cond_1a
    const/4 v2, 0x2

    .line 375
    goto :goto_0

    .line 376
    :sswitch_1b
    const-string p0, "fixedBackgroundUrl"

    .line 377
    .line 378
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    move-result p0

    .line 382
    if-nez p0, :cond_1b

    .line 383
    .line 384
    goto :goto_0

    .line 385
    :cond_1b
    move v2, v1

    .line 386
    goto :goto_0

    .line 387
    :sswitch_1c
    const-string p0, "dynamicEffectExtends"

    .line 388
    .line 389
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 390
    .line 391
    .line 392
    move-result p0

    .line 393
    if-nez p0, :cond_1c

    .line 394
    .line 395
    goto :goto_0

    .line 396
    :cond_1c
    move v2, v0

    .line 397
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 398
    .line 399
    .line 400
    return v0

    .line 401
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 402
    .line 403
    .line 404
    move-result p0

    .line 405
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 406
    .line 407
    return v1

    .line 408
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 409
    .line 410
    .line 411
    move-result-wide p2

    .line 412
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 413
    .line 414
    return v1

    .line 415
    :pswitch_2
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 416
    .line 417
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 422
    .line 423
    return v1

    .line 424
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 425
    .line 426
    .line 427
    move-result-wide p2

    .line 428
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 429
    .line 430
    return v1

    .line 431
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 436
    .line 437
    return v1

    .line 438
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 439
    .line 440
    .line 441
    move-result p0

    .line 442
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 443
    .line 444
    return v1

    .line 445
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 446
    .line 447
    .line 448
    move-result p0

    .line 449
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 450
    .line 451
    return v1

    .line 452
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 453
    .line 454
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 455
    .line 456
    .line 457
    move-result-object p0

    .line 458
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 459
    .line 460
    return v1

    .line 461
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 466
    .line 467
    return v1

    .line 468
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object p0

    .line 472
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 473
    .line 474
    return v1

    .line 475
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 476
    .line 477
    .line 478
    move-result-wide p2

    .line 479
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 480
    .line 481
    return v1

    .line 482
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object p0

    .line 486
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 487
    .line 488
    return v1

    .line 489
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 494
    .line 495
    return v1

    .line 496
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 497
    .line 498
    .line 499
    move-result-object p0

    .line 500
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 501
    .line 502
    return v1

    .line 503
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 504
    .line 505
    .line 506
    move-result-wide p2

    .line 507
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 508
    .line 509
    return v1

    .line 510
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 511
    .line 512
    .line 513
    move-result-object p0

    .line 514
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 515
    .line 516
    return v1

    .line 517
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 518
    .line 519
    .line 520
    move-result-object p0

    .line 521
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 522
    .line 523
    return v1

    .line 524
    :pswitch_11
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 525
    .line 526
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 527
    .line 528
    .line 529
    move-result-object p0

    .line 530
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 531
    .line 532
    return v1

    .line 533
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object p0

    .line 537
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 538
    .line 539
    return v1

    .line 540
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object p0

    .line 544
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 545
    .line 546
    return v1

    .line 547
    :pswitch_14
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 548
    .line 549
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 554
    .line 555
    return v1

    .line 556
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 561
    .line 562
    return v1

    .line 563
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 564
    .line 565
    .line 566
    move-result-object p0

    .line 567
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 568
    .line 569
    return v1

    .line 570
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 571
    .line 572
    .line 573
    move-result-object p0

    .line 574
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 575
    .line 576
    return v1

    .line 577
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 578
    .line 579
    .line 580
    move-result-object p0

    .line 581
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 582
    .line 583
    return v1

    .line 584
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 585
    .line 586
    .line 587
    move-result-object p0

    .line 588
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 589
    .line 590
    return v1

    .line 591
    :pswitch_1a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 592
    .line 593
    .line 594
    move-result-wide p2

    .line 595
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 596
    .line 597
    return v1

    .line 598
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 599
    .line 600
    .line 601
    move-result-object p0

    .line 602
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 603
    .line 604
    return v1

    .line 605
    :pswitch_1c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 606
    .line 607
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 608
    .line 609
    .line 610
    move-result-object p0

    .line 611
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 612
    .line 613
    return v1

    .line 614
    nop

    .line 615
    :sswitch_data_0
    .sparse-switch
        -0x7d3e4437 -> :sswitch_1c
        -0x6edf39b3 -> :sswitch_1b
        -0x5fd0f9f8 -> :sswitch_1a
        -0x5bc3ac81 -> :sswitch_19
        -0x5034fe37 -> :sswitch_18
        -0x42f113f3 -> :sswitch_17
        -0x3e3ada12 -> :sswitch_16
        -0x3ca15d74 -> :sswitch_15
        -0x3c9da0aa -> :sswitch_14
        -0x372740aa -> :sswitch_13
        -0x282d4637 -> :sswitch_12
        -0x20bd524b -> :sswitch_11
        -0x1db10077 -> :sswitch_10
        -0x1731f6ba -> :sswitch_f
        -0x11ea3520 -> :sswitch_e
        -0xfe5030a -> :sswitch_d
        0x1c450 -> :sswitch_c
        0x5951eea -> :sswitch_b
        0x12e98acc -> :sswitch_a
        0x13037450 -> :sswitch_9
        0x1a71f565 -> :sswitch_8
        0x2f60eb6f -> :sswitch_7
        0x2f8881d6 -> :sswitch_6
        0x33fc72a1 -> :sswitch_5
        0x3ee711bd -> :sswitch_4
        0x48ffb67f -> :sswitch_3
        0x54f7c1ea -> :sswitch_2
        0x567c3fb1 -> :sswitch_1
        0x59d7427e -> :sswitch_0
    .end sparse-switch

    .line 616
    .line 617
    .line 618
    .line 619
    .line 620
    .line 621
    .line 622
    .line 623
    .line 624
    .line 625
    .line 626
    .line 627
    .line 628
    .line 629
    .line 630
    .line 631
    .line 632
    .line 633
    .line 634
    .line 635
    .line 636
    .line 637
    .line 638
    .line 639
    .line 640
    .line 641
    .line 642
    .line 643
    .line 644
    .line 645
    .line 646
    .line 647
    .line 648
    .line 649
    .line 650
    .line 651
    .line 652
    .line 653
    .line 654
    .line 655
    .line 656
    .line 657
    .line 658
    .line 659
    .line 660
    .line 661
    .line 662
    .line 663
    .line 664
    .line 665
    .line 666
    .line 667
    .line 668
    .line 669
    .line 670
    .line 671
    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 615
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->roomId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "roomId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->uid:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "uid"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userName:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "userName"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameColor:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "userNameColor"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string p0, "userNameGradientColors"

    .line 42
    .line 43
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userNameGradientColors:Ljava/util/List;

    .line 47
    .line 48
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 49
    .line 50
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userImage:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const-string v0, "userImage"

    .line 58
    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    :cond_5
    const-string p0, "userGrade"

    .line 63
    .line 64
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGrade:J

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 67
    .line 68
    .line 69
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->userGradeIcon:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const-string v0, "userGradeIcon"

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentText:Ljava/lang/String;

    .line 79
    .line 80
    if-eqz p0, :cond_7

    .line 81
    .line 82
    const-string v0, "contentText"

    .line 83
    .line 84
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->contentTextColor:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    const-string v0, "contentTextColor"

    .line 92
    .line 93
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->bgUrl:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p0, :cond_9

    .line 99
    .line 100
    const-string v0, "bgUrl"

    .line 101
    .line 102
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->floatBgUrl:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_a

    .line 108
    .line 109
    const-string v0, "floatBgUrl"

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->effectId:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_b

    .line 117
    .line 118
    const-string v0, "effectId"

    .line 119
    .line 120
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_b
    const-string p0, "showDuration"

    .line 124
    .line 125
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->showDuration:J

    .line 126
    .line 127
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 128
    .line 129
    .line 130
    const-string p0, "isWealthHierarchy"

    .line 131
    .line 132
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->isWealthHierarchy:Z

    .line 133
    .line 134
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    const-string p0, "avatarGradientDirection"

    .line 138
    .line 139
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradientDirection:I

    .line 140
    .line 141
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 145
    .line 146
    if-eqz p0, :cond_c

    .line 147
    .line 148
    const-string p0, "avatarGradients"

    .line 149
    .line 150
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->avatarGradients:Ljava/util/List;

    .line 154
    .line 155
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 156
    .line 157
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 158
    .line 159
    .line 160
    :cond_c
    const-string p0, "backgroundGradientDirection"

    .line 161
    .line 162
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradientDirection:I

    .line 163
    .line 164
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 168
    .line 169
    if-eqz p0, :cond_d

    .line 170
    .line 171
    const-string p0, "backgroundGradients"

    .line 172
    .line 173
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundGradients:Ljava/util/List;

    .line 177
    .line 178
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 179
    .line 180
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 181
    .line 182
    .line 183
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterRoomEffectId:Ljava/lang/String;

    .line 184
    .line 185
    if-eqz p0, :cond_e

    .line 186
    .line 187
    const-string v0, "enterRoomEffectId"

    .line 188
    .line 189
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    :cond_e
    const-string p0, "backgroundUrlEndMargin"

    .line 193
    .line 194
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->backgroundUrlEndMargin:J

    .line 195
    .line 196
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 197
    .line 198
    .line 199
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->fixedBackgroundUrl:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz p0, :cond_f

    .line 202
    .line 203
    const-string v0, "fixedBackgroundUrl"

    .line 204
    .line 205
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    :cond_f
    const-string p0, "animationSizeType"

    .line 209
    .line 210
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->animationSizeType:J

    .line 211
    .line 212
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 213
    .line 214
    .line 215
    const-string p0, "enterVersion"

    .line 216
    .line 217
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->enterVersion:J

    .line 218
    .line 219
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newFloatingUrl:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz p0, :cond_10

    .line 225
    .line 226
    const-string v0, "newFloatingUrl"

    .line 227
    .line 228
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->newResourceId:Ljava/lang/String;

    .line 232
    .line 233
    if-eqz p0, :cond_11

    .line 234
    .line 235
    const-string v0, "newResourceId"

    .line 236
    .line 237
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 241
    .line 242
    if-eqz p0, :cond_12

    .line 243
    .line 244
    const-string p0, "videoEffectExtras"

    .line 245
    .line 246
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->videoEffectExtras:Ljava/util/List;

    .line 250
    .line 251
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveSpecialEffectResources;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 254
    .line 255
    .line 256
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->resourceId:Ljava/lang/String;

    .line 257
    .line 258
    if-eqz p0, :cond_13

    .line 259
    .line 260
    const-string v0, "resourceId"

    .line 261
    .line 262
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 263
    .line 264
    .line 265
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 266
    .line 267
    if-eqz p0, :cond_14

    .line 268
    .line 269
    const-string p0, "dynamicEffectExtends"

    .line 270
    .line 271
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 272
    .line 273
    .line 274
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;->dynamicEffectExtends:Ljava/util/List;

    .line 275
    .line 276
    sget-object p1, Lcom/p1/mobile/putong/live/base/data/BLiveDynamicEffectExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 277
    .line 278
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 279
    .line 280
    .line 281
    :cond_14
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 282
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveEnterRoom;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
