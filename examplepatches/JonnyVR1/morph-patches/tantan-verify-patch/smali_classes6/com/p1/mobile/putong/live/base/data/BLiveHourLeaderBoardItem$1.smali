.class Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;",
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
    const-string p0, "currentHourSuggestConfig"

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
    const-string p0, "liveType"

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
    const-string p0, "liveRole"

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
    const-string p0, "msgType"

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
    const-string p0, "liveState"

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
    const-string p0, "userImage"

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
    const-string p0, "rank"

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
    const-string p0, "gap"

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
    const-string p0, "age"

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
    const-string p0, "userName"

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
    const-string p0, "userId"

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
    const-string p0, "roomId"

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
    const-string p0, "liveId"

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
    const-string p0, "gender"

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
    const-string p0, "amount"

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
    const-string p0, "anchorGrade"

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
    const-string p0, "backgroundUrl"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 234
    .line 235
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 240
    .line 241
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 242
    .line 243
    return v1

    .line 244
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveType:Ljava/lang/String;

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveRole:Ljava/lang/String;

    .line 256
    .line 257
    return v1

    .line 258
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 259
    .line 260
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 265
    .line 266
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 267
    .line 268
    return v1

    .line 269
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 270
    .line 271
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 276
    .line 277
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 278
    .line 279
    return v1

    .line 280
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object p0

    .line 284
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userImage:Ljava/lang/String;

    .line 285
    .line 286
    return v1

    .line 287
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 288
    .line 289
    .line 290
    move-result-wide p2

    .line 291
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 292
    .line 293
    return v1

    .line 294
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 295
    .line 296
    .line 297
    move-result-wide p2

    .line 298
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->gap:J

    .line 299
    .line 300
    return v1

    .line 301
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->age:I

    .line 306
    .line 307
    return v1

    .line 308
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userName:Ljava/lang/String;

    .line 313
    .line 314
    return v1

    .line 315
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 320
    .line 321
    return v1

    .line 322
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 327
    .line 328
    return v1

    .line 329
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 334
    .line 335
    return v1

    .line 336
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->gender:Ljava/lang/String;

    .line 341
    .line 342
    return v1

    .line 343
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 344
    .line 345
    .line 346
    move-result-wide p2

    .line 347
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 348
    .line 349
    return v1

    .line 350
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 351
    .line 352
    .line 353
    move-result p0

    .line 354
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->anchorGrade:I

    .line 355
    .line 356
    return v1

    .line 357
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->backgroundUrl:Ljava/lang/String;

    .line 362
    .line 363
    return v1

    .line 364
    nop

    .line 365
    :sswitch_data_0
    .sparse-switch
        -0x70de3e9f -> :sswitch_10
        -0x5d5e89de -> :sswitch_f
        -0x5445afa8 -> :sswitch_e
        -0x4a7a0d3f -> :sswitch_d
        -0x41b5d0d9 -> :sswitch_c
        -0x372740aa -> :sswitch_b
        -0x31d4d1ba -> :sswitch_a
        -0xfe5030a -> :sswitch_9
        0x178ff -> :sswitch_8
        0x18ed6 -> :sswitch_7
        0x354c2c -> :sswitch_6
        0x13037450 -> :sswitch_5
        0x3b7ad705 -> :sswitch_4
        0x5018025b -> :sswitch_3
        0x547f4f82 -> :sswitch_2
        0x54805e46 -> :sswitch_1
        0x7d851be9 -> :sswitch_0
    .end sparse-switch

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
    .line 434
    .line 435
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

    .line 365
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "rank"

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->rank:J

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userId:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string v0, "userId"

    .line 13
    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->roomId:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_1

    .line 20
    .line 21
    const-string v0, "roomId"

    .line 22
    .line 23
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveId:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "liveId"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userImage:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string v0, "userImage"

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->userName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const-string v0, "userName"

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    const-string p0, "amount"

    .line 54
    .line 55
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->amount:J

    .line 56
    .line 57
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 58
    .line 59
    .line 60
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 61
    .line 62
    const/4 v0, 0x1

    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string p0, "liveState"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveState:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 73
    .line 74
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 75
    .line 76
    .line 77
    :cond_5
    const-string p0, "gap"

    .line 78
    .line 79
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->gap:J

    .line 80
    .line 81
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 85
    .line 86
    if-eqz p0, :cond_6

    .line 87
    .line 88
    const-string p0, "currentHourSuggestConfig"

    .line 89
    .line 90
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 94
    .line 95
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->currentHourSuggestConfig:Lcom/p1/mobile/putong/live/base/data/BLiveCurrentHourSuggestConfig;

    .line 96
    .line 97
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 98
    .line 99
    .line 100
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 101
    .line 102
    if-eqz p0, :cond_7

    .line 103
    .line 104
    const-string p0, "msgType"

    .line 105
    .line 106
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->msgType:Lcom/p1/mobile/putong/live/base/data/BLiveRankingMsgType;

    .line 112
    .line 113
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 114
    .line 115
    .line 116
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveType:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz p0, :cond_8

    .line 119
    .line 120
    const-string v0, "liveType"

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->liveRole:Ljava/lang/String;

    .line 126
    .line 127
    if-eqz p0, :cond_9

    .line 128
    .line 129
    const-string v0, "liveRole"

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->gender:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    const-string v0, "gender"

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_a
    const-string p0, "age"

    .line 144
    .line 145
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->age:I

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 148
    .line 149
    .line 150
    const-string p0, "anchorGrade"

    .line 151
    .line 152
    iget v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->anchorGrade:I

    .line 153
    .line 154
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;->backgroundUrl:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz p0, :cond_b

    .line 160
    .line 161
    const-string p1, "backgroundUrl"

    .line 162
    .line 163
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_b
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveHourLeaderBoardItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
