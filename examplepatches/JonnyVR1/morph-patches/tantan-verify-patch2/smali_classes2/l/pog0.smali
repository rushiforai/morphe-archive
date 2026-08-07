.class public final Ll/pog0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ll/rg50$b;

.field public volatile b:Ll/rg50;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;)Ll/rug0;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pog0;->b:Ll/rg50;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/pog0;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/pog0;->b:Ll/rg50;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/pog0;->b()V

    .line 13
    .line 14
    .line 15
    new-instance v1, Ll/zug0;

    .line 16
    .line 17
    invoke-direct {v1}, Ll/zug0;-><init>()V

    .line 18
    .line 19
    .line 20
    const/4 v2, 0x3

    .line 21
    iput v2, v1, Ll/zug0;->c:I

    .line 22
    .line 23
    const-string v2, "DownloadHttpLoggingInterceptor"

    .line 24
    .line 25
    iget-object v3, v1, Ll/zug0;->b:Ll/cpg0;

    .line 26
    .line 27
    iput-object v2, v3, Ll/cpg0;->a:Ljava/lang/String;

    .line 28
    .line 29
    iget-object v2, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 30
    .line 31
    invoke-virtual {v2, v1}, Ll/rg50$b;->a(Ll/azm;)Ll/rg50$b;

    .line 32
    .line 33
    .line 34
    new-instance v1, Ll/wlg0;

    .line 35
    .line 36
    invoke-direct {v1}, Ll/wlg0;-><init>()V

    .line 37
    .line 38
    .line 39
    const-string v2, "DownloadLoggingEventListener"

    .line 40
    .line 41
    iput-object v2, v1, Ll/wlg0;->a:Ljava/lang/String;

    .line 42
    .line 43
    iget-object v2, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 44
    .line 45
    invoke-virtual {v2, v1}, Ll/rg50$b;->l(Ll/t4f$b;)Ll/rg50$b;

    .line 46
    .line 47
    .line 48
    iget-object v1, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 49
    .line 50
    invoke-virtual {v1}, Ll/rg50$b;->c()Ll/rg50;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    iput-object v1, p0, Ll/pog0;->b:Ll/rg50;

    .line 55
    .line 56
    const/4 v1, 0x0

    .line 57
    iput-object v1, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_0
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_0
    :goto_0
    monitor-exit v0

    .line 63
    goto :goto_2

    .line 64
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 65
    throw p0

    .line 66
    :cond_1
    :goto_2
    new-instance v0, Ll/rug0;

    .line 67
    .line 68
    iget-object p0, p0, Ll/pog0;->b:Ll/rg50;

    .line 69
    .line 70
    invoke-direct {v0, p0, p1}, Ll/rug0;-><init>(Ll/rg50;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-object v0
.end method

.method public final b()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/rg50$b;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/rg50$b;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 11
    .line 12
    const-wide/16 v1, 0x1e

    .line 13
    .line 14
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->f(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 20
    .line 21
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->u(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2, v3}, Ll/rg50$b;->y(JLjava/util/concurrent/TimeUnit;)Ll/rg50$b;

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Ll/pog0;->a:Ll/rg50$b;

    .line 30
    .line 31
    new-instance v0, Ll/h0h0;

    .line 32
    .line 33
    const-string v1, "DownloadIpv4PreferredDns"

    .line 34
    .line 35
    invoke-direct {v0, v1}, Ll/h0h0;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0, v0}, Ll/rg50$b;->j(Ll/o6e;)Ll/rg50$b;

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method
