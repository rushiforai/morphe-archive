.class public final Ll/m8f0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/u5m;


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0008\u000b\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0008\u0010\u0005\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u000f\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\t\u0010\nJ#\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000b2\u000c\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000c0\u000bH\u0016\u00a2\u0006\u0004\u0008\u000e\u0010\u000fR\u0017\u0010\u0003\u001a\u00020\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u0010\u0010\u001a\u0004\u0008\u0011\u0010\u0012R\u0019\u0010\u0005\u001a\u0004\u0018\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008\u0013\u0010\u0014\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u0017"
    }
    d2 = {
        "Ll/m8f0;",
        "Ll/u5m;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "purchaseType",
        "",
        "from",
        "<init>",
        "(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V",
        "",
        "handle",
        "()Z",
        "",
        "Lcom/p1/mobile/putong/core/ui/purchase/d;",
        "sections",
        "a",
        "(Ljava/util/List;)Ljava/util/List;",
        "Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "getPurchaseType",
        "()Lcom/p1/mobile/putong/core/data/PurchaseType;",
        "b",
        "Ljava/lang/String;",
        "getFrom",
        "()Ljava/lang/String;",
        "pay_intlGmsRelease"
    }
    k = 0x1
    mv = {
        0x2,
        0x2,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# instance fields
.field public final a:Lcom/p1/mobile/putong/core/data/PurchaseType;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field public final b:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/data/PurchaseType;Ljava/lang/String;)V
    .locals 0
    .param p1    # Lcom/p1/mobile/putong/core/data/PurchaseType;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Ll/m8f0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 8
    .line 9
    iput-object p2, p0, Ll/m8f0;->b:Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method


# virtual methods
.method public a(Ljava/util/List;)Ljava/util/List;
    .locals 7
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "+",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/purchase/d;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    move-object v1, p1

    .line 10
    check-cast v1, Ljava/util/Collection;

    .line 11
    .line 12
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_b

    .line 17
    .line 18
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iget-object v2, p0, Ll/m8f0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 23
    .line 24
    invoke-virtual {v1, v2}, Ll/tab0;->u(Lcom/p1/mobile/putong/core/data/PurchaseType;)Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_b

    .line 37
    .line 38
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 43
    .line 44
    invoke-static {}, Ll/tab0;->h()Ll/tab0;

    .line 45
    .line 46
    .line 47
    move-result-object v3

    .line 48
    invoke-virtual {v3}, Ll/tab0;->z()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_8

    .line 53
    .line 54
    iget-object v3, p0, Ll/m8f0;->b:Ljava/lang/String;

    .line 55
    .line 56
    invoke-static {v3}, Lcom/p1/mobile/putong/core/ui/purchase/e;->x(Ljava/lang/String;)Z

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    if-nez v3, :cond_8

    .line 61
    .line 62
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 63
    .line 64
    .line 65
    move-result-object v3

    .line 66
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 67
    .line 68
    .line 69
    move-result v3

    .line 70
    if-eqz v3, :cond_1

    .line 71
    .line 72
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    goto :goto_1

    .line 77
    :cond_1
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    :goto_1
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->j3()Z

    .line 94
    .line 95
    .line 96
    move-result v4

    .line 97
    if-eqz v4, :cond_2

    .line 98
    .line 99
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 100
    .line 101
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->O0:Lcom/p1/mobile/putong/core/api/CoreAutoPay;

    .line 102
    .line 103
    iget-object v5, p0, Ll/m8f0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 104
    .line 105
    invoke-virtual {v4, v5}, Lcom/p1/mobile/putong/core/api/CoreAutoPay;->u3(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 106
    .line 107
    .line 108
    move-result v4

    .line 109
    if-eqz v4, :cond_2

    .line 110
    .line 111
    const/4 v4, 0x1

    .line 112
    goto :goto_2

    .line 113
    :cond_2
    const/4 v4, 0x0

    .line 114
    :goto_2
    if-nez v4, :cond_3

    .line 115
    .line 116
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 117
    .line 118
    .line 119
    move-result v5

    .line 120
    if-eqz v5, :cond_3

    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 123
    .line 124
    .line 125
    move-result v5

    .line 126
    if-eqz v5, :cond_3

    .line 127
    .line 128
    const-string v5, "-1w"

    .line 129
    .line 130
    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v5

    .line 134
    if-eqz v5, :cond_3

    .line 135
    .line 136
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_3
    if-nez v4, :cond_4

    .line 141
    .line 142
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->weekly()Z

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    if-eqz v5, :cond_4

    .line 147
    .line 148
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    if-eqz v5, :cond_4

    .line 153
    .line 154
    const-string v5, "1w"

    .line 155
    .line 156
    invoke-interface {v1, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 157
    .line 158
    .line 159
    move-result v5

    .line 160
    if-eqz v5, :cond_4

    .line 161
    .line 162
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 163
    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_4
    if-nez v4, :cond_6

    .line 168
    .line 169
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->autoRenewable()Z

    .line 170
    .line 171
    .line 172
    move-result v4

    .line 173
    if-eqz v4, :cond_6

    .line 174
    .line 175
    iget v4, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 176
    .line 177
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v4

    .line 181
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 182
    .line 183
    .line 184
    move-result v4

    .line 185
    if-eqz v4, :cond_6

    .line 186
    .line 187
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 188
    .line 189
    .line 190
    move-result v4

    .line 191
    if-nez v4, :cond_5

    .line 192
    .line 193
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    if-nez v4, :cond_5

    .line 198
    .line 199
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 200
    .line 201
    .line 202
    move-result v4

    .line 203
    if-nez v4, :cond_5

    .line 204
    .line 205
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-eqz v4, :cond_6

    .line 210
    .line 211
    :cond_5
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :cond_6
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->noneRenewable()Z

    .line 217
    .line 218
    .line 219
    move-result v4

    .line 220
    if-eqz v4, :cond_0

    .line 221
    .line 222
    iget v4, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 223
    .line 224
    new-instance v5, Ljava/lang/StringBuilder;

    .line 225
    .line 226
    const-string v6, "-"

    .line 227
    .line 228
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object v4

    .line 238
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 239
    .line 240
    .line 241
    move-result v4

    .line 242
    if-eqz v4, :cond_0

    .line 243
    .line 244
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 245
    .line 246
    .line 247
    move-result v4

    .line 248
    if-nez v4, :cond_7

    .line 249
    .line 250
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 251
    .line 252
    .line 253
    move-result v4

    .line 254
    if-nez v4, :cond_7

    .line 255
    .line 256
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 257
    .line 258
    .line 259
    move-result v4

    .line 260
    if-nez v4, :cond_7

    .line 261
    .line 262
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    if-eqz v3, :cond_0

    .line 267
    .line 268
    :cond_7
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    goto/16 :goto_0

    .line 272
    .line 273
    :cond_8
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->n()Z

    .line 274
    .line 275
    .line 276
    move-result v3

    .line 277
    if-eqz v3, :cond_9

    .line 278
    .line 279
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    goto :goto_3

    .line 284
    :cond_9
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->d()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    :goto_3
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    iget v4, v3, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 293
    .line 294
    invoke-static {v4}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-interface {v1, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 299
    .line 300
    .line 301
    move-result v4

    .line 302
    if-eqz v4, :cond_0

    .line 303
    .line 304
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->monthly()Z

    .line 305
    .line 306
    .line 307
    move-result v4

    .line 308
    if-nez v4, :cond_a

    .line 309
    .line 310
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 311
    .line 312
    .line 313
    move-result v4

    .line 314
    if-nez v4, :cond_a

    .line 315
    .line 316
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->semiAnnual()Z

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    if-nez v4, :cond_a

    .line 321
    .line 322
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->yearly()Z

    .line 323
    .line 324
    .line 325
    move-result v3

    .line 326
    if-eqz v3, :cond_0

    .line 327
    .line 328
    :cond_a
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :cond_b
    new-instance p1, Ljava/util/ArrayList;

    .line 334
    .line 335
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 336
    .line 337
    .line 338
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    :cond_c
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 343
    .line 344
    .line 345
    move-result v1

    .line 346
    if-eqz v1, :cond_e

    .line 347
    .line 348
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 349
    .line 350
    .line 351
    move-result-object v1

    .line 352
    move-object v2, v1

    .line 353
    check-cast v2, Lcom/p1/mobile/putong/core/ui/purchase/d;

    .line 354
    .line 355
    invoke-static {}, Ll/s7a;->n()Z

    .line 356
    .line 357
    .line 358
    move-result v3

    .line 359
    if-eqz v3, :cond_d

    .line 360
    .line 361
    iget-object v3, p0, Ll/m8f0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 362
    .line 363
    invoke-static {v3}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 364
    .line 365
    .line 366
    move-result v3

    .line 367
    if-eqz v3, :cond_d

    .line 368
    .line 369
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 370
    .line 371
    .line 372
    move-result-object v3

    .line 373
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 374
    .line 375
    .line 376
    move-result v3

    .line 377
    if-eqz v3, :cond_d

    .line 378
    .line 379
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 380
    .line 381
    .line 382
    move-result-object v3

    .line 383
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->H()Z

    .line 384
    .line 385
    .line 386
    move-result v3

    .line 387
    if-eqz v3, :cond_d

    .line 388
    .line 389
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 390
    .line 391
    .line 392
    move-result-object v3

    .line 393
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->s()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 394
    .line 395
    .line 396
    move-result-object v3

    .line 397
    invoke-virtual {v3}, Lcom/p1/mobile/putong/core/data/Merchandise;->quarterly()Z

    .line 398
    .line 399
    .line 400
    move-result v3

    .line 401
    if-eqz v3, :cond_d

    .line 402
    .line 403
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d;->b()Lcom/p1/mobile/putong/core/ui/purchase/d$a;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    invoke-virtual {v2}, Lcom/p1/mobile/putong/core/ui/purchase/d$a;->E()Z

    .line 408
    .line 409
    .line 410
    move-result v2

    .line 411
    if-nez v2, :cond_c

    .line 412
    .line 413
    :cond_d
    invoke-interface {p1, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 414
    .line 415
    .line 416
    goto :goto_4

    .line 417
    :cond_e
    return-object p1
.end method

.method public handle()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m8f0;->a:Lcom/p1/mobile/putong/core/data/PurchaseType;

    .line 2
    .line 3
    invoke-static {p0}, Ll/wib0;->d(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method
