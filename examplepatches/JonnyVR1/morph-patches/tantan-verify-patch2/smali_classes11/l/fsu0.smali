.class public final Ll/fsu0;
.super Ll/vcl0$a;
.source "SourceFile"


# instance fields
.field public final a:Ll/ulu0;


# direct methods
.method public constructor <init>(Ll/ulu0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vcl0$a;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/fsu0;->a:Ll/ulu0;

    .line 5
    .line 6
    return-void
.end method

.method public static f(Ll/ulu0;)Ll/atu0;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/ulu0;->W()Ll/lpu0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    const/4 v0, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v0

    .line 9
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ll/lpu0;->zzi()Ll/atu0;

    .line 10
    .line 11
    .line 12
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    return-object p0

    .line 14
    :catch_0
    return-object v0
.end method


# virtual methods
.method public final a()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fsu0;->a:Ll/ulu0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fsu0;->f(Ll/ulu0;)Ll/atu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ll/atu0;->zze()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, "Unable to call onVideoEnd()"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final c()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fsu0;->a:Ll/ulu0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fsu0;->f(Ll/ulu0;)Ll/atu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ll/atu0;->zzg()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, "Unable to call onVideoEnd()"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e()V
    .locals 1

    .line 1
    iget-object p0, p0, Ll/fsu0;->a:Ll/ulu0;

    .line 2
    .line 3
    invoke-static {p0}, Ll/fsu0;->f(Ll/ulu0;)Ll/atu0;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ll/atu0;->zzi()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catch_0
    move-exception p0

    .line 15
    const-string v0, "Unable to call onVideoEnd()"

    .line 16
    .line 17
    invoke-static {v0, p0}, Ll/dct0;->h(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
