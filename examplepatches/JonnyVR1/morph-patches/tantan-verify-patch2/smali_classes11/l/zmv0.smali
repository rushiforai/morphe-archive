.class public final Ll/zmv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/mmv0;


# instance fields
.field public final a:Ll/m7w0;

.field public final b:Ll/dlt0;

.field public final c:Landroid/content/Context;

.field public final d:Ll/jmv0;

.field public final e:Ll/hew0;

.field public f:Ll/zzt0;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dlt0;Landroid/content/Context;Ll/jmv0;Ll/m7w0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zmv0;->c:Landroid/content/Context;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/zmv0;->a:Ll/m7w0;

    .line 11
    .line 12
    invoke-virtual {p1}, Ll/dlt0;->D()Ll/hew0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    iput-object p1, p0, Ll/zmv0;->e:Ll/hew0;

    .line 17
    .line 18
    invoke-virtual {p3}, Ll/jmv0;->d()Ll/wlv0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-virtual {p4, p0}, Ll/m7w0;->L(Ll/wlv0;)Ll/m7w0;

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static bridge synthetic b(Ll/zmv0;)Ll/dlt0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic c(Ll/zmv0;)Ll/jmv0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic d(Ll/zmv0;)Ll/hew0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmv0;->e:Ll/hew0;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ll/kmv0;Ll/lmv0;)Z
    .locals 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/zmv0;->c:Landroid/content/Context;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->g(Landroid/content/Context;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    iget-object v0, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzs:Lcom/google/android/gms/ads/internal/client/zzc;

    .line 14
    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string p1, "Failed to load the ad because app ID is missing."

    .line 19
    .line 20
    invoke-static {p1}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p1, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 24
    .line 25
    invoke-virtual {p1}, Ll/dlt0;->c()Ljava/util/concurrent/Executor;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    new-instance p2, Ll/omv0;

    .line 30
    .line 31
    invoke-direct {p2, p0}, Ll/omv0;-><init>(Ll/zmv0;)V

    .line 32
    .line 33
    .line 34
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    :goto_0
    if-nez p2, :cond_2

    .line 39
    .line 40
    const-string p1, "Ad unit ID should not be null for NativeAdLoader."

    .line 41
    .line 42
    invoke-static {p1}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    iget-object p1, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 46
    .line 47
    invoke-virtual {p1}, Ll/dlt0;->c()Ljava/util/concurrent/Executor;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    new-instance p2, Ll/pmv0;

    .line 52
    .line 53
    invoke-direct {p2, p0}, Ll/pmv0;-><init>(Ll/zmv0;)V

    .line 54
    .line 55
    .line 56
    invoke-interface {p1, p2}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 57
    .line 58
    .line 59
    return v1

    .line 60
    :cond_2
    iget-object p2, p0, Ll/zmv0;->c:Landroid/content/Context;

    .line 61
    .line 62
    iget-boolean v0, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzf:Z

    .line 63
    .line 64
    invoke-static {p2, v0}, Ll/q8w0;->a(Landroid/content/Context;Z)V

    .line 65
    .line 66
    .line 67
    sget-object p2, Ll/sgs0;->N8:Ll/dgs0;

    .line 68
    .line 69
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0, p2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p2

    .line 77
    check-cast p2, Ljava/lang/Boolean;

    .line 78
    .line 79
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 80
    .line 81
    .line 82
    move-result p2

    .line 83
    const/4 v0, 0x1

    .line 84
    if-eqz p2, :cond_3

    .line 85
    .line 86
    iget-boolean p2, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzf:Z

    .line 87
    .line 88
    if-eqz p2, :cond_3

    .line 89
    .line 90
    iget-object p2, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 91
    .line 92
    invoke-virtual {p2}, Ll/dlt0;->p()Ll/j0v0;

    .line 93
    .line 94
    .line 95
    move-result-object p2

    .line 96
    invoke-virtual {p2, v0}, Ll/j0v0;->n(Z)V

    .line 97
    .line 98
    .line 99
    :cond_3
    check-cast p3, Ll/nmv0;

    .line 100
    .line 101
    iget p2, p3, Ll/nmv0;->a:I

    .line 102
    .line 103
    iget-object p3, p0, Ll/zmv0;->a:Ll/m7w0;

    .line 104
    .line 105
    invoke-virtual {p3, p1}, Ll/m7w0;->e(Lcom/google/android/gms/ads/internal/client/zzl;)Ll/m7w0;

    .line 106
    .line 107
    .line 108
    invoke-virtual {p3, p2}, Ll/m7w0;->Q(I)Ll/m7w0;

    .line 109
    .line 110
    .line 111
    iget-object p2, p0, Ll/zmv0;->c:Landroid/content/Context;

    .line 112
    .line 113
    invoke-virtual {p3}, Ll/m7w0;->g()Ll/o7w0;

    .line 114
    .line 115
    .line 116
    move-result-object p3

    .line 117
    invoke-static {p3}, Ll/bew0;->f(Ll/o7w0;)I

    .line 118
    .line 119
    .line 120
    move-result v1

    .line 121
    const/16 v2, 0x8

    .line 122
    .line 123
    invoke-static {p2, v1, v2, p1}, Ll/qdw0;->b(Landroid/content/Context;IILcom/google/android/gms/ads/internal/client/zzl;)Ll/rdw0;

    .line 124
    .line 125
    .line 126
    move-result-object v7

    .line 127
    iget-object p2, p3, Ll/o7w0;->n:Ll/y7t0;

    .line 128
    .line 129
    if-eqz p2, :cond_4

    .line 130
    .line 131
    iget-object v1, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 132
    .line 133
    invoke-virtual {v1}, Ll/jmv0;->d()Ll/wlv0;

    .line 134
    .line 135
    .line 136
    move-result-object v1

    .line 137
    invoke-virtual {v1, p2}, Ll/wlv0;->P(Ll/y7t0;)V

    .line 138
    .line 139
    .line 140
    :cond_4
    iget-object p2, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 141
    .line 142
    invoke-virtual {p2}, Ll/dlt0;->m()Ll/pju0;

    .line 143
    .line 144
    .line 145
    move-result-object p2

    .line 146
    new-instance v1, Ll/q5u0;

    .line 147
    .line 148
    invoke-direct {v1}, Ll/q5u0;-><init>()V

    .line 149
    .line 150
    .line 151
    iget-object v3, p0, Ll/zmv0;->c:Landroid/content/Context;

    .line 152
    .line 153
    invoke-virtual {v1, v3}, Ll/q5u0;->e(Landroid/content/Context;)Ll/q5u0;

    .line 154
    .line 155
    .line 156
    invoke-virtual {v1, p3}, Ll/q5u0;->i(Ll/o7w0;)Ll/q5u0;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v1}, Ll/q5u0;->j()Ll/s5u0;

    .line 160
    .line 161
    .line 162
    move-result-object p3

    .line 163
    invoke-interface {p2, p3}, Ll/pju0;->l(Ll/s5u0;)Ll/pju0;

    .line 164
    .line 165
    .line 166
    new-instance p3, Ll/ldu0;

    .line 167
    .line 168
    invoke-direct {p3}, Ll/ldu0;-><init>()V

    .line 169
    .line 170
    .line 171
    iget-object v1, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 172
    .line 173
    iget-object v3, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 174
    .line 175
    invoke-virtual {v1}, Ll/jmv0;->d()Ll/wlv0;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    invoke-virtual {v3}, Ll/dlt0;->c()Ljava/util/concurrent/Executor;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    invoke-virtual {p3, v1, v3}, Ll/ldu0;->n(Ll/mv0;Ljava/util/concurrent/Executor;)Ll/ldu0;

    .line 184
    .line 185
    .line 186
    invoke-virtual {p3}, Ll/ldu0;->q()Ll/ndu0;

    .line 187
    .line 188
    .line 189
    move-result-object p3

    .line 190
    invoke-interface {p2, p3}, Ll/pju0;->h(Ll/ndu0;)Ll/pju0;

    .line 191
    .line 192
    .line 193
    iget-object p3, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 194
    .line 195
    invoke-virtual {p3}, Ll/jmv0;->c()Ll/lju0;

    .line 196
    .line 197
    .line 198
    move-result-object p3

    .line 199
    invoke-interface {p2, p3}, Ll/pju0;->c(Ll/lju0;)Ll/pju0;

    .line 200
    .line 201
    .line 202
    new-instance p3, Ll/rwt0;

    .line 203
    .line 204
    const/4 v1, 0x0

    .line 205
    invoke-direct {p3, v1}, Ll/rwt0;-><init>(Landroid/view/ViewGroup;)V

    .line 206
    .line 207
    .line 208
    invoke-interface {p2, p3}, Ll/pju0;->b(Ll/rwt0;)Ll/pju0;

    .line 209
    .line 210
    .line 211
    invoke-interface {p2}, Ll/pju0;->zzg()Ll/qju0;

    .line 212
    .line 213
    .line 214
    move-result-object v8

    .line 215
    sget-object p2, Ll/ris0;->c:Ll/kis0;

    .line 216
    .line 217
    invoke-virtual {p2}, Ll/kis0;->e()Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object p2

    .line 221
    check-cast p2, Ljava/lang/Boolean;

    .line 222
    .line 223
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 224
    .line 225
    .line 226
    move-result p2

    .line 227
    if-eqz p2, :cond_5

    .line 228
    .line 229
    invoke-virtual {v8}, Ll/qju0;->e()Ll/cew0;

    .line 230
    .line 231
    .line 232
    move-result-object v1

    .line 233
    invoke-virtual {v1, v2}, Ll/cew0;->h(I)Ll/cew0;

    .line 234
    .line 235
    .line 236
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zzl;->zzp:Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v1, p1}, Ll/cew0;->b(Ljava/lang/String;)Ll/cew0;

    .line 239
    .line 240
    .line 241
    :cond_5
    move-object v6, v1

    .line 242
    iget-object p1, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 243
    .line 244
    invoke-virtual {p1}, Ll/dlt0;->B()Ll/s8w0;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    invoke-virtual {p1, v0}, Ll/s8w0;->c(I)V

    .line 249
    .line 250
    .line 251
    new-instance p1, Ll/zzt0;

    .line 252
    .line 253
    sget-object p2, Ll/oct0;->a:Ll/xvw0;

    .line 254
    .line 255
    invoke-static {p2}, Ll/cqx0;->b(Ljava/lang/Object;)Ljava/lang/Object;

    .line 256
    .line 257
    .line 258
    iget-object p3, p0, Ll/zmv0;->b:Ll/dlt0;

    .line 259
    .line 260
    invoke-virtual {p3}, Ll/dlt0;->d()Ljava/util/concurrent/ScheduledExecutorService;

    .line 261
    .line 262
    .line 263
    move-result-object p3

    .line 264
    invoke-virtual {v8}, Ll/qju0;->a()Ll/z0u0;

    .line 265
    .line 266
    .line 267
    move-result-object v1

    .line 268
    invoke-virtual {v1}, Ll/z0u0;->j()Ll/hpr;

    .line 269
    .line 270
    .line 271
    move-result-object v2

    .line 272
    invoke-virtual {v1, v2}, Ll/z0u0;->i(Ll/hpr;)Ll/hpr;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    invoke-direct {p1, p2, p3, v1}, Ll/zzt0;-><init>(Ljava/util/concurrent/Executor;Ljava/util/concurrent/ScheduledExecutorService;Ll/hpr;)V

    .line 277
    .line 278
    .line 279
    iput-object p1, p0, Ll/zmv0;->f:Ll/zzt0;

    .line 280
    .line 281
    new-instance v3, Ll/ymv0;

    .line 282
    .line 283
    move-object v4, p0

    .line 284
    move-object v5, p4

    .line 285
    invoke-direct/range {v3 .. v8}, Ll/ymv0;-><init>(Ll/zmv0;Ll/lmv0;Ll/cew0;Ll/rdw0;Ll/qju0;)V

    .line 286
    .line 287
    .line 288
    invoke-virtual {p1, v3}, Ll/zzt0;->e(Ll/lvw0;)V

    .line 289
    .line 290
    .line 291
    return v0
.end method

.method public final synthetic e()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jmv0;->a()Ll/s6u0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x4

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1, v1}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Ll/s6u0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic f()V
    .locals 2

    .line 1
    iget-object p0, p0, Ll/zmv0;->d:Ll/jmv0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/jmv0;->a()Ll/s6u0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const/4 v0, 0x6

    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-static {v0, v1, v1}, Ll/v8w0;->d(ILjava/lang/String;Lcom/google/android/gms/ads/internal/client/zze;)Lcom/google/android/gms/ads/internal/client/zze;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-interface {p0, v0}, Ll/s6u0;->u(Lcom/google/android/gms/ads/internal/client/zze;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final zza()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/zmv0;->f:Ll/zzt0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/zzt0;->f()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method
