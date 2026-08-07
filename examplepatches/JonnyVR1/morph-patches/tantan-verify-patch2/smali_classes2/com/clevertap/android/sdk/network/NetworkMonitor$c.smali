.class public final Lcom/clevertap/android/sdk/network/NetworkMonitor$c;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/clevertap/android/sdk/network/NetworkMonitor;->p()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u001f\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0017\u0010\u0005\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0017\u0010\u0007\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u0002H\u0016\u00a2\u0006\u0004\u0008\u0007\u0010\u0006J\u001f\u0010\n\u001a\u00020\u00042\u0006\u0010\u0003\u001a\u00020\u00022\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000c"
    }
    d2 = {
        "com/clevertap/android/sdk/network/NetworkMonitor$c",
        "Landroid/net/ConnectivityManager$NetworkCallback;",
        "Landroid/net/Network;",
        "network",
        "",
        "onAvailable",
        "(Landroid/net/Network;)V",
        "onLost",
        "Landroid/net/NetworkCapabilities;",
        "networkCapabilities",
        "onCapabilitiesChanged",
        "(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V",
        "clevertap-core_release"
    }
    k = 0x1
    mv = {
        0x2,
        0x0,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic a:Lcom/clevertap/android/sdk/network/NetworkMonitor;


# direct methods
.method public constructor <init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 11
    .line 12
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "NetworkCallback#onAvailable: network="

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v0, p0, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public onCapabilitiesChanged(Landroid/net/Network;Landroid/net/NetworkCapabilities;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 8
    .line 9
    invoke-static {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 14
    .line 15
    invoke-static {v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v3, "NetworkCallback#onCapabilitiesChanged: network="

    .line 22
    .line 23
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p1, ", capabilities="

    .line 30
    .line 31
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-interface {v0, v1, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 45
    .line 46
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->d(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/u120;

    .line 47
    .line 48
    .line 49
    move-result-object p1

    .line 50
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 51
    .line 52
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 53
    .line 54
    invoke-static {v1, p2}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e(Lcom/clevertap/android/sdk/network/NetworkMonitor;Landroid/net/NetworkCapabilities;)Z

    .line 55
    .line 56
    .line 57
    move-result v1

    .line 58
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 59
    .line 60
    invoke-static {v2, p2}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->c(Lcom/clevertap/android/sdk/network/NetworkMonitor;Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 61
    .line 62
    .line 63
    move-result-object p2

    .line 64
    invoke-direct {v0, v1, p2}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p1, v0}, Ll/u120;->setValue(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 71
    .line 72
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p2, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 77
    .line 78
    invoke-static {p2}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p2

    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v1, "NetworkCallback#onCapabilitiesChanged: updated state="

    .line 85
    .line 86
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 90
    .line 91
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->d(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/u120;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-interface {p0}, Ll/u120;->getValue()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 100
    .line 101
    .line 102
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-interface {p1, p2, p0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 11
    .line 12
    invoke-static {v1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    new-instance v2, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v3, "NetworkCallback#onLost: network="

    .line 19
    .line 20
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    invoke-interface {v0, v1, p1}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 34
    .line 35
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->d(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/u120;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->a()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-interface {p1, v0}, Ll/u120;->setValue(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 49
    .line 50
    invoke-static {p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 55
    .line 56
    invoke-static {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string v2, "NetworkCallback#onLost: updated state="

    .line 63
    .line 64
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;->a:Lcom/clevertap/android/sdk/network/NetworkMonitor;

    .line 68
    .line 69
    invoke-static {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->d(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/u120;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-interface {p0}, Ll/u120;->getValue()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object p0

    .line 84
    invoke-interface {p1, v0, p0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return-void
.end method
