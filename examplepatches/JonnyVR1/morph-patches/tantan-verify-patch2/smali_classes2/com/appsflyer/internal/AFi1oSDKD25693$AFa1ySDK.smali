.class public final Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/google/android/gms/tasks/OnCompleteListener;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/google/android/gms/tasks/OnCompleteListener<",
        "Lcom/google/android/play/core/integrity/IntegrityTokenResponse;",
        ">;"
    }
.end annotation


# instance fields
.field private synthetic getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1mSDK;

.field private final getRevenue:J


# direct methods
.method public constructor <init>(Lcom/appsflyer/internal/AFi1mSDK;J)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J)V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1mSDK;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-wide p2, p0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getRevenue:J

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final onComplete(Lcom/google/android/gms/tasks/Task;)V
    .locals 19
    .param p1    # Lcom/google/android/gms/tasks/Task;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/android/gms/tasks/Task<",
            "Lcom/google/android/play/core/integrity/IntegrityTokenResponse;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const v1, -0x62a6edf0

    .line 4
    .line 5
    .line 6
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    const-class v2, Ljava/lang/String;

    .line 11
    .line 12
    const v3, 0x2f0c6852

    .line 13
    .line 14
    .line 15
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 16
    .line 17
    .line 18
    move-result-object v3

    .line 19
    const v4, 0x4d5a8115    # 2.2911829E8f

    .line 20
    .line 21
    .line 22
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 27
    .line 28
    .line 29
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->p()Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    const-wide/16 v6, 0x0

    .line 34
    .line 35
    const/4 v8, 0x1

    .line 36
    const/4 v9, 0x2

    .line 37
    const-string v10, ""

    .line 38
    .line 39
    const/4 v11, 0x0

    .line 40
    const/4 v12, 0x0

    .line 41
    if-eqz v5, :cond_0

    .line 42
    .line 43
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->l()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    check-cast v4, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;

    .line 48
    .line 49
    invoke-virtual {v4}, Lcom/google/android/play/core/integrity/IntegrityTokenResponse;->token()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v4

    .line 53
    move-wide/from16 v16, v6

    .line 54
    .line 55
    move/from16 v18, v8

    .line 56
    .line 57
    move-object v5, v12

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    iget-object v5, v0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1mSDK;

    .line 60
    .line 61
    invoke-virtual/range {p1 .. p1}, Lcom/google/android/gms/tasks/Task;->k()Ljava/lang/Exception;

    .line 62
    .line 63
    .line 64
    move-result-object v13

    .line 65
    :try_start_0
    new-array v14, v9, [Ljava/lang/Object;

    .line 66
    .line 67
    aput-object v13, v14, v8

    .line 68
    .line 69
    aput-object v5, v14, v11

    .line 70
    .line 71
    sget-object v5, Lcom/appsflyer/internal/AFc1gSDK;->registerClient:Ljava/util/Map;

    .line 72
    .line 73
    invoke-interface {v5, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v13

    .line 77
    if-eqz v13, :cond_1

    .line 78
    .line 79
    move-wide/from16 v16, v6

    .line 80
    .line 81
    move/from16 v18, v8

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_1
    invoke-static {}, Landroid/view/ViewConfiguration;->getWindowTouchSlop()I

    .line 85
    .line 86
    .line 87
    move-result v13

    .line 88
    shr-int/lit8 v13, v13, 0x8

    .line 89
    .line 90
    add-int/lit16 v13, v13, 0x9f

    .line 91
    .line 92
    invoke-static {}, Landroid/os/Process;->getElapsedCpuTime()J

    .line 93
    .line 94
    .line 95
    move-result-wide v15

    .line 96
    cmp-long v15, v15, v6

    .line 97
    .line 98
    rsub-int/lit8 v15, v15, 0x26

    .line 99
    .line 100
    move-wide/from16 v16, v6

    .line 101
    .line 102
    invoke-static {v11}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 103
    .line 104
    .line 105
    move-result v6

    .line 106
    int-to-char v6, v6

    .line 107
    invoke-static {v13, v15, v6}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v6

    .line 111
    check-cast v6, Ljava/lang/Class;

    .line 112
    .line 113
    const-string v7, "getCurrencyIso4217Code"

    .line 114
    .line 115
    invoke-static {v11}, Landroid/graphics/ImageFormat;->getBitsPerPixel(I)I

    .line 116
    .line 117
    .line 118
    move-result v13

    .line 119
    rsub-int v13, v13, 0x9e

    .line 120
    .line 121
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    .line 122
    .line 123
    .line 124
    move-result v15

    .line 125
    shr-int/lit8 v15, v15, 0x8

    .line 126
    .line 127
    rsub-int/lit8 v15, v15, 0x25

    .line 128
    .line 129
    move/from16 v18, v8

    .line 130
    .line 131
    invoke-static {v10, v10}, Landroid/text/TextUtils;->indexOf(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)I

    .line 132
    .line 133
    .line 134
    move-result v8

    .line 135
    int-to-char v8, v8

    .line 136
    invoke-static {v13, v15, v8}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 137
    .line 138
    .line 139
    move-result-object v8

    .line 140
    check-cast v8, Ljava/lang/Class;

    .line 141
    .line 142
    const-class v13, Ljava/lang/Exception;

    .line 143
    .line 144
    filled-new-array {v8, v13}, [Ljava/lang/Class;

    .line 145
    .line 146
    .line 147
    move-result-object v8

    .line 148
    invoke-virtual {v6, v7, v8}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 149
    .line 150
    .line 151
    move-result-object v13

    .line 152
    invoke-interface {v5, v4, v13}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 153
    .line 154
    .line 155
    :goto_0
    check-cast v13, Ljava/lang/reflect/Method;

    .line 156
    .line 157
    invoke-virtual {v13, v12, v14}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 161
    move-object v5, v4

    .line 162
    move-object v4, v12

    .line 163
    :goto_1
    iget-object v6, v0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1mSDK;

    .line 164
    .line 165
    iget-wide v7, v0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getRevenue:J

    .line 166
    .line 167
    const/4 v13, 0x4

    .line 168
    :try_start_1
    new-array v13, v13, [Ljava/lang/Object;

    .line 169
    .line 170
    const/4 v14, 0x3

    .line 171
    aput-object v5, v13, v14

    .line 172
    .line 173
    aput-object v4, v13, v9

    .line 174
    .line 175
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 176
    .line 177
    .line 178
    move-result-object v4

    .line 179
    aput-object v4, v13, v18

    .line 180
    .line 181
    aput-object v6, v13, v11

    .line 182
    .line 183
    sget-object v4, Lcom/appsflyer/internal/AFc1gSDK;->registerClient:Ljava/util/Map;

    .line 184
    .line 185
    invoke-interface {v4, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 186
    .line 187
    .line 188
    move-result-object v5

    .line 189
    const/4 v6, 0x0

    .line 190
    if-eqz v5, :cond_2

    .line 191
    .line 192
    goto :goto_2

    .line 193
    :cond_2
    invoke-static {v11}, Landroid/os/Process;->getThreadPriority(I)I

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    add-int/lit8 v5, v5, 0x14

    .line 198
    .line 199
    shr-int/lit8 v5, v5, 0x6

    .line 200
    .line 201
    rsub-int v5, v5, 0x9f

    .line 202
    .line 203
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 204
    .line 205
    .line 206
    move-result v7

    .line 207
    shr-int/lit8 v7, v7, 0x10

    .line 208
    .line 209
    add-int/lit8 v7, v7, 0x25

    .line 210
    .line 211
    invoke-static {v10, v11}, Landroid/text/TextUtils;->getOffsetAfter(Ljava/lang/CharSequence;I)I

    .line 212
    .line 213
    .line 214
    move-result v8

    .line 215
    int-to-char v8, v8

    .line 216
    invoke-static {v5, v7, v8}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 217
    .line 218
    .line 219
    move-result-object v5

    .line 220
    check-cast v5, Ljava/lang/Class;

    .line 221
    .line 222
    const-string v7, "getRevenue"

    .line 223
    .line 224
    invoke-static {}, Landroid/view/ViewConfiguration;->getDoubleTapTimeout()I

    .line 225
    .line 226
    .line 227
    move-result v8

    .line 228
    shr-int/lit8 v8, v8, 0x10

    .line 229
    .line 230
    rsub-int v8, v8, 0x9f

    .line 231
    .line 232
    invoke-static {v11}, Landroid/graphics/Color;->alpha(I)I

    .line 233
    .line 234
    .line 235
    move-result v9

    .line 236
    rsub-int/lit8 v9, v9, 0x25

    .line 237
    .line 238
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollFriction()F

    .line 239
    .line 240
    .line 241
    move-result v10

    .line 242
    cmpl-float v10, v10, v6

    .line 243
    .line 244
    add-int/lit8 v10, v10, -0x1

    .line 245
    .line 246
    int-to-char v10, v10

    .line 247
    invoke-static {v8, v9, v10}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v8

    .line 251
    check-cast v8, Ljava/lang/Class;

    .line 252
    .line 253
    sget-object v9, Ljava/lang/Long;->TYPE:Ljava/lang/Class;

    .line 254
    .line 255
    filled-new-array {v8, v9, v2, v2}, [Ljava/lang/Class;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    invoke-virtual {v5, v7, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 260
    .line 261
    .line 262
    move-result-object v5

    .line 263
    invoke-interface {v4, v3, v5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    :goto_2
    check-cast v5, Ljava/lang/reflect/Method;

    .line 267
    .line 268
    invoke-virtual {v5, v12, v13}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 269
    .line 270
    .line 271
    iget-object v0, v0, Lcom/appsflyer/internal/AFi1oSDKD25693$AFa1ySDK;->getCurrencyIso4217Code:Lcom/appsflyer/internal/AFi1mSDK;

    .line 272
    .line 273
    :try_start_2
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v2

    .line 281
    if-eqz v2, :cond_3

    .line 282
    .line 283
    goto :goto_3

    .line 284
    :cond_3
    invoke-static {v6, v6}, Landroid/graphics/PointF;->length(FF)F

    .line 285
    .line 286
    .line 287
    move-result v2

    .line 288
    cmpl-float v2, v2, v6

    .line 289
    .line 290
    add-int/lit16 v2, v2, 0x9f

    .line 291
    .line 292
    invoke-static {}, Landroid/view/ViewConfiguration;->getTouchSlop()I

    .line 293
    .line 294
    .line 295
    move-result v3

    .line 296
    shr-int/lit8 v3, v3, 0x8

    .line 297
    .line 298
    add-int/lit8 v3, v3, 0x25

    .line 299
    .line 300
    invoke-static {v11, v11}, Landroid/view/View;->resolveSize(II)I

    .line 301
    .line 302
    .line 303
    move-result v5

    .line 304
    int-to-char v5, v5

    .line 305
    invoke-static {v2, v3, v5}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    check-cast v2, Ljava/lang/Class;

    .line 310
    .line 311
    const-string v3, "AFAdRevenueData"

    .line 312
    .line 313
    invoke-static {}, Landroid/view/KeyEvent;->getModifierMetaStateMask()I

    .line 314
    .line 315
    .line 316
    move-result v5

    .line 317
    int-to-byte v5, v5

    .line 318
    rsub-int v5, v5, 0x9e

    .line 319
    .line 320
    invoke-static {}, Landroid/view/ViewConfiguration;->getScrollBarSize()I

    .line 321
    .line 322
    .line 323
    move-result v6

    .line 324
    shr-int/lit8 v6, v6, 0x8

    .line 325
    .line 326
    add-int/lit8 v6, v6, 0x25

    .line 327
    .line 328
    invoke-static {}, Landroid/view/ViewConfiguration;->getGlobalActionKeyTimeout()J

    .line 329
    .line 330
    .line 331
    move-result-wide v7

    .line 332
    cmp-long v7, v7, v16

    .line 333
    .line 334
    add-int/lit8 v7, v7, -0x1

    .line 335
    .line 336
    int-to-char v7, v7

    .line 337
    invoke-static {v5, v6, v7}, Lcom/appsflyer/internal/AFc1gSDK;->getCurrencyIso4217Code(IIC)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v5

    .line 341
    check-cast v5, Ljava/lang/Class;

    .line 342
    .line 343
    filled-new-array {v5}, [Ljava/lang/Class;

    .line 344
    .line 345
    .line 346
    move-result-object v5

    .line 347
    invoke-virtual {v2, v3, v5}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    .line 348
    .line 349
    .line 350
    move-result-object v2

    .line 351
    invoke-interface {v4, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    :goto_3
    check-cast v2, Ljava/lang/reflect/Method;

    .line 355
    .line 356
    invoke-virtual {v2, v12, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    check-cast v0, Ljava/util/concurrent/CountDownLatch;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 361
    .line 362
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 363
    .line 364
    .line 365
    return-void

    .line 366
    :catchall_0
    move-exception v0

    .line 367
    invoke-virtual {v0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    .line 368
    .line 369
    .line 370
    move-result-object v1

    .line 371
    if-eqz v1, :cond_4

    .line 372
    .line 373
    throw v1

    .line 374
    :cond_4
    throw v0
.end method
