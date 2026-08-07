.class public final Ll/zdv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ucv0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/zxt0;

.field public final c:Ljava/util/concurrent/Executor;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/zxt0;Ljava/util/concurrent/Executor;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/zdv0;->b:Ll/zxt0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/zdv0;->c:Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final bridge synthetic a(Ll/b7w0;Ll/q6w0;Ll/scv0;)Ljava/lang/Object;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;,
            Lcom/google/android/gms/internal/ads/zzeml;
        }
    .end annotation

    .line 1
    sget-object v0, Ll/sgs0;->I7:Ll/dgs0;

    .line 2
    .line 3
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Boolean;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    const/4 v1, 0x0

    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-boolean v0, p2, Ll/q6w0;->h0:Z

    .line 21
    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 25
    .line 26
    check-cast v0, Ll/r8w0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/r8w0;->h()Ll/mxs0;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    :try_start_0
    invoke-interface {v0}, Ll/mxs0;->zze()Ll/p1m;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    invoke-static {v2}, Ll/h950;->P2(Ll/p1m;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    check-cast v2, Landroid/view/View;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/mxs0;->zzf()Z

    .line 45
    .line 46
    .line 47
    move-result v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    invoke-static {v1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v3, Ll/xdv0;

    .line 57
    .line 58
    invoke-direct {v3, p0, v2, p2}, Ll/xdv0;-><init>(Ll/zdv0;Landroid/view/View;Ll/q6w0;)V

    .line 59
    .line 60
    .line 61
    sget-object v2, Ll/oct0;->e:Ll/xvw0;

    .line 62
    .line 63
    invoke-static {v0, v3, v2}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    :try_start_1
    invoke-interface {v0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    move-object v2, v0

    .line 72
    check-cast v2, Landroid/view/View;
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    .line 74
    goto :goto_1

    .line 75
    :catch_0
    move-exception p0

    .line 76
    goto :goto_0

    .line 77
    :catch_1
    move-exception p0

    .line 78
    :goto_0
    invoke-static {p0}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 79
    .line 80
    .line 81
    return-object v1

    .line 82
    :cond_0
    new-instance p0, Lcom/google/android/gms/internal/ads/zzfho;

    .line 83
    .line 84
    new-instance p1, Ljava/lang/Exception;

    .line 85
    .line 86
    const-string p2, "BannerAdapterWrapper interscrollerView should not be null"

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-direct {p0, p1}, Lcom/google/android/gms/internal/ads/zzfho;-><init>(Ljava/lang/Throwable;)V

    .line 92
    .line 93
    .line 94
    throw p0

    .line 95
    :catch_2
    move-exception p0

    .line 96
    invoke-static {p0}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    return-object v1

    .line 100
    :cond_1
    const-string p0, "getInterscrollerAd should not be null after loadInterscrollerAd loaded ad."

    .line 101
    .line 102
    invoke-static {p0}, Ll/dct0;->d(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    new-instance p1, Lcom/google/android/gms/internal/ads/zzfho;

    .line 106
    .line 107
    new-instance p2, Ljava/lang/Exception;

    .line 108
    .line 109
    invoke-direct {p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 110
    .line 111
    .line 112
    invoke-direct {p1, p2}, Lcom/google/android/gms/internal/ads/zzfho;-><init>(Ljava/lang/Throwable;)V

    .line 113
    .line 114
    .line 115
    throw p1

    .line 116
    :cond_2
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 117
    .line 118
    check-cast v0, Ll/r8w0;

    .line 119
    .line 120
    invoke-virtual {v0}, Ll/r8w0;->f()Landroid/view/View;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/zdv0;->b:Ll/zxt0;

    .line 125
    .line 126
    iget-object v3, p3, Ll/scv0;->a:Ljava/lang/String;

    .line 127
    .line 128
    new-instance v4, Ll/a0u0;

    .line 129
    .line 130
    invoke-direct {v4, p1, p2, v3}, Ll/a0u0;-><init>(Ll/b7w0;Ll/q6w0;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 134
    .line 135
    new-instance v3, Ll/bxt0;

    .line 136
    .line 137
    check-cast p1, Ll/r8w0;

    .line 138
    .line 139
    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    new-instance v5, Ll/ydv0;

    .line 143
    .line 144
    invoke-direct {v5, p1}, Ll/ydv0;-><init>(Ll/r8w0;)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p2, Ll/q6w0;->v:Ljava/util/List;

    .line 148
    .line 149
    const/4 p2, 0x0

    .line 150
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    check-cast p1, Ll/r6w0;

    .line 155
    .line 156
    invoke-direct {v3, v2, v1, v5, p1}, Ll/bxt0;-><init>(Landroid/view/View;Ll/wit0;Ll/izt0;Ll/r6w0;)V

    .line 157
    .line 158
    .line 159
    invoke-virtual {v0, v4, v3}, Ll/zxt0;->a(Ll/a0u0;Ll/bxt0;)Ll/vwt0;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    invoke-virtual {p1}, Ll/vwt0;->i()Ll/agu0;

    .line 164
    .line 165
    .line 166
    move-result-object p2

    .line 167
    invoke-virtual {p2, v2}, Ll/agu0;->w0(Landroid/view/View;)V

    .line 168
    .line 169
    .line 170
    invoke-virtual {p1}, Ll/lzt0;->c()Ll/o7u0;

    .line 171
    .line 172
    .line 173
    move-result-object p2

    .line 174
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 175
    .line 176
    new-instance v1, Ll/ntt0;

    .line 177
    .line 178
    check-cast v0, Ll/r8w0;

    .line 179
    .line 180
    invoke-direct {v1, v0}, Ll/ntt0;-><init>(Ll/r8w0;)V

    .line 181
    .line 182
    .line 183
    iget-object p0, p0, Ll/zdv0;->c:Ljava/util/concurrent/Executor;

    .line 184
    .line 185
    invoke-virtual {p2, v1, p0}, Ll/kdu0;->q0(Ljava/lang/Object;Ljava/util/concurrent/Executor;)V

    .line 186
    .line 187
    .line 188
    iget-object p0, p3, Ll/scv0;->c:Ll/g8u0;

    .line 189
    .line 190
    check-cast p0, Ll/vev0;

    .line 191
    .line 192
    invoke-virtual {p1}, Ll/lzt0;->g()Ll/ijv0;

    .line 193
    .line 194
    .line 195
    move-result-object p2

    .line 196
    invoke-virtual {p0, p2}, Ll/vev0;->p8(Ll/jxs0;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {p1}, Ll/vwt0;->h()Ll/uwt0;

    .line 200
    .line 201
    .line 202
    move-result-object p0

    .line 203
    return-object p0
.end method

.method public final b(Ll/b7w0;Ll/q6w0;Ll/scv0;)V
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    iget-object v0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/y6w0;->a:Ll/o7w0;

    .line 4
    .line 5
    iget-object v0, v0, Ll/o7w0;->e:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 6
    .line 7
    iget-boolean v1, v0, Lcom/google/android/gms/ads/internal/client/zzq;->zzn:Z

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    iget-object v1, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 12
    .line 13
    new-instance v2, Lcom/google/android/gms/ads/internal/client/zzq;

    .line 14
    .line 15
    iget v3, v0, Lcom/google/android/gms/ads/internal/client/zzq;->zze:I

    .line 16
    .line 17
    iget v0, v0, Lcom/google/android/gms/ads/internal/client/zzq;->zzb:I

    .line 18
    .line 19
    invoke-static {v3, v0}, Ll/l9s0;->d(II)Ll/w70;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-direct {v2, v1, v0}, Lcom/google/android/gms/ads/internal/client/zzq;-><init>(Landroid/content/Context;Ll/w70;)V

    .line 24
    .line 25
    .line 26
    :goto_0
    move-object v5, v2

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    sget-object v1, Ll/sgs0;->I7:Ll/dgs0;

    .line 29
    .line 30
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/Boolean;

    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-eqz v1, :cond_1

    .line 45
    .line 46
    iget-boolean v1, p2, Ll/q6w0;->h0:Z

    .line 47
    .line 48
    if-eqz v1, :cond_1

    .line 49
    .line 50
    iget-object v1, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 51
    .line 52
    new-instance v2, Lcom/google/android/gms/ads/internal/client/zzq;

    .line 53
    .line 54
    iget v3, v0, Lcom/google/android/gms/ads/internal/client/zzq;->zze:I

    .line 55
    .line 56
    iget v0, v0, Lcom/google/android/gms/ads/internal/client/zzq;->zzb:I

    .line 57
    .line 58
    invoke-static {v3, v0}, Ll/l9s0;->e(II)Ll/w70;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-direct {v2, v1, v0}, Lcom/google/android/gms/ads/internal/client/zzq;-><init>(Landroid/content/Context;Ll/w70;)V

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :cond_1
    iget-object v0, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 67
    .line 68
    iget-object v1, p2, Ll/q6w0;->v:Ljava/util/List;

    .line 69
    .line 70
    invoke-static {v0, v1}, Ll/u7w0;->a(Landroid/content/Context;Ljava/util/List;)Lcom/google/android/gms/ads/internal/client/zzq;

    .line 71
    .line 72
    .line 73
    move-result-object v2

    .line 74
    goto :goto_0

    .line 75
    :goto_1
    sget-object v0, Ll/sgs0;->I7:Ll/dgs0;

    .line 76
    .line 77
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    check-cast v0, Ljava/lang/Boolean;

    .line 86
    .line 87
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    if-eqz v0, :cond_2

    .line 92
    .line 93
    iget-boolean v0, p2, Ll/q6w0;->h0:Z

    .line 94
    .line 95
    if-eqz v0, :cond_2

    .line 96
    .line 97
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 98
    .line 99
    iget-object v4, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 100
    .line 101
    move-object v3, v0

    .line 102
    check-cast v3, Ll/r8w0;

    .line 103
    .line 104
    iget-object p0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 105
    .line 106
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 107
    .line 108
    iget-object p1, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 109
    .line 110
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v7

    .line 114
    iget-object p1, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 115
    .line 116
    invoke-static {p1}, Ll/v0t0;->l(Ll/u6w0;)Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v8

    .line 120
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 121
    .line 122
    iget-object v6, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 123
    .line 124
    move-object v9, p1

    .line 125
    check-cast v9, Ll/jxs0;

    .line 126
    .line 127
    invoke-virtual/range {v3 .. v9}, Ll/r8w0;->s(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ljava/lang/String;Ll/jxs0;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_2
    iget-object v0, p3, Ll/scv0;->b:Ljava/lang/Object;

    .line 132
    .line 133
    iget-object v4, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 134
    .line 135
    move-object v3, v0

    .line 136
    check-cast v3, Ll/r8w0;

    .line 137
    .line 138
    iget-object p0, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 139
    .line 140
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 141
    .line 142
    iget-object p1, p2, Ll/q6w0;->w:Lorg/json/JSONObject;

    .line 143
    .line 144
    invoke-virtual {p1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v7

    .line 148
    iget-object p1, p2, Ll/q6w0;->t:Ll/u6w0;

    .line 149
    .line 150
    invoke-static {p1}, Ll/v0t0;->l(Ll/u6w0;)Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v8

    .line 154
    iget-object p1, p3, Ll/scv0;->c:Ll/g8u0;

    .line 155
    .line 156
    iget-object v6, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 157
    .line 158
    move-object v9, p1

    .line 159
    check-cast v9, Ll/jxs0;

    .line 160
    .line 161
    invoke-virtual/range {v3 .. v9}, Ll/r8w0;->r(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Lcom/google/android/gms/ads/internal/client/zzl;Ljava/lang/String;Ljava/lang/String;Ll/jxs0;)V

    .line 162
    .line 163
    .line 164
    return-void
.end method

.method public final synthetic c(Landroid/view/View;Ll/q6w0;Ljava/lang/Object;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/zdv0;->a:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0, p1, p2}, Lcom/google/android/gms/internal/ads/zzcvt;->a(Landroid/content/Context;Landroid/view/View;Ll/q6w0;)Lcom/google/android/gms/internal/ads/zzcvt;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
