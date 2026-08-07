.class Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;->newInstance()Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
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
    const-string p0, "momentMediaType"

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
    const-string p0, "seeCount"

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
    const-string p0, "overheating"

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
    const-string p0, "type"

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
    const-string p0, "pick"

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
    const-string p0, "id"

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
    const-string p0, "userIds"

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
    const-string p0, "momentId"

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
    const-string p0, "readStatus"

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
    const-string p0, "relation"

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
    const-string p0, "lowPopSeeCount"

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
    const-string p0, "sortId"

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
    const-string p0, "passBy"

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
    const-string p0, "online"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 196
    .line 197
    return v1

    .line 198
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 199
    .line 200
    .line 201
    move-result p0

    .line 202
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 203
    .line 204
    return v1

    .line 205
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 206
    .line 207
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    move-result-object p0

    .line 211
    check-cast p0, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 212
    .line 213
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 214
    .line 215
    return v1

    .line 216
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 217
    .line 218
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    check-cast p0, Lcom/p1/mobile/putong/core/data/FeedType;

    .line 223
    .line 224
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 225
    .line 226
    return v1

    .line 227
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/core/data/PickInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 228
    .line 229
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    check-cast p0, Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 234
    .line 235
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 236
    .line 237
    return v1

    .line 238
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 239
    .line 240
    .line 241
    move-result-object p0

    .line 242
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

    .line 243
    .line 244
    return v0

    .line 245
    :pswitch_6
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 246
    .line 247
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 248
    .line 249
    .line 250
    move-result-object p0

    .line 251
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 252
    .line 253
    return v1

    .line 254
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p0

    .line 258
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 259
    .line 260
    return v1

    .line 261
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 266
    .line 267
    return v1

    .line 268
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 269
    .line 270
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object p0

    .line 274
    check-cast p0, Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 275
    .line 276
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 277
    .line 278
    return v1

    .line 279
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 280
    .line 281
    .line 282
    move-result p0

    .line 283
    iput p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 284
    .line 285
    return v1

    .line 286
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 291
    .line 292
    return v1

    .line 293
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 294
    .line 295
    .line 296
    move-result p0

    .line 297
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 298
    .line 299
    return v1

    .line 300
    :pswitch_d
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    iput-boolean p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 305
    .line 306
    return v1

    .line 307
    :sswitch_data_0
    .sparse-switch
        -0x3c5549ad -> :sswitch_d
        -0x3b5453b8 -> :sswitch_c
        -0x3570f0a7 -> :sswitch_b
        -0x29b60207 -> :sswitch_a
        -0x210c0604 -> :sswitch_9
        -0x1dd7f2d8 -> :sswitch_8
        -0x1588f4c5 -> :sswitch_7
        -0x8c56513 -> :sswitch_6
        0xd1b -> :sswitch_5
        0x348021 -> :sswitch_4
        0x368f3a -> :sswitch_3
        0x19b8309e -> :sswitch_2
        0x393a607c -> :sswitch_1
        0x6b09bf1e -> :sswitch_0
    .end sparse-switch

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

    .line 307
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;->parseField(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;",
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
    const-string v0, "momentMediaType"

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
    const/16 v3, 0xd

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "seeCount"

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
    const/16 v3, 0xc

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "overheating"

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
    const/16 v3, 0xb

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "type"

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
    const/16 v3, 0xa

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "pick"

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
    const/16 v3, 0x9

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "id"

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
    const/16 v3, 0x8

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "userIds"

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
    goto :goto_0

    .line 109
    :cond_6
    const/4 v3, 0x7

    .line 110
    goto :goto_0

    .line 111
    :sswitch_7
    const-string v0, "momentId"

    .line 112
    .line 113
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    if-nez v0, :cond_7

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_7
    const/4 v3, 0x6

    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    const-string v0, "readStatus"

    .line 123
    .line 124
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    if-nez v0, :cond_8

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    const/4 v3, 0x5

    .line 132
    goto :goto_0

    .line 133
    :sswitch_9
    const-string v0, "relation"

    .line 134
    .line 135
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    if-nez v0, :cond_9

    .line 140
    .line 141
    goto :goto_0

    .line 142
    :cond_9
    const/4 v3, 0x4

    .line 143
    goto :goto_0

    .line 144
    :sswitch_a
    const-string v0, "lowPopSeeCount"

    .line 145
    .line 146
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-nez v0, :cond_a

    .line 151
    .line 152
    goto :goto_0

    .line 153
    :cond_a
    const/4 v3, 0x3

    .line 154
    goto :goto_0

    .line 155
    :sswitch_b
    const-string v0, "sortId"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_b

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_b
    const/4 v3, 0x2

    .line 165
    goto :goto_0

    .line 166
    :sswitch_c
    const-string v0, "passBy"

    .line 167
    .line 168
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_c

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_c
    move v3, v2

    .line 176
    goto :goto_0

    .line 177
    :sswitch_d
    const-string v0, "online"

    .line 178
    .line 179
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_d

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_d
    move v3, v1

    .line 187
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 188
    .line 189
    .line 190
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 191
    .line 192
    .line 193
    move-result p0

    .line 194
    return p0

    .line 195
    :pswitch_0
    return v2

    .line 196
    :pswitch_1
    return v1

    .line 197
    :pswitch_2
    return v2

    .line 198
    nop

    .line 199
    :sswitch_data_0
    .sparse-switch
        -0x3c5549ad -> :sswitch_d
        -0x3b5453b8 -> :sswitch_c
        -0x3570f0a7 -> :sswitch_b
        -0x29b60207 -> :sswitch_a
        -0x210c0604 -> :sswitch_9
        -0x1dd7f2d8 -> :sswitch_8
        -0x1588f4c5 -> :sswitch_7
        -0x8c56513 -> :sswitch_6
        0xd1b -> :sswitch_5
        0x348021 -> :sswitch_4
        0x368f3a -> :sswitch_3
        0x19b8309e -> :sswitch_2
        0x393a607c -> :sswitch_1
        0x6b09bf1e -> :sswitch_0
    .end sparse-switch

    .line 200
    .line 201
    .line 202
    .line 203
    .line 204
    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    .line 210
    .line 211
    .line 212
    .line 213
    .line 214
    .line 215
    .line 216
    .line 217
    .line 218
    .line 219
    .line 220
    .line 221
    .line 222
    .line 223
    .line 224
    .line 225
    .line 226
    .line 227
    .line 228
    .line 229
    .line 230
    .line 231
    .line 232
    .line 233
    .line 234
    .line 235
    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    .line 241
    .line 242
    .line 243
    .line 244
    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
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
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string p0, "userIds"

    .line 15
    .line 16
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->userIds:Ljava/util/List;

    .line 20
    .line 21
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 22
    .line 23
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->sortId:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "sortId"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentId:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const-string v0, "momentId"

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 45
    .line 46
    const/4 v0, 0x1

    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string p0, "type"

    .line 50
    .line 51
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p0, Lcom/p1/mobile/putong/core/data/FeedType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->type:Lcom/p1/mobile/putong/core/data/FeedType;

    .line 57
    .line 58
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const-string p0, "relation"

    .line 66
    .line 67
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p0, Lcom/p1/mobile/putong/core/data/MeetRelation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 71
    .line 72
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->relation:Lcom/p1/mobile/putong/core/data/MeetRelation;

    .line 73
    .line 74
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const-string p0, "overheating"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/core/data/OverHeatingStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    .line 88
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->overheating:Lcom/p1/mobile/putong/core/data/OverHeatingStatus;

    .line 89
    .line 90
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 91
    .line 92
    .line 93
    :cond_6
    const-string p0, "seeCount"

    .line 94
    .line 95
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->seeCount:I

    .line 96
    .line 97
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    const-string p0, "lowPopSeeCount"

    .line 101
    .line 102
    iget v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->lowPopSeeCount:I

    .line 103
    .line 104
    invoke-virtual {p2, p0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 105
    .line 106
    .line 107
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string p0, "pick"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    sget-object p0, Lcom/p1/mobile/putong/core/data/PickInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 117
    .line 118
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->pick:Lcom/p1/mobile/putong/core/data/PickInfo;

    .line 119
    .line 120
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 121
    .line 122
    .line 123
    :cond_7
    const-string p0, "readStatus"

    .line 124
    .line 125
    iget v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->readStatus:I

    .line 126
    .line 127
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 128
    .line 129
    .line 130
    const-string p0, "online"

    .line 131
    .line 132
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->online:Z

    .line 133
    .line 134
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 135
    .line 136
    .line 137
    const-string p0, "passBy"

    .line 138
    .line 139
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->passBy:Z

    .line 140
    .line 141
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;->momentMediaType:Ljava/lang/String;

    .line 145
    .line 146
    if-eqz p0, :cond_8

    .line 147
    .line 148
    const-string p1, "momentMediaType"

    .line 149
    .line 150
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_8
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 154
    check-cast p1, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MyMeetFeedItem$2;->serializeFields(Lcom/p1/mobile/putong/core/data/MyMeetFeedItem;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
