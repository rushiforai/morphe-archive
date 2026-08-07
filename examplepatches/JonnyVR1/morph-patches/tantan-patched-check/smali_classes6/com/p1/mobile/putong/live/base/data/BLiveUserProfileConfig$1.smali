.class Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;",
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
    const-class p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;->newInstance()Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;",
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
    const-string p0, "hierarchy"

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
    const-string p0, "isGuard"

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
    const-string p0, "hasFanbaseGroup"

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
    const-string p0, "enableNewPrivilege"

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
    const-string p0, "blockStatus"

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
    const-string p0, "familyCard"

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
    const-string p0, "showGuardEntrance"

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
    const-string p0, "isHiddenAnchorHierachy"

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
    const-string p0, "contributionListShow"

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
    const-string p0, "isHiddenUserHierachy"

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
    const-string p0, "showGiftWallEntrance"

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
    const-string p0, "showType"

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
    const-string p0, "isUserInFanbaseGroup"

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
    const-string p0, "showGiftWallEntranceV2"

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
    const-string p0, "jumpConfig"

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
    const-string p0, "isBeautifulNumber"

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
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 222
    .line 223
    .line 224
    move-result-object p0

    .line 225
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 226
    .line 227
    return v1

    .line 228
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 233
    .line 234
    return v1

    .line 235
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 247
    .line 248
    return v1

    .line 249
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 254
    .line 255
    return v1

    .line 256
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 257
    .line 258
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object p0

    .line 262
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 263
    .line 264
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 265
    .line 266
    return v1

    .line 267
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 268
    .line 269
    .line 270
    move-result p0

    .line 271
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 272
    .line 273
    return v1

    .line 274
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 275
    .line 276
    .line 277
    move-result p0

    .line 278
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 279
    .line 280
    return v1

    .line 281
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 282
    .line 283
    .line 284
    move-result p0

    .line 285
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 286
    .line 287
    return v1

    .line 288
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 289
    .line 290
    .line 291
    move-result p0

    .line 292
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 293
    .line 294
    return v1

    .line 295
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 296
    .line 297
    .line 298
    move-result p0

    .line 299
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 300
    .line 301
    return v1

    .line 302
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object p0

    .line 306
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 307
    .line 308
    return v1

    .line 309
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 314
    .line 315
    return v1

    .line 316
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 317
    .line 318
    .line 319
    move-result p0

    .line 320
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 321
    .line 322
    return v1

    .line 323
    :pswitch_e
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 324
    .line 325
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 326
    .line 327
    .line 328
    move-result-object p0

    .line 329
    iput-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 330
    .line 331
    return v1

    .line 332
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 333
    .line 334
    .line 335
    move-result p0

    .line 336
    iput-boolean p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 337
    .line 338
    return v1

    .line 339
    :sswitch_data_0
    .sparse-switch
        -0x57186250 -> :sswitch_f
        -0x3e11f6f0 -> :sswitch_e
        -0x2dc6f397 -> :sswitch_d
        -0x24570e4b -> :sswitch_c
        -0x1431e829 -> :sswitch_b
        -0x3c6eef3 -> :sswitch_a
        0x7d7b9a0 -> :sswitch_9
        0xe7578eb -> :sswitch_8
        0x173bf18a -> :sswitch_7
        0x2370707e -> :sswitch_6
        0x2f93f894 -> :sswitch_5
        0x34b622df -> :sswitch_4
        0x35fd8e14 -> :sswitch_3
        0x4a3aa435 -> :sswitch_2
        0x7acacb9b -> :sswitch_1
        0x7e129235 -> :sswitch_0
    .end sparse-switch

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

    .line 339
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;->parseField(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showType:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "showType"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    const-string p0, "contributionListShow"

    .line 11
    .line 12
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->contributionListShow:Z

    .line 13
    .line 14
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 15
    .line 16
    .line 17
    const-string p0, "showGuardEntrance"

    .line 18
    .line 19
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGuardEntrance:Z

    .line 20
    .line 21
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    const-string p0, "jumpConfig"

    .line 29
    .line 30
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->jumpConfig:Ljava/util/List;

    .line 34
    .line 35
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 36
    .line 37
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    const-string p0, "hierarchy"

    .line 45
    .line 46
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hierarchy:Ljava/util/List;

    .line 50
    .line 51
    sget-object v0, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfigHierarchy;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 52
    .line 53
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    const-string p0, "isGuard"

    .line 57
    .line 58
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isGuard:Z

    .line 59
    .line 60
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 61
    .line 62
    .line 63
    const-string p0, "hasFanbaseGroup"

    .line 64
    .line 65
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->hasFanbaseGroup:Z

    .line 66
    .line 67
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 68
    .line 69
    .line 70
    const-string p0, "isUserInFanbaseGroup"

    .line 71
    .line 72
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isUserInFanbaseGroup:Z

    .line 73
    .line 74
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 75
    .line 76
    .line 77
    const-string p0, "showGiftWallEntrance"

    .line 78
    .line 79
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntrance:Z

    .line 80
    .line 81
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 82
    .line 83
    .line 84
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->blockStatus:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_3

    .line 87
    .line 88
    const-string v0, "blockStatus"

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_3
    const-string p0, "enableNewPrivilege"

    .line 94
    .line 95
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->enableNewPrivilege:Z

    .line 96
    .line 97
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 98
    .line 99
    .line 100
    const-string p0, "isBeautifulNumber"

    .line 101
    .line 102
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isBeautifulNumber:Z

    .line 103
    .line 104
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 105
    .line 106
    .line 107
    const-string p0, "showGiftWallEntranceV2"

    .line 108
    .line 109
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->showGiftWallEntranceV2:Z

    .line 110
    .line 111
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    const-string p0, "isHiddenUserHierachy"

    .line 115
    .line 116
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenUserHierachy:Z

    .line 117
    .line 118
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    const-string p0, "isHiddenAnchorHierachy"

    .line 122
    .line 123
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->isHiddenAnchorHierachy:Z

    .line 124
    .line 125
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 129
    .line 130
    if-eqz p0, :cond_4

    .line 131
    .line 132
    const-string p0, "familyCard"

    .line 133
    .line 134
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 138
    .line 139
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;->familyCard:Lcom/p1/mobile/putong/live/base/data/BLiveUserFamilyCard;

    .line 140
    .line 141
    const/4 v0, 0x1

    .line 142
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 143
    .line 144
    .line 145
    :cond_4
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 146
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig$1;->serializeFields(Lcom/p1/mobile/putong/live/base/data/BLiveUserProfileConfig;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
