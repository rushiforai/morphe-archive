.class public final Ll/o3s0;
.super Ll/g6s0;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/g6s0;-><init>()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 5
    .line 6
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zze:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 12
    .line 13
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zzf:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 14
    .line 15
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 19
    .line 20
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zzg:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 21
    .line 22
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 26
    .line 27
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zzh:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 33
    .line 34
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zzi:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 35
    .line 36
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 40
    .line 41
    sget-object v1, Lcom/google/android/gms/internal/measurement/zzbv;->zzj:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 42
    .line 43
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Ll/g6s0;->a:Ljava/util/List;

    .line 47
    .line 48
    sget-object v0, Lcom/google/android/gms/internal/measurement/zzbv;->zzk:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 49
    .line 50
    invoke-interface {p0, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 51
    .line 52
    .line 53
    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ll/gix0;Ljava/util/List;)Ll/ewr0;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ll/gix0;",
            "Ljava/util/List<",
            "Ll/ewr0;",
            ">;)",
            "Ll/ewr0;"
        }
    .end annotation

    .line 1
    sget-object v0, Ll/l7s0;->a:[I

    .line 2
    .line 3
    invoke-static {p1}, Ll/tqw0;->c(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/zzbv;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    const-wide/16 v1, 0x1f

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    const/4 v4, 0x1

    .line 17
    const/4 v5, 0x0

    .line 18
    packed-switch v0, :pswitch_data_0

    .line 19
    .line 20
    .line 21
    invoke-super {p0, p1}, Ll/g6s0;->a(Ljava/lang/String;)Ll/ewr0;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :pswitch_0
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzk:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 27
    .line 28
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 29
    .line 30
    .line 31
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Ll/ewr0;

    .line 36
    .line 37
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 46
    .line 47
    .line 48
    move-result-wide p0

    .line 49
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Ll/ewr0;

    .line 58
    .line 59
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 68
    .line 69
    .line 70
    move-result-wide p1

    .line 71
    invoke-static {p1, p2}, Ll/tqw0;->i(D)I

    .line 72
    .line 73
    .line 74
    move-result p1

    .line 75
    new-instance p2, Ll/glr0;

    .line 76
    .line 77
    xor-int/2addr p0, p1

    .line 78
    int-to-double p0, p0

    .line 79
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-direct {p2, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 84
    .line 85
    .line 86
    return-object p2

    .line 87
    :pswitch_1
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzj:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 88
    .line 89
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 90
    .line 91
    .line 92
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    check-cast p0, Ll/ewr0;

    .line 97
    .line 98
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 107
    .line 108
    .line 109
    move-result-wide p0

    .line 110
    invoke-static {p0, p1}, Ll/tqw0;->m(D)J

    .line 111
    .line 112
    .line 113
    move-result-wide p0

    .line 114
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object p3

    .line 118
    check-cast p3, Ll/ewr0;

    .line 119
    .line 120
    invoke-virtual {p2, p3}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 121
    .line 122
    .line 123
    move-result-object p2

    .line 124
    invoke-interface {p2}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 125
    .line 126
    .line 127
    move-result-object p2

    .line 128
    invoke-virtual {p2}, Ljava/lang/Double;->doubleValue()D

    .line 129
    .line 130
    .line 131
    move-result-wide p2

    .line 132
    invoke-static {p2, p3}, Ll/tqw0;->m(D)J

    .line 133
    .line 134
    .line 135
    move-result-wide p2

    .line 136
    and-long/2addr p2, v1

    .line 137
    long-to-int p2, p2

    .line 138
    new-instance p3, Ll/glr0;

    .line 139
    .line 140
    ushr-long/2addr p0, p2

    .line 141
    long-to-double p0, p0

    .line 142
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    invoke-direct {p3, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 147
    .line 148
    .line 149
    return-object p3

    .line 150
    :pswitch_2
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzi:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 151
    .line 152
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 153
    .line 154
    .line 155
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object p0

    .line 159
    check-cast p0, Ll/ewr0;

    .line 160
    .line 161
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 166
    .line 167
    .line 168
    move-result-object p0

    .line 169
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 170
    .line 171
    .line 172
    move-result-wide p0

    .line 173
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    check-cast p1, Ll/ewr0;

    .line 182
    .line 183
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 192
    .line 193
    .line 194
    move-result-wide p1

    .line 195
    invoke-static {p1, p2}, Ll/tqw0;->m(D)J

    .line 196
    .line 197
    .line 198
    move-result-wide p1

    .line 199
    and-long/2addr p1, v1

    .line 200
    long-to-int p1, p1

    .line 201
    new-instance p2, Ll/glr0;

    .line 202
    .line 203
    shr-int/2addr p0, p1

    .line 204
    int-to-double p0, p0

    .line 205
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 206
    .line 207
    .line 208
    move-result-object p0

    .line 209
    invoke-direct {p2, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 210
    .line 211
    .line 212
    return-object p2

    .line 213
    :pswitch_3
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzh:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 214
    .line 215
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 216
    .line 217
    .line 218
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p0

    .line 222
    check-cast p0, Ll/ewr0;

    .line 223
    .line 224
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 229
    .line 230
    .line 231
    move-result-object p0

    .line 232
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 233
    .line 234
    .line 235
    move-result-wide p0

    .line 236
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 237
    .line 238
    .line 239
    move-result p0

    .line 240
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Ll/ewr0;

    .line 245
    .line 246
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 255
    .line 256
    .line 257
    move-result-wide p1

    .line 258
    invoke-static {p1, p2}, Ll/tqw0;->i(D)I

    .line 259
    .line 260
    .line 261
    move-result p1

    .line 262
    new-instance p2, Ll/glr0;

    .line 263
    .line 264
    or-int/2addr p0, p1

    .line 265
    int-to-double p0, p0

    .line 266
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 267
    .line 268
    .line 269
    move-result-object p0

    .line 270
    invoke-direct {p2, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 271
    .line 272
    .line 273
    return-object p2

    .line 274
    :pswitch_4
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzg:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 275
    .line 276
    invoke-static {p0, v4, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 277
    .line 278
    .line 279
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 280
    .line 281
    .line 282
    move-result-object p0

    .line 283
    check-cast p0, Ll/ewr0;

    .line 284
    .line 285
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 290
    .line 291
    .line 292
    move-result-object p0

    .line 293
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 294
    .line 295
    .line 296
    move-result-wide p0

    .line 297
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 298
    .line 299
    .line 300
    move-result p0

    .line 301
    new-instance p1, Ll/glr0;

    .line 302
    .line 303
    not-int p0, p0

    .line 304
    int-to-double p2, p0

    .line 305
    invoke-static {p2, p3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 306
    .line 307
    .line 308
    move-result-object p0

    .line 309
    invoke-direct {p1, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 310
    .line 311
    .line 312
    return-object p1

    .line 313
    :pswitch_5
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zzf:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 314
    .line 315
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 316
    .line 317
    .line 318
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 319
    .line 320
    .line 321
    move-result-object p0

    .line 322
    check-cast p0, Ll/ewr0;

    .line 323
    .line 324
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 325
    .line 326
    .line 327
    move-result-object p0

    .line 328
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 333
    .line 334
    .line 335
    move-result-wide p0

    .line 336
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 337
    .line 338
    .line 339
    move-result p0

    .line 340
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object p1

    .line 344
    check-cast p1, Ll/ewr0;

    .line 345
    .line 346
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 351
    .line 352
    .line 353
    move-result-object p1

    .line 354
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 355
    .line 356
    .line 357
    move-result-wide p1

    .line 358
    invoke-static {p1, p2}, Ll/tqw0;->m(D)J

    .line 359
    .line 360
    .line 361
    move-result-wide p1

    .line 362
    and-long/2addr p1, v1

    .line 363
    long-to-int p1, p1

    .line 364
    new-instance p2, Ll/glr0;

    .line 365
    .line 366
    shl-int/2addr p0, p1

    .line 367
    int-to-double p0, p0

    .line 368
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 369
    .line 370
    .line 371
    move-result-object p0

    .line 372
    invoke-direct {p2, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 373
    .line 374
    .line 375
    return-object p2

    .line 376
    :pswitch_6
    sget-object p0, Lcom/google/android/gms/internal/measurement/zzbv;->zze:Lcom/google/android/gms/internal/measurement/zzbv;

    .line 377
    .line 378
    invoke-static {p0, v3, p3}, Ll/tqw0;->f(Lcom/google/android/gms/internal/measurement/zzbv;ILjava/util/List;)V

    .line 379
    .line 380
    .line 381
    invoke-interface {p3, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 382
    .line 383
    .line 384
    move-result-object p0

    .line 385
    check-cast p0, Ll/ewr0;

    .line 386
    .line 387
    invoke-virtual {p2, p0}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 388
    .line 389
    .line 390
    move-result-object p0

    .line 391
    invoke-interface {p0}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 392
    .line 393
    .line 394
    move-result-object p0

    .line 395
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 396
    .line 397
    .line 398
    move-result-wide p0

    .line 399
    invoke-static {p0, p1}, Ll/tqw0;->i(D)I

    .line 400
    .line 401
    .line 402
    move-result p0

    .line 403
    invoke-interface {p3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object p1

    .line 407
    check-cast p1, Ll/ewr0;

    .line 408
    .line 409
    invoke-virtual {p2, p1}, Ll/gix0;->c(Ll/ewr0;)Ll/ewr0;

    .line 410
    .line 411
    .line 412
    move-result-object p1

    .line 413
    invoke-interface {p1}, Ll/ewr0;->zze()Ljava/lang/Double;

    .line 414
    .line 415
    .line 416
    move-result-object p1

    .line 417
    invoke-virtual {p1}, Ljava/lang/Double;->doubleValue()D

    .line 418
    .line 419
    .line 420
    move-result-wide p1

    .line 421
    invoke-static {p1, p2}, Ll/tqw0;->i(D)I

    .line 422
    .line 423
    .line 424
    move-result p1

    .line 425
    new-instance p2, Ll/glr0;

    .line 426
    .line 427
    and-int/2addr p0, p1

    .line 428
    int-to-double p0, p0

    .line 429
    invoke-static {p0, p1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 430
    .line 431
    .line 432
    move-result-object p0

    .line 433
    invoke-direct {p2, p0}, Ll/glr0;-><init>(Ljava/lang/Double;)V

    .line 434
    .line 435
    .line 436
    return-object p2

    .line 437
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
