.class public final Ll/iwr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p1, p0, Ll/iwr0;->c:Ll/s3s0;

    .line 4
    .line 5
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "mobile_ads_settings"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/lvv0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/lvv0;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const v0, 0xe52bf80

    .line 8
    .line 9
    .line 10
    invoke-interface {p1, p0, v0}, Ll/tbt0;->q0(Ll/p1m;I)Ll/mot0;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/sgs0;->a(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    sget-object v0, Ll/sgs0;->ia:Ll/dgs0;

    .line 7
    .line 8
    invoke-static {}, Ll/jas0;->c()Ll/qgs0;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v1, v0}, Ll/qgs0;->a(Ll/dgs0;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    check-cast v0, Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_2

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    :try_start_0
    iget-object v1, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 26
    .line 27
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 32
    .line 33
    const-string v3, "com.google.android.gms.ads.ChimeraMobileAdsSettingManagerCreatorImpl"

    .line 34
    .line 35
    sget-object v4, Ll/fvr0;->a:Ll/fvr0;

    .line 36
    .line 37
    invoke-static {v2, v3, v4}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ll/bqt0;

    .line 42
    .line 43
    const v3, 0xe52bf80

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2, v1, v3}, Ll/bqt0;->m4(Ll/p1m;I)Landroid/os/IBinder;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    if-nez v1, :cond_0

    .line 51
    .line 52
    return-object v0

    .line 53
    :cond_0
    const-string v2, "com.google.android.gms.ads.internal.client.IMobileAdsSettingManager"

    .line 54
    .line 55
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    instance-of v3, v2, Ll/mot0;

    .line 60
    .line 61
    if-eqz v3, :cond_1

    .line 62
    .line 63
    check-cast v2, Ll/mot0;

    .line 64
    .line 65
    return-object v2

    .line 66
    :catch_0
    move-exception v1

    .line 67
    goto :goto_0

    .line 68
    :catch_1
    move-exception v1

    .line 69
    goto :goto_0

    .line 70
    :catch_2
    move-exception v1

    .line 71
    goto :goto_0

    .line 72
    :cond_1
    new-instance v2, Ll/xlt0;

    .line 73
    .line 74
    invoke-direct {v2, v1}, Ll/xlt0;-><init>(Landroid/os/IBinder;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    return-object v2

    .line 78
    :goto_0
    iget-object v2, p0, Ll/iwr0;->c:Ll/s3s0;

    .line 79
    .line 80
    iget-object v3, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 81
    .line 82
    invoke-static {v3}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-static {v2, v3}, Ll/s3s0;->p(Ll/s3s0;Ll/y2t0;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Ll/iwr0;->c:Ll/s3s0;

    .line 90
    .line 91
    invoke-static {p0}, Ll/s3s0;->m(Ll/s3s0;)Ll/y2t0;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    const-string v2, "ClientApiBroker.getMobileAdsSettingsManager"

    .line 96
    .line 97
    invoke-interface {p0, v1, v2}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    return-object v0

    .line 101
    :cond_2
    iget-object v0, p0, Ll/iwr0;->c:Ll/s3s0;

    .line 102
    .line 103
    iget-object p0, p0, Ll/iwr0;->b:Landroid/content/Context;

    .line 104
    .line 105
    invoke-static {v0}, Ll/s3s0;->g(Ll/s3s0;)Ll/rlv0;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {v0, p0}, Ll/rlv0;->a(Landroid/content/Context;)Ll/mot0;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    return-object p0
.end method
