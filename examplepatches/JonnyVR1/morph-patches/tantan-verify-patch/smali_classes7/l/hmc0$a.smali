.class public final Ll/hmc0$a;
.super Ll/gc20;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/hmc0;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x11
    name = "a"
.end annotation


# instance fields
.field public final b:Ll/w84;

.field public volatile c:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final synthetic d:Ll/hmc0;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>(Ll/hmc0;Ll/w84;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/hmc0;->e()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const-string v0, "OkHttp %s"

    .line 12
    .line 13
    invoke-direct {p0, v0, p1}, Ll/gc20;-><init>(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-direct {p1, v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/hmc0$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    iput-object p2, p0, Ll/hmc0$a;->b:Ll/w84;

    .line 25
    .line 26
    return-void
.end method


# virtual methods
.method public k()V
    .locals 6

    .line 1
    const-string v0, "Callback failure for "

    .line 2
    .line 3
    const-string v1, "canceled due to "

    .line 4
    .line 5
    iget-object v2, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 6
    .line 7
    invoke-static {v2}, Ll/hmc0;->a(Ll/hmc0;)Ll/oij0;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-virtual {v2}, Ll/oij0;->p()V

    .line 12
    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    :try_start_0
    iget-object v3, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 16
    .line 17
    invoke-virtual {v3}, Ll/hmc0;->c()Ll/i5d0;

    .line 18
    .line 19
    .line 20
    move-result-object v2
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 21
    const/4 v3, 0x1

    .line 22
    :try_start_1
    iget-object v4, p0, Ll/hmc0$a;->b:Ll/w84;

    .line 23
    .line 24
    iget-object v5, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 25
    .line 26
    invoke-interface {v4, v5, v2}, Ll/w84;->onResponse(Ll/ry3;Ll/i5d0;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    .line 28
    .line 29
    :goto_0
    iget-object v0, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 30
    .line 31
    iget-object v0, v0, Ll/hmc0;->a:Ll/rg50;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/rg50;->m()Ll/o5e;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v0, p0}, Ll/o5e;->f(Ll/hmc0$a;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception v0

    .line 42
    move v2, v3

    .line 43
    goto :goto_1

    .line 44
    :catch_0
    move-exception v1

    .line 45
    move v2, v3

    .line 46
    goto :goto_3

    .line 47
    :catchall_1
    move-exception v0

    .line 48
    goto :goto_1

    .line 49
    :catch_1
    move-exception v1

    .line 50
    goto :goto_3

    .line 51
    :goto_1
    :try_start_2
    iget-object v3, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 52
    .line 53
    invoke-virtual {v3}, Ll/hmc0;->cancel()V

    .line 54
    .line 55
    .line 56
    if-nez v2, :cond_0

    .line 57
    .line 58
    new-instance v2, Ljava/io/IOException;

    .line 59
    .line 60
    new-instance v3, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    invoke-direct {v2, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    iget-object v1, p0, Ll/hmc0$a;->b:Ll/w84;

    .line 79
    .line 80
    iget-object v3, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 81
    .line 82
    invoke-interface {v1, v3, v2}, Ll/w84;->onFailure(Ll/ry3;Ljava/io/IOException;)V

    .line 83
    .line 84
    .line 85
    goto :goto_2

    .line 86
    :catchall_2
    move-exception v0

    .line 87
    goto :goto_4

    .line 88
    :cond_0
    :goto_2
    throw v0

    .line 89
    :goto_3
    if-eqz v2, :cond_1

    .line 90
    .line 91
    invoke-static {}, Lokhttp3/internal/platform/Platform;->get()Lokhttp3/internal/platform/Platform;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    new-instance v3, Ljava/lang/StringBuilder;

    .line 96
    .line 97
    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    iget-object v0, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 101
    .line 102
    invoke-virtual {v0}, Ll/hmc0;->f()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    const/4 v3, 0x4

    .line 114
    invoke-virtual {v2, v3, v0, v1}, Lokhttp3/internal/platform/Platform;->log(ILjava/lang/String;Ljava/lang/Throwable;)V

    .line 115
    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_1
    iget-object v0, p0, Ll/hmc0$a;->b:Ll/w84;

    .line 119
    .line 120
    iget-object v2, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 121
    .line 122
    invoke-interface {v0, v2, v1}, Ll/w84;->onFailure(Ll/ry3;Ljava/io/IOException;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 123
    .line 124
    .line 125
    goto :goto_0

    .line 126
    :goto_4
    iget-object v1, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 127
    .line 128
    iget-object v1, v1, Ll/hmc0;->a:Ll/rg50;

    .line 129
    .line 130
    invoke-virtual {v1}, Ll/rg50;->m()Ll/o5e;

    .line 131
    .line 132
    .line 133
    move-result-object v1

    .line 134
    invoke-virtual {v1, p0}, Ll/o5e;->f(Ll/hmc0$a;)V

    .line 135
    .line 136
    .line 137
    throw v0
.end method

.method public l()Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public m(Ljava/util/concurrent/ExecutorService;)V
    .locals 2

    .line 1
    :try_start_0
    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    return-void

    .line 5
    :catchall_0
    move-exception p1

    .line 6
    goto :goto_0

    .line 7
    :catch_0
    move-exception p1

    .line 8
    :try_start_1
    new-instance v0, Ljava/io/InterruptedIOException;

    .line 9
    .line 10
    const-string v1, "executor rejected"

    .line 11
    .line 12
    invoke-direct {v0, v1}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, p1}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 19
    .line 20
    invoke-static {p1}, Ll/hmc0;->a(Ll/hmc0;)Ll/oij0;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p1, v0}, Ll/oij0;->l(Ljava/io/IOException;)Ljava/io/IOException;

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ll/hmc0$a;->b:Ll/w84;

    .line 28
    .line 29
    iget-object v1, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 30
    .line 31
    invoke-interface {p1, v1, v0}, Ll/w84;->onFailure(Ll/ry3;Ljava/io/IOException;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 35
    .line 36
    iget-object p1, p1, Ll/hmc0;->a:Ll/rg50;

    .line 37
    .line 38
    invoke-virtual {p1}, Ll/rg50;->m()Ll/o5e;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {p1, p0}, Ll/o5e;->f(Ll/hmc0$a;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :goto_0
    iget-object v0, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 47
    .line 48
    iget-object v0, v0, Ll/hmc0;->a:Ll/rg50;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/rg50;->m()Ll/o5e;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0, p0}, Ll/o5e;->f(Ll/hmc0$a;)V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public n()Ll/hmc0;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public o()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/hmc0$a;->d:Ll/hmc0;

    .line 2
    .line 3
    iget-object p0, p0, Ll/hmc0;->c:Ll/x1d0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/x1d0;->k()Ll/rnl;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Ll/rnl;->m()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public p(Ll/hmc0$a;)V
    .locals 0

    .line 1
    iget-object p1, p1, Ll/hmc0$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    iput-object p1, p0, Ll/hmc0$a;->c:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    return-void
.end method
