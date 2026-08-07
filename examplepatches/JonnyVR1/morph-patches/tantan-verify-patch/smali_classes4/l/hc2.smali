.class final Ll/hc2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;
.implements Ll/dm80;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;",
        "Ll/dm80<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final a:Ll/dr60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/dr60<",
            "TT;>;"
        }
    .end annotation
.end field

.field private final b:Ll/v3f$b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/v3f$b<",
            "TT;*>;"
        }
    .end annotation
.end field

.field private volatile c:Z


# direct methods
.method public constructor <init>(Ll/v3f$b;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/v3f$b<",
            "TT;*>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/hc2;->b:Ll/v3f$b;

    .line 5
    .line 6
    new-instance p1, Ll/dr60;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/dr60;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/hc2;->a:Ll/dr60;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public a(Ll/jcg0;Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/jcg0<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/cr60;

    .line 2
    .line 3
    invoke-direct {v0, p2, p1}, Ll/cr60;-><init>(Ljava/lang/Object;Ll/jcg0;)V

    .line 4
    .line 5
    .line 6
    monitor-enter p0

    .line 7
    :try_start_0
    iget-object p1, p0, Ll/hc2;->a:Ll/dr60;

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ll/dr60;->a(Ll/cr60;)V

    .line 10
    .line 11
    .line 12
    iget-boolean p1, p0, Ll/hc2;->c:Z

    .line 13
    .line 14
    if-nez p1, :cond_0

    .line 15
    .line 16
    const/4 p1, 0x1

    .line 17
    iput-boolean p1, p0, Ll/hc2;->c:Z

    .line 18
    .line 19
    iget-object p1, p0, Ll/hc2;->b:Ll/v3f$b;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/v3f$b;->b()Ljava/util/concurrent/ExecutorService;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    invoke-interface {p1, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception p1

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :goto_0
    monitor-exit p0

    .line 32
    return-void

    .line 33
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    throw p1
.end method

.method public run()V
    .locals 6

    .line 1
    :goto_0
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Ll/hc2;->a:Ll/dr60;

    .line 3
    .line 4
    const/16 v2, 0x3e8

    .line 5
    .line 6
    invoke-virtual {v1, v2}, Ll/dr60;->c(I)Ll/cr60;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    if-nez v1, :cond_1

    .line 11
    .line 12
    monitor-enter p0
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 13
    :try_start_1
    iget-object v1, p0, Ll/hc2;->a:Ll/dr60;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/dr60;->b()Ll/cr60;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    if-nez v1, :cond_0

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/hc2;->c:Z

    .line 22
    .line 23
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    iput-boolean v0, p0, Ll/hc2;->c:Z

    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_2
    monitor-exit p0

    .line 30
    goto :goto_2

    .line 31
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    :try_start_3
    throw v1

    .line 33
    :catchall_1
    move-exception v1

    .line 34
    goto :goto_4

    .line 35
    :catch_0
    move-exception v1

    .line 36
    goto :goto_3

    .line 37
    :cond_1
    :goto_2
    iget-object v2, p0, Ll/hc2;->b:Ll/v3f$b;

    .line 38
    .line 39
    invoke-virtual {v2, v1}, Ll/v3f$b;->e(Ll/cr60;)V
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :goto_3
    :try_start_4
    iget-object v2, p0, Ll/hc2;->b:Ll/v3f$b;

    .line 44
    .line 45
    invoke-virtual {v2}, Ll/v3f$b;->c()Ll/wzv;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    sget-object v3, Ljava/util/logging/Level;->WARNING:Ljava/util/logging/Level;

    .line 50
    .line 51
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 52
    .line 53
    .line 54
    move-result-object v4

    .line 55
    invoke-virtual {v4}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v4

    .line 59
    new-instance v5, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 62
    .line 63
    .line 64
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    const-string v4, " was interruppted"

    .line 68
    .line 69
    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v4

    .line 76
    invoke-interface {v2, v3, v4, v1}, Ll/wzv;->b(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 77
    .line 78
    .line 79
    iput-boolean v0, p0, Ll/hc2;->c:Z

    .line 80
    .line 81
    return-void

    .line 82
    :goto_4
    iput-boolean v0, p0, Ll/hc2;->c:Z

    .line 83
    .line 84
    throw v1
.end method
