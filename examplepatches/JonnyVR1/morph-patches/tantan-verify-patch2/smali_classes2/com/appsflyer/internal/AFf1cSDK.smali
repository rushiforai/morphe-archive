.class public final Lcom/appsflyer/internal/AFf1cSDK;
.super Lcom/appsflyer/internal/AFf1oSDK;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/appsflyer/internal/AFf1oSDK<",
        "Ljava/util/Map<",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        ">;>;"
    }
.end annotation


# instance fields
.field private final AFKeystoreWrapper:Ljava/util/UUID;

.field public component3:Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field private copy:Ljava/lang/String;

.field private final copydefault:Lcom/appsflyer/internal/AFe1sSDK;

.field private equals:Ljava/lang/String;

.field private hashCode:Ljava/lang/String;

.field private final toString:Z


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFd1fSDK;Ljava/util/UUID;Landroid/net/Uri;)V
    .locals 16
    .param p1    # Lcom/appsflyer/internal/AFd1fSDK;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/util/UUID;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p3    # Landroid/net/Uri;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const v0, 0x37ce3ea5

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const v2, -0x7ddb393d

    .line 11
    .line 12
    .line 13
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const v3, -0x3b12b4d4

    .line 18
    .line 19
    .line 20
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    const v4, -0x5005efba

    .line 25
    .line 26
    .line 27
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 28
    .line 29
    .line 30
    move-result-object v4

    .line 31
    sget-object v5, Lcom/appsflyer/internal/AFf1zSDK;->component1:Lcom/appsflyer/internal/AFf1zSDK;

    .line 32
    .line 33
    sget-object v6, Lcom/appsflyer/internal/AFf1zSDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFf1zSDK;

    .line 34
    .line 35
    filled-new-array {v6}, [Lcom/appsflyer/internal/AFf1zSDK;

    .line 36
    .line 37
    .line 38
    move-result-object v6

    .line 39
    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v7

    .line 43
    move-object/from16 v8, p1

    .line 44
    .line 45
    invoke-direct {v1, v5, v6, v8, v7}, Lcom/appsflyer/internal/AFf1oSDK;-><init>(Lcom/appsflyer/internal/AFf1zSDK;[Lcom/appsflyer/internal/AFf1zSDK;Lcom/appsflyer/internal/AFd1fSDK;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-interface {v8}, Lcom/appsflyer/internal/AFd1fSDK;->getMonetizationNetwork()Lcom/appsflyer/internal/AFe1sSDK;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    iput-object v5, v1, Lcom/appsflyer/internal/AFf1cSDK;->copydefault:Lcom/appsflyer/internal/AFe1sSDK;

    .line 53
    .line 54
    move-object/from16 v5, p2

    .line 55
    .line 56
    iput-object v5, v1, Lcom/appsflyer/internal/AFf1cSDK;->AFKeystoreWrapper:Ljava/util/UUID;

    .line 57
    .line 58
    const/4 v5, 0x0

    .line 59
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v6

    .line 63
    invoke-static {v6}, Lcom/appsflyer/internal/AFc1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 64
    .line 65
    .line 66
    move-result v6

    .line 67
    if-nez v6, :cond_8

    .line 68
    .line 69
    invoke-virtual/range {p3 .. p3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v6

    .line 73
    invoke-static {v6}, Lcom/appsflyer/internal/AFc1tSDK;->getCurrencyIso4217Code(Ljava/lang/String;)Z

    .line 74
    .line 75
    .line 76
    move-result v6

    .line 77
    if-nez v6, :cond_8

    .line 78
    .line 79
    invoke-interface {v8}, Lcom/appsflyer/internal/AFd1fSDK;->unregisterClient()Lcom/appsflyer/internal/AFc1sSDK;

    .line 80
    .line 81
    .line 82
    move-result-object v6
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 83
    const/4 v7, 0x2

    .line 84
    :try_start_1
    new-array v8, v7, [Ljava/lang/Object;

    .line 85
    .line 86
    const/4 v9, 0x1

    .line 87
    aput-object v6, v8, v9

    .line 88
    .line 89
    aput-object p3, v8, v5

    .line 90
    .line 91
    sget-object v6, Lcom/appsflyer/internal/AFc1gSDK;->registerClient:Ljava/util/Map;

    .line 92
    .line 93
    invoke-interface {v6, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v10

    .line 97
    const-wide/16 v11, 0x0

    .line 98
    .line 99
    if-eqz v10, :cond_0

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_0
    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    .line 103
    .line 104
    .line 105
    move-result-wide v13

    .line 106
    cmp-long v10, v13, v11

    .line 107
    .line 108
    rsub-int/lit8 v10, v10, 0x1

    .line 109
    .line 110
    invoke-static {v5}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 111
    .line 112
    .line 113
    move-result v13

    .line 114
    rsub-int/lit8 v13, v13, 0x24

    .line 115
    .line 116
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 117
    .line 118
    .line 119
    move-result-wide v14

    .line 120
    cmp-long v14, v14, v11

    .line 121
    .line 122
    add-int/lit16 v14, v14, 0x3806

    .line 123
    .line 124
    int-to-char v14, v14

    .line 125
    invoke-static {v10, v13, v14}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object v10

    .line 129
    check-cast v10, Ljava/lang/Class;

    .line 130
    .line 131
    const-class v13, Landroid/net/Uri;

    .line 132
    .line 133
    const-class v14, Lcom/appsflyer/internal/AFc1sSDK;

    .line 134
    .line 135
    filled-new-array {v13, v14}, [Ljava/lang/Class;

    .line 136
    .line 137
    .line 138
    move-result-object v13

    .line 139
    invoke-virtual {v10, v13}, Ljava/lang/Class;->getDeclaredConstructor([Ljava/lang/Class;)Ljava/lang/reflect/Constructor;

    .line 140
    .line 141
    .line 142
    move-result-object v10

    .line 143
    invoke-interface {v6, v4, v10}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    :goto_0
    check-cast v10, Ljava/lang/reflect/Constructor;

    .line 147
    .line 148
    invoke-virtual {v10, v8}, Ljava/lang/reflect/Constructor;->newInstance([Ljava/lang/Object;)Ljava/lang/Object;

    .line 149
    .line 150
    .line 151
    move-result-object v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 152
    :try_start_2
    invoke-interface {v6, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    move-result-object v8

    .line 156
    const/4 v10, 0x0

    .line 157
    const/4 v13, 0x0

    .line 158
    if-eqz v8, :cond_1

    .line 159
    .line 160
    goto :goto_1

    .line 161
    :cond_1
    invoke-static {v5}, Landroid/util/TypedValue;->complexToFloat(I)F

    .line 162
    .line 163
    .line 164
    move-result v8

    .line 165
    cmpl-float v8, v8, v13

    .line 166
    .line 167
    invoke-static {v5}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 168
    .line 169
    .line 170
    move-result v14

    .line 171
    rsub-int/lit8 v14, v14, 0x23

    .line 172
    .line 173
    invoke-static {v5, v13, v13}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    .line 174
    .line 175
    .line 176
    move-result v15

    .line 177
    cmpl-float v15, v15, v13

    .line 178
    .line 179
    add-int/lit16 v15, v15, 0x3807

    .line 180
    .line 181
    int-to-char v15, v15

    .line 182
    invoke-static {v8, v14, v15}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    move-result-object v8

    .line 186
    check-cast v8, Ljava/lang/Class;

    .line 187
    .line 188
    const-string v14, "getMonetizationNetwork"

    .line 189
    .line 190
    invoke-virtual {v8, v14, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 191
    .line 192
    .line 193
    move-result-object v8

    .line 194
    invoke-interface {v6, v3, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    :goto_1
    check-cast v8, Ljava/lang/reflect/Method;

    .line 198
    .line 199
    invoke-virtual {v8, v4, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 203
    :try_start_3
    invoke-interface {v6, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 204
    .line 205
    .line 206
    move-result-object v4

    .line 207
    if-eqz v4, :cond_2

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_2
    invoke-static {v5, v13, v13}, Landroid/util/TypedValue;->complexToFraction(IFF)F

    .line 211
    .line 212
    .line 213
    move-result v4

    .line 214
    cmpl-float v4, v4, v13

    .line 215
    .line 216
    add-int/lit8 v4, v4, 0x24

    .line 217
    .line 218
    const/16 v8, 0x30

    .line 219
    .line 220
    invoke-static {v8}, Landroid/text/AndroidCharacter;->getMirror(C)C

    .line 221
    .line 222
    .line 223
    move-result v8

    .line 224
    rsub-int/lit8 v8, v8, 0x62

    .line 225
    .line 226
    invoke-static {v5, v5}, Landroid/view/KeyEvent;->getDeadChar(II)I

    .line 227
    .line 228
    .line 229
    move-result v13

    .line 230
    int-to-char v13, v13

    .line 231
    invoke-static {v4, v8, v13}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 232
    .line 233
    .line 234
    move-result-object v4

    .line 235
    check-cast v4, Ljava/lang/Class;

    .line 236
    .line 237
    const-string v8, "AFAdRevenueData"

    .line 238
    .line 239
    invoke-virtual {v4, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 240
    .line 241
    .line 242
    move-result-object v4

    .line 243
    invoke-interface {v6, v2, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 244
    .line 245
    .line 246
    :goto_2
    check-cast v4, Ljava/lang/reflect/Method;

    .line 247
    .line 248
    invoke-virtual {v4, v3, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    check-cast v2, Ljava/lang/Boolean;

    .line 253
    .line 254
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 255
    .line 256
    .line 257
    move-result v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 258
    :try_start_4
    invoke-interface {v6, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v4

    .line 262
    if-eqz v4, :cond_3

    .line 263
    .line 264
    goto :goto_3

    .line 265
    :cond_3
    invoke-static {v11, v12}, Landroid/widget/ExpandableListView;->getPackedPositionChild(J)I

    .line 266
    .line 267
    .line 268
    move-result v4

    .line 269
    add-int/lit8 v4, v4, 0x25

    .line 270
    .line 271
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarFadeDuration()I

    .line 272
    .line 273
    .line 274
    move-result v8

    .line 275
    shr-int/lit8 v8, v8, 0x10

    .line 276
    .line 277
    rsub-int/lit8 v8, v8, 0x32

    .line 278
    .line 279
    invoke-static {}, Landroid/view/ViewConfiguration;->getPressedStateDuration()I

    .line 280
    .line 281
    .line 282
    move-result v11

    .line 283
    shr-int/lit8 v11, v11, 0x10

    .line 284
    .line 285
    int-to-char v11, v11

    .line 286
    invoke-static {v4, v8, v11}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v4

    .line 290
    check-cast v4, Ljava/lang/Class;

    .line 291
    .line 292
    const-string v8, "getRevenue"

    .line 293
    .line 294
    invoke-virtual {v4, v8, v10}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 295
    .line 296
    .line 297
    move-result-object v4

    .line 298
    invoke-interface {v6, v0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 299
    .line 300
    .line 301
    :goto_3
    check-cast v4, Ljava/lang/reflect/Method;

    .line 302
    .line 303
    invoke-virtual {v4, v3, v10}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v0

    .line 307
    check-cast v0, Ljava/lang/Boolean;

    .line 308
    .line 309
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 310
    .line 311
    .line 312
    move-result v5
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 313
    :try_start_5
    invoke-virtual/range {p3 .. p3}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    const-string v3, "/"

    .line 318
    .line 319
    invoke-virtual {v0, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    if-eqz v2, :cond_8

    .line 324
    .line 325
    array-length v2, v0

    .line 326
    const/4 v3, 0x3

    .line 327
    if-ne v2, v3, :cond_8

    .line 328
    .line 329
    aget-object v2, v0, v9

    .line 330
    .line 331
    iput-object v2, v1, Lcom/appsflyer/internal/AFf1cSDK;->copy:Ljava/lang/String;

    .line 332
    .line 333
    aget-object v0, v0, v7

    .line 334
    .line 335
    iput-object v0, v1, Lcom/appsflyer/internal/AFf1cSDK;->equals:Ljava/lang/String;

    .line 336
    .line 337
    invoke-virtual/range {p3 .. p3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    iput-object v0, v1, Lcom/appsflyer/internal/AFf1cSDK;->hashCode:Ljava/lang/String;

    .line 342
    .line 343
    goto :goto_5

    .line 344
    :catch_0
    move-exception v0

    .line 345
    goto :goto_4

    .line 346
    :catchall_0
    move-exception v0

    .line 347
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    if-eqz v2, :cond_4

    .line 352
    .line 353
    throw v2

    .line 354
    :cond_4
    throw v0

    .line 355
    :catchall_1
    move-exception v0

    .line 356
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 357
    .line 358
    .line 359
    move-result-object v2

    .line 360
    if-eqz v2, :cond_5

    .line 361
    .line 362
    throw v2

    .line 363
    :cond_5
    throw v0

    .line 364
    :catchall_2
    move-exception v0

    .line 365
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 366
    .line 367
    .line 368
    move-result-object v2

    .line 369
    if-eqz v2, :cond_6

    .line 370
    .line 371
    throw v2

    .line 372
    :cond_6
    throw v0

    .line 373
    :catchall_3
    move-exception v0

    .line 374
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    if-eqz v2, :cond_7

    .line 379
    .line 380
    throw v2

    .line 381
    :cond_7
    throw v0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 382
    :goto_4
    const-string v2, "OneLinkValidator: reflection init failed"

    .line 383
    .line 384
    invoke-static {v2, v0}, Lcom/appsflyer/AFLogger;->afErrorLogForExcManagerOnly(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 385
    .line 386
    .line 387
    :cond_8
    :goto_5
    iput-boolean v5, v1, Lcom/appsflyer/internal/AFf1cSDK;->toString:Z

    .line 388
    .line 389
    return-void
.end method


# virtual methods
.method public final AFAdRevenueData(Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Lcom/appsflyer/internal/AFe1rSDK<",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1cSDK;->copydefault:Lcom/appsflyer/internal/AFe1sSDK;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1cSDK;->copy:Ljava/lang/String;

    .line 4
    .line 5
    iget-object v2, p0, Lcom/appsflyer/internal/AFf1cSDK;->equals:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1cSDK;->AFKeystoreWrapper:Ljava/util/UUID;

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2, p0, p1}, Lcom/appsflyer/internal/AFe1sSDK;->getMediationNetwork(Ljava/lang/String;Ljava/lang/String;Ljava/util/UUID;Ljava/lang/String;)Lcom/appsflyer/internal/AFe1rSDK;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public final AFAdRevenueData()Z
    .locals 0

    .line 14
    const/4 p0, 0x0

    return p0
.end method

.method public final a_()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final component1()Lcom/appsflyer/attribution/AppsFlyerRequestListener;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    const/4 p0, 0x0

    return-object p0
.end method

.method public final copy()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1cSDK;->copy:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1cSDK;->equals:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1cSDK;->copy:Ljava/lang/String;

    .line 18
    .line 19
    const-string v0, "app"

    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method

.method public final copydefault()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/appsflyer/internal/AFf1cSDK;->toString:Z

    .line 2
    .line 3
    return p0
.end method

.method public final equals()Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public final getCurrencyIso4217Code()V
    .locals 4

    .line 1
    invoke-super {p0}, Lcom/appsflyer/internal/AFf1oSDK;->getCurrencyIso4217Code()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/appsflyer/internal/AFf1cSDK;->component3:Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;

    .line 5
    .line 6
    if-eqz v0, :cond_5

    .line 7
    .line 8
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1wSDK;->getMediationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 9
    .line 10
    sget-object v2, Lcom/appsflyer/internal/AFe1dSDK;->getMonetizationNetwork:Lcom/appsflyer/internal/AFe1dSDK;

    .line 11
    .line 12
    if-ne v1, v2, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Lcom/appsflyer/internal/AFf1oSDK;->component1:Lcom/appsflyer/internal/AFe1kSDK;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->getBody()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ljava/util/Map;

    .line 23
    .line 24
    invoke-interface {v0, p0}, Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;->getMonetizationNetwork(Ljava/util/Map;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-virtual {p0}, Lcom/appsflyer/internal/AFf1wSDK;->component2()Ljava/lang/Throwable;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    instance-of v2, v1, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    .line 33
    .line 34
    const-string v3, "Can\'t get OneLink data"

    .line 35
    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    check-cast v1, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/appsflyer/internal/components/network/http/exceptions/ParsingException;->getRawResponse()Lcom/appsflyer/internal/AFe1kSDK;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v1}, Lcom/appsflyer/internal/AFe1kSDK;->isSuccessful()Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    const-string p0, "Can\'t parse one link data"

    .line 51
    .line 52
    invoke-interface {v0, p0}, Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;->getRevenue(Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_1
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1cSDK;->hashCode:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz p0, :cond_2

    .line 59
    .line 60
    move-object v3, p0

    .line 61
    :cond_2
    invoke-interface {v0, v3}, Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;->getRevenue(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_3
    iget-object p0, p0, Lcom/appsflyer/internal/AFf1cSDK;->hashCode:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_4

    .line 68
    .line 69
    move-object v3, p0

    .line 70
    :cond_4
    invoke-interface {v0, v3}, Lcom/appsflyer/internal/AFf1cSDK$AFa1zSDK;->getRevenue(Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    :cond_5
    return-void
.end method

.method public final getRevenue()J
    .locals 2

    const-wide/16 v0, 0xbb8

    return-wide v0
.end method
