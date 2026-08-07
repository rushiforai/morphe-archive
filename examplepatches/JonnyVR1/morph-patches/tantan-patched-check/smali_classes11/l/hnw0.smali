.class public final Ll/hnw0;
.super Ll/dnw0;
.source "SourceFile"


# instance fields
.field public final synthetic b:Ll/snw0;


# direct methods
.method public constructor <init>(Ll/snw0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/dnw0;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    iget-object v0, p0, Ll/hnw0;->b:Ll/snw0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/snw0;->g(Ll/snw0;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 9
    .line 10
    invoke-static {v1}, Ll/snw0;->i(Ll/snw0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-lez v1, :cond_0

    .line 20
    .line 21
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 22
    .line 23
    invoke-static {v1}, Ll/snw0;->i(Ll/snw0;)Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-lez v1, :cond_0

    .line 32
    .line 33
    iget-object p0, p0, Ll/hnw0;->b:Ll/snw0;

    .line 34
    .line 35
    invoke-static {p0}, Ll/snw0;->f(Ll/snw0;)Ll/cnw0;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const-string v1, "Leaving the connection open for other ongoing calls."

    .line 40
    .line 41
    new-array v2, v2, [Ljava/lang/Object;

    .line 42
    .line 43
    invoke-virtual {p0, v1, v2}, Ll/cnw0;->c(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 44
    .line 45
    .line 46
    monitor-exit v0

    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 51
    .line 52
    invoke-static {v1}, Ll/snw0;->d(Ll/snw0;)Landroid/os/IInterface;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    if-eqz v3, :cond_1

    .line 57
    .line 58
    invoke-static {v1}, Ll/snw0;->f(Ll/snw0;)Ll/cnw0;

    .line 59
    .line 60
    .line 61
    move-result-object v1

    .line 62
    const-string v3, "Unbind from service."

    .line 63
    .line 64
    new-array v4, v2, [Ljava/lang/Object;

    .line 65
    .line 66
    invoke-virtual {v1, v3, v4}, Ll/cnw0;->c(Ljava/lang/String;[Ljava/lang/Object;)I

    .line 67
    .line 68
    .line 69
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 70
    .line 71
    invoke-static {v1}, Ll/snw0;->a(Ll/snw0;)Landroid/content/Context;

    .line 72
    .line 73
    .line 74
    move-result-object v3

    .line 75
    invoke-static {v1}, Ll/snw0;->b(Ll/snw0;)Landroid/content/ServiceConnection;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v3, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V

    .line 80
    .line 81
    .line 82
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 83
    .line 84
    invoke-static {v1, v2}, Ll/snw0;->l(Ll/snw0;Z)V

    .line 85
    .line 86
    .line 87
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 88
    .line 89
    const/4 v2, 0x0

    .line 90
    invoke-static {v1, v2}, Ll/snw0;->m(Ll/snw0;Landroid/os/IInterface;)V

    .line 91
    .line 92
    .line 93
    iget-object v1, p0, Ll/hnw0;->b:Ll/snw0;

    .line 94
    .line 95
    invoke-static {v1, v2}, Ll/snw0;->k(Ll/snw0;Landroid/content/ServiceConnection;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    iget-object p0, p0, Ll/hnw0;->b:Ll/snw0;

    .line 99
    .line 100
    invoke-static {p0}, Ll/snw0;->o(Ll/snw0;)V

    .line 101
    .line 102
    .line 103
    monitor-exit v0

    .line 104
    return-void

    .line 105
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 106
    throw p0
.end method
