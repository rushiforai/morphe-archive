.class Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;",
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
    const-string p0, "voiceSettles"

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
    const/16 v2, 0xd

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "diamond"

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
    const/16 v2, 0xc

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "confessionRelationship"

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
    const/16 v2, 0xb

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "blackList"

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
    const/16 v2, 0xa

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "voiceRoomProfile"

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
    const/16 v2, 0x9

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "liveSchemas"

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
    const/16 v2, 0x8

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "giftWallV2"

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
    goto :goto_0

    .line 109
    :cond_6
    const/4 v2, 0x7

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string p0, "coins"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result p0

    .line 117
    if-nez p0, :cond_7

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_7
    const/4 v2, 0x6

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string p0, "shootGameUserInfo"

    .line 123
    .line 124
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p0

    .line 128
    if-nez p0, :cond_8

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    const/4 v2, 0x5

    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    const-string p0, "undercoverGame"

    .line 134
    .line 135
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    if-nez p0, :cond_9

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_9
    const/4 v2, 0x4

    .line 143
    goto :goto_0

    .line 144
    :sswitch_a
    const-string p0, "anchorInfo"

    .line 145
    .line 146
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    if-nez p0, :cond_a

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_a
    const/4 v2, 0x3

    .line 154
    goto :goto_0

    .line 155
    :sswitch_b
    const-string p0, "batchGivenGiftRes"

    .line 156
    .line 157
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result p0

    .line 161
    if-nez p0, :cond_b

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_b
    const/4 v2, 0x2

    .line 165
    goto :goto_0

    .line 166
    :sswitch_c
    const-string p0, "shootGameTask"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result p0

    .line 172
    if-nez p0, :cond_c

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_c
    move v2, v1

    .line 176
    goto :goto_0

    .line 177
    :sswitch_d
    const-string p0, "wealthLogo"

    .line 178
    .line 179
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result p0

    .line 183
    if-nez p0, :cond_d

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_d
    move v2, v0

    .line 187
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 188
    .line 189
    .line 190
    return v0

    .line 191
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 192
    .line 193
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 198
    .line 199
    return v1

    .line 200
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 201
    .line 202
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object p0

    .line 206
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 207
    .line 208
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 209
    .line 210
    return v1

    .line 211
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 212
    .line 213
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    move-result-object p0

    .line 217
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 218
    .line 219
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 220
    .line 221
    return v1

    .line 222
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 223
    .line 224
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 229
    .line 230
    return v1

    .line 231
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 232
    .line 233
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 238
    .line 239
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 243
    .line 244
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 249
    .line 250
    return v1

    .line 251
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 258
    .line 259
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 260
    .line 261
    return v1

    .line 262
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 263
    .line 264
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object p0

    .line 268
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 269
    .line 270
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 271
    .line 272
    return v1

    .line 273
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 274
    .line 275
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 276
    .line 277
    .line 278
    move-result-object p0

    .line 279
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 280
    .line 281
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 282
    .line 283
    return v1

    .line 284
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 285
    .line 286
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 291
    .line 292
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 293
    .line 294
    return v1

    .line 295
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 296
    .line 297
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 302
    .line 303
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 304
    .line 305
    return v1

    .line 306
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 307
    .line 308
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 313
    .line 314
    return v1

    .line 315
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 316
    .line 317
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 322
    .line 323
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 324
    .line 325
    return v1

    .line 326
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 327
    .line 328
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 333
    .line 334
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 335
    .line 336
    return v1

    .line 337
    :sswitch_data_0
    .sparse-switch
        -0x7999b108 -> :sswitch_d
        -0x768dfa2a -> :sswitch_c
        -0x5cc02893 -> :sswitch_b
        -0x4d54c6fd -> :sswitch_a
        -0x4b082f8f -> :sswitch_9
        -0x249dd916 -> :sswitch_8
        0x5a72402 -> :sswitch_7
        0xfa80336 -> :sswitch_6
        0x2b7ac466 -> :sswitch_5
        0x4b8577bc -> :sswitch_4
        0x4f659d3d -> :sswitch_3
        0x547fe05f -> :sswitch_2
        0x62a62154 -> :sswitch_1
        0x791072f6 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 337
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "giftWallV2"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->giftWallV2:Lcom/p1/mobile/putong/live/base/data/BLiveNewGiftWallDetailInfoItem;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "shootGameUserInfo"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameUserInfo:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameInfo;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "shootGameTask"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->shootGameTask:Lcom/p1/mobile/putong/live/base/data/BLiveShootGameTask;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "undercoverGame"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->undercoverGame:Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "anchorInfo"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->anchorInfo:Lcom/p1/mobile/putong/live/base/data/BLiveUnJailAnchorInfo;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "wealthLogo"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->wealthLogo:Lcom/p1/mobile/putong/live/base/data/BLiveWealthLogoInfo;

    .line 94
    .line 95
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "confessionRelationship"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->confessionRelationship:Lcom/p1/mobile/putong/live/base/data/BLiveMatchRelationshipInfo;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "batchGivenGiftRes"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->batchGivenGiftRes:Ljava/util/List;

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveMultiGiftResultItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 126
    .line 127
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string p0, "blackList"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->blackList:Ljava/util/List;

    .line 140
    .line 141
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveBlackListItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 142
    .line 143
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string p0, "voiceSettles"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceSettles:Ljava/util/List;

    .line 156
    .line 157
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceVirtualRoomSettleItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 158
    .line 159
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string p0, "voiceRoomProfile"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->voiceRoomProfile:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceRoomProfile;

    .line 174
    .line 175
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "coins"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->coins:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string p0, "liveSchemas"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->liveSchemas:Ljava/util/List;

    .line 204
    .line 205
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 206
    .line 207
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 208
    .line 209
    .line 210
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 211
    .line 212
    if-eqz p0, :cond_d

    .line 213
    .line 214
    const-string p0, "diamond"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCoin;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;->diamond:Lcom/p1/mobile/putong/live/base/data/BLiveCoin;

    .line 222
    .line 223
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 224
    .line 225
    .line 226
    :cond_d
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 227
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveExtraData$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveExtraData;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
