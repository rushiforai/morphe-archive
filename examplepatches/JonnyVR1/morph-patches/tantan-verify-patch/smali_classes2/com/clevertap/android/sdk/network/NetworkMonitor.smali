.class public final Lcom/clevertap/android/sdk/network/NetworkMonitor;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/clevertap/android/sdk/network/NetworkMonitor$a;,
        Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;,
        Lcom/clevertap/android/sdk/network/NetworkMonitor$b;
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0000\u0018\u00002\u00020\u0001:\u00029!B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0002\u0012\u0006\u0010\u0005\u001a\u00020\u0004\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u000f\u0010\u000b\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u000f\u0010\u000e\u001a\u00020\rH\u0002\u00a2\u0006\u0004\u0008\u000e\u0010\u000fJ\u000f\u0010\u0010\u001a\u00020\nH\u0002\u00a2\u0006\u0004\u0008\u0010\u0010\u000cJ\u0017\u0010\u0014\u001a\u00020\u00132\u0006\u0010\u0012\u001a\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J\u0013\u0010\u0017\u001a\u00020\u0016*\u00020\u0011H\u0002\u00a2\u0006\u0004\u0008\u0017\u0010\u0018J\u000f\u0010\u0019\u001a\u00020\rH\u0000\u00a2\u0006\u0004\u0008\u0019\u0010\u000fJ\r\u0010\u001a\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u001a\u0010\u001bJ\r\u0010\u001c\u001a\u00020\u0016\u00a2\u0006\u0004\u0008\u001c\u0010\u001bJ\r\u0010\u001d\u001a\u00020\u0013\u00a2\u0006\u0004\u0008\u001d\u0010\u001eJ\u000f\u0010\u001f\u001a\u0004\u0018\u00010\u0004\u00a2\u0006\u0004\u0008\u001f\u0010 R\u0014\u0010\u0005\u001a\u00020\u00048\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008!\u0010\"R\u0014\u0010\u0007\u001a\u00020\u00068\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008#\u0010$R\u0014\u0010\'\u001a\u00020\u00028\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008%\u0010&R\u0018\u0010+\u001a\u0004\u0018\u00010(8\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008)\u0010*R\u001a\u0010/\u001a\u0008\u0012\u0004\u0012\u00020\r0,8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008-\u0010.R\u001d\u00104\u001a\u0008\u0012\u0004\u0012\u00020\r008\u0006\u00a2\u0006\u000c\n\u0004\u0008\u000e\u00101\u001a\u0004\u00082\u00103R\u0016\u00108\u001a\u0004\u0018\u0001058BX\u0082\u0004\u00a2\u0006\u0006\u001a\u0004\u00086\u00107\u00a8\u0006:"
    }
    d2 = {
        "Lcom/clevertap/android/sdk/network/NetworkMonitor;",
        "",
        "Landroid/content/Context;",
        "context",
        "",
        "accountId",
        "Ll/axl;",
        "logger",
        "<init>",
        "(Landroid/content/Context;Ljava/lang/String;Ll/axl;)V",
        "",
        "m",
        "()V",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$a;",
        "f",
        "()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;",
        "p",
        "Landroid/net/NetworkCapabilities;",
        "capabilities",
        "Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "j",
        "(Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "",
        "l",
        "(Landroid/net/NetworkCapabilities;)Z",
        "h",
        "n",
        "()Z",
        "o",
        "i",
        "()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;",
        "k",
        "()Ljava/lang/String;",
        "a",
        "Ljava/lang/String;",
        "b",
        "Ll/axl;",
        "c",
        "Landroid/content/Context;",
        "appContext",
        "Landroid/net/ConnectivityManager$NetworkCallback;",
        "d",
        "Landroid/net/ConnectivityManager$NetworkCallback;",
        "networkCallback",
        "Ll/u120;",
        "e",
        "Ll/u120;",
        "_stateFlow",
        "Ll/aui;",
        "Ll/aui;",
        "getNetworkState",
        "()Ll/aui;",
        "networkState",
        "Landroid/net/ConnectivityManager;",
        "g",
        "()Landroid/net/ConnectivityManager;",
        "connectivityManager",
        "NetworkType",
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
.field private final a:Ljava/lang/String;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final b:Ll/axl;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final c:Landroid/content/Context;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private volatile d:Landroid/net/ConnectivityManager$NetworkCallback;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final e:Ll/u120;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/u120<",
            "Lcom/clevertap/android/sdk/network/NetworkMonitor$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final f:Ll/aui;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/aui<",
            "Lcom/clevertap/android/sdk/network/NetworkMonitor$a;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;Ll/axl;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ll/axl;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p2, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->c:Landroid/content/Context;

    .line 25
    .line 26
    sget-object p1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-static {p1}, Ll/q3g0;->a(Ljava/lang/Object;)Ll/u120;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 37
    .line 38
    invoke-static {p1}, Ll/fui;->b(Ll/u120;)Ll/p3g0;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    iput-object p1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->f:Ll/aui;

    .line 43
    .line 44
    const-string p1, "NetworkMonitor initializing..."

    .line 45
    .line 46
    invoke-interface {p3, p2, p1}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->m()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static final synthetic a(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic b(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/axl;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/clevertap/android/sdk/network/NetworkMonitor;Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->j(Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static final synthetic d(Lcom/clevertap/android/sdk/network/NetworkMonitor;)Ll/u120;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic e(Lcom/clevertap/android/sdk/network/NetworkMonitor;Landroid/net/NetworkCapabilities;)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->l(Landroid/net/NetworkCapabilities;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private final f()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .locals 4

    .line 1
    :try_start_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->g()Landroid/net/ConnectivityManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :catch_0
    move-exception v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-virtual {v0}, Landroid/net/ConnectivityManager;->getActiveNetwork()Landroid/net/Network;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    if-nez v1, :cond_1

    .line 21
    .line 22
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->a()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    return-object p0

    .line 29
    :cond_1
    invoke-virtual {v0, v1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    if-nez v0, :cond_2

    .line 34
    .line 35
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0

    .line 42
    :cond_2
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->l(Landroid/net/NetworkCapabilities;)Z

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    invoke-direct {p0, v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->j(Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-nez v1, :cond_3

    .line 51
    .line 52
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 53
    .line 54
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->a()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    return-object p0

    .line 59
    :cond_3
    new-instance v1, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 60
    .line 61
    const/4 v2, 0x1

    .line 62
    invoke-direct {v1, v2, v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;-><init>(ZLcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    .line 64
    .line 65
    return-object v1

    .line 66
    :goto_0
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 67
    .line 68
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 69
    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    const-string v3, "Network state calculation failed: "

    .line 73
    .line 74
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-interface {v1, p0, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 92
    .line 93
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    goto :goto_1

    .line 98
    :catch_1
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 99
    .line 100
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 101
    .line 102
    const-string v1, "Missing ACCESS_NETWORK_STATE permission. Add it to AndroidManifest.xml"

    .line 103
    .line 104
    invoke-interface {v0, p0, v1}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 110
    .line 111
    .line 112
    move-result-object p0

    .line 113
    :goto_1
    return-object p0
.end method

.method private final g()Landroid/net/ConnectivityManager;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->c:Landroid/content/Context;

    .line 2
    .line 3
    const-string v0, "connectivity"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    instance-of v0, p0, Landroid/net/ConnectivityManager;

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    check-cast p0, Landroid/net/ConnectivityManager;

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    const/4 p0, 0x0

    .line 17
    return-object p0
.end method

.method private final j(Landroid/net/NetworkCapabilities;)Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 3
    .line 4
    .line 5
    move-result p0

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->WIFI:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    if-eqz p0, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->CELLULAR:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 p0, 0x3

    .line 22
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->ETHERNET:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_2
    const/4 p0, 0x4

    .line 32
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->VPN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    sget-object p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNKNOWN:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 42
    .line 43
    return-object p0
.end method

.method private final l(Landroid/net/NetworkCapabilities;)Z
    .locals 0

    .line 1
    const/16 p0, 0xc

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    const/16 p0, 0x10

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Landroid/net/NetworkCapabilities;->hasCapability(I)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method private final m()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->g()Landroid/net/ConnectivityManager;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 10
    .line 11
    const-string v2, "ConnectivityManager not available"

    .line 12
    .line 13
    invoke-interface {v0, v1, v2}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 17
    .line 18
    sget-object v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->Companion:Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;

    .line 19
    .line 20
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a$a;->b()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    invoke-interface {p0, v0}, Ll/u120;->setValue(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->f()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-interface {v0, v1}, Ll/u120;->setValue(Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->p()V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 43
    .line 44
    new-instance v2, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v3, "NetworkMonitor initialized with state: "

    .line 47
    .line 48
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 52
    .line 53
    invoke-interface {p0}, Ll/u120;->getValue()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-interface {v0, v1, p0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method private final p()V
    .locals 4

    .line 1
    new-instance v0, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$c;-><init>(Lcom/clevertap/android/sdk/network/NetworkMonitor;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->g()Landroid/net/ConnectivityManager;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {v1, v0}, Landroid/net/ConnectivityManager;->registerDefaultNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catch_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    iput-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->d:Landroid/net/ConnectivityManager$NetworkCallback;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 21
    .line 22
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 23
    .line 24
    const-string v2, "Network callback registered successfully"

    .line 25
    .line 26
    invoke-interface {v0, v1, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :goto_1
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 33
    .line 34
    new-instance v2, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v3, "Network callback registration failed: "

    .line 37
    .line 38
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-interface {v1, p0, v0}, Ll/axl;->debug(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public final h()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->e:Ll/u120;

    .line 2
    .line 3
    invoke-interface {p0}, Ll/u120;->getValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 8
    .line 9
    return-object p0
.end method

.method public final i()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->h()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->c()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "getNetworkType: result="

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v1, p0, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return-object v0
.end method

.method public final k()Ljava/lang/String;
    .locals 4
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->i()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/clevertap/android/sdk/network/NetworkMonitor$b;->a:[I

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    aget v0, v1, v0

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    packed-switch v0, :pswitch_data_0

    .line 15
    .line 16
    .line 17
    invoke-static {}, Ll/nbr;->a()V

    .line 18
    .line 19
    .line 20
    return-object v1

    .line 21
    :pswitch_0
    const-string v1, "Unknown"

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :pswitch_1
    const-string v1, "Unavailable"

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :pswitch_2
    const-string v1, "VPN"

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :pswitch_3
    const-string v1, "Ethernet"

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :pswitch_4
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->c:Landroid/content/Context;

    .line 34
    .line 35
    invoke-static {v0}, Lcom/clevertap/android/sdk/Utils;->l(Landroid/content/Context;)Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    goto :goto_0

    .line 40
    :pswitch_5
    const-string v1, "WiFi"

    .line 41
    .line 42
    :goto_0
    :pswitch_6
    iget-object v0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 43
    .line 44
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 45
    .line 46
    new-instance v2, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v3, "getNetworkTypeString: result="

    .line 49
    .line 50
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    invoke-interface {v0, p0, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    return-object v1

    .line 64
    nop

    .line 65
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
        :pswitch_6
    .end packed-switch
.end method

.method public final n()Z
    .locals 5

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->h()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-nez v1, :cond_1

    .line 10
    .line 11
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->c()Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    sget-object v2, Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;->UNDETECTED:Lcom/clevertap/android/sdk/network/NetworkMonitor$NetworkType;

    .line 16
    .line 17
    if-ne v1, v2, :cond_0

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_0
    const/4 v1, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    const/4 v1, 0x1

    .line 23
    :goto_1
    iget-object v2, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 26
    .line 27
    new-instance v3, Ljava/lang/StringBuilder;

    .line 28
    .line 29
    const-string v4, "isNetworkOnline: state="

    .line 30
    .line 31
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v0, ", result="

    .line 38
    .line 39
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-interface {v2, p0, v0}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    return v1
.end method

.method public final o()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/network/NetworkMonitor;->h()Lcom/clevertap/android/sdk/network/NetworkMonitor$a;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/NetworkMonitor$a;->e()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    iget-object v1, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->b:Ll/axl;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/clevertap/android/sdk/network/NetworkMonitor;->a:Ljava/lang/String;

    .line 12
    .line 13
    new-instance v2, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v3, "isWifiConnected: result="

    .line 16
    .line 17
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    invoke-interface {v1, p0, v2}, Ll/axl;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    return v0
.end method
