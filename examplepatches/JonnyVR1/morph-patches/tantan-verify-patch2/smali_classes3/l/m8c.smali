.class public Ll/m8c;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final c:[Ljava/lang/String;

.field public static final d:[Ljava/lang/String;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/util/Locale;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "in"

    .line 2
    .line 3
    filled-new-array {v0}, [Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/m8c;->c:[Ljava/lang/String;

    .line 8
    .line 9
    const-string v0, "zh"

    .line 10
    .line 11
    const-string v1, "ko"

    .line 12
    .line 13
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sput-object v0, Ll/m8c;->d:[Ljava/lang/String;

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Ljava/util/Locale;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 5
    .line 6
    iput-object p2, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 7
    .line 8
    return-void
.end method

.method public static b(J)Ljava/util/Date;
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-gtz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 14
    .line 15
    .line 16
    const/16 p0, 0xb

    .line 17
    .line 18
    const/4 p1, 0x0

    .line 19
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0xc

    .line 23
    .line 24
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 25
    .line 26
    .line 27
    const/16 p0, 0xd

    .line 28
    .line 29
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 30
    .line 31
    .line 32
    const/16 p0, 0xe

    .line 33
    .line 34
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method


# virtual methods
.method public a()Ljava/text/SimpleDateFormat;
    .locals 10

    .line 1
    iget-object v0, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string v2, "yy/MM/dd"

    .line 10
    .line 11
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    const-string v3, "ja"

    .line 16
    .line 17
    if-eqz v1, :cond_4

    .line 18
    .line 19
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eqz v1, :cond_0

    .line 30
    .line 31
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 32
    .line 33
    goto/16 :goto_c

    .line 34
    .line 35
    :cond_0
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 36
    .line 37
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-nez v1, :cond_3

    .line 44
    .line 45
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-eqz v1, :cond_1

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :cond_1
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    if-eqz v0, :cond_2

    .line 63
    .line 64
    const-string v0, "yy/M/dd"

    .line 65
    .line 66
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 67
    .line 68
    goto/16 :goto_c

    .line 69
    .line 70
    :cond_2
    const-string v0, "MM/dd/yy"

    .line 71
    .line 72
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 73
    .line 74
    goto/16 :goto_c

    .line 75
    .line 76
    :cond_3
    :goto_0
    const-string v0, "dd/MM/yy"

    .line 77
    .line 78
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 79
    .line 80
    goto/16 :goto_c

    .line 81
    .line 82
    :cond_4
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 83
    .line 84
    const-string v2, "EEEE yy/MM/dd"

    .line 85
    .line 86
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 87
    .line 88
    .line 89
    move-result v1

    .line 90
    if-eqz v1, :cond_9

    .line 91
    .line 92
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 93
    .line 94
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object v1

    .line 98
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result v1

    .line 102
    if-eqz v1, :cond_5

    .line 103
    .line 104
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 105
    .line 106
    goto/16 :goto_c

    .line 107
    .line 108
    :cond_5
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 109
    .line 110
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 111
    .line 112
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    if-nez v1, :cond_8

    .line 117
    .line 118
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 119
    .line 120
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result v1

    .line 128
    if-eqz v1, :cond_6

    .line 129
    .line 130
    goto :goto_1

    .line 131
    :cond_6
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    if-eqz v0, :cond_7

    .line 136
    .line 137
    const-string v0, "EEEE yy/M/dd"

    .line 138
    .line 139
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 140
    .line 141
    goto/16 :goto_c

    .line 142
    .line 143
    :cond_7
    const-string v0, "EEEE MM/dd/yy"

    .line 144
    .line 145
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_c

    .line 148
    .line 149
    :cond_8
    :goto_1
    const-string v0, "EEEE dd/MM/yy"

    .line 150
    .line 151
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_c

    .line 154
    .line 155
    :cond_9
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 156
    .line 157
    const-string v2, "yyyy/MM/dd"

    .line 158
    .line 159
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    const-string v4, "dd/MM/yyyy"

    .line 164
    .line 165
    const-string v5, "MM/dd/yyyy"

    .line 166
    .line 167
    const-string v6, "yyyy/M/dd"

    .line 168
    .line 169
    if-eqz v1, :cond_e

    .line 170
    .line 171
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 172
    .line 173
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_a

    .line 182
    .line 183
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 184
    .line 185
    goto/16 :goto_c

    .line 186
    .line 187
    :cond_a
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 188
    .line 189
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 190
    .line 191
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 192
    .line 193
    .line 194
    move-result v1

    .line 195
    if-nez v1, :cond_d

    .line 196
    .line 197
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 198
    .line 199
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 200
    .line 201
    .line 202
    move-result-object v1

    .line 203
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 204
    .line 205
    .line 206
    move-result v1

    .line 207
    if-eqz v1, :cond_b

    .line 208
    .line 209
    goto :goto_2

    .line 210
    :cond_b
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_c

    .line 215
    .line 216
    iput-object v6, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_c

    .line 219
    .line 220
    :cond_c
    iput-object v5, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 221
    .line 222
    goto/16 :goto_c

    .line 223
    .line 224
    :cond_d
    :goto_2
    iput-object v4, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 225
    .line 226
    goto/16 :goto_c

    .line 227
    .line 228
    :cond_e
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 229
    .line 230
    const-string v7, "yyyy-MM-dd"

    .line 231
    .line 232
    invoke-virtual {v7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result v1

    .line 236
    const-string v8, "ko"

    .line 237
    .line 238
    const-string v9, "zh"

    .line 239
    .line 240
    if-eqz v1, :cond_14

    .line 241
    .line 242
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result v1

    .line 246
    if-eqz v1, :cond_f

    .line 247
    .line 248
    iput-object v7, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 249
    .line 250
    goto/16 :goto_c

    .line 251
    .line 252
    :cond_f
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 253
    .line 254
    sget-object v7, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 255
    .line 256
    invoke-virtual {v1, v7}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 257
    .line 258
    .line 259
    move-result v1

    .line 260
    if-nez v1, :cond_13

    .line 261
    .line 262
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 263
    .line 264
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    if-eqz v1, :cond_10

    .line 273
    .line 274
    goto :goto_3

    .line 275
    :cond_10
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v1

    .line 279
    if-eqz v1, :cond_11

    .line 280
    .line 281
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 282
    .line 283
    goto/16 :goto_c

    .line 284
    .line 285
    :cond_11
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v0

    .line 289
    if-eqz v0, :cond_12

    .line 290
    .line 291
    iput-object v6, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 292
    .line 293
    goto/16 :goto_c

    .line 294
    .line 295
    :cond_12
    iput-object v5, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 296
    .line 297
    goto/16 :goto_c

    .line 298
    .line 299
    :cond_13
    :goto_3
    iput-object v4, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 300
    .line 301
    goto/16 :goto_c

    .line 302
    .line 303
    :cond_14
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 304
    .line 305
    const-string v2, "yyyy-MM-dd HH:mm"

    .line 306
    .line 307
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    if-eqz v1, :cond_1a

    .line 312
    .line 313
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 314
    .line 315
    .line 316
    move-result v1

    .line 317
    if-eqz v1, :cond_15

    .line 318
    .line 319
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 320
    .line 321
    goto/16 :goto_c

    .line 322
    .line 323
    :cond_15
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 324
    .line 325
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 326
    .line 327
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-nez v1, :cond_19

    .line 332
    .line 333
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 334
    .line 335
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 340
    .line 341
    .line 342
    move-result v1

    .line 343
    if-eqz v1, :cond_16

    .line 344
    .line 345
    goto :goto_4

    .line 346
    :cond_16
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    move-result v1

    .line 350
    if-eqz v1, :cond_17

    .line 351
    .line 352
    const-string v0, "yyyy/MM/dd HH:mm"

    .line 353
    .line 354
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 355
    .line 356
    goto/16 :goto_c

    .line 357
    .line 358
    :cond_17
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    if-eqz v0, :cond_18

    .line 363
    .line 364
    const-string v0, "yyyy/M/dd HH:mm"

    .line 365
    .line 366
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 367
    .line 368
    goto/16 :goto_c

    .line 369
    .line 370
    :cond_18
    const-string v0, "MM/dd/yyyy HH:mm"

    .line 371
    .line 372
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 373
    .line 374
    goto/16 :goto_c

    .line 375
    .line 376
    :cond_19
    :goto_4
    const-string v0, "dd/MM/yyyy HH:mm"

    .line 377
    .line 378
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 379
    .line 380
    goto/16 :goto_c

    .line 381
    .line 382
    :cond_1a
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 383
    .line 384
    const-string v2, "yyyy-MM-dd HH:mm:ss"

    .line 385
    .line 386
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 387
    .line 388
    .line 389
    move-result v1

    .line 390
    if-eqz v1, :cond_20

    .line 391
    .line 392
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    if-eqz v1, :cond_1b

    .line 397
    .line 398
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 399
    .line 400
    goto/16 :goto_c

    .line 401
    .line 402
    :cond_1b
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 403
    .line 404
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 405
    .line 406
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 407
    .line 408
    .line 409
    move-result v1

    .line 410
    if-nez v1, :cond_1f

    .line 411
    .line 412
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 413
    .line 414
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 415
    .line 416
    .line 417
    move-result-object v1

    .line 418
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 419
    .line 420
    .line 421
    move-result v1

    .line 422
    if-eqz v1, :cond_1c

    .line 423
    .line 424
    goto :goto_5

    .line 425
    :cond_1c
    invoke-virtual {v8, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 426
    .line 427
    .line 428
    move-result v1

    .line 429
    if-eqz v1, :cond_1d

    .line 430
    .line 431
    const-string v0, "yyyy/MM/dd HH:mm:ss"

    .line 432
    .line 433
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 434
    .line 435
    goto/16 :goto_c

    .line 436
    .line 437
    :cond_1d
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    if-eqz v0, :cond_1e

    .line 442
    .line 443
    const-string v0, "yyyy/M/dd HH:mm:ss"

    .line 444
    .line 445
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 446
    .line 447
    goto/16 :goto_c

    .line 448
    .line 449
    :cond_1e
    const-string v0, "MM/dd/yyyy HH:mm:ss"

    .line 450
    .line 451
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 452
    .line 453
    goto/16 :goto_c

    .line 454
    .line 455
    :cond_1f
    :goto_5
    const-string v0, "dd/MM/yyyy HH:mm:ss"

    .line 456
    .line 457
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 458
    .line 459
    goto/16 :goto_c

    .line 460
    .line 461
    :cond_20
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 462
    .line 463
    const-string v2, "EEEE yy/MM/dd HH:mm"

    .line 464
    .line 465
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    move-result v1

    .line 469
    if-eqz v1, :cond_25

    .line 470
    .line 471
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 472
    .line 473
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 474
    .line 475
    .line 476
    move-result-object v1

    .line 477
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 478
    .line 479
    .line 480
    move-result v1

    .line 481
    if-eqz v1, :cond_21

    .line 482
    .line 483
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 484
    .line 485
    goto/16 :goto_c

    .line 486
    .line 487
    :cond_21
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 488
    .line 489
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 490
    .line 491
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 492
    .line 493
    .line 494
    move-result v1

    .line 495
    if-nez v1, :cond_24

    .line 496
    .line 497
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 498
    .line 499
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 500
    .line 501
    .line 502
    move-result-object v1

    .line 503
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 504
    .line 505
    .line 506
    move-result v1

    .line 507
    if-eqz v1, :cond_22

    .line 508
    .line 509
    goto :goto_6

    .line 510
    :cond_22
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 511
    .line 512
    .line 513
    move-result v0

    .line 514
    if-eqz v0, :cond_23

    .line 515
    .line 516
    const-string v0, "EEEE yy/M/dd HH:mm"

    .line 517
    .line 518
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 519
    .line 520
    goto/16 :goto_c

    .line 521
    .line 522
    :cond_23
    const-string v0, "EEEE MM/dd/yyyy HH:mm"

    .line 523
    .line 524
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 525
    .line 526
    goto/16 :goto_c

    .line 527
    .line 528
    :cond_24
    :goto_6
    const-string v0, "EEEE dd/MM/yyyy HH:mm"

    .line 529
    .line 530
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 531
    .line 532
    goto/16 :goto_c

    .line 533
    .line 534
    :cond_25
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 535
    .line 536
    const-string v2, "EEEE yy/MM/dd HH:mm:ss"

    .line 537
    .line 538
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 539
    .line 540
    .line 541
    move-result v1

    .line 542
    if-eqz v1, :cond_2a

    .line 543
    .line 544
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 545
    .line 546
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 551
    .line 552
    .line 553
    move-result v1

    .line 554
    if-eqz v1, :cond_26

    .line 555
    .line 556
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 557
    .line 558
    goto/16 :goto_c

    .line 559
    .line 560
    :cond_26
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 561
    .line 562
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 563
    .line 564
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 565
    .line 566
    .line 567
    move-result v1

    .line 568
    if-nez v1, :cond_29

    .line 569
    .line 570
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 571
    .line 572
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 573
    .line 574
    .line 575
    move-result-object v1

    .line 576
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 577
    .line 578
    .line 579
    move-result v1

    .line 580
    if-eqz v1, :cond_27

    .line 581
    .line 582
    goto :goto_7

    .line 583
    :cond_27
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 584
    .line 585
    .line 586
    move-result v0

    .line 587
    if-eqz v0, :cond_28

    .line 588
    .line 589
    const-string v0, "EEEE yy/M/dd HH:mm:ss"

    .line 590
    .line 591
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 592
    .line 593
    goto/16 :goto_c

    .line 594
    .line 595
    :cond_28
    const-string v0, "EEEE MM/dd/yyyy HH:mm:ss"

    .line 596
    .line 597
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 598
    .line 599
    goto/16 :goto_c

    .line 600
    .line 601
    :cond_29
    :goto_7
    const-string v0, "EEEE dd/MM/yyyy HH:mm:ss"

    .line 602
    .line 603
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 604
    .line 605
    goto/16 :goto_c

    .line 606
    .line 607
    :cond_2a
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 608
    .line 609
    const-string v2, "MM/dd"

    .line 610
    .line 611
    invoke-virtual {v2, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 612
    .line 613
    .line 614
    move-result v1

    .line 615
    const-string v4, "M/dd"

    .line 616
    .line 617
    if-eqz v1, :cond_2f

    .line 618
    .line 619
    sget-object v1, Ll/m8c;->d:[Ljava/lang/String;

    .line 620
    .line 621
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 622
    .line 623
    .line 624
    move-result-object v1

    .line 625
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result v1

    .line 629
    if-eqz v1, :cond_2b

    .line 630
    .line 631
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 632
    .line 633
    goto/16 :goto_c

    .line 634
    .line 635
    :cond_2b
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 636
    .line 637
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 638
    .line 639
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 640
    .line 641
    .line 642
    move-result v1

    .line 643
    if-nez v1, :cond_2e

    .line 644
    .line 645
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 646
    .line 647
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 648
    .line 649
    .line 650
    move-result-object v1

    .line 651
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 652
    .line 653
    .line 654
    move-result v1

    .line 655
    if-eqz v1, :cond_2c

    .line 656
    .line 657
    goto :goto_8

    .line 658
    :cond_2c
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 659
    .line 660
    .line 661
    move-result v0

    .line 662
    if-eqz v0, :cond_2d

    .line 663
    .line 664
    iput-object v4, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 665
    .line 666
    goto/16 :goto_c

    .line 667
    .line 668
    :cond_2d
    const-string v0, "MMMM dd"

    .line 669
    .line 670
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 671
    .line 672
    goto/16 :goto_c

    .line 673
    .line 674
    :cond_2e
    :goto_8
    const-string v0, "dd MMMM"

    .line 675
    .line 676
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 677
    .line 678
    goto/16 :goto_c

    .line 679
    .line 680
    :cond_2f
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 681
    .line 682
    const-string v5, "EEEE MM/dd"

    .line 683
    .line 684
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 685
    .line 686
    .line 687
    move-result v1

    .line 688
    if-eqz v1, :cond_33

    .line 689
    .line 690
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 691
    .line 692
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 693
    .line 694
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 695
    .line 696
    .line 697
    move-result v1

    .line 698
    if-nez v1, :cond_32

    .line 699
    .line 700
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 701
    .line 702
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 703
    .line 704
    .line 705
    move-result-object v1

    .line 706
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 707
    .line 708
    .line 709
    move-result v1

    .line 710
    if-eqz v1, :cond_30

    .line 711
    .line 712
    goto :goto_9

    .line 713
    :cond_30
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 714
    .line 715
    .line 716
    move-result v0

    .line 717
    if-eqz v0, :cond_31

    .line 718
    .line 719
    const-string v0, "EEEE M/dd"

    .line 720
    .line 721
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 722
    .line 723
    goto/16 :goto_c

    .line 724
    .line 725
    :cond_31
    iput-object v5, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 726
    .line 727
    goto/16 :goto_c

    .line 728
    .line 729
    :cond_32
    :goto_9
    const-string v0, "EEEE dd/MM"

    .line 730
    .line 731
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 732
    .line 733
    goto/16 :goto_c

    .line 734
    .line 735
    :cond_33
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 736
    .line 737
    const-string v5, "MM-dd HH:mm"

    .line 738
    .line 739
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 740
    .line 741
    .line 742
    move-result v1

    .line 743
    if-eqz v1, :cond_38

    .line 744
    .line 745
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 746
    .line 747
    .line 748
    move-result v1

    .line 749
    if-eqz v1, :cond_34

    .line 750
    .line 751
    iput-object v5, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 752
    .line 753
    goto/16 :goto_c

    .line 754
    .line 755
    :cond_34
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 756
    .line 757
    sget-object v2, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 758
    .line 759
    invoke-virtual {v1, v2}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 760
    .line 761
    .line 762
    move-result v1

    .line 763
    if-nez v1, :cond_37

    .line 764
    .line 765
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 766
    .line 767
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 768
    .line 769
    .line 770
    move-result-object v1

    .line 771
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 772
    .line 773
    .line 774
    move-result v1

    .line 775
    if-eqz v1, :cond_35

    .line 776
    .line 777
    goto :goto_a

    .line 778
    :cond_35
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 779
    .line 780
    .line 781
    move-result v0

    .line 782
    if-eqz v0, :cond_36

    .line 783
    .line 784
    const-string v0, "M/dd HH:mm"

    .line 785
    .line 786
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 787
    .line 788
    goto :goto_c

    .line 789
    :cond_36
    const-string v0, "MM/dd HH:mm"

    .line 790
    .line 791
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 792
    .line 793
    goto :goto_c

    .line 794
    :cond_37
    :goto_a
    const-string v0, "dd/MM HH:mm"

    .line 795
    .line 796
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 797
    .line 798
    goto :goto_c

    .line 799
    :cond_38
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 800
    .line 801
    const-string v5, "MM-dd"

    .line 802
    .line 803
    invoke-virtual {v5, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 804
    .line 805
    .line 806
    move-result v1

    .line 807
    if-eqz v1, :cond_3d

    .line 808
    .line 809
    invoke-virtual {v9, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 810
    .line 811
    .line 812
    move-result v1

    .line 813
    if-eqz v1, :cond_39

    .line 814
    .line 815
    iput-object v5, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 816
    .line 817
    goto :goto_c

    .line 818
    :cond_39
    iget-object v1, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 819
    .line 820
    sget-object v5, Ljava/util/Locale;->UK:Ljava/util/Locale;

    .line 821
    .line 822
    invoke-virtual {v1, v5}, Ljava/util/Locale;->equals(Ljava/lang/Object;)Z

    .line 823
    .line 824
    .line 825
    move-result v1

    .line 826
    if-nez v1, :cond_3c

    .line 827
    .line 828
    sget-object v1, Ll/m8c;->c:[Ljava/lang/String;

    .line 829
    .line 830
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 831
    .line 832
    .line 833
    move-result-object v1

    .line 834
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 835
    .line 836
    .line 837
    move-result v1

    .line 838
    if-eqz v1, :cond_3a

    .line 839
    .line 840
    goto :goto_b

    .line 841
    :cond_3a
    invoke-virtual {v3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 842
    .line 843
    .line 844
    move-result v0

    .line 845
    if-eqz v0, :cond_3b

    .line 846
    .line 847
    iput-object v4, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 848
    .line 849
    goto :goto_c

    .line 850
    :cond_3b
    iput-object v2, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 851
    .line 852
    goto :goto_c

    .line 853
    :cond_3c
    :goto_b
    const-string v0, "dd/MM"

    .line 854
    .line 855
    iput-object v0, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 856
    .line 857
    :cond_3d
    :goto_c
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 858
    .line 859
    iget-object v1, p0, Ll/m8c;->a:Ljava/lang/String;

    .line 860
    .line 861
    iget-object p0, p0, Ll/m8c;->b:Ljava/util/Locale;

    .line 862
    .line 863
    invoke-direct {v0, v1, p0}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    .line 864
    .line 865
    .line 866
    return-object v0
.end method
