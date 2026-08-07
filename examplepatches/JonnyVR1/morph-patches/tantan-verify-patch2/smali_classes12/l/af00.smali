.class public Ll/af00;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static c:Ll/af00;

.field public static d:Ljava/lang/Object;


# instance fields
.field private a:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ll/aje;",
            ">;"
        }
    .end annotation
.end field

.field private b:Ll/bje;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/af00;->d:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 7

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/LinkedHashMap;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/af00;->a:Ljava/util/Map;

    .line 10
    .line 11
    new-instance v1, Ll/aje;

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    const-string v4, "mmcv_android_facedetect_model"

    .line 19
    .line 20
    const/4 v5, 0x1

    .line 21
    const/4 v6, 0x3

    .line 22
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 23
    .line 24
    .line 25
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance v1, Ll/aje;

    .line 29
    .line 30
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    const-string v4, "mmcv_android_live_fd_model"

    .line 35
    .line 36
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/aje;

    .line 43
    .line 44
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 45
    .line 46
    .line 47
    move-result v3

    .line 48
    const-string v4, "mmcv_android_mace_fd_model"

    .line 49
    .line 50
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 51
    .line 52
    .line 53
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    new-instance v1, Ll/aje;

    .line 57
    .line 58
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const-string v4, "mmcv_android_fa_model"

    .line 63
    .line 64
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 65
    .line 66
    .line 67
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    new-instance v1, Ll/aje;

    .line 71
    .line 72
    invoke-direct {p0, v5}, Ll/af00;->f(Z)Z

    .line 73
    .line 74
    .line 75
    move-result v3

    .line 76
    const-string v4, "mmcv_android_bodylandmark_model"

    .line 77
    .line 78
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 79
    .line 80
    .line 81
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    new-instance v1, Ll/aje;

    .line 85
    .line 86
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 87
    .line 88
    .line 89
    move-result v3

    .line 90
    const-string v4, "mmcv_android_od_model"

    .line 91
    .line 92
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 93
    .line 94
    .line 95
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    new-instance v1, Ll/aje;

    .line 99
    .line 100
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 101
    .line 102
    .line 103
    move-result v3

    .line 104
    const-string v4, "mmcv_android_barenessdetect_model"

    .line 105
    .line 106
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 107
    .line 108
    .line 109
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    new-instance v1, Ll/aje;

    .line 113
    .line 114
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    const-string v4, "mmcv_android_mace_moment_sg_model"

    .line 119
    .line 120
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 121
    .line 122
    .line 123
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    new-instance v1, Ll/aje;

    .line 127
    .line 128
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 129
    .line 130
    .line 131
    move-result v3

    .line 132
    const-string v4, "mmcv_android_facerigv3_model"

    .line 133
    .line 134
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 135
    .line 136
    .line 137
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    new-instance v1, Ll/aje;

    .line 141
    .line 142
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 143
    .line 144
    .line 145
    move-result v3

    .line 146
    const-string v4, "mmcv_android_facequality_model"

    .line 147
    .line 148
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 149
    .line 150
    .line 151
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    new-instance v1, Ll/aje;

    .line 155
    .line 156
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 157
    .line 158
    .line 159
    move-result v3

    .line 160
    const-string v4, "mmcv_android_face_sg_model"

    .line 161
    .line 162
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 163
    .line 164
    .line 165
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 166
    .line 167
    .line 168
    new-instance v1, Ll/aje;

    .line 169
    .line 170
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 171
    .line 172
    .line 173
    move-result v3

    .line 174
    const-string v4, "mmcv_android_fd_240_model"

    .line 175
    .line 176
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 177
    .line 178
    .line 179
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    new-instance v1, Ll/aje;

    .line 183
    .line 184
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 185
    .line 186
    .line 187
    move-result v3

    .line 188
    const-string v4, "mmcv_android_222_big_fd_model"

    .line 189
    .line 190
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 191
    .line 192
    .line 193
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    new-instance v1, Ll/aje;

    .line 197
    .line 198
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 199
    .line 200
    .line 201
    move-result v3

    .line 202
    const-string v4, "mmcv_android_222_small_fd_model"

    .line 203
    .line 204
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 205
    .line 206
    .line 207
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 208
    .line 209
    .line 210
    new-instance v1, Ll/aje;

    .line 211
    .line 212
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    const-string v4, "mmcv_android_live_bodylandmark_model"

    .line 217
    .line 218
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 219
    .line 220
    .line 221
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    new-instance v1, Ll/aje;

    .line 225
    .line 226
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    const-string v4, "mmcv_android_live_engine_beauty_resource_model"

    .line 231
    .line 232
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 233
    .line 234
    .line 235
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    new-instance v1, Ll/aje;

    .line 239
    .line 240
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 241
    .line 242
    .line 243
    move-result v3

    .line 244
    const-string v4, "mmcv_android_cartoon_girl_model"

    .line 245
    .line 246
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 247
    .line 248
    .line 249
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 250
    .line 251
    .line 252
    new-instance v1, Ll/aje;

    .line 253
    .line 254
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 255
    .line 256
    .line 257
    move-result v3

    .line 258
    const-string v4, "mmcv_android_cartoon_boy_model"

    .line 259
    .line 260
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 261
    .line 262
    .line 263
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 264
    .line 265
    .line 266
    new-instance v1, Ll/aje;

    .line 267
    .line 268
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    const-string v4, "mmcv_android_cartoon_meiman_model"

    .line 273
    .line 274
    invoke-direct {v1, v4, v5, v6, v3}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 275
    .line 276
    .line 277
    invoke-interface {v0, v4, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    new-instance v1, Ll/aje;

    .line 281
    .line 282
    const-string v3, "mmcv_android_cartoon_watercolor_model"

    .line 283
    .line 284
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 285
    .line 286
    .line 287
    move-result v4

    .line 288
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 289
    .line 290
    .line 291
    const-string v3, "mmcv_android_cartoon_watercolor_model"

    .line 292
    .line 293
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    new-instance v1, Ll/aje;

    .line 297
    .line 298
    const-string v3, "mmcv_android_cartoon_pout_model"

    .line 299
    .line 300
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 301
    .line 302
    .line 303
    move-result v4

    .line 304
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 305
    .line 306
    .line 307
    const-string v3, "mmcv_android_cartoon_pout_model"

    .line 308
    .line 309
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    new-instance v1, Ll/aje;

    .line 313
    .line 314
    const-string v3, "mmcv_android_cartoon_fake_laugh_model"

    .line 315
    .line 316
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 317
    .line 318
    .line 319
    move-result v4

    .line 320
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 321
    .line 322
    .line 323
    const-string v3, "mmcv_android_cartoon_fake_laugh_model"

    .line 324
    .line 325
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    new-instance v1, Ll/aje;

    .line 329
    .line 330
    const-string v3, "mmcv_android_cartoon_a_project_model"

    .line 331
    .line 332
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 333
    .line 334
    .line 335
    move-result v4

    .line 336
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 337
    .line 338
    .line 339
    const-string v3, "mmcv_android_cartoon_a_project_model"

    .line 340
    .line 341
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    new-instance v1, Ll/aje;

    .line 345
    .line 346
    const-string v3, "mmcv_android_stylize_face_model"

    .line 347
    .line 348
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 349
    .line 350
    .line 351
    move-result v4

    .line 352
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 353
    .line 354
    .line 355
    const-string v3, "mmcv_android_stylize_face_model"

    .line 356
    .line 357
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    new-instance v1, Ll/aje;

    .line 361
    .line 362
    const-string v3, "mmcv_android_small_stylize_face_model"

    .line 363
    .line 364
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 365
    .line 366
    .line 367
    move-result v4

    .line 368
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 369
    .line 370
    .line 371
    const-string v3, "mmcv_android_small_stylize_face_model"

    .line 372
    .line 373
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    new-instance v1, Ll/aje;

    .line 377
    .line 378
    const-string v3, "mmcv_android_hand_segment_model"

    .line 379
    .line 380
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 381
    .line 382
    .line 383
    move-result v4

    .line 384
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 385
    .line 386
    .line 387
    const-string v3, "mmcv_android_hand_segment_model"

    .line 388
    .line 389
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 390
    .line 391
    .line 392
    new-instance v1, Ll/aje;

    .line 393
    .line 394
    const-string v3, "mmcv_android_cartoon_cry_face_model"

    .line 395
    .line 396
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 397
    .line 398
    .line 399
    move-result v4

    .line 400
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 401
    .line 402
    .line 403
    const-string v3, "mmcv_android_cartoon_cry_face_model"

    .line 404
    .line 405
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 406
    .line 407
    .line 408
    new-instance v1, Ll/aje;

    .line 409
    .line 410
    const-string v3, "mmcv_android_pick_nose_model"

    .line 411
    .line 412
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 413
    .line 414
    .line 415
    move-result v4

    .line 416
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 417
    .line 418
    .line 419
    const-string v3, "mmcv_android_pick_nose_model"

    .line 420
    .line 421
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    new-instance v1, Ll/aje;

    .line 425
    .line 426
    const-string v3, "mmcv_android_ar_gift_model"

    .line 427
    .line 428
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 429
    .line 430
    .line 431
    move-result v4

    .line 432
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 433
    .line 434
    .line 435
    const-string v3, "mmcv_android_ar_gift_model"

    .line 436
    .line 437
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    new-instance v1, Ll/aje;

    .line 441
    .line 442
    const-string v3, "mmcv_android_handgesture_model"

    .line 443
    .line 444
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 445
    .line 446
    .line 447
    move-result v4

    .line 448
    invoke-direct {v1, v3, v5, v6, v4}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 449
    .line 450
    .line 451
    const-string v3, "mmcv_android_handgesture_model"

    .line 452
    .line 453
    invoke-interface {v0, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 454
    .line 455
    .line 456
    new-instance v1, Ll/aje;

    .line 457
    .line 458
    const-string v3, "mmcv_android_byte_model"

    .line 459
    .line 460
    invoke-direct {p0, v2}, Ll/af00;->f(Z)Z

    .line 461
    .line 462
    .line 463
    move-result v2

    .line 464
    invoke-direct {v1, v3, v5, v6, v2}, Ll/aje;-><init>(Ljava/lang/String;ZIZ)V

    .line 465
    .line 466
    .line 467
    const-string v2, "mmcv_android_byte_model"

    .line 468
    .line 469
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 470
    .line 471
    .line 472
    new-instance v1, Ll/bje;

    .line 473
    .line 474
    invoke-direct {v1, v0, p0}, Ll/bje;-><init>(Ljava/util/Map;Ll/af00;)V

    .line 475
    .line 476
    .line 477
    iput-object v1, p0, Ll/af00;->b:Ll/bje;

    .line 478
    .line 479
    invoke-virtual {v1}, Ll/bje;->f()V

    .line 480
    .line 481
    .line 482
    return-void
.end method

.method public static synthetic a(Ll/af00;)Ljava/util/Map;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/af00;->a:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method

.method public static declared-synchronized b()Ll/af00;
    .locals 2

    .line 1
    const-class v0, Ll/af00;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/af00;->c:Ll/af00;

    .line 5
    .line 6
    if-nez v1, :cond_0

    .line 7
    .line 8
    new-instance v1, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v1, Ll/af00;->d:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance v1, Ll/af00;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/af00;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v1, Ll/af00;->c:Ll/af00;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    :goto_0
    sget-object v1, Ll/af00;->c:Ll/af00;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    monitor-exit v0

    .line 28
    return-object v1

    .line 29
    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v1
.end method

.method private d(Ll/aje;)Ljava/io/File;
    .locals 1

    .line 1
    sget-object p0, Ll/af00;->d:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p1}, Ll/aje;->g()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-nez v0, :cond_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    invoke-static {p1}, Ll/zie;->j(Ll/aje;)Ljava/io/File;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    monitor-exit p0

    .line 18
    return-object p1

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    :goto_0
    const/4 p1, 0x0

    .line 22
    monitor-exit p0

    .line 23
    return-object p1

    .line 24
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p1
.end method

.method private f(Z)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method


# virtual methods
.method public c(Ljava/lang/String;)Ljava/io/File;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/af00;->a:Ljava/util/Map;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Ll/aje;

    .line 8
    .line 9
    invoke-direct {p0, p1}, Ll/af00;->d(Ll/aje;)Ljava/io/File;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public varargs e(Ll/qe00;[Ljava/lang/String;)V
    .locals 3

    .line 1
    if-eqz p2, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    new-array v0, v0, [Ljava/lang/Object;

    .line 5
    .line 6
    const-string v1, "lclclc_"

    .line 7
    .line 8
    const-string v2, " requestAllConfigs "

    .line 9
    .line 10
    invoke-static {v1, v2, v0}, Lcom/immomo/resdownloader/log/MLog;->d(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/af00;->b:Ll/bje;

    .line 14
    .line 15
    new-instance v1, Ll/af00$a;

    .line 16
    .line 17
    invoke-direct {v1, p0, p2, p1}, Ll/af00$a;-><init>(Ll/af00;[Ljava/lang/String;Ll/qe00;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0, v1}, Ll/bje;->i(Ll/bje$b;)V

    .line 21
    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    const-string p0, "dynamicResourceNames can not be empty"

    .line 25
    .line 26
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
