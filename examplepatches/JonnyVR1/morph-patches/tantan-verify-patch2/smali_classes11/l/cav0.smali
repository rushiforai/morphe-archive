.class public final Ll/cav0;
.super Ll/dav0;
.source "SourceFile"


# static fields
.field public static final h:Landroid/util/SparseArray;


# instance fields
.field public final c:Landroid/content/Context;

.field public final d:Ll/m5u0;

.field public final e:Landroid/telephony/TelephonyManager;

.field public final f:Ll/u9v0;

.field public g:I


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    new-instance v0, Landroid/util/SparseArray;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/cav0;->h:Landroid/util/SparseArray;

    .line 7
    .line 8
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->CONNECTED:Landroid/net/NetworkInfo$DetailedState;

    .line 9
    .line 10
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    sget-object v2, Lcom/google/android/gms/internal/ads/zzbec;->zzc:Lcom/google/android/gms/internal/ads/zzbec;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->AUTHENTICATING:Landroid/net/NetworkInfo$DetailedState;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    sget-object v2, Lcom/google/android/gms/internal/ads/zzbec;->zzb:Lcom/google/android/gms/internal/ads/zzbec;

    .line 26
    .line 27
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 28
    .line 29
    .line 30
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->CONNECTING:Landroid/net/NetworkInfo$DetailedState;

    .line 31
    .line 32
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->OBTAINING_IPADDR:Landroid/net/NetworkInfo$DetailedState;

    .line 40
    .line 41
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v1

    .line 45
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->DISCONNECTING:Landroid/net/NetworkInfo$DetailedState;

    .line 49
    .line 50
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    sget-object v3, Lcom/google/android/gms/internal/ads/zzbec;->zzd:Lcom/google/android/gms/internal/ads/zzbec;

    .line 55
    .line 56
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 57
    .line 58
    .line 59
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->BLOCKED:Landroid/net/NetworkInfo$DetailedState;

    .line 60
    .line 61
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    sget-object v3, Lcom/google/android/gms/internal/ads/zzbec;->zze:Lcom/google/android/gms/internal/ads/zzbec;

    .line 66
    .line 67
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->DISCONNECTED:Landroid/net/NetworkInfo$DetailedState;

    .line 71
    .line 72
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 73
    .line 74
    .line 75
    move-result v1

    .line 76
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 77
    .line 78
    .line 79
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->FAILED:Landroid/net/NetworkInfo$DetailedState;

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->IDLE:Landroid/net/NetworkInfo$DetailedState;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 91
    .line 92
    .line 93
    move-result v1

    .line 94
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 95
    .line 96
    .line 97
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->SCANNING:Landroid/net/NetworkInfo$DetailedState;

    .line 98
    .line 99
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->SUSPENDED:Landroid/net/NetworkInfo$DetailedState;

    .line 107
    .line 108
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 109
    .line 110
    .line 111
    move-result v1

    .line 112
    sget-object v3, Lcom/google/android/gms/internal/ads/zzbec;->zzf:Lcom/google/android/gms/internal/ads/zzbec;

    .line 113
    .line 114
    invoke-virtual {v0, v1, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->CAPTIVE_PORTAL_CHECK:Landroid/net/NetworkInfo$DetailedState;

    .line 118
    .line 119
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 120
    .line 121
    .line 122
    move-result v1

    .line 123
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    sget-object v1, Landroid/net/NetworkInfo$DetailedState;->VERIFYING_POOR_LINK:Landroid/net/NetworkInfo$DetailedState;

    .line 127
    .line 128
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 129
    .line 130
    .line 131
    move-result v1

    .line 132
    invoke-virtual {v0, v1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ll/m5u0;Ll/u9v0;Ll/l9v0;Ll/grw0;)V
    .locals 0

    .line 1
    invoke-direct {p0, p4, p5}, Ll/dav0;-><init>(Ll/l9v0;Ll/grw0;)V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/cav0;->c:Landroid/content/Context;

    .line 5
    .line 6
    iput-object p2, p0, Ll/cav0;->d:Ll/m5u0;

    .line 7
    .line 8
    iput-object p3, p0, Ll/cav0;->f:Ll/u9v0;

    .line 9
    .line 10
    const-string p2, "phone"

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Landroid/telephony/TelephonyManager;

    .line 17
    .line 18
    iput-object p1, p0, Ll/cav0;->e:Landroid/telephony/TelephonyManager;

    .line 19
    .line 20
    return-void
.end method

.method public static bridge synthetic b(Ll/cav0;Landroid/os/Bundle;)Lcom/google/android/gms/internal/ads/m0;
    .locals 4

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/m0;->L()Ll/ces0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, -0x2

    .line 6
    const-string v2, "cnt"

    .line 7
    .line 8
    invoke-virtual {p1, v2, v1}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    const-string v3, "gnt"

    .line 14
    .line 15
    invoke-virtual {p1, v3, v2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 16
    .line 17
    .line 18
    move-result p1

    .line 19
    const/4 v2, -0x1

    .line 20
    const/4 v3, 0x2

    .line 21
    if-ne v1, v2, :cond_0

    .line 22
    .line 23
    iput v3, p0, Ll/cav0;->g:I

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_0
    const/4 v2, 0x1

    .line 27
    iput v2, p0, Ll/cav0;->g:I

    .line 28
    .line 29
    const/4 p0, 0x3

    .line 30
    if-eqz v1, :cond_2

    .line 31
    .line 32
    if-eq v1, v2, :cond_1

    .line 33
    .line 34
    invoke-virtual {v0, v2}, Ll/ces0;->r(I)Ll/ces0;

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    invoke-virtual {v0, p0}, Ll/ces0;->r(I)Ll/ces0;

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_2
    invoke-virtual {v0, v3}, Ll/ces0;->r(I)Ll/ces0;

    .line 43
    .line 44
    .line 45
    :goto_0
    packed-switch p1, :pswitch_data_0

    .line 46
    .line 47
    .line 48
    move v3, v2

    .line 49
    goto :goto_1

    .line 50
    :pswitch_0
    const/4 v3, 0x5

    .line 51
    goto :goto_1

    .line 52
    :pswitch_1
    move v3, p0

    .line 53
    :goto_1
    :pswitch_2
    invoke-virtual {v0, v3}, Ll/ces0;->q(I)Ll/ces0;

    .line 54
    .line 55
    .line 56
    :goto_2
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    check-cast p0, Lcom/google/android/gms/internal/ads/m0;

    .line 61
    .line 62
    return-object p0

    .line 63
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_1
        :pswitch_1
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public static bridge synthetic c(Ll/cav0;Landroid/os/Bundle;)Lcom/google/android/gms/internal/ads/zzbec;
    .locals 1

    .line 1
    const-string p0, "device"

    .line 2
    .line 3
    invoke-static {p1, p0}, Ll/b8w0;->a(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string p1, "network"

    .line 8
    .line 9
    invoke-static {p0, p1}, Ll/b8w0;->a(Landroid/os/Bundle;Ljava/lang/String;)Landroid/os/Bundle;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p1, "active_network_state"

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    invoke-virtual {p0, p1, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    sget-object p1, Ll/cav0;->h:Landroid/util/SparseArray;

    .line 21
    .line 22
    sget-object v0, Lcom/google/android/gms/internal/ads/zzbec;->zza:Lcom/google/android/gms/internal/ads/zzbec;

    .line 23
    .line 24
    invoke-virtual {p1, p0, v0}, Landroid/util/SparseArray;->get(ILjava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    check-cast p0, Lcom/google/android/gms/internal/ads/zzbec;

    .line 29
    .line 30
    return-object p0
.end method

.method public static bridge synthetic d(Ll/cav0;)Ll/u9v0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cav0;->f:Ll/u9v0;

    .line 2
    .line 3
    return-object p0
.end method

.method public static bridge synthetic f(Ll/cav0;ZLjava/util/ArrayList;Lcom/google/android/gms/internal/ads/m0;Lcom/google/android/gms/internal/ads/zzbec;)[B
    .locals 5

    .line 1
    invoke-static {}, Lcom/google/android/gms/internal/ads/o0;->T()Ll/les0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Ll/les0;->q(Ljava/lang/Iterable;)Ll/les0;

    .line 6
    .line 7
    .line 8
    iget-object p2, p0, Ll/cav0;->c:Landroid/content/Context;

    .line 9
    .line 10
    invoke-virtual {p2}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 11
    .line 12
    .line 13
    move-result-object p2

    .line 14
    const-string v1, "airplane_mode_on"

    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    invoke-static {p2, v1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    const/4 v1, 0x1

    .line 22
    if-eqz p2, :cond_0

    .line 23
    .line 24
    move p2, v1

    .line 25
    goto :goto_0

    .line 26
    :cond_0
    move p2, v2

    .line 27
    :goto_0
    invoke-static {p2}, Ll/cav0;->g(Z)I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-virtual {v0, p2}, Ll/les0;->y(I)Ll/les0;

    .line 32
    .line 33
    .line 34
    invoke-static {}, Ll/bxy0;->s()Ll/ccr0;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object v3, p0, Ll/cav0;->c:Landroid/content/Context;

    .line 39
    .line 40
    iget-object v4, p0, Ll/cav0;->e:Landroid/telephony/TelephonyManager;

    .line 41
    .line 42
    invoke-virtual {p2, v3, v4}, Ll/ccr0;->h(Landroid/content/Context;Landroid/telephony/TelephonyManager;)I

    .line 43
    .line 44
    .line 45
    move-result p2

    .line 46
    invoke-virtual {v0, p2}, Ll/les0;->z(I)Ll/les0;

    .line 47
    .line 48
    .line 49
    iget-object p2, p0, Ll/cav0;->f:Ll/u9v0;

    .line 50
    .line 51
    invoke-virtual {p2}, Ll/u9v0;->e()J

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    invoke-virtual {v0, v3, v4}, Ll/les0;->v(J)Ll/les0;

    .line 56
    .line 57
    .line 58
    iget-object p2, p0, Ll/cav0;->f:Ll/u9v0;

    .line 59
    .line 60
    invoke-virtual {p2}, Ll/u9v0;->b()J

    .line 61
    .line 62
    .line 63
    move-result-wide v3

    .line 64
    invoke-virtual {v0, v3, v4}, Ll/les0;->u(J)Ll/les0;

    .line 65
    .line 66
    .line 67
    iget-object p2, p0, Ll/cav0;->f:Ll/u9v0;

    .line 68
    .line 69
    invoke-virtual {p2}, Ll/u9v0;->a()I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    invoke-virtual {v0, p2}, Ll/les0;->r(I)Ll/les0;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v0, p4}, Ll/les0;->s(Lcom/google/android/gms/internal/ads/zzbec;)Ll/les0;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v0, p3}, Ll/les0;->t(Lcom/google/android/gms/internal/ads/m0;)Ll/les0;

    .line 80
    .line 81
    .line 82
    iget p2, p0, Ll/cav0;->g:I

    .line 83
    .line 84
    invoke-virtual {v0, p2}, Ll/les0;->A(I)Ll/les0;

    .line 85
    .line 86
    .line 87
    invoke-static {p1}, Ll/cav0;->g(Z)I

    .line 88
    .line 89
    .line 90
    move-result p1

    .line 91
    invoke-virtual {v0, p1}, Ll/les0;->B(I)Ll/les0;

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Ll/cav0;->f:Ll/u9v0;

    .line 95
    .line 96
    invoke-virtual {p1}, Ll/u9v0;->d()J

    .line 97
    .line 98
    .line 99
    move-result-wide p1

    .line 100
    invoke-virtual {v0, p1, p2}, Ll/les0;->x(J)Ll/les0;

    .line 101
    .line 102
    .line 103
    invoke-static {}, Ll/bxy0;->b()Lcom/google/android/gms/common/util/Clock;

    .line 104
    .line 105
    .line 106
    move-result-object p1

    .line 107
    invoke-interface {p1}, Lcom/google/android/gms/common/util/Clock;->currentTimeMillis()J

    .line 108
    .line 109
    .line 110
    move-result-wide p1

    .line 111
    invoke-virtual {v0, p1, p2}, Ll/les0;->w(J)Ll/les0;

    .line 112
    .line 113
    .line 114
    iget-object p0, p0, Ll/cav0;->c:Landroid/content/Context;

    .line 115
    .line 116
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    .line 117
    .line 118
    .line 119
    move-result-object p0

    .line 120
    const-string p1, "wifi_on"

    .line 121
    .line 122
    invoke-static {p0, p1, v2}, Landroid/provider/Settings$Global;->getInt(Landroid/content/ContentResolver;Ljava/lang/String;I)I

    .line 123
    .line 124
    .line 125
    move-result p0

    .line 126
    if-eqz p0, :cond_1

    .line 127
    .line 128
    move v2, v1

    .line 129
    :cond_1
    invoke-static {v2}, Ll/cav0;->g(Z)I

    .line 130
    .line 131
    .line 132
    move-result p0

    .line 133
    invoke-virtual {v0, p0}, Ll/les0;->C(I)Ll/les0;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ll/shx0;->m()Lcom/google/android/gms/internal/ads/p5;

    .line 137
    .line 138
    .line 139
    move-result-object p0

    .line 140
    check-cast p0, Lcom/google/android/gms/internal/ads/o0;

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/google/android/gms/internal/ads/h5;->h()[B

    .line 143
    .line 144
    .line 145
    move-result-object p0

    .line 146
    return-object p0
.end method

.method public static final g(Z)I
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x2

    .line 4
    return p0

    .line 5
    :cond_0
    const/4 p0, 0x1

    .line 6
    return p0
.end method


# virtual methods
.method public final e(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/cav0;->d:Ll/m5u0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/m5u0;->b()Ll/hpr;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    new-instance v1, Ll/bav0;

    .line 8
    .line 9
    invoke-direct {v1, p0, p1}, Ll/bav0;-><init>(Ll/cav0;Z)V

    .line 10
    .line 11
    .line 12
    sget-object p0, Ll/oct0;->f:Ll/xvw0;

    .line 13
    .line 14
    invoke-static {v0, v1, p0}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
