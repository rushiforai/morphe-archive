.class Lcom/p1/mobile/putong/data/Live$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Live;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/Live;",
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
    const-class p0, Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/Live;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Live;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Live;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Live$2;->newInstance()Lcom/p1/mobile/putong/data/Live;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Live;",
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
    const/16 v2, 0x16

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "memberCount"

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
    const-string p0, "rewarderCount"

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
    const-string p0, "streamCdnInfo"

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
    const-string p0, "rewardPoint"

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
    const-string p0, "videoCapture"

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
    const-string p0, "snapshot"

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
    const-string p0, "state"

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
    const-string p0, "type"

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
    const-string p0, "room"

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
    const-string p0, "id"

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
    const-string p0, "callback"

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
    const-string p0, "coverPicUrl"

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
    const-string p0, "streamUrl"

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
    const-string p0, "source"

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
    const-string p0, "whetherToBlur"

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
    const-string p0, "basicLabels"

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
    const-string p0, "specialLabels"

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
    const-string p0, "recommendInfo"

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
    const-string p0, "messageCount"

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
    const-string p0, "anchor"

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
    const-string p0, "endTime"

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
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 318
    .line 319
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 320
    .line 321
    .line 322
    move-result-object p0

    .line 323
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 324
    .line 325
    return v1

    .line 326
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 327
    .line 328
    .line 329
    move-result-wide p2

    .line 330
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 331
    .line 332
    return v1

    .line 333
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 334
    .line 335
    .line 336
    move-result-wide p2

    .line 337
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 338
    .line 339
    return v1

    .line 340
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 341
    .line 342
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 343
    .line 344
    .line 345
    move-result-object p0

    .line 346
    check-cast p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 347
    .line 348
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 349
    .line 350
    return v1

    .line 351
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 352
    .line 353
    .line 354
    move-result-wide p2

    .line 355
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 356
    .line 357
    return v1

    .line 358
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 359
    .line 360
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 365
    .line 366
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 367
    .line 368
    return v1

    .line 369
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 370
    .line 371
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 376
    .line 377
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 378
    .line 379
    return v1

    .line 380
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 381
    .line 382
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    check-cast p0, Lcom/p1/mobile/putong/data/LiveState;

    .line 387
    .line 388
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 389
    .line 390
    return v1

    .line 391
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 396
    .line 397
    return v1

    .line 398
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 399
    .line 400
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    move-result-object p0

    .line 404
    check-cast p0, Lcom/p1/mobile/putong/data/Owner;

    .line 405
    .line 406
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 407
    .line 408
    return v1

    .line 409
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 410
    .line 411
    .line 412
    move-result-object p0

    .line 413
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

    .line 414
    .line 415
    return v0

    .line 416
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 421
    .line 422
    return v1

    .line 423
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 424
    .line 425
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    check-cast p0, Lcom/p1/mobile/putong/data/Media;

    .line 430
    .line 431
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 432
    .line 433
    return v1

    .line 434
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/StreamUrl;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 435
    .line 436
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    check-cast p0, Lcom/p1/mobile/putong/data/StreamUrl;

    .line 441
    .line 442
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 443
    .line 444
    return v1

    .line 445
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 446
    .line 447
    .line 448
    move-result-object p0

    .line 449
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 450
    .line 451
    return v1

    .line 452
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 453
    .line 454
    .line 455
    move-result p0

    .line 456
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 457
    .line 458
    return v1

    .line 459
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/LiveBasicLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 460
    .line 461
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 462
    .line 463
    .line 464
    move-result-object p0

    .line 465
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 466
    .line 467
    return v1

    .line 468
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 469
    .line 470
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 471
    .line 472
    .line 473
    move-result-object p0

    .line 474
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 475
    .line 476
    return v1

    .line 477
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 478
    .line 479
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object p0

    .line 483
    check-cast p0, Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 484
    .line 485
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 486
    .line 487
    return v1

    .line 488
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 489
    .line 490
    .line 491
    move-result-wide p2

    .line 492
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 493
    .line 494
    return v1

    .line 495
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 496
    .line 497
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 498
    .line 499
    .line 500
    move-result-object p0

    .line 501
    check-cast p0, Lcom/p1/mobile/putong/data/Owner;

    .line 502
    .line 503
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 504
    .line 505
    return v1

    .line 506
    :pswitch_15
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 507
    .line 508
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 509
    .line 510
    .line 511
    move-result-object p0

    .line 512
    check-cast p0, Ljava/lang/Double;

    .line 513
    .line 514
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 515
    .line 516
    .line 517
    move-result-wide p2

    .line 518
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 519
    .line 520
    return v1

    .line 521
    :pswitch_16
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 522
    .line 523
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 524
    .line 525
    .line 526
    move-result-object p0

    .line 527
    check-cast p0, Ljava/lang/Double;

    .line 528
    .line 529
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 530
    .line 531
    .line 532
    move-result-wide p2

    .line 533
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 534
    .line 535
    return v1

    .line 536
    nop

    .line 537
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_16
        -0x5fcc95b8 -> :sswitch_15
        -0x543d3d4b -> :sswitch_14
        -0x4e34b2b8 -> :sswitch_13
        -0x4415d476 -> :sswitch_12
        -0x4210a1e8 -> :sswitch_11
        -0x3e483a33 -> :sswitch_10
        -0x35adea49 -> :sswitch_f
        -0x356f97e5 -> :sswitch_e
        -0x12d03231 -> :sswitch_d
        -0xf54ede4 -> :sswitch_c
        -0xa43dfbb -> :sswitch_b
        0xd1b -> :sswitch_a
        0x3580db -> :sswitch_9
        0x368f3a -> :sswitch_8
        0x68ac491 -> :sswitch_7
        0x10fad5c4 -> :sswitch_6
        0x182a5a4b -> :sswitch_5
        0x34b93ba1 -> :sswitch_4
        0x421152db -> :sswitch_3
        0x45434653 -> :sswitch_2
        0x50f26695 -> :sswitch_1
        0x7b1f9f7f -> :sswitch_0
    .end sparse-switch

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

    .line 537
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Live$2;->parseField(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Live;",
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
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x1

    .line 10
    const/4 v3, -0x1

    .line 11
    sparse-switch v0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string v0, "redPacketIds"

    .line 17
    .line 18
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    goto/16 :goto_0

    .line 25
    .line 26
    :cond_0
    const/16 v3, 0x16

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "memberCount"

    .line 31
    .line 32
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-nez v0, :cond_1

    .line 37
    .line 38
    goto/16 :goto_0

    .line 39
    .line 40
    :cond_1
    const/16 v3, 0x15

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "rewarderCount"

    .line 45
    .line 46
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    if-nez v0, :cond_2

    .line 51
    .line 52
    goto/16 :goto_0

    .line 53
    .line 54
    :cond_2
    const/16 v3, 0x14

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "streamCdnInfo"

    .line 59
    .line 60
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    if-nez v0, :cond_3

    .line 65
    .line 66
    goto/16 :goto_0

    .line 67
    .line 68
    :cond_3
    const/16 v3, 0x13

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "rewardPoint"

    .line 73
    .line 74
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-nez v0, :cond_4

    .line 79
    .line 80
    goto/16 :goto_0

    .line 81
    .line 82
    :cond_4
    const/16 v3, 0x12

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "videoCapture"

    .line 87
    .line 88
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-nez v0, :cond_5

    .line 93
    .line 94
    goto/16 :goto_0

    .line 95
    .line 96
    :cond_5
    const/16 v3, 0x11

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "snapshot"

    .line 101
    .line 102
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    if-nez v0, :cond_6

    .line 107
    .line 108
    goto/16 :goto_0

    .line 109
    .line 110
    :cond_6
    const/16 v3, 0x10

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "state"

    .line 115
    .line 116
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    if-nez v0, :cond_7

    .line 121
    .line 122
    goto/16 :goto_0

    .line 123
    .line 124
    :cond_7
    const/16 v3, 0xf

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "type"

    .line 129
    .line 130
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    if-nez v0, :cond_8

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_8
    const/16 v3, 0xe

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "room"

    .line 143
    .line 144
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    if-nez v0, :cond_9

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    const/16 v3, 0xd

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "id"

    .line 157
    .line 158
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    if-nez v0, :cond_a

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_a
    const/16 v3, 0xc

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "callback"

    .line 171
    .line 172
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    if-nez v0, :cond_b

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_b
    const/16 v3, 0xb

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "coverPicUrl"

    .line 185
    .line 186
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    if-nez v0, :cond_c

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_c
    const/16 v3, 0xa

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "streamUrl"

    .line 199
    .line 200
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    if-nez v0, :cond_d

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :cond_d
    const/16 v3, 0x9

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_e
    const-string v0, "source"

    .line 213
    .line 214
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    if-nez v0, :cond_e

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :cond_e
    const/16 v3, 0x8

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    const-string v0, "whetherToBlur"

    .line 227
    .line 228
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    if-nez v0, :cond_f

    .line 233
    .line 234
    goto :goto_0

    .line 235
    :cond_f
    const/4 v3, 0x7

    .line 236
    goto :goto_0

    .line 237
    :sswitch_10
    const-string v0, "basicLabels"

    .line 238
    .line 239
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_10

    .line 244
    .line 245
    goto :goto_0

    .line 246
    :cond_10
    const/4 v3, 0x6

    .line 247
    goto :goto_0

    .line 248
    :sswitch_11
    const-string v0, "specialLabels"

    .line 249
    .line 250
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    if-nez v0, :cond_11

    .line 255
    .line 256
    goto :goto_0

    .line 257
    :cond_11
    const/4 v3, 0x5

    .line 258
    goto :goto_0

    .line 259
    :sswitch_12
    const-string v0, "recommendInfo"

    .line 260
    .line 261
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-nez v0, :cond_12

    .line 266
    .line 267
    goto :goto_0

    .line 268
    :cond_12
    const/4 v3, 0x4

    .line 269
    goto :goto_0

    .line 270
    :sswitch_13
    const-string v0, "messageCount"

    .line 271
    .line 272
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 273
    .line 274
    .line 275
    move-result v0

    .line 276
    if-nez v0, :cond_13

    .line 277
    .line 278
    goto :goto_0

    .line 279
    :cond_13
    const/4 v3, 0x3

    .line 280
    goto :goto_0

    .line 281
    :sswitch_14
    const-string v0, "anchor"

    .line 282
    .line 283
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    if-nez v0, :cond_14

    .line 288
    .line 289
    goto :goto_0

    .line 290
    :cond_14
    const/4 v3, 0x2

    .line 291
    goto :goto_0

    .line 292
    :sswitch_15
    const-string v0, "endTime"

    .line 293
    .line 294
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-nez v0, :cond_15

    .line 299
    .line 300
    goto :goto_0

    .line 301
    :cond_15
    move v3, v2

    .line 302
    goto :goto_0

    .line 303
    :sswitch_16
    const-string v0, "startTime"

    .line 304
    .line 305
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    if-nez v0, :cond_16

    .line 310
    .line 311
    goto :goto_0

    .line 312
    :cond_16
    move v3, v1

    .line 313
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 314
    .line 315
    .line 316
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 317
    .line 318
    .line 319
    move-result p0

    .line 320
    return p0

    .line 321
    :pswitch_0
    return v2

    .line 322
    :pswitch_1
    return v1

    .line 323
    :pswitch_2
    return v2

    .line 324
    nop

    .line 325
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_16
        -0x5fcc95b8 -> :sswitch_15
        -0x543d3d4b -> :sswitch_14
        -0x4e34b2b8 -> :sswitch_13
        -0x4415d476 -> :sswitch_12
        -0x4210a1e8 -> :sswitch_11
        -0x3e483a33 -> :sswitch_10
        -0x35adea49 -> :sswitch_f
        -0x356f97e5 -> :sswitch_e
        -0x12d03231 -> :sswitch_d
        -0xf54ede4 -> :sswitch_c
        -0xa43dfbb -> :sswitch_b
        0xd1b -> :sswitch_a
        0x3580db -> :sswitch_9
        0x368f3a -> :sswitch_8
        0x68ac491 -> :sswitch_7
        0x10fad5c4 -> :sswitch_6
        0x182a5a4b -> :sswitch_5
        0x34b93ba1 -> :sswitch_4
        0x421152db -> :sswitch_3
        0x45434653 -> :sswitch_2
        0x50f26695 -> :sswitch_1
        0x7b1f9f7f -> :sswitch_0
    .end sparse-switch

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
    .line 416
    .line 417
    .line 418
    .line 419
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
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

    .line 325
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Live$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/Live;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/Live;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

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
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 21
    .line 22
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string p0, "streamUrl"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    sget-object p0, Lcom/p1/mobile/putong/data/StreamUrl;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 53
    .line 54
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 55
    .line 56
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 57
    .line 58
    .line 59
    :cond_3
    const-string p0, "rewardPoint"

    .line 60
    .line 61
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->rewardPoint:D

    .line 62
    .line 63
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 64
    .line 65
    .line 66
    const-string p0, "memberCount"

    .line 67
    .line 68
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->memberCount:D

    .line 69
    .line 70
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 74
    .line 75
    if-eqz p0, :cond_4

    .line 76
    .line 77
    const-string p0, "snapshot"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 83
    .line 84
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->snapshot:Lcom/p1/mobile/putong/data/Media;

    .line 85
    .line 86
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 87
    .line 88
    .line 89
    :cond_4
    const-string p0, "startTime"

    .line 90
    .line 91
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 92
    .line 93
    .line 94
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 95
    .line 96
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->startTime:D

    .line 97
    .line 98
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 99
    .line 100
    .line 101
    move-result-object v1

    .line 102
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 103
    .line 104
    .line 105
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 106
    .line 107
    if-eqz v1, :cond_5

    .line 108
    .line 109
    const-string v1, "state"

    .line 110
    .line 111
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 115
    .line 116
    iget-object v2, p1, Lcom/p1/mobile/putong/data/Live;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 117
    .line 118
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 119
    .line 120
    .line 121
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->type:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz v1, :cond_6

    .line 124
    .line 125
    const-string v2, "type"

    .line 126
    .line 127
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v1, :cond_7

    .line 133
    .line 134
    const-string v1, "basicLabels"

    .line 135
    .line 136
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->basicLabels:Ljava/util/List;

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/data/LiveBasicLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_7
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 147
    .line 148
    if-eqz v1, :cond_8

    .line 149
    .line 150
    const-string v1, "specialLabels"

    .line 151
    .line 152
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->specialLabels:Ljava/util/List;

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 158
    .line 159
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 160
    .line 161
    .line 162
    :cond_8
    const-string v1, "endTime"

    .line 163
    .line 164
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->endTime:D

    .line 168
    .line 169
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 170
    .line 171
    .line 172
    move-result-object v1

    .line 173
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 174
    .line 175
    .line 176
    const-string p0, "messageCount"

    .line 177
    .line 178
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->messageCount:J

    .line 179
    .line 180
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 181
    .line 182
    .line 183
    const-string p0, "rewarderCount"

    .line 184
    .line 185
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Live;->rewarderCount:D

    .line 186
    .line 187
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 188
    .line 189
    .line 190
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 191
    .line 192
    if-eqz p0, :cond_9

    .line 193
    .line 194
    const-string p0, "streamCdnInfo"

    .line 195
    .line 196
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    sget-object p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 200
    .line 201
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 202
    .line 203
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 204
    .line 205
    .line 206
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 207
    .line 208
    if-eqz p0, :cond_a

    .line 209
    .line 210
    const-string p0, "recommendInfo"

    .line 211
    .line 212
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 213
    .line 214
    .line 215
    sget-object p0, Lcom/p1/mobile/putong/data/RecommendInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 216
    .line 217
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->recommendInfo:Lcom/p1/mobile/putong/data/RecommendInfo;

    .line 218
    .line 219
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 220
    .line 221
    .line 222
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->source:Ljava/lang/String;

    .line 223
    .line 224
    if-eqz p0, :cond_b

    .line 225
    .line 226
    const-string v1, "source"

    .line 227
    .line 228
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 232
    .line 233
    if-eqz p0, :cond_c

    .line 234
    .line 235
    const-string p0, "videoCapture"

    .line 236
    .line 237
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 241
    .line 242
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Live;->videoCapture:Lcom/p1/mobile/putong/data/Media;

    .line 243
    .line 244
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 245
    .line 246
    .line 247
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 248
    .line 249
    if-eqz p0, :cond_d

    .line 250
    .line 251
    const-string p0, "redPacketIds"

    .line 252
    .line 253
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 254
    .line 255
    .line 256
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->redPacketIds:Ljava/util/List;

    .line 257
    .line 258
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    .line 260
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 261
    .line 262
    .line 263
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->callback:Ljava/lang/String;

    .line 264
    .line 265
    if-eqz p0, :cond_e

    .line 266
    .line 267
    const-string v1, "callback"

    .line 268
    .line 269
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 270
    .line 271
    .line 272
    :cond_e
    const-string p0, "whetherToBlur"

    .line 273
    .line 274
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Live;->whetherToBlur:Z

    .line 275
    .line 276
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 277
    .line 278
    .line 279
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 280
    .line 281
    if-eqz p0, :cond_f

    .line 282
    .line 283
    const-string p0, "coverPicUrl"

    .line 284
    .line 285
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 286
    .line 287
    .line 288
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 289
    .line 290
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Live;->coverPicUrl:Lcom/p1/mobile/putong/data/Media;

    .line 291
    .line 292
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 293
    .line 294
    .line 295
    :cond_f
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 296
    check-cast p1, Lcom/p1/mobile/putong/data/Live;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Live$2;->serializeFields(Lcom/p1/mobile/putong/data/Live;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
