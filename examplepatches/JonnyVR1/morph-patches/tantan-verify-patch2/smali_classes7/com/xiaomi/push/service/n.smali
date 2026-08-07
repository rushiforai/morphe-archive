.class public Lcom/xiaomi/push/service/n;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/n$a;,
        Lcom/xiaomi/push/service/n$c;,
        Lcom/xiaomi/push/service/n$d;,
        Lcom/xiaomi/push/service/n$b;
    }
.end annotation


# static fields
.field private static a:J

.field private static b:J

.field private static c:J


# instance fields
.field private final a:Lcom/xiaomi/push/service/n$a;

.field private final a:Lcom/xiaomi/push/service/n$c;


# direct methods
.method static constructor <clinit>()V
    .locals 4

    .line 1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-lez v0, :cond_0

    .line 10
    .line 11
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    :cond_0
    sput-wide v2, Lcom/xiaomi/push/service/n;->a:J

    .line 16
    .line 17
    sput-wide v2, Lcom/xiaomi/push/service/n;->b:J

    .line 18
    .line 19
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 30
    invoke-direct {p0, v0}, Lcom/xiaomi/push/service/n;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Lcom/xiaomi/push/service/n;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p1, :cond_0

    .line 5
    .line 6
    new-instance v0, Lcom/xiaomi/push/service/n$c;

    .line 7
    .line 8
    invoke-direct {v0, p1, p2}, Lcom/xiaomi/push/service/n$c;-><init>(Ljava/lang/String;Z)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    .line 12
    .line 13
    new-instance p1, Lcom/xiaomi/push/service/n$a;

    .line 14
    .line 15
    invoke-direct {p1, v0}, Lcom/xiaomi/push/service/n$a;-><init>(Lcom/xiaomi/push/service/n$c;)V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$a;

    .line 19
    .line 20
    return-void

    .line 21
    :cond_0
    const-string p0, "name == null"

    .line 22
    .line 23
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    throw p0
.end method

.method public constructor <init>(Z)V
    .locals 3

    .line 29
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Timer-"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Lcom/xiaomi/push/service/n;->b()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0, p1}, Lcom/xiaomi/push/service/n;-><init>(Ljava/lang/String;Z)V

    return-void
.end method

.method public static declared-synchronized a()J
    .locals 7

    const-class v0, Lcom/xiaomi/push/service/n;

    monitor-enter v0

    .line 46
    :try_start_0
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    .line 47
    sget-wide v3, Lcom/xiaomi/push/service/n;->b:J

    cmp-long v5, v1, v3

    if-lez v5, :cond_0

    .line 48
    sget-wide v5, Lcom/xiaomi/push/service/n;->a:J

    sub-long v3, v1, v3

    add-long/2addr v5, v3

    sput-wide v5, Lcom/xiaomi/push/service/n;->a:J

    goto :goto_0

    :catchall_0
    move-exception v1

    goto :goto_1

    .line 49
    :cond_0
    :goto_0
    sput-wide v1, Lcom/xiaomi/push/service/n;->b:J

    .line 50
    sget-wide v1, Lcom/xiaomi/push/service/n;->a:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-wide v1

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private static declared-synchronized b()J
    .locals 5

    const-class v0, Lcom/xiaomi/push/service/n;

    monitor-enter v0

    .line 78
    :try_start_0
    sget-wide v1, Lcom/xiaomi/push/service/n;->c:J

    const-wide/16 v3, 0x1

    add-long/2addr v3, v1

    sput-wide v3, Lcom/xiaomi/push/service/n;->c:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-wide v1

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method private b(Lcom/xiaomi/push/service/n$b;J)V
    .locals 4

    .line 1
    const-string v0, "Illegal delay to start the TimerTask: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    .line 4
    .line 5
    monitor-enter v1

    .line 6
    :try_start_0
    iget-object v2, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    .line 7
    .line 8
    invoke-static {v2}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;)Z

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    if-nez v2, :cond_1

    .line 13
    .line 14
    invoke-static {}, Lcom/xiaomi/push/service/n;->a()J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    add-long/2addr p2, v2

    .line 19
    const-wide/16 v2, 0x0

    .line 20
    .line 21
    cmp-long v2, p2, v2

    .line 22
    .line 23
    if-ltz v2, :cond_0

    .line 24
    .line 25
    new-instance v0, Lcom/xiaomi/push/service/n$d;

    .line 26
    .line 27
    invoke-direct {v0}, Lcom/xiaomi/push/service/n$d;-><init>()V

    .line 28
    .line 29
    .line 30
    iget v2, p1, Lcom/xiaomi/push/service/n$b;->a:I

    .line 31
    .line 32
    iput v2, v0, Lcom/xiaomi/push/service/n$d;->a:I

    .line 33
    .line 34
    iput-object p1, v0, Lcom/xiaomi/push/service/n$d;->a:Lcom/xiaomi/push/service/n$b;

    .line 35
    .line 36
    iput-wide p2, v0, Lcom/xiaomi/push/service/n$d;->a:J

    .line 37
    .line 38
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    .line 39
    .line 40
    invoke-static {p0, v0}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;Lcom/xiaomi/push/service/n$d;)V

    .line 41
    .line 42
    .line 43
    monitor-exit v1

    .line 44
    return-void

    .line 45
    :catchall_0
    move-exception p0

    .line 46
    goto :goto_0

    .line 47
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 48
    .line 49
    new-instance p1, Ljava/lang/StringBuilder;

    .line 50
    .line 51
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    throw p0

    .line 65
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 66
    .line 67
    const-string p1, "Timer was canceled"

    .line 68
    .line 69
    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    throw p0

    .line 73
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    throw p0
.end method


# virtual methods
.method public a()V
    .locals 2

    .line 34
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "quit. finalizer:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$a;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 35
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-virtual {p0}, Lcom/xiaomi/push/service/n$c;->a()V

    return-void
.end method

.method public a(I)V
    .locals 1

    .line 39
    iget-object v0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    monitor-enter v0

    .line 40
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-static {p0}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;)Lcom/xiaomi/push/service/n$c$a;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/n$c$a;->a(I)V

    .line 41
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(ILcom/xiaomi/push/service/n$b;)V
    .locals 1

    .line 42
    iget-object v0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    monitor-enter v0

    .line 43
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-static {p0}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;)Lcom/xiaomi/push/service/n$c$a;

    move-result-object p0

    invoke-virtual {p0, p1, p2}, Lcom/xiaomi/push/service/n$c$a;->a(ILcom/xiaomi/push/service/n$b;)V

    .line 44
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public a(Lcom/xiaomi/push/service/n$b;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/ouq0;->a()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-ge v0, v1, :cond_1

    .line 7
    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    .line 13
    .line 14
    if-ne v0, p0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const-string p0, "run job outside job job thread"

    .line 18
    .line 19
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    new-instance p0, Ljava/util/concurrent/RejectedExecutionException;

    .line 23
    .line 24
    const-string p1, "Run job outside job thread"

    .line 25
    .line 26
    invoke-direct {p0, p1}, Ljava/util/concurrent/RejectedExecutionException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw p0

    .line 30
    :cond_1
    :goto_0
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public a(Lcom/xiaomi/push/service/n$b;J)V
    .locals 2

    const-wide/16 v0, 0x0

    cmp-long v0, p2, v0

    if-ltz v0, :cond_0

    .line 51
    invoke-direct {p0, p1, p2, p3}, Lcom/xiaomi/push/service/n;->b(Lcom/xiaomi/push/service/n$b;J)V

    return-void

    .line 52
    :cond_0
    const-string p0, "delay < 0: "

    invoke-static {p0, p2, p3}, Ll/fcg0;->a(Ljava/lang/String;J)V

    return-void
.end method

.method public a()Z
    .locals 0

    .line 45
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-virtual {p0}, Lcom/xiaomi/push/service/n$c;->a()Z

    move-result p0

    return p0
.end method

.method public a(I)Z
    .locals 1

    .line 36
    iget-object v0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    monitor-enter v0

    .line 37
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-static {p0}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;)Lcom/xiaomi/push/service/n$c$a;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/xiaomi/push/service/n$c$a;->a(I)Z

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public b()V
    .locals 1

    .line 75
    iget-object v0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    monitor-enter v0

    .line 76
    :try_start_0
    iget-object p0, p0, Lcom/xiaomi/push/service/n;->a:Lcom/xiaomi/push/service/n$c;

    invoke-static {p0}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$c;)Lcom/xiaomi/push/service/n$c$a;

    move-result-object p0

    invoke-virtual {p0}, Lcom/xiaomi/push/service/n$c$a;->a()V

    .line 77
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method
