.class public Landroidx/constraintlayout/widget/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/constraintlayout/widget/a$b;
    }
.end annotation


# static fields
.field public static final b:[I

.field public static c:Landroid/util/SparseIntArray;


# instance fields
.field public a:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Landroidx/constraintlayout/widget/a$b;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x4

    .line 3
    const/16 v2, 0x8

    .line 4
    .line 5
    filled-new-array {v0, v1, v2}, [I

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Landroidx/constraintlayout/widget/a;->b:[I

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseIntArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseIntArray;-><init>()V

    .line 14
    .line 15
    .line 16
    sput-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 17
    .line 18
    sget v3, Ll/qhc0;->j1:I

    .line 19
    .line 20
    const/16 v4, 0x19

    .line 21
    .line 22
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 23
    .line 24
    .line 25
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 26
    .line 27
    sget v3, Ll/qhc0;->k1:I

    .line 28
    .line 29
    const/16 v4, 0x1a

    .line 30
    .line 31
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 32
    .line 33
    .line 34
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 35
    .line 36
    sget v3, Ll/qhc0;->m1:I

    .line 37
    .line 38
    const/16 v4, 0x1d

    .line 39
    .line 40
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 41
    .line 42
    .line 43
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 44
    .line 45
    sget v3, Ll/qhc0;->n1:I

    .line 46
    .line 47
    const/16 v4, 0x1e

    .line 48
    .line 49
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 50
    .line 51
    .line 52
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 53
    .line 54
    sget v3, Ll/qhc0;->s1:I

    .line 55
    .line 56
    const/16 v4, 0x24

    .line 57
    .line 58
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 59
    .line 60
    .line 61
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 62
    .line 63
    sget v3, Ll/qhc0;->r1:I

    .line 64
    .line 65
    const/16 v4, 0x23

    .line 66
    .line 67
    invoke-virtual {v0, v3, v4}, Landroid/util/SparseIntArray;->append(II)V

    .line 68
    .line 69
    .line 70
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 71
    .line 72
    sget v3, Ll/qhc0;->R0:I

    .line 73
    .line 74
    invoke-virtual {v0, v3, v1}, Landroid/util/SparseIntArray;->append(II)V

    .line 75
    .line 76
    .line 77
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 78
    .line 79
    sget v1, Ll/qhc0;->Q0:I

    .line 80
    .line 81
    const/4 v3, 0x3

    .line 82
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 83
    .line 84
    .line 85
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 86
    .line 87
    sget v1, Ll/qhc0;->O0:I

    .line 88
    .line 89
    const/4 v3, 0x1

    .line 90
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 91
    .line 92
    .line 93
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 94
    .line 95
    sget v1, Ll/qhc0;->A1:I

    .line 96
    .line 97
    const/4 v3, 0x6

    .line 98
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 99
    .line 100
    .line 101
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 102
    .line 103
    sget v1, Ll/qhc0;->B1:I

    .line 104
    .line 105
    const/4 v3, 0x7

    .line 106
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 107
    .line 108
    .line 109
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 110
    .line 111
    sget v1, Ll/qhc0;->Y0:I

    .line 112
    .line 113
    const/16 v3, 0x11

    .line 114
    .line 115
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 116
    .line 117
    .line 118
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 119
    .line 120
    sget v1, Ll/qhc0;->Z0:I

    .line 121
    .line 122
    const/16 v3, 0x12

    .line 123
    .line 124
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 125
    .line 126
    .line 127
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 128
    .line 129
    sget v1, Ll/qhc0;->a1:I

    .line 130
    .line 131
    const/16 v3, 0x13

    .line 132
    .line 133
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 134
    .line 135
    .line 136
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 137
    .line 138
    sget v1, Ll/qhc0;->m0:I

    .line 139
    .line 140
    const/16 v3, 0x1b

    .line 141
    .line 142
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 143
    .line 144
    .line 145
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 146
    .line 147
    sget v1, Ll/qhc0;->o1:I

    .line 148
    .line 149
    const/16 v3, 0x20

    .line 150
    .line 151
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 152
    .line 153
    .line 154
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 155
    .line 156
    sget v1, Ll/qhc0;->p1:I

    .line 157
    .line 158
    const/16 v3, 0x21

    .line 159
    .line 160
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 161
    .line 162
    .line 163
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 164
    .line 165
    sget v1, Ll/qhc0;->X0:I

    .line 166
    .line 167
    const/16 v3, 0xa

    .line 168
    .line 169
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 170
    .line 171
    .line 172
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 173
    .line 174
    sget v1, Ll/qhc0;->W0:I

    .line 175
    .line 176
    const/16 v3, 0x9

    .line 177
    .line 178
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 179
    .line 180
    .line 181
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 182
    .line 183
    sget v1, Ll/qhc0;->E1:I

    .line 184
    .line 185
    const/16 v3, 0xd

    .line 186
    .line 187
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 188
    .line 189
    .line 190
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 191
    .line 192
    sget v1, Ll/qhc0;->H1:I

    .line 193
    .line 194
    const/16 v3, 0x10

    .line 195
    .line 196
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 197
    .line 198
    .line 199
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 200
    .line 201
    sget v1, Ll/qhc0;->F1:I

    .line 202
    .line 203
    const/16 v3, 0xe

    .line 204
    .line 205
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 206
    .line 207
    .line 208
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 209
    .line 210
    sget v1, Ll/qhc0;->C1:I

    .line 211
    .line 212
    const/16 v3, 0xb

    .line 213
    .line 214
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 215
    .line 216
    .line 217
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 218
    .line 219
    sget v1, Ll/qhc0;->G1:I

    .line 220
    .line 221
    const/16 v3, 0xf

    .line 222
    .line 223
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 224
    .line 225
    .line 226
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 227
    .line 228
    sget v1, Ll/qhc0;->D1:I

    .line 229
    .line 230
    const/16 v3, 0xc

    .line 231
    .line 232
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 233
    .line 234
    .line 235
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 236
    .line 237
    sget v1, Ll/qhc0;->v1:I

    .line 238
    .line 239
    const/16 v3, 0x28

    .line 240
    .line 241
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 242
    .line 243
    .line 244
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 245
    .line 246
    sget v1, Ll/qhc0;->h1:I

    .line 247
    .line 248
    const/16 v3, 0x27

    .line 249
    .line 250
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 251
    .line 252
    .line 253
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 254
    .line 255
    sget v1, Ll/qhc0;->g1:I

    .line 256
    .line 257
    const/16 v3, 0x29

    .line 258
    .line 259
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 260
    .line 261
    .line 262
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 263
    .line 264
    sget v1, Ll/qhc0;->u1:I

    .line 265
    .line 266
    const/16 v3, 0x2a

    .line 267
    .line 268
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 269
    .line 270
    .line 271
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 272
    .line 273
    sget v1, Ll/qhc0;->f1:I

    .line 274
    .line 275
    const/16 v3, 0x14

    .line 276
    .line 277
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 278
    .line 279
    .line 280
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 281
    .line 282
    sget v1, Ll/qhc0;->t1:I

    .line 283
    .line 284
    const/16 v3, 0x25

    .line 285
    .line 286
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 287
    .line 288
    .line 289
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 290
    .line 291
    sget v1, Ll/qhc0;->V0:I

    .line 292
    .line 293
    const/4 v3, 0x5

    .line 294
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 295
    .line 296
    .line 297
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 298
    .line 299
    sget v1, Ll/qhc0;->i1:I

    .line 300
    .line 301
    const/16 v3, 0x4b

    .line 302
    .line 303
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 304
    .line 305
    .line 306
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 307
    .line 308
    sget v1, Ll/qhc0;->q1:I

    .line 309
    .line 310
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 311
    .line 312
    .line 313
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 314
    .line 315
    sget v1, Ll/qhc0;->l1:I

    .line 316
    .line 317
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 318
    .line 319
    .line 320
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 321
    .line 322
    sget v1, Ll/qhc0;->P0:I

    .line 323
    .line 324
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 325
    .line 326
    .line 327
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 328
    .line 329
    sget v1, Ll/qhc0;->N0:I

    .line 330
    .line 331
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 332
    .line 333
    .line 334
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 335
    .line 336
    sget v1, Ll/qhc0;->r0:I

    .line 337
    .line 338
    const/16 v3, 0x18

    .line 339
    .line 340
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 341
    .line 342
    .line 343
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 344
    .line 345
    sget v1, Ll/qhc0;->t0:I

    .line 346
    .line 347
    const/16 v3, 0x1c

    .line 348
    .line 349
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 350
    .line 351
    .line 352
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 353
    .line 354
    sget v1, Ll/qhc0;->F0:I

    .line 355
    .line 356
    const/16 v3, 0x1f

    .line 357
    .line 358
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseIntArray;->append(II)V

    .line 359
    .line 360
    .line 361
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 362
    .line 363
    sget v1, Ll/qhc0;->G0:I

    .line 364
    .line 365
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 366
    .line 367
    .line 368
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 369
    .line 370
    sget v1, Ll/qhc0;->s0:I

    .line 371
    .line 372
    const/16 v2, 0x22

    .line 373
    .line 374
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 375
    .line 376
    .line 377
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 378
    .line 379
    sget v1, Ll/qhc0;->u0:I

    .line 380
    .line 381
    const/4 v2, 0x2

    .line 382
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 383
    .line 384
    .line 385
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 386
    .line 387
    sget v1, Ll/qhc0;->p0:I

    .line 388
    .line 389
    const/16 v2, 0x17

    .line 390
    .line 391
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 392
    .line 393
    .line 394
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 395
    .line 396
    sget v1, Ll/qhc0;->q0:I

    .line 397
    .line 398
    const/16 v2, 0x15

    .line 399
    .line 400
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 401
    .line 402
    .line 403
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 404
    .line 405
    sget v1, Ll/qhc0;->o0:I

    .line 406
    .line 407
    const/16 v2, 0x16

    .line 408
    .line 409
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 410
    .line 411
    .line 412
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 413
    .line 414
    sget v1, Ll/qhc0;->v0:I

    .line 415
    .line 416
    const/16 v2, 0x2b

    .line 417
    .line 418
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 419
    .line 420
    .line 421
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 422
    .line 423
    sget v1, Ll/qhc0;->I0:I

    .line 424
    .line 425
    const/16 v2, 0x2c

    .line 426
    .line 427
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 428
    .line 429
    .line 430
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 431
    .line 432
    sget v1, Ll/qhc0;->D0:I

    .line 433
    .line 434
    const/16 v2, 0x2d

    .line 435
    .line 436
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 437
    .line 438
    .line 439
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 440
    .line 441
    sget v1, Ll/qhc0;->E0:I

    .line 442
    .line 443
    const/16 v2, 0x2e

    .line 444
    .line 445
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 446
    .line 447
    .line 448
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 449
    .line 450
    sget v1, Ll/qhc0;->C0:I

    .line 451
    .line 452
    const/16 v2, 0x3c

    .line 453
    .line 454
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 455
    .line 456
    .line 457
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 458
    .line 459
    sget v1, Ll/qhc0;->A0:I

    .line 460
    .line 461
    const/16 v2, 0x2f

    .line 462
    .line 463
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 464
    .line 465
    .line 466
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 467
    .line 468
    sget v1, Ll/qhc0;->B0:I

    .line 469
    .line 470
    const/16 v2, 0x30

    .line 471
    .line 472
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 473
    .line 474
    .line 475
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 476
    .line 477
    sget v1, Ll/qhc0;->w0:I

    .line 478
    .line 479
    const/16 v2, 0x31

    .line 480
    .line 481
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 482
    .line 483
    .line 484
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 485
    .line 486
    sget v1, Ll/qhc0;->x0:I

    .line 487
    .line 488
    const/16 v2, 0x32

    .line 489
    .line 490
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 491
    .line 492
    .line 493
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 494
    .line 495
    sget v1, Ll/qhc0;->y0:I

    .line 496
    .line 497
    const/16 v2, 0x33

    .line 498
    .line 499
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 500
    .line 501
    .line 502
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 503
    .line 504
    sget v1, Ll/qhc0;->z0:I

    .line 505
    .line 506
    const/16 v2, 0x34

    .line 507
    .line 508
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 509
    .line 510
    .line 511
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 512
    .line 513
    sget v1, Ll/qhc0;->H0:I

    .line 514
    .line 515
    const/16 v2, 0x35

    .line 516
    .line 517
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 518
    .line 519
    .line 520
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 521
    .line 522
    sget v1, Ll/qhc0;->w1:I

    .line 523
    .line 524
    const/16 v2, 0x36

    .line 525
    .line 526
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 527
    .line 528
    .line 529
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 530
    .line 531
    sget v1, Ll/qhc0;->b1:I

    .line 532
    .line 533
    const/16 v2, 0x37

    .line 534
    .line 535
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 536
    .line 537
    .line 538
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 539
    .line 540
    sget v1, Ll/qhc0;->x1:I

    .line 541
    .line 542
    const/16 v2, 0x38

    .line 543
    .line 544
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 545
    .line 546
    .line 547
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 548
    .line 549
    sget v1, Ll/qhc0;->c1:I

    .line 550
    .line 551
    const/16 v2, 0x39

    .line 552
    .line 553
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 554
    .line 555
    .line 556
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 557
    .line 558
    sget v1, Ll/qhc0;->y1:I

    .line 559
    .line 560
    const/16 v2, 0x3a

    .line 561
    .line 562
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 563
    .line 564
    .line 565
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 566
    .line 567
    sget v1, Ll/qhc0;->d1:I

    .line 568
    .line 569
    const/16 v2, 0x3b

    .line 570
    .line 571
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 572
    .line 573
    .line 574
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 575
    .line 576
    sget v1, Ll/qhc0;->S0:I

    .line 577
    .line 578
    const/16 v2, 0x3d

    .line 579
    .line 580
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 581
    .line 582
    .line 583
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 584
    .line 585
    sget v1, Ll/qhc0;->U0:I

    .line 586
    .line 587
    const/16 v2, 0x3e

    .line 588
    .line 589
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 590
    .line 591
    .line 592
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 593
    .line 594
    sget v1, Ll/qhc0;->T0:I

    .line 595
    .line 596
    const/16 v2, 0x3f

    .line 597
    .line 598
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 599
    .line 600
    .line 601
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 602
    .line 603
    sget v1, Ll/qhc0;->n0:I

    .line 604
    .line 605
    const/16 v2, 0x26

    .line 606
    .line 607
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 608
    .line 609
    .line 610
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 611
    .line 612
    sget v1, Ll/qhc0;->z1:I

    .line 613
    .line 614
    const/16 v2, 0x45

    .line 615
    .line 616
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 617
    .line 618
    .line 619
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 620
    .line 621
    sget v1, Ll/qhc0;->e1:I

    .line 622
    .line 623
    const/16 v2, 0x46

    .line 624
    .line 625
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 626
    .line 627
    .line 628
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 629
    .line 630
    sget v1, Ll/qhc0;->L0:I

    .line 631
    .line 632
    const/16 v2, 0x47

    .line 633
    .line 634
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 635
    .line 636
    .line 637
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 638
    .line 639
    sget v1, Ll/qhc0;->K0:I

    .line 640
    .line 641
    const/16 v2, 0x48

    .line 642
    .line 643
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 644
    .line 645
    .line 646
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 647
    .line 648
    sget v1, Ll/qhc0;->M0:I

    .line 649
    .line 650
    const/16 v2, 0x49

    .line 651
    .line 652
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 653
    .line 654
    .line 655
    sget-object v0, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 656
    .line 657
    sget v1, Ll/qhc0;->J0:I

    .line 658
    .line 659
    const/16 v2, 0x4a

    .line 660
    .line 661
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseIntArray;->append(II)V

    .line 662
    .line 663
    .line 664
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 10
    .line 11
    return-void
.end method

.method public static o(Landroid/content/res/TypedArray;II)I
    .locals 1

    .line 1
    invoke-virtual {p0, p1, p2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    const/4 v0, -0x1

    .line 6
    if-ne p2, v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0, p1, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    return p2
.end method


# virtual methods
.method public a(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->b(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    .line 2
    .line 3
    .line 4
    const/4 p0, 0x0

    .line 5
    invoke-virtual {p1, p0}, Landroidx/constraintlayout/widget/ConstraintLayout;->setConstraintSet(Landroidx/constraintlayout/widget/a;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public b(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ljava/util/HashSet;

    .line 6
    .line 7
    iget-object v2, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 8
    .line 9
    invoke-virtual {v2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-direct {v1, v2}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    :goto_0
    const/4 v3, -0x1

    .line 18
    const/4 v4, 0x1

    .line 19
    if-ge v2, v0, :cond_8

    .line 20
    .line 21
    invoke-virtual {p1, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 22
    .line 23
    .line 24
    move-result-object v5

    .line 25
    invoke-virtual {v5}, Landroid/view/View;->getId()I

    .line 26
    .line 27
    .line 28
    move-result v6

    .line 29
    if-eq v6, v3, :cond_7

    .line 30
    .line 31
    iget-object v7, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 32
    .line 33
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 34
    .line 35
    .line 36
    move-result-object v8

    .line 37
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    if-eqz v7, :cond_6

    .line 42
    .line 43
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v7

    .line 47
    invoke-virtual {v1, v7}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    iget-object v7, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 51
    .line 52
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v8

    .line 56
    invoke-virtual {v7, v8}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v7

    .line 60
    check-cast v7, Landroidx/constraintlayout/widget/a$b;

    .line 61
    .line 62
    instance-of v8, v5, Landroidx/constraintlayout/widget/Barrier;

    .line 63
    .line 64
    if-eqz v8, :cond_0

    .line 65
    .line 66
    iput v4, v7, Landroidx/constraintlayout/widget/a$b;->t0:I

    .line 67
    .line 68
    :cond_0
    iget v8, v7, Landroidx/constraintlayout/widget/a$b;->t0:I

    .line 69
    .line 70
    if-eq v8, v3, :cond_3

    .line 71
    .line 72
    if-eq v8, v4, :cond_1

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :cond_1
    move-object v3, v5

    .line 76
    check-cast v3, Landroidx/constraintlayout/widget/Barrier;

    .line 77
    .line 78
    invoke-virtual {v3, v6}, Landroid/view/View;->setId(I)V

    .line 79
    .line 80
    .line 81
    iget v4, v7, Landroidx/constraintlayout/widget/a$b;->s0:I

    .line 82
    .line 83
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Barrier;->setType(I)V

    .line 84
    .line 85
    .line 86
    iget-boolean v4, v7, Landroidx/constraintlayout/widget/a$b;->r0:Z

    .line 87
    .line 88
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/Barrier;->setAllowsGoneWidget(Z)V

    .line 89
    .line 90
    .line 91
    iget-object v4, v7, Landroidx/constraintlayout/widget/a$b;->u0:[I

    .line 92
    .line 93
    if-eqz v4, :cond_2

    .line 94
    .line 95
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 96
    .line 97
    .line 98
    goto :goto_1

    .line 99
    :cond_2
    iget-object v4, v7, Landroidx/constraintlayout/widget/a$b;->v0:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v4, :cond_3

    .line 102
    .line 103
    invoke-virtual {p0, v3, v4}, Landroidx/constraintlayout/widget/a;->k(Landroid/view/View;Ljava/lang/String;)[I

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iput-object v4, v7, Landroidx/constraintlayout/widget/a$b;->u0:[I

    .line 108
    .line 109
    invoke-virtual {v3, v4}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 110
    .line 111
    .line 112
    :cond_3
    :goto_1
    invoke-virtual {v5}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 113
    .line 114
    .line 115
    move-result-object v3

    .line 116
    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 117
    .line 118
    invoke-virtual {v7, v3}, Landroidx/constraintlayout/widget/a$b;->d(Landroidx/constraintlayout/widget/ConstraintLayout$a;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v5, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 122
    .line 123
    .line 124
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 125
    .line 126
    invoke-virtual {v5, v3}, Landroid/view/View;->setVisibility(I)V

    .line 127
    .line 128
    .line 129
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->U:F

    .line 130
    .line 131
    invoke-virtual {v5, v3}, Landroid/view/View;->setAlpha(F)V

    .line 132
    .line 133
    .line 134
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->X:F

    .line 135
    .line 136
    invoke-virtual {v5, v3}, Landroid/view/View;->setRotation(F)V

    .line 137
    .line 138
    .line 139
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->Y:F

    .line 140
    .line 141
    invoke-virtual {v5, v3}, Landroid/view/View;->setRotationX(F)V

    .line 142
    .line 143
    .line 144
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->Z:F

    .line 145
    .line 146
    invoke-virtual {v5, v3}, Landroid/view/View;->setRotationY(F)V

    .line 147
    .line 148
    .line 149
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->a0:F

    .line 150
    .line 151
    invoke-virtual {v5, v3}, Landroid/view/View;->setScaleX(F)V

    .line 152
    .line 153
    .line 154
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->b0:F

    .line 155
    .line 156
    invoke-virtual {v5, v3}, Landroid/view/View;->setScaleY(F)V

    .line 157
    .line 158
    .line 159
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->c0:F

    .line 160
    .line 161
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    if-nez v3, :cond_4

    .line 166
    .line 167
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->c0:F

    .line 168
    .line 169
    invoke-virtual {v5, v3}, Landroid/view/View;->setPivotX(F)V

    .line 170
    .line 171
    .line 172
    :cond_4
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->d0:F

    .line 173
    .line 174
    invoke-static {v3}, Ljava/lang/Float;->isNaN(F)Z

    .line 175
    .line 176
    .line 177
    move-result v3

    .line 178
    if-nez v3, :cond_5

    .line 179
    .line 180
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->d0:F

    .line 181
    .line 182
    invoke-virtual {v5, v3}, Landroid/view/View;->setPivotY(F)V

    .line 183
    .line 184
    .line 185
    :cond_5
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->e0:F

    .line 186
    .line 187
    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationX(F)V

    .line 188
    .line 189
    .line 190
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->f0:F

    .line 191
    .line 192
    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationY(F)V

    .line 193
    .line 194
    .line 195
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->g0:F

    .line 196
    .line 197
    invoke-virtual {v5, v3}, Landroid/view/View;->setTranslationZ(F)V

    .line 198
    .line 199
    .line 200
    iget-boolean v3, v7, Landroidx/constraintlayout/widget/a$b;->V:Z

    .line 201
    .line 202
    if-eqz v3, :cond_6

    .line 203
    .line 204
    iget v3, v7, Landroidx/constraintlayout/widget/a$b;->W:F

    .line 205
    .line 206
    invoke-virtual {v5, v3}, Landroid/view/View;->setElevation(F)V

    .line 207
    .line 208
    .line 209
    :cond_6
    add-int/lit8 v2, v2, 0x1

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :cond_7
    const-string p0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    .line 214
    .line 215
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :cond_8
    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    :cond_9
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    if-eqz v1, :cond_e

    .line 228
    .line 229
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    check-cast v1, Ljava/lang/Integer;

    .line 234
    .line 235
    iget-object v2, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 236
    .line 237
    invoke-virtual {v2, v1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Landroidx/constraintlayout/widget/a$b;

    .line 242
    .line 243
    iget v5, v2, Landroidx/constraintlayout/widget/a$b;->t0:I

    .line 244
    .line 245
    if-eq v5, v3, :cond_d

    .line 246
    .line 247
    if-eq v5, v4, :cond_a

    .line 248
    .line 249
    goto :goto_4

    .line 250
    :cond_a
    new-instance v5, Landroidx/constraintlayout/widget/Barrier;

    .line 251
    .line 252
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 253
    .line 254
    .line 255
    move-result-object v6

    .line 256
    invoke-direct {v5, v6}, Landroidx/constraintlayout/widget/Barrier;-><init>(Landroid/content/Context;)V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 260
    .line 261
    .line 262
    move-result v6

    .line 263
    invoke-virtual {v5, v6}, Landroid/view/View;->setId(I)V

    .line 264
    .line 265
    .line 266
    iget-object v6, v2, Landroidx/constraintlayout/widget/a$b;->u0:[I

    .line 267
    .line 268
    if-eqz v6, :cond_b

    .line 269
    .line 270
    invoke-virtual {v5, v6}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 271
    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_b
    iget-object v6, v2, Landroidx/constraintlayout/widget/a$b;->v0:Ljava/lang/String;

    .line 275
    .line 276
    if-eqz v6, :cond_c

    .line 277
    .line 278
    invoke-virtual {p0, v5, v6}, Landroidx/constraintlayout/widget/a;->k(Landroid/view/View;Ljava/lang/String;)[I

    .line 279
    .line 280
    .line 281
    move-result-object v6

    .line 282
    iput-object v6, v2, Landroidx/constraintlayout/widget/a$b;->u0:[I

    .line 283
    .line 284
    invoke-virtual {v5, v6}, Landroidx/constraintlayout/widget/ConstraintHelper;->setReferencedIds([I)V

    .line 285
    .line 286
    .line 287
    :cond_c
    :goto_3
    iget v6, v2, Landroidx/constraintlayout/widget/a$b;->s0:I

    .line 288
    .line 289
    invoke-virtual {v5, v6}, Landroidx/constraintlayout/widget/Barrier;->setType(I)V

    .line 290
    .line 291
    .line 292
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 293
    .line 294
    .line 295
    move-result-object v6

    .line 296
    invoke-virtual {v5}, Landroidx/constraintlayout/widget/ConstraintHelper;->f()V

    .line 297
    .line 298
    .line 299
    invoke-virtual {v2, v6}, Landroidx/constraintlayout/widget/a$b;->d(Landroidx/constraintlayout/widget/ConstraintLayout$a;)V

    .line 300
    .line 301
    .line 302
    invoke-virtual {p1, v5, v6}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 303
    .line 304
    .line 305
    :cond_d
    :goto_4
    iget-boolean v5, v2, Landroidx/constraintlayout/widget/a$b;->a:Z

    .line 306
    .line 307
    if-eqz v5, :cond_9

    .line 308
    .line 309
    new-instance v5, Landroidx/constraintlayout/widget/Guideline;

    .line 310
    .line 311
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 312
    .line 313
    .line 314
    move-result-object v6

    .line 315
    invoke-direct {v5, v6}, Landroidx/constraintlayout/widget/Guideline;-><init>(Landroid/content/Context;)V

    .line 316
    .line 317
    .line 318
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 319
    .line 320
    .line 321
    move-result v1

    .line 322
    invoke-virtual {v5, v1}, Landroid/view/View;->setId(I)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p1}, Landroidx/constraintlayout/widget/ConstraintLayout;->generateDefaultLayoutParams()Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    invoke-virtual {v2, v1}, Landroidx/constraintlayout/widget/a$b;->d(Landroidx/constraintlayout/widget/ConstraintLayout$a;)V

    .line 330
    .line 331
    .line 332
    invoke-virtual {p1, v5, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 333
    .line 334
    .line 335
    goto :goto_2

    .line 336
    :cond_e
    return-void
.end method

.method public c(Landroidx/constraintlayout/widget/ConstraintLayout;)V
    .locals 10

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_6

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Landroidx/constraintlayout/widget/ConstraintLayout$a;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v5, -0x1

    .line 28
    if-eq v4, v5, :cond_5

    .line 29
    .line 30
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    new-instance v7, Landroidx/constraintlayout/widget/a$b;

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    invoke-direct {v7, v8}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Landroidx/constraintlayout/widget/a$b;

    .line 68
    .line 69
    invoke-static {v5, v4, v3}, Landroidx/constraintlayout/widget/a$b;->a(Landroidx/constraintlayout/widget/a$b;ILandroidx/constraintlayout/widget/ConstraintLayout$a;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 77
    .line 78
    invoke-virtual {v2}, Landroid/view/View;->getAlpha()F

    .line 79
    .line 80
    .line 81
    move-result v3

    .line 82
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->U:F

    .line 83
    .line 84
    invoke-virtual {v2}, Landroid/view/View;->getRotation()F

    .line 85
    .line 86
    .line 87
    move-result v3

    .line 88
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->X:F

    .line 89
    .line 90
    invoke-virtual {v2}, Landroid/view/View;->getRotationX()F

    .line 91
    .line 92
    .line 93
    move-result v3

    .line 94
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->Y:F

    .line 95
    .line 96
    invoke-virtual {v2}, Landroid/view/View;->getRotationY()F

    .line 97
    .line 98
    .line 99
    move-result v3

    .line 100
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->Z:F

    .line 101
    .line 102
    invoke-virtual {v2}, Landroid/view/View;->getScaleX()F

    .line 103
    .line 104
    .line 105
    move-result v3

    .line 106
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->a0:F

    .line 107
    .line 108
    invoke-virtual {v2}, Landroid/view/View;->getScaleY()F

    .line 109
    .line 110
    .line 111
    move-result v3

    .line 112
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->b0:F

    .line 113
    .line 114
    invoke-virtual {v2}, Landroid/view/View;->getPivotX()F

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    invoke-virtual {v2}, Landroid/view/View;->getPivotY()F

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    float-to-double v6, v3

    .line 123
    const-wide/16 v8, 0x0

    .line 124
    .line 125
    cmpl-double v6, v6, v8

    .line 126
    .line 127
    if-nez v6, :cond_1

    .line 128
    .line 129
    float-to-double v6, v4

    .line 130
    cmpl-double v6, v6, v8

    .line 131
    .line 132
    if-eqz v6, :cond_2

    .line 133
    .line 134
    :cond_1
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->c0:F

    .line 135
    .line 136
    iput v4, v5, Landroidx/constraintlayout/widget/a$b;->d0:F

    .line 137
    .line 138
    :cond_2
    invoke-virtual {v2}, Landroid/view/View;->getTranslationX()F

    .line 139
    .line 140
    .line 141
    move-result v3

    .line 142
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->e0:F

    .line 143
    .line 144
    invoke-virtual {v2}, Landroid/view/View;->getTranslationY()F

    .line 145
    .line 146
    .line 147
    move-result v3

    .line 148
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->f0:F

    .line 149
    .line 150
    invoke-virtual {v2}, Landroid/view/View;->getTranslationZ()F

    .line 151
    .line 152
    .line 153
    move-result v3

    .line 154
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->g0:F

    .line 155
    .line 156
    iget-boolean v3, v5, Landroidx/constraintlayout/widget/a$b;->V:Z

    .line 157
    .line 158
    if-eqz v3, :cond_3

    .line 159
    .line 160
    invoke-virtual {v2}, Landroid/view/View;->getElevation()F

    .line 161
    .line 162
    .line 163
    move-result v3

    .line 164
    iput v3, v5, Landroidx/constraintlayout/widget/a$b;->W:F

    .line 165
    .line 166
    :cond_3
    instance-of v3, v2, Landroidx/constraintlayout/widget/Barrier;

    .line 167
    .line 168
    if-eqz v3, :cond_4

    .line 169
    .line 170
    check-cast v2, Landroidx/constraintlayout/widget/Barrier;

    .line 171
    .line 172
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Barrier;->g()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    iput-boolean v3, v5, Landroidx/constraintlayout/widget/a$b;->r0:Z

    .line 177
    .line 178
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/ConstraintHelper;->getReferencedIds()[I

    .line 179
    .line 180
    .line 181
    move-result-object v3

    .line 182
    iput-object v3, v5, Landroidx/constraintlayout/widget/a$b;->u0:[I

    .line 183
    .line 184
    invoke-virtual {v2}, Landroidx/constraintlayout/widget/Barrier;->getType()I

    .line 185
    .line 186
    .line 187
    move-result v2

    .line 188
    iput v2, v5, Landroidx/constraintlayout/widget/a$b;->s0:I

    .line 189
    .line 190
    :cond_4
    add-int/lit8 v1, v1, 0x1

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_5
    const-string p0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    .line 195
    .line 196
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 197
    .line 198
    .line 199
    :cond_6
    return-void
.end method

.method public d(Landroidx/constraintlayout/widget/Constraints;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget-object v1, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-virtual {v1}, Ljava/util/HashMap;->clear()V

    .line 8
    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    :goto_0
    if-ge v1, v0, :cond_3

    .line 12
    .line 13
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    check-cast v3, Landroidx/constraintlayout/widget/Constraints$a;

    .line 22
    .line 23
    invoke-virtual {v2}, Landroid/view/View;->getId()I

    .line 24
    .line 25
    .line 26
    move-result v4

    .line 27
    const/4 v5, -0x1

    .line 28
    if-eq v4, v5, :cond_2

    .line 29
    .line 30
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 31
    .line 32
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object v6

    .line 36
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    move-result v5

    .line 40
    if-nez v5, :cond_0

    .line 41
    .line 42
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 43
    .line 44
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 45
    .line 46
    .line 47
    move-result-object v6

    .line 48
    new-instance v7, Landroidx/constraintlayout/widget/a$b;

    .line 49
    .line 50
    const/4 v8, 0x0

    .line 51
    invoke-direct {v7, v8}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {v5, v6, v7}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    :cond_0
    iget-object v5, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 58
    .line 59
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-virtual {v5, v6}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Landroidx/constraintlayout/widget/a$b;

    .line 68
    .line 69
    instance-of v6, v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 70
    .line 71
    if-eqz v6, :cond_1

    .line 72
    .line 73
    check-cast v2, Landroidx/constraintlayout/widget/ConstraintHelper;

    .line 74
    .line 75
    invoke-static {v5, v2, v4, v3}, Landroidx/constraintlayout/widget/a$b;->b(Landroidx/constraintlayout/widget/a$b;Landroidx/constraintlayout/widget/ConstraintHelper;ILandroidx/constraintlayout/widget/Constraints$a;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    invoke-static {v5, v4, v3}, Landroidx/constraintlayout/widget/a$b;->c(Landroidx/constraintlayout/widget/a$b;ILandroidx/constraintlayout/widget/Constraints$a;)V

    .line 79
    .line 80
    .line 81
    add-int/lit8 v1, v1, 0x1

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_2
    const-string p0, "All children of ConstraintLayout must have ids to use ConstraintSet"

    .line 85
    .line 86
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    :cond_3
    return-void
.end method

.method public e(IIII)V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Landroidx/constraintlayout/widget/a$b;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {v2, v3}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroidx/constraintlayout/widget/a$b;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    const/4 v1, 0x1

    .line 42
    const/4 v2, 0x3

    .line 43
    const/4 v3, 0x4

    .line 44
    const/4 v4, 0x6

    .line 45
    const/4 v5, 0x7

    .line 46
    const-string v6, "right to "

    .line 47
    .line 48
    const-string v7, " undefined"

    .line 49
    .line 50
    const/4 v8, -0x1

    .line 51
    packed-switch p2, :pswitch_data_0

    .line 52
    .line 53
    .line 54
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p2, " to "

    .line 73
    .line 74
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p0, " unknown"

    .line 81
    .line 82
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw p1

    .line 93
    :pswitch_0
    if-ne p4, v5, :cond_1

    .line 94
    .line 95
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 96
    .line 97
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 98
    .line 99
    return-void

    .line 100
    :cond_1
    if-ne p4, v4, :cond_2

    .line 101
    .line 102
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 103
    .line 104
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 105
    .line 106
    return-void

    .line 107
    :cond_2
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :pswitch_1
    if-ne p4, v4, :cond_3

    .line 116
    .line 117
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 118
    .line 119
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 120
    .line 121
    return-void

    .line 122
    :cond_3
    if-ne p4, v5, :cond_4

    .line 123
    .line 124
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 125
    .line 126
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 127
    .line 128
    return-void

    .line 129
    :cond_4
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p0

    .line 133
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 134
    .line 135
    .line 136
    return-void

    .line 137
    :pswitch_2
    const/4 p2, 0x5

    .line 138
    if-ne p4, p2, :cond_5

    .line 139
    .line 140
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 141
    .line 142
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 143
    .line 144
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 145
    .line 146
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 147
    .line 148
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 149
    .line 150
    return-void

    .line 151
    :cond_5
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 156
    .line 157
    .line 158
    return-void

    .line 159
    :pswitch_3
    if-ne p4, v3, :cond_6

    .line 160
    .line 161
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 162
    .line 163
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 164
    .line 165
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 166
    .line 167
    return-void

    .line 168
    :cond_6
    if-ne p4, v2, :cond_7

    .line 169
    .line 170
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 171
    .line 172
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 173
    .line 174
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 175
    .line 176
    return-void

    .line 177
    :cond_7
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :pswitch_4
    if-ne p4, v2, :cond_8

    .line 186
    .line 187
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 188
    .line 189
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 190
    .line 191
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 192
    .line 193
    return-void

    .line 194
    :cond_8
    if-ne p4, v3, :cond_9

    .line 195
    .line 196
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 197
    .line 198
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 199
    .line 200
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 201
    .line 202
    return-void

    .line 203
    :cond_9
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object p0

    .line 207
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :pswitch_5
    if-ne p4, v1, :cond_a

    .line 212
    .line 213
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 214
    .line 215
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 216
    .line 217
    return-void

    .line 218
    :cond_a
    if-ne p4, v0, :cond_b

    .line 219
    .line 220
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 221
    .line 222
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 223
    .line 224
    return-void

    .line 225
    :cond_b
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 226
    .line 227
    .line 228
    move-result-object p0

    .line 229
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 230
    .line 231
    .line 232
    return-void

    .line 233
    :pswitch_6
    if-ne p4, v1, :cond_c

    .line 234
    .line 235
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 236
    .line 237
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 238
    .line 239
    return-void

    .line 240
    :cond_c
    if-ne p4, v0, :cond_d

    .line 241
    .line 242
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 243
    .line 244
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 245
    .line 246
    return-void

    .line 247
    :cond_d
    const-string p1, "left to "

    .line 248
    .line 249
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 250
    .line 251
    .line 252
    move-result-object p0

    .line 253
    invoke-static {p1, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 254
    .line 255
    .line 256
    return-void

    .line 257
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public f(IIIII)V
    .locals 9

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Landroidx/constraintlayout/widget/a$b;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {v2, v3}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    check-cast p1, Landroidx/constraintlayout/widget/a$b;

    .line 39
    .line 40
    const/4 v0, 0x2

    .line 41
    const/4 v1, 0x1

    .line 42
    const/4 v2, 0x3

    .line 43
    const/4 v3, 0x4

    .line 44
    const/4 v4, 0x6

    .line 45
    const/4 v5, 0x7

    .line 46
    const-string v6, "right to "

    .line 47
    .line 48
    const-string v7, " undefined"

    .line 49
    .line 50
    const/4 v8, -0x1

    .line 51
    packed-switch p2, :pswitch_data_0

    .line 52
    .line 53
    .line 54
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 55
    .line 56
    invoke-virtual {p0, p2}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p2

    .line 60
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance p3, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p2, " to "

    .line 73
    .line 74
    invoke-virtual {p3, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    const-string p0, " unknown"

    .line 81
    .line 82
    invoke-virtual {p3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 83
    .line 84
    .line 85
    invoke-virtual {p3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    throw p1

    .line 93
    :pswitch_0
    if-ne p4, v5, :cond_1

    .line 94
    .line 95
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 96
    .line 97
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_1
    if-ne p4, v4, :cond_2

    .line 101
    .line 102
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 103
    .line 104
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 105
    .line 106
    :goto_0
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->H:I

    .line 107
    .line 108
    return-void

    .line 109
    :cond_2
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :pswitch_1
    if-ne p4, v4, :cond_3

    .line 118
    .line 119
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 120
    .line 121
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 122
    .line 123
    goto :goto_1

    .line 124
    :cond_3
    if-ne p4, v5, :cond_4

    .line 125
    .line 126
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 127
    .line 128
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 129
    .line 130
    :goto_1
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->I:I

    .line 131
    .line 132
    return-void

    .line 133
    :cond_4
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object p0

    .line 137
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 138
    .line 139
    .line 140
    return-void

    .line 141
    :pswitch_2
    const/4 p2, 0x5

    .line 142
    if-ne p4, p2, :cond_5

    .line 143
    .line 144
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 145
    .line 146
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 147
    .line 148
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 149
    .line 150
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 151
    .line 152
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 153
    .line 154
    return-void

    .line 155
    :cond_5
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    return-void

    .line 163
    :pswitch_3
    if-ne p4, v3, :cond_6

    .line 164
    .line 165
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 166
    .line 167
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 168
    .line 169
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 170
    .line 171
    goto :goto_2

    .line 172
    :cond_6
    if-ne p4, v2, :cond_7

    .line 173
    .line 174
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 175
    .line 176
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 177
    .line 178
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 179
    .line 180
    :goto_2
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->G:I

    .line 181
    .line 182
    return-void

    .line 183
    :cond_7
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object p0

    .line 187
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :pswitch_4
    if-ne p4, v2, :cond_8

    .line 192
    .line 193
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 194
    .line 195
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 196
    .line 197
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 198
    .line 199
    goto :goto_3

    .line 200
    :cond_8
    if-ne p4, v3, :cond_9

    .line 201
    .line 202
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 203
    .line 204
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 205
    .line 206
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 207
    .line 208
    :goto_3
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->F:I

    .line 209
    .line 210
    return-void

    .line 211
    :cond_9
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p0

    .line 215
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :pswitch_5
    if-ne p4, v1, :cond_a

    .line 220
    .line 221
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 222
    .line 223
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 224
    .line 225
    goto :goto_4

    .line 226
    :cond_a
    if-ne p4, v0, :cond_b

    .line 227
    .line 228
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 229
    .line 230
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 231
    .line 232
    :goto_4
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->E:I

    .line 233
    .line 234
    return-void

    .line 235
    :cond_b
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-static {v6, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    return-void

    .line 243
    :pswitch_6
    if-ne p4, v1, :cond_c

    .line 244
    .line 245
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 246
    .line 247
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 248
    .line 249
    goto :goto_5

    .line 250
    :cond_c
    if-ne p4, v0, :cond_d

    .line 251
    .line 252
    iput p3, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 253
    .line 254
    iput v8, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 255
    .line 256
    :goto_5
    iput p5, p1, Landroidx/constraintlayout/widget/a$b;->D:I

    .line 257
    .line 258
    return-void

    .line 259
    :cond_d
    const-string p1, "Left to "

    .line 260
    .line 261
    invoke-virtual {p0, p4}, Landroidx/constraintlayout/widget/a;->t(I)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object p0

    .line 265
    invoke-static {p1, p0, v7}, Ll/pnl;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    return-void

    .line 269
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public g(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->c:I

    .line 6
    .line 7
    return-void
.end method

.method public h(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->o0:I

    .line 6
    .line 7
    return-void
.end method

.method public i(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->n0:I

    .line 6
    .line 7
    return-void
.end method

.method public j(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->b:I

    .line 6
    .line 7
    return-void
.end method

.method public final k(Landroid/view/View;Ljava/lang/String;)[I
    .locals 8

    .line 1
    const-string p0, ","

    .line 2
    .line 3
    invoke-virtual {p2, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    array-length v0, p0

    .line 12
    new-array v0, v0, [I

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    move v2, v1

    .line 16
    move v3, v2

    .line 17
    :goto_0
    array-length v4, p0

    .line 18
    if-ge v2, v4, :cond_2

    .line 19
    .line 20
    aget-object v4, p0, v2

    .line 21
    .line 22
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    :try_start_0
    const-class v5, Ll/zcc0;

    .line 27
    .line 28
    invoke-virtual {v5, v4}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    .line 29
    .line 30
    .line 31
    move-result-object v5

    .line 32
    const/4 v6, 0x0

    .line 33
    invoke-virtual {v5, v6}, Ljava/lang/reflect/Field;->getInt(Ljava/lang/Object;)I

    .line 34
    .line 35
    .line 36
    move-result v5
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move v5, v1

    .line 39
    :goto_1
    if-nez v5, :cond_0

    .line 40
    .line 41
    invoke-virtual {p2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    const-string v6, "id"

    .line 46
    .line 47
    invoke-virtual {p2}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v7

    .line 51
    invoke-virtual {v5, v4, v6, v7}, Landroid/content/res/Resources;->getIdentifier(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    :cond_0
    if-nez v5, :cond_1

    .line 56
    .line 57
    invoke-virtual {p1}, Landroid/view/View;->isInEditMode()Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_1

    .line 62
    .line 63
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 64
    .line 65
    .line 66
    move-result-object v6

    .line 67
    instance-of v6, v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 68
    .line 69
    if-eqz v6, :cond_1

    .line 70
    .line 71
    invoke-virtual {p1}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    .line 76
    .line 77
    invoke-virtual {v6, v1, v4}, Landroidx/constraintlayout/widget/ConstraintLayout;->getDesignInformation(ILjava/lang/Object;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v4

    .line 81
    if-eqz v4, :cond_1

    .line 82
    .line 83
    instance-of v6, v4, Ljava/lang/Integer;

    .line 84
    .line 85
    if-eqz v6, :cond_1

    .line 86
    .line 87
    check-cast v4, Ljava/lang/Integer;

    .line 88
    .line 89
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    :cond_1
    add-int/lit8 v4, v3, 0x1

    .line 94
    .line 95
    aput v5, v0, v3

    .line 96
    .line 97
    add-int/lit8 v2, v2, 0x1

    .line 98
    .line 99
    move v3, v4

    .line 100
    goto :goto_0

    .line 101
    :cond_2
    array-length p0, p0

    .line 102
    if-eq v3, p0, :cond_3

    .line 103
    .line 104
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([II)[I

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    :cond_3
    return-object v0
.end method

.method public final l(Landroid/content/Context;Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/a$b;
    .locals 2

    .line 1
    new-instance v0, Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 5
    .line 6
    .line 7
    sget-object v1, Ll/qhc0;->l0:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, v0, p1}, Landroidx/constraintlayout/widget/a;->p(Landroidx/constraintlayout/widget/a$b;Landroid/content/res/TypedArray;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 17
    .line 18
    .line 19
    return-object v0
.end method

.method public final m(I)Landroidx/constraintlayout/widget/a$b;
    .locals 4

    .line 1
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/HashMap;->containsKey(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Landroidx/constraintlayout/widget/a$b;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-direct {v2, v3}, Landroidx/constraintlayout/widget/a$b;-><init>(Landroidx/constraintlayout/widget/a$a;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    :cond_0
    iget-object p0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-virtual {p0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    check-cast p0, Landroidx/constraintlayout/widget/a$b;

    .line 39
    .line 40
    return-object p0
.end method

.method public n(Landroid/content/Context;I)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getXml(I)Landroid/content/res/XmlResourceParser;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    :try_start_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getEventType()I

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    :goto_0
    const/4 v1, 0x1

    .line 14
    if-eq v0, v1, :cond_3

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    const/4 v2, 0x2

    .line 19
    if-eq v0, v2, :cond_0

    .line 20
    .line 21
    goto :goto_1

    .line 22
    :cond_0
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-static {p2}, Landroid/util/Xml;->asAttributeSet(Lorg/xmlpull/v1/XmlPullParser;)Landroid/util/AttributeSet;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {p0, p1, v2}, Landroidx/constraintlayout/widget/a;->l(Landroid/content/Context;Landroid/util/AttributeSet;)Landroidx/constraintlayout/widget/a$b;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    const-string v3, "Guideline"

    .line 35
    .line 36
    invoke-virtual {v0, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    if-eqz v0, :cond_1

    .line 41
    .line 42
    iput-boolean v1, v2, Landroidx/constraintlayout/widget/a$b;->a:Z

    .line 43
    .line 44
    :cond_1
    iget-object v0, p0, Landroidx/constraintlayout/widget/a;->a:Ljava/util/HashMap;

    .line 45
    .line 46
    iget v1, v2, Landroidx/constraintlayout/widget/a$b;->d:I

    .line 47
    .line 48
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v0, v1, v2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_2
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->getName()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    :goto_1
    invoke-interface {p2}, Lorg/xmlpull/v1/XmlPullParser;->next()I

    .line 60
    .line 61
    .line 62
    move-result v0
    :try_end_0
    .catch Lorg/xmlpull/v1/XmlPullParserException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    goto :goto_0

    .line 64
    :catch_0
    move-exception p0

    .line 65
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :catch_1
    move-exception p0

    .line 70
    invoke-virtual {p0}, Lorg/xmlpull/v1/XmlPullParserException;->printStackTrace()V

    .line 71
    .line 72
    .line 73
    :cond_3
    :goto_2
    return-void
.end method

.method public final p(Landroidx/constraintlayout/widget/a$b;Landroid/content/res/TypedArray;)V
    .locals 4

    .line 1
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->getIndexCount()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    if-ge v0, p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getIndex(I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    sget-object v2, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 13
    .line 14
    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    packed-switch v2, :pswitch_data_0

    .line 19
    .line 20
    .line 21
    packed-switch v2, :pswitch_data_1

    .line 22
    .line 23
    .line 24
    const/high16 v3, 0x3f800000    # 1.0f

    .line 25
    .line 26
    packed-switch v2, :pswitch_data_2

    .line 27
    .line 28
    .line 29
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    sget-object v2, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 33
    .line 34
    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    .line 35
    .line 36
    .line 37
    goto/16 :goto_1

    .line 38
    .line 39
    :pswitch_0
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    sget-object v2, Landroidx/constraintlayout/widget/a;->c:Landroid/util/SparseIntArray;

    .line 43
    .line 44
    invoke-virtual {v2, v1}, Landroid/util/SparseIntArray;->get(I)I

    .line 45
    .line 46
    .line 47
    goto/16 :goto_1

    .line 48
    .line 49
    :pswitch_1
    iget-boolean v2, p1, Landroidx/constraintlayout/widget/a$b;->r0:Z

    .line 50
    .line 51
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    iput-boolean v1, p1, Landroidx/constraintlayout/widget/a$b;->r0:Z

    .line 56
    .line 57
    goto/16 :goto_1

    .line 58
    .line 59
    :pswitch_2
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    iput-object v1, p1, Landroidx/constraintlayout/widget/a$b;->v0:Ljava/lang/String;

    .line 64
    .line 65
    goto/16 :goto_1

    .line 66
    .line 67
    :pswitch_3
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->s0:I

    .line 68
    .line 69
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->s0:I

    .line 74
    .line 75
    goto/16 :goto_1

    .line 76
    .line 77
    :pswitch_4
    const-string v1, "ConstraintSet"

    .line 78
    .line 79
    const-string v2, "CURRENTLY UNSUPPORTED"

    .line 80
    .line 81
    invoke-static {v1, v2}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 82
    .line 83
    .line 84
    goto/16 :goto_1

    .line 85
    .line 86
    :pswitch_5
    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->q0:F

    .line 91
    .line 92
    goto/16 :goto_1

    .line 93
    .line 94
    :pswitch_6
    invoke-virtual {p2, v1, v3}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->p0:F

    .line 99
    .line 100
    goto/16 :goto_1

    .line 101
    .line 102
    :pswitch_7
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->z:F

    .line 103
    .line 104
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 105
    .line 106
    .line 107
    move-result v1

    .line 108
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->z:F

    .line 109
    .line 110
    goto/16 :goto_1

    .line 111
    .line 112
    :pswitch_8
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->y:I

    .line 113
    .line 114
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 115
    .line 116
    .line 117
    move-result v1

    .line 118
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->y:I

    .line 119
    .line 120
    goto/16 :goto_1

    .line 121
    .line 122
    :pswitch_9
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->x:I

    .line 123
    .line 124
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->x:I

    .line 129
    .line 130
    goto/16 :goto_1

    .line 131
    .line 132
    :pswitch_a
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->X:F

    .line 133
    .line 134
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 135
    .line 136
    .line 137
    move-result v1

    .line 138
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->X:F

    .line 139
    .line 140
    goto/16 :goto_1

    .line 141
    .line 142
    :pswitch_b
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->g0:F

    .line 143
    .line 144
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 145
    .line 146
    .line 147
    move-result v1

    .line 148
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->g0:F

    .line 149
    .line 150
    goto/16 :goto_1

    .line 151
    .line 152
    :pswitch_c
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->f0:F

    .line 153
    .line 154
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 155
    .line 156
    .line 157
    move-result v1

    .line 158
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->f0:F

    .line 159
    .line 160
    goto/16 :goto_1

    .line 161
    .line 162
    :pswitch_d
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->e0:F

    .line 163
    .line 164
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 165
    .line 166
    .line 167
    move-result v1

    .line 168
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->e0:F

    .line 169
    .line 170
    goto/16 :goto_1

    .line 171
    .line 172
    :pswitch_e
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->d0:F

    .line 173
    .line 174
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 175
    .line 176
    .line 177
    move-result v1

    .line 178
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->d0:F

    .line 179
    .line 180
    goto/16 :goto_1

    .line 181
    .line 182
    :pswitch_f
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->c0:F

    .line 183
    .line 184
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->c0:F

    .line 189
    .line 190
    goto/16 :goto_1

    .line 191
    .line 192
    :pswitch_10
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->b0:F

    .line 193
    .line 194
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->b0:F

    .line 199
    .line 200
    goto/16 :goto_1

    .line 201
    .line 202
    :pswitch_11
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->a0:F

    .line 203
    .line 204
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->a0:F

    .line 209
    .line 210
    goto/16 :goto_1

    .line 211
    .line 212
    :pswitch_12
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->Z:F

    .line 213
    .line 214
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->Z:F

    .line 219
    .line 220
    goto/16 :goto_1

    .line 221
    .line 222
    :pswitch_13
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->Y:F

    .line 223
    .line 224
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 225
    .line 226
    .line 227
    move-result v1

    .line 228
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->Y:F

    .line 229
    .line 230
    goto/16 :goto_1

    .line 231
    .line 232
    :pswitch_14
    const/4 v2, 0x1

    .line 233
    iput-boolean v2, p1, Landroidx/constraintlayout/widget/a$b;->V:Z

    .line 234
    .line 235
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->W:F

    .line 236
    .line 237
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 238
    .line 239
    .line 240
    move-result v1

    .line 241
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->W:F

    .line 242
    .line 243
    goto/16 :goto_1

    .line 244
    .line 245
    :pswitch_15
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->U:F

    .line 246
    .line 247
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->U:F

    .line 252
    .line 253
    goto/16 :goto_1

    .line 254
    .line 255
    :pswitch_16
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->T:I

    .line 256
    .line 257
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 258
    .line 259
    .line 260
    move-result v1

    .line 261
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->T:I

    .line 262
    .line 263
    goto/16 :goto_1

    .line 264
    .line 265
    :pswitch_17
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->S:I

    .line 266
    .line 267
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 268
    .line 269
    .line 270
    move-result v1

    .line 271
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->S:I

    .line 272
    .line 273
    goto/16 :goto_1

    .line 274
    .line 275
    :pswitch_18
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->Q:F

    .line 276
    .line 277
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 278
    .line 279
    .line 280
    move-result v1

    .line 281
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->Q:F

    .line 282
    .line 283
    goto/16 :goto_1

    .line 284
    .line 285
    :pswitch_19
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->R:F

    .line 286
    .line 287
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 288
    .line 289
    .line 290
    move-result v1

    .line 291
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->R:F

    .line 292
    .line 293
    goto/16 :goto_1

    .line 294
    .line 295
    :pswitch_1a
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->d:I

    .line 296
    .line 297
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getResourceId(II)I

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->d:I

    .line 302
    .line 303
    goto/16 :goto_1

    .line 304
    .line 305
    :pswitch_1b
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->v:F

    .line 306
    .line 307
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->v:F

    .line 312
    .line 313
    goto/16 :goto_1

    .line 314
    .line 315
    :pswitch_1c
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 316
    .line 317
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 318
    .line 319
    .line 320
    move-result v1

    .line 321
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->l:I

    .line 322
    .line 323
    goto/16 :goto_1

    .line 324
    .line 325
    :pswitch_1d
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 326
    .line 327
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->m:I

    .line 332
    .line 333
    goto/16 :goto_1

    .line 334
    .line 335
    :pswitch_1e
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->F:I

    .line 336
    .line 337
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 338
    .line 339
    .line 340
    move-result v1

    .line 341
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->F:I

    .line 342
    .line 343
    goto/16 :goto_1

    .line 344
    .line 345
    :pswitch_1f
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 346
    .line 347
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 348
    .line 349
    .line 350
    move-result v1

    .line 351
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->r:I

    .line 352
    .line 353
    goto/16 :goto_1

    .line 354
    .line 355
    :pswitch_20
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 356
    .line 357
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 358
    .line 359
    .line 360
    move-result v1

    .line 361
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->q:I

    .line 362
    .line 363
    goto/16 :goto_1

    .line 364
    .line 365
    :pswitch_21
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->I:I

    .line 366
    .line 367
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->I:I

    .line 372
    .line 373
    goto/16 :goto_1

    .line 374
    .line 375
    :pswitch_22
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 376
    .line 377
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->k:I

    .line 382
    .line 383
    goto/16 :goto_1

    .line 384
    .line 385
    :pswitch_23
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 386
    .line 387
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 388
    .line 389
    .line 390
    move-result v1

    .line 391
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->j:I

    .line 392
    .line 393
    goto/16 :goto_1

    .line 394
    .line 395
    :pswitch_24
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->E:I

    .line 396
    .line 397
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 398
    .line 399
    .line 400
    move-result v1

    .line 401
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->E:I

    .line 402
    .line 403
    goto/16 :goto_1

    .line 404
    .line 405
    :pswitch_25
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->C:I

    .line 406
    .line 407
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 408
    .line 409
    .line 410
    move-result v1

    .line 411
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->C:I

    .line 412
    .line 413
    goto/16 :goto_1

    .line 414
    .line 415
    :pswitch_26
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 416
    .line 417
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 418
    .line 419
    .line 420
    move-result v1

    .line 421
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->i:I

    .line 422
    .line 423
    goto/16 :goto_1

    .line 424
    .line 425
    :pswitch_27
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 426
    .line 427
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->h:I

    .line 432
    .line 433
    goto/16 :goto_1

    .line 434
    .line 435
    :pswitch_28
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->D:I

    .line 436
    .line 437
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 438
    .line 439
    .line 440
    move-result v1

    .line 441
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->D:I

    .line 442
    .line 443
    goto/16 :goto_1

    .line 444
    .line 445
    :pswitch_29
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->b:I

    .line 446
    .line 447
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->b:I

    .line 452
    .line 453
    goto/16 :goto_1

    .line 454
    .line 455
    :pswitch_2a
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 456
    .line 457
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 458
    .line 459
    .line 460
    move-result v1

    .line 461
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 462
    .line 463
    sget-object v2, Landroidx/constraintlayout/widget/a;->b:[I

    .line 464
    .line 465
    aget v1, v2, v1

    .line 466
    .line 467
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 468
    .line 469
    goto/16 :goto_1

    .line 470
    .line 471
    :pswitch_2b
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->c:I

    .line 472
    .line 473
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getLayoutDimension(II)I

    .line 474
    .line 475
    .line 476
    move-result v1

    .line 477
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->c:I

    .line 478
    .line 479
    goto/16 :goto_1

    .line 480
    .line 481
    :pswitch_2c
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->u:F

    .line 482
    .line 483
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 484
    .line 485
    .line 486
    move-result v1

    .line 487
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->u:F

    .line 488
    .line 489
    goto/16 :goto_1

    .line 490
    .line 491
    :pswitch_2d
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->g:F

    .line 492
    .line 493
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 494
    .line 495
    .line 496
    move-result v1

    .line 497
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->g:F

    .line 498
    .line 499
    goto/16 :goto_1

    .line 500
    .line 501
    :pswitch_2e
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->f:I

    .line 502
    .line 503
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->f:I

    .line 508
    .line 509
    goto/16 :goto_1

    .line 510
    .line 511
    :pswitch_2f
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->e:I

    .line 512
    .line 513
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 514
    .line 515
    .line 516
    move-result v1

    .line 517
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->e:I

    .line 518
    .line 519
    goto/16 :goto_1

    .line 520
    .line 521
    :pswitch_30
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->L:I

    .line 522
    .line 523
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 524
    .line 525
    .line 526
    move-result v1

    .line 527
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->L:I

    .line 528
    .line 529
    goto/16 :goto_1

    .line 530
    .line 531
    :pswitch_31
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->P:I

    .line 532
    .line 533
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 534
    .line 535
    .line 536
    move-result v1

    .line 537
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->P:I

    .line 538
    .line 539
    goto/16 :goto_1

    .line 540
    .line 541
    :pswitch_32
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->M:I

    .line 542
    .line 543
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 544
    .line 545
    .line 546
    move-result v1

    .line 547
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->M:I

    .line 548
    .line 549
    goto/16 :goto_1

    .line 550
    .line 551
    :pswitch_33
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->K:I

    .line 552
    .line 553
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 554
    .line 555
    .line 556
    move-result v1

    .line 557
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->K:I

    .line 558
    .line 559
    goto/16 :goto_1

    .line 560
    .line 561
    :pswitch_34
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->O:I

    .line 562
    .line 563
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 564
    .line 565
    .line 566
    move-result v1

    .line 567
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->O:I

    .line 568
    .line 569
    goto :goto_1

    .line 570
    :pswitch_35
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->N:I

    .line 571
    .line 572
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 573
    .line 574
    .line 575
    move-result v1

    .line 576
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->N:I

    .line 577
    .line 578
    goto :goto_1

    .line 579
    :pswitch_36
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 580
    .line 581
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 582
    .line 583
    .line 584
    move-result v1

    .line 585
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->s:I

    .line 586
    .line 587
    goto :goto_1

    .line 588
    :pswitch_37
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 589
    .line 590
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 591
    .line 592
    .line 593
    move-result v1

    .line 594
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->t:I

    .line 595
    .line 596
    goto :goto_1

    .line 597
    :pswitch_38
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->H:I

    .line 598
    .line 599
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 600
    .line 601
    .line 602
    move-result v1

    .line 603
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->H:I

    .line 604
    .line 605
    goto :goto_1

    .line 606
    :pswitch_39
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->B:I

    .line 607
    .line 608
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 609
    .line 610
    .line 611
    move-result v1

    .line 612
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->B:I

    .line 613
    .line 614
    goto :goto_1

    .line 615
    :pswitch_3a
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->A:I

    .line 616
    .line 617
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelOffset(II)I

    .line 618
    .line 619
    .line 620
    move-result v1

    .line 621
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->A:I

    .line 622
    .line 623
    goto :goto_1

    .line 624
    :pswitch_3b
    invoke-virtual {p2, v1}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v1

    .line 628
    iput-object v1, p1, Landroidx/constraintlayout/widget/a$b;->w:Ljava/lang/String;

    .line 629
    .line 630
    goto :goto_1

    .line 631
    :pswitch_3c
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 632
    .line 633
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 634
    .line 635
    .line 636
    move-result v1

    .line 637
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->n:I

    .line 638
    .line 639
    goto :goto_1

    .line 640
    :pswitch_3d
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 641
    .line 642
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 643
    .line 644
    .line 645
    move-result v1

    .line 646
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->o:I

    .line 647
    .line 648
    goto :goto_1

    .line 649
    :pswitch_3e
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->G:I

    .line 650
    .line 651
    invoke-virtual {p2, v1, v2}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 652
    .line 653
    .line 654
    move-result v1

    .line 655
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->G:I

    .line 656
    .line 657
    goto :goto_1

    .line 658
    :pswitch_3f
    iget v2, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 659
    .line 660
    invoke-static {p2, v1, v2}, Landroidx/constraintlayout/widget/a;->o(Landroid/content/res/TypedArray;II)I

    .line 661
    .line 662
    .line 663
    move-result v1

    .line 664
    iput v1, p1, Landroidx/constraintlayout/widget/a$b;->p:I

    .line 665
    .line 666
    :goto_1
    add-int/lit8 v0, v0, 0x1

    .line 667
    .line 668
    goto/16 :goto_0

    .line 669
    .line 670
    :cond_0
    return-void

    .line 671
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3f
        :pswitch_3e
        :pswitch_3d
        :pswitch_3c
        :pswitch_3b
        :pswitch_3a
        :pswitch_39
        :pswitch_38
        :pswitch_37
        :pswitch_36
        :pswitch_35
        :pswitch_34
        :pswitch_33
        :pswitch_32
        :pswitch_31
        :pswitch_30
        :pswitch_2f
        :pswitch_2e
        :pswitch_2d
        :pswitch_2c
        :pswitch_2b
        :pswitch_2a
        :pswitch_29
        :pswitch_28
        :pswitch_27
        :pswitch_26
        :pswitch_25
        :pswitch_24
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
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
    .end packed-switch

    .line 672
    .line 673
    .line 674
    .line 675
    .line 676
    .line 677
    .line 678
    .line 679
    .line 680
    .line 681
    .line 682
    .line 683
    .line 684
    .line 685
    .line 686
    .line 687
    .line 688
    .line 689
    .line 690
    .line 691
    .line 692
    .line 693
    .line 694
    .line 695
    .line 696
    .line 697
    .line 698
    .line 699
    .line 700
    .line 701
    .line 702
    .line 703
    .line 704
    .line 705
    .line 706
    .line 707
    .line 708
    .line 709
    .line 710
    .line 711
    .line 712
    .line 713
    .line 714
    .line 715
    .line 716
    .line 717
    .line 718
    .line 719
    .line 720
    .line 721
    .line 722
    .line 723
    .line 724
    .line 725
    .line 726
    .line 727
    .line 728
    .line 729
    .line 730
    .line 731
    .line 732
    .line 733
    .line 734
    .line 735
    .line 736
    .line 737
    .line 738
    .line 739
    .line 740
    .line 741
    .line 742
    .line 743
    .line 744
    .line 745
    .line 746
    .line 747
    .line 748
    .line 749
    .line 750
    .line 751
    .line 752
    .line 753
    .line 754
    .line 755
    .line 756
    .line 757
    .line 758
    .line 759
    .line 760
    .line 761
    .line 762
    .line 763
    .line 764
    .line 765
    .line 766
    .line 767
    .line 768
    .line 769
    .line 770
    .line 771
    .line 772
    .line 773
    .line 774
    .line 775
    .line 776
    .line 777
    .line 778
    .line 779
    .line 780
    .line 781
    :pswitch_data_1
    .packed-switch 0x3c
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
    .end packed-switch

    .line 782
    .line 783
    .line 784
    .line 785
    .line 786
    .line 787
    .line 788
    .line 789
    .line 790
    .line 791
    .line 792
    .line 793
    :pswitch_data_2
    .packed-switch 0x45
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public q(ILjava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput-object p2, p0, Landroidx/constraintlayout/widget/a$b;->w:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public r(IF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->g0:F

    .line 6
    .line 7
    return-void
.end method

.method public s(II)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Landroidx/constraintlayout/widget/a;->m(I)Landroidx/constraintlayout/widget/a$b;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iput p2, p0, Landroidx/constraintlayout/widget/a$b;->J:I

    .line 6
    .line 7
    return-void
.end method

.method public final t(I)Ljava/lang/String;
    .locals 0

    .line 1
    packed-switch p1, :pswitch_data_0

    .line 2
    .line 3
    .line 4
    const-string p0, "undefined"

    .line 5
    .line 6
    return-object p0

    .line 7
    :pswitch_0
    const-string p0, "end"

    .line 8
    .line 9
    return-object p0

    .line 10
    :pswitch_1
    const-string p0, "start"

    .line 11
    .line 12
    return-object p0

    .line 13
    :pswitch_2
    const-string p0, "baseline"

    .line 14
    .line 15
    return-object p0

    .line 16
    :pswitch_3
    const-string p0, "bottom"

    .line 17
    .line 18
    return-object p0

    .line 19
    :pswitch_4
    const-string p0, "top"

    .line 20
    .line 21
    return-object p0

    .line 22
    :pswitch_5
    const-string p0, "right"

    .line 23
    .line 24
    return-object p0

    .line 25
    :pswitch_6
    const-string p0, "left"

    .line 26
    .line 27
    return-object p0

    .line 28
    nop

    .line 29
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
