.class final Lcom/google/android/libraries/places/api/model/zzbj;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Parcelable$Creator;


# direct methods
.method public constructor <init>()V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final bridge synthetic createFromParcel(Landroid/os/Parcel;)Ljava/lang/Object;
    .locals 42

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    new-instance v1, Lcom/google/android/libraries/places/api/model/zzbk;

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 6
    .line 7
    .line 8
    move-result v2

    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v2, 0x0

    .line 17
    :goto_0
    const-class v4, Lcom/google/android/libraries/places/api/model/Place;

    .line 18
    .line 19
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    invoke-virtual {v0, v5}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    check-cast v5, Lcom/google/android/libraries/places/api/model/AddressComponents;

    .line 28
    .line 29
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v0, v6}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 34
    .line 35
    .line 36
    move-result-object v6

    .line 37
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-virtual {v0, v7}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    check-cast v7, Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;

    .line 46
    .line 47
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 48
    .line 49
    .line 50
    move-result-object v8

    .line 51
    invoke-virtual {v0, v8}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    check-cast v8, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 56
    .line 57
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 58
    .line 59
    .line 60
    move-result-object v9

    .line 61
    invoke-virtual {v0, v9}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 62
    .line 63
    .line 64
    move-result-object v9

    .line 65
    check-cast v9, Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 66
    .line 67
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 68
    .line 69
    .line 70
    move-result-object v10

    .line 71
    invoke-virtual {v0, v10}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 72
    .line 73
    .line 74
    move-result-object v10

    .line 75
    check-cast v10, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 76
    .line 77
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 78
    .line 79
    .line 80
    move-result-object v11

    .line 81
    invoke-virtual {v0, v11}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 82
    .line 83
    .line 84
    move-result-object v11

    .line 85
    check-cast v11, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 88
    .line 89
    .line 90
    move-result v12

    .line 91
    if-nez v12, :cond_1

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    goto :goto_1

    .line 98
    :cond_1
    const/4 v12, 0x0

    .line 99
    :goto_1
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 100
    .line 101
    .line 102
    move-result v13

    .line 103
    if-nez v13, :cond_2

    .line 104
    .line 105
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v13

    .line 109
    goto :goto_2

    .line 110
    :cond_2
    const/4 v13, 0x0

    .line 111
    :goto_2
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 112
    .line 113
    .line 114
    move-result v14

    .line 115
    if-nez v14, :cond_3

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 118
    .line 119
    .line 120
    move-result v14

    .line 121
    invoke-static {v14}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 122
    .line 123
    .line 124
    move-result-object v14

    .line 125
    goto :goto_3

    .line 126
    :cond_3
    const/4 v14, 0x0

    .line 127
    :goto_3
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 128
    .line 129
    .line 130
    move-result v15

    .line 131
    if-nez v15, :cond_4

    .line 132
    .line 133
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v15

    .line 137
    goto :goto_4

    .line 138
    :cond_4
    const/4 v15, 0x0

    .line 139
    :goto_4
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 140
    .line 141
    .line 142
    move-result v16

    .line 143
    if-nez v16, :cond_5

    .line 144
    .line 145
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v16

    .line 149
    goto :goto_5

    .line 150
    :cond_5
    const/16 v16, 0x0

    .line 151
    .line 152
    :goto_5
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 153
    .line 154
    .line 155
    move-result-object v3

    .line 156
    invoke-virtual {v0, v3}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 157
    .line 158
    .line 159
    move-result-object v3

    .line 160
    check-cast v3, Lcom/google/android/gms/maps/model/LatLng;

    .line 161
    .line 162
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 163
    .line 164
    .line 165
    move-result v17

    .line 166
    if-nez v17, :cond_6

    .line 167
    .line 168
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v17

    .line 172
    goto :goto_6

    .line 173
    :cond_6
    const/16 v17, 0x0

    .line 174
    .line 175
    :goto_6
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 176
    .line 177
    .line 178
    move-result v18

    .line 179
    if-nez v18, :cond_7

    .line 180
    .line 181
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v18

    .line 185
    :goto_7
    move-object/from16 v19, v1

    .line 186
    .line 187
    goto :goto_8

    .line 188
    :cond_7
    const/16 v18, 0x0

    .line 189
    .line 190
    goto :goto_7

    .line 191
    :goto_8
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 192
    .line 193
    .line 194
    move-result-object v1

    .line 195
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    check-cast v1, Lcom/google/android/libraries/places/api/model/OpeningHours;

    .line 200
    .line 201
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 202
    .line 203
    .line 204
    move-result v20

    .line 205
    if-nez v20, :cond_8

    .line 206
    .line 207
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v20

    .line 211
    :goto_9
    move-object/from16 v21, v1

    .line 212
    .line 213
    goto :goto_a

    .line 214
    :cond_8
    const/16 v20, 0x0

    .line 215
    .line 216
    goto :goto_9

    .line 217
    :goto_a
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 218
    .line 219
    .line 220
    move-result-object v1

    .line 221
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    move-object/from16 v22, v1

    .line 226
    .line 227
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    move-object/from16 v23, v1

    .line 236
    .line 237
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    move-object/from16 v24, v1

    .line 246
    .line 247
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    check-cast v1, Lcom/google/android/libraries/places/api/model/PlusCode;

    .line 256
    .line 257
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 258
    .line 259
    .line 260
    move-result v25

    .line 261
    if-nez v25, :cond_9

    .line 262
    .line 263
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 264
    .line 265
    .line 266
    move-result v25

    .line 267
    invoke-static/range {v25 .. v25}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 268
    .line 269
    .line 270
    move-result-object v25

    .line 271
    goto :goto_b

    .line 272
    :cond_9
    const/16 v25, 0x0

    .line 273
    .line 274
    :goto_b
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 275
    .line 276
    .line 277
    move-result v26

    .line 278
    if-nez v26, :cond_a

    .line 279
    .line 280
    invoke-virtual {v0}, Landroid/os/Parcel;->readString()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v26

    .line 284
    goto :goto_c

    .line 285
    :cond_a
    const/16 v26, 0x0

    .line 286
    .line 287
    :goto_c
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 288
    .line 289
    .line 290
    move-result v27

    .line 291
    if-nez v27, :cond_b

    .line 292
    .line 293
    invoke-virtual {v0}, Landroid/os/Parcel;->readDouble()D

    .line 294
    .line 295
    .line 296
    move-result-wide v27

    .line 297
    invoke-static/range {v27 .. v28}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 298
    .line 299
    .line 300
    move-result-object v27

    .line 301
    :goto_d
    move-object/from16 v28, v1

    .line 302
    .line 303
    goto :goto_e

    .line 304
    :cond_b
    const/16 v27, 0x0

    .line 305
    .line 306
    goto :goto_d

    .line 307
    :goto_e
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 316
    .line 317
    move-object/from16 v29, v1

    .line 318
    .line 319
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 320
    .line 321
    .line 322
    move-result-object v1

    .line 323
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    move-object/from16 v30, v1

    .line 328
    .line 329
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 330
    .line 331
    .line 332
    move-result-object v1

    .line 333
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 334
    .line 335
    .line 336
    move-result-object v1

    .line 337
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 338
    .line 339
    move-object/from16 v31, v1

    .line 340
    .line 341
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 346
    .line 347
    .line 348
    move-result-object v1

    .line 349
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 350
    .line 351
    move-object/from16 v32, v1

    .line 352
    .line 353
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 354
    .line 355
    .line 356
    move-result-object v1

    .line 357
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 358
    .line 359
    .line 360
    move-result-object v1

    .line 361
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 362
    .line 363
    move-object/from16 v33, v1

    .line 364
    .line 365
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 370
    .line 371
    .line 372
    move-result-object v1

    .line 373
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 374
    .line 375
    move-object/from16 v34, v1

    .line 376
    .line 377
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 378
    .line 379
    .line 380
    move-result-object v1

    .line 381
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 386
    .line 387
    move-object/from16 v35, v1

    .line 388
    .line 389
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 390
    .line 391
    .line 392
    move-result-object v1

    .line 393
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 394
    .line 395
    .line 396
    move-result-object v1

    .line 397
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 398
    .line 399
    move-object/from16 v36, v1

    .line 400
    .line 401
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 402
    .line 403
    .line 404
    move-result-object v1

    .line 405
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 410
    .line 411
    move-object/from16 v37, v1

    .line 412
    .line 413
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 414
    .line 415
    .line 416
    move-result-object v1

    .line 417
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 418
    .line 419
    .line 420
    move-result-object v1

    .line 421
    check-cast v1, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 422
    .line 423
    move-object/from16 v38, v1

    .line 424
    .line 425
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 426
    .line 427
    .line 428
    move-result-object v1

    .line 429
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readArrayList(Ljava/lang/ClassLoader;)Ljava/util/ArrayList;

    .line 430
    .line 431
    .line 432
    move-result-object v1

    .line 433
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 434
    .line 435
    .line 436
    move-result v39

    .line 437
    if-nez v39, :cond_c

    .line 438
    .line 439
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 440
    .line 441
    .line 442
    move-result v39

    .line 443
    invoke-static/range {v39 .. v39}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 444
    .line 445
    .line 446
    move-result-object v39

    .line 447
    goto :goto_f

    .line 448
    :cond_c
    const/16 v39, 0x0

    .line 449
    .line 450
    :goto_f
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 451
    .line 452
    .line 453
    move-result v40

    .line 454
    if-nez v40, :cond_d

    .line 455
    .line 456
    invoke-virtual {v0}, Landroid/os/Parcel;->readInt()I

    .line 457
    .line 458
    .line 459
    move-result v40

    .line 460
    invoke-static/range {v40 .. v40}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 461
    .line 462
    .line 463
    move-result-object v40

    .line 464
    :goto_10
    move-object/from16 p0, v1

    .line 465
    .line 466
    goto :goto_11

    .line 467
    :cond_d
    const/16 v40, 0x0

    .line 468
    .line 469
    goto :goto_10

    .line 470
    :goto_11
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 471
    .line 472
    .line 473
    move-result-object v1

    .line 474
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 475
    .line 476
    .line 477
    move-result-object v1

    .line 478
    check-cast v1, Lcom/google/android/gms/maps/model/LatLngBounds;

    .line 479
    .line 480
    move-object/from16 v41, v1

    .line 481
    .line 482
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 483
    .line 484
    .line 485
    move-result-object v1

    .line 486
    invoke-virtual {v0, v1}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 487
    .line 488
    .line 489
    move-result-object v1

    .line 490
    check-cast v1, Landroid/net/Uri;

    .line 491
    .line 492
    invoke-virtual {v4}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    .line 493
    .line 494
    .line 495
    move-result-object v4

    .line 496
    invoke-virtual {v0, v4}, Landroid/os/Parcel;->readParcelable(Ljava/lang/ClassLoader;)Landroid/os/Parcelable;

    .line 497
    .line 498
    .line 499
    move-result-object v0

    .line 500
    check-cast v0, Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;

    .line 501
    .line 502
    move-object/from16 v4, v41

    .line 503
    .line 504
    move-object/from16 v41, v0

    .line 505
    .line 506
    move-object/from16 v0, v19

    .line 507
    .line 508
    move-object/from16 v19, v22

    .line 509
    .line 510
    move-object/from16 v22, v28

    .line 511
    .line 512
    move-object/from16 v28, v31

    .line 513
    .line 514
    move-object/from16 v31, v34

    .line 515
    .line 516
    move-object/from16 v34, v37

    .line 517
    .line 518
    move-object/from16 v37, v39

    .line 519
    .line 520
    move-object/from16 v39, v4

    .line 521
    .line 522
    move-object/from16 v4, v40

    .line 523
    .line 524
    move-object/from16 v40, v1

    .line 525
    .line 526
    move-object v1, v2

    .line 527
    move-object v2, v5

    .line 528
    move-object v5, v8

    .line 529
    move-object v8, v11

    .line 530
    move-object v11, v14

    .line 531
    move-object v14, v3

    .line 532
    move-object v3, v6

    .line 533
    move-object v6, v9

    .line 534
    move-object v9, v12

    .line 535
    move-object v12, v15

    .line 536
    move-object/from16 v15, v17

    .line 537
    .line 538
    move-object/from16 v17, v21

    .line 539
    .line 540
    move-object/from16 v21, v24

    .line 541
    .line 542
    move-object/from16 v24, v26

    .line 543
    .line 544
    move-object/from16 v26, v29

    .line 545
    .line 546
    move-object/from16 v29, v32

    .line 547
    .line 548
    move-object/from16 v32, v35

    .line 549
    .line 550
    move-object/from16 v35, v38

    .line 551
    .line 552
    move-object/from16 v38, v4

    .line 553
    .line 554
    move-object v4, v7

    .line 555
    move-object v7, v10

    .line 556
    move-object v10, v13

    .line 557
    move-object/from16 v13, v16

    .line 558
    .line 559
    move-object/from16 v16, v18

    .line 560
    .line 561
    move-object/from16 v18, v20

    .line 562
    .line 563
    move-object/from16 v20, v23

    .line 564
    .line 565
    move-object/from16 v23, v25

    .line 566
    .line 567
    move-object/from16 v25, v27

    .line 568
    .line 569
    move-object/from16 v27, v30

    .line 570
    .line 571
    move-object/from16 v30, v33

    .line 572
    .line 573
    move-object/from16 v33, v36

    .line 574
    .line 575
    move-object/from16 v36, p0

    .line 576
    .line 577
    invoke-direct/range {v0 .. v41}, Lcom/google/android/libraries/places/api/model/zzbk;-><init>(Ljava/lang/String;Lcom/google/android/libraries/places/api/model/AddressComponents;Ljava/util/List;Lcom/google/android/libraries/places/api/model/Place$BusinessStatus;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/OpeningHours;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/gms/maps/model/LatLng;Ljava/lang/String;Ljava/lang/String;Lcom/google/android/libraries/places/api/model/OpeningHours;Ljava/lang/String;Ljava/util/List;Ljava/util/List;Ljava/util/List;Lcom/google/android/libraries/places/api/model/PlusCode;Ljava/lang/Integer;Ljava/lang/String;Ljava/lang/Double;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/util/List;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;Ljava/util/List;Ljava/lang/Integer;Ljava/lang/Integer;Lcom/google/android/gms/maps/model/LatLngBounds;Landroid/net/Uri;Lcom/google/android/libraries/places/api/model/Place$BooleanPlaceAttributeValue;)V

    .line 578
    .line 579
    .line 580
    return-object v0
.end method

.method public final synthetic newArray(I)[Ljava/lang/Object;
    .locals 0

    .line 1
    new-array p0, p1, [Lcom/google/android/libraries/places/api/model/zzbk;

    .line 2
    .line 3
    return-object p0
.end method
