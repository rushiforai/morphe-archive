.class public final Ll/rty0;
.super Ll/fuu0;
.source "SourceFile"


# instance fields
.field public i:I

.field public j:Z

.field public k:[B

.field public l:[B

.field public m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:J


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/fuu0;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Ll/mpw0;->f:[B

    .line 5
    .line 6
    iput-object v0, p0, Ll/rty0;->k:[B

    .line 7
    .line 8
    iput-object v0, p0, Ll/rty0;->l:[B

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final a(Ljava/nio/ByteBuffer;)V
    .locals 8

    .line 1
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->hasRemaining()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_a

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/fuu0;->h()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_a

    .line 12
    .line 13
    iget v0, p0, Ll/rty0;->m:I

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    if-eqz v0, :cond_5

    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    if-eq v0, v1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-virtual {p0, p1}, Ll/rty0;->l(Ljava/nio/ByteBuffer;)I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 30
    .line 31
    .line 32
    iget-wide v3, p0, Ll/rty0;->q:J

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 35
    .line 36
    .line 37
    move-result v5

    .line 38
    iget v6, p0, Ll/rty0;->i:I

    .line 39
    .line 40
    div-int/2addr v5, v6

    .line 41
    int-to-long v5, v5

    .line 42
    add-long/2addr v3, v5

    .line 43
    iput-wide v3, p0, Ll/rty0;->q:J

    .line 44
    .line 45
    iget-object v3, p0, Ll/rty0;->l:[B

    .line 46
    .line 47
    iget v4, p0, Ll/rty0;->o:I

    .line 48
    .line 49
    invoke-virtual {p0, p1, v3, v4}, Ll/rty0;->n(Ljava/nio/ByteBuffer;[BI)V

    .line 50
    .line 51
    .line 52
    if-ge v1, v0, :cond_0

    .line 53
    .line 54
    iget-object v1, p0, Ll/rty0;->l:[B

    .line 55
    .line 56
    iget v3, p0, Ll/rty0;->o:I

    .line 57
    .line 58
    invoke-virtual {p0, v1, v3}, Ll/rty0;->m([BI)V

    .line 59
    .line 60
    .line 61
    iput v2, p0, Ll/rty0;->m:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    invoke-virtual {p0, p1}, Ll/rty0;->l(Ljava/nio/ByteBuffer;)I

    .line 72
    .line 73
    .line 74
    move-result v1

    .line 75
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 76
    .line 77
    .line 78
    move-result v3

    .line 79
    sub-int v3, v1, v3

    .line 80
    .line 81
    iget-object v4, p0, Ll/rty0;->k:[B

    .line 82
    .line 83
    array-length v5, v4

    .line 84
    iget v6, p0, Ll/rty0;->n:I

    .line 85
    .line 86
    sub-int/2addr v5, v6

    .line 87
    if-ge v1, v0, :cond_2

    .line 88
    .line 89
    if-ge v3, v5, :cond_2

    .line 90
    .line 91
    invoke-virtual {p0, v4, v6}, Ll/rty0;->m([BI)V

    .line 92
    .line 93
    .line 94
    iput v2, p0, Ll/rty0;->n:I

    .line 95
    .line 96
    iput v2, p0, Ll/rty0;->m:I

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_2
    invoke-static {v3, v5}, Ljava/lang/Math;->min(II)I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    add-int/2addr v3, v1

    .line 108
    invoke-virtual {p1, v3}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 109
    .line 110
    .line 111
    iget-object v3, p0, Ll/rty0;->k:[B

    .line 112
    .line 113
    iget v4, p0, Ll/rty0;->n:I

    .line 114
    .line 115
    invoke-virtual {p1, v3, v4, v1}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 116
    .line 117
    .line 118
    iget v3, p0, Ll/rty0;->n:I

    .line 119
    .line 120
    add-int/2addr v3, v1

    .line 121
    iput v3, p0, Ll/rty0;->n:I

    .line 122
    .line 123
    iget-object v1, p0, Ll/rty0;->k:[B

    .line 124
    .line 125
    array-length v4, v1

    .line 126
    if-ne v3, v4, :cond_4

    .line 127
    .line 128
    iget-boolean v4, p0, Ll/rty0;->p:Z

    .line 129
    .line 130
    if-eqz v4, :cond_3

    .line 131
    .line 132
    iget v3, p0, Ll/rty0;->o:I

    .line 133
    .line 134
    invoke-virtual {p0, v1, v3}, Ll/rty0;->m([BI)V

    .line 135
    .line 136
    .line 137
    iget-wide v3, p0, Ll/rty0;->q:J

    .line 138
    .line 139
    iget v1, p0, Ll/rty0;->n:I

    .line 140
    .line 141
    iget v5, p0, Ll/rty0;->o:I

    .line 142
    .line 143
    add-int/2addr v5, v5

    .line 144
    sub-int v5, v1, v5

    .line 145
    .line 146
    iget v6, p0, Ll/rty0;->i:I

    .line 147
    .line 148
    div-int/2addr v5, v6

    .line 149
    int-to-long v5, v5

    .line 150
    add-long/2addr v3, v5

    .line 151
    iput-wide v3, p0, Ll/rty0;->q:J

    .line 152
    .line 153
    move v3, v1

    .line 154
    goto :goto_1

    .line 155
    :cond_3
    iget-wide v4, p0, Ll/rty0;->q:J

    .line 156
    .line 157
    iget v1, p0, Ll/rty0;->o:I

    .line 158
    .line 159
    sub-int v1, v3, v1

    .line 160
    .line 161
    iget v6, p0, Ll/rty0;->i:I

    .line 162
    .line 163
    div-int/2addr v1, v6

    .line 164
    int-to-long v6, v1

    .line 165
    add-long/2addr v4, v6

    .line 166
    iput-wide v4, p0, Ll/rty0;->q:J

    .line 167
    .line 168
    :goto_1
    iget-object v1, p0, Ll/rty0;->k:[B

    .line 169
    .line 170
    invoke-virtual {p0, p1, v1, v3}, Ll/rty0;->n(Ljava/nio/ByteBuffer;[BI)V

    .line 171
    .line 172
    .line 173
    iput v2, p0, Ll/rty0;->n:I

    .line 174
    .line 175
    const/4 v1, 0x2

    .line 176
    iput v1, p0, Ll/rty0;->m:I

    .line 177
    .line 178
    :cond_4
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 179
    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :cond_5
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    iget-object v3, p0, Ll/rty0;->k:[B

    .line 192
    .line 193
    array-length v3, v3

    .line 194
    add-int/2addr v2, v3

    .line 195
    invoke-static {v0, v2}, Ljava/lang/Math;->min(II)I

    .line 196
    .line 197
    .line 198
    move-result v2

    .line 199
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 200
    .line 201
    .line 202
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    :cond_6
    add-int/lit8 v2, v2, -0x2

    .line 207
    .line 208
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 209
    .line 210
    .line 211
    move-result v3

    .line 212
    if-lt v2, v3, :cond_7

    .line 213
    .line 214
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 215
    .line 216
    .line 217
    move-result v3

    .line 218
    invoke-static {v3}, Ljava/lang/Math;->abs(I)I

    .line 219
    .line 220
    .line 221
    move-result v3

    .line 222
    const/16 v4, 0x400

    .line 223
    .line 224
    if-le v3, v4, :cond_6

    .line 225
    .line 226
    iget v3, p0, Ll/rty0;->i:I

    .line 227
    .line 228
    div-int/2addr v2, v3

    .line 229
    mul-int/2addr v2, v3

    .line 230
    add-int/2addr v2, v3

    .line 231
    goto :goto_2

    .line 232
    :cond_7
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 233
    .line 234
    .line 235
    move-result v2

    .line 236
    :goto_2
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 237
    .line 238
    .line 239
    move-result v3

    .line 240
    if-ne v2, v3, :cond_8

    .line 241
    .line 242
    iput v1, p0, Ll/rty0;->m:I

    .line 243
    .line 244
    goto :goto_3

    .line 245
    :cond_8
    invoke-virtual {p1, v2}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 246
    .line 247
    .line 248
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    invoke-virtual {p0, v2}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-virtual {v3, p1}, Ljava/nio/ByteBuffer;->put(Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-virtual {v3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 261
    .line 262
    .line 263
    if-lez v2, :cond_9

    .line 264
    .line 265
    iput-boolean v1, p0, Ll/rty0;->p:Z

    .line 266
    .line 267
    :cond_9
    :goto_3
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 268
    .line 269
    .line 270
    goto/16 :goto_0

    .line 271
    .line 272
    :cond_a
    return-void
.end method

.method public final c(Ll/mqu0;)Ll/mqu0;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzds;
        }
    .end annotation

    .line 1
    iget v0, p1, Ll/mqu0;->c:I

    .line 2
    .line 3
    const/4 v1, 0x2

    .line 4
    if-ne v0, v1, :cond_1

    .line 5
    .line 6
    iget-boolean p0, p0, Ll/rty0;->j:Z

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    return-object p1

    .line 11
    :cond_0
    sget-object p0, Ll/mqu0;->e:Ll/mqu0;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    new-instance p0, Lcom/google/android/gms/internal/ads/zzds;

    .line 15
    .line 16
    const-string v0, "Unhandled input format:"

    .line 17
    .line 18
    invoke-direct {p0, v0, p1}, Lcom/google/android/gms/internal/ads/zzds;-><init>(Ljava/lang/String;Ll/mqu0;)V

    .line 19
    .line 20
    .line 21
    throw p0
.end method

.method public final e()V
    .locals 3

    .line 1
    iget-boolean v0, p0, Ll/rty0;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 6
    .line 7
    iget v0, v0, Ll/mqu0;->d:I

    .line 8
    .line 9
    iput v0, p0, Ll/rty0;->i:I

    .line 10
    .line 11
    const-wide/32 v0, 0x249f0

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ll/rty0;->k(J)I

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    iget v1, p0, Ll/rty0;->i:I

    .line 19
    .line 20
    mul-int/2addr v0, v1

    .line 21
    iget-object v1, p0, Ll/rty0;->k:[B

    .line 22
    .line 23
    array-length v1, v1

    .line 24
    if-eq v1, v0, :cond_0

    .line 25
    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    iput-object v0, p0, Ll/rty0;->k:[B

    .line 29
    .line 30
    :cond_0
    const-wide/16 v0, 0x4e20

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/rty0;->k(J)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget v1, p0, Ll/rty0;->i:I

    .line 37
    .line 38
    mul-int/2addr v0, v1

    .line 39
    iput v0, p0, Ll/rty0;->o:I

    .line 40
    .line 41
    iget-object v1, p0, Ll/rty0;->l:[B

    .line 42
    .line 43
    array-length v1, v1

    .line 44
    if-eq v1, v0, :cond_1

    .line 45
    .line 46
    new-array v0, v0, [B

    .line 47
    .line 48
    iput-object v0, p0, Ll/rty0;->l:[B

    .line 49
    .line 50
    :cond_1
    const/4 v0, 0x0

    .line 51
    iput v0, p0, Ll/rty0;->m:I

    .line 52
    .line 53
    const-wide/16 v1, 0x0

    .line 54
    .line 55
    iput-wide v1, p0, Ll/rty0;->q:J

    .line 56
    .line 57
    iput v0, p0, Ll/rty0;->n:I

    .line 58
    .line 59
    iput-boolean v0, p0, Ll/rty0;->p:Z

    .line 60
    .line 61
    return-void
.end method

.method public final f()V
    .locals 4

    .line 1
    iget v0, p0, Ll/rty0;->n:I

    .line 2
    .line 3
    if-lez v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/rty0;->k:[B

    .line 6
    .line 7
    invoke-virtual {p0, v1, v0}, Ll/rty0;->m([BI)V

    .line 8
    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    iput v0, p0, Ll/rty0;->n:I

    .line 12
    .line 13
    iput v0, p0, Ll/rty0;->m:I

    .line 14
    .line 15
    :cond_0
    iget-boolean v0, p0, Ll/rty0;->p:Z

    .line 16
    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    iget-wide v0, p0, Ll/rty0;->q:J

    .line 20
    .line 21
    iget v2, p0, Ll/rty0;->o:I

    .line 22
    .line 23
    iget v3, p0, Ll/rty0;->i:I

    .line 24
    .line 25
    div-int/2addr v2, v3

    .line 26
    int-to-long v2, v2

    .line 27
    add-long/2addr v0, v2

    .line 28
    iput-wide v0, p0, Ll/rty0;->q:J

    .line 29
    .line 30
    :cond_1
    return-void
.end method

.method public final g()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/rty0;->j:Z

    .line 3
    .line 4
    iput v0, p0, Ll/rty0;->o:I

    .line 5
    .line 6
    sget-object v0, Ll/mpw0;->f:[B

    .line 7
    .line 8
    iput-object v0, p0, Ll/rty0;->k:[B

    .line 9
    .line 10
    iput-object v0, p0, Ll/rty0;->l:[B

    .line 11
    .line 12
    return-void
.end method

.method public final i()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/rty0;->q:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final j(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/rty0;->j:Z

    .line 2
    .line 3
    return-void
.end method

.method public final k(J)I
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fuu0;->b:Ll/mqu0;

    .line 2
    .line 3
    iget p0, p0, Ll/mqu0;->a:I

    .line 4
    .line 5
    int-to-long v0, p0

    .line 6
    mul-long/2addr p1, v0

    .line 7
    const-wide/32 v0, 0xf4240

    .line 8
    .line 9
    .line 10
    div-long/2addr p1, v0

    .line 11
    long-to-int p0, p1

    .line 12
    return p0
.end method

.method public final l(Ljava/nio/ByteBuffer;)I
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->position()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    :goto_0
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-ge v0, v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->getShort(I)S

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-static {v1}, Ljava/lang/Math;->abs(I)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/16 v2, 0x400

    .line 20
    .line 21
    if-le v1, v2, :cond_0

    .line 22
    .line 23
    iget p0, p0, Ll/rty0;->i:I

    .line 24
    .line 25
    div-int/2addr v0, p0

    .line 26
    mul-int/2addr p0, v0

    .line 27
    return p0

    .line 28
    :cond_0
    add-int/lit8 v0, v0, 0x2

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    return p0
.end method

.method public final m([BI)V
    .locals 2

    .line 1
    invoke-virtual {p0, p2}, Ll/fuu0;->d(I)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-virtual {v0, p1, v1, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    .line 11
    .line 12
    .line 13
    if-lez p2, :cond_0

    .line 14
    .line 15
    const/4 p1, 0x1

    .line 16
    iput-boolean p1, p0, Ll/rty0;->p:Z

    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final n(Ljava/nio/ByteBuffer;[BI)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Ll/rty0;->o:I

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iget v1, p0, Ll/rty0;->o:I

    .line 12
    .line 13
    sub-int/2addr v1, v0

    .line 14
    sub-int/2addr p3, v1

    .line 15
    iget-object v2, p0, Ll/rty0;->l:[B

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    invoke-static {p2, p3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    sub-int/2addr p2, v0

    .line 26
    invoke-virtual {p1, p2}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/rty0;->l:[B

    .line 30
    .line 31
    invoke-virtual {p1, p0, v1, v0}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public final zzg()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/rty0;->j:Z

    .line 2
    .line 3
    return p0
.end method
