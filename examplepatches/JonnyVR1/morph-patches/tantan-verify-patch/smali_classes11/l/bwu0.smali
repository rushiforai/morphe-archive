.class public final Ll/bwu0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/hcu0;
.implements Ll/har0;
.implements Ll/j7u0;
.implements Ll/t6u0;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/f8w0;

.field public final c:Ll/xwu0;

.field public final d:Ll/b7w0;

.field public final e:Ll/q6w0;

.field public final f:Ll/fbv0;

.field public g:Ljava/lang/Boolean;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field

.field public final h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Ll/f8w0;Ll/xwu0;Ll/b7w0;Ll/q6w0;Ll/fbv0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/bwu0;->a:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/bwu0;->b:Ll/f8w0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/bwu0;->c:Ll/xwu0;

    .line 9
    .line 10
    iput-object p4, p0, Ll/bwu0;->d:Ll/b7w0;

    .line 11
    .line 12
    iput-object p5, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 13
    .line 14
    iput-object p6, p0, Ll/bwu0;->f:Ll/fbv0;

    .line 15
    .line 16
    sget-object p1, Ll/sgs0;->R6:Ll/dgs0;

    .line 17
    .line 18
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    invoke-virtual {p2, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    iput-boolean p1, p0, Ll/bwu0;->h:Z

    .line 33
    .line 34
    return-void
.end method

.method private final q()Z
    .locals 4

    .line 1
    iget-object v0, p0, Ll/bwu0;->g:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Ll/bwu0;->g:Ljava/lang/Boolean;

    .line 7
    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    sget-object v0, Ll/sgs0;->t1:Ll/dgs0;

    .line 11
    .line 12
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {}, Ll/bxy0;->r()Lcom/google/android/gms/ads/internal/util/b;

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/bwu0;->a:Landroid/content/Context;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    :try_start_1
    invoke-static {v1}, Lcom/google/android/gms/ads/internal/util/b;->R(Landroid/content/Context;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1
    :try_end_1
    .catch Landroid/os/RemoteException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_2

    .line 34
    :catch_0
    const/4 v1, 0x0

    .line 35
    :goto_0
    const/4 v2, 0x0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    if-nez v1, :cond_0

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_0
    :try_start_2
    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->matches(Ljava/lang/String;Ljava/lang/CharSequence;)Z

    .line 42
    .line 43
    .line 44
    move-result v2
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 45
    goto :goto_1

    .line 46
    :catch_1
    move-exception v0

    .line 47
    :try_start_3
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 48
    .line 49
    .line 50
    move-result-object v1

    .line 51
    const-string v3, "CsiActionsListener.isPatternMatched"

    .line 52
    .line 53
    invoke-virtual {v1, v0, v3}, Ll/ebt0;->w(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    :goto_1
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Ll/bwu0;->g:Ljava/lang/Boolean;

    .line 61
    .line 62
    :cond_2
    monitor-exit p0

    .line 63
    goto :goto_3

    .line 64
    :goto_2
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 65
    throw v0

    .line 66
    :cond_3
    :goto_3
    iget-object p0, p0, Ll/bwu0;->g:Ljava/lang/Boolean;

    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 69
    .line 70
    .line 71
    move-result p0

    .line 72
    return p0
.end method


# virtual methods
.method public final Z(Lcom/google/android/gms/internal/ads/zzdkv;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bwu0;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "ifts"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "reason"

    .line 13
    .line 14
    const-string v1, "exception"

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-nez v0, :cond_1

    .line 28
    .line 29
    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const-string v0, "msg"

    .line 34
    .line 35
    invoke-virtual {p0, v0, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 36
    .line 37
    .line 38
    :cond_1
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final a()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bwu0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 8
    .line 9
    iget-boolean v0, v0, Ll/q6w0;->j0:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    const-string v0, "impression"

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    invoke-virtual {p0, v0}, Ll/bwu0;->k(Ll/wwu0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final b(Ljava/lang/String;)Ll/wwu0;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/bwu0;->c:Ll/xwu0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xwu0;->a()Ll/wwu0;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/bwu0;->d:Ll/b7w0;

    .line 8
    .line 9
    iget-object v1, v1, Ll/b7w0;->b:Ll/a7w0;

    .line 10
    .line 11
    iget-object v1, v1, Ll/a7w0;->b:Ll/t6w0;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ll/wwu0;->e(Ll/t6w0;)Ll/wwu0;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/wwu0;->d(Ll/q6w0;)Ll/wwu0;

    .line 19
    .line 20
    .line 21
    const-string v1, "action"

    .line 22
    .line 23
    invoke-virtual {v0, v1, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 27
    .line 28
    iget-object p1, p1, Ll/q6w0;->u:Ljava/util/List;

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    const/4 v1, 0x0

    .line 35
    if-nez p1, :cond_0

    .line 36
    .line 37
    iget-object p1, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 38
    .line 39
    iget-object p1, p1, Ll/q6w0;->u:Ljava/util/List;

    .line 40
    .line 41
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    move-result-object p1

    .line 45
    check-cast p1, Ljava/lang/String;

    .line 46
    .line 47
    const-string v2, "ancn"

    .line 48
    .line 49
    invoke-virtual {v0, v2, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 50
    .line 51
    .line 52
    :cond_0
    iget-object p1, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 53
    .line 54
    iget-boolean p1, p1, Ll/q6w0;->j0:Z

    .line 55
    .line 56
    const/4 v2, 0x1

    .line 57
    if-eqz p1, :cond_2

    .line 58
    .line 59
    iget-object p1, p0, Ll/bwu0;->a:Landroid/content/Context;

    .line 60
    .line 61
    invoke-static {}, Ll/bxy0;->q()Ll/ebt0;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    invoke-virtual {v3, p1}, Ll/ebt0;->z(Landroid/content/Context;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eq v2, p1, :cond_1

    .line 70
    .line 71
    const-string p1, "offline"

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    const-string p1, "online"

    .line 75
    .line 76
    :goto_0
    const-string v3, "device_connectivity"

    .line 77
    .line 78
    invoke-virtual {v0, v3, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 79
    .line 80
    .line 81
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 86
    .line 87
    .line 88
    move-result-wide v3

    .line 89
    invoke-static {v3, v4}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    const-string v3, "event_timestamp"

    .line 94
    .line 95
    invoke-virtual {v0, v3, p1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 96
    .line 97
    .line 98
    const-string p1, "offline_ad"

    .line 99
    .line 100
    const-string v3, "1"

    .line 101
    .line 102
    invoke-virtual {v0, p1, v3}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 103
    .line 104
    .line 105
    :cond_2
    sget-object p1, Ll/sgs0;->a7:Ll/dgs0;

    .line 106
    .line 107
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3, p1}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Ljava/lang/Boolean;

    .line 116
    .line 117
    invoke-virtual {p1}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_4

    .line 122
    .line 123
    iget-object p1, p0, Ll/bwu0;->d:Ll/b7w0;

    .line 124
    .line 125
    iget-object p1, p1, Ll/b7w0;->a:Ll/y6w0;

    .line 126
    .line 127
    iget-object p1, p1, Ll/y6w0;->a:Ll/o7w0;

    .line 128
    .line 129
    invoke-static {p1}, Ll/qyv0;->e(Ll/o7w0;)I

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-eq p1, v2, :cond_3

    .line 134
    .line 135
    move v1, v2

    .line 136
    :cond_3
    const-string p1, "scar"

    .line 137
    .line 138
    invoke-static {v1}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-virtual {v0, p1, v2}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 143
    .line 144
    .line 145
    if-eqz v1, :cond_4

    .line 146
    .line 147
    iget-object p0, p0, Ll/bwu0;->d:Ll/b7w0;

    .line 148
    .line 149
    iget-object p0, p0, Ll/b7w0;->a:Ll/y6w0;

    .line 150
    .line 151
    iget-object p0, p0, Ll/y6w0;->a:Ll/o7w0;

    .line 152
    .line 153
    iget-object p0, p0, Ll/o7w0;->d:Lcom/google/android/gms/ads/internal/client/zzl;

    .line 154
    .line 155
    const-string p1, "ragent"

    .line 156
    .line 157
    iget-object v1, p0, Lcom/google/android/gms/ads/internal/client/zzl;->zzp:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, p1, v1}, Ll/wwu0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 160
    .line 161
    .line 162
    invoke-static {p0}, Ll/qyv0;->b(Lcom/google/android/gms/ads/internal/client/zzl;)Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/qyv0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object p0

    .line 170
    const-string p1, "rtype"

    .line 171
    .line 172
    invoke-virtual {v0, p1, p0}, Ll/wwu0;->c(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 173
    .line 174
    .line 175
    :cond_4
    return-object v0
.end method

.method public final i(Lcom/google/android/gms/ads/internal/client/zze;)V
    .locals 5

    .line 1
    iget-boolean v0, p0, Ll/bwu0;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "ifts"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    const-string v1, "reason"

    .line 13
    .line 14
    const-string v2, "adapter"

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 17
    .line 18
    .line 19
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 20
    .line 21
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzb:Ljava/lang/String;

    .line 22
    .line 23
    iget-object v3, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzc:Ljava/lang/String;

    .line 24
    .line 25
    const-string v4, "com.google.android.gms.ads"

    .line 26
    .line 27
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_1

    .line 32
    .line 33
    iget-object v3, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzd:Lcom/google/android/gms/ads/internal/client/zze;

    .line 34
    .line 35
    if-eqz v3, :cond_1

    .line 36
    .line 37
    iget-object v3, v3, Lcom/google/android/gms/ads/internal/client/zze;->zzc:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v3

    .line 43
    if-nez v3, :cond_1

    .line 44
    .line 45
    iget-object p1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzd:Lcom/google/android/gms/ads/internal/client/zze;

    .line 46
    .line 47
    iget v1, p1, Lcom/google/android/gms/ads/internal/client/zze;->zza:I

    .line 48
    .line 49
    iget-object v2, p1, Lcom/google/android/gms/ads/internal/client/zze;->zzb:Ljava/lang/String;

    .line 50
    .line 51
    :cond_1
    if-ltz v1, :cond_2

    .line 52
    .line 53
    const-string p1, "arec"

    .line 54
    .line 55
    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-virtual {v0, p1, v1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 60
    .line 61
    .line 62
    :cond_2
    iget-object p0, p0, Ll/bwu0;->b:Ll/f8w0;

    .line 63
    .line 64
    invoke-virtual {p0, v2}, Ll/f8w0;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    const-string p1, "areec"

    .line 71
    .line 72
    invoke-virtual {v0, p1, p0}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 73
    .line 74
    .line 75
    :cond_3
    invoke-virtual {v0}, Ll/wwu0;->g()V

    .line 76
    .line 77
    .line 78
    return-void
.end method

.method public final k(Ll/wwu0;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/q6w0;->j0:Z

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/wwu0;->f()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v5

    .line 11
    new-instance v1, Ll/hbv0;

    .line 12
    .line 13
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    iget-object p1, p0, Ll/bwu0;->d:Ll/b7w0;

    .line 22
    .line 23
    iget-object p1, p1, Ll/b7w0;->b:Ll/a7w0;

    .line 24
    .line 25
    iget-object p1, p1, Ll/a7w0;->b:Ll/t6w0;

    .line 26
    .line 27
    iget-object v4, p1, Ll/t6w0;->b:Ljava/lang/String;

    .line 28
    .line 29
    const/4 v6, 0x2

    .line 30
    invoke-direct/range {v1 .. v6}, Ll/hbv0;-><init>(JLjava/lang/String;Ljava/lang/String;I)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Ll/bwu0;->f:Ll/fbv0;

    .line 34
    .line 35
    invoke-virtual {p0, v1}, Ll/fbv0;->g(Ll/hbv0;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_0
    invoke-virtual {p1}, Ll/wwu0;->g()V

    .line 40
    .line 41
    .line 42
    return-void
.end method

.method public final onAdClicked()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/bwu0;->e:Ll/q6w0;

    .line 2
    .line 3
    iget-boolean v0, v0, Ll/q6w0;->j0:Z

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "click"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/bwu0;->k(Ll/wwu0;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final zzb()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/bwu0;->h:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const-string v0, "ifts"

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    const-string v0, "reason"

    .line 13
    .line 14
    const-string v1, "blocked"

    .line 15
    .line 16
    invoke-virtual {p0, v0, v1}, Ll/wwu0;->b(Ljava/lang/String;Ljava/lang/String;)Ll/wwu0;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final zzi()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bwu0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "adapter_shown"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final zzj()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/bwu0;->q()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    const-string v0, "adapter_impression"

    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/bwu0;->b(Ljava/lang/String;)Ll/wwu0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Ll/wwu0;->g()V

    .line 15
    .line 16
    .line 17
    return-void
.end method
