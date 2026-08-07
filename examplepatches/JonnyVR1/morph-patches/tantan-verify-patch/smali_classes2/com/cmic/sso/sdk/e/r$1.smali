.class Lcom/cmic/sso/sdk/e/r$1;
.super Landroid/net/ConnectivityManager$NetworkCallback;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r$a;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/cmic/sso/sdk/e/r$a;

.field final synthetic b:Lcom/cmic/sso/sdk/e/r;


# direct methods
.method public constructor <init>(Lcom/cmic/sso/sdk/e/r;Lcom/cmic/sso/sdk/e/r$a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/cmic/sso/sdk/e/r$1;->a:Lcom/cmic/sso/sdk/e/r$a;

    .line 4
    .line 5
    invoke-direct {p0}, Landroid/net/ConnectivityManager$NetworkCallback;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onAvailable(Landroid/net/Network;)V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 3
    .line 4
    invoke-static {v1}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;)Landroid/net/ConnectivityManager;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    invoke-virtual {v1, p1}, Landroid/net/ConnectivityManager;->getNetworkCapabilities(Landroid/net/Network;)Landroid/net/NetworkCapabilities;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    const/4 v2, 0x0

    .line 13
    invoke-virtual {v1, v2}, Landroid/net/NetworkCapabilities;->hasTransport(I)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 20
    .line 21
    invoke-static {v1, p1}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;Landroid/net/Network;)Landroid/net/Network;

    .line 22
    .line 23
    .line 24
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/r$1;->a:Lcom/cmic/sso/sdk/e/r$a;

    .line 25
    .line 26
    invoke-interface {v1, p1}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V

    .line 27
    .line 28
    .line 29
    iget-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 30
    .line 31
    invoke-static {p1, v2}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;Z)Z

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :catch_0
    move-exception p1

    .line 36
    goto :goto_0

    .line 37
    :cond_0
    const-string p1, "WifiNetworkUtils"

    .line 38
    .line 39
    const-string v1, "\u5207\u6362\u5931\u8d25\uff0c\u672a\u5f00\u542f\u6570\u636e\u7f51\u7edc"

    .line 40
    .line 41
    invoke-static {p1, v1}, Lcom/cmic/sso/sdk/e/c;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iget-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 45
    .line 46
    invoke-static {p1, v0}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;Landroid/net/Network;)Landroid/net/Network;

    .line 47
    .line 48
    .line 49
    iget-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->a:Lcom/cmic/sso/sdk/e/r$a;

    .line 50
    .line 51
    invoke-interface {p1, v0}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 55
    .line 56
    invoke-static {p1}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;)Landroid/net/ConnectivityManager;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iget-object v1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 61
    .line 62
    invoke-static {v1}, Lcom/cmic/sso/sdk/e/r;->b(Lcom/cmic/sso/sdk/e/r;)Landroid/net/ConnectivityManager$NetworkCallback;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {p1, v1}, Landroid/net/ConnectivityManager;->unregisterNetworkCallback(Landroid/net/ConnectivityManager$NetworkCallback;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :goto_0
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 74
    .line 75
    invoke-static {p1, v0}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;Landroid/net/Network;)Landroid/net/Network;

    .line 76
    .line 77
    .line 78
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/r$1;->a:Lcom/cmic/sso/sdk/e/r$a;

    .line 79
    .line 80
    invoke-interface {p0, v0}, Lcom/cmic/sso/sdk/e/r$a;->a(Landroid/net/Network;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onLost(Landroid/net/Network;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/cmic/sso/sdk/e/r$1;->b:Lcom/cmic/sso/sdk/e/r;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-static {p0, p1}, Lcom/cmic/sso/sdk/e/r;->a(Lcom/cmic/sso/sdk/e/r;Z)Z

    .line 5
    .line 6
    .line 7
    return-void
.end method
