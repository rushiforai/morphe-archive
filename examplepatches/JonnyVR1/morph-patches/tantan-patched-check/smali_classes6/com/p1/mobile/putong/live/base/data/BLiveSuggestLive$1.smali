.class Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;",
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
    const-string p0, "redPacketIds"

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
    const/16 v2, 0x19

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "multiCallExtend"

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
    const/16 v2, 0x18

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "multiCallInfo"

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
    const/16 v2, 0x17

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "guildCallExtend"

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
    const/16 v2, 0x16

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "rtcInfo"

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
    const/16 v2, 0x15

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "liveType"

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
    const/16 v2, 0x14

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "liveMode"

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
    const/16 v2, 0x13

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "memberCount"

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
    const/16 v2, 0x12

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "streamCdnInfo"

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
    const/16 v2, 0x11

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "coverLabelsV2"

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
    const/16 v2, 0x10

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "videoCaptureUrl"

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
    const/16 v2, 0xf

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "intlFrame"

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
    const/16 v2, 0xe

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "chatMessages"

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
    const/16 v2, 0xd

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string p0, "state"

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
    const/16 v2, 0xc

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string p0, "room"

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
    const/16 v2, 0xb

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
    const/16 v2, 0xa

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_10
    const-string p0, "callback"

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
    const/16 v2, 0x9

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_11
    const-string p0, "coverLabels"

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
    const/16 v2, 0x8

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_12
    const-string p0, "basicLabel"

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
    goto :goto_0

    .line 277
    :cond_12
    const/4 v2, 0x7

    .line 278
    goto :goto_0

    .line 279
    :sswitch_13
    const-string p0, "recommendInfo"

    .line 280
    .line 281
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    if-nez p0, :cond_13

    .line 286
    .line 287
    goto :goto_0

    .line 288
    :cond_13
    const/4 v2, 0x6

    .line 289
    goto :goto_0

    .line 290
    :sswitch_14
    const-string p0, "specialLabel"

    .line 291
    .line 292
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p0

    .line 296
    if-nez p0, :cond_14

    .line 297
    .line 298
    goto :goto_0

    .line 299
    :cond_14
    const/4 v2, 0x5

    .line 300
    goto :goto_0

    .line 301
    :sswitch_15
    const-string p0, "anchor"

    .line 302
    .line 303
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 304
    .line 305
    .line 306
    move-result p0

    .line 307
    if-nez p0, :cond_15

    .line 308
    .line 309
    goto :goto_0

    .line 310
    :cond_15
    const/4 v2, 0x4

    .line 311
    goto :goto_0

    .line 312
    :sswitch_16
    const-string p0, "streamFlvUrlIpv6"

    .line 313
    .line 314
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    move-result p0

    .line 318
    if-nez p0, :cond_16

    .line 319
    .line 320
    goto :goto_0

    .line 321
    :cond_16
    const/4 v2, 0x3

    .line 322
    goto :goto_0

    .line 323
    :sswitch_17
    const-string p0, "streamFlvUrl"

    .line 324
    .line 325
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    move-result p0

    .line 329
    if-nez p0, :cond_17

    .line 330
    .line 331
    goto :goto_0

    .line 332
    :cond_17
    const/4 v2, 0x2

    .line 333
    goto :goto_0

    .line 334
    :sswitch_18
    const-string p0, "videoCaptureScore"

    .line 335
    .line 336
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    if-nez p0, :cond_18

    .line 341
    .line 342
    goto :goto_0

    .line 343
    :cond_18
    move v2, v1

    .line 344
    goto :goto_0

    .line 345
    :sswitch_19
    const-string p0, "subtitle"

    .line 346
    .line 347
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 348
    .line 349
    .line 350
    move-result p0

    .line 351
    if-nez p0, :cond_19

    .line 352
    .line 353
    goto :goto_0

    .line 354
    :cond_19
    move v2, v0

    .line 355
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 356
    .line 357
    .line 358
    return v0

    .line 359
    :pswitch_0
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 360
    .line 361
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 366
    .line 367
    return v1

    .line 368
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 369
    .line 370
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 375
    .line 376
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 377
    .line 378
    return v1

    .line 379
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 380
    .line 381
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 386
    .line 387
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 388
    .line 389
    return v1

    .line 390
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 391
    .line 392
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 397
    .line 398
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 399
    .line 400
    return v1

    .line 401
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 402
    .line 403
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 408
    .line 409
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 410
    .line 411
    return v1

    .line 412
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 413
    .line 414
    .line 415
    move-result-object p0

    .line 416
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 417
    .line 418
    return v1

    .line 419
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 420
    .line 421
    .line 422
    move-result-object p0

    .line 423
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 424
    .line 425
    return v1

    .line 426
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 427
    .line 428
    .line 429
    move-result p0

    .line 430
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 431
    .line 432
    return v1

    .line 433
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 434
    .line 435
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object p0

    .line 439
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 440
    .line 441
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 442
    .line 443
    return v1

    .line 444
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 445
    .line 446
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 447
    .line 448
    .line 449
    move-result-object p0

    .line 450
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 451
    .line 452
    return v1

    .line 453
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object p0

    .line 457
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 458
    .line 459
    return v1

    .line 460
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 461
    .line 462
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 463
    .line 464
    .line 465
    move-result-object p0

    .line 466
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 467
    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    .line 473
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 478
    .line 479
    return v1

    .line 480
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object p0

    .line 484
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 485
    .line 486
    return v1

    .line 487
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 488
    .line 489
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 490
    .line 491
    .line 492
    move-result-object p0

    .line 493
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 494
    .line 495
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 496
    .line 497
    return v1

    .line 498
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object p0

    .line 502
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

    .line 503
    .line 504
    return v0

    .line 505
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 506
    .line 507
    .line 508
    move-result-object p0

    .line 509
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 510
    .line 511
    return v1

    .line 512
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 513
    .line 514
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 515
    .line 516
    .line 517
    move-result-object p0

    .line 518
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 519
    .line 520
    return v1

    .line 521
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 522
    .line 523
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object p0

    .line 527
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 528
    .line 529
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 530
    .line 531
    return v1

    .line 532
    :pswitch_13
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 533
    .line 534
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object p0

    .line 538
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 539
    .line 540
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 541
    .line 542
    return v1

    .line 543
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 544
    .line 545
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 546
    .line 547
    .line 548
    move-result-object p0

    .line 549
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 550
    .line 551
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 552
    .line 553
    return v1

    .line 554
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 555
    .line 556
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    move-result-object p0

    .line 560
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 561
    .line 562
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 563
    .line 564
    return v1

    .line 565
    :pswitch_16
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 566
    .line 567
    .line 568
    move-result-object p0

    .line 569
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 570
    .line 571
    return v1

    .line 572
    :pswitch_17
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 573
    .line 574
    .line 575
    move-result-object p0

    .line 576
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 577
    .line 578
    return v1

    .line 579
    :pswitch_18
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 580
    .line 581
    .line 582
    move-result-wide p2

    .line 583
    double-to-float p0, p2

    .line 584
    iput p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 585
    .line 586
    return v1

    .line 587
    :pswitch_19
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object p0

    .line 591
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 592
    .line 593
    return v1

    .line 594
    nop

    .line 595
    :sswitch_data_0
    .sparse-switch
        -0x7ad0b3e8 -> :sswitch_19
        -0x750654f9 -> :sswitch_18
        -0x6be83981 -> :sswitch_17
        -0x621aaefa -> :sswitch_16
        -0x543d3d4b -> :sswitch_15
        -0x4c742645 -> :sswitch_14
        -0x4415d476 -> :sswitch_13
        -0x4412d89a -> :sswitch_12
        -0x1699456a -> :sswitch_11
        -0xa43dfbb -> :sswitch_10
        0xd1b -> :sswitch_f
        0x3580db -> :sswitch_e
        0x68ac491 -> :sswitch_d
        0x1dc120c4 -> :sswitch_c
        0x2780c510 -> :sswitch_b
        0x28a2cb24 -> :sswitch_a
        0x2aa277b2 -> :sswitch_9
        0x421152db -> :sswitch_8
        0x50f26695 -> :sswitch_7
        0x547d08af -> :sswitch_6
        0x54805e46 -> :sswitch_5
        0x5a0e7aaf -> :sswitch_4
        0x5b806b6b -> :sswitch_3
        0x5d59e485 -> :sswitch_2
        0x6832a531 -> :sswitch_1
        0x7b1f9f7f -> :sswitch_0
    .end sparse-switch

    .line 596
    .line 597
    .line 598
    .line 599
    .line 600
    .line 601
    .line 602
    .line 603
    .line 604
    .line 605
    .line 606
    .line 607
    .line 608
    .line 609
    .line 610
    .line 611
    .line 612
    .line 613
    .line 614
    .line 615
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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 595
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 11
    .line 12
    const/4 v0, 0x1

    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const-string p0, "room"

    .line 16
    .line 17
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->room:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveRoom;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "anchor"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLiveAnchor;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrl:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string v1, "streamFlvUrl"

    .line 48
    .line 49
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    const-string p0, "streamCdnInfo"

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 64
    .line 65
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const-string p0, "recommendInfo"

    .line 73
    .line 74
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 78
    .line 79
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->recommendInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRecommendInfo;

    .line 80
    .line 81
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 82
    .line 83
    .line 84
    :cond_5
    const-string p0, "memberCount"

    .line 85
    .line 86
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->memberCount:I

    .line 87
    .line 88
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureUrl:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string v1, "videoCaptureUrl"

    .line 96
    .line 97
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->state:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz p0, :cond_7

    .line 103
    .line 104
    const-string v1, "state"

    .line 105
    .line 106
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->callback:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz p0, :cond_8

    .line 112
    .line 113
    const-string v1, "callback"

    .line 114
    .line 115
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 119
    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    const-string p0, "specialLabel"

    .line 123
    .line 124
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 128
    .line 129
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->specialLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 130
    .line 131
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 135
    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    const-string p0, "basicLabel"

    .line 139
    .line 140
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 144
    .line 145
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->basicLabel:Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLabel;

    .line 146
    .line 147
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 148
    .line 149
    .line 150
    :cond_a
    const-string p0, "videoCaptureScore"

    .line 151
    .line 152
    iget v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->videoCaptureScore:F

    .line 153
    .line 154
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 155
    .line 156
    .line 157
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 158
    .line 159
    if-eqz p0, :cond_b

    .line 160
    .line 161
    const-string p0, "multiCallInfo"

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 167
    .line 168
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallInfo:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInfo;

    .line 169
    .line 170
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 171
    .line 172
    .line 173
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 174
    .line 175
    if-eqz p0, :cond_c

    .line 176
    .line 177
    const-string p0, "multiCallExtend"

    .line 178
    .line 179
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 180
    .line 181
    .line 182
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 183
    .line 184
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->multiCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 185
    .line 186
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    const-string p0, "redPacketIds"

    .line 194
    .line 195
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 196
    .line 197
    .line 198
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->redPacketIds:Ljava/util/List;

    .line 199
    .line 200
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 201
    .line 202
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 203
    .line 204
    .line 205
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 206
    .line 207
    if-eqz p0, :cond_e

    .line 208
    .line 209
    const-string p0, "guildCallExtend"

    .line 210
    .line 211
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 212
    .line 213
    .line 214
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 215
    .line 216
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->guildCallExtend:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallExtend;

    .line 217
    .line 218
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 219
    .line 220
    .line 221
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 222
    .line 223
    if-eqz p0, :cond_f

    .line 224
    .line 225
    const-string p0, "coverLabels"

    .line 226
    .line 227
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabels:Ljava/util/List;

    .line 231
    .line 232
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 233
    .line 234
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 235
    .line 236
    .line 237
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveType:Ljava/lang/String;

    .line 238
    .line 239
    if-eqz p0, :cond_10

    .line 240
    .line 241
    const-string v1, "liveType"

    .line 242
    .line 243
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 244
    .line 245
    .line 246
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 247
    .line 248
    if-eqz p0, :cond_11

    .line 249
    .line 250
    const-string p0, "rtcInfo"

    .line 251
    .line 252
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 253
    .line 254
    .line 255
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 256
    .line 257
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->rtcInfo:Lcom/p1/mobile/putong/live/base/data/BLiveRtcInfo;

    .line 258
    .line 259
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 260
    .line 261
    .line 262
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 263
    .line 264
    if-eqz p0, :cond_12

    .line 265
    .line 266
    const-string p0, "coverLabelsV2"

    .line 267
    .line 268
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 269
    .line 270
    .line 271
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->coverLabelsV2:Ljava/util/List;

    .line 272
    .line 273
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveCoverLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 274
    .line 275
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 276
    .line 277
    .line 278
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 279
    .line 280
    if-eqz p0, :cond_13

    .line 281
    .line 282
    const-string p0, "chatMessages"

    .line 283
    .line 284
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 285
    .line 286
    .line 287
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->chatMessages:Ljava/util/List;

    .line 288
    .line 289
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveChatMsg;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 290
    .line 291
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 292
    .line 293
    .line 294
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->liveMode:Ljava/lang/String;

    .line 295
    .line 296
    if-eqz p0, :cond_14

    .line 297
    .line 298
    const-string v1, "liveMode"

    .line 299
    .line 300
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 304
    .line 305
    if-eqz p0, :cond_15

    .line 306
    .line 307
    const-string p0, "intlFrame"

    .line 308
    .line 309
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 313
    .line 314
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 315
    .line 316
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 317
    .line 318
    .line 319
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->subtitle:Ljava/lang/String;

    .line 320
    .line 321
    if-eqz p0, :cond_16

    .line 322
    .line 323
    const-string v0, "subtitle"

    .line 324
    .line 325
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 326
    .line 327
    .line 328
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;->streamFlvUrlIpv6:Ljava/lang/String;

    .line 329
    .line 330
    if-eqz p0, :cond_17

    .line 331
    .line 332
    const-string p1, "streamFlvUrlIpv6"

    .line 333
    .line 334
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 335
    .line 336
    .line 337
    :cond_17
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 338
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSuggestLive;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
