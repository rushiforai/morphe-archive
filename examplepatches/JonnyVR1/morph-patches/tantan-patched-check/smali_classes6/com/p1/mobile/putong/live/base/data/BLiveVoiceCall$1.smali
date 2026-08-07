.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;",
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
    const-string p0, "anchorUserName"

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
    const-string p0, "intendPosition"

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
    const-string p0, "awayReason"

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
    const-string p0, "hangupReason"

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
    const-string p0, "mutedByUser"

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
    const-string p0, "contribution"

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
    const-string p0, "anchorPicture"

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
    const-string p0, "callEffect"

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
    const-string p0, "position"

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
    const-string p0, "inviteId"

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
    const-string p0, "mutedByAnchor"

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
    const-string p0, "state"

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
    const-string p0, "user"

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
    const-string p0, "type"

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
    const-string p0, "role"

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
    const-string p0, "id"

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
    const-string p0, "userName"

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
    const-string p0, "voiceLiveId"

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
    const-string p0, "userSendRewardPoint"

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
    const-string p0, "userRecvRewardPoint"

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
    const-string p0, "userPicture"

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
    const-string p0, "inAction"

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
    const-string p0, "source"

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
    const-string p0, "userNameGradientColors"

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
    const-string p0, "isHost"

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
    const-string p0, "isAway"

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
    const-string p0, "anchor"

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
    const-string p0, "popularity"

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
    const-string p0, "startTime"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 402
    .line 403
    .line 404
    move-result-object p0

    .line 405
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 406
    .line 407
    return v1

    .line 408
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 409
    .line 410
    .line 411
    move-result p0

    .line 412
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 413
    .line 414
    return v1

    .line 415
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 420
    .line 421
    return v1

    .line 422
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object p0

    .line 426
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 427
    .line 428
    return v1

    .line 429
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 430
    .line 431
    .line 432
    move-result p0

    .line 433
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 434
    .line 435
    return v1

    .line 436
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 437
    .line 438
    .line 439
    move-result-wide p2

    .line 440
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 441
    .line 442
    return v1

    .line 443
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 444
    .line 445
    .line 446
    move-result-object p0

    .line 447
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 448
    .line 449
    return v1

    .line 450
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 451
    .line 452
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 453
    .line 454
    .line 455
    move-result-object p0

    .line 456
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 457
    .line 458
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 459
    .line 460
    return v1

    .line 461
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 462
    .line 463
    .line 464
    move-result p0

    .line 465
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 473
    .line 474
    return v1

    .line 475
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 476
    .line 477
    .line 478
    move-result p0

    .line 479
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 487
    .line 488
    return v1

    .line 489
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 490
    .line 491
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object p0

    .line 495
    check-cast p0, Ljava/lang/String;

    .line 496
    .line 497
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 498
    .line 499
    return v1

    .line 500
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object p0

    .line 504
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 505
    .line 506
    return v1

    .line 507
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 508
    .line 509
    .line 510
    move-result-object p0

    .line 511
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 512
    .line 513
    return v1

    .line 514
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object p0

    .line 518
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

    .line 519
    .line 520
    return v0

    .line 521
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 522
    .line 523
    .line 524
    move-result-object p0

    .line 525
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 526
    .line 527
    return v1

    .line 528
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 529
    .line 530
    .line 531
    move-result-object p0

    .line 532
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 533
    .line 534
    return v1

    .line 535
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 536
    .line 537
    .line 538
    move-result-wide p2

    .line 539
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 540
    .line 541
    return v1

    .line 542
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 543
    .line 544
    .line 545
    move-result-wide p2

    .line 546
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 547
    .line 548
    return v1

    .line 549
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 568
    .line 569
    return v1

    .line 570
    :pswitch_17
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 571
    .line 572
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 573
    .line 574
    .line 575
    move-result-object p0

    .line 576
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 577
    .line 578
    return v1

    .line 579
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 580
    .line 581
    .line 582
    move-result p0

    .line 583
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 584
    .line 585
    return v1

    .line 586
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 587
    .line 588
    .line 589
    move-result p0

    .line 590
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 591
    .line 592
    return v1

    .line 593
    :pswitch_1a
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 594
    .line 595
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 596
    .line 597
    .line 598
    move-result-object p0

    .line 599
    check-cast p0, Ljava/lang/String;

    .line 600
    .line 601
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 602
    .line 603
    return v1

    .line 604
    :pswitch_1b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 605
    .line 606
    .line 607
    move-result-wide p2

    .line 608
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 609
    .line 610
    return v1

    .line 611
    :pswitch_1c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object p0

    .line 615
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 616
    .line 617
    return v1

    .line 618
    nop

    .line 619
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_1c
        -0x789df4cb -> :sswitch_1b
        -0x543d3d4b -> :sswitch_1a
        -0x465f40c8 -> :sswitch_19
        -0x465c2e0e -> :sswitch_18
        -0x3c9da0aa -> :sswitch_17
        -0x356f97e5 -> :sswitch_16
        -0x3522b845 -> :sswitch_15
        -0x346dc14d -> :sswitch_14
        -0x28262570 -> :sswitch_13
        -0x19271452 -> :sswitch_12
        -0x10133107 -> :sswitch_11
        -0xfe5030a -> :sswitch_10
        0xd1b -> :sswitch_f
        0x358076 -> :sswitch_e
        0x368f3a -> :sswitch_d
        0x36ebcb -> :sswitch_c
        0x68ac491 -> :sswitch_b
        0x13579877 -> :sswitch_a
        0x25a29a04 -> :sswitch_9
        0x2c929929 -> :sswitch_8
        0x4600618f -> :sswitch_7
        0x4cfcac89 -> :sswitch_6
        0x5203a410 -> :sswitch_5
        0x572a4a0d -> :sswitch_4
        0x5a381b31 -> :sswitch_3
        0x6a71f6d2 -> :sswitch_2
        0x6db4e7d5 -> :sswitch_1
        0x6e389ecb -> :sswitch_0
    .end sparse-switch

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
    .line 734
    .line 735
    .line 736
    .line 737
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

    .line 619
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->type:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "type"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->voiceLiveId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "voiceLiveId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->state:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "state"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->source:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "source"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 47
    .line 48
    const/4 v0, 0x1

    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const-string p0, "user"

    .line 52
    .line 53
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 57
    .line 58
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->user:Ljava/lang/String;

    .line 59
    .line 60
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 61
    .line 62
    .line 63
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz p0, :cond_6

    .line 66
    .line 67
    const-string p0, "anchor"

    .line 68
    .line 69
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 73
    .line 74
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchor:Ljava/lang/String;

    .line 75
    .line 76
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 77
    .line 78
    .line 79
    :cond_6
    const-string p0, "userSendRewardPoint"

    .line 80
    .line 81
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userSendRewardPoint:J

    .line 82
    .line 83
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 84
    .line 85
    .line 86
    const-string p0, "userRecvRewardPoint"

    .line 87
    .line 88
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userRecvRewardPoint:J

    .line 89
    .line 90
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 91
    .line 92
    .line 93
    const-string p0, "intendPosition"

    .line 94
    .line 95
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->intendPosition:I

    .line 96
    .line 97
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    const-string p0, "position"

    .line 101
    .line 102
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->position:I

    .line 103
    .line 104
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    const-string p0, "mutedByUser"

    .line 108
    .line 109
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByUser:Z

    .line 110
    .line 111
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    const-string p0, "mutedByAnchor"

    .line 115
    .line 116
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->mutedByAnchor:Z

    .line 117
    .line 118
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    const-string p0, "isAway"

    .line 122
    .line 123
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isAway:Z

    .line 124
    .line 125
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inviteId:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_7

    .line 131
    .line 132
    const-string v1, "inviteId"

    .line 133
    .line 134
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userName:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz p0, :cond_8

    .line 140
    .line 141
    const-string v1, "userName"

    .line 142
    .line 143
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorUserName:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string v1, "anchorUserName"

    .line 151
    .line 152
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userPicture:Ljava/lang/String;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string v1, "userPicture"

    .line 160
    .line 161
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->anchorPicture:Ljava/lang/String;

    .line 165
    .line 166
    if-eqz p0, :cond_b

    .line 167
    .line 168
    const-string v1, "anchorPicture"

    .line 169
    .line 170
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 171
    .line 172
    .line 173
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->hangupReason:Ljava/lang/String;

    .line 174
    .line 175
    if-eqz p0, :cond_c

    .line 176
    .line 177
    const-string v1, "hangupReason"

    .line 178
    .line 179
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->role:Ljava/lang/String;

    .line 183
    .line 184
    if-eqz p0, :cond_d

    .line 185
    .line 186
    const-string v1, "role"

    .line 187
    .line 188
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->awayReason:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz p0, :cond_e

    .line 194
    .line 195
    const-string v1, "awayReason"

    .line 196
    .line 197
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->startTime:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz p0, :cond_f

    .line 203
    .line 204
    const-string v1, "startTime"

    .line 205
    .line 206
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->inAction:Ljava/lang/String;

    .line 210
    .line 211
    if-eqz p0, :cond_10

    .line 212
    .line 213
    const-string v1, "inAction"

    .line 214
    .line 215
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    :cond_10
    const-string p0, "popularity"

    .line 219
    .line 220
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->popularity:J

    .line 221
    .line 222
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 223
    .line 224
    .line 225
    const-string p0, "contribution"

    .line 226
    .line 227
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->contribution:J

    .line 228
    .line 229
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 230
    .line 231
    .line 232
    const-string p0, "isHost"

    .line 233
    .line 234
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->isHost:Z

    .line 235
    .line 236
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 237
    .line 238
    .line 239
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 240
    .line 241
    if-eqz p0, :cond_11

    .line 242
    .line 243
    const-string p0, "callEffect"

    .line 244
    .line 245
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 249
    .line 250
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->callEffect:Lcom/p1/mobile/putong/live/base/data/BLiveCallEffectConfig;

    .line 251
    .line 252
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 253
    .line 254
    .line 255
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 256
    .line 257
    if-eqz p0, :cond_12

    .line 258
    .line 259
    const-string p0, "userNameGradientColors"

    .line 260
    .line 261
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 262
    .line 263
    .line 264
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;->userNameGradientColors:Ljava/util/List;

    .line 265
    .line 266
    sget-object p1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 267
    .line 268
    invoke-static {p0, p2, p1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 269
    .line 270
    .line 271
    :cond_12
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 272
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
