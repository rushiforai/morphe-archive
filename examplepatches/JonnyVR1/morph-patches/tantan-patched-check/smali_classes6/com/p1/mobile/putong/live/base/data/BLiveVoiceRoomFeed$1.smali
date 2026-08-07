.class Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;",
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
    const-string p0, "memberAvatars"

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
    const/16 v2, 0x13

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "liveTags"

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
    const/16 v2, 0x12

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "memberCount"

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
    const/16 v2, 0x11

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
    const/16 v2, 0x10

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "intlFrame"

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
    const/16 v2, 0xf

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "liveTemplate"

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
    const/16 v2, 0xe

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "maskMode"

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
    const/16 v2, 0xd

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
    const/16 v2, 0xc

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "feedType"

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
    const/16 v2, 0xb

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "feedTags"

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
    const/16 v2, 0xa

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "extraInfo"

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
    const/16 v2, 0x9

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "anchorLocation"

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
    const/16 v2, 0x8

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    const-string p0, "liveAttributeTags"

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
    goto :goto_0

    .line 193
    :cond_c
    const/4 v2, 0x7

    .line 194
    goto :goto_0

    .line 195
    :sswitch_d
    const-string p0, "streamUrl"

    .line 196
    .line 197
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 198
    .line 199
    .line 200
    move-result p0

    .line 201
    if-nez p0, :cond_d

    .line 202
    .line 203
    goto :goto_0

    .line 204
    :cond_d
    const/4 v2, 0x6

    .line 205
    goto :goto_0

    .line 206
    :sswitch_e
    const-string p0, "roomTopicId"

    .line 207
    .line 208
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    if-nez p0, :cond_e

    .line 213
    .line 214
    goto :goto_0

    .line 215
    :cond_e
    const/4 v2, 0x5

    .line 216
    goto :goto_0

    .line 217
    :sswitch_f
    const-string p0, "roomId"

    .line 218
    .line 219
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    if-nez p0, :cond_f

    .line 224
    .line 225
    goto :goto_0

    .line 226
    :cond_f
    const/4 v2, 0x4

    .line 227
    goto :goto_0

    .line 228
    :sswitch_10
    const-string p0, "anchorId"

    .line 229
    .line 230
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p0

    .line 234
    if-nez p0, :cond_10

    .line 235
    .line 236
    goto :goto_0

    .line 237
    :cond_10
    const/4 v2, 0x3

    .line 238
    goto :goto_0

    .line 239
    :sswitch_11
    const-string p0, "roomTopic"

    .line 240
    .line 241
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p0

    .line 245
    if-nez p0, :cond_11

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_11
    const/4 v2, 0x2

    .line 249
    goto :goto_0

    .line 250
    :sswitch_12
    const-string p0, "roomTitle"

    .line 251
    .line 252
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-nez p0, :cond_12

    .line 257
    .line 258
    goto :goto_0

    .line 259
    :cond_12
    move v2, v1

    .line 260
    goto :goto_0

    .line 261
    :sswitch_13
    const-string p0, "liveId"

    .line 262
    .line 263
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-nez p0, :cond_13

    .line 268
    .line 269
    goto :goto_0

    .line 270
    :cond_13
    move v2, v0

    .line 271
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 272
    .line 273
    .line 274
    return v0

    .line 275
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 276
    .line 277
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 278
    .line 279
    .line 280
    move-result-object p0

    .line 281
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 282
    .line 283
    return v1

    .line 284
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 285
    .line 286
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 291
    .line 292
    return v1

    .line 293
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 298
    .line 299
    return v1

    .line 300
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 301
    .line 302
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 307
    .line 308
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 309
    .line 310
    return v1

    .line 311
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 312
    .line 313
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 318
    .line 319
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 320
    .line 321
    return v1

    .line 322
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 327
    .line 328
    return v1

    .line 329
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 330
    .line 331
    .line 332
    move-result p0

    .line 333
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 334
    .line 335
    return v1

    .line 336
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 341
    .line 342
    return v1

    .line 343
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object p0

    .line 347
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 348
    .line 349
    return v1

    .line 350
    :pswitch_9
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 351
    .line 352
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 357
    .line 358
    return v1

    .line 359
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 360
    .line 361
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 366
    .line 367
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 368
    .line 369
    return v1

    .line 370
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/Location;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 371
    .line 372
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 373
    .line 374
    .line 375
    move-result-object p0

    .line 376
    check-cast p0, Lcom/p1/mobile/putong/data/Location;

    .line 377
    .line 378
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 379
    .line 380
    return v1

    .line 381
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 382
    .line 383
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 388
    .line 389
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 390
    .line 391
    return v1

    .line 392
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 393
    .line 394
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 399
    .line 400
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 401
    .line 402
    return v1

    .line 403
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 408
    .line 409
    return v1

    .line 410
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 411
    .line 412
    .line 413
    move-result-object p0

    .line 414
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 415
    .line 416
    return v1

    .line 417
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object p0

    .line 421
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 422
    .line 423
    return v1

    .line 424
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object p0

    .line 428
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 429
    .line 430
    return v1

    .line 431
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 432
    .line 433
    .line 434
    move-result-object p0

    .line 435
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 436
    .line 437
    return v1

    .line 438
    :pswitch_13
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 439
    .line 440
    .line 441
    move-result-object p0

    .line 442
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

    .line 443
    .line 444
    return v1

    .line 445
    :sswitch_data_0
    .sparse-switch
        -0x41b5d0d9 -> :sswitch_13
        -0x403efdc3 -> :sswitch_12
        -0x403c52ec -> :sswitch_11
        -0x39e30d50 -> :sswitch_10
        -0x372740aa -> :sswitch_f
        -0x22733eb1 -> :sswitch_e
        -0x12d03231 -> :sswitch_d
        -0x129efcb7 -> :sswitch_c
        -0x1092be76 -> :sswitch_b
        -0xf1e1b22 -> :sswitch_a
        -0xb707129 -> :sswitch_9
        -0xb701608 -> :sswitch_8
        0x68ac491 -> :sswitch_7
        0x10625eaf -> :sswitch_6
        0x1eae3586 -> :sswitch_5
        0x2780c510 -> :sswitch_4
        0x421152db -> :sswitch_3
        0x50f26695 -> :sswitch_2
        0x54800325 -> :sswitch_1
        0x7f013640 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 445
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorId:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "anchorId"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "roomId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopic:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "roomTopic"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTopicId:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "roomTopicId"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->roomTitle:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    const-string v0, "roomTitle"

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberCount:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const-string v0, "memberCount"

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    const-string p0, "maskMode"

    .line 65
    .line 66
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->maskMode:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const-string p0, "liveTags"

    .line 76
    .line 77
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTags:Ljava/util/List;

    .line 81
    .line 82
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 83
    .line 84
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 85
    .line 86
    .line 87
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 88
    .line 89
    if-eqz p0, :cond_8

    .line 90
    .line 91
    const-string p0, "memberAvatars"

    .line 92
    .line 93
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->memberAvatars:Ljava/util/List;

    .line 97
    .line 98
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceMemberAvatar;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 99
    .line 100
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveTemplate:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const-string v0, "liveTemplate"

    .line 108
    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 113
    .line 114
    if-eqz p0, :cond_a

    .line 115
    .line 116
    const-string p0, "feedTags"

    .line 117
    .line 118
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedTags:Ljava/util/List;

    .line 122
    .line 123
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 124
    .line 125
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 126
    .line 127
    .line 128
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->state:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_b

    .line 131
    .line 132
    const-string v0, "state"

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 138
    .line 139
    const/4 v0, 0x1

    .line 140
    if-eqz p0, :cond_c

    .line 141
    .line 142
    const-string p0, "liveAttributeTags"

    .line 143
    .line 144
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 148
    .line 149
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->liveAttributeTags:Lcom/p1/mobile/putong/live/base/data/BLiveDirectionTags;

    .line 150
    .line 151
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 152
    .line 153
    .line 154
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 155
    .line 156
    if-eqz p0, :cond_d

    .line 157
    .line 158
    const-string p0, "extraInfo"

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 164
    .line 165
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->extraInfo:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceFeedExtraInfo;

    .line 166
    .line 167
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 168
    .line 169
    .line 170
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->feedType:Ljava/lang/String;

    .line 171
    .line 172
    if-eqz p0, :cond_e

    .line 173
    .line 174
    const-string v1, "feedType"

    .line 175
    .line 176
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 177
    .line 178
    .line 179
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 180
    .line 181
    if-eqz p0, :cond_f

    .line 182
    .line 183
    const-string p0, "intlFrame"

    .line 184
    .line 185
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 189
    .line 190
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->intlFrame:Lcom/p1/mobile/putong/live/base/data/BLiveIntlLiveFrame;

    .line 191
    .line 192
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 193
    .line 194
    .line 195
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 196
    .line 197
    if-eqz p0, :cond_10

    .line 198
    .line 199
    const-string p0, "anchorLocation"

    .line 200
    .line 201
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    sget-object p0, Lcom/p1/mobile/putong/data/Location;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 205
    .line 206
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->anchorLocation:Lcom/p1/mobile/putong/data/Location;

    .line 207
    .line 208
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 209
    .line 210
    .line 211
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 212
    .line 213
    if-eqz p0, :cond_11

    .line 214
    .line 215
    const-string p0, "streamCdnInfo"

    .line 216
    .line 217
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 218
    .line 219
    .line 220
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 221
    .line 222
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamCdnInfo:Lcom/p1/mobile/putong/live/base/data/BLiveStreamCdnInfo;

    .line 223
    .line 224
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 225
    .line 226
    .line 227
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 228
    .line 229
    if-eqz p0, :cond_12

    .line 230
    .line 231
    const-string p0, "streamUrl"

    .line 232
    .line 233
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 237
    .line 238
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;->streamUrl:Lcom/p1/mobile/putong/live/base/data/BLiveStreamUrl;

    .line 239
    .line 240
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 241
    .line 242
    .line 243
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

    .line 244
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomFeed;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
