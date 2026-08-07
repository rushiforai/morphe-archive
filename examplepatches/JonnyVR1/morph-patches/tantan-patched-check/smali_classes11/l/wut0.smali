.class public final Ll/wut0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hvs0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/v6s0;

.field public final c:Landroid/os/PowerManager;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/v6s0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/wut0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/wut0;->b:Ll/v6s0;

    .line 7
    .line 8
    const-string p2, "power"

    .line 9
    .line 10
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    check-cast p1, Landroid/os/PowerManager;

    .line 15
    .line 16
    iput-object p1, p0, Ll/wut0;->c:Landroid/os/PowerManager;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public final a(Ll/gvt0;)Lorg/json/JSONObject;
    .locals 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    new-instance v0, Lorg/json/JSONArray;

    .line 2
    .line 3
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lorg/json/JSONObject;

    .line 7
    .line 8
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p1, Ll/gvt0;->f:Ll/x6s0;

    .line 12
    .line 13
    if-nez v2, :cond_0

    .line 14
    .line 15
    new-instance p0, Lorg/json/JSONObject;

    .line 16
    .line 17
    invoke-direct {p0}, Lorg/json/JSONObject;-><init>()V

    .line 18
    .line 19
    .line 20
    goto/16 :goto_2

    .line 21
    .line 22
    :cond_0
    iget-object v3, p0, Ll/wut0;->b:Ll/v6s0;

    .line 23
    .line 24
    invoke-virtual {v3}, Ll/v6s0;->d()Lorg/json/JSONObject;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    if-eqz v3, :cond_6

    .line 29
    .line 30
    iget-boolean v3, v2, Ll/x6s0;->a:Z

    .line 31
    .line 32
    new-instance v4, Lorg/json/JSONObject;

    .line 33
    .line 34
    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    .line 35
    .line 36
    .line 37
    iget-object v5, p0, Ll/wut0;->b:Ll/v6s0;

    .line 38
    .line 39
    const-string v6, "afmaVersion"

    .line 40
    .line 41
    invoke-virtual {v5}, Ll/v6s0;->b()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 46
    .line 47
    .line 48
    move-result-object v5

    .line 49
    iget-object v6, p0, Ll/wut0;->b:Ll/v6s0;

    .line 50
    .line 51
    const-string v7, "activeViewJSON"

    .line 52
    .line 53
    invoke-virtual {v6}, Ll/v6s0;->d()Lorg/json/JSONObject;

    .line 54
    .line 55
    .line 56
    move-result-object v6

    .line 57
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    iget-wide v6, p1, Ll/gvt0;->d:J

    .line 62
    .line 63
    const-string v8, "timestamp"

    .line 64
    .line 65
    invoke-virtual {v5, v8, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 66
    .line 67
    .line 68
    move-result-object v5

    .line 69
    iget-object v6, p0, Ll/wut0;->b:Ll/v6s0;

    .line 70
    .line 71
    const-string v7, "adFormat"

    .line 72
    .line 73
    invoke-virtual {v6}, Ll/v6s0;->a()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v6

    .line 77
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 78
    .line 79
    .line 80
    move-result-object v5

    .line 81
    iget-object v6, p0, Ll/wut0;->b:Ll/v6s0;

    .line 82
    .line 83
    const-string v7, "hashCode"

    .line 84
    .line 85
    invoke-virtual {v6}, Ll/v6s0;->c()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 90
    .line 91
    .line 92
    move-result-object v5

    .line 93
    const-string v6, "isMraid"

    .line 94
    .line 95
    const/4 v7, 0x0

    .line 96
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    const-string v6, "isStopped"

    .line 101
    .line 102
    invoke-virtual {v5, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 103
    .line 104
    .line 105
    move-result-object v5

    .line 106
    iget-boolean v6, p1, Ll/gvt0;->b:Z

    .line 107
    .line 108
    const-string v7, "isPaused"

    .line 109
    .line 110
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 111
    .line 112
    .line 113
    move-result-object v5

    .line 114
    iget-object v6, p0, Ll/wut0;->b:Ll/v6s0;

    .line 115
    .line 116
    const-string v7, "isNative"

    .line 117
    .line 118
    invoke-virtual {v6}, Ll/v6s0;->e()Z

    .line 119
    .line 120
    .line 121
    move-result v6

    .line 122
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 123
    .line 124
    .line 125
    move-result-object v5

    .line 126
    iget-object v6, p0, Ll/wut0;->c:Landroid/os/PowerManager;

    .line 127
    .line 128
    const-string v7, "isScreenOn"

    .line 129
    .line 130
    invoke-virtual {v6}, Landroid/os/PowerManager;->isInteractive()Z

    .line 131
    .line 132
    .line 133
    move-result v6

    .line 134
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 135
    .line 136
    .line 137
    move-result-object v5

    .line 138
    invoke-static {}, Ll/bxy0;->t()Ll/mdr0;

    .line 139
    .line 140
    .line 141
    move-result-object v6

    .line 142
    invoke-virtual {v6}, Ll/mdr0;->e()Z

    .line 143
    .line 144
    .line 145
    move-result v6

    .line 146
    const-string v7, "appMuted"

    .line 147
    .line 148
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 149
    .line 150
    .line 151
    move-result-object v5

    .line 152
    invoke-static {}, Ll/bxy0;->t()Ll/mdr0;

    .line 153
    .line 154
    .line 155
    move-result-object v6

    .line 156
    invoke-virtual {v6}, Ll/mdr0;->a()F

    .line 157
    .line 158
    .line 159
    move-result v6

    .line 160
    float-to-double v6, v6

    .line 161
    const-string v8, "appVolume"

    .line 162
    .line 163
    invoke-virtual {v5, v8, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 164
    .line 165
    .line 166
    move-result-object v5

    .line 167
    iget-object v6, p0, Ll/wut0;->a:Landroid/content/Context;

    .line 168
    .line 169
    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 170
    .line 171
    .line 172
    move-result-object v6

    .line 173
    invoke-static {v6}, Ll/mdr0;->b(Landroid/content/Context;)F

    .line 174
    .line 175
    .line 176
    move-result v6

    .line 177
    float-to-double v6, v6

    .line 178
    const-string v8, "deviceVolume"

    .line 179
    .line 180
    invoke-virtual {v5, v8, v6, v7}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 181
    .line 182
    .line 183
    sget-object v5, Ll/sgs0;->I5:Ll/dgs0;

    .line 184
    .line 185
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 186
    .line 187
    .line 188
    move-result-object v6

    .line 189
    invoke-virtual {v6, v5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 190
    .line 191
    .line 192
    move-result-object v5

    .line 193
    check-cast v5, Ljava/lang/Boolean;

    .line 194
    .line 195
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 196
    .line 197
    .line 198
    move-result v5

    .line 199
    if-eqz v5, :cond_2

    .line 200
    .line 201
    iget-object v5, p0, Ll/wut0;->a:Landroid/content/Context;

    .line 202
    .line 203
    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 204
    .line 205
    .line 206
    move-result-object v5

    .line 207
    const-string v6, "audio"

    .line 208
    .line 209
    invoke-virtual {v5, v6}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v5

    .line 213
    check-cast v5, Landroid/media/AudioManager;

    .line 214
    .line 215
    if-nez v5, :cond_1

    .line 216
    .line 217
    const/4 v5, 0x0

    .line 218
    goto :goto_0

    .line 219
    :cond_1
    invoke-virtual {v5}, Landroid/media/AudioManager;->getMode()I

    .line 220
    .line 221
    .line 222
    move-result v5

    .line 223
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v5

    .line 227
    :goto_0
    if-eqz v5, :cond_2

    .line 228
    .line 229
    const-string v6, "audioMode"

    .line 230
    .line 231
    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 232
    .line 233
    .line 234
    :cond_2
    new-instance v5, Landroid/graphics/Rect;

    .line 235
    .line 236
    invoke-direct {v5}, Landroid/graphics/Rect;-><init>()V

    .line 237
    .line 238
    .line 239
    iget-object v6, p0, Ll/wut0;->a:Landroid/content/Context;

    .line 240
    .line 241
    const-string v7, "window"

    .line 242
    .line 243
    invoke-virtual {v6, v7}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    move-result-object v6

    .line 247
    check-cast v6, Landroid/view/WindowManager;

    .line 248
    .line 249
    invoke-interface {v6}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 250
    .line 251
    .line 252
    move-result-object v6

    .line 253
    invoke-virtual {v6}, Landroid/view/Display;->getWidth()I

    .line 254
    .line 255
    .line 256
    move-result v7

    .line 257
    iput v7, v5, Landroid/graphics/Rect;->right:I

    .line 258
    .line 259
    invoke-virtual {v6}, Landroid/view/Display;->getHeight()I

    .line 260
    .line 261
    .line 262
    move-result v6

    .line 263
    iput v6, v5, Landroid/graphics/Rect;->bottom:I

    .line 264
    .line 265
    iget-object p0, p0, Ll/wut0;->a:Landroid/content/Context;

    .line 266
    .line 267
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 268
    .line 269
    .line 270
    move-result-object p0

    .line 271
    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    iget v5, v2, Ll/x6s0;->b:I

    .line 276
    .line 277
    const-string v6, "windowVisibility"

    .line 278
    .line 279
    invoke-virtual {v4, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 280
    .line 281
    .line 282
    move-result-object v5

    .line 283
    const-string v6, "isAttachedToWindow"

    .line 284
    .line 285
    invoke-virtual {v5, v6, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 286
    .line 287
    .line 288
    move-result-object v3

    .line 289
    new-instance v5, Lorg/json/JSONObject;

    .line 290
    .line 291
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 292
    .line 293
    .line 294
    iget-object v6, v2, Ll/x6s0;->c:Landroid/graphics/Rect;

    .line 295
    .line 296
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 297
    .line 298
    const-string v7, "top"

    .line 299
    .line 300
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 301
    .line 302
    .line 303
    move-result-object v5

    .line 304
    iget-object v6, v2, Ll/x6s0;->c:Landroid/graphics/Rect;

    .line 305
    .line 306
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 307
    .line 308
    const-string v8, "bottom"

    .line 309
    .line 310
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 311
    .line 312
    .line 313
    move-result-object v5

    .line 314
    iget-object v6, v2, Ll/x6s0;->c:Landroid/graphics/Rect;

    .line 315
    .line 316
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 317
    .line 318
    const-string v9, "left"

    .line 319
    .line 320
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    iget-object v6, v2, Ll/x6s0;->c:Landroid/graphics/Rect;

    .line 325
    .line 326
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 327
    .line 328
    const-string v10, "right"

    .line 329
    .line 330
    invoke-virtual {v5, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 331
    .line 332
    .line 333
    move-result-object v5

    .line 334
    const-string v6, "viewBox"

    .line 335
    .line 336
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    new-instance v5, Lorg/json/JSONObject;

    .line 341
    .line 342
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 343
    .line 344
    .line 345
    iget-object v6, v2, Ll/x6s0;->d:Landroid/graphics/Rect;

    .line 346
    .line 347
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 348
    .line 349
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 350
    .line 351
    .line 352
    move-result-object v5

    .line 353
    iget-object v6, v2, Ll/x6s0;->d:Landroid/graphics/Rect;

    .line 354
    .line 355
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 356
    .line 357
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 358
    .line 359
    .line 360
    move-result-object v5

    .line 361
    iget-object v6, v2, Ll/x6s0;->d:Landroid/graphics/Rect;

    .line 362
    .line 363
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 364
    .line 365
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 366
    .line 367
    .line 368
    move-result-object v5

    .line 369
    iget-object v6, v2, Ll/x6s0;->d:Landroid/graphics/Rect;

    .line 370
    .line 371
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 372
    .line 373
    invoke-virtual {v5, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 374
    .line 375
    .line 376
    move-result-object v5

    .line 377
    const-string v6, "adBox"

    .line 378
    .line 379
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    new-instance v5, Lorg/json/JSONObject;

    .line 384
    .line 385
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 386
    .line 387
    .line 388
    iget-object v6, v2, Ll/x6s0;->e:Landroid/graphics/Rect;

    .line 389
    .line 390
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 391
    .line 392
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 393
    .line 394
    .line 395
    move-result-object v5

    .line 396
    iget-object v6, v2, Ll/x6s0;->e:Landroid/graphics/Rect;

    .line 397
    .line 398
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 399
    .line 400
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 401
    .line 402
    .line 403
    move-result-object v5

    .line 404
    iget-object v6, v2, Ll/x6s0;->e:Landroid/graphics/Rect;

    .line 405
    .line 406
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 407
    .line 408
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 409
    .line 410
    .line 411
    move-result-object v5

    .line 412
    iget-object v6, v2, Ll/x6s0;->e:Landroid/graphics/Rect;

    .line 413
    .line 414
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 415
    .line 416
    invoke-virtual {v5, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 417
    .line 418
    .line 419
    move-result-object v5

    .line 420
    const-string v6, "globalVisibleBox"

    .line 421
    .line 422
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 423
    .line 424
    .line 425
    move-result-object v3

    .line 426
    iget-boolean v5, v2, Ll/x6s0;->f:Z

    .line 427
    .line 428
    const-string v6, "globalVisibleBoxVisible"

    .line 429
    .line 430
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 431
    .line 432
    .line 433
    move-result-object v3

    .line 434
    new-instance v5, Lorg/json/JSONObject;

    .line 435
    .line 436
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 437
    .line 438
    .line 439
    iget-object v6, v2, Ll/x6s0;->g:Landroid/graphics/Rect;

    .line 440
    .line 441
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 442
    .line 443
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 444
    .line 445
    .line 446
    move-result-object v5

    .line 447
    iget-object v6, v2, Ll/x6s0;->g:Landroid/graphics/Rect;

    .line 448
    .line 449
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 450
    .line 451
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 452
    .line 453
    .line 454
    move-result-object v5

    .line 455
    iget-object v6, v2, Ll/x6s0;->g:Landroid/graphics/Rect;

    .line 456
    .line 457
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 458
    .line 459
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 460
    .line 461
    .line 462
    move-result-object v5

    .line 463
    iget-object v6, v2, Ll/x6s0;->g:Landroid/graphics/Rect;

    .line 464
    .line 465
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 466
    .line 467
    invoke-virtual {v5, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 468
    .line 469
    .line 470
    move-result-object v5

    .line 471
    const-string v6, "localVisibleBox"

    .line 472
    .line 473
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 474
    .line 475
    .line 476
    move-result-object v3

    .line 477
    iget-boolean v5, v2, Ll/x6s0;->h:Z

    .line 478
    .line 479
    const-string v6, "localVisibleBoxVisible"

    .line 480
    .line 481
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 482
    .line 483
    .line 484
    move-result-object v3

    .line 485
    new-instance v5, Lorg/json/JSONObject;

    .line 486
    .line 487
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 488
    .line 489
    .line 490
    iget-object v6, v2, Ll/x6s0;->i:Landroid/graphics/Rect;

    .line 491
    .line 492
    iget v6, v6, Landroid/graphics/Rect;->top:I

    .line 493
    .line 494
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 495
    .line 496
    .line 497
    move-result-object v5

    .line 498
    iget-object v6, v2, Ll/x6s0;->i:Landroid/graphics/Rect;

    .line 499
    .line 500
    iget v6, v6, Landroid/graphics/Rect;->bottom:I

    .line 501
    .line 502
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 503
    .line 504
    .line 505
    move-result-object v5

    .line 506
    iget-object v6, v2, Ll/x6s0;->i:Landroid/graphics/Rect;

    .line 507
    .line 508
    iget v6, v6, Landroid/graphics/Rect;->left:I

    .line 509
    .line 510
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 511
    .line 512
    .line 513
    move-result-object v5

    .line 514
    iget-object v6, v2, Ll/x6s0;->i:Landroid/graphics/Rect;

    .line 515
    .line 516
    iget v6, v6, Landroid/graphics/Rect;->right:I

    .line 517
    .line 518
    invoke-virtual {v5, v10, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 519
    .line 520
    .line 521
    move-result-object v5

    .line 522
    const-string v6, "hitBox"

    .line 523
    .line 524
    invoke-virtual {v3, v6, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 525
    .line 526
    .line 527
    move-result-object v3

    .line 528
    iget p0, p0, Landroid/util/DisplayMetrics;->density:F

    .line 529
    .line 530
    float-to-double v5, p0

    .line 531
    const-string p0, "screenDensity"

    .line 532
    .line 533
    invoke-virtual {v3, p0, v5, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;D)Lorg/json/JSONObject;

    .line 534
    .line 535
    .line 536
    iget-boolean p0, p1, Ll/gvt0;->a:Z

    .line 537
    .line 538
    const-string v3, "isVisible"

    .line 539
    .line 540
    invoke-virtual {v4, v3, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 541
    .line 542
    .line 543
    sget-object p0, Ll/sgs0;->p1:Ll/dgs0;

    .line 544
    .line 545
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 546
    .line 547
    .line 548
    move-result-object v3

    .line 549
    invoke-virtual {v3, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 550
    .line 551
    .line 552
    move-result-object p0

    .line 553
    check-cast p0, Ljava/lang/Boolean;

    .line 554
    .line 555
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 556
    .line 557
    .line 558
    move-result p0

    .line 559
    if-eqz p0, :cond_4

    .line 560
    .line 561
    new-instance p0, Lorg/json/JSONArray;

    .line 562
    .line 563
    invoke-direct {p0}, Lorg/json/JSONArray;-><init>()V

    .line 564
    .line 565
    .line 566
    iget-object v2, v2, Ll/x6s0;->k:Ljava/util/List;

    .line 567
    .line 568
    if-eqz v2, :cond_3

    .line 569
    .line 570
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 571
    .line 572
    .line 573
    move-result-object v2

    .line 574
    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 575
    .line 576
    .line 577
    move-result v3

    .line 578
    if-eqz v3, :cond_3

    .line 579
    .line 580
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 581
    .line 582
    .line 583
    move-result-object v3

    .line 584
    check-cast v3, Landroid/graphics/Rect;

    .line 585
    .line 586
    new-instance v5, Lorg/json/JSONObject;

    .line 587
    .line 588
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 589
    .line 590
    .line 591
    iget v6, v3, Landroid/graphics/Rect;->top:I

    .line 592
    .line 593
    invoke-virtual {v5, v7, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 594
    .line 595
    .line 596
    move-result-object v5

    .line 597
    iget v6, v3, Landroid/graphics/Rect;->bottom:I

    .line 598
    .line 599
    invoke-virtual {v5, v8, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 600
    .line 601
    .line 602
    move-result-object v5

    .line 603
    iget v6, v3, Landroid/graphics/Rect;->left:I

    .line 604
    .line 605
    invoke-virtual {v5, v9, v6}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 606
    .line 607
    .line 608
    move-result-object v5

    .line 609
    iget v3, v3, Landroid/graphics/Rect;->right:I

    .line 610
    .line 611
    invoke-virtual {v5, v10, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 612
    .line 613
    .line 614
    move-result-object v3

    .line 615
    invoke-virtual {p0, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 616
    .line 617
    .line 618
    goto :goto_1

    .line 619
    :cond_3
    const-string v2, "scrollableContainerBoxes"

    .line 620
    .line 621
    invoke-virtual {v4, v2, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 622
    .line 623
    .line 624
    :cond_4
    iget-object p0, p1, Ll/gvt0;->e:Ljava/lang/String;

    .line 625
    .line 626
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 627
    .line 628
    .line 629
    move-result p0

    .line 630
    if-nez p0, :cond_5

    .line 631
    .line 632
    const-string p0, "doneReasonCode"

    .line 633
    .line 634
    const-string p1, "u"

    .line 635
    .line 636
    invoke-virtual {v4, p0, p1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 637
    .line 638
    .line 639
    :cond_5
    move-object p0, v4

    .line 640
    :goto_2
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 641
    .line 642
    .line 643
    const-string p0, "units"

    .line 644
    .line 645
    invoke-virtual {v1, p0, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 646
    .line 647
    .line 648
    return-object v1

    .line 649
    :cond_6
    new-instance p0, Lorg/json/JSONException;

    .line 650
    .line 651
    const-string p1, "Active view Info cannot be null."

    .line 652
    .line 653
    invoke-direct {p0, p1}, Lorg/json/JSONException;-><init>(Ljava/lang/String;)V

    .line 654
    .line 655
    .line 656
    throw p0
.end method

.method public final bridge synthetic zzb(Ljava/lang/Object;)Lorg/json/JSONObject;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    check-cast p1, Ll/gvt0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/wut0;->a(Ll/gvt0;)Lorg/json/JSONObject;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
