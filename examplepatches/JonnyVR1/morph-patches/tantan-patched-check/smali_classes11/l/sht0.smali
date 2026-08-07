.class public final Ll/sht0;
.super Ll/m8x0;
.source "SourceFile"


# instance fields
.field public final e:Landroid/content/Context;

.field public final f:Ll/fex0;

.field public final g:Ljava/lang/String;

.field public final h:I

.field public final i:Z

.field public j:Ljava/io/InputStream;

.field public k:Z

.field public l:Landroid/net/Uri;

.field public volatile m:Lcom/google/android/gms/internal/ads/zzbbb;

.field public n:Z

.field public o:Z

.field public p:Z

.field public q:Z

.field public r:J

.field public s:Ll/hpr;

.field public final t:Ljava/util/concurrent/atomic/AtomicLong;

.field public final u:Ll/dit0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/fex0;Ljava/lang/String;ILl/btx0;Ll/dit0;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Ll/m8x0;-><init>(Z)V

    .line 3
    .line 4
    .line 5
    iput-object p1, p0, Ll/sht0;->e:Landroid/content/Context;

    .line 6
    .line 7
    iput-object p2, p0, Ll/sht0;->f:Ll/fex0;

    .line 8
    .line 9
    iput-object p6, p0, Ll/sht0;->u:Ll/dit0;

    .line 10
    .line 11
    iput-object p3, p0, Ll/sht0;->g:Ljava/lang/String;

    .line 12
    .line 13
    iput p4, p0, Ll/sht0;->h:I

    .line 14
    .line 15
    iput-boolean v0, p0, Ll/sht0;->n:Z

    .line 16
    .line 17
    iput-boolean v0, p0, Ll/sht0;->o:Z

    .line 18
    .line 19
    iput-boolean v0, p0, Ll/sht0;->p:Z

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/sht0;->q:Z

    .line 22
    .line 23
    const-wide/16 p1, 0x0

    .line 24
    .line 25
    iput-wide p1, p0, Ll/sht0;->r:J

    .line 26
    .line 27
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 28
    .line 29
    const-wide/16 p2, -0x1

    .line 30
    .line 31
    invoke-direct {p1, p2, p3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Ll/sht0;->t:Ljava/util/concurrent/atomic/AtomicLong;

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    iput-object p1, p0, Ll/sht0;->s:Ll/hpr;

    .line 38
    .line 39
    sget-object p1, Ll/sgs0;->Q1:Ll/dgs0;

    .line 40
    .line 41
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 42
    .line 43
    .line 44
    move-result-object p2

    .line 45
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    check-cast p1, Ljava/lang/Boolean;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 52
    .line 53
    .line 54
    move-result p1

    .line 55
    iput-boolean p1, p0, Ll/sht0;->i:Z

    .line 56
    .line 57
    invoke-virtual {p0, p5}, Ll/m8x0;->f(Ll/btx0;)V

    .line 58
    .line 59
    .line 60
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
    iget-boolean v0, p0, Ll/sht0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    iget-object v0, p0, Ll/sht0;->f:Ll/fex0;

    .line 15
    .line 16
    invoke-interface {v0, p1, p2, p3}, Ll/nyy0;->a([BII)I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    :goto_0
    iget-boolean p2, p0, Ll/sht0;->i:Z

    .line 21
    .line 22
    if-eqz p2, :cond_2

    .line 23
    .line 24
    iget-object p2, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 25
    .line 26
    if-eqz p2, :cond_1

    .line 27
    .line 28
    goto :goto_1

    .line 29
    :cond_1
    return p1

    .line 30
    :cond_2
    :goto_1
    invoke-virtual {p0, p1}, Ll/m8x0;->zzg(I)V

    .line 31
    .line 32
    .line 33
    return p1

    .line 34
    :cond_3
    const-string p0, "Attempt to read closed GcacheDataSource."

    .line 35
    .line 36
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x0

    .line 40
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
    const-string v1, "ms"

    .line 2
    .line 3
    const-string v2, "Cache connection took "

    .line 4
    .line 5
    iget-boolean v0, p0, Ll/sht0;->k:Z

    .line 6
    .line 7
    if-nez v0, :cond_9

    .line 8
    .line 9
    const/4 v3, 0x1

    .line 10
    iput-boolean v3, p0, Ll/sht0;->k:Z

    .line 11
    .line 12
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 13
    .line 14
    iput-object v0, p0, Ll/sht0;->l:Landroid/net/Uri;

    .line 15
    .line 16
    iget-boolean v0, p0, Ll/sht0;->i:Z

    .line 17
    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 21
    .line 22
    .line 23
    :cond_0
    iget-object v0, p1, Ll/akx0;->a:Landroid/net/Uri;

    .line 24
    .line 25
    invoke-static {v0}, Lcom/google/android/gms/internal/ads/zzbbb;->g(Landroid/net/Uri;)Lcom/google/android/gms/internal/ads/zzbbb;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 30
    .line 31
    sget-object v0, Ll/sgs0;->j4:Ll/dgs0;

    .line 32
    .line 33
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ljava/lang/Boolean;

    .line 42
    .line 43
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    iget-object v4, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 48
    .line 49
    const-wide/16 v5, -0x1

    .line 50
    .line 51
    const/4 v7, 0x0

    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    if-eqz v4, :cond_7

    .line 55
    .line 56
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 57
    .line 58
    iget-wide v8, p1, Ll/akx0;->f:J

    .line 59
    .line 60
    iput-wide v8, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzh:J

    .line 61
    .line 62
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 63
    .line 64
    iget-object v4, p0, Ll/sht0;->g:Ljava/lang/String;

    .line 65
    .line 66
    invoke-static {v4}, Ll/epw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v4

    .line 70
    iput-object v4, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzi:Ljava/lang/String;

    .line 71
    .line 72
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 73
    .line 74
    iget v4, p0, Ll/sht0;->h:I

    .line 75
    .line 76
    iput v4, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzj:I

    .line 77
    .line 78
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 79
    .line 80
    iget-boolean v0, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzg:Z

    .line 81
    .line 82
    if-eqz v0, :cond_1

    .line 83
    .line 84
    sget-object v0, Ll/sgs0;->l4:Ll/dgs0;

    .line 85
    .line 86
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 87
    .line 88
    .line 89
    move-result-object v4

    .line 90
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Ljava/lang/Long;

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :cond_1
    sget-object v0, Ll/sgs0;->k4:Ll/dgs0;

    .line 98
    .line 99
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 100
    .line 101
    .line 102
    move-result-object v4

    .line 103
    invoke-virtual {v4, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    check-cast v0, Ljava/lang/Long;

    .line 108
    .line 109
    :goto_0
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 110
    .line 111
    .line 112
    move-result-wide v8

    .line 113
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 118
    .line 119
    .line 120
    move-result-wide v10

    .line 121
    invoke-static {}, Ll/bxy0;->f()Ll/ccs0;

    .line 122
    .line 123
    .line 124
    iget-object v0, p0, Ll/sht0;->e:Landroid/content/Context;

    .line 125
    .line 126
    iget-object v4, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 127
    .line 128
    invoke-static {v0, v4}, Ll/ccs0;->a(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzbbb;)Ljava/util/concurrent/Future;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    :try_start_0
    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 133
    .line 134
    invoke-interface {v0, v8, v9, v4}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v4

    .line 138
    check-cast v4, Ll/dcs0;
    :try_end_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_0 .. :try_end_0} :catch_3
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 139
    .line 140
    :try_start_1
    invoke-virtual {v4}, Ll/dcs0;->d()Z

    .line 141
    .line 142
    .line 143
    move-result v8

    .line 144
    iput-boolean v8, p0, Ll/sht0;->n:Z

    .line 145
    .line 146
    invoke-virtual {v4}, Ll/dcs0;->f()Z

    .line 147
    .line 148
    .line 149
    move-result v8

    .line 150
    iput-boolean v8, p0, Ll/sht0;->p:Z

    .line 151
    .line 152
    invoke-virtual {v4}, Ll/dcs0;->e()Z

    .line 153
    .line 154
    .line 155
    move-result v8

    .line 156
    iput-boolean v8, p0, Ll/sht0;->q:Z

    .line 157
    .line 158
    invoke-virtual {v4}, Ll/dcs0;->a()J

    .line 159
    .line 160
    .line 161
    move-result-wide v8

    .line 162
    iput-wide v8, p0, Ll/sht0;->r:J

    .line 163
    .line 164
    invoke-virtual {p0}, Ll/sht0;->t()Z

    .line 165
    .line 166
    .line 167
    move-result v8

    .line 168
    if-nez v8, :cond_3

    .line 169
    .line 170
    invoke-virtual {v4}, Ll/dcs0;->c()Ljava/io/InputStream;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    iput-object v4, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 175
    .line 176
    iget-boolean v4, p0, Ll/sht0;->i:Z

    .line 177
    .line 178
    if-eqz v4, :cond_2

    .line 179
    .line 180
    invoke-virtual {p0, p1}, Ll/m8x0;->l(Ll/akx0;)V
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/TimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 181
    .line 182
    .line 183
    goto :goto_1

    .line 184
    :catchall_0
    move-exception v0

    .line 185
    move-object p1, v0

    .line 186
    goto/16 :goto_7

    .line 187
    .line 188
    :cond_2
    :goto_1
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 193
    .line 194
    .line 195
    move-result-wide v7

    .line 196
    sub-long/2addr v7, v10

    .line 197
    iget-object p1, p0, Ll/sht0;->u:Ll/dit0;

    .line 198
    .line 199
    iget-object p1, p1, Ll/dit0;->a:Ll/fit0;

    .line 200
    .line 201
    invoke-virtual {p1, v3, v7, v8}, Ll/fit0;->b0(ZJ)V

    .line 202
    .line 203
    .line 204
    iput-boolean v3, p0, Ll/sht0;->o:Z

    .line 205
    .line 206
    new-instance p0, Ljava/lang/StringBuilder;

    .line 207
    .line 208
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 209
    .line 210
    .line 211
    invoke-virtual {p0, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 215
    .line 216
    .line 217
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 222
    .line 223
    .line 224
    return-wide v5

    .line 225
    :cond_3
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 230
    .line 231
    .line 232
    move-result-wide v4

    .line 233
    sub-long/2addr v4, v10

    .line 234
    iget-object v0, p0, Ll/sht0;->u:Ll/dit0;

    .line 235
    .line 236
    iget-object v0, v0, Ll/dit0;->a:Ll/fit0;

    .line 237
    .line 238
    invoke-virtual {v0, v3, v4, v5}, Ll/fit0;->b0(ZJ)V

    .line 239
    .line 240
    .line 241
    iput-boolean v3, p0, Ll/sht0;->o:Z

    .line 242
    .line 243
    new-instance v0, Ljava/lang/StringBuilder;

    .line 244
    .line 245
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 246
    .line 247
    .line 248
    invoke-virtual {v0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 249
    .line 250
    .line 251
    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 252
    .line 253
    .line 254
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    invoke-static {v0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    goto/16 :goto_9

    .line 262
    .line 263
    :catch_0
    move v4, v3

    .line 264
    goto :goto_3

    .line 265
    :catch_1
    move v4, v3

    .line 266
    goto :goto_6

    .line 267
    :catchall_1
    move-exception v0

    .line 268
    move-object p1, v0

    .line 269
    move v3, v7

    .line 270
    goto :goto_7

    .line 271
    :catch_2
    move v4, v7

    .line 272
    :goto_3
    :try_start_2
    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 273
    .line 274
    .line 275
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-virtual {v0}, Ljava/lang/Thread;->interrupt()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 280
    .line 281
    .line 282
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 283
    .line 284
    .line 285
    move-result-object v0

    .line 286
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 287
    .line 288
    .line 289
    move-result-wide v5

    .line 290
    sub-long/2addr v5, v10

    .line 291
    iget-object v0, p0, Ll/sht0;->u:Ll/dit0;

    .line 292
    .line 293
    iget-object v0, v0, Ll/dit0;->a:Ll/fit0;

    .line 294
    .line 295
    invoke-virtual {v0, v4, v5, v6}, Ll/fit0;->b0(ZJ)V

    .line 296
    .line 297
    .line 298
    iput-boolean v4, p0, Ll/sht0;->o:Z

    .line 299
    .line 300
    new-instance v0, Ljava/lang/StringBuilder;

    .line 301
    .line 302
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 303
    .line 304
    .line 305
    :goto_4
    invoke-virtual {v0, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 306
    .line 307
    .line 308
    goto :goto_2

    .line 309
    :goto_5
    move v3, v4

    .line 310
    goto :goto_7

    .line 311
    :catch_3
    move v4, v7

    .line 312
    :goto_6
    :try_start_3
    invoke-interface {v0, v3}, Ljava/util/concurrent/Future;->cancel(Z)Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 313
    .line 314
    .line 315
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 316
    .line 317
    .line 318
    move-result-object v0

    .line 319
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 320
    .line 321
    .line 322
    move-result-wide v5

    .line 323
    sub-long/2addr v5, v10

    .line 324
    iget-object v0, p0, Ll/sht0;->u:Ll/dit0;

    .line 325
    .line 326
    iget-object v0, v0, Ll/dit0;->a:Ll/fit0;

    .line 327
    .line 328
    invoke-virtual {v0, v4, v5, v6}, Ll/fit0;->b0(ZJ)V

    .line 329
    .line 330
    .line 331
    iput-boolean v4, p0, Ll/sht0;->o:Z

    .line 332
    .line 333
    new-instance v0, Ljava/lang/StringBuilder;

    .line 334
    .line 335
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    goto :goto_4

    .line 339
    :catchall_2
    move-exception v0

    .line 340
    move-object p1, v0

    .line 341
    goto :goto_5

    .line 342
    :goto_7
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-interface {v0}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 347
    .line 348
    .line 349
    move-result-wide v4

    .line 350
    sub-long/2addr v4, v10

    .line 351
    iget-object v0, p0, Ll/sht0;->u:Ll/dit0;

    .line 352
    .line 353
    iget-object v0, v0, Ll/dit0;->a:Ll/fit0;

    .line 354
    .line 355
    invoke-virtual {v0, v3, v4, v5}, Ll/fit0;->b0(ZJ)V

    .line 356
    .line 357
    .line 358
    iput-boolean v3, p0, Ll/sht0;->o:Z

    .line 359
    .line 360
    new-instance p0, Ljava/lang/StringBuilder;

    .line 361
    .line 362
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 366
    .line 367
    .line 368
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 369
    .line 370
    .line 371
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    invoke-static {p0}, Ll/d2v0;->k(Ljava/lang/String;)V

    .line 376
    .line 377
    .line 378
    throw p1

    .line 379
    :cond_4
    if-eqz v4, :cond_5

    .line 380
    .line 381
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 382
    .line 383
    iget-wide v1, p1, Ll/akx0;->f:J

    .line 384
    .line 385
    iput-wide v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzh:J

    .line 386
    .line 387
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 388
    .line 389
    iget-object v1, p0, Ll/sht0;->g:Ljava/lang/String;

    .line 390
    .line 391
    invoke-static {v1}, Ll/epw0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 392
    .line 393
    .line 394
    move-result-object v1

    .line 395
    iput-object v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzi:Ljava/lang/String;

    .line 396
    .line 397
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 398
    .line 399
    iget v1, p0, Ll/sht0;->h:I

    .line 400
    .line 401
    iput v1, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zzj:I

    .line 402
    .line 403
    invoke-static {}, Ll/bxy0;->e()Ll/hbs0;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    iget-object v1, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 408
    .line 409
    invoke-virtual {v0, v1}, Ll/hbs0;->b(Lcom/google/android/gms/internal/ads/zzbbb;)Lcom/google/android/gms/internal/ads/zzbay;

    .line 410
    .line 411
    .line 412
    move-result-object v0

    .line 413
    goto :goto_8

    .line 414
    :cond_5
    const/4 v0, 0x0

    .line 415
    :goto_8
    if-eqz v0, :cond_7

    .line 416
    .line 417
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->zze()Z

    .line 418
    .line 419
    .line 420
    move-result v1

    .line 421
    if-eqz v1, :cond_7

    .line 422
    .line 423
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->zzd()Z

    .line 424
    .line 425
    .line 426
    move-result v1

    .line 427
    iput-boolean v1, p0, Ll/sht0;->n:Z

    .line 428
    .line 429
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->h0()Z

    .line 430
    .line 431
    .line 432
    move-result v1

    .line 433
    iput-boolean v1, p0, Ll/sht0;->p:Z

    .line 434
    .line 435
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->J()Z

    .line 436
    .line 437
    .line 438
    move-result v1

    .line 439
    iput-boolean v1, p0, Ll/sht0;->q:Z

    .line 440
    .line 441
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->F()J

    .line 442
    .line 443
    .line 444
    move-result-wide v1

    .line 445
    iput-wide v1, p0, Ll/sht0;->r:J

    .line 446
    .line 447
    iput-boolean v3, p0, Ll/sht0;->o:Z

    .line 448
    .line 449
    invoke-virtual {p0}, Ll/sht0;->t()Z

    .line 450
    .line 451
    .line 452
    move-result v1

    .line 453
    if-nez v1, :cond_7

    .line 454
    .line 455
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzbay;->I()Ljava/io/InputStream;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    iput-object v0, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 460
    .line 461
    iget-boolean v0, p0, Ll/sht0;->i:Z

    .line 462
    .line 463
    if-eqz v0, :cond_6

    .line 464
    .line 465
    invoke-virtual {p0, p1}, Ll/m8x0;->l(Ll/akx0;)V

    .line 466
    .line 467
    .line 468
    :cond_6
    return-wide v5

    .line 469
    :cond_7
    :goto_9
    iput-boolean v7, p0, Ll/sht0;->o:Z

    .line 470
    .line 471
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 472
    .line 473
    if-eqz v0, :cond_8

    .line 474
    .line 475
    new-instance v1, Ll/akx0;

    .line 476
    .line 477
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 478
    .line 479
    iget-object v0, v0, Lcom/google/android/gms/internal/ads/zzbbb;->zza:Ljava/lang/String;

    .line 480
    .line 481
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 482
    .line 483
    .line 484
    move-result-object v2

    .line 485
    iget-wide v4, p1, Ll/akx0;->e:J

    .line 486
    .line 487
    iget-wide v6, p1, Ll/akx0;->f:J

    .line 488
    .line 489
    iget-wide v8, p1, Ll/akx0;->g:J

    .line 490
    .line 491
    const/4 v10, 0x0

    .line 492
    iget v11, p1, Ll/akx0;->i:I

    .line 493
    .line 494
    const/4 v3, 0x0

    .line 495
    invoke-direct/range {v1 .. v11}, Ll/akx0;-><init>(Landroid/net/Uri;[BJJJLjava/lang/String;I)V

    .line 496
    .line 497
    .line 498
    move-object p1, v1

    .line 499
    :cond_8
    iget-object p0, p0, Ll/sht0;->f:Ll/fex0;

    .line 500
    .line 501
    invoke-interface {p0, p1}, Ll/fex0;->e(Ll/akx0;)J

    .line 502
    .line 503
    .line 504
    move-result-wide p0

    .line 505
    return-wide p0

    .line 506
    :cond_9
    const-string p0, "Attempt to open an already open GcacheDataSource."

    .line 507
    .line 508
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    const-wide/16 p0, 0x0

    .line 512
    .line 513
    return-wide p0
.end method

.method public final m()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ll/sht0;->r:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public final n()J
    .locals 5

    .line 1
    iget-object v0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 2
    .line 3
    const-wide/16 v1, -0x1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    goto :goto_1

    .line 8
    :cond_0
    iget-object v0, p0, Ll/sht0;->t:Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 11
    .line 12
    .line 13
    move-result-wide v3

    .line 14
    cmp-long v0, v3, v1

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object p0, p0, Ll/sht0;->t:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    return-wide v0

    .line 25
    :cond_1
    monitor-enter p0

    .line 26
    :try_start_0
    iget-object v0, p0, Ll/sht0;->s:Ll/hpr;

    .line 27
    .line 28
    if-nez v0, :cond_2

    .line 29
    .line 30
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 31
    .line 32
    new-instance v3, Ll/rht0;

    .line 33
    .line 34
    invoke-direct {v3, p0}, Ll/rht0;-><init>(Ll/sht0;)V

    .line 35
    .line 36
    .line 37
    invoke-interface {v0, v3}, Ll/xvw0;->R(Ljava/util/concurrent/Callable;)Ll/hpr;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/sht0;->s:Ll/hpr;

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto :goto_2

    .line 46
    :cond_2
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    iget-object v0, p0, Ll/sht0;->s:Ll/hpr;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-eqz v0, :cond_3

    .line 54
    .line 55
    :try_start_1
    iget-object v0, p0, Ll/sht0;->t:Ljava/util/concurrent/atomic/AtomicLong;

    .line 56
    .line 57
    iget-object v3, p0, Ll/sht0;->s:Ll/hpr;

    .line 58
    .line 59
    invoke-interface {v3}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Ljava/lang/Long;

    .line 64
    .line 65
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 66
    .line 67
    .line 68
    move-result-wide v3

    .line 69
    invoke-virtual {v0, v1, v2, v3, v4}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z
    :try_end_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 70
    .line 71
    .line 72
    iget-object p0, p0, Ll/sht0;->t:Ljava/util/concurrent/atomic/AtomicLong;

    .line 73
    .line 74
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 75
    .line 76
    .line 77
    move-result-wide v0

    .line 78
    return-wide v0

    .line 79
    :catch_0
    :cond_3
    :goto_1
    return-wide v1

    .line 80
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    throw v0
.end method

.method public final synthetic o()Ljava/lang/Long;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/bxy0;->e()Ll/hbs0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object p0, p0, Ll/sht0;->m:Lcom/google/android/gms/internal/ads/zzbbb;

    .line 6
    .line 7
    invoke-virtual {v0, p0}, Ll/hbs0;->a(Lcom/google/android/gms/internal/ads/zzbbb;)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public final p()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sht0;->n:Z

    .line 2
    .line 3
    return p0
.end method

.method public final q()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sht0;->q:Z

    .line 2
    .line 3
    return p0
.end method

.method public final r()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sht0;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public final s()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/sht0;->o:Z

    .line 2
    .line 3
    return p0
.end method

.method public final t()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Ll/sht0;->i:Z

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
    iget-boolean v0, p0, Ll/sht0;->p:Z

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
    iget-boolean p0, p0, Ll/sht0;->q:Z

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
    iget-object p0, p0, Ll/sht0;->l:Landroid/net/Uri;

    .line 2
    .line 3
    return-object p0
.end method

.method public final zzd()V
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/sht0;->k:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-boolean v0, p0, Ll/sht0;->k:Z

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    iput-object v1, p0, Ll/sht0;->l:Landroid/net/Uri;

    .line 10
    .line 11
    iget-boolean v2, p0, Ll/sht0;->i:Z

    .line 12
    .line 13
    const/4 v3, 0x1

    .line 14
    if-eqz v2, :cond_0

    .line 15
    .line 16
    iget-object v2, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 17
    .line 18
    if-eqz v2, :cond_1

    .line 19
    .line 20
    :cond_0
    move v0, v3

    .line 21
    :cond_1
    iget-object v2, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 22
    .line 23
    if-eqz v2, :cond_2

    .line 24
    .line 25
    invoke-static {v2}, Lcom/google/android/gms/common/util/IOUtils;->closeQuietly(Ljava/io/Closeable;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/sht0;->j:Ljava/io/InputStream;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_2
    iget-object v1, p0, Ll/sht0;->f:Ll/fex0;

    .line 32
    .line 33
    invoke-interface {v1}, Ll/fex0;->zzd()V

    .line 34
    .line 35
    .line 36
    :goto_0
    if-eqz v0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Ll/m8x0;->j()V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void

    .line 42
    :cond_4
    const-string p0, "Attempt to close an already closed GcacheDataSource."

    .line 43
    .line 44
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    return-void
.end method
