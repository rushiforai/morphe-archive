.class public final Ll/rtv0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/wuv0;


# instance fields
.field public final a:Ll/xvw0;

.field public final b:Ljava/util/concurrent/ScheduledExecutorService;

.field public final c:Ll/mkv0;

.field public final d:Landroid/content/Context;

.field public final e:Ll/o7w0;

.field public final f:Ll/dkv0;

.field public final g:Ll/huu0;

.field public final h:Ll/nzu0;

.field public final i:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ll/xvw0;Ljava/util/concurrent/ScheduledExecutorService;Ljava/lang/String;Ll/mkv0;Landroid/content/Context;Ll/o7w0;Ll/dkv0;Ll/huu0;Ll/nzu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/rtv0;->a:Ll/xvw0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/rtv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 7
    .line 8
    iput-object p3, p0, Ll/rtv0;->i:Ljava/lang/String;

    .line 9
    .line 10
    iput-object p4, p0, Ll/rtv0;->c:Ll/mkv0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/rtv0;->d:Landroid/content/Context;

    .line 13
    .line 14
    iput-object p6, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 15
    .line 16
    iput-object p7, p0, Ll/rtv0;->f:Ll/dkv0;

    .line 17
    .line 18
    iput-object p8, p0, Ll/rtv0;->g:Ll/huu0;

    .line 19
    .line 20
    iput-object p9, p0, Ll/rtv0;->h:Ll/nzu0;

    .line 21
    .line 22
    return-void
.end method

.method public static synthetic a(Ll/rtv0;)Ll/hpr;
    .locals 11

    .line 1
    sget-object v0, Ll/sgs0;->ra:Ll/dgs0;

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
    if-eqz v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 20
    .line 21
    iget-object v0, v0, Ll/o7w0;->f:Ljava/lang/String;

    .line 22
    .line 23
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object v0, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 31
    .line 32
    iget-object v0, v0, Ll/o7w0;->f:Ljava/lang/String;

    .line 33
    .line 34
    :goto_0
    sget-object v1, Ll/sgs0;->D1:Ll/dgs0;

    .line 35
    .line 36
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    check-cast v1, Ljava/lang/Boolean;

    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_1

    .line 51
    .line 52
    iget-object v1, p0, Ll/rtv0;->h:Ll/nzu0;

    .line 53
    .line 54
    invoke-virtual {v1}, Ll/nzu0;->a()Landroid/os/Bundle;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    goto :goto_1

    .line 59
    :cond_1
    new-instance v1, Landroid/os/Bundle;

    .line 60
    .line 61
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 62
    .line 63
    .line 64
    :goto_1
    new-instance v2, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    sget-object v3, Ll/sgs0;->M1:Ll/dgs0;

    .line 70
    .line 71
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 72
    .line 73
    .line 74
    move-result-object v4

    .line 75
    invoke-virtual {v4, v3}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v3

    .line 79
    check-cast v3, Ljava/lang/Boolean;

    .line 80
    .line 81
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 82
    .line 83
    .line 84
    move-result v3

    .line 85
    if-nez v3, :cond_3

    .line 86
    .line 87
    iget-object v3, p0, Ll/rtv0;->c:Ll/mkv0;

    .line 88
    .line 89
    iget-object v4, p0, Ll/rtv0;->i:Ljava/lang/String;

    .line 90
    .line 91
    invoke-virtual {v3, v4, v0}, Ll/mkv0;->b(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    check-cast v0, Lcom/google/android/gms/internal/ads/zzgad;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/google/android/gms/internal/ads/zzgad;->zzh()Lcom/google/android/gms/internal/ads/zzgaf;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    :goto_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 106
    .line 107
    .line 108
    move-result v3

    .line 109
    if-eqz v3, :cond_2

    .line 110
    .line 111
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    check-cast v3, Ljava/util/Map$Entry;

    .line 116
    .line 117
    invoke-interface {v3}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    move-object v6, v4

    .line 122
    check-cast v6, Ljava/lang/String;

    .line 123
    .line 124
    invoke-interface {v3}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    move-object v7, v3

    .line 129
    check-cast v7, Ljava/util/List;

    .line 130
    .line 131
    invoke-virtual {p0, v6}, Ll/rtv0;->d(Ljava/lang/String;)Landroid/os/Bundle;

    .line 132
    .line 133
    .line 134
    move-result-object v8

    .line 135
    const/4 v9, 0x1

    .line 136
    const/4 v10, 0x1

    .line 137
    move-object v5, p0

    .line 138
    invoke-virtual/range {v5 .. v10}, Ll/rtv0;->e(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;ZZ)Ll/gvw0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    invoke-interface {v2, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-object p0, v5

    .line 146
    goto :goto_2

    .line 147
    :cond_2
    move-object v5, p0

    .line 148
    iget-object p0, v5, Ll/rtv0;->c:Ll/mkv0;

    .line 149
    .line 150
    invoke-virtual {p0}, Ll/mkv0;->c()Ljava/util/Map;

    .line 151
    .line 152
    .line 153
    move-result-object p0

    .line 154
    invoke-virtual {v5, v2, p0}, Ll/rtv0;->g(Ljava/util/List;Ljava/util/Map;)V

    .line 155
    .line 156
    .line 157
    goto :goto_3

    .line 158
    :cond_3
    move-object v5, p0

    .line 159
    iget-object p0, v5, Ll/rtv0;->c:Ll/mkv0;

    .line 160
    .line 161
    iget-object v3, v5, Ll/rtv0;->i:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {p0, v3, v0}, Ll/mkv0;->a(Ljava/lang/String;Ljava/lang/String;)Ljava/util/Map;

    .line 164
    .line 165
    .line 166
    move-result-object p0

    .line 167
    invoke-virtual {v5, v2, p0}, Ll/rtv0;->g(Ljava/util/List;Ljava/util/Map;)V

    .line 168
    .line 169
    .line 170
    :goto_3
    invoke-static {v2}, Ll/pvw0;->b(Ljava/lang/Iterable;)Ll/ovw0;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    new-instance v0, Ll/mtv0;

    .line 175
    .line 176
    invoke-direct {v0, v2, v1}, Ll/mtv0;-><init>(Ljava/util/List;Landroid/os/Bundle;)V

    .line 177
    .line 178
    .line 179
    iget-object v1, v5, Ll/rtv0;->a:Ll/xvw0;

    .line 180
    .line 181
    invoke-virtual {p0, v0, v1}, Ll/ovw0;->a(Ljava/util/concurrent/Callable;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    return-object p0
.end method


# virtual methods
.method public final synthetic b(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;ZZ)Ll/hpr;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v3, Ll/tct0;

    .line 2
    .line 3
    invoke-direct {v3}, Ll/tct0;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz p5, :cond_0

    .line 8
    .line 9
    sget-object p5, Ll/sgs0;->E1:Ll/dgs0;

    .line 10
    .line 11
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0, p5}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p5

    .line 19
    check-cast p5, Ljava/lang/Boolean;

    .line 20
    .line 21
    invoke-virtual {p5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result p5

    .line 25
    if-nez p5, :cond_0

    .line 26
    .line 27
    iget-object p5, p0, Ll/rtv0;->f:Ll/dkv0;

    .line 28
    .line 29
    invoke-virtual {p5, p1}, Ll/dkv0;->b(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p5, p0, Ll/rtv0;->f:Ll/dkv0;

    .line 33
    .line 34
    invoke-virtual {p5, p1}, Ll/dkv0;->a(Ljava/lang/String;)Ll/hzs0;

    .line 35
    .line 36
    .line 37
    move-result-object p5

    .line 38
    :goto_0
    move-object v2, p5

    .line 39
    goto :goto_1

    .line 40
    :cond_0
    :try_start_0
    iget-object p5, p0, Ll/rtv0;->g:Ll/huu0;

    .line 41
    .line 42
    invoke-virtual {p5, p1}, Ll/huu0;->b(Ljava/lang/String;)Ll/hzs0;

    .line 43
    .line 44
    .line 45
    move-result-object p5
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 46
    goto :goto_0

    .line 47
    :catch_0
    move-exception v0

    .line 48
    move-object p5, v0

    .line 49
    const-string v0, "Couldn\'t create RTB adapter : "

    .line 50
    .line 51
    invoke-static {v0, p5}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 52
    .line 53
    .line 54
    move-object v2, v1

    .line 55
    :goto_1
    if-nez v2, :cond_2

    .line 56
    .line 57
    sget-object p0, Ll/sgs0;->u1:Ll/dgs0;

    .line 58
    .line 59
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p2, p0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    check-cast p0, Ljava/lang/Boolean;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 70
    .line 71
    .line 72
    move-result p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    invoke-static {p1, v3}, Ll/pkv0;->o8(Ljava/lang/String;Ll/tct0;)V

    .line 76
    .line 77
    .line 78
    goto/16 :goto_2

    .line 79
    .line 80
    :cond_1
    throw v1

    .line 81
    :cond_2
    new-instance v0, Ll/pkv0;

    .line 82
    .line 83
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 84
    .line 85
    .line 86
    move-result-object p5

    .line 87
    invoke-interface {p5}, Lcom/google/android/gms/common/util/Clock;->elapsedRealtime()J

    .line 88
    .line 89
    .line 90
    move-result-wide v4

    .line 91
    move-object v1, p1

    .line 92
    invoke-direct/range {v0 .. v5}, Ll/pkv0;-><init>(Ljava/lang/String;Ll/hzs0;Ll/tct0;J)V

    .line 93
    .line 94
    .line 95
    sget-object p1, Ll/sgs0;->z1:Ll/dgs0;

    .line 96
    .line 97
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 98
    .line 99
    .line 100
    move-result-object p5

    .line 101
    invoke-virtual {p5, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    check-cast p1, Ljava/lang/Boolean;

    .line 106
    .line 107
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 108
    .line 109
    .line 110
    move-result p1

    .line 111
    if-eqz p1, :cond_3

    .line 112
    .line 113
    iget-object p1, p0, Ll/rtv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 114
    .line 115
    new-instance p5, Ll/qtv0;

    .line 116
    .line 117
    invoke-direct {p5, v0}, Ll/qtv0;-><init>(Ll/pkv0;)V

    .line 118
    .line 119
    .line 120
    sget-object v1, Ll/sgs0;->s1:Ll/dgs0;

    .line 121
    .line 122
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    invoke-virtual {v4, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    check-cast v1, Ljava/lang/Long;

    .line 131
    .line 132
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 133
    .line 134
    .line 135
    move-result-wide v4

    .line 136
    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 137
    .line 138
    invoke-interface {p1, p5, v4, v5, v1}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 139
    .line 140
    .line 141
    :cond_3
    if-eqz p4, :cond_5

    .line 142
    .line 143
    sget-object p1, Ll/sgs0;->G1:Ll/dgs0;

    .line 144
    .line 145
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 146
    .line 147
    .line 148
    move-result-object p4

    .line 149
    invoke-virtual {p4, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p1

    .line 153
    check-cast p1, Ljava/lang/Boolean;

    .line 154
    .line 155
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 156
    .line 157
    .line 158
    move-result p1

    .line 159
    if-eqz p1, :cond_4

    .line 160
    .line 161
    iget-object p1, p0, Ll/rtv0;->a:Ll/xvw0;

    .line 162
    .line 163
    move-object v5, v0

    .line 164
    new-instance v0, Ll/ntv0;

    .line 165
    .line 166
    move-object v1, p0

    .line 167
    move-object v4, p2

    .line 168
    move-object v6, v3

    .line 169
    move-object v3, p3

    .line 170
    invoke-direct/range {v0 .. v6}, Ll/ntv0;-><init>(Ll/rtv0;Ll/hzs0;Landroid/os/Bundle;Ljava/util/List;Ll/pkv0;Ll/tct0;)V

    .line 171
    .line 172
    .line 173
    move-object v3, v6

    .line 174
    invoke-interface {p1, v0}, Ll/xvw0;->a(Ljava/lang/Runnable;)Ll/hpr;

    .line 175
    .line 176
    .line 177
    goto :goto_2

    .line 178
    :cond_4
    move-object v1, p0

    .line 179
    move-object v4, p2

    .line 180
    move-object p0, p3

    .line 181
    invoke-virtual {v1, v2, p0, v4, v0}, Ll/rtv0;->f(Ll/hzs0;Landroid/os/Bundle;Ljava/util/List;Ll/pkv0;)V

    .line 182
    .line 183
    .line 184
    goto :goto_2

    .line 185
    :cond_5
    invoke-virtual {v0}, Ll/pkv0;->zzd()V

    .line 186
    .line 187
    .line 188
    :goto_2
    return-object v3
.end method

.method public final synthetic c(Ll/hzs0;Landroid/os/Bundle;Ljava/util/List;Ll/pkv0;Ll/tct0;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/rtv0;->f(Ll/hzs0;Landroid/os/Bundle;Ljava/util/List;Ll/pkv0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catch_0
    move-exception p0

    .line 6
    invoke-virtual {p5, p0}, Ll/tct0;->c(Ljava/lang/Throwable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final d(Ljava/lang/String;)Landroid/os/Bundle;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 4
    .line 5
    iget-object p0, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzm:Landroid/os/Bundle;

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/os/Bundle;->getBundle(Ljava/lang/String;)Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public final e(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;ZZ)Ll/gvw0;
    .locals 7

    .line 1
    new-instance v0, Ll/otv0;

    .line 2
    .line 3
    move-object v1, p0

    .line 4
    move-object v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move-object v4, p3

    .line 7
    move v5, p4

    .line 8
    move v6, p5

    .line 9
    invoke-direct/range {v0 .. v6}, Ll/otv0;-><init>(Ll/rtv0;Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;ZZ)V

    .line 10
    .line 11
    .line 12
    iget-object p0, v1, Ll/rtv0;->a:Ll/xvw0;

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/pvw0;->k(Ll/wuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    invoke-static {p0}, Ll/gvw0;->C(Ll/hpr;)Ll/gvw0;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    sget-object p1, Ll/sgs0;->z1:Ll/dgs0;

    .line 23
    .line 24
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 25
    .line 26
    .line 27
    move-result-object p2

    .line 28
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Ljava/lang/Boolean;

    .line 33
    .line 34
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-nez p1, :cond_0

    .line 39
    .line 40
    sget-object p1, Ll/sgs0;->s1:Ll/dgs0;

    .line 41
    .line 42
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 43
    .line 44
    .line 45
    move-result-object p2

    .line 46
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    check-cast p1, Ljava/lang/Long;

    .line 51
    .line 52
    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    .line 53
    .line 54
    .line 55
    move-result-wide p1

    .line 56
    iget-object p3, v1, Ll/rtv0;->b:Ljava/util/concurrent/ScheduledExecutorService;

    .line 57
    .line 58
    sget-object p4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 59
    .line 60
    invoke-static {p0, p1, p2, p4, p3}, Ll/pvw0;->o(Ll/hpr;JLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/ScheduledExecutorService;)Ll/hpr;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    check-cast p0, Ll/gvw0;

    .line 65
    .line 66
    :cond_0
    new-instance p1, Ll/ptv0;

    .line 67
    .line 68
    invoke-direct {p1, v2}, Ll/ptv0;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object p2, v1, Ll/rtv0;->a:Ll/xvw0;

    .line 72
    .line 73
    const-class p3, Ljava/lang/Throwable;

    .line 74
    .line 75
    invoke-static {p0, p3, p1, p2}, Ll/pvw0;->e(Ll/hpr;Ljava/lang/Class;Ll/eow0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    check-cast p0, Ll/gvw0;

    .line 80
    .line 81
    return-object p0
.end method

.method public final f(Ll/hzs0;Landroid/os/Bundle;Ljava/util/List;Ll/pkv0;)V
    .locals 8
    .param p3    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/rtv0;->d:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v2

    .line 7
    const/4 v0, 0x0

    .line 8
    invoke-interface {p3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p3

    .line 12
    move-object v5, p3

    .line 13
    check-cast v5, Landroid/os/Bundle;

    .line 14
    .line 15
    iget-object v3, p0, Ll/rtv0;->i:Ljava/lang/String;

    .line 16
    .line 17
    iget-object p0, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 18
    .line 19
    iget-object v6, p0, Ll/o7w0;->e:Lcom/google/android/gms/ads/internal/client/zzq;

    .line 20
    .line 21
    move-object v1, p1

    .line 22
    move-object v4, p2

    .line 23
    move-object v7, p4

    .line 24
    invoke-interface/range {v1 .. v7}, Ll/hzs0;->s6(Ll/p1m;Ljava/lang/String;Landroid/os/Bundle;Landroid/os/Bundle;Lcom/google/android/gms/ads/internal/client/zzq;Ll/kzs0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public final g(Ljava/util/List;Ljava/util/Map;)V
    .locals 7

    .line 1
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 6
    .line 7
    .line 8
    move-result-object p2

    .line 9
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    check-cast v0, Ljava/util/Map$Entry;

    .line 20
    .line 21
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/qkv0;

    .line 26
    .line 27
    iget-object v2, v0, Ll/qkv0;->a:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {p0, v2}, Ll/rtv0;->d(Ljava/lang/String;)Landroid/os/Bundle;

    .line 30
    .line 31
    .line 32
    move-result-object v4

    .line 33
    iget-object v1, v0, Ll/qkv0;->e:Landroid/os/Bundle;

    .line 34
    .line 35
    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    iget-boolean v5, v0, Ll/qkv0;->b:Z

    .line 40
    .line 41
    iget-boolean v6, v0, Ll/qkv0;->c:Z

    .line 42
    .line 43
    move-object v1, p0

    .line 44
    invoke-virtual/range {v1 .. v6}, Ll/rtv0;->e(Ljava/lang/String;Ljava/util/List;Landroid/os/Bundle;ZZ)Ll/gvw0;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-object p0, v1

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    return-void
.end method

.method public final zza()I
    .locals 0

    .line 1
    const/16 p0, 0x20

    .line 2
    .line 3
    return p0
.end method

.method public final zzb()Ll/hpr;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/rtv0;->e:Ll/o7w0;

    .line 2
    .line 3
    iget-boolean v1, v0, Ll/o7w0;->q:Z

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-object v0, v0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 8
    .line 9
    invoke-static {v0}, Ll/qyv0;->b(Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {v0}, Ll/qyv0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    sget-object v1, Ll/sgs0;->F1:Ll/dgs0;

    .line 18
    .line 19
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-virtual {v2, v1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    const-string v2, ","

    .line 30
    .line 31
    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-interface {v1, v0}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-nez v0, :cond_0

    .line 44
    .line 45
    new-instance p0, Ll/stv0;

    .line 46
    .line 47
    new-instance v0, Lorg/json/JSONArray;

    .line 48
    .line 49
    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    .line 50
    .line 51
    .line 52
    invoke-virtual {v0}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    new-instance v1, Landroid/os/Bundle;

    .line 57
    .line 58
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 59
    .line 60
    .line 61
    invoke-direct {p0, v0, v1}, Ll/stv0;-><init>(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 62
    .line 63
    .line 64
    invoke-static {p0}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0

    .line 69
    :cond_0
    new-instance v0, Ll/ltv0;

    .line 70
    .line 71
    invoke-direct {v0, p0}, Ll/ltv0;-><init>(Ll/rtv0;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Ll/rtv0;->a:Ll/xvw0;

    .line 75
    .line 76
    invoke-static {v0, p0}, Ll/pvw0;->k(Ll/wuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    return-object p0
.end method
