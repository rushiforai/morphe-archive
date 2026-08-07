.class Lcom/p1/mobile/putong/feed/data/VoiceLive$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/VoiceLive;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/VoiceLive;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;->newInstance()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/VoiceLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
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
    const-string p0, "memberCount"

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
    const-string p0, "rewarderCount"

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
    const-string p0, "streamCdnInfo"

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
    const-string p0, "rewardPoint"

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
    const-string p0, "momentText"

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
    const-string p0, "state"

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
    const-string p0, "type"

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
    const-string p0, "room"

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
    const-string p0, "id"

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
    const-string p0, "callback"

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
    const-string p0, "callInfo"

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
    const-string p0, "streamUrl"

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
    const-string p0, "messages"

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
    const-string p0, "extension"

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
    const-string p0, "basicLabels"

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
    const-string p0, "specialLabels"

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
    const-string p0, "messageCount"

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
    const-string p0, "anchor"

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
    const-string p0, "endTime"

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
    const-string p0, "feedStyle"

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
    const-string p0, "startTime"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 290
    .line 291
    .line 292
    move-result-wide p2

    .line 293
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 297
    .line 298
    .line 299
    move-result-wide p2

    .line 300
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 301
    .line 302
    return v1

    .line 303
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 304
    .line 305
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    check-cast p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 310
    .line 311
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 312
    .line 313
    return v1

    .line 314
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 315
    .line 316
    .line 317
    move-result-wide p2

    .line 318
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 319
    .line 320
    return v1

    .line 321
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 322
    .line 323
    .line 324
    move-result-object p0

    .line 325
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 326
    .line 327
    return v1

    .line 328
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 329
    .line 330
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object p0

    .line 334
    check-cast p0, Lcom/p1/mobile/putong/data/LiveState;

    .line 335
    .line 336
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 337
    .line 338
    return v1

    .line 339
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 340
    .line 341
    .line 342
    move-result-object p0

    .line 343
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 344
    .line 345
    return v1

    .line 346
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    .line 348
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    check-cast p0, Lcom/p1/mobile/putong/data/Owner;

    .line 353
    .line 354
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 355
    .line 356
    return v1

    .line 357
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

    .line 362
    .line 363
    return v0

    .line 364
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 369
    .line 370
    return v1

    .line 371
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 372
    .line 373
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    check-cast p0, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 378
    .line 379
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 380
    .line 381
    return v1

    .line 382
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/StreamUrl;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    .line 384
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    check-cast p0, Lcom/p1/mobile/putong/data/StreamUrl;

    .line 389
    .line 390
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

    .line 391
    .line 392
    return v1

    .line 393
    :pswitch_c
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 394
    .line 395
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 396
    .line 397
    .line 398
    move-result-object p0

    .line 399
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 400
    .line 401
    return v1

    .line 402
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 403
    .line 404
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 405
    .line 406
    .line 407
    move-result-object p0

    .line 408
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 409
    .line 410
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 411
    .line 412
    return v1

    .line 413
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/LiveBasicLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 414
    .line 415
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 416
    .line 417
    .line 418
    move-result-object p0

    .line 419
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 420
    .line 421
    return v1

    .line 422
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 423
    .line 424
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 425
    .line 426
    .line 427
    move-result-object p0

    .line 428
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 429
    .line 430
    return v1

    .line 431
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 432
    .line 433
    .line 434
    move-result-wide p2

    .line 435
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 436
    .line 437
    return v1

    .line 438
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/Owner;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 439
    .line 440
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 441
    .line 442
    .line 443
    move-result-object p0

    .line 444
    check-cast p0, Lcom/p1/mobile/putong/data/Owner;

    .line 445
    .line 446
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 447
    .line 448
    return v1

    .line 449
    :pswitch_12
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 450
    .line 451
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 452
    .line 453
    .line 454
    move-result-object p0

    .line 455
    check-cast p0, Ljava/lang/Double;

    .line 456
    .line 457
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 458
    .line 459
    .line 460
    move-result-wide p2

    .line 461
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 462
    .line 463
    return v1

    .line 464
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 469
    .line 470
    return v1

    .line 471
    :pswitch_14
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 472
    .line 473
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 474
    .line 475
    .line 476
    move-result-object p0

    .line 477
    check-cast p0, Ljava/lang/Double;

    .line 478
    .line 479
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 480
    .line 481
    .line 482
    move-result-wide p2

    .line 483
    iput-wide p2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 484
    .line 485
    return v1

    .line 486
    nop

    .line 487
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_14
        -0x62a2e54d -> :sswitch_13
        -0x5fcc95b8 -> :sswitch_12
        -0x543d3d4b -> :sswitch_11
        -0x4e34b2b8 -> :sswitch_10
        -0x4210a1e8 -> :sswitch_f
        -0x3e483a33 -> :sswitch_e
        -0x2482e3c1 -> :sswitch_d
        -0x1b8afeb4 -> :sswitch_c
        -0x12d03231 -> :sswitch_b
        -0xa4f0bd4 -> :sswitch_a
        -0xa43dfbb -> :sswitch_9
        0xd1b -> :sswitch_8
        0x3580db -> :sswitch_7
        0x368f3a -> :sswitch_6
        0x68ac491 -> :sswitch_5
        0x28e63b4d -> :sswitch_4
        0x34b93ba1 -> :sswitch_3
        0x421152db -> :sswitch_2
        0x45434653 -> :sswitch_1
        0x50f26695 -> :sswitch_0
    .end sparse-switch

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

    .line 487
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;->parseField(Lcom/p1/mobile/putong/feed/data/VoiceLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/VoiceLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/VoiceLive;",
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
    const-string v0, "memberCount"

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
    const/16 v3, 0x14

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "rewarderCount"

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
    const/16 v3, 0x13

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "streamCdnInfo"

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
    const/16 v3, 0x12

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "rewardPoint"

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
    const/16 v3, 0x11

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "momentText"

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
    const/16 v3, 0x10

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "state"

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
    const/16 v3, 0xf

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "type"

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
    const/16 v3, 0xe

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "room"

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
    const/16 v3, 0xd

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "id"

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
    const/16 v3, 0xc

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "callback"

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
    const/16 v3, 0xb

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "callInfo"

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
    const/16 v3, 0xa

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "streamUrl"

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
    const/16 v3, 0x9

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string v0, "messages"

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
    const/16 v3, 0x8

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_d
    const-string v0, "extension"

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
    goto :goto_0

    .line 207
    :cond_d
    const/4 v3, 0x7

    .line 208
    goto :goto_0

    .line 209
    :sswitch_e
    const-string v0, "basicLabels"

    .line 210
    .line 211
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    if-nez v0, :cond_e

    .line 216
    .line 217
    goto :goto_0

    .line 218
    :cond_e
    const/4 v3, 0x6

    .line 219
    goto :goto_0

    .line 220
    :sswitch_f
    const-string v0, "specialLabels"

    .line 221
    .line 222
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    if-nez v0, :cond_f

    .line 227
    .line 228
    goto :goto_0

    .line 229
    :cond_f
    const/4 v3, 0x5

    .line 230
    goto :goto_0

    .line 231
    :sswitch_10
    const-string v0, "messageCount"

    .line 232
    .line 233
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    if-nez v0, :cond_10

    .line 238
    .line 239
    goto :goto_0

    .line 240
    :cond_10
    const/4 v3, 0x4

    .line 241
    goto :goto_0

    .line 242
    :sswitch_11
    const-string v0, "anchor"

    .line 243
    .line 244
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    if-nez v0, :cond_11

    .line 249
    .line 250
    goto :goto_0

    .line 251
    :cond_11
    const/4 v3, 0x3

    .line 252
    goto :goto_0

    .line 253
    :sswitch_12
    const-string v0, "endTime"

    .line 254
    .line 255
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 256
    .line 257
    .line 258
    move-result v0

    .line 259
    if-nez v0, :cond_12

    .line 260
    .line 261
    goto :goto_0

    .line 262
    :cond_12
    const/4 v3, 0x2

    .line 263
    goto :goto_0

    .line 264
    :sswitch_13
    const-string v0, "feedStyle"

    .line 265
    .line 266
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    if-nez v0, :cond_13

    .line 271
    .line 272
    goto :goto_0

    .line 273
    :cond_13
    move v3, v2

    .line 274
    goto :goto_0

    .line 275
    :sswitch_14
    const-string v0, "startTime"

    .line 276
    .line 277
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    if-nez v0, :cond_14

    .line 282
    .line 283
    goto :goto_0

    .line 284
    :cond_14
    move v3, v1

    .line 285
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 286
    .line 287
    .line 288
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 289
    .line 290
    .line 291
    move-result p0

    .line 292
    return p0

    .line 293
    :pswitch_0
    return v2

    .line 294
    :pswitch_1
    return v1

    .line 295
    :pswitch_2
    return v2

    .line 296
    nop

    .line 297
    :sswitch_data_0
    .sparse-switch
        -0x7eea75b1 -> :sswitch_14
        -0x62a2e54d -> :sswitch_13
        -0x5fcc95b8 -> :sswitch_12
        -0x543d3d4b -> :sswitch_11
        -0x4e34b2b8 -> :sswitch_10
        -0x4210a1e8 -> :sswitch_f
        -0x3e483a33 -> :sswitch_e
        -0x2482e3c1 -> :sswitch_d
        -0x1b8afeb4 -> :sswitch_c
        -0x12d03231 -> :sswitch_b
        -0xa4f0bd4 -> :sswitch_a
        -0xa43dfbb -> :sswitch_9
        0xd1b -> :sswitch_8
        0x3580db -> :sswitch_7
        0x368f3a -> :sswitch_6
        0x68ac491 -> :sswitch_5
        0x28e63b4d -> :sswitch_4
        0x34b93ba1 -> :sswitch_3
        0x421152db -> :sswitch_2
        0x45434653 -> :sswitch_1
        0x50f26695 -> :sswitch_0
    .end sparse-switch

    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 297
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/VoiceLive;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/VoiceLive;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->room:Lcom/p1/mobile/putong/data/Owner;

    .line 23
    .line 24
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 25
    .line 26
    .line 27
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->anchor:Lcom/p1/mobile/putong/data/Owner;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamUrl:Lcom/p1/mobile/putong/data/StreamUrl;

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
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewardPoint:D

    .line 62
    .line 63
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 64
    .line 65
    .line 66
    const-string p0, "memberCount"

    .line 67
    .line 68
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->memberCount:D

    .line 69
    .line 70
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 71
    .line 72
    .line 73
    const-string p0, "startTime"

    .line 74
    .line 75
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 79
    .line 80
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->startTime:D

    .line 81
    .line 82
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 83
    .line 84
    .line 85
    move-result-object v1

    .line 86
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 87
    .line 88
    .line 89
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 90
    .line 91
    if-eqz v1, :cond_4

    .line 92
    .line 93
    const-string v1, "state"

    .line 94
    .line 95
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    sget-object v1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 99
    .line 100
    iget-object v2, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 101
    .line 102
    invoke-virtual {v1, v2, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 103
    .line 104
    .line 105
    :cond_4
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->type:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz v1, :cond_5

    .line 108
    .line 109
    const-string v2, "type"

    .line 110
    .line 111
    invoke-virtual {p2, v2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_5
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v1, :cond_6

    .line 117
    .line 118
    const-string v1, "basicLabels"

    .line 119
    .line 120
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->basicLabels:Ljava/util/List;

    .line 124
    .line 125
    sget-object v2, Lcom/p1/mobile/putong/data/LiveBasicLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_6
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 131
    .line 132
    if-eqz v1, :cond_7

    .line 133
    .line 134
    const-string v1, "specialLabels"

    .line 135
    .line 136
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->specialLabels:Ljava/util/List;

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/data/LiveSpecialLabel;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    invoke-static {v1, p2, v2}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_7
    const-string v1, "endTime"

    .line 147
    .line 148
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->endTime:D

    .line 152
    .line 153
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 154
    .line 155
    .line 156
    move-result-object v1

    .line 157
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 158
    .line 159
    .line 160
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 161
    .line 162
    if-eqz p0, :cond_8

    .line 163
    .line 164
    const-string p0, "streamCdnInfo"

    .line 165
    .line 166
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    sget-object p0, Lcom/p1/mobile/putong/data/StreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 170
    .line 171
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->streamCdnInfo:Lcom/p1/mobile/putong/data/StreamCdnInfo;

    .line 172
    .line 173
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 174
    .line 175
    .line 176
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callback:Ljava/lang/String;

    .line 177
    .line 178
    if-eqz p0, :cond_9

    .line 179
    .line 180
    const-string v1, "callback"

    .line 181
    .line 182
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->feedStyle:Ljava/lang/String;

    .line 186
    .line 187
    if-eqz p0, :cond_a

    .line 188
    .line 189
    const-string v1, "feedStyle"

    .line 190
    .line 191
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->momentText:Ljava/lang/String;

    .line 195
    .line 196
    if-eqz p0, :cond_b

    .line 197
    .line 198
    const-string v1, "momentText"

    .line 199
    .line 200
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 204
    .line 205
    if-eqz p0, :cond_c

    .line 206
    .line 207
    const-string p0, "messages"

    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messages:Ljava/util/List;

    .line 213
    .line 214
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 215
    .line 216
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 217
    .line 218
    .line 219
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 220
    .line 221
    if-eqz p0, :cond_d

    .line 222
    .line 223
    const-string p0, "callInfo"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sget-object p0, Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 229
    .line 230
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->callInfo:Lcom/p1/mobile/putong/feed/data/UserVoiceLiveCallInfo;

    .line 231
    .line 232
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 233
    .line 234
    .line 235
    :cond_d
    const-string p0, "rewarderCount"

    .line 236
    .line 237
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->rewarderCount:D

    .line 238
    .line 239
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 240
    .line 241
    .line 242
    const-string p0, "messageCount"

    .line 243
    .line 244
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->messageCount:D

    .line 245
    .line 246
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;D)V

    .line 247
    .line 248
    .line 249
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 250
    .line 251
    if-eqz p0, :cond_e

    .line 252
    .line 253
    const-string p0, "extension"

    .line 254
    .line 255
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceLiveExtension;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    .line 260
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->extension:Lcom/p1/mobile/putong/data/VoiceLiveExtension;

    .line 261
    .line 262
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 263
    .line 264
    .line 265
    :cond_e
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 266
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLive;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/VoiceLive$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/VoiceLive;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
