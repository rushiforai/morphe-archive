.class public final Ll/pty0;
.super Ll/kwy0;
.source "SourceFile"

# interfaces
.implements Ll/kay0;


# instance fields
.field public final a1:Landroid/content/Context;

.field public final b1:Ll/fqy0;

.field public final c1:Ll/kry0;

.field public d1:I

.field public e1:Z

.field public f1:Z

.field public g1:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public h1:Ll/sqr0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public i1:J

.field public j1:Z

.field public k1:Z

.field public l1:Ll/sey0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public m1:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/zvy0;Ll/dxy0;ZLandroid/os/Handler;Ll/hqy0;Ll/kry0;)V
    .locals 6
    .param p5    # Landroid/os/Handler;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ll/hqy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v4, 0x0

    .line 2
    const v5, 0x472c4400    # 44100.0f

    .line 3
    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    move-object v0, p0

    .line 7
    move-object v2, p2

    .line 8
    move-object v3, p3

    .line 9
    invoke-direct/range {v0 .. v5}, Ll/kwy0;-><init>(ILl/zvy0;Ll/dxy0;ZF)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    iput-object p0, v0, Ll/pty0;->a1:Landroid/content/Context;

    .line 17
    .line 18
    iput-object p7, v0, Ll/pty0;->c1:Ll/kry0;

    .line 19
    .line 20
    new-instance p0, Ll/fqy0;

    .line 21
    .line 22
    invoke-direct {p0, p5, p6}, Ll/fqy0;-><init>(Landroid/os/Handler;Ll/hqy0;)V

    .line 23
    .line 24
    .line 25
    iput-object p0, v0, Ll/pty0;->b1:Ll/fqy0;

    .line 26
    .line 27
    new-instance p0, Ll/oty0;

    .line 28
    .line 29
    const/4 p1, 0x0

    .line 30
    invoke-direct {p0, v0, p1}, Ll/oty0;-><init>(Ll/pty0;Ll/nty0;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p7, p0}, Ll/kry0;->p(Ll/nqy0;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public static S0(Ll/dxy0;Ll/sqr0;ZLl/kry0;)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    iget-object p2, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    if-nez p2, :cond_0

    .line 4
    .line 5
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-interface {p3, p1}, Ll/kry0;->c(Ll/sqr0;)Z

    .line 11
    .line 12
    .line 13
    move-result p2

    .line 14
    if-eqz p2, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/oxy0;->b()Ll/hwy0;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    if-eqz p2, :cond_1

    .line 21
    .line 22
    invoke-static {p2}, Lcom/google/android/gms/internal/ads/zzgaa;->zzm(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzgaa;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_1
    const/4 p2, 0x0

    .line 28
    invoke-static {p0, p1, p2, p2}, Ll/oxy0;->f(Ll/dxy0;Ll/sqr0;ZZ)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    return-object p0
.end method

.method public static bridge synthetic T0(Ll/pty0;)Ll/sey0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->l1:Ll/sey0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic U0(Ll/pty0;)Ll/fqy0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic V0(Ll/pty0;Z)V
    .locals 0

    .line 1
    const/4 p1, 0x1

    .line 2
    iput-boolean p1, p0, Ll/pty0;->m1:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final A()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/pty0;->m1:Z

    .line 3
    .line 4
    :try_start_0
    invoke-super {p0}, Ll/kwy0;->A()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    iget-boolean v1, p0, Ll/pty0;->k1:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iput-boolean v0, p0, Ll/pty0;->k1:Z

    .line 12
    .line 13
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 14
    .line 15
    invoke-interface {p0}, Ll/kry0;->zzk()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void

    .line 19
    :catchall_0
    move-exception v1

    .line 20
    iget-boolean v2, p0, Ll/pty0;->k1:Z

    .line 21
    .line 22
    if-nez v2, :cond_1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    iput-boolean v0, p0, Ll/pty0;->k1:Z

    .line 26
    .line 27
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 28
    .line 29
    invoke-interface {p0}, Ll/kry0;->zzk()V

    .line 30
    .line 31
    .line 32
    :goto_0
    throw v1
.end method

.method public final A0(Ljava/lang/String;Ll/xvy0;JJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 2
    .line 3
    move-wide p2, p3

    .line 4
    move-wide p4, p5

    .line 5
    invoke-virtual/range {p0 .. p5}, Ll/fqy0;->e(Ljava/lang/String;JJ)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final B()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kry0;->zzi()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final B0(Ljava/lang/String;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/fqy0;->f(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final C()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/pty0;->h0()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 5
    .line 6
    invoke-interface {p0}, Ll/kry0;->zzh()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final C0(Ll/sqr0;Landroid/media/MediaFormat;)V
    .locals 10
    .param p2    # Landroid/media/MediaFormat;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/pty0;->h1:Ll/sqr0;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    const/4 v3, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    move-object p1, v0

    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    invoke-virtual {p0}, Ll/kwy0;->L0()Ll/bwy0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    goto/16 :goto_3

    .line 18
    .line 19
    :cond_1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Ll/sqr0;->l:Ljava/lang/String;

    .line 23
    .line 24
    const-string v4, "audio/raw"

    .line 25
    .line 26
    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    const/4 v5, 0x2

    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    iget v0, p1, Ll/sqr0;->A:I

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :cond_2
    sget v0, Ll/mpw0;->a:I

    .line 37
    .line 38
    const/16 v6, 0x18

    .line 39
    .line 40
    if-lt v0, v6, :cond_3

    .line 41
    .line 42
    const-string v0, "pcm-encoding"

    .line 43
    .line 44
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 45
    .line 46
    .line 47
    move-result v6

    .line 48
    if-eqz v6, :cond_3

    .line 49
    .line 50
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    move-result v0

    .line 54
    goto :goto_0

    .line 55
    :cond_3
    const-string v0, "v-bits-per-sample"

    .line 56
    .line 57
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v6

    .line 61
    if-eqz v6, :cond_4

    .line 62
    .line 63
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v0}, Ll/mpw0;->z(I)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    goto :goto_0

    .line 72
    :cond_4
    move v0, v5

    .line 73
    :goto_0
    new-instance v6, Ll/znr0;

    .line 74
    .line 75
    invoke-direct {v6}, Ll/znr0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v6, v4}, Ll/znr0;->w(Ljava/lang/String;)Ll/znr0;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v6, v0}, Ll/znr0;->q(I)Ll/znr0;

    .line 82
    .line 83
    .line 84
    iget v0, p1, Ll/sqr0;->B:I

    .line 85
    .line 86
    invoke-virtual {v6, v0}, Ll/znr0;->f(I)Ll/znr0;

    .line 87
    .line 88
    .line 89
    iget v0, p1, Ll/sqr0;->C:I

    .line 90
    .line 91
    invoke-virtual {v6, v0}, Ll/znr0;->g(I)Ll/znr0;

    .line 92
    .line 93
    .line 94
    iget-object v0, p1, Ll/sqr0;->j:Lcom/google/android/gms/internal/ads/zzby;

    .line 95
    .line 96
    invoke-virtual {v6, v0}, Ll/znr0;->p(Lcom/google/android/gms/internal/ads/zzby;)Ll/znr0;

    .line 97
    .line 98
    .line 99
    iget-object v0, p1, Ll/sqr0;->a:Ljava/lang/String;

    .line 100
    .line 101
    invoke-virtual {v6, v0}, Ll/znr0;->k(Ljava/lang/String;)Ll/znr0;

    .line 102
    .line 103
    .line 104
    iget-object v0, p1, Ll/sqr0;->b:Ljava/lang/String;

    .line 105
    .line 106
    invoke-virtual {v6, v0}, Ll/znr0;->m(Ljava/lang/String;)Ll/znr0;

    .line 107
    .line 108
    .line 109
    iget-object v0, p1, Ll/sqr0;->c:Ljava/lang/String;

    .line 110
    .line 111
    invoke-virtual {v6, v0}, Ll/znr0;->n(Ljava/lang/String;)Ll/znr0;

    .line 112
    .line 113
    .line 114
    iget v0, p1, Ll/sqr0;->d:I

    .line 115
    .line 116
    invoke-virtual {v6, v0}, Ll/znr0;->y(I)Ll/znr0;

    .line 117
    .line 118
    .line 119
    iget v0, p1, Ll/sqr0;->e:I

    .line 120
    .line 121
    invoke-virtual {v6, v0}, Ll/znr0;->u(I)Ll/znr0;

    .line 122
    .line 123
    .line 124
    const-string v0, "channel-count"

    .line 125
    .line 126
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    invoke-virtual {v6, v0}, Ll/znr0;->k0(I)Ll/znr0;

    .line 131
    .line 132
    .line 133
    const-string v0, "sample-rate"

    .line 134
    .line 135
    invoke-virtual {p2, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 136
    .line 137
    .line 138
    move-result p2

    .line 139
    invoke-virtual {v6, p2}, Ll/znr0;->x(I)Ll/znr0;

    .line 140
    .line 141
    .line 142
    invoke-virtual {v6}, Ll/znr0;->D()Ll/sqr0;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    iget-boolean v0, p0, Ll/pty0;->e1:Z

    .line 147
    .line 148
    const/4 v4, 0x6

    .line 149
    if-eqz v0, :cond_6

    .line 150
    .line 151
    iget v0, p2, Ll/sqr0;->y:I

    .line 152
    .line 153
    if-ne v0, v4, :cond_6

    .line 154
    .line 155
    iget v0, p1, Ll/sqr0;->y:I

    .line 156
    .line 157
    if-ge v0, v4, :cond_6

    .line 158
    .line 159
    new-array v1, v0, [I

    .line 160
    .line 161
    move v0, v3

    .line 162
    :goto_1
    iget v4, p1, Ll/sqr0;->y:I

    .line 163
    .line 164
    if-ge v0, v4, :cond_5

    .line 165
    .line 166
    aput v0, v1, v0

    .line 167
    .line 168
    add-int/lit8 v0, v0, 0x1

    .line 169
    .line 170
    goto :goto_1

    .line 171
    :cond_5
    :goto_2
    move-object p1, p2

    .line 172
    goto :goto_3

    .line 173
    :cond_6
    iget-boolean p1, p0, Ll/pty0;->f1:Z

    .line 174
    .line 175
    if-eqz p1, :cond_5

    .line 176
    .line 177
    iget p1, p2, Ll/sqr0;->y:I

    .line 178
    .line 179
    const/4 v0, 0x3

    .line 180
    if-eq p1, v0, :cond_b

    .line 181
    .line 182
    const/4 v6, 0x4

    .line 183
    const/4 v7, 0x5

    .line 184
    if-eq p1, v7, :cond_a

    .line 185
    .line 186
    if-eq p1, v4, :cond_9

    .line 187
    .line 188
    const/4 v8, 0x7

    .line 189
    if-eq p1, v8, :cond_8

    .line 190
    .line 191
    const/16 v9, 0x8

    .line 192
    .line 193
    if-eq p1, v9, :cond_7

    .line 194
    .line 195
    goto :goto_2

    .line 196
    :cond_7
    new-array v1, v9, [I

    .line 197
    .line 198
    aput v3, v1, v3

    .line 199
    .line 200
    aput v5, v1, v2

    .line 201
    .line 202
    aput v2, v1, v5

    .line 203
    .line 204
    aput v8, v1, v0

    .line 205
    .line 206
    aput v7, v1, v6

    .line 207
    .line 208
    aput v4, v1, v7

    .line 209
    .line 210
    aput v0, v1, v4

    .line 211
    .line 212
    aput v6, v1, v8

    .line 213
    .line 214
    goto :goto_2

    .line 215
    :cond_8
    new-array v1, v8, [I

    .line 216
    .line 217
    aput v3, v1, v3

    .line 218
    .line 219
    aput v5, v1, v2

    .line 220
    .line 221
    aput v2, v1, v5

    .line 222
    .line 223
    aput v4, v1, v0

    .line 224
    .line 225
    aput v7, v1, v6

    .line 226
    .line 227
    aput v0, v1, v7

    .line 228
    .line 229
    aput v6, v1, v4

    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_9
    new-array v1, v4, [I

    .line 233
    .line 234
    aput v3, v1, v3

    .line 235
    .line 236
    aput v5, v1, v2

    .line 237
    .line 238
    aput v2, v1, v5

    .line 239
    .line 240
    aput v7, v1, v0

    .line 241
    .line 242
    aput v0, v1, v6

    .line 243
    .line 244
    aput v6, v1, v7

    .line 245
    .line 246
    goto :goto_2

    .line 247
    :cond_a
    new-array v1, v7, [I

    .line 248
    .line 249
    aput v3, v1, v3

    .line 250
    .line 251
    aput v5, v1, v2

    .line 252
    .line 253
    aput v2, v1, v5

    .line 254
    .line 255
    aput v0, v1, v0

    .line 256
    .line 257
    aput v6, v1, v6

    .line 258
    .line 259
    goto :goto_2

    .line 260
    :cond_b
    new-array v1, v0, [I

    .line 261
    .line 262
    aput v3, v1, v3

    .line 263
    .line 264
    aput v5, v1, v2

    .line 265
    .line 266
    aput v2, v1, v5

    .line 267
    .line 268
    goto :goto_2

    .line 269
    :goto_3
    :try_start_0
    sget p2, Ll/mpw0;->a:I

    .line 270
    .line 271
    const/16 v0, 0x1d

    .line 272
    .line 273
    if-lt p2, v0, :cond_e

    .line 274
    .line 275
    invoke-virtual {p0}, Ll/kwy0;->b0()Z

    .line 276
    .line 277
    .line 278
    move-result v4

    .line 279
    if-eqz v4, :cond_c

    .line 280
    .line 281
    invoke-virtual {p0}, Ll/qwx0;->N()Ll/dfy0;

    .line 282
    .line 283
    .line 284
    goto :goto_4

    .line 285
    :catch_0
    move-exception p1

    .line 286
    goto :goto_6

    .line 287
    :cond_c
    :goto_4
    if-lt p2, v0, :cond_d

    .line 288
    .line 289
    goto :goto_5

    .line 290
    :cond_d
    move v2, v3

    .line 291
    :goto_5
    invoke-static {v2}, Ll/lev0;->f(Z)V

    .line 292
    .line 293
    .line 294
    :cond_e
    iget-object p2, p0, Ll/pty0;->c1:Ll/kry0;

    .line 295
    .line 296
    invoke-interface {p2, p1, v3, v1}, Ll/kry0;->e(Ll/sqr0;I[I)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzpw; {:try_start_0 .. :try_end_0} :catch_0

    .line 297
    .line 298
    .line 299
    return-void

    .line 300
    :goto_6
    iget-object p2, p1, Lcom/google/android/gms/internal/ads/zzpw;->zza:Ll/sqr0;

    .line 301
    .line 302
    const/16 v0, 0x1389

    .line 303
    .line 304
    invoke-virtual {p0, p1, p2, v3, v0}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 305
    .line 306
    .line 307
    move-result-object p0

    .line 308
    throw p0
.end method

.method public final E0()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kry0;->zzg()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final F0()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kry0;->zzj()V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzqa; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception v0

    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {p0}, Ll/kwy0;->b0()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eq v1, v2, :cond_0

    .line 14
    .line 15
    const/16 v1, 0x138a

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const/16 v1, 0x138b

    .line 19
    .line 20
    :goto_0
    iget-object v2, v0, Lcom/google/android/gms/internal/ads/zzqa;->zzc:Ll/sqr0;

    .line 21
    .line 22
    iget-boolean v3, v0, Lcom/google/android/gms/internal/ads/zzqa;->zzb:Z

    .line 23
    .line 24
    invoke-virtual {p0, v0, v2, v3, v1}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    throw p0
.end method

.method public final G0(JJLl/bwy0;Ljava/nio/ByteBuffer;IIIJZZLl/sqr0;)Z
    .locals 0
    .param p5    # Ll/bwy0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p6    # Ljava/nio/ByteBuffer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/pty0;->h1:Ll/sqr0;

    .line 5
    .line 6
    const/4 p2, 0x1

    .line 7
    const/4 p3, 0x0

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    and-int/lit8 p1, p8, 0x2

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 15
    .line 16
    .line 17
    invoke-interface {p5, p7, p3}, Ll/bwy0;->e(IZ)V

    .line 18
    .line 19
    .line 20
    return p2

    .line 21
    :cond_0
    if-eqz p12, :cond_2

    .line 22
    .line 23
    if-eqz p5, :cond_1

    .line 24
    .line 25
    invoke-interface {p5, p7, p3}, Ll/bwy0;->e(IZ)V

    .line 26
    .line 27
    .line 28
    :cond_1
    iget-object p1, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 29
    .line 30
    iget p3, p1, Ll/vwx0;->f:I

    .line 31
    .line 32
    add-int/2addr p3, p9

    .line 33
    iput p3, p1, Ll/vwx0;->f:I

    .line 34
    .line 35
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 36
    .line 37
    invoke-interface {p0}, Ll/kry0;->zzg()V

    .line 38
    .line 39
    .line 40
    return p2

    .line 41
    :cond_2
    :try_start_0
    iget-object p1, p0, Ll/pty0;->c1:Ll/kry0;

    .line 42
    .line 43
    invoke-interface {p1, p6, p10, p11, p9}, Ll/kry0;->d(Ljava/nio/ByteBuffer;JI)Z

    .line 44
    .line 45
    .line 46
    move-result p1
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzpx; {:try_start_0 .. :try_end_0} :catch_1
    .catch Lcom/google/android/gms/internal/ads/zzqa; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    if-eqz p5, :cond_3

    .line 50
    .line 51
    invoke-interface {p5, p7, p3}, Ll/bwy0;->e(IZ)V

    .line 52
    .line 53
    .line 54
    :cond_3
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 55
    .line 56
    iget p1, p0, Ll/vwx0;->e:I

    .line 57
    .line 58
    add-int/2addr p1, p9

    .line 59
    iput p1, p0, Ll/vwx0;->e:I

    .line 60
    .line 61
    return p2

    .line 62
    :cond_4
    return p3

    .line 63
    :catch_0
    move-exception p1

    .line 64
    goto :goto_0

    .line 65
    :catch_1
    move-exception p1

    .line 66
    goto :goto_2

    .line 67
    :goto_0
    invoke-virtual {p0}, Ll/kwy0;->b0()Z

    .line 68
    .line 69
    .line 70
    move-result p2

    .line 71
    if-nez p2, :cond_5

    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_5
    invoke-virtual {p0}, Ll/qwx0;->N()Ll/dfy0;

    .line 75
    .line 76
    .line 77
    :goto_1
    iget-boolean p2, p1, Lcom/google/android/gms/internal/ads/zzqa;->zzb:Z

    .line 78
    .line 79
    const/16 p3, 0x138a

    .line 80
    .line 81
    invoke-virtual {p0, p1, p14, p2, p3}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    throw p0

    .line 86
    :goto_2
    iget-object p2, p0, Ll/pty0;->g1:Ll/sqr0;

    .line 87
    .line 88
    iget-boolean p3, p1, Lcom/google/android/gms/internal/ads/zzpx;->zzb:Z

    .line 89
    .line 90
    const/16 p4, 0x1389

    .line 91
    .line 92
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/qwx0;->M(Ljava/lang/Throwable;Ll/sqr0;ZI)Lcom/google/android/gms/internal/ads/zziz;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    throw p0
.end method

.method public final H0(Ll/sqr0;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/qwx0;->N()Ll/dfy0;

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 5
    .line 6
    invoke-interface {p0, p1}, Ll/kry0;->c(Ll/sqr0;)Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    return p0
.end method

.method public final P()V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pty0;->k1:Z

    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/pty0;->g1:Ll/sqr0;

    .line 6
    .line 7
    :try_start_0
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 8
    .line 9
    invoke-interface {v0}, Ll/kry0;->zzf()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    .line 12
    :try_start_1
    invoke-super {p0}, Ll/kwy0;->P()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 16
    .line 17
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/fqy0;->g(Ll/vwx0;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    goto :goto_0

    .line 25
    :catchall_1
    move-exception v0

    .line 26
    :try_start_2
    invoke-super {p0}, Ll/kwy0;->P()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 27
    .line 28
    .line 29
    iget-object v1, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 30
    .line 31
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 32
    .line 33
    invoke-virtual {v1, p0}, Ll/fqy0;->g(Ll/vwx0;)V

    .line 34
    .line 35
    .line 36
    throw v0

    .line 37
    :goto_0
    iget-object v1, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 38
    .line 39
    iget-object p0, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 40
    .line 41
    invoke-virtual {v1, p0}, Ll/fqy0;->g(Ll/vwx0;)V

    .line 42
    .line 43
    .line 44
    throw v0
.end method

.method public final Q(ZZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2}, Ll/kwy0;->Q(ZZ)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 5
    .line 6
    iget-object p2, p0, Ll/kwy0;->T0:Ll/vwx0;

    .line 7
    .line 8
    invoke-virtual {p1, p2}, Ll/fqy0;->h(Ll/vwx0;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/qwx0;->N()Ll/dfy0;

    .line 12
    .line 13
    .line 14
    iget-object p1, p0, Ll/pty0;->c1:Ll/kry0;

    .line 15
    .line 16
    invoke-virtual {p0}, Ll/qwx0;->O()Ll/voy0;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-interface {p1, p2}, Ll/kry0;->l(Ll/voy0;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/pty0;->c1:Ll/kry0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/qwx0;->L()Ll/mfv0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p1, p0}, Ll/kry0;->m(Ll/mfv0;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final R0(Ll/hwy0;Ll/sqr0;)I
    .locals 1

    .line 1
    const-string v0, "OMX.google.raw.decoder"

    .line 2
    .line 3
    iget-object p1, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-eqz p1, :cond_1

    .line 10
    .line 11
    sget p1, Ll/mpw0;->a:I

    .line 12
    .line 13
    const/16 v0, 0x18

    .line 14
    .line 15
    if-ge p1, v0, :cond_1

    .line 16
    .line 17
    const/16 v0, 0x17

    .line 18
    .line 19
    if-ne p1, v0, :cond_0

    .line 20
    .line 21
    iget-object p0, p0, Ll/pty0;->a1:Landroid/content/Context;

    .line 22
    .line 23
    invoke-static {p0}, Ll/mpw0;->j(Landroid/content/Context;)Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    :cond_0
    const/4 p0, -0x1

    .line 30
    return p0

    .line 31
    :cond_1
    iget p0, p2, Ll/sqr0;->m:I

    .line 32
    .line 33
    return p0
.end method

.method public final S(JZ)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/kwy0;->S(JZ)V

    .line 2
    .line 3
    .line 4
    iget-object p3, p0, Ll/pty0;->c1:Ll/kry0;

    .line 5
    .line 6
    invoke-interface {p3}, Ll/kry0;->zzf()V

    .line 7
    .line 8
    .line 9
    iput-wide p1, p0, Ll/pty0;->i1:J

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Ll/pty0;->m1:Z

    .line 13
    .line 14
    const/4 p1, 0x1

    .line 15
    iput-boolean p1, p0, Ll/pty0;->j1:Z

    .line 16
    .line 17
    return-void
.end method

.method public final T(FLl/sqr0;[Ll/sqr0;)F
    .locals 2

    .line 1
    const/4 p0, 0x0

    .line 2
    const/4 p2, -0x1

    .line 3
    move v0, p2

    .line 4
    :goto_0
    array-length v1, p3

    .line 5
    if-ge p0, v1, :cond_1

    .line 6
    .line 7
    aget-object v1, p3, p0

    .line 8
    .line 9
    iget v1, v1, Ll/sqr0;->z:I

    .line 10
    .line 11
    if-eq v1, p2, :cond_0

    .line 12
    .line 13
    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    :cond_0
    add-int/lit8 p0, p0, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    if-ne v0, p2, :cond_2

    .line 21
    .line 22
    const/high16 p0, -0x40800000    # -1.0f

    .line 23
    .line 24
    return p0

    .line 25
    :cond_2
    int-to-float p0, v0

    .line 26
    mul-float/2addr p0, p1

    .line 27
    return p0
.end method

.method public final U(Ll/dxy0;Ll/sqr0;)I
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    iget-object v0, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/a8t0;->g(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/16 v1, 0x80

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return v1

    .line 12
    :cond_0
    sget v0, Ll/mpw0;->a:I

    .line 13
    .line 14
    iget v0, p2, Ll/sqr0;->F:I

    .line 15
    .line 16
    invoke-static {p2}, Ll/kwy0;->e0(Ll/sqr0;)Z

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    const/4 v3, 0x0

    .line 21
    const/4 v4, 0x1

    .line 22
    if-eqz v2, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    invoke-static {}, Ll/oxy0;->b()Ll/hwy0;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    move v5, v3

    .line 34
    goto :goto_3

    .line 35
    :cond_2
    :goto_0
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 36
    .line 37
    invoke-interface {v0, p2}, Ll/kry0;->b(Ll/sqr0;)Ll/fpy0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-boolean v5, v0, Ll/fpy0;->a:Z

    .line 42
    .line 43
    if-nez v5, :cond_3

    .line 44
    .line 45
    move v5, v3

    .line 46
    goto :goto_2

    .line 47
    :cond_3
    iget-boolean v5, v0, Ll/fpy0;->b:Z

    .line 48
    .line 49
    if-eq v4, v5, :cond_4

    .line 50
    .line 51
    const/16 v5, 0x200

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_4
    const/16 v5, 0x600

    .line 55
    .line 56
    :goto_1
    iget-boolean v0, v0, Ll/fpy0;->c:Z

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    or-int/lit16 v5, v5, 0x800

    .line 61
    .line 62
    :cond_5
    :goto_2
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 63
    .line 64
    invoke-interface {v0, p2}, Ll/kry0;->c(Ll/sqr0;)Z

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    if-nez v0, :cond_6

    .line 69
    .line 70
    goto :goto_3

    .line 71
    :cond_6
    or-int/lit16 p0, v5, 0xac

    .line 72
    .line 73
    return p0

    .line 74
    :goto_3
    iget-object v0, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 75
    .line 76
    const-string v6, "audio/raw"

    .line 77
    .line 78
    invoke-virtual {v6, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_7

    .line 83
    .line 84
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 85
    .line 86
    invoke-interface {v0, p2}, Ll/kry0;->c(Ll/sqr0;)Z

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    if-nez v0, :cond_7

    .line 91
    .line 92
    goto :goto_4

    .line 93
    :cond_7
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 94
    .line 95
    iget v6, p2, Ll/sqr0;->y:I

    .line 96
    .line 97
    iget v7, p2, Ll/sqr0;->z:I

    .line 98
    .line 99
    const/4 v8, 0x2

    .line 100
    invoke-static {v8, v6, v7}, Ll/mpw0;->N(III)Ll/sqr0;

    .line 101
    .line 102
    .line 103
    move-result-object v6

    .line 104
    invoke-interface {v0, v6}, Ll/kry0;->c(Ll/sqr0;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_8

    .line 109
    .line 110
    goto :goto_4

    .line 111
    :cond_8
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 112
    .line 113
    invoke-static {p1, p2, v3, p0}, Ll/pty0;->S0(Ll/dxy0;Ll/sqr0;ZLl/kry0;)Ljava/util/List;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-interface {p0}, Ljava/util/List;->isEmpty()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_9

    .line 122
    .line 123
    goto :goto_4

    .line 124
    :cond_9
    if-nez v2, :cond_a

    .line 125
    .line 126
    move v4, v8

    .line 127
    :goto_4
    or-int/lit16 p0, v4, 0x80

    .line 128
    .line 129
    return p0

    .line 130
    :cond_a
    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Ll/hwy0;

    .line 135
    .line 136
    invoke-virtual {p1, p2}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    if-nez v0, :cond_c

    .line 141
    .line 142
    move v2, v4

    .line 143
    :goto_5
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 144
    .line 145
    .line 146
    move-result v6

    .line 147
    if-ge v2, v6, :cond_c

    .line 148
    .line 149
    invoke-interface {p0, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object v6

    .line 153
    check-cast v6, Ll/hwy0;

    .line 154
    .line 155
    invoke-virtual {v6, p2}, Ll/hwy0;->e(Ll/sqr0;)Z

    .line 156
    .line 157
    .line 158
    move-result v7

    .line 159
    if-eqz v7, :cond_b

    .line 160
    .line 161
    move p0, v3

    .line 162
    move v0, v4

    .line 163
    move-object p1, v6

    .line 164
    goto :goto_6

    .line 165
    :cond_b
    add-int/lit8 v2, v2, 0x1

    .line 166
    .line 167
    goto :goto_5

    .line 168
    :cond_c
    move p0, v4

    .line 169
    :goto_6
    if-eq v4, v0, :cond_d

    .line 170
    .line 171
    const/4 v2, 0x3

    .line 172
    goto :goto_7

    .line 173
    :cond_d
    const/4 v2, 0x4

    .line 174
    :goto_7
    const/16 v6, 0x8

    .line 175
    .line 176
    if-eqz v0, :cond_e

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Ll/hwy0;->f(Ll/sqr0;)Z

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    if-eqz p2, :cond_e

    .line 183
    .line 184
    const/16 v6, 0x10

    .line 185
    .line 186
    :cond_e
    iget-boolean p1, p1, Ll/hwy0;->g:Z

    .line 187
    .line 188
    if-eq v4, p1, :cond_f

    .line 189
    .line 190
    move p1, v3

    .line 191
    goto :goto_8

    .line 192
    :cond_f
    const/16 p1, 0x40

    .line 193
    .line 194
    :goto_8
    if-eq v4, p0, :cond_10

    .line 195
    .line 196
    move v1, v3

    .line 197
    :cond_10
    or-int p0, v2, v6

    .line 198
    .line 199
    or-int/lit8 p0, p0, 0x20

    .line 200
    .line 201
    or-int/2addr p0, p1

    .line 202
    or-int/2addr p0, v1

    .line 203
    or-int/2addr p0, v5

    .line 204
    return p0
.end method

.method public final W0()V
    .locals 1
    .annotation build Landroidx/annotation/CallSuper;
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/pty0;->j1:Z

    .line 3
    .line 4
    return-void
.end method

.method public final e()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "MediaCodecAudioRenderer"

    .line 2
    .line 3
    return-object p0
.end method

.method public final g(Ll/iet0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/kry0;->o(Ll/iet0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final h0()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/kwy0;->zzV()Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    invoke-interface {v0, v1}, Ll/kry0;->zzb(Z)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    const-wide/high16 v2, -0x8000000000000000L

    .line 12
    .line 13
    cmp-long v2, v0, v2

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    iget-boolean v2, p0, Ll/pty0;->j1:Z

    .line 18
    .line 19
    if-eqz v2, :cond_0

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-wide v2, p0, Ll/pty0;->i1:J

    .line 23
    .line 24
    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    .line 25
    .line 26
    .line 27
    move-result-wide v0

    .line 28
    :goto_0
    iput-wide v0, p0, Ll/pty0;->i1:J

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    iput-boolean v0, p0, Ll/pty0;->j1:Z

    .line 32
    .line 33
    :cond_1
    return-void
.end method

.method public final r()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {v0}, Ll/kry0;->g()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    invoke-super {p0}, Ll/kwy0;->r()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 19
    return p0
.end method

.method public final r0(Ll/hwy0;Ll/sqr0;Ll/sqr0;)Ll/zwx0;
    .locals 8

    .line 1
    invoke-virtual {p1, p2, p3}, Ll/hwy0;->b(Ll/sqr0;Ll/sqr0;)Ll/zwx0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget v1, v0, Ll/zwx0;->e:I

    .line 6
    .line 7
    invoke-virtual {p0, p3}, Ll/kwy0;->c0(Ll/sqr0;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    const v2, 0x8000

    .line 14
    .line 15
    .line 16
    or-int/2addr v1, v2

    .line 17
    :cond_0
    invoke-virtual {p0, p1, p3}, Ll/pty0;->R0(Ll/hwy0;Ll/sqr0;)I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    iget p0, p0, Ll/pty0;->d1:I

    .line 22
    .line 23
    if-le v2, p0, :cond_1

    .line 24
    .line 25
    or-int/lit8 v1, v1, 0x40

    .line 26
    .line 27
    :cond_1
    iget-object v3, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 28
    .line 29
    new-instance v2, Ll/zwx0;

    .line 30
    .line 31
    const/4 p0, 0x0

    .line 32
    if-eqz v1, :cond_2

    .line 33
    .line 34
    move v6, p0

    .line 35
    move v7, v1

    .line 36
    :goto_0
    move-object v4, p2

    .line 37
    move-object v5, p3

    .line 38
    goto :goto_1

    .line 39
    :cond_2
    iget p1, v0, Ll/zwx0;->d:I

    .line 40
    .line 41
    move v7, p0

    .line 42
    move v6, p1

    .line 43
    goto :goto_0

    .line 44
    :goto_1
    invoke-direct/range {v2 .. v7}, Ll/zwx0;-><init>(Ljava/lang/String;Ll/sqr0;Ll/sqr0;II)V

    .line 45
    .line 46
    .line 47
    return-object v2
.end method

.method public final s0(Ll/l9y0;)Ll/zwx0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/l9y0;->a:Ll/sqr0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Ll/pty0;->g1:Ll/sqr0;

    .line 7
    .line 8
    invoke-super {p0, p1}, Ll/kwy0;->s0(Ll/l9y0;)Ll/zwx0;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iget-object p0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 13
    .line 14
    invoke-virtual {p0, v0, p1}, Ll/fqy0;->i(Ll/sqr0;Ll/zwx0;)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public final u(ILjava/lang/Object;)V
    .locals 1
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zziz;
        }
    .end annotation

    .line 1
    const/4 v0, 0x2

    .line 2
    if-eq p1, v0, :cond_3

    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    if-eq p1, v0, :cond_2

    .line 6
    .line 7
    const/4 v0, 0x6

    .line 8
    if-eq p1, v0, :cond_1

    .line 9
    .line 10
    packed-switch p1, :pswitch_data_0

    .line 11
    .line 12
    .line 13
    goto :goto_0

    .line 14
    :pswitch_0
    sget p1, Ll/mpw0;->a:I

    .line 15
    .line 16
    const/16 v0, 0x17

    .line 17
    .line 18
    if-lt p1, v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 21
    .line 22
    invoke-static {p0, p2}, Ll/mty0;->a(Ll/kry0;Ljava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    :goto_0
    return-void

    .line 26
    :pswitch_1
    check-cast p2, Ll/sey0;

    .line 27
    .line 28
    iput-object p2, p0, Ll/pty0;->l1:Ll/sey0;

    .line 29
    .line 30
    return-void

    .line 31
    :pswitch_2
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 32
    .line 33
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    .line 35
    .line 36
    check-cast p2, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    invoke-interface {p0, p1}, Ll/kry0;->zzm(I)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_3
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    .line 50
    .line 51
    check-cast p2, Ljava/lang/Boolean;

    .line 52
    .line 53
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    invoke-interface {p0, p1}, Ll/kry0;->h(Z)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_1
    check-cast p2, Ll/z8y0;

    .line 62
    .line 63
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 64
    .line 65
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 66
    .line 67
    .line 68
    invoke-interface {p0, p2}, Ll/kry0;->k(Ll/z8y0;)V

    .line 69
    .line 70
    .line 71
    return-void

    .line 72
    :cond_2
    check-cast p2, Ll/w3y0;

    .line 73
    .line 74
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 75
    .line 76
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 77
    .line 78
    .line 79
    invoke-interface {p0, p2}, Ll/kry0;->n(Ll/w3y0;)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 84
    .line 85
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    .line 87
    .line 88
    check-cast p2, Ljava/lang/Float;

    .line 89
    .line 90
    invoke-virtual {p2}, Ljava/lang/Float;->floatValue()F

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    invoke-interface {p0, p1}, Ll/kry0;->i(F)V

    .line 95
    .line 96
    .line 97
    return-void

    .line 98
    nop

    .line 99
    :pswitch_data_0
    .packed-switch 0x9
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final v0(Ll/hwy0;Ll/sqr0;Landroid/media/MediaCrypto;F)Ll/xvy0;
    .locals 7
    .param p3    # Landroid/media/MediaCrypto;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/qwx0;->F()[Ll/sqr0;

    .line 2
    .line 3
    .line 4
    move-result-object p3

    .line 5
    array-length v0, p3

    .line 6
    invoke-virtual {p0, p1, p2}, Ll/pty0;->R0(Ll/hwy0;Ll/sqr0;)I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v2, 0x0

    .line 11
    const/4 v3, 0x1

    .line 12
    if-ne v0, v3, :cond_0

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_0
    move v4, v2

    .line 16
    :goto_0
    if-ge v4, v0, :cond_2

    .line 17
    .line 18
    aget-object v5, p3, v4

    .line 19
    .line 20
    invoke-virtual {p1, p2, v5}, Ll/hwy0;->b(Ll/sqr0;Ll/sqr0;)Ll/zwx0;

    .line 21
    .line 22
    .line 23
    move-result-object v6

    .line 24
    iget v6, v6, Ll/zwx0;->d:I

    .line 25
    .line 26
    if-eqz v6, :cond_1

    .line 27
    .line 28
    invoke-virtual {p0, p1, v5}, Ll/pty0;->R0(Ll/hwy0;Ll/sqr0;)I

    .line 29
    .line 30
    .line 31
    move-result v5

    .line 32
    invoke-static {v1, v5}, Ljava/lang/Math;->max(II)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    :goto_1
    iput v1, p0, Ll/pty0;->d1:I

    .line 40
    .line 41
    iget-object p3, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 42
    .line 43
    sget v0, Ll/mpw0;->a:I

    .line 44
    .line 45
    const/16 v1, 0x18

    .line 46
    .line 47
    if-ge v0, v1, :cond_4

    .line 48
    .line 49
    const-string v4, "OMX.SEC.aac.dec"

    .line 50
    .line 51
    invoke-virtual {v4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result p3

    .line 55
    if-eqz p3, :cond_4

    .line 56
    .line 57
    const-string p3, "samsung"

    .line 58
    .line 59
    sget-object v4, Ll/mpw0;->c:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 62
    .line 63
    .line 64
    move-result p3

    .line 65
    if-eqz p3, :cond_4

    .line 66
    .line 67
    sget-object p3, Ll/mpw0;->b:Ljava/lang/String;

    .line 68
    .line 69
    const-string v4, "zeroflte"

    .line 70
    .line 71
    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 72
    .line 73
    .line 74
    move-result v4

    .line 75
    if-nez v4, :cond_3

    .line 76
    .line 77
    const-string v4, "herolte"

    .line 78
    .line 79
    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 80
    .line 81
    .line 82
    move-result v4

    .line 83
    if-nez v4, :cond_3

    .line 84
    .line 85
    const-string v4, "heroqlte"

    .line 86
    .line 87
    invoke-virtual {p3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 88
    .line 89
    .line 90
    move-result p3

    .line 91
    if-eqz p3, :cond_4

    .line 92
    .line 93
    :cond_3
    move p3, v3

    .line 94
    goto :goto_2

    .line 95
    :cond_4
    move p3, v2

    .line 96
    :goto_2
    iput-boolean p3, p0, Ll/pty0;->e1:Z

    .line 97
    .line 98
    iget-object p3, p1, Ll/hwy0;->a:Ljava/lang/String;

    .line 99
    .line 100
    const-string v4, "OMX.google.opus.decoder"

    .line 101
    .line 102
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    move-result v4

    .line 106
    if-nez v4, :cond_5

    .line 107
    .line 108
    const-string v4, "c2.android.opus.decoder"

    .line 109
    .line 110
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 111
    .line 112
    .line 113
    move-result v4

    .line 114
    if-nez v4, :cond_5

    .line 115
    .line 116
    const-string v4, "OMX.google.vorbis.decoder"

    .line 117
    .line 118
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 119
    .line 120
    .line 121
    move-result v4

    .line 122
    if-nez v4, :cond_5

    .line 123
    .line 124
    const-string v4, "c2.android.vorbis.decoder"

    .line 125
    .line 126
    invoke-virtual {p3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result p3

    .line 130
    if-eqz p3, :cond_6

    .line 131
    .line 132
    :cond_5
    move p3, v3

    .line 133
    goto :goto_3

    .line 134
    :cond_6
    move p3, v2

    .line 135
    :goto_3
    iput-boolean p3, p0, Ll/pty0;->f1:Z

    .line 136
    .line 137
    iget-object p3, p1, Ll/hwy0;->c:Ljava/lang/String;

    .line 138
    .line 139
    iget v4, p0, Ll/pty0;->d1:I

    .line 140
    .line 141
    new-instance v5, Landroid/media/MediaFormat;

    .line 142
    .line 143
    invoke-direct {v5}, Landroid/media/MediaFormat;-><init>()V

    .line 144
    .line 145
    .line 146
    const-string v6, "mime"

    .line 147
    .line 148
    invoke-virtual {v5, v6, p3}, Landroid/media/MediaFormat;->setString(Ljava/lang/String;Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    iget p3, p2, Ll/sqr0;->y:I

    .line 152
    .line 153
    const-string v6, "channel-count"

    .line 154
    .line 155
    invoke-virtual {v5, v6, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 156
    .line 157
    .line 158
    iget p3, p2, Ll/sqr0;->z:I

    .line 159
    .line 160
    const-string v6, "sample-rate"

    .line 161
    .line 162
    invoke-virtual {v5, v6, p3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 163
    .line 164
    .line 165
    iget-object p3, p2, Ll/sqr0;->n:Ljava/util/List;

    .line 166
    .line 167
    invoke-static {v5, p3}, Ll/g8w0;->b(Landroid/media/MediaFormat;Ljava/util/List;)V

    .line 168
    .line 169
    .line 170
    const-string p3, "max-input-size"

    .line 171
    .line 172
    invoke-static {v5, p3, v4}, Ll/g8w0;->a(Landroid/media/MediaFormat;Ljava/lang/String;I)V

    .line 173
    .line 174
    .line 175
    const/16 p3, 0x17

    .line 176
    .line 177
    if-lt v0, p3, :cond_8

    .line 178
    .line 179
    const-string v4, "priority"

    .line 180
    .line 181
    invoke-virtual {v5, v4, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 182
    .line 183
    .line 184
    const/high16 v2, -0x40800000    # -1.0f

    .line 185
    .line 186
    cmpl-float v2, p4, v2

    .line 187
    .line 188
    if-eqz v2, :cond_8

    .line 189
    .line 190
    if-ne v0, p3, :cond_7

    .line 191
    .line 192
    sget-object p3, Ll/mpw0;->d:Ljava/lang/String;

    .line 193
    .line 194
    const-string v2, "ZTE B2017G"

    .line 195
    .line 196
    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v2

    .line 200
    if-nez v2, :cond_8

    .line 201
    .line 202
    const-string v2, "AXON 7 mini"

    .line 203
    .line 204
    invoke-virtual {v2, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 205
    .line 206
    .line 207
    move-result p3

    .line 208
    if-nez p3, :cond_8

    .line 209
    .line 210
    :cond_7
    const-string p3, "operating-rate"

    .line 211
    .line 212
    invoke-virtual {v5, p3, p4}, Landroid/media/MediaFormat;->setFloat(Ljava/lang/String;F)V

    .line 213
    .line 214
    .line 215
    :cond_8
    const/16 p3, 0x1c

    .line 216
    .line 217
    if-gt v0, p3, :cond_9

    .line 218
    .line 219
    iget-object p3, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 220
    .line 221
    const-string p4, "audio/ac4"

    .line 222
    .line 223
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 224
    .line 225
    .line 226
    move-result p3

    .line 227
    if-eqz p3, :cond_9

    .line 228
    .line 229
    const-string p3, "ac4-is-sync"

    .line 230
    .line 231
    invoke-virtual {v5, p3, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 232
    .line 233
    .line 234
    :cond_9
    if-lt v0, v1, :cond_a

    .line 235
    .line 236
    iget-object p3, p0, Ll/pty0;->c1:Ll/kry0;

    .line 237
    .line 238
    iget p4, p2, Ll/sqr0;->y:I

    .line 239
    .line 240
    iget v1, p2, Ll/sqr0;->z:I

    .line 241
    .line 242
    const/4 v2, 0x4

    .line 243
    invoke-static {v2, p4, v1}, Ll/mpw0;->N(III)Ll/sqr0;

    .line 244
    .line 245
    .line 246
    move-result-object p4

    .line 247
    invoke-interface {p3, p4}, Ll/kry0;->a(Ll/sqr0;)I

    .line 248
    .line 249
    .line 250
    move-result p3

    .line 251
    const/4 p4, 0x2

    .line 252
    if-ne p3, p4, :cond_a

    .line 253
    .line 254
    const-string p3, "pcm-encoding"

    .line 255
    .line 256
    invoke-virtual {v5, p3, v2}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 257
    .line 258
    .line 259
    :cond_a
    const/16 p3, 0x20

    .line 260
    .line 261
    if-lt v0, p3, :cond_b

    .line 262
    .line 263
    const-string p3, "max-output-channel-count"

    .line 264
    .line 265
    const/16 p4, 0x63

    .line 266
    .line 267
    invoke-virtual {v5, p3, p4}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 268
    .line 269
    .line 270
    :cond_b
    iget-object p3, p1, Ll/hwy0;->b:Ljava/lang/String;

    .line 271
    .line 272
    const-string p4, "audio/raw"

    .line 273
    .line 274
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result p3

    .line 278
    const/4 v0, 0x0

    .line 279
    if-eqz p3, :cond_c

    .line 280
    .line 281
    iget-object p3, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 282
    .line 283
    invoke-virtual {p4, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 284
    .line 285
    .line 286
    move-result p3

    .line 287
    if-nez p3, :cond_c

    .line 288
    .line 289
    move-object p3, p2

    .line 290
    goto :goto_4

    .line 291
    :cond_c
    move-object p3, v0

    .line 292
    :goto_4
    iput-object p3, p0, Ll/pty0;->h1:Ll/sqr0;

    .line 293
    .line 294
    invoke-static {p1, v5, p2, v0}, Ll/xvy0;->a(Ll/hwy0;Landroid/media/MediaFormat;Ll/sqr0;Landroid/media/MediaCrypto;)Ll/xvy0;

    .line 295
    .line 296
    .line 297
    move-result-object p0

    .line 298
    return-object p0
.end method

.method public final w0(Ll/dxy0;Ll/sqr0;Z)Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzth;
        }
    .end annotation

    .line 1
    const/4 p3, 0x0

    .line 2
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 3
    .line 4
    invoke-static {p1, p2, p3, p0}, Ll/pty0;->S0(Ll/dxy0;Ll/sqr0;ZLl/kry0;)Ljava/util/List;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0, p2}, Ll/oxy0;->g(Ljava/util/List;Ll/sqr0;)Ljava/util/List;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final y0(Ll/evx0;)V
    .locals 4

    .line 1
    sget v0, Ll/mpw0;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1d

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    iget-object v0, p1, Ll/evx0;->b:Ll/sqr0;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object v0, v0, Ll/sqr0;->l:Ljava/lang/String;

    .line 12
    .line 13
    const-string v1, "audio/opus"

    .line 14
    .line 15
    invoke-static {v0, v1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/kwy0;->b0()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object v0, p1, Ll/evx0;->g:Ljava/nio/ByteBuffer;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    .line 31
    .line 32
    iget-object p1, p1, Ll/evx0;->b:Ll/sqr0;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v0}, Ljava/nio/Buffer;->remaining()I

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    const/16 v2, 0x8

    .line 42
    .line 43
    if-ne v1, v2, :cond_0

    .line 44
    .line 45
    iget p1, p1, Ll/sqr0;->B:I

    .line 46
    .line 47
    sget-object v1, Ljava/nio/ByteOrder;->LITTLE_ENDIAN:Ljava/nio/ByteOrder;

    .line 48
    .line 49
    invoke-virtual {v0, v1}, Ljava/nio/ByteBuffer;->order(Ljava/nio/ByteOrder;)Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->getLong()J

    .line 54
    .line 55
    .line 56
    move-result-wide v0

    .line 57
    const-wide/32 v2, 0xbb80

    .line 58
    .line 59
    .line 60
    mul-long/2addr v0, v2

    .line 61
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 62
    .line 63
    const-wide/32 v2, 0x3b9aca00

    .line 64
    .line 65
    .line 66
    div-long/2addr v0, v2

    .line 67
    long-to-int v0, v0

    .line 68
    invoke-interface {p0, p1, v0}, Ll/kry0;->j(II)V

    .line 69
    .line 70
    .line 71
    :cond_0
    return-void
.end method

.method public final z()V
    .locals 0

    .line 1
    return-void
.end method

.method public final z0(Ljava/lang/Exception;)V
    .locals 2

    .line 1
    const-string v0, "MediaCodecAudioRenderer"

    .line 2
    .line 3
    const-string v1, "Audio codec error"

    .line 4
    .line 5
    invoke-static {v0, v1, p1}, Ll/y4w0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    iget-object p0, p0, Ll/pty0;->b1:Ll/fqy0;

    .line 9
    .line 10
    invoke-virtual {p0, p1}, Ll/fqy0;->a(Ljava/lang/Exception;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public final zzV()Z
    .locals 1

    .line 1
    invoke-super {p0}, Ll/kwy0;->zzV()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/kry0;->r()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final zza()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/qwx0;->s()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x2

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/pty0;->h0()V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-wide v0, p0, Ll/pty0;->i1:J

    .line 12
    .line 13
    return-wide v0
.end method

.method public final zzc()Ll/iet0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/pty0;->c1:Ll/kry0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/kry0;->zzc()Ll/iet0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final zzj()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/pty0;->m1:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    iput-boolean v1, p0, Ll/pty0;->m1:Z

    .line 5
    .line 6
    return v0
.end method

.method public final zzk()Ll/kay0;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    return-object p0
.end method
