.class Lcom/p1/mobile/putong/feed/data/TopicOperations$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/TopicOperations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/TopicOperations;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/TopicOperations;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/TopicOperations$2;->newInstance()Lcom/p1/mobile/putong/feed/data/TopicOperations;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/TopicOperations;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
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
    const-string p0, "recommendTopics"

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
    const/16 v2, 0x10

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "postGuide"

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
    const/16 v2, 0xf

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "myTabPostGuide"

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
    const/16 v2, 0xe

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "position"

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
    const/16 v2, 0xd

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "poiGuide"

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
    const/16 v2, 0xc

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "categoryTopic"

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
    const/16 v2, 0xb

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "group"

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
    const/16 v2, 0xa

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "operationType"

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
    const/16 v2, 0x9

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "name"

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
    const/16 v2, 0x8

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "id"

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
    goto :goto_0

    .line 151
    :cond_9
    const/4 v2, 0x7

    .line 152
    goto :goto_0

    .line 153
    :sswitch_a
    const-string p0, "nearbyOnline"

    .line 154
    .line 155
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    if-nez p0, :cond_a

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_a
    const/4 v2, 0x6

    .line 163
    goto :goto_0

    .line 164
    :sswitch_b
    const-string p0, "stateSquareEntrance"

    .line 165
    .line 166
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result p0

    .line 170
    if-nez p0, :cond_b

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_b
    const/4 v2, 0x5

    .line 174
    goto :goto_0

    .line 175
    :sswitch_c
    const-string p0, "recommendUsers"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    if-nez p0, :cond_c

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_c
    const/4 v2, 0x4

    .line 185
    goto :goto_0

    .line 186
    :sswitch_d
    const-string p0, "singleTopic"

    .line 187
    .line 188
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    if-nez p0, :cond_d

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_d
    const/4 v2, 0x3

    .line 196
    goto :goto_0

    .line 197
    :sswitch_e
    const-string p0, "singleGroup"

    .line 198
    .line 199
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result p0

    .line 203
    if-nez p0, :cond_e

    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_e
    const/4 v2, 0x2

    .line 207
    goto :goto_0

    .line 208
    :sswitch_f
    const-string p0, "publishGuide"

    .line 209
    .line 210
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result p0

    .line 214
    if-nez p0, :cond_f

    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_f
    move v2, v1

    .line 218
    goto :goto_0

    .line 219
    :sswitch_10
    const-string p0, "momentViewer"

    .line 220
    .line 221
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    if-nez p0, :cond_10

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_10
    move v2, v0

    .line 229
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 230
    .line 231
    .line 232
    return v0

    .line 233
    :pswitch_0
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 234
    .line 235
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PostGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 243
    .line 244
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 249
    .line 250
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 251
    .line 252
    return v1

    .line 253
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 254
    .line 255
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    move-result-object p0

    .line 259
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 260
    .line 261
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 262
    .line 263
    return v1

    .line 264
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 265
    .line 266
    .line 267
    move-result p0

    .line 268
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 269
    .line 270
    return v1

    .line 271
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 272
    .line 273
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 278
    .line 279
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 280
    .line 281
    return v1

    .line 282
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 283
    .line 284
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 285
    .line 286
    .line 287
    move-result-object p0

    .line 288
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 289
    .line 290
    return v1

    .line 291
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 292
    .line 293
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 298
    .line 299
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 300
    .line 301
    return v1

    .line 302
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 303
    .line 304
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    check-cast p0, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 309
    .line 310
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 311
    .line 312
    return v1

    .line 313
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object p0

    .line 317
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 318
    .line 319
    return v1

    .line 320
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 321
    .line 322
    .line 323
    move-result-object p0

    .line 324
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 325
    .line 326
    return v0

    .line 327
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 328
    .line 329
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 330
    .line 331
    .line 332
    move-result-object p0

    .line 333
    check-cast p0, Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 334
    .line 335
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 339
    .line 340
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    check-cast p0, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 345
    .line 346
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 347
    .line 348
    return v1

    .line 349
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 356
    .line 357
    return v1

    .line 358
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/feed/data/SingleTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 359
    .line 360
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    check-cast p0, Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 365
    .line 366
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 367
    .line 368
    return v1

    .line 369
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 370
    .line 371
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    check-cast p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 376
    .line 377
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 378
    .line 379
    return v1

    .line 380
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 381
    .line 382
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object p0

    .line 386
    check-cast p0, Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 387
    .line 388
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 389
    .line 390
    return v1

    .line 391
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 392
    .line 393
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 394
    .line 395
    .line 396
    move-result-object p0

    .line 397
    check-cast p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 398
    .line 399
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 400
    .line 401
    return v1

    .line 402
    nop

    .line 403
    :sswitch_data_0
    .sparse-switch
        -0x7421dfce -> :sswitch_10
        -0x706680d3 -> :sswitch_f
        -0x688b10e9 -> :sswitch_e
        -0x67d53a39 -> :sswitch_d
        -0x3df95d54 -> :sswitch_c
        -0x1005661c -> :sswitch_b
        -0xb0e4e4e -> :sswitch_a
        0xd1b -> :sswitch_9
        0x337a8b -> :sswitch_8
        0x57bcd41 -> :sswitch_7
        0x5e0f67f -> :sswitch_6
        0x13958ed1 -> :sswitch_5
        0x19a376d2 -> :sswitch_4
        0x2c929929 -> :sswitch_3
        0x49ef6df3 -> :sswitch_2
        0x7611163c -> :sswitch_1
        0x7ce55900 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 403
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/TopicOperations$2;->parseField(Lcom/p1/mobile/putong/feed/data/TopicOperations;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/TopicOperations;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
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
    const-string v0, "recommendTopics"

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
    const/16 v3, 0x10

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "postGuide"

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
    const/16 v3, 0xf

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "myTabPostGuide"

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
    const/16 v3, 0xe

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "position"

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
    const/16 v3, 0xd

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "poiGuide"

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
    const/16 v3, 0xc

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "categoryTopic"

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
    const/16 v3, 0xb

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "group"

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
    const/16 v3, 0xa

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string v0, "operationType"

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
    const/16 v3, 0x9

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string v0, "name"

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
    const/16 v3, 0x8

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string v0, "id"

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
    goto :goto_0

    .line 151
    :cond_9
    const/4 v3, 0x7

    .line 152
    goto :goto_0

    .line 153
    :sswitch_a
    const-string v0, "nearbyOnline"

    .line 154
    .line 155
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    if-nez v0, :cond_a

    .line 160
    .line 161
    goto :goto_0

    .line 162
    :cond_a
    const/4 v3, 0x6

    .line 163
    goto :goto_0

    .line 164
    :sswitch_b
    const-string v0, "stateSquareEntrance"

    .line 165
    .line 166
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-nez v0, :cond_b

    .line 171
    .line 172
    goto :goto_0

    .line 173
    :cond_b
    const/4 v3, 0x5

    .line 174
    goto :goto_0

    .line 175
    :sswitch_c
    const-string v0, "recommendUsers"

    .line 176
    .line 177
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    if-nez v0, :cond_c

    .line 182
    .line 183
    goto :goto_0

    .line 184
    :cond_c
    const/4 v3, 0x4

    .line 185
    goto :goto_0

    .line 186
    :sswitch_d
    const-string v0, "singleTopic"

    .line 187
    .line 188
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    if-nez v0, :cond_d

    .line 193
    .line 194
    goto :goto_0

    .line 195
    :cond_d
    const/4 v3, 0x3

    .line 196
    goto :goto_0

    .line 197
    :sswitch_e
    const-string v0, "singleGroup"

    .line 198
    .line 199
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 200
    .line 201
    .line 202
    move-result v0

    .line 203
    if-nez v0, :cond_e

    .line 204
    .line 205
    goto :goto_0

    .line 206
    :cond_e
    const/4 v3, 0x2

    .line 207
    goto :goto_0

    .line 208
    :sswitch_f
    const-string v0, "publishGuide"

    .line 209
    .line 210
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-nez v0, :cond_f

    .line 215
    .line 216
    goto :goto_0

    .line 217
    :cond_f
    move v3, v2

    .line 218
    goto :goto_0

    .line 219
    :sswitch_10
    const-string v0, "momentViewer"

    .line 220
    .line 221
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    if-nez v0, :cond_10

    .line 226
    .line 227
    goto :goto_0

    .line 228
    :cond_10
    move v3, v1

    .line 229
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 230
    .line 231
    .line 232
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 233
    .line 234
    .line 235
    move-result p0

    .line 236
    return p0

    .line 237
    :pswitch_0
    return v2

    .line 238
    :pswitch_1
    return v1

    .line 239
    :pswitch_2
    return v2

    .line 240
    nop

    .line 241
    :sswitch_data_0
    .sparse-switch
        -0x7421dfce -> :sswitch_10
        -0x706680d3 -> :sswitch_f
        -0x688b10e9 -> :sswitch_e
        -0x67d53a39 -> :sswitch_d
        -0x3df95d54 -> :sswitch_c
        -0x1005661c -> :sswitch_b
        -0xb0e4e4e -> :sswitch_a
        0xd1b -> :sswitch_9
        0x337a8b -> :sswitch_8
        0x57bcd41 -> :sswitch_7
        0x5e0f67f -> :sswitch_6
        0x13958ed1 -> :sswitch_5
        0x19a376d2 -> :sswitch_4
        0x2c929929 -> :sswitch_3
        0x49ef6df3 -> :sswitch_2
        0x7611163c -> :sswitch_1
        0x7ce55900 -> :sswitch_0
    .end sparse-switch

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
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
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
    :pswitch_data_0
    .packed-switch 0x0
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/TopicOperations$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/TopicOperations;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "name"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    const-string p0, "position"

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    const-string p0, "operationType"

    .line 32
    .line 33
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 39
    .line 40
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const-string p0, "categoryTopic"

    .line 48
    .line 49
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 55
    .line 56
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const-string p0, "singleTopic"

    .line 64
    .line 65
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Lcom/p1/mobile/putong/feed/data/SingleTopic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 69
    .line 70
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 71
    .line 72
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const-string p0, "postGuide"

    .line 80
    .line 81
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PostGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 85
    .line 86
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 87
    .line 88
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 89
    .line 90
    .line 91
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 92
    .line 93
    if-eqz p0, :cond_6

    .line 94
    .line 95
    const-string p0, "recommendUsers"

    .line 96
    .line 97
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    .line 104
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 105
    .line 106
    .line 107
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 108
    .line 109
    if-eqz p0, :cond_7

    .line 110
    .line 111
    const-string p0, "recommendTopics"

    .line 112
    .line 113
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 117
    .line 118
    sget-object v1, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 119
    .line 120
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 121
    .line 122
    .line 123
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 124
    .line 125
    if-eqz p0, :cond_8

    .line 126
    .line 127
    const-string p0, "nearbyOnline"

    .line 128
    .line 129
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    sget-object p0, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 133
    .line 134
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 135
    .line 136
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 137
    .line 138
    .line 139
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 140
    .line 141
    if-eqz p0, :cond_9

    .line 142
    .line 143
    const-string p0, "group"

    .line 144
    .line 145
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 149
    .line 150
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 151
    .line 152
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 153
    .line 154
    .line 155
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 156
    .line 157
    if-eqz p0, :cond_a

    .line 158
    .line 159
    const-string p0, "stateSquareEntrance"

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    sget-object p0, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 165
    .line 166
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 167
    .line 168
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 169
    .line 170
    .line 171
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 172
    .line 173
    if-eqz p0, :cond_b

    .line 174
    .line 175
    const-string p0, "singleGroup"

    .line 176
    .line 177
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 178
    .line 179
    .line 180
    sget-object p0, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 181
    .line 182
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 183
    .line 184
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 185
    .line 186
    .line 187
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 188
    .line 189
    if-eqz p0, :cond_c

    .line 190
    .line 191
    const-string p0, "momentViewer"

    .line 192
    .line 193
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 194
    .line 195
    .line 196
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 197
    .line 198
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 199
    .line 200
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 201
    .line 202
    .line 203
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 204
    .line 205
    if-eqz p0, :cond_d

    .line 206
    .line 207
    const-string p0, "poiGuide"

    .line 208
    .line 209
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 210
    .line 211
    .line 212
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PoiGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 213
    .line 214
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 215
    .line 216
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 217
    .line 218
    .line 219
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 220
    .line 221
    if-eqz p0, :cond_e

    .line 222
    .line 223
    const-string p0, "myTabPostGuide"

    .line 224
    .line 225
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    sget-object p0, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 229
    .line 230
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 231
    .line 232
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 233
    .line 234
    .line 235
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 236
    .line 237
    if-eqz p0, :cond_f

    .line 238
    .line 239
    const-string p0, "publishGuide"

    .line 240
    .line 241
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 242
    .line 243
    .line 244
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 245
    .line 246
    iget-object p1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 247
    .line 248
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 249
    .line 250
    .line 251
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

    .line 252
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/TopicOperations$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
