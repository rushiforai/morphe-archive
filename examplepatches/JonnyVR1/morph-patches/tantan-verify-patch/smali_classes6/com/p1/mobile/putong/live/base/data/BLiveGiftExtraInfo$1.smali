.class Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;",
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
    const-string p0, "officialShow"

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
    const/16 v2, 0xf

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "multiPk"

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
    const/16 v2, 0xe

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "videoChat"

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
    const/16 v2, 0xd

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "shoutingChat"

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
    const/16 v2, 0xc

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "draw"

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
    const/16 v2, 0xb

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "call"

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
    const/16 v2, 0xa

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "pk"

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
    const/16 v2, 0x9

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "discounts"

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
    const/16 v2, 0x8

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "namingCard"

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
    goto :goto_0

    .line 137
    :cond_8
    const/4 v2, 0x7

    .line 138
    goto :goto_0

    .line 139
    :sswitch_9
    const-string p0, "voiceLiveAuction"

    .line 140
    .line 141
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 142
    .line 143
    .line 144
    move-result p0

    .line 145
    if-nez p0, :cond_9

    .line 146
    .line 147
    goto :goto_0

    .line 148
    :cond_9
    const/4 v2, 0x6

    .line 149
    goto :goto_0

    .line 150
    :sswitch_a
    const-string p0, "voiceLive"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 153
    .line 154
    .line 155
    move-result p0

    .line 156
    if-nez p0, :cond_a

    .line 157
    .line 158
    goto :goto_0

    .line 159
    :cond_a
    const/4 v2, 0x5

    .line 160
    goto :goto_0

    .line 161
    :sswitch_b
    const-string p0, "topChat"

    .line 162
    .line 163
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 164
    .line 165
    .line 166
    move-result p0

    .line 167
    if-nez p0, :cond_b

    .line 168
    .line 169
    goto :goto_0

    .line 170
    :cond_b
    const/4 v2, 0x4

    .line 171
    goto :goto_0

    .line 172
    :sswitch_c
    const-string p0, "multiCall"

    .line 173
    .line 174
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result p0

    .line 178
    if-nez p0, :cond_c

    .line 179
    .line 180
    goto :goto_0

    .line 181
    :cond_c
    const/4 v2, 0x3

    .line 182
    goto :goto_0

    .line 183
    :sswitch_d
    const-string p0, "stormComment"

    .line 184
    .line 185
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 186
    .line 187
    .line 188
    move-result p0

    .line 189
    if-nez p0, :cond_d

    .line 190
    .line 191
    goto :goto_0

    .line 192
    :cond_d
    const/4 v2, 0x2

    .line 193
    goto :goto_0

    .line 194
    :sswitch_e
    const-string p0, "giftSourceEvent"

    .line 195
    .line 196
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result p0

    .line 200
    if-nez p0, :cond_e

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_e
    move v2, v1

    .line 204
    goto :goto_0

    .line 205
    :sswitch_f
    const-string p0, "guildCall"

    .line 206
    .line 207
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result p0

    .line 211
    if-nez p0, :cond_f

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_f
    move v2, v0

    .line 215
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 216
    .line 217
    .line 218
    return v0

    .line 219
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 226
    .line 227
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 228
    .line 229
    return v1

    .line 230
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 231
    .line 232
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 237
    .line 238
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 239
    .line 240
    return v1

    .line 241
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 242
    .line 243
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object p0

    .line 247
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 248
    .line 249
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 250
    .line 251
    return v1

    .line 252
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 253
    .line 254
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 259
    .line 260
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 261
    .line 262
    return v1

    .line 263
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 264
    .line 265
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 270
    .line 271
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 272
    .line 273
    return v1

    .line 274
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 275
    .line 276
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 281
    .line 282
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 283
    .line 284
    return v1

    .line 285
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 286
    .line 287
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 292
    .line 293
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 294
    .line 295
    return v1

    .line 296
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 297
    .line 298
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 299
    .line 300
    .line 301
    move-result-object p0

    .line 302
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 303
    .line 304
    return v1

    .line 305
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 306
    .line 307
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 312
    .line 313
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 314
    .line 315
    return v1

    .line 316
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 317
    .line 318
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 323
    .line 324
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 325
    .line 326
    return v1

    .line 327
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 328
    .line 329
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 334
    .line 335
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 345
    .line 346
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 347
    .line 348
    return v1

    .line 349
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 356
    .line 357
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 358
    .line 359
    return v1

    .line 360
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 361
    .line 362
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 367
    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 369
    .line 370
    return v1

    .line 371
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 372
    .line 373
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object p0

    .line 377
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 378
    .line 379
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 380
    .line 381
    return v1

    .line 382
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 383
    .line 384
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 389
    .line 390
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 391
    .line 392
    return v1

    .line 393
    :sswitch_data_0
    .sparse-switch
        -0x6e33070f -> :sswitch_f
        -0x531c6c11 -> :sswitch_e
        -0x4a819aca -> :sswitch_d
        -0x47f880c9 -> :sswitch_c
        -0x43f8e9b3 -> :sswitch_b
        -0x3cc0e2c2 -> :sswitch_a
        -0x31bb68db -> :sswitch_9
        -0x2bb47448 -> :sswitch_8
        -0x739ccae -> :sswitch_7
        0xdfb -> :sswitch_6
        0x2e7a5e -> :sswitch_5
        0x2f2d44 -> :sswitch_4
        0x26cbe361 -> :sswitch_3
        0x4f6b6673 -> :sswitch_2
        0x53d67514 -> :sswitch_1
        0x589c7c88 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 393
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "pk"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->pk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraPkInfo;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "call"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->call:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraCallInfo;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "draw"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->draw:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraDrawInfo;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "voiceLive"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLive:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVoiceInfo;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "giftSourceEvent"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->giftSourceEvent:Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "stormComment"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->stormComment:Lcom/p1/mobile/putong/live/base/data/BLiveSendStormDanmaku;

    .line 94
    .line 95
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "multiCall"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "namingCard"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->namingCard:Lcom/p1/mobile/putong/live/base/data/BLiveGiftNamingCardInfo;

    .line 126
    .line 127
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string p0, "guildCall"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 142
    .line 143
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string p0, "discounts"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->discounts:Ljava/util/List;

    .line 156
    .line 157
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveDiscountSendGiftItem;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 158
    .line 159
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string p0, "topChat"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->topChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraTopChatInfo;

    .line 174
    .line 175
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "voiceLiveAuction"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->voiceLiveAuction:Lcom/p1/mobile/putong/live/base/data/BLiveVoiceAuctionGiftExtra;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string p0, "shoutingChat"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->shoutingChat:Lcom/p1/mobile/putong/live/base/data/BLiveCommonViewConfig;

    .line 206
    .line 207
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 208
    .line 209
    .line 210
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 211
    .line 212
    if-eqz p0, :cond_d

    .line 213
    .line 214
    const-string p0, "multiPk"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->multiPk:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraMultiPkInfo;

    .line 222
    .line 223
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 224
    .line 225
    .line 226
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 227
    .line 228
    if-eqz p0, :cond_e

    .line 229
    .line 230
    const-string p0, "officialShow"

    .line 231
    .line 232
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 236
    .line 237
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->officialShow:Lcom/p1/mobile/putong/live/base/data/BLiveGiftOfficialShowExtraInfo;

    .line 238
    .line 239
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 240
    .line 241
    .line 242
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 243
    .line 244
    if-eqz p0, :cond_f

    .line 245
    .line 246
    const-string p0, "videoChat"

    .line 247
    .line 248
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 254
    .line 255
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 256
    .line 257
    .line 258
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

    .line 259
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
