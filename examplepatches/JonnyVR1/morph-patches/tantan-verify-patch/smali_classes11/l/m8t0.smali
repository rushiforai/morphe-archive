.class public final Ll/m8t0;
.super Ll/x8d0;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/String;

.field public final b:Ll/l7t0;

.field public final c:Landroid/content/Context;

.field public final d:Ll/k8t0;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/x8d0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/m8t0;->a:Ljava/lang/String;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/m8t0;->c:Landroid/content/Context;

    .line 11
    .line 12
    invoke-static {}, Ll/k6s0;->a()Ll/s3s0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    new-instance v1, Ll/qws0;

    .line 17
    .line 18
    invoke-direct {v1}, Ll/qws0;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1, p2, v1}, Ll/s3s0;->n(Landroid/content/Context;Ljava/lang/String;Ll/uws0;)Ll/l7t0;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    iput-object p1, p0, Ll/m8t0;->b:Ll/l7t0;

    .line 26
    .line 27
    new-instance p1, Ll/k8t0;

    .line 28
    .line 29
    invoke-direct {p1}, Ll/k8t0;-><init>()V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/m8t0;->d:Ll/k8t0;

    .line 33
    .line 34
    return-void
.end method


# virtual methods
.method public final a()Ll/n5d0;
    .locals 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Ll/m8t0;->b:Ll/l7t0;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/l7t0;->zzc()Ll/tlu0;

    .line 7
    .line 8
    .line 9
    move-result-object v0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    goto :goto_0

    .line 11
    :catch_0
    move-exception p0

    .line 12
    const-string v1, "#007 Could not call remote method."

    .line 13
    .line 14
    invoke-static {v1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    invoke-static {v0}, Ll/n5d0;->e(Ll/tlu0;)Ll/n5d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final c(Landroid/app/Activity;Ll/bp50;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ll/bp50;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/m8t0;->d:Ll/k8t0;

    .line 2
    .line 3
    invoke-virtual {v0, p2}, Ll/k8t0;->p8(Ll/bp50;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-object p2, p0, Ll/m8t0;->b:Ll/l7t0;

    .line 7
    .line 8
    if-eqz p2, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Ll/m8t0;->d:Ll/k8t0;

    .line 11
    .line 12
    invoke-interface {p2, v0}, Ll/l7t0;->R0(Ll/o7t0;)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Ll/m8t0;->b:Ll/l7t0;

    .line 16
    .line 17
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-interface {p0, p1}, Ll/l7t0;->g0(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    const-string p1, "#007 Could not call remote method."

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public final d(Ll/xxu0;Ll/y8d0;)V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/m8t0;->b:Ll/l7t0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    sget-object v1, Ll/ioy0;->a:Ll/ioy0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/m8t0;->c:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v1, v2, p1}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v1, Ll/l8t0;

    .line 14
    .line 15
    invoke-direct {v1, p2, p0}, Ll/l8t0;-><init>(Ll/y8d0;Ll/m8t0;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p1, v1}, Ll/l7t0;->M5(Lcom/google/android/gms/ads/internal/client/zzl;Ll/s7t0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void

    .line 22
    :catch_0
    move-exception p0

    .line 23
    const-string p1, "#007 Could not call remote method."

    .line 24
    .line 25
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method
