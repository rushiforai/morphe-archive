.class public final Ll/tqg0;
.super Ll/gjg0;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public d:Z

.field public final e:Ll/lng0;

.field public f:I

.field public g:Ll/drg0;

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I

.field public q:I

.field public r:I

.field public s:I

.field public t:C

.field public u:Ll/hjg0;


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/gjg0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/lng0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/lng0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 10
    .line 11
    const/4 v0, 0x1

    .line 12
    iput v0, p0, Ll/tqg0;->h:I

    .line 13
    .line 14
    new-instance v0, Ll/drg0;

    .line 15
    .line 16
    sget-object v1, Ljava/lang/System;->in:Ljava/io/InputStream;

    .line 17
    .line 18
    if-ne p1, v1, :cond_0

    .line 19
    .line 20
    new-instance v1, Ll/hwg0;

    .line 21
    .line 22
    invoke-direct {v1, p1}, Ll/hwg0;-><init>(Ljava/io/InputStream;)V

    .line 23
    .line 24
    .line 25
    move-object p1, v1

    .line 26
    :cond_0
    sget-object v1, Ljava/nio/ByteOrder;->BIG_ENDIAN:Ljava/nio/ByteOrder;

    .line 27
    .line 28
    invoke-direct {v0, p1, v1}, Ll/drg0;-><init>(Ljava/io/InputStream;Ljava/nio/ByteOrder;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/tqg0;->g:Ll/drg0;

    .line 32
    .line 33
    const/16 p1, 0x8

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Ll/drg0;->readBits(I)J

    .line 36
    .line 37
    .line 38
    move-result-wide v0

    .line 39
    long-to-int v0, v0

    .line 40
    iget-object v1, p0, Ll/tqg0;->g:Ll/drg0;

    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ll/drg0;->readBits(I)J

    .line 43
    .line 44
    .line 45
    move-result-wide v1

    .line 46
    long-to-int v1, v1

    .line 47
    iget-object v2, p0, Ll/tqg0;->g:Ll/drg0;

    .line 48
    .line 49
    invoke-virtual {v2, p1}, Ll/drg0;->readBits(I)J

    .line 50
    .line 51
    .line 52
    move-result-wide v2

    .line 53
    long-to-int v2, v2

    .line 54
    const/16 v3, 0x42

    .line 55
    .line 56
    if-ne v0, v3, :cond_2

    .line 57
    .line 58
    const/16 v0, 0x5a

    .line 59
    .line 60
    if-ne v1, v0, :cond_2

    .line 61
    .line 62
    const/16 v0, 0x68

    .line 63
    .line 64
    if-ne v2, v0, :cond_2

    .line 65
    .line 66
    iget-object v0, p0, Ll/tqg0;->g:Ll/drg0;

    .line 67
    .line 68
    invoke-virtual {v0, p1}, Ll/drg0;->readBits(I)J

    .line 69
    .line 70
    .line 71
    move-result-wide v0

    .line 72
    long-to-int p1, v0

    .line 73
    const/16 v0, 0x31

    .line 74
    .line 75
    if-lt p1, v0, :cond_1

    .line 76
    .line 77
    const/16 v0, 0x39

    .line 78
    .line 79
    if-gt p1, v0, :cond_1

    .line 80
    .line 81
    add-int/lit8 p1, p1, -0x30

    .line 82
    .line 83
    iput p1, p0, Ll/tqg0;->c:I

    .line 84
    .line 85
    const/4 p1, 0x0

    .line 86
    iput p1, p0, Ll/tqg0;->k:I

    .line 87
    .line 88
    invoke-virtual {p0}, Ll/tqg0;->k()V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :cond_1
    const-string p0, "BZip2 block size is invalid"

    .line 93
    .line 94
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    const/4 p0, 0x0

    .line 98
    throw p0

    .line 99
    :cond_2
    const-string p0, "Stream is not in the BZip2 format"

    .line 100
    .line 101
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    const/4 p0, 0x0

    .line 105
    throw p0
.end method

.method public static b(Ll/drg0;I)I
    .locals 2

    .line 1
    invoke-virtual {p0, p1}, Ll/drg0;->readBits(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    cmp-long v0, p0, v0

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    long-to-int p0, p0

    .line 12
    return p0

    .line 13
    :cond_0
    const-string p0, "Unexpected end of stream"

    .line 14
    .line 15
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method

.method public static m(IILjava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "Corrupted input, "

    .line 2
    .line 3
    if-ltz p0, :cond_1

    .line 4
    .line 5
    if-ge p0, p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string p0, " value too big"

    .line 9
    .line 10
    invoke-static {v0, p2, p0}, Ll/cqg0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    const-string p0, " value negative"

    .line 15
    .line 16
    invoke-static {v0, p2, p0}, Ll/cqg0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public final close()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/tqg0;->g:Ll/drg0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    :try_start_0
    invoke-virtual {v0}, Ll/drg0;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 10
    .line 11
    iput-object v1, p0, Ll/tqg0;->g:Ll/drg0;

    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception v0

    .line 15
    iput-object v1, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 16
    .line 17
    iput-object v1, p0, Ll/tqg0;->g:Ll/drg0;

    .line 18
    .line 19
    throw v0

    .line 20
    :cond_0
    return-void
.end method

.method public final k()V
    .locals 39

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Ll/tqg0;->g:Ll/drg0;

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 8
    .line 9
    .line 10
    move-result v3

    .line 11
    int-to-char v3, v3

    .line 12
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 13
    .line 14
    .line 15
    move-result v4

    .line 16
    int-to-char v4, v4

    .line 17
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 18
    .line 19
    .line 20
    move-result v5

    .line 21
    int-to-char v5, v5

    .line 22
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 23
    .line 24
    .line 25
    move-result v6

    .line 26
    int-to-char v6, v6

    .line 27
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 28
    .line 29
    .line 30
    move-result v7

    .line 31
    int-to-char v7, v7

    .line 32
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    int-to-char v2, v2

    .line 37
    const/16 v8, 0x20

    .line 38
    .line 39
    const/4 v9, 0x0

    .line 40
    const/16 v10, 0x17

    .line 41
    .line 42
    if-ne v3, v10, :cond_2

    .line 43
    .line 44
    const/16 v11, 0x72

    .line 45
    .line 46
    if-ne v4, v11, :cond_2

    .line 47
    .line 48
    const/16 v11, 0x45

    .line 49
    .line 50
    if-ne v5, v11, :cond_2

    .line 51
    .line 52
    const/16 v11, 0x38

    .line 53
    .line 54
    if-ne v6, v11, :cond_2

    .line 55
    .line 56
    const/16 v11, 0x50

    .line 57
    .line 58
    if-ne v7, v11, :cond_2

    .line 59
    .line 60
    const/16 v11, 0x90

    .line 61
    .line 62
    if-eq v2, v11, :cond_0

    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_0
    iget-object v1, v0, Ll/tqg0;->g:Ll/drg0;

    .line 66
    .line 67
    invoke-static {v1, v8}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    iput v1, v0, Ll/tqg0;->j:I

    .line 72
    .line 73
    iput v9, v0, Ll/tqg0;->h:I

    .line 74
    .line 75
    const/4 v2, 0x0

    .line 76
    iput-object v2, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 77
    .line 78
    iget v0, v0, Ll/tqg0;->k:I

    .line 79
    .line 80
    if-ne v1, v0, :cond_1

    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    const-string v0, "BZip2 CRC error"

    .line 84
    .line 85
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    return-void

    .line 89
    :cond_2
    :goto_0
    const/16 v11, 0x31

    .line 90
    .line 91
    if-ne v3, v11, :cond_33

    .line 92
    .line 93
    const/16 v3, 0x41

    .line 94
    .line 95
    if-ne v4, v3, :cond_33

    .line 96
    .line 97
    const/16 v3, 0x59

    .line 98
    .line 99
    if-ne v5, v3, :cond_33

    .line 100
    .line 101
    const/16 v4, 0x26

    .line 102
    .line 103
    if-ne v6, v4, :cond_33

    .line 104
    .line 105
    const/16 v4, 0x53

    .line 106
    .line 107
    if-ne v7, v4, :cond_33

    .line 108
    .line 109
    if-ne v2, v3, :cond_33

    .line 110
    .line 111
    invoke-static {v1, v8}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    iput v2, v0, Ll/tqg0;->i:I

    .line 116
    .line 117
    const/4 v2, 0x1

    .line 118
    invoke-static {v1, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-ne v1, v2, :cond_3

    .line 123
    .line 124
    move v1, v2

    .line 125
    goto :goto_1

    .line 126
    :cond_3
    move v1, v9

    .line 127
    :goto_1
    iput-boolean v1, v0, Ll/tqg0;->d:Z

    .line 128
    .line 129
    iget-object v1, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 130
    .line 131
    if-nez v1, :cond_4

    .line 132
    .line 133
    new-instance v1, Ll/hjg0;

    .line 134
    .line 135
    iget v3, v0, Ll/tqg0;->c:I

    .line 136
    .line 137
    invoke-direct {v1, v3}, Ll/hjg0;-><init>(I)V

    .line 138
    .line 139
    .line 140
    iput-object v1, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 141
    .line 142
    :cond_4
    iget-object v1, v0, Ll/tqg0;->g:Ll/drg0;

    .line 143
    .line 144
    const/16 v3, 0x18

    .line 145
    .line 146
    invoke-static {v1, v3}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    iput v3, v0, Ll/tqg0;->b:I

    .line 151
    .line 152
    iget-object v3, v0, Ll/tqg0;->g:Ll/drg0;

    .line 153
    .line 154
    iget-object v4, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 155
    .line 156
    iget-object v5, v4, Ll/hjg0;->a:[Z

    .line 157
    .line 158
    iget-object v6, v4, Ll/hjg0;->m:[B

    .line 159
    .line 160
    iget-object v7, v4, Ll/hjg0;->c:[B

    .line 161
    .line 162
    iget-object v12, v4, Ll/hjg0;->d:[B

    .line 163
    .line 164
    move v13, v9

    .line 165
    move v14, v13

    .line 166
    :goto_2
    const/16 v15, 0x10

    .line 167
    .line 168
    if-ge v13, v15, :cond_6

    .line 169
    .line 170
    invoke-static {v3, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 171
    .line 172
    .line 173
    move-result v15

    .line 174
    if-eqz v15, :cond_5

    .line 175
    .line 176
    shl-int v15, v2, v13

    .line 177
    .line 178
    or-int/2addr v14, v15

    .line 179
    :cond_5
    add-int/lit8 v13, v13, 0x1

    .line 180
    .line 181
    goto :goto_2

    .line 182
    :cond_6
    invoke-static {v5, v9}, Ljava/util/Arrays;->fill([ZZ)V

    .line 183
    .line 184
    .line 185
    move v13, v9

    .line 186
    :goto_3
    if-ge v13, v15, :cond_9

    .line 187
    .line 188
    shl-int v16, v2, v13

    .line 189
    .line 190
    and-int v16, v14, v16

    .line 191
    .line 192
    if-eqz v16, :cond_8

    .line 193
    .line 194
    shl-int/lit8 v16, v13, 0x4

    .line 195
    .line 196
    move v8, v9

    .line 197
    :goto_4
    if-ge v8, v15, :cond_8

    .line 198
    .line 199
    invoke-static {v3, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 200
    .line 201
    .line 202
    move-result v18

    .line 203
    if-eqz v18, :cond_7

    .line 204
    .line 205
    add-int v18, v16, v8

    .line 206
    .line 207
    aput-boolean v2, v5, v18

    .line 208
    .line 209
    :cond_7
    add-int/lit8 v8, v8, 0x1

    .line 210
    .line 211
    goto :goto_4

    .line 212
    :cond_8
    add-int/lit8 v13, v13, 0x1

    .line 213
    .line 214
    const/16 v8, 0x20

    .line 215
    .line 216
    goto :goto_3

    .line 217
    :cond_9
    iget-object v5, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 218
    .line 219
    iget-object v8, v5, Ll/hjg0;->a:[Z

    .line 220
    .line 221
    iget-object v5, v5, Ll/hjg0;->b:[B

    .line 222
    .line 223
    move v13, v9

    .line 224
    move v14, v13

    .line 225
    :goto_5
    const/16 v11, 0x100

    .line 226
    .line 227
    if-ge v13, v11, :cond_b

    .line 228
    .line 229
    aget-boolean v11, v8, v13

    .line 230
    .line 231
    if-eqz v11, :cond_a

    .line 232
    .line 233
    add-int/lit8 v11, v14, 0x1

    .line 234
    .line 235
    move/from16 v18, v9

    .line 236
    .line 237
    int-to-byte v9, v13

    .line 238
    aput-byte v9, v5, v14

    .line 239
    .line 240
    move v14, v11

    .line 241
    goto :goto_6

    .line 242
    :cond_a
    move/from16 v18, v9

    .line 243
    .line 244
    :goto_6
    add-int/lit8 v13, v13, 0x1

    .line 245
    .line 246
    move/from16 v9, v18

    .line 247
    .line 248
    goto :goto_5

    .line 249
    :cond_b
    move/from16 v18, v9

    .line 250
    .line 251
    iput v14, v0, Ll/tqg0;->f:I

    .line 252
    .line 253
    add-int/lit8 v14, v14, 0x2

    .line 254
    .line 255
    const/4 v5, 0x3

    .line 256
    invoke-static {v3, v5}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 257
    .line 258
    .line 259
    move-result v5

    .line 260
    const/16 v8, 0xf

    .line 261
    .line 262
    invoke-static {v3, v8}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 263
    .line 264
    .line 265
    move-result v8

    .line 266
    if-ltz v8, :cond_32

    .line 267
    .line 268
    const/16 v9, 0x103

    .line 269
    .line 270
    const-string v13, "alphaSize"

    .line 271
    .line 272
    invoke-static {v14, v9, v13}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 273
    .line 274
    .line 275
    const/4 v9, 0x7

    .line 276
    const-string v13, "nGroups"

    .line 277
    .line 278
    invoke-static {v5, v9, v13}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 279
    .line 280
    .line 281
    move/from16 v9, v18

    .line 282
    .line 283
    :goto_7
    const/16 v13, 0x4652

    .line 284
    .line 285
    if-ge v9, v8, :cond_e

    .line 286
    .line 287
    move/from16 v15, v18

    .line 288
    .line 289
    :goto_8
    invoke-static {v3, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 290
    .line 291
    .line 292
    move-result v20

    .line 293
    if-eqz v20, :cond_c

    .line 294
    .line 295
    add-int/lit8 v15, v15, 0x1

    .line 296
    .line 297
    goto :goto_8

    .line 298
    :cond_c
    if-ge v9, v13, :cond_d

    .line 299
    .line 300
    int-to-byte v13, v15

    .line 301
    aput-byte v13, v12, v9

    .line 302
    .line 303
    :cond_d
    add-int/lit8 v9, v9, 0x1

    .line 304
    .line 305
    const/16 v15, 0x10

    .line 306
    .line 307
    goto :goto_7

    .line 308
    :cond_e
    if-le v8, v13, :cond_f

    .line 309
    .line 310
    move v8, v13

    .line 311
    :cond_f
    move v9, v5

    .line 312
    :goto_9
    const/4 v15, -0x1

    .line 313
    add-int/2addr v9, v15

    .line 314
    if-ltz v9, :cond_10

    .line 315
    .line 316
    int-to-byte v15, v9

    .line 317
    aput-byte v15, v6, v9

    .line 318
    .line 319
    goto :goto_9

    .line 320
    :cond_10
    move/from16 v20, v15

    .line 321
    .line 322
    move/from16 v9, v18

    .line 323
    .line 324
    :goto_a
    const/4 v15, 0x6

    .line 325
    if-ge v9, v8, :cond_12

    .line 326
    .line 327
    aget-byte v13, v12, v9

    .line 328
    .line 329
    and-int/lit16 v13, v13, 0xff

    .line 330
    .line 331
    const-string v11, "selectorMtf"

    .line 332
    .line 333
    invoke-static {v13, v15, v11}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 334
    .line 335
    .line 336
    aget-byte v11, v6, v13

    .line 337
    .line 338
    :goto_b
    if-lez v13, :cond_11

    .line 339
    .line 340
    add-int/lit8 v15, v13, -0x1

    .line 341
    .line 342
    aget-byte v15, v6, v15

    .line 343
    .line 344
    aput-byte v15, v6, v13

    .line 345
    .line 346
    add-int/lit8 v13, v13, -0x1

    .line 347
    .line 348
    goto :goto_b

    .line 349
    :cond_11
    aput-byte v11, v6, v18

    .line 350
    .line 351
    aput-byte v11, v7, v9

    .line 352
    .line 353
    add-int/lit8 v9, v9, 0x1

    .line 354
    .line 355
    const/16 v11, 0x100

    .line 356
    .line 357
    const/16 v13, 0x4652

    .line 358
    .line 359
    goto :goto_a

    .line 360
    :cond_12
    iget-object v4, v4, Ll/hjg0;->l:[[C

    .line 361
    .line 362
    move/from16 v6, v18

    .line 363
    .line 364
    :goto_c
    if-ge v6, v5, :cond_16

    .line 365
    .line 366
    const/4 v7, 0x5

    .line 367
    invoke-static {v3, v7}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 368
    .line 369
    .line 370
    move-result v7

    .line 371
    aget-object v8, v4, v6

    .line 372
    .line 373
    move/from16 v9, v18

    .line 374
    .line 375
    :goto_d
    if-ge v9, v14, :cond_15

    .line 376
    .line 377
    :goto_e
    invoke-static {v3, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 378
    .line 379
    .line 380
    move-result v11

    .line 381
    if-eqz v11, :cond_14

    .line 382
    .line 383
    invoke-static {v3, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 384
    .line 385
    .line 386
    move-result v11

    .line 387
    if-eqz v11, :cond_13

    .line 388
    .line 389
    move/from16 v11, v20

    .line 390
    .line 391
    goto :goto_f

    .line 392
    :cond_13
    move v11, v2

    .line 393
    :goto_f
    add-int/2addr v7, v11

    .line 394
    goto :goto_e

    .line 395
    :cond_14
    int-to-char v11, v7

    .line 396
    aput-char v11, v8, v9

    .line 397
    .line 398
    add-int/lit8 v9, v9, 0x1

    .line 399
    .line 400
    goto :goto_d

    .line 401
    :cond_15
    add-int/lit8 v6, v6, 0x1

    .line 402
    .line 403
    goto :goto_c

    .line 404
    :cond_16
    iget-object v3, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 405
    .line 406
    iget-object v4, v3, Ll/hjg0;->l:[[C

    .line 407
    .line 408
    iget-object v6, v3, Ll/hjg0;->i:[I

    .line 409
    .line 410
    iget-object v7, v3, Ll/hjg0;->f:[[I

    .line 411
    .line 412
    iget-object v8, v3, Ll/hjg0;->g:[[I

    .line 413
    .line 414
    iget-object v3, v3, Ll/hjg0;->h:[[I

    .line 415
    .line 416
    move/from16 v9, v18

    .line 417
    .line 418
    :goto_10
    if-ge v9, v5, :cond_22

    .line 419
    .line 420
    aget-object v12, v4, v9

    .line 421
    .line 422
    move/from16 v23, v2

    .line 423
    .line 424
    move/from16 v22, v14

    .line 425
    .line 426
    move/from16 v13, v18

    .line 427
    .line 428
    const/16 v2, 0x20

    .line 429
    .line 430
    :goto_11
    add-int/lit8 v22, v22, -0x1

    .line 431
    .line 432
    if-ltz v22, :cond_19

    .line 433
    .line 434
    aget-char v15, v12, v22

    .line 435
    .line 436
    if-le v15, v13, :cond_17

    .line 437
    .line 438
    move v13, v15

    .line 439
    :cond_17
    if-ge v15, v2, :cond_18

    .line 440
    .line 441
    move v2, v15

    .line 442
    :cond_18
    const/4 v15, 0x6

    .line 443
    goto :goto_11

    .line 444
    :cond_19
    aget-object v12, v7, v9

    .line 445
    .line 446
    aget-object v15, v8, v9

    .line 447
    .line 448
    aget-object v22, v3, v9

    .line 449
    .line 450
    aget-object v25, v4, v9

    .line 451
    .line 452
    move v10, v2

    .line 453
    move/from16 v26, v18

    .line 454
    .line 455
    :goto_12
    if-gt v10, v13, :cond_1c

    .line 456
    .line 457
    move/from16 v11, v18

    .line 458
    .line 459
    :goto_13
    if-ge v11, v14, :cond_1b

    .line 460
    .line 461
    move/from16 v29, v2

    .line 462
    .line 463
    aget-char v2, v25, v11

    .line 464
    .line 465
    if-ne v2, v10, :cond_1a

    .line 466
    .line 467
    add-int/lit8 v2, v26, 0x1

    .line 468
    .line 469
    aput v11, v22, v26

    .line 470
    .line 471
    move/from16 v26, v2

    .line 472
    .line 473
    :cond_1a
    add-int/lit8 v11, v11, 0x1

    .line 474
    .line 475
    move/from16 v2, v29

    .line 476
    .line 477
    goto :goto_13

    .line 478
    :cond_1b
    move/from16 v29, v2

    .line 479
    .line 480
    add-int/lit8 v10, v10, 0x1

    .line 481
    .line 482
    goto :goto_12

    .line 483
    :cond_1c
    move/from16 v29, v2

    .line 484
    .line 485
    const/16 v2, 0x17

    .line 486
    .line 487
    :goto_14
    add-int/lit8 v2, v2, -0x1

    .line 488
    .line 489
    if-lez v2, :cond_1d

    .line 490
    .line 491
    aput v18, v15, v2

    .line 492
    .line 493
    aput v18, v12, v2

    .line 494
    .line 495
    goto :goto_14

    .line 496
    :cond_1d
    move/from16 v2, v18

    .line 497
    .line 498
    :goto_15
    if-ge v2, v14, :cond_1e

    .line 499
    .line 500
    aget-char v10, v25, v2

    .line 501
    .line 502
    const-string v11, "length"

    .line 503
    .line 504
    move/from16 v22, v2

    .line 505
    .line 506
    const/16 v2, 0x102

    .line 507
    .line 508
    invoke-static {v10, v2, v11}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 509
    .line 510
    .line 511
    add-int/lit8 v10, v10, 0x1

    .line 512
    .line 513
    aget v2, v15, v10

    .line 514
    .line 515
    add-int/lit8 v2, v2, 0x1

    .line 516
    .line 517
    aput v2, v15, v10

    .line 518
    .line 519
    add-int/lit8 v2, v22, 0x1

    .line 520
    .line 521
    goto :goto_15

    .line 522
    :cond_1e
    aget v2, v15, v18

    .line 523
    .line 524
    move/from16 v10, v23

    .line 525
    .line 526
    const/16 v11, 0x17

    .line 527
    .line 528
    :goto_16
    if-ge v10, v11, :cond_1f

    .line 529
    .line 530
    aget v22, v15, v10

    .line 531
    .line 532
    add-int v2, v2, v22

    .line 533
    .line 534
    aput v2, v15, v10

    .line 535
    .line 536
    add-int/lit8 v10, v10, 0x1

    .line 537
    .line 538
    goto :goto_16

    .line 539
    :cond_1f
    aget v2, v15, v29

    .line 540
    .line 541
    move/from16 v10, v18

    .line 542
    .line 543
    move/from16 v11, v29

    .line 544
    .line 545
    :goto_17
    if-gt v11, v13, :cond_20

    .line 546
    .line 547
    add-int/lit8 v22, v11, 0x1

    .line 548
    .line 549
    aget v25, v15, v22

    .line 550
    .line 551
    sub-int v2, v25, v2

    .line 552
    .line 553
    add-int/2addr v2, v10

    .line 554
    add-int/lit8 v10, v2, -0x1

    .line 555
    .line 556
    aput v10, v12, v11

    .line 557
    .line 558
    shl-int/lit8 v10, v2, 0x1

    .line 559
    .line 560
    move/from16 v11, v22

    .line 561
    .line 562
    move/from16 v2, v25

    .line 563
    .line 564
    goto :goto_17

    .line 565
    :cond_20
    add-int/lit8 v2, v29, 0x1

    .line 566
    .line 567
    :goto_18
    if-gt v2, v13, :cond_21

    .line 568
    .line 569
    add-int/lit8 v10, v2, -0x1

    .line 570
    .line 571
    aget v10, v12, v10

    .line 572
    .line 573
    add-int/lit8 v10, v10, 0x1

    .line 574
    .line 575
    shl-int/lit8 v10, v10, 0x1

    .line 576
    .line 577
    aget v11, v15, v2

    .line 578
    .line 579
    sub-int/2addr v10, v11

    .line 580
    aput v10, v15, v2

    .line 581
    .line 582
    add-int/lit8 v2, v2, 0x1

    .line 583
    .line 584
    goto :goto_18

    .line 585
    :cond_21
    aput v29, v6, v9

    .line 586
    .line 587
    add-int/lit8 v9, v9, 0x1

    .line 588
    .line 589
    move/from16 v2, v23

    .line 590
    .line 591
    const/16 v10, 0x17

    .line 592
    .line 593
    const/4 v15, 0x6

    .line 594
    goto/16 :goto_10

    .line 595
    .line 596
    :cond_22
    move/from16 v23, v2

    .line 597
    .line 598
    iget-object v2, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 599
    .line 600
    iget-object v3, v2, Ll/hjg0;->o:[B

    .line 601
    .line 602
    iget-object v4, v2, Ll/hjg0;->e:[I

    .line 603
    .line 604
    iget-object v5, v2, Ll/hjg0;->c:[B

    .line 605
    .line 606
    iget-object v6, v2, Ll/hjg0;->b:[B

    .line 607
    .line 608
    iget-object v7, v2, Ll/hjg0;->k:[C

    .line 609
    .line 610
    iget-object v8, v2, Ll/hjg0;->i:[I

    .line 611
    .line 612
    iget-object v9, v2, Ll/hjg0;->f:[[I

    .line 613
    .line 614
    iget-object v10, v2, Ll/hjg0;->g:[[I

    .line 615
    .line 616
    iget-object v2, v2, Ll/hjg0;->h:[[I

    .line 617
    .line 618
    iget v11, v0, Ll/tqg0;->c:I

    .line 619
    .line 620
    const v12, 0x186a0

    .line 621
    .line 622
    .line 623
    mul-int/2addr v11, v12

    .line 624
    const/16 v12, 0x100

    .line 625
    .line 626
    :goto_19
    add-int/lit8 v12, v12, -0x1

    .line 627
    .line 628
    if-ltz v12, :cond_23

    .line 629
    .line 630
    int-to-char v13, v12

    .line 631
    aput-char v13, v7, v12

    .line 632
    .line 633
    aput v18, v4, v12

    .line 634
    .line 635
    goto :goto_19

    .line 636
    :cond_23
    iget v12, v0, Ll/tqg0;->f:I

    .line 637
    .line 638
    add-int/lit8 v12, v12, 0x1

    .line 639
    .line 640
    iget-object v13, v0, Ll/tqg0;->u:Ll/hjg0;

    .line 641
    .line 642
    iget-object v14, v13, Ll/hjg0;->c:[B

    .line 643
    .line 644
    aget-byte v14, v14, v18

    .line 645
    .line 646
    and-int/lit16 v14, v14, 0xff

    .line 647
    .line 648
    const-string v15, "zt"

    .line 649
    .line 650
    move-object/from16 v17, v2

    .line 651
    .line 652
    const/4 v2, 0x6

    .line 653
    invoke-static {v14, v2, v15}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 654
    .line 655
    .line 656
    iget-object v2, v13, Ll/hjg0;->f:[[I

    .line 657
    .line 658
    aget-object v2, v2, v14

    .line 659
    .line 660
    move-object/from16 v22, v2

    .line 661
    .line 662
    iget-object v2, v13, Ll/hjg0;->i:[I

    .line 663
    .line 664
    aget v2, v2, v14

    .line 665
    .line 666
    move-object/from16 v25, v4

    .line 667
    .line 668
    const-string v4, "zn"

    .line 669
    .line 670
    move-object/from16 v26, v5

    .line 671
    .line 672
    const/16 v5, 0x102

    .line 673
    .line 674
    invoke-static {v2, v5, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 675
    .line 676
    .line 677
    iget-object v5, v0, Ll/tqg0;->g:Ll/drg0;

    .line 678
    .line 679
    invoke-static {v5, v2}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 680
    .line 681
    .line 682
    move-result v5

    .line 683
    move/from16 v27, v2

    .line 684
    .line 685
    :goto_1a
    aget v2, v22, v27

    .line 686
    .line 687
    if-le v5, v2, :cond_24

    .line 688
    .line 689
    add-int/lit8 v2, v27, 0x1

    .line 690
    .line 691
    move/from16 v29, v5

    .line 692
    .line 693
    const/16 v5, 0x102

    .line 694
    .line 695
    invoke-static {v2, v5, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 696
    .line 697
    .line 698
    shl-int/lit8 v5, v29, 0x1

    .line 699
    .line 700
    move/from16 v27, v2

    .line 701
    .line 702
    iget-object v2, v0, Ll/tqg0;->g:Ll/drg0;

    .line 703
    .line 704
    move/from16 v29, v5

    .line 705
    .line 706
    move/from16 v5, v23

    .line 707
    .line 708
    invoke-static {v2, v5}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 709
    .line 710
    .line 711
    move-result v2

    .line 712
    or-int v5, v29, v2

    .line 713
    .line 714
    const/16 v23, 0x1

    .line 715
    .line 716
    goto :goto_1a

    .line 717
    :cond_24
    move/from16 v29, v5

    .line 718
    .line 719
    iget-object v2, v13, Ll/hjg0;->g:[[I

    .line 720
    .line 721
    aget-object v2, v2, v14

    .line 722
    .line 723
    aget v2, v2, v27

    .line 724
    .line 725
    sub-int v5, v29, v2

    .line 726
    .line 727
    const-string v2, "zvec"

    .line 728
    .line 729
    move-object/from16 v22, v6

    .line 730
    .line 731
    const/16 v6, 0x102

    .line 732
    .line 733
    invoke-static {v5, v6, v2}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 734
    .line 735
    .line 736
    iget-object v6, v13, Ll/hjg0;->h:[[I

    .line 737
    .line 738
    aget-object v6, v6, v14

    .line 739
    .line 740
    aget v5, v6, v5

    .line 741
    .line 742
    aget-byte v6, v26, v18

    .line 743
    .line 744
    and-int/lit16 v6, v6, 0xff

    .line 745
    .line 746
    const/4 v13, 0x6

    .line 747
    invoke-static {v6, v13, v15}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 748
    .line 749
    .line 750
    aget-object v13, v10, v6

    .line 751
    .line 752
    aget-object v14, v9, v6

    .line 753
    .line 754
    aget-object v27, v17, v6

    .line 755
    .line 756
    aget v6, v8, v6

    .line 757
    .line 758
    move/from16 v30, v6

    .line 759
    .line 760
    move/from16 v6, v20

    .line 761
    .line 762
    move-object/from16 v29, v27

    .line 763
    .line 764
    const/16 v31, 0x31

    .line 765
    .line 766
    move/from16 v27, v18

    .line 767
    .line 768
    :goto_1b
    if-eq v5, v12, :cond_31

    .line 769
    .line 770
    move-object/from16 v32, v8

    .line 771
    .line 772
    const-string v8, " exceeds "

    .line 773
    .line 774
    move-object/from16 v33, v9

    .line 775
    .line 776
    const-string v9, "groupNo"

    .line 777
    .line 778
    move-object/from16 v34, v10

    .line 779
    .line 780
    const-string v10, "yy"

    .line 781
    .line 782
    move/from16 v35, v12

    .line 783
    .line 784
    if-eqz v5, :cond_25

    .line 785
    .line 786
    const/4 v12, 0x1

    .line 787
    if-ne v5, v12, :cond_26

    .line 788
    .line 789
    :cond_25
    move-object/from16 v36, v13

    .line 790
    .line 791
    const/16 v13, 0x10

    .line 792
    .line 793
    goto/16 :goto_22

    .line 794
    .line 795
    :cond_26
    add-int/lit8 v6, v6, 0x1

    .line 796
    .line 797
    if-ge v6, v11, :cond_2b

    .line 798
    .line 799
    const/16 v8, 0x101

    .line 800
    .line 801
    const-string v12, "nextSym"

    .line 802
    .line 803
    invoke-static {v5, v8, v12}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 804
    .line 805
    .line 806
    add-int/lit8 v8, v5, -0x1

    .line 807
    .line 808
    aget-char v12, v7, v8

    .line 809
    .line 810
    move-object/from16 v36, v13

    .line 811
    .line 812
    const/16 v13, 0x100

    .line 813
    .line 814
    invoke-static {v12, v13, v10}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 815
    .line 816
    .line 817
    aget-byte v10, v22, v12

    .line 818
    .line 819
    and-int/lit16 v13, v10, 0xff

    .line 820
    .line 821
    aget v37, v25, v13

    .line 822
    .line 823
    const/16 v23, 0x1

    .line 824
    .line 825
    add-int/lit8 v37, v37, 0x1

    .line 826
    .line 827
    aput v37, v25, v13

    .line 828
    .line 829
    aput-byte v10, v3, v6

    .line 830
    .line 831
    const/16 v13, 0x10

    .line 832
    .line 833
    if-gt v5, v13, :cond_28

    .line 834
    .line 835
    :goto_1c
    if-lez v8, :cond_27

    .line 836
    .line 837
    add-int/lit8 v5, v8, -0x1

    .line 838
    .line 839
    aget-char v10, v7, v5

    .line 840
    .line 841
    aput-char v10, v7, v8

    .line 842
    .line 843
    move v8, v5

    .line 844
    goto :goto_1c

    .line 845
    :cond_27
    move/from16 v5, v18

    .line 846
    .line 847
    goto :goto_1d

    .line 848
    :cond_28
    move/from16 v5, v18

    .line 849
    .line 850
    const/4 v10, 0x1

    .line 851
    invoke-static {v7, v5, v7, v10, v8}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 852
    .line 853
    .line 854
    :goto_1d
    aput-char v12, v7, v5

    .line 855
    .line 856
    if-nez v31, :cond_29

    .line 857
    .line 858
    add-int/lit8 v5, v27, 0x1

    .line 859
    .line 860
    const/16 v8, 0x4652

    .line 861
    .line 862
    invoke-static {v5, v8, v9}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 863
    .line 864
    .line 865
    aget-byte v8, v26, v5

    .line 866
    .line 867
    and-int/lit16 v8, v8, 0xff

    .line 868
    .line 869
    const/4 v9, 0x6

    .line 870
    invoke-static {v8, v9, v15}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 871
    .line 872
    .line 873
    aget-object v9, v34, v8

    .line 874
    .line 875
    aget-object v10, v33, v8

    .line 876
    .line 877
    aget-object v12, v17, v8

    .line 878
    .line 879
    aget v8, v32, v8

    .line 880
    .line 881
    move/from16 v27, v5

    .line 882
    .line 883
    move-object/from16 v36, v9

    .line 884
    .line 885
    move-object v14, v10

    .line 886
    move-object/from16 v29, v12

    .line 887
    .line 888
    const/16 v31, 0x31

    .line 889
    .line 890
    :goto_1e
    const/16 v5, 0x102

    .line 891
    .line 892
    goto :goto_1f

    .line 893
    :cond_29
    add-int/lit8 v31, v31, -0x1

    .line 894
    .line 895
    move/from16 v8, v30

    .line 896
    .line 897
    goto :goto_1e

    .line 898
    :goto_1f
    invoke-static {v8, v5, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 899
    .line 900
    .line 901
    invoke-static {v1, v8}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 902
    .line 903
    .line 904
    move-result v9

    .line 905
    move v10, v8

    .line 906
    :goto_20
    aget v12, v14, v10

    .line 907
    .line 908
    if-le v9, v12, :cond_2a

    .line 909
    .line 910
    add-int/lit8 v10, v10, 0x1

    .line 911
    .line 912
    invoke-static {v10, v5, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 913
    .line 914
    .line 915
    shl-int/lit8 v9, v9, 0x1

    .line 916
    .line 917
    const/4 v12, 0x1

    .line 918
    invoke-static {v1, v12}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 919
    .line 920
    .line 921
    move-result v19

    .line 922
    or-int v9, v9, v19

    .line 923
    .line 924
    goto :goto_20

    .line 925
    :cond_2a
    aget v10, v36, v10

    .line 926
    .line 927
    sub-int/2addr v9, v10

    .line 928
    invoke-static {v9, v5, v2}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 929
    .line 930
    .line 931
    aget v5, v29, v9

    .line 932
    .line 933
    move/from16 v30, v8

    .line 934
    .line 935
    move-object/from16 v8, v32

    .line 936
    .line 937
    move-object/from16 v9, v33

    .line 938
    .line 939
    move-object/from16 v10, v34

    .line 940
    .line 941
    move/from16 v12, v35

    .line 942
    .line 943
    move-object/from16 v13, v36

    .line 944
    .line 945
    :goto_21
    const/16 v18, 0x0

    .line 946
    .line 947
    goto/16 :goto_1b

    .line 948
    .line 949
    :cond_2b
    new-instance v0, Ljava/io/IOException;

    .line 950
    .line 951
    new-instance v1, Ljava/lang/StringBuilder;

    .line 952
    .line 953
    const-string v2, "Block overrun in MTF, "

    .line 954
    .line 955
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 956
    .line 957
    .line 958
    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 959
    .line 960
    .line 961
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 962
    .line 963
    .line 964
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 965
    .line 966
    .line 967
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 968
    .line 969
    .line 970
    move-result-object v1

    .line 971
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 972
    .line 973
    .line 974
    throw v0

    .line 975
    :goto_22
    move/from16 v19, v20

    .line 976
    .line 977
    const/4 v12, 0x1

    .line 978
    :goto_23
    if-nez v5, :cond_2c

    .line 979
    .line 980
    add-int v19, v19, v12

    .line 981
    .line 982
    goto :goto_24

    .line 983
    :cond_2c
    const/4 v13, 0x1

    .line 984
    if-ne v5, v13, :cond_2f

    .line 985
    .line 986
    shl-int/lit8 v5, v12, 0x1

    .line 987
    .line 988
    add-int v19, v19, v5

    .line 989
    .line 990
    :goto_24
    if-nez v31, :cond_2d

    .line 991
    .line 992
    add-int/lit8 v5, v27, 0x1

    .line 993
    .line 994
    const/16 v13, 0x4652

    .line 995
    .line 996
    invoke-static {v5, v13, v9}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 997
    .line 998
    .line 999
    aget-byte v14, v26, v5

    .line 1000
    .line 1001
    and-int/lit16 v14, v14, 0xff

    .line 1002
    .line 1003
    const/4 v13, 0x6

    .line 1004
    invoke-static {v14, v13, v15}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 1005
    .line 1006
    .line 1007
    aget-object v36, v34, v14

    .line 1008
    .line 1009
    aget-object v24, v33, v14

    .line 1010
    .line 1011
    aget-object v29, v17, v14

    .line 1012
    .line 1013
    aget v30, v32, v14

    .line 1014
    .line 1015
    move/from16 v27, v5

    .line 1016
    .line 1017
    move-object/from16 v14, v24

    .line 1018
    .line 1019
    const/16 v31, 0x31

    .line 1020
    .line 1021
    :goto_25
    move/from16 v5, v30

    .line 1022
    .line 1023
    const/16 v13, 0x102

    .line 1024
    .line 1025
    goto :goto_26

    .line 1026
    :cond_2d
    const/4 v13, 0x6

    .line 1027
    add-int/lit8 v31, v31, -0x1

    .line 1028
    .line 1029
    goto :goto_25

    .line 1030
    :goto_26
    invoke-static {v5, v13, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 1031
    .line 1032
    .line 1033
    invoke-static {v1, v5}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 1034
    .line 1035
    .line 1036
    move-result v28

    .line 1037
    move/from16 v30, v5

    .line 1038
    .line 1039
    move/from16 v13, v28

    .line 1040
    .line 1041
    move/from16 v28, v30

    .line 1042
    .line 1043
    :goto_27
    aget v5, v14, v28

    .line 1044
    .line 1045
    if-le v13, v5, :cond_2e

    .line 1046
    .line 1047
    add-int/lit8 v5, v28, 0x1

    .line 1048
    .line 1049
    move-object/from16 v38, v7

    .line 1050
    .line 1051
    const/16 v7, 0x102

    .line 1052
    .line 1053
    invoke-static {v5, v7, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 1054
    .line 1055
    .line 1056
    shl-int/lit8 v13, v13, 0x1

    .line 1057
    .line 1058
    const/4 v7, 0x1

    .line 1059
    invoke-static {v1, v7}, Ll/tqg0;->b(Ll/drg0;I)I

    .line 1060
    .line 1061
    .line 1062
    move-result v28

    .line 1063
    or-int v13, v13, v28

    .line 1064
    .line 1065
    move/from16 v28, v5

    .line 1066
    .line 1067
    move-object/from16 v7, v38

    .line 1068
    .line 1069
    goto :goto_27

    .line 1070
    :cond_2e
    move-object/from16 v38, v7

    .line 1071
    .line 1072
    aget v5, v36, v28

    .line 1073
    .line 1074
    sub-int/2addr v13, v5

    .line 1075
    const/16 v7, 0x102

    .line 1076
    .line 1077
    invoke-static {v13, v7, v2}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 1078
    .line 1079
    .line 1080
    aget v5, v29, v13

    .line 1081
    .line 1082
    shl-int/lit8 v12, v12, 0x1

    .line 1083
    .line 1084
    move-object/from16 v7, v38

    .line 1085
    .line 1086
    const/16 v13, 0x10

    .line 1087
    .line 1088
    goto :goto_23

    .line 1089
    :cond_2f
    move-object/from16 v38, v7

    .line 1090
    .line 1091
    const/16 v7, 0x102

    .line 1092
    .line 1093
    const/16 v18, 0x0

    .line 1094
    .line 1095
    aget-char v9, v38, v18

    .line 1096
    .line 1097
    const/16 v13, 0x100

    .line 1098
    .line 1099
    invoke-static {v9, v13, v10}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 1100
    .line 1101
    .line 1102
    aget-byte v9, v22, v9

    .line 1103
    .line 1104
    and-int/lit16 v10, v9, 0xff

    .line 1105
    .line 1106
    aget v12, v25, v10

    .line 1107
    .line 1108
    add-int/lit8 v21, v19, 0x1

    .line 1109
    .line 1110
    add-int v21, v21, v12

    .line 1111
    .line 1112
    aput v21, v25, v10

    .line 1113
    .line 1114
    add-int/lit8 v6, v6, 0x1

    .line 1115
    .line 1116
    add-int v10, v6, v19

    .line 1117
    .line 1118
    add-int/lit8 v12, v10, 0x1

    .line 1119
    .line 1120
    invoke-static {v3, v6, v12, v9}, Ljava/util/Arrays;->fill([BIIB)V

    .line 1121
    .line 1122
    .line 1123
    if-ge v10, v11, :cond_30

    .line 1124
    .line 1125
    move v6, v10

    .line 1126
    move-object/from16 v8, v32

    .line 1127
    .line 1128
    move-object/from16 v9, v33

    .line 1129
    .line 1130
    move-object/from16 v10, v34

    .line 1131
    .line 1132
    move/from16 v12, v35

    .line 1133
    .line 1134
    move-object/from16 v13, v36

    .line 1135
    .line 1136
    move-object/from16 v7, v38

    .line 1137
    .line 1138
    goto/16 :goto_21

    .line 1139
    .line 1140
    :cond_30
    new-instance v0, Ljava/io/IOException;

    .line 1141
    .line 1142
    new-instance v1, Ljava/lang/StringBuilder;

    .line 1143
    .line 1144
    const-string v2, "Block overrun while expanding RLE in MTF, "

    .line 1145
    .line 1146
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1147
    .line 1148
    .line 1149
    invoke-virtual {v1, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1150
    .line 1151
    .line 1152
    invoke-virtual {v1, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1153
    .line 1154
    .line 1155
    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1156
    .line 1157
    .line 1158
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 1159
    .line 1160
    .line 1161
    move-result-object v1

    .line 1162
    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 1163
    .line 1164
    .line 1165
    throw v0

    .line 1166
    :cond_31
    iput v6, v0, Ll/tqg0;->a:I

    .line 1167
    .line 1168
    iget-object v1, v0, Ll/tqg0;->e:Ll/lng0;

    .line 1169
    .line 1170
    move/from16 v2, v20

    .line 1171
    .line 1172
    iput v2, v1, Ll/lng0;->a:I

    .line 1173
    .line 1174
    const/4 v12, 0x1

    .line 1175
    iput v12, v0, Ll/tqg0;->h:I

    .line 1176
    .line 1177
    return-void

    .line 1178
    :cond_32
    const-string v0, "Corrupted input, nSelectors value negative"

    .line 1179
    .line 1180
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 1181
    .line 1182
    .line 1183
    return-void

    .line 1184
    :cond_33
    move v5, v9

    .line 1185
    iput v5, v0, Ll/tqg0;->h:I

    .line 1186
    .line 1187
    const-string v0, "Bad block header"

    .line 1188
    .line 1189
    invoke-static {v0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 1190
    .line 1191
    .line 1192
    return-void
.end method

.method public final n()I
    .locals 11

    .line 1
    iget v0, p0, Ll/tqg0;->h:I

    .line 2
    .line 3
    if-eqz v0, :cond_7

    .line 4
    .line 5
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_2

    .line 10
    :cond_0
    iget-object v1, v0, Ll/hjg0;->j:[I

    .line 11
    .line 12
    iget v2, p0, Ll/tqg0;->a:I

    .line 13
    .line 14
    const/4 v3, 0x1

    .line 15
    add-int/2addr v2, v3

    .line 16
    iget-object v4, v0, Ll/hjg0;->n:[I

    .line 17
    .line 18
    if-eqz v4, :cond_1

    .line 19
    .line 20
    array-length v5, v4

    .line 21
    if-ge v5, v2, :cond_2

    .line 22
    .line 23
    :cond_1
    new-array v4, v2, [I

    .line 24
    .line 25
    iput-object v4, v0, Ll/hjg0;->n:[I

    .line 26
    .line 27
    :cond_2
    iget-object v5, v0, Ll/hjg0;->o:[B

    .line 28
    .line 29
    const/4 v6, 0x0

    .line 30
    aput v6, v1, v6

    .line 31
    .line 32
    iget-object v0, v0, Ll/hjg0;->e:[I

    .line 33
    .line 34
    const/16 v7, 0x100

    .line 35
    .line 36
    invoke-static {v0, v6, v1, v3, v7}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 37
    .line 38
    .line 39
    aget v0, v1, v6

    .line 40
    .line 41
    :goto_0
    if-gt v3, v7, :cond_3

    .line 42
    .line 43
    aget v8, v1, v3

    .line 44
    .line 45
    add-int/2addr v0, v8

    .line 46
    aput v0, v1, v3

    .line 47
    .line 48
    add-int/lit8 v3, v3, 0x1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_3
    iget v0, p0, Ll/tqg0;->a:I

    .line 52
    .line 53
    move v3, v6

    .line 54
    :goto_1
    if-gt v3, v0, :cond_4

    .line 55
    .line 56
    aget-byte v8, v5, v3

    .line 57
    .line 58
    and-int/lit16 v8, v8, 0xff

    .line 59
    .line 60
    aget v9, v1, v8

    .line 61
    .line 62
    add-int/lit8 v10, v9, 0x1

    .line 63
    .line 64
    aput v10, v1, v8

    .line 65
    .line 66
    const-string v8, "tt index"

    .line 67
    .line 68
    invoke-static {v9, v2, v8}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 69
    .line 70
    .line 71
    aput v3, v4, v9

    .line 72
    .line 73
    add-int/lit8 v3, v3, 0x1

    .line 74
    .line 75
    goto :goto_1

    .line 76
    :cond_4
    iget v0, p0, Ll/tqg0;->b:I

    .line 77
    .line 78
    if-ltz v0, :cond_6

    .line 79
    .line 80
    array-length v1, v4

    .line 81
    if-ge v0, v1, :cond_6

    .line 82
    .line 83
    aget v0, v4, v0

    .line 84
    .line 85
    iput v0, p0, Ll/tqg0;->s:I

    .line 86
    .line 87
    iput v6, p0, Ll/tqg0;->l:I

    .line 88
    .line 89
    iput v6, p0, Ll/tqg0;->o:I

    .line 90
    .line 91
    iput v7, p0, Ll/tqg0;->m:I

    .line 92
    .line 93
    iget-boolean v0, p0, Ll/tqg0;->d:Z

    .line 94
    .line 95
    if-eqz v0, :cond_5

    .line 96
    .line 97
    iput v6, p0, Ll/tqg0;->q:I

    .line 98
    .line 99
    iput v6, p0, Ll/tqg0;->r:I

    .line 100
    .line 101
    invoke-virtual {p0}, Ll/tqg0;->u()I

    .line 102
    .line 103
    .line 104
    move-result p0

    .line 105
    return p0

    .line 106
    :cond_5
    invoke-virtual {p0}, Ll/tqg0;->t()I

    .line 107
    .line 108
    .line 109
    move-result p0

    .line 110
    return p0

    .line 111
    :cond_6
    const-string p0, "Stream corrupted"

    .line 112
    .line 113
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    return v6

    .line 117
    :cond_7
    :goto_2
    const/4 p0, -0x1

    .line 118
    return p0
.end method

.method public final q()I
    .locals 8

    .line 1
    iget v0, p0, Ll/tqg0;->h:I

    .line 2
    .line 3
    const-string v1, "su_tPos"

    .line 4
    .line 5
    const/4 v2, 0x7

    .line 6
    const/4 v3, 0x4

    .line 7
    const/4 v4, 0x2

    .line 8
    const/4 v5, 0x0

    .line 9
    const/4 v6, 0x1

    .line 10
    packed-switch v0, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    invoke-static {}, Ll/wpg0;->a()V

    .line 14
    .line 15
    .line 16
    return v5

    .line 17
    :pswitch_0
    iget v0, p0, Ll/tqg0;->p:I

    .line 18
    .line 19
    iget-char v1, p0, Ll/tqg0;->t:C

    .line 20
    .line 21
    if-ge v0, v1, :cond_0

    .line 22
    .line 23
    iget v0, p0, Ll/tqg0;->m:I

    .line 24
    .line 25
    iget-object v1, p0, Ll/tqg0;->e:Ll/lng0;

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ll/lng0;->a(I)V

    .line 28
    .line 29
    .line 30
    iget v1, p0, Ll/tqg0;->p:I

    .line 31
    .line 32
    add-int/2addr v1, v6

    .line 33
    iput v1, p0, Ll/tqg0;->p:I

    .line 34
    .line 35
    iput v2, p0, Ll/tqg0;->h:I

    .line 36
    .line 37
    return v0

    .line 38
    :cond_0
    iget v0, p0, Ll/tqg0;->o:I

    .line 39
    .line 40
    add-int/2addr v0, v6

    .line 41
    iput v0, p0, Ll/tqg0;->o:I

    .line 42
    .line 43
    iput v5, p0, Ll/tqg0;->l:I

    .line 44
    .line 45
    invoke-virtual {p0}, Ll/tqg0;->t()I

    .line 46
    .line 47
    .line 48
    move-result p0

    .line 49
    return p0

    .line 50
    :pswitch_1
    iget v0, p0, Ll/tqg0;->m:I

    .line 51
    .line 52
    iget v4, p0, Ll/tqg0;->n:I

    .line 53
    .line 54
    if-eq v0, v4, :cond_1

    .line 55
    .line 56
    iput v6, p0, Ll/tqg0;->l:I

    .line 57
    .line 58
    invoke-virtual {p0}, Ll/tqg0;->t()I

    .line 59
    .line 60
    .line 61
    move-result p0

    .line 62
    return p0

    .line 63
    :cond_1
    iget v0, p0, Ll/tqg0;->l:I

    .line 64
    .line 65
    add-int/2addr v0, v6

    .line 66
    iput v0, p0, Ll/tqg0;->l:I

    .line 67
    .line 68
    if-lt v0, v3, :cond_3

    .line 69
    .line 70
    iget v0, p0, Ll/tqg0;->s:I

    .line 71
    .line 72
    iget-object v3, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 73
    .line 74
    iget-object v3, v3, Ll/hjg0;->o:[B

    .line 75
    .line 76
    array-length v3, v3

    .line 77
    invoke-static {v0, v3, v1}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 81
    .line 82
    iget-object v1, v0, Ll/hjg0;->o:[B

    .line 83
    .line 84
    iget v3, p0, Ll/tqg0;->s:I

    .line 85
    .line 86
    aget-byte v1, v1, v3

    .line 87
    .line 88
    and-int/lit16 v1, v1, 0xff

    .line 89
    .line 90
    int-to-char v1, v1

    .line 91
    iput-char v1, p0, Ll/tqg0;->t:C

    .line 92
    .line 93
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 94
    .line 95
    aget v0, v0, v3

    .line 96
    .line 97
    iput v0, p0, Ll/tqg0;->s:I

    .line 98
    .line 99
    iput v5, p0, Ll/tqg0;->p:I

    .line 100
    .line 101
    if-lez v1, :cond_2

    .line 102
    .line 103
    iget v0, p0, Ll/tqg0;->m:I

    .line 104
    .line 105
    iget-object v1, p0, Ll/tqg0;->e:Ll/lng0;

    .line 106
    .line 107
    invoke-virtual {v1, v0}, Ll/lng0;->a(I)V

    .line 108
    .line 109
    .line 110
    iget v1, p0, Ll/tqg0;->p:I

    .line 111
    .line 112
    add-int/2addr v1, v6

    .line 113
    iput v1, p0, Ll/tqg0;->p:I

    .line 114
    .line 115
    iput v2, p0, Ll/tqg0;->h:I

    .line 116
    .line 117
    return v0

    .line 118
    :cond_2
    iget v0, p0, Ll/tqg0;->o:I

    .line 119
    .line 120
    add-int/2addr v0, v6

    .line 121
    iput v0, p0, Ll/tqg0;->o:I

    .line 122
    .line 123
    iput v5, p0, Ll/tqg0;->l:I

    .line 124
    .line 125
    invoke-virtual {p0}, Ll/tqg0;->t()I

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    return p0

    .line 130
    :cond_3
    invoke-virtual {p0}, Ll/tqg0;->t()I

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    return p0

    .line 135
    :pswitch_2
    invoke-static {}, Ll/wpg0;->a()V

    .line 136
    .line 137
    .line 138
    return v5

    .line 139
    :pswitch_3
    iget v0, p0, Ll/tqg0;->p:I

    .line 140
    .line 141
    iget-char v1, p0, Ll/tqg0;->t:C

    .line 142
    .line 143
    if-ge v0, v1, :cond_4

    .line 144
    .line 145
    iget-object v0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 146
    .line 147
    iget v1, p0, Ll/tqg0;->m:I

    .line 148
    .line 149
    invoke-virtual {v0, v1}, Ll/lng0;->a(I)V

    .line 150
    .line 151
    .line 152
    iget v0, p0, Ll/tqg0;->p:I

    .line 153
    .line 154
    add-int/2addr v0, v6

    .line 155
    iput v0, p0, Ll/tqg0;->p:I

    .line 156
    .line 157
    iget p0, p0, Ll/tqg0;->m:I

    .line 158
    .line 159
    return p0

    .line 160
    :cond_4
    iput v4, p0, Ll/tqg0;->h:I

    .line 161
    .line 162
    iget v0, p0, Ll/tqg0;->o:I

    .line 163
    .line 164
    add-int/2addr v0, v6

    .line 165
    iput v0, p0, Ll/tqg0;->o:I

    .line 166
    .line 167
    iput v5, p0, Ll/tqg0;->l:I

    .line 168
    .line 169
    invoke-virtual {p0}, Ll/tqg0;->u()I

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    return p0

    .line 174
    :pswitch_4
    iget v0, p0, Ll/tqg0;->m:I

    .line 175
    .line 176
    iget v2, p0, Ll/tqg0;->n:I

    .line 177
    .line 178
    if-eq v0, v2, :cond_5

    .line 179
    .line 180
    iput v4, p0, Ll/tqg0;->h:I

    .line 181
    .line 182
    iput v6, p0, Ll/tqg0;->l:I

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/tqg0;->u()I

    .line 185
    .line 186
    .line 187
    move-result p0

    .line 188
    return p0

    .line 189
    :cond_5
    iget v0, p0, Ll/tqg0;->l:I

    .line 190
    .line 191
    add-int/2addr v0, v6

    .line 192
    iput v0, p0, Ll/tqg0;->l:I

    .line 193
    .line 194
    if-lt v0, v3, :cond_a

    .line 195
    .line 196
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 197
    .line 198
    iget-object v2, v0, Ll/hjg0;->o:[B

    .line 199
    .line 200
    iget v7, p0, Ll/tqg0;->s:I

    .line 201
    .line 202
    aget-byte v2, v2, v7

    .line 203
    .line 204
    and-int/lit16 v2, v2, 0xff

    .line 205
    .line 206
    int-to-char v2, v2

    .line 207
    iput-char v2, p0, Ll/tqg0;->t:C

    .line 208
    .line 209
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 210
    .line 211
    array-length v0, v0

    .line 212
    invoke-static {v7, v0, v1}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 213
    .line 214
    .line 215
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 216
    .line 217
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 218
    .line 219
    iget v1, p0, Ll/tqg0;->s:I

    .line 220
    .line 221
    aget v0, v0, v1

    .line 222
    .line 223
    iput v0, p0, Ll/tqg0;->s:I

    .line 224
    .line 225
    iget v0, p0, Ll/tqg0;->q:I

    .line 226
    .line 227
    if-nez v0, :cond_6

    .line 228
    .line 229
    iget v0, p0, Ll/tqg0;->r:I

    .line 230
    .line 231
    sget-object v1, Ll/otg0;->a:[I

    .line 232
    .line 233
    aget v1, v1, v0

    .line 234
    .line 235
    sub-int/2addr v1, v6

    .line 236
    iput v1, p0, Ll/tqg0;->q:I

    .line 237
    .line 238
    add-int/2addr v0, v6

    .line 239
    iput v0, p0, Ll/tqg0;->r:I

    .line 240
    .line 241
    const/16 v1, 0x200

    .line 242
    .line 243
    if-ne v0, v1, :cond_7

    .line 244
    .line 245
    iput v5, p0, Ll/tqg0;->r:I

    .line 246
    .line 247
    goto :goto_0

    .line 248
    :cond_6
    sub-int/2addr v0, v6

    .line 249
    iput v0, p0, Ll/tqg0;->q:I

    .line 250
    .line 251
    :cond_7
    :goto_0
    iput v5, p0, Ll/tqg0;->p:I

    .line 252
    .line 253
    iput v3, p0, Ll/tqg0;->h:I

    .line 254
    .line 255
    iget v0, p0, Ll/tqg0;->q:I

    .line 256
    .line 257
    if-ne v0, v6, :cond_8

    .line 258
    .line 259
    iget-char v0, p0, Ll/tqg0;->t:C

    .line 260
    .line 261
    xor-int/2addr v0, v6

    .line 262
    int-to-char v0, v0

    .line 263
    iput-char v0, p0, Ll/tqg0;->t:C

    .line 264
    .line 265
    :cond_8
    iget-char v0, p0, Ll/tqg0;->t:C

    .line 266
    .line 267
    if-lez v0, :cond_9

    .line 268
    .line 269
    iget-object v0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 270
    .line 271
    iget v1, p0, Ll/tqg0;->m:I

    .line 272
    .line 273
    invoke-virtual {v0, v1}, Ll/lng0;->a(I)V

    .line 274
    .line 275
    .line 276
    iget v0, p0, Ll/tqg0;->p:I

    .line 277
    .line 278
    add-int/2addr v0, v6

    .line 279
    iput v0, p0, Ll/tqg0;->p:I

    .line 280
    .line 281
    iget p0, p0, Ll/tqg0;->m:I

    .line 282
    .line 283
    return p0

    .line 284
    :cond_9
    iput v4, p0, Ll/tqg0;->h:I

    .line 285
    .line 286
    iget v0, p0, Ll/tqg0;->o:I

    .line 287
    .line 288
    add-int/2addr v0, v6

    .line 289
    iput v0, p0, Ll/tqg0;->o:I

    .line 290
    .line 291
    iput v5, p0, Ll/tqg0;->l:I

    .line 292
    .line 293
    invoke-virtual {p0}, Ll/tqg0;->u()I

    .line 294
    .line 295
    .line 296
    move-result p0

    .line 297
    return p0

    .line 298
    :cond_a
    iput v4, p0, Ll/tqg0;->h:I

    .line 299
    .line 300
    invoke-virtual {p0}, Ll/tqg0;->u()I

    .line 301
    .line 302
    .line 303
    move-result p0

    .line 304
    return p0

    .line 305
    :pswitch_5
    invoke-static {}, Ll/wpg0;->a()V

    .line 306
    .line 307
    .line 308
    return v5

    .line 309
    :pswitch_6
    invoke-virtual {p0}, Ll/tqg0;->n()I

    .line 310
    .line 311
    .line 312
    move-result p0

    .line 313
    return p0

    .line 314
    :pswitch_7
    const/4 p0, -0x1

    .line 315
    return p0

    .line 316
    nop

    .line 317
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final read()I
    .locals 2

    .line 104
    iget-object v0, p0, Ll/tqg0;->g:Ll/drg0;

    if-eqz v0, :cond_1

    .line 105
    invoke-virtual {p0}, Ll/tqg0;->q()I

    move-result v0

    if-gez v0, :cond_0

    const/4 v1, -0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x1

    .line 106
    :goto_0
    invoke-virtual {p0, v1}, Ll/gjg0;->count(I)V

    return v0

    .line 107
    :cond_1
    const-string p0, "Stream closed"

    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final read([BII)I
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, ") < 0."

    .line 3
    .line 4
    const-string v2, "offs("

    .line 5
    .line 6
    if-ltz p2, :cond_6

    .line 7
    .line 8
    if-ltz p3, :cond_5

    .line 9
    .line 10
    add-int v1, p2, p3

    .line 11
    .line 12
    array-length v3, p1

    .line 13
    if-gt v1, v3, :cond_4

    .line 14
    .line 15
    iget-object v2, p0, Ll/tqg0;->g:Ll/drg0;

    .line 16
    .line 17
    if-eqz v2, :cond_3

    .line 18
    .line 19
    if-nez p3, :cond_0

    .line 20
    .line 21
    return v0

    .line 22
    :cond_0
    move p3, p2

    .line 23
    :goto_0
    if-ge p3, v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/tqg0;->q()I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-ltz v0, :cond_1

    .line 30
    .line 31
    add-int/lit8 v2, p3, 0x1

    .line 32
    .line 33
    int-to-byte v0, v0

    .line 34
    aput-byte v0, p1, p3

    .line 35
    .line 36
    const/4 p3, 0x1

    .line 37
    invoke-virtual {p0, p3}, Ll/gjg0;->count(I)V

    .line 38
    .line 39
    .line 40
    move p3, v2

    .line 41
    goto :goto_0

    .line 42
    :cond_1
    if-ne p3, p2, :cond_2

    .line 43
    .line 44
    const/4 p0, -0x1

    .line 45
    return p0

    .line 46
    :cond_2
    sub-int/2addr p3, p2

    .line 47
    return p3

    .line 48
    :cond_3
    const-string p0, "Stream closed"

    .line 49
    .line 50
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    return v0

    .line 54
    :cond_4
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    .line 55
    .line 56
    array-length p1, p1

    .line 57
    new-instance v0, Ljava/lang/StringBuilder;

    .line 58
    .line 59
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    const-string p2, ") + len("

    .line 66
    .line 67
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    const-string p2, ") > dest.length("

    .line 74
    .line 75
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    const-string p1, ")."

    .line 82
    .line 83
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    throw p0

    .line 94
    :cond_5
    const-string p0, "len("

    .line 95
    .line 96
    invoke-static {p0, p3, v1}, Ll/bqg0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return v0

    .line 100
    :cond_6
    invoke-static {v2, p2, v1}, Ll/bqg0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 101
    .line 102
    .line 103
    return v0
.end method

.method public final t()I
    .locals 4

    .line 1
    iget v0, p0, Ll/tqg0;->o:I

    .line 2
    .line 3
    iget v1, p0, Ll/tqg0;->a:I

    .line 4
    .line 5
    if-gt v0, v1, :cond_0

    .line 6
    .line 7
    iget v0, p0, Ll/tqg0;->m:I

    .line 8
    .line 9
    iput v0, p0, Ll/tqg0;->n:I

    .line 10
    .line 11
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 12
    .line 13
    iget-object v1, v0, Ll/hjg0;->o:[B

    .line 14
    .line 15
    iget v2, p0, Ll/tqg0;->s:I

    .line 16
    .line 17
    aget-byte v1, v1, v2

    .line 18
    .line 19
    and-int/lit16 v1, v1, 0xff

    .line 20
    .line 21
    iput v1, p0, Ll/tqg0;->m:I

    .line 22
    .line 23
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 24
    .line 25
    array-length v0, v0

    .line 26
    const-string v3, "su_tPos"

    .line 27
    .line 28
    invoke-static {v2, v0, v3}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 32
    .line 33
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 34
    .line 35
    iget v2, p0, Ll/tqg0;->s:I

    .line 36
    .line 37
    aget v0, v0, v2

    .line 38
    .line 39
    iput v0, p0, Ll/tqg0;->s:I

    .line 40
    .line 41
    iget v0, p0, Ll/tqg0;->o:I

    .line 42
    .line 43
    add-int/lit8 v0, v0, 0x1

    .line 44
    .line 45
    iput v0, p0, Ll/tqg0;->o:I

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    iput v0, p0, Ll/tqg0;->h:I

    .line 49
    .line 50
    iget-object p0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ll/lng0;->a(I)V

    .line 53
    .line 54
    .line 55
    return v1

    .line 56
    :cond_0
    const/4 v0, 0x5

    .line 57
    iput v0, p0, Ll/tqg0;->h:I

    .line 58
    .line 59
    iget-object v0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 60
    .line 61
    iget v0, v0, Ll/lng0;->a:I

    .line 62
    .line 63
    not-int v0, v0

    .line 64
    iget v1, p0, Ll/tqg0;->i:I

    .line 65
    .line 66
    if-ne v1, v0, :cond_1

    .line 67
    .line 68
    iget v1, p0, Ll/tqg0;->k:I

    .line 69
    .line 70
    shl-int/lit8 v2, v1, 0x1

    .line 71
    .line 72
    ushr-int/lit8 v1, v1, 0x1f

    .line 73
    .line 74
    or-int/2addr v1, v2

    .line 75
    xor-int/2addr v0, v1

    .line 76
    iput v0, p0, Ll/tqg0;->k:I

    .line 77
    .line 78
    invoke-virtual {p0}, Ll/tqg0;->k()V

    .line 79
    .line 80
    .line 81
    invoke-virtual {p0}, Ll/tqg0;->n()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    return p0

    .line 86
    :cond_1
    iget v0, p0, Ll/tqg0;->j:I

    .line 87
    .line 88
    shl-int/lit8 v2, v0, 0x1

    .line 89
    .line 90
    ushr-int/lit8 v0, v0, 0x1f

    .line 91
    .line 92
    or-int/2addr v0, v2

    .line 93
    xor-int/2addr v0, v1

    .line 94
    iput v0, p0, Ll/tqg0;->k:I

    .line 95
    .line 96
    const-string p0, "BZip2 CRC error"

    .line 97
    .line 98
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 99
    .line 100
    .line 101
    const/4 p0, 0x0

    .line 102
    return p0
.end method

.method public final u()I
    .locals 5

    .line 1
    iget v0, p0, Ll/tqg0;->o:I

    .line 2
    .line 3
    iget v1, p0, Ll/tqg0;->a:I

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-gt v0, v1, :cond_3

    .line 7
    .line 8
    iget v0, p0, Ll/tqg0;->m:I

    .line 9
    .line 10
    iput v0, p0, Ll/tqg0;->n:I

    .line 11
    .line 12
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 13
    .line 14
    iget-object v1, v0, Ll/hjg0;->o:[B

    .line 15
    .line 16
    iget v3, p0, Ll/tqg0;->s:I

    .line 17
    .line 18
    aget-byte v1, v1, v3

    .line 19
    .line 20
    and-int/lit16 v1, v1, 0xff

    .line 21
    .line 22
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 23
    .line 24
    array-length v0, v0

    .line 25
    const-string v4, "su_tPos"

    .line 26
    .line 27
    invoke-static {v3, v0, v4}, Ll/tqg0;->m(IILjava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Ll/tqg0;->u:Ll/hjg0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/hjg0;->n:[I

    .line 33
    .line 34
    iget v3, p0, Ll/tqg0;->s:I

    .line 35
    .line 36
    aget v0, v0, v3

    .line 37
    .line 38
    iput v0, p0, Ll/tqg0;->s:I

    .line 39
    .line 40
    iget v0, p0, Ll/tqg0;->q:I

    .line 41
    .line 42
    const/4 v3, 0x1

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    iget v0, p0, Ll/tqg0;->r:I

    .line 46
    .line 47
    sget-object v4, Ll/otg0;->a:[I

    .line 48
    .line 49
    aget v4, v4, v0

    .line 50
    .line 51
    sub-int/2addr v4, v3

    .line 52
    iput v4, p0, Ll/tqg0;->q:I

    .line 53
    .line 54
    add-int/2addr v0, v3

    .line 55
    iput v0, p0, Ll/tqg0;->r:I

    .line 56
    .line 57
    const/16 v4, 0x200

    .line 58
    .line 59
    if-ne v0, v4, :cond_1

    .line 60
    .line 61
    iput v2, p0, Ll/tqg0;->r:I

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sub-int/2addr v0, v3

    .line 65
    iput v0, p0, Ll/tqg0;->q:I

    .line 66
    .line 67
    :cond_1
    :goto_0
    iget v0, p0, Ll/tqg0;->q:I

    .line 68
    .line 69
    if-ne v0, v3, :cond_2

    .line 70
    .line 71
    move v2, v3

    .line 72
    :cond_2
    xor-int v0, v1, v2

    .line 73
    .line 74
    iput v0, p0, Ll/tqg0;->m:I

    .line 75
    .line 76
    iget v1, p0, Ll/tqg0;->o:I

    .line 77
    .line 78
    add-int/2addr v1, v3

    .line 79
    iput v1, p0, Ll/tqg0;->o:I

    .line 80
    .line 81
    const/4 v1, 0x3

    .line 82
    iput v1, p0, Ll/tqg0;->h:I

    .line 83
    .line 84
    iget-object p0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 85
    .line 86
    invoke-virtual {p0, v0}, Ll/lng0;->a(I)V

    .line 87
    .line 88
    .line 89
    return v0

    .line 90
    :cond_3
    iget-object v0, p0, Ll/tqg0;->e:Ll/lng0;

    .line 91
    .line 92
    iget v0, v0, Ll/lng0;->a:I

    .line 93
    .line 94
    not-int v0, v0

    .line 95
    iget v1, p0, Ll/tqg0;->i:I

    .line 96
    .line 97
    if-ne v1, v0, :cond_4

    .line 98
    .line 99
    iget v1, p0, Ll/tqg0;->k:I

    .line 100
    .line 101
    shl-int/lit8 v2, v1, 0x1

    .line 102
    .line 103
    ushr-int/lit8 v1, v1, 0x1f

    .line 104
    .line 105
    or-int/2addr v1, v2

    .line 106
    xor-int/2addr v0, v1

    .line 107
    iput v0, p0, Ll/tqg0;->k:I

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/tqg0;->k()V

    .line 110
    .line 111
    .line 112
    invoke-virtual {p0}, Ll/tqg0;->n()I

    .line 113
    .line 114
    .line 115
    move-result p0

    .line 116
    return p0

    .line 117
    :cond_4
    iget v0, p0, Ll/tqg0;->j:I

    .line 118
    .line 119
    shl-int/lit8 v3, v0, 0x1

    .line 120
    .line 121
    ushr-int/lit8 v0, v0, 0x1f

    .line 122
    .line 123
    or-int/2addr v0, v3

    .line 124
    xor-int/2addr v0, v1

    .line 125
    iput v0, p0, Ll/tqg0;->k:I

    .line 126
    .line 127
    const-string p0, "BZip2 CRC error"

    .line 128
    .line 129
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    return v2
.end method
