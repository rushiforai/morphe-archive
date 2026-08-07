.class public final Ll/yss0;
.super Ll/h70;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Ll/ioy0;

.field public final c:Ll/oys0;

.field public final d:Ljava/lang/String;

.field public final e:Ll/qws0;

.field public f:Ll/gcj;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/h70;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qws0;

    .line 5
    .line 6
    invoke-direct {v0}, Ll/qws0;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/yss0;->e:Ll/qws0;

    .line 10
    .line 11
    iput-object p1, p0, Ll/yss0;->a:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Ll/yss0;->d:Ljava/lang/String;

    .line 14
    .line 15
    sget-object v1, Ll/ioy0;->a:Ll/ioy0;

    .line 16
    .line 17
    iput-object v1, p0, Ll/yss0;->b:Ll/ioy0;

    .line 18
    .line 19
    invoke-static {}, Ll/k6s0;->a()Ll/s3s0;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    new-instance v2, Lcom/google/android/gms/ads/internal/client/zzq;

    .line 24
    .line 25
    invoke-direct {v2}, Lcom/google/android/gms/ads/internal/client/zzq;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v1, p1, v2, p2, v0}, Ll/s3s0;->e(Landroid/content/Context;Lcom/google/android/gms/ads/internal/client/zzq;Ljava/lang/String;Ll/uws0;)Ll/oys0;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    iput-object p1, p0, Ll/yss0;->c:Ll/oys0;

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
    iget-object p0, p0, Ll/yss0;->c:Ll/oys0;

    .line 3
    .line 4
    if-eqz p0, :cond_0

    .line 5
    .line 6
    invoke-interface {p0}, Ll/oys0;->zzk()Ll/tlu0;

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

.method public final c(Ll/gcj;)V
    .locals 1
    .param p1    # Ll/gcj;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    :try_start_0
    iput-object p1, p0, Ll/yss0;->f:Ll/gcj;

    .line 2
    .line 3
    iget-object p0, p0, Ll/yss0;->c:Ll/oys0;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    new-instance v0, Ll/qbs0;

    .line 8
    .line 9
    invoke-direct {v0, p1}, Ll/qbs0;-><init>(Ll/gcj;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ll/oys0;->I3(Ll/ygt0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void

    .line 16
    :catch_0
    move-exception p0

    .line 17
    const-string p1, "#007 Could not call remote method."

    .line 18
    .line 19
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public final d(Z)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/yss0;->c:Ll/oys0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Ll/oys0;->Y3(Z)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void

    .line 9
    :catch_0
    move-exception p0

    .line 10
    const-string p1, "#007 Could not call remote method."

    .line 11
    .line 12
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final e(Landroid/app/Activity;)V
    .locals 1
    .param p1    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    const-string v0, "The activity for show is null, will proceed with show using the context provided when loading the ad."

    .line 4
    .line 5
    invoke-static {v0}, Ll/dct0;->g(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    :try_start_0
    iget-object p0, p0, Ll/yss0;->c:Ll/oys0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-static {p1}, Ll/h950;->Y2(Ljava/lang/Object;)Ll/p1m;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p0, p1}, Ll/oys0;->P7(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    const-string p1, "#007 Could not call remote method."

    .line 22
    .line 23
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method

.method public final f(Ll/xxu0;Ll/e70;)V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/yss0;->c:Ll/oys0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Ll/yss0;->b:Ll/ioy0;

    .line 6
    .line 7
    iget-object v2, p0, Ll/yss0;->a:Landroid/content/Context;

    .line 8
    .line 9
    invoke-virtual {v1, v2, p1}, Ll/ioy0;->a(Landroid/content/Context;Ll/xxu0;)Lcom/google/android/gms/ads/internal/client/zzl;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    new-instance v1, Ll/pix0;

    .line 14
    .line 15
    invoke-direct {v1, p2, p0}, Ll/pix0;-><init>(Ll/e70;Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    invoke-interface {v0, p1, v1}, Ll/oys0;->w7(Lcom/google/android/gms/ads/internal/client/zzl;Ll/uls0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catch_0
    move-exception v0

    .line 23
    move-object p0, v0

    .line 24
    goto :goto_0

    .line 25
    :cond_0
    return-void

    .line 26
    :goto_0
    const-string p1, "#007 Could not call remote method."

    .line 27
    .line 28
    invoke-static {p1, p0}, Ll/dct0;->i(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    new-instance v0, Ll/jtv;

    .line 32
    .line 33
    const/4 v4, 0x0

    .line 34
    const/4 v5, 0x0

    .line 35
    const/4 v1, 0x0

    .line 36
    const-string v2, "Internal Error."

    .line 37
    .line 38
    const-string v3, "com.google.android.gms.ads"

    .line 39
    .line 40
    invoke-direct/range {v0 .. v5}, Ll/jtv;-><init>(ILjava/lang/String;Ljava/lang/String;Ll/b70;Ll/n5d0;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p2, v0}, Ll/e70;->a(Ll/jtv;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method
