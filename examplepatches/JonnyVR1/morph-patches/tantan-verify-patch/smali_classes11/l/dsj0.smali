.class public final Ll/dsj0;
.super Ljava/lang/Object;


# instance fields
.field public final a:Ll/l7m;


# direct methods
.method public constructor <init>(Ll/l7m;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/dsj0;->a:Ll/l7m;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a(Z)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/dsj0;->a:Ll/l7m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/l7m;->E5(Z)V
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

.method public final b(Z)V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Ll/dsj0;->a:Ll/l7m;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/l7m;->m7(Z)V
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
