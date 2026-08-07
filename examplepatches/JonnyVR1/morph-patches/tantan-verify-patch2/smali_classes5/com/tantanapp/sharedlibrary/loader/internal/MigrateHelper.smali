.class public final Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0015\u0010\u0007\u001a\u00020\u00062\u0006\u0010\u0005\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0007\u0010\u0008\u00a8\u0006\t"
    }
    d2 = {
        "Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;",
        "",
        "<init>",
        "()V",
        "Lcom/tantanapp/sharedlibrary/loader/a;",
        "config",
        "",
        "a",
        "(Lcom/tantanapp/sharedlibrary/loader/a;)V",
        "loader_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation

.annotation build Lkotlin/jvm/internal/SourceDebugExtension;
.end annotation


# static fields
.field public static final INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 1

    new-instance v0, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;

    invoke-direct {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;-><init>()V

    sput-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper;

    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Lcom/tantanapp/sharedlibrary/loader/a;)V
    .locals 16
    .param p1    # Lcom/tantanapp/sharedlibrary/loader/a;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->f(Ljava/io/File;)Ljava/io/File;

    .line 9
    .line 10
    .line 11
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->f(Ljava/io/File;)Ljava/io/File;

    .line 16
    .line 17
    .line 18
    sget-object v0, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->f()Ljava/util/List;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Ljava/lang/Iterable;

    .line 25
    .line 26
    new-instance v1, Ljava/util/ArrayList;

    .line 27
    .line 28
    const/16 v2, 0xa

    .line 29
    .line 30
    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    check-cast v2, Ljava/lang/String;

    .line 52
    .line 53
    sget-object v3, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;

    .line 54
    .line 55
    invoke-virtual {v3, v2}, Lcom/tantanapp/sharedlibrary/loader/internal/AssetsHelper;->g(Ljava/lang/String;)Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 73
    .line 74
    .line 75
    move-result v2

    .line 76
    if-eqz v2, :cond_1

    .line 77
    .line 78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    check-cast v2, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;

    .line 83
    .line 84
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ModuleZipInfo;->getZipInfoList()Ljava/util/List;

    .line 85
    .line 86
    .line 87
    move-result-object v2

    .line 88
    check-cast v2, Ljava/lang/Iterable;

    .line 89
    .line 90
    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_1
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    new-instance v1, Ljava/lang/StringBuilder;

    .line 99
    .line 100
    const-string v2, "migrate, zipInfoSet="

    .line 101
    .line 102
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    move-object v3, v0

    .line 106
    check-cast v3, Ljava/lang/Iterable;

    .line 107
    .line 108
    sget-object v9, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$1;

    .line 109
    .line 110
    const/16 v10, 0x1f

    .line 111
    .line 112
    const/4 v11, 0x0

    .line 113
    const/4 v4, 0x0

    .line 114
    const/4 v5, 0x0

    .line 115
    const/4 v6, 0x0

    .line 116
    const/4 v7, 0x0

    .line 117
    const/4 v8, 0x0

    .line 118
    invoke-static/range {v3 .. v11}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    new-instance v0, Ljava/util/ArrayList;

    .line 133
    .line 134
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 135
    .line 136
    .line 137
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-eqz v2, :cond_2

    .line 146
    .line 147
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    check-cast v2, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 152
    .line 153
    invoke-virtual {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getSoInfoList()Ljava/util/List;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    check-cast v2, Ljava/lang/Iterable;

    .line 158
    .line 159
    invoke-static {v0, v2}, Lkotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 160
    .line 161
    .line 162
    goto :goto_2

    .line 163
    :cond_2
    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->toSet(Ljava/lang/Iterable;)Ljava/util/Set;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    new-instance v1, Ljava/lang/StringBuilder;

    .line 168
    .line 169
    const-string v2, "migrate, soInfoSet="

    .line 170
    .line 171
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    move-object v4, v0

    .line 175
    check-cast v4, Ljava/lang/Iterable;

    .line 176
    .line 177
    sget-object v10, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$2;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$2;

    .line 178
    .line 179
    const/16 v11, 0x1f

    .line 180
    .line 181
    const/4 v12, 0x0

    .line 182
    const/4 v5, 0x0

    .line 183
    const/4 v6, 0x0

    .line 184
    const/4 v7, 0x0

    .line 185
    const/4 v8, 0x0

    .line 186
    const/4 v9, 0x0

    .line 187
    invoke-static/range {v4 .. v12}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 199
    .line 200
    .line 201
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->a()Ljava/io/File;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 206
    .line 207
    .line 208
    move-result-object v0

    .line 209
    const/4 v1, 0x0

    .line 210
    if-nez v0, :cond_3

    .line 211
    .line 212
    new-array v0, v1, [Ljava/io/File;

    .line 213
    .line 214
    :cond_3
    new-instance v2, Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .line 218
    .line 219
    array-length v5, v0

    .line 220
    move v6, v1

    .line 221
    :goto_3
    if-ge v6, v5, :cond_5

    .line 222
    .line 223
    aget-object v7, v0, v6

    .line 224
    .line 225
    invoke-virtual {v7}, Ljava/io/File;->isFile()Z

    .line 226
    .line 227
    .line 228
    move-result v8

    .line 229
    if-eqz v8, :cond_4

    .line 230
    .line 231
    invoke-interface {v2, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 232
    .line 233
    .line 234
    :cond_4
    add-int/lit8 v6, v6, 0x1

    .line 235
    .line 236
    goto :goto_3

    .line 237
    :cond_5
    new-instance v7, Ljava/util/ArrayList;

    .line 238
    .line 239
    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    .line 240
    .line 241
    .line 242
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 247
    .line 248
    .line 249
    move-result v2

    .line 250
    if-eqz v2, :cond_9

    .line 251
    .line 252
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    move-object v5, v2

    .line 257
    check-cast v5, Ljava/io/File;

    .line 258
    .line 259
    instance-of v6, v3, Ljava/util/Collection;

    .line 260
    .line 261
    if-eqz v6, :cond_6

    .line 262
    .line 263
    move-object v6, v3

    .line 264
    check-cast v6, Ljava/util/Collection;

    .line 265
    .line 266
    invoke-interface {v6}, Ljava/util/Collection;->isEmpty()Z

    .line 267
    .line 268
    .line 269
    move-result v6

    .line 270
    if-eqz v6, :cond_6

    .line 271
    .line 272
    goto :goto_5

    .line 273
    :cond_6
    invoke-interface {v3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 274
    .line 275
    .line 276
    move-result-object v6

    .line 277
    :cond_7
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 278
    .line 279
    .line 280
    move-result v8

    .line 281
    if-eqz v8, :cond_8

    .line 282
    .line 283
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v8

    .line 287
    check-cast v8, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;

    .line 288
    .line 289
    invoke-virtual {v5}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 290
    .line 291
    .line 292
    move-result-object v9

    .line 293
    invoke-virtual {v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getName()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object v10

    .line 297
    invoke-static {v9, v10}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v9

    .line 301
    if-eqz v9, :cond_7

    .line 302
    .line 303
    invoke-virtual {v8}, Lcom/tantanapp/sharedlibrary/loader/internal/ZipInfo;->getMd5()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v8

    .line 307
    invoke-static {v5, v8}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->a(Ljava/io/File;Ljava/lang/String;)Z

    .line 308
    .line 309
    .line 310
    move-result v8

    .line 311
    if-eqz v8, :cond_7

    .line 312
    .line 313
    goto :goto_4

    .line 314
    :cond_8
    :goto_5
    invoke-interface {v7, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 315
    .line 316
    .line 317
    goto :goto_4

    .line 318
    :cond_9
    new-instance v0, Ljava/lang/StringBuilder;

    .line 319
    .line 320
    const-string v2, "migrate, delete download fileList="

    .line 321
    .line 322
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 323
    .line 324
    .line 325
    sget-object v13, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$5$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$5$1;

    .line 326
    .line 327
    const/16 v14, 0x1f

    .line 328
    .line 329
    const/4 v15, 0x0

    .line 330
    const/4 v8, 0x0

    .line 331
    const/4 v9, 0x0

    .line 332
    const/4 v10, 0x0

    .line 333
    const/4 v11, 0x0

    .line 334
    const/4 v12, 0x0

    .line 335
    invoke-static/range {v7 .. v15}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v2

    .line 339
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 340
    .line 341
    .line 342
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 347
    .line 348
    .line 349
    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 354
    .line 355
    .line 356
    move-result v2

    .line 357
    if-eqz v2, :cond_a

    .line 358
    .line 359
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v2

    .line 363
    check-cast v2, Ljava/io/File;

    .line 364
    .line 365
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 366
    .line 367
    .line 368
    invoke-static {v2}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 369
    .line 370
    .line 371
    goto :goto_6

    .line 372
    :cond_a
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 373
    .line 374
    .line 375
    move-result-object v0

    .line 376
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 377
    .line 378
    .line 379
    new-instance v0, Ljava/lang/StringBuilder;

    .line 380
    .line 381
    const-string v2, "migrate, delete unzipPath="

    .line 382
    .line 383
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 384
    .line 385
    .line 386
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->m()Ljava/io/File;

    .line 387
    .line 388
    .line 389
    move-result-object v2

    .line 390
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 398
    .line 399
    .line 400
    invoke-virtual/range {p1 .. p1}, Lcom/tantanapp/sharedlibrary/loader/a;->l()Ljava/io/File;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 405
    .line 406
    .line 407
    move-result-object v0

    .line 408
    if-nez v0, :cond_b

    .line 409
    .line 410
    new-array v0, v1, [Ljava/io/File;

    .line 411
    .line 412
    :cond_b
    new-instance v2, Ljava/util/ArrayList;

    .line 413
    .line 414
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .line 416
    .line 417
    array-length v3, v0

    .line 418
    :goto_7
    if-ge v1, v3, :cond_d

    .line 419
    .line 420
    aget-object v5, v0, v1

    .line 421
    .line 422
    invoke-virtual {v5}, Ljava/io/File;->isFile()Z

    .line 423
    .line 424
    .line 425
    move-result v6

    .line 426
    if-eqz v6, :cond_c

    .line 427
    .line 428
    invoke-interface {v2, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 429
    .line 430
    .line 431
    :cond_c
    add-int/lit8 v1, v1, 0x1

    .line 432
    .line 433
    goto :goto_7

    .line 434
    :cond_d
    new-instance v5, Ljava/util/ArrayList;

    .line 435
    .line 436
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 437
    .line 438
    .line 439
    invoke-interface {v2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 440
    .line 441
    .line 442
    move-result-object v0

    .line 443
    :goto_8
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 444
    .line 445
    .line 446
    move-result v1

    .line 447
    if-eqz v1, :cond_11

    .line 448
    .line 449
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v1

    .line 453
    move-object v2, v1

    .line 454
    check-cast v2, Ljava/io/File;

    .line 455
    .line 456
    instance-of v3, v4, Ljava/util/Collection;

    .line 457
    .line 458
    if-eqz v3, :cond_e

    .line 459
    .line 460
    move-object v3, v4

    .line 461
    check-cast v3, Ljava/util/Collection;

    .line 462
    .line 463
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 464
    .line 465
    .line 466
    move-result v3

    .line 467
    if-eqz v3, :cond_e

    .line 468
    .line 469
    goto :goto_9

    .line 470
    :cond_e
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 471
    .line 472
    .line 473
    move-result-object v3

    .line 474
    :cond_f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 475
    .line 476
    .line 477
    move-result v6

    .line 478
    if-eqz v6, :cond_10

    .line 479
    .line 480
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    move-result-object v6

    .line 484
    check-cast v6, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;

    .line 485
    .line 486
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 487
    .line 488
    .line 489
    move-result-object v7

    .line 490
    invoke-virtual {v6}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getName()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v8

    .line 494
    invoke-static {v7, v8}, Lkotlin/jvm/internal/Intrinsics;->d(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 495
    .line 496
    .line 497
    move-result v7

    .line 498
    if-eqz v7, :cond_f

    .line 499
    .line 500
    invoke-virtual {v6}, Lcom/tantanapp/sharedlibrary/loader/internal/SoInfo;->getMd5()Ljava/lang/String;

    .line 501
    .line 502
    .line 503
    move-result-object v6

    .line 504
    invoke-static {v2, v6}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->a(Ljava/io/File;Ljava/lang/String;)Z

    .line 505
    .line 506
    .line 507
    move-result v6

    .line 508
    if-eqz v6, :cond_f

    .line 509
    .line 510
    goto :goto_8

    .line 511
    :cond_10
    :goto_9
    invoke-interface {v5, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    goto :goto_8

    .line 515
    :cond_11
    new-instance v0, Ljava/lang/StringBuilder;

    .line 516
    .line 517
    const-string v1, "migrate, delete so fileList="

    .line 518
    .line 519
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 520
    .line 521
    .line 522
    sget-object v11, Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$9$1;->INSTANCE:Lcom/tantanapp/sharedlibrary/loader/internal/MigrateHelper$deleteUnusedSoFiles$9$1;

    .line 523
    .line 524
    const/16 v12, 0x1f

    .line 525
    .line 526
    const/4 v13, 0x0

    .line 527
    const/4 v6, 0x0

    .line 528
    const/4 v7, 0x0

    .line 529
    const/4 v8, 0x0

    .line 530
    const/4 v9, 0x0

    .line 531
    const/4 v10, 0x0

    .line 532
    invoke-static/range {v5 .. v13}, Lkotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lkotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v1

    .line 536
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 537
    .line 538
    .line 539
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    invoke-static {v0}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->c(Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    invoke-interface {v5}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    :goto_a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 551
    .line 552
    .line 553
    move-result v1

    .line 554
    if-eqz v1, :cond_12

    .line 555
    .line 556
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 557
    .line 558
    .line 559
    move-result-object v1

    .line 560
    check-cast v1, Ljava/io/File;

    .line 561
    .line 562
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 563
    .line 564
    .line 565
    invoke-static {v1}, Lcom/tantanapp/sharedlibrary/loader/internal/UtilKt;->e(Ljava/io/File;)V

    .line 566
    .line 567
    .line 568
    goto :goto_a

    .line 569
    :cond_12
    return-void
.end method
