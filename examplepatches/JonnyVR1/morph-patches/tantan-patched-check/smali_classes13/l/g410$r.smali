.class Ll/g410$r;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/g410;->q0(Ll/z5m;Ljava/lang/Object;Z)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Ll/bfj;

.field final synthetic b:Ll/z5m;

.field final synthetic c:Ll/bfj;

.field final synthetic d:Ll/g410;


# direct methods
.method public constructor <init>(Ll/g410;Ll/bfj;Ll/z5m;Ll/bfj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/g410$r;->d:Ll/g410;

    .line 2
    .line 3
    iput-object p2, p0, Ll/g410$r;->a:Ll/bfj;

    .line 4
    .line 5
    iput-object p3, p0, Ll/g410$r;->b:Ll/z5m;

    .line 6
    .line 7
    iput-object p4, p0, Ll/g410$r;->c:Ll/bfj;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public run()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/g410$r;->d:Ll/g410;

    .line 2
    .line 3
    iget-object v0, v0, Ll/g410;->c:Ljava/lang/Object;

    .line 4
    .line 5
    monitor-enter v0

    .line 6
    :try_start_0
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 7
    .line 8
    iget-object v1, v1, Ll/g410;->i:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 15
    .line 16
    .line 17
    move-result v2

    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    check-cast v2, Lcom/momo/pipline/MomoInterface/MomoCodec;

    .line 25
    .line 26
    iget-object v3, p0, Ll/g410$r;->d:Ll/g410;

    .line 27
    .line 28
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 29
    .line 30
    if-nez v3, :cond_0

    .line 31
    .line 32
    iget-object v3, p0, Ll/g410$r;->a:Ll/bfj;

    .line 33
    .line 34
    invoke-virtual {v3}, Ll/bfj;->a()Ll/gfj;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    invoke-virtual {v3, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :catchall_0
    move-exception p0

    .line 47
    goto/16 :goto_4

    .line 48
    .line 49
    :cond_0
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    invoke-virtual {v3, v4}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 54
    .line 55
    .line 56
    iget-object v3, p0, Ll/g410$r;->d:Ll/g410;

    .line 57
    .line 58
    iget-object v3, v3, Ll/g410;->g:Ll/rsy;

    .line 59
    .line 60
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    invoke-virtual {v3, v4}, Ll/rsy;->Q1(Ll/dfj;)V

    .line 65
    .line 66
    .line 67
    iget-object v3, p0, Ll/g410$r;->a:Ll/bfj;

    .line 68
    .line 69
    invoke-virtual {v3}, Ll/bfj;->a()Ll/gfj;

    .line 70
    .line 71
    .line 72
    move-result-object v3

    .line 73
    iget-object v4, p0, Ll/g410$r;->d:Ll/g410;

    .line 74
    .line 75
    iget-object v4, v4, Ll/g410;->g:Ll/rsy;

    .line 76
    .line 77
    invoke-virtual {v3, v4}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 78
    .line 79
    .line 80
    :goto_1
    iget-object v3, p0, Ll/g410$r;->d:Ll/g410;

    .line 81
    .line 82
    iget-object v3, v3, Ll/g410;->b:Ll/o410;

    .line 83
    .line 84
    invoke-virtual {v3}, Ll/o410;->J()Ll/g510;

    .line 85
    .line 86
    .line 87
    move-result-object v4

    .line 88
    invoke-virtual {v3, v4}, Ll/o410;->O(Ll/g510;)V

    .line 89
    .line 90
    .line 91
    invoke-interface {v2}, Lcom/momo/pipline/MomoInterface/MomoCodec;->getFilter()Lcom/momo/pipline/codec/MediaBaseCodecFilter;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2}, Ll/wej;->reInitialize()V

    .line 96
    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 100
    iget-object v0, p0, Ll/g410$r;->a:Ll/bfj;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/bfj;->b()Ll/zej;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    if-eqz v0, :cond_3

    .line 107
    .line 108
    iget-object v0, p0, Ll/g410$r;->d:Ll/g410;

    .line 109
    .line 110
    iget-object v0, v0, Ll/g410;->g:Ll/rsy;

    .line 111
    .line 112
    iget-object v1, p0, Ll/g410$r;->a:Ll/bfj;

    .line 113
    .line 114
    if-eqz v0, :cond_2

    .line 115
    .line 116
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/g410$r;->a:Ll/bfj;

    .line 124
    .line 125
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 130
    .line 131
    iget-object v1, v1, Ll/g410;->g:Ll/rsy;

    .line 132
    .line 133
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 134
    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_2
    invoke-virtual {v1}, Ll/bfj;->a()Ll/gfj;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iget-object v1, p0, Ll/g410$r;->a:Ll/bfj;

    .line 142
    .line 143
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 148
    .line 149
    .line 150
    :goto_2
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 155
    .line 156
    new-instance v2, Ljava/lang/StringBuilder;

    .line 157
    .line 158
    const-string v3, "addFilterToDestroy >>>"

    .line 159
    .line 160
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 161
    .line 162
    .line 163
    iget-object v3, p0, Ll/g410$r;->a:Ll/bfj;

    .line 164
    .line 165
    invoke-virtual {v3}, Ll/bfj;->b()Ll/zej;

    .line 166
    .line 167
    .line 168
    move-result-object v3

    .line 169
    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 174
    .line 175
    .line 176
    const-string v3, " "

    .line 177
    .line 178
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    invoke-virtual {v0, v1, v2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 186
    .line 187
    .line 188
    iget-object v0, p0, Ll/g410$r;->d:Ll/g410;

    .line 189
    .line 190
    iget-object v0, v0, Ll/g410;->b:Ll/o410;

    .line 191
    .line 192
    iget-object v1, p0, Ll/g410$r;->a:Ll/bfj;

    .line 193
    .line 194
    invoke-virtual {v1}, Ll/bfj;->b()Ll/zej;

    .line 195
    .line 196
    .line 197
    move-result-object v1

    .line 198
    iget-object v2, p0, Ll/g410$r;->a:Ll/bfj;

    .line 199
    .line 200
    invoke-virtual {v2}, Ll/bfj;->a()Ll/gfj;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v2

    .line 208
    invoke-virtual {v0, v1, v2}, Ll/o410;->A(Ll/wej;Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    iget-object v0, p0, Ll/g410$r;->a:Ll/bfj;

    .line 212
    .line 213
    const/4 v1, 0x0

    .line 214
    invoke-virtual {v0, v1}, Ll/bfj;->e(Ll/zej;)V

    .line 215
    .line 216
    .line 217
    :cond_3
    iget-object v0, p0, Ll/g410$r;->a:Ll/bfj;

    .line 218
    .line 219
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 220
    .line 221
    .line 222
    move-result-object v0

    .line 223
    iget-object v1, p0, Ll/g410$r;->b:Ll/z5m;

    .line 224
    .line 225
    invoke-interface {v1}, Ll/z5m;->getInput()Ll/gfj;

    .line 226
    .line 227
    .line 228
    move-result-object v1

    .line 229
    if-eq v0, v1, :cond_4

    .line 230
    .line 231
    iget-object v0, p0, Ll/g410$r;->d:Ll/g410;

    .line 232
    .line 233
    invoke-static {v0}, Ll/g410;->x(Ll/g410;)Lcom/momo/pipline/meidautil/PipelineConcurrentHashMap;

    .line 234
    .line 235
    .line 236
    move-result-object v0

    .line 237
    iget-object v1, p0, Ll/g410$r;->a:Ll/bfj;

    .line 238
    .line 239
    invoke-virtual {v1}, Ll/bfj;->a()Ll/gfj;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    invoke-virtual {v0, v1}, Ljava/util/AbstractMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    :cond_4
    iget-object v0, p0, Ll/g410$r;->c:Ll/bfj;

    .line 247
    .line 248
    if-eqz v0, :cond_8

    .line 249
    .line 250
    invoke-virtual {v0}, Ll/bfj;->b()Ll/zej;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    if-nez v0, :cond_5

    .line 255
    .line 256
    new-instance v0, Ll/zej;

    .line 257
    .line 258
    invoke-direct {v0}, Ll/zej;-><init>()V

    .line 259
    .line 260
    .line 261
    iget-object v1, p0, Ll/g410$r;->c:Ll/bfj;

    .line 262
    .line 263
    invoke-virtual {v1, v0}, Ll/bfj;->e(Ll/zej;)V

    .line 264
    .line 265
    .line 266
    :cond_5
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 271
    .line 272
    new-instance v3, Ljava/lang/StringBuilder;

    .line 273
    .line 274
    const-string v4, "setScreenEnd Size"

    .line 275
    .line 276
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 277
    .line 278
    .line 279
    iget-object v4, p0, Ll/g410$r;->d:Ll/g410;

    .line 280
    .line 281
    iget-object v4, v4, Ll/g410;->h:Ll/uow;

    .line 282
    .line 283
    iget v4, v4, Ll/tow;->u:I

    .line 284
    .line 285
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    const-string v4, ":"

    .line 289
    .line 290
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    iget-object v4, p0, Ll/g410$r;->d:Ll/g410;

    .line 294
    .line 295
    iget-object v4, v4, Ll/g410;->h:Ll/uow;

    .line 296
    .line 297
    iget v4, v4, Ll/tow;->v:I

    .line 298
    .line 299
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 300
    .line 301
    .line 302
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 303
    .line 304
    .line 305
    move-result-object v3

    .line 306
    invoke-virtual {v1, v2, v3}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 307
    .line 308
    .line 309
    instance-of v1, v0, Ll/hej;

    .line 310
    .line 311
    if-eqz v1, :cond_6

    .line 312
    .line 313
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 314
    .line 315
    iget-object v1, v1, Ll/g410;->h:Ll/uow;

    .line 316
    .line 317
    iget v2, v1, Ll/tow;->m:I

    .line 318
    .line 319
    iget v1, v1, Ll/tow;->n:I

    .line 320
    .line 321
    invoke-virtual {v0, v2, v1}, Ll/zej;->setRenderSize(II)V

    .line 322
    .line 323
    .line 324
    goto :goto_3

    .line 325
    :cond_6
    invoke-static {}, Ll/u6y;->F()Ll/u6y;

    .line 326
    .line 327
    .line 328
    move-result-object v1

    .line 329
    iget-object v2, p0, Ll/g410$r;->d:Ll/g410;

    .line 330
    .line 331
    iget-object v2, v2, Ll/g410;->h:Ll/uow;

    .line 332
    .line 333
    iget v3, v2, Ll/tow;->u:I

    .line 334
    .line 335
    iget v2, v2, Ll/tow;->v:I

    .line 336
    .line 337
    invoke-virtual {v1, v3, v2}, Ll/u6y;->n0(II)V

    .line 338
    .line 339
    .line 340
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 341
    .line 342
    iget-object v1, v1, Ll/g410;->h:Ll/uow;

    .line 343
    .line 344
    iget v2, v1, Ll/tow;->u:I

    .line 345
    .line 346
    iget v1, v1, Ll/tow;->v:I

    .line 347
    .line 348
    invoke-virtual {v0, v2, v1}, Ll/zej;->setRenderSize(II)V

    .line 349
    .line 350
    .line 351
    :goto_3
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 352
    .line 353
    iget-object v1, v1, Ll/g410;->g:Ll/rsy;

    .line 354
    .line 355
    if-eqz v1, :cond_7

    .line 356
    .line 357
    invoke-virtual {v1, v0}, Ll/rsy;->removeTarget(Ll/dfj;)V

    .line 358
    .line 359
    .line 360
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 361
    .line 362
    iget-object v1, v1, Ll/g410;->g:Ll/rsy;

    .line 363
    .line 364
    invoke-virtual {v1, v0}, Ll/rsy;->addTarget(Ll/dfj;)V

    .line 365
    .line 366
    .line 367
    iget-object v0, p0, Ll/g410$r;->c:Ll/bfj;

    .line 368
    .line 369
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 370
    .line 371
    .line 372
    move-result-object v0

    .line 373
    iget-object v1, p0, Ll/g410$r;->d:Ll/g410;

    .line 374
    .line 375
    iget-object v1, v1, Ll/g410;->g:Ll/rsy;

    .line 376
    .line 377
    invoke-virtual {v0, v1}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 378
    .line 379
    .line 380
    iget-object v0, p0, Ll/g410$r;->c:Ll/bfj;

    .line 381
    .line 382
    invoke-virtual {v0}, Ll/bfj;->a()Ll/gfj;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    iget-object p0, p0, Ll/g410$r;->d:Ll/g410;

    .line 387
    .line 388
    iget-object p0, p0, Ll/g410;->g:Ll/rsy;

    .line 389
    .line 390
    invoke-virtual {v0, p0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 391
    .line 392
    .line 393
    return-void

    .line 394
    :cond_7
    iget-object v1, p0, Ll/g410$r;->c:Ll/bfj;

    .line 395
    .line 396
    invoke-virtual {v1}, Ll/bfj;->a()Ll/gfj;

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    invoke-virtual {v1, v0}, Ll/gfj;->removeTarget(Ll/dfj;)V

    .line 401
    .line 402
    .line 403
    iget-object p0, p0, Ll/g410$r;->c:Ll/bfj;

    .line 404
    .line 405
    invoke-virtual {p0}, Ll/bfj;->a()Ll/gfj;

    .line 406
    .line 407
    .line 408
    move-result-object p0

    .line 409
    invoke-virtual {p0, v0}, Ll/gfj;->addTarget(Ll/dfj;)V

    .line 410
    .line 411
    .line 412
    :cond_8
    return-void

    .line 413
    :goto_4
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 414
    throw p0
.end method
