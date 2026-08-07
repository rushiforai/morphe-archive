.class Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroupMember;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
    const-class p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;->newInstance()Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
    const-string p0, "silence"

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
    const-string p0, "nickNamePinyin"

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
    const-string p0, "inModeration"

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
    const-string p0, "groupId"

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
    const-string p0, "nickName"

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
    const/16 v2, 0xb

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "userName"

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
    const-string p0, "createdTime"

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
    const-string p0, "updatedTime"

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
    const-string p0, "operationSilence"

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
    const-string p0, "userId"

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
    const-string p0, "status"

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
    const-string p0, "searchIndices"

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
    const-string p0, "gender"

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
    const-string p0, "joinTime"

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
    const-string p0, "avatar"

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
    const-string p0, "searchCategory"

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
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 234
    .line 235
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 240
    .line 241
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 242
    .line 243
    return v1

    .line 244
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 245
    .line 246
    .line 247
    move-result-object p0

    .line 248
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 249
    .line 250
    return v1

    .line 251
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/core/data/InModeration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 254
    .line 255
    .line 256
    move-result-object p0

    .line 257
    check-cast p0, Lcom/p1/mobile/putong/core/data/InModeration;

    .line 258
    .line 259
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 260
    .line 261
    return v1

    .line 262
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 267
    .line 268
    return v1

    .line 269
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 274
    .line 275
    return v1

    .line 276
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    iput-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 281
    .line 282
    return v0

    .line 283
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 288
    .line 289
    return v1

    .line 290
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 291
    .line 292
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object p0

    .line 296
    check-cast p0, Ljava/lang/Double;

    .line 297
    .line 298
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 299
    .line 300
    .line 301
    move-result-wide p2

    .line 302
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 303
    .line 304
    return v1

    .line 305
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 306
    .line 307
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    check-cast p0, Ljava/lang/Double;

    .line 312
    .line 313
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 314
    .line 315
    .line 316
    move-result-wide p2

    .line 317
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 318
    .line 319
    return v1

    .line 320
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 321
    .line 322
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 327
    .line 328
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 329
    .line 330
    return v1

    .line 331
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object p0

    .line 335
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 336
    .line 337
    return v1

    .line 338
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 339
    .line 340
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    check-cast p0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 345
    .line 346
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 347
    .line 348
    return v1

    .line 349
    :pswitch_c
    sget-object p0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 350
    .line 351
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 352
    .line 353
    .line 354
    move-result-object p0

    .line 355
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 356
    .line 357
    return v1

    .line 358
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 359
    .line 360
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object p0

    .line 364
    check-cast p0, Lcom/p1/mobile/putong/data/Gender;

    .line 365
    .line 366
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 367
    .line 368
    return v1

    .line 369
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 370
    .line 371
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    check-cast p0, Ljava/lang/Double;

    .line 376
    .line 377
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 378
    .line 379
    .line 380
    move-result-wide p2

    .line 381
    iput-wide p2, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 382
    .line 383
    return v1

    .line 384
    :pswitch_f
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object p0

    .line 388
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 389
    .line 390
    return v1

    .line 391
    :pswitch_10
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 396
    .line 397
    return v1

    .line 398
    nop

    .line 399
    :sswitch_data_0
    .sparse-switch
        -0x7c74a13a -> :sswitch_10
        -0x53cd3ea7 -> :sswitch_f
        -0x538d00e9 -> :sswitch_e
        -0x4a7a0d3f -> :sswitch_d
        -0x3db22f21 -> :sswitch_c
        -0x3532300e -> :sswitch_b
        -0x31d4d1ba -> :sswitch_a
        -0x2e77dac6 -> :sswitch_9
        -0x21f62dd8 -> :sswitch_8
        -0x1d336e2b -> :sswitch_7
        -0xfe5030a -> :sswitch_6
        0xd1b -> :sswitch_5
        0x4281c8e -> :sswitch_4
        0x117d5bfa -> :sswitch_3
        0x20c5642b -> :sswitch_2
        0x5ad723d7 -> :sswitch_1
        0x7cbaf4a1 -> :sswitch_0
    .end sparse-switch

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

    .line 399
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;->parseField(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
    const-string v0, "silence"

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
    const-string v0, "nickNamePinyin"

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
    const-string v0, "inModeration"

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
    const-string v0, "groupId"

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
    const-string v0, "nickName"

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
    const/16 v3, 0xb

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string v0, "userName"

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
    const-string v0, "createdTime"

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
    const-string v0, "updatedTime"

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
    const-string v0, "operationSilence"

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
    const-string v0, "userId"

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
    const-string v0, "status"

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
    const-string v0, "searchIndices"

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
    const-string v0, "gender"

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
    const-string v0, "joinTime"

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
    const-string v0, "avatar"

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
    const-string v0, "searchCategory"

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
        -0x7c74a13a -> :sswitch_10
        -0x53cd3ea7 -> :sswitch_f
        -0x538d00e9 -> :sswitch_e
        -0x4a7a0d3f -> :sswitch_d
        -0x3db22f21 -> :sswitch_c
        -0x3532300e -> :sswitch_b
        -0x31d4d1ba -> :sswitch_a
        -0x2e77dac6 -> :sswitch_9
        -0x21f62dd8 -> :sswitch_8
        -0x1d336e2b -> :sswitch_7
        -0xfe5030a -> :sswitch_6
        0xd1b -> :sswitch_5
        0x4281c8e -> :sswitch_4
        0x117d5bfa -> :sswitch_3
        0x20c5642b -> :sswitch_2
        0x5ad723d7 -> :sswitch_1
        0x7cbaf4a1 -> :sswitch_0
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

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;->parseFieldCheck(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    const-string v0, "groupId"

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const-string v0, "userId"

    .line 24
    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const-string v0, "nickName"

    .line 33
    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const-string v0, "userName"

    .line 42
    .line 43
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz p0, :cond_5

    .line 49
    .line 50
    const-string v0, "nickNamePinyin"

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_6

    .line 58
    .line 59
    const-string v0, "avatar"

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 65
    .line 66
    if-eqz p0, :cond_7

    .line 67
    .line 68
    const-string p0, "searchIndices"

    .line 69
    .line 70
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 74
    .line 75
    sget-object v0, Lcom/tantanapp/common/data/JsonAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    invoke-static {p0, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const-string v0, "searchCategory"

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 90
    .line 91
    const/4 v0, 0x1

    .line 92
    if-eqz p0, :cond_9

    .line 93
    .line 94
    const-string p0, "status"

    .line 95
    .line 96
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 100
    .line 101
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 102
    .line 103
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 104
    .line 105
    .line 106
    :cond_9
    const-string p0, "joinTime"

    .line 107
    .line 108
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->API_TIME:Lcom/tantanapp/common/data/JsonAdapter;

    .line 112
    .line 113
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 114
    .line 115
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 116
    .line 117
    .line 118
    move-result-object v1

    .line 119
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 120
    .line 121
    .line 122
    const-string v1, "createdTime"

    .line 123
    .line 124
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 125
    .line 126
    .line 127
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 128
    .line 129
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 134
    .line 135
    .line 136
    const-string v1, "updatedTime"

    .line 137
    .line 138
    invoke-virtual {p2, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 142
    .line 143
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 151
    .line 152
    if-eqz p0, :cond_a

    .line 153
    .line 154
    const-string p0, "silence"

    .line 155
    .line 156
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 157
    .line 158
    .line 159
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 160
    .line 161
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 162
    .line 163
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 164
    .line 165
    .line 166
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 167
    .line 168
    if-eqz p0, :cond_b

    .line 169
    .line 170
    const-string p0, "operationSilence"

    .line 171
    .line 172
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    sget-object p0, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 176
    .line 177
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 178
    .line 179
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 180
    .line 181
    .line 182
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 183
    .line 184
    if-eqz p0, :cond_c

    .line 185
    .line 186
    const-string p0, "gender"

    .line 187
    .line 188
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 189
    .line 190
    .line 191
    sget-object p0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 192
    .line 193
    iget-object v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 194
    .line 195
    invoke-virtual {p0, v1, p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->serialize(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 196
    .line 197
    .line 198
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 199
    .line 200
    if-eqz p0, :cond_d

    .line 201
    .line 202
    const-string p0, "inModeration"

    .line 203
    .line 204
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    sget-object p0, Lcom/p1/mobile/putong/core/data/InModeration;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 208
    .line 209
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 210
    .line 211
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 212
    .line 213
    .line 214
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

    .line 215
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$2;->serializeFields(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
