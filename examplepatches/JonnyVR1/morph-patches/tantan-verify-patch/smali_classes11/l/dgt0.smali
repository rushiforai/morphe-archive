.class public final Ll/dgt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/fex0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/fex0;

.field public final c:Ljava/lang/String;

.field public final d:I

.field public final e:Z

.field public f:Ljava/io/InputStream;

.field public g:Z

.field public h:Landroid/net/Uri;

.field public volatile i:Lcom/google/android/gms/internal/ads/zzbbb;

.field public j:Z

.field public k:Z

.field public final l:Ljava/util/concurrent/atomic/AtomicLong;

.field public m:Ll/akx0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/fex0;Ljava/lang/String;ILl/btx0;Ll/cgt0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dgt0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/dgt0;->b:Ll/fex0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/dgt0;->c:Ljava/lang/String;

    .line 9
    .line 10
    iput p4, p0, Ll/dgt0;->d:I

    .line 11
    .line 12
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/dgt0;->j:Z

    .line 14
    .line 15
    iput-boolean p1, p0, Ll/dgt0;->k:Z

    .line 16
    .line 17
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 18
    .line 19
    const-wide/16 p2, -0x1

    .line 20
    .line 21
    invoke-direct {p1, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/dgt0;->l:Ljava/util/concurrent/atomic/AtomicLong;

    .line 25
    .line 26
    sget-object p1, Ll/sgs0;->Q1:Ll/dgs0;

    .line 27
    .line 28
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    check-cast p1, Ljava/lang/Boolean;

    .line 37
    .line 38
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 39
    .line 40
    .line 41
    move-result p1

    .line 42
    iput-boolean p1, p0, Ll/dgt0;->e:Z

    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public final a([BII)I
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/dgt0;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/dgt0;->f:Ljava/io/InputStream;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    iget-object p0, p0, Ll/dgt0;->b:Ll/fex0;

    .line 15
    .line 16
    invoke-interface {p0, p1, p2, p3}, Ll/nyy0;->a([BII)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    return p0

    .line 21
    :cond_1
    const-string p0, "Attempt to read closed CacheDataSource."

    .line 22
    .line 23
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return p0
.end method

.method public final e(Ll/akx0;)J
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/dgt0;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_6

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/dgt0;->g:Z

    .line 7
    .line 8
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 9
    .line 10
    iput-object v0, p0, Ll/dgt0;->h:Landroid/net/Uri;

    .line 11
    .line 12
    iput-object p1, p0, Ll/dgt0;->m:Ll/akx0;

    .line 13
    .line 14
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzbbb;->g(Landroid/net/Uri;)Lcom/google/android/gms/internal/ads/zzbbb;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    iput-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 19
    .line 20
    sget-object v0, Ll/sgs0;->j4:Ll/dgs0;

    .line 21
    .line 22
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    check-cast v0, Ljava/lang/Boolean;

    .line 31
    .line 32
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    iget-object v1, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 37
    .line 38
    const/4 v2, 0x0

    .line 39
    if-eqz v0, :cond_2

    .line 40
    .line 41
    if-eqz v1, :cond_4

    .line 42
    .line 43
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 44
    .line 45
    iget-wide v3, p1, Ll/akx0;->f:J

    .line 46
    .line 47
    iput-wide v3, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzh:J

    .line 48
    .line 49
    iget-object p1, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 50
    .line 51
    iget-object v0, p0, Ll/dgt0;->c:Ljava/lang/String;

    .line 52
    .line 53
    invoke-static {v0}, Ll/epw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    iput-object v0, p1, Lcom/google/android/gms/internal/ads/zzbbb;->zzi:Ljava/lang/String;

    .line 58
    .line 59
    iget-object p1, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 60
    .line 61
    iget v0, p0, Ll/dgt0;->d:I

    .line 62
    .line 63
    iput v0, p1, Lcom/google/android/gms/internal/ads/zzbbb;->zzj:I

    .line 64
    .line 65
    iget-object p1, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 66
    .line 67
    iget-boolean p1, p1, Lcom/google/android/gms/internal/ads/zzbbb;->zzg:Z

    .line 68
    .line 69
    if-eqz p1, :cond_0

    .line 70
    .line 71
    sget-object p1, Ll/sgs0;->l4:Ll/dgs0;

    .line 72
    .line 73
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Ljava/lang/Long;

    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_0
    sget-object p1, Ll/sgs0;->k4:Ll/dgs0;

    .line 85
    .line 86
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    invoke-virtual {v0, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    check-cast p1, Ljava/lang/Long;

    .line 95
    .line 96
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 97
    .line 98
    .line 99
    move-result-wide v0

    .line 100
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 105
    .line 106
    .line 107
    invoke-static {}, Ll/bxy0;->f()Ll/ccs0;

    .line 108
    .line 109
    .line 110
    iget-object p1, p0, Ll/dgt0;->a:Landroid/content/Context;

    .line 111
    .line 112
    iget-object v3, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 113
    .line 114
    invoke-static {p1, v3}, Ll/ccs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzbbb;)Ljava/util/concurrent/Future;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    const/4 v3, 0x0

    .line 119
    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 120
    .line 121
    invoke-interface {p1, v0, v1, v4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    check-cast v0, Ll/dcs0;

    .line 126
    .line 127
    invoke-virtual {v0}, Ll/dcs0;->d()Z

    .line 128
    .line 129
    .line 130
    invoke-virtual {v0}, Ll/dcs0;->f()Z

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    iput-boolean v1, p0, Ll/dgt0;->j:Z

    .line 135
    .line 136
    invoke-virtual {v0}, Ll/dcs0;->e()Z

    .line 137
    .line 138
    .line 139
    move-result v1

    .line 140
    iput-boolean v1, p0, Ll/dgt0;->k:Z

    .line 141
    .line 142
    invoke-virtual {v0}, Ll/dcs0;->a()J

    .line 143
    .line 144
    .line 145
    invoke-virtual {p0}, Ll/dgt0;->j()Z

    .line 146
    .line 147
    .line 148
    move-result v1

    .line 149
    if-nez v1, :cond_1

    .line 150
    .line 151
    invoke-virtual {v0}, Ll/dcs0;->c()Ljava/io/InputStream;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iput-object v0, p0, Ll/dgt0;->f:Ljava/io/InputStream;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 156
    .line 157
    goto :goto_1

    .line 158
    :catch_0
    :try_start_1
    invoke-interface {p1, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 159
    .line 160
    .line 161
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 162
    .line 163
    .line 164
    move-result-object p0

    .line 165
    invoke-virtual {p0}, Ljava/lang/Thread;->interrupt()V

    .line 166
    .line 167
    .line 168
    goto :goto_1

    .line 169
    :catch_1
    invoke-interface {p1, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 170
    .line 171
    .line 172
    :catchall_0
    :cond_1
    :goto_1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 173
    .line 174
    .line 175
    move-result-object p0

    .line 176
    invoke-interface {p0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 177
    .line 178
    .line 179
    throw v2

    .line 180
    :cond_2
    if-eqz v1, :cond_3

    .line 181
    .line 182
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 183
    .line 184
    iget-wide v1, p1, Ll/akx0;->f:J

    .line 185
    .line 186
    iput-wide v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzh:J

    .line 187
    .line 188
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 189
    .line 190
    iget-object v1, p0, Ll/dgt0;->c:Ljava/lang/String;

    .line 191
    .line 192
    invoke-static {v1}, Ll/epw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v1

    .line 196
    iput-object v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzi:Ljava/lang/String;

    .line 197
    .line 198
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 199
    .line 200
    iget v1, p0, Ll/dgt0;->d:I

    .line 201
    .line 202
    iput v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzj:I

    .line 203
    .line 204
    invoke-static {}, Ll/bxy0;->e()Ll/hbs0;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iget-object v1, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 209
    .line 210
    invoke-virtual {v0, v1}, Ll/hbs0;->b(Lcom/google/android/gms/internal/ads/zzbbb;)Lcom/google/android/gms/internal/ads/zzbay;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    :cond_3
    if-eqz v2, :cond_4

    .line 215
    .line 216
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/zzbay;->zze()Z

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    if-eqz v0, :cond_4

    .line 221
    .line 222
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/zzbay;->h0()Z

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    iput-boolean v0, p0, Ll/dgt0;->j:Z

    .line 227
    .line 228
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/zzbay;->J()Z

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    iput-boolean v0, p0, Ll/dgt0;->k:Z

    .line 233
    .line 234
    invoke-virtual {p0}, Ll/dgt0;->j()Z

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    if-nez v0, :cond_4

    .line 239
    .line 240
    invoke-virtual {v2}, Lcom/google/android/gms/internal/ads/zzbay;->I()Ljava/io/InputStream;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    iput-object p1, p0, Ll/dgt0;->f:Ljava/io/InputStream;

    .line 245
    .line 246
    const-wide/16 p0, -0x1

    .line 247
    .line 248
    return-wide p0

    .line 249
    :cond_4
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 250
    .line 251
    if-eqz v0, :cond_5

    .line 252
    .line 253
    new-instance v1, Ll/akx0;

    .line 254
    .line 255
    iget-object v0, p0, Ll/dgt0;->i:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 256
    .line 257
    iget-object v0, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zza:Ljava/lang/String;

    .line 258
    .line 259
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    iget-wide v4, p1, Ll/akx0;->e:J

    .line 264
    .line 265
    iget-wide v6, p1, Ll/akx0;->f:J

    .line 266
    .line 267
    iget-wide v8, p1, Ll/akx0;->g:J

    .line 268
    .line 269
    const/4 v10, 0x0

    .line 270
    iget v11, p1, Ll/akx0;->i:I

    .line 271
    .line 272
    const/4 v3, 0x0

    .line 273
    invoke-direct/range {v1 .. v11}, Ll/akx0;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 274
    .line 275
    .line 276
    iput-object v1, p0, Ll/dgt0;->m:Ll/akx0;

    .line 277
    .line 278
    :cond_5
    iget-object p1, p0, Ll/dgt0;->b:Ll/fex0;

    .line 279
    .line 280
    iget-object p0, p0, Ll/dgt0;->m:Ll/akx0;

    .line 281
    .line 282
    invoke-interface {p1, p0}, Ll/fex0;->e(Ll/akx0;)J

    .line 283
    .line 284
    .line 285
    move-result-wide p0

    .line 286
    return-wide p0

    .line 287
    :cond_6
    const-string p0, "Attempt to open an already open CacheDataSource."

    .line 288
    .line 289
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 290
    .line 291
    .line 292
    const-wide/16 p0, 0x0

    .line 293
    .line 294
    return-wide p0
.end method

.method public final f(Ll/btx0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public final j()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/dgt0;->e:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    sget-object v0, Ll/sgs0;->m4:Ll/dgs0;

    .line 8
    .line 9
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ljava/lang/Boolean;

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v2, 0x1

    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    iget-boolean v0, p0, Ll/dgt0;->j:Z

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    return v2

    .line 32
    :cond_2
    :goto_0
    sget-object v0, Ll/sgs0;->n4:Ll/dgs0;

    .line 33
    .line 34
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    invoke-virtual {v3, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    check-cast v0, Ljava/lang/Boolean;

    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    iget-boolean p0, p0, Ll/dgt0;->k:Z

    .line 51
    .line 52
    if-nez p0, :cond_3

    .line 53
    .line 54
    return v2

    .line 55
    :cond_3
    return v1
.end method

.method public final zzc()Landroid/net/Uri;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/dgt0;->h:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/dgt0;->g:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/dgt0;->g:Z

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ll/dgt0;->h:Landroid/net/Uri;

    .line 10
    .line 11
    iget-object v1, p0, Ll/dgt0;->f:Ljava/io/InputStream;

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-static {v1}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/dgt0;->f:Ljava/io/InputStream;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    iget-object p0, p0, Ll/dgt0;->b:Ll/fex0;

    .line 22
    .line 23
    invoke-interface {p0}, Ll/fex0;->zzd()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    const-string p0, "Attempt to close an already closed CacheDataSource."

    .line 28
    .line 29
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final synthetic zze()Ljava/util/Map;
    .locals 0

    .line 1
    sget-object p0, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    .line 2
    .line 3
    return-object p0
.end method
