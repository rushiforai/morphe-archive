.class public Ll/xnk0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String;

.field public static b:Ljava/lang/String;

.field public static c:Ljava/lang/String;

.field public static d:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x7

    .line 2
    new-array v0, v0, [B

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/xnk0;->a:Ljava/lang/String;

    .line 12
    .line 13
    const/16 v0, 0x8

    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    fill-array-data v0, :array_1

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Ll/xnk0;->b:Ljava/lang/String;

    .line 25
    .line 26
    const/16 v0, 0x9

    .line 27
    .line 28
    new-array v0, v0, [B

    .line 29
    .line 30
    fill-array-data v0, :array_2

    .line 31
    .line 32
    .line 33
    invoke-static {v0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    sput-object v0, Ll/xnk0;->c:Ljava/lang/String;

    .line 38
    .line 39
    const/4 v0, 0x0

    .line 40
    sput-object v0, Ll/xnk0;->d:Ljava/lang/String;

    .line 41
    .line 42
    return-void

    .line 43
    :array_0
    .array-data 1
        0x63t
        0x25t
        0x5et
        0x59t
        0x7t
        0xft
        0x57t
    .end array-data

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    :array_1
    .array-data 1
        0x44t
        0x3t
        0x42t
        0x43t
        0x25t
        0x7t
        0x44t
        0x7t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    :array_2
    .array-data 1
        0x44t
        0x3t
        0x42t
        0x43t
        0x25t
        0x7t
        0x44t
        0x7t
        0x3t
    .end array-data
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

.method public static a(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;
    .locals 11

    .line 1
    invoke-static {p0}, Ll/fiw;->b(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ll/e2j0;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-static {p0}, Ll/nr60;->a(Landroid/content/Context;)I

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    sput-object p1, Ll/xnk0;->d:Ljava/lang/String;

    .line 13
    .line 14
    sget-object p1, Ll/xnk0;->a:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v2, Ll/xnk0;->c:Ljava/lang/String;

    .line 17
    .line 18
    invoke-static {p1, v2}, Ll/f4f0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p0, v0}, Ll/pzd;->e(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    const/16 v3, 0x6b

    .line 31
    .line 32
    if-nez v2, :cond_0

    .line 33
    .line 34
    new-instance v2, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1, v3}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-direct {v2, p1}, Ljava/lang/String;-><init>([B)V

    .line 45
    .line 46
    .line 47
    move-object v1, v2

    .line 48
    goto :goto_0

    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto/16 :goto_5

    .line 51
    .line 52
    :cond_0
    :goto_0
    invoke-static {v1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    const/4 v2, 0x7

    .line 57
    if-nez p1, :cond_1

    .line 58
    .line 59
    new-array p1, v2, [B

    .line 60
    .line 61
    fill-array-data p1, :array_0

    .line 62
    .line 63
    .line 64
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_4

    .line 73
    .line 74
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    const/16 v4, 0x65

    .line 79
    .line 80
    invoke-static {p1, v4}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    invoke-static {p1}, Ll/yhw;->a([B)Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    new-instance v4, Ljava/util/HashMap;

    .line 89
    .line 90
    invoke-direct {v4}, Ljava/util/HashMap;-><init>()V

    .line 91
    .line 92
    .line 93
    const/4 v5, 0x4

    .line 94
    new-array v5, v5, [B

    .line 95
    .line 96
    fill-array-data v5, :array_1

    .line 97
    .line 98
    .line 99
    invoke-static {v5}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v5

    .line 103
    invoke-interface {v4, v5, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    const/16 p1, 0x3f

    .line 107
    .line 108
    new-array p1, p1, [B

    .line 109
    .line 110
    fill-array-data p1, :array_2

    .line 111
    .line 112
    .line 113
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 114
    .line 115
    .line 116
    move-result-object p1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 117
    const/4 v5, 0x0

    .line 118
    move v6, v5

    .line 119
    :goto_1
    const/4 v7, 0x3

    .line 120
    if-ge v6, v7, :cond_4

    .line 121
    .line 122
    :try_start_1
    invoke-static {p1, v0, v4}, Ll/lml;->a(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v7

    .line 126
    invoke-static {v7}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 127
    .line 128
    .line 129
    move-result v8

    .line 130
    if-eqz v8, :cond_2

    .line 131
    .line 132
    goto :goto_3

    .line 133
    :cond_2
    const/4 v8, 0x1

    .line 134
    new-array v9, v8, [B

    .line 135
    .line 136
    const/16 v10, 0x4b

    .line 137
    .line 138
    aput-byte v10, v9, v5

    .line 139
    .line 140
    invoke-static {v9}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v9

    .line 144
    invoke-virtual {v7, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 145
    .line 146
    .line 147
    move-result v9

    .line 148
    if-eqz v9, :cond_3

    .line 149
    .line 150
    new-array v8, v8, [B

    .line 151
    .line 152
    const/16 v9, 0x4d

    .line 153
    .line 154
    aput-byte v9, v8, v5

    .line 155
    .line 156
    invoke-static {v8}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v8

    .line 160
    invoke-virtual {v7, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 161
    .line 162
    .line 163
    move-result v8

    .line 164
    if-eqz v8, :cond_3

    .line 165
    .line 166
    new-instance v8, Lorg/json/JSONObject;

    .line 167
    .line 168
    invoke-direct {v8, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    new-array v7, v2, [B

    .line 172
    .line 173
    fill-array-data v7, :array_3

    .line 174
    .line 175
    .line 176
    invoke-static {v7}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v7

    .line 180
    invoke-virtual {v8, v7}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    if-nez v7, :cond_4

    .line 185
    .line 186
    add-int/lit8 v6, v6, 0x1

    .line 187
    .line 188
    goto :goto_1

    .line 189
    :catch_1
    move-exception p1

    .line 190
    goto :goto_2

    .line 191
    :cond_3
    new-instance p1, Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v7}, Ljava/lang/String;->getBytes()[B

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    invoke-static {v0, v3}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-direct {p1, v0}, Ljava/lang/String;-><init>([B)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 202
    .line 203
    .line 204
    :try_start_2
    sget-object v0, Ll/xnk0;->a:Ljava/lang/String;

    .line 205
    .line 206
    sget-object v1, Ll/xnk0;->c:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {v0, v1, v7}, Ll/f4f0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 209
    .line 210
    .line 211
    move-object v1, p1

    .line 212
    goto :goto_3

    .line 213
    :catch_2
    move-exception v0

    .line 214
    move-object v1, p1

    .line 215
    move-object p1, v0

    .line 216
    :goto_2
    :try_start_3
    invoke-static {p1}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 217
    .line 218
    .line 219
    :cond_4
    :goto_3
    sget-object p1, Ll/xnk0;->a:Ljava/lang/String;

    .line 220
    .line 221
    sget-object v0, Ll/xnk0;->b:Ljava/lang/String;

    .line 222
    .line 223
    invoke-static {p1, v0}, Ll/f4f0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    new-instance v0, Ljava/lang/String;

    .line 228
    .line 229
    invoke-virtual {p0}, Ljava/lang/String;->getBytes()[B

    .line 230
    .line 231
    .line 232
    move-result-object p0

    .line 233
    const/16 v3, 0x6c

    .line 234
    .line 235
    invoke-static {p0, v3}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    invoke-direct {v0, p0}, Ljava/lang/String;-><init>([B)V

    .line 240
    .line 241
    .line 242
    invoke-static {p1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 243
    .line 244
    .line 245
    move-result p0

    .line 246
    if-eqz p0, :cond_5

    .line 247
    .line 248
    invoke-static {v0}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 249
    .line 250
    .line 251
    move-result p0

    .line 252
    if-nez p0, :cond_7

    .line 253
    .line 254
    new-array p0, v2, [B

    .line 255
    .line 256
    fill-array-data p0, :array_4

    .line 257
    .line 258
    .line 259
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object p0

    .line 263
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 264
    .line 265
    .line 266
    move-result p0

    .line 267
    if-nez p0, :cond_7

    .line 268
    .line 269
    sget-object p0, Ll/xnk0;->a:Ljava/lang/String;

    .line 270
    .line 271
    sget-object p1, Ll/xnk0;->b:Ljava/lang/String;

    .line 272
    .line 273
    invoke-static {p0, p1, v0}, Ll/f4f0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 274
    .line 275
    .line 276
    goto :goto_4

    .line 277
    :cond_5
    new-instance p0, Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 280
    .line 281
    .line 282
    move-result-object p1

    .line 283
    const/16 v3, 0x6d

    .line 284
    .line 285
    invoke-static {p1, v3}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([B)V

    .line 290
    .line 291
    .line 292
    invoke-static {p0}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-nez p1, :cond_6

    .line 297
    .line 298
    new-array p1, v2, [B

    .line 299
    .line 300
    fill-array-data p1, :array_5

    .line 301
    .line 302
    .line 303
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object p1

    .line 307
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result p0

    .line 311
    if-eqz p0, :cond_7

    .line 312
    .line 313
    :cond_6
    invoke-static {v0}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 314
    .line 315
    .line 316
    move-result p0

    .line 317
    if-nez p0, :cond_7

    .line 318
    .line 319
    new-array p0, v2, [B

    .line 320
    .line 321
    fill-array-data p0, :array_6

    .line 322
    .line 323
    .line 324
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 329
    .line 330
    .line 331
    move-result p0

    .line 332
    if-nez p0, :cond_7

    .line 333
    .line 334
    sget-object p0, Ll/xnk0;->a:Ljava/lang/String;

    .line 335
    .line 336
    sget-object p1, Ll/xnk0;->b:Ljava/lang/String;

    .line 337
    .line 338
    invoke-static {p0, p1, v0}, Ll/f4f0;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Z

    .line 339
    .line 340
    .line 341
    :cond_7
    :goto_4
    invoke-static {v1}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 342
    .line 343
    .line 344
    move-result p0

    .line 345
    if-nez p0, :cond_8

    .line 346
    .line 347
    new-array p0, v2, [B

    .line 348
    .line 349
    fill-array-data p0, :array_7

    .line 350
    .line 351
    .line 352
    invoke-static {p0}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    invoke-virtual {v1, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 357
    .line 358
    .line 359
    move-result p0

    .line 360
    if-eqz p0, :cond_a

    .line 361
    .line 362
    :cond_8
    new-instance p0, Ljava/lang/String;

    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    .line 365
    .line 366
    .line 367
    move-result-object p1

    .line 368
    const/16 v0, 0x64

    .line 369
    .line 370
    invoke-static {p1, v0}, Lcom/momosec/mmuid/android/Native;->doCommand([BI)[B

    .line 371
    .line 372
    .line 373
    move-result-object p1

    .line 374
    invoke-direct {p0, p1}, Ljava/lang/String;-><init>([B)V

    .line 375
    .line 376
    .line 377
    invoke-static {p0}, Ll/m8g0;->b(Ljava/lang/String;)Z

    .line 378
    .line 379
    .line 380
    move-result p1

    .line 381
    if-eqz p1, :cond_9

    .line 382
    .line 383
    new-array p1, v2, [B

    .line 384
    .line 385
    fill-array-data p1, :array_8

    .line 386
    .line 387
    .line 388
    invoke-static {p1}, Ll/hmw;->a([B)Ljava/lang/String;

    .line 389
    .line 390
    .line 391
    move-result-object p1

    .line 392
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result p1
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 396
    if-nez p1, :cond_a

    .line 397
    .line 398
    :cond_9
    move-object v1, p0

    .line 399
    goto :goto_6

    .line 400
    :goto_5
    invoke-static {p0}, Ll/lmw;->a(Ljava/lang/Throwable;)V

    .line 401
    .line 402
    .line 403
    :cond_a
    :goto_6
    return-object v1

    .line 404
    nop

    .line 405
    :array_0
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    :array_1
    .array-data 1
        0x5dt
        0x1ct
        0x58t
        0x47t
    .end array-data

    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    :array_2
    .array-data 1
        0x58t
        0x12t
        0x45t
        0x47t
        0x12t
        0x5ct
        0x1ft
        0x49t
        0x50t
        0x47t
        0x11t
        0x4bt
        0x5ct
        0x9t
        0x56t
        0x1at
        0xdt
        0x7t
        0x52t
        0x48t
        0x45t
        0x56t
        0xft
        0x12t
        0x51t
        0x8t
        0x50t
        0x47t
        0x11t
        0x48t
        0x53t
        0x9t
        0x5ct
        0x18t
        0x17t
        0x57t
        0x1ft
        0xat
        0x5et
        0x50t
        0x4et
        0x13t
        0x40t
        0xat
        0x5et
        0x56t
        0x5t
        0x39t
        0x59t
        0x8t
        0x57t
        0x58t
        0x4et
        0x15t
        0x45t
        0x16t
        0x41t
        0x5bt
        0x4t
        0xbt
        0x55t
        0x8t
        0x45t
    .end array-data

    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    .line 444
    .line 445
    .line 446
    .line 447
    .line 448
    .line 449
    .line 450
    .line 451
    .line 452
    .line 453
    .line 454
    .line 455
    :array_3
    .array-data 1
        0x55t
        0x14t
        0x43t
        0x54t
        0xet
        0x2t
        0x55t
    .end array-data

    .line 456
    .line 457
    .line 458
    .line 459
    .line 460
    .line 461
    .line 462
    .line 463
    :array_4
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 464
    .line 465
    .line 466
    .line 467
    .line 468
    .line 469
    .line 470
    .line 471
    :array_5
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 472
    .line 473
    .line 474
    .line 475
    .line 476
    .line 477
    .line 478
    .line 479
    :array_6
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 480
    .line 481
    .line 482
    .line 483
    .line 484
    .line 485
    .line 486
    .line 487
    :array_7
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data

    .line 488
    .line 489
    .line 490
    .line 491
    .line 492
    .line 493
    .line 494
    .line 495
    :array_8
    .array-data 1
        0x59t
        0x8t
        0x47t
        0x56t
        0xdt
        0xft
        0x54t
    .end array-data
.end method
