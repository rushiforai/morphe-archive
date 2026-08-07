.class public final Ll/txw;
.super Ljava/lang/Object;


# instance fields
.field public final a:Ll/axy0;


# direct methods
.method public constructor <init>(Ll/axy0;)V
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
    check-cast p1, Ll/axy0;

    .line 9
    .line 10
    iput-object p1, p0, Ll/txw;->a:Ll/axy0;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()Ljava/lang/String;
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/txw;->a:Ll/axy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/axy0;->getId()Ljava/lang/String;

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

.method public final b()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/txw;->a:Ll/axy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/axy0;->remove()V
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

.method public final equals(Ljava/lang/Object;)Z
    .locals 2

    .line 1
    instance-of v0, p1, Ll/txw;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    :try_start_0
    iget-object p0, p0, Ll/txw;->a:Ll/axy0;

    .line 8
    .line 9
    check-cast p1, Ll/txw;

    .line 10
    .line 11
    iget-object p1, p1, Ll/txw;->a:Ll/axy0;

    .line 12
    .line 13
    invoke-interface {p0, p1}, Ll/axy0;->u3(Ll/axy0;)Z

    .line 14
    .line 15
    .line 16
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    return p0

    .line 18
    :catch_0
    move-exception p0

    .line 19
    invoke-static {p0}, Ll/v6k;->a(Landroid/os/RemoteException;)V

    .line 20
    .line 21
    .line 22
    return v1
.end method

.method public final hashCode()I
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/txw;->a:Ll/axy0;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/axy0;->zzj()I

    .line 4
    .line 5
    .line 6
    move-result p0
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 7
    return p0

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
    return p0
.end method
