.class public final Ll/rrr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ll/dfw0;

.field public final b:Ll/bgw0;

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:Ll/sgr0;

.field public f:I

.field public g:I

.field public h:Z

.field public i:J

.field public j:Ll/sqr0;

.field public k:I

.field public l:J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 41
    invoke-direct {p0, v0}, Ll/rrr0;-><init>(Ljava/lang/String;)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 3
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/dfw0;

    .line 5
    .line 6
    const/16 v1, 0x10

    .line 7
    .line 8
    new-array v2, v1, [B

    .line 9
    .line 10
    invoke-direct {v0, v2, v1}, Ll/dfw0;-><init>([BI)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Ll/rrr0;->a:Ll/dfw0;

    .line 14
    .line 15
    new-instance v1, Ll/bgw0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/dfw0;->a:[B

    .line 18
    .line 19
    invoke-direct {v1, v0}, Ll/bgw0;-><init>([B)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Ll/rrr0;->b:Ll/bgw0;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput v0, p0, Ll/rrr0;->f:I

    .line 26
    .line 27
    iput v0, p0, Ll/rrr0;->g:I

    .line 28
    .line 29
    iput-boolean v0, p0, Ll/rrr0;->h:Z

    .line 30
    .line 31
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 32
    .line 33
    .line 34
    .line 35
    .line 36
    iput-wide v0, p0, Ll/rrr0;->l:J

    .line 37
    .line 38
    iput-object p1, p0, Ll/rrr0;->c:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final b(Ll/bgw0;)V
    .locals 11

    .line 1
    iget-object v0, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/lev0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    :cond_0
    :goto_0
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-lez v0, :cond_b

    .line 11
    .line 12
    iget v0, p0, Ll/rrr0;->f:I

    .line 13
    .line 14
    const/4 v1, 0x2

    .line 15
    const/4 v2, 0x1

    .line 16
    const/4 v3, 0x0

    .line 17
    if-eqz v0, :cond_5

    .line 18
    .line 19
    if-eq v0, v2, :cond_2

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    iget v1, p0, Ll/rrr0;->k:I

    .line 26
    .line 27
    iget v4, p0, Ll/rrr0;->g:I

    .line 28
    .line 29
    sub-int/2addr v1, v4

    .line 30
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iget-object v1, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 35
    .line 36
    invoke-interface {v1, p1, v0}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Ll/rrr0;->g:I

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    iput v1, p0, Ll/rrr0;->g:I

    .line 43
    .line 44
    iget v0, p0, Ll/rrr0;->k:I

    .line 45
    .line 46
    if-ne v1, v0, :cond_0

    .line 47
    .line 48
    iget-wide v0, p0, Ll/rrr0;->l:J

    .line 49
    .line 50
    const-wide v4, -0x7fffffffffffffffL    # -4.9E-324

    .line 51
    .line 52
    .line 53
    .line 54
    .line 55
    cmp-long v0, v0, v4

    .line 56
    .line 57
    if-eqz v0, :cond_1

    .line 58
    .line 59
    goto :goto_1

    .line 60
    :cond_1
    move v2, v3

    .line 61
    :goto_1
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 62
    .line 63
    .line 64
    iget-object v4, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 65
    .line 66
    iget-wide v5, p0, Ll/rrr0;->l:J

    .line 67
    .line 68
    iget v8, p0, Ll/rrr0;->k:I

    .line 69
    .line 70
    const/4 v9, 0x0

    .line 71
    const/4 v10, 0x0

    .line 72
    const/4 v7, 0x1

    .line 73
    invoke-interface/range {v4 .. v10}, Ll/sgr0;->c(JIIILl/ggr0;)V

    .line 74
    .line 75
    .line 76
    iget-wide v0, p0, Ll/rrr0;->l:J

    .line 77
    .line 78
    iget-wide v4, p0, Ll/rrr0;->i:J

    .line 79
    .line 80
    add-long/2addr v0, v4

    .line 81
    iput-wide v0, p0, Ll/rrr0;->l:J

    .line 82
    .line 83
    iput v3, p0, Ll/rrr0;->f:I

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_2
    iget-object v0, p0, Ll/rrr0;->b:Ll/bgw0;

    .line 87
    .line 88
    invoke-virtual {v0}, Ll/bgw0;->m()[B

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    iget v4, p0, Ll/rrr0;->g:I

    .line 97
    .line 98
    const/16 v5, 0x10

    .line 99
    .line 100
    rsub-int/lit8 v4, v4, 0x10

    .line 101
    .line 102
    invoke-static {v2, v4}, Ljava/lang/Math;->min(II)I

    .line 103
    .line 104
    .line 105
    move-result v2

    .line 106
    iget v4, p0, Ll/rrr0;->g:I

    .line 107
    .line 108
    invoke-virtual {p1, v0, v4, v2}, Ll/bgw0;->g([BII)V

    .line 109
    .line 110
    .line 111
    iget v0, p0, Ll/rrr0;->g:I

    .line 112
    .line 113
    add-int/2addr v0, v2

    .line 114
    iput v0, p0, Ll/rrr0;->g:I

    .line 115
    .line 116
    if-ne v0, v5, :cond_0

    .line 117
    .line 118
    iget-object v0, p0, Ll/rrr0;->a:Ll/dfw0;

    .line 119
    .line 120
    invoke-virtual {v0, v3}, Ll/dfw0;->k(I)V

    .line 121
    .line 122
    .line 123
    iget-object v0, p0, Ll/rrr0;->a:Ll/dfw0;

    .line 124
    .line 125
    invoke-static {v0}, Ll/idr0;->a(Ll/dfw0;)Ll/hdr0;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    iget-object v2, p0, Ll/rrr0;->j:Ll/sqr0;

    .line 130
    .line 131
    const-string v4, "audio/ac4"

    .line 132
    .line 133
    if-eqz v2, :cond_3

    .line 134
    .line 135
    iget v6, v2, Ll/sqr0;->y:I

    .line 136
    .line 137
    if-ne v6, v1, :cond_3

    .line 138
    .line 139
    iget v6, v0, Ll/hdr0;->a:I

    .line 140
    .line 141
    iget v7, v2, Ll/sqr0;->z:I

    .line 142
    .line 143
    if-ne v6, v7, :cond_3

    .line 144
    .line 145
    iget-object v2, v2, Ll/sqr0;->l:Ljava/lang/String;

    .line 146
    .line 147
    invoke-virtual {v4, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 148
    .line 149
    .line 150
    move-result v2

    .line 151
    if-nez v2, :cond_4

    .line 152
    .line 153
    :cond_3
    new-instance v2, Ll/znr0;

    .line 154
    .line 155
    invoke-direct {v2}, Ll/znr0;-><init>()V

    .line 156
    .line 157
    .line 158
    iget-object v6, p0, Ll/rrr0;->d:Ljava/lang/String;

    .line 159
    .line 160
    invoke-virtual {v2, v6}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 161
    .line 162
    .line 163
    invoke-virtual {v2, v4}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 164
    .line 165
    .line 166
    invoke-virtual {v2, v1}, Ll/znr0;->k0(I)Ll/znr0;

    .line 167
    .line 168
    .line 169
    iget v4, v0, Ll/hdr0;->a:I

    .line 170
    .line 171
    invoke-virtual {v2, v4}, Ll/znr0;->x(I)Ll/znr0;

    .line 172
    .line 173
    .line 174
    iget-object v4, p0, Ll/rrr0;->c:Ljava/lang/String;

    .line 175
    .line 176
    invoke-virtual {v2, v4}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 177
    .line 178
    .line 179
    invoke-virtual {v2}, Ll/znr0;->D()Ll/sqr0;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    iput-object v2, p0, Ll/rrr0;->j:Ll/sqr0;

    .line 184
    .line 185
    iget-object v4, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 186
    .line 187
    invoke-interface {v4, v2}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 188
    .line 189
    .line 190
    :cond_4
    iget v2, v0, Ll/hdr0;->b:I

    .line 191
    .line 192
    iput v2, p0, Ll/rrr0;->k:I

    .line 193
    .line 194
    iget v0, v0, Ll/hdr0;->c:I

    .line 195
    .line 196
    iget-object v2, p0, Ll/rrr0;->j:Ll/sqr0;

    .line 197
    .line 198
    iget v2, v2, Ll/sqr0;->z:I

    .line 199
    .line 200
    int-to-long v6, v0

    .line 201
    const-wide/32 v8, 0xf4240

    .line 202
    .line 203
    .line 204
    mul-long/2addr v6, v8

    .line 205
    int-to-long v8, v2

    .line 206
    div-long/2addr v6, v8

    .line 207
    iput-wide v6, p0, Ll/rrr0;->i:J

    .line 208
    .line 209
    iget-object v0, p0, Ll/rrr0;->b:Ll/bgw0;

    .line 210
    .line 211
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 212
    .line 213
    .line 214
    iget-object v0, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 215
    .line 216
    iget-object v2, p0, Ll/rrr0;->b:Ll/bgw0;

    .line 217
    .line 218
    invoke-interface {v0, v2, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 219
    .line 220
    .line 221
    iput v1, p0, Ll/rrr0;->f:I

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :cond_5
    :goto_2
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    if-lez v0, :cond_0

    .line 230
    .line 231
    iget-boolean v0, p0, Ll/rrr0;->h:Z

    .line 232
    .line 233
    const/16 v4, 0xac

    .line 234
    .line 235
    if-nez v0, :cond_7

    .line 236
    .line 237
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    if-ne v0, v4, :cond_6

    .line 242
    .line 243
    move v0, v2

    .line 244
    goto :goto_3

    .line 245
    :cond_6
    move v0, v3

    .line 246
    :goto_3
    iput-boolean v0, p0, Ll/rrr0;->h:Z

    .line 247
    .line 248
    goto :goto_2

    .line 249
    :cond_7
    invoke-virtual {p1}, Ll/bgw0;->B()I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    if-ne v0, v4, :cond_8

    .line 254
    .line 255
    move v4, v2

    .line 256
    goto :goto_4

    .line 257
    :cond_8
    move v4, v3

    .line 258
    :goto_4
    iput-boolean v4, p0, Ll/rrr0;->h:Z

    .line 259
    .line 260
    const/16 v4, 0x40

    .line 261
    .line 262
    const/16 v5, 0x41

    .line 263
    .line 264
    if-eq v0, v4, :cond_9

    .line 265
    .line 266
    if-ne v0, v5, :cond_5

    .line 267
    .line 268
    move v0, v5

    .line 269
    :cond_9
    iput v2, p0, Ll/rrr0;->f:I

    .line 270
    .line 271
    iget-object v6, p0, Ll/rrr0;->b:Ll/bgw0;

    .line 272
    .line 273
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 274
    .line 275
    .line 276
    move-result-object v7

    .line 277
    const/16 v8, -0x54

    .line 278
    .line 279
    aput-byte v8, v7, v3

    .line 280
    .line 281
    if-ne v0, v5, :cond_a

    .line 282
    .line 283
    move v4, v5

    .line 284
    :cond_a
    invoke-virtual {v6}, Ll/bgw0;->m()[B

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    aput-byte v4, v0, v2

    .line 289
    .line 290
    iput v1, p0, Ll/rrr0;->g:I

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :cond_b
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/rrr0;->l:J

    .line 2
    .line 3
    return-void
.end method

.method public final d(Ll/ser0;Ll/gur0;)V
    .locals 1

    .line 1
    invoke-virtual {p2}, Ll/gur0;->c()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ll/gur0;->b()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rrr0;->d:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {p2}, Ll/gur0;->a()I

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    const/4 v0, 0x1

    .line 15
    invoke-interface {p1, p2, v0}, Ll/ser0;->i(II)Ll/sgr0;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iput-object p1, p0, Ll/rrr0;->e:Ll/sgr0;

    .line 20
    .line 21
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/rrr0;->f:I

    .line 3
    .line 4
    iput v0, p0, Ll/rrr0;->g:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/rrr0;->h:Z

    .line 7
    .line 8
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Ll/rrr0;->l:J

    .line 14
    .line 15
    return-void
.end method
