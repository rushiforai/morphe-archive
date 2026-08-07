.class Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSummary;",
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
    const-string p0, "newFollowCount"

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
    const-string p0, "rewardPointType"

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
    const-string p0, "receivedGifts"

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
    const-string p0, "bonusGifts"

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
    const-string p0, "rewarderCount"

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
    const-string p0, "liveOrder"

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
    const-string p0, "officialShowSummary"

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
    const-string p0, "rewardPoint"

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
    const-string p0, "strawberry"

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
    const-string p0, "spark"

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
    const-string p0, "type"

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
    const-string p0, "chatMsgCount"

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
    const-string p0, "voiceCallId"

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
    const-string p0, "riseDirection"

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
    const-string p0, "receiveGiftsUserCount"

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
    const-string p0, "voiceCallCount"

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
    const-string p0, "roomId"

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
    const-string p0, "liveId"

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
    const-string p0, "newFanbaseCount"

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
    const-string p0, "endTime"

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
    const-string p0, "duration"

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
    const-string p0, "audienceCount"

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
    packed-switch v2, :pswitch_data_0

    .line 314
    .line 315
    .line 316
    return v0

    .line 317
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 318
    .line 319
    .line 320
    move-result-wide p2

    .line 321
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 322
    .line 323
    return v1

    .line 324
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 329
    .line 330
    return v1

    .line 331
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 332
    .line 333
    .line 334
    move-result p0

    .line 335
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 345
    .line 346
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 347
    .line 348
    return v1

    .line 349
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 350
    .line 351
    .line 352
    move-result-wide p2

    .line 353
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 354
    .line 355
    return v1

    .line 356
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 357
    .line 358
    .line 359
    move-result-wide p2

    .line 360
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 361
    .line 362
    return v1

    .line 363
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 364
    .line 365
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 370
    .line 371
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 372
    .line 373
    return v1

    .line 374
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 375
    .line 376
    .line 377
    move-result-wide p2

    .line 378
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 379
    .line 380
    return v1

    .line 381
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 382
    .line 383
    .line 384
    move-result-wide p2

    .line 385
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 386
    .line 387
    return v1

    .line 388
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 389
    .line 390
    .line 391
    move-result p0

    .line 392
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 393
    .line 394
    return v1

    .line 395
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 400
    .line 401
    return v1

    .line 402
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 403
    .line 404
    .line 405
    move-result p0

    .line 406
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 407
    .line 408
    return v1

    .line 409
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 414
    .line 415
    return v1

    .line 416
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 421
    .line 422
    return v1

    .line 423
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 424
    .line 425
    .line 426
    move-result p0

    .line 427
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 428
    .line 429
    return v1

    .line 430
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 431
    .line 432
    .line 433
    move-result-wide p2

    .line 434
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 435
    .line 436
    return v1

    .line 437
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 438
    .line 439
    .line 440
    move-result-object p0

    .line 441
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 442
    .line 443
    return v1

    .line 444
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 449
    .line 450
    return v1

    .line 451
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 452
    .line 453
    .line 454
    move-result p0

    .line 455
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 456
    .line 457
    return v1

    .line 458
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 459
    .line 460
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    move-result-object p0

    .line 464
    check-cast p0, Ljava/lang/Double;

    .line 465
    .line 466
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 467
    .line 468
    .line 469
    move-result-wide p2

    .line 470
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 471
    .line 472
    return v1

    .line 473
    :pswitch_14
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 474
    .line 475
    .line 476
    move-result-wide p2

    .line 477
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 478
    .line 479
    return v1

    .line 480
    :pswitch_15
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 481
    .line 482
    .line 483
    move-result-wide p2

    .line 484
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 485
    .line 486
    return v1

    .line 487
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 488
    .line 489
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    check-cast p0, Ljava/lang/Double;

    .line 494
    .line 495
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 496
    .line 497
    .line 498
    move-result-wide p2

    .line 499
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 500
    .line 501
    return v1

    .line 502
    nop

    .line 503
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_16
        -0x79ace695 -> :sswitch_15
        -0x76bbb26c -> :sswitch_14
        -0x5fcc95b8 -> :sswitch_13
        -0x59574335 -> :sswitch_12
        -0x41b5d0d9 -> :sswitch_11
        -0x372740aa -> :sswitch_10
        -0x2421d7c1 -> :sswitch_f
        -0x2054503c -> :sswitch_e
        -0x2002314a -> :sswitch_d
        -0x1fe3fc15 -> :sswitch_c
        -0x14bf9e7a -> :sswitch_b
        0x368f3a -> :sswitch_a
        0x688f2dd -> :sswitch_9
        0xa27e14f -> :sswitch_8
        0x34b93ba1 -> :sswitch_7
        0x35bf19fe -> :sswitch_6
        0x3b4199c2 -> :sswitch_5
        0x45434653 -> :sswitch_4
        0x661ae864 -> :sswitch_3
        0x7449e7e2 -> :sswitch_2
        0x78a8867b -> :sswitch_1
        0x7b99861e -> :sswitch_0
    .end sparse-switch

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
    .line 542
    .line 543
    .line 544
    .line 545
    .line 546
    .line 547
    .line 548
    .line 549
    .line 550
    .line 551
    .line 552
    .line 553
    .line 554
    .line 555
    .line 556
    .line 557
    .line 558
    .line 559
    .line 560
    .line 561
    .line 562
    .line 563
    .line 564
    .line 565
    .line 566
    .line 567
    .line 568
    .line 569
    .line 570
    .line 571
    .line 572
    .line 573
    .line 574
    .line 575
    .line 576
    .line 577
    .line 578
    .line 579
    .line 580
    .line 581
    .line 582
    .line 583
    .line 584
    .line 585
    .line 586
    .line 587
    .line 588
    .line 589
    .line 590
    .line 591
    .line 592
    .line 593
    .line 594
    .line 595
    .line 596
    .line 597
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

    .line 503
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "liveId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->roomId:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "roomId"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "liveOrder"

    .line 20
    .line 21
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->liveOrder:J

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    const-string p0, "duration"

    .line 27
    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->duration:J

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 31
    .line 32
    .line 33
    const-string p0, "rewardPoint"

    .line 34
    .line 35
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPoint:D

    .line 36
    .line 37
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 38
    .line 39
    .line 40
    const-string p0, "rewarderCount"

    .line 41
    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewarderCount:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 45
    .line 46
    .line 47
    const-string p0, "newFollowCount"

    .line 48
    .line 49
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFollowCount:D

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 52
    .line 53
    .line 54
    const-string p0, "audienceCount"

    .line 55
    .line 56
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->audienceCount:D

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 59
    .line 60
    .line 61
    const-string p0, "voiceCallCount"

    .line 62
    .line 63
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallCount:D

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 66
    .line 67
    .line 68
    const-string p0, "startTime"

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->startTime:D

    .line 76
    .line 77
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x1

    .line 82
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 83
    .line 84
    .line 85
    const-string v0, "endTime"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 88
    .line 89
    .line 90
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->endTime:D

    .line 91
    .line 92
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->type:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz p0, :cond_2

    .line 102
    .line 103
    const-string v0, "type"

    .line 104
    .line 105
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    :cond_2
    const-string p0, "strawberry"

    .line 109
    .line 110
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->strawberry:D

    .line 111
    .line 112
    invoke-virtual {p2, p0, v2, v3}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 113
    .line 114
    .line 115
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 116
    .line 117
    if-eqz p0, :cond_3

    .line 118
    .line 119
    const-string p0, "bonusGifts"

    .line 120
    .line 121
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->bonusGifts:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceBonusGifts;

    .line 127
    .line 128
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 129
    .line 130
    .line 131
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->voiceCallId:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_4

    .line 134
    .line 135
    const-string v0, "voiceCallId"

    .line 136
    .line 137
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_4
    const-string p0, "spark"

    .line 141
    .line 142
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->spark:I

    .line 143
    .line 144
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 145
    .line 146
    .line 147
    const-string p0, "receivedGifts"

    .line 148
    .line 149
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receivedGifts:I

    .line 150
    .line 151
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 152
    .line 153
    .line 154
    const-string p0, "receiveGiftsUserCount"

    .line 155
    .line 156
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->receiveGiftsUserCount:I

    .line 157
    .line 158
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 159
    .line 160
    .line 161
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->rewardPointType:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz p0, :cond_5

    .line 164
    .line 165
    const-string v0, "rewardPointType"

    .line 166
    .line 167
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    :cond_5
    const-string p0, "newFanbaseCount"

    .line 171
    .line 172
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->newFanbaseCount:I

    .line 173
    .line 174
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 175
    .line 176
    .line 177
    const-string p0, "chatMsgCount"

    .line 178
    .line 179
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->chatMsgCount:I

    .line 180
    .line 181
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 182
    .line 183
    .line 184
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 185
    .line 186
    if-eqz p0, :cond_6

    .line 187
    .line 188
    const-string p0, "officialShowSummary"

    .line 189
    .line 190
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 194
    .line 195
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->officialShowSummary:Lcom/p1/mobile/putong/live/base/data/BLiveOfficialShowSummary;

    .line 196
    .line 197
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 198
    .line 199
    .line 200
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;->riseDirection:Ljava/lang/String;

    .line 201
    .line 202
    if-eqz p0, :cond_7

    .line 203
    .line 204
    const-string p1, "riseDirection"

    .line 205
    .line 206
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    :cond_7
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSummary;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSummary$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSummary;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
