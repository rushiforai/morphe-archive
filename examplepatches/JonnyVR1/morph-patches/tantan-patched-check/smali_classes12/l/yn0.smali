.class public Ll/yn0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/dql;


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "InlinedApi"
    }
.end annotation


# static fields
.field private static s:Ll/yn0;


# instance fields
.field private a:Landroid/content/Context;

.field private b:Landroid/app/Activity;

.field private c:Landroid/hardware/Camera;

.field private d:Landroid/hardware/Camera$Parameters;

.field private e:Ll/zpl;

.field private f:I

.field private g:I

.field private h:Z

.field private i:Lcom/idv/identity/platform/config/DeviceSetting;

.field private final j:Ljava/lang/Object;

.field private k:I

.field private l:I

.field private m:I

.field private n:I

.field private o:Z

.field private p:Z

.field private q:Z

.field private r:Z


# direct methods
.method private constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x5a

    .line 5
    .line 6
    iput v0, p0, Ll/yn0;->f:I

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    iput-boolean v0, p0, Ll/yn0;->h:Z

    .line 10
    .line 11
    new-instance v0, Lcom/idv/identity/platform/config/DeviceSetting;

    .line 12
    .line 13
    invoke-direct {v0}, Lcom/idv/identity/platform/config/DeviceSetting;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    iput v0, p0, Ll/yn0;->k:I

    .line 27
    .line 28
    iput v0, p0, Ll/yn0;->l:I

    .line 29
    .line 30
    iput v0, p0, Ll/yn0;->m:I

    .line 31
    .line 32
    iput v0, p0, Ll/yn0;->n:I

    .line 33
    .line 34
    iput-boolean v0, p0, Ll/yn0;->r:Z

    .line 35
    .line 36
    iput-boolean v0, p0, Ll/yn0;->o:Z

    .line 37
    .line 38
    iput-boolean v0, p0, Ll/yn0;->p:Z

    .line 39
    .line 40
    iput-boolean v0, p0, Ll/yn0;->q:Z

    .line 41
    .line 42
    return-void
.end method

.method public static synthetic A()Ll/yn0;
    .locals 1

    .line 1
    sget-object v0, Ll/yn0;->s:Ll/yn0;

    .line 2
    .line 3
    return-object v0
.end method

.method public static synthetic B(Ll/yn0;Lcom/idv/identity/platform/config/DeviceSetting;)I
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yn0;->F(Lcom/idv/identity/platform/config/DeviceSetting;)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic C(Ll/yn0;)Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method private D()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 2
    .line 3
    if-eqz v0, :cond_c

    .line 4
    .line 5
    iget-object v0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/DeviceSetting;->isWidthAuto()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/un0;->c()Ll/un0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v2, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v2

    .line 26
    iget-object v3, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 27
    .line 28
    invoke-virtual {v3}, Lcom/idv/identity/platform/config/DeviceSetting;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    invoke-virtual {v0, v2, v3, v1}, Ll/un0;->e(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-boolean v0, p0, Ll/yn0;->r:Z

    .line 38
    .line 39
    if-eqz v0, :cond_1

    .line 40
    .line 41
    invoke-static {}, Ll/un0;->c()Ll/un0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v2, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 46
    .line 47
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    sget v3, Ll/n94;->a:I

    .line 52
    .line 53
    sget v4, Ll/n94;->b:I

    .line 54
    .line 55
    invoke-virtual {v0, v2, v3, v4}, Ll/un0;->e(Ljava/util/List;II)Landroid/hardware/Camera$Size;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    invoke-static {}, Ll/un0;->c()Ll/un0;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    iget-object v2, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 65
    .line 66
    invoke-virtual {v2}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewSizes()Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v2

    .line 70
    iget-object v3, p0, Ll/yn0;->a:Landroid/content/Context;

    .line 71
    .line 72
    iget-boolean v4, p0, Ll/yn0;->h:Z

    .line 73
    .line 74
    invoke-static {v3, v4}, Ll/x5e;->c(Landroid/content/Context;Z)F

    .line 75
    .line 76
    .line 77
    move-result v3

    .line 78
    sget v4, Ll/n94;->c:I

    .line 79
    .line 80
    invoke-virtual {v0, v2, v3, v4}, Ll/un0;->d(Ljava/util/List;FI)Landroid/hardware/Camera$Size;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    :goto_0
    const-string v2, "AndroidImpl"

    .line 85
    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    iget v3, v0, Landroid/hardware/Camera$Size;->width:I

    .line 89
    .line 90
    iput v3, p0, Ll/yn0;->m:I

    .line 91
    .line 92
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 93
    .line 94
    iput v0, p0, Ll/yn0;->n:I

    .line 95
    .line 96
    iput v3, p0, Ll/yn0;->k:I

    .line 97
    .line 98
    iput v0, p0, Ll/yn0;->l:I

    .line 99
    .line 100
    new-instance v0, Ljava/lang/StringBuilder;

    .line 101
    .line 102
    const-string v3, "setPreviewSize(): mPreviewWidth:"

    .line 103
    .line 104
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    iget v3, p0, Ll/yn0;->m:I

    .line 108
    .line 109
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string v3, " mPreviewHeight:"

    .line 113
    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    iget v3, p0, Ll/yn0;->n:I

    .line 118
    .line 119
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-static {v2, v0}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 130
    .line 131
    iget v3, p0, Ll/yn0;->m:I

    .line 132
    .line 133
    iget v4, p0, Ll/yn0;->n:I

    .line 134
    .line 135
    invoke-virtual {v0, v3, v4}, Landroid/hardware/Camera$Parameters;->setPreviewSize(II)V

    .line 136
    .line 137
    .line 138
    iget-boolean v0, p0, Ll/yn0;->r:Z

    .line 139
    .line 140
    if-nez v0, :cond_4

    .line 141
    .line 142
    invoke-static {}, Ll/un0;->c()Ll/un0;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    iget-object v3, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 147
    .line 148
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 149
    .line 150
    .line 151
    move-result-object v3

    .line 152
    iget-object v4, p0, Ll/yn0;->a:Landroid/content/Context;

    .line 153
    .line 154
    iget-boolean v5, p0, Ll/yn0;->h:Z

    .line 155
    .line 156
    invoke-static {v4, v5}, Ll/x5e;->c(Landroid/content/Context;Z)F

    .line 157
    .line 158
    .line 159
    move-result v4

    .line 160
    sget v5, Ll/n94;->d:I

    .line 161
    .line 162
    invoke-virtual {v0, v3, v4, v5}, Ll/un0;->d(Ljava/util/List;FI)Landroid/hardware/Camera$Size;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    if-eqz v0, :cond_4

    .line 167
    .line 168
    iget-object v3, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 169
    .line 170
    invoke-virtual {v3}, Landroid/hardware/Camera$Parameters;->getSupportedPictureSizes()Ljava/util/List;

    .line 171
    .line 172
    .line 173
    move-result-object v3

    .line 174
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 175
    .line 176
    .line 177
    move-result-object v3

    .line 178
    :cond_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    if-eqz v4, :cond_3

    .line 183
    .line 184
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    check-cast v4, Landroid/hardware/Camera$Size;

    .line 189
    .line 190
    iget v5, v4, Landroid/hardware/Camera$Size;->width:I

    .line 191
    .line 192
    iget v6, p0, Ll/yn0;->m:I

    .line 193
    .line 194
    if-ne v5, v6, :cond_2

    .line 195
    .line 196
    iget v5, v4, Landroid/hardware/Camera$Size;->height:I

    .line 197
    .line 198
    iget v6, p0, Ll/yn0;->n:I

    .line 199
    .line 200
    if-ne v5, v6, :cond_2

    .line 201
    .line 202
    new-instance v0, Ljava/lang/StringBuilder;

    .line 203
    .line 204
    const-string v3, "setPictureSize: size.width:"

    .line 205
    .line 206
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    iget v3, v4, Landroid/hardware/Camera$Size;->width:I

    .line 210
    .line 211
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    const-string v3, " size.height:"

    .line 215
    .line 216
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 217
    .line 218
    .line 219
    iget v3, v4, Landroid/hardware/Camera$Size;->height:I

    .line 220
    .line 221
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 222
    .line 223
    .line 224
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v0

    .line 228
    invoke-static {v2, v0}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 232
    .line 233
    iget v3, p0, Ll/yn0;->m:I

    .line 234
    .line 235
    iget v4, p0, Ll/yn0;->n:I

    .line 236
    .line 237
    invoke-virtual {v0, v3, v4}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 238
    .line 239
    .line 240
    goto :goto_1

    .line 241
    :cond_3
    iget-object v3, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 242
    .line 243
    iget v4, v0, Landroid/hardware/Camera$Size;->width:I

    .line 244
    .line 245
    iget v0, v0, Landroid/hardware/Camera$Size;->height:I

    .line 246
    .line 247
    invoke-virtual {v3, v4, v0}, Landroid/hardware/Camera$Parameters;->setPictureSize(II)V

    .line 248
    .line 249
    .line 250
    :cond_4
    :goto_1
    iget-object v0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 251
    .line 252
    if-eqz v0, :cond_5

    .line 253
    .line 254
    invoke-direct {p0, v0}, Ll/yn0;->F(Lcom/idv/identity/platform/config/DeviceSetting;)I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    iput v0, p0, Ll/yn0;->f:I

    .line 259
    .line 260
    new-instance v0, Ljava/lang/StringBuilder;

    .line 261
    .line 262
    const-string v3, " setting mCameraViewRotationAngle:"

    .line 263
    .line 264
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    iget v3, p0, Ll/yn0;->f:I

    .line 268
    .line 269
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 273
    .line 274
    .line 275
    move-result-object v0

    .line 276
    const-string v3, "TAG"

    .line 277
    .line 278
    invoke-static {v3, v0}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 282
    .line 283
    iget v3, p0, Ll/yn0;->f:I

    .line 284
    .line 285
    invoke-virtual {v0, v3}, Landroid/hardware/Camera;->setDisplayOrientation(I)V

    .line 286
    .line 287
    .line 288
    :cond_5
    iget-object v0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 289
    .line 290
    if-eqz v0, :cond_6

    .line 291
    .line 292
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 293
    .line 294
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->isZoomSupported()Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-eqz v0, :cond_6

    .line 299
    .line 300
    iget-object v0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 301
    .line 302
    invoke-virtual {v0}, Lcom/idv/identity/platform/config/DeviceSetting;->getZoom()I

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    iget-object v1, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 311
    .line 312
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getMaxZoom()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    iget-object v1, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 321
    .line 322
    invoke-virtual {v1}, Landroid/hardware/Camera$Parameters;->getZoom()I

    .line 323
    .line 324
    .line 325
    move-result v1

    .line 326
    if-eq v0, v1, :cond_6

    .line 327
    .line 328
    iget-object v1, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 329
    .line 330
    invoke-virtual {v1, v0}, Landroid/hardware/Camera$Parameters;->setZoom(I)V

    .line 331
    .line 332
    .line 333
    :cond_6
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 334
    .line 335
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 340
    .line 341
    .line 342
    move-result-object v1

    .line 343
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 344
    .line 345
    .line 346
    move-result v3

    .line 347
    if-eqz v3, :cond_7

    .line 348
    .line 349
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    check-cast v3, Ljava/lang/String;

    .line 354
    .line 355
    new-instance v4, Ljava/lang/StringBuilder;

    .line 356
    .line 357
    const-string v5, "focusMode:"

    .line 358
    .line 359
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v3

    .line 369
    invoke-static {v2, v3}, Ll/o6r0;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 370
    .line 371
    .line 372
    goto :goto_2

    .line 373
    :cond_7
    iget-boolean v1, p0, Ll/yn0;->r:Z

    .line 374
    .line 375
    const-string v2, "auto"

    .line 376
    .line 377
    if-nez v1, :cond_9

    .line 378
    .line 379
    const-string v1, "continuous-picture"

    .line 380
    .line 381
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 382
    .line 383
    .line 384
    move-result v3

    .line 385
    if-eqz v3, :cond_8

    .line 386
    .line 387
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 388
    .line 389
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 390
    .line 391
    .line 392
    goto :goto_3

    .line 393
    :cond_8
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    if-eqz v0, :cond_b

    .line 398
    .line 399
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 400
    .line 401
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 402
    .line 403
    .line 404
    goto :goto_3

    .line 405
    :cond_9
    const-string v1, "continuous-video"

    .line 406
    .line 407
    invoke-interface {v0, v1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v3

    .line 411
    if-eqz v3, :cond_a

    .line 412
    .line 413
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 414
    .line 415
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 416
    .line 417
    .line 418
    goto :goto_3

    .line 419
    :cond_a
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 420
    .line 421
    .line 422
    move-result v0

    .line 423
    if-eqz v0, :cond_b

    .line 424
    .line 425
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 426
    .line 427
    invoke-virtual {v0, v2}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 428
    .line 429
    .line 430
    :cond_b
    :goto_3
    iget-object v0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 431
    .line 432
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedPreviewFormats()Ljava/util/List;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    if-eqz v0, :cond_c

    .line 437
    .line 438
    const/16 v1, 0x11

    .line 439
    .line 440
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 441
    .line 442
    .line 443
    move-result-object v2

    .line 444
    invoke-interface {v0, v2}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 445
    .line 446
    .line 447
    move-result v0

    .line 448
    if-eqz v0, :cond_c

    .line 449
    .line 450
    iget-object p0, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 451
    .line 452
    invoke-virtual {p0, v1}, Landroid/hardware/Camera$Parameters;->setPreviewFormat(I)V

    .line 453
    .line 454
    .line 455
    :cond_c
    return-void
.end method

.method private E(I)I
    .locals 3

    .line 1
    new-instance v0, Landroid/hardware/Camera$CameraInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/hardware/Camera$CameraInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Landroid/hardware/Camera;->getCameraInfo(ILandroid/hardware/Camera$CameraInfo;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/yn0;->a:Landroid/content/Context;

    .line 10
    .line 11
    const-string p1, "window"

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    check-cast p0, Landroid/view/WindowManager;

    .line 18
    .line 19
    invoke-interface {p0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-virtual {p0}, Landroid/view/Display;->getRotation()I

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    const/4 p1, 0x1

    .line 28
    const/4 v1, 0x0

    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    if-eq p0, p1, :cond_2

    .line 32
    .line 33
    const/4 v2, 0x2

    .line 34
    if-eq p0, v2, :cond_1

    .line 35
    .line 36
    const/4 v2, 0x3

    .line 37
    if-eq p0, v2, :cond_0

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_0
    const/16 v1, 0x10e

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_1
    const/16 v1, 0xb4

    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_2
    const/16 v1, 0x5a

    .line 47
    .line 48
    :cond_3
    :goto_0
    iget p0, v0, Landroid/hardware/Camera$CameraInfo;->facing:I

    .line 49
    .line 50
    iget v0, v0, Landroid/hardware/Camera$CameraInfo;->orientation:I

    .line 51
    .line 52
    if-ne p0, p1, :cond_4

    .line 53
    .line 54
    add-int/2addr v0, v1

    .line 55
    rem-int/lit16 v0, v0, 0x168

    .line 56
    .line 57
    rsub-int p0, v0, 0x168

    .line 58
    .line 59
    rem-int/lit16 p0, p0, 0x168

    .line 60
    .line 61
    return p0

    .line 62
    :cond_4
    sub-int/2addr v0, v1

    .line 63
    add-int/lit16 v0, v0, 0x168

    .line 64
    .line 65
    rem-int/lit16 v0, v0, 0x168

    .line 66
    .line 67
    return v0
.end method

.method private F(Lcom/idv/identity/platform/config/DeviceSetting;)I
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_5

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/idv/identity/platform/config/DeviceSetting;->isDisplayAuto()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    iget p1, p0, Ll/yn0;->g:I

    .line 11
    .line 12
    invoke-direct {p0, p1}, Ll/yn0;->E(I)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-virtual {p1}, Lcom/idv/identity/platform/config/DeviceSetting;->getDisplayAngle()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    :goto_0
    iget-object p0, p0, Ll/yn0;->b:Landroid/app/Activity;

    .line 22
    .line 23
    if-eqz p0, :cond_4

    .line 24
    .line 25
    invoke-static {}, Ll/x5e;->d()Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_4

    .line 30
    .line 31
    invoke-static {p0}, Ll/x5e;->a(Landroid/app/Activity;)I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/4 v1, 0x1

    .line 36
    if-eq p0, v1, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x2

    .line 39
    if-eq p0, v1, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x3

    .line 42
    if-eq p0, v0, :cond_1

    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    const/16 p0, 0xb4

    .line 46
    .line 47
    return p0

    .line 48
    :cond_2
    return v0

    .line 49
    :cond_3
    const/16 p0, 0x5a

    .line 50
    .line 51
    return p0

    .line 52
    :cond_4
    :goto_1
    return p1

    .line 53
    :cond_5
    const-string p0, "deviceSetting can\'t be null"

    .line 54
    .line 55
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    return v0
.end method

.method public static declared-synchronized G()Ll/yn0;
    .locals 2

    .line 1
    const-class v0, Ll/yn0;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/yn0;->s:Ll/yn0;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ll/yn0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/yn0;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/yn0;->s:Ll/yn0;

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v1

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    sget-object v1, Ll/yn0;->s:Ll/yn0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit v0

    .line 21
    return-object v1

    .line 22
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 23
    throw v1
.end method

.method private H(Landroid/content/Context;)V
    .locals 1

    .line 1
    instance-of v0, p1, Landroid/app/Activity;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    move-object v0, p1

    .line 6
    check-cast v0, Landroid/app/Activity;

    .line 7
    .line 8
    iput-object v0, p0, Ll/yn0;->b:Landroid/app/Activity;

    .line 9
    .line 10
    :cond_0
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/yn0;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-void
.end method

.method private I(I)Z
    .locals 4

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v2, "cameraId"

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    filled-new-array {v2, v3}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string v3, "realStartCamera"

    .line 18
    .line 19
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    const/16 v1, 0x65

    .line 24
    .line 25
    :try_start_0
    invoke-static {p1}, Landroid/hardware/Camera;->open(I)Landroid/hardware/Camera;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    iput-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 30
    .line 31
    if-nez v2, :cond_1

    .line 32
    .line 33
    iget-object p1, p0, Ll/yn0;->e:Ll/zpl;

    .line 34
    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    new-instance v2, Ljava/lang/Throwable;

    .line 38
    .line 39
    const-string v3, "mCamera == null"

    .line 40
    .line 41
    invoke-direct {v2, v3}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {p1, v1, v2}, Ll/zpl;->T(ILjava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :catch_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_0
    :goto_0
    return v0

    .line 51
    :cond_1
    iput p1, p0, Ll/yn0;->g:I

    .line 52
    .line 53
    invoke-virtual {v2}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 58
    .line 59
    invoke-direct {p0}, Ll/yn0;->D()V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Ll/yn0;->d:Landroid/hardware/Camera$Parameters;

    .line 63
    .line 64
    if-eqz p1, :cond_2

    .line 65
    .line 66
    iget-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 67
    .line 68
    invoke-virtual {v2, p1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    :cond_2
    const/4 p0, 0x1

    .line 72
    return p0

    .line 73
    :goto_1
    iget-object p0, p0, Ll/yn0;->e:Ll/zpl;

    .line 74
    .line 75
    if-eqz p0, :cond_3

    .line 76
    .line 77
    invoke-interface {p0, v1, p1}, Ll/zpl;->T(ILjava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    :cond_3
    return v0
.end method

.method public static synthetic t(Ll/yn0;)Ll/zpl;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn0;->e:Ll/zpl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Ll/yn0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic v(Ll/yn0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic w(Ll/yn0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic x(Ll/yn0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic y(Ll/yn0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic z(Ll/yn0;)Lcom/idv/identity/platform/config/DeviceSetting;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/yn0;->q:Z

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_3

    .line 12
    :cond_0
    iget-object v1, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 13
    .line 14
    if-eqz v1, :cond_1

    .line 15
    .line 16
    iget-object v1, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 17
    .line 18
    monitor-enter v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    :try_start_1
    iget-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 20
    .line 21
    const/4 v3, 0x0

    .line 22
    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->setOneShotPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 26
    .line 27
    invoke-virtual {v2, v3}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 28
    .line 29
    .line 30
    iget-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/hardware/Camera;->stopPreview()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 33
    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_1
    move-exception p0

    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move-exception v2

    .line 39
    :try_start_2
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordException(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 47
    const/4 v1, 0x0

    .line 48
    :try_start_3
    iput-boolean v1, p0, Ll/yn0;->q:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    .line 50
    goto :goto_2

    .line 51
    :goto_1
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 52
    :try_start_5
    throw p0

    .line 53
    :cond_1
    :goto_2
    monitor-exit v0

    .line 54
    return-void

    .line 55
    :goto_3
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 56
    throw p0
.end method

.method public b()Landroid/hardware/Camera;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ll/iql;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    invoke-interface {p1, p0, v1}, Ll/iql;->a(Landroid/graphics/Bitmap;Z)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void

    .line 13
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x1

    .line 18
    new-array v2, v2, [Z

    .line 19
    .line 20
    aput-boolean v1, v2, v1

    .line 21
    .line 22
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getFocusMode()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    new-instance v1, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    const-string v3, "takePhoto focusMode: "

    .line 29
    .line 30
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    const-string v1, "AndroidImpl"

    .line 41
    .line 42
    invoke-static {v1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 46
    .line 47
    new-instance v1, Ll/yn0$b;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/yn0$b;-><init>(Ll/yn0;)V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->setAutoFocusMoveCallback(Landroid/hardware/Camera$AutoFocusMoveCallback;)V

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 56
    .line 57
    new-instance v1, Ll/yn0$c;

    .line 58
    .line 59
    invoke-direct {v1, p0, v2}, Ll/yn0$c;-><init>(Ll/yn0;[Z)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, v1}, Landroid/hardware/Camera;->autoFocus(Landroid/hardware/Camera$AutoFocusCallback;)V

    .line 63
    .line 64
    .line 65
    new-instance v0, Landroid/os/Handler;

    .line 66
    .line 67
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 72
    .line 73
    .line 74
    new-instance v1, Ll/yn0$d;

    .line 75
    .line 76
    invoke-direct {v1, p0, p1}, Ll/yn0$d;-><init>(Ll/yn0;Ll/iql;)V

    .line 77
    .line 78
    .line 79
    const-wide/16 p0, 0xc8

    .line 80
    .line 81
    invoke-virtual {v0, v1, p0, p1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public d(Landroid/view/SurfaceHolder;FII)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p2

    .line 4
    :try_start_0
    iget-boolean p3, p0, Ll/yn0;->q:Z

    .line 5
    .line 6
    if-eqz p3, :cond_0

    .line 7
    .line 8
    monitor-exit p2

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_3

    .line 12
    :cond_0
    iget-object p3, p0, Ll/yn0;->c:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    if-eqz p3, :cond_3

    .line 15
    .line 16
    :try_start_1
    invoke-virtual {p3}, Landroid/hardware/Camera;->cancelAutoFocus()V

    .line 17
    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p3, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 22
    .line 23
    invoke-virtual {p3, p1}, Landroid/hardware/Camera;->setPreviewDisplay(Landroid/view/SurfaceHolder;)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catch_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :goto_0
    iget-object p1, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 30
    .line 31
    new-instance p3, Ll/yn0$a;

    .line 32
    .line 33
    invoke-direct {p3, p0}, Ll/yn0$a;-><init>(Ll/yn0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p3}, Landroid/hardware/Camera;->setPreviewCallback(Landroid/hardware/Camera$PreviewCallback;)V

    .line 37
    .line 38
    .line 39
    iget-object p1, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/hardware/Camera;->startPreview()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    .line 43
    .line 44
    const/4 p1, 0x1

    .line 45
    :try_start_2
    iput-boolean p1, p0, Ll/yn0;->q:Z

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :goto_1
    iget-object p0, p0, Ll/yn0;->e:Ll/zpl;

    .line 49
    .line 50
    if-eqz p0, :cond_2

    .line 51
    .line 52
    const/16 p3, 0x65

    .line 53
    .line 54
    invoke-interface {p0, p3, p1}, Ll/zpl;->T(ILjava/lang/Throwable;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    monitor-exit p2

    .line 58
    return-void

    .line 59
    :cond_3
    :goto_2
    monitor-exit p2

    .line 60
    return-void

    .line 61
    :goto_3
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 62
    throw p0
.end method

.method public e(Ll/zpl;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/yn0;->e:Ll/zpl;

    .line 2
    .line 3
    return-void
.end method

.method public f()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ll/yn0;->o:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x0

    .line 7
    iput-boolean v0, p0, Ll/yn0;->o:Z

    .line 8
    .line 9
    return-void
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    const-string v1, "off"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public h()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->k:I

    .line 2
    .line 3
    return p0
.end method

.method public i()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public j()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public k(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    invoke-virtual {v0}, Landroid/hardware/Camera$Parameters;->getSupportedFocusModes()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    if-eqz v1, :cond_2

    .line 18
    .line 19
    invoke-interface {v1, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0, p1}, Landroid/hardware/Camera$Parameters;->setFocusMode(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 29
    .line 30
    invoke-virtual {p1, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/hardware/Camera;->startPreview()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public l()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/yn0;->c:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    :try_start_1
    invoke-virtual {v1}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x1

    .line 13
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setAutoExposureLock(Z)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v1, v2}, Landroid/hardware/Camera$Parameters;->setAutoWhiteBalanceLock(Z)V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 20
    .line 21
    invoke-virtual {p0, v1}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    .line 23
    .line 24
    :catchall_0
    :cond_0
    :try_start_2
    monitor-exit v0

    .line 25
    return-void

    .line 26
    :catchall_1
    move-exception p0

    .line 27
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 28
    throw p0
.end method

.method public m()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->m:I

    .line 2
    .line 3
    return p0
.end method

.method public n()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Ll/yn0;->p:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/un0;->a()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-boolean v2, p0, Ll/yn0;->h:Z

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-static {}, Ll/un0;->b()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    :cond_1
    invoke-direct {p0, v1}, Ll/yn0;->I(I)Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x1

    .line 31
    iput-boolean v1, p0, Ll/yn0;->p:Z

    .line 32
    .line 33
    :cond_2
    monitor-exit v0

    .line 34
    return-void

    .line 35
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    throw p0
.end method

.method public o()I
    .locals 0

    .line 1
    iget p0, p0, Ll/yn0;->f:I

    .line 2
    .line 3
    return p0
.end method

.method public p(Landroid/content/Context;ZZLcom/idv/identity/platform/config/DeviceSetting;)V
    .locals 0

    .line 1
    iput-boolean p2, p0, Ll/yn0;->h:Z

    .line 2
    .line 3
    iput-boolean p3, p0, Ll/yn0;->r:Z

    .line 4
    .line 5
    if-eqz p4, :cond_0

    .line 6
    .line 7
    iput-object p4, p0, Ll/yn0;->i:Lcom/idv/identity/platform/config/DeviceSetting;

    .line 8
    .line 9
    :cond_0
    if-nez p2, :cond_1

    .line 10
    .line 11
    const/16 p2, 0x10e

    .line 12
    .line 13
    iput p2, p0, Ll/yn0;->f:I

    .line 14
    .line 15
    :cond_1
    invoke-direct {p0, p1}, Ll/yn0;->H(Landroid/content/Context;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    invoke-virtual {v0}, Landroid/hardware/Camera;->getParameters()Landroid/hardware/Camera$Parameters;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    if-nez v0, :cond_1

    .line 11
    .line 12
    :goto_0
    return-void

    .line 13
    :cond_1
    const-string v1, "torch"

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Landroid/hardware/Camera$Parameters;->setFlashMode(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Landroid/hardware/Camera;->setParameters(Landroid/hardware/Camera$Parameters;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public r()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/yn0;->b:Landroid/app/Activity;

    .line 3
    .line 4
    return-void
.end method

.method public s()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/yn0;->a()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yn0;->j:Ljava/lang/Object;

    .line 5
    .line 6
    monitor-enter v0

    .line 7
    :try_start_0
    iget-boolean v1, p0, Ll/yn0;->p:Z

    .line 8
    .line 9
    if-nez v1, :cond_0

    .line 10
    .line 11
    monitor-exit v0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p0

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Ll/yn0;->e:Ll/zpl;

    .line 17
    .line 18
    iget-object v2, p0, Ll/yn0;->c:Landroid/hardware/Camera;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    if-eqz v2, :cond_1

    .line 21
    .line 22
    :try_start_1
    invoke-virtual {v2}, Landroid/hardware/Camera;->release()V

    .line 23
    .line 24
    .line 25
    iput-object v1, p0, Ll/yn0;->c:Landroid/hardware/Camera;

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    iput-boolean v1, p0, Ll/yn0;->p:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catch_0
    move-exception p0

    .line 32
    :try_start_2
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 33
    .line 34
    .line 35
    :cond_1
    :goto_0
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    throw p0
.end method
