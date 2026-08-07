.class public Ll/tj70;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a(J)Ljava/lang/String;
    .locals 3

    .line 1
    new-instance v0, Ljava/util/Date;

    .line 2
    .line 3
    const-wide/16 v1, 0x3e8

    .line 4
    .line 5
    mul-long/2addr p0, v1

    .line 6
    invoke-direct {v0, p0, p1}, Ljava/util/Date;-><init>(J)V

    .line 7
    .line 8
    .line 9
    new-instance p0, Ljava/text/SimpleDateFormat;

    .line 10
    .line 11
    const/16 p1, 0x13

    .line 12
    .line 13
    new-array p1, p1, [B

    .line 14
    .line 15
    fill-array-data p1, :array_0

    .line 16
    .line 17
    .line 18
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v1, Ljava/util/Locale;->US:Ljava/util/Locale;

    .line 23
    .line 24
    invoke-direct {p0, p1, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 25
    .line 26
    .line 27
    const/16 p1, 0xd

    .line 28
    .line 29
    new-array p1, p1, [B

    .line 30
    .line 31
    fill-array-data p1, :array_1

    .line 32
    .line 33
    .line 34
    invoke-static {p1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-static {p1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p0, p1}, Ljava/text/DateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p0, v0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    return-object p0

    .line 50
    nop

    .line 51
    :array_0
    .array-data 1
        0x49t
        0x1ft
        0x48t
        0x4et
        0x4ct
        0x2bt
        0x7dt
        0x4bt
        0x55t
        0x53t
        0x41t
        0x2et
        0x78t
        0x5ct
        0x5ct
        0x5at
        0x5bt
        0x15t
        0x43t
    .end array-data

    .line 52
    .line 53
    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    .line 59
    .line 60
    .line 61
    .line 62
    .line 63
    .line 64
    .line 65
    :array_1
    .array-data 1
        0x71t
        0x15t
        0x58t
        0x56t
        0x4et
        0x35t
        0x58t
        0x7t
        0x5ft
        0x50t
        0x9t
        0x7t
        0x59t
    .end array-data
.end method

.method private static b(Lorg/json/JSONObject;)Lorg/json/JSONObject;
    .locals 2

    .line 1
    const/16 v0, 0xb

    .line 2
    .line 3
    :try_start_0
    new-array v0, v0, [B

    .line 4
    .line 5
    fill-array-data v0, :array_0

    .line 6
    .line 7
    .line 8
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const/4 v1, -0x1

    .line 13
    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    return-object p0

    .line 17
    :catch_0
    move-exception p0

    .line 18
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 19
    .line 20
    .line 21
    const/4 p0, 0x0

    .line 22
    return-object p0

    :array_0
    .array-data 1
        0x40t
        0xet
        0x5et
        0x43t
        0xet
        0x39t
        0x53t
        0x9t
        0x44t
        0x59t
        0x15t
    .end array-data
.end method

.method private static c(Landroid/database/Cursor;)Lorg/json/JSONObject;
    .locals 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lorg/json/JSONException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    const/4 v1, 0x3

    .line 4
    new-array v1, v1, [B

    .line 5
    .line 6
    fill-array-data v1, :array_0

    .line 7
    .line 8
    .line 9
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-interface {v0, v1}, Landroid/database/Cursor;->getLong(I)J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    const/16 v3, 0xd

    .line 22
    .line 23
    new-array v3, v3, [B

    .line 24
    .line 25
    fill-array-data v3, :array_1

    .line 26
    .line 27
    .line 28
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v3

    .line 32
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 33
    .line 34
    .line 35
    move-result v3

    .line 36
    invoke-interface {v0, v3}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/16 v4, 0xa

    .line 41
    .line 42
    new-array v5, v4, [B

    .line 43
    .line 44
    fill-array-data v5, :array_2

    .line 45
    .line 46
    .line 47
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v5

    .line 51
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v5

    .line 55
    invoke-interface {v0, v5}, Landroid/database/Cursor;->getLong(I)J

    .line 56
    .line 57
    .line 58
    move-result-wide v5

    .line 59
    const/4 v7, 0x5

    .line 60
    new-array v8, v7, [B

    .line 61
    .line 62
    fill-array-data v8, :array_3

    .line 63
    .line 64
    .line 65
    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v8

    .line 69
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v8

    .line 73
    invoke-interface {v0, v8}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object v8

    .line 77
    new-array v9, v7, [B

    .line 78
    .line 79
    fill-array-data v9, :array_4

    .line 80
    .line 81
    .line 82
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v9

    .line 86
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v9

    .line 90
    invoke-interface {v0, v9}, Landroid/database/Cursor;->getLong(I)J

    .line 91
    .line 92
    .line 93
    move-result-wide v9

    .line 94
    const/16 v11, 0x9

    .line 95
    .line 96
    new-array v12, v11, [B

    .line 97
    .line 98
    fill-array-data v12, :array_5

    .line 99
    .line 100
    .line 101
    invoke-static {v12}, Ll/riw;->a([B)Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object v12

    .line 105
    invoke-interface {v0, v12}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 106
    .line 107
    .line 108
    move-result v12

    .line 109
    invoke-interface {v0, v12}, Landroid/database/Cursor;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v12

    .line 113
    new-array v13, v7, [B

    .line 114
    .line 115
    fill-array-data v13, :array_6

    .line 116
    .line 117
    .line 118
    invoke-static {v13}, Ll/riw;->a([B)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v13

    .line 122
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v13

    .line 126
    invoke-interface {v0, v13}, Landroid/database/Cursor;->getInt(I)I

    .line 127
    .line 128
    .line 129
    move-result v13

    .line 130
    const/4 v14, 0x6

    .line 131
    new-array v14, v14, [B

    .line 132
    .line 133
    fill-array-data v14, :array_7

    .line 134
    .line 135
    .line 136
    invoke-static {v14}, Ll/riw;->a([B)Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v14

    .line 140
    invoke-interface {v0, v14}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v14

    .line 144
    invoke-interface {v0, v14}, Landroid/database/Cursor;->getInt(I)I

    .line 145
    .line 146
    .line 147
    move-result v14

    .line 148
    const/16 v15, 0xb

    .line 149
    .line 150
    new-array v7, v15, [B

    .line 151
    .line 152
    fill-array-data v7, :array_8

    .line 153
    .line 154
    .line 155
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v7

    .line 159
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getColumnIndexOrThrow(Ljava/lang/String;)I

    .line 160
    .line 161
    .line 162
    move-result v7

    .line 163
    invoke-interface {v0, v7}, Landroid/database/Cursor;->getInt(I)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    invoke-static {v5, v6}, Ll/tj70;->a(J)Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v5

    .line 171
    new-instance v6, Lorg/json/JSONObject;

    .line 172
    .line 173
    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    .line 174
    .line 175
    .line 176
    const/4 v7, 0x2

    .line 177
    new-array v7, v7, [B

    .line 178
    .line 179
    fill-array-data v7, :array_9

    .line 180
    .line 181
    .line 182
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v7

    .line 186
    invoke-virtual {v6, v7, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 187
    .line 188
    .line 189
    const/4 v1, 0x4

    .line 190
    new-array v2, v1, [B

    .line 191
    .line 192
    fill-array-data v2, :array_a

    .line 193
    .line 194
    .line 195
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v2

    .line 199
    invoke-virtual {v6, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 200
    .line 201
    .line 202
    new-array v2, v4, [B

    .line 203
    .line 204
    fill-array-data v2, :array_b

    .line 205
    .line 206
    .line 207
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    invoke-virtual {v6, v2, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 212
    .line 213
    .line 214
    new-array v2, v1, [B

    .line 215
    .line 216
    fill-array-data v2, :array_c

    .line 217
    .line 218
    .line 219
    invoke-static {v2}, Ll/riw;->a([B)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    invoke-virtual {v6, v2, v8}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 224
    .line 225
    .line 226
    new-array v1, v1, [B

    .line 227
    .line 228
    fill-array-data v1, :array_d

    .line 229
    .line 230
    .line 231
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-virtual {v6, v1, v9, v10}, Lorg/json/JSONObject;->put(Ljava/lang/String;J)Lorg/json/JSONObject;

    .line 236
    .line 237
    .line 238
    new-array v1, v11, [B

    .line 239
    .line 240
    fill-array-data v1, :array_e

    .line 241
    .line 242
    .line 243
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v6, v1, v12}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 248
    .line 249
    .line 250
    const/4 v1, 0x5

    .line 251
    new-array v1, v1, [B

    .line 252
    .line 253
    fill-array-data v1, :array_f

    .line 254
    .line 255
    .line 256
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v1

    .line 260
    invoke-virtual {v6, v1, v13}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 261
    .line 262
    .line 263
    const/4 v1, 0x6

    .line 264
    new-array v1, v1, [B

    .line 265
    .line 266
    fill-array-data v1, :array_10

    .line 267
    .line 268
    .line 269
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-virtual {v6, v1, v14}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 274
    .line 275
    .line 276
    new-array v1, v15, [B

    .line 277
    .line 278
    fill-array-data v1, :array_11

    .line 279
    .line 280
    .line 281
    invoke-static {v1}, Ll/riw;->a([B)Ljava/lang/String;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    invoke-virtual {v6, v1, v0}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 286
    .line 287
    .line 288
    return-object v6

    .line 289
    :array_0
    .array-data 1
        0x6ft
        0xft
        0x55t
    .end array-data

    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    :array_1
    .array-data 1
        0x6ft
        0x2t
        0x58t
        0x44t
        0x11t
        0xat
        0x51t
        0x1ft
        0x6et
        0x59t
        0x0t
        0xbt
        0x55t
    .end array-data

    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    nop

    .line 307
    :array_2
    .array-data 1
        0x54t
        0x7t
        0x45t
        0x52t
        0x3et
        0x7t
        0x54t
        0x2t
        0x54t
        0x53t
    .end array-data

    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    nop

    .line 317
    :array_3
    .array-data 1
        0x6ft
        0x2t
        0x50t
        0x43t
        0x0t
    .end array-data

    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    nop

    .line 325
    :array_4
    .array-data 1
        0x6ft
        0x15t
        0x58t
        0x4dt
        0x4t
    .end array-data

    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    nop

    .line 333
    :array_5
    .array-data 1
        0x5dt
        0xft
        0x5ct
        0x52t
        0x3et
        0x12t
        0x49t
        0x16t
        0x54t
    .end array-data

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    nop

    .line 343
    :array_6
    .array-data 1
        0x47t
        0xft
        0x55t
        0x43t
        0x9t
    .end array-data

    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    nop

    .line 351
    :array_7
    .array-data 1
        0x58t
        0x3t
        0x58t
        0x50t
        0x9t
        0x12t
    .end array-data

    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    nop

    .line 359
    :array_8
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 360
    .line 361
    .line 362
    .line 363
    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    :array_9
    .array-data 1
        0x59t
        0x2t
    .end array-data

    .line 370
    .line 371
    .line 372
    .line 373
    .line 374
    nop

    .line 375
    :array_a
    .array-data 1
        0x5et
        0x7t
        0x5ct
        0x52t
    .end array-data

    .line 376
    .line 377
    .line 378
    .line 379
    .line 380
    .line 381
    :array_b
    .array-data 1
        0x54t
        0x7t
        0x45t
        0x52t
        0x3et
        0x7t
        0x54t
        0x2t
        0x54t
        0x53t
    .end array-data

    .line 382
    .line 383
    .line 384
    .line 385
    .line 386
    .line 387
    .line 388
    .line 389
    .line 390
    nop

    .line 391
    :array_c
    .array-data 1
        0x40t
        0x7t
        0x45t
        0x5ft
    .end array-data

    .line 392
    .line 393
    .line 394
    .line 395
    .line 396
    .line 397
    :array_d
    .array-data 1
        0x43t
        0xft
        0x4bt
        0x52t
    .end array-data

    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    :array_e
    .array-data 1
        0x5dt
        0xft
        0x5ct
        0x52t
        0x3et
        0x12t
        0x49t
        0x16t
        0x54t
    .end array-data

    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    nop

    .line 413
    :array_f
    .array-data 1
        0x47t
        0xft
        0x55t
        0x43t
        0x9t
    .end array-data

    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    nop

    .line 421
    :array_10
    .array-data 1
        0x58t
        0x3t
        0x58t
        0x50t
        0x9t
        0x12t
    .end array-data

    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    nop

    .line 429
    :array_11
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data
.end method

.method public static d(Landroid/content/Context;)Lorg/json/JSONObject;
    .locals 19

    .line 1
    new-instance v1, Lorg/json/JSONObject;

    .line 2
    .line 3
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 4
    .line 5
    .line 6
    const/16 v0, 0x28

    .line 7
    .line 8
    new-array v0, v0, [B

    .line 9
    .line 10
    fill-array-data v0, :array_0

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    move-object/from16 v2, p0

    .line 18
    .line 19
    invoke-static {v2, v0}, Ll/or60;->a(Landroid/content/Context;Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    invoke-static {v1}, Ll/tj70;->b(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    return-object v0

    .line 30
    :cond_0
    const/4 v0, 0x3

    .line 31
    new-array v0, v0, [B

    .line 32
    .line 33
    fill-array-data v0, :array_1

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    const/16 v0, 0xd

    .line 41
    .line 42
    new-array v0, v0, [B

    .line 43
    .line 44
    fill-array-data v0, :array_2

    .line 45
    .line 46
    .line 47
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    const/16 v0, 0xa

    .line 52
    .line 53
    new-array v5, v0, [B

    .line 54
    .line 55
    fill-array-data v5, :array_3

    .line 56
    .line 57
    .line 58
    invoke-static {v5}, Ll/riw;->a([B)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v5

    .line 62
    const/4 v6, 0x5

    .line 63
    new-array v6, v6, [B

    .line 64
    .line 65
    fill-array-data v6, :array_4

    .line 66
    .line 67
    .line 68
    invoke-static {v6}, Ll/riw;->a([B)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v6

    .line 72
    const/4 v7, 0x5

    .line 73
    new-array v7, v7, [B

    .line 74
    .line 75
    fill-array-data v7, :array_5

    .line 76
    .line 77
    .line 78
    invoke-static {v7}, Ll/riw;->a([B)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    const/16 v8, 0x9

    .line 83
    .line 84
    new-array v8, v8, [B

    .line 85
    .line 86
    fill-array-data v8, :array_6

    .line 87
    .line 88
    .line 89
    invoke-static {v8}, Ll/riw;->a([B)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v8

    .line 93
    const/4 v9, 0x5

    .line 94
    new-array v9, v9, [B

    .line 95
    .line 96
    fill-array-data v9, :array_7

    .line 97
    .line 98
    .line 99
    invoke-static {v9}, Ll/riw;->a([B)Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object v9

    .line 103
    const/4 v10, 0x6

    .line 104
    new-array v10, v10, [B

    .line 105
    .line 106
    fill-array-data v10, :array_8

    .line 107
    .line 108
    .line 109
    invoke-static {v10}, Ll/riw;->a([B)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v10

    .line 113
    const/16 v12, 0xb

    .line 114
    .line 115
    new-array v11, v12, [B

    .line 116
    .line 117
    fill-array-data v11, :array_9

    .line 118
    .line 119
    .line 120
    invoke-static {v11}, Ll/riw;->a([B)Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object v11

    .line 124
    filled-new-array/range {v3 .. v11}, [Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v15

    .line 128
    const/16 v3, 0xe

    .line 129
    .line 130
    new-array v3, v3, [B

    .line 131
    .line 132
    fill-array-data v3, :array_a

    .line 133
    .line 134
    .line 135
    invoke-static {v3}, Ll/riw;->a([B)Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object v18

    .line 139
    :try_start_0
    invoke-virtual {v2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 140
    .line 141
    .line 142
    move-result-object v13

    .line 143
    sget-object v14, Landroid/provider/MediaStore$Images$Media;->EXTERNAL_CONTENT_URI:Landroid/net/Uri;

    .line 144
    .line 145
    const/16 v16, 0x0

    .line 146
    .line 147
    const/16 v17, 0x0

    .line 148
    .line 149
    invoke-virtual/range {v13 .. v18}, Landroid/content/ContentResolver;->query(Landroid/net/Uri;[Ljava/lang/String;Ljava/lang/String;[Ljava/lang/String;Ljava/lang/String;)Landroid/database/Cursor;

    .line 150
    .line 151
    .line 152
    move-result-object v2
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 153
    if-nez v2, :cond_2

    .line 154
    .line 155
    :try_start_1
    invoke-static {v1}, Ll/tj70;->b(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    .line 156
    .line 157
    .line 158
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 159
    if-eqz v2, :cond_1

    .line 160
    .line 161
    :try_start_2
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0

    .line 162
    .line 163
    .line 164
    return-object v0

    .line 165
    :catch_0
    move-exception v0

    .line 166
    goto :goto_3

    .line 167
    :cond_1
    return-object v0

    .line 168
    :catchall_0
    move-exception v0

    .line 169
    move-object v3, v0

    .line 170
    goto :goto_1

    .line 171
    :cond_2
    :try_start_3
    invoke-interface {v2}, Landroid/database/Cursor;->getCount()I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    new-array v4, v12, [B

    .line 176
    .line 177
    fill-array-data v4, :array_b

    .line 178
    .line 179
    .line 180
    invoke-static {v4}, Ll/riw;->a([B)Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v4

    .line 184
    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;I)Lorg/json/JSONObject;

    .line 185
    .line 186
    .line 187
    new-instance v3, Lorg/json/JSONArray;

    .line 188
    .line 189
    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    .line 190
    .line 191
    .line 192
    const/4 v4, 0x0

    .line 193
    :goto_0
    invoke-interface {v2}, Landroid/database/Cursor;->moveToNext()Z

    .line 194
    .line 195
    .line 196
    move-result v5

    .line 197
    if-eqz v5, :cond_3

    .line 198
    .line 199
    if-ge v4, v0, :cond_3

    .line 200
    .line 201
    invoke-static {v2}, Ll/tj70;->c(Landroid/database/Cursor;)Lorg/json/JSONObject;

    .line 202
    .line 203
    .line 204
    move-result-object v5

    .line 205
    invoke-virtual {v3, v5}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    .line 206
    .line 207
    .line 208
    add-int/lit8 v4, v4, 0x1

    .line 209
    .line 210
    goto :goto_0

    .line 211
    :cond_3
    const/16 v0, 0xd

    .line 212
    .line 213
    new-array v0, v0, [B

    .line 214
    .line 215
    fill-array-data v0, :array_c

    .line 216
    .line 217
    .line 218
    invoke-static {v0}, Ll/riw;->a([B)Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    invoke-virtual {v1, v0, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 223
    .line 224
    .line 225
    :try_start_4
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_0

    .line 226
    .line 227
    .line 228
    return-object v1

    .line 229
    :goto_1
    :try_start_5
    throw v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 230
    :catchall_1
    move-exception v0

    .line 231
    move-object v4, v0

    .line 232
    if-eqz v2, :cond_4

    .line 233
    .line 234
    :try_start_6
    invoke-interface {v2}, Landroid/database/Cursor;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 235
    .line 236
    .line 237
    goto :goto_2

    .line 238
    :catchall_2
    move-exception v0

    .line 239
    :try_start_7
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 240
    .line 241
    .line 242
    :cond_4
    :goto_2
    throw v4
    :try_end_7
    .catch Lorg/json/JSONException; {:try_start_7 .. :try_end_7} :catch_0

    .line 243
    :goto_3
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 244
    .line 245
    .line 246
    return-object v1

    .line 247
    :array_0
    .array-data 1
        0x51t
        0x8t
        0x55t
        0x45t
        0xet
        0xft
        0x54t
        0x48t
        0x41t
        0x52t
        0x13t
        0xbt
        0x59t
        0x15t
        0x42t
        0x5et
        0xet
        0x8t
        0x1et
        0x34t
        0x74t
        0x76t
        0x25t
        0x39t
        0x75t
        0x3et
        0x65t
        0x72t
        0x33t
        0x28t
        0x71t
        0x2at
        0x6et
        0x64t
        0x35t
        0x29t
        0x62t
        0x27t
        0x76t
        0x72t
    .end array-data

    .line 248
    .line 249
    .line 250
    .line 251
    .line 252
    .line 253
    .line 254
    .line 255
    .line 256
    .line 257
    .line 258
    .line 259
    .line 260
    .line 261
    .line 262
    .line 263
    .line 264
    .line 265
    .line 266
    .line 267
    .line 268
    .line 269
    .line 270
    .line 271
    :array_1
    .array-data 1
        0x6ft
        0xft
        0x55t
    .end array-data

    .line 272
    .line 273
    .line 274
    .line 275
    .line 276
    .line 277
    :array_2
    .array-data 1
        0x6ft
        0x2t
        0x58t
        0x44t
        0x11t
        0xat
        0x51t
        0x1ft
        0x6et
        0x59t
        0x0t
        0xbt
        0x55t
    .end array-data

    .line 278
    .line 279
    .line 280
    .line 281
    .line 282
    .line 283
    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    nop

    .line 289
    :array_3
    .array-data 1
        0x54t
        0x7t
        0x45t
        0x52t
        0x3et
        0x7t
        0x54t
        0x2t
        0x54t
        0x53t
    .end array-data

    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    nop

    .line 299
    :array_4
    .array-data 1
        0x6ft
        0x2t
        0x50t
        0x43t
        0x0t
    .end array-data

    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    .line 306
    nop

    .line 307
    :array_5
    .array-data 1
        0x6ft
        0x15t
        0x58t
        0x4dt
        0x4t
    .end array-data

    .line 308
    .line 309
    .line 310
    .line 311
    .line 312
    .line 313
    .line 314
    nop

    .line 315
    :array_6
    .array-data 1
        0x5dt
        0xft
        0x5ct
        0x52t
        0x3et
        0x12t
        0x49t
        0x16t
        0x54t
    .end array-data

    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    nop

    .line 325
    :array_7
    .array-data 1
        0x47t
        0xft
        0x55t
        0x43t
        0x9t
    .end array-data

    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    nop

    .line 333
    :array_8
    .array-data 1
        0x58t
        0x3t
        0x58t
        0x50t
        0x9t
        0x12t
    .end array-data

    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    nop

    .line 341
    :array_9
    .array-data 1
        0x5ft
        0x14t
        0x58t
        0x52t
        0xft
        0x12t
        0x51t
        0x12t
        0x58t
        0x58t
        0xft
    .end array-data

    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    .line 350
    .line 351
    :array_a
    .array-data 1
        0x54t
        0x7t
        0x45t
        0x52t
        0x3et
        0x7t
        0x54t
        0x2t
        0x54t
        0x53t
        0x41t
        0x27t
        0x63t
        0x25t
    .end array-data

    .line 352
    .line 353
    .line 354
    .line 355
    .line 356
    .line 357
    .line 358
    .line 359
    .line 360
    .line 361
    .line 362
    nop

    .line 363
    :array_b
    .array-data 1
        0x40t
        0xet
        0x5et
        0x43t
        0xet
        0x39t
        0x53t
        0x9t
        0x44t
        0x59t
        0x15t
    .end array-data

    .line 364
    .line 365
    .line 366
    .line 367
    .line 368
    .line 369
    .line 370
    .line 371
    .line 372
    .line 373
    :array_c
    .array-data 1
        0x40t
        0xet
        0x5et
        0x43t
        0xet
        0x39t
        0x54t
        0x3t
        0x45t
        0x56t
        0x8t
        0xat
        0x43t
    .end array-data
.end method
