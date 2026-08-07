.class public final Ll/xsr0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/yrr0;


# instance fields
.field public final a:Ll/bgw0;

.field public final b:Ll/vfr0;

.field public final c:Ljava/lang/String;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public d:Ll/sgr0;

.field public e:Ljava/lang/String;

.field public f:I

.field public g:I

.field public h:Z

.field public i:Z

.field public j:J

.field public k:I

.field public l:J


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 39
    invoke-direct {p0, v0}, Ll/xsr0;-><init>(Ljava/lang/String;)V

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
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Ll/xsr0;->f:I

    .line 6
    .line 7
    new-instance v1, Ll/bgw0;

    .line 8
    .line 9
    const/4 v2, 0x4

    .line 10
    invoke-direct {v1, v2}, Ll/bgw0;-><init>(I)V

    .line 11
    .line 12
    .line 13
    iput-object v1, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/bgw0;->m()[B

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    const/4 v2, -0x1

    .line 20
    aput-byte v2, v1, v0

    .line 21
    .line 22
    new-instance v0, Ll/vfr0;

    .line 23
    .line 24
    invoke-direct {v0}, Ll/vfr0;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 28
    .line 29
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    iput-wide v0, p0, Ll/xsr0;->l:J

    .line 35
    .line 36
    iput-object p1, p0, Ll/xsr0;->c:Ljava/lang/String;

    .line 37
    .line 38
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
    iget-object v0, p0, Ll/xsr0;->d:Ll/sgr0;

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
    if-lez v0, :cond_a

    .line 11
    .line 12
    iget v0, p0, Ll/xsr0;->f:I

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
    iget v1, p0, Ll/xsr0;->k:I

    .line 26
    .line 27
    iget v4, p0, Ll/xsr0;->g:I

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
    iget-object v1, p0, Ll/xsr0;->d:Ll/sgr0;

    .line 35
    .line 36
    invoke-interface {v1, p1, v0}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 37
    .line 38
    .line 39
    iget v1, p0, Ll/xsr0;->g:I

    .line 40
    .line 41
    add-int/2addr v1, v0

    .line 42
    iput v1, p0, Ll/xsr0;->g:I

    .line 43
    .line 44
    iget v0, p0, Ll/xsr0;->k:I

    .line 45
    .line 46
    if-lt v1, v0, :cond_0

    .line 47
    .line 48
    iget-wide v0, p0, Ll/xsr0;->l:J

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
    iget-object v4, p0, Ll/xsr0;->d:Ll/sgr0;

    .line 65
    .line 66
    iget-wide v5, p0, Ll/xsr0;->l:J

    .line 67
    .line 68
    iget v8, p0, Ll/xsr0;->k:I

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
    iget-wide v0, p0, Ll/xsr0;->l:J

    .line 77
    .line 78
    iget-wide v4, p0, Ll/xsr0;->j:J

    .line 79
    .line 80
    add-long/2addr v0, v4

    .line 81
    iput-wide v0, p0, Ll/xsr0;->l:J

    .line 82
    .line 83
    iput v3, p0, Ll/xsr0;->g:I

    .line 84
    .line 85
    iput v3, p0, Ll/xsr0;->f:I

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-virtual {p1}, Ll/bgw0;->q()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    iget v4, p0, Ll/xsr0;->g:I

    .line 93
    .line 94
    const/4 v5, 0x4

    .line 95
    rsub-int/lit8 v4, v4, 0x4

    .line 96
    .line 97
    invoke-static {v0, v4}, Ljava/lang/Math;->min(II)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    iget-object v4, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 102
    .line 103
    invoke-virtual {v4}, Ll/bgw0;->m()[B

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    iget v6, p0, Ll/xsr0;->g:I

    .line 108
    .line 109
    invoke-virtual {p1, v4, v6, v0}, Ll/bgw0;->g([BII)V

    .line 110
    .line 111
    .line 112
    iget v4, p0, Ll/xsr0;->g:I

    .line 113
    .line 114
    add-int/2addr v4, v0

    .line 115
    iput v4, p0, Ll/xsr0;->g:I

    .line 116
    .line 117
    if-lt v4, v5, :cond_0

    .line 118
    .line 119
    iget-object v0, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 120
    .line 121
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 125
    .line 126
    iget-object v4, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 127
    .line 128
    invoke-virtual {v4}, Ll/bgw0;->v()I

    .line 129
    .line 130
    .line 131
    move-result v4

    .line 132
    invoke-virtual {v0, v4}, Ll/vfr0;->a(I)Z

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    if-nez v0, :cond_3

    .line 137
    .line 138
    iput v3, p0, Ll/xsr0;->g:I

    .line 139
    .line 140
    iput v2, p0, Ll/xsr0;->f:I

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_3
    iget-object v0, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 145
    .line 146
    iget v4, v0, Ll/vfr0;->c:I

    .line 147
    .line 148
    iput v4, p0, Ll/xsr0;->k:I

    .line 149
    .line 150
    iget-boolean v4, p0, Ll/xsr0;->h:Z

    .line 151
    .line 152
    if-nez v4, :cond_4

    .line 153
    .line 154
    iget v4, v0, Ll/vfr0;->g:I

    .line 155
    .line 156
    int-to-long v6, v4

    .line 157
    iget v0, v0, Ll/vfr0;->d:I

    .line 158
    .line 159
    const-wide/32 v8, 0xf4240

    .line 160
    .line 161
    .line 162
    mul-long/2addr v6, v8

    .line 163
    int-to-long v8, v0

    .line 164
    div-long/2addr v6, v8

    .line 165
    iput-wide v6, p0, Ll/xsr0;->j:J

    .line 166
    .line 167
    new-instance v0, Ll/znr0;

    .line 168
    .line 169
    invoke-direct {v0}, Ll/znr0;-><init>()V

    .line 170
    .line 171
    .line 172
    iget-object v4, p0, Ll/xsr0;->e:Ljava/lang/String;

    .line 173
    .line 174
    invoke-virtual {v0, v4}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 175
    .line 176
    .line 177
    iget-object v4, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 178
    .line 179
    iget-object v4, v4, Ll/vfr0;->b:Ljava/lang/String;

    .line 180
    .line 181
    invoke-virtual {v0, v4}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 182
    .line 183
    .line 184
    const/16 v4, 0x1000

    .line 185
    .line 186
    invoke-virtual {v0, v4}, Ll/znr0;->o(I)Ll/znr0;

    .line 187
    .line 188
    .line 189
    iget-object v4, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 190
    .line 191
    iget v4, v4, Ll/vfr0;->e:I

    .line 192
    .line 193
    invoke-virtual {v0, v4}, Ll/znr0;->k0(I)Ll/znr0;

    .line 194
    .line 195
    .line 196
    iget-object v4, p0, Ll/xsr0;->b:Ll/vfr0;

    .line 197
    .line 198
    iget v4, v4, Ll/vfr0;->d:I

    .line 199
    .line 200
    invoke-virtual {v0, v4}, Ll/znr0;->x(I)Ll/znr0;

    .line 201
    .line 202
    .line 203
    iget-object v4, p0, Ll/xsr0;->c:Ljava/lang/String;

    .line 204
    .line 205
    invoke-virtual {v0, v4}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 206
    .line 207
    .line 208
    invoke-virtual {v0}, Ll/znr0;->D()Ll/sqr0;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iget-object v4, p0, Ll/xsr0;->d:Ll/sgr0;

    .line 213
    .line 214
    invoke-interface {v4, v0}, Ll/sgr0;->d(Ll/sqr0;)V

    .line 215
    .line 216
    .line 217
    iput-boolean v2, p0, Ll/xsr0;->h:Z

    .line 218
    .line 219
    :cond_4
    iget-object v0, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 220
    .line 221
    invoke-virtual {v0, v3}, Ll/bgw0;->k(I)V

    .line 222
    .line 223
    .line 224
    iget-object v0, p0, Ll/xsr0;->d:Ll/sgr0;

    .line 225
    .line 226
    iget-object v2, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 227
    .line 228
    invoke-interface {v0, v2, v5}, Ll/sgr0;->f(Ll/bgw0;I)V

    .line 229
    .line 230
    .line 231
    iput v1, p0, Ll/xsr0;->f:I

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :cond_5
    invoke-virtual {p1}, Ll/bgw0;->m()[B

    .line 236
    .line 237
    .line 238
    move-result-object v0

    .line 239
    invoke-virtual {p1}, Ll/bgw0;->s()I

    .line 240
    .line 241
    .line 242
    move-result v4

    .line 243
    invoke-virtual {p1}, Ll/bgw0;->t()I

    .line 244
    .line 245
    .line 246
    move-result v5

    .line 247
    :goto_2
    if-ge v4, v5, :cond_9

    .line 248
    .line 249
    add-int/lit8 v6, v4, 0x1

    .line 250
    .line 251
    aget-byte v7, v0, v4

    .line 252
    .line 253
    and-int/lit16 v8, v7, 0xff

    .line 254
    .line 255
    const/16 v9, 0xff

    .line 256
    .line 257
    if-ne v8, v9, :cond_6

    .line 258
    .line 259
    move v8, v2

    .line 260
    goto :goto_3

    .line 261
    :cond_6
    move v8, v3

    .line 262
    :goto_3
    iget-boolean v9, p0, Ll/xsr0;->i:Z

    .line 263
    .line 264
    if-eqz v9, :cond_7

    .line 265
    .line 266
    and-int/lit16 v7, v7, 0xe0

    .line 267
    .line 268
    const/16 v9, 0xe0

    .line 269
    .line 270
    if-ne v7, v9, :cond_7

    .line 271
    .line 272
    move v7, v2

    .line 273
    goto :goto_4

    .line 274
    :cond_7
    move v7, v3

    .line 275
    :goto_4
    iput-boolean v8, p0, Ll/xsr0;->i:Z

    .line 276
    .line 277
    if-eqz v7, :cond_8

    .line 278
    .line 279
    invoke-virtual {p1, v6}, Ll/bgw0;->k(I)V

    .line 280
    .line 281
    .line 282
    iput-boolean v3, p0, Ll/xsr0;->i:Z

    .line 283
    .line 284
    iget-object v3, p0, Ll/xsr0;->a:Ll/bgw0;

    .line 285
    .line 286
    invoke-virtual {v3}, Ll/bgw0;->m()[B

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    aget-byte v0, v0, v4

    .line 291
    .line 292
    aput-byte v0, v3, v2

    .line 293
    .line 294
    iput v1, p0, Ll/xsr0;->g:I

    .line 295
    .line 296
    iput v2, p0, Ll/xsr0;->f:I

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :cond_8
    move v4, v6

    .line 301
    goto :goto_2

    .line 302
    :cond_9
    invoke-virtual {p1, v5}, Ll/bgw0;->k(I)V

    .line 303
    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :cond_a
    return-void
.end method

.method public final c(JI)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ll/xsr0;->l:J

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
    iput-object v0, p0, Ll/xsr0;->e:Ljava/lang/String;

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
    iput-object p1, p0, Ll/xsr0;->d:Ll/sgr0;

    .line 20
    .line 21
    return-void
.end method

.method public final zze()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/xsr0;->f:I

    .line 3
    .line 4
    iput v0, p0, Ll/xsr0;->g:I

    .line 5
    .line 6
    iput-boolean v0, p0, Ll/xsr0;->i:Z

    .line 7
    .line 8
    const-wide v0, -0x7fffffffffffffffL    # -4.9E-324

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    iput-wide v0, p0, Ll/xsr0;->l:J

    .line 14
    .line 15
    return-void
.end method
