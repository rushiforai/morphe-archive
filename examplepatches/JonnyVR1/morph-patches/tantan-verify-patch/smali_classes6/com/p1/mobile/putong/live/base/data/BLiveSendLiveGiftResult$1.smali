.class Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;",
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
    const-string p0, "receiverShowMask"

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
    const-string p0, "senderShowMask"

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
    const-string p0, "remainingDurationSec"

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
    const-string p0, "mask"

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
    const-string p0, "tip"

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
    const-string p0, "bagSystemCommentStatus"

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
    const-string p0, "remainingTantanCoins"

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
    const-string p0, "tradeNo"

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
    const-string p0, "multiCall"

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
    const-string p0, "previewMask"

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
    const-string p0, "effectExt"

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
    const-string p0, "guildCall"

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
    const-string p0, "givenGiftBrief"

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
    const-string p0, "remainingDiamonds"

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
    const-string p0, "receiveMask"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 226
    .line 227
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 228
    .line 229
    return v1

    .line 230
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 231
    .line 232
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 237
    .line 238
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

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
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 250
    .line 251
    return v1

    .line 252
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 253
    .line 254
    .line 255
    move-result-wide p2

    .line 256
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 257
    .line 258
    return v1

    .line 259
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 260
    .line 261
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 266
    .line 267
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 268
    .line 269
    return v1

    .line 270
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 275
    .line 276
    return v1

    .line 277
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 278
    .line 279
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 284
    .line 285
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 286
    .line 287
    return v1

    .line 288
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 289
    .line 290
    .line 291
    move-result-wide p2

    .line 292
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 293
    .line 294
    return v1

    .line 295
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object p0

    .line 299
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 300
    .line 301
    return v1

    .line 302
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 303
    .line 304
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 309
    .line 310
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 311
    .line 312
    return v1

    .line 313
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 314
    .line 315
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 320
    .line 321
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 322
    .line 323
    return v1

    .line 324
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 329
    .line 330
    return v1

    .line 331
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 332
    .line 333
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 334
    .line 335
    .line 336
    move-result-object p0

    .line 337
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 338
    .line 339
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 340
    .line 341
    return v1

    .line 342
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 343
    .line 344
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 349
    .line 350
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 351
    .line 352
    return v1

    .line 353
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 354
    .line 355
    .line 356
    move-result-wide p2

    .line 357
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 358
    .line 359
    return v1

    .line 360
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 361
    .line 362
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 367
    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 369
    .line 370
    return v1

    .line 371
    :sswitch_data_0
    .sparse-switch
        -0x7d633b91 -> :sswitch_f
        -0x75693a4b -> :sswitch_e
        -0x727f6dd3 -> :sswitch_d
        -0x6e33070f -> :sswitch_c
        -0x578a5d30 -> :sswitch_b
        -0x4cf9c52c -> :sswitch_a
        -0x47f880c9 -> :sswitch_9
        -0x3f9ecdbb -> :sswitch_8
        -0x1c3d9c54 -> :sswitch_7
        -0x6e657e6 -> :sswitch_6
        0x1c09b -> :sswitch_5
        0x3306ec -> :sswitch_4
        0x2d88e247 -> :sswitch_3
        0x4f6b6673 -> :sswitch_2
        0x5f1608de -> :sswitch_1
        0x795b7e98 -> :sswitch_0
    .end sparse-switch

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
    .line 436
    .line 437
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

    .line 371
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "remainingTantanCoins"

    .line 2
    .line 3
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingTantanCoins:J

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "givenGiftBrief"

    .line 14
    .line 15
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 19
    .line 20
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->givenGiftBrief:Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;

    .line 21
    .line 22
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 26
    .line 27
    if-eqz p0, :cond_1

    .line 28
    .line 29
    const-string p0, "mask"

    .line 30
    .line 31
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 35
    .line 36
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 37
    .line 38
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 39
    .line 40
    .line 41
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tradeNo:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_2

    .line 44
    .line 45
    const-string v1, "tradeNo"

    .line 46
    .line 47
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->effectExt:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string v1, "effectExt"

    .line 55
    .line 56
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "multiCall"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->multiCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 71
    .line 72
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const-string p0, "guildCall"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->guildCall:Lcom/p1/mobile/putong/live/base/data/BLiveGiftMultiCall;

    .line 87
    .line 88
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string p0, "bagSystemCommentStatus"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 101
    .line 102
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->bagSystemCommentStatus:Lcom/p1/mobile/putong/live/base/data/BLivePacketSystemCommentStatus;

    .line 103
    .line 104
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string p0, "receiveMask"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiveMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 119
    .line 120
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 121
    .line 122
    .line 123
    :cond_7
    const-string p0, "remainingDurationSec"

    .line 124
    .line 125
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDurationSec:J

    .line 126
    .line 127
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 128
    .line 129
    .line 130
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->tip:Ljava/lang/String;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string v1, "tip"

    .line 135
    .line 136
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const-string p0, "videoChat"

    .line 144
    .line 145
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 149
    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->videoChat:Lcom/p1/mobile/putong/live/base/data/BLiveGiftExtraVideoChat;

    .line 151
    .line 152
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 153
    .line 154
    .line 155
    :cond_9
    const-string p0, "remainingDiamonds"

    .line 156
    .line 157
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->remainingDiamonds:J

    .line 158
    .line 159
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 160
    .line 161
    .line 162
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string p0, "previewMask"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->previewMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 174
    .line 175
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "senderShowMask"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->senderShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string p0, "receiverShowMask"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    .line 205
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;->receiverShowMask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 206
    .line 207
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 208
    .line 209
    .line 210
    :cond_c
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 211
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveSendLiveGiftResult;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
