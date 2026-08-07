.class public final Ll/rmw0;
.super Ll/dnw0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Ll/lmw0;

.field public final synthetic c:Ll/zmw0;

.field public final synthetic d:Ll/sni0;

.field public final synthetic e:Ll/umw0;


# direct methods
.method public constructor <init>(Ll/umw0;Ll/sni0;Ll/lmw0;Ll/zmw0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/rmw0;->b:Ll/lmw0;

    .line 2
    .line 3
    iput-object p4, p0, Ll/rmw0;->c:Ll/zmw0;

    .line 4
    .line 5
    iput-object p5, p0, Ll/rmw0;->d:Ll/sni0;

    .line 6
    .line 7
    iput-object p1, p0, Ll/rmw0;->e:Ll/umw0;

    .line 8
    .line 9
    invoke-direct {p0, p2}, Ll/dnw0;-><init>(Ll/sni0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 6

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/rmw0;->e:Ll/umw0;

    .line 2
    .line 3
    iget-object v0, v0, Ll/umw0;->a:Ll/snw0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/snw0;->e()Landroid/os/IInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p0, Ll/rmw0;->b:Ll/lmw0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/rmw0;->e:Ll/umw0;

    .line 15
    .line 16
    invoke-static {v2}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    new-instance v3, Landroid/os/Bundle;

    .line 21
    .line 22
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 23
    .line 24
    .line 25
    const-string v4, "sessionToken"

    .line 26
    .line 27
    invoke-virtual {v1}, Ll/lmw0;->b()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-virtual {v3, v4, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    const-string v4, "callerPackage"

    .line 35
    .line 36
    invoke-virtual {v3, v4, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    const-string v2, "appId"

    .line 40
    .line 41
    invoke-virtual {v1}, Ll/lmw0;->a()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {v3, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ll/tmw0;

    .line 49
    .line 50
    iget-object v2, p0, Ll/rmw0;->e:Ll/umw0;

    .line 51
    .line 52
    iget-object v4, p0, Ll/rmw0;->c:Ll/zmw0;

    .line 53
    .line 54
    invoke-direct {v1, v2, v4}, Ll/tmw0;-><init>(Ll/umw0;Ll/zmw0;)V

    .line 55
    .line 56
    .line 57
    invoke-interface {v0, v3, v1}, Ll/slw0;->z4(Landroid/os/Bundle;Ll/ulw0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    iget-object v1, p0, Ll/rmw0;->e:Ll/umw0;

    .line 63
    .line 64
    invoke-static {}, Ll/umw0;->a()Ll/cnw0;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-static {v1}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const-string v3, "dismiss overlay display from: %s"

    .line 77
    .line 78
    invoke-virtual {v2, v0, v3, v1}, Ll/cnw0;->b(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 79
    .line 80
    .line 81
    iget-object p0, p0, Ll/rmw0;->d:Ll/sni0;

    .line 82
    .line 83
    new-instance v1, Ljava/lang/RuntimeException;

    .line 84
    .line 85
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p0, v1}, Ll/sni0;->d(Ljava/lang/Exception;)Z

    .line 89
    .line 90
    .line 91
    return-void
.end method
