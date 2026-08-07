.class public final Ll/pgg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static C:Ll/twg0;

.field public static D:Ll/geg0;


# instance fields
.field public A:Z

.field public B:Ljava/lang/Integer;

.field public a:Ll/yxg0;

.field public final b:Landroid/app/Activity;

.field public final c:Ljava/util/HashMap;

.field public final d:Landroid/util/SparseArray;

.field public e:I

.field public final f:Landroid/util/SparseArray;

.field public g:Ll/sig0;

.field public h:Ll/qkg0;

.field public final i:F

.field public final j:Landroid/widget/FrameLayout;

.field public final k:Landroid/widget/FrameLayout;

.field public l:Z

.field public m:Landroid/widget/FrameLayout;

.field public n:Ljava/lang/String;

.field public o:Z

.field public final p:I

.field public q:Ljava/lang/String;

.field public final r:Ljava/lang/String;

.field public s:Ljava/lang/String;

.field public t:Z

.field public u:Z

.field public v:Z

.field public w:Z

.field public final x:Ljava/lang/String;

.field public y:Ljava/lang/String;

.field public final z:I


# direct methods
.method public constructor <init>(Landroid/app/Activity;)V
    .locals 5

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
    iput-object v0, p0, Ll/pgg0;->c:Ljava/util/HashMap;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    const/16 v1, 0x64

    .line 14
    .line 15
    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/pgg0;->d:Landroid/util/SparseArray;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput v0, p0, Ll/pgg0;->e:I

    .line 22
    .line 23
    new-instance v2, Landroid/util/SparseArray;

    .line 24
    .line 25
    invoke-direct {v2, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 26
    .line 27
    .line 28
    iput-object v2, p0, Ll/pgg0;->f:Landroid/util/SparseArray;

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput v1, p0, Ll/pgg0;->p:I

    .line 32
    .line 33
    const-string v2, ".zip"

    .line 34
    .line 35
    iput-object v2, p0, Ll/pgg0;->r:Ljava/lang/String;

    .line 36
    .line 37
    const-string v2, ""

    .line 38
    .line 39
    iput-object v2, p0, Ll/pgg0;->s:Ljava/lang/String;

    .line 40
    .line 41
    iput-boolean v1, p0, Ll/pgg0;->u:Z

    .line 42
    .line 43
    iput-boolean v1, p0, Ll/pgg0;->v:Z

    .line 44
    .line 45
    iput-boolean v1, p0, Ll/pgg0;->w:Z

    .line 46
    .line 47
    const-string v2, "zh"

    .line 48
    .line 49
    iput-object v2, p0, Ll/pgg0;->x:Ljava/lang/String;

    .line 50
    .line 51
    const/4 v2, -0x1

    .line 52
    iput v2, p0, Ll/pgg0;->z:I

    .line 53
    .line 54
    iput-object p1, p0, Ll/pgg0;->b:Landroid/app/Activity;

    .line 55
    .line 56
    new-instance v2, Ll/yxg0;

    .line 57
    .line 58
    invoke-direct {v2, p1}, Ll/yxg0;-><init>(Landroid/app/Activity;)V

    .line 59
    .line 60
    .line 61
    iput-object v2, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 62
    .line 63
    sget-object v3, Ll/pgg0;->C:Ll/twg0;

    .line 64
    .line 65
    if-eqz v3, :cond_0

    .line 66
    .line 67
    sget-object v4, Ll/pgg0;->D:Ll/geg0;

    .line 68
    .line 69
    if-nez v4, :cond_0

    .line 70
    .line 71
    new-instance v4, Ll/geg0;

    .line 72
    .line 73
    invoke-direct {v4, v3}, Ll/geg0;-><init>(Ll/wig0;)V

    .line 74
    .line 75
    .line 76
    sput-object v4, Ll/pgg0;->D:Ll/geg0;

    .line 77
    .line 78
    iput-object v4, v2, Ll/yxg0;->f:Ll/geg0;

    .line 79
    .line 80
    iget-object v2, v2, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 81
    .line 82
    if-eqz v2, :cond_0

    .line 83
    .line 84
    invoke-interface {v2, v4}, Ltech/sud/runtime/a/a;->a(Ltech/sud/runtime/a/b;)V

    .line 85
    .line 86
    .line 87
    :cond_0
    iget-object v2, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 88
    .line 89
    iget-object v3, v2, Ll/yxg0;->b:Ll/sxg0;

    .line 90
    .line 91
    iget-boolean v4, p0, Ll/pgg0;->o:Z

    .line 92
    .line 93
    iput-boolean v4, v3, Ll/sxg0;->a:Z

    .line 94
    .line 95
    iput-boolean v1, v3, Ll/sxg0;->b:Z

    .line 96
    .line 97
    iput-boolean v1, v3, Ll/sxg0;->e:Z

    .line 98
    .line 99
    iput-boolean v1, v3, Ll/sxg0;->f:Z

    .line 100
    .line 101
    new-instance v1, Ll/wwg0;

    .line 102
    .line 103
    invoke-direct {v1, p0}, Ll/wwg0;-><init>(Ll/pgg0;)V

    .line 104
    .line 105
    .line 106
    const-string v3, "RTObjCreate"

    .line 107
    .line 108
    invoke-virtual {v2, v3, v1}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 109
    .line 110
    .line 111
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 112
    .line 113
    new-instance v2, Ll/fgg0;

    .line 114
    .line 115
    invoke-direct {v2, p0}, Ll/fgg0;-><init>(Ll/pgg0;)V

    .line 116
    .line 117
    .line 118
    const-string v3, "RTObjMsg"

    .line 119
    .line 120
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 121
    .line 122
    .line 123
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 124
    .line 125
    new-instance v2, Ll/ihg0;

    .line 126
    .line 127
    invoke-direct {v2, p0}, Ll/ihg0;-><init>(Ll/pgg0;)V

    .line 128
    .line 129
    .line 130
    const-string v3, "RTObjDestroy"

    .line 131
    .line 132
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 133
    .line 134
    .line 135
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 136
    .line 137
    new-instance v2, Ll/jmg0;

    .line 138
    .line 139
    invoke-direct {v2, p0}, Ll/jmg0;-><init>(Ll/pgg0;)V

    .line 140
    .line 141
    .line 142
    const-string v3, "RTGlobalCallback"

    .line 143
    .line 144
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 145
    .line 146
    .line 147
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 148
    .line 149
    new-instance v2, Ll/mpg0;

    .line 150
    .line 151
    invoke-direct {v2, p0}, Ll/mpg0;-><init>(Ll/pgg0;)V

    .line 152
    .line 153
    .line 154
    const-string v3, "exitRuntime"

    .line 155
    .line 156
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 157
    .line 158
    .line 159
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 160
    .line 161
    new-instance v2, Ll/jvg0;

    .line 162
    .line 163
    invoke-direct {v2, p0}, Ll/jvg0;-><init>(Ll/pgg0;)V

    .line 164
    .line 165
    .line 166
    const-string v3, "@enableConsole"

    .line 167
    .line 168
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 172
    .line 173
    new-instance v2, Ll/myg0;

    .line 174
    .line 175
    invoke-direct {v2, p0}, Ll/myg0;-><init>(Ll/pgg0;)V

    .line 176
    .line 177
    .line 178
    const-string v3, "@onState"

    .line 179
    .line 180
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 181
    .line 182
    .line 183
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 184
    .line 185
    new-instance v2, Ll/fpg0;

    .line 186
    .line 187
    invoke-direct {v2, p0}, Ll/fpg0;-><init>(Ll/pgg0;)V

    .line 188
    .line 189
    .line 190
    const-string v3, "GameViewOnAttachedToWindowReload"

    .line 191
    .line 192
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 193
    .line 194
    .line 195
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 196
    .line 197
    new-instance v2, Ll/bvg0;

    .line 198
    .line 199
    invoke-direct {v2, p0}, Ll/bvg0;-><init>(Ll/pgg0;)V

    .line 200
    .line 201
    .line 202
    const-string v3, "GameViewOnSurfaceCreated"

    .line 203
    .line 204
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 205
    .line 206
    .line 207
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 208
    .line 209
    new-instance v2, Ll/lzg0;

    .line 210
    .line 211
    invoke-direct {v2, p0}, Ll/lzg0;-><init>(Ll/pgg0;)V

    .line 212
    .line 213
    .line 214
    const-string v3, "GameViewOnSurfaceDestroyed"

    .line 215
    .line 216
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 217
    .line 218
    .line 219
    iget-object v1, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 220
    .line 221
    new-instance v2, Ll/dfg0;

    .line 222
    .line 223
    invoke-direct {v2, p0}, Ll/dfg0;-><init>(Ll/pgg0;)V

    .line 224
    .line 225
    .line 226
    const-string v3, "onGameANRDetected"

    .line 227
    .line 228
    invoke-virtual {v1, v3, v2}, Ll/yxg0;->b(Ljava/lang/String;Ltech/sud/runtime/a/a$a;)V

    .line 229
    .line 230
    .line 231
    new-instance v1, Ll/emg0;

    .line 232
    .line 233
    invoke-direct {v1}, Ll/emg0;-><init>()V

    .line 234
    .line 235
    .line 236
    const-string v2, "Button"

    .line 237
    .line 238
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 239
    .line 240
    .line 241
    new-instance v1, Ll/tig0;

    .line 242
    .line 243
    invoke-direct {v1}, Ll/tig0;-><init>()V

    .line 244
    .line 245
    .line 246
    const-string v2, "BannerAd"

    .line 247
    .line 248
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 249
    .line 250
    .line 251
    new-instance v1, Ll/szg0;

    .line 252
    .line 253
    invoke-direct {v1}, Ll/szg0;-><init>()V

    .line 254
    .line 255
    .line 256
    const-string v2, "RewardedVideoAd"

    .line 257
    .line 258
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 259
    .line 260
    .line 261
    new-instance v1, Ll/cvg0;

    .line 262
    .line 263
    invoke-direct {v1}, Ll/cvg0;-><init>()V

    .line 264
    .line 265
    .line 266
    const-string v2, "InterstitialAd"

    .line 267
    .line 268
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 269
    .line 270
    .line 271
    new-instance v1, Ll/uig0;

    .line 272
    .line 273
    invoke-direct {v1}, Ll/uig0;-><init>()V

    .line 274
    .line 275
    .line 276
    const-string v2, "UpdateManager"

    .line 277
    .line 278
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 279
    .line 280
    .line 281
    new-instance v1, Ll/ymg0;

    .line 282
    .line 283
    const-class v2, Ll/vig0;

    .line 284
    .line 285
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 286
    .line 287
    .line 288
    const-string v2, "GetLocation@"

    .line 289
    .line 290
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 291
    .line 292
    .line 293
    new-instance v1, Ll/ymg0;

    .line 294
    .line 295
    const-class v2, Ll/zsg0;

    .line 296
    .line 297
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 298
    .line 299
    .line 300
    const-string v2, "Authorize@"

    .line 301
    .line 302
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 303
    .line 304
    .line 305
    new-instance v1, Ll/ymg0;

    .line 306
    .line 307
    const-class v2, Ll/kmg0;

    .line 308
    .line 309
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 310
    .line 311
    .line 312
    const-string v2, "Login@"

    .line 313
    .line 314
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 315
    .line 316
    .line 317
    new-instance v1, Ll/ymg0;

    .line 318
    .line 319
    const-class v2, Ll/dvg0;

    .line 320
    .line 321
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 322
    .line 323
    .line 324
    const-string v2, "CheckSession@"

    .line 325
    .line 326
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 327
    .line 328
    .line 329
    new-instance v1, Ll/ymg0;

    .line 330
    .line 331
    const-class v2, Ll/ggg0;

    .line 332
    .line 333
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 334
    .line 335
    .line 336
    const-string v2, "GetSetting@"

    .line 337
    .line 338
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 339
    .line 340
    .line 341
    new-instance v1, Ll/ymg0;

    .line 342
    .line 343
    const-class v2, Ll/jhg0;

    .line 344
    .line 345
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 346
    .line 347
    .line 348
    const-string v2, "GetUserInfo@"

    .line 349
    .line 350
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 351
    .line 352
    .line 353
    new-instance v1, Ll/ymg0;

    .line 354
    .line 355
    const-class v2, Ll/qgg0;

    .line 356
    .line 357
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 358
    .line 359
    .line 360
    const-string v2, "UserInfoButtonTap@"

    .line 361
    .line 362
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 363
    .line 364
    .line 365
    new-instance v1, Ll/ymg0;

    .line 366
    .line 367
    const-class v2, Ll/npg0;

    .line 368
    .line 369
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 370
    .line 371
    .line 372
    const-string v2, "NavigateToMiniProgram@"

    .line 373
    .line 374
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 375
    .line 376
    .line 377
    new-instance v1, Ll/ymg0;

    .line 378
    .line 379
    const-class v2, Ll/hpg0;

    .line 380
    .line 381
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 382
    .line 383
    .line 384
    const-string v2, "CheckIsUserAdvisedToRest@"

    .line 385
    .line 386
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 387
    .line 388
    .line 389
    new-instance v1, Ll/ymg0;

    .line 390
    .line 391
    const-class v2, Ll/mfg0;

    .line 392
    .line 393
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 394
    .line 395
    .line 396
    const-string v2, "GetRunData@"

    .line 397
    .line 398
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 399
    .line 400
    .line 401
    new-instance v1, Ll/ymg0;

    .line 402
    .line 403
    const-class v2, Ll/xig0;

    .line 404
    .line 405
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 406
    .line 407
    .line 408
    const-string v2, "AddCard@"

    .line 409
    .line 410
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 411
    .line 412
    .line 413
    new-instance v1, Ll/ymg0;

    .line 414
    .line 415
    const-class v2, Ll/kvg0;

    .line 416
    .line 417
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 418
    .line 419
    .line 420
    const-string v2, "OpenCard@"

    .line 421
    .line 422
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 423
    .line 424
    .line 425
    new-instance v1, Ll/ymg0;

    .line 426
    .line 427
    const-class v2, Ll/dxg0;

    .line 428
    .line 429
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 430
    .line 431
    .line 432
    const-string v2, "FeedbackButtonTap@"

    .line 433
    .line 434
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 435
    .line 436
    .line 437
    new-instance v1, Ll/ymg0;

    .line 438
    .line 439
    const-class v2, Ll/tzg0;

    .line 440
    .line 441
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 442
    .line 443
    .line 444
    const-string v2, "GameClubButtonTap@"

    .line 445
    .line 446
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 447
    .line 448
    .line 449
    new-instance v1, Ll/ymg0;

    .line 450
    .line 451
    const-class v2, Ll/nyg0;

    .line 452
    .line 453
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 454
    .line 455
    .line 456
    const-string v2, "OpenCustomerServiceConversation@"

    .line 457
    .line 458
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 459
    .line 460
    .line 461
    new-instance v1, Ll/ymg0;

    .line 462
    .line 463
    const-class v2, Ll/c0h0;

    .line 464
    .line 465
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 466
    .line 467
    .line 468
    const-string v2, "OpenSettingButtonTap@"

    .line 469
    .line 470
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 471
    .line 472
    .line 473
    new-instance v1, Ll/ymg0;

    .line 474
    .line 475
    const-class v2, Ll/heg0;

    .line 476
    .line 477
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 478
    .line 479
    .line 480
    const-string v2, "OpenSetting@"

    .line 481
    .line 482
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 483
    .line 484
    .line 485
    new-instance v1, Ll/ymg0;

    .line 486
    .line 487
    const-class v2, Ll/yig0;

    .line 488
    .line 489
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 490
    .line 491
    .line 492
    const-string v2, "RequestPayment@"

    .line 493
    .line 494
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 495
    .line 496
    .line 497
    new-instance v1, Ll/ymg0;

    .line 498
    .line 499
    const-class v2, Ll/zig0;

    .line 500
    .line 501
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 502
    .line 503
    .line 504
    const-string v2, "GetShareInfo@"

    .line 505
    .line 506
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 507
    .line 508
    .line 509
    new-instance v1, Ll/ymg0;

    .line 510
    .line 511
    const-class v2, Ll/atg0;

    .line 512
    .line 513
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 514
    .line 515
    .line 516
    const-string v2, "HideShareMenu@"

    .line 517
    .line 518
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 519
    .line 520
    .line 521
    new-instance v1, Ll/ymg0;

    .line 522
    .line 523
    const-class v2, Ll/ipg0;

    .line 524
    .line 525
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 526
    .line 527
    .line 528
    const-string v2, "ShareAppMessage@"

    .line 529
    .line 530
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 531
    .line 532
    .line 533
    new-instance v1, Ll/ymg0;

    .line 534
    .line 535
    const-class v2, Ll/evg0;

    .line 536
    .line 537
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 538
    .line 539
    .line 540
    const-string v2, "ShowShareMenu@"

    .line 541
    .line 542
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 543
    .line 544
    .line 545
    new-instance v1, Ll/ymg0;

    .line 546
    .line 547
    const-class v2, Ll/exg0;

    .line 548
    .line 549
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 550
    .line 551
    .line 552
    const-string v2, "UpdateShareMenu@"

    .line 553
    .line 554
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 555
    .line 556
    .line 557
    new-instance v1, Ll/ymg0;

    .line 558
    .line 559
    const-class v2, Ll/fxg0;

    .line 560
    .line 561
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 562
    .line 563
    .line 564
    const-string v2, "ShowLoading@"

    .line 565
    .line 566
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 567
    .line 568
    .line 569
    new-instance v1, Ll/ymg0;

    .line 570
    .line 571
    const-class v2, Ll/ajg0;

    .line 572
    .line 573
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 574
    .line 575
    .line 576
    const-string v2, "HideLoading@"

    .line 577
    .line 578
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 579
    .line 580
    .line 581
    new-instance v1, Ll/ymg0;

    .line 582
    .line 583
    const-class v2, Ll/nfg0;

    .line 584
    .line 585
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 586
    .line 587
    .line 588
    const-string v2, "ShowToast@"

    .line 589
    .line 590
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 591
    .line 592
    .line 593
    new-instance v1, Ll/ymg0;

    .line 594
    .line 595
    const-class v2, Ll/btg0;

    .line 596
    .line 597
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 598
    .line 599
    .line 600
    const-string v2, "HideToast@"

    .line 601
    .line 602
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 603
    .line 604
    .line 605
    new-instance v1, Ll/ymg0;

    .line 606
    .line 607
    const-class v2, Ll/uzg0;

    .line 608
    .line 609
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 610
    .line 611
    .line 612
    const-string v2, "ShowModal@"

    .line 613
    .line 614
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 615
    .line 616
    .line 617
    new-instance v1, Ll/ymg0;

    .line 618
    .line 619
    const-class v2, Ll/fvg0;

    .line 620
    .line 621
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 622
    .line 623
    .line 624
    const-string v2, "ShowActionSheet@"

    .line 625
    .line 626
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 627
    .line 628
    .line 629
    new-instance v1, Ll/ymg0;

    .line 630
    .line 631
    const-class v2, Ll/hng0;

    .line 632
    .line 633
    invoke-direct {v1, v2}, Ll/ymg0;-><init>(Ljava/lang/Class;)V

    .line 634
    .line 635
    .line 636
    const-string v2, "SetMenuStyle@"

    .line 637
    .line 638
    invoke-virtual {p0, v2, v1}, Ll/pgg0;->b(Ljava/lang/String;Ll/uvg0;)V

    .line 639
    .line 640
    .line 641
    new-instance v1, Landroid/graphics/Point;

    .line 642
    .line 643
    invoke-direct {v1}, Landroid/graphics/Point;-><init>()V

    .line 644
    .line 645
    .line 646
    invoke-virtual {p1}, Landroid/app/Activity;->getWindowManager()Landroid/view/WindowManager;

    .line 647
    .line 648
    .line 649
    move-result-object v2

    .line 650
    invoke-interface {v2}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 651
    .line 652
    .line 653
    move-result-object v2

    .line 654
    invoke-virtual {v2, v1}, Landroid/view/Display;->getRealSize(Landroid/graphics/Point;)V

    .line 655
    .line 656
    .line 657
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 658
    .line 659
    .line 660
    move-result-object v1

    .line 661
    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 662
    .line 663
    .line 664
    move-result-object v1

    .line 665
    iget v1, v1, Landroid/util/DisplayMetrics;->density:F

    .line 666
    .line 667
    iput v1, p0, Ll/pgg0;->i:F

    .line 668
    .line 669
    new-instance v1, Landroid/widget/FrameLayout;

    .line 670
    .line 671
    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 672
    .line 673
    .line 674
    iput-object v1, p0, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 675
    .line 676
    new-instance v1, Landroid/widget/FrameLayout;

    .line 677
    .line 678
    invoke-direct {v1, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 679
    .line 680
    .line 681
    iput-object v1, p0, Ll/pgg0;->k:Landroid/widget/FrameLayout;

    .line 682
    .line 683
    iput-boolean v0, p0, Ll/pgg0;->l:Z

    .line 684
    .line 685
    return-void
.end method

.method public static c(Ll/pgg0;ILjava/lang/String;Lorg/json/JSONObject;)V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/pgg0;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/oxg0;

    .line 8
    .line 9
    const-string v0, "null"

    .line 10
    .line 11
    const-string v1, "WXGame"

    .line 12
    .line 13
    if-nez p0, :cond_1

    .line 14
    .line 15
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    if-eqz p3, :cond_0

    .line 20
    .line 21
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :cond_0
    filled-new-array {p0, p2, v0}, [Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    const-string p1, "objectMsg: obj %d not found, cmd %s, data %s"

    .line 30
    .line 31
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v1, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p0, p2, p3}, Ll/oxg0;->c(Ljava/lang/String;Lorg/json/JSONObject;)Z

    .line 40
    .line 41
    .line 42
    move-result p0

    .line 43
    if-nez p0, :cond_3

    .line 44
    .line 45
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    if-eqz p3, :cond_2

    .line 50
    .line 51
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    :cond_2
    filled-new-array {p0, p2, v0}, [Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "objectMsg: cmd not processed obj %d cmd %s, data %s"

    .line 60
    .line 61
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v1, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_3
    return-void
.end method

.method public static d(Ll/pgg0;Ljava/lang/String;ILorg/json/JSONObject;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/pgg0;->d:Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    const-string v1, "null"

    .line 8
    .line 9
    const-string v2, "WXGame"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    if-eqz p3, :cond_0

    .line 18
    .line 19
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    :cond_0
    filled-new-array {p1, p0, v1}, [Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string p1, "objectCreate: \"%s\" dup obj %d data %s"

    .line 28
    .line 29
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v2, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v0, p0, Ll/pgg0;->c:Ljava/util/HashMap;

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    check-cast v0, Ll/uvg0;

    .line 44
    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    if-eqz p3, :cond_2

    .line 52
    .line 53
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    :cond_2
    filled-new-array {p1, p0, v1}, [Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "objectCreate: \"%s\" not found for obj %d data %s"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    invoke-static {v2, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_3
    invoke-virtual {v0, p3}, Ll/uvg0;->a(Lorg/json/JSONObject;)Ll/oxg0;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    if-nez v0, :cond_5

    .line 76
    .line 77
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    if-eqz p3, :cond_4

    .line 82
    .line 83
    invoke-virtual {p3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v1

    .line 87
    :cond_4
    filled-new-array {p1, p0, v1}, [Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const-string p1, "objectCreate: \"%s\" failed for obj %d data %s"

    .line 92
    .line 93
    invoke-static {p1, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-static {v2, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-void

    .line 101
    :cond_5
    iput-object p0, v0, Ll/oxg0;->b:Ll/pgg0;

    .line 102
    .line 103
    iput p2, v0, Ll/oxg0;->a:I

    .line 104
    .line 105
    iget-object p0, p0, Ll/pgg0;->d:Landroid/util/SparseArray;

    .line 106
    .line 107
    invoke-virtual {p0, p2, v0}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 108
    .line 109
    .line 110
    :try_start_0
    invoke-virtual {v0, p3}, Ll/oxg0;->b(Lorg/json/JSONObject;)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {v0}, Ll/oxg0;->a()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 114
    .line 115
    .line 116
    return-void

    .line 117
    :catch_0
    move-exception p0

    .line 118
    new-instance p1, Ljava/lang/StringBuilder;

    .line 119
    .line 120
    const-string p2, "Dispatch:"

    .line 121
    .line 122
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-static {v2, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    .line 138
    .line 139
    invoke-virtual {v0}, Ll/oxg0;->e()V

    .line 140
    .line 141
    .line 142
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    iget-object v0, v0, Ll/yxg0;->c:Ltech/sud/runtime/a/c;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v1, 0x1

    .line 11
    invoke-interface {v0, v1}, Ltech/sud/runtime/a/a;->a(Z)V

    .line 12
    .line 13
    .line 14
    :goto_0
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/pgg0;->a:Ll/yxg0;

    .line 16
    .line 17
    iget-object v0, p0, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 18
    .line 19
    invoke-virtual {v0}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    instance-of v1, v0, Landroid/view/ViewGroup;

    .line 24
    .line 25
    iget-object p0, p0, Ll/pgg0;->j:Landroid/widget/FrameLayout;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    check-cast v0, Landroid/view/ViewGroup;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :cond_1
    invoke-virtual {p0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 36
    .line 37
    .line 38
    :cond_2
    return-void
.end method

.method public final b(Ljava/lang/String;Ll/uvg0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pgg0;->c:Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance p0, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string p2, "registerFactory: \""

    .line 12
    .line 13
    invoke-direct {p0, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string p1, "\" dup factory"

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "WXGame"

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/ysg0;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :cond_0
    iget-object p0, p0, Ll/pgg0;->c:Ljava/util/HashMap;

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    return-void
.end method
