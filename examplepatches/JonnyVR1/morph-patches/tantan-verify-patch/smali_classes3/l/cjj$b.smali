.class public Ll/cjj$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/am90;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/cjj;->J(Lcom/android/billingclient/api/a;Ljava/lang/String;Ljava/util/ArrayList;)Lrx/c;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Ljava/lang/ref/WeakReference;


# direct methods
.method public constructor <init>(Ljava/lang/ref/WeakReference;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/cjj$b;->a:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Lcom/android/billingclient/api/d;Ljava/util/List;)V
    .locals 11
    .param p1    # Lcom/android/billingclient/api/d;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/android/billingclient/api/d;",
            "Ljava/util/List<",
            "Lcom/android/billingclient/api/f;",
            ">;)V"
        }
    .end annotation

    .line 1
    const-string v0, "subs"

    .line 2
    .line 3
    iget-object p0, p0, Ll/cjj$b;->a:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/gcg0;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    if-nez v1, :cond_0

    .line 16
    .line 17
    return-void

    .line 18
    :cond_0
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 19
    .line 20
    .line 21
    move-result v1

    .line 22
    const/4 v2, 0x0

    .line 23
    if-nez v1, :cond_8

    .line 24
    .line 25
    invoke-static {p2}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-nez v1, :cond_8

    .line 30
    .line 31
    :try_start_0
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 32
    .line 33
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->I2:Ljava/lang/String;

    .line 34
    .line 35
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_2

    .line 40
    .line 41
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Lcom/android/billingclient/api/f;

    .line 46
    .line 47
    invoke-virtual {p1}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    if-eqz p1, :cond_1

    .line 56
    .line 57
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/android/billingclient/api/f;

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/android/billingclient/api/f;->e()Ljava/util/List;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    check-cast p1, Lcom/android/billingclient/api/f$e;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/android/billingclient/api/f$e;->d()Lcom/android/billingclient/api/f$d;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p1}, Lcom/android/billingclient/api/f$d;->a()Ljava/util/List;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    check-cast p1, Lcom/android/billingclient/api/f$c;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/android/billingclient/api/f$c;->c()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    goto :goto_0

    .line 92
    :cond_1
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/android/billingclient/api/f;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/android/billingclient/api/f;->b()Lcom/android/billingclient/api/f$b;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    invoke-virtual {p1}, Lcom/android/billingclient/api/f$b;->c()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    :goto_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 107
    .line 108
    iput-object p1, v1, Lcom/p1/mobile/putong/core/api/c;->I2:Ljava/lang/String;

    .line 109
    .line 110
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->j0:Lcom/p1/mobile/putong/core/api/CoreProduct;

    .line 111
    .line 112
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/core/api/CoreProduct;->O5(Ljava/lang/String;)Lrx/c;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 113
    .line 114
    .line 115
    :catch_0
    :cond_2
    new-instance p1, Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    :cond_3
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-eqz v3, :cond_7

    .line 129
    .line 130
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    check-cast v3, Lcom/android/billingclient/api/f;

    .line 135
    .line 136
    invoke-interface {p2, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    check-cast v4, Lcom/android/billingclient/api/f;

    .line 141
    .line 142
    invoke-virtual {v4}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    invoke-static {v4, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 147
    .line 148
    .line 149
    move-result v4

    .line 150
    if-eqz v4, :cond_6

    .line 151
    .line 152
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->e()Ljava/util/List;

    .line 153
    .line 154
    .line 155
    move-result-object v4

    .line 156
    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    :cond_4
    :goto_2
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    .line 161
    .line 162
    .line 163
    move-result v5

    .line 164
    if-eqz v5, :cond_3

    .line 165
    .line 166
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v5

    .line 170
    check-cast v5, Lcom/android/billingclient/api/f$e;

    .line 171
    .line 172
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$e;->d()Lcom/android/billingclient/api/f$d;

    .line 173
    .line 174
    .line 175
    move-result-object v6

    .line 176
    invoke-virtual {v6}, Lcom/android/billingclient/api/f$d;->a()Ljava/util/List;

    .line 177
    .line 178
    .line 179
    move-result-object v6

    .line 180
    invoke-interface {v6, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 181
    .line 182
    .line 183
    move-result-object v6

    .line 184
    check-cast v6, Lcom/android/billingclient/api/f$c;

    .line 185
    .line 186
    if-eqz v6, :cond_4

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/data/GPSkuDetails;->new_()Lcom/p1/mobile/putong/data/GPSkuDetails;

    .line 189
    .line 190
    .line 191
    move-result-object v7

    .line 192
    new-instance v8, Ljava/lang/StringBuilder;

    .line 193
    .line 194
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 195
    .line 196
    .line 197
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->c()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v9

    .line 201
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 202
    .line 203
    .line 204
    const-string v9, ":"

    .line 205
    .line 206
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 207
    .line 208
    .line 209
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$e;->a()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v10

    .line 213
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v8

    .line 220
    iput-object v8, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->productId:Ljava/lang/String;

    .line 221
    .line 222
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$e;->b()Ljava/lang/String;

    .line 223
    .line 224
    .line 225
    move-result-object v8

    .line 226
    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 227
    .line 228
    .line 229
    move-result v8

    .line 230
    if-nez v8, :cond_5

    .line 231
    .line 232
    new-instance v8, Ljava/lang/StringBuilder;

    .line 233
    .line 234
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 235
    .line 236
    .line 237
    iget-object v10, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->productId:Ljava/lang/String;

    .line 238
    .line 239
    invoke-virtual {v8, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$e;->b()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v5

    .line 249
    invoke-virtual {v8, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 250
    .line 251
    .line 252
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v5

    .line 256
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->productId:Ljava/lang/String;

    .line 257
    .line 258
    :cond_5
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 259
    .line 260
    .line 261
    move-result-object v5

    .line 262
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->type:Ljava/lang/String;

    .line 263
    .line 264
    invoke-virtual {v6}, Lcom/android/billingclient/api/f$c;->a()Ljava/lang/String;

    .line 265
    .line 266
    .line 267
    move-result-object v5

    .line 268
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->price:Ljava/lang/String;

    .line 269
    .line 270
    invoke-virtual {v6}, Lcom/android/billingclient/api/f$c;->b()J

    .line 271
    .line 272
    .line 273
    move-result-wide v8

    .line 274
    iput-wide v8, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceAmountMicros:J

    .line 275
    .line 276
    invoke-virtual {v6}, Lcom/android/billingclient/api/f$c;->c()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v5

    .line 280
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceCurrencyCode:Ljava/lang/String;

    .line 281
    .line 282
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->f()Ljava/lang/String;

    .line 283
    .line 284
    .line 285
    move-result-object v5

    .line 286
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->title:Ljava/lang/String;

    .line 287
    .line 288
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->a()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    iput-object v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->description:Ljava/lang/String;

    .line 293
    .line 294
    invoke-virtual {v6}, Lcom/android/billingclient/api/f$c;->b()J

    .line 295
    .line 296
    .line 297
    move-result-wide v5

    .line 298
    iput-wide v5, v7, Lcom/p1/mobile/putong/data/GPSkuDetails;->introductoryPriceAmountMicros:J

    .line 299
    .line 300
    invoke-interface {p1, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 301
    .line 302
    .line 303
    goto/16 :goto_2

    .line 304
    .line 305
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/data/GPSkuDetails;->new_()Lcom/p1/mobile/putong/data/GPSkuDetails;

    .line 306
    .line 307
    .line 308
    move-result-object v4

    .line 309
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->b()Lcom/android/billingclient/api/f$b;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->c()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v6

    .line 317
    iput-object v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->productId:Ljava/lang/String;

    .line 318
    .line 319
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->d()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v6

    .line 323
    iput-object v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->type:Ljava/lang/String;

    .line 324
    .line 325
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$b;->a()Ljava/lang/String;

    .line 326
    .line 327
    .line 328
    move-result-object v6

    .line 329
    iput-object v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->price:Ljava/lang/String;

    .line 330
    .line 331
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$b;->b()J

    .line 332
    .line 333
    .line 334
    move-result-wide v6

    .line 335
    iput-wide v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceAmountMicros:J

    .line 336
    .line 337
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$b;->c()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v6

    .line 341
    iput-object v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->priceCurrencyCode:Ljava/lang/String;

    .line 342
    .line 343
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->f()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v6

    .line 347
    iput-object v6, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->title:Ljava/lang/String;

    .line 348
    .line 349
    invoke-virtual {v3}, Lcom/android/billingclient/api/f;->a()Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v3

    .line 353
    iput-object v3, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->description:Ljava/lang/String;

    .line 354
    .line 355
    invoke-virtual {v5}, Lcom/android/billingclient/api/f$b;->b()J

    .line 356
    .line 357
    .line 358
    move-result-wide v5

    .line 359
    iput-wide v5, v4, Lcom/p1/mobile/putong/data/GPSkuDetails;->introductoryPriceAmountMicros:J

    .line 360
    .line 361
    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 362
    .line 363
    .line 364
    goto/16 :goto_1

    .line 365
    .line 366
    :cond_7
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 367
    .line 368
    .line 369
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 370
    .line 371
    .line 372
    invoke-static {p1}, Ll/cjj;->E(Ljava/util/List;)V

    .line 373
    .line 374
    .line 375
    return-void

    .line 376
    :cond_8
    new-instance p2, Ljava/lang/RuntimeException;

    .line 377
    .line 378
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->b()I

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    invoke-static {v0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    invoke-virtual {p1}, Lcom/android/billingclient/api/d;->a()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object p1

    .line 390
    const/4 v1, 0x3

    .line 391
    new-array v1, v1, [Ljava/lang/CharSequence;

    .line 392
    .line 393
    aput-object v0, v1, v2

    .line 394
    .line 395
    const-string v0, "_"

    .line 396
    .line 397
    const/4 v2, 0x1

    .line 398
    aput-object v0, v1, v2

    .line 399
    .line 400
    const/4 v0, 0x2

    .line 401
    aput-object p1, v1, v0

    .line 402
    .line 403
    invoke-static {v1}, Landroid/text/TextUtils;->concat([Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    invoke-interface {p1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    .line 408
    .line 409
    .line 410
    move-result-object p1

    .line 411
    invoke-direct {p2, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    invoke-interface {p0, p2}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 415
    .line 416
    .line 417
    return-void
.end method
