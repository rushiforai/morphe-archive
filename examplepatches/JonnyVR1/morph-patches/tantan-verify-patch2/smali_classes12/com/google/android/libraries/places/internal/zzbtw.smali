.class final Lcom/google/android/libraries/places/internal/zzbtw;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final zza:Lcom/google/android/libraries/places/internal/zzbwf;

.field private static final zzb:[Lcom/google/android/libraries/places/internal/zzbtt;

.field private static final zzc:Ljava/util/Map;


# direct methods
.method static constructor <clinit>()V
    .locals 63

    .line 1
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbwf;->zza:Lcom/google/android/libraries/places/internal/zzbwe;

    .line 2
    .line 3
    const-string v0, ":"

    .line 4
    .line 5
    invoke-static {v0}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zza:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 10
    .line 11
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 12
    .line 13
    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtt;->zze:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 14
    .line 15
    const-string v2, ""

    .line 16
    .line 17
    invoke-static {v2}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    invoke-direct {v1, v0, v3}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 22
    .line 23
    .line 24
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 25
    .line 26
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbtt;->zzb:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 27
    .line 28
    const-string v4, "GET"

    .line 29
    .line 30
    invoke-static {v4}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    invoke-direct {v0, v3, v4}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 35
    .line 36
    .line 37
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 38
    .line 39
    const-string v5, "POST"

    .line 40
    .line 41
    invoke-static {v5}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 42
    .line 43
    .line 44
    move-result-object v5

    .line 45
    invoke-direct {v4, v3, v5}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 46
    .line 47
    .line 48
    move-object v3, v4

    .line 49
    new-instance v4, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 50
    .line 51
    sget-object v5, Lcom/google/android/libraries/places/internal/zzbtt;->zzc:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 52
    .line 53
    const-string v6, "/"

    .line 54
    .line 55
    invoke-static {v6}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 56
    .line 57
    .line 58
    move-result-object v6

    .line 59
    invoke-direct {v4, v5, v6}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 60
    .line 61
    .line 62
    new-instance v6, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 63
    .line 64
    const-string v7, "/index.html"

    .line 65
    .line 66
    invoke-static {v7}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 67
    .line 68
    .line 69
    move-result-object v7

    .line 70
    invoke-direct {v6, v5, v7}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 71
    .line 72
    .line 73
    move-object v5, v6

    .line 74
    new-instance v6, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 75
    .line 76
    sget-object v7, Lcom/google/android/libraries/places/internal/zzbtt;->zzd:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 77
    .line 78
    const-string v8, "http"

    .line 79
    .line 80
    invoke-static {v8}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 81
    .line 82
    .line 83
    move-result-object v8

    .line 84
    invoke-direct {v6, v7, v8}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 85
    .line 86
    .line 87
    new-instance v8, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 88
    .line 89
    const-string v9, "https"

    .line 90
    .line 91
    invoke-static {v9}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    invoke-direct {v8, v7, v9}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 96
    .line 97
    .line 98
    move-object v7, v8

    .line 99
    new-instance v8, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 100
    .line 101
    sget-object v9, Lcom/google/android/libraries/places/internal/zzbtt;->zza:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 102
    .line 103
    const-string v10, "200"

    .line 104
    .line 105
    invoke-static {v10}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 106
    .line 107
    .line 108
    move-result-object v10

    .line 109
    invoke-direct {v8, v9, v10}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 110
    .line 111
    .line 112
    new-instance v10, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 113
    .line 114
    const-string v11, "204"

    .line 115
    .line 116
    invoke-static {v11}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    invoke-direct {v10, v9, v11}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 121
    .line 122
    .line 123
    move-object v11, v10

    .line 124
    new-instance v10, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 125
    .line 126
    const-string v12, "206"

    .line 127
    .line 128
    invoke-static {v12}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 129
    .line 130
    .line 131
    move-result-object v12

    .line 132
    invoke-direct {v10, v9, v12}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 133
    .line 134
    .line 135
    move-object v12, v11

    .line 136
    new-instance v11, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 137
    .line 138
    const-string v13, "304"

    .line 139
    .line 140
    invoke-static {v13}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 141
    .line 142
    .line 143
    move-result-object v13

    .line 144
    invoke-direct {v11, v9, v13}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 145
    .line 146
    .line 147
    move-object v13, v12

    .line 148
    new-instance v12, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 149
    .line 150
    const-string v14, "400"

    .line 151
    .line 152
    invoke-static {v14}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 153
    .line 154
    .line 155
    move-result-object v14

    .line 156
    invoke-direct {v12, v9, v14}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 157
    .line 158
    .line 159
    move-object v14, v13

    .line 160
    new-instance v13, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 161
    .line 162
    const-string v15, "404"

    .line 163
    .line 164
    invoke-static {v15}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 165
    .line 166
    .line 167
    move-result-object v15

    .line 168
    invoke-direct {v13, v9, v15}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 169
    .line 170
    .line 171
    move-object v15, v14

    .line 172
    new-instance v14, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 173
    .line 174
    const-string v16, "500"

    .line 175
    .line 176
    move-object/from16 v17, v0

    .line 177
    .line 178
    invoke-static/range {v16 .. v16}, Lcom/google/android/libraries/places/internal/zzbwe;->zza(Ljava/lang/String;)Lcom/google/android/libraries/places/internal/zzbwf;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-direct {v14, v9, v0}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Lcom/google/android/libraries/places/internal/zzbwf;Lcom/google/android/libraries/places/internal/zzbwf;)V

    .line 183
    .line 184
    .line 185
    move-object v9, v15

    .line 186
    new-instance v15, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 187
    .line 188
    const-string v0, "accept-charset"

    .line 189
    .line 190
    invoke-direct {v15, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 191
    .line 192
    .line 193
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 194
    .line 195
    move-object/from16 v16, v1

    .line 196
    .line 197
    const-string v1, "accept-encoding"

    .line 198
    .line 199
    move-object/from16 v18, v3

    .line 200
    .line 201
    const-string v3, "gzip, deflate"

    .line 202
    .line 203
    invoke-direct {v0, v1, v3}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 204
    .line 205
    .line 206
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 207
    .line 208
    const-string v3, "accept-language"

    .line 209
    .line 210
    invoke-direct {v1, v3, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 211
    .line 212
    .line 213
    new-instance v3, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 214
    .line 215
    move-object/from16 v19, v0

    .line 216
    .line 217
    const-string v0, "accept-ranges"

    .line 218
    .line 219
    invoke-direct {v3, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 223
    .line 224
    move-object/from16 v20, v1

    .line 225
    .line 226
    const-string v1, "accept"

    .line 227
    .line 228
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 232
    .line 233
    move-object/from16 v21, v0

    .line 234
    .line 235
    const-string v0, "access-control-allow-origin"

    .line 236
    .line 237
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 238
    .line 239
    .line 240
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 241
    .line 242
    move-object/from16 v22, v1

    .line 243
    .line 244
    const-string v1, "age"

    .line 245
    .line 246
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 247
    .line 248
    .line 249
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 250
    .line 251
    move-object/from16 v23, v0

    .line 252
    .line 253
    const-string v0, "allow"

    .line 254
    .line 255
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 259
    .line 260
    move-object/from16 v24, v1

    .line 261
    .line 262
    const-string v1, "authorization"

    .line 263
    .line 264
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 268
    .line 269
    move-object/from16 v25, v0

    .line 270
    .line 271
    const-string v0, "cache-control"

    .line 272
    .line 273
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 277
    .line 278
    move-object/from16 v26, v1

    .line 279
    .line 280
    const-string v1, "content-disposition"

    .line 281
    .line 282
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 286
    .line 287
    move-object/from16 v27, v0

    .line 288
    .line 289
    const-string v0, "content-encoding"

    .line 290
    .line 291
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 292
    .line 293
    .line 294
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 295
    .line 296
    move-object/from16 v28, v1

    .line 297
    .line 298
    const-string v1, "content-language"

    .line 299
    .line 300
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 301
    .line 302
    .line 303
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 304
    .line 305
    move-object/from16 v29, v0

    .line 306
    .line 307
    const-string v0, "content-length"

    .line 308
    .line 309
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 310
    .line 311
    .line 312
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 313
    .line 314
    move-object/from16 v30, v1

    .line 315
    .line 316
    const-string v1, "content-location"

    .line 317
    .line 318
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 319
    .line 320
    .line 321
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 322
    .line 323
    move-object/from16 v31, v0

    .line 324
    .line 325
    const-string v0, "content-range"

    .line 326
    .line 327
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 328
    .line 329
    .line 330
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 331
    .line 332
    move-object/from16 v32, v1

    .line 333
    .line 334
    const-string v1, "content-type"

    .line 335
    .line 336
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 337
    .line 338
    .line 339
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 340
    .line 341
    move-object/from16 v33, v0

    .line 342
    .line 343
    const-string v0, "cookie"

    .line 344
    .line 345
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 349
    .line 350
    move-object/from16 v34, v1

    .line 351
    .line 352
    const-string v1, "date"

    .line 353
    .line 354
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 355
    .line 356
    .line 357
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 358
    .line 359
    move-object/from16 v35, v0

    .line 360
    .line 361
    const-string v0, "etag"

    .line 362
    .line 363
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 364
    .line 365
    .line 366
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 367
    .line 368
    move-object/from16 v36, v1

    .line 369
    .line 370
    const-string v1, "expect"

    .line 371
    .line 372
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 373
    .line 374
    .line 375
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 376
    .line 377
    move-object/from16 v37, v0

    .line 378
    .line 379
    const-string v0, "expires"

    .line 380
    .line 381
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 382
    .line 383
    .line 384
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 385
    .line 386
    move-object/from16 v38, v1

    .line 387
    .line 388
    const-string v1, "from"

    .line 389
    .line 390
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 391
    .line 392
    .line 393
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 394
    .line 395
    move-object/from16 v39, v0

    .line 396
    .line 397
    const-string v0, "host"

    .line 398
    .line 399
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 400
    .line 401
    .line 402
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 403
    .line 404
    move-object/from16 v40, v1

    .line 405
    .line 406
    const-string v1, "if-match"

    .line 407
    .line 408
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 412
    .line 413
    move-object/from16 v41, v0

    .line 414
    .line 415
    const-string v0, "if-modified-since"

    .line 416
    .line 417
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 418
    .line 419
    .line 420
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 421
    .line 422
    move-object/from16 v42, v1

    .line 423
    .line 424
    const-string v1, "if-none-match"

    .line 425
    .line 426
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 427
    .line 428
    .line 429
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 430
    .line 431
    move-object/from16 v43, v0

    .line 432
    .line 433
    const-string v0, "if-range"

    .line 434
    .line 435
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 436
    .line 437
    .line 438
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 439
    .line 440
    move-object/from16 v44, v1

    .line 441
    .line 442
    const-string v1, "if-unmodified-since"

    .line 443
    .line 444
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 445
    .line 446
    .line 447
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 448
    .line 449
    move-object/from16 v45, v0

    .line 450
    .line 451
    const-string v0, "last-modified"

    .line 452
    .line 453
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 454
    .line 455
    .line 456
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 457
    .line 458
    move-object/from16 v46, v1

    .line 459
    .line 460
    const-string v1, "link"

    .line 461
    .line 462
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 463
    .line 464
    .line 465
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 466
    .line 467
    move-object/from16 v47, v0

    .line 468
    .line 469
    const-string v0, "location"

    .line 470
    .line 471
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 472
    .line 473
    .line 474
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 475
    .line 476
    move-object/from16 v48, v1

    .line 477
    .line 478
    const-string v1, "max-forwards"

    .line 479
    .line 480
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 481
    .line 482
    .line 483
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 484
    .line 485
    move-object/from16 v49, v0

    .line 486
    .line 487
    const-string v0, "proxy-authenticate"

    .line 488
    .line 489
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 490
    .line 491
    .line 492
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 493
    .line 494
    move-object/from16 v50, v1

    .line 495
    .line 496
    const-string v1, "proxy-authorization"

    .line 497
    .line 498
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 499
    .line 500
    .line 501
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 502
    .line 503
    move-object/from16 v51, v0

    .line 504
    .line 505
    const-string v0, "range"

    .line 506
    .line 507
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 508
    .line 509
    .line 510
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 511
    .line 512
    move-object/from16 v52, v1

    .line 513
    .line 514
    const-string v1, "referer"

    .line 515
    .line 516
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 517
    .line 518
    .line 519
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 520
    .line 521
    move-object/from16 v53, v0

    .line 522
    .line 523
    const-string v0, "refresh"

    .line 524
    .line 525
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 526
    .line 527
    .line 528
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 529
    .line 530
    move-object/from16 v54, v1

    .line 531
    .line 532
    const-string v1, "retry-after"

    .line 533
    .line 534
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 535
    .line 536
    .line 537
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 538
    .line 539
    move-object/from16 v55, v0

    .line 540
    .line 541
    const-string v0, "server"

    .line 542
    .line 543
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 544
    .line 545
    .line 546
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 547
    .line 548
    move-object/from16 v56, v1

    .line 549
    .line 550
    const-string v1, "set-cookie"

    .line 551
    .line 552
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 553
    .line 554
    .line 555
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 556
    .line 557
    move-object/from16 v57, v0

    .line 558
    .line 559
    const-string v0, "strict-transport-security"

    .line 560
    .line 561
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 562
    .line 563
    .line 564
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 565
    .line 566
    move-object/from16 v58, v1

    .line 567
    .line 568
    const-string v1, "transfer-encoding"

    .line 569
    .line 570
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 571
    .line 572
    .line 573
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 574
    .line 575
    move-object/from16 v59, v0

    .line 576
    .line 577
    const-string v0, "user-agent"

    .line 578
    .line 579
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 580
    .line 581
    .line 582
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 583
    .line 584
    move-object/from16 v60, v1

    .line 585
    .line 586
    const-string v1, "vary"

    .line 587
    .line 588
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 589
    .line 590
    .line 591
    new-instance v1, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 592
    .line 593
    move-object/from16 v61, v0

    .line 594
    .line 595
    const-string v0, "via"

    .line 596
    .line 597
    invoke-direct {v1, v0, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 598
    .line 599
    .line 600
    new-instance v0, Lcom/google/android/libraries/places/internal/zzbtt;

    .line 601
    .line 602
    move-object/from16 v62, v1

    .line 603
    .line 604
    const-string v1, "www-authenticate"

    .line 605
    .line 606
    invoke-direct {v0, v1, v2}, Lcom/google/android/libraries/places/internal/zzbtt;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 607
    .line 608
    .line 609
    move-object/from16 v1, v18

    .line 610
    .line 611
    move-object/from16 v18, v3

    .line 612
    .line 613
    move-object v3, v1

    .line 614
    move-object/from16 v1, v16

    .line 615
    .line 616
    move-object/from16 v2, v17

    .line 617
    .line 618
    move-object/from16 v16, v19

    .line 619
    .line 620
    move-object/from16 v17, v20

    .line 621
    .line 622
    move-object/from16 v19, v21

    .line 623
    .line 624
    move-object/from16 v20, v22

    .line 625
    .line 626
    move-object/from16 v21, v23

    .line 627
    .line 628
    move-object/from16 v22, v24

    .line 629
    .line 630
    move-object/from16 v23, v25

    .line 631
    .line 632
    move-object/from16 v24, v26

    .line 633
    .line 634
    move-object/from16 v25, v27

    .line 635
    .line 636
    move-object/from16 v26, v28

    .line 637
    .line 638
    move-object/from16 v27, v29

    .line 639
    .line 640
    move-object/from16 v28, v30

    .line 641
    .line 642
    move-object/from16 v29, v31

    .line 643
    .line 644
    move-object/from16 v30, v32

    .line 645
    .line 646
    move-object/from16 v31, v33

    .line 647
    .line 648
    move-object/from16 v32, v34

    .line 649
    .line 650
    move-object/from16 v33, v35

    .line 651
    .line 652
    move-object/from16 v34, v36

    .line 653
    .line 654
    move-object/from16 v35, v37

    .line 655
    .line 656
    move-object/from16 v36, v38

    .line 657
    .line 658
    move-object/from16 v37, v39

    .line 659
    .line 660
    move-object/from16 v38, v40

    .line 661
    .line 662
    move-object/from16 v39, v41

    .line 663
    .line 664
    move-object/from16 v40, v42

    .line 665
    .line 666
    move-object/from16 v41, v43

    .line 667
    .line 668
    move-object/from16 v42, v44

    .line 669
    .line 670
    move-object/from16 v43, v45

    .line 671
    .line 672
    move-object/from16 v44, v46

    .line 673
    .line 674
    move-object/from16 v45, v47

    .line 675
    .line 676
    move-object/from16 v46, v48

    .line 677
    .line 678
    move-object/from16 v47, v49

    .line 679
    .line 680
    move-object/from16 v48, v50

    .line 681
    .line 682
    move-object/from16 v49, v51

    .line 683
    .line 684
    move-object/from16 v50, v52

    .line 685
    .line 686
    move-object/from16 v51, v53

    .line 687
    .line 688
    move-object/from16 v52, v54

    .line 689
    .line 690
    move-object/from16 v53, v55

    .line 691
    .line 692
    move-object/from16 v54, v56

    .line 693
    .line 694
    move-object/from16 v55, v57

    .line 695
    .line 696
    move-object/from16 v56, v58

    .line 697
    .line 698
    move-object/from16 v57, v59

    .line 699
    .line 700
    move-object/from16 v58, v60

    .line 701
    .line 702
    move-object/from16 v59, v61

    .line 703
    .line 704
    move-object/from16 v60, v62

    .line 705
    .line 706
    move-object/from16 v61, v0

    .line 707
    .line 708
    filled-new-array/range {v1 .. v61}, [Lcom/google/android/libraries/places/internal/zzbtt;

    .line 709
    .line 710
    .line 711
    move-result-object v0

    .line 712
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zzb:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 713
    .line 714
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 715
    .line 716
    const/16 v1, 0x3d

    .line 717
    .line 718
    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 719
    .line 720
    .line 721
    const/4 v2, 0x0

    .line 722
    :goto_0
    sget-object v3, Lcom/google/android/libraries/places/internal/zzbtw;->zzb:[Lcom/google/android/libraries/places/internal/zzbtt;

    .line 723
    .line 724
    array-length v4, v3

    .line 725
    if-ge v2, v1, :cond_1

    .line 726
    .line 727
    aget-object v4, v3, v2

    .line 728
    .line 729
    iget-object v4, v4, Lcom/google/android/libraries/places/internal/zzbtt;->zzh:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 730
    .line 731
    invoke-interface {v0, v4}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 732
    .line 733
    .line 734
    move-result v4

    .line 735
    if-nez v4, :cond_0

    .line 736
    .line 737
    aget-object v3, v3, v2

    .line 738
    .line 739
    iget-object v3, v3, Lcom/google/android/libraries/places/internal/zzbtt;->zzh:Lcom/google/android/libraries/places/internal/zzbwf;

    .line 740
    .line 741
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 742
    .line 743
    .line 744
    move-result-object v4

    .line 745
    invoke-interface {v0, v3, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 746
    .line 747
    .line 748
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 749
    .line 750
    goto :goto_0

    .line 751
    :cond_1
    invoke-static {v0}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    .line 752
    .line 753
    .line 754
    move-result-object v0

    .line 755
    sput-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zzc:Ljava/util/Map;

    .line 756
    .line 757
    return-void
.end method

.method public static bridge synthetic zza()Ljava/util/Map;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zzc:Ljava/util/Map;

    return-object v0
.end method

.method public static bridge synthetic zzb()Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zza:Lcom/google/android/libraries/places/internal/zzbwf;

    return-object v0
.end method

.method public static bridge synthetic zzc(Lcom/google/android/libraries/places/internal/zzbwf;)Lcom/google/android/libraries/places/internal/zzbwf;
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzc()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    :goto_0
    if-ge v1, v0, :cond_2

    .line 7
    .line 8
    invoke-virtual {p0, v1}, Lcom/google/android/libraries/places/internal/zzbwf;->zza(I)B

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const/16 v3, 0x41

    .line 13
    .line 14
    if-lt v2, v3, :cond_1

    .line 15
    .line 16
    const/16 v3, 0x5a

    .line 17
    .line 18
    if-le v2, v3, :cond_0

    .line 19
    .line 20
    goto :goto_1

    .line 21
    :cond_0
    invoke-virtual {p0}, Lcom/google/android/libraries/places/internal/zzbwf;->zzf()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string v0, "PROTOCOL_ERROR response malformed: mixed case name: "

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    return-object p0

    .line 36
    :cond_1
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    return-object p0
.end method

.method public static bridge synthetic zzd()[Lcom/google/android/libraries/places/internal/zzbtt;
    .locals 1

    sget-object v0, Lcom/google/android/libraries/places/internal/zzbtw;->zzb:[Lcom/google/android/libraries/places/internal/zzbtt;

    return-object v0
.end method
