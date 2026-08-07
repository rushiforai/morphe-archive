.class public abstract Lcom/alibaba/fastjson/JSONValidator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Cloneable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/alibaba/fastjson/JSONValidator$ReaderValidator;,
        Lcom/alibaba/fastjson/JSONValidator$UTF16Validator;,
        Lcom/alibaba/fastjson/JSONValidator$UTF8InputStreamValidator;,
        Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;,
        Lcom/alibaba/fastjson/JSONValidator$Type;
    }
.end annotation


# instance fields
.field protected ch:C

.field protected count:I

.field protected eof:Z

.field protected pos:I

.field protected supportMultiValue:Z

.field protected type:Lcom/alibaba/fastjson/JSONValidator$Type;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/alibaba/fastjson/JSONValidator;->pos:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Lcom/alibaba/fastjson/JSONValidator;->count:I

    .line 9
    .line 10
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/alibaba/fastjson/JSONValidator;->supportMultiValue:Z

    .line 12
    .line 13
    return-void
.end method

.method public static from(Ljava/io/Reader;)Lcom/alibaba/fastjson/JSONValidator;
    .locals 1

    .line 7
    new-instance v0, Lcom/alibaba/fastjson/JSONValidator$ReaderValidator;

    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONValidator$ReaderValidator;-><init>(Ljava/io/Reader;)V

    return-object v0
.end method

.method public static from(Ljava/lang/String;)Lcom/alibaba/fastjson/JSONValidator;
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONValidator$UTF16Validator;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONValidator$UTF16Validator;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static fromUtf8(Ljava/io/InputStream;)Lcom/alibaba/fastjson/JSONValidator;
    .locals 1

    .line 7
    new-instance v0, Lcom/alibaba/fastjson/JSONValidator$UTF8InputStreamValidator;

    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONValidator$UTF8InputStreamValidator;-><init>(Ljava/io/InputStream;)V

    return-object v0
.end method

.method public static fromUtf8([B)Lcom/alibaba/fastjson/JSONValidator;
    .locals 1

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONValidator$UTF8Validator;-><init>([B)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method

.method public static final isWhiteSpace(C)Z
    .locals 1

    const/16 v0, 0x20

    if-eq p0, v0, :cond_1

    const/16 v0, 0x9

    if-eq p0, v0, :cond_1

    const/16 v0, 0xd

    if-eq p0, v0, :cond_1

    const/16 v0, 0xa

    if-eq p0, v0, :cond_1

    const/16 v0, 0xc

    if-eq p0, v0, :cond_1

    const/16 v0, 0x8

    if-ne p0, v0, :cond_0

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    :goto_0
    const/4 p0, 0x1

    return p0
.end method


# virtual methods
.method public any()V
    .locals 11

    .line 1
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 2
    .line 3
    const/16 v1, 0x75

    .line 4
    .line 5
    const/16 v2, 0x22

    .line 6
    .line 7
    if-eq v0, v2, :cond_28

    .line 8
    .line 9
    const/16 v3, 0x65

    .line 10
    .line 11
    const/16 v4, 0x2d

    .line 12
    .line 13
    const/16 v5, 0x2b

    .line 14
    .line 15
    if-eq v0, v5, :cond_1c

    .line 16
    .line 17
    if-eq v0, v4, :cond_1c

    .line 18
    .line 19
    const/16 v6, 0x5b

    .line 20
    .line 21
    const/16 v7, 0x5d

    .line 22
    .line 23
    const/16 v8, 0x2c

    .line 24
    .line 25
    if-eq v0, v6, :cond_18

    .line 26
    .line 27
    const/16 v6, 0x66

    .line 28
    .line 29
    const/16 v9, 0x6c

    .line 30
    .line 31
    const/16 v10, 0x7d

    .line 32
    .line 33
    if-eq v0, v6, :cond_b

    .line 34
    .line 35
    const/16 v6, 0x6e

    .line 36
    .line 37
    if-eq v0, v6, :cond_11

    .line 38
    .line 39
    const/16 v6, 0x74

    .line 40
    .line 41
    if-eq v0, v6, :cond_5

    .line 42
    .line 43
    const/16 v1, 0x7b

    .line 44
    .line 45
    if-eq v0, v1, :cond_0

    .line 46
    .line 47
    packed-switch v0, :pswitch_data_0

    .line 48
    .line 49
    .line 50
    goto/16 :goto_5

    .line 51
    .line 52
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 56
    .line 57
    .line 58
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 59
    .line 60
    if-ne v0, v10, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 63
    .line 64
    .line 65
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Object:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 66
    .line 67
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 68
    .line 69
    return-void

    .line 70
    :cond_1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 71
    .line 72
    if-ne v0, v2, :cond_2

    .line 73
    .line 74
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->fieldName()V

    .line 75
    .line 76
    .line 77
    goto :goto_1

    .line 78
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 79
    .line 80
    .line 81
    :goto_1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 82
    .line 83
    .line 84
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 85
    .line 86
    const/16 v1, 0x3a

    .line 87
    .line 88
    if-ne v0, v1, :cond_3

    .line 89
    .line 90
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 91
    .line 92
    .line 93
    goto :goto_2

    .line 94
    :cond_3
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 95
    .line 96
    .line 97
    :goto_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 98
    .line 99
    .line 100
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->any()V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 104
    .line 105
    .line 106
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 107
    .line 108
    if-ne v0, v8, :cond_4

    .line 109
    .line 110
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_4
    if-ne v0, v10, :cond_1

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 120
    .line 121
    .line 122
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Object:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 123
    .line 124
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 125
    .line 126
    return-void

    .line 127
    :cond_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 128
    .line 129
    .line 130
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 131
    .line 132
    const/16 v2, 0x72

    .line 133
    .line 134
    if-eq v0, v2, :cond_6

    .line 135
    .line 136
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 137
    .line 138
    .line 139
    :cond_6
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 140
    .line 141
    .line 142
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 143
    .line 144
    if-eq v0, v1, :cond_7

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 147
    .line 148
    .line 149
    :cond_7
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 150
    .line 151
    .line 152
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 153
    .line 154
    if-eq v0, v3, :cond_8

    .line 155
    .line 156
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 157
    .line 158
    .line 159
    :cond_8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 160
    .line 161
    .line 162
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 163
    .line 164
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONValidator;->isWhiteSpace(C)Z

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    if-nez v0, :cond_a

    .line 169
    .line 170
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 171
    .line 172
    if-eq v0, v8, :cond_a

    .line 173
    .line 174
    if-eq v0, v7, :cond_a

    .line 175
    .line 176
    if-eq v0, v10, :cond_a

    .line 177
    .line 178
    if-nez v0, :cond_9

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 182
    .line 183
    .line 184
    goto :goto_4

    .line 185
    :cond_a
    :goto_3
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Value:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 186
    .line 187
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 188
    .line 189
    return-void

    .line 190
    :cond_b
    :goto_4
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 191
    .line 192
    .line 193
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 194
    .line 195
    const/16 v2, 0x61

    .line 196
    .line 197
    if-eq v0, v2, :cond_c

    .line 198
    .line 199
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 200
    .line 201
    .line 202
    :cond_c
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 203
    .line 204
    .line 205
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 206
    .line 207
    if-eq v0, v9, :cond_d

    .line 208
    .line 209
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 210
    .line 211
    .line 212
    :cond_d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 213
    .line 214
    .line 215
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 216
    .line 217
    const/16 v2, 0x73

    .line 218
    .line 219
    if-eq v0, v2, :cond_e

    .line 220
    .line 221
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 222
    .line 223
    .line 224
    :cond_e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 225
    .line 226
    .line 227
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 228
    .line 229
    if-eq v0, v3, :cond_f

    .line 230
    .line 231
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 232
    .line 233
    .line 234
    :cond_f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 235
    .line 236
    .line 237
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 238
    .line 239
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONValidator;->isWhiteSpace(C)Z

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    if-nez v0, :cond_17

    .line 244
    .line 245
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 246
    .line 247
    if-eq v0, v8, :cond_17

    .line 248
    .line 249
    if-eq v0, v7, :cond_17

    .line 250
    .line 251
    if-eq v0, v10, :cond_17

    .line 252
    .line 253
    if-nez v0, :cond_10

    .line 254
    .line 255
    goto :goto_7

    .line 256
    :cond_10
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 257
    .line 258
    .line 259
    :cond_11
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 260
    .line 261
    .line 262
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 263
    .line 264
    if-eq v0, v1, :cond_12

    .line 265
    .line 266
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 267
    .line 268
    .line 269
    :cond_12
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 270
    .line 271
    .line 272
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 273
    .line 274
    if-eq v0, v9, :cond_13

    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 277
    .line 278
    .line 279
    :cond_13
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 280
    .line 281
    .line 282
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 283
    .line 284
    if-eq v0, v9, :cond_14

    .line 285
    .line 286
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 287
    .line 288
    .line 289
    :cond_14
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 290
    .line 291
    .line 292
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 293
    .line 294
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONValidator;->isWhiteSpace(C)Z

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    if-nez v0, :cond_16

    .line 299
    .line 300
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 301
    .line 302
    if-eq v0, v8, :cond_16

    .line 303
    .line 304
    if-eq v0, v7, :cond_16

    .line 305
    .line 306
    if-eq v0, v10, :cond_16

    .line 307
    .line 308
    if-nez v0, :cond_15

    .line 309
    .line 310
    goto :goto_6

    .line 311
    :cond_15
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 312
    .line 313
    .line 314
    :goto_5
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 315
    .line 316
    .line 317
    return-void

    .line 318
    :cond_16
    :goto_6
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Value:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 319
    .line 320
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 321
    .line 322
    return-void

    .line 323
    :cond_17
    :goto_7
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Value:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 324
    .line 325
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 326
    .line 327
    return-void

    .line 328
    :cond_18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 329
    .line 330
    .line 331
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 332
    .line 333
    .line 334
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 335
    .line 336
    if-ne v0, v7, :cond_19

    .line 337
    .line 338
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 339
    .line 340
    .line 341
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Array:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 342
    .line 343
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 344
    .line 345
    return-void

    .line 346
    :cond_19
    :goto_8
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->any()V

    .line 347
    .line 348
    .line 349
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 350
    .line 351
    .line 352
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 353
    .line 354
    if-ne v0, v8, :cond_1a

    .line 355
    .line 356
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 357
    .line 358
    .line 359
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 360
    .line 361
    .line 362
    goto :goto_8

    .line 363
    :cond_1a
    if-ne v0, v7, :cond_1b

    .line 364
    .line 365
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 366
    .line 367
    .line 368
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Array:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 369
    .line 370
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 371
    .line 372
    return-void

    .line 373
    :cond_1b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 374
    .line 375
    .line 376
    goto :goto_8

    .line 377
    :cond_1c
    :pswitch_0
    const/16 v1, 0x39

    .line 378
    .line 379
    const/16 v2, 0x30

    .line 380
    .line 381
    if-eq v0, v4, :cond_1d

    .line 382
    .line 383
    if-ne v0, v5, :cond_1f

    .line 384
    .line 385
    :cond_1d
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 386
    .line 387
    .line 388
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 389
    .line 390
    .line 391
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 392
    .line 393
    if-lt v0, v2, :cond_1e

    .line 394
    .line 395
    if-le v0, v1, :cond_1f

    .line 396
    .line 397
    :cond_1e
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 398
    .line 399
    .line 400
    :cond_1f
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 401
    .line 402
    .line 403
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 404
    .line 405
    if-lt v0, v2, :cond_20

    .line 406
    .line 407
    if-le v0, v1, :cond_1f

    .line 408
    .line 409
    :cond_20
    const/16 v6, 0x2e

    .line 410
    .line 411
    if-ne v0, v6, :cond_21

    .line 412
    .line 413
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 414
    .line 415
    .line 416
    :goto_9
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 417
    .line 418
    if-lt v0, v2, :cond_21

    .line 419
    .line 420
    if-gt v0, v1, :cond_21

    .line 421
    .line 422
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 423
    .line 424
    .line 425
    goto :goto_9

    .line 426
    :cond_21
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 427
    .line 428
    if-eq v0, v3, :cond_22

    .line 429
    .line 430
    const/16 v3, 0x45

    .line 431
    .line 432
    if-ne v0, v3, :cond_27

    .line 433
    .line 434
    :cond_22
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 435
    .line 436
    .line 437
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 438
    .line 439
    if-eq v0, v4, :cond_23

    .line 440
    .line 441
    if-ne v0, v5, :cond_24

    .line 442
    .line 443
    :cond_23
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 444
    .line 445
    .line 446
    :cond_24
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 447
    .line 448
    if-lt v0, v2, :cond_25

    .line 449
    .line 450
    if-gt v0, v1, :cond_25

    .line 451
    .line 452
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 453
    .line 454
    .line 455
    goto :goto_a

    .line 456
    :cond_25
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->error()V

    .line 457
    .line 458
    .line 459
    :cond_26
    :goto_a
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 460
    .line 461
    .line 462
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 463
    .line 464
    if-lt v0, v2, :cond_27

    .line 465
    .line 466
    if-le v0, v1, :cond_26

    .line 467
    .line 468
    :cond_27
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Value:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 469
    .line 470
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 471
    .line 472
    return-void

    .line 473
    :cond_28
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 474
    .line 475
    .line 476
    :goto_b
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 477
    .line 478
    const/16 v3, 0x5c

    .line 479
    .line 480
    if-ne v0, v3, :cond_2a

    .line 481
    .line 482
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 483
    .line 484
    .line 485
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 486
    .line 487
    if-ne v0, v1, :cond_29

    .line 488
    .line 489
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 490
    .line 491
    .line 492
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 493
    .line 494
    .line 495
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 496
    .line 497
    .line 498
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 499
    .line 500
    .line 501
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 502
    .line 503
    .line 504
    goto :goto_b

    .line 505
    :cond_29
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 506
    .line 507
    .line 508
    goto :goto_b

    .line 509
    :cond_2a
    if-ne v0, v2, :cond_2b

    .line 510
    .line 511
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 512
    .line 513
    .line 514
    sget-object v0, Lcom/alibaba/fastjson/JSONValidator$Type;->Value:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 515
    .line 516
    iput-object v0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 517
    .line 518
    return-void

    .line 519
    :cond_2b
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 520
    .line 521
    .line 522
    goto :goto_b

    .line 523
    :pswitch_data_0
    .packed-switch 0x30
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public close()V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    return-void
.end method

.method public error()V
    .locals 3

    .line 1
    new-instance v0, Lcom/alibaba/fastjson/JSONException;

    .line 2
    .line 3
    new-instance v1, Ljava/lang/StringBuilder;

    .line 4
    .line 5
    const-string v2, "error : "

    .line 6
    .line 7
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget p0, p0, Lcom/alibaba/fastjson/JSONValidator;->pos:I

    .line 11
    .line 12
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-direct {v0, p0}, Lcom/alibaba/fastjson/JSONException;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    throw v0
.end method

.method public fieldName()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 2
    .line 3
    .line 4
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 5
    .line 6
    const/16 v1, 0x5c

    .line 7
    .line 8
    if-ne v0, v1, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 11
    .line 12
    .line 13
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 14
    .line 15
    const/16 v1, 0x75

    .line 16
    .line 17
    if-ne v0, v1, :cond_0

    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_1
    const/16 v1, 0x22

    .line 40
    .line 41
    if-ne v0, v1, :cond_2

    .line 42
    .line 43
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_2
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 48
    .line 49
    .line 50
    goto :goto_0
.end method

.method public getType()Lcom/alibaba/fastjson/JSONValidator$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/alibaba/fastjson/JSONValidator;->type:Lcom/alibaba/fastjson/JSONValidator$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract next()V
.end method

.method public skipWhiteSpace()V
    .locals 1

    .line 1
    :goto_0
    iget-char v0, p0, Lcom/alibaba/fastjson/JSONValidator;->ch:C

    .line 2
    .line 3
    invoke-static {v0}, Lcom/alibaba/fastjson/JSONValidator;->isWhiteSpace(C)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->next()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_0
    return-void
.end method

.method public validate()Z
    .locals 2

    .line 1
    :cond_0
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->any()V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/alibaba/fastjson/JSONValidator;->count:I

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    add-int/2addr v0, v1

    .line 8
    iput v0, p0, Lcom/alibaba/fastjson/JSONValidator;->count:I

    .line 9
    .line 10
    iget-boolean v0, p0, Lcom/alibaba/fastjson/JSONValidator;->supportMultiValue:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    iget-boolean v0, p0, Lcom/alibaba/fastjson/JSONValidator;->eof:Z

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/alibaba/fastjson/JSONValidator;->skipWhiteSpace()V

    .line 19
    .line 20
    .line 21
    iget-boolean v0, p0, Lcom/alibaba/fastjson/JSONValidator;->eof:Z

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    :cond_1
    return v1
.end method
