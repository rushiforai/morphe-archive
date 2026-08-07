.class public final Ll/fit0;
.super Ll/set0;
.source "SourceFile"

# interfaces
.implements Ll/btx0;
.implements Ll/dgy0;


# static fields
.field public static final synthetic w:I


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Ll/qht0;

.field public final e:Ll/l5z0;

.field public final f:Ll/aft0;

.field public final g:Ljava/lang/ref/WeakReference;

.field public final h:Ll/e1z0;

.field public i:Ll/m0y0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public j:Ljava/nio/ByteBuffer;

.field public k:Z

.field public l:Ll/ret0;

.field public m:I

.field public n:I

.field public o:J

.field public final p:Ljava/lang/String;

.field public final q:I

.field public final r:Ljava/lang/Object;

.field public s:Ljava/lang/Integer;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final t:Ljava/util/ArrayList;

.field public volatile u:Ll/sht0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final v:Ljava/util/Set;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/aft0;Ll/bft0;Ljava/lang/Integer;)V
    .locals 3
    .param p4    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ll/set0;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/fit0;->r:Ljava/lang/Object;

    .line 10
    .line 11
    new-instance v0, Ljava/util/HashSet;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/fit0;->v:Ljava/util/Set;

    .line 17
    .line 18
    iput-object p1, p0, Ll/fit0;->c:Landroid/content/Context;

    .line 19
    .line 20
    iput-object p2, p0, Ll/fit0;->f:Ll/aft0;

    .line 21
    .line 22
    iput-object p4, p0, Ll/fit0;->s:Ljava/lang/Integer;

    .line 23
    .line 24
    new-instance p4, Ljava/lang/ref/WeakReference;

    .line 25
    .line 26
    invoke-direct {p4, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    iput-object p4, p0, Ll/fit0;->g:Ljava/lang/ref/WeakReference;

    .line 30
    .line 31
    new-instance p4, Ll/qht0;

    .line 32
    .line 33
    invoke-direct {p4}, Ll/qht0;-><init>()V

    .line 34
    .line 35
    .line 36
    iput-object p4, p0, Ll/fit0;->d:Ll/qht0;

    .line 37
    .line 38
    new-instance v0, Ll/l5z0;

    .line 39
    .line 40
    invoke-direct {v0, p1}, Ll/l5z0;-><init>(Landroid/content/Context;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, p0, Ll/fit0;->e:Ll/l5z0;

    .line 44
    .line 45
    invoke-static {}, Ll/d2v0;->m()Z

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eqz v1, :cond_0

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    const-string v2, "SimpleExoPlayerAdapter initialize "

    .line 56
    .line 57
    invoke-virtual {v2, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    invoke-static {v1}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_0
    invoke-static {}, Ll/set0;->u()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 69
    .line 70
    .line 71
    new-instance v1, Ll/jfy0;

    .line 72
    .line 73
    new-instance v2, Ll/cit0;

    .line 74
    .line 75
    invoke-direct {v2, p0}, Ll/cit0;-><init>(Ll/fit0;)V

    .line 76
    .line 77
    .line 78
    invoke-direct {v1, p1, v2}, Ll/jfy0;-><init>(Landroid/content/Context;Ll/cit0;)V

    .line 79
    .line 80
    .line 81
    invoke-virtual {v1, v0}, Ll/jfy0;->b(Ll/t5z0;)Ll/jfy0;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v1, p4}, Ll/jfy0;->a(Ll/q9y0;)Ll/jfy0;

    .line 85
    .line 86
    .line 87
    invoke-virtual {v1}, Ll/jfy0;->c()Ll/mfy0;

    .line 88
    .line 89
    .line 90
    move-result-object p4

    .line 91
    iput-object p4, p0, Ll/fit0;->i:Ll/m0y0;

    .line 92
    .line 93
    invoke-interface {p4, p0}, Ll/m0y0;->h(Ll/dgy0;)V

    .line 94
    .line 95
    .line 96
    const/4 p4, 0x0

    .line 97
    iput p4, p0, Ll/fit0;->m:I

    .line 98
    .line 99
    const-wide/16 v0, 0x0

    .line 100
    .line 101
    iput-wide v0, p0, Ll/fit0;->o:J

    .line 102
    .line 103
    iput p4, p0, Ll/fit0;->n:I

    .line 104
    .line 105
    new-instance v0, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object v0, p0, Ll/fit0;->t:Ljava/util/ArrayList;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Ll/fit0;->u:Ll/sht0;

    .line 114
    .line 115
    if-eqz p3, :cond_1

    .line 116
    .line 117
    invoke-interface {p3}, Ll/bft0;->zzr()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    :cond_1
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzfwz;->zzd(Ljava/lang/Object;)Lcom/google/android/gms/internal/ads/zzfwz;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, ""

    .line 126
    .line 127
    invoke-virtual {v0, v1}, Lcom/google/android/gms/internal/ads/zzfwz;->zzb(Ljava/lang/Object;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/lang/String;

    .line 132
    .line 133
    iput-object v0, p0, Ll/fit0;->p:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz p3, :cond_2

    .line 136
    .line 137
    invoke-interface {p3}, Ll/bft0;->zzf()I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    goto :goto_0

    .line 142
    :cond_2
    move v0, p4

    .line 143
    :goto_0
    iput v0, p0, Ll/fit0;->q:I

    .line 144
    .line 145
    new-instance v0, Ll/e1z0;

    .line 146
    .line 147
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 148
    .line 149
    .line 150
    move-result-object v1

    .line 151
    invoke-interface {p3}, Ll/bft0;->zzn()Lcom/google/android/gms/internal/ads/zzcei;

    .line 152
    .line 153
    .line 154
    move-result-object p3

    .line 155
    iget-object p3, p3, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 156
    .line 157
    invoke-virtual {v1, p1, p3}, Lcom/google/android/gms/ads/internal/util/b;->E(Landroid/content/Context;Ljava/lang/String;)Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iget-boolean p3, p0, Ll/fit0;->k:Z

    .line 162
    .line 163
    if-eqz p3, :cond_3

    .line 164
    .line 165
    iget-object p3, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 166
    .line 167
    invoke-virtual {p3}, Ljava/nio/Buffer;->limit()I

    .line 168
    .line 169
    .line 170
    move-result p3

    .line 171
    if-lez p3, :cond_3

    .line 172
    .line 173
    iget-object p1, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 174
    .line 175
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 176
    .line 177
    .line 178
    move-result p1

    .line 179
    new-array p1, p1, [B

    .line 180
    .line 181
    iget-object p2, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 182
    .line 183
    invoke-virtual {p2, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 184
    .line 185
    .line 186
    new-instance p2, Ll/uht0;

    .line 187
    .line 188
    invoke-direct {p2, p1}, Ll/uht0;-><init>([B)V

    .line 189
    .line 190
    .line 191
    goto/16 :goto_6

    .line 192
    .line 193
    :cond_3
    sget-object p3, Ll/sgs0;->Y1:Ll/dgs0;

    .line 194
    .line 195
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    invoke-virtual {v1, p3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object p3

    .line 203
    check-cast p3, Ljava/lang/Boolean;

    .line 204
    .line 205
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 206
    .line 207
    .line 208
    move-result p3

    .line 209
    const/4 v1, 0x1

    .line 210
    if-eqz p3, :cond_5

    .line 211
    .line 212
    sget-object p3, Ll/sgs0;->Q1:Ll/dgs0;

    .line 213
    .line 214
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 215
    .line 216
    .line 217
    move-result-object v2

    .line 218
    invoke-virtual {v2, p3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object p3

    .line 222
    check-cast p3, Ljava/lang/Boolean;

    .line 223
    .line 224
    invoke-virtual {p3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 225
    .line 226
    .line 227
    move-result p3

    .line 228
    if-nez p3, :cond_4

    .line 229
    .line 230
    goto :goto_2

    .line 231
    :cond_4
    :goto_1
    move p4, v1

    .line 232
    goto :goto_3

    .line 233
    :cond_5
    :goto_2
    iget-boolean p3, p2, Ll/aft0;->j:Z

    .line 234
    .line 235
    if-nez p3, :cond_6

    .line 236
    .line 237
    goto :goto_1

    .line 238
    :cond_6
    :goto_3
    iget-boolean p3, p2, Ll/aft0;->m:Z

    .line 239
    .line 240
    if-eqz p3, :cond_7

    .line 241
    .line 242
    new-instance p3, Ll/wht0;

    .line 243
    .line 244
    invoke-direct {p3, p0, p1, p4}, Ll/wht0;-><init>(Ll/fit0;Ljava/lang/String;Z)V

    .line 245
    .line 246
    .line 247
    goto :goto_4

    .line 248
    :cond_7
    iget p3, p2, Ll/aft0;->i:I

    .line 249
    .line 250
    if-lez p3, :cond_8

    .line 251
    .line 252
    new-instance p3, Ll/xht0;

    .line 253
    .line 254
    invoke-direct {p3, p0, p1, p4}, Ll/xht0;-><init>(Ll/fit0;Ljava/lang/String;Z)V

    .line 255
    .line 256
    .line 257
    goto :goto_4

    .line 258
    :cond_8
    new-instance p3, Ll/yht0;

    .line 259
    .line 260
    invoke-direct {p3, p0, p1, p4}, Ll/yht0;-><init>(Ll/fit0;Ljava/lang/String;Z)V

    .line 261
    .line 262
    .line 263
    :goto_4
    iget-boolean p1, p2, Ll/aft0;->j:Z

    .line 264
    .line 265
    if-eqz p1, :cond_9

    .line 266
    .line 267
    new-instance p1, Ll/zht0;

    .line 268
    .line 269
    invoke-direct {p1, p0, p3}, Ll/zht0;-><init>(Ll/fit0;Ll/kdx0;)V

    .line 270
    .line 271
    .line 272
    move-object p2, p1

    .line 273
    goto :goto_5

    .line 274
    :cond_9
    move-object p2, p3

    .line 275
    :goto_5
    iget-object p1, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 276
    .line 277
    if-eqz p1, :cond_a

    .line 278
    .line 279
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 280
    .line 281
    .line 282
    move-result p1

    .line 283
    if-lez p1, :cond_a

    .line 284
    .line 285
    iget-object p1, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 286
    .line 287
    invoke-virtual {p1}, Ljava/nio/Buffer;->limit()I

    .line 288
    .line 289
    .line 290
    move-result p1

    .line 291
    new-array p1, p1, [B

    .line 292
    .line 293
    iget-object p3, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 294
    .line 295
    invoke-virtual {p3, p1}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 296
    .line 297
    .line 298
    new-instance p3, Ll/ait0;

    .line 299
    .line 300
    invoke-direct {p3, p2, p1}, Ll/ait0;-><init>(Ll/kdx0;[B)V

    .line 301
    .line 302
    .line 303
    move-object p2, p3

    .line 304
    :cond_a
    :goto_6
    sget-object p1, Ll/sgs0;->o:Ll/dgs0;

    .line 305
    .line 306
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 307
    .line 308
    .line 309
    move-result-object p3

    .line 310
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 311
    .line 312
    .line 313
    move-result-object p1

    .line 314
    check-cast p1, Ljava/lang/Boolean;

    .line 315
    .line 316
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 317
    .line 318
    .line 319
    move-result p1

    .line 320
    if-eqz p1, :cond_b

    .line 321
    .line 322
    sget-object p1, Ll/eit0;->b:Ll/eit0;

    .line 323
    .line 324
    goto :goto_7

    .line 325
    :cond_b
    sget-object p1, Ll/vht0;->b:Ll/vht0;

    .line 326
    .line 327
    :goto_7
    new-instance p3, Ll/d1z0;

    .line 328
    .line 329
    invoke-direct {p3, p1}, Ll/d1z0;-><init>(Ll/ifr0;)V

    .line 330
    .line 331
    .line 332
    invoke-direct {v0, p2, p3}, Ll/e1z0;-><init>(Ll/kdx0;Ll/d1z0;)V

    .line 333
    .line 334
    .line 335
    iput-object v0, p0, Ll/fit0;->h:Ll/e1z0;

    .line 336
    .line 337
    return-void
.end method

.method private final d0()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fit0;->u:Ll/sht0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object p0, p0, Ll/fit0;->u:Ll/sht0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/sht0;->s()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method


# virtual methods
.method public final A(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->d:Ll/qht0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qht0;->e(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final B(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->d:Ll/qht0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qht0;->f(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final C(Ll/ret0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    return-void
.end method

.method public final D(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->d:Ll/qht0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qht0;->g(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final E(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->d:Ll/qht0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/qht0;->h(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final F(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/oot0;->d(Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final G(Ljava/lang/Integer;)V
    .locals 0
    .param p1    # Ljava/lang/Integer;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Ll/fit0;->s:Ljava/lang/Integer;

    .line 2
    .line 3
    return-void
.end method

.method public final H(Z)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :goto_0
    iget-object v1, p0, Ll/fit0;->i:Ll/m0y0;

    .line 7
    .line 8
    invoke-interface {v1}, Ll/m0y0;->r()I

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x2

    .line 12
    if-ge v0, v1, :cond_0

    .line 13
    .line 14
    iget-object v1, p0, Ll/fit0;->e:Ll/l5z0;

    .line 15
    .line 16
    invoke-virtual {v1}, Ll/l5z0;->m()Ll/h4z0;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    invoke-virtual {v2}, Ll/h4z0;->c()Ll/f4z0;

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    xor-int/lit8 v3, p1, 0x1

    .line 25
    .line 26
    invoke-virtual {v2, v0, v3}, Ll/f4z0;->p(IZ)Ll/f4z0;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1, v2}, Ll/l5z0;->r(Ll/f4z0;)V

    .line 30
    .line 31
    .line 32
    add-int/lit8 v0, v0, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    return-void
.end method

.method public final I(I)V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fit0;->v:Ljava/util/Set;

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    check-cast v0, Ll/pht0;

    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-virtual {v0, p1}, Ll/pht0;->o(I)V

    .line 28
    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return-void
.end method

.method public final J(Landroid/view/Surface;Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/oot0;->c(Landroid/view/Surface;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final K(FZ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/oot0;->f(F)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final L()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/oot0;->zzu()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final M()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final N()I
    .locals 0

    .line 1
    iget p0, p0, Ll/fit0;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public final P()I
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/oot0;->zzf()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public final R()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/oot0;->zzi()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final S()J
    .locals 2

    .line 1
    iget p0, p0, Ll/fit0;->m:I

    .line 2
    .line 3
    int-to-long v0, p0

    .line 4
    return-wide v0
.end method

.method public final T()J
    .locals 4

    .line 1
    invoke-direct {p0}, Ll/fit0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    iget-object v0, p0, Ll/fit0;->u:Ll/sht0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/sht0;->r()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    iget v0, p0, Ll/fit0;->m:I

    .line 17
    .line 18
    int-to-long v0, v0

    .line 19
    iget-object p0, p0, Ll/fit0;->u:Ll/sht0;

    .line 20
    .line 21
    invoke-virtual {p0}, Ll/sht0;->m()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->min(JJ)J

    .line 26
    .line 27
    .line 28
    move-result-wide v0

    .line 29
    return-wide v0

    .line 30
    :cond_1
    :goto_0
    const-wide/16 v0, 0x0

    .line 31
    .line 32
    return-wide v0
.end method

.method public final U()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/oot0;->zzk()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final V()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/oot0;->zzl()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public final synthetic W(Ljava/lang/String;Z)Ll/fex0;
    .locals 9

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq v0, p2, :cond_0

    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    move-object v2, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move-object v2, p0

    .line 8
    :goto_0
    iget-object p0, p0, Ll/fit0;->f:Ll/aft0;

    .line 9
    .line 10
    new-instance v0, Lcom/google/android/gms/internal/ads/h1;

    .line 11
    .line 12
    iget v3, p0, Ll/aft0;->d:I

    .line 13
    .line 14
    iget v4, p0, Ll/aft0;->f:I

    .line 15
    .line 16
    iget-wide v5, p0, Ll/aft0;->n:J

    .line 17
    .line 18
    iget-wide v7, p0, Ll/aft0;->o:J

    .line 19
    .line 20
    move-object v1, p1

    .line 21
    invoke-direct/range {v0 .. v8}, Lcom/google/android/gms/internal/ads/h1;-><init>(Ljava/lang/String;Ll/btx0;IIJJ)V

    .line 22
    .line 23
    .line 24
    return-object v0
.end method

.method public final synthetic X(Ljava/lang/String;Z)Ll/fex0;
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eq v0, p2, :cond_0

    .line 3
    .line 4
    const/4 p2, 0x0

    .line 5
    move-object v2, p2

    .line 6
    goto :goto_0

    .line 7
    :cond_0
    move-object v2, p0

    .line 8
    :goto_0
    iget-object p2, p0, Ll/fit0;->f:Ll/aft0;

    .line 9
    .line 10
    new-instance v0, Ll/pht0;

    .line 11
    .line 12
    iget v3, p2, Ll/aft0;->d:I

    .line 13
    .line 14
    iget v4, p2, Ll/aft0;->f:I

    .line 15
    .line 16
    iget v5, p2, Ll/aft0;->i:I

    .line 17
    .line 18
    move-object v1, p1

    .line 19
    invoke-direct/range {v0 .. v5}, Ll/pht0;-><init>(Ljava/lang/String;Ll/btx0;III)V

    .line 20
    .line 21
    .line 22
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 23
    .line 24
    invoke-direct {p1, v0}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Ll/fit0;->v:Ljava/util/Set;

    .line 28
    .line 29
    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    return-object v0
.end method

.method public final synthetic Y(Ljava/lang/String;Z)Ll/fex0;
    .locals 1

    .line 1
    new-instance v0, Ll/zmx0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/zmx0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/zmx0;->e(Ljava/lang/String;)Ll/zmx0;

    .line 7
    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    if-eq p1, p2, :cond_0

    .line 11
    .line 12
    const/4 p2, 0x0

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    move-object p2, p0

    .line 15
    :goto_0
    invoke-virtual {v0, p2}, Ll/zmx0;->d(Ll/btx0;)Ll/zmx0;

    .line 16
    .line 17
    .line 18
    iget-object p2, p0, Ll/fit0;->f:Ll/aft0;

    .line 19
    .line 20
    iget p2, p2, Ll/aft0;->d:I

    .line 21
    .line 22
    invoke-virtual {v0, p2}, Ll/zmx0;->b(I)Ll/zmx0;

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/fit0;->f:Ll/aft0;

    .line 26
    .line 27
    iget p0, p0, Ll/aft0;->f:I

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ll/zmx0;->c(I)Ll/zmx0;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v0, p1}, Ll/zmx0;->a(Z)Ll/zmx0;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0}, Ll/zmx0;->f()Ll/wqx0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    return-object p0
.end method

.method public final synthetic Z(Ll/kdx0;)Ll/fex0;
    .locals 7

    .line 1
    new-instance v0, Ll/sht0;

    .line 2
    .line 3
    invoke-interface {p1}, Ll/kdx0;->zza()Ll/fex0;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    new-instance v6, Ll/dit0;

    .line 8
    .line 9
    invoke-direct {v6, p0}, Ll/dit0;-><init>(Ll/fit0;)V

    .line 10
    .line 11
    .line 12
    iget-object v3, p0, Ll/fit0;->p:Ljava/lang/String;

    .line 13
    .line 14
    iget v4, p0, Ll/fit0;->q:I

    .line 15
    .line 16
    iget-object v1, p0, Ll/fit0;->c:Landroid/content/Context;

    .line 17
    .line 18
    move-object v5, p0

    .line 19
    invoke-direct/range {v0 .. v6}, Ll/sht0;-><init>(Landroid/content/Context;Ll/fex0;Ljava/lang/String;ILl/btx0;Ll/dit0;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public final a(Ll/yfy0;Ll/sqr0;Ll/zwx0;)V
    .locals 1
    .param p3    # Ll/zwx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/fit0;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bft0;

    .line 8
    .line 9
    sget-object p1, Ll/sgs0;->Q1:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    new-instance p1, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p3, p2, Ll/sqr0;->k:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz p3, :cond_0

    .line 37
    .line 38
    const-string v0, "audioMime"

    .line 39
    .line 40
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p3, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 44
    .line 45
    if-eqz p3, :cond_1

    .line 46
    .line 47
    const-string v0, "audioSampleMime"

    .line 48
    .line 49
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    :cond_1
    iget-object p2, p2, Ll/sqr0;->i:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p2, :cond_2

    .line 55
    .line 56
    const-string p3, "audioCodec"

    .line 57
    .line 58
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    :cond_2
    const-string p2, "onMetadataEvent"

    .line 62
    .line 63
    invoke-interface {p0, p2, p1}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    return-void
.end method

.method public final a0(Landroid/net/Uri;)Ll/mzy0;
    .locals 1
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    new-instance v0, Ll/lxr0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/lxr0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/lxr0;->b(Landroid/net/Uri;)Ll/lxr0;

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0}, Ll/lxr0;->c()Ll/trs0;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iget-object v0, p0, Ll/fit0;->h:Ll/e1z0;

    .line 14
    .line 15
    iget-object p0, p0, Ll/fit0;->f:Ll/aft0;

    .line 16
    .line 17
    iget p0, p0, Ll/aft0;->g:I

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ll/e1z0;->a(I)Ll/e1z0;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p1}, Ll/e1z0;->b(Ll/trs0;)Ll/g1z0;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0
.end method

.method public final b(Ll/yfy0;Ljava/lang/Object;J)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/ret0;->b()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic b0(ZJ)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Ll/ret0;->d(ZJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final c(Ll/yfy0;Lcom/google/android/gms/internal/ads/zzce;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const-string p1, "onPlayerError"

    .line 6
    .line 7
    invoke-interface {p0, p1, p2}, Ll/ret0;->e(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public final synthetic c0(Landroid/os/Handler;Ll/vcr0;Ll/hqy0;Ll/s2z0;Ll/sxy0;)[Ll/vey0;
    .locals 13

    .line 1
    new-instance v0, Ll/pty0;

    .line 2
    .line 3
    sget-object v3, Ll/dxy0;->a:Ll/dxy0;

    .line 4
    .line 5
    sget-object v1, Ll/zoy0;->c:Ll/zoy0;

    .line 6
    .line 7
    const/4 v12, 0x0

    .line 8
    new-array v2, v12, [Ll/wsu0;

    .line 9
    .line 10
    new-instance v4, Ll/fsy0;

    .line 11
    .line 12
    invoke-direct {v4}, Ll/fsy0;-><init>()V

    .line 13
    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    if-eqz v1, :cond_1

    .line 19
    .line 20
    :goto_0
    iget-object v5, p0, Ll/fit0;->c:Landroid/content/Context;

    .line 21
    .line 22
    invoke-virtual {v4, v1}, Ll/fsy0;->c(Ll/zoy0;)Ll/fsy0;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v4, v2}, Ll/fsy0;->d([Ll/wsu0;)Ll/fsy0;

    .line 26
    .line 27
    .line 28
    invoke-virtual {v4}, Ll/fsy0;->e()Ll/jty0;

    .line 29
    .line 30
    .line 31
    move-result-object v7

    .line 32
    sget-object v2, Ll/zvy0;->a:Ll/zvy0;

    .line 33
    .line 34
    const/4 v4, 0x0

    .line 35
    move-object/from16 v6, p3

    .line 36
    .line 37
    move-object v1, v5

    .line 38
    move-object v5, p1

    .line 39
    invoke-direct/range {v0 .. v7}, Ll/pty0;-><init>(Landroid/content/Context;Ll/zvy0;Ll/dxy0;ZLandroid/os/Handler;Ll/hqy0;Ll/kry0;)V

    .line 40
    .line 41
    .line 42
    iget-object p0, p0, Ll/fit0;->c:Landroid/content/Context;

    .line 43
    .line 44
    new-instance v1, Ll/hbr0;

    .line 45
    .line 46
    const/4 v10, -0x1

    .line 47
    const/high16 v11, 0x41f00000    # 30.0f

    .line 48
    .line 49
    const-wide/16 v5, 0x0

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    move-object v8, p1

    .line 53
    move-object v9, p2

    .line 54
    move-object v4, v3

    .line 55
    move-object v3, v2

    .line 56
    move-object v2, p0

    .line 57
    invoke-direct/range {v1 .. v11}, Ll/hbr0;-><init>(Landroid/content/Context;Ll/zvy0;Ll/dxy0;JZLandroid/os/Handler;Ll/vcr0;IF)V

    .line 58
    .line 59
    .line 60
    const/4 p0, 0x2

    .line 61
    new-array p0, p0, [Ll/vey0;

    .line 62
    .line 63
    aput-object v0, p0, v12

    .line 64
    .line 65
    const/4 p1, 0x1

    .line 66
    aput-object v1, p0, p1

    .line 67
    .line 68
    return-object p0

    .line 69
    :cond_1
    const-string p0, "Both parameters are null"

    .line 70
    .line 71
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    const/4 p0, 0x0

    .line 75
    return-object p0
.end method

.method public final synthetic d(Ll/oot0;Ll/bgy0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final e(Ll/yfy0;Ll/bzy0;Ll/gzy0;Ljava/io/IOException;Z)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p1, :cond_1

    .line 4
    .line 5
    iget-object p0, p0, Ll/fit0;->f:Ll/aft0;

    .line 6
    .line 7
    iget-boolean p0, p0, Ll/aft0;->k:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "onLoadException"

    .line 12
    .line 13
    invoke-interface {p1, p0, p4}, Ll/ret0;->c(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const-string p0, "onLoadError"

    .line 18
    .line 19
    invoke-interface {p1, p0, p4}, Ll/ret0;->e(Ljava/lang/String;Ljava/lang/Exception;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public final synthetic f(Ll/yfy0;Ll/gzy0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final finalize()V
    .locals 1

    .line 1
    invoke-static {}, Ll/set0;->u()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 6
    .line 7
    .line 8
    invoke-static {}, Ll/d2v0;->m()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "SimpleExoPlayerAdapter finalize "

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_0
    return-void
.end method

.method public final g(Ll/yfy0;Ll/sqr0;Ll/zwx0;)V
    .locals 2
    .param p3    # Ll/zwx0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/fit0;->g:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ll/bft0;

    .line 8
    .line 9
    sget-object p1, Ll/sgs0;->Q1:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object p3

    .line 15
    invoke-virtual {p3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    check-cast p1, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_3

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    new-instance p1, Ljava/util/HashMap;

    .line 30
    .line 31
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 32
    .line 33
    .line 34
    iget p3, p2, Ll/sqr0;->s:F

    .line 35
    .line 36
    const-string v0, "frameRate"

    .line 37
    .line 38
    invoke-static {p3}, Ljava/lang/String;->valueOf(F)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    iget p3, p2, Ll/sqr0;->h:I

    .line 46
    .line 47
    const-string v0, "bitRate"

    .line 48
    .line 49
    invoke-static {p3}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p3

    .line 53
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    iget p3, p2, Ll/sqr0;->q:I

    .line 57
    .line 58
    iget v0, p2, Ll/sqr0;->r:I

    .line 59
    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    const-string p3, "x"

    .line 69
    .line 70
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p3

    .line 80
    const-string v0, "resolution"

    .line 81
    .line 82
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    iget-object p3, p2, Ll/sqr0;->k:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p3, :cond_0

    .line 88
    .line 89
    const-string v0, "videoMime"

    .line 90
    .line 91
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    :cond_0
    iget-object p3, p2, Ll/sqr0;->l:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz p3, :cond_1

    .line 97
    .line 98
    const-string v0, "videoSampleMime"

    .line 99
    .line 100
    invoke-interface {p1, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    :cond_1
    iget-object p2, p2, Ll/sqr0;->i:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p2, :cond_2

    .line 106
    .line 107
    const-string p3, "videoCodec"

    .line 108
    .line 109
    invoke-interface {p1, p3, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    :cond_2
    const-string p2, "onMetadataEvent"

    .line 113
    .line 114
    invoke-interface {p0, p2, p1}, Ll/kts0;->Z(Ljava/lang/String;Ljava/util/Map;)V

    .line 115
    .line 116
    .line 117
    :cond_3
    return-void
.end method

.method public final synthetic h(Ll/yfy0;IJJ)V
    .locals 0

    .line 1
    return-void
.end method

.method public final i(Ll/fex0;Ll/akx0;Z)V
    .locals 1

    .line 1
    instance-of p2, p1, Ll/jsx0;

    .line 2
    .line 3
    if-eqz p2, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/fit0;->r:Ljava/lang/Object;

    .line 6
    .line 7
    monitor-enter p2

    .line 8
    :try_start_0
    iget-object p0, p0, Ll/fit0;->t:Ljava/util/ArrayList;

    .line 9
    .line 10
    check-cast p1, Ll/jsx0;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    monitor-exit p2

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    monitor-exit p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0

    .line 20
    :cond_0
    instance-of p2, p1, Ll/sht0;

    .line 21
    .line 22
    if-eqz p2, :cond_1

    .line 23
    .line 24
    check-cast p1, Ll/sht0;

    .line 25
    .line 26
    iput-object p1, p0, Ll/fit0;->u:Ll/sht0;

    .line 27
    .line 28
    iget-object p1, p0, Ll/fit0;->g:Ljava/lang/ref/WeakReference;

    .line 29
    .line 30
    invoke-virtual {p1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/bft0;

    .line 35
    .line 36
    sget-object p2, Ll/sgs0;->Q1:Ll/dgs0;

    .line 37
    .line 38
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-virtual {p3, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    check-cast p2, Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    if-eqz p2, :cond_1

    .line 53
    .line 54
    if-eqz p1, :cond_1

    .line 55
    .line 56
    iget-object p2, p0, Ll/fit0;->u:Ll/sht0;

    .line 57
    .line 58
    invoke-virtual {p2}, Ll/sht0;->p()Z

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    if-eqz p2, :cond_1

    .line 63
    .line 64
    new-instance p2, Ljava/util/HashMap;

    .line 65
    .line 66
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 67
    .line 68
    .line 69
    iget-object p3, p0, Ll/fit0;->u:Ll/sht0;

    .line 70
    .line 71
    invoke-virtual {p3}, Ll/sht0;->r()Z

    .line 72
    .line 73
    .line 74
    move-result p3

    .line 75
    invoke-static {p3}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    const-string v0, "gcacheHit"

    .line 80
    .line 81
    invoke-interface {p2, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    iget-object p0, p0, Ll/fit0;->u:Ll/sht0;

    .line 85
    .line 86
    invoke-virtual {p0}, Ll/sht0;->q()Z

    .line 87
    .line 88
    .line 89
    move-result p0

    .line 90
    invoke-static {p0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    const-string p3, "gcacheDownloaded"

    .line 95
    .line 96
    invoke-interface {p2, p3, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 97
    .line 98
    .line 99
    sget-object p0, Lcom/google/android/gms/ads/internal/util/b;->l:Ll/ukw0;

    .line 100
    .line 101
    new-instance p3, Ll/bit0;

    .line 102
    .line 103
    invoke-direct {p3, p1, p2}, Ll/bit0;-><init>(Ll/bft0;Ljava/util/Map;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p0, p3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 107
    .line 108
    .line 109
    :cond_1
    return-void
.end method

.method public final j(Ll/yfy0;IJ)V
    .locals 0

    .line 1
    iget p1, p0, Ll/fit0;->n:I

    .line 2
    .line 3
    add-int/2addr p1, p2

    .line 4
    iput p1, p0, Ll/fit0;->n:I

    .line 5
    .line 6
    return-void
.end method

.method public final k(Ll/fex0;Ll/akx0;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final l(Ll/fex0;Ll/akx0;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public final synthetic m(Ll/yfy0;Ll/gnt0;Ll/gnt0;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public final n(Ll/fex0;Ll/akx0;ZI)V
    .locals 0

    .line 1
    iget p1, p0, Ll/fit0;->m:I

    .line 2
    .line 3
    add-int/2addr p1, p4

    .line 4
    iput p1, p0, Ll/fit0;->m:I

    .line 5
    .line 6
    return-void
.end method

.method public final o(Ll/yfy0;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p2}, Ll/ret0;->zzm(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic p(Ll/yfy0;Ll/vwx0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final q(Ll/yfy0;Ll/aou0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/fit0;->l:Ll/ret0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    iget p1, p2, Ll/aou0;->a:I

    .line 6
    .line 7
    iget p2, p2, Ll/aou0;->b:I

    .line 8
    .line 9
    invoke-interface {p0, p1, p2}, Ll/ret0;->a(II)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public final r()J
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/fit0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget p0, p0, Ll/fit0;->m:I

    .line 8
    .line 9
    int-to-long v0, p0

    .line 10
    return-wide v0

    .line 11
    :cond_0
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    return-wide v0
.end method

.method public final s()J
    .locals 10

    .line 1
    invoke-direct {p0}, Ll/fit0;->d0()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    iget-object v0, p0, Ll/fit0;->r:Ljava/lang/Object;

    .line 8
    .line 9
    monitor-enter v0

    .line 10
    :goto_0
    :try_start_0
    iget-object v1, p0, Ll/fit0;->t:Ljava/util/ArrayList;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_2

    .line 17
    .line 18
    iget-wide v1, p0, Ll/fit0;->o:J

    .line 19
    .line 20
    iget-object v3, p0, Ll/fit0;->t:Ljava/util/ArrayList;

    .line 21
    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    check-cast v3, Ll/jsx0;

    .line 28
    .line 29
    invoke-interface {v3}, Ll/jsx0;->zze()Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object v3

    .line 33
    const-wide/16 v5, 0x0

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 38
    .line 39
    .line 40
    move-result-object v3

    .line 41
    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    :catch_0
    :cond_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 46
    .line 47
    .line 48
    move-result v7

    .line 49
    if-eqz v7, :cond_1

    .line 50
    .line 51
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v7

    .line 55
    check-cast v7, Ljava/util/Map$Entry;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 56
    .line 57
    if-eqz v7, :cond_0

    .line 58
    .line 59
    :try_start_1
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v8

    .line 63
    if-eqz v8, :cond_0

    .line 64
    .line 65
    const-string v8, "content-length"

    .line 66
    .line 67
    invoke-interface {v7}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v9

    .line 71
    check-cast v9, Ljava/lang/CharSequence;

    .line 72
    .line 73
    invoke-static {v8, v9}, Ll/wnw0;->c(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 74
    .line 75
    .line 76
    move-result v8

    .line 77
    if-eqz v8, :cond_0

    .line 78
    .line 79
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 80
    .line 81
    .line 82
    move-result-object v8

    .line 83
    if-eqz v8, :cond_0

    .line 84
    .line 85
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v8

    .line 89
    check-cast v8, Ljava/util/List;

    .line 90
    .line 91
    invoke-interface {v8, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v8

    .line 95
    if-eqz v8, :cond_0

    .line 96
    .line 97
    invoke-interface {v7}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v7

    .line 101
    check-cast v7, Ljava/util/List;

    .line 102
    .line 103
    invoke-interface {v7, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v7

    .line 107
    check-cast v7, Ljava/lang/String;

    .line 108
    .line 109
    invoke-static {v7}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 110
    .line 111
    .line 112
    move-result-wide v5
    :try_end_1
    .catch Ljava/lang/NumberFormatException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 113
    goto :goto_1

    .line 114
    :catchall_0
    move-exception p0

    .line 115
    goto :goto_2

    .line 116
    :cond_1
    :goto_1
    add-long/2addr v1, v5

    .line 117
    :try_start_2
    iput-wide v1, p0, Ll/fit0;->o:J

    .line 118
    .line 119
    goto :goto_0

    .line 120
    :cond_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 121
    iget-wide v0, p0, Ll/fit0;->o:J

    .line 122
    .line 123
    return-wide v0

    .line 124
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 125
    throw p0

    .line 126
    :cond_3
    iget-object p0, p0, Ll/fit0;->u:Ll/sht0;

    .line 127
    .line 128
    invoke-virtual {p0}, Ll/sht0;->n()J

    .line 129
    .line 130
    .line 131
    move-result-wide v0

    .line 132
    return-wide v0
.end method

.method public final t()Ljava/lang/Integer;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/fit0;->s:Ljava/lang/Integer;

    .line 2
    .line 3
    return-object p0
.end method

.method public final w([Landroid/net/Uri;Ljava/lang/String;)V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 3
    .line 4
    .line 5
    move-result-object v1

    .line 6
    invoke-virtual {p0, p1, p2, v1, v0}, Ll/fit0;->x([Landroid/net/Uri;Ljava/lang/String;Ljava/nio/ByteBuffer;Z)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final x([Landroid/net/Uri;Ljava/lang/String;Ljava/nio/ByteBuffer;Z)V
    .locals 1

    .line 1
    iget-object p2, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz p2, :cond_2

    .line 4
    .line 5
    iput-object p3, p0, Ll/fit0;->j:Ljava/nio/ByteBuffer;

    .line 6
    .line 7
    iput-boolean p4, p0, Ll/fit0;->k:Z

    .line 8
    .line 9
    array-length p2, p1

    .line 10
    const/4 p3, 0x1

    .line 11
    const/4 p4, 0x0

    .line 12
    if-ne p2, p3, :cond_0

    .line 13
    .line 14
    aget-object p1, p1, p4

    .line 15
    .line 16
    invoke-virtual {p0, p1}, Ll/fit0;->a0(Landroid/net/Uri;)Ll/mzy0;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    new-array p2, p2, [Ll/mzy0;

    .line 22
    .line 23
    move p3, p4

    .line 24
    :goto_0
    array-length v0, p1

    .line 25
    if-ge p3, v0, :cond_1

    .line 26
    .line 27
    aget-object v0, p1, p3

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Ll/fit0;->a0(Landroid/net/Uri;)Ll/mzy0;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    aput-object v0, p2, p3

    .line 34
    .line 35
    add-int/lit8 p3, p3, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    new-instance p1, Ll/p0z0;

    .line 39
    .line 40
    invoke-direct {p1, p4, p4, p2}, Ll/p0z0;-><init>(ZZ[Ll/mzy0;)V

    .line 41
    .line 42
    .line 43
    :goto_1
    iget-object p2, p0, Ll/fit0;->i:Ll/m0y0;

    .line 44
    .line 45
    invoke-interface {p2, p1}, Ll/m0y0;->i(Ll/mzy0;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 49
    .line 50
    invoke-interface {p0}, Ll/oot0;->zzp()V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Ll/set0;->v()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void
.end method

.method public final y()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p0}, Ll/m0y0;->e(Ll/dgy0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 9
    .line 10
    invoke-interface {v0}, Ll/oot0;->a()V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 15
    .line 16
    invoke-static {}, Ll/set0;->v()Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 21
    .line 22
    .line 23
    :cond_0
    return-void
.end method

.method public final z(J)V
    .locals 6

    .line 1
    iget-object p0, p0, Ll/fit0;->i:Ll/m0y0;

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    check-cast v0, Ll/aey0;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/oot0;->zzd()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    const/4 v4, 0x5

    .line 11
    const/4 v5, 0x0

    .line 12
    move-wide v2, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Ll/aey0;->j(IJIZ)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
