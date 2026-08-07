.class Ll/xmp0$e$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/xmp0$e;->onFirstRemoteVideoFrameDecoded(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:J

.field final synthetic b:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Ll/xmp0$e;


# direct methods
.method public constructor <init>(Ll/xmp0$e;JLcom/ss/bytertc/engine/data/RemoteStreamKey;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 2
    .line 3
    iput-wide p2, p0, Ll/xmp0$e$a;->a:J

    .line 4
    .line 5
    iput-object p4, p0, Ll/xmp0$e$a;->b:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 6
    .line 7
    iput p5, p0, Ll/xmp0$e$a;->c:I

    .line 8
    .line 9
    iput p6, p0, Ll/xmp0$e$a;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 9
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 2
    .line 3
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/xmp0;->P3(Ll/xmp0;)Ll/evx;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    new-instance v1, Ljava/lang/StringBuilder;

    .line 10
    .line 11
    const-string v2, "mIsAttachedMode:"

    .line 12
    .line 13
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object v2, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 17
    .line 18
    iget-object v2, v2, Ll/xmp0$e;->a:Ll/xmp0;

    .line 19
    .line 20
    invoke-static {v2}, Ll/xmp0;->o3(Ll/xmp0;)Z

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v2, ",mVideoTextureListener is"

    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 33
    .line 34
    iget-object v2, v2, Ll/xmp0$e;->a:Ll/xmp0;

    .line 35
    .line 36
    invoke-static {v2}, Ll/xmp0;->z3(Ll/xmp0;)Ll/gkl0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string v2, ",isUseTextureView"

    .line 44
    .line 45
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    iget-object v2, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 49
    .line 50
    iget-object v2, v2, Ll/xmp0$e;->a:Ll/xmp0;

    .line 51
    .line 52
    invoke-static {v2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget-boolean v2, v2, Ll/uow;->Z0:Z

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    const-string v2, "onFirstRemoteVideoFrameDecoded"

    .line 66
    .line 67
    filled-new-array {v2, v1}, [Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 75
    .line 76
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 77
    .line 78
    invoke-static {v0}, Ll/xmp0;->o3(Ll/xmp0;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    const/4 v1, 0x1

    .line 83
    if-nez v0, :cond_0

    .line 84
    .line 85
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 86
    .line 87
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 88
    .line 89
    invoke-static {v0}, Ll/xmp0;->z3(Ll/xmp0;)Ll/gkl0;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    if-nez v0, :cond_0

    .line 94
    .line 95
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 96
    .line 97
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 98
    .line 99
    invoke-static {v0}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 100
    .line 101
    .line 102
    move-result-object v0

    .line 103
    iget-boolean v0, v0, Ll/uow;->Z0:Z

    .line 104
    .line 105
    if-nez v0, :cond_0

    .line 106
    .line 107
    new-instance v6, Landroid/view/SurfaceView;

    .line 108
    .line 109
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 110
    .line 111
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-direct {v6, v0}, Landroid/view/SurfaceView;-><init>(Landroid/content/Context;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v6}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    new-instance v3, Ll/xmp0$e$a$a;

    .line 125
    .line 126
    invoke-direct {v3, p0}, Ll/xmp0$e$a$a;-><init>(Ll/xmp0$e$a;)V

    .line 127
    .line 128
    .line 129
    invoke-interface {v0, v3}, Landroid/view/SurfaceHolder;->addCallback(Landroid/view/SurfaceHolder$Callback;)V

    .line 130
    .line 131
    .line 132
    new-instance v0, Lcom/ss/bytertc/engine/VideoCanvas;

    .line 133
    .line 134
    invoke-direct {v0}, Lcom/ss/bytertc/engine/VideoCanvas;-><init>()V

    .line 135
    .line 136
    .line 137
    iget-object v3, p0, Ll/xmp0$e$a;->b:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 138
    .line 139
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    iput-object v6, v0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 144
    .line 145
    iput v1, v0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 146
    .line 147
    iget-object v1, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 148
    .line 149
    iget-object v1, v1, Ll/xmp0$e;->a:Ll/xmp0;

    .line 150
    .line 151
    invoke-static {v1}, Ll/xmp0;->U3(Ll/xmp0;)Ll/evx;

    .line 152
    .line 153
    .line 154
    move-result-object v1

    .line 155
    new-instance v4, Ljava/lang/StringBuilder;

    .line 156
    .line 157
    const-string v5, "roomid:"

    .line 158
    .line 159
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 160
    .line 161
    .line 162
    iget-object v5, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 163
    .line 164
    iget-object v5, v5, Ll/xmp0$e;->a:Ll/xmp0;

    .line 165
    .line 166
    invoke-static {v5}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    iget-object v5, v5, Ll/ror;->g1:Ljava/lang/String;

    .line 171
    .line 172
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 173
    .line 174
    .line 175
    const-string v5, ",rtcEngine is"

    .line 176
    .line 177
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 178
    .line 179
    .line 180
    iget-object v5, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 181
    .line 182
    iget-object v5, v5, Ll/xmp0$e;->a:Ll/xmp0;

    .line 183
    .line 184
    iget-object v5, v5, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 185
    .line 186
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 187
    .line 188
    .line 189
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v4

    .line 193
    filled-new-array {v2, v4}, [Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    invoke-virtual {v1, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    new-instance v1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 201
    .line 202
    iget-object v2, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 203
    .line 204
    iget-object v2, v2, Ll/xmp0$e;->a:Ll/xmp0;

    .line 205
    .line 206
    invoke-static {v2}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 207
    .line 208
    .line 209
    move-result-object v2

    .line 210
    iget-object v2, v2, Ll/ror;->g1:Ljava/lang/String;

    .line 211
    .line 212
    sget-object v4, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 213
    .line 214
    invoke-direct {v1, v2, v3, v4}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 215
    .line 216
    .line 217
    iget-object v2, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 218
    .line 219
    iget-object v2, v2, Ll/xmp0$e;->a:Ll/xmp0;

    .line 220
    .line 221
    iget-object v2, v2, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 222
    .line 223
    if-eqz v2, :cond_1

    .line 224
    .line 225
    invoke-virtual {v2, v1, v0}, Lcom/ss/bytertc/engine/RTCEngine;->setRemoteVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/VideoCanvas;)I

    .line 226
    .line 227
    .line 228
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 229
    .line 230
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 231
    .line 232
    invoke-static {v0}, Ll/xmp0;->V3(Ll/xmp0;)Ljava/util/ArrayList;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 240
    .line 241
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 242
    .line 243
    invoke-static {v0}, Ll/xmp0;->W3(Ll/xmp0;)Ll/ebl0;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    if-eqz v0, :cond_1

    .line 248
    .line 249
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 250
    .line 251
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 252
    .line 253
    invoke-static {v0}, Ll/xmp0;->W3(Ll/xmp0;)Ll/ebl0;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 262
    .line 263
    .line 264
    move-result v1

    .line 265
    int-to-long v4, v1

    .line 266
    iget v7, p0, Ll/xmp0$e$a;->c:I

    .line 267
    .line 268
    iget v8, p0, Ll/xmp0$e$a;->d:I

    .line 269
    .line 270
    move-object v3, v0

    .line 271
    invoke-interface/range {v3 .. v8}, Ll/ebl0;->a(JLandroid/view/SurfaceView;II)V

    .line 272
    .line 273
    .line 274
    return-void

    .line 275
    :cond_0
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 276
    .line 277
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 278
    .line 279
    invoke-static {v0}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    iget-boolean v0, v0, Ll/uow;->Z0:Z

    .line 284
    .line 285
    if-eqz v0, :cond_1

    .line 286
    .line 287
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 288
    .line 289
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 290
    .line 291
    invoke-static {v0}, Ll/xmp0;->Z3(Ll/xmp0;)Ll/evx;

    .line 292
    .line 293
    .line 294
    move-result-object v0

    .line 295
    new-instance v2, Ljava/lang/StringBuilder;

    .line 296
    .line 297
    const-string v3, "width:"

    .line 298
    .line 299
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 300
    .line 301
    .line 302
    iget-object v3, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 303
    .line 304
    iget-object v3, v3, Ll/xmp0$e;->a:Ll/xmp0;

    .line 305
    .line 306
    invoke-static {v3}, Ll/xmp0;->X3(Ll/xmp0;)I

    .line 307
    .line 308
    .line 309
    move-result v3

    .line 310
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 311
    .line 312
    .line 313
    const-string v3, ",height:"

    .line 314
    .line 315
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 316
    .line 317
    .line 318
    iget-object v3, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 319
    .line 320
    iget-object v3, v3, Ll/xmp0$e;->a:Ll/xmp0;

    .line 321
    .line 322
    invoke-static {v3}, Ll/xmp0;->Y3(Ll/xmp0;)I

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v2

    .line 333
    const-string v3, "useTextureView"

    .line 334
    .line 335
    filled-new-array {v3, v2}, [Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    invoke-virtual {v0, v2}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 340
    .line 341
    .line 342
    new-instance v6, Landroid/view/TextureView;

    .line 343
    .line 344
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 345
    .line 346
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 347
    .line 348
    invoke-virtual {v0}, Lcom/momo/pipline/codec/MediaBaseCodecFilter;->W1()Landroid/content/Context;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    invoke-direct {v6, v0}, Landroid/view/TextureView;-><init>(Landroid/content/Context;)V

    .line 353
    .line 354
    .line 355
    new-instance v0, Lcom/ss/bytertc/engine/VideoCanvas;

    .line 356
    .line 357
    invoke-direct {v0}, Lcom/ss/bytertc/engine/VideoCanvas;-><init>()V

    .line 358
    .line 359
    .line 360
    iget-object v2, p0, Ll/xmp0$e$a;->b:Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 361
    .line 362
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getUserId()Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    iput-object v6, v0, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 367
    .line 368
    iput v1, v0, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 369
    .line 370
    new-instance v1, Lcom/ss/bytertc/engine/data/RemoteStreamKey;

    .line 371
    .line 372
    iget-object v3, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 373
    .line 374
    iget-object v3, v3, Ll/xmp0$e;->a:Ll/xmp0;

    .line 375
    .line 376
    invoke-static {v3}, Ll/xmp0;->K3(Ll/xmp0;)Ll/ror;

    .line 377
    .line 378
    .line 379
    move-result-object v3

    .line 380
    iget-object v3, v3, Ll/ror;->g1:Ljava/lang/String;

    .line 381
    .line 382
    sget-object v4, Lcom/ss/bytertc/engine/data/StreamIndex;->STREAM_INDEX_MAIN:Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 383
    .line 384
    invoke-direct {v1, v3, v2, v4}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;-><init>(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;)V

    .line 385
    .line 386
    .line 387
    iget-object v3, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 388
    .line 389
    iget-object v3, v3, Ll/xmp0$e;->a:Ll/xmp0;

    .line 390
    .line 391
    invoke-static {v3}, Ll/xmp0;->a4(Ll/xmp0;)Ll/gbl0;

    .line 392
    .line 393
    .line 394
    move-result-object v3

    .line 395
    if-eqz v3, :cond_1

    .line 396
    .line 397
    iget-object v3, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 398
    .line 399
    iget-object v3, v3, Ll/xmp0$e;->a:Ll/xmp0;

    .line 400
    .line 401
    iget-object v3, v3, Ll/xmp0;->U1:Lcom/ss/bytertc/engine/RTCEngineEx;

    .line 402
    .line 403
    if-eqz v3, :cond_1

    .line 404
    .line 405
    invoke-virtual {v3, v1, v0}, Lcom/ss/bytertc/engine/RTCEngine;->setRemoteVideoCanvas(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/VideoCanvas;)I

    .line 406
    .line 407
    .line 408
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 409
    .line 410
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 411
    .line 412
    invoke-static {v0}, Ll/xmp0;->b4(Ll/xmp0;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 413
    .line 414
    .line 415
    move-result-object v0

    .line 416
    invoke-virtual {v0, v2, v6}, Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 417
    .line 418
    .line 419
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 420
    .line 421
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 422
    .line 423
    invoke-static {v0}, Ll/xmp0;->c4(Ll/xmp0;)Ll/evx;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    const-string v1, "onVideoChannelAdded use textureView"

    .line 428
    .line 429
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    invoke-virtual {v0, v1}, Ll/evx;->l([Ljava/lang/Object;)V

    .line 434
    .line 435
    .line 436
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 437
    .line 438
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 439
    .line 440
    invoke-static {v0}, Ll/xmp0;->a4(Ll/xmp0;)Ll/gbl0;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 445
    .line 446
    .line 447
    move-result-object v0

    .line 448
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    int-to-long v4, v0

    .line 453
    iget-object v0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 454
    .line 455
    iget-object v0, v0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 456
    .line 457
    invoke-static {v0}, Ll/xmp0;->e4(Ll/xmp0;)I

    .line 458
    .line 459
    .line 460
    move-result v7

    .line 461
    iget-object p0, p0, Ll/xmp0$e$a;->e:Ll/xmp0$e;

    .line 462
    .line 463
    iget-object p0, p0, Ll/xmp0$e;->a:Ll/xmp0;

    .line 464
    .line 465
    invoke-static {p0}, Ll/xmp0;->f4(Ll/xmp0;)I

    .line 466
    .line 467
    .line 468
    move-result v8

    .line 469
    invoke-interface/range {v3 .. v8}, Ll/gbl0;->a(JLandroid/view/TextureView;II)V

    .line 470
    .line 471
    .line 472
    :cond_1
    return-void
.end method
