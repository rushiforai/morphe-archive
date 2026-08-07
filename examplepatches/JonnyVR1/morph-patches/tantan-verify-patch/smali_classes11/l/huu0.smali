.class public final Ll/huu0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/p8w0;

.field public final b:Ll/xtu0;


# direct methods
.method public constructor <init>(Ll/p8w0;Ll/xtu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/huu0;->a:Ll/p8w0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/huu0;->b:Ll/xtu0;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final a()Ll/uws0;
    .locals 0
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/huu0;->a:Ll/p8w0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p8w0;->b()Ll/uws0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    const-string p0, "Unexpected call to adapter creator."

    .line 11
    .line 12
    invoke-static {p0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-static {}, Ll/pqy0;->a()V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return-object p0
.end method

.method public final b(Ljava/lang/String;)Ll/hzs0;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/huu0;->a()Ll/uws0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ll/uws0;->zzc(Ljava/lang/String;)Ll/hzs0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object p0, p0, Ll/huu0;->b:Ll/xtu0;

    .line 10
    .line 11
    invoke-virtual {p0, p1, v0}, Ll/xtu0;->e(Ljava/lang/String;Ll/hzs0;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final c(Ljava/lang/String;Lorg/json/JSONObject;)Ll/r8w0;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/google/android/gms/internal/ads/zzfho;
        }
    .end annotation

    .line 1
    const-string v0, "com.google.android.gms.ads.mediation.customevent.CustomEventAdapter"

    .line 2
    .line 3
    :try_start_0
    new-instance v1, Ll/r8w0;

    .line 4
    .line 5
    const-string v2, "com.google.ads.mediation.admob.AdMobAdapter"

    .line 6
    .line 7
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    if-eqz v2, :cond_0

    .line 12
    .line 13
    new-instance p2, Ll/bys0;

    .line 14
    .line 15
    new-instance v0, Lcom/google/ads/mediation/admob/AdMobAdapter;

    .line 16
    .line 17
    invoke-direct {v0}, Lcom/google/ads/mediation/admob/AdMobAdapter;-><init>()V

    .line 18
    .line 19
    .line 20
    invoke-direct {p2, v0}, Ll/bys0;-><init>(Ll/v7y;)V

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catchall_0
    move-exception p2

    .line 25
    goto :goto_2

    .line 26
    :cond_0
    const-string v2, "com.google.ads.mediation.admob.AdMobCustomTabsAdapter"

    .line 27
    .line 28
    invoke-virtual {v2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-eqz v2, :cond_1

    .line 33
    .line 34
    new-instance p2, Ll/bys0;

    .line 35
    .line 36
    new-instance v0, Lcom/google/android/gms/internal/ads/zzbvk;

    .line 37
    .line 38
    invoke-direct {v0}, Lcom/google/android/gms/internal/ads/zzbvk;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-direct {p2, v0}, Ll/bys0;-><init>(Ll/v7y;)V

    .line 42
    .line 43
    .line 44
    goto :goto_1

    .line 45
    :cond_1
    invoke-virtual {p0}, Ll/huu0;->a()Ll/uws0;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 50
    .line 51
    .line 52
    move-result v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    const-string v4, "com.google.ads.mediation.customevent.CustomEventAdapter"

    .line 54
    .line 55
    if-nez v3, :cond_2

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {v4, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 58
    .line 59
    .line 60
    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    if-eqz v3, :cond_5

    .line 62
    .line 63
    :cond_2
    :try_start_2
    const-string v3, "class_name"

    .line 64
    .line 65
    invoke-virtual {p2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    invoke-interface {v2, p2}, Ll/uws0;->c(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result v3

    .line 73
    if-eqz v3, :cond_3

    .line 74
    .line 75
    invoke-interface {v2, v0}, Ll/uws0;->zzb(Ljava/lang/String;)Ll/xws0;

    .line 76
    .line 77
    .line 78
    move-result-object p2

    .line 79
    goto :goto_1

    .line 80
    :catch_0
    move-exception p2

    .line 81
    goto :goto_0

    .line 82
    :cond_3
    invoke-interface {v2, p2}, Ll/uws0;->z(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-eqz v0, :cond_4

    .line 87
    .line 88
    invoke-interface {v2, p2}, Ll/uws0;->zzb(Ljava/lang/String;)Ll/xws0;

    .line 89
    .line 90
    .line 91
    move-result-object p2

    .line 92
    goto :goto_1

    .line 93
    :cond_4
    invoke-interface {v2, v4}, Ll/uws0;->zzb(Ljava/lang/String;)Ll/xws0;

    .line 94
    .line 95
    .line 96
    move-result-object p2
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 97
    goto :goto_1

    .line 98
    :goto_0
    :try_start_3
    const-string v0, "Invalid custom event."

    .line 99
    .line 100
    invoke-static {v0, p2}, Ll/dct0;->e(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 101
    .line 102
    .line 103
    :cond_5
    invoke-interface {v2, p1}, Ll/uws0;->zzb(Ljava/lang/String;)Ll/xws0;

    .line 104
    .line 105
    .line 106
    move-result-object p2

    .line 107
    :goto_1
    invoke-direct {v1, p2}, Ll/r8w0;-><init>(Ll/xws0;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 108
    .line 109
    .line 110
    iget-object p0, p0, Ll/huu0;->b:Ll/xtu0;

    .line 111
    .line 112
    invoke-virtual {p0, p1, v1}, Ll/xtu0;->d(Ljava/lang/String;Ll/r8w0;)V

    .line 113
    .line 114
    .line 115
    return-object v1

    .line 116
    :goto_2
    sget-object v0, Ll/sgs0;->k9:Ll/dgs0;

    .line 117
    .line 118
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ljava/lang/Boolean;

    .line 127
    .line 128
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    const/4 v1, 0x0

    .line 133
    if-eqz v0, :cond_6

    .line 134
    .line 135
    iget-object p0, p0, Ll/huu0;->b:Ll/xtu0;

    .line 136
    .line 137
    invoke-virtual {p0, p1, v1}, Ll/xtu0;->d(Ljava/lang/String;Ll/r8w0;)V

    .line 138
    .line 139
    .line 140
    :cond_6
    invoke-static {p2}, Ll/guu0;->a(Ljava/lang/Throwable;)V

    .line 141
    .line 142
    .line 143
    return-object v1
.end method

.method public final d()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/huu0;->a:Ll/p8w0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/p8w0;->b()Ll/uws0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method
