.class public final enum Lcom/xiaomi/push/ei;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/push/ei;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum A:Lcom/xiaomi/push/ei;

.field public static final enum B:Lcom/xiaomi/push/ei;

.field public static final enum C:Lcom/xiaomi/push/ei;

.field public static final enum D:Lcom/xiaomi/push/ei;

.field public static final enum E:Lcom/xiaomi/push/ei;

.field public static final enum F:Lcom/xiaomi/push/ei;

.field public static final enum G:Lcom/xiaomi/push/ei;

.field public static final enum H:Lcom/xiaomi/push/ei;

.field public static final enum I:Lcom/xiaomi/push/ei;

.field public static final enum J:Lcom/xiaomi/push/ei;

.field public static final enum K:Lcom/xiaomi/push/ei;

.field public static final enum L:Lcom/xiaomi/push/ei;

.field public static final enum M:Lcom/xiaomi/push/ei;

.field public static final enum N:Lcom/xiaomi/push/ei;

.field public static final enum O:Lcom/xiaomi/push/ei;

.field public static final enum P:Lcom/xiaomi/push/ei;

.field public static final enum Q:Lcom/xiaomi/push/ei;

.field public static final enum R:Lcom/xiaomi/push/ei;

.field public static final enum S:Lcom/xiaomi/push/ei;

.field public static final enum T:Lcom/xiaomi/push/ei;

.field public static final enum U:Lcom/xiaomi/push/ei;

.field public static final enum V:Lcom/xiaomi/push/ei;

.field public static final enum W:Lcom/xiaomi/push/ei;

.field public static final enum X:Lcom/xiaomi/push/ei;

.field public static final enum Y:Lcom/xiaomi/push/ei;

.field public static final enum Z:Lcom/xiaomi/push/ei;

.field public static final enum a:Lcom/xiaomi/push/ei;

.field private static final synthetic a:[Lcom/xiaomi/push/ei;

.field public static final enum aa:Lcom/xiaomi/push/ei;

.field public static final enum ab:Lcom/xiaomi/push/ei;

.field public static final enum ac:Lcom/xiaomi/push/ei;

.field public static final enum ad:Lcom/xiaomi/push/ei;

.field public static final enum ae:Lcom/xiaomi/push/ei;

.field public static final enum b:Lcom/xiaomi/push/ei;

.field public static final enum c:Lcom/xiaomi/push/ei;

.field public static final enum d:Lcom/xiaomi/push/ei;

.field public static final enum e:Lcom/xiaomi/push/ei;

.field public static final enum f:Lcom/xiaomi/push/ei;

.field public static final enum g:Lcom/xiaomi/push/ei;

.field public static final enum h:Lcom/xiaomi/push/ei;

.field public static final enum i:Lcom/xiaomi/push/ei;

.field public static final enum j:Lcom/xiaomi/push/ei;

.field public static final enum k:Lcom/xiaomi/push/ei;

.field public static final enum l:Lcom/xiaomi/push/ei;

.field public static final enum m:Lcom/xiaomi/push/ei;

.field public static final enum n:Lcom/xiaomi/push/ei;

.field public static final enum o:Lcom/xiaomi/push/ei;

.field public static final enum p:Lcom/xiaomi/push/ei;

.field public static final enum q:Lcom/xiaomi/push/ei;

.field public static final enum r:Lcom/xiaomi/push/ei;

.field public static final enum s:Lcom/xiaomi/push/ei;

.field public static final enum t:Lcom/xiaomi/push/ei;

.field public static final enum u:Lcom/xiaomi/push/ei;

.field public static final enum v:Lcom/xiaomi/push/ei;

.field public static final enum w:Lcom/xiaomi/push/ei;

.field public static final enum x:Lcom/xiaomi/push/ei;

.field public static final enum y:Lcom/xiaomi/push/ei;

.field public static final enum z:Lcom/xiaomi/push/ei;


# instance fields
.field private final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 60

    .line 1
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 2
    .line 3
    const-string v0, "TCP_CONN_FAIL"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v1, Lcom/xiaomi/push/ei;->a:Lcom/xiaomi/push/ei;

    .line 11
    .line 12
    new-instance v2, Lcom/xiaomi/push/ei;

    .line 13
    .line 14
    const-string v0, "TCP_CONN_TIME"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v2, v0, v3, v4}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lcom/xiaomi/push/ei;->b:Lcom/xiaomi/push/ei;

    .line 21
    .line 22
    new-instance v3, Lcom/xiaomi/push/ei;

    .line 23
    .line 24
    const-string v0, "PING_RTT"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v3, v0, v4, v5}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v3, Lcom/xiaomi/push/ei;->c:Lcom/xiaomi/push/ei;

    .line 31
    .line 32
    new-instance v4, Lcom/xiaomi/push/ei;

    .line 33
    .line 34
    const-string v0, "CHANNEL_CON_FAIL"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v4, v0, v5, v6}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v4, Lcom/xiaomi/push/ei;->d:Lcom/xiaomi/push/ei;

    .line 41
    .line 42
    new-instance v5, Lcom/xiaomi/push/ei;

    .line 43
    .line 44
    const-string v0, "CHANNEL_CON_OK"

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v5, v0, v6, v7}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v5, Lcom/xiaomi/push/ei;->e:Lcom/xiaomi/push/ei;

    .line 51
    .line 52
    new-instance v6, Lcom/xiaomi/push/ei;

    .line 53
    .line 54
    const-string v0, "ICMP_PING_FAIL"

    .line 55
    .line 56
    const/4 v8, 0x6

    .line 57
    invoke-direct {v6, v0, v7, v8}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v6, Lcom/xiaomi/push/ei;->f:Lcom/xiaomi/push/ei;

    .line 61
    .line 62
    new-instance v7, Lcom/xiaomi/push/ei;

    .line 63
    .line 64
    const-string v0, "ICMP_PING_OK"

    .line 65
    .line 66
    const/4 v9, 0x7

    .line 67
    invoke-direct {v7, v0, v8, v9}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v7, Lcom/xiaomi/push/ei;->g:Lcom/xiaomi/push/ei;

    .line 71
    .line 72
    new-instance v8, Lcom/xiaomi/push/ei;

    .line 73
    .line 74
    const-string v0, "CHANNEL_ONLINE_RATE"

    .line 75
    .line 76
    const/16 v10, 0x8

    .line 77
    .line 78
    invoke-direct {v8, v0, v9, v10}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v8, Lcom/xiaomi/push/ei;->h:Lcom/xiaomi/push/ei;

    .line 82
    .line 83
    new-instance v9, Lcom/xiaomi/push/ei;

    .line 84
    .line 85
    const-string v0, "BATCH_TCP_CONN_SUCCESS"

    .line 86
    .line 87
    const/16 v11, 0x3e8

    .line 88
    .line 89
    invoke-direct {v9, v0, v10, v11}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    sput-object v9, Lcom/xiaomi/push/ei;->i:Lcom/xiaomi/push/ei;

    .line 93
    .line 94
    new-instance v10, Lcom/xiaomi/push/ei;

    .line 95
    .line 96
    const/16 v0, 0x9

    .line 97
    .line 98
    const/16 v11, 0x3e9

    .line 99
    .line 100
    const-string v12, "BATCH_TCP_CONN_FAIL"

    .line 101
    .line 102
    invoke-direct {v10, v12, v0, v11}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 103
    .line 104
    .line 105
    sput-object v10, Lcom/xiaomi/push/ei;->j:Lcom/xiaomi/push/ei;

    .line 106
    .line 107
    new-instance v11, Lcom/xiaomi/push/ei;

    .line 108
    .line 109
    const/16 v0, 0xa

    .line 110
    .line 111
    const/16 v12, 0x1f40

    .line 112
    .line 113
    const-string v13, "CHANNEL_STATS_COUNTER"

    .line 114
    .line 115
    invoke-direct {v11, v13, v0, v12}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 116
    .line 117
    .line 118
    sput-object v11, Lcom/xiaomi/push/ei;->k:Lcom/xiaomi/push/ei;

    .line 119
    .line 120
    new-instance v12, Lcom/xiaomi/push/ei;

    .line 121
    .line 122
    const/16 v0, 0xb

    .line 123
    .line 124
    const/16 v13, 0x2710

    .line 125
    .line 126
    const-string v14, "GSLB_REQUEST_SUCCESS"

    .line 127
    .line 128
    invoke-direct {v12, v14, v0, v13}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 129
    .line 130
    .line 131
    sput-object v12, Lcom/xiaomi/push/ei;->l:Lcom/xiaomi/push/ei;

    .line 132
    .line 133
    new-instance v13, Lcom/xiaomi/push/ei;

    .line 134
    .line 135
    const/16 v0, 0xc

    .line 136
    .line 137
    const/16 v14, 0x2775

    .line 138
    .line 139
    const-string v15, "GSLB_TCP_NOACCESS"

    .line 140
    .line 141
    invoke-direct {v13, v15, v0, v14}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 142
    .line 143
    .line 144
    sput-object v13, Lcom/xiaomi/push/ei;->m:Lcom/xiaomi/push/ei;

    .line 145
    .line 146
    new-instance v14, Lcom/xiaomi/push/ei;

    .line 147
    .line 148
    const/16 v0, 0xd

    .line 149
    .line 150
    const/16 v15, 0x2776

    .line 151
    .line 152
    move-object/from16 v16, v1

    .line 153
    .line 154
    const-string v1, "GSLB_TCP_NETUNREACH"

    .line 155
    .line 156
    invoke-direct {v14, v1, v0, v15}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 157
    .line 158
    .line 159
    sput-object v14, Lcom/xiaomi/push/ei;->n:Lcom/xiaomi/push/ei;

    .line 160
    .line 161
    new-instance v15, Lcom/xiaomi/push/ei;

    .line 162
    .line 163
    const/16 v0, 0xe

    .line 164
    .line 165
    const/16 v1, 0x2777

    .line 166
    .line 167
    move-object/from16 v17, v2

    .line 168
    .line 169
    const-string v2, "GSLB_TCP_CONNREFUSED"

    .line 170
    .line 171
    invoke-direct {v15, v2, v0, v1}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 172
    .line 173
    .line 174
    sput-object v15, Lcom/xiaomi/push/ei;->o:Lcom/xiaomi/push/ei;

    .line 175
    .line 176
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 177
    .line 178
    const/16 v1, 0xf

    .line 179
    .line 180
    const/16 v2, 0x2778

    .line 181
    .line 182
    move-object/from16 v18, v3

    .line 183
    .line 184
    const-string v3, "GSLB_TCP_NOROUTETOHOST"

    .line 185
    .line 186
    invoke-direct {v0, v3, v1, v2}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 187
    .line 188
    .line 189
    sput-object v0, Lcom/xiaomi/push/ei;->p:Lcom/xiaomi/push/ei;

    .line 190
    .line 191
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 192
    .line 193
    const/16 v2, 0x10

    .line 194
    .line 195
    const/16 v3, 0x2779

    .line 196
    .line 197
    move-object/from16 v19, v0

    .line 198
    .line 199
    const-string v0, "GSLB_TCP_TIMEOUT"

    .line 200
    .line 201
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 202
    .line 203
    .line 204
    sput-object v1, Lcom/xiaomi/push/ei;->q:Lcom/xiaomi/push/ei;

    .line 205
    .line 206
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 207
    .line 208
    const/16 v2, 0x11

    .line 209
    .line 210
    const/16 v3, 0x277a

    .line 211
    .line 212
    move-object/from16 v20, v1

    .line 213
    .line 214
    const-string v1, "GSLB_TCP_INVALARG"

    .line 215
    .line 216
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 217
    .line 218
    .line 219
    sput-object v0, Lcom/xiaomi/push/ei;->r:Lcom/xiaomi/push/ei;

    .line 220
    .line 221
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 222
    .line 223
    const/16 v2, 0x12

    .line 224
    .line 225
    const/16 v3, 0x277b

    .line 226
    .line 227
    move-object/from16 v21, v0

    .line 228
    .line 229
    const-string v0, "GSLB_TCP_UKNOWNHOST"

    .line 230
    .line 231
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 232
    .line 233
    .line 234
    sput-object v1, Lcom/xiaomi/push/ei;->s:Lcom/xiaomi/push/ei;

    .line 235
    .line 236
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 237
    .line 238
    const/16 v2, 0x13

    .line 239
    .line 240
    const/16 v3, 0x27d7

    .line 241
    .line 242
    move-object/from16 v22, v1

    .line 243
    .line 244
    const-string v1, "GSLB_TCP_ERR_OTHER"

    .line 245
    .line 246
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 247
    .line 248
    .line 249
    sput-object v0, Lcom/xiaomi/push/ei;->t:Lcom/xiaomi/push/ei;

    .line 250
    .line 251
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 252
    .line 253
    const/16 v2, 0x14

    .line 254
    .line 255
    const/16 v3, 0x2af7

    .line 256
    .line 257
    move-object/from16 v23, v0

    .line 258
    .line 259
    const-string v0, "GSLB_ERR"

    .line 260
    .line 261
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 262
    .line 263
    .line 264
    sput-object v1, Lcom/xiaomi/push/ei;->u:Lcom/xiaomi/push/ei;

    .line 265
    .line 266
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 267
    .line 268
    const/16 v2, 0x15

    .line 269
    .line 270
    const/16 v3, 0x4e20

    .line 271
    .line 272
    move-object/from16 v24, v1

    .line 273
    .line 274
    const-string v1, "CONN_SUCCESS"

    .line 275
    .line 276
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 277
    .line 278
    .line 279
    sput-object v0, Lcom/xiaomi/push/ei;->v:Lcom/xiaomi/push/ei;

    .line 280
    .line 281
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 282
    .line 283
    const/16 v2, 0x16

    .line 284
    .line 285
    const/16 v3, 0x4e85

    .line 286
    .line 287
    move-object/from16 v25, v0

    .line 288
    .line 289
    const-string v0, "CONN_TCP_NOACCESS"

    .line 290
    .line 291
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 292
    .line 293
    .line 294
    sput-object v1, Lcom/xiaomi/push/ei;->w:Lcom/xiaomi/push/ei;

    .line 295
    .line 296
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 297
    .line 298
    const/16 v2, 0x17

    .line 299
    .line 300
    const/16 v3, 0x4e86

    .line 301
    .line 302
    move-object/from16 v26, v1

    .line 303
    .line 304
    const-string v1, "CONN_TCP_NETUNREACH"

    .line 305
    .line 306
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 307
    .line 308
    .line 309
    sput-object v0, Lcom/xiaomi/push/ei;->x:Lcom/xiaomi/push/ei;

    .line 310
    .line 311
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 312
    .line 313
    const/16 v2, 0x18

    .line 314
    .line 315
    const/16 v3, 0x4e87

    .line 316
    .line 317
    move-object/from16 v27, v0

    .line 318
    .line 319
    const-string v0, "CONN_TCP_CONNREFUSED"

    .line 320
    .line 321
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 322
    .line 323
    .line 324
    sput-object v1, Lcom/xiaomi/push/ei;->y:Lcom/xiaomi/push/ei;

    .line 325
    .line 326
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 327
    .line 328
    const/16 v2, 0x19

    .line 329
    .line 330
    const/16 v3, 0x4e88

    .line 331
    .line 332
    move-object/from16 v28, v1

    .line 333
    .line 334
    const-string v1, "CONN_TCP_NOROUTETOHOST"

    .line 335
    .line 336
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 337
    .line 338
    .line 339
    sput-object v0, Lcom/xiaomi/push/ei;->z:Lcom/xiaomi/push/ei;

    .line 340
    .line 341
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 342
    .line 343
    const/16 v2, 0x1a

    .line 344
    .line 345
    const/16 v3, 0x4e89

    .line 346
    .line 347
    move-object/from16 v29, v0

    .line 348
    .line 349
    const-string v0, "CONN_TCP_TIMEOUT"

    .line 350
    .line 351
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 352
    .line 353
    .line 354
    sput-object v1, Lcom/xiaomi/push/ei;->A:Lcom/xiaomi/push/ei;

    .line 355
    .line 356
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 357
    .line 358
    const/16 v2, 0x1b

    .line 359
    .line 360
    const/16 v3, 0x4e8a

    .line 361
    .line 362
    move-object/from16 v30, v1

    .line 363
    .line 364
    const-string v1, "CONN_TCP_INVALARG"

    .line 365
    .line 366
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 367
    .line 368
    .line 369
    sput-object v0, Lcom/xiaomi/push/ei;->B:Lcom/xiaomi/push/ei;

    .line 370
    .line 371
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 372
    .line 373
    const/16 v2, 0x1c

    .line 374
    .line 375
    const/16 v3, 0x4e8b

    .line 376
    .line 377
    move-object/from16 v31, v0

    .line 378
    .line 379
    const-string v0, "CONN_TCP_UKNOWNHOST"

    .line 380
    .line 381
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 382
    .line 383
    .line 384
    sput-object v1, Lcom/xiaomi/push/ei;->C:Lcom/xiaomi/push/ei;

    .line 385
    .line 386
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 387
    .line 388
    const/16 v2, 0x1d

    .line 389
    .line 390
    const/16 v3, 0x4ee7

    .line 391
    .line 392
    move-object/from16 v32, v1

    .line 393
    .line 394
    const-string v1, "CONN_TCP_ERR_OTHER"

    .line 395
    .line 396
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 397
    .line 398
    .line 399
    sput-object v0, Lcom/xiaomi/push/ei;->D:Lcom/xiaomi/push/ei;

    .line 400
    .line 401
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 402
    .line 403
    const/16 v2, 0x1e

    .line 404
    .line 405
    const/16 v3, 0x4faf

    .line 406
    .line 407
    move-object/from16 v33, v0

    .line 408
    .line 409
    const-string v0, "CONN_XMPP_ERR"

    .line 410
    .line 411
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 412
    .line 413
    .line 414
    sput-object v1, Lcom/xiaomi/push/ei;->E:Lcom/xiaomi/push/ei;

    .line 415
    .line 416
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 417
    .line 418
    const/16 v2, 0x1f

    .line 419
    .line 420
    const/16 v3, 0x4fb7

    .line 421
    .line 422
    move-object/from16 v34, v1

    .line 423
    .line 424
    const-string v1, "CONN_BOSH_UNKNOWNHOST"

    .line 425
    .line 426
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 427
    .line 428
    .line 429
    sput-object v0, Lcom/xiaomi/push/ei;->F:Lcom/xiaomi/push/ei;

    .line 430
    .line 431
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 432
    .line 433
    const/16 v2, 0x20

    .line 434
    .line 435
    const/16 v3, 0x5013

    .line 436
    .line 437
    move-object/from16 v35, v0

    .line 438
    .line 439
    const-string v0, "CONN_BOSH_ERR"

    .line 440
    .line 441
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 442
    .line 443
    .line 444
    sput-object v1, Lcom/xiaomi/push/ei;->G:Lcom/xiaomi/push/ei;

    .line 445
    .line 446
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 447
    .line 448
    const/16 v2, 0x21

    .line 449
    .line 450
    const/16 v3, 0x7530

    .line 451
    .line 452
    move-object/from16 v36, v1

    .line 453
    .line 454
    const-string v1, "BIND_SUCCESS"

    .line 455
    .line 456
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 457
    .line 458
    .line 459
    sput-object v0, Lcom/xiaomi/push/ei;->H:Lcom/xiaomi/push/ei;

    .line 460
    .line 461
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 462
    .line 463
    const/16 v2, 0x22

    .line 464
    .line 465
    const/16 v3, 0x7595

    .line 466
    .line 467
    move-object/from16 v37, v0

    .line 468
    .line 469
    const-string v0, "BIND_TCP_READ_TIMEOUT_DEPRECTED"

    .line 470
    .line 471
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 472
    .line 473
    .line 474
    sput-object v1, Lcom/xiaomi/push/ei;->I:Lcom/xiaomi/push/ei;

    .line 475
    .line 476
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 477
    .line 478
    const/16 v2, 0x23

    .line 479
    .line 480
    const/16 v3, 0x7596

    .line 481
    .line 482
    move-object/from16 v38, v1

    .line 483
    .line 484
    const-string v1, "BIND_TCP_CONNRESET_DEPRECTED"

    .line 485
    .line 486
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 487
    .line 488
    .line 489
    sput-object v0, Lcom/xiaomi/push/ei;->J:Lcom/xiaomi/push/ei;

    .line 490
    .line 491
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 492
    .line 493
    const/16 v2, 0x24

    .line 494
    .line 495
    const/16 v3, 0x7597

    .line 496
    .line 497
    move-object/from16 v39, v0

    .line 498
    .line 499
    const-string v0, "BIND_TCP_BROKEN_PIPE_DEPRECTED"

    .line 500
    .line 501
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 502
    .line 503
    .line 504
    sput-object v1, Lcom/xiaomi/push/ei;->K:Lcom/xiaomi/push/ei;

    .line 505
    .line 506
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 507
    .line 508
    const/16 v2, 0x25

    .line 509
    .line 510
    const/16 v3, 0x759c

    .line 511
    .line 512
    move-object/from16 v40, v1

    .line 513
    .line 514
    const-string v1, "BIND_TCP_READ_TIMEOUT"

    .line 515
    .line 516
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 517
    .line 518
    .line 519
    sput-object v0, Lcom/xiaomi/push/ei;->L:Lcom/xiaomi/push/ei;

    .line 520
    .line 521
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 522
    .line 523
    const/16 v2, 0x26

    .line 524
    .line 525
    const/16 v3, 0x759d

    .line 526
    .line 527
    move-object/from16 v41, v0

    .line 528
    .line 529
    const-string v0, "BIND_TCP_CONNRESET"

    .line 530
    .line 531
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 532
    .line 533
    .line 534
    sput-object v1, Lcom/xiaomi/push/ei;->M:Lcom/xiaomi/push/ei;

    .line 535
    .line 536
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 537
    .line 538
    const/16 v2, 0x27

    .line 539
    .line 540
    const/16 v3, 0x759e

    .line 541
    .line 542
    move-object/from16 v42, v1

    .line 543
    .line 544
    const-string v1, "BIND_TCP_BROKEN_PIPE"

    .line 545
    .line 546
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 547
    .line 548
    .line 549
    sput-object v0, Lcom/xiaomi/push/ei;->N:Lcom/xiaomi/push/ei;

    .line 550
    .line 551
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 552
    .line 553
    const/16 v2, 0x28

    .line 554
    .line 555
    const/16 v3, 0x75f7

    .line 556
    .line 557
    move-object/from16 v43, v0

    .line 558
    .line 559
    const-string v0, "BIND_TCP_ERR"

    .line 560
    .line 561
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 562
    .line 563
    .line 564
    sput-object v1, Lcom/xiaomi/push/ei;->O:Lcom/xiaomi/push/ei;

    .line 565
    .line 566
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 567
    .line 568
    const/16 v2, 0x29

    .line 569
    .line 570
    const/16 v3, 0x76bf

    .line 571
    .line 572
    move-object/from16 v44, v1

    .line 573
    .line 574
    const-string v1, "BIND_XMPP_ERR"

    .line 575
    .line 576
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 577
    .line 578
    .line 579
    sput-object v0, Lcom/xiaomi/push/ei;->P:Lcom/xiaomi/push/ei;

    .line 580
    .line 581
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 582
    .line 583
    const/16 v2, 0x2a

    .line 584
    .line 585
    const/16 v3, 0x76c1

    .line 586
    .line 587
    move-object/from16 v45, v0

    .line 588
    .line 589
    const-string v0, "BIND_BOSH_ITEM_NOT_FOUND"

    .line 590
    .line 591
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 592
    .line 593
    .line 594
    sput-object v1, Lcom/xiaomi/push/ei;->Q:Lcom/xiaomi/push/ei;

    .line 595
    .line 596
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 597
    .line 598
    const/16 v2, 0x2b

    .line 599
    .line 600
    const/16 v3, 0x7723

    .line 601
    .line 602
    move-object/from16 v46, v1

    .line 603
    .line 604
    const-string v1, "BIND_BOSH_ERR"

    .line 605
    .line 606
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 607
    .line 608
    .line 609
    sput-object v0, Lcom/xiaomi/push/ei;->R:Lcom/xiaomi/push/ei;

    .line 610
    .line 611
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 612
    .line 613
    const/16 v2, 0x2c

    .line 614
    .line 615
    const/16 v3, 0x7725

    .line 616
    .line 617
    move-object/from16 v47, v0

    .line 618
    .line 619
    const-string v0, "BIND_TIMEOUT"

    .line 620
    .line 621
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 622
    .line 623
    .line 624
    sput-object v1, Lcom/xiaomi/push/ei;->S:Lcom/xiaomi/push/ei;

    .line 625
    .line 626
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 627
    .line 628
    const/16 v2, 0x2d

    .line 629
    .line 630
    const/16 v3, 0x7726

    .line 631
    .line 632
    move-object/from16 v48, v1

    .line 633
    .line 634
    const-string v1, "BIND_INVALID_SIG"

    .line 635
    .line 636
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 637
    .line 638
    .line 639
    sput-object v0, Lcom/xiaomi/push/ei;->T:Lcom/xiaomi/push/ei;

    .line 640
    .line 641
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 642
    .line 643
    const/16 v2, 0x2e

    .line 644
    .line 645
    const v3, 0x9ca5

    .line 646
    .line 647
    .line 648
    move-object/from16 v49, v0

    .line 649
    .line 650
    const-string v0, "CHANNEL_TCP_READTIMEOUT_DEPRECTED"

    .line 651
    .line 652
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 653
    .line 654
    .line 655
    sput-object v1, Lcom/xiaomi/push/ei;->U:Lcom/xiaomi/push/ei;

    .line 656
    .line 657
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 658
    .line 659
    const/16 v2, 0x2f

    .line 660
    .line 661
    const v3, 0x9ca6

    .line 662
    .line 663
    .line 664
    move-object/from16 v50, v1

    .line 665
    .line 666
    const-string v1, "CHANNEL_TCP_CONNRESET_DEPRECTED"

    .line 667
    .line 668
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 669
    .line 670
    .line 671
    sput-object v0, Lcom/xiaomi/push/ei;->V:Lcom/xiaomi/push/ei;

    .line 672
    .line 673
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 674
    .line 675
    const/16 v2, 0x30

    .line 676
    .line 677
    const v3, 0x9ca7

    .line 678
    .line 679
    .line 680
    move-object/from16 v51, v0

    .line 681
    .line 682
    const-string v0, "CHANNEL_TCP_BROKEN_PIPE_DEPRECTED"

    .line 683
    .line 684
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 685
    .line 686
    .line 687
    sput-object v1, Lcom/xiaomi/push/ei;->W:Lcom/xiaomi/push/ei;

    .line 688
    .line 689
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 690
    .line 691
    const/16 v2, 0x31

    .line 692
    .line 693
    const v3, 0x9cac

    .line 694
    .line 695
    .line 696
    move-object/from16 v52, v1

    .line 697
    .line 698
    const-string v1, "CHANNEL_TCP_READTIMEOUT"

    .line 699
    .line 700
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 701
    .line 702
    .line 703
    sput-object v0, Lcom/xiaomi/push/ei;->X:Lcom/xiaomi/push/ei;

    .line 704
    .line 705
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 706
    .line 707
    const/16 v2, 0x32

    .line 708
    .line 709
    const v3, 0x9cad

    .line 710
    .line 711
    .line 712
    move-object/from16 v53, v0

    .line 713
    .line 714
    const-string v0, "CHANNEL_TCP_CONNRESET"

    .line 715
    .line 716
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 717
    .line 718
    .line 719
    sput-object v1, Lcom/xiaomi/push/ei;->Y:Lcom/xiaomi/push/ei;

    .line 720
    .line 721
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 722
    .line 723
    const/16 v2, 0x33

    .line 724
    .line 725
    const v3, 0x9cae

    .line 726
    .line 727
    .line 728
    move-object/from16 v54, v1

    .line 729
    .line 730
    const-string v1, "CHANNEL_TCP_BROKEN_PIPE"

    .line 731
    .line 732
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 733
    .line 734
    .line 735
    sput-object v0, Lcom/xiaomi/push/ei;->Z:Lcom/xiaomi/push/ei;

    .line 736
    .line 737
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 738
    .line 739
    const/16 v2, 0x34

    .line 740
    .line 741
    const v3, 0x9d07

    .line 742
    .line 743
    .line 744
    move-object/from16 v55, v0

    .line 745
    .line 746
    const-string v0, "CHANNEL_TCP_ERR"

    .line 747
    .line 748
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 749
    .line 750
    .line 751
    sput-object v1, Lcom/xiaomi/push/ei;->aa:Lcom/xiaomi/push/ei;

    .line 752
    .line 753
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 754
    .line 755
    const/16 v2, 0x35

    .line 756
    .line 757
    const v3, 0x9dcf

    .line 758
    .line 759
    .line 760
    move-object/from16 v56, v1

    .line 761
    .line 762
    const-string v1, "CHANNEL_XMPPEXCEPTION"

    .line 763
    .line 764
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 765
    .line 766
    .line 767
    sput-object v0, Lcom/xiaomi/push/ei;->ab:Lcom/xiaomi/push/ei;

    .line 768
    .line 769
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 770
    .line 771
    const/16 v2, 0x36

    .line 772
    .line 773
    const v3, 0x9dd1

    .line 774
    .line 775
    .line 776
    move-object/from16 v57, v0

    .line 777
    .line 778
    const-string v0, "CHANNEL_BOSH_ITEMNOTFIND"

    .line 779
    .line 780
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 781
    .line 782
    .line 783
    sput-object v1, Lcom/xiaomi/push/ei;->ac:Lcom/xiaomi/push/ei;

    .line 784
    .line 785
    new-instance v0, Lcom/xiaomi/push/ei;

    .line 786
    .line 787
    const/16 v2, 0x37

    .line 788
    .line 789
    const v3, 0x9e33

    .line 790
    .line 791
    .line 792
    move-object/from16 v58, v1

    .line 793
    .line 794
    const-string v1, "CHANNEL_BOSH_EXCEPTION"

    .line 795
    .line 796
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 797
    .line 798
    .line 799
    sput-object v0, Lcom/xiaomi/push/ei;->ad:Lcom/xiaomi/push/ei;

    .line 800
    .line 801
    new-instance v1, Lcom/xiaomi/push/ei;

    .line 802
    .line 803
    const/16 v2, 0x38

    .line 804
    .line 805
    const v3, 0xc351

    .line 806
    .line 807
    .line 808
    move-object/from16 v59, v0

    .line 809
    .line 810
    const-string v0, "CHANNEL_TIMER_DELAYED"

    .line 811
    .line 812
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/ei;-><init>(Ljava/lang/String;II)V

    .line 813
    .line 814
    .line 815
    sput-object v1, Lcom/xiaomi/push/ei;->ae:Lcom/xiaomi/push/ei;

    .line 816
    .line 817
    move-object/from16 v2, v17

    .line 818
    .line 819
    move-object/from16 v3, v18

    .line 820
    .line 821
    move-object/from16 v17, v20

    .line 822
    .line 823
    move-object/from16 v18, v21

    .line 824
    .line 825
    move-object/from16 v20, v23

    .line 826
    .line 827
    move-object/from16 v21, v24

    .line 828
    .line 829
    move-object/from16 v23, v26

    .line 830
    .line 831
    move-object/from16 v24, v27

    .line 832
    .line 833
    move-object/from16 v26, v29

    .line 834
    .line 835
    move-object/from16 v27, v30

    .line 836
    .line 837
    move-object/from16 v29, v32

    .line 838
    .line 839
    move-object/from16 v30, v33

    .line 840
    .line 841
    move-object/from16 v32, v35

    .line 842
    .line 843
    move-object/from16 v33, v36

    .line 844
    .line 845
    move-object/from16 v35, v38

    .line 846
    .line 847
    move-object/from16 v36, v39

    .line 848
    .line 849
    move-object/from16 v38, v41

    .line 850
    .line 851
    move-object/from16 v39, v42

    .line 852
    .line 853
    move-object/from16 v41, v44

    .line 854
    .line 855
    move-object/from16 v42, v45

    .line 856
    .line 857
    move-object/from16 v44, v47

    .line 858
    .line 859
    move-object/from16 v45, v48

    .line 860
    .line 861
    move-object/from16 v47, v50

    .line 862
    .line 863
    move-object/from16 v48, v51

    .line 864
    .line 865
    move-object/from16 v50, v53

    .line 866
    .line 867
    move-object/from16 v51, v54

    .line 868
    .line 869
    move-object/from16 v53, v56

    .line 870
    .line 871
    move-object/from16 v54, v57

    .line 872
    .line 873
    move-object/from16 v56, v59

    .line 874
    .line 875
    move-object/from16 v57, v1

    .line 876
    .line 877
    move-object/from16 v1, v16

    .line 878
    .line 879
    move-object/from16 v16, v19

    .line 880
    .line 881
    move-object/from16 v19, v22

    .line 882
    .line 883
    move-object/from16 v22, v25

    .line 884
    .line 885
    move-object/from16 v25, v28

    .line 886
    .line 887
    move-object/from16 v28, v31

    .line 888
    .line 889
    move-object/from16 v31, v34

    .line 890
    .line 891
    move-object/from16 v34, v37

    .line 892
    .line 893
    move-object/from16 v37, v40

    .line 894
    .line 895
    move-object/from16 v40, v43

    .line 896
    .line 897
    move-object/from16 v43, v46

    .line 898
    .line 899
    move-object/from16 v46, v49

    .line 900
    .line 901
    move-object/from16 v49, v52

    .line 902
    .line 903
    move-object/from16 v52, v55

    .line 904
    .line 905
    move-object/from16 v55, v58

    .line 906
    .line 907
    filled-new-array/range {v1 .. v57}, [Lcom/xiaomi/push/ei;

    .line 908
    .line 909
    .line 910
    move-result-object v0

    .line 911
    sput-object v0, Lcom/xiaomi/push/ei;->a:[Lcom/xiaomi/push/ei;

    .line 912
    .line 913
    return-void
.end method

.method private constructor <init>(Ljava/lang/String;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Ljava/lang/Enum;-><init>(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    iput p3, p0, Lcom/xiaomi/push/ei;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static a(I)Lcom/xiaomi/push/ei;
    .locals 1

    .line 1
    const/16 v0, 0x7725

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x7726

    .line 6
    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    packed-switch p0, :pswitch_data_0

    .line 10
    .line 11
    .line 12
    sparse-switch p0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    packed-switch p0, :pswitch_data_1

    .line 16
    .line 17
    .line 18
    packed-switch p0, :pswitch_data_2

    .line 19
    .line 20
    .line 21
    packed-switch p0, :pswitch_data_3

    .line 22
    .line 23
    .line 24
    packed-switch p0, :pswitch_data_4

    .line 25
    .line 26
    .line 27
    packed-switch p0, :pswitch_data_5

    .line 28
    .line 29
    .line 30
    packed-switch p0, :pswitch_data_6

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    return-object p0

    .line 35
    :pswitch_0
    sget-object p0, Lcom/xiaomi/push/ei;->Z:Lcom/xiaomi/push/ei;

    .line 36
    .line 37
    return-object p0

    .line 38
    :pswitch_1
    sget-object p0, Lcom/xiaomi/push/ei;->Y:Lcom/xiaomi/push/ei;

    .line 39
    .line 40
    return-object p0

    .line 41
    :pswitch_2
    sget-object p0, Lcom/xiaomi/push/ei;->X:Lcom/xiaomi/push/ei;

    .line 42
    .line 43
    return-object p0

    .line 44
    :pswitch_3
    sget-object p0, Lcom/xiaomi/push/ei;->W:Lcom/xiaomi/push/ei;

    .line 45
    .line 46
    return-object p0

    .line 47
    :pswitch_4
    sget-object p0, Lcom/xiaomi/push/ei;->V:Lcom/xiaomi/push/ei;

    .line 48
    .line 49
    return-object p0

    .line 50
    :pswitch_5
    sget-object p0, Lcom/xiaomi/push/ei;->U:Lcom/xiaomi/push/ei;

    .line 51
    .line 52
    return-object p0

    .line 53
    :pswitch_6
    sget-object p0, Lcom/xiaomi/push/ei;->N:Lcom/xiaomi/push/ei;

    .line 54
    .line 55
    return-object p0

    .line 56
    :pswitch_7
    sget-object p0, Lcom/xiaomi/push/ei;->M:Lcom/xiaomi/push/ei;

    .line 57
    .line 58
    return-object p0

    .line 59
    :pswitch_8
    sget-object p0, Lcom/xiaomi/push/ei;->L:Lcom/xiaomi/push/ei;

    .line 60
    .line 61
    return-object p0

    .line 62
    :pswitch_9
    sget-object p0, Lcom/xiaomi/push/ei;->K:Lcom/xiaomi/push/ei;

    .line 63
    .line 64
    return-object p0

    .line 65
    :pswitch_a
    sget-object p0, Lcom/xiaomi/push/ei;->J:Lcom/xiaomi/push/ei;

    .line 66
    .line 67
    return-object p0

    .line 68
    :pswitch_b
    sget-object p0, Lcom/xiaomi/push/ei;->I:Lcom/xiaomi/push/ei;

    .line 69
    .line 70
    return-object p0

    .line 71
    :pswitch_c
    sget-object p0, Lcom/xiaomi/push/ei;->C:Lcom/xiaomi/push/ei;

    .line 72
    .line 73
    return-object p0

    .line 74
    :pswitch_d
    sget-object p0, Lcom/xiaomi/push/ei;->B:Lcom/xiaomi/push/ei;

    .line 75
    .line 76
    return-object p0

    .line 77
    :pswitch_e
    sget-object p0, Lcom/xiaomi/push/ei;->A:Lcom/xiaomi/push/ei;

    .line 78
    .line 79
    return-object p0

    .line 80
    :pswitch_f
    sget-object p0, Lcom/xiaomi/push/ei;->z:Lcom/xiaomi/push/ei;

    .line 81
    .line 82
    return-object p0

    .line 83
    :pswitch_10
    sget-object p0, Lcom/xiaomi/push/ei;->y:Lcom/xiaomi/push/ei;

    .line 84
    .line 85
    return-object p0

    .line 86
    :pswitch_11
    sget-object p0, Lcom/xiaomi/push/ei;->x:Lcom/xiaomi/push/ei;

    .line 87
    .line 88
    return-object p0

    .line 89
    :pswitch_12
    sget-object p0, Lcom/xiaomi/push/ei;->w:Lcom/xiaomi/push/ei;

    .line 90
    .line 91
    return-object p0

    .line 92
    :pswitch_13
    sget-object p0, Lcom/xiaomi/push/ei;->s:Lcom/xiaomi/push/ei;

    .line 93
    .line 94
    return-object p0

    .line 95
    :pswitch_14
    sget-object p0, Lcom/xiaomi/push/ei;->r:Lcom/xiaomi/push/ei;

    .line 96
    .line 97
    return-object p0

    .line 98
    :pswitch_15
    sget-object p0, Lcom/xiaomi/push/ei;->q:Lcom/xiaomi/push/ei;

    .line 99
    .line 100
    return-object p0

    .line 101
    :pswitch_16
    sget-object p0, Lcom/xiaomi/push/ei;->p:Lcom/xiaomi/push/ei;

    .line 102
    .line 103
    return-object p0

    .line 104
    :pswitch_17
    sget-object p0, Lcom/xiaomi/push/ei;->o:Lcom/xiaomi/push/ei;

    .line 105
    .line 106
    return-object p0

    .line 107
    :pswitch_18
    sget-object p0, Lcom/xiaomi/push/ei;->n:Lcom/xiaomi/push/ei;

    .line 108
    .line 109
    return-object p0

    .line 110
    :pswitch_19
    sget-object p0, Lcom/xiaomi/push/ei;->m:Lcom/xiaomi/push/ei;

    .line 111
    .line 112
    return-object p0

    .line 113
    :sswitch_0
    sget-object p0, Lcom/xiaomi/push/ei;->ae:Lcom/xiaomi/push/ei;

    .line 114
    .line 115
    return-object p0

    .line 116
    :sswitch_1
    sget-object p0, Lcom/xiaomi/push/ei;->ad:Lcom/xiaomi/push/ei;

    .line 117
    .line 118
    return-object p0

    .line 119
    :sswitch_2
    sget-object p0, Lcom/xiaomi/push/ei;->ac:Lcom/xiaomi/push/ei;

    .line 120
    .line 121
    return-object p0

    .line 122
    :sswitch_3
    sget-object p0, Lcom/xiaomi/push/ei;->ab:Lcom/xiaomi/push/ei;

    .line 123
    .line 124
    return-object p0

    .line 125
    :sswitch_4
    sget-object p0, Lcom/xiaomi/push/ei;->aa:Lcom/xiaomi/push/ei;

    .line 126
    .line 127
    return-object p0

    .line 128
    :sswitch_5
    sget-object p0, Lcom/xiaomi/push/ei;->R:Lcom/xiaomi/push/ei;

    .line 129
    .line 130
    return-object p0

    .line 131
    :sswitch_6
    sget-object p0, Lcom/xiaomi/push/ei;->Q:Lcom/xiaomi/push/ei;

    .line 132
    .line 133
    return-object p0

    .line 134
    :sswitch_7
    sget-object p0, Lcom/xiaomi/push/ei;->P:Lcom/xiaomi/push/ei;

    .line 135
    .line 136
    return-object p0

    .line 137
    :sswitch_8
    sget-object p0, Lcom/xiaomi/push/ei;->O:Lcom/xiaomi/push/ei;

    .line 138
    .line 139
    return-object p0

    .line 140
    :sswitch_9
    sget-object p0, Lcom/xiaomi/push/ei;->H:Lcom/xiaomi/push/ei;

    .line 141
    .line 142
    return-object p0

    .line 143
    :sswitch_a
    sget-object p0, Lcom/xiaomi/push/ei;->G:Lcom/xiaomi/push/ei;

    .line 144
    .line 145
    return-object p0

    .line 146
    :sswitch_b
    sget-object p0, Lcom/xiaomi/push/ei;->F:Lcom/xiaomi/push/ei;

    .line 147
    .line 148
    return-object p0

    .line 149
    :sswitch_c
    sget-object p0, Lcom/xiaomi/push/ei;->E:Lcom/xiaomi/push/ei;

    .line 150
    .line 151
    return-object p0

    .line 152
    :sswitch_d
    sget-object p0, Lcom/xiaomi/push/ei;->D:Lcom/xiaomi/push/ei;

    .line 153
    .line 154
    return-object p0

    .line 155
    :sswitch_e
    sget-object p0, Lcom/xiaomi/push/ei;->v:Lcom/xiaomi/push/ei;

    .line 156
    .line 157
    return-object p0

    .line 158
    :sswitch_f
    sget-object p0, Lcom/xiaomi/push/ei;->u:Lcom/xiaomi/push/ei;

    .line 159
    .line 160
    return-object p0

    .line 161
    :sswitch_10
    sget-object p0, Lcom/xiaomi/push/ei;->t:Lcom/xiaomi/push/ei;

    .line 162
    .line 163
    return-object p0

    .line 164
    :sswitch_11
    sget-object p0, Lcom/xiaomi/push/ei;->l:Lcom/xiaomi/push/ei;

    .line 165
    .line 166
    return-object p0

    .line 167
    :sswitch_12
    sget-object p0, Lcom/xiaomi/push/ei;->k:Lcom/xiaomi/push/ei;

    .line 168
    .line 169
    return-object p0

    .line 170
    :pswitch_1a
    sget-object p0, Lcom/xiaomi/push/ei;->h:Lcom/xiaomi/push/ei;

    .line 171
    .line 172
    return-object p0

    .line 173
    :pswitch_1b
    sget-object p0, Lcom/xiaomi/push/ei;->g:Lcom/xiaomi/push/ei;

    .line 174
    .line 175
    return-object p0

    .line 176
    :pswitch_1c
    sget-object p0, Lcom/xiaomi/push/ei;->f:Lcom/xiaomi/push/ei;

    .line 177
    .line 178
    return-object p0

    .line 179
    :pswitch_1d
    sget-object p0, Lcom/xiaomi/push/ei;->e:Lcom/xiaomi/push/ei;

    .line 180
    .line 181
    return-object p0

    .line 182
    :pswitch_1e
    sget-object p0, Lcom/xiaomi/push/ei;->d:Lcom/xiaomi/push/ei;

    .line 183
    .line 184
    return-object p0

    .line 185
    :pswitch_1f
    sget-object p0, Lcom/xiaomi/push/ei;->c:Lcom/xiaomi/push/ei;

    .line 186
    .line 187
    return-object p0

    .line 188
    :pswitch_20
    sget-object p0, Lcom/xiaomi/push/ei;->b:Lcom/xiaomi/push/ei;

    .line 189
    .line 190
    return-object p0

    .line 191
    :pswitch_21
    sget-object p0, Lcom/xiaomi/push/ei;->a:Lcom/xiaomi/push/ei;

    .line 192
    .line 193
    return-object p0

    .line 194
    :cond_0
    sget-object p0, Lcom/xiaomi/push/ei;->T:Lcom/xiaomi/push/ei;

    .line 195
    .line 196
    return-object p0

    .line 197
    :cond_1
    sget-object p0, Lcom/xiaomi/push/ei;->S:Lcom/xiaomi/push/ei;

    .line 198
    .line 199
    return-object p0

    .line 200
    nop

    .line 201
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
    .end packed-switch

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
    :sswitch_data_0
    .sparse-switch
        0x1f40 -> :sswitch_12
        0x2710 -> :sswitch_11
        0x27d7 -> :sswitch_10
        0x2af7 -> :sswitch_f
        0x4e20 -> :sswitch_e
        0x4ee7 -> :sswitch_d
        0x4faf -> :sswitch_c
        0x4fb7 -> :sswitch_b
        0x5013 -> :sswitch_a
        0x7530 -> :sswitch_9
        0x75f7 -> :sswitch_8
        0x76bf -> :sswitch_7
        0x76c1 -> :sswitch_6
        0x7723 -> :sswitch_5
        0x9d07 -> :sswitch_4
        0x9dcf -> :sswitch_3
        0x9dd1 -> :sswitch_2
        0x9e33 -> :sswitch_1
        0xc351 -> :sswitch_0
    .end sparse-switch

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
    :pswitch_data_1
    .packed-switch 0x2775
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
    .end packed-switch

    :pswitch_data_2
    .packed-switch 0x4e85
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
    .end packed-switch

    :pswitch_data_3
    .packed-switch 0x7595
        :pswitch_b
        :pswitch_a
        :pswitch_9
    .end packed-switch

    :pswitch_data_4
    .packed-switch 0x759c
        :pswitch_8
        :pswitch_7
        :pswitch_6
    .end packed-switch

    :pswitch_data_5
    .packed-switch 0x9ca5
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

    :pswitch_data_6
    .packed-switch 0x9cac
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/push/ei;
    .locals 1

    .line 1
    const-class v0, Lcom/xiaomi/push/ei;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/xiaomi/push/ei;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/xiaomi/push/ei;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/ei;->a:[Lcom/xiaomi/push/ei;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/xiaomi/push/ei;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/xiaomi/push/ei;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 201
    iget p0, p0, Lcom/xiaomi/push/ei;->a:I

    return p0
.end method
