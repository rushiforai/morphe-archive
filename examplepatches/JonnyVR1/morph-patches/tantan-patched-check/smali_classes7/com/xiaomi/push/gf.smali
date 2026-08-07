.class public final enum Lcom/xiaomi/push/gf;
.super Ljava/lang/Enum;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Enum<",
        "Lcom/xiaomi/push/gf;",
        ">;"
    }
.end annotation


# static fields
.field public static final enum A:Lcom/xiaomi/push/gf;

.field public static final enum B:Lcom/xiaomi/push/gf;

.field public static final enum C:Lcom/xiaomi/push/gf;

.field public static final enum D:Lcom/xiaomi/push/gf;

.field public static final enum E:Lcom/xiaomi/push/gf;

.field public static final enum F:Lcom/xiaomi/push/gf;

.field public static final enum G:Lcom/xiaomi/push/gf;

.field public static final enum H:Lcom/xiaomi/push/gf;

.field public static final enum I:Lcom/xiaomi/push/gf;

.field public static final enum J:Lcom/xiaomi/push/gf;

.field public static final enum K:Lcom/xiaomi/push/gf;

.field public static final enum a:Lcom/xiaomi/push/gf;

.field private static final synthetic a:[Lcom/xiaomi/push/gf;

.field public static final enum b:Lcom/xiaomi/push/gf;

.field public static final enum c:Lcom/xiaomi/push/gf;

.field public static final enum d:Lcom/xiaomi/push/gf;

.field public static final enum e:Lcom/xiaomi/push/gf;

.field public static final enum f:Lcom/xiaomi/push/gf;

.field public static final enum g:Lcom/xiaomi/push/gf;

.field public static final enum h:Lcom/xiaomi/push/gf;

.field public static final enum i:Lcom/xiaomi/push/gf;

.field public static final enum j:Lcom/xiaomi/push/gf;

.field public static final enum k:Lcom/xiaomi/push/gf;

.field public static final enum l:Lcom/xiaomi/push/gf;

.field public static final enum m:Lcom/xiaomi/push/gf;

.field public static final enum n:Lcom/xiaomi/push/gf;

.field public static final enum o:Lcom/xiaomi/push/gf;

.field public static final enum p:Lcom/xiaomi/push/gf;

.field public static final enum q:Lcom/xiaomi/push/gf;

.field public static final enum r:Lcom/xiaomi/push/gf;

.field public static final enum s:Lcom/xiaomi/push/gf;

.field public static final enum t:Lcom/xiaomi/push/gf;

.field public static final enum u:Lcom/xiaomi/push/gf;

.field public static final enum v:Lcom/xiaomi/push/gf;

.field public static final enum w:Lcom/xiaomi/push/gf;

.field public static final enum x:Lcom/xiaomi/push/gf;

.field public static final enum y:Lcom/xiaomi/push/gf;

.field public static final enum z:Lcom/xiaomi/push/gf;


# instance fields
.field private final a:I


# direct methods
.method static constructor <clinit>()V
    .locals 40

    .line 1
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 2
    .line 3
    const-string v0, "Registration"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 8
    .line 9
    .line 10
    sput-object v1, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 11
    .line 12
    new-instance v2, Lcom/xiaomi/push/gf;

    .line 13
    .line 14
    const-string v0, "UnRegistration"

    .line 15
    .line 16
    const/4 v4, 0x2

    .line 17
    invoke-direct {v2, v0, v3, v4}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 18
    .line 19
    .line 20
    sput-object v2, Lcom/xiaomi/push/gf;->b:Lcom/xiaomi/push/gf;

    .line 21
    .line 22
    new-instance v3, Lcom/xiaomi/push/gf;

    .line 23
    .line 24
    const-string v0, "Subscription"

    .line 25
    .line 26
    const/4 v5, 0x3

    .line 27
    invoke-direct {v3, v0, v4, v5}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 28
    .line 29
    .line 30
    sput-object v3, Lcom/xiaomi/push/gf;->c:Lcom/xiaomi/push/gf;

    .line 31
    .line 32
    new-instance v4, Lcom/xiaomi/push/gf;

    .line 33
    .line 34
    const-string v0, "UnSubscription"

    .line 35
    .line 36
    const/4 v6, 0x4

    .line 37
    invoke-direct {v4, v0, v5, v6}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 38
    .line 39
    .line 40
    sput-object v4, Lcom/xiaomi/push/gf;->d:Lcom/xiaomi/push/gf;

    .line 41
    .line 42
    new-instance v5, Lcom/xiaomi/push/gf;

    .line 43
    .line 44
    const-string v0, "SendMessage"

    .line 45
    .line 46
    const/4 v7, 0x5

    .line 47
    invoke-direct {v5, v0, v6, v7}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 48
    .line 49
    .line 50
    sput-object v5, Lcom/xiaomi/push/gf;->e:Lcom/xiaomi/push/gf;

    .line 51
    .line 52
    new-instance v6, Lcom/xiaomi/push/gf;

    .line 53
    .line 54
    const-string v0, "AckMessage"

    .line 55
    .line 56
    const/4 v8, 0x6

    .line 57
    invoke-direct {v6, v0, v7, v8}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 58
    .line 59
    .line 60
    sput-object v6, Lcom/xiaomi/push/gf;->f:Lcom/xiaomi/push/gf;

    .line 61
    .line 62
    new-instance v7, Lcom/xiaomi/push/gf;

    .line 63
    .line 64
    const-string v0, "SetConfig"

    .line 65
    .line 66
    const/4 v9, 0x7

    .line 67
    invoke-direct {v7, v0, v8, v9}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 68
    .line 69
    .line 70
    sput-object v7, Lcom/xiaomi/push/gf;->g:Lcom/xiaomi/push/gf;

    .line 71
    .line 72
    new-instance v8, Lcom/xiaomi/push/gf;

    .line 73
    .line 74
    const-string v0, "ReportFeedback"

    .line 75
    .line 76
    const/16 v10, 0x8

    .line 77
    .line 78
    invoke-direct {v8, v0, v9, v10}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    sput-object v8, Lcom/xiaomi/push/gf;->h:Lcom/xiaomi/push/gf;

    .line 82
    .line 83
    new-instance v9, Lcom/xiaomi/push/gf;

    .line 84
    .line 85
    const-string v0, "Notification"

    .line 86
    .line 87
    const/16 v11, 0x9

    .line 88
    .line 89
    invoke-direct {v9, v0, v10, v11}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 90
    .line 91
    .line 92
    sput-object v9, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 93
    .line 94
    new-instance v10, Lcom/xiaomi/push/gf;

    .line 95
    .line 96
    const-string v0, "Command"

    .line 97
    .line 98
    const/16 v12, 0xa

    .line 99
    .line 100
    invoke-direct {v10, v0, v11, v12}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 101
    .line 102
    .line 103
    sput-object v10, Lcom/xiaomi/push/gf;->j:Lcom/xiaomi/push/gf;

    .line 104
    .line 105
    new-instance v11, Lcom/xiaomi/push/gf;

    .line 106
    .line 107
    const-string v0, "MultiConnectionBroadcast"

    .line 108
    .line 109
    const/16 v13, 0xb

    .line 110
    .line 111
    invoke-direct {v11, v0, v12, v13}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 112
    .line 113
    .line 114
    sput-object v11, Lcom/xiaomi/push/gf;->k:Lcom/xiaomi/push/gf;

    .line 115
    .line 116
    new-instance v12, Lcom/xiaomi/push/gf;

    .line 117
    .line 118
    const-string v0, "MultiConnectionResult"

    .line 119
    .line 120
    const/16 v14, 0xc

    .line 121
    .line 122
    invoke-direct {v12, v0, v13, v14}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 123
    .line 124
    .line 125
    sput-object v12, Lcom/xiaomi/push/gf;->l:Lcom/xiaomi/push/gf;

    .line 126
    .line 127
    new-instance v13, Lcom/xiaomi/push/gf;

    .line 128
    .line 129
    const-string v0, "ConnectionKick"

    .line 130
    .line 131
    const/16 v15, 0xd

    .line 132
    .line 133
    invoke-direct {v13, v0, v14, v15}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 134
    .line 135
    .line 136
    sput-object v13, Lcom/xiaomi/push/gf;->m:Lcom/xiaomi/push/gf;

    .line 137
    .line 138
    new-instance v14, Lcom/xiaomi/push/gf;

    .line 139
    .line 140
    const-string v0, "ApnsMessage"

    .line 141
    .line 142
    move-object/from16 v16, v1

    .line 143
    .line 144
    const/16 v1, 0xe

    .line 145
    .line 146
    invoke-direct {v14, v0, v15, v1}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 147
    .line 148
    .line 149
    sput-object v14, Lcom/xiaomi/push/gf;->n:Lcom/xiaomi/push/gf;

    .line 150
    .line 151
    new-instance v15, Lcom/xiaomi/push/gf;

    .line 152
    .line 153
    const-string v0, "IOSDeviceTokenWrite"

    .line 154
    .line 155
    move-object/from16 v17, v2

    .line 156
    .line 157
    const/16 v2, 0xf

    .line 158
    .line 159
    invoke-direct {v15, v0, v1, v2}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 160
    .line 161
    .line 162
    sput-object v15, Lcom/xiaomi/push/gf;->o:Lcom/xiaomi/push/gf;

    .line 163
    .line 164
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 165
    .line 166
    const-string v1, "SaveInvalidRegId"

    .line 167
    .line 168
    move-object/from16 v18, v3

    .line 169
    .line 170
    const/16 v3, 0x10

    .line 171
    .line 172
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 173
    .line 174
    .line 175
    sput-object v0, Lcom/xiaomi/push/gf;->p:Lcom/xiaomi/push/gf;

    .line 176
    .line 177
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 178
    .line 179
    const-string v2, "ApnsCertChanged"

    .line 180
    .line 181
    move-object/from16 v19, v0

    .line 182
    .line 183
    const/16 v0, 0x11

    .line 184
    .line 185
    invoke-direct {v1, v2, v3, v0}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 186
    .line 187
    .line 188
    sput-object v1, Lcom/xiaomi/push/gf;->q:Lcom/xiaomi/push/gf;

    .line 189
    .line 190
    new-instance v2, Lcom/xiaomi/push/gf;

    .line 191
    .line 192
    const-string v3, "RegisterDevice"

    .line 193
    .line 194
    move-object/from16 v20, v1

    .line 195
    .line 196
    const/16 v1, 0x12

    .line 197
    .line 198
    invoke-direct {v2, v3, v0, v1}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 199
    .line 200
    .line 201
    sput-object v2, Lcom/xiaomi/push/gf;->r:Lcom/xiaomi/push/gf;

    .line 202
    .line 203
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 204
    .line 205
    const-string v3, "ExpandTopicInXmq"

    .line 206
    .line 207
    move-object/from16 v21, v2

    .line 208
    .line 209
    const/16 v2, 0x13

    .line 210
    .line 211
    invoke-direct {v0, v3, v1, v2}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 212
    .line 213
    .line 214
    sput-object v0, Lcom/xiaomi/push/gf;->s:Lcom/xiaomi/push/gf;

    .line 215
    .line 216
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 217
    .line 218
    const-string v3, "SendMessageNew"

    .line 219
    .line 220
    move-object/from16 v22, v0

    .line 221
    .line 222
    const/16 v0, 0x16

    .line 223
    .line 224
    invoke-direct {v1, v3, v2, v0}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 225
    .line 226
    .line 227
    sput-object v1, Lcom/xiaomi/push/gf;->t:Lcom/xiaomi/push/gf;

    .line 228
    .line 229
    new-instance v2, Lcom/xiaomi/push/gf;

    .line 230
    .line 231
    const-string v3, "ExpandTopicInXmqNew"

    .line 232
    .line 233
    const/16 v0, 0x14

    .line 234
    .line 235
    move-object/from16 v24, v1

    .line 236
    .line 237
    const/16 v1, 0x17

    .line 238
    .line 239
    invoke-direct {v2, v3, v0, v1}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 240
    .line 241
    .line 242
    sput-object v2, Lcom/xiaomi/push/gf;->u:Lcom/xiaomi/push/gf;

    .line 243
    .line 244
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 245
    .line 246
    const-string v3, "DeleteInvalidMessage"

    .line 247
    .line 248
    const/16 v1, 0x15

    .line 249
    .line 250
    move-object/from16 v26, v2

    .line 251
    .line 252
    const/16 v2, 0x18

    .line 253
    .line 254
    invoke-direct {v0, v3, v1, v2}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 255
    .line 256
    .line 257
    sput-object v0, Lcom/xiaomi/push/gf;->v:Lcom/xiaomi/push/gf;

    .line 258
    .line 259
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 260
    .line 261
    const-string v3, "BadAction"

    .line 262
    .line 263
    const/16 v2, 0x63

    .line 264
    .line 265
    move-object/from16 v28, v0

    .line 266
    .line 267
    const/16 v0, 0x16

    .line 268
    .line 269
    invoke-direct {v1, v3, v0, v2}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 270
    .line 271
    .line 272
    sput-object v1, Lcom/xiaomi/push/gf;->w:Lcom/xiaomi/push/gf;

    .line 273
    .line 274
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 275
    .line 276
    const-string v2, "Presence"

    .line 277
    .line 278
    const/16 v3, 0x64

    .line 279
    .line 280
    move-object/from16 v23, v1

    .line 281
    .line 282
    const/16 v1, 0x17

    .line 283
    .line 284
    invoke-direct {v0, v2, v1, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 285
    .line 286
    .line 287
    sput-object v0, Lcom/xiaomi/push/gf;->x:Lcom/xiaomi/push/gf;

    .line 288
    .line 289
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 290
    .line 291
    const-string v2, "FetchOfflineMessage"

    .line 292
    .line 293
    const/16 v3, 0x65

    .line 294
    .line 295
    move-object/from16 v25, v0

    .line 296
    .line 297
    const/16 v0, 0x18

    .line 298
    .line 299
    invoke-direct {v1, v2, v0, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 300
    .line 301
    .line 302
    sput-object v1, Lcom/xiaomi/push/gf;->y:Lcom/xiaomi/push/gf;

    .line 303
    .line 304
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 305
    .line 306
    const/16 v2, 0x19

    .line 307
    .line 308
    const/16 v3, 0x66

    .line 309
    .line 310
    move-object/from16 v27, v1

    .line 311
    .line 312
    const-string v1, "SaveJob"

    .line 313
    .line 314
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 315
    .line 316
    .line 317
    sput-object v0, Lcom/xiaomi/push/gf;->z:Lcom/xiaomi/push/gf;

    .line 318
    .line 319
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 320
    .line 321
    const/16 v2, 0x1a

    .line 322
    .line 323
    const/16 v3, 0x67

    .line 324
    .line 325
    move-object/from16 v29, v0

    .line 326
    .line 327
    const-string v0, "Broadcast"

    .line 328
    .line 329
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 330
    .line 331
    .line 332
    sput-object v1, Lcom/xiaomi/push/gf;->A:Lcom/xiaomi/push/gf;

    .line 333
    .line 334
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 335
    .line 336
    const/16 v2, 0x1b

    .line 337
    .line 338
    const/16 v3, 0x68

    .line 339
    .line 340
    move-object/from16 v30, v1

    .line 341
    .line 342
    const-string v1, "BatchPresence"

    .line 343
    .line 344
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 345
    .line 346
    .line 347
    sput-object v0, Lcom/xiaomi/push/gf;->B:Lcom/xiaomi/push/gf;

    .line 348
    .line 349
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 350
    .line 351
    const/16 v2, 0x1c

    .line 352
    .line 353
    const/16 v3, 0x69

    .line 354
    .line 355
    move-object/from16 v31, v0

    .line 356
    .line 357
    const-string v0, "BatchMessage"

    .line 358
    .line 359
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 360
    .line 361
    .line 362
    sput-object v1, Lcom/xiaomi/push/gf;->C:Lcom/xiaomi/push/gf;

    .line 363
    .line 364
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 365
    .line 366
    const/16 v2, 0x1d

    .line 367
    .line 368
    const/16 v3, 0x6b

    .line 369
    .line 370
    move-object/from16 v32, v1

    .line 371
    .line 372
    const-string v1, "StatCounter"

    .line 373
    .line 374
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 375
    .line 376
    .line 377
    sput-object v0, Lcom/xiaomi/push/gf;->D:Lcom/xiaomi/push/gf;

    .line 378
    .line 379
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 380
    .line 381
    const/16 v2, 0x1e

    .line 382
    .line 383
    const/16 v3, 0x6c

    .line 384
    .line 385
    move-object/from16 v33, v0

    .line 386
    .line 387
    const-string v0, "FetchTopicMessage"

    .line 388
    .line 389
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 390
    .line 391
    .line 392
    sput-object v1, Lcom/xiaomi/push/gf;->E:Lcom/xiaomi/push/gf;

    .line 393
    .line 394
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 395
    .line 396
    const/16 v2, 0x1f

    .line 397
    .line 398
    const/16 v3, 0x6d

    .line 399
    .line 400
    move-object/from16 v34, v1

    .line 401
    .line 402
    const-string v1, "DeleteAliasCache"

    .line 403
    .line 404
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 405
    .line 406
    .line 407
    sput-object v0, Lcom/xiaomi/push/gf;->F:Lcom/xiaomi/push/gf;

    .line 408
    .line 409
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 410
    .line 411
    const/16 v2, 0x20

    .line 412
    .line 413
    const/16 v3, 0x6e

    .line 414
    .line 415
    move-object/from16 v35, v0

    .line 416
    .line 417
    const-string v0, "UpdateRegistration"

    .line 418
    .line 419
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 420
    .line 421
    .line 422
    sput-object v1, Lcom/xiaomi/push/gf;->G:Lcom/xiaomi/push/gf;

    .line 423
    .line 424
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 425
    .line 426
    const/16 v2, 0x21

    .line 427
    .line 428
    const/16 v3, 0x70

    .line 429
    .line 430
    move-object/from16 v36, v1

    .line 431
    .line 432
    const-string v1, "BatchMessageNew"

    .line 433
    .line 434
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 435
    .line 436
    .line 437
    sput-object v0, Lcom/xiaomi/push/gf;->H:Lcom/xiaomi/push/gf;

    .line 438
    .line 439
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 440
    .line 441
    const/16 v2, 0x22

    .line 442
    .line 443
    const/16 v3, 0x71

    .line 444
    .line 445
    move-object/from16 v37, v0

    .line 446
    .line 447
    const-string v0, "PublicWelfareMessage"

    .line 448
    .line 449
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 450
    .line 451
    .line 452
    sput-object v1, Lcom/xiaomi/push/gf;->I:Lcom/xiaomi/push/gf;

    .line 453
    .line 454
    new-instance v0, Lcom/xiaomi/push/gf;

    .line 455
    .line 456
    const/16 v2, 0x23

    .line 457
    .line 458
    const/16 v3, 0x72

    .line 459
    .line 460
    move-object/from16 v38, v1

    .line 461
    .line 462
    const-string v1, "RevokeMessage"

    .line 463
    .line 464
    invoke-direct {v0, v1, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 465
    .line 466
    .line 467
    sput-object v0, Lcom/xiaomi/push/gf;->J:Lcom/xiaomi/push/gf;

    .line 468
    .line 469
    new-instance v1, Lcom/xiaomi/push/gf;

    .line 470
    .line 471
    const/16 v2, 0x24

    .line 472
    .line 473
    const/16 v3, 0xc8

    .line 474
    .line 475
    move-object/from16 v39, v0

    .line 476
    .line 477
    const-string v0, "SimulatorJob"

    .line 478
    .line 479
    invoke-direct {v1, v0, v2, v3}, Lcom/xiaomi/push/gf;-><init>(Ljava/lang/String;II)V

    .line 480
    .line 481
    .line 482
    sput-object v1, Lcom/xiaomi/push/gf;->K:Lcom/xiaomi/push/gf;

    .line 483
    .line 484
    move-object/from16 v2, v37

    .line 485
    .line 486
    move-object/from16 v37, v1

    .line 487
    .line 488
    move-object/from16 v1, v16

    .line 489
    .line 490
    move-object/from16 v16, v19

    .line 491
    .line 492
    move-object/from16 v19, v22

    .line 493
    .line 494
    move-object/from16 v22, v28

    .line 495
    .line 496
    move-object/from16 v28, v31

    .line 497
    .line 498
    move-object/from16 v31, v34

    .line 499
    .line 500
    move-object/from16 v34, v2

    .line 501
    .line 502
    move-object/from16 v2, v17

    .line 503
    .line 504
    move-object/from16 v3, v18

    .line 505
    .line 506
    move-object/from16 v17, v20

    .line 507
    .line 508
    move-object/from16 v18, v21

    .line 509
    .line 510
    move-object/from16 v20, v24

    .line 511
    .line 512
    move-object/from16 v24, v25

    .line 513
    .line 514
    move-object/from16 v21, v26

    .line 515
    .line 516
    move-object/from16 v25, v27

    .line 517
    .line 518
    move-object/from16 v26, v29

    .line 519
    .line 520
    move-object/from16 v27, v30

    .line 521
    .line 522
    move-object/from16 v29, v32

    .line 523
    .line 524
    move-object/from16 v30, v33

    .line 525
    .line 526
    move-object/from16 v32, v35

    .line 527
    .line 528
    move-object/from16 v33, v36

    .line 529
    .line 530
    move-object/from16 v35, v38

    .line 531
    .line 532
    move-object/from16 v36, v39

    .line 533
    .line 534
    filled-new-array/range {v1 .. v37}, [Lcom/xiaomi/push/gf;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    sput-object v0, Lcom/xiaomi/push/gf;->a:[Lcom/xiaomi/push/gf;

    .line 539
    .line 540
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
    iput p3, p0, Lcom/xiaomi/push/gf;->a:I

    .line 5
    .line 6
    return-void
.end method

.method public static a(I)Lcom/xiaomi/push/gf;
    .locals 1

    .line 1
    const/16 v0, 0xc8

    .line 2
    .line 3
    if-eq p0, v0, :cond_0

    .line 4
    .line 5
    packed-switch p0, :pswitch_data_0

    .line 6
    .line 7
    .line 8
    packed-switch p0, :pswitch_data_1

    .line 9
    .line 10
    .line 11
    packed-switch p0, :pswitch_data_2

    .line 12
    .line 13
    .line 14
    packed-switch p0, :pswitch_data_3

    .line 15
    .line 16
    .line 17
    packed-switch p0, :pswitch_data_4

    .line 18
    .line 19
    .line 20
    const/4 p0, 0x0

    .line 21
    return-object p0

    .line 22
    :pswitch_0
    sget-object p0, Lcom/xiaomi/push/gf;->J:Lcom/xiaomi/push/gf;

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_1
    sget-object p0, Lcom/xiaomi/push/gf;->I:Lcom/xiaomi/push/gf;

    .line 26
    .line 27
    return-object p0

    .line 28
    :pswitch_2
    sget-object p0, Lcom/xiaomi/push/gf;->H:Lcom/xiaomi/push/gf;

    .line 29
    .line 30
    return-object p0

    .line 31
    :pswitch_3
    sget-object p0, Lcom/xiaomi/push/gf;->G:Lcom/xiaomi/push/gf;

    .line 32
    .line 33
    return-object p0

    .line 34
    :pswitch_4
    sget-object p0, Lcom/xiaomi/push/gf;->F:Lcom/xiaomi/push/gf;

    .line 35
    .line 36
    return-object p0

    .line 37
    :pswitch_5
    sget-object p0, Lcom/xiaomi/push/gf;->E:Lcom/xiaomi/push/gf;

    .line 38
    .line 39
    return-object p0

    .line 40
    :pswitch_6
    sget-object p0, Lcom/xiaomi/push/gf;->D:Lcom/xiaomi/push/gf;

    .line 41
    .line 42
    return-object p0

    .line 43
    :pswitch_7
    sget-object p0, Lcom/xiaomi/push/gf;->C:Lcom/xiaomi/push/gf;

    .line 44
    .line 45
    return-object p0

    .line 46
    :pswitch_8
    sget-object p0, Lcom/xiaomi/push/gf;->B:Lcom/xiaomi/push/gf;

    .line 47
    .line 48
    return-object p0

    .line 49
    :pswitch_9
    sget-object p0, Lcom/xiaomi/push/gf;->A:Lcom/xiaomi/push/gf;

    .line 50
    .line 51
    return-object p0

    .line 52
    :pswitch_a
    sget-object p0, Lcom/xiaomi/push/gf;->z:Lcom/xiaomi/push/gf;

    .line 53
    .line 54
    return-object p0

    .line 55
    :pswitch_b
    sget-object p0, Lcom/xiaomi/push/gf;->y:Lcom/xiaomi/push/gf;

    .line 56
    .line 57
    return-object p0

    .line 58
    :pswitch_c
    sget-object p0, Lcom/xiaomi/push/gf;->x:Lcom/xiaomi/push/gf;

    .line 59
    .line 60
    return-object p0

    .line 61
    :pswitch_d
    sget-object p0, Lcom/xiaomi/push/gf;->w:Lcom/xiaomi/push/gf;

    .line 62
    .line 63
    return-object p0

    .line 64
    :pswitch_e
    sget-object p0, Lcom/xiaomi/push/gf;->v:Lcom/xiaomi/push/gf;

    .line 65
    .line 66
    return-object p0

    .line 67
    :pswitch_f
    sget-object p0, Lcom/xiaomi/push/gf;->u:Lcom/xiaomi/push/gf;

    .line 68
    .line 69
    return-object p0

    .line 70
    :pswitch_10
    sget-object p0, Lcom/xiaomi/push/gf;->t:Lcom/xiaomi/push/gf;

    .line 71
    .line 72
    return-object p0

    .line 73
    :pswitch_11
    sget-object p0, Lcom/xiaomi/push/gf;->s:Lcom/xiaomi/push/gf;

    .line 74
    .line 75
    return-object p0

    .line 76
    :pswitch_12
    sget-object p0, Lcom/xiaomi/push/gf;->r:Lcom/xiaomi/push/gf;

    .line 77
    .line 78
    return-object p0

    .line 79
    :pswitch_13
    sget-object p0, Lcom/xiaomi/push/gf;->q:Lcom/xiaomi/push/gf;

    .line 80
    .line 81
    return-object p0

    .line 82
    :pswitch_14
    sget-object p0, Lcom/xiaomi/push/gf;->p:Lcom/xiaomi/push/gf;

    .line 83
    .line 84
    return-object p0

    .line 85
    :pswitch_15
    sget-object p0, Lcom/xiaomi/push/gf;->o:Lcom/xiaomi/push/gf;

    .line 86
    .line 87
    return-object p0

    .line 88
    :pswitch_16
    sget-object p0, Lcom/xiaomi/push/gf;->n:Lcom/xiaomi/push/gf;

    .line 89
    .line 90
    return-object p0

    .line 91
    :pswitch_17
    sget-object p0, Lcom/xiaomi/push/gf;->m:Lcom/xiaomi/push/gf;

    .line 92
    .line 93
    return-object p0

    .line 94
    :pswitch_18
    sget-object p0, Lcom/xiaomi/push/gf;->l:Lcom/xiaomi/push/gf;

    .line 95
    .line 96
    return-object p0

    .line 97
    :pswitch_19
    sget-object p0, Lcom/xiaomi/push/gf;->k:Lcom/xiaomi/push/gf;

    .line 98
    .line 99
    return-object p0

    .line 100
    :pswitch_1a
    sget-object p0, Lcom/xiaomi/push/gf;->j:Lcom/xiaomi/push/gf;

    .line 101
    .line 102
    return-object p0

    .line 103
    :pswitch_1b
    sget-object p0, Lcom/xiaomi/push/gf;->i:Lcom/xiaomi/push/gf;

    .line 104
    .line 105
    return-object p0

    .line 106
    :pswitch_1c
    sget-object p0, Lcom/xiaomi/push/gf;->h:Lcom/xiaomi/push/gf;

    .line 107
    .line 108
    return-object p0

    .line 109
    :pswitch_1d
    sget-object p0, Lcom/xiaomi/push/gf;->g:Lcom/xiaomi/push/gf;

    .line 110
    .line 111
    return-object p0

    .line 112
    :pswitch_1e
    sget-object p0, Lcom/xiaomi/push/gf;->f:Lcom/xiaomi/push/gf;

    .line 113
    .line 114
    return-object p0

    .line 115
    :pswitch_1f
    sget-object p0, Lcom/xiaomi/push/gf;->e:Lcom/xiaomi/push/gf;

    .line 116
    .line 117
    return-object p0

    .line 118
    :pswitch_20
    sget-object p0, Lcom/xiaomi/push/gf;->d:Lcom/xiaomi/push/gf;

    .line 119
    .line 120
    return-object p0

    .line 121
    :pswitch_21
    sget-object p0, Lcom/xiaomi/push/gf;->c:Lcom/xiaomi/push/gf;

    .line 122
    .line 123
    return-object p0

    .line 124
    :pswitch_22
    sget-object p0, Lcom/xiaomi/push/gf;->b:Lcom/xiaomi/push/gf;

    .line 125
    .line 126
    return-object p0

    .line 127
    :pswitch_23
    sget-object p0, Lcom/xiaomi/push/gf;->a:Lcom/xiaomi/push/gf;

    .line 128
    .line 129
    return-object p0

    .line 130
    :cond_0
    sget-object p0, Lcom/xiaomi/push/gf;->K:Lcom/xiaomi/push/gf;

    .line 131
    .line 132
    return-object p0

    .line 133
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_23
        :pswitch_22
        :pswitch_21
        :pswitch_20
        :pswitch_1f
        :pswitch_1e
        :pswitch_1d
        :pswitch_1c
        :pswitch_1b
        :pswitch_1a
        :pswitch_19
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
    .end packed-switch

    .line 134
    .line 135
    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    .line 141
    .line 142
    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    .line 152
    .line 153
    .line 154
    .line 155
    .line 156
    .line 157
    .line 158
    .line 159
    .line 160
    .line 161
    .line 162
    .line 163
    .line 164
    .line 165
    .line 166
    .line 167
    .line 168
    .line 169
    .line 170
    .line 171
    .line 172
    .line 173
    .line 174
    .line 175
    :pswitch_data_1
    .packed-switch 0x16
        :pswitch_10
        :pswitch_f
        :pswitch_e
    .end packed-switch

    .line 176
    .line 177
    .line 178
    .line 179
    .line 180
    .line 181
    .line 182
    .line 183
    .line 184
    .line 185
    :pswitch_data_2
    .packed-switch 0x63
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

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
    .line 199
    .line 200
    .line 201
    .line 202
    .line 203
    :pswitch_data_3
    .packed-switch 0x6b
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
    .end packed-switch

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
    :pswitch_data_4
    .packed-switch 0x70
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public static valueOf(Ljava/lang/String;)Lcom/xiaomi/push/gf;
    .locals 1

    .line 1
    const-class v0, Lcom/xiaomi/push/gf;

    .line 2
    .line 3
    invoke-static {v0, p0}, Ljava/lang/Enum;->valueOf(Ljava/lang/Class;Ljava/lang/String;)Ljava/lang/Enum;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/xiaomi/push/gf;

    .line 8
    .line 9
    return-object p0
.end method

.method public static values()[Lcom/xiaomi/push/gf;
    .locals 1

    .line 1
    sget-object v0, Lcom/xiaomi/push/gf;->a:[Lcom/xiaomi/push/gf;

    .line 2
    .line 3
    invoke-virtual {v0}, [Lcom/xiaomi/push/gf;->clone()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, [Lcom/xiaomi/push/gf;

    .line 8
    .line 9
    return-object v0
.end method


# virtual methods
.method public a()I
    .locals 0

    .line 133
    iget p0, p0, Lcom/xiaomi/push/gf;->a:I

    return p0
.end method
