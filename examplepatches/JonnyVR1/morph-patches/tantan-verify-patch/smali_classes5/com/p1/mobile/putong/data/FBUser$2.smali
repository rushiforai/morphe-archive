.class Lcom/p1/mobile/putong/data/FBUser$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/FBUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/FBUser;",
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
    const-class p0, Lcom/p1/mobile/putong/data/FBUser;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/FBUser;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/FBUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/FBUser;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/FBUser$2;->newInstance()Lcom/p1/mobile/putong/data/FBUser;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/FBUser;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/FBUser;",
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
    const/16 v2, 0xc

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "birthday"

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
    const/16 v2, 0xb

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "music"

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
    const/16 v2, 0xa

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "books"

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
    const/16 v2, 0x9

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "about"

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
    const/16 v2, 0x8

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "work"

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
    goto :goto_0

    .line 95
    :cond_5
    const/4 v2, 0x7

    .line 96
    goto :goto_0

    .line 97
    :sswitch_6
    const-string p0, "name"

    .line 98
    .line 99
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-nez p0, :cond_6

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    const/4 v2, 0x6

    .line 107
    goto :goto_0

    .line 108
    :sswitch_7
    const-string p0, "education"

    .line 109
    .line 110
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    if-nez p0, :cond_7

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    const/4 v2, 0x5

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string p0, "hometown"

    .line 120
    .line 121
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result p0

    .line 125
    if-nez p0, :cond_8

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    const/4 v2, 0x4

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string p0, "picture"

    .line 131
    .line 132
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result p0

    .line 136
    if-nez p0, :cond_9

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    const/4 v2, 0x3

    .line 140
    goto :goto_0

    .line 141
    :sswitch_a
    const-string p0, "movies"

    .line 142
    .line 143
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    if-nez p0, :cond_a

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_a
    const/4 v2, 0x2

    .line 151
    goto :goto_0

    .line 152
    :sswitch_b
    const-string p0, "gender"

    .line 153
    .line 154
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result p0

    .line 158
    if-nez p0, :cond_b

    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_b
    move v2, v1

    .line 162
    goto :goto_0

    .line 163
    :sswitch_c
    const-string p0, "television"

    .line 164
    .line 165
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result p0

    .line 169
    if-nez p0, :cond_c

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_c
    move v2, v0

    .line 173
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 174
    .line 175
    .line 176
    return v0

    .line 177
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/FBPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 178
    .line 179
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object p0

    .line 183
    check-cast p0, Lcom/p1/mobile/putong/data/FBPage;

    .line 184
    .line 185
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 186
    .line 187
    return v1

    .line 188
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p0

    .line 192
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 193
    .line 194
    return v1

    .line 195
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 196
    .line 197
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    check-cast p0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 202
    .line 203
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 204
    .line 205
    return v1

    .line 206
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 207
    .line 208
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    check-cast p0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 213
    .line 214
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 215
    .line 216
    return v1

    .line 217
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 222
    .line 223
    return v1

    .line 224
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/FBWork;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 225
    .line 226
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 227
    .line 228
    .line 229
    move-result-object p0

    .line 230
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 231
    .line 232
    return v1

    .line 233
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 238
    .line 239
    return v1

    .line 240
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/FBEducation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 241
    .line 242
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 247
    .line 248
    return v1

    .line 249
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/FBPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 250
    .line 251
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    check-cast p0, Lcom/p1/mobile/putong/data/FBPage;

    .line 256
    .line 257
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 258
    .line 259
    return v1

    .line 260
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/FBProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    .line 262
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    check-cast p0, Lcom/p1/mobile/putong/data/FBProfile;

    .line 267
    .line 268
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 269
    .line 270
    return v1

    .line 271
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 272
    .line 273
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object p0

    .line 277
    check-cast p0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 278
    .line 279
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 280
    .line 281
    return v1

    .line 282
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 287
    .line 288
    return v1

    .line 289
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 290
    .line 291
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 292
    .line 293
    .line 294
    move-result-object p0

    .line 295
    check-cast p0, Lcom/p1/mobile/putong/data/FBLikes;

    .line 296
    .line 297
    iput-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 298
    .line 299
    return v1

    .line 300
    nop

    .line 301
    :sswitch_data_0
    .sparse-switch
        -0x4e8b47ee -> :sswitch_c
        -0x4a7a0d3f -> :sswitch_b
        -0x3fac58bd -> :sswitch_a
        -0x226fa302 -> :sswitch_9
        -0x1cec280f -> :sswitch_8
        -0x11549858 -> :sswitch_7
        0x337a8b -> :sswitch_6
        0x37c711 -> :sswitch_5
        0x585238d -> :sswitch_4
        0x59922aa -> :sswitch_3
        0x636ee25 -> :sswitch_2
        0x3fbd627d -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 301
    check-cast p1, Lcom/p1/mobile/putong/data/FBUser;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/FBUser$2;->parseField(Lcom/p1/mobile/putong/data/FBUser;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/FBUser;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/FBUser;",
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
    const/4 v1, 0x1

    .line 9
    const/4 v2, -0x1

    .line 10
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    goto/16 :goto_0

    .line 14
    .line 15
    :sswitch_0
    const-string v0, "location"

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    goto/16 :goto_0

    .line 24
    .line 25
    :cond_0
    const/16 v2, 0xc

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "birthday"

    .line 30
    .line 31
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    goto/16 :goto_0

    .line 38
    .line 39
    :cond_1
    const/16 v2, 0xb

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "music"

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    if-nez v0, :cond_2

    .line 50
    .line 51
    goto/16 :goto_0

    .line 52
    .line 53
    :cond_2
    const/16 v2, 0xa

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "books"

    .line 58
    .line 59
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_3

    .line 64
    .line 65
    goto/16 :goto_0

    .line 66
    .line 67
    :cond_3
    const/16 v2, 0x9

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "about"

    .line 72
    .line 73
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-nez v0, :cond_4

    .line 78
    .line 79
    goto/16 :goto_0

    .line 80
    .line 81
    :cond_4
    const/16 v2, 0x8

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "work"

    .line 86
    .line 87
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-nez v0, :cond_5

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_5
    const/4 v2, 0x7

    .line 95
    goto :goto_0

    .line 96
    :sswitch_6
    const-string v0, "name"

    .line 97
    .line 98
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    if-nez v0, :cond_6

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_6
    const/4 v2, 0x6

    .line 106
    goto :goto_0

    .line 107
    :sswitch_7
    const-string v0, "education"

    .line 108
    .line 109
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    if-nez v0, :cond_7

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_7
    const/4 v2, 0x5

    .line 117
    goto :goto_0

    .line 118
    :sswitch_8
    const-string v0, "hometown"

    .line 119
    .line 120
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-nez v0, :cond_8

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_8
    const/4 v2, 0x4

    .line 128
    goto :goto_0

    .line 129
    :sswitch_9
    const-string v0, "picture"

    .line 130
    .line 131
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-nez v0, :cond_9

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_9
    const/4 v2, 0x3

    .line 139
    goto :goto_0

    .line 140
    :sswitch_a
    const-string v0, "movies"

    .line 141
    .line 142
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    if-nez v0, :cond_a

    .line 147
    .line 148
    goto :goto_0

    .line 149
    :cond_a
    const/4 v2, 0x2

    .line 150
    goto :goto_0

    .line 151
    :sswitch_b
    const-string v0, "gender"

    .line 152
    .line 153
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    if-nez v0, :cond_b

    .line 158
    .line 159
    goto :goto_0

    .line 160
    :cond_b
    move v2, v1

    .line 161
    goto :goto_0

    .line 162
    :sswitch_c
    const-string v0, "television"

    .line 163
    .line 164
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_c

    .line 169
    .line 170
    goto :goto_0

    .line 171
    :cond_c
    const/4 v2, 0x0

    .line 172
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 173
    .line 174
    .line 175
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    return p0

    .line 180
    :pswitch_0
    return v1

    .line 181
    :sswitch_data_0
    .sparse-switch
        -0x4e8b47ee -> :sswitch_c
        -0x4a7a0d3f -> :sswitch_b
        -0x3fac58bd -> :sswitch_a
        -0x226fa302 -> :sswitch_9
        -0x1cec280f -> :sswitch_8
        -0x11549858 -> :sswitch_7
        0x337a8b -> :sswitch_6
        0x37c711 -> :sswitch_5
        0x585238d -> :sswitch_4
        0x59922aa -> :sswitch_3
        0x636ee25 -> :sswitch_2
        0x3fbd627d -> :sswitch_1
        0x714f9fb5 -> :sswitch_0
    .end sparse-switch

    .line 182
    .line 183
    .line 184
    .line 185
    .line 186
    :pswitch_data_0
    .packed-switch 0x0
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
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 181
    check-cast p1, Lcom/p1/mobile/putong/data/FBUser;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/FBUser$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/FBUser;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/FBUser;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->name:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string v0, "name"

    .line 6
    .line 7
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->gender:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "gender"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->birthday:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "birthday"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 29
    .line 30
    const/4 v0, 0x1

    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const-string p0, "picture"

    .line 34
    .line 35
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object p0, Lcom/p1/mobile/putong/data/FBProfile;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 39
    .line 40
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->fbPicture:Lcom/p1/mobile/putong/data/FBProfile;

    .line 41
    .line 42
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->about:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const-string v1, "about"

    .line 50
    .line 51
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 55
    .line 56
    if-eqz p0, :cond_5

    .line 57
    .line 58
    const-string p0, "hometown"

    .line 59
    .line 60
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    sget-object p0, Lcom/p1/mobile/putong/data/FBPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 64
    .line 65
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->hometown:Lcom/p1/mobile/putong/data/FBPage;

    .line 66
    .line 67
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const-string p0, "location"

    .line 75
    .line 76
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    sget-object p0, Lcom/p1/mobile/putong/data/FBPage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 80
    .line 81
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->location:Lcom/p1/mobile/putong/data/FBPage;

    .line 82
    .line 83
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 84
    .line 85
    .line 86
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 87
    .line 88
    if-eqz p0, :cond_7

    .line 89
    .line 90
    const-string p0, "work"

    .line 91
    .line 92
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->work:Ljava/util/List;

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/data/FBWork;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 98
    .line 99
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 103
    .line 104
    if-eqz p0, :cond_8

    .line 105
    .line 106
    const-string p0, "education"

    .line 107
    .line 108
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->education:Ljava/util/List;

    .line 112
    .line 113
    sget-object v1, Lcom/p1/mobile/putong/data/FBEducation;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 114
    .line 115
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 116
    .line 117
    .line 118
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 119
    .line 120
    if-eqz p0, :cond_9

    .line 121
    .line 122
    const-string p0, "music"

    .line 123
    .line 124
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 128
    .line 129
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->music:Lcom/p1/mobile/putong/data/FBLikes;

    .line 130
    .line 131
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 135
    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    const-string p0, "movies"

    .line 139
    .line 140
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 144
    .line 145
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->movies:Lcom/p1/mobile/putong/data/FBLikes;

    .line 146
    .line 147
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 148
    .line 149
    .line 150
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 151
    .line 152
    if-eqz p0, :cond_b

    .line 153
    .line 154
    const-string p0, "books"

    .line 155
    .line 156
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 160
    .line 161
    iget-object v1, p1, Lcom/p1/mobile/putong/data/FBUser;->books:Lcom/p1/mobile/putong/data/FBLikes;

    .line 162
    .line 163
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 164
    .line 165
    .line 166
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 167
    .line 168
    if-eqz p0, :cond_c

    .line 169
    .line 170
    const-string p0, "television"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sget-object p0, Lcom/p1/mobile/putong/data/FBLikes;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 176
    .line 177
    iget-object p1, p1, Lcom/p1/mobile/putong/data/FBUser;->television:Lcom/p1/mobile/putong/data/FBLikes;

    .line 178
    .line 179
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 180
    .line 181
    .line 182
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

    .line 183
    check-cast p1, Lcom/p1/mobile/putong/data/FBUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/FBUser$2;->serializeFields(Lcom/p1/mobile/putong/data/FBUser;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
