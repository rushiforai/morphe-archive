.class public final Ll/y1z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/bgw0;

.field public b:Ll/h1z0;

.field public c:Ll/h1z0;

.field public d:Ll/h1z0;

.field public e:J

.field public final f:Ll/c6z0;


# direct methods
.method public constructor <init>(Ll/c6z0;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/y1z0;->f:Ll/c6z0;

    .line 5
    .line 6
    new-instance p1, Ll/bgw0;

    .line 7
    .line 8
    const/16 v0, 0x20

    .line 9
    .line 10
    invoke-direct {p1, v0}, Ll/bgw0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Ll/y1z0;->a:Ll/bgw0;

    .line 14
    .line 15
    new-instance p1, Ll/h1z0;

    .line 16
    .line 17
    const-wide/16 v0, 0x0

    .line 18
    .line 19
    const/high16 v2, 0x10000

    .line 20
    .line 21
    invoke-direct {p1, v0, v1, v2}, Ll/h1z0;-><init>(JI)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 25
    .line 26
    iput-object p1, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 27
    .line 28
    iput-object p1, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 29
    .line 30
    return-void
.end method

.method public static j(Ll/h1z0;J)Ll/h1z0;
    .locals 2

    .line 1
    :goto_0
    iget-wide v0, p0, Ll/h1z0;->b:J

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-ltz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-object p0
.end method

.method public static k(Ll/h1z0;JLjava/nio/ByteBuffer;I)Ll/h1z0;
    .locals 3

    .line 1
    invoke-static {p0, p1, p2}, Ll/y1z0;->j(Ll/h1z0;J)Ll/h1z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    :cond_0
    :goto_0
    if-lez p4, :cond_1

    .line 6
    .line 7
    iget-wide v0, p0, Ll/h1z0;->b:J

    .line 8
    .line 9
    sub-long/2addr v0, p1

    .line 10
    long-to-int v0, v0

    .line 11
    invoke-static {p4, v0}, Ljava/lang/Math;->min(II)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    iget-object v1, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 16
    .line 17
    iget-object v1, v1, Ll/v5z0;->a:[B

    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Ll/h1z0;->a(J)I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    invoke-virtual {p3, v1, v2, v0}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    .line 26
    sub-int/2addr p4, v0

    .line 27
    int-to-long v0, v0

    .line 28
    add-long/2addr p1, v0

    .line 29
    iget-wide v0, p0, Ll/h1z0;->b:J

    .line 30
    .line 31
    cmp-long v0, p1, v0

    .line 32
    .line 33
    if-nez v0, :cond_0

    .line 34
    .line 35
    iget-object p0, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    return-object p0
.end method

.method public static l(Ll/h1z0;J[BI)Ll/h1z0;
    .locals 5

    .line 1
    invoke-static {p0, p1, p2}, Ll/y1z0;->j(Ll/h1z0;J)Ll/h1z0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    move v0, p4

    .line 6
    :cond_0
    :goto_0
    if-lez v0, :cond_1

    .line 7
    .line 8
    iget-wide v1, p0, Ll/h1z0;->b:J

    .line 9
    .line 10
    sub-long/2addr v1, p1

    .line 11
    long-to-int v1, v1

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    iget-object v2, p0, Ll/h1z0;->c:Ll/v5z0;

    .line 17
    .line 18
    iget-object v2, v2, Ll/v5z0;->a:[B

    .line 19
    .line 20
    invoke-virtual {p0, p1, p2}, Ll/h1z0;->a(J)I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    sub-int v4, p4, v0

    .line 25
    .line 26
    invoke-static {v2, v3, p3, v4, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    sub-int/2addr v0, v1

    .line 30
    int-to-long v1, v1

    .line 31
    add-long/2addr p1, v1

    .line 32
    iget-wide v1, p0, Ll/h1z0;->b:J

    .line 33
    .line 34
    cmp-long v1, p1, v1

    .line 35
    .line 36
    if-nez v1, :cond_0

    .line 37
    .line 38
    iget-object p0, p0, Ll/h1z0;->d:Ll/h1z0;

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-object p0
.end method

.method public static m(Ll/h1z0;Ll/evx0;Ll/a2z0;Ll/bgw0;)Ll/h1z0;
    .locals 19

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/evx0;->k()Z

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    if-eqz v3, :cond_9

    .line 12
    .line 13
    iget-wide v3, v1, Ll/a2z0;->b:J

    .line 14
    .line 15
    const/4 v5, 0x1

    .line 16
    invoke-virtual {v2, v5}, Ll/bgw0;->h(I)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 20
    .line 21
    .line 22
    move-result-object v6

    .line 23
    move-object/from16 v7, p0

    .line 24
    .line 25
    invoke-static {v7, v3, v4, v6, v5}, Ll/y1z0;->l(Ll/h1z0;J[BI)Ll/h1z0;

    .line 26
    .line 27
    .line 28
    move-result-object v6

    .line 29
    const-wide/16 v7, 0x1

    .line 30
    .line 31
    add-long/2addr v3, v7

    .line 32
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 33
    .line 34
    .line 35
    move-result-object v7

    .line 36
    const/4 v8, 0x0

    .line 37
    aget-byte v7, v7, v8

    .line 38
    .line 39
    and-int/lit16 v9, v7, 0x80

    .line 40
    .line 41
    and-int/lit8 v7, v7, 0x7f

    .line 42
    .line 43
    iget-object v10, v0, Ll/evx0;->c:Ll/tux0;

    .line 44
    .line 45
    iget-object v11, v10, Ll/tux0;->a:[B

    .line 46
    .line 47
    if-nez v11, :cond_0

    .line 48
    .line 49
    const/16 v11, 0x10

    .line 50
    .line 51
    new-array v11, v11, [B

    .line 52
    .line 53
    iput-object v11, v10, Ll/tux0;->a:[B

    .line 54
    .line 55
    goto :goto_0

    .line 56
    :cond_0
    invoke-static {v11, v8}, Ljava/util/Arrays;->fill([BB)V

    .line 57
    .line 58
    .line 59
    :goto_0
    if-eqz v9, :cond_1

    .line 60
    .line 61
    move v9, v5

    .line 62
    goto :goto_1

    .line 63
    :cond_1
    move v9, v8

    .line 64
    :goto_1
    iget-object v11, v10, Ll/tux0;->a:[B

    .line 65
    .line 66
    invoke-static {v6, v3, v4, v11, v7}, Ll/y1z0;->l(Ll/h1z0;J[BI)Ll/h1z0;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    int-to-long v11, v7

    .line 71
    add-long/2addr v3, v11

    .line 72
    if-eqz v9, :cond_2

    .line 73
    .line 74
    const/4 v5, 0x2

    .line 75
    invoke-virtual {v2, v5}, Ll/bgw0;->h(I)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 79
    .line 80
    .line 81
    move-result-object v7

    .line 82
    invoke-static {v6, v3, v4, v7, v5}, Ll/y1z0;->l(Ll/h1z0;J[BI)Ll/h1z0;

    .line 83
    .line 84
    .line 85
    move-result-object v6

    .line 86
    const-wide/16 v11, 0x2

    .line 87
    .line 88
    add-long/2addr v3, v11

    .line 89
    invoke-virtual {v2}, Ll/bgw0;->F()I

    .line 90
    .line 91
    .line 92
    move-result v5

    .line 93
    :cond_2
    move v11, v5

    .line 94
    iget-object v5, v10, Ll/tux0;->d:[I

    .line 95
    .line 96
    if-eqz v5, :cond_4

    .line 97
    .line 98
    array-length v7, v5

    .line 99
    if-ge v7, v11, :cond_3

    .line 100
    .line 101
    goto :goto_3

    .line 102
    :cond_3
    :goto_2
    move-object v12, v5

    .line 103
    goto :goto_4

    .line 104
    :cond_4
    :goto_3
    new-array v5, v11, [I

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :goto_4
    iget-object v5, v10, Ll/tux0;->e:[I

    .line 108
    .line 109
    if-eqz v5, :cond_6

    .line 110
    .line 111
    array-length v7, v5

    .line 112
    if-ge v7, v11, :cond_5

    .line 113
    .line 114
    goto :goto_6

    .line 115
    :cond_5
    :goto_5
    move-object v13, v5

    .line 116
    goto :goto_7

    .line 117
    :cond_6
    :goto_6
    new-array v5, v11, [I

    .line 118
    .line 119
    goto :goto_5

    .line 120
    :goto_7
    if-eqz v9, :cond_7

    .line 121
    .line 122
    mul-int/lit8 v5, v11, 0x6

    .line 123
    .line 124
    invoke-virtual {v2, v5}, Ll/bgw0;->h(I)V

    .line 125
    .line 126
    .line 127
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 128
    .line 129
    .line 130
    move-result-object v7

    .line 131
    invoke-static {v6, v3, v4, v7, v5}, Ll/y1z0;->l(Ll/h1z0;J[BI)Ll/h1z0;

    .line 132
    .line 133
    .line 134
    move-result-object v6

    .line 135
    int-to-long v14, v5

    .line 136
    add-long/2addr v3, v14

    .line 137
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 138
    .line 139
    .line 140
    :goto_8
    if-ge v8, v11, :cond_8

    .line 141
    .line 142
    invoke-virtual {v2}, Ll/bgw0;->F()I

    .line 143
    .line 144
    .line 145
    move-result v5

    .line 146
    aput v5, v12, v8

    .line 147
    .line 148
    invoke-virtual {v2}, Ll/bgw0;->E()I

    .line 149
    .line 150
    .line 151
    move-result v5

    .line 152
    aput v5, v13, v8

    .line 153
    .line 154
    add-int/lit8 v8, v8, 0x1

    .line 155
    .line 156
    goto :goto_8

    .line 157
    :cond_7
    aput v8, v12, v8

    .line 158
    .line 159
    iget v5, v1, Ll/a2z0;->a:I

    .line 160
    .line 161
    iget-wide v14, v1, Ll/a2z0;->b:J

    .line 162
    .line 163
    sub-long v14, v3, v14

    .line 164
    .line 165
    long-to-int v7, v14

    .line 166
    sub-int/2addr v5, v7

    .line 167
    aput v5, v13, v8

    .line 168
    .line 169
    :cond_8
    iget-object v5, v1, Ll/a2z0;->c:Ll/ggr0;

    .line 170
    .line 171
    sget v7, Ll/mpw0;->a:I

    .line 172
    .line 173
    iget-object v14, v5, Ll/ggr0;->b:[B

    .line 174
    .line 175
    iget-object v15, v10, Ll/tux0;->a:[B

    .line 176
    .line 177
    iget v7, v5, Ll/ggr0;->a:I

    .line 178
    .line 179
    iget v8, v5, Ll/ggr0;->c:I

    .line 180
    .line 181
    iget v5, v5, Ll/ggr0;->d:I

    .line 182
    .line 183
    move/from16 v18, v5

    .line 184
    .line 185
    move/from16 v16, v7

    .line 186
    .line 187
    move/from16 v17, v8

    .line 188
    .line 189
    invoke-virtual/range {v10 .. v18}, Ll/tux0;->c(I[I[I[B[BIII)V

    .line 190
    .line 191
    .line 192
    iget-wide v7, v1, Ll/a2z0;->b:J

    .line 193
    .line 194
    sub-long/2addr v3, v7

    .line 195
    long-to-int v3, v3

    .line 196
    int-to-long v4, v3

    .line 197
    add-long/2addr v7, v4

    .line 198
    iput-wide v7, v1, Ll/a2z0;->b:J

    .line 199
    .line 200
    iget v4, v1, Ll/a2z0;->a:I

    .line 201
    .line 202
    sub-int/2addr v4, v3

    .line 203
    iput v4, v1, Ll/a2z0;->a:I

    .line 204
    .line 205
    goto :goto_9

    .line 206
    :cond_9
    move-object/from16 v7, p0

    .line 207
    .line 208
    move-object v6, v7

    .line 209
    :goto_9
    invoke-virtual {v0}, Ll/fux0;->e()Z

    .line 210
    .line 211
    .line 212
    move-result v3

    .line 213
    if-eqz v3, :cond_c

    .line 214
    .line 215
    const/4 v3, 0x4

    .line 216
    invoke-virtual {v2, v3}, Ll/bgw0;->h(I)V

    .line 217
    .line 218
    .line 219
    iget-wide v4, v1, Ll/a2z0;->b:J

    .line 220
    .line 221
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 222
    .line 223
    .line 224
    move-result-object v7

    .line 225
    invoke-static {v6, v4, v5, v7, v3}, Ll/y1z0;->l(Ll/h1z0;J[BI)Ll/h1z0;

    .line 226
    .line 227
    .line 228
    move-result-object v3

    .line 229
    invoke-virtual {v2}, Ll/bgw0;->E()I

    .line 230
    .line 231
    .line 232
    move-result v2

    .line 233
    iget-wide v4, v1, Ll/a2z0;->b:J

    .line 234
    .line 235
    const-wide/16 v6, 0x4

    .line 236
    .line 237
    add-long/2addr v4, v6

    .line 238
    iput-wide v4, v1, Ll/a2z0;->b:J

    .line 239
    .line 240
    iget v4, v1, Ll/a2z0;->a:I

    .line 241
    .line 242
    add-int/lit8 v4, v4, -0x4

    .line 243
    .line 244
    iput v4, v1, Ll/a2z0;->a:I

    .line 245
    .line 246
    invoke-virtual {v0, v2}, Ll/evx0;->i(I)V

    .line 247
    .line 248
    .line 249
    iget-wide v4, v1, Ll/a2z0;->b:J

    .line 250
    .line 251
    iget-object v6, v0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 252
    .line 253
    invoke-static {v3, v4, v5, v6, v2}, Ll/y1z0;->k(Ll/h1z0;JLjava/nio/ByteBuffer;I)Ll/h1z0;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    iget-wide v4, v1, Ll/a2z0;->b:J

    .line 258
    .line 259
    int-to-long v6, v2

    .line 260
    add-long/2addr v4, v6

    .line 261
    iput-wide v4, v1, Ll/a2z0;->b:J

    .line 262
    .line 263
    iget v4, v1, Ll/a2z0;->a:I

    .line 264
    .line 265
    sub-int/2addr v4, v2

    .line 266
    iput v4, v1, Ll/a2z0;->a:I

    .line 267
    .line 268
    iget-object v2, v0, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 269
    .line 270
    if-eqz v2, :cond_b

    .line 271
    .line 272
    invoke-virtual {v2}, Ljava/nio/Buffer;->capacity()I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    if-ge v2, v4, :cond_a

    .line 277
    .line 278
    goto :goto_a

    .line 279
    :cond_a
    iget-object v2, v0, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 280
    .line 281
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 282
    .line 283
    .line 284
    goto :goto_b

    .line 285
    :cond_b
    :goto_a
    invoke-static {v4}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 286
    .line 287
    .line 288
    move-result-object v2

    .line 289
    iput-object v2, v0, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 290
    .line 291
    :goto_b
    iget-wide v4, v1, Ll/a2z0;->b:J

    .line 292
    .line 293
    iget-object v0, v0, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 294
    .line 295
    iget v1, v1, Ll/a2z0;->a:I

    .line 296
    .line 297
    invoke-static {v3, v4, v5, v0, v1}, Ll/y1z0;->k(Ll/h1z0;JLjava/nio/ByteBuffer;I)Ll/h1z0;

    .line 298
    .line 299
    .line 300
    move-result-object v0

    .line 301
    return-object v0

    .line 302
    :cond_c
    iget v2, v1, Ll/a2z0;->a:I

    .line 303
    .line 304
    invoke-virtual {v0, v2}, Ll/evx0;->i(I)V

    .line 305
    .line 306
    .line 307
    iget-wide v2, v1, Ll/a2z0;->b:J

    .line 308
    .line 309
    iget-object v0, v0, Ll/evx0;->d:Ljava/nio/ByteBuffer;

    .line 310
    .line 311
    iget v1, v1, Ll/a2z0;->a:I

    .line 312
    .line 313
    invoke-static {v6, v2, v3, v0, v1}, Ll/y1z0;->k(Ll/h1z0;JLjava/nio/ByteBuffer;I)Ll/h1z0;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    return-object v0
.end method


# virtual methods
.method public final a(Ll/nyy0;IZ)I
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0, p2}, Ll/y1z0;->i(I)I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    iget-object v0, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 6
    .line 7
    iget-object v1, v0, Ll/h1z0;->c:Ll/v5z0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/v5z0;->a:[B

    .line 10
    .line 11
    iget-wide v2, p0, Ll/y1z0;->e:J

    .line 12
    .line 13
    invoke-virtual {v0, v2, v3}, Ll/h1z0;->a(J)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-interface {p1, v1, v0, p2}, Ll/nyy0;->a([BII)I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    const/4 p2, -0x1

    .line 22
    if-ne p1, p2, :cond_1

    .line 23
    .line 24
    if-eqz p3, :cond_0

    .line 25
    .line 26
    return p2

    .line 27
    :cond_0
    invoke-static {}, Ll/vg3;->a()V

    .line 28
    .line 29
    .line 30
    const/4 p0, 0x0

    .line 31
    return p0

    .line 32
    :cond_1
    invoke-virtual {p0, p1}, Ll/y1z0;->n(I)V

    .line 33
    .line 34
    .line 35
    return p1
.end method

.method public final b()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/y1z0;->e:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final c(J)V
    .locals 3

    .line 1
    const-wide/16 v0, -0x1

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    :goto_0
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 8
    .line 9
    iget-wide v1, v0, Ll/h1z0;->b:J

    .line 10
    .line 11
    cmp-long v1, p1, v1

    .line 12
    .line 13
    if-ltz v1, :cond_0

    .line 14
    .line 15
    iget-object v1, p0, Ll/y1z0;->f:Ll/c6z0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/h1z0;->c:Ll/v5z0;

    .line 18
    .line 19
    invoke-virtual {v1, v0}, Ll/c6z0;->c(Ll/v5z0;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/h1z0;->b()Ll/h1z0;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p1, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 32
    .line 33
    iget-wide p1, p1, Ll/h1z0;->a:J

    .line 34
    .line 35
    iget-wide v1, v0, Ll/h1z0;->a:J

    .line 36
    .line 37
    cmp-long p1, p1, v1

    .line 38
    .line 39
    if-gez p1, :cond_1

    .line 40
    .line 41
    iput-object v0, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 42
    .line 43
    :cond_1
    return-void
.end method

.method public final d(Ll/evx0;Ll/a2z0;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y1z0;->a:Ll/bgw0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 4
    .line 5
    invoke-static {p0, p1, p2, v0}, Ll/y1z0;->m(Ll/h1z0;Ll/evx0;Ll/a2z0;Ll/bgw0;)Ll/h1z0;

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final e(Ll/evx0;Ll/a2z0;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/y1z0;->a:Ll/bgw0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 4
    .line 5
    invoke-static {v1, p1, p2, v0}, Ll/y1z0;->m(Ll/h1z0;Ll/evx0;Ll/a2z0;Ll/bgw0;)Ll/h1z0;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    iput-object p1, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 10
    .line 11
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/h1z0;->c:Ll/v5z0;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/y1z0;->f:Ll/c6z0;

    .line 8
    .line 9
    invoke-virtual {v1, v0}, Ll/c6z0;->d(Ll/w5z0;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ll/h1z0;->b()Ll/h1z0;

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 16
    .line 17
    const/high16 v1, 0x10000

    .line 18
    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    invoke-virtual {v0, v2, v3, v1}, Ll/h1z0;->c(JI)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 25
    .line 26
    iput-object v0, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 27
    .line 28
    iput-object v0, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 29
    .line 30
    iput-wide v2, p0, Ll/y1z0;->e:J

    .line 31
    .line 32
    iget-object p0, p0, Ll/y1z0;->f:Ll/c6z0;

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/c6z0;->g()V

    .line 35
    .line 36
    .line 37
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y1z0;->b:Ll/h1z0;

    .line 2
    .line 3
    iput-object v0, p0, Ll/y1z0;->c:Ll/h1z0;

    .line 4
    .line 5
    return-void
.end method

.method public final h(Ll/bgw0;I)V
    .locals 5

    .line 1
    :goto_0
    if-lez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p0, p2}, Ll/y1z0;->i(I)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    iget-object v1, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 8
    .line 9
    iget-object v2, v1, Ll/h1z0;->c:Ll/v5z0;

    .line 10
    .line 11
    iget-object v2, v2, Ll/v5z0;->a:[B

    .line 12
    .line 13
    iget-wide v3, p0, Ll/y1z0;->e:J

    .line 14
    .line 15
    invoke-virtual {v1, v3, v4}, Ll/h1z0;->a(J)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    invoke-virtual {p1, v2, v1, v0}, Ll/bgw0;->g([BII)V

    .line 20
    .line 21
    .line 22
    sub-int/2addr p2, v0

    .line 23
    invoke-virtual {p0, v0}, Ll/y1z0;->n(I)V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :cond_0
    return-void
.end method

.method public final i(I)I
    .locals 6

    .line 1
    iget-object v0, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/h1z0;->c:Ll/v5z0;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    iget-object v1, p0, Ll/y1z0;->f:Ll/c6z0;

    .line 8
    .line 9
    invoke-virtual {v1}, Ll/c6z0;->b()Ll/v5z0;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    new-instance v2, Ll/h1z0;

    .line 14
    .line 15
    iget-object v3, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 16
    .line 17
    iget-wide v3, v3, Ll/h1z0;->b:J

    .line 18
    .line 19
    const/high16 v5, 0x10000

    .line 20
    .line 21
    invoke-direct {v2, v3, v4, v5}, Ll/h1z0;-><init>(JI)V

    .line 22
    .line 23
    .line 24
    iput-object v1, v0, Ll/h1z0;->c:Ll/v5z0;

    .line 25
    .line 26
    iput-object v2, v0, Ll/h1z0;->d:Ll/h1z0;

    .line 27
    .line 28
    :cond_0
    iget-object v0, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 29
    .line 30
    iget-wide v0, v0, Ll/h1z0;->b:J

    .line 31
    .line 32
    iget-wide v2, p0, Ll/y1z0;->e:J

    .line 33
    .line 34
    sub-long/2addr v0, v2

    .line 35
    long-to-int p0, v0

    .line 36
    invoke-static {p1, p0}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    return p0
.end method

.method public final n(I)V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/y1z0;->e:J

    .line 2
    .line 3
    int-to-long v2, p1

    .line 4
    add-long/2addr v0, v2

    .line 5
    iput-wide v0, p0, Ll/y1z0;->e:J

    .line 6
    .line 7
    iget-object p1, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 8
    .line 9
    iget-wide v2, p1, Ll/h1z0;->b:J

    .line 10
    .line 11
    cmp-long v0, v0, v2

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object p1, p1, Ll/h1z0;->d:Ll/h1z0;

    .line 16
    .line 17
    iput-object p1, p0, Ll/y1z0;->d:Ll/h1z0;

    .line 18
    .line 19
    :cond_0
    return-void
.end method
