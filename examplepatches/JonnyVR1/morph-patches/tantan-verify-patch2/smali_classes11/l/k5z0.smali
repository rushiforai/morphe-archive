.class public final Ll/k5z0;
.super Ll/h5z0;
.source "SourceFile"


# instance fields
.field public final e:Z

.field public final f:Ll/h4z0;

.field public final g:Z

.field public final h:Z

.field public final i:I

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:Z

.field public final n:I

.field public final o:Z

.field public final p:Z

.field public final q:I


# direct methods
.method public constructor <init>(ILl/t2u0;ILl/h4z0;IIZ)V
    .locals 2

    .line 1
    const/4 p3, 0x0

    .line 2
    invoke-direct {p0, p1, p2, p3}, Ll/h5z0;-><init>(ILl/t2u0;I)V

    .line 3
    .line 4
    .line 5
    iput-object p4, p0, Ll/k5z0;->f:Ll/h4z0;

    .line 6
    .line 7
    iget-boolean p1, p4, Ll/h4z0;->m0:Z

    .line 8
    .line 9
    const/4 p2, 0x1

    .line 10
    if-eq p2, p1, :cond_0

    .line 11
    .line 12
    const/16 p1, 0x10

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/16 p1, 0x18

    .line 16
    .line 17
    :goto_0
    const/high16 p6, -0x40800000    # -1.0f

    .line 18
    .line 19
    if-eqz p7, :cond_1

    .line 20
    .line 21
    iget-object v0, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 22
    .line 23
    iget v1, v0, Ll/sqr0;->q:I

    .line 24
    .line 25
    iget v0, v0, Ll/sqr0;->s:F

    .line 26
    .line 27
    cmpl-float v1, v0, p6

    .line 28
    .line 29
    if-eqz v1, :cond_2

    .line 30
    .line 31
    const/high16 v1, 0x4f000000

    .line 32
    .line 33
    cmpg-float v0, v0, v1

    .line 34
    .line 35
    if-gtz v0, :cond_1

    .line 36
    .line 37
    goto :goto_1

    .line 38
    :cond_1
    move v0, p3

    .line 39
    goto :goto_2

    .line 40
    :cond_2
    :goto_1
    move v0, p2

    .line 41
    :goto_2
    iput-boolean v0, p0, Ll/k5z0;->e:Z

    .line 42
    .line 43
    const/4 v0, -0x1

    .line 44
    if-eqz p7, :cond_3

    .line 45
    .line 46
    iget-object p7, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 47
    .line 48
    iget v1, p7, Ll/sqr0;->q:I

    .line 49
    .line 50
    if-eq v1, v0, :cond_4

    .line 51
    .line 52
    if-ltz v1, :cond_3

    .line 53
    .line 54
    goto :goto_3

    .line 55
    :cond_3
    move p6, p3

    .line 56
    goto :goto_4

    .line 57
    :cond_4
    :goto_3
    iget v1, p7, Ll/sqr0;->r:I

    .line 58
    .line 59
    if-eq v1, v0, :cond_5

    .line 60
    .line 61
    if-ltz v1, :cond_3

    .line 62
    .line 63
    :cond_5
    iget v1, p7, Ll/sqr0;->s:F

    .line 64
    .line 65
    cmpl-float p6, v1, p6

    .line 66
    .line 67
    if-eqz p6, :cond_6

    .line 68
    .line 69
    const/4 p6, 0x0

    .line 70
    cmpl-float p6, v1, p6

    .line 71
    .line 72
    if-ltz p6, :cond_3

    .line 73
    .line 74
    :cond_6
    iget p6, p7, Ll/sqr0;->h:I

    .line 75
    .line 76
    if-eq p6, v0, :cond_7

    .line 77
    .line 78
    if-ltz p6, :cond_3

    .line 79
    .line 80
    :cond_7
    move p6, p2

    .line 81
    :goto_4
    iput-boolean p6, p0, Ll/k5z0;->g:Z

    .line 82
    .line 83
    invoke-static {p5, p3}, Ll/l5z0;->t(IZ)Z

    .line 84
    .line 85
    .line 86
    move-result p6

    .line 87
    iput-boolean p6, p0, Ll/k5z0;->h:Z

    .line 88
    .line 89
    iget-object p6, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 90
    .line 91
    iget p7, p6, Ll/sqr0;->h:I

    .line 92
    .line 93
    iput p7, p0, Ll/k5z0;->i:I

    .line 94
    .line 95
    invoke-virtual {p6}, Ll/sqr0;->a()I

    .line 96
    .line 97
    .line 98
    move-result p6

    .line 99
    iput p6, p0, Ll/k5z0;->j:I

    .line 100
    .line 101
    iget-object p6, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 102
    .line 103
    iget p6, p6, Ll/sqr0;->e:I

    .line 104
    .line 105
    invoke-static {p6, p3}, Ll/l5z0;->k(II)I

    .line 106
    .line 107
    .line 108
    move-result p6

    .line 109
    iput p6, p0, Ll/k5z0;->l:I

    .line 110
    .line 111
    iget-object p6, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 112
    .line 113
    iget p6, p6, Ll/sqr0;->e:I

    .line 114
    .line 115
    if-eqz p6, :cond_8

    .line 116
    .line 117
    and-int/2addr p6, p2

    .line 118
    if-eqz p6, :cond_9

    .line 119
    .line 120
    :cond_8
    move p6, p2

    .line 121
    goto :goto_5

    .line 122
    :cond_9
    move p6, p3

    .line 123
    :goto_5
    iput-boolean p6, p0, Ll/k5z0;->m:Z

    .line 124
    .line 125
    move p6, p3

    .line 126
    :goto_6
    iget-object p7, p4, Ll/scu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 127
    .line 128
    invoke-virtual {p7}, Ljava/util/AbstractCollection;->size()I

    .line 129
    .line 130
    .line 131
    move-result p7

    .line 132
    if-ge p6, p7, :cond_b

    .line 133
    .line 134
    iget-object p7, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 135
    .line 136
    iget-object p7, p7, Ll/sqr0;->l:Ljava/lang/String;

    .line 137
    .line 138
    if-eqz p7, :cond_a

    .line 139
    .line 140
    iget-object v1, p4, Ll/scu0;->l:Lcom/google/android/gms/internal/ads/zzgaa;

    .line 141
    .line 142
    invoke-interface {v1, p6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {p7, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result p7

    .line 150
    if-eqz p7, :cond_a

    .line 151
    .line 152
    goto :goto_7

    .line 153
    :cond_a
    add-int/lit8 p6, p6, 0x1

    .line 154
    .line 155
    goto :goto_6

    .line 156
    :cond_b
    const p6, 0x7fffffff

    .line 157
    .line 158
    .line 159
    :goto_7
    iput p6, p0, Ll/k5z0;->k:I

    .line 160
    .line 161
    and-int/lit16 p4, p5, 0x180

    .line 162
    .line 163
    const/16 p6, 0x80

    .line 164
    .line 165
    if-ne p4, p6, :cond_c

    .line 166
    .line 167
    move p4, p2

    .line 168
    goto :goto_8

    .line 169
    :cond_c
    move p4, p3

    .line 170
    :goto_8
    iput-boolean p4, p0, Ll/k5z0;->o:Z

    .line 171
    .line 172
    and-int/lit8 p4, p5, 0x40

    .line 173
    .line 174
    const/16 p6, 0x40

    .line 175
    .line 176
    if-ne p4, p6, :cond_d

    .line 177
    .line 178
    move p4, p2

    .line 179
    goto :goto_9

    .line 180
    :cond_d
    move p4, p3

    .line 181
    :goto_9
    iput-boolean p4, p0, Ll/k5z0;->p:Z

    .line 182
    .line 183
    iget-object p4, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 184
    .line 185
    iget-object p6, p4, Ll/sqr0;->l:Ljava/lang/String;

    .line 186
    .line 187
    const/4 p7, 0x2

    .line 188
    if-nez p6, :cond_f

    .line 189
    .line 190
    :cond_e
    :goto_a
    move p6, p3

    .line 191
    goto :goto_b

    .line 192
    :cond_f
    invoke-virtual {p6}, Ljava/lang/String;->hashCode()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    sparse-switch v1, :sswitch_data_0

    .line 197
    .line 198
    .line 199
    goto :goto_a

    .line 200
    :sswitch_0
    const-string v1, "video/x-vnd.on2.vp9"

    .line 201
    .line 202
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 203
    .line 204
    .line 205
    move-result p6

    .line 206
    if-eqz p6, :cond_e

    .line 207
    .line 208
    move p6, p7

    .line 209
    goto :goto_b

    .line 210
    :sswitch_1
    const-string v1, "video/avc"

    .line 211
    .line 212
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 213
    .line 214
    .line 215
    move-result p6

    .line 216
    if-eqz p6, :cond_e

    .line 217
    .line 218
    move p6, p2

    .line 219
    goto :goto_b

    .line 220
    :sswitch_2
    const-string v1, "video/hevc"

    .line 221
    .line 222
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 223
    .line 224
    .line 225
    move-result p6

    .line 226
    if-eqz p6, :cond_e

    .line 227
    .line 228
    const/4 p6, 0x3

    .line 229
    goto :goto_b

    .line 230
    :sswitch_3
    const-string v1, "video/av01"

    .line 231
    .line 232
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 233
    .line 234
    .line 235
    move-result p6

    .line 236
    if-eqz p6, :cond_e

    .line 237
    .line 238
    const/4 p6, 0x4

    .line 239
    goto :goto_b

    .line 240
    :sswitch_4
    const-string v1, "video/dolby-vision"

    .line 241
    .line 242
    invoke-virtual {p6, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 243
    .line 244
    .line 245
    move-result p6

    .line 246
    if-eqz p6, :cond_e

    .line 247
    .line 248
    const/4 p6, 0x5

    .line 249
    :goto_b
    iput p6, p0, Ll/k5z0;->q:I

    .line 250
    .line 251
    iget p6, p4, Ll/sqr0;->e:I

    .line 252
    .line 253
    and-int/lit16 p6, p6, 0x4000

    .line 254
    .line 255
    if-eqz p6, :cond_10

    .line 256
    .line 257
    goto :goto_c

    .line 258
    :cond_10
    iget-object p6, p0, Ll/k5z0;->f:Ll/h4z0;

    .line 259
    .line 260
    iget-boolean v1, p6, Ll/h4z0;->v0:Z

    .line 261
    .line 262
    invoke-static {p5, v1}, Ll/l5z0;->t(IZ)Z

    .line 263
    .line 264
    .line 265
    move-result v1

    .line 266
    if-nez v1, :cond_11

    .line 267
    .line 268
    goto :goto_c

    .line 269
    :cond_11
    iget-boolean v1, p0, Ll/k5z0;->e:Z

    .line 270
    .line 271
    if-nez v1, :cond_12

    .line 272
    .line 273
    iget-boolean p6, p6, Ll/h4z0;->k0:Z

    .line 274
    .line 275
    if-nez p6, :cond_12

    .line 276
    .line 277
    goto :goto_c

    .line 278
    :cond_12
    invoke-static {p5, p3}, Ll/l5z0;->t(IZ)Z

    .line 279
    .line 280
    .line 281
    move-result p3

    .line 282
    if-eqz p3, :cond_13

    .line 283
    .line 284
    iget-boolean p3, p0, Ll/k5z0;->g:Z

    .line 285
    .line 286
    if-eqz p3, :cond_13

    .line 287
    .line 288
    if-eqz v1, :cond_13

    .line 289
    .line 290
    iget p3, p4, Ll/sqr0;->h:I

    .line 291
    .line 292
    if-eq p3, v0, :cond_13

    .line 293
    .line 294
    and-int/2addr p1, p5

    .line 295
    if-eqz p1, :cond_13

    .line 296
    .line 297
    move p3, p7

    .line 298
    goto :goto_c

    .line 299
    :cond_13
    move p3, p2

    .line 300
    :goto_c
    iput p3, p0, Ll/k5z0;->n:I

    .line 301
    .line 302
    return-void

    .line 303
    :sswitch_data_0
    .sparse-switch
        -0x6e5534ef -> :sswitch_4
        -0x631b55f6 -> :sswitch_3
        -0x63185e82 -> :sswitch_2
        0x4f62373a -> :sswitch_1
        0x5f50bed9 -> :sswitch_0
    .end sparse-switch
.end method

.method public static synthetic f(Ll/k5z0;Ll/k5z0;)I
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/k5z0;->e:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/k5z0;->h:Z

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/l5z0;->n()Lcom/google/android/gms/internal/ads/c3;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    invoke-static {}, Ll/l5z0;->n()Lcom/google/android/gms/internal/ads/c3;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/c3;->zza()Lcom/google/android/gms/internal/ads/c3;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    :goto_0
    invoke-static {}, Ll/gqw0;->j()Ll/gqw0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    iget v2, p0, Ll/k5z0;->i:I

    .line 27
    .line 28
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    iget v3, p1, Ll/k5z0;->i:I

    .line 33
    .line 34
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    iget-object v4, p0, Ll/k5z0;->f:Ll/h4z0;

    .line 39
    .line 40
    iget-boolean v4, v4, Ll/scu0;->y:Z

    .line 41
    .line 42
    invoke-static {}, Ll/l5z0;->o()Lcom/google/android/gms/internal/ads/c3;

    .line 43
    .line 44
    .line 45
    move-result-object v4

    .line 46
    invoke-virtual {v1, v2, v3, v4}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    iget v2, p0, Ll/k5z0;->j:I

    .line 51
    .line 52
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 53
    .line 54
    .line 55
    move-result-object v2

    .line 56
    iget v3, p1, Ll/k5z0;->j:I

    .line 57
    .line 58
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    invoke-virtual {v1, v2, v3, v0}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    iget p0, p0, Ll/k5z0;->i:I

    .line 67
    .line 68
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    iget p1, p1, Ll/k5z0;->i:I

    .line 73
    .line 74
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    invoke-virtual {v1, p0, p1, v0}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ll/gqw0;->a()I

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    return p0
.end method

.method public static synthetic g(Ll/k5z0;Ll/k5z0;)I
    .locals 4

    .line 1
    invoke-static {}, Ll/gqw0;->j()Ll/gqw0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-boolean v1, p0, Ll/k5z0;->h:Z

    .line 6
    .line 7
    iget-boolean v2, p1, Ll/k5z0;->h:Z

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget v1, p0, Ll/k5z0;->l:I

    .line 14
    .line 15
    iget v2, p1, Ll/k5z0;->l:I

    .line 16
    .line 17
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-boolean v1, p0, Ll/k5z0;->m:Z

    .line 22
    .line 23
    iget-boolean v2, p1, Ll/k5z0;->m:Z

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-boolean v1, p0, Ll/k5z0;->e:Z

    .line 30
    .line 31
    iget-boolean v2, p1, Ll/k5z0;->e:Z

    .line 32
    .line 33
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    iget-boolean v1, p0, Ll/k5z0;->g:Z

    .line 38
    .line 39
    iget-boolean v2, p1, Ll/k5z0;->g:Z

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget v1, p0, Ll/k5z0;->k:I

    .line 46
    .line 47
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    iget v2, p1, Ll/k5z0;->k:I

    .line 52
    .line 53
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 54
    .line 55
    .line 56
    move-result-object v2

    .line 57
    invoke-static {}, Lcom/google/android/gms/internal/ads/c3;->zzc()Lcom/google/android/gms/internal/ads/c3;

    .line 58
    .line 59
    .line 60
    move-result-object v3

    .line 61
    invoke-virtual {v3}, Lcom/google/android/gms/internal/ads/c3;->zza()Lcom/google/android/gms/internal/ads/c3;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v0, v1, v2, v3}, Ll/gqw0;->d(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Ll/gqw0;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    iget-boolean v1, p0, Ll/k5z0;->o:Z

    .line 70
    .line 71
    iget-boolean v2, p1, Ll/k5z0;->o:Z

    .line 72
    .line 73
    invoke-virtual {v0, v1, v2}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    iget-boolean v2, p0, Ll/k5z0;->p:Z

    .line 78
    .line 79
    iget-boolean v3, p1, Ll/k5z0;->p:Z

    .line 80
    .line 81
    invoke-virtual {v0, v2, v3}, Ll/gqw0;->e(ZZ)Ll/gqw0;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    if-eqz v1, :cond_0

    .line 86
    .line 87
    if-eqz v2, :cond_0

    .line 88
    .line 89
    iget p0, p0, Ll/k5z0;->q:I

    .line 90
    .line 91
    iget p1, p1, Ll/k5z0;->q:I

    .line 92
    .line 93
    invoke-virtual {v0, p0, p1}, Ll/gqw0;->b(II)Ll/gqw0;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    :cond_0
    invoke-virtual {v0}, Ll/gqw0;->a()I

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    return p0
.end method


# virtual methods
.method public final a()I
    .locals 0

    .line 1
    iget p0, p0, Ll/k5z0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public final bridge synthetic b(Ll/h5z0;)Z
    .locals 2

    .line 1
    check-cast p1, Ll/k5z0;

    .line 2
    .line 3
    iget-object v0, p0, Ll/h5z0;->d:Ll/sqr0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/sqr0;->l:Ljava/lang/String;

    .line 6
    .line 7
    iget-object v1, p1, Ll/h5z0;->d:Ll/sqr0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/sqr0;->l:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, v1}, Ll/mpw0;->f(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    iget-object v0, p0, Ll/k5z0;->f:Ll/h4z0;

    .line 18
    .line 19
    iget-boolean v0, v0, Ll/h4z0;->n0:Z

    .line 20
    .line 21
    iget-boolean v0, p0, Ll/k5z0;->o:Z

    .line 22
    .line 23
    iget-boolean v1, p1, Ll/k5z0;->o:Z

    .line 24
    .line 25
    if-ne v0, v1, :cond_0

    .line 26
    .line 27
    iget-boolean p0, p0, Ll/k5z0;->p:Z

    .line 28
    .line 29
    iget-boolean p1, p1, Ll/k5z0;->p:Z

    .line 30
    .line 31
    if-ne p0, p1, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method
