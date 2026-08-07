.class public Ll/od1;
.super Ll/cj2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/od1$a;,
        Ll/od1$b;
    }
.end annotation

.annotation runtime Ll/svd;
    objectTypeIndication = 0x40
    tags = {
        0x5
    }
.end annotation


# static fields
.field public static V:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field

.field public static W:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/Integer;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field public A:I

.field public B:Z

.field public C:Z

.field public D:Z

.field public E:I

.field public F:Z

.field public G:I

.field public H:I

.field public I:I

.field public J:I

.field public K:I

.field public L:I

.field public M:I

.field public N:I

.field public O:I

.field public P:I

.field public Q:I

.field public R:I

.field public S:I

.field public T:I

.field public U:Z

.field d:[B

.field public e:Ll/od1$a;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:Z

.field public l:Z

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:I

.field public u:I

.field public v:I

.field public w:I

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method static constructor <clinit>()V
    .locals 13

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 7
    .line 8
    new-instance v0, Ljava/util/HashMap;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 14
    .line 15
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    const v2, 0x17700

    .line 23
    .line 24
    .line 25
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 30
    .line 31
    .line 32
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const v2, 0x15888

    .line 40
    .line 41
    .line 42
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 50
    .line 51
    const/4 v2, 0x2

    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    const v3, 0xfa00

    .line 57
    .line 58
    .line 59
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 67
    .line 68
    const/4 v3, 0x3

    .line 69
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    const v4, 0xbb80

    .line 74
    .line 75
    .line 76
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 77
    .line 78
    .line 79
    move-result-object v4

    .line 80
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 81
    .line 82
    .line 83
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 84
    .line 85
    const/4 v4, 0x4

    .line 86
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    const v5, 0xac44

    .line 91
    .line 92
    .line 93
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object v5

    .line 97
    invoke-interface {v0, v4, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 101
    .line 102
    const/4 v5, 0x5

    .line 103
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 104
    .line 105
    .line 106
    move-result-object v5

    .line 107
    const/16 v6, 0x7d00

    .line 108
    .line 109
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 110
    .line 111
    .line 112
    move-result-object v6

    .line 113
    invoke-interface {v0, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 117
    .line 118
    const/4 v6, 0x6

    .line 119
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 120
    .line 121
    .line 122
    move-result-object v6

    .line 123
    const/16 v7, 0x5dc0

    .line 124
    .line 125
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v7

    .line 129
    invoke-interface {v0, v6, v7}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 130
    .line 131
    .line 132
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 133
    .line 134
    const/4 v7, 0x7

    .line 135
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v7

    .line 139
    const/16 v8, 0x5622

    .line 140
    .line 141
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 142
    .line 143
    .line 144
    move-result-object v8

    .line 145
    invoke-interface {v0, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 146
    .line 147
    .line 148
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 149
    .line 150
    const/16 v8, 0x8

    .line 151
    .line 152
    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    const/16 v9, 0x3e80

    .line 157
    .line 158
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v9

    .line 162
    invoke-interface {v0, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 166
    .line 167
    const/16 v9, 0x9

    .line 168
    .line 169
    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 170
    .line 171
    .line 172
    move-result-object v9

    .line 173
    const/16 v10, 0x2ee0

    .line 174
    .line 175
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v10

    .line 179
    invoke-interface {v0, v9, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 183
    .line 184
    const/16 v10, 0xa

    .line 185
    .line 186
    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object v10

    .line 190
    const/16 v11, 0x2b11

    .line 191
    .line 192
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 193
    .line 194
    .line 195
    move-result-object v11

    .line 196
    invoke-interface {v0, v10, v11}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    sget-object v0, Ll/od1;->V:Ljava/util/Map;

    .line 200
    .line 201
    const/16 v11, 0xb

    .line 202
    .line 203
    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 204
    .line 205
    .line 206
    move-result-object v11

    .line 207
    const/16 v12, 0x1f40

    .line 208
    .line 209
    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 210
    .line 211
    .line 212
    move-result-object v12

    .line 213
    invoke-interface {v0, v11, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 214
    .line 215
    .line 216
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 217
    .line 218
    const-string v12, "AAC main"

    .line 219
    .line 220
    invoke-interface {v0, v1, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 221
    .line 222
    .line 223
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 224
    .line 225
    const-string v1, "AAC LC"

    .line 226
    .line 227
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 228
    .line 229
    .line 230
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 231
    .line 232
    const-string v1, "AAC SSR"

    .line 233
    .line 234
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 238
    .line 239
    const-string v1, "AAC LTP"

    .line 240
    .line 241
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 245
    .line 246
    const-string v1, "SBR"

    .line 247
    .line 248
    invoke-interface {v0, v5, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 252
    .line 253
    const-string v1, "AAC Scalable"

    .line 254
    .line 255
    invoke-interface {v0, v6, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 259
    .line 260
    const-string v1, "TwinVQ"

    .line 261
    .line 262
    invoke-interface {v0, v7, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 266
    .line 267
    const-string v1, "CELP"

    .line 268
    .line 269
    invoke-interface {v0, v8, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 273
    .line 274
    const-string v1, "HVXC"

    .line 275
    .line 276
    invoke-interface {v0, v9, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 277
    .line 278
    .line 279
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 280
    .line 281
    const-string v1, "(reserved)"

    .line 282
    .line 283
    invoke-interface {v0, v10, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 287
    .line 288
    invoke-interface {v0, v11, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 292
    .line 293
    const/16 v2, 0xc

    .line 294
    .line 295
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    const-string v3, "TTSI"

    .line 300
    .line 301
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 302
    .line 303
    .line 304
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 305
    .line 306
    const/16 v2, 0xd

    .line 307
    .line 308
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 309
    .line 310
    .line 311
    move-result-object v2

    .line 312
    const-string v3, "Main synthetic"

    .line 313
    .line 314
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 318
    .line 319
    const/16 v2, 0xe

    .line 320
    .line 321
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    const-string v3, "Wavetable synthesis"

    .line 326
    .line 327
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 331
    .line 332
    const/16 v2, 0xf

    .line 333
    .line 334
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 335
    .line 336
    .line 337
    move-result-object v2

    .line 338
    const-string v3, "General MIDI"

    .line 339
    .line 340
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 344
    .line 345
    const/16 v2, 0x10

    .line 346
    .line 347
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    const-string v3, "Algorithmic Synthesis and Audio FX"

    .line 352
    .line 353
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 357
    .line 358
    const/16 v2, 0x11

    .line 359
    .line 360
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 361
    .line 362
    .line 363
    move-result-object v2

    .line 364
    const-string v3, "ER AAC LC"

    .line 365
    .line 366
    invoke-interface {v0, v2, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 370
    .line 371
    const/16 v2, 0x12

    .line 372
    .line 373
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 381
    .line 382
    const/16 v1, 0x13

    .line 383
    .line 384
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 385
    .line 386
    .line 387
    move-result-object v1

    .line 388
    const-string v2, "ER AAC LTP"

    .line 389
    .line 390
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 394
    .line 395
    const/16 v1, 0x14

    .line 396
    .line 397
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 398
    .line 399
    .line 400
    move-result-object v1

    .line 401
    const-string v2, "ER AAC Scalable"

    .line 402
    .line 403
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 407
    .line 408
    const/16 v1, 0x15

    .line 409
    .line 410
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 411
    .line 412
    .line 413
    move-result-object v1

    .line 414
    const-string v2, "ER TwinVQ"

    .line 415
    .line 416
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 420
    .line 421
    const/16 v1, 0x16

    .line 422
    .line 423
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 424
    .line 425
    .line 426
    move-result-object v1

    .line 427
    const-string v2, "ER BSAC"

    .line 428
    .line 429
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 433
    .line 434
    const/16 v1, 0x17

    .line 435
    .line 436
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 437
    .line 438
    .line 439
    move-result-object v1

    .line 440
    const-string v2, "ER AAC LD"

    .line 441
    .line 442
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 443
    .line 444
    .line 445
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 446
    .line 447
    const/16 v1, 0x18

    .line 448
    .line 449
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    const-string v2, "ER CELP"

    .line 454
    .line 455
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 459
    .line 460
    const/16 v1, 0x19

    .line 461
    .line 462
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 463
    .line 464
    .line 465
    move-result-object v1

    .line 466
    const-string v2, "ER HVXC"

    .line 467
    .line 468
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 469
    .line 470
    .line 471
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 472
    .line 473
    const/16 v1, 0x1a

    .line 474
    .line 475
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    const-string v2, "ER HILN"

    .line 480
    .line 481
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 482
    .line 483
    .line 484
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 485
    .line 486
    const/16 v1, 0x1b

    .line 487
    .line 488
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 489
    .line 490
    .line 491
    move-result-object v1

    .line 492
    const-string v2, "ER Parametric"

    .line 493
    .line 494
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 498
    .line 499
    const/16 v1, 0x1c

    .line 500
    .line 501
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 502
    .line 503
    .line 504
    move-result-object v1

    .line 505
    const-string v2, "SSC"

    .line 506
    .line 507
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 511
    .line 512
    const/16 v1, 0x1d

    .line 513
    .line 514
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 515
    .line 516
    .line 517
    move-result-object v1

    .line 518
    const-string v2, "PS"

    .line 519
    .line 520
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 521
    .line 522
    .line 523
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 524
    .line 525
    const/16 v1, 0x1e

    .line 526
    .line 527
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 528
    .line 529
    .line 530
    move-result-object v1

    .line 531
    const-string v2, "MPEG Surround"

    .line 532
    .line 533
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 534
    .line 535
    .line 536
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 537
    .line 538
    const/16 v1, 0x1f

    .line 539
    .line 540
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 541
    .line 542
    .line 543
    move-result-object v1

    .line 544
    const-string v2, "(escape)"

    .line 545
    .line 546
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 550
    .line 551
    const/16 v1, 0x20

    .line 552
    .line 553
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 554
    .line 555
    .line 556
    move-result-object v1

    .line 557
    const-string v2, "Layer-1"

    .line 558
    .line 559
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 560
    .line 561
    .line 562
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 563
    .line 564
    const/16 v1, 0x21

    .line 565
    .line 566
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 567
    .line 568
    .line 569
    move-result-object v1

    .line 570
    const-string v2, "Layer-2"

    .line 571
    .line 572
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 576
    .line 577
    const/16 v1, 0x22

    .line 578
    .line 579
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 580
    .line 581
    .line 582
    move-result-object v1

    .line 583
    const-string v2, "Layer-3"

    .line 584
    .line 585
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 586
    .line 587
    .line 588
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 589
    .line 590
    const/16 v1, 0x23

    .line 591
    .line 592
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 593
    .line 594
    .line 595
    move-result-object v1

    .line 596
    const-string v2, "DST"

    .line 597
    .line 598
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 599
    .line 600
    .line 601
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 602
    .line 603
    const/16 v1, 0x24

    .line 604
    .line 605
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 606
    .line 607
    .line 608
    move-result-object v1

    .line 609
    const-string v2, "ALS"

    .line 610
    .line 611
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 612
    .line 613
    .line 614
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 615
    .line 616
    const/16 v1, 0x25

    .line 617
    .line 618
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 619
    .line 620
    .line 621
    move-result-object v1

    .line 622
    const-string v2, "SLS"

    .line 623
    .line 624
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 625
    .line 626
    .line 627
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 628
    .line 629
    const/16 v1, 0x26

    .line 630
    .line 631
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    const-string v2, "SLS non-core"

    .line 636
    .line 637
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 638
    .line 639
    .line 640
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 641
    .line 642
    const/16 v1, 0x27

    .line 643
    .line 644
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 645
    .line 646
    .line 647
    move-result-object v1

    .line 648
    const-string v2, "ER AAC ELD"

    .line 649
    .line 650
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 651
    .line 652
    .line 653
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 654
    .line 655
    const/16 v1, 0x28

    .line 656
    .line 657
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    const-string v2, "SMR Simple"

    .line 662
    .line 663
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 664
    .line 665
    .line 666
    sget-object v0, Ll/od1;->W:Ljava/util/Map;

    .line 667
    .line 668
    const/16 v1, 0x29

    .line 669
    .line 670
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    const-string v2, "SMR Main"

    .line 675
    .line 676
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 677
    .line 678
    .line 679
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/cj2;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private f(Ll/g13;)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x5

    .line 2
    invoke-virtual {p1, p0}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    const/16 v0, 0x1f

    .line 7
    .line 8
    if-ne p0, v0, :cond_0

    .line 9
    .line 10
    const/4 p0, 0x6

    .line 11
    invoke-virtual {p1, p0}, Ll/g13;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    add-int/lit8 p0, p0, 0x20

    .line 16
    .line 17
    :cond_0
    return p0
.end method

.method private g(IIILl/g13;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    iput p2, p0, Ll/od1;->J:I

    .line 7
    .line 8
    const/4 p2, 0x2

    .line 9
    invoke-virtual {p4, p2}, Ll/g13;->a(I)I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    iput p2, p0, Ll/od1;->K:I

    .line 14
    .line 15
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Ll/od1;->L:I

    .line 20
    .line 21
    if-ne p2, p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    iput p1, p0, Ll/od1;->M:I

    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method private h(IIILl/g13;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput v0, p0, Ll/od1;->u:I

    .line 7
    .line 8
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ll/od1;->v:I

    .line 13
    .line 14
    if-ne v0, p1, :cond_0

    .line 15
    .line 16
    const/16 v0, 0xe

    .line 17
    .line 18
    invoke-virtual {p4, v0}, Ll/g13;->a(I)I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    iput v0, p0, Ll/od1;->w:I

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    iput v0, p0, Ll/od1;->x:I

    .line 29
    .line 30
    if-eqz p2, :cond_7

    .line 31
    .line 32
    const/4 p2, 0x6

    .line 33
    const/16 v0, 0x14

    .line 34
    .line 35
    if-eq p3, p2, :cond_1

    .line 36
    .line 37
    if-ne p3, v0, :cond_2

    .line 38
    .line 39
    :cond_1
    const/4 p2, 0x3

    .line 40
    invoke-virtual {p4, p2}, Ll/g13;->a(I)I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    iput p2, p0, Ll/od1;->y:I

    .line 45
    .line 46
    :cond_2
    iget p2, p0, Ll/od1;->x:I

    .line 47
    .line 48
    if-ne p2, p1, :cond_6

    .line 49
    .line 50
    const/16 p2, 0x16

    .line 51
    .line 52
    if-ne p3, p2, :cond_3

    .line 53
    .line 54
    const/4 p2, 0x5

    .line 55
    invoke-virtual {p4, p2}, Ll/g13;->a(I)I

    .line 56
    .line 57
    .line 58
    move-result p2

    .line 59
    iput p2, p0, Ll/od1;->z:I

    .line 60
    .line 61
    const/16 p2, 0xb

    .line 62
    .line 63
    invoke-virtual {p4, p2}, Ll/g13;->a(I)I

    .line 64
    .line 65
    .line 66
    move-result p2

    .line 67
    iput p2, p0, Ll/od1;->A:I

    .line 68
    .line 69
    :cond_3
    const/16 p2, 0x11

    .line 70
    .line 71
    if-eq p3, p2, :cond_4

    .line 72
    .line 73
    const/16 p2, 0x13

    .line 74
    .line 75
    if-eq p3, p2, :cond_4

    .line 76
    .line 77
    if-eq p3, v0, :cond_4

    .line 78
    .line 79
    const/16 p2, 0x17

    .line 80
    .line 81
    if-ne p3, p2, :cond_5

    .line 82
    .line 83
    :cond_4
    invoke-virtual {p4}, Ll/g13;->b()Z

    .line 84
    .line 85
    .line 86
    move-result p2

    .line 87
    iput-boolean p2, p0, Ll/od1;->B:Z

    .line 88
    .line 89
    invoke-virtual {p4}, Ll/g13;->b()Z

    .line 90
    .line 91
    .line 92
    move-result p2

    .line 93
    iput-boolean p2, p0, Ll/od1;->C:Z

    .line 94
    .line 95
    invoke-virtual {p4}, Ll/g13;->b()Z

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iput-boolean p2, p0, Ll/od1;->D:Z

    .line 100
    .line 101
    :cond_5
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result p2

    .line 105
    iput p2, p0, Ll/od1;->E:I

    .line 106
    .line 107
    :cond_6
    iput-boolean p1, p0, Ll/od1;->F:Z

    .line 108
    .line 109
    return-void

    .line 110
    :cond_7
    const-string p0, "can\'t parse program_config_element yet"

    .line 111
    .line 112
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    return-void
.end method

.method private i(IIILl/g13;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result p1

    .line 6
    iput p1, p0, Ll/od1;->N:I

    .line 7
    .line 8
    const/16 p1, 0x8

    .line 9
    .line 10
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Ll/od1;->O:I

    .line 15
    .line 16
    const/4 p1, 0x4

    .line 17
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iput p1, p0, Ll/od1;->P:I

    .line 22
    .line 23
    const/16 p1, 0xc

    .line 24
    .line 25
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 26
    .line 27
    .line 28
    move-result p1

    .line 29
    iput p1, p0, Ll/od1;->Q:I

    .line 30
    .line 31
    const/4 p1, 0x2

    .line 32
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    iput p1, p0, Ll/od1;->R:I

    .line 37
    .line 38
    return-void
.end method

.method private j(IIILl/g13;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p1, 0x1

    .line 2
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result p2

    .line 6
    iput p2, p0, Ll/od1;->S:I

    .line 7
    .line 8
    if-ne p2, p1, :cond_0

    .line 9
    .line 10
    const/4 p1, 0x2

    .line 11
    invoke-virtual {p4, p1}, Ll/g13;->a(I)I

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    iput p1, p0, Ll/od1;->T:I

    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method private k(IIILl/g13;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-virtual {p4, v0}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iput v0, p0, Ll/od1;->H:I

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    if-eq v0, v1, :cond_0

    .line 10
    .line 11
    invoke-direct {p0, p1, p2, p3, p4}, Ll/od1;->g(IIILl/g13;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    iget v0, p0, Ll/od1;->H:I

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-direct {p0, p1, p2, p3, p4}, Ll/od1;->i(IIILl/g13;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    invoke-virtual {p4, v1}, Ll/g13;->a(I)I

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    iput p1, p0, Ll/od1;->I:I

    .line 26
    .line 27
    iput-boolean v1, p0, Ll/od1;->U:Z

    .line 28
    .line 29
    return-void
.end method

.method private l(IIILl/g13;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p4, v0}, Ll/g13;->a(I)I

    .line 3
    .line 4
    .line 5
    move-result v1

    .line 6
    iput v1, p0, Ll/od1;->G:I

    .line 7
    .line 8
    if-ne v1, v0, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, p1, p2, p3, p4}, Ll/od1;->k(IIILl/g13;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    invoke-direct {p0, p1, p2, p3, p4}, Ll/od1;->j(IIILl/g13;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public e(Ljava/nio/ByteBuffer;)V
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, p0, Ll/cj2;->b:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    iget v2, p0, Ll/cj2;->b:I

    .line 15
    .line 16
    add-int/2addr v1, v2

    .line 17
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 18
    .line 19
    .line 20
    iget p1, p0, Ll/cj2;->b:I

    .line 21
    .line 22
    new-array p1, p1, [B

    .line 23
    .line 24
    iput-object p1, p0, Ll/od1;->d:[B

    .line 25
    .line 26
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    new-instance p1, Ll/g13;

    .line 33
    .line 34
    invoke-direct {p1, v0}, Ll/g13;-><init>(Ljava/nio/ByteBuffer;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0, p1}, Ll/od1;->f(Ll/g13;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput v0, p0, Ll/od1;->f:I

    .line 42
    .line 43
    const/4 v0, 0x4

    .line 44
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iput v1, p0, Ll/od1;->g:I

    .line 49
    .line 50
    const/16 v2, 0x18

    .line 51
    .line 52
    const/16 v3, 0xf

    .line 53
    .line 54
    if-ne v1, v3, :cond_0

    .line 55
    .line 56
    invoke-virtual {p1, v2}, Ll/g13;->a(I)I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    iput v1, p0, Ll/od1;->h:I

    .line 61
    .line 62
    :cond_0
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 63
    .line 64
    .line 65
    move-result v1

    .line 66
    iput v1, p0, Ll/od1;->i:I

    .line 67
    .line 68
    iget v1, p0, Ll/od1;->f:I

    .line 69
    .line 70
    const/16 v4, 0x16

    .line 71
    .line 72
    const/16 v5, 0x1d

    .line 73
    .line 74
    const/4 v6, 0x1

    .line 75
    const/4 v7, 0x5

    .line 76
    if-eq v1, v7, :cond_2

    .line 77
    .line 78
    if-ne v1, v5, :cond_1

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_1
    const/4 v1, 0x0

    .line 82
    iput v1, p0, Ll/od1;->j:I

    .line 83
    .line 84
    goto :goto_1

    .line 85
    :cond_2
    :goto_0
    iput v7, p0, Ll/od1;->j:I

    .line 86
    .line 87
    iput-boolean v6, p0, Ll/od1;->k:Z

    .line 88
    .line 89
    if-ne v1, v5, :cond_3

    .line 90
    .line 91
    iput-boolean v6, p0, Ll/od1;->l:Z

    .line 92
    .line 93
    :cond_3
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    iput v1, p0, Ll/od1;->m:I

    .line 98
    .line 99
    if-ne v1, v3, :cond_4

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Ll/g13;->a(I)I

    .line 102
    .line 103
    .line 104
    move-result v1

    .line 105
    iput v1, p0, Ll/od1;->n:I

    .line 106
    .line 107
    :cond_4
    invoke-direct {p0, p1}, Ll/od1;->f(Ll/g13;)I

    .line 108
    .line 109
    .line 110
    move-result v1

    .line 111
    iput v1, p0, Ll/od1;->f:I

    .line 112
    .line 113
    if-ne v1, v4, :cond_5

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 116
    .line 117
    .line 118
    move-result v1

    .line 119
    iput v1, p0, Ll/od1;->o:I

    .line 120
    .line 121
    :cond_5
    :goto_1
    iget v1, p0, Ll/od1;->f:I

    .line 122
    .line 123
    packed-switch v1, :pswitch_data_0

    .line 124
    .line 125
    .line 126
    :pswitch_0
    goto :goto_2

    .line 127
    :pswitch_1
    const-string p0, "can\'t parse SymbolicMusicSpecificConfig yet"

    .line 128
    .line 129
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return-void

    .line 133
    :pswitch_2
    new-instance v1, Ll/od1$a;

    .line 134
    .line 135
    iget v5, p0, Ll/od1;->i:I

    .line 136
    .line 137
    invoke-direct {v1, p0, v5, p1}, Ll/od1$a;-><init>(Ll/od1;ILl/g13;)V

    .line 138
    .line 139
    .line 140
    iput-object v1, p0, Ll/od1;->e:Ll/od1$a;

    .line 141
    .line 142
    goto :goto_2

    .line 143
    :pswitch_3
    const-string p0, "can\'t parse SLSSpecificConfig yet"

    .line 144
    .line 145
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :pswitch_4
    invoke-virtual {p1, v7}, Ll/g13;->a(I)I

    .line 150
    .line 151
    .line 152
    move-result p1

    .line 153
    iput p1, p0, Ll/od1;->q:I

    .line 154
    .line 155
    const-string p0, "can\'t parse ALSSpecificConfig yet"

    .line 156
    .line 157
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :pswitch_5
    const-string p0, "can\'t parse DSTSpecificConfig yet"

    .line 162
    .line 163
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 164
    .line 165
    .line 166
    return-void

    .line 167
    :pswitch_6
    const-string p0, "can\'t parse MPEG_1_2_SpecificConfig yet"

    .line 168
    .line 169
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :pswitch_7
    invoke-virtual {p1, v6}, Ll/g13;->a(I)I

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    iput p1, p0, Ll/od1;->p:I

    .line 178
    .line 179
    const-string p0, "can\'t parse SpatialSpecificConfig yet"

    .line 180
    .line 181
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :pswitch_8
    const-string p0, "can\'t parse SSCSpecificConfig yet"

    .line 186
    .line 187
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :pswitch_9
    iget v5, p0, Ll/od1;->g:I

    .line 192
    .line 193
    iget v8, p0, Ll/od1;->i:I

    .line 194
    .line 195
    invoke-direct {p0, v5, v8, v1, p1}, Ll/od1;->l(IIILl/g13;)V

    .line 196
    .line 197
    .line 198
    goto :goto_2

    .line 199
    :pswitch_a
    const-string p0, "can\'t parse ErrorResilientHvxcSpecificConfig yet"

    .line 200
    .line 201
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    return-void

    .line 205
    :pswitch_b
    const-string p0, "can\'t parse ErrorResilientCelpSpecificConfig yet"

    .line 206
    .line 207
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :pswitch_c
    const-string p0, "can\'t parse StructuredAudioSpecificConfig yet"

    .line 212
    .line 213
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    return-void

    .line 217
    :pswitch_d
    const-string p0, "can\'t parse TTSSpecificConfig yet"

    .line 218
    .line 219
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :pswitch_e
    const-string p0, "can\'t parse HvxcSpecificConfig yet"

    .line 224
    .line 225
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :pswitch_f
    const-string p0, "can\'t parse CelpSpecificConfig yet"

    .line 230
    .line 231
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :pswitch_10
    iget v5, p0, Ll/od1;->g:I

    .line 236
    .line 237
    iget v8, p0, Ll/od1;->i:I

    .line 238
    .line 239
    invoke-direct {p0, v5, v8, v1, p1}, Ll/od1;->h(IIILl/g13;)V

    .line 240
    .line 241
    .line 242
    :goto_2
    iget v1, p0, Ll/od1;->f:I

    .line 243
    .line 244
    const/16 v5, 0x11

    .line 245
    .line 246
    if-eq v1, v5, :cond_6

    .line 247
    .line 248
    const/16 v5, 0x27

    .line 249
    .line 250
    if-eq v1, v5, :cond_6

    .line 251
    .line 252
    packed-switch v1, :pswitch_data_1

    .line 253
    .line 254
    .line 255
    goto :goto_3

    .line 256
    :cond_6
    :pswitch_11
    const/4 v1, 0x2

    .line 257
    invoke-virtual {p1, v1}, Ll/g13;->a(I)I

    .line 258
    .line 259
    .line 260
    move-result v5

    .line 261
    iput v5, p0, Ll/od1;->r:I

    .line 262
    .line 263
    if-eq v5, v1, :cond_d

    .line 264
    .line 265
    const/4 v1, 0x3

    .line 266
    if-eq v5, v1, :cond_d

    .line 267
    .line 268
    if-ne v5, v1, :cond_8

    .line 269
    .line 270
    invoke-virtual {p1, v6}, Ll/g13;->a(I)I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    iput v1, p0, Ll/od1;->s:I

    .line 275
    .line 276
    if-eqz v1, :cond_7

    .line 277
    .line 278
    goto :goto_3

    .line 279
    :cond_7
    const-string p0, "not implemented"

    .line 280
    .line 281
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 282
    .line 283
    .line 284
    return-void

    .line 285
    :cond_8
    :goto_3
    iget v1, p0, Ll/od1;->j:I

    .line 286
    .line 287
    if-eq v1, v7, :cond_c

    .line 288
    .line 289
    invoke-virtual {p1}, Ll/g13;->c()I

    .line 290
    .line 291
    .line 292
    move-result v1

    .line 293
    const/16 v5, 0x10

    .line 294
    .line 295
    if-lt v1, v5, :cond_c

    .line 296
    .line 297
    const/16 v1, 0xb

    .line 298
    .line 299
    invoke-virtual {p1, v1}, Ll/g13;->a(I)I

    .line 300
    .line 301
    .line 302
    move-result v5

    .line 303
    iput v5, p0, Ll/od1;->t:I

    .line 304
    .line 305
    const/16 v6, 0x2b7

    .line 306
    .line 307
    if-ne v5, v6, :cond_c

    .line 308
    .line 309
    invoke-direct {p0, p1}, Ll/od1;->f(Ll/g13;)I

    .line 310
    .line 311
    .line 312
    move-result v5

    .line 313
    iput v5, p0, Ll/od1;->j:I

    .line 314
    .line 315
    if-ne v5, v7, :cond_a

    .line 316
    .line 317
    invoke-virtual {p1}, Ll/g13;->b()Z

    .line 318
    .line 319
    .line 320
    move-result v5

    .line 321
    iput-boolean v5, p0, Ll/od1;->k:Z

    .line 322
    .line 323
    if-eqz v5, :cond_a

    .line 324
    .line 325
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 326
    .line 327
    .line 328
    move-result v5

    .line 329
    iput v5, p0, Ll/od1;->m:I

    .line 330
    .line 331
    if-ne v5, v3, :cond_9

    .line 332
    .line 333
    invoke-virtual {p1, v2}, Ll/g13;->a(I)I

    .line 334
    .line 335
    .line 336
    move-result v5

    .line 337
    iput v5, p0, Ll/od1;->n:I

    .line 338
    .line 339
    :cond_9
    invoke-virtual {p1}, Ll/g13;->c()I

    .line 340
    .line 341
    .line 342
    move-result v5

    .line 343
    const/16 v6, 0xc

    .line 344
    .line 345
    if-lt v5, v6, :cond_a

    .line 346
    .line 347
    invoke-virtual {p1, v1}, Ll/g13;->a(I)I

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    iput v1, p0, Ll/od1;->t:I

    .line 352
    .line 353
    const/16 v5, 0x548

    .line 354
    .line 355
    if-ne v1, v5, :cond_a

    .line 356
    .line 357
    invoke-virtual {p1}, Ll/g13;->b()Z

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    iput-boolean v1, p0, Ll/od1;->l:Z

    .line 362
    .line 363
    :cond_a
    iget v1, p0, Ll/od1;->j:I

    .line 364
    .line 365
    if-ne v1, v4, :cond_c

    .line 366
    .line 367
    invoke-virtual {p1}, Ll/g13;->b()Z

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    iput-boolean v1, p0, Ll/od1;->k:Z

    .line 372
    .line 373
    if-eqz v1, :cond_b

    .line 374
    .line 375
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 376
    .line 377
    .line 378
    move-result v1

    .line 379
    iput v1, p0, Ll/od1;->m:I

    .line 380
    .line 381
    if-ne v1, v3, :cond_b

    .line 382
    .line 383
    invoke-virtual {p1, v2}, Ll/g13;->a(I)I

    .line 384
    .line 385
    .line 386
    move-result v1

    .line 387
    iput v1, p0, Ll/od1;->n:I

    .line 388
    .line 389
    :cond_b
    invoke-virtual {p1, v0}, Ll/g13;->a(I)I

    .line 390
    .line 391
    .line 392
    move-result p1

    .line 393
    iput p1, p0, Ll/od1;->o:I

    .line 394
    .line 395
    :cond_c
    return-void

    .line 396
    :cond_d
    const-string p0, "can\'t parse ErrorProtectionSpecificConfig yet"

    .line 397
    .line 398
    invoke-static {p0}, Ll/pr3;->a(Ljava/lang/String;)V

    .line 399
    .line 400
    .line 401
    return-void

    .line 402
    nop

    .line 403
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_0
        :pswitch_10
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_0
        :pswitch_0
        :pswitch_d
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_c
        :pswitch_10
        :pswitch_0
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_10
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_9
        :pswitch_8
        :pswitch_0
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_6
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
    .end packed-switch

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
    :pswitch_data_1
    .packed-switch 0x13
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
        :pswitch_11
    .end packed-switch
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 4

    .line 1
    const/4 v0, 0x1

    .line 2
    if-ne p0, p1, :cond_0

    .line 3
    .line 4
    return v0

    .line 5
    :cond_0
    const/4 v1, 0x0

    .line 6
    if-eqz p1, :cond_2d

    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 9
    .line 10
    .line 11
    move-result-object v2

    .line 12
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    if-eq v2, v3, :cond_1

    .line 17
    .line 18
    goto/16 :goto_0

    .line 19
    .line 20
    :cond_1
    check-cast p1, Ll/od1;

    .line 21
    .line 22
    iget-boolean v2, p0, Ll/od1;->C:Z

    .line 23
    .line 24
    iget-boolean v3, p1, Ll/od1;->C:Z

    .line 25
    .line 26
    if-eq v2, v3, :cond_2

    .line 27
    .line 28
    return v1

    .line 29
    :cond_2
    iget-boolean v2, p0, Ll/od1;->B:Z

    .line 30
    .line 31
    iget-boolean v3, p1, Ll/od1;->B:Z

    .line 32
    .line 33
    if-eq v2, v3, :cond_3

    .line 34
    .line 35
    return v1

    .line 36
    :cond_3
    iget-boolean v2, p0, Ll/od1;->D:Z

    .line 37
    .line 38
    iget-boolean v3, p1, Ll/od1;->D:Z

    .line 39
    .line 40
    if-eq v2, v3, :cond_4

    .line 41
    .line 42
    return v1

    .line 43
    :cond_4
    iget v2, p0, Ll/od1;->f:I

    .line 44
    .line 45
    iget v3, p1, Ll/od1;->f:I

    .line 46
    .line 47
    if-eq v2, v3, :cond_5

    .line 48
    .line 49
    return v1

    .line 50
    :cond_5
    iget v2, p0, Ll/od1;->i:I

    .line 51
    .line 52
    iget v3, p1, Ll/od1;->i:I

    .line 53
    .line 54
    if-eq v2, v3, :cond_6

    .line 55
    .line 56
    return v1

    .line 57
    :cond_6
    iget v2, p0, Ll/od1;->w:I

    .line 58
    .line 59
    iget v3, p1, Ll/od1;->w:I

    .line 60
    .line 61
    if-eq v2, v3, :cond_7

    .line 62
    .line 63
    return v1

    .line 64
    :cond_7
    iget v2, p0, Ll/od1;->v:I

    .line 65
    .line 66
    iget v3, p1, Ll/od1;->v:I

    .line 67
    .line 68
    if-eq v2, v3, :cond_8

    .line 69
    .line 70
    return v1

    .line 71
    :cond_8
    iget v2, p0, Ll/od1;->s:I

    .line 72
    .line 73
    iget v3, p1, Ll/od1;->s:I

    .line 74
    .line 75
    if-eq v2, v3, :cond_9

    .line 76
    .line 77
    return v1

    .line 78
    :cond_9
    iget v2, p0, Ll/od1;->r:I

    .line 79
    .line 80
    iget v3, p1, Ll/od1;->r:I

    .line 81
    .line 82
    if-eq v2, v3, :cond_a

    .line 83
    .line 84
    return v1

    .line 85
    :cond_a
    iget v2, p0, Ll/od1;->L:I

    .line 86
    .line 87
    iget v3, p1, Ll/od1;->L:I

    .line 88
    .line 89
    if-eq v2, v3, :cond_b

    .line 90
    .line 91
    return v1

    .line 92
    :cond_b
    iget v2, p0, Ll/od1;->j:I

    .line 93
    .line 94
    iget v3, p1, Ll/od1;->j:I

    .line 95
    .line 96
    if-eq v2, v3, :cond_c

    .line 97
    .line 98
    return v1

    .line 99
    :cond_c
    iget v2, p0, Ll/od1;->o:I

    .line 100
    .line 101
    iget v3, p1, Ll/od1;->o:I

    .line 102
    .line 103
    if-eq v2, v3, :cond_d

    .line 104
    .line 105
    return v1

    .line 106
    :cond_d
    iget v2, p0, Ll/od1;->x:I

    .line 107
    .line 108
    iget v3, p1, Ll/od1;->x:I

    .line 109
    .line 110
    if-eq v2, v3, :cond_e

    .line 111
    .line 112
    return v1

    .line 113
    :cond_e
    iget v2, p0, Ll/od1;->E:I

    .line 114
    .line 115
    iget v3, p1, Ll/od1;->E:I

    .line 116
    .line 117
    if-eq v2, v3, :cond_f

    .line 118
    .line 119
    return v1

    .line 120
    :cond_f
    iget v2, p0, Ll/od1;->n:I

    .line 121
    .line 122
    iget v3, p1, Ll/od1;->n:I

    .line 123
    .line 124
    if-eq v2, v3, :cond_10

    .line 125
    .line 126
    return v1

    .line 127
    :cond_10
    iget v2, p0, Ll/od1;->m:I

    .line 128
    .line 129
    iget v3, p1, Ll/od1;->m:I

    .line 130
    .line 131
    if-eq v2, v3, :cond_11

    .line 132
    .line 133
    return v1

    .line 134
    :cond_11
    iget v2, p0, Ll/od1;->q:I

    .line 135
    .line 136
    iget v3, p1, Ll/od1;->q:I

    .line 137
    .line 138
    if-eq v2, v3, :cond_12

    .line 139
    .line 140
    return v1

    .line 141
    :cond_12
    iget v2, p0, Ll/od1;->u:I

    .line 142
    .line 143
    iget v3, p1, Ll/od1;->u:I

    .line 144
    .line 145
    if-eq v2, v3, :cond_13

    .line 146
    .line 147
    return v1

    .line 148
    :cond_13
    iget-boolean v2, p0, Ll/od1;->F:Z

    .line 149
    .line 150
    iget-boolean v3, p1, Ll/od1;->F:Z

    .line 151
    .line 152
    if-eq v2, v3, :cond_14

    .line 153
    .line 154
    return v1

    .line 155
    :cond_14
    iget v2, p0, Ll/od1;->R:I

    .line 156
    .line 157
    iget v3, p1, Ll/od1;->R:I

    .line 158
    .line 159
    if-eq v2, v3, :cond_15

    .line 160
    .line 161
    return v1

    .line 162
    :cond_15
    iget v2, p0, Ll/od1;->S:I

    .line 163
    .line 164
    iget v3, p1, Ll/od1;->S:I

    .line 165
    .line 166
    if-eq v2, v3, :cond_16

    .line 167
    .line 168
    return v1

    .line 169
    :cond_16
    iget v2, p0, Ll/od1;->T:I

    .line 170
    .line 171
    iget v3, p1, Ll/od1;->T:I

    .line 172
    .line 173
    if-eq v2, v3, :cond_17

    .line 174
    .line 175
    return v1

    .line 176
    :cond_17
    iget v2, p0, Ll/od1;->Q:I

    .line 177
    .line 178
    iget v3, p1, Ll/od1;->Q:I

    .line 179
    .line 180
    if-eq v2, v3, :cond_18

    .line 181
    .line 182
    return v1

    .line 183
    :cond_18
    iget v2, p0, Ll/od1;->O:I

    .line 184
    .line 185
    iget v3, p1, Ll/od1;->O:I

    .line 186
    .line 187
    if-eq v2, v3, :cond_19

    .line 188
    .line 189
    return v1

    .line 190
    :cond_19
    iget v2, p0, Ll/od1;->N:I

    .line 191
    .line 192
    iget v3, p1, Ll/od1;->N:I

    .line 193
    .line 194
    if-eq v2, v3, :cond_1a

    .line 195
    .line 196
    return v1

    .line 197
    :cond_1a
    iget v2, p0, Ll/od1;->P:I

    .line 198
    .line 199
    iget v3, p1, Ll/od1;->P:I

    .line 200
    .line 201
    if-eq v2, v3, :cond_1b

    .line 202
    .line 203
    return v1

    .line 204
    :cond_1b
    iget v2, p0, Ll/od1;->K:I

    .line 205
    .line 206
    iget v3, p1, Ll/od1;->K:I

    .line 207
    .line 208
    if-eq v2, v3, :cond_1c

    .line 209
    .line 210
    return v1

    .line 211
    :cond_1c
    iget v2, p0, Ll/od1;->J:I

    .line 212
    .line 213
    iget v3, p1, Ll/od1;->J:I

    .line 214
    .line 215
    if-eq v2, v3, :cond_1d

    .line 216
    .line 217
    return v1

    .line 218
    :cond_1d
    iget v2, p0, Ll/od1;->G:I

    .line 219
    .line 220
    iget v3, p1, Ll/od1;->G:I

    .line 221
    .line 222
    if-eq v2, v3, :cond_1e

    .line 223
    .line 224
    return v1

    .line 225
    :cond_1e
    iget v2, p0, Ll/od1;->y:I

    .line 226
    .line 227
    iget v3, p1, Ll/od1;->y:I

    .line 228
    .line 229
    if-eq v2, v3, :cond_1f

    .line 230
    .line 231
    return v1

    .line 232
    :cond_1f
    iget v2, p0, Ll/od1;->A:I

    .line 233
    .line 234
    iget v3, p1, Ll/od1;->A:I

    .line 235
    .line 236
    if-eq v2, v3, :cond_20

    .line 237
    .line 238
    return v1

    .line 239
    :cond_20
    iget v2, p0, Ll/od1;->z:I

    .line 240
    .line 241
    iget v3, p1, Ll/od1;->z:I

    .line 242
    .line 243
    if-eq v2, v3, :cond_21

    .line 244
    .line 245
    return v1

    .line 246
    :cond_21
    iget v2, p0, Ll/od1;->I:I

    .line 247
    .line 248
    iget v3, p1, Ll/od1;->I:I

    .line 249
    .line 250
    if-eq v2, v3, :cond_22

    .line 251
    .line 252
    return v1

    .line 253
    :cond_22
    iget v2, p0, Ll/od1;->H:I

    .line 254
    .line 255
    iget v3, p1, Ll/od1;->H:I

    .line 256
    .line 257
    if-eq v2, v3, :cond_23

    .line 258
    .line 259
    return v1

    .line 260
    :cond_23
    iget-boolean v2, p0, Ll/od1;->U:Z

    .line 261
    .line 262
    iget-boolean v3, p1, Ll/od1;->U:Z

    .line 263
    .line 264
    if-eq v2, v3, :cond_24

    .line 265
    .line 266
    return v1

    .line 267
    :cond_24
    iget-boolean v2, p0, Ll/od1;->l:Z

    .line 268
    .line 269
    iget-boolean v3, p1, Ll/od1;->l:Z

    .line 270
    .line 271
    if-eq v2, v3, :cond_25

    .line 272
    .line 273
    return v1

    .line 274
    :cond_25
    iget v2, p0, Ll/od1;->p:I

    .line 275
    .line 276
    iget v3, p1, Ll/od1;->p:I

    .line 277
    .line 278
    if-eq v2, v3, :cond_26

    .line 279
    .line 280
    return v1

    .line 281
    :cond_26
    iget v2, p0, Ll/od1;->h:I

    .line 282
    .line 283
    iget v3, p1, Ll/od1;->h:I

    .line 284
    .line 285
    if-eq v2, v3, :cond_27

    .line 286
    .line 287
    return v1

    .line 288
    :cond_27
    iget v2, p0, Ll/od1;->g:I

    .line 289
    .line 290
    iget v3, p1, Ll/od1;->g:I

    .line 291
    .line 292
    if-eq v2, v3, :cond_28

    .line 293
    .line 294
    return v1

    .line 295
    :cond_28
    iget-boolean v2, p0, Ll/od1;->k:Z

    .line 296
    .line 297
    iget-boolean v3, p1, Ll/od1;->k:Z

    .line 298
    .line 299
    if-eq v2, v3, :cond_29

    .line 300
    .line 301
    return v1

    .line 302
    :cond_29
    iget v2, p0, Ll/od1;->t:I

    .line 303
    .line 304
    iget v3, p1, Ll/od1;->t:I

    .line 305
    .line 306
    if-eq v2, v3, :cond_2a

    .line 307
    .line 308
    return v1

    .line 309
    :cond_2a
    iget v2, p0, Ll/od1;->M:I

    .line 310
    .line 311
    iget v3, p1, Ll/od1;->M:I

    .line 312
    .line 313
    if-eq v2, v3, :cond_2b

    .line 314
    .line 315
    return v1

    .line 316
    :cond_2b
    iget-object p0, p0, Ll/od1;->d:[B

    .line 317
    .line 318
    iget-object p1, p1, Ll/od1;->d:[B

    .line 319
    .line 320
    invoke-static {p0, p1}, Ljava/util/Arrays;->equals([B[B)Z

    .line 321
    .line 322
    .line 323
    move-result p0

    .line 324
    if-nez p0, :cond_2c

    .line 325
    .line 326
    return v1

    .line 327
    :cond_2c
    return v0

    .line 328
    :cond_2d
    :goto_0
    return v1
.end method

.method public hashCode()I
    .locals 2

    .line 1
    iget-object v0, p0, Ll/od1;->d:[B

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x0

    .line 11
    :goto_0
    mul-int/lit8 v0, v0, 0x1f

    .line 12
    .line 13
    iget v1, p0, Ll/od1;->f:I

    .line 14
    .line 15
    add-int/2addr v0, v1

    .line 16
    mul-int/lit8 v0, v0, 0x1f

    .line 17
    .line 18
    iget v1, p0, Ll/od1;->g:I

    .line 19
    .line 20
    add-int/2addr v0, v1

    .line 21
    mul-int/lit8 v0, v0, 0x1f

    .line 22
    .line 23
    iget v1, p0, Ll/od1;->h:I

    .line 24
    .line 25
    add-int/2addr v0, v1

    .line 26
    mul-int/lit8 v0, v0, 0x1f

    .line 27
    .line 28
    iget v1, p0, Ll/od1;->i:I

    .line 29
    .line 30
    add-int/2addr v0, v1

    .line 31
    mul-int/lit8 v0, v0, 0x1f

    .line 32
    .line 33
    iget v1, p0, Ll/od1;->j:I

    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    mul-int/lit8 v0, v0, 0x1f

    .line 37
    .line 38
    iget-boolean v1, p0, Ll/od1;->k:Z

    .line 39
    .line 40
    add-int/2addr v0, v1

    .line 41
    mul-int/lit8 v0, v0, 0x1f

    .line 42
    .line 43
    iget-boolean v1, p0, Ll/od1;->l:Z

    .line 44
    .line 45
    add-int/2addr v0, v1

    .line 46
    mul-int/lit8 v0, v0, 0x1f

    .line 47
    .line 48
    iget v1, p0, Ll/od1;->m:I

    .line 49
    .line 50
    add-int/2addr v0, v1

    .line 51
    mul-int/lit8 v0, v0, 0x1f

    .line 52
    .line 53
    iget v1, p0, Ll/od1;->n:I

    .line 54
    .line 55
    add-int/2addr v0, v1

    .line 56
    mul-int/lit8 v0, v0, 0x1f

    .line 57
    .line 58
    iget v1, p0, Ll/od1;->o:I

    .line 59
    .line 60
    add-int/2addr v0, v1

    .line 61
    mul-int/lit8 v0, v0, 0x1f

    .line 62
    .line 63
    iget v1, p0, Ll/od1;->p:I

    .line 64
    .line 65
    add-int/2addr v0, v1

    .line 66
    mul-int/lit8 v0, v0, 0x1f

    .line 67
    .line 68
    iget v1, p0, Ll/od1;->q:I

    .line 69
    .line 70
    add-int/2addr v0, v1

    .line 71
    mul-int/lit8 v0, v0, 0x1f

    .line 72
    .line 73
    iget v1, p0, Ll/od1;->r:I

    .line 74
    .line 75
    add-int/2addr v0, v1

    .line 76
    mul-int/lit8 v0, v0, 0x1f

    .line 77
    .line 78
    iget v1, p0, Ll/od1;->s:I

    .line 79
    .line 80
    add-int/2addr v0, v1

    .line 81
    mul-int/lit8 v0, v0, 0x1f

    .line 82
    .line 83
    iget v1, p0, Ll/od1;->t:I

    .line 84
    .line 85
    add-int/2addr v0, v1

    .line 86
    mul-int/lit8 v0, v0, 0x1f

    .line 87
    .line 88
    iget v1, p0, Ll/od1;->u:I

    .line 89
    .line 90
    add-int/2addr v0, v1

    .line 91
    mul-int/lit8 v0, v0, 0x1f

    .line 92
    .line 93
    iget v1, p0, Ll/od1;->v:I

    .line 94
    .line 95
    add-int/2addr v0, v1

    .line 96
    mul-int/lit8 v0, v0, 0x1f

    .line 97
    .line 98
    iget v1, p0, Ll/od1;->w:I

    .line 99
    .line 100
    add-int/2addr v0, v1

    .line 101
    mul-int/lit8 v0, v0, 0x1f

    .line 102
    .line 103
    iget v1, p0, Ll/od1;->x:I

    .line 104
    .line 105
    add-int/2addr v0, v1

    .line 106
    mul-int/lit8 v0, v0, 0x1f

    .line 107
    .line 108
    iget v1, p0, Ll/od1;->y:I

    .line 109
    .line 110
    add-int/2addr v0, v1

    .line 111
    mul-int/lit8 v0, v0, 0x1f

    .line 112
    .line 113
    iget v1, p0, Ll/od1;->z:I

    .line 114
    .line 115
    add-int/2addr v0, v1

    .line 116
    mul-int/lit8 v0, v0, 0x1f

    .line 117
    .line 118
    iget v1, p0, Ll/od1;->A:I

    .line 119
    .line 120
    add-int/2addr v0, v1

    .line 121
    mul-int/lit8 v0, v0, 0x1f

    .line 122
    .line 123
    iget-boolean v1, p0, Ll/od1;->B:Z

    .line 124
    .line 125
    add-int/2addr v0, v1

    .line 126
    mul-int/lit8 v0, v0, 0x1f

    .line 127
    .line 128
    iget-boolean v1, p0, Ll/od1;->C:Z

    .line 129
    .line 130
    add-int/2addr v0, v1

    .line 131
    mul-int/lit8 v0, v0, 0x1f

    .line 132
    .line 133
    iget-boolean v1, p0, Ll/od1;->D:Z

    .line 134
    .line 135
    add-int/2addr v0, v1

    .line 136
    mul-int/lit8 v0, v0, 0x1f

    .line 137
    .line 138
    iget v1, p0, Ll/od1;->E:I

    .line 139
    .line 140
    add-int/2addr v0, v1

    .line 141
    mul-int/lit8 v0, v0, 0x1f

    .line 142
    .line 143
    iget-boolean v1, p0, Ll/od1;->F:Z

    .line 144
    .line 145
    add-int/2addr v0, v1

    .line 146
    mul-int/lit8 v0, v0, 0x1f

    .line 147
    .line 148
    iget v1, p0, Ll/od1;->G:I

    .line 149
    .line 150
    add-int/2addr v0, v1

    .line 151
    mul-int/lit8 v0, v0, 0x1f

    .line 152
    .line 153
    iget v1, p0, Ll/od1;->H:I

    .line 154
    .line 155
    add-int/2addr v0, v1

    .line 156
    mul-int/lit8 v0, v0, 0x1f

    .line 157
    .line 158
    iget v1, p0, Ll/od1;->I:I

    .line 159
    .line 160
    add-int/2addr v0, v1

    .line 161
    mul-int/lit8 v0, v0, 0x1f

    .line 162
    .line 163
    iget v1, p0, Ll/od1;->J:I

    .line 164
    .line 165
    add-int/2addr v0, v1

    .line 166
    mul-int/lit8 v0, v0, 0x1f

    .line 167
    .line 168
    iget v1, p0, Ll/od1;->K:I

    .line 169
    .line 170
    add-int/2addr v0, v1

    .line 171
    mul-int/lit8 v0, v0, 0x1f

    .line 172
    .line 173
    iget v1, p0, Ll/od1;->L:I

    .line 174
    .line 175
    add-int/2addr v0, v1

    .line 176
    mul-int/lit8 v0, v0, 0x1f

    .line 177
    .line 178
    iget v1, p0, Ll/od1;->M:I

    .line 179
    .line 180
    add-int/2addr v0, v1

    .line 181
    mul-int/lit8 v0, v0, 0x1f

    .line 182
    .line 183
    iget v1, p0, Ll/od1;->N:I

    .line 184
    .line 185
    add-int/2addr v0, v1

    .line 186
    mul-int/lit8 v0, v0, 0x1f

    .line 187
    .line 188
    iget v1, p0, Ll/od1;->O:I

    .line 189
    .line 190
    add-int/2addr v0, v1

    .line 191
    mul-int/lit8 v0, v0, 0x1f

    .line 192
    .line 193
    iget v1, p0, Ll/od1;->P:I

    .line 194
    .line 195
    add-int/2addr v0, v1

    .line 196
    mul-int/lit8 v0, v0, 0x1f

    .line 197
    .line 198
    iget v1, p0, Ll/od1;->Q:I

    .line 199
    .line 200
    add-int/2addr v0, v1

    .line 201
    mul-int/lit8 v0, v0, 0x1f

    .line 202
    .line 203
    iget v1, p0, Ll/od1;->R:I

    .line 204
    .line 205
    add-int/2addr v0, v1

    .line 206
    mul-int/lit8 v0, v0, 0x1f

    .line 207
    .line 208
    iget v1, p0, Ll/od1;->S:I

    .line 209
    .line 210
    add-int/2addr v0, v1

    .line 211
    mul-int/lit8 v0, v0, 0x1f

    .line 212
    .line 213
    iget v1, p0, Ll/od1;->T:I

    .line 214
    .line 215
    add-int/2addr v0, v1

    .line 216
    mul-int/lit8 v0, v0, 0x1f

    .line 217
    .line 218
    iget-boolean p0, p0, Ll/od1;->U:Z

    .line 219
    .line 220
    add-int/2addr v0, p0

    .line 221
    return v0
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "AudioSpecificConfig{configBytes="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Ll/od1;->d:[B

    .line 9
    .line 10
    invoke-static {v1}, Ll/g2l;->a([B)Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, ", audioObjectType="

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    iget v1, p0, Ll/od1;->f:I

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, " ("

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    sget-object v2, Ll/od1;->W:Ljava/util/Map;

    .line 33
    .line 34
    iget v3, p0, Ll/od1;->f:I

    .line 35
    .line 36
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    check-cast v2, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    const-string v2, "), samplingFrequencyIndex="

    .line 50
    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    iget v2, p0, Ll/od1;->g:I

    .line 55
    .line 56
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    sget-object v2, Ll/od1;->V:Ljava/util/Map;

    .line 63
    .line 64
    iget v3, p0, Ll/od1;->g:I

    .line 65
    .line 66
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 67
    .line 68
    .line 69
    move-result-object v3

    .line 70
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    const-string v2, "), samplingFrequency="

    .line 78
    .line 79
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    iget v2, p0, Ll/od1;->h:I

    .line 83
    .line 84
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 85
    .line 86
    .line 87
    const-string v2, ", channelConfiguration="

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    iget v2, p0, Ll/od1;->i:I

    .line 93
    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    iget v2, p0, Ll/od1;->j:I

    .line 98
    .line 99
    if-lez v2, :cond_0

    .line 100
    .line 101
    const-string v2, ", extensionAudioObjectType="

    .line 102
    .line 103
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget v2, p0, Ll/od1;->j:I

    .line 107
    .line 108
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    sget-object v2, Ll/od1;->W:Ljava/util/Map;

    .line 115
    .line 116
    iget v3, p0, Ll/od1;->j:I

    .line 117
    .line 118
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-interface {v2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    check-cast v2, Ljava/lang/String;

    .line 127
    .line 128
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string v2, "), sbrPresentFlag="

    .line 132
    .line 133
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    iget-boolean v2, p0, Ll/od1;->k:Z

    .line 137
    .line 138
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 139
    .line 140
    .line 141
    const-string v2, ", psPresentFlag="

    .line 142
    .line 143
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 144
    .line 145
    .line 146
    iget-boolean v2, p0, Ll/od1;->l:Z

    .line 147
    .line 148
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 149
    .line 150
    .line 151
    const-string v2, ", extensionSamplingFrequencyIndex="

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 154
    .line 155
    .line 156
    iget v2, p0, Ll/od1;->m:I

    .line 157
    .line 158
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 159
    .line 160
    .line 161
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 162
    .line 163
    .line 164
    sget-object v1, Ll/od1;->V:Ljava/util/Map;

    .line 165
    .line 166
    iget v2, p0, Ll/od1;->m:I

    .line 167
    .line 168
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 177
    .line 178
    .line 179
    const-string v1, "), extensionSamplingFrequency="

    .line 180
    .line 181
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 182
    .line 183
    .line 184
    iget v1, p0, Ll/od1;->n:I

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    const-string v1, ", extensionChannelConfiguration="

    .line 190
    .line 191
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    iget v1, p0, Ll/od1;->o:I

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    :cond_0
    const-string v1, ", syncExtensionType="

    .line 200
    .line 201
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    iget v1, p0, Ll/od1;->t:I

    .line 205
    .line 206
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    iget-boolean v1, p0, Ll/od1;->F:Z

    .line 210
    .line 211
    if-eqz v1, :cond_1

    .line 212
    .line 213
    const-string v1, ", frameLengthFlag="

    .line 214
    .line 215
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 216
    .line 217
    .line 218
    iget v1, p0, Ll/od1;->u:I

    .line 219
    .line 220
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 221
    .line 222
    .line 223
    const-string v1, ", dependsOnCoreCoder="

    .line 224
    .line 225
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 226
    .line 227
    .line 228
    iget v1, p0, Ll/od1;->v:I

    .line 229
    .line 230
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 231
    .line 232
    .line 233
    const-string v1, ", coreCoderDelay="

    .line 234
    .line 235
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 236
    .line 237
    .line 238
    iget v1, p0, Ll/od1;->w:I

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    const-string v1, ", extensionFlag="

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    iget v1, p0, Ll/od1;->x:I

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    const-string v1, ", layerNr="

    .line 254
    .line 255
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 256
    .line 257
    .line 258
    iget v1, p0, Ll/od1;->y:I

    .line 259
    .line 260
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 261
    .line 262
    .line 263
    const-string v1, ", numOfSubFrame="

    .line 264
    .line 265
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    iget v1, p0, Ll/od1;->z:I

    .line 269
    .line 270
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 271
    .line 272
    .line 273
    const-string v1, ", layer_length="

    .line 274
    .line 275
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 276
    .line 277
    .line 278
    iget v1, p0, Ll/od1;->A:I

    .line 279
    .line 280
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    const-string v1, ", aacSectionDataResilienceFlag="

    .line 284
    .line 285
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    iget-boolean v1, p0, Ll/od1;->B:Z

    .line 289
    .line 290
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    const-string v1, ", aacScalefactorDataResilienceFlag="

    .line 294
    .line 295
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 296
    .line 297
    .line 298
    iget-boolean v1, p0, Ll/od1;->C:Z

    .line 299
    .line 300
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 301
    .line 302
    .line 303
    const-string v1, ", aacSpectralDataResilienceFlag="

    .line 304
    .line 305
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    iget-boolean v1, p0, Ll/od1;->D:Z

    .line 309
    .line 310
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v1, ", extensionFlag3="

    .line 314
    .line 315
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget v1, p0, Ll/od1;->E:I

    .line 319
    .line 320
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 321
    .line 322
    .line 323
    :cond_1
    iget-boolean v1, p0, Ll/od1;->U:Z

    .line 324
    .line 325
    if-eqz v1, :cond_2

    .line 326
    .line 327
    const-string v1, ", isBaseLayer="

    .line 328
    .line 329
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 330
    .line 331
    .line 332
    iget v1, p0, Ll/od1;->G:I

    .line 333
    .line 334
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 335
    .line 336
    .line 337
    const-string v1, ", paraMode="

    .line 338
    .line 339
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    iget v1, p0, Ll/od1;->H:I

    .line 343
    .line 344
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 345
    .line 346
    .line 347
    const-string v1, ", paraExtensionFlag="

    .line 348
    .line 349
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 350
    .line 351
    .line 352
    iget v1, p0, Ll/od1;->I:I

    .line 353
    .line 354
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 355
    .line 356
    .line 357
    const-string v1, ", hvxcVarMode="

    .line 358
    .line 359
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 360
    .line 361
    .line 362
    iget v1, p0, Ll/od1;->J:I

    .line 363
    .line 364
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 365
    .line 366
    .line 367
    const-string v1, ", hvxcRateMode="

    .line 368
    .line 369
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 370
    .line 371
    .line 372
    iget v1, p0, Ll/od1;->K:I

    .line 373
    .line 374
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 375
    .line 376
    .line 377
    const-string v1, ", erHvxcExtensionFlag="

    .line 378
    .line 379
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 380
    .line 381
    .line 382
    iget v1, p0, Ll/od1;->L:I

    .line 383
    .line 384
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    const-string v1, ", var_ScalableFlag="

    .line 388
    .line 389
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 390
    .line 391
    .line 392
    iget v1, p0, Ll/od1;->M:I

    .line 393
    .line 394
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 395
    .line 396
    .line 397
    const-string v1, ", hilnQuantMode="

    .line 398
    .line 399
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    .line 401
    .line 402
    iget v1, p0, Ll/od1;->N:I

    .line 403
    .line 404
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 405
    .line 406
    .line 407
    const-string v1, ", hilnMaxNumLine="

    .line 408
    .line 409
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 410
    .line 411
    .line 412
    iget v1, p0, Ll/od1;->O:I

    .line 413
    .line 414
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 415
    .line 416
    .line 417
    const-string v1, ", hilnSampleRateCode="

    .line 418
    .line 419
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    iget v1, p0, Ll/od1;->P:I

    .line 423
    .line 424
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 425
    .line 426
    .line 427
    const-string v1, ", hilnFrameLength="

    .line 428
    .line 429
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 430
    .line 431
    .line 432
    iget v1, p0, Ll/od1;->Q:I

    .line 433
    .line 434
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    const-string v1, ", hilnContMode="

    .line 438
    .line 439
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    iget v1, p0, Ll/od1;->R:I

    .line 443
    .line 444
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 445
    .line 446
    .line 447
    const-string v1, ", hilnEnhaLayer="

    .line 448
    .line 449
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 450
    .line 451
    .line 452
    iget v1, p0, Ll/od1;->S:I

    .line 453
    .line 454
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 455
    .line 456
    .line 457
    const-string v1, ", hilnEnhaQuantMode="

    .line 458
    .line 459
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 460
    .line 461
    .line 462
    iget p0, p0, Ll/od1;->T:I

    .line 463
    .line 464
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 465
    .line 466
    .line 467
    :cond_2
    const/16 p0, 0x7d

    .line 468
    .line 469
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 470
    .line 471
    .line 472
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object p0

    .line 476
    return-object p0
.end method
