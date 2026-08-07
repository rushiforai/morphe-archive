.class public final Ll/abr0;
.super Ll/z4s0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Landroid/app/Activity;

.field public final synthetic c:Ll/s3s0;


# direct methods
.method public constructor <init>(Ll/s3s0;Landroid/app/Activity;)V
    .locals 0

    .line 1
    iput-object p2, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 2
    .line 3
    iput-object p1, p0, Ll/abr0;->c:Ll/s3s0;

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
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 2
    .line 3
    const-string v0, "ad_overlay"

    .line 4
    .line 5
    invoke-static {p0, v0}, Ll/s3s0;->q(Landroid/content/Context;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 p0, 0x0

    .line 9
    return-object p0
.end method

.method public final bridge synthetic b(Ll/tbt0;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 2
    .line 3
    invoke-static {p0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p1, p0}, Ll/tbt0;->g0(Ll/p1m;)Ll/r1t0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final bridge synthetic c()Ljava/lang/Object;
    .locals 4
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroid/os/RemoteException;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/abr0;->b:Landroid/app/Activity;

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
    if-eqz v0, :cond_0

    .line 23
    .line 24
    :try_start_0
    iget-object v0, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 25
    .line 26
    invoke-static {v0}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v1, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 31
    .line 32
    const-string v2, "com.google.android.gms.ads.ChimeraAdOverlayCreatorImpl"

    .line 33
    .line 34
    sget-object v3, Ll/q6z0;->a:Ll/q6z0;

    .line 35
    .line 36
    invoke-static {v1, v2, v3}, Ll/gct0;->b(Landroid/content/Context;Ljava/lang/String;Ll/fct0;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    check-cast v1, Ll/u1t0;

    .line 41
    .line 42
    invoke-interface {v1, v0}, Ll/u1t0;->zze(Ll/p1m;)Landroid/os/IBinder;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {v0}, Ll/q1t0;->o8(Landroid/os/IBinder;)Ll/r1t0;

    .line 47
    .line 48
    .line 49
    move-result-object p0
    :try_end_0
    .catch Lcom/google/android/gms/internal/ads/zzcef; {:try_start_0 .. :try_end_0} :catch_2
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    return-object p0

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto :goto_0

    .line 53
    :catch_1
    move-exception v0

    .line 54
    goto :goto_0

    .line 55
    :catch_2
    move-exception v0

    .line 56
    :goto_0
    iget-object v1, p0, Ll/abr0;->c:Ll/s3s0;

    .line 57
    .line 58
    iget-object v2, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 59
    .line 60
    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    invoke-static {v2}, Ll/w2t0;->c(Landroid/content/Context;)Ll/y2t0;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v1, v2}, Ll/s3s0;->p(Ll/s3s0;Ll/y2t0;)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p0, Ll/abr0;->c:Ll/s3s0;

    .line 72
    .line 73
    invoke-static {p0}, Ll/s3s0;->m(Ll/s3s0;)Ll/y2t0;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    const-string v1, "ClientApiBroker.createAdOverlay"

    .line 78
    .line 79
    invoke-interface {p0, v0, v1}, Ll/y2t0;->b(Ljava/lang/Throwable;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/4 p0, 0x0

    .line 83
    return-object p0

    .line 84
    :cond_0
    iget-object v0, p0, Ll/abr0;->c:Ll/s3s0;

    .line 85
    .line 86
    iget-object p0, p0, Ll/abr0;->b:Landroid/app/Activity;

    .line 87
    .line 88
    invoke-static {v0}, Ll/s3s0;->k(Ll/s3s0;)Ll/o1t0;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-virtual {v0, p0}, Ll/o1t0;->a(Landroid/app/Activity;)Ll/r1t0;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    return-object p0
.end method
