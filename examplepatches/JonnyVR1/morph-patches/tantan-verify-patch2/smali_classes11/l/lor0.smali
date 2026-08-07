.class public abstract Ll/lor0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/snr0;

.field public b:Ll/sgr0;

.field public c:Ll/ser0;

.field public d:Ll/unr0;

.field public e:J

.field public f:J

.field public g:J

.field public h:I

.field public i:I

.field public j:Ll/ior0;

.field public k:J

.field public l:Z

.field public m:Z


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/snr0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/snr0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/lor0;->a:Ll/snr0;

    .line 10
    .line 11
    new-instance v0, Ll/ior0;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/ior0;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/lor0;->j:Ll/ior0;

    .line 17
    .line 18
    return-void
.end method


# virtual methods
.method public abstract a(Ll/bgw0;)J
.end method

.method public b(Z)V
    .locals 4

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    new-instance p1, Ll/ior0;

    .line 6
    .line 7
    invoke-direct {p1}, Ll/ior0;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Ll/lor0;->j:Ll/ior0;

    .line 11
    .line 12
    iput-wide v0, p0, Ll/lor0;->f:J

    .line 13
    .line 14
    const/4 p1, 0x0

    .line 15
    :goto_0
    iput p1, p0, Ll/lor0;->h:I

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const/4 p1, 0x1

    .line 19
    goto :goto_0

    .line 20
    :goto_1
    const-wide/16 v2, -0x1

    .line 21
    .line 22
    iput-wide v2, p0, Ll/lor0;->e:J

    .line 23
    .line 24
    iput-wide v0, p0, Ll/lor0;->g:J

    .line 25
    .line 26
    return-void
.end method

.method public abstract c(Ll/bgw0;JLl/ior0;)Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation runtime Lorg/checkerframework/checker/nullness/qual/EnsuresNonNullIf;
        expression = {
            "#3.format"
        }
        result = false
    .end annotation
.end method

.method public final d(Ll/qer0;Ll/yfr0;)I
    .locals 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    iget-object v2, v1, Ll/lor0;->b:Ll/sgr0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    sget v2, Ll/mpw0;->a:I

    .line 11
    .line 12
    iget v2, v1, Ll/lor0;->h:I

    .line 13
    .line 14
    const/4 v3, 0x3

    .line 15
    const-wide/16 v4, -0x1

    .line 16
    .line 17
    const/4 v6, -0x1

    .line 18
    const/4 v11, 0x2

    .line 19
    const/4 v12, 0x0

    .line 20
    const/4 v7, 0x1

    .line 21
    if-eqz v2, :cond_8

    .line 22
    .line 23
    if-eq v2, v7, :cond_7

    .line 24
    .line 25
    if-eq v2, v11, :cond_0

    .line 26
    .line 27
    return v6

    .line 28
    :cond_0
    iget-object v2, v1, Ll/lor0;->d:Ll/unr0;

    .line 29
    .line 30
    invoke-interface {v2, v0}, Ll/unr0;->b(Ll/qer0;)J

    .line 31
    .line 32
    .line 33
    move-result-wide v8

    .line 34
    const-wide/16 v10, 0x0

    .line 35
    .line 36
    cmp-long v2, v8, v10

    .line 37
    .line 38
    if-ltz v2, :cond_1

    .line 39
    .line 40
    move-object/from16 v2, p2

    .line 41
    .line 42
    iput-wide v8, v2, Ll/yfr0;->a:J

    .line 43
    .line 44
    return v7

    .line 45
    :cond_1
    cmp-long v2, v8, v4

    .line 46
    .line 47
    if-gez v2, :cond_2

    .line 48
    .line 49
    const-wide/16 v13, 0x2

    .line 50
    .line 51
    add-long/2addr v8, v13

    .line 52
    neg-long v8, v8

    .line 53
    invoke-virtual {v1, v8, v9}, Ll/lor0;->h(J)V

    .line 54
    .line 55
    .line 56
    :cond_2
    iget-boolean v2, v1, Ll/lor0;->l:Z

    .line 57
    .line 58
    if-nez v2, :cond_3

    .line 59
    .line 60
    iget-object v2, v1, Ll/lor0;->d:Ll/unr0;

    .line 61
    .line 62
    invoke-interface {v2}, Ll/unr0;->zze()Ll/bgr0;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-static {v2}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    iget-object v8, v1, Ll/lor0;->c:Ll/ser0;

    .line 70
    .line 71
    invoke-interface {v8, v2}, Ll/ser0;->j(Ll/bgr0;)V

    .line 72
    .line 73
    .line 74
    iput-boolean v7, v1, Ll/lor0;->l:Z

    .line 75
    .line 76
    :cond_3
    iget-wide v7, v1, Ll/lor0;->k:J

    .line 77
    .line 78
    cmp-long v2, v7, v10

    .line 79
    .line 80
    if-gtz v2, :cond_5

    .line 81
    .line 82
    iget-object v2, v1, Ll/lor0;->a:Ll/snr0;

    .line 83
    .line 84
    invoke-virtual {v2, v0}, Ll/snr0;->e(Ll/qer0;)Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-eqz v0, :cond_4

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_4
    iput v3, v1, Ll/lor0;->h:I

    .line 92
    .line 93
    return v6

    .line 94
    :cond_5
    :goto_0
    iput-wide v10, v1, Ll/lor0;->k:J

    .line 95
    .line 96
    iget-object v0, v1, Ll/lor0;->a:Ll/snr0;

    .line 97
    .line 98
    invoke-virtual {v0}, Ll/snr0;->a()Ll/bgw0;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    invoke-virtual {v1, v0}, Ll/lor0;->a(Ll/bgw0;)J

    .line 103
    .line 104
    .line 105
    move-result-wide v2

    .line 106
    cmp-long v6, v2, v10

    .line 107
    .line 108
    if-ltz v6, :cond_6

    .line 109
    .line 110
    iget-wide v6, v1, Ll/lor0;->g:J

    .line 111
    .line 112
    add-long v8, v6, v2

    .line 113
    .line 114
    iget-wide v10, v1, Ll/lor0;->e:J

    .line 115
    .line 116
    cmp-long v8, v8, v10

    .line 117
    .line 118
    if-ltz v8, :cond_6

    .line 119
    .line 120
    invoke-virtual {v1, v6, v7}, Ll/lor0;->e(J)J

    .line 121
    .line 122
    .line 123
    move-result-wide v14

    .line 124
    iget-object v6, v1, Ll/lor0;->b:Ll/sgr0;

    .line 125
    .line 126
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 127
    .line 128
    .line 129
    move-result v7

    .line 130
    invoke-static {v6, v0, v7}, Ll/fgr0;->b(Ll/sgr0;Ll/bgw0;I)V

    .line 131
    .line 132
    .line 133
    iget-object v13, v1, Ll/lor0;->b:Ll/sgr0;

    .line 134
    .line 135
    invoke-virtual {v0}, Ll/bgw0;->t()I

    .line 136
    .line 137
    .line 138
    move-result v17

    .line 139
    const/16 v18, 0x0

    .line 140
    .line 141
    const/16 v19, 0x0

    .line 142
    .line 143
    const/16 v16, 0x1

    .line 144
    .line 145
    invoke-interface/range {v13 .. v19}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 146
    .line 147
    .line 148
    iput-wide v4, v1, Ll/lor0;->e:J

    .line 149
    .line 150
    :cond_6
    iget-wide v4, v1, Ll/lor0;->g:J

    .line 151
    .line 152
    add-long/2addr v4, v2

    .line 153
    iput-wide v4, v1, Ll/lor0;->g:J

    .line 154
    .line 155
    return v12

    .line 156
    :cond_7
    iget-wide v2, v1, Ll/lor0;->f:J

    .line 157
    .line 158
    long-to-int v2, v2

    .line 159
    check-cast v0, Ll/fer0;

    .line 160
    .line 161
    invoke-virtual {v0, v2, v12}, Ll/fer0;->k(IZ)Z

    .line 162
    .line 163
    .line 164
    iput v11, v1, Ll/lor0;->h:I

    .line 165
    .line 166
    return v12

    .line 167
    :cond_8
    :goto_1
    iget-object v2, v1, Ll/lor0;->a:Ll/snr0;

    .line 168
    .line 169
    invoke-virtual {v2, v0}, Ll/snr0;->e(Ll/qer0;)Z

    .line 170
    .line 171
    .line 172
    move-result v2

    .line 173
    if-nez v2, :cond_9

    .line 174
    .line 175
    iput v3, v1, Ll/lor0;->h:I

    .line 176
    .line 177
    return v6

    .line 178
    :cond_9
    invoke-interface {v0}, Ll/qer0;->zzf()J

    .line 179
    .line 180
    .line 181
    move-result-wide v8

    .line 182
    iget-wide v13, v1, Ll/lor0;->f:J

    .line 183
    .line 184
    sub-long/2addr v8, v13

    .line 185
    iput-wide v8, v1, Ll/lor0;->k:J

    .line 186
    .line 187
    iget-object v2, v1, Ll/lor0;->a:Ll/snr0;

    .line 188
    .line 189
    invoke-virtual {v2}, Ll/snr0;->a()Ll/bgw0;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    iget-object v8, v1, Ll/lor0;->j:Ll/ior0;

    .line 194
    .line 195
    invoke-virtual {v1, v2, v13, v14, v8}, Ll/lor0;->c(Ll/bgw0;JLl/ior0;)Z

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    if-eqz v2, :cond_a

    .line 200
    .line 201
    invoke-interface {v0}, Ll/qer0;->zzf()J

    .line 202
    .line 203
    .line 204
    move-result-wide v8

    .line 205
    iput-wide v8, v1, Ll/lor0;->f:J

    .line 206
    .line 207
    goto :goto_1

    .line 208
    :cond_a
    iget-object v2, v1, Ll/lor0;->j:Ll/ior0;

    .line 209
    .line 210
    iget-object v2, v2, Ll/ior0;->a:Ll/sqr0;

    .line 211
    .line 212
    iget v3, v2, Ll/sqr0;->z:I

    .line 213
    .line 214
    iput v3, v1, Ll/lor0;->i:I

    .line 215
    .line 216
    iget-boolean v3, v1, Ll/lor0;->m:Z

    .line 217
    .line 218
    if-nez v3, :cond_b

    .line 219
    .line 220
    iget-object v3, v1, Ll/lor0;->b:Ll/sgr0;

    .line 221
    .line 222
    invoke-interface {v3, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 223
    .line 224
    .line 225
    iput-boolean v7, v1, Ll/lor0;->m:Z

    .line 226
    .line 227
    :cond_b
    iget-object v2, v1, Ll/lor0;->j:Ll/ior0;

    .line 228
    .line 229
    iget-object v2, v2, Ll/ior0;->b:Ll/unr0;

    .line 230
    .line 231
    if-eqz v2, :cond_c

    .line 232
    .line 233
    iput-object v2, v1, Ll/lor0;->d:Ll/unr0;

    .line 234
    .line 235
    goto :goto_3

    .line 236
    :cond_c
    invoke-interface {v0}, Ll/qer0;->zzd()J

    .line 237
    .line 238
    .line 239
    move-result-wide v2

    .line 240
    cmp-long v2, v2, v4

    .line 241
    .line 242
    if-nez v2, :cond_d

    .line 243
    .line 244
    new-instance v0, Ll/kor0;

    .line 245
    .line 246
    const/4 v2, 0x0

    .line 247
    invoke-direct {v0, v2}, Ll/kor0;-><init>(Ll/jor0;)V

    .line 248
    .line 249
    .line 250
    iput-object v0, v1, Ll/lor0;->d:Ll/unr0;

    .line 251
    .line 252
    goto :goto_3

    .line 253
    :cond_d
    iget-object v2, v1, Ll/lor0;->a:Ll/snr0;

    .line 254
    .line 255
    invoke-virtual {v2}, Ll/snr0;->b()Ll/tnr0;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    iget v3, v2, Ll/tnr0;->a:I

    .line 260
    .line 261
    and-int/lit8 v3, v3, 0x4

    .line 262
    .line 263
    if-eqz v3, :cond_e

    .line 264
    .line 265
    move v10, v7

    .line 266
    goto :goto_2

    .line 267
    :cond_e
    move v10, v12

    .line 268
    :goto_2
    new-instance v0, Ll/nnr0;

    .line 269
    .line 270
    iget-wide v3, v1, Ll/lor0;->f:J

    .line 271
    .line 272
    invoke-interface/range {p1 .. p1}, Ll/qer0;->zzd()J

    .line 273
    .line 274
    .line 275
    move-result-wide v5

    .line 276
    iget v7, v2, Ll/tnr0;->d:I

    .line 277
    .line 278
    iget v8, v2, Ll/tnr0;->e:I

    .line 279
    .line 280
    add-int/2addr v7, v8

    .line 281
    iget-wide v8, v2, Ll/tnr0;->b:J

    .line 282
    .line 283
    int-to-long v13, v7

    .line 284
    move-wide v2, v3

    .line 285
    move-wide v4, v5

    .line 286
    move-wide v6, v13

    .line 287
    invoke-direct/range {v0 .. v10}, Ll/nnr0;-><init>(Ll/lor0;JJJJZ)V

    .line 288
    .line 289
    .line 290
    iput-object v0, v1, Ll/lor0;->d:Ll/unr0;

    .line 291
    .line 292
    :goto_3
    iput v11, v1, Ll/lor0;->h:I

    .line 293
    .line 294
    iget-object v0, v1, Ll/lor0;->a:Ll/snr0;

    .line 295
    .line 296
    invoke-virtual {v0}, Ll/snr0;->d()V

    .line 297
    .line 298
    .line 299
    return v12
.end method

.method public final e(J)J
    .locals 4

    .line 1
    iget p0, p0, Ll/lor0;->i:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    const-wide/32 v2, 0xf4240

    .line 5
    .line 6
    .line 7
    mul-long/2addr p1, v2

    .line 8
    div-long/2addr p1, v0

    .line 9
    return-wide p1
.end method

.method public final f(J)J
    .locals 2

    .line 1
    iget p0, p0, Ll/lor0;->i:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    mul-long/2addr v0, p1

    .line 5
    const-wide/32 p0, 0xf4240

    .line 6
    .line 7
    .line 8
    div-long/2addr v0, p0

    .line 9
    return-wide v0
.end method

.method public final g(Ll/ser0;Ll/sgr0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/lor0;->c:Ll/ser0;

    .line 2
    .line 3
    iput-object p2, p0, Ll/lor0;->b:Ll/sgr0;

    .line 4
    .line 5
    const/4 p1, 0x1

    .line 6
    invoke-virtual {p0, p1}, Ll/lor0;->b(Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public h(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/lor0;->g:J

    .line 2
    .line 3
    return-void
.end method

.method public final i(JJ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/lor0;->a:Ll/snr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/snr0;->c()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    cmp-long p1, p1, v0

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    iget-boolean p1, p0, Ll/lor0;->l:Z

    .line 13
    .line 14
    xor-int/lit8 p1, p1, 0x1

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/lor0;->b(Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget p1, p0, Ll/lor0;->h:I

    .line 21
    .line 22
    if-eqz p1, :cond_1

    .line 23
    .line 24
    invoke-virtual {p0, p3, p4}, Ll/lor0;->f(J)J

    .line 25
    .line 26
    .line 27
    move-result-wide p1

    .line 28
    iput-wide p1, p0, Ll/lor0;->e:J

    .line 29
    .line 30
    iget-object p3, p0, Ll/lor0;->d:Ll/unr0;

    .line 31
    .line 32
    sget p4, Ll/mpw0;->a:I

    .line 33
    .line 34
    invoke-interface {p3, p1, p2}, Ll/unr0;->a(J)V

    .line 35
    .line 36
    .line 37
    const/4 p1, 0x2

    .line 38
    iput p1, p0, Ll/lor0;->h:I

    .line 39
    .line 40
    :cond_1
    return-void
.end method
