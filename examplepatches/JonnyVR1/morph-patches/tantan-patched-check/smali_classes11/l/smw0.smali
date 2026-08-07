.class public final Ll/smw0;
.super Ll/dnw0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Ll/bnw0;

.field public final synthetic c:I

.field public final synthetic d:Ll/zmw0;

.field public final synthetic e:Ll/sni0;

.field public final synthetic f:Ll/umw0;


# direct methods
.method public constructor <init>(Ll/umw0;Ll/sni0;Ll/bnw0;ILl/zmw0;Ll/sni0;)V
    .locals 0

    .line 1
    iput-object p3, p0, Ll/smw0;->b:Ll/bnw0;

    .line 2
    .line 3
    iput p4, p0, Ll/smw0;->c:I

    .line 4
    .line 5
    iput-object p5, p0, Ll/smw0;->d:Ll/zmw0;

    .line 6
    .line 7
    iput-object p6, p0, Ll/smw0;->e:Ll/sni0;

    .line 8
    .line 9
    iput-object p1, p0, Ll/smw0;->f:Ll/umw0;

    .line 10
    .line 11
    invoke-direct {p0, p2}, Ll/dnw0;-><init>(Ll/sni0;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 7

    .line 1
    :try_start_0
    iget-object v0, p0, Ll/smw0;->f:Ll/umw0;

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
    iget-object v1, p0, Ll/smw0;->b:Ll/bnw0;

    .line 13
    .line 14
    iget-object v2, p0, Ll/smw0;->f:Ll/umw0;

    .line 15
    .line 16
    invoke-static {v2}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    iget v3, p0, Ll/smw0;->c:I

    .line 21
    .line 22
    new-instance v4, Landroid/os/Bundle;

    .line 23
    .line 24
    invoke-direct {v4}, Landroid/os/Bundle;-><init>()V

    .line 25
    .line 26
    .line 27
    const-string v5, "sessionToken"

    .line 28
    .line 29
    invoke-virtual {v1}, Ll/bnw0;->b()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    invoke-virtual {v4, v5, v6}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    const-string v5, "displayMode"

    .line 37
    .line 38
    invoke-virtual {v4, v5, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 39
    .line 40
    .line 41
    const-string v3, "callerPackage"

    .line 42
    .line 43
    invoke-virtual {v4, v3, v2}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    const-string v2, "appId"

    .line 47
    .line 48
    invoke-virtual {v1}, Ll/bnw0;->a()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    invoke-virtual {v4, v2, v1}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    new-instance v1, Ll/tmw0;

    .line 56
    .line 57
    iget-object v2, p0, Ll/smw0;->f:Ll/umw0;

    .line 58
    .line 59
    iget-object v3, p0, Ll/smw0;->d:Ll/zmw0;

    .line 60
    .line 61
    invoke-direct {v1, v2, v3}, Ll/tmw0;-><init>(Ll/umw0;Ll/zmw0;)V

    .line 62
    .line 63
    .line 64
    invoke-interface {v0, v4, v1}, Ll/slw0;->Y5(Landroid/os/Bundle;Ll/ulw0;)V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :catch_0
    move-exception v0

    .line 69
    iget v1, p0, Ll/smw0;->c:I

    .line 70
    .line 71
    invoke-static {}, Ll/umw0;->a()Ll/cnw0;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    iget-object v3, p0, Ll/smw0;->f:Ll/umw0;

    .line 80
    .line 81
    invoke-static {v3}, Ll/umw0;->b(Ll/umw0;)Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v3

    .line 85
    filled-new-array {v1, v3}, [Ljava/lang/Object;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    const-string v3, "switchDisplayMode overlay display to %d from: %s"

    .line 90
    .line 91
    invoke-virtual {v2, v0, v3, v1}, Ll/cnw0;->b(Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)I

    .line 92
    .line 93
    .line 94
    iget-object p0, p0, Ll/smw0;->e:Ll/sni0;

    .line 95
    .line 96
    new-instance v1, Ljava/lang/RuntimeException;

    .line 97
    .line 98
    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {p0, v1}, Ll/sni0;->d(Ljava/lang/Exception;)Z

    .line 102
    .line 103
    .line 104
    return-void
.end method
