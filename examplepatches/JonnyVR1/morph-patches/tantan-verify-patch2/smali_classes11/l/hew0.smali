.class public final Ll/hew0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final k:Ljava/lang/Object;
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field

.field public static final l:Ljava/lang/Object;

.field public static final m:Ljava/lang/Object;

.field public static n:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "enabledLock"
    .end annotation

    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation
.end field


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/google/android/gms/internal/ads/zzcei;

.field public final c:Ll/lew0;
    .annotation build Landroidx/annotation/GuardedBy;
        value = "protoLock"
    .end annotation
.end field

.field public d:Ljava/lang/String;

.field public e:I

.field public final f:Ll/xtu0;

.field public final g:Ljava/util/List;

.field public h:Z
    .annotation build Landroidx/annotation/GuardedBy;
        value = "initLock"
    .end annotation
.end field

.field public final i:Ll/o8v0;

.field public final j:Ll/b5t0;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/hew0;->k:Ljava/lang/Object;

    .line 7
    .line 8
    new-instance v0, Ljava/lang/Object;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/hew0;->l:Ljava/lang/Object;

    .line 14
    .line 15
    new-instance v0, Ljava/lang/Object;

    .line 16
    .line 17
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 18
    .line 19
    .line 20
    sput-object v0, Ll/hew0;->m:Ljava/lang/Object;

    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Lcom/google/android/gms/internal/ads/zzcei;Ll/xtu0;Ll/o8v0;Ll/b5t0;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/android/gms/internal/ads/r1;->M()Ll/lew0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/hew0;->c:Ll/lew0;

    .line 9
    .line 10
    const-string v0, ""

    .line 11
    .line 12
    iput-object v0, p0, Ll/hew0;->d:Ljava/lang/String;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/hew0;->h:Z

    .line 16
    .line 17
    iput-object p1, p0, Ll/hew0;->a:Landroid/content/Context;

    .line 18
    .line 19
    iput-object p2, p0, Ll/hew0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 20
    .line 21
    iput-object p3, p0, Ll/hew0;->f:Ll/xtu0;

    .line 22
    .line 23
    iput-object p4, p0, Ll/hew0;->i:Ll/o8v0;

    .line 24
    .line 25
    iput-object p5, p0, Ll/hew0;->j:Ll/b5t0;

    .line 26
    .line 27
    sget-object p1, Ll/sgs0;->J8:Ll/dgs0;

    .line 28
    .line 29
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    check-cast p1, Ljava/lang/Boolean;

    .line 38
    .line 39
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_0

    .line 44
    .line 45
    invoke-static {}, Lcom/google/android/gms/ads/internal/util/b;->F()Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Ll/hew0;->g:Ljava/util/List;

    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-static {}, Lcom/google/android/gms/internal/ads/zzgaa;->zzl()Lcom/google/android/gms/internal/ads/zzgaa;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Ll/hew0;->g:Ljava/util/List;

    .line 57
    .line 58
    return-void
.end method

.method public static a()Z
    .locals 5

    .line 1
    sget-object v0, Ll/hew0;->k:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-object v1, Ll/hew0;->n:Ljava/lang/Boolean;

    .line 5
    .line 6
    if-nez v1, :cond_2

    .line 7
    .line 8
    sget-object v1, Ll/ris0;->b:Ll/kis0;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    check-cast v1, Ljava/lang/Boolean;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-nez v1, :cond_0

    .line 21
    .line 22
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    sput-object v1, Ll/hew0;->n:Ljava/lang/Boolean;

    .line 25
    .line 26
    goto :goto_1

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    goto :goto_2

    .line 29
    :cond_0
    sget-object v1, Ll/ris0;->a:Ll/kis0;

    .line 30
    .line 31
    invoke-virtual {v1}, Ll/kis0;->e()Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    check-cast v1, Ljava/lang/Double;

    .line 36
    .line 37
    invoke-virtual {v1}, Ljava/lang/Double;->doubleValue()D

    .line 38
    .line 39
    .line 40
    move-result-wide v1

    .line 41
    invoke-static {}, Ljava/lang/Math;->random()D

    .line 42
    .line 43
    .line 44
    move-result-wide v3

    .line 45
    cmpg-double v1, v3, v1

    .line 46
    .line 47
    if-gez v1, :cond_1

    .line 48
    .line 49
    const/4 v1, 0x1

    .line 50
    goto :goto_0

    .line 51
    :cond_1
    const/4 v1, 0x0

    .line 52
    :goto_0
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    sput-object v1, Ll/hew0;->n:Ljava/lang/Boolean;

    .line 57
    .line 58
    :cond_2
    :goto_1
    sget-object v1, Ll/hew0;->n:Ljava/lang/Boolean;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    monitor-exit v0

    .line 65
    return v1

    .line 66
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    throw v1
.end method


# virtual methods
.method public final b(Ll/vdw0;)V
    .locals 2
    .param p1    # Ll/vdw0;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/oct0;->a:Ll/xvw0;

    .line 2
    .line 3
    new-instance v1, Ll/gew0;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/gew0;-><init>(Ll/hew0;Ll/vdw0;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final synthetic c(Ll/vdw0;)V
    .locals 8

    .line 1
    sget-object v7, Ll/hew0;->m:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v7

    .line 4
    :try_start_0
    iget-boolean v0, p0, Ll/hew0;->h:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    monitor-exit v7

    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto/16 :goto_5

    .line 13
    .line 14
    :cond_0
    const/4 v0, 0x1

    .line 15
    iput-boolean v0, p0, Ll/hew0;->h:Z

    .line 16
    .line 17
    invoke-static {}, Ll/hew0;->a()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    goto :goto_2

    .line 25
    :cond_1
    :try_start_1
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Ll/hew0;->a:Landroid/content/Context;

    .line 29
    .line 30
    invoke-static {v0}, Lcom/google/android/gms/ads/internal/util/b;->R(Landroid/content/Context;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    iput-object v0, p0, Ll/hew0;->d:Ljava/lang/String;
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :catch_0
    move-exception v0

    .line 38
    :try_start_2
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    const-string v3, "CuiMonitor.gettingAppIdFromManifest"

    .line 43
    .line 44
    invoke-virtual {v2, v0, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :goto_0
    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailabilityLight;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    iget-object v2, p0, Ll/hew0;->a:Landroid/content/Context;

    .line 52
    .line 53
    invoke-virtual {v0, v2}, Lcom/google/android/gms/common/GoogleApiAvailabilityLight;->getApkVersion(Landroid/content/Context;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Ll/hew0;->e:I

    .line 58
    .line 59
    sget-object v0, Ll/sgs0;->E8:Ll/dgs0;

    .line 60
    .line 61
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 62
    .line 63
    .line 64
    move-result-object v2

    .line 65
    invoke-virtual {v2, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    check-cast v0, Ljava/lang/Integer;

    .line 70
    .line 71
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    sget-object v2, Ll/sgs0;->kb:Ll/dgs0;

    .line 76
    .line 77
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 78
    .line 79
    .line 80
    move-result-object v3

    .line 81
    invoke-virtual {v3, v2}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    check-cast v2, Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result v2

    .line 91
    if-eqz v2, :cond_2

    .line 92
    .line 93
    sget-object v2, Ll/oct0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 94
    .line 95
    move-object v4, v2

    .line 96
    int-to-long v2, v0

    .line 97
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 98
    .line 99
    move-object v0, v4

    .line 100
    move-wide v4, v2

    .line 101
    move-object v1, p0

    .line 102
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleWithFixedDelay(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 103
    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_2
    sget-object v1, Ll/oct0;->d:Ljava/util/concurrent/ScheduledExecutorService;

    .line 107
    .line 108
    int-to-long v2, v0

    .line 109
    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 110
    .line 111
    move-wide v4, v2

    .line 112
    move-object v0, v1

    .line 113
    move-object v1, p0

    .line 114
    invoke-interface/range {v0 .. v6}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 115
    .line 116
    .line 117
    :goto_1
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 118
    :goto_2
    invoke-static {}, Ll/hew0;->a()Z

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    if-nez v0, :cond_3

    .line 123
    .line 124
    goto/16 :goto_4

    .line 125
    .line 126
    :cond_3
    if-eqz p1, :cond_6

    .line 127
    .line 128
    sget-object v2, Ll/hew0;->l:Ljava/lang/Object;

    .line 129
    .line 130
    monitor-enter v2

    .line 131
    :try_start_3
    iget-object v0, p0, Ll/hew0;->c:Ll/lew0;

    .line 132
    .line 133
    invoke-virtual {v0}, Ll/lew0;->q()I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    sget-object v3, Ll/sgs0;->F8:Ll/dgs0;

    .line 138
    .line 139
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 140
    .line 141
    .line 142
    move-result-object v4

    .line 143
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v3

    .line 147
    check-cast v3, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v3

    .line 153
    if-lt v0, v3, :cond_4

    .line 154
    .line 155
    monitor-exit v2

    .line 156
    goto/16 :goto_4

    .line 157
    .line 158
    :catchall_1
    move-exception v0

    .line 159
    goto/16 :goto_3

    .line 160
    .line 161
    :cond_4
    invoke-static {}, Lcom/google/android/gms/internal/ads/p1;->L()Ll/jew0;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    invoke-virtual {p1}, Ll/vdw0;->l()I

    .line 166
    .line 167
    .line 168
    move-result v3

    .line 169
    invoke-virtual {v0, v3}, Ll/jew0;->N(I)Ll/jew0;

    .line 170
    .line 171
    .line 172
    invoke-virtual {p1}, Ll/vdw0;->k()Z

    .line 173
    .line 174
    .line 175
    move-result v3

    .line 176
    invoke-virtual {v0, v3}, Ll/jew0;->G(Z)Ll/jew0;

    .line 177
    .line 178
    .line 179
    invoke-virtual {p1}, Ll/vdw0;->b()J

    .line 180
    .line 181
    .line 182
    move-result-wide v3

    .line 183
    invoke-virtual {v0, v3, v4}, Ll/jew0;->w(J)Ll/jew0;

    .line 184
    .line 185
    .line 186
    const/4 v3, 0x3

    .line 187
    invoke-virtual {v0, v3}, Ll/jew0;->P(I)Ll/jew0;

    .line 188
    .line 189
    .line 190
    iget-object v3, p0, Ll/hew0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 191
    .line 192
    iget-object v3, v3, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 193
    .line 194
    invoke-virtual {v0, v3}, Ll/jew0;->C(Ljava/lang/String;)Ll/jew0;

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Ll/hew0;->d:Ljava/lang/String;

    .line 198
    .line 199
    invoke-virtual {v0, v3}, Ll/jew0;->r(Ljava/lang/String;)Ll/jew0;

    .line 200
    .line 201
    .line 202
    sget-object v3, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 203
    .line 204
    invoke-virtual {v0, v3}, Ll/jew0;->A(Ljava/lang/String;)Ll/jew0;

    .line 205
    .line 206
    .line 207
    sget v3, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 208
    .line 209
    invoke-virtual {v0, v3}, Ll/jew0;->K(I)Ll/jew0;

    .line 210
    .line 211
    .line 212
    invoke-virtual {p1}, Ll/vdw0;->n()I

    .line 213
    .line 214
    .line 215
    move-result v3

    .line 216
    invoke-virtual {v0, v3}, Ll/jew0;->O(I)Ll/jew0;

    .line 217
    .line 218
    .line 219
    invoke-virtual {p1}, Ll/vdw0;->a()I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    invoke-virtual {v0, v3}, Ll/jew0;->z(I)Ll/jew0;

    .line 224
    .line 225
    .line 226
    iget v3, p0, Ll/hew0;->e:I

    .line 227
    .line 228
    int-to-long v3, v3

    .line 229
    invoke-virtual {v0, v3, v4}, Ll/jew0;->u(J)Ll/jew0;

    .line 230
    .line 231
    .line 232
    invoke-virtual {p1}, Ll/vdw0;->m()I

    .line 233
    .line 234
    .line 235
    move-result v3

    .line 236
    invoke-virtual {v0, v3}, Ll/jew0;->M(I)Ll/jew0;

    .line 237
    .line 238
    .line 239
    invoke-virtual {p1}, Ll/vdw0;->d()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    invoke-virtual {v0, v3}, Ll/jew0;->s(Ljava/lang/String;)Ll/jew0;

    .line 244
    .line 245
    .line 246
    invoke-virtual {p1}, Ll/vdw0;->f()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v3

    .line 250
    invoke-virtual {v0, v3}, Ll/jew0;->v(Ljava/lang/String;)Ll/jew0;

    .line 251
    .line 252
    .line 253
    invoke-virtual {p1}, Ll/vdw0;->g()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v3

    .line 257
    invoke-virtual {v0, v3}, Ll/jew0;->x(Ljava/lang/String;)Ll/jew0;

    .line 258
    .line 259
    .line 260
    iget-object v3, p0, Ll/hew0;->f:Ll/xtu0;

    .line 261
    .line 262
    invoke-virtual {p1}, Ll/vdw0;->g()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v4

    .line 266
    invoke-virtual {v3, v4}, Ll/xtu0;->c(Ljava/lang/String;)Ljava/lang/String;

    .line 267
    .line 268
    .line 269
    move-result-object v3

    .line 270
    invoke-virtual {v0, v3}, Ll/jew0;->y(Ljava/lang/String;)Ll/jew0;

    .line 271
    .line 272
    .line 273
    invoke-virtual {p1}, Ll/vdw0;->h()Ljava/lang/String;

    .line 274
    .line 275
    .line 276
    move-result-object v3

    .line 277
    invoke-virtual {v0, v3}, Ll/jew0;->B(Ljava/lang/String;)Ll/jew0;

    .line 278
    .line 279
    .line 280
    invoke-virtual {p1}, Ll/vdw0;->e()Ljava/lang/String;

    .line 281
    .line 282
    .line 283
    move-result-object v3

    .line 284
    invoke-virtual {v0, v3}, Ll/jew0;->t(Ljava/lang/String;)Ll/jew0;

    .line 285
    .line 286
    .line 287
    invoke-virtual {p1}, Ll/vdw0;->j()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v3

    .line 291
    invoke-virtual {v0, v3}, Ll/jew0;->L(Ljava/lang/String;)Ll/jew0;

    .line 292
    .line 293
    .line 294
    invoke-virtual {p1}, Ll/vdw0;->i()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v3

    .line 298
    invoke-virtual {v0, v3}, Ll/jew0;->D(Ljava/lang/String;)Ll/jew0;

    .line 299
    .line 300
    .line 301
    invoke-virtual {p1}, Ll/vdw0;->c()J

    .line 302
    .line 303
    .line 304
    move-result-wide v3

    .line 305
    invoke-virtual {v0, v3, v4}, Ll/jew0;->E(J)Ll/jew0;

    .line 306
    .line 307
    .line 308
    sget-object v3, Ll/sgs0;->J8:Ll/dgs0;

    .line 309
    .line 310
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 311
    .line 312
    .line 313
    move-result-object v4

    .line 314
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    check-cast v3, Ljava/lang/Boolean;

    .line 319
    .line 320
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 321
    .line 322
    .line 323
    move-result v3

    .line 324
    if-eqz v3, :cond_5

    .line 325
    .line 326
    iget-object v3, p0, Ll/hew0;->g:Ljava/util/List;

    .line 327
    .line 328
    invoke-virtual {v0, v3}, Ll/jew0;->q(Ljava/lang/Iterable;)Ll/jew0;

    .line 329
    .line 330
    .line 331
    :cond_5
    iget-object v1, p0, Ll/hew0;->c:Ll/lew0;

    .line 332
    .line 333
    invoke-static {}, Lcom/google/android/gms/internal/ads/q1;->L()Ll/mew0;

    .line 334
    .line 335
    .line 336
    move-result-object v3

    .line 337
    invoke-virtual {v3, v0}, Ll/mew0;->q(Ll/jew0;)Ll/mew0;

    .line 338
    .line 339
    .line 340
    invoke-virtual {v1, v3}, Ll/lew0;->r(Ll/mew0;)Ll/lew0;

    .line 341
    .line 342
    .line 343
    monitor-exit v2

    .line 344
    goto :goto_4

    .line 345
    :goto_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 346
    throw v0

    .line 347
    :cond_6
    :goto_4
    return-void

    .line 348
    :goto_5
    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 349
    throw v0
.end method

.method public final run()V
    .locals 9

    .line 1
    invoke-static {}, Ll/hew0;->a()Z

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
    sget-object v1, Ll/hew0;->l:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v1

    .line 11
    :try_start_0
    iget-object v0, p0, Ll/hew0;->c:Ll/lew0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/lew0;->q()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    monitor-exit v1

    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    move-object p0, v0

    .line 23
    goto :goto_2

    .line 24
    :cond_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    :try_start_1
    monitor-enter v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 26
    :try_start_2
    iget-object v0, p0, Ll/hew0;->c:Ll/lew0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Lcom/google/android/gms/internal/ads/r1;

    .line 33
    .line 34
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 35
    .line 36
    .line 37
    move-result-object v6

    .line 38
    iget-object v0, p0, Ll/hew0;->c:Ll/lew0;

    .line 39
    .line 40
    invoke-virtual {v0}, Ll/lew0;->s()Ll/lew0;

    .line 41
    .line 42
    .line 43
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 44
    :try_start_3
    new-instance v2, Ll/g8v0;

    .line 45
    .line 46
    sget-object v0, Ll/sgs0;->D8:Ll/dgs0;

    .line 47
    .line 48
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    move-object v3, v0

    .line 57
    check-cast v3, Ljava/lang/String;

    .line 58
    .line 59
    new-instance v5, Ljava/util/HashMap;

    .line 60
    .line 61
    invoke-direct {v5}, Ljava/util/HashMap;-><init>()V

    .line 62
    .line 63
    .line 64
    const-string v7, "application/x-protobuf"

    .line 65
    .line 66
    const/4 v8, 0x0

    .line 67
    const v4, 0xea60

    .line 68
    .line 69
    .line 70
    invoke-direct/range {v2 .. v8}, Ll/g8v0;-><init>(Ljava/lang/String;ILjava/util/Map;[BLjava/lang/String;Z)V

    .line 71
    .line 72
    .line 73
    iget-object v0, p0, Ll/hew0;->a:Landroid/content/Context;

    .line 74
    .line 75
    iget-object v1, p0, Ll/hew0;->b:Lcom/google/android/gms/internal/ads/zzcei;

    .line 76
    .line 77
    iget-object v1, v1, Lcom/google/android/gms/internal/ads/zzcei;->zza:Ljava/lang/String;

    .line 78
    .line 79
    iget-object p0, p0, Ll/hew0;->j:Ll/b5t0;

    .line 80
    .line 81
    invoke-static {}, Landroid/os/Binder;->getCallingUid()I

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    new-instance v4, Ll/n8v0;

    .line 86
    .line 87
    invoke-direct {v4, v0, v1, p0, v3}, Ll/n8v0;-><init>(Landroid/content/Context;Ljava/lang/String;Ll/b5t0;I)V

    .line 88
    .line 89
    .line 90
    invoke-virtual {v4, v2}, Ll/n8v0;->a(Ll/g8v0;)Ll/h8v0;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :catchall_1
    move-exception v0

    .line 95
    move-object p0, v0

    .line 96
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 97
    :try_start_5
    throw p0
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 98
    :catch_0
    move-exception v0

    .line 99
    move-object p0, v0

    .line 100
    nop

    .line 101
    instance-of v0, p0, Lcom/google/android/gms/internal/ads/zzead;

    .line 102
    .line 103
    if-eqz v0, :cond_3

    .line 104
    .line 105
    move-object v0, p0

    .line 106
    check-cast v0, Lcom/google/android/gms/internal/ads/zzead;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzead;->zza()I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    const/4 v1, 0x3

    .line 113
    if-eq v0, v1, :cond_2

    .line 114
    .line 115
    goto :goto_1

    .line 116
    :cond_2
    :goto_0
    return-void

    .line 117
    :cond_3
    :goto_1
    const-string v0, "CuiMonitor.sendCuiPing"

    .line 118
    .line 119
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 120
    .line 121
    .line 122
    move-result-object v1

    .line 123
    invoke-virtual {v1, p0, v0}, Ll/ebt0;->v(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    return-void

    .line 127
    :goto_2
    :try_start_6
    monitor-exit v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 128
    throw p0
.end method
