.class Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;->newInstance()Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
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
    const-string p0, "location"

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
    const/16 v2, 0x12

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "musicId"

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
    const/16 v2, 0x11

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "momentType"

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
    const/16 v2, 0x10

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "momentCard"

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
    const/16 v2, 0xf

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "isVoiceLive"

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
    const/16 v2, 0xe

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "views"

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
    const/16 v2, 0xd

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "value"

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
    const/16 v2, 0xc

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "owner"

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
    const/16 v2, 0xb

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "media"

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
    const/16 v2, 0xa

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "likes"

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
    const/16 v2, 0x9

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "videoBullets"

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
    const/16 v2, 0x8

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string p0, "tags"

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
    goto :goto_0

    .line 179
    :cond_b
    const/4 v2, 0x7

    .line 180
    goto :goto_0

    .line 181
    :sswitch_c
    const-string p0, "id"

    .line 182
    .line 183
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    if-nez p0, :cond_c

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_c
    const/4 v2, 0x6

    .line 191
    goto :goto_0

    .line 192
    :sswitch_d
    const-string p0, "messages"

    .line 193
    .line 194
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p0

    .line 198
    if-nez p0, :cond_d

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_d
    const/4 v2, 0x5

    .line 202
    goto :goto_0

    .line 203
    :sswitch_e
    const-string p0, "createdTime"

    .line 204
    .line 205
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result p0

    .line 209
    if-nez p0, :cond_e

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_e
    const/4 v2, 0x4

    .line 213
    goto :goto_0

    .line 214
    :sswitch_f
    const-string p0, "topics"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result p0

    .line 220
    if-nez p0, :cond_f

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_f
    const/4 v2, 0x3

    .line 224
    goto :goto_0

    .line 225
    :sswitch_10
    const-string p0, "sourceType"

    .line 226
    .line 227
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result p0

    .line 231
    if-nez p0, :cond_10

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_10
    const/4 v2, 0x2

    .line 235
    goto :goto_0

    .line 236
    :sswitch_11
    const-string p0, "isLive"

    .line 237
    .line 238
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result p0

    .line 242
    if-nez p0, :cond_11

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_11
    move v2, v1

    .line 246
    goto :goto_0

    .line 247
    :sswitch_12
    const-string p0, "haveLiked"

    .line 248
    .line 249
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result p0

    .line 253
    if-nez p0, :cond_12

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_12
    move v2, v0

    .line 257
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 258
    .line 259
    .line 260
    return v0

    .line 261
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 262
    .line 263
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    move-result-object p0

    .line 267
    check-cast p0, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 268
    .line 269
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 270
    .line 271
    return v1

    .line 272
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object p0

    .line 276
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 277
    .line 278
    return v1

    .line 279
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreMomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 280
    .line 281
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    check-cast p0, Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 286
    .line 287
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 288
    .line 289
    return v1

    .line 290
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/MomentCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 291
    .line 292
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    check-cast p0, Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 297
    .line 298
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 299
    .line 300
    return v1

    .line 301
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 302
    .line 303
    .line 304
    move-result p0

    .line 305
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 306
    .line 307
    return v1

    .line 308
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 309
    .line 310
    .line 311
    move-result p0

    .line 312
    iput p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 313
    .line 314
    return v1

    .line 315
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 320
    .line 321
    return v1

    .line 322
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 323
    .line 324
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    check-cast p0, Ljava/lang/String;

    .line 329
    .line 330
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 331
    .line 332
    return v1

    .line 333
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 334
    .line 335
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 336
    .line 337
    .line 338
    move-result-object p0

    .line 339
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 340
    .line 341
    return v1

    .line 342
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 343
    .line 344
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object p0

    .line 348
    check-cast p0, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 349
    .line 350
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 351
    .line 352
    return v1

    .line 353
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/core/data/VideoBullet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 354
    .line 355
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 360
    .line 361
    return v1

    .line 362
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/core/data/MomentTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 363
    .line 364
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 365
    .line 366
    .line 367
    move-result-object p0

    .line 368
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 369
    .line 370
    return v1

    .line 371
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    iput-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 376
    .line 377
    return v0

    .line 378
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 379
    .line 380
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    check-cast p0, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 385
    .line 386
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 387
    .line 388
    return v1

    .line 389
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 390
    .line 391
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    check-cast p0, Ljava/lang/Double;

    .line 396
    .line 397
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 398
    .line 399
    .line 400
    move-result-wide p2

    .line 401
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 402
    .line 403
    return v1

    .line 404
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 405
    .line 406
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 407
    .line 408
    .line 409
    move-result-object p0

    .line 410
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 411
    .line 412
    return v1

    .line 413
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 414
    .line 415
    .line 416
    move-result-object p0

    .line 417
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 418
    .line 419
    return v1

    .line 420
    :pswitch_11
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 421
    .line 422
    .line 423
    move-result p0

    .line 424
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 425
    .line 426
    return v1

    .line 427
    :pswitch_12
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 428
    .line 429
    .line 430
    move-result p0

    .line 431
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 432
    .line 433
    return v1

    .line 434
    nop

    .line 435
    :sswitch_data_0
    .sparse-switch
        -0x5507ccdb -> :sswitch_12
        -0x465a72ca -> :sswitch_11
        -0x423f1a0b -> :sswitch_10
        -0x33bd26dc -> :sswitch_f
        -0x1d336e2b -> :sswitch_e
        -0x1b8afeb4 -> :sswitch_d
        0xd1b -> :sswitch_c
        0x363419 -> :sswitch_b
        0x528ceb6 -> :sswitch_a
        0x62343bc -> :sswitch_9
        0x62f6fe4 -> :sswitch_8
        0x653f2b3 -> :sswitch_7
        0x6ac9171 -> :sswitch_6
        0x6b01a6e -> :sswitch_5
        0x97c5f34 -> :sswitch_4
        0x28de7130 -> :sswitch_3
        0x28e6855a -> :sswitch_2
        0x54340220 -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 435
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;->parseField(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/CoreMomentInfo;",
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
    const-string v0, "location"

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
    const/16 v3, 0x12

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "musicId"

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
    const/16 v3, 0x11

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "momentType"

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
    const/16 v3, 0x10

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "momentCard"

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
    const/16 v3, 0xf

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "isVoiceLive"

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
    const/16 v3, 0xe

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "views"

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
    const/16 v3, 0xd

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "value"

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
    const/16 v3, 0xc

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "owner"

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
    const/16 v3, 0xb

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "media"

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
    const/16 v3, 0xa

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "likes"

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
    const/16 v3, 0x9

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string v0, "videoBullets"

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
    const/16 v3, 0x8

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_b
    const-string v0, "tags"

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
    goto :goto_0

    .line 179
    :cond_b
    const/4 v3, 0x7

    .line 180
    goto :goto_0

    .line 181
    :sswitch_c
    const-string v0, "id"

    .line 182
    .line 183
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    if-nez v0, :cond_c

    .line 188
    .line 189
    goto :goto_0

    .line 190
    :cond_c
    const/4 v3, 0x6

    .line 191
    goto :goto_0

    .line 192
    :sswitch_d
    const-string v0, "messages"

    .line 193
    .line 194
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    if-nez v0, :cond_d

    .line 199
    .line 200
    goto :goto_0

    .line 201
    :cond_d
    const/4 v3, 0x5

    .line 202
    goto :goto_0

    .line 203
    :sswitch_e
    const-string v0, "createdTime"

    .line 204
    .line 205
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    if-nez v0, :cond_e

    .line 210
    .line 211
    goto :goto_0

    .line 212
    :cond_e
    const/4 v3, 0x4

    .line 213
    goto :goto_0

    .line 214
    :sswitch_f
    const-string v0, "topics"

    .line 215
    .line 216
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-nez v0, :cond_f

    .line 221
    .line 222
    goto :goto_0

    .line 223
    :cond_f
    const/4 v3, 0x3

    .line 224
    goto :goto_0

    .line 225
    :sswitch_10
    const-string v0, "sourceType"

    .line 226
    .line 227
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-nez v0, :cond_10

    .line 232
    .line 233
    goto :goto_0

    .line 234
    :cond_10
    const/4 v3, 0x2

    .line 235
    goto :goto_0

    .line 236
    :sswitch_11
    const-string v0, "isLive"

    .line 237
    .line 238
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    if-nez v0, :cond_11

    .line 243
    .line 244
    goto :goto_0

    .line 245
    :cond_11
    move v3, v2

    .line 246
    goto :goto_0

    .line 247
    :sswitch_12
    const-string v0, "haveLiked"

    .line 248
    .line 249
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-nez v0, :cond_12

    .line 254
    .line 255
    goto :goto_0

    .line 256
    :cond_12
    move v3, v1

    .line 257
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 258
    .line 259
    .line 260
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 261
    .line 262
    .line 263
    move-result p0

    .line 264
    return p0

    .line 265
    :pswitch_0
    return v2

    .line 266
    :pswitch_1
    return v1

    .line 267
    :pswitch_2
    return v2

    .line 268
    nop

    .line 269
    :sswitch_data_0
    .sparse-switch
        -0x5507ccdb -> :sswitch_12
        -0x465a72ca -> :sswitch_11
        -0x423f1a0b -> :sswitch_10
        -0x33bd26dc -> :sswitch_f
        -0x1d336e2b -> :sswitch_e
        -0x1b8afeb4 -> :sswitch_d
        0xd1b -> :sswitch_c
        0x363419 -> :sswitch_b
        0x528ceb6 -> :sswitch_a
        0x62343bc -> :sswitch_9
        0x62f6fe4 -> :sswitch_8
        0x653f2b3 -> :sswitch_7
        0x6ac9171 -> :sswitch_6
        0x6b01a6e -> :sswitch_5
        0x97c5f34 -> :sswitch_4
        0x28de7130 -> :sswitch_3
        0x28e6855a -> :sswitch_2
        0x54340220 -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
    .end sparse-switch

    .line 270
    .line 271
    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
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
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 269
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->value:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "value"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "createdTime"

    .line 20
    .line 21
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 25
    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->createdTime:D

    .line 27
    .line 28
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    const/4 v1, 0x1

    .line 33
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_2

    .line 39
    .line 40
    const-string p0, "owner"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->USER_ID:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    .line 47
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->owner:Ljava/lang/String;

    .line 48
    .line 49
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 53
    .line 54
    if-eqz p0, :cond_3

    .line 55
    .line 56
    const-string p0, "media"

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->media:Ljava/util/List;

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/data/Converter;->RAW_PICTURE_TO_MEDIA:Lcom/tantanapp/common/data/JsonAdapter;

    .line 64
    .line 65
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    const-string p0, "haveLiked"

    .line 69
    .line 70
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->haveLiked:Z

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 76
    .line 77
    if-eqz p0, :cond_4

    .line 78
    .line 79
    const-string p0, "location"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/data/MessageLocation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 87
    .line 88
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 92
    .line 93
    if-eqz p0, :cond_5

    .line 94
    .line 95
    const-string p0, "momentType"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    sget-object p0, Lcom/p1/mobile/putong/core/data/CoreMomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 101
    .line 102
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentType:Lcom/p1/mobile/putong/core/data/CoreMomentType;

    .line 103
    .line 104
    invoke-virtual {p0, v0, p2, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 105
    .line 106
    .line 107
    :cond_5
    const-string p0, "isVoiceLive"

    .line 108
    .line 109
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isVoiceLive:Z

    .line 110
    .line 111
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 112
    .line 113
    .line 114
    const-string p0, "isLive"

    .line 115
    .line 116
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->isLive:Z

    .line 117
    .line 118
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 119
    .line 120
    .line 121
    const-string p0, "views"

    .line 122
    .line 123
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->views:I

    .line 124
    .line 125
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 126
    .line 127
    .line 128
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 129
    .line 130
    if-eqz p0, :cond_6

    .line 131
    .line 132
    const-string p0, "likes"

    .line 133
    .line 134
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 138
    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 140
    .line 141
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 142
    .line 143
    .line 144
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 145
    .line 146
    if-eqz p0, :cond_7

    .line 147
    .line 148
    const-string p0, "messages"

    .line 149
    .line 150
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    sget-object p0, Lcom/p1/mobile/putong/data/PartialIdList;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 154
    .line 155
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 156
    .line 157
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 158
    .line 159
    .line 160
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 161
    .line 162
    if-eqz p0, :cond_8

    .line 163
    .line 164
    const-string p0, "topics"

    .line 165
    .line 166
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->topics:Ljava/util/List;

    .line 170
    .line 171
    sget-object v0, Lcom/p1/mobile/putong/core/data/TopicMomentIdBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 174
    .line 175
    .line 176
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 177
    .line 178
    if-eqz p0, :cond_9

    .line 179
    .line 180
    const-string p0, "tags"

    .line 181
    .line 182
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 183
    .line 184
    .line 185
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->tags:Ljava/util/List;

    .line 186
    .line 187
    sget-object v0, Lcom/p1/mobile/putong/core/data/MomentTag;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 190
    .line 191
    .line 192
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 193
    .line 194
    if-eqz p0, :cond_a

    .line 195
    .line 196
    const-string p0, "videoBullets"

    .line 197
    .line 198
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->videoBullets:Ljava/util/List;

    .line 202
    .line 203
    sget-object v0, Lcom/p1/mobile/putong/core/data/VideoBullet;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    .line 205
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 206
    .line 207
    .line 208
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->musicId:Ljava/lang/String;

    .line 209
    .line 210
    if-eqz p0, :cond_b

    .line 211
    .line 212
    const-string v0, "musicId"

    .line 213
    .line 214
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 215
    .line 216
    .line 217
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 218
    .line 219
    if-eqz p0, :cond_c

    .line 220
    .line 221
    const-string p0, "momentCard"

    .line 222
    .line 223
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 224
    .line 225
    .line 226
    sget-object p0, Lcom/p1/mobile/putong/core/data/MomentCard;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 227
    .line 228
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->momentCard:Lcom/p1/mobile/putong/core/data/MomentCard;

    .line 229
    .line 230
    invoke-virtual {p0, v0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 231
    .line 232
    .line 233
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;->sourceType:Ljava/lang/String;

    .line 234
    .line 235
    if-eqz p0, :cond_d

    .line 236
    .line 237
    const-string p1, "sourceType"

    .line 238
    .line 239
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 240
    .line 241
    .line 242
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

    .line 243
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreMomentInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreMomentInfo$2;->serializeFields(Lcom/p1/mobile/putong/core/data/CoreMomentInfo;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
