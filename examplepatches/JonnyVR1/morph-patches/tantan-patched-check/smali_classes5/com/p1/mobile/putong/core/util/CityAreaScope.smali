.class public final enum Lcom/p1/mobile/putong/core/util/CityAreaScope;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/p1/mobile/putong/core/util/CityAreaScope;",
        ">;"
    }
.end annotation


# static fields
.field private static final synthetic $VALUES:[Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum busan:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum daegu:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum kanagawa:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum kanagawa_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum osaka_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum seoul:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum tokyo:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum tokyo_first:Lcom/p1/mobile/putong/core/util/CityAreaScope;

.field public static final enum tokyo_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;


# instance fields
.field private activeCity:Ljava/lang/String;

.field private areas:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;>;"
        }
    .end annotation
.end field

.field private cityNameEn:Ljava/lang/String;

.field private cityNameZh:Ljava/lang/String;

.field private eventName:Ljava/lang/String;


# direct methods
.method private static synthetic $values()[Lcom/p1/mobile/putong/core/util/CityAreaScope;
    .locals 9

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->seoul:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/util/CityAreaScope;->daegu:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/util/CityAreaScope;->busan:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 10
    .line 11
    sget-object v5, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 12
    .line 13
    sget-object v6, Lcom/p1/mobile/putong/core/util/CityAreaScope;->osaka_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 14
    .line 15
    sget-object v7, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 16
    .line 17
    sget-object v8, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo_first:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 18
    .line 19
    filled-new-array/range {v0 .. v8}, [Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    return-object v0
.end method

.method static constructor <clinit>()V
    .locals 16

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    const-wide v1, 0x4042cf7ced916873L    # 37.621

    .line 4
    .line 5
    .line 6
    .line 7
    .line 8
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const-wide v2, 0x4042bc63f141205cL    # 37.4718

    .line 13
    .line 14
    .line 15
    .line 16
    .line 17
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-wide v3, 0x405fba027525460bL    # 126.9064

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 27
    .line 28
    .line 29
    move-result-object v3

    .line 30
    const-wide v4, 0x405fc7694467381dL    # 127.1158

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    invoke-static {v1, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    const-string v1, "seoul"

    .line 44
    .line 45
    const/4 v2, 0x0

    .line 46
    const-string v3, "\u9996\u5c14"

    .line 47
    .line 48
    const-string v4, "Seoul"

    .line 49
    .line 50
    const-string v5, "seoul"

    .line 51
    .line 52
    const-string v6, "active_in_kr_seoul"

    .line 53
    .line 54
    invoke-direct/range {v0 .. v7}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 55
    .line 56
    .line 57
    sput-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->seoul:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 58
    .line 59
    new-instance v1, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 60
    .line 61
    const-wide v2, 0x4041f7972474538fL    # 35.9343

    .line 62
    .line 63
    .line 64
    .line 65
    .line 66
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    const-wide v2, 0x4041dfd8adab9f56L    # 35.7488

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    const-wide v3, 0x40600e027525460bL    # 128.4378

    .line 80
    .line 81
    .line 82
    .line 83
    .line 84
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    const-wide v4, 0x406015d97f62b6aeL    # 128.6828

    .line 89
    .line 90
    .line 91
    .line 92
    .line 93
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v0, v2, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 98
    .line 99
    .line 100
    move-result-object v8

    .line 101
    const-string v2, "daegu"

    .line 102
    .line 103
    const/4 v3, 0x1

    .line 104
    const-string v4, "\u5927\u90b1\u5e7f\u57df\u5e02"

    .line 105
    .line 106
    const-string v5, "Daegu"

    .line 107
    .line 108
    const-string v6, "daegu"

    .line 109
    .line 110
    const-string v7, "active_in_kr_daegu"

    .line 111
    .line 112
    invoke-direct/range {v1 .. v8}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 113
    .line 114
    .line 115
    sput-object v1, Lcom/p1/mobile/putong/core/util/CityAreaScope;->daegu:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 116
    .line 117
    new-instance v2, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 118
    .line 119
    const-wide v0, 0x40419d5cfaacd9e8L    # 35.2294

    .line 120
    .line 121
    .line 122
    .line 123
    .line 124
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    const-wide v3, 0x4041884ea4a8c155L    # 35.0649

    .line 129
    .line 130
    .line 131
    .line 132
    .line 133
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    const-wide v3, 0x40601f923a29c77aL    # 128.9866

    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 143
    .line 144
    .line 145
    move-result-object v3

    .line 146
    const-wide v4, 0x406025d566cf41f2L    # 129.1823

    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 152
    .line 153
    .line 154
    move-result-object v4

    .line 155
    invoke-static {v0, v1, v3, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 156
    .line 157
    .line 158
    move-result-object v9

    .line 159
    const-string v3, "busan"

    .line 160
    .line 161
    const/4 v4, 0x2

    .line 162
    const-string v5, "\u91dc\u5c71"

    .line 163
    .line 164
    const-string v6, "Busan"

    .line 165
    .line 166
    const-string v7, "busan"

    .line 167
    .line 168
    const-string v8, "active_in_kr_busan"

    .line 169
    .line 170
    invoke-direct/range {v2 .. v9}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 171
    .line 172
    .line 173
    sput-object v2, Lcom/p1/mobile/putong/core/util/CityAreaScope;->busan:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 174
    .line 175
    new-instance v3, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 176
    .line 177
    const-wide v0, 0x4041e507c84b5dccL    # 35.7893

    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    const-wide v1, 0x4041c5b573eab368L    # 35.5446

    .line 187
    .line 188
    .line 189
    .line 190
    .line 191
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    const-wide v4, 0x4061746809d49518L    # 139.6377

    .line 196
    .line 197
    .line 198
    .line 199
    .line 200
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    const-wide v4, 0x40617cd288ce703bL    # 139.9007

    .line 205
    .line 206
    .line 207
    .line 208
    .line 209
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 210
    .line 211
    .line 212
    move-result-object v4

    .line 213
    invoke-static {v0, v1, v2, v4}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 214
    .line 215
    .line 216
    move-result-object v10

    .line 217
    const-string v4, "tokyo"

    .line 218
    .line 219
    const/4 v5, 0x3

    .line 220
    const-string v6, "\u6771\u4eac(\u5e74\u8f7b\u4eba\u805a\u96c6\u533a\uff09"

    .line 221
    .line 222
    const-string v7, "Tokyo"

    .line 223
    .line 224
    const-string v8, "tokyo"

    .line 225
    .line 226
    const-string v9, "active_in_jp_tokyo"

    .line 227
    .line 228
    invoke-direct/range {v3 .. v10}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 229
    .line 230
    .line 231
    sput-object v3, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 232
    .line 233
    new-instance v4, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 234
    .line 235
    const-wide v0, 0x4041cce703afb7e9L    # 35.6008

    .line 236
    .line 237
    .line 238
    .line 239
    .line 240
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    const-wide v1, 0x4041bbc6a7ef9db2L    # 35.467

    .line 245
    .line 246
    .line 247
    .line 248
    .line 249
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 250
    .line 251
    .line 252
    move-result-object v1

    .line 253
    const-wide v2, 0x406167566cf41f21L    # 139.2293

    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 259
    .line 260
    .line 261
    move-result-object v2

    .line 262
    const-wide v5, 0x40616f30be0ded29L    # 139.4747

    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 268
    .line 269
    .line 270
    move-result-object v3

    .line 271
    invoke-static {v0, v1, v2, v3}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    const-wide v1, 0x4041d212d77318fcL    # 35.6412

    .line 276
    .line 277
    .line 278
    .line 279
    .line 280
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 281
    .line 282
    .line 283
    move-result-object v1

    .line 284
    const-wide v2, 0x4041a6dfa43fe5c9L    # 35.3037

    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 290
    .line 291
    .line 292
    move-result-object v2

    .line 293
    const-wide v5, 0x40616f0d844d013bL    # 139.4704

    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    const-wide v5, 0x4061778e219652bdL    # 139.7361

    .line 303
    .line 304
    .line 305
    .line 306
    .line 307
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 308
    .line 309
    .line 310
    move-result-object v5

    .line 311
    invoke-static {v1, v2, v3, v5}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    const-wide v2, 0x4041aa9fbe76c8b4L    # 35.333

    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 321
    .line 322
    .line 323
    move-result-object v2

    .line 324
    const-wide v5, 0x4041a0f27bb2fec5L    # 35.2574

    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 330
    .line 331
    .line 332
    move-result-object v3

    .line 333
    const-wide v5, 0x4061631d14e3bcd3L    # 139.0973

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 339
    .line 340
    .line 341
    move-result-object v5

    .line 342
    const-wide v6, 0x4061672d77318fc5L    # 139.2243

    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 348
    .line 349
    .line 350
    move-result-object v6

    .line 351
    invoke-static {v2, v3, v5, v6}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    filled-new-array {v0, v1, v2}, [Ll/ovb0;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 360
    .line 361
    .line 362
    move-result-object v11

    .line 363
    const-string v5, "kanagawa"

    .line 364
    .line 365
    const/4 v6, 0x4

    .line 366
    const-string v7, "\u795e\u5948\u5ddd\u7e23(\u5e74\u8f7b\u4eba\u805a\u96c6\u533a\uff09"

    .line 367
    .line 368
    const-string v8, "Kanagawa"

    .line 369
    .line 370
    const-string v9, "kanagawa"

    .line 371
    .line 372
    const-string v10, "active_in_jp_kanagawa"

    .line 373
    .line 374
    invoke-direct/range {v4 .. v11}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    .line 375
    .line 376
    .line 377
    sput-object v4, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 378
    .line 379
    new-instance v5, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 380
    .line 381
    const-wide v0, 0x4041e66666666666L    # 35.8

    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    const-wide v1, 0x4041c51eb851eb85L    # 35.54

    .line 391
    .line 392
    .line 393
    .line 394
    .line 395
    invoke-static {v1, v2}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    const-wide v2, 0x4061723d70a3d70aL    # 139.57

    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 405
    .line 406
    .line 407
    move-result-object v2

    .line 408
    const-wide v3, 0x40617bd70a3d70a4L    # 139.87

    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    invoke-static {v3, v4}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 414
    .line 415
    .line 416
    move-result-object v3

    .line 417
    invoke-static {v0, v1, v2, v3}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 418
    .line 419
    .line 420
    move-result-object v12

    .line 421
    const-string v6, "tokyo_new"

    .line 422
    .line 423
    const/4 v7, 0x5

    .line 424
    const-string v8, "\u4e1c\u4eac_\u65b0"

    .line 425
    .line 426
    const-string v9, "Tokyo_new"

    .line 427
    .line 428
    const-string v10, "Tokyo_new"

    .line 429
    .line 430
    const-string v11, "active_in_JP_Tokyo_new"

    .line 431
    .line 432
    invoke-direct/range {v5 .. v12}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 433
    .line 434
    .line 435
    sput-object v5, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 436
    .line 437
    new-instance v6, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 438
    .line 439
    const-wide v4, 0x40415c28f5c28f5cL    # 34.72

    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 445
    .line 446
    .line 447
    move-result-object v4

    .line 448
    const-wide v7, 0x40414b851eb851ecL    # 34.59

    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 454
    .line 455
    .line 456
    move-result-object v5

    .line 457
    const-wide v7, 0x4060ed70a3d70a3dL    # 135.42

    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    invoke-static {v7, v8}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 463
    .line 464
    .line 465
    move-result-object v7

    .line 466
    const-wide v8, 0x4060f28f5c28f5c3L    # 135.58

    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 472
    .line 473
    .line 474
    move-result-object v8

    .line 475
    invoke-static {v4, v5, v7, v8}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 476
    .line 477
    .line 478
    move-result-object v13

    .line 479
    const-string v7, "osaka_new"

    .line 480
    .line 481
    const/4 v8, 0x6

    .line 482
    const-string v9, "\u5927\u962a\u5e9c"

    .line 483
    .line 484
    const-string v10, "Osaka_new"

    .line 485
    .line 486
    const-string v11, "Osaka_new"

    .line 487
    .line 488
    const-string v12, "active_in_JP_Osaka_new"

    .line 489
    .line 490
    invoke-direct/range {v6 .. v13}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 491
    .line 492
    .line 493
    sput-object v6, Lcom/p1/mobile/putong/core/util/CityAreaScope;->osaka_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 494
    .line 495
    new-instance v7, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 496
    .line 497
    const-wide v4, 0x4041cccccccccccdL    # 35.6

    .line 498
    .line 499
    .line 500
    .line 501
    .line 502
    invoke-static {v4, v5}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 503
    .line 504
    .line 505
    move-result-object v4

    .line 506
    const-wide v5, 0x4041a7ae147ae148L    # 35.31

    .line 507
    .line 508
    .line 509
    .line 510
    .line 511
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 512
    .line 513
    .line 514
    move-result-object v5

    .line 515
    const-wide v8, 0x4061680000000000L    # 139.25

    .line 516
    .line 517
    .line 518
    .line 519
    .line 520
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 521
    .line 522
    .line 523
    move-result-object v6

    .line 524
    const-wide v8, 0x4061766666666666L    # 139.7

    .line 525
    .line 526
    .line 527
    .line 528
    .line 529
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 530
    .line 531
    .line 532
    move-result-object v8

    .line 533
    invoke-static {v4, v5, v6, v8}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 534
    .line 535
    .line 536
    move-result-object v14

    .line 537
    const-string v8, "kanagawa_new"

    .line 538
    .line 539
    const/4 v9, 0x7

    .line 540
    const-string v10, "\u795e\u5948\u5ddd_\u65b0"

    .line 541
    .line 542
    const-string v11, "Kanagawa_new"

    .line 543
    .line 544
    const-string v12, "Kanagawa_new"

    .line 545
    .line 546
    const-string v13, "active_in_JP_Kanagawa_new"

    .line 547
    .line 548
    invoke-direct/range {v7 .. v14}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 549
    .line 550
    .line 551
    sput-object v7, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 552
    .line 553
    new-instance v8, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 554
    .line 555
    const-string v14, "first_active_in_JP_Tokyo_new"

    .line 556
    .line 557
    invoke-static {v0, v1, v2, v3}, Ll/jyb;->Z(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ll/ovb0;

    .line 558
    .line 559
    .line 560
    move-result-object v15

    .line 561
    const-string v9, "tokyo_first"

    .line 562
    .line 563
    const/16 v10, 0x8

    .line 564
    .line 565
    const-string v11, "\u4e1c\u4eac_\u9996\u6b21\u6d3b\u8dc3"

    .line 566
    .line 567
    const-string v12, "Tokyo_new_only_once_in_lifetime"

    .line 568
    .line 569
    const-string v13, "Tokyo_new_only_once_in_lifetime"

    .line 570
    .line 571
    invoke-direct/range {v8 .. v15}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V

    .line 572
    .line 573
    .line 574
    sput-object v8, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo_first:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 575
    .line 576
    invoke-static {}, Lcom/p1/mobile/putong/core/util/CityAreaScope;->$values()[Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 577
    .line 578
    .line 579
    move-result-object v0

    .line 580
    sput-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->$VALUES:[Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 581
    .line 582
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ll/ovb0<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput-object p3, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->cityNameZh:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p4, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->cityNameEn:Ljava/lang/String;

    .line 7
    .line 8
    iput-object p5, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->activeCity:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p6, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->eventName:Ljava/lang/String;

    .line 11
    .line 12
    iput-object p7, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->areas:Ljava/util/List;

    .line 13
    .line 14
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ll/ovb0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Ll/ovb0<",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            "Ljava/lang/Double;",
            ">;)V"
        }
    .end annotation

    .line 15
    invoke-static {p7}, Ll/jyb;->M(Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object p7

    invoke-direct/range {p0 .. p7}, Lcom/p1/mobile/putong/core/util/CityAreaScope;-><init>(Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/util/List;)V

    return-void
.end method

.method public static getAllCheckCityAreas()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/util/CityAreaScope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->seoul:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/util/CityAreaScope;->daegu:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/util/CityAreaScope;->busan:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 8
    .line 9
    sget-object v4, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 10
    .line 11
    filled-new-array {v0, v1, v2, v3, v4}, [Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static getAllCheckCityAreasV2()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/util/CityAreaScope;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->tokyo_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    sget-object v1, Lcom/p1/mobile/putong/core/util/CityAreaScope;->osaka_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 4
    .line 5
    sget-object v2, Lcom/p1/mobile/putong/core/util/CityAreaScope;->kanagawa_new:Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 6
    .line 7
    filled-new-array {v0, v1, v2}, [Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    return-object v0
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/p1/mobile/putong/core/util/CityAreaScope;
    .locals 1

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/p1/mobile/putong/core/util/CityAreaScope;
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->$VALUES:[Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/p1/mobile/putong/core/util/CityAreaScope;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/p1/mobile/putong/core/util/CityAreaScope;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public cover(Lcom/p1/mobile/putong/location/Location;)Z
    .locals 6

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->u()D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/putong/location/Location;->x()D

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->areas:Ljava/util/List;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Ll/ovb0;

    .line 26
    .line 27
    iget-object v4, p1, Ll/ovb0;->b:Ljava/lang/Object;

    .line 28
    .line 29
    check-cast v4, Ljava/lang/Double;

    .line 30
    .line 31
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 32
    .line 33
    .line 34
    move-result-wide v4

    .line 35
    cmpl-double v4, v0, v4

    .line 36
    .line 37
    if-ltz v4, :cond_0

    .line 38
    .line 39
    iget-object v4, p1, Ll/ovb0;->a:Ljava/lang/Object;

    .line 40
    .line 41
    check-cast v4, Ljava/lang/Double;

    .line 42
    .line 43
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 44
    .line 45
    .line 46
    move-result-wide v4

    .line 47
    cmpg-double v4, v0, v4

    .line 48
    .line 49
    if-gtz v4, :cond_0

    .line 50
    .line 51
    iget-object v4, p1, Ll/ovb0;->c:Ljava/lang/Object;

    .line 52
    .line 53
    check-cast v4, Ljava/lang/Double;

    .line 54
    .line 55
    invoke-virtual {v4}, Ljava/lang/Double;->doubleValue()D

    .line 56
    .line 57
    .line 58
    move-result-wide v4

    .line 59
    cmpl-double v4, v2, v4

    .line 60
    .line 61
    if-ltz v4, :cond_0

    .line 62
    .line 63
    iget-object p1, p1, Ll/ovb0;->d:Ljava/lang/Object;

    .line 64
    .line 65
    check-cast p1, Ljava/lang/Double;

    .line 66
    .line 67
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    cmpg-double p1, v2, v4

    .line 72
    .line 73
    if-gtz p1, :cond_0

    .line 74
    .line 75
    const/4 p0, 0x1

    .line 76
    return p0

    .line 77
    :cond_1
    const/4 p0, 0x0

    .line 78
    return p0
.end method

.method public getActiveCity()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->activeCity:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEventName()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/util/CityAreaScope;->eventName:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method
