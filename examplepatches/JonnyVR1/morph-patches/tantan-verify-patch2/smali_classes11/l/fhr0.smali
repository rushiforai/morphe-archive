.class public final Ll/fhr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/per0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/ehr0;

.field public c:I

.field public d:Ll/ser0;

.field public e:Ll/ghr0;

.field public f:J

.field public g:[Ll/ihr0;

.field public h:J

.field public i:Ll/ihr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:I

.field public k:J

.field public l:J

.field public m:I

.field public n:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/bgw0;

    .line 5
    .line 6
    const/16 v1, 0xc

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ll/bgw0;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 12
    .line 13
    new-instance v0, Ll/ehr0;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    invoke-direct {v0, v1}, Ll/ehr0;-><init>(Ll/dhr0;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/fhr0;->b:Ll/ehr0;

    .line 20
    .line 21
    new-instance v0, Ll/ner0;

    .line 22
    .line 23
    invoke-direct {v0}, Ll/ner0;-><init>()V

    .line 24
    .line 25
    .line 26
    iput-object v0, p0, Ll/fhr0;->d:Ll/ser0;

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    new-array v0, v0, [Ll/ihr0;

    .line 30
    .line 31
    iput-object v0, p0, Ll/fhr0;->g:[Ll/ihr0;

    .line 32
    .line 33
    const-wide/16 v0, -0x1

    .line 34
    .line 35
    iput-wide v0, p0, Ll/fhr0;->k:J

    .line 36
    .line 37
    iput-wide v0, p0, Ll/fhr0;->l:J

    .line 38
    .line 39
    const/4 v0, -0x1

    .line 40
    iput v0, p0, Ll/fhr0;->j:I

    .line 41
    .line 42
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 43
    .line 44
    .line 45
    .line 46
    .line 47
    iput-wide v0, p0, Ll/fhr0;->f:J

    .line 48
    .line 49
    return-void
.end method

.method public static bridge synthetic a(Ll/fhr0;)[Ll/ihr0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fhr0;->g:[Ll/ihr0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final b(I)Ll/ihr0;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fhr0;->g:[Ll/ihr0;

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_1

    .line 6
    .line 7
    aget-object v2, p0, v1

    .line 8
    .line 9
    invoke-virtual {v2, p1}, Ll/ihr0;->g(I)Z

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_0

    .line 14
    .line 15
    return-object v2

    .line 16
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return-object p0
.end method

.method public final c(JJ)V
    .locals 3

    .line 1
    const-wide/16 p3, -0x1

    .line 2
    .line 3
    iput-wide p3, p0, Ll/fhr0;->h:J

    .line 4
    .line 5
    const/4 p3, 0x0

    .line 6
    iput-object p3, p0, Ll/fhr0;->i:Ll/ihr0;

    .line 7
    .line 8
    iget-object p3, p0, Ll/fhr0;->g:[Ll/ihr0;

    .line 9
    .line 10
    array-length p4, p3

    .line 11
    const/4 v0, 0x0

    .line 12
    move v1, v0

    .line 13
    :goto_0
    if-ge v1, p4, :cond_0

    .line 14
    .line 15
    aget-object v2, p3, v1

    .line 16
    .line 17
    invoke-virtual {v2, p1, p2}, Ll/ihr0;->f(J)V

    .line 18
    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-wide/16 p3, 0x0

    .line 24
    .line 25
    cmp-long p1, p1, p3

    .line 26
    .line 27
    if-nez p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/fhr0;->g:[Ll/ihr0;

    .line 30
    .line 31
    array-length p1, p1

    .line 32
    if-nez p1, :cond_1

    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_1
    const/4 v0, 0x3

    .line 36
    :goto_1
    iput v0, p0, Ll/fhr0;->c:I

    .line 37
    .line 38
    return-void

    .line 39
    :cond_2
    const/4 p1, 0x6

    .line 40
    iput p1, p0, Ll/fhr0;->c:I

    .line 41
    .line 42
    return-void
.end method

.method public final d(Ll/qer0;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast p1, Ll/fer0;

    .line 8
    .line 9
    const/16 v1, 0xc

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p1, v0, v2, v1, v2}, Ll/fer0;->c([BIIZ)Z

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 16
    .line 17
    invoke-virtual {p1, v2}, Ll/bgw0;->k(I)V

    .line 18
    .line 19
    .line 20
    iget-object p1, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 21
    .line 22
    invoke-virtual {p1}, Ll/bgw0;->x()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    const v0, 0x46464952

    .line 27
    .line 28
    .line 29
    if-eq p1, v0, :cond_0

    .line 30
    .line 31
    return v2

    .line 32
    :cond_0
    iget-object p1, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 33
    .line 34
    const/4 v0, 0x4

    .line 35
    invoke-virtual {p1, v0}, Ll/bgw0;->l(I)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/fhr0;->a:Ll/bgw0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/bgw0;->x()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    const p1, 0x20495641

    .line 45
    .line 46
    .line 47
    if-ne p0, p1, :cond_1

    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_1
    return v2
.end method

.method public final e(Ll/ser0;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/fhr0;->c:I

    .line 3
    .line 4
    iput-object p1, p0, Ll/fhr0;->d:Ll/ser0;

    .line 5
    .line 6
    const-wide/16 v0, -0x1

    .line 7
    .line 8
    iput-wide v0, p0, Ll/fhr0;->h:J

    .line 9
    .line 10
    return-void
.end method

.method public final f(Ll/qer0;Ll/yfr0;)I
    .locals 28
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-wide v2, v0, Ll/fhr0;->h:J

    .line 6
    .line 7
    const-wide/16 v4, -0x1

    .line 8
    .line 9
    cmp-long v6, v2, v4

    .line 10
    .line 11
    const/4 v7, 0x1

    .line 12
    const/4 v8, 0x0

    .line 13
    if-eqz v6, :cond_2

    .line 14
    .line 15
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 16
    .line 17
    .line 18
    move-result-wide v9

    .line 19
    cmp-long v6, v2, v9

    .line 20
    .line 21
    if-ltz v6, :cond_0

    .line 22
    .line 23
    const-wide/32 v11, 0x40000

    .line 24
    .line 25
    .line 26
    add-long/2addr v11, v9

    .line 27
    cmp-long v6, v2, v11

    .line 28
    .line 29
    if-lez v6, :cond_1

    .line 30
    .line 31
    :cond_0
    move-object/from16 v6, p2

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_1
    sub-long/2addr v2, v9

    .line 35
    move-object v6, v1

    .line 36
    check-cast v6, Ll/fer0;

    .line 37
    .line 38
    long-to-int v2, v2

    .line 39
    invoke-virtual {v6, v2, v8}, Ll/fer0;->k(IZ)Z

    .line 40
    .line 41
    .line 42
    :cond_2
    move v2, v8

    .line 43
    goto :goto_1

    .line 44
    :goto_0
    iput-wide v2, v6, Ll/yfr0;->a:J

    .line 45
    .line 46
    move v2, v7

    .line 47
    :goto_1
    iput-wide v4, v0, Ll/fhr0;->h:J

    .line 48
    .line 49
    if-eqz v2, :cond_3

    .line 50
    .line 51
    return v7

    .line 52
    :cond_3
    iget v2, v0, Ll/fhr0;->c:I

    .line 53
    .line 54
    const/16 v3, 0xc

    .line 55
    .line 56
    const/4 v6, 0x0

    .line 57
    if-eqz v2, :cond_2c

    .line 58
    .line 59
    const v9, 0x6c726468

    .line 60
    .line 61
    .line 62
    const v10, 0x5453494c

    .line 63
    .line 64
    .line 65
    const/4 v11, 0x2

    .line 66
    if-eq v2, v7, :cond_29

    .line 67
    .line 68
    const/4 v12, 0x3

    .line 69
    if-eq v2, v11, :cond_1d

    .line 70
    .line 71
    const/4 v9, 0x6

    .line 72
    const v11, 0x69766f6d

    .line 73
    .line 74
    .line 75
    const/4 v13, 0x4

    .line 76
    const-wide/16 v14, 0x0

    .line 77
    .line 78
    const-wide/16 v16, 0x8

    .line 79
    .line 80
    move-wide/from16 v18, v4

    .line 81
    .line 82
    const/16 v4, 0x10

    .line 83
    .line 84
    if-eq v2, v12, :cond_15

    .line 85
    .line 86
    const/4 v5, 0x5

    .line 87
    const/16 v12, 0x8

    .line 88
    .line 89
    if-eq v2, v13, :cond_13

    .line 90
    .line 91
    if-eq v2, v5, :cond_c

    .line 92
    .line 93
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 94
    .line 95
    .line 96
    move-result-wide v4

    .line 97
    iget-wide v13, v0, Ll/fhr0;->l:J

    .line 98
    .line 99
    cmp-long v2, v4, v13

    .line 100
    .line 101
    if-ltz v2, :cond_4

    .line 102
    .line 103
    const/4 v0, -0x1

    .line 104
    return v0

    .line 105
    :cond_4
    iget-object v2, v0, Ll/fhr0;->i:Ll/ihr0;

    .line 106
    .line 107
    if-eqz v2, :cond_6

    .line 108
    .line 109
    invoke-virtual {v2, v1}, Ll/ihr0;->h(Ll/qer0;)Z

    .line 110
    .line 111
    .line 112
    move-result v1

    .line 113
    if-nez v1, :cond_5

    .line 114
    .line 115
    return v8

    .line 116
    :cond_5
    iput-object v6, v0, Ll/fhr0;->i:Ll/ihr0;

    .line 117
    .line 118
    return v8

    .line 119
    :cond_6
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 120
    .line 121
    .line 122
    move-result-wide v4

    .line 123
    const-wide/16 v13, 0x1

    .line 124
    .line 125
    and-long/2addr v4, v13

    .line 126
    cmp-long v2, v4, v13

    .line 127
    .line 128
    if-nez v2, :cond_7

    .line 129
    .line 130
    move-object v2, v1

    .line 131
    check-cast v2, Ll/fer0;

    .line 132
    .line 133
    invoke-virtual {v2, v7, v8}, Ll/fer0;->k(IZ)Z

    .line 134
    .line 135
    .line 136
    :cond_7
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 137
    .line 138
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    move-object v4, v1

    .line 143
    check-cast v4, Ll/fer0;

    .line 144
    .line 145
    invoke-virtual {v4, v2, v8, v3, v8}, Ll/fer0;->c([BIIZ)Z

    .line 146
    .line 147
    .line 148
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 149
    .line 150
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 151
    .line 152
    .line 153
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 154
    .line 155
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 156
    .line 157
    .line 158
    move-result v2

    .line 159
    iget-object v5, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 160
    .line 161
    if-ne v2, v10, :cond_9

    .line 162
    .line 163
    invoke-virtual {v5, v12}, Ll/bgw0;->k(I)V

    .line 164
    .line 165
    .line 166
    iget-object v0, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 167
    .line 168
    invoke-virtual {v0}, Ll/bgw0;->x()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    if-ne v0, v11, :cond_8

    .line 173
    .line 174
    goto :goto_2

    .line 175
    :cond_8
    move v3, v12

    .line 176
    :goto_2
    invoke-virtual {v4, v3, v8}, Ll/fer0;->k(IZ)Z

    .line 177
    .line 178
    .line 179
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 180
    .line 181
    .line 182
    return v8

    .line 183
    :cond_9
    invoke-virtual {v5}, Ll/bgw0;->x()I

    .line 184
    .line 185
    .line 186
    move-result v3

    .line 187
    const v5, 0x4b4e554a    # 1.352225E7f

    .line 188
    .line 189
    .line 190
    if-ne v2, v5, :cond_a

    .line 191
    .line 192
    int-to-long v2, v3

    .line 193
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 194
    .line 195
    .line 196
    move-result-wide v4

    .line 197
    add-long/2addr v4, v2

    .line 198
    add-long v4, v4, v16

    .line 199
    .line 200
    iput-wide v4, v0, Ll/fhr0;->h:J

    .line 201
    .line 202
    return v8

    .line 203
    :cond_a
    invoke-virtual {v4, v12, v8}, Ll/fer0;->k(IZ)Z

    .line 204
    .line 205
    .line 206
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v0, v2}, Ll/fhr0;->b(I)Ll/ihr0;

    .line 210
    .line 211
    .line 212
    move-result-object v2

    .line 213
    if-nez v2, :cond_b

    .line 214
    .line 215
    int-to-long v2, v3

    .line 216
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 217
    .line 218
    .line 219
    move-result-wide v4

    .line 220
    add-long/2addr v4, v2

    .line 221
    iput-wide v4, v0, Ll/fhr0;->h:J

    .line 222
    .line 223
    return v8

    .line 224
    :cond_b
    invoke-virtual {v2, v3}, Ll/ihr0;->e(I)V

    .line 225
    .line 226
    .line 227
    iput-object v2, v0, Ll/fhr0;->i:Ll/ihr0;

    .line 228
    .line 229
    return v8

    .line 230
    :cond_c
    new-instance v2, Ll/bgw0;

    .line 231
    .line 232
    iget v3, v0, Ll/fhr0;->m:I

    .line 233
    .line 234
    invoke-direct {v2, v3}, Ll/bgw0;-><init>(I)V

    .line 235
    .line 236
    .line 237
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 238
    .line 239
    .line 240
    move-result-object v3

    .line 241
    iget v5, v0, Ll/fhr0;->m:I

    .line 242
    .line 243
    check-cast v1, Ll/fer0;

    .line 244
    .line 245
    invoke-virtual {v1, v3, v8, v5, v8}, Ll/fer0;->b([BIIZ)Z

    .line 246
    .line 247
    .line 248
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 249
    .line 250
    .line 251
    move-result v1

    .line 252
    if-ge v1, v4, :cond_d

    .line 253
    .line 254
    goto :goto_4

    .line 255
    :cond_d
    invoke-virtual {v2}, Ll/bgw0;->s()I

    .line 256
    .line 257
    .line 258
    move-result v1

    .line 259
    invoke-virtual {v2, v12}, Ll/bgw0;->l(I)V

    .line 260
    .line 261
    .line 262
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 263
    .line 264
    .line 265
    move-result v3

    .line 266
    int-to-long v5, v3

    .line 267
    iget-wide v10, v0, Ll/fhr0;->k:J

    .line 268
    .line 269
    cmp-long v3, v5, v10

    .line 270
    .line 271
    if-lez v3, :cond_e

    .line 272
    .line 273
    goto :goto_3

    .line 274
    :cond_e
    add-long v14, v10, v16

    .line 275
    .line 276
    :goto_3
    invoke-virtual {v2, v1}, Ll/bgw0;->k(I)V

    .line 277
    .line 278
    .line 279
    :cond_f
    :goto_4
    invoke-virtual {v2}, Ll/bgw0;->q()I

    .line 280
    .line 281
    .line 282
    move-result v1

    .line 283
    if-lt v1, v4, :cond_11

    .line 284
    .line 285
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 286
    .line 287
    .line 288
    move-result v1

    .line 289
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 290
    .line 291
    .line 292
    move-result v3

    .line 293
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 294
    .line 295
    .line 296
    move-result v5

    .line 297
    int-to-long v5, v5

    .line 298
    add-long/2addr v5, v14

    .line 299
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 300
    .line 301
    .line 302
    invoke-virtual {v0, v1}, Ll/fhr0;->b(I)Ll/ihr0;

    .line 303
    .line 304
    .line 305
    move-result-object v1

    .line 306
    if-eqz v1, :cond_f

    .line 307
    .line 308
    and-int/2addr v3, v4

    .line 309
    if-ne v3, v4, :cond_10

    .line 310
    .line 311
    invoke-virtual {v1, v5, v6}, Ll/ihr0;->b(J)V

    .line 312
    .line 313
    .line 314
    :cond_10
    invoke-virtual {v1}, Ll/ihr0;->d()V

    .line 315
    .line 316
    .line 317
    goto :goto_4

    .line 318
    :cond_11
    iget-object v1, v0, Ll/fhr0;->g:[Ll/ihr0;

    .line 319
    .line 320
    array-length v2, v1

    .line 321
    move v3, v8

    .line 322
    :goto_5
    if-ge v3, v2, :cond_12

    .line 323
    .line 324
    aget-object v4, v1, v3

    .line 325
    .line 326
    invoke-virtual {v4}, Ll/ihr0;->c()V

    .line 327
    .line 328
    .line 329
    add-int/lit8 v3, v3, 0x1

    .line 330
    .line 331
    goto :goto_5

    .line 332
    :cond_12
    iput-boolean v7, v0, Ll/fhr0;->n:Z

    .line 333
    .line 334
    iget-object v1, v0, Ll/fhr0;->d:Ll/ser0;

    .line 335
    .line 336
    new-instance v2, Ll/chr0;

    .line 337
    .line 338
    iget-wide v3, v0, Ll/fhr0;->f:J

    .line 339
    .line 340
    invoke-direct {v2, v0, v3, v4}, Ll/chr0;-><init>(Ll/fhr0;J)V

    .line 341
    .line 342
    .line 343
    invoke-interface {v1, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 344
    .line 345
    .line 346
    iput v9, v0, Ll/fhr0;->c:I

    .line 347
    .line 348
    iget-wide v1, v0, Ll/fhr0;->k:J

    .line 349
    .line 350
    iput-wide v1, v0, Ll/fhr0;->h:J

    .line 351
    .line 352
    return v8

    .line 353
    :cond_13
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 354
    .line 355
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 356
    .line 357
    .line 358
    move-result-object v2

    .line 359
    move-object v3, v1

    .line 360
    check-cast v3, Ll/fer0;

    .line 361
    .line 362
    invoke-virtual {v3, v2, v8, v12, v8}, Ll/fer0;->b([BIIZ)Z

    .line 363
    .line 364
    .line 365
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 366
    .line 367
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 368
    .line 369
    .line 370
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 371
    .line 372
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 373
    .line 374
    .line 375
    move-result v3

    .line 376
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 377
    .line 378
    .line 379
    move-result v2

    .line 380
    const v4, 0x31786469

    .line 381
    .line 382
    .line 383
    if-ne v3, v4, :cond_14

    .line 384
    .line 385
    iput v5, v0, Ll/fhr0;->c:I

    .line 386
    .line 387
    iput v2, v0, Ll/fhr0;->m:I

    .line 388
    .line 389
    goto :goto_6

    .line 390
    :cond_14
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 391
    .line 392
    .line 393
    move-result-wide v3

    .line 394
    int-to-long v1, v2

    .line 395
    add-long/2addr v3, v1

    .line 396
    iput-wide v3, v0, Ll/fhr0;->h:J

    .line 397
    .line 398
    :goto_6
    return v8

    .line 399
    :cond_15
    iget-wide v5, v0, Ll/fhr0;->k:J

    .line 400
    .line 401
    cmp-long v2, v5, v18

    .line 402
    .line 403
    if-eqz v2, :cond_17

    .line 404
    .line 405
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 406
    .line 407
    .line 408
    move-result-wide v18

    .line 409
    cmp-long v2, v18, v5

    .line 410
    .line 411
    if-nez v2, :cond_16

    .line 412
    .line 413
    goto :goto_7

    .line 414
    :cond_16
    iput-wide v5, v0, Ll/fhr0;->h:J

    .line 415
    .line 416
    return v8

    .line 417
    :cond_17
    :goto_7
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 418
    .line 419
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 420
    .line 421
    .line 422
    move-result-object v2

    .line 423
    move-object v5, v1

    .line 424
    check-cast v5, Ll/fer0;

    .line 425
    .line 426
    invoke-virtual {v5, v2, v8, v3, v8}, Ll/fer0;->c([BIIZ)Z

    .line 427
    .line 428
    .line 429
    invoke-interface {v1}, Ll/qer0;->zzj()V

    .line 430
    .line 431
    .line 432
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 433
    .line 434
    invoke-virtual {v2, v8}, Ll/bgw0;->k(I)V

    .line 435
    .line 436
    .line 437
    iget-object v2, v0, Ll/fhr0;->b:Ll/ehr0;

    .line 438
    .line 439
    iget-object v5, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 440
    .line 441
    invoke-virtual {v2, v5}, Ll/ehr0;->a(Ll/bgw0;)V

    .line 442
    .line 443
    .line 444
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 445
    .line 446
    iget-object v5, v0, Ll/fhr0;->b:Ll/ehr0;

    .line 447
    .line 448
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 449
    .line 450
    .line 451
    move-result v2

    .line 452
    iget v6, v5, Ll/ehr0;->a:I

    .line 453
    .line 454
    const v12, 0x46464952

    .line 455
    .line 456
    .line 457
    if-ne v6, v12, :cond_18

    .line 458
    .line 459
    move-object v0, v1

    .line 460
    check-cast v0, Ll/fer0;

    .line 461
    .line 462
    invoke-virtual {v0, v3, v8}, Ll/fer0;->k(IZ)Z

    .line 463
    .line 464
    .line 465
    return v8

    .line 466
    :cond_18
    if-ne v6, v10, :cond_1c

    .line 467
    .line 468
    if-eq v2, v11, :cond_19

    .line 469
    .line 470
    goto :goto_9

    .line 471
    :cond_19
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 472
    .line 473
    .line 474
    move-result-wide v2

    .line 475
    iput-wide v2, v0, Ll/fhr0;->k:J

    .line 476
    .line 477
    iget v5, v5, Ll/ehr0;->b:I

    .line 478
    .line 479
    int-to-long v5, v5

    .line 480
    add-long/2addr v2, v5

    .line 481
    add-long v2, v2, v16

    .line 482
    .line 483
    iput-wide v2, v0, Ll/fhr0;->l:J

    .line 484
    .line 485
    iget-boolean v5, v0, Ll/fhr0;->n:Z

    .line 486
    .line 487
    if-nez v5, :cond_1b

    .line 488
    .line 489
    iget-object v5, v0, Ll/fhr0;->e:Ll/ghr0;

    .line 490
    .line 491
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 492
    .line 493
    .line 494
    iget v5, v5, Ll/ghr0;->b:I

    .line 495
    .line 496
    and-int/2addr v5, v4

    .line 497
    if-eq v5, v4, :cond_1a

    .line 498
    .line 499
    iget-object v2, v0, Ll/fhr0;->d:Ll/ser0;

    .line 500
    .line 501
    new-instance v3, Ll/agr0;

    .line 502
    .line 503
    iget-wide v4, v0, Ll/fhr0;->f:J

    .line 504
    .line 505
    invoke-direct {v3, v4, v5, v14, v15}, Ll/agr0;-><init>(JJ)V

    .line 506
    .line 507
    .line 508
    invoke-interface {v2, v3}, Ll/ser0;->j(Ll/bgr0;)V

    .line 509
    .line 510
    .line 511
    iput-boolean v7, v0, Ll/fhr0;->n:Z

    .line 512
    .line 513
    goto :goto_8

    .line 514
    :cond_1a
    iput v13, v0, Ll/fhr0;->c:I

    .line 515
    .line 516
    iput-wide v2, v0, Ll/fhr0;->h:J

    .line 517
    .line 518
    return v8

    .line 519
    :cond_1b
    :goto_8
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 520
    .line 521
    .line 522
    move-result-wide v1

    .line 523
    const-wide/16 v3, 0xc

    .line 524
    .line 525
    add-long/2addr v1, v3

    .line 526
    iput-wide v1, v0, Ll/fhr0;->h:J

    .line 527
    .line 528
    iput v9, v0, Ll/fhr0;->c:I

    .line 529
    .line 530
    return v8

    .line 531
    :cond_1c
    :goto_9
    invoke-interface {v1}, Ll/qer0;->zzf()J

    .line 532
    .line 533
    .line 534
    move-result-wide v1

    .line 535
    iget v3, v5, Ll/ehr0;->b:I

    .line 536
    .line 537
    int-to-long v3, v3

    .line 538
    add-long/2addr v1, v3

    .line 539
    add-long v1, v1, v16

    .line 540
    .line 541
    iput-wide v1, v0, Ll/fhr0;->h:J

    .line 542
    .line 543
    return v8

    .line 544
    :cond_1d
    iget v2, v0, Ll/fhr0;->j:I

    .line 545
    .line 546
    add-int/lit8 v2, v2, -0x4

    .line 547
    .line 548
    new-instance v3, Ll/bgw0;

    .line 549
    .line 550
    invoke-direct {v3, v2}, Ll/bgw0;-><init>(I)V

    .line 551
    .line 552
    .line 553
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 554
    .line 555
    .line 556
    move-result-object v4

    .line 557
    check-cast v1, Ll/fer0;

    .line 558
    .line 559
    invoke-virtual {v1, v4, v8, v2, v8}, Ll/fer0;->b([BIIZ)Z

    .line 560
    .line 561
    .line 562
    invoke-static {v9, v3}, Ll/jhr0;->b(ILl/bgw0;)Ll/jhr0;

    .line 563
    .line 564
    .line 565
    move-result-object v1

    .line 566
    invoke-virtual {v1}, Ll/jhr0;->zza()I

    .line 567
    .line 568
    .line 569
    move-result v2

    .line 570
    if-ne v2, v9, :cond_28

    .line 571
    .line 572
    const-class v2, Ll/ghr0;

    .line 573
    .line 574
    invoke-virtual {v1, v2}, Ll/jhr0;->a(Ljava/lang/Class;)Ll/bhr0;

    .line 575
    .line 576
    .line 577
    move-result-object v2

    .line 578
    check-cast v2, Ll/ghr0;

    .line 579
    .line 580
    if-eqz v2, :cond_27

    .line 581
    .line 582
    iput-object v2, v0, Ll/fhr0;->e:Ll/ghr0;

    .line 583
    .line 584
    iget v3, v2, Ll/ghr0;->a:I

    .line 585
    .line 586
    iget v2, v2, Ll/ghr0;->c:I

    .line 587
    .line 588
    int-to-long v4, v2

    .line 589
    int-to-long v2, v3

    .line 590
    mul-long/2addr v4, v2

    .line 591
    iput-wide v4, v0, Ll/fhr0;->f:J

    .line 592
    .line 593
    new-instance v2, Ljava/util/ArrayList;

    .line 594
    .line 595
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 596
    .line 597
    .line 598
    iget-object v1, v1, Ll/jhr0;->a:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 599
    .line 600
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 601
    .line 602
    .line 603
    move-result v3

    .line 604
    move v4, v8

    .line 605
    move v14, v4

    .line 606
    :goto_a
    if-ge v4, v3, :cond_26

    .line 607
    .line 608
    invoke-interface {v1, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 609
    .line 610
    .line 611
    move-result-object v5

    .line 612
    check-cast v5, Ll/bhr0;

    .line 613
    .line 614
    invoke-interface {v5}, Ll/bhr0;->zza()I

    .line 615
    .line 616
    .line 617
    move-result v9

    .line 618
    const v10, 0x6c727473

    .line 619
    .line 620
    .line 621
    if-ne v9, v10, :cond_25

    .line 622
    .line 623
    check-cast v5, Ll/jhr0;

    .line 624
    .line 625
    add-int/lit8 v9, v14, 0x1

    .line 626
    .line 627
    const-class v10, Ll/hhr0;

    .line 628
    .line 629
    invoke-virtual {v5, v10}, Ll/jhr0;->a(Ljava/lang/Class;)Ll/bhr0;

    .line 630
    .line 631
    .line 632
    move-result-object v10

    .line 633
    check-cast v10, Ll/hhr0;

    .line 634
    .line 635
    const-class v13, Ll/khr0;

    .line 636
    .line 637
    invoke-virtual {v5, v13}, Ll/jhr0;->a(Ljava/lang/Class;)Ll/bhr0;

    .line 638
    .line 639
    .line 640
    move-result-object v13

    .line 641
    check-cast v13, Ll/khr0;

    .line 642
    .line 643
    const-string v15, "AviExtractor"

    .line 644
    .line 645
    if-nez v10, :cond_1e

    .line 646
    .line 647
    const-string v5, "Missing Stream Header"

    .line 648
    .line 649
    invoke-static {v15, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 650
    .line 651
    .line 652
    :goto_b
    move-object v13, v6

    .line 653
    move/from16 p1, v9

    .line 654
    .line 655
    goto/16 :goto_d

    .line 656
    .line 657
    :cond_1e
    if-nez v13, :cond_1f

    .line 658
    .line 659
    const-string v5, "Missing Stream Format"

    .line 660
    .line 661
    invoke-static {v15, v5}, Ll/y4w0;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 662
    .line 663
    .line 664
    goto :goto_b

    .line 665
    :cond_1f
    iget v15, v10, Ll/hhr0;->d:I

    .line 666
    .line 667
    iget v6, v10, Ll/hhr0;->b:I

    .line 668
    .line 669
    iget v12, v10, Ll/hhr0;->c:I

    .line 670
    .line 671
    move/from16 p1, v9

    .line 672
    .line 673
    int-to-long v8, v6

    .line 674
    int-to-long v11, v12

    .line 675
    sget-object v27, Ljava/math/RoundingMode;->FLOOR:Ljava/math/RoundingMode;

    .line 676
    .line 677
    int-to-long v6, v15

    .line 678
    const-wide/32 v17, 0xf4240

    .line 679
    .line 680
    .line 681
    mul-long v23, v8, v17

    .line 682
    .line 683
    move-wide/from16 v21, v6

    .line 684
    .line 685
    move-wide/from16 v25, v11

    .line 686
    .line 687
    invoke-static/range {v21 .. v27}, Ll/mpw0;->H(JJJLjava/math/RoundingMode;)J

    .line 688
    .line 689
    .line 690
    move-result-wide v7

    .line 691
    iget-object v6, v13, Ll/khr0;->a:Ll/sqr0;

    .line 692
    .line 693
    invoke-virtual {v6}, Ll/sqr0;->b()Ll/znr0;

    .line 694
    .line 695
    .line 696
    move-result-object v9

    .line 697
    invoke-virtual {v9, v14}, Ll/znr0;->j(I)Ll/znr0;

    .line 698
    .line 699
    .line 700
    iget v11, v10, Ll/hhr0;->e:I

    .line 701
    .line 702
    if-eqz v11, :cond_20

    .line 703
    .line 704
    invoke-virtual {v9, v11}, Ll/znr0;->o(I)Ll/znr0;

    .line 705
    .line 706
    .line 707
    :cond_20
    const-class v11, Ll/lhr0;

    .line 708
    .line 709
    invoke-virtual {v5, v11}, Ll/jhr0;->a(Ljava/lang/Class;)Ll/bhr0;

    .line 710
    .line 711
    .line 712
    move-result-object v5

    .line 713
    check-cast v5, Ll/lhr0;

    .line 714
    .line 715
    if-eqz v5, :cond_21

    .line 716
    .line 717
    iget-object v5, v5, Ll/lhr0;->a:Ljava/lang/String;

    .line 718
    .line 719
    invoke-virtual {v9, v5}, Ll/znr0;->m(Ljava/lang/String;)Ll/znr0;

    .line 720
    .line 721
    .line 722
    :cond_21
    iget-object v5, v6, Ll/sqr0;->l:Ljava/lang/String;

    .line 723
    .line 724
    invoke-static {v5}, Ll/a8t0;->b(Ljava/lang/String;)I

    .line 725
    .line 726
    .line 727
    move-result v5

    .line 728
    const/4 v6, 0x1

    .line 729
    if-eq v5, v6, :cond_23

    .line 730
    .line 731
    const/4 v6, 0x2

    .line 732
    if-ne v5, v6, :cond_22

    .line 733
    .line 734
    const/4 v15, 0x2

    .line 735
    goto :goto_c

    .line 736
    :cond_22
    const/4 v13, 0x0

    .line 737
    goto :goto_d

    .line 738
    :cond_23
    move v15, v5

    .line 739
    :goto_c
    iget-object v5, v0, Ll/fhr0;->d:Ll/ser0;

    .line 740
    .line 741
    invoke-interface {v5, v14, v15}, Ll/ser0;->i(II)Ll/sgr0;

    .line 742
    .line 743
    .line 744
    move-result-object v5

    .line 745
    invoke-virtual {v9}, Ll/znr0;->D()Ll/sqr0;

    .line 746
    .line 747
    .line 748
    move-result-object v9

    .line 749
    invoke-interface {v5, v9}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 750
    .line 751
    .line 752
    iget v9, v10, Ll/hhr0;->d:I

    .line 753
    .line 754
    new-instance v13, Ll/ihr0;

    .line 755
    .line 756
    move-object/from16 v19, v5

    .line 757
    .line 758
    move-wide/from16 v16, v7

    .line 759
    .line 760
    move/from16 v18, v9

    .line 761
    .line 762
    invoke-direct/range {v13 .. v19}, Ll/ihr0;-><init>(IIJILl/sgr0;)V

    .line 763
    .line 764
    .line 765
    iput-wide v7, v0, Ll/fhr0;->f:J

    .line 766
    .line 767
    :goto_d
    if-eqz v13, :cond_24

    .line 768
    .line 769
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 770
    .line 771
    .line 772
    :cond_24
    move/from16 v14, p1

    .line 773
    .line 774
    :cond_25
    add-int/lit8 v4, v4, 0x1

    .line 775
    .line 776
    const/4 v6, 0x0

    .line 777
    const/4 v7, 0x1

    .line 778
    const/4 v8, 0x0

    .line 779
    const/4 v11, 0x2

    .line 780
    const/4 v12, 0x3

    .line 781
    goto/16 :goto_a

    .line 782
    .line 783
    :cond_26
    move v4, v8

    .line 784
    new-array v1, v4, [Ll/ihr0;

    .line 785
    .line 786
    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 787
    .line 788
    .line 789
    move-result-object v1

    .line 790
    check-cast v1, [Ll/ihr0;

    .line 791
    .line 792
    iput-object v1, v0, Ll/fhr0;->g:[Ll/ihr0;

    .line 793
    .line 794
    iget-object v1, v0, Ll/fhr0;->d:Ll/ser0;

    .line 795
    .line 796
    invoke-interface {v1}, Ll/ser0;->c()V

    .line 797
    .line 798
    .line 799
    const/4 v1, 0x3

    .line 800
    iput v1, v0, Ll/fhr0;->c:I

    .line 801
    .line 802
    return v4

    .line 803
    :cond_27
    const-string v0, "AviHeader not found"

    .line 804
    .line 805
    const/4 v2, 0x0

    .line 806
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 807
    .line 808
    .line 809
    move-result-object v0

    .line 810
    throw v0

    .line 811
    :cond_28
    move-object v2, v6

    .line 812
    invoke-virtual {v1}, Ll/jhr0;->zza()I

    .line 813
    .line 814
    .line 815
    move-result v0

    .line 816
    new-instance v1, Ljava/lang/StringBuilder;

    .line 817
    .line 818
    const-string v3, "Unexpected header list type "

    .line 819
    .line 820
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 821
    .line 822
    .line 823
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 824
    .line 825
    .line 826
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 827
    .line 828
    .line 829
    move-result-object v0

    .line 830
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 831
    .line 832
    .line 833
    move-result-object v0

    .line 834
    throw v0

    .line 835
    :cond_29
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 836
    .line 837
    invoke-virtual {v2}, Ll/bgw0;->m()[B

    .line 838
    .line 839
    .line 840
    move-result-object v2

    .line 841
    check-cast v1, Ll/fer0;

    .line 842
    .line 843
    const/4 v4, 0x0

    .line 844
    invoke-virtual {v1, v2, v4, v3, v4}, Ll/fer0;->b([BIIZ)Z

    .line 845
    .line 846
    .line 847
    iget-object v1, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 848
    .line 849
    invoke-virtual {v1, v4}, Ll/bgw0;->k(I)V

    .line 850
    .line 851
    .line 852
    iget-object v1, v0, Ll/fhr0;->b:Ll/ehr0;

    .line 853
    .line 854
    iget-object v2, v0, Ll/fhr0;->a:Ll/bgw0;

    .line 855
    .line 856
    invoke-virtual {v1, v2}, Ll/ehr0;->a(Ll/bgw0;)V

    .line 857
    .line 858
    .line 859
    iget v3, v1, Ll/ehr0;->a:I

    .line 860
    .line 861
    if-ne v3, v10, :cond_2b

    .line 862
    .line 863
    invoke-virtual {v2}, Ll/bgw0;->x()I

    .line 864
    .line 865
    .line 866
    move-result v2

    .line 867
    iput v2, v1, Ll/ehr0;->c:I

    .line 868
    .line 869
    iget-object v1, v0, Ll/fhr0;->b:Ll/ehr0;

    .line 870
    .line 871
    iget v2, v1, Ll/ehr0;->c:I

    .line 872
    .line 873
    if-ne v2, v9, :cond_2a

    .line 874
    .line 875
    iget v1, v1, Ll/ehr0;->b:I

    .line 876
    .line 877
    iput v1, v0, Ll/fhr0;->j:I

    .line 878
    .line 879
    const/4 v6, 0x2

    .line 880
    iput v6, v0, Ll/fhr0;->c:I

    .line 881
    .line 882
    const/16 v20, 0x0

    .line 883
    .line 884
    return v20

    .line 885
    :cond_2a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 886
    .line 887
    const-string v1, "hdrl expected, found: "

    .line 888
    .line 889
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 890
    .line 891
    .line 892
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 893
    .line 894
    .line 895
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 896
    .line 897
    .line 898
    move-result-object v0

    .line 899
    const/4 v2, 0x0

    .line 900
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 901
    .line 902
    .line 903
    move-result-object v0

    .line 904
    throw v0

    .line 905
    :cond_2b
    const/4 v2, 0x0

    .line 906
    new-instance v0, Ljava/lang/StringBuilder;

    .line 907
    .line 908
    const-string v1, "LIST expected, found: "

    .line 909
    .line 910
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 911
    .line 912
    .line 913
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 914
    .line 915
    .line 916
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 917
    .line 918
    .line 919
    move-result-object v0

    .line 920
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 921
    .line 922
    .line 923
    move-result-object v0

    .line 924
    throw v0

    .line 925
    :cond_2c
    move-object v2, v6

    .line 926
    invoke-virtual/range {p0 .. p1}, Ll/fhr0;->d(Ll/qer0;)Z

    .line 927
    .line 928
    .line 929
    move-result v4

    .line 930
    if-eqz v4, :cond_2d

    .line 931
    .line 932
    check-cast v1, Ll/fer0;

    .line 933
    .line 934
    const/4 v4, 0x0

    .line 935
    invoke-virtual {v1, v3, v4}, Ll/fer0;->k(IZ)Z

    .line 936
    .line 937
    .line 938
    const/4 v6, 0x1

    .line 939
    iput v6, v0, Ll/fhr0;->c:I

    .line 940
    .line 941
    return v4

    .line 942
    :cond_2d
    const-string v0, "AVI Header List not found"

    .line 943
    .line 944
    invoke-static {v0, v2}, Lcom/google/android/gms/internal/ads/zzcc;->zza(Ljava/lang/String;Ljava/lang/Throwable;)Lcom/google/android/gms/internal/ads/zzcc;

    .line 945
    .line 946
    .line 947
    move-result-object v0

    .line 948
    throw v0
.end method
