.class Lcom/p1/mobile/putong/data/GivenGiftBrief$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/GivenGiftBrief;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
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
    const-class p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/GivenGiftBrief;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;->newInstance()Lcom/p1/mobile/putong/data/GivenGiftBrief;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/GivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
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
    const/4 p4, 0x0

    .line 9
    const/4 p5, 0x1

    .line 10
    const/4 p6, -0x1

    .line 11
    sparse-switch p0, :sswitch_data_0

    .line 12
    .line 13
    .line 14
    goto/16 :goto_0

    .line 15
    .line 16
    :sswitch_0
    const-string p0, "isFirstGivenGift"

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
    const/16 p6, 0xc

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "comboId"

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
    const/16 p6, 0xb

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "giftLevel"

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
    const/16 p6, 0xa

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "fpUrl"

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
    const/16 p6, 0x9

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "from"

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
    const/16 p6, 0x8

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "num"

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
    const/4 p6, 0x7

    .line 96
    goto :goto_0

    .line 97
    :sswitch_6
    const-string p0, "id"

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
    const/4 p6, 0x6

    .line 107
    goto :goto_0

    .line 108
    :sswitch_7
    const-string p0, "expiredTime"

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
    const/4 p6, 0x5

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string p0, "pollFromNetwork"

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
    const/4 p6, 0x4

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string p0, "userName"

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
    const/4 p6, 0x3

    .line 140
    goto :goto_0

    .line 141
    :sswitch_a
    const-string p0, "stickFacePositionType"

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
    const/4 p6, 0x2

    .line 151
    goto :goto_0

    .line 152
    :sswitch_b
    const-string p0, "remain"

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
    move p6, p5

    .line 162
    goto :goto_0

    .line 163
    :sswitch_c
    const-string p0, "combos"

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
    move p6, p4

    .line 173
    :goto_0
    packed-switch p6, :pswitch_data_0

    .line 174
    .line 175
    .line 176
    return p4

    .line 177
    :pswitch_0
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 178
    .line 179
    .line 180
    move-result p0

    .line 181
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 182
    .line 183
    return p5

    .line 184
    :pswitch_1
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object p0

    .line 188
    iput-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 189
    .line 190
    return p5

    .line 191
    :pswitch_2
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 196
    .line 197
    return p5

    .line 198
    :pswitch_3
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object p0

    .line 202
    iput-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 203
    .line 204
    return p5

    .line 205
    :pswitch_4
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    iput-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 210
    .line 211
    return p5

    .line 212
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 213
    .line 214
    .line 215
    move-result p0

    .line 216
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 217
    .line 218
    return p5

    .line 219
    :pswitch_6
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 220
    .line 221
    .line 222
    move-result p0

    .line 223
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 224
    .line 225
    return p4

    .line 226
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsLong()J

    .line 227
    .line 228
    .line 229
    move-result-wide p2

    .line 230
    iput-wide p2, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 231
    .line 232
    return p5

    .line 233
    :pswitch_8
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsBoolean()Z

    .line 234
    .line 235
    .line 236
    move-result p0

    .line 237
    iput-boolean p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 238
    .line 239
    return p5

    .line 240
    :pswitch_9
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object p0

    .line 244
    iput-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 245
    .line 246
    return p5

    .line 247
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 252
    .line 253
    return p5

    .line 254
    :pswitch_b
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 255
    .line 256
    .line 257
    move-result p0

    .line 258
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 259
    .line 260
    return p5

    .line 261
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsInt()I

    .line 262
    .line 263
    .line 264
    move-result p0

    .line 265
    iput p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 266
    .line 267
    return p5

    .line 268
    nop

    .line 269
    :sswitch_data_0
    .sparse-switch
        -0x50c0ff5b -> :sswitch_c
        -0x37b53d94 -> :sswitch_b
        -0x13589450 -> :sswitch_a
        -0xfe5030a -> :sswitch_9
        -0xdbb261b -> :sswitch_8
        -0x583ac6e -> :sswitch_7
        0xd1b -> :sswitch_6
        0x1ab86 -> :sswitch_5
        0x3017aa -> :sswitch_4
        0x5d19445 -> :sswitch_3
        0x20f08034 -> :sswitch_2
        0x38a10f49 -> :sswitch_1
        0x48e5a947 -> :sswitch_0
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

    .line 269
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;->parseField(Lcom/p1/mobile/putong/data/GivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/GivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/GivenGiftBrief;",
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
    const-string v0, "isFirstGivenGift"

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
    const/16 v3, 0xc

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string v0, "comboId"

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
    const/16 v3, 0xb

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string v0, "giftLevel"

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
    const/16 v3, 0xa

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string v0, "fpUrl"

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
    const/16 v3, 0x9

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string v0, "from"

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
    const/16 v3, 0x8

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string v0, "num"

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
    goto :goto_0

    .line 95
    :cond_5
    const/4 v3, 0x7

    .line 96
    goto :goto_0

    .line 97
    :sswitch_6
    const-string v0, "id"

    .line 98
    .line 99
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-nez v0, :cond_6

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :cond_6
    const/4 v3, 0x6

    .line 107
    goto :goto_0

    .line 108
    :sswitch_7
    const-string v0, "expiredTime"

    .line 109
    .line 110
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-nez v0, :cond_7

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_7
    const/4 v3, 0x5

    .line 118
    goto :goto_0

    .line 119
    :sswitch_8
    const-string v0, "pollFromNetwork"

    .line 120
    .line 121
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    if-nez v0, :cond_8

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    const/4 v3, 0x4

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    const-string v0, "userName"

    .line 131
    .line 132
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_9

    .line 137
    .line 138
    goto :goto_0

    .line 139
    :cond_9
    const/4 v3, 0x3

    .line 140
    goto :goto_0

    .line 141
    :sswitch_a
    const-string v0, "stickFacePositionType"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_a

    .line 148
    .line 149
    goto :goto_0

    .line 150
    :cond_a
    const/4 v3, 0x2

    .line 151
    goto :goto_0

    .line 152
    :sswitch_b
    const-string v0, "remain"

    .line 153
    .line 154
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-nez v0, :cond_b

    .line 159
    .line 160
    goto :goto_0

    .line 161
    :cond_b
    move v3, v2

    .line 162
    goto :goto_0

    .line 163
    :sswitch_c
    const-string v0, "combos"

    .line 164
    .line 165
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    if-nez v0, :cond_c

    .line 170
    .line 171
    goto :goto_0

    .line 172
    :cond_c
    move v3, v1

    .line 173
    :goto_0
    packed-switch v3, :pswitch_data_0

    .line 174
    .line 175
    .line 176
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 177
    .line 178
    .line 179
    move-result p0

    .line 180
    return p0

    .line 181
    :pswitch_0
    return v2

    .line 182
    :pswitch_1
    return v1

    .line 183
    :pswitch_2
    return v2

    .line 184
    nop

    .line 185
    :sswitch_data_0
    .sparse-switch
        -0x50c0ff5b -> :sswitch_c
        -0x37b53d94 -> :sswitch_b
        -0x13589450 -> :sswitch_a
        -0xfe5030a -> :sswitch_9
        -0xdbb261b -> :sswitch_8
        -0x583ac6e -> :sswitch_7
        0xd1b -> :sswitch_6
        0x1ab86 -> :sswitch_5
        0x3017aa -> :sswitch_4
        0x5d19445 -> :sswitch_3
        0x20f08034 -> :sswitch_2
        0x38a10f49 -> :sswitch_1
        0x48e5a947 -> :sswitch_0
    .end sparse-switch

    .line 186
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/GivenGiftBrief;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/GivenGiftBrief;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-string p0, "id"

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->id:I

    .line 4
    .line 5
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 6
    .line 7
    .line 8
    const-string p0, "num"

    .line 9
    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->num:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 13
    .line 14
    .line 15
    const-string p0, "giftLevel"

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->giftLevel:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->from:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz p0, :cond_0

    .line 25
    .line 26
    const-string v0, "from"

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->fpUrl:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const-string v0, "fpUrl"

    .line 36
    .line 37
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->userName:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    const-string v0, "userName"

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->comboId:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    const-string v0, "comboId"

    .line 54
    .line 55
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    :cond_3
    const-string p0, "combos"

    .line 59
    .line 60
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->combos:I

    .line 61
    .line 62
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 63
    .line 64
    .line 65
    const-string p0, "pollFromNetwork"

    .line 66
    .line 67
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->pollFromNetwork:Z

    .line 68
    .line 69
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 70
    .line 71
    .line 72
    const-string p0, "stickFacePositionType"

    .line 73
    .line 74
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->stickFacePositionType:I

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 77
    .line 78
    .line 79
    const-string p0, "remain"

    .line 80
    .line 81
    iget v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->remain:I

    .line 82
    .line 83
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;I)V

    .line 84
    .line 85
    .line 86
    const-string p0, "expiredTime"

    .line 87
    .line 88
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->expiredTime:J

    .line 89
    .line 90
    invoke-virtual {p2, p0, v0, v1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;J)V

    .line 91
    .line 92
    .line 93
    const-string p0, "isFirstGivenGift"

    .line 94
    .line 95
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;->isFirstGivenGift:Z

    .line 96
    .line 97
    invoke-virtual {p2, p0, p1}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeBooleanField(Ljava/lang/String;Z)V

    .line 98
    .line 99
    .line 100
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/data/GivenGiftBrief;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/GivenGiftBrief$2;->serializeFields(Lcom/p1/mobile/putong/data/GivenGiftBrief;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
