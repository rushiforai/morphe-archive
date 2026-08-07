.class Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;",
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
    const-string p0, "isValid"

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
    const/16 v2, 0xe

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "histories"

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
    const/16 v2, 0xd

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "countdown"

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
    const/16 v2, 0xc

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "senderId"

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
    const/16 v2, 0xb

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "limitSatisfied"

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
    const/16 v2, 0xa

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "senderName"

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
    const/16 v2, 0x9

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "token"

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
    const/16 v2, 0x8

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "hit"

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
    goto :goto_0

    .line 123
    :cond_7
    const/4 v2, 0x7

    .line 124
    goto :goto_0

    .line 125
    :sswitch_8
    const-string p0, "giftContent"

    .line 126
    .line 127
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 128
    .line 129
    .line 130
    move-result p0

    .line 131
    if-nez p0, :cond_8

    .line 132
    .line 133
    goto :goto_0

    .line 134
    :cond_8
    const/4 v2, 0x6

    .line 135
    goto :goto_0

    .line 136
    :sswitch_9
    const-string p0, "isEnough"

    .line 137
    .line 138
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    if-nez p0, :cond_9

    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_9
    const/4 v2, 0x5

    .line 146
    goto :goto_0

    .line 147
    :sswitch_a
    const-string p0, "isAnchor"

    .line 148
    .line 149
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 150
    .line 151
    .line 152
    move-result p0

    .line 153
    if-nez p0, :cond_a

    .line 154
    .line 155
    goto :goto_0

    .line 156
    :cond_a
    const/4 v2, 0x4

    .line 157
    goto :goto_0

    .line 158
    :sswitch_b
    const-string p0, "grabbedGiftContent"

    .line 159
    .line 160
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 161
    .line 162
    .line 163
    move-result p0

    .line 164
    if-nez p0, :cond_b

    .line 165
    .line 166
    goto :goto_0

    .line 167
    :cond_b
    const/4 v2, 0x3

    .line 168
    goto :goto_0

    .line 169
    :sswitch_c
    const-string p0, "anchorContent"

    .line 170
    .line 171
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    if-nez p0, :cond_c

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :cond_c
    const/4 v2, 0x2

    .line 179
    goto :goto_0

    .line 180
    :sswitch_d
    const-string p0, "endTime"

    .line 181
    .line 182
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    if-nez p0, :cond_d

    .line 187
    .line 188
    goto :goto_0

    .line 189
    :cond_d
    move v2, v1

    .line 190
    goto :goto_0

    .line 191
    :sswitch_e
    const-string p0, "hasGrabbed"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 194
    .line 195
    .line 196
    move-result p0

    .line 197
    if-nez p0, :cond_e

    .line 198
    .line 199
    goto :goto_0

    .line 200
    :cond_e
    move v2, v0

    .line 201
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 202
    .line 203
    .line 204
    return v0

    .line 205
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 210
    .line 211
    return v1

    .line 212
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    .line 214
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 215
    .line 216
    .line 217
    move-result-object p0

    .line 218
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 219
    .line 220
    return v1

    .line 221
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 222
    .line 223
    .line 224
    move-result-wide p2

    .line 225
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 226
    .line 227
    return v1

    .line 228
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 233
    .line 234
    return v1

    .line 235
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 247
    .line 248
    return v1

    .line 249
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 254
    .line 255
    return v1

    .line 256
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 257
    .line 258
    .line 259
    move-result p0

    .line 260
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 261
    .line 262
    return v1

    .line 263
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 264
    .line 265
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 266
    .line 267
    .line 268
    move-result-object p0

    .line 269
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 270
    .line 271
    return v1

    .line 272
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 273
    .line 274
    .line 275
    move-result p0

    .line 276
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 277
    .line 278
    return v1

    .line 279
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 280
    .line 281
    .line 282
    move-result p0

    .line 283
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 284
    .line 285
    return v1

    .line 286
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 287
    .line 288
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 293
    .line 294
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 295
    .line 296
    return v1

    .line 297
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 302
    .line 303
    return v1

    .line 304
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 305
    .line 306
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 307
    .line 308
    .line 309
    move-result-object p0

    .line 310
    check-cast p0, Ljava/lang/Double;

    .line 311
    .line 312
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 313
    .line 314
    .line 315
    move-result-wide p2

    .line 316
    iput-wide p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 317
    .line 318
    return v1

    .line 319
    :pswitch_e
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 320
    .line 321
    .line 322
    move-result p0

    .line 323
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 324
    .line 325
    return v1

    .line 326
    nop

    .line 327
    :sswitch_data_0
    .sparse-switch
        -0x762cfd45 -> :sswitch_e
        -0x5fcc95b8 -> :sswitch_d
        -0x57dc7bfc -> :sswitch_c
        -0x4e9ebccc -> :sswitch_b
        -0x2c104b81 -> :sswitch_a
        -0x253744c6 -> :sswitch_9
        -0x24a052d7 -> :sswitch_8
        0x19393 -> :sswitch_7
        0x696b9f9 -> :sswitch_6
        0x3b72e660 -> :sswitch_5
        0x478ceab7 -> :sswitch_4
        0x4a626a30 -> :sswitch_3
        0x50995631 -> :sswitch_2
        0x66d8e032 -> :sswitch_1
        0x7b953cf2 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 327
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "senderId"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->senderName:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "senderName"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "hasGrabbed"

    .line 20
    .line 21
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hasGrabbed:Z

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 24
    .line 25
    .line 26
    const-string p0, "hit"

    .line 27
    .line 28
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->hit:Z

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 34
    .line 35
    const/4 v0, 0x1

    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "grabbedGiftContent"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->grabbedGiftContent:Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "histories"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->histories:Ljava/util/List;

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGetRedPacketUser;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 62
    .line 63
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    const-string p0, "limitSatisfied"

    .line 67
    .line 68
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->limitSatisfied:Z

    .line 69
    .line 70
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 74
    .line 75
    if-eqz p0, :cond_4

    .line 76
    .line 77
    const-string p0, "giftContent"

    .line 78
    .line 79
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->giftContent:Ljava/util/List;

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseGift;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 87
    .line 88
    .line 89
    :cond_4
    const-string p0, "countdown"

    .line 90
    .line 91
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->countdown:J

    .line 92
    .line 93
    invoke-virtual {p2, p0, v1, v2}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 94
    .line 95
    .line 96
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->token:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz p0, :cond_5

    .line 99
    .line 100
    const-string v1, "token"

    .line 101
    .line 102
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    const-string p0, "isValid"

    .line 106
    .line 107
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isValid:Z

    .line 108
    .line 109
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 110
    .line 111
    .line 112
    const-string p0, "isEnough"

    .line 113
    .line 114
    iget-boolean v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isEnough:Z

    .line 115
    .line 116
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 117
    .line 118
    .line 119
    const-string p0, "endTime"

    .line 120
    .line 121
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 122
    .line 123
    .line 124
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 125
    .line 126
    iget-wide v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->endTime:D

    .line 127
    .line 128
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 129
    .line 130
    .line 131
    move-result-object v1

    .line 132
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 133
    .line 134
    .line 135
    const-string p0, "isAnchor"

    .line 136
    .line 137
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->isAnchor:Z

    .line 138
    .line 139
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 140
    .line 141
    .line 142
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;->anchorContent:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz p0, :cond_6

    .line 145
    .line 146
    const-string p1, "anchorContent"

    .line 147
    .line 148
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    :cond_6
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 152
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveFanBaseRedPacketInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
