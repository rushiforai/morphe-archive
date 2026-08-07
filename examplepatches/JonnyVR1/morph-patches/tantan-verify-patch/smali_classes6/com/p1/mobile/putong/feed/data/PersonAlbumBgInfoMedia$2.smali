.class Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
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
    const-class p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;->newInstance()Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
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
    const-string p0, "mediaType"

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
    const-string p0, "music"

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
    const-string p0, "audio"

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
    const-string p0, "size"

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
    const-string p0, "name"

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
    const-string p0, "url"

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
    const-string p0, "gif"

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
    const-string p0, "id"

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
    const-string p0, "gaussianBlurParameters"

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
    const-string p0, "attachments"

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
    const-string p0, "status"

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
    const-string p0, "aiPosition"

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
    const-string p0, "duration"

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
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 182
    .line 183
    return v1

    .line 184
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/Music;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 185
    .line 186
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object p0

    .line 190
    check-cast p0, Lcom/p1/mobile/putong/data/Music;

    .line 191
    .line 192
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 193
    .line 194
    return v1

    .line 195
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/AudioMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 196
    .line 197
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 198
    .line 199
    .line 200
    move-result-object p0

    .line 201
    check-cast p0, Lcom/p1/mobile/putong/data/AudioMedia;

    .line 202
    .line 203
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 204
    .line 205
    return v1

    .line 206
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->DIMENSION:Lcom/tantanapp/common/data/JsonAdapter;

    .line 207
    .line 208
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    check-cast p0, Lcom/p1/mobile/putong/data/Dimension;

    .line 213
    .line 214
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

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
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

    .line 222
    .line 223
    return v1

    .line 224
    :pswitch_5
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 229
    .line 230
    return v1

    .line 231
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/GifMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 232
    .line 233
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object p0

    .line 237
    check-cast p0, Lcom/p1/mobile/putong/data/GifMedia;

    .line 238
    .line 239
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 240
    .line 241
    return v1

    .line 242
    :pswitch_7
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object p0

    .line 246
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

    .line 247
    .line 248
    return v0

    .line 249
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 250
    .line 251
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 252
    .line 253
    .line 254
    move-result-object p0

    .line 255
    check-cast p0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 256
    .line 257
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 258
    .line 259
    return v1

    .line 260
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 261
    .line 262
    invoke-static {p3, p0, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parseArray(Lcom/fasterxml/jackson/core/JsonParser;Lcom/tantanapp/common/data/JsonAdapter;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/util/List;

    .line 263
    .line 264
    .line 265
    move-result-object p0

    .line 266
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 267
    .line 268
    return v1

    .line 269
    :pswitch_a
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsString()Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object p0

    .line 273
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 274
    .line 275
    return v1

    .line 276
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->AIPOSITION:Lcom/tantanapp/common/data/JsonAdapter;

    .line 277
    .line 278
    invoke-virtual {p0, p3, p4}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object p0

    .line 282
    check-cast p0, Lcom/p1/mobile/putong/data/AIPosition;

    .line 283
    .line 284
    iput-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 285
    .line 286
    return v1

    .line 287
    :pswitch_c
    invoke-virtual {p3}, Lcom/fasterxml/jackson/core/JsonParser;->getValueAsDouble()D

    .line 288
    .line 289
    .line 290
    move-result-wide p2

    .line 291
    double-to-float p0, p2

    .line 292
    iput p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 293
    .line 294
    return v1

    .line 295
    :sswitch_data_0
    .sparse-switch
        -0x76bbb26c -> :sswitch_c
        -0x6fad9e8f -> :sswitch_b
        -0x3532300e -> :sswitch_a
        -0x2c0c3450 -> :sswitch_9
        -0x23541f74 -> :sswitch_8
        0xd1b -> :sswitch_7
        0x18fc4 -> :sswitch_6
        0x1c56f -> :sswitch_5
        0x337a8b -> :sswitch_4
        0x35e001 -> :sswitch_3
        0x58d9bd6 -> :sswitch_2
        0x636ee25 -> :sswitch_1
        0x7f94e13e -> :sswitch_0
    .end sparse-switch

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
    .line 348
    .line 349
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

    .line 295
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;->parseField(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;",
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
    const-string v0, "mediaType"

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
    const-string v0, "music"

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
    const-string v0, "audio"

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
    const-string v0, "size"

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
    const-string v0, "name"

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
    const-string v0, "url"

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
    const-string v0, "gif"

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
    const-string v0, "id"

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
    const-string v0, "gaussianBlurParameters"

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
    const-string v0, "attachments"

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
    const-string v0, "status"

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
    const-string v0, "aiPosition"

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
    const-string v0, "duration"

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
        -0x76bbb26c -> :sswitch_c
        -0x6fad9e8f -> :sswitch_b
        -0x3532300e -> :sswitch_a
        -0x2c0c3450 -> :sswitch_9
        -0x23541f74 -> :sswitch_8
        0xd1b -> :sswitch_7
        0x18fc4 -> :sswitch_6
        0x1c56f -> :sswitch_5
        0x337a8b -> :sswitch_4
        0x35e001 -> :sswitch_3
        0x58d9bd6 -> :sswitch_2
        0x636ee25 -> :sswitch_1
        0x7f94e13e -> :sswitch_0
    .end sparse-switch

    .line 186
    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    .line 192
    .line 193
    .line 194
    .line 195
    .line 196
    .line 197
    .line 198
    :pswitch_data_0
    .packed-switch 0x0
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
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;->parseFieldCheck(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->name:Ljava/lang/String;

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
    const-string p0, "duration"

    .line 20
    .line 21
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->duration:F

    .line 22
    .line 23
    invoke-virtual {p2, p0, v0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeNumberField(Ljava/lang/String;F)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->mediaType:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz p0, :cond_2

    .line 29
    .line 30
    const-string v0, "mediaType"

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    if-eqz p0, :cond_3

    .line 39
    .line 40
    const-string p0, "size"

    .line 41
    .line 42
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->DIMENSION:Lcom/tantanapp/common/data/JsonAdapter;

    .line 46
    .line 47
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->size:Lcom/p1/mobile/putong/data/Dimension;

    .line 48
    .line 49
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 50
    .line 51
    .line 52
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 53
    .line 54
    if-eqz p0, :cond_4

    .line 55
    .line 56
    const-string p0, "attachments"

    .line 57
    .line 58
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->attachments:Ljava/util/List;

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 64
    .line 65
    invoke-static {p0, p2, v1}, Lcom/tantanapp/common/data/JsonAdapter;->serializeArray(Ljava/util/List;Lcom/fasterxml/jackson/core/JsonGenerator;Lcom/tantanapp/common/data/JsonAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->url:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    const-string v1, "url"

    .line 73
    .line 74
    invoke-virtual {p2, v1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 78
    .line 79
    if-eqz p0, :cond_6

    .line 80
    .line 81
    const-string p0, "audio"

    .line 82
    .line 83
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object p0, Lcom/p1/mobile/putong/data/AudioMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 87
    .line 88
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->audio:Lcom/p1/mobile/putong/data/AudioMedia;

    .line 89
    .line 90
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 91
    .line 92
    .line 93
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 94
    .line 95
    if-eqz p0, :cond_7

    .line 96
    .line 97
    const-string p0, "gif"

    .line 98
    .line 99
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 100
    .line 101
    .line 102
    sget-object p0, Lcom/p1/mobile/putong/data/GifMedia;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 103
    .line 104
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gif:Lcom/p1/mobile/putong/data/GifMedia;

    .line 105
    .line 106
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 107
    .line 108
    .line 109
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 110
    .line 111
    if-eqz p0, :cond_8

    .line 112
    .line 113
    const-string p0, "music"

    .line 114
    .line 115
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    sget-object p0, Lcom/p1/mobile/putong/data/Music;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 119
    .line 120
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->music:Lcom/p1/mobile/putong/data/Music;

    .line 121
    .line 122
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 123
    .line 124
    .line 125
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 126
    .line 127
    if-eqz p0, :cond_9

    .line 128
    .line 129
    const-string p0, "aiPosition"

    .line 130
    .line 131
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    sget-object p0, Lcom/p1/mobile/putong/data/Converter;->AIPOSITION:Lcom/tantanapp/common/data/JsonAdapter;

    .line 135
    .line 136
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->aiPosition:Lcom/p1/mobile/putong/data/AIPosition;

    .line 137
    .line 138
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 139
    .line 140
    .line 141
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 142
    .line 143
    if-eqz p0, :cond_a

    .line 144
    .line 145
    const-string p0, "gaussianBlurParameters"

    .line 146
    .line 147
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 148
    .line 149
    .line 150
    sget-object p0, Lcom/p1/mobile/putong/data/GaussianBlurParameters;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 151
    .line 152
    iget-object v1, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->gaussianBlurParameters:Lcom/p1/mobile/putong/data/GaussianBlurParameters;

    .line 153
    .line 154
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 155
    .line 156
    .line 157
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;->status:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz p0, :cond_b

    .line 160
    .line 161
    const-string p1, "status"

    .line 162
    .line 163
    invoke-virtual {p2, p1, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeStringField(Ljava/lang/String;Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    :cond_b
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 167
    check-cast p1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia$2;->serializeFields(Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfoMedia;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
