.class public final Ll/vtr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/content/Context;

.field public final synthetic c:Ljava/lang/String;

.field public final synthetic d:Ll/uws0;

.field public final synthetic e:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/content/Context;Ljava/lang/String;Ll/uws0;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    iput-object p3, p0, Ll/vtr0;->c:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p4, p0, Ll/vtr0;->d:Ll/uws0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/vtr0;->e:Ll/s3s0;

    .line 8
    .line 9
    invoke-direct {p0}, Ll/z4s0;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final bridge synthetic a()Ljava/lang/Object;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "native_ad"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ll/nqv0;

    .line 9
    .line 10
    invoke-direct {p0}, Ll/nqv0;-><init>()V

    .line 11
    .line 12
    .line 13
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 2
    .line 3
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/vtr0;->c:Ljava/lang/String;

    .line 8
    .line 9
    iget-object p0, p0, Ll/vtr0;->d:Ll/uws0;

    .line 10
    .line 11
    const v2, 0xe52bf80

    .line 12
    .line 13
    .line 14
    invoke-interface {p1, v0, v1, p0, v2}, Ll/tbt0;->F1(Ll/p1m;Ljava/lang/String;Ll/uws0;I)Ll/ats0;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 6
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/vtr0;->b:Landroid/content/Context;

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
    iget-object v1, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 26
    .line 27
    invoke-static {v1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    iget-object v2, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 32
    .line 33
    const-string v3, "com.google.android.gms.ads.ChimeraAdLoaderBuilderCreatorImpl"

    .line 34
    .line 35
    sget-object v4, Ll/ksr0;->a:Ll/ksr0;

    .line 36
    .line 37
    invoke-static {v2, v3, v4}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    check-cast v2, Ll/rus0;

    .line 42
    .line 43
    iget-object v3, p0, Ll/vtr0;->c:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v4, p0, Ll/vtr0;->d:Ll/uws0;

    .line 46
    .line 47
    const v5, 0xe52bf80

    .line 48
    .line 49
    .line 50
    invoke-virtual {v2, v1, v3, v4, v5}, Ll/rus0;->m4(Ll/p1m;Ljava/lang/String;Ll/uws0;I)Landroid/os/IBinder;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    if-nez v1, :cond_0

    .line 55
    .line 56
    return-object v0

    .line 57
    :cond_0
    const-string v2, "com.google.android.gms.ads.internal.client.IAdLoaderBuilder"

    .line 58
    .line 59
    invoke-interface {v1, v2}, Landroid/os/IBinder;->queryLocalInterface(Ljava/lang/String;)Landroid/os/IInterface;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    instance-of v3, v2, Ll/ats0;

    .line 64
    .line 65
    if-eqz v3, :cond_1

    .line 66
    .line 67
    check-cast v2, Ll/ats0;

    .line 68
    .line 69
    return-object v2

    .line 70
    :catch_0
    move-exception v1

    .line 71
    goto :goto_0

    .line 72
    :catch_1
    move-exception v1

    .line 73
    goto :goto_0

    .line 74
    :catch_2
    move-exception v1

    .line 75
    goto :goto_0

    .line 76
    :cond_1
    new-instance v2, Ll/drs0;

    .line 77
    .line 78
    invoke-direct {v2, v1}, Ll/drs0;-><init>(Landroid/os/IBinder;)V
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    return-object v2

    .line 82
    :goto_0
    iget-object v2, p0, Ll/vtr0;->e:Ll/s3s0;

    .line 83
    .line 84
    iget-object v3, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 85
    .line 86
    invoke-static {v3}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    invoke-static {v2, v3}, Ll/s3s0;->p(Ll/s3s0;Ll/y2t0;)V

    .line 91
    .line 92
    .line 93
    iget-object p0, p0, Ll/vtr0;->e:Ll/s3s0;

    .line 94
    .line 95
    invoke-static {p0}, Ll/s3s0;->m(Ll/s3s0;)Ll/y2t0;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string v2, "ClientApiBroker.createAdLoaderBuilder"

    .line 100
    .line 101
    invoke-interface {p0, v1, v2}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    return-object v0

    .line 105
    :cond_2
    iget-object v0, p0, Ll/vtr0;->e:Ll/s3s0;

    .line 106
    .line 107
    iget-object v1, p0, Ll/vtr0;->b:Landroid/content/Context;

    .line 108
    .line 109
    iget-object v2, p0, Ll/vtr0;->c:Ljava/lang/String;

    .line 110
    .line 111
    iget-object p0, p0, Ll/vtr0;->d:Ll/uws0;

    .line 112
    .line 113
    invoke-static {v0}, Ll/s3s0;->a(Ll/s3s0;)Ll/ptx0;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    invoke-virtual {v0, v1, v2, p0}, Ll/ptx0;->a(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/ats0;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    return-object p0
.end method
