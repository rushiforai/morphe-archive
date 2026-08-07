.class public final Ll/w6k;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/w6k$d;,
        Ll/w6k$a;,
        Ll/w6k$b;,
        Ll/w6k$c;
    }
.end annotation


# instance fields
.field public final a:Ll/sul;

.field public b:Ll/dsj0;


# direct methods
.method public constructor <init>(Ll/sul;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    check-cast p1, Ll/sul;

    .line 9
    .line 10
    iput-object p1, p0, Ll/w6k;->a:Ll/sul;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/txw;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object p0, p0, Ll/w6k;->a:Ll/sul;

    .line 3
    .line 4
    invoke-interface {p0, p1}, Ll/sul;->r2(Lcom/google/android/gms/maps/model/MarkerOptions;)Ll/axy0;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    new-instance p1, Ll/txw;

    .line 11
    .line 12
    invoke-direct {p1, p0}, Ll/txw;-><init>(Ll/axy0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 13
    .line 14
    .line 15
    return-object p1

    .line 16
    :catch_0
    move-exception p0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    return-object v0

    .line 19
    :goto_0
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 20
    .line 21
    .line 22
    return-object v0
.end method

.method public final b(Ll/yc4;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/yc4;->a()Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/sul;->Y6(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final c()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/sul;->clear()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catch_0
    move-exception p0

    .line 8
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public final d()Lcom/google/android/gms/maps/model/CameraPosition;
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/sul;->Y4()Lcom/google/android/gms/maps/model/CameraPosition;

    .line 4
    .line 5
    .line 6
    move-result-object p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return-object p0

    .line 8
    :catch_0
    move-exception p0

    .line 9
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 10
    .line 11
    .line 12
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public final e()Ll/dsj0;
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/w6k;->b:Ll/dsj0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/dsj0;

    .line 6
    .line 7
    iget-object v1, p0, Ll/w6k;->a:Ll/sul;

    .line 8
    .line 9
    invoke-interface {v1}, Ll/sul;->J3()Ll/l7m;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ll/dsj0;-><init>(Ll/l7m;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/w6k;->b:Ll/dsj0;

    .line 17
    .line 18
    :cond_0
    iget-object p0, p0, Ll/w6k;->b:Ll/dsj0;
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 19
    .line 20
    return-object p0

    .line 21
    :catch_0
    move-exception p0

    .line 22
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x0

    .line 26
    return-object p0
.end method

.method public final f(Ll/yc4;)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/yc4;->a()Ll/p1m;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-interface {p0, p1}, Ll/sul;->J5(Ll/p1m;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    return-void

    .line 11
    :catch_0
    move-exception p0

    .line 12
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final g(Ll/w6k$a;)V
    .locals 2
    .param p1    # Ll/w6k$a;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0, p0}, Ll/sul;->b8(Ll/bhy0;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/a3z0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/a3z0;-><init>(Ll/w6k;Ll/w6k$a;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/sul;->b8(Ll/bhy0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final h(Ll/w6k$b;)V
    .locals 2
    .param p1    # Ll/w6k$b;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0, p0}, Ll/sul;->G4(Ll/owy0;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/eyy0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/eyy0;-><init>(Ll/w6k;Ll/w6k$b;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/sul;->G4(Ll/owy0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final i(Ll/w6k$c;)V
    .locals 2
    .param p1    # Ll/w6k$c;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0, p0}, Ll/sul;->R6(Ll/tmr0;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/t4z0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/t4z0;-><init>(Ll/w6k;Ll/w6k$c;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/sul;->R6(Ll/tmr0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final j(Ll/w6k$d;)V
    .locals 2
    .param p1    # Ll/w6k$d;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/w6k;->a:Ll/sul;

    .line 2
    .line 3
    if-nez p1, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    :try_start_0
    invoke-interface {v0, p0}, Ll/sul;->d2(Ll/hxr0;)V

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    new-instance v1, Ll/k9s0;

    .line 11
    .line 12
    invoke-direct {v1, p0, p1}, Ll/k9s0;-><init>(Ll/w6k;Ll/w6k$d;)V

    .line 13
    .line 14
    .line 15
    invoke-interface {v0, v1}, Ll/sul;->d2(Ll/hxr0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
