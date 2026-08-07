.class public final Lcom/tencent/cloud/ai/network/okio/k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okio/w;


# instance fields
.field public a:I

.field public final b:Lcom/tencent/cloud/ai/network/okio/g;

.field public final c:Ljava/util/zip/Inflater;

.field public final d:Lcom/tencent/cloud/ai/network/okio/l;

.field public final e:Ljava/util/zip/CRC32;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okio/w;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 6
    .line 7
    new-instance v0, Ljava/util/zip/CRC32;

    .line 8
    .line 9
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/k;->e:Ljava/util/zip/CRC32;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    new-instance v0, Ljava/util/zip/Inflater;

    .line 17
    .line 18
    const/4 v1, 0x1

    .line 19
    invoke-direct {v0, v1}, Ljava/util/zip/Inflater;-><init>(Z)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okio/k;->c:Ljava/util/zip/Inflater;

    .line 23
    .line 24
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/w;)Lcom/tencent/cloud/ai/network/okio/g;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 29
    .line 30
    new-instance v1, Lcom/tencent/cloud/ai/network/okio/l;

    .line 31
    .line 32
    invoke-direct {v1, p1, v0}, Lcom/tencent/cloud/ai/network/okio/l;-><init>(Lcom/tencent/cloud/ai/network/okio/g;Ljava/util/zip/Inflater;)V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okio/k;->d:Lcom/tencent/cloud/ai/network/okio/l;

    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    const-string p0, "source == null"

    .line 39
    .line 40
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x0

    .line 44
    throw p0
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okio/e;J)J
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v6, p1

    .line 4
    .line 5
    move-wide/from16 v7, p2

    .line 6
    .line 7
    const-wide/16 v9, 0x0

    .line 8
    .line 9
    cmp-long v1, v7, v9

    .line 10
    .line 11
    if-ltz v1, :cond_12

    .line 12
    .line 13
    if-nez v1, :cond_0

    .line 14
    .line 15
    return-wide v9

    .line 16
    :cond_0
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 17
    .line 18
    const-wide/16 v11, -0x1

    .line 19
    .line 20
    const/4 v13, 0x1

    .line 21
    if-nez v1, :cond_d

    .line 22
    .line 23
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 24
    .line 25
    const-wide/16 v2, 0xa

    .line 26
    .line 27
    invoke-interface {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->f(J)V

    .line 28
    .line 29
    .line 30
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 31
    .line 32
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    const-wide/16 v2, 0x3

    .line 37
    .line 38
    invoke-virtual {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->h(J)B

    .line 39
    .line 40
    .line 41
    move-result v14

    .line 42
    shr-int/lit8 v1, v14, 0x1

    .line 43
    .line 44
    and-int/2addr v1, v13

    .line 45
    const/4 v15, 0x0

    .line 46
    if-ne v1, v13, :cond_1

    .line 47
    .line 48
    move/from16 v16, v13

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_1
    move/from16 v16, v15

    .line 52
    .line 53
    :goto_0
    if-eqz v16, :cond_2

    .line 54
    .line 55
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 56
    .line 57
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-wide/16 v2, 0x0

    .line 62
    .line 63
    const-wide/16 v4, 0xa

    .line 64
    .line 65
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 69
    .line 70
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->readShort()S

    .line 71
    .line 72
    .line 73
    move-result v1

    .line 74
    const-string v2, "ID1ID2"

    .line 75
    .line 76
    const/16 v3, 0x1f8b

    .line 77
    .line 78
    invoke-virtual {v0, v2, v3, v1}, Lcom/tencent/cloud/ai/network/okio/k;->a(Ljava/lang/String;II)V

    .line 79
    .line 80
    .line 81
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 82
    .line 83
    const-wide/16 v2, 0x8

    .line 84
    .line 85
    invoke-interface {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 86
    .line 87
    .line 88
    shr-int/lit8 v1, v14, 0x2

    .line 89
    .line 90
    and-int/2addr v1, v13

    .line 91
    if-ne v1, v13, :cond_5

    .line 92
    .line 93
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 94
    .line 95
    const-wide/16 v2, 0x2

    .line 96
    .line 97
    invoke-interface {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->f(J)V

    .line 98
    .line 99
    .line 100
    if-eqz v16, :cond_3

    .line 101
    .line 102
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 103
    .line 104
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const-wide/16 v2, 0x0

    .line 109
    .line 110
    const-wide/16 v4, 0x2

    .line 111
    .line 112
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 113
    .line 114
    .line 115
    :cond_3
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 116
    .line 117
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/e;->readShort()S

    .line 122
    .line 123
    .line 124
    move-result v1

    .line 125
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/y;->a(S)S

    .line 126
    .line 127
    .line 128
    move-result v1

    .line 129
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 130
    .line 131
    int-to-long v4, v1

    .line 132
    invoke-interface {v2, v4, v5}, Lcom/tencent/cloud/ai/network/okio/g;->f(J)V

    .line 133
    .line 134
    .line 135
    if-eqz v16, :cond_4

    .line 136
    .line 137
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 138
    .line 139
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 140
    .line 141
    .line 142
    move-result-object v1

    .line 143
    const-wide/16 v2, 0x0

    .line 144
    .line 145
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 146
    .line 147
    .line 148
    :cond_4
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 149
    .line 150
    invoke-interface {v1, v4, v5}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 151
    .line 152
    .line 153
    :cond_5
    shr-int/lit8 v1, v14, 0x3

    .line 154
    .line 155
    and-int/2addr v1, v13

    .line 156
    const-wide/16 v17, 0x1

    .line 157
    .line 158
    if-ne v1, v13, :cond_8

    .line 159
    .line 160
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 161
    .line 162
    invoke-interface {v1, v15}, Lcom/tencent/cloud/ai/network/okio/g;->a(B)J

    .line 163
    .line 164
    .line 165
    move-result-wide v19

    .line 166
    cmp-long v1, v19, v11

    .line 167
    .line 168
    if-eqz v1, :cond_7

    .line 169
    .line 170
    if-eqz v16, :cond_6

    .line 171
    .line 172
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 173
    .line 174
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 175
    .line 176
    .line 177
    move-result-object v1

    .line 178
    add-long v4, v19, v17

    .line 179
    .line 180
    const-wide/16 v2, 0x0

    .line 181
    .line 182
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 183
    .line 184
    .line 185
    :cond_6
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 186
    .line 187
    add-long v2, v19, v17

    .line 188
    .line 189
    invoke-interface {v1, v2, v3}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_7
    invoke-static {}, Ll/vg3;->a()V

    .line 194
    .line 195
    .line 196
    return-wide v9

    .line 197
    :cond_8
    :goto_1
    shr-int/lit8 v1, v14, 0x4

    .line 198
    .line 199
    and-int/2addr v1, v13

    .line 200
    if-ne v1, v13, :cond_b

    .line 201
    .line 202
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 203
    .line 204
    invoke-interface {v1, v15}, Lcom/tencent/cloud/ai/network/okio/g;->a(B)J

    .line 205
    .line 206
    .line 207
    move-result-wide v14

    .line 208
    cmp-long v1, v14, v11

    .line 209
    .line 210
    if-eqz v1, :cond_a

    .line 211
    .line 212
    if-eqz v16, :cond_9

    .line 213
    .line 214
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 215
    .line 216
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->a()Lcom/tencent/cloud/ai/network/okio/e;

    .line 217
    .line 218
    .line 219
    move-result-object v1

    .line 220
    add-long v4, v14, v17

    .line 221
    .line 222
    const-wide/16 v2, 0x0

    .line 223
    .line 224
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 225
    .line 226
    .line 227
    :cond_9
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 228
    .line 229
    add-long v14, v14, v17

    .line 230
    .line 231
    invoke-interface {v1, v14, v15}, Lcom/tencent/cloud/ai/network/okio/g;->d(J)V

    .line 232
    .line 233
    .line 234
    goto :goto_2

    .line 235
    :cond_a
    invoke-static {}, Ll/vg3;->a()V

    .line 236
    .line 237
    .line 238
    return-wide v9

    .line 239
    :cond_b
    :goto_2
    if-eqz v16, :cond_c

    .line 240
    .line 241
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 242
    .line 243
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->j()S

    .line 244
    .line 245
    .line 246
    move-result v1

    .line 247
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/k;->e:Ljava/util/zip/CRC32;

    .line 248
    .line 249
    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    .line 250
    .line 251
    .line 252
    move-result-wide v2

    .line 253
    long-to-int v2, v2

    .line 254
    int-to-short v2, v2

    .line 255
    const-string v3, "FHCRC"

    .line 256
    .line 257
    invoke-virtual {v0, v3, v1, v2}, Lcom/tencent/cloud/ai/network/okio/k;->a(Ljava/lang/String;II)V

    .line 258
    .line 259
    .line 260
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->e:Ljava/util/zip/CRC32;

    .line 261
    .line 262
    invoke-virtual {v1}, Ljava/util/zip/CRC32;->reset()V

    .line 263
    .line 264
    .line 265
    :cond_c
    iput v13, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 266
    .line 267
    :cond_d
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 268
    .line 269
    const/4 v14, 0x2

    .line 270
    if-ne v1, v13, :cond_f

    .line 271
    .line 272
    iget-wide v2, v6, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 273
    .line 274
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->d:Lcom/tencent/cloud/ai/network/okio/l;

    .line 275
    .line 276
    invoke-virtual {v1, v6, v7, v8}, Lcom/tencent/cloud/ai/network/okio/l;->a(Lcom/tencent/cloud/ai/network/okio/e;J)J

    .line 277
    .line 278
    .line 279
    move-result-wide v4

    .line 280
    cmp-long v1, v4, v11

    .line 281
    .line 282
    if-eqz v1, :cond_e

    .line 283
    .line 284
    move-object v1, v6

    .line 285
    invoke-virtual/range {v0 .. v5}, Lcom/tencent/cloud/ai/network/okio/k;->a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V

    .line 286
    .line 287
    .line 288
    return-wide v4

    .line 289
    :cond_e
    iput v14, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 290
    .line 291
    :cond_f
    iget v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 292
    .line 293
    if-ne v1, v14, :cond_11

    .line 294
    .line 295
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 296
    .line 297
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->b()I

    .line 298
    .line 299
    .line 300
    move-result v1

    .line 301
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/k;->e:Ljava/util/zip/CRC32;

    .line 302
    .line 303
    invoke-virtual {v2}, Ljava/util/zip/CRC32;->getValue()J

    .line 304
    .line 305
    .line 306
    move-result-wide v2

    .line 307
    long-to-int v2, v2

    .line 308
    const-string v3, "CRC"

    .line 309
    .line 310
    invoke-virtual {v0, v3, v1, v2}, Lcom/tencent/cloud/ai/network/okio/k;->a(Ljava/lang/String;II)V

    .line 311
    .line 312
    .line 313
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 314
    .line 315
    invoke-interface {v1}, Lcom/tencent/cloud/ai/network/okio/g;->b()I

    .line 316
    .line 317
    .line 318
    move-result v1

    .line 319
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okio/k;->c:Ljava/util/zip/Inflater;

    .line 320
    .line 321
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getBytesWritten()J

    .line 322
    .line 323
    .line 324
    move-result-wide v2

    .line 325
    long-to-int v2, v2

    .line 326
    const-string v3, "ISIZE"

    .line 327
    .line 328
    invoke-virtual {v0, v3, v1, v2}, Lcom/tencent/cloud/ai/network/okio/k;->a(Ljava/lang/String;II)V

    .line 329
    .line 330
    .line 331
    const/4 v1, 0x3

    .line 332
    iput v1, v0, Lcom/tencent/cloud/ai/network/okio/k;->a:I

    .line 333
    .line 334
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 335
    .line 336
    invoke-interface {v0}, Lcom/tencent/cloud/ai/network/okio/g;->g()Z

    .line 337
    .line 338
    .line 339
    move-result v0

    .line 340
    if-eqz v0, :cond_10

    .line 341
    .line 342
    goto :goto_3

    .line 343
    :cond_10
    const-string v0, "gzip finished without exhausting source"

    .line 344
    .line 345
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    return-wide v9

    .line 349
    :cond_11
    :goto_3
    return-wide v11

    .line 350
    :cond_12
    const-string v0, "byteCount < 0: "

    .line 351
    .line 352
    invoke-static {v0, v7, v8}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 353
    .line 354
    .line 355
    return-wide v9
.end method

.method public final a(Lcom/tencent/cloud/ai/network/okio/e;JJ)V
    .locals 4

    .line 356
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/e;->a:Lcom/tencent/cloud/ai/network/okio/s;

    .line 357
    :goto_0
    iget v0, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    iget v1, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    sub-int/2addr v0, v1

    int-to-long v0, v0

    cmp-long v2, p2, v0

    if-ltz v2, :cond_0

    sub-long/2addr p2, v0

    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    goto :goto_0

    :cond_0
    :goto_1
    const-wide/16 v0, 0x0

    cmp-long v2, p4, v0

    if-lez v2, :cond_1

    .line 358
    iget v2, p1, Lcom/tencent/cloud/ai/network/okio/s;->b:I

    int-to-long v2, v2

    add-long/2addr v2, p2

    long-to-int p2, v2

    .line 359
    iget p3, p1, Lcom/tencent/cloud/ai/network/okio/s;->c:I

    sub-int/2addr p3, p2

    int-to-long v2, p3

    invoke-static {v2, v3, p4, p5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int p3, v2

    .line 360
    iget-object v2, p0, Lcom/tencent/cloud/ai/network/okio/k;->e:Ljava/util/zip/CRC32;

    iget-object v3, p1, Lcom/tencent/cloud/ai/network/okio/s;->a:[B

    invoke-virtual {v2, v3, p2, p3}, Ljava/util/zip/CRC32;->update([BII)V

    int-to-long p2, p3

    sub-long/2addr p4, p2

    .line 361
    iget-object p1, p1, Lcom/tencent/cloud/ai/network/okio/s;->f:Lcom/tencent/cloud/ai/network/okio/s;

    move-wide p2, v0

    goto :goto_1

    :cond_1
    return-void
.end method

.method public final a(Ljava/lang/String;II)V
    .locals 0

    if-ne p3, p2, :cond_0

    return-void

    .line 362
    :cond_0
    new-instance p0, Ljava/io/IOException;

    .line 363
    invoke-static {p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p3

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p1, p3, p2}, [Ljava/lang/Object;

    move-result-object p1

    const-string p2, "%s: actual 0x%08x != expected 0x%08x"

    .line 364
    invoke-static {p2, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public close()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/k;->d:Lcom/tencent/cloud/ai/network/okio/l;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/l;->close()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public timeout()Lcom/tencent/cloud/ai/network/okio/x;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okio/k;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okio/w;->timeout()Lcom/tencent/cloud/ai/network/okio/x;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
