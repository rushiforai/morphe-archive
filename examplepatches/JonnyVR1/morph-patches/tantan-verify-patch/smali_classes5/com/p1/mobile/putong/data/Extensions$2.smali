.class Lcom/p1/mobile/putong/data/Extensions$2;
.super Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Extensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter<",
        "Lcom/p1/mobile/putong/data/Extensions;",
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
    const-class p0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    return-object p0
.end method

.method public newInstance()Lcom/p1/mobile/putong/data/Extensions;
    .locals 0

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Extensions;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Extensions;-><init>()V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public bridge synthetic newInstance()Lcom/tantanapp/common/data/ValueObject;
    .locals 0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/Extensions$2;->newInstance()Lcom/p1/mobile/putong/data/Extensions;

    move-result-object p0

    return-object p0
.end method

.method public parseField(Lcom/p1/mobile/putong/data/Extensions;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Extensions;",
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
    const-string p0, "voiceSignature"

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
    const/16 v2, 0x11

    .line 27
    .line 28
    goto/16 :goto_0

    .line 29
    .line 30
    :sswitch_1
    const-string p0, "voiceAvatarFrame"

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
    const/16 v2, 0x10

    .line 41
    .line 42
    goto/16 :goto_0

    .line 43
    .line 44
    :sswitch_2
    const-string p0, "interest"

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
    const/16 v2, 0xf

    .line 55
    .line 56
    goto/16 :goto_0

    .line 57
    .line 58
    :sswitch_3
    const-string p0, "marriage"

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
    const/16 v2, 0xe

    .line 69
    .line 70
    goto/16 :goto_0

    .line 71
    .line 72
    :sswitch_4
    const-string p0, "basic"

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
    const/16 v2, 0xd

    .line 83
    .line 84
    goto/16 :goto_0

    .line 85
    .line 86
    :sswitch_5
    const-string p0, "mate"

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
    const/16 v2, 0xc

    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :sswitch_6
    const-string p0, "live"

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
    const/16 v2, 0xb

    .line 111
    .line 112
    goto/16 :goto_0

    .line 113
    .line 114
    :sswitch_7
    const-string p0, "game"

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
    const/16 v2, 0xa

    .line 125
    .line 126
    goto/16 :goto_0

    .line 127
    .line 128
    :sswitch_8
    const-string p0, "pet"

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
    const/16 v2, 0x9

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_9
    const-string p0, "tailFrame"

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
    const/16 v2, 0x8

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    const-string p0, "headFrame"

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
    goto :goto_0

    .line 165
    :cond_a
    const/4 v2, 0x7

    .line 166
    goto :goto_0

    .line 167
    :sswitch_b
    const-string p0, "friendStatus"

    .line 168
    .line 169
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    if-nez p0, :cond_b

    .line 174
    .line 175
    goto :goto_0

    .line 176
    :cond_b
    const/4 v2, 0x6

    .line 177
    goto :goto_0

    .line 178
    :sswitch_c
    const-string p0, "profileCompletion"

    .line 179
    .line 180
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 181
    .line 182
    .line 183
    move-result p0

    .line 184
    if-nez p0, :cond_c

    .line 185
    .line 186
    goto :goto_0

    .line 187
    :cond_c
    const/4 v2, 0x5

    .line 188
    goto :goto_0

    .line 189
    :sswitch_d
    const-string p0, "wealth"

    .line 190
    .line 191
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result p0

    .line 195
    if-nez p0, :cond_d

    .line 196
    .line 197
    goto :goto_0

    .line 198
    :cond_d
    const/4 v2, 0x4

    .line 199
    goto :goto_0

    .line 200
    :sswitch_e
    const-string p0, "physical"

    .line 201
    .line 202
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p0

    .line 206
    if-nez p0, :cond_e

    .line 207
    .line 208
    goto :goto_0

    .line 209
    :cond_e
    const/4 v2, 0x3

    .line 210
    goto :goto_0

    .line 211
    :sswitch_f
    const-string p0, "business"

    .line 212
    .line 213
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 214
    .line 215
    .line 216
    move-result p0

    .line 217
    if-nez p0, :cond_f

    .line 218
    .line 219
    goto :goto_0

    .line 220
    :cond_f
    const/4 v2, 0x2

    .line 221
    goto :goto_0

    .line 222
    :sswitch_10
    const-string p0, "momentSwitch"

    .line 223
    .line 224
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    move-result p0

    .line 228
    if-nez p0, :cond_10

    .line 229
    .line 230
    goto :goto_0

    .line 231
    :cond_10
    move v2, v1

    .line 232
    goto :goto_0

    .line 233
    :sswitch_11
    const-string p0, "anonymity"

    .line 234
    .line 235
    invoke-virtual {p2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 236
    .line 237
    .line 238
    move-result p0

    .line 239
    if-nez p0, :cond_11

    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_11
    move v2, v0

    .line 243
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 244
    .line 245
    .line 246
    return v0

    .line 247
    :pswitch_0
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceSignature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 248
    .line 249
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 254
    .line 255
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 256
    .line 257
    return v1

    .line 258
    :pswitch_1
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 259
    .line 260
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 261
    .line 262
    .line 263
    move-result-object p0

    .line 264
    check-cast p0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 265
    .line 266
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 267
    .line 268
    return v1

    .line 269
    :pswitch_2
    sget-object p0, Lcom/p1/mobile/putong/data/Interest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 270
    .line 271
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    check-cast p0, Lcom/p1/mobile/putong/data/Interest;

    .line 276
    .line 277
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 278
    .line 279
    return v1

    .line 280
    :pswitch_3
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 281
    .line 282
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 283
    .line 284
    .line 285
    move-result-object p0

    .line 286
    check-cast p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 287
    .line 288
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 289
    .line 290
    return v1

    .line 291
    :pswitch_4
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 292
    .line 293
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    check-cast p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 298
    .line 299
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 300
    .line 301
    return v1

    .line 302
    :pswitch_5
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileMate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 303
    .line 304
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    check-cast p0, Lcom/p1/mobile/putong/data/ProfileMate;

    .line 309
    .line 310
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 311
    .line 312
    return v1

    .line 313
    :pswitch_6
    sget-object p0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 314
    .line 315
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    check-cast p0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 320
    .line 321
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 322
    .line 323
    return v1

    .line 324
    :pswitch_7
    sget-object p0, Lcom/p1/mobile/putong/data/ExtensionGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 325
    .line 326
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object p0

    .line 330
    check-cast p0, Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 331
    .line 332
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 333
    .line 334
    return v1

    .line 335
    :pswitch_8
    sget-object p0, Lcom/p1/mobile/putong/data/PetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 336
    .line 337
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    check-cast p0, Lcom/p1/mobile/putong/data/PetInfo;

    .line 342
    .line 343
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 344
    .line 345
    return v1

    .line 346
    :pswitch_9
    sget-object p0, Lcom/p1/mobile/putong/data/TailFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 347
    .line 348
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    check-cast p0, Lcom/p1/mobile/putong/data/TailFrame;

    .line 353
    .line 354
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 355
    .line 356
    return v1

    .line 357
    :pswitch_a
    sget-object p0, Lcom/p1/mobile/putong/data/HeadFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 358
    .line 359
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    check-cast p0, Lcom/p1/mobile/putong/data/HeadFrame;

    .line 364
    .line 365
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 366
    .line 367
    return v1

    .line 368
    :pswitch_b
    sget-object p0, Lcom/p1/mobile/putong/data/FriendStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 369
    .line 370
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object p0

    .line 374
    check-cast p0, Lcom/p1/mobile/putong/data/FriendStatus;

    .line 375
    .line 376
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 377
    .line 378
    return v1

    .line 379
    :pswitch_c
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileCompletion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 380
    .line 381
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    check-cast p0, Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 386
    .line 387
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 388
    .line 389
    return v1

    .line 390
    :pswitch_d
    sget-object p0, Lcom/p1/mobile/putong/data/UserWealth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 391
    .line 392
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object p0

    .line 396
    check-cast p0, Lcom/p1/mobile/putong/data/UserWealth;

    .line 397
    .line 398
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 399
    .line 400
    return v1

    .line 401
    :pswitch_e
    sget-object p0, Lcom/p1/mobile/putong/data/Physical;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 402
    .line 403
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p0

    .line 407
    check-cast p0, Lcom/p1/mobile/putong/data/Physical;

    .line 408
    .line 409
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 410
    .line 411
    return v1

    .line 412
    :pswitch_f
    sget-object p0, Lcom/p1/mobile/putong/data/Business;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 413
    .line 414
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object p0

    .line 418
    check-cast p0, Lcom/p1/mobile/putong/data/Business;

    .line 419
    .line 420
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 421
    .line 422
    return v1

    .line 423
    :pswitch_10
    sget-object p0, Lcom/p1/mobile/putong/data/MomentSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 424
    .line 425
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object p0

    .line 429
    check-cast p0, Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 430
    .line 431
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 432
    .line 433
    return v1

    .line 434
    :pswitch_11
    sget-object p0, Lcom/p1/mobile/putong/data/Anonymity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 435
    .line 436
    invoke-virtual {p0, p3, p4, p5, p6}, Lcom/tantanapp/common/data/JsonAdapter;->parse(Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object p0

    .line 440
    check-cast p0, Lcom/p1/mobile/putong/data/Anonymity;

    .line 441
    .line 442
    iput-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 443
    .line 444
    return v1

    .line 445
    :sswitch_data_0
    .sparse-switch
        -0x7ceba232 -> :sswitch_11
        -0x78795aac -> :sswitch_10
        -0x445b4040 -> :sswitch_f
        -0x3af41f29 -> :sswitch_e
        -0x2f324c53 -> :sswitch_d
        -0x26bef59b -> :sswitch_c
        -0xf5e27d0 -> :sswitch_b
        -0xe6b6893 -> :sswitch_a
        -0x5e24903 -> :sswitch_9
        0x1b11f -> :sswitch_8
        0x304bf2 -> :sswitch_7
        0x32b0ec -> :sswitch_6
        0x330705 -> :sswitch_5
        0x592d42e -> :sswitch_4
        0xf1cb0ca -> :sswitch_3
        0x21ffa72a -> :sswitch_2
        0x52cf5b02 -> :sswitch_1
        0x5bc20fa6 -> :sswitch_0
    .end sparse-switch

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
    .line 514
    .line 515
    .line 516
    .line 517
    .line 518
    .line 519
    :pswitch_data_0
    .packed-switch 0x0
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

    .line 445
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Extensions$2;->parseField(Lcom/p1/mobile/putong/data/Extensions;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public parseFieldCheck(Lcom/p1/mobile/putong/data/Extensions;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/data/Extensions;",
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
    const-string v0, "voiceSignature"

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
    const/16 v2, 0x11

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :sswitch_1
    const-string v0, "voiceAvatarFrame"

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
    const/16 v2, 0x10

    .line 40
    .line 41
    goto/16 :goto_0

    .line 42
    .line 43
    :sswitch_2
    const-string v0, "interest"

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
    const/16 v2, 0xf

    .line 54
    .line 55
    goto/16 :goto_0

    .line 56
    .line 57
    :sswitch_3
    const-string v0, "marriage"

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
    const/16 v2, 0xe

    .line 68
    .line 69
    goto/16 :goto_0

    .line 70
    .line 71
    :sswitch_4
    const-string v0, "basic"

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
    const/16 v2, 0xd

    .line 82
    .line 83
    goto/16 :goto_0

    .line 84
    .line 85
    :sswitch_5
    const-string v0, "mate"

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
    goto/16 :goto_0

    .line 94
    .line 95
    :cond_5
    const/16 v2, 0xc

    .line 96
    .line 97
    goto/16 :goto_0

    .line 98
    .line 99
    :sswitch_6
    const-string v0, "live"

    .line 100
    .line 101
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    if-nez v0, :cond_6

    .line 106
    .line 107
    goto/16 :goto_0

    .line 108
    .line 109
    :cond_6
    const/16 v2, 0xb

    .line 110
    .line 111
    goto/16 :goto_0

    .line 112
    .line 113
    :sswitch_7
    const-string v0, "game"

    .line 114
    .line 115
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_7

    .line 120
    .line 121
    goto/16 :goto_0

    .line 122
    .line 123
    :cond_7
    const/16 v2, 0xa

    .line 124
    .line 125
    goto/16 :goto_0

    .line 126
    .line 127
    :sswitch_8
    const-string v0, "pet"

    .line 128
    .line 129
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-nez v0, :cond_8

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    const/16 v2, 0x9

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_9
    const-string v0, "tailFrame"

    .line 142
    .line 143
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    if-nez v0, :cond_9

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_9
    const/16 v2, 0x8

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_a
    const-string v0, "headFrame"

    .line 156
    .line 157
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    if-nez v0, :cond_a

    .line 162
    .line 163
    goto :goto_0

    .line 164
    :cond_a
    const/4 v2, 0x7

    .line 165
    goto :goto_0

    .line 166
    :sswitch_b
    const-string v0, "friendStatus"

    .line 167
    .line 168
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-nez v0, :cond_b

    .line 173
    .line 174
    goto :goto_0

    .line 175
    :cond_b
    const/4 v2, 0x6

    .line 176
    goto :goto_0

    .line 177
    :sswitch_c
    const-string v0, "profileCompletion"

    .line 178
    .line 179
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 180
    .line 181
    .line 182
    move-result v0

    .line 183
    if-nez v0, :cond_c

    .line 184
    .line 185
    goto :goto_0

    .line 186
    :cond_c
    const/4 v2, 0x5

    .line 187
    goto :goto_0

    .line 188
    :sswitch_d
    const-string v0, "wealth"

    .line 189
    .line 190
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-nez v0, :cond_d

    .line 195
    .line 196
    goto :goto_0

    .line 197
    :cond_d
    const/4 v2, 0x4

    .line 198
    goto :goto_0

    .line 199
    :sswitch_e
    const-string v0, "physical"

    .line 200
    .line 201
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    if-nez v0, :cond_e

    .line 206
    .line 207
    goto :goto_0

    .line 208
    :cond_e
    const/4 v2, 0x3

    .line 209
    goto :goto_0

    .line 210
    :sswitch_f
    const-string v0, "business"

    .line 211
    .line 212
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    if-nez v0, :cond_f

    .line 217
    .line 218
    goto :goto_0

    .line 219
    :cond_f
    const/4 v2, 0x2

    .line 220
    goto :goto_0

    .line 221
    :sswitch_10
    const-string v0, "momentSwitch"

    .line 222
    .line 223
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    if-nez v0, :cond_10

    .line 228
    .line 229
    goto :goto_0

    .line 230
    :cond_10
    move v2, v1

    .line 231
    goto :goto_0

    .line 232
    :sswitch_11
    const-string v0, "anonymity"

    .line 233
    .line 234
    invoke-virtual {p2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-nez v0, :cond_11

    .line 239
    .line 240
    goto :goto_0

    .line 241
    :cond_11
    const/4 v2, 0x0

    .line 242
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 243
    .line 244
    .line 245
    invoke-super/range {p0 .. p6}, Lcom/p1/mobile/putong/dbcenter/parse/ObjectJsonAdapter;->parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    .line 246
    .line 247
    .line 248
    move-result p0

    .line 249
    return p0

    .line 250
    :pswitch_0
    return v1

    .line 251
    :sswitch_data_0
    .sparse-switch
        -0x7ceba232 -> :sswitch_11
        -0x78795aac -> :sswitch_10
        -0x445b4040 -> :sswitch_f
        -0x3af41f29 -> :sswitch_e
        -0x2f324c53 -> :sswitch_d
        -0x26bef59b -> :sswitch_c
        -0xf5e27d0 -> :sswitch_b
        -0xe6b6893 -> :sswitch_a
        -0x5e24903 -> :sswitch_9
        0x1b11f -> :sswitch_8
        0x304bf2 -> :sswitch_7
        0x32b0ec -> :sswitch_6
        0x330705 -> :sswitch_5
        0x592d42e -> :sswitch_4
        0xf1cb0ca -> :sswitch_3
        0x21ffa72a -> :sswitch_2
        0x52cf5b02 -> :sswitch_1
        0x5bc20fa6 -> :sswitch_0
    .end sparse-switch

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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public bridge synthetic parseFieldCheck(Lcom/tantanapp/common/data/ValueObject;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z
    .locals 0

    .line 251
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    invoke-virtual/range {p0 .. p6}, Lcom/p1/mobile/putong/data/Extensions$2;->parseFieldCheck(Lcom/p1/mobile/putong/data/Extensions;Ljava/lang/String;Lcom/fasterxml/jackson/core/JsonParser;Ljava/lang/String;Ljava/util/ArrayList;Lcom/tantanapp/common/data/DataChecker;)Z

    move-result p0

    return p0
.end method

.method public serializeFields(Lcom/p1/mobile/putong/data/Extensions;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    const-string p0, "physical"

    .line 7
    .line 8
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/putong/data/Physical;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 12
    .line 13
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 14
    .line 15
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 16
    .line 17
    .line 18
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    const-string p0, "business"

    .line 23
    .line 24
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Lcom/p1/mobile/putong/data/Business;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 28
    .line 29
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->business:Lcom/p1/mobile/putong/data/Business;

    .line 30
    .line 31
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 35
    .line 36
    if-eqz p0, :cond_2

    .line 37
    .line 38
    const-string p0, "interest"

    .line 39
    .line 40
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    sget-object p0, Lcom/p1/mobile/putong/data/Interest;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 44
    .line 45
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->interest:Lcom/p1/mobile/putong/data/Interest;

    .line 46
    .line 47
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 48
    .line 49
    .line 50
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    const-string p0, "basic"

    .line 55
    .line 56
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileExtensionBasic;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 60
    .line 61
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->basic:Lcom/p1/mobile/putong/data/ProfileExtensionBasic;

    .line 62
    .line 63
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const-string p0, "anonymity"

    .line 71
    .line 72
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    sget-object p0, Lcom/p1/mobile/putong/data/Anonymity;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 76
    .line 77
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->anonymity:Lcom/p1/mobile/putong/data/Anonymity;

    .line 78
    .line 79
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 80
    .line 81
    .line 82
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 83
    .line 84
    if-eqz p0, :cond_5

    .line 85
    .line 86
    const-string p0, "headFrame"

    .line 87
    .line 88
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/p1/mobile/putong/data/HeadFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 92
    .line 93
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->headFrame:Lcom/p1/mobile/putong/data/HeadFrame;

    .line 94
    .line 95
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 96
    .line 97
    .line 98
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 99
    .line 100
    if-eqz p0, :cond_6

    .line 101
    .line 102
    const-string p0, "friendStatus"

    .line 103
    .line 104
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/p1/mobile/putong/data/FriendStatus;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 108
    .line 109
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->friendStatus:Lcom/p1/mobile/putong/data/FriendStatus;

    .line 110
    .line 111
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const-string p0, "momentSwitch"

    .line 119
    .line 120
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    sget-object p0, Lcom/p1/mobile/putong/data/MomentSwitch;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 124
    .line 125
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->momentSwitch:Lcom/p1/mobile/putong/data/MomentSwitch;

    .line 126
    .line 127
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 128
    .line 129
    .line 130
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 131
    .line 132
    if-eqz p0, :cond_8

    .line 133
    .line 134
    const-string p0, "wealth"

    .line 135
    .line 136
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    sget-object p0, Lcom/p1/mobile/putong/data/UserWealth;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 140
    .line 141
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->wealth:Lcom/p1/mobile/putong/data/UserWealth;

    .line 142
    .line 143
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 144
    .line 145
    .line 146
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 147
    .line 148
    if-eqz p0, :cond_9

    .line 149
    .line 150
    const-string p0, "profileCompletion"

    .line 151
    .line 152
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 153
    .line 154
    .line 155
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileCompletion;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 156
    .line 157
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->profileCompletion:Lcom/p1/mobile/putong/data/ProfileCompletion;

    .line 158
    .line 159
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 160
    .line 161
    .line 162
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 163
    .line 164
    if-eqz p0, :cond_a

    .line 165
    .line 166
    const-string p0, "voiceSignature"

    .line 167
    .line 168
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceSignature;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 172
    .line 173
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceSignature:Lcom/p1/mobile/putong/data/VoiceSignature;

    .line 174
    .line 175
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 176
    .line 177
    .line 178
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 179
    .line 180
    if-eqz p0, :cond_b

    .line 181
    .line 182
    const-string p0, "live"

    .line 183
    .line 184
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    sget-object p0, Lcom/p1/mobile/putong/data/VirtualVoiceLive;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 188
    .line 189
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->live:Lcom/p1/mobile/putong/data/VirtualVoiceLive;

    .line 190
    .line 191
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 192
    .line 193
    .line 194
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 195
    .line 196
    if-eqz p0, :cond_c

    .line 197
    .line 198
    const-string p0, "mate"

    .line 199
    .line 200
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileMate;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 204
    .line 205
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->mate:Lcom/p1/mobile/putong/data/ProfileMate;

    .line 206
    .line 207
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 208
    .line 209
    .line 210
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 211
    .line 212
    if-eqz p0, :cond_d

    .line 213
    .line 214
    const-string p0, "pet"

    .line 215
    .line 216
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 217
    .line 218
    .line 219
    sget-object p0, Lcom/p1/mobile/putong/data/PetInfo;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 220
    .line 221
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->pet:Lcom/p1/mobile/putong/data/PetInfo;

    .line 222
    .line 223
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 224
    .line 225
    .line 226
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 227
    .line 228
    if-eqz p0, :cond_e

    .line 229
    .line 230
    const-string p0, "tailFrame"

    .line 231
    .line 232
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 233
    .line 234
    .line 235
    sget-object p0, Lcom/p1/mobile/putong/data/TailFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 236
    .line 237
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->tailFrame:Lcom/p1/mobile/putong/data/TailFrame;

    .line 238
    .line 239
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 240
    .line 241
    .line 242
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 243
    .line 244
    if-eqz p0, :cond_f

    .line 245
    .line 246
    const-string p0, "voiceAvatarFrame"

    .line 247
    .line 248
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 249
    .line 250
    .line 251
    sget-object p0, Lcom/p1/mobile/putong/data/VoiceAvatarFrame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 252
    .line 253
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->voiceAvatarFrame:Lcom/p1/mobile/putong/data/VoiceAvatarFrame;

    .line 254
    .line 255
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 256
    .line 257
    .line 258
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 259
    .line 260
    if-eqz p0, :cond_10

    .line 261
    .line 262
    const-string p0, "marriage"

    .line 263
    .line 264
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    sget-object p0, Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 268
    .line 269
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Extensions;->marriage:Lcom/p1/mobile/putong/data/ProfileExtensionMarriage;

    .line 270
    .line 271
    invoke-virtual {p0, v1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 272
    .line 273
    .line 274
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 275
    .line 276
    if-eqz p0, :cond_11

    .line 277
    .line 278
    const-string p0, "game"

    .line 279
    .line 280
    invoke-virtual {p2, p0}, Lcom/fasterxml/jackson/core/JsonGenerator;->writeFieldName(Ljava/lang/String;)V

    .line 281
    .line 282
    .line 283
    sget-object p0, Lcom/p1/mobile/putong/data/ExtensionGame;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 284
    .line 285
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 286
    .line 287
    invoke-virtual {p0, p1, p2, v0}, Lcom/tantanapp/common/data/JsonAdapter;->serialize(Ljava/lang/Object;Lcom/fasterxml/jackson/core/JsonGenerator;Z)V

    .line 288
    .line 289
    .line 290
    :cond_11
    return-void
.end method

.method public bridge synthetic serializeFields(Lcom/tantanapp/common/data/ValueObject;Lcom/fasterxml/jackson/core/JsonGenerator;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 291
    check-cast p1, Lcom/p1/mobile/putong/data/Extensions;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Extensions$2;->serializeFields(Lcom/p1/mobile/putong/data/Extensions;Lcom/fasterxml/jackson/core/JsonGenerator;)V

    return-void
.end method
