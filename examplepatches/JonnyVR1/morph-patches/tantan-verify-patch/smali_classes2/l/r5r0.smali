.class public Ll/r5r0;
.super Ljava/lang/Object;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/r5r0$d;,
        Ll/r5r0$f;,
        Ll/r5r0$c;,
        Ll/r5r0$e;
    }
.end annotation


# static fields
.field static final f:Ll/r5r0$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r5r0$d<",
            "Ll/r5r0$f;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field

.field static final g:Ll/r5r0$d;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/r5r0$d<",
            "Landroid/os/Message;",
            "Ljava/lang/Runnable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field private final a:Landroid/os/HandlerThread;

.field private final b:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ll/r5r0$f;",
            ">;"
        }
    .end annotation
.end field

.field private final c:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Landroid/os/Message;",
            ">;"
        }
    .end annotation
.end field

.field private volatile d:Landroid/os/Handler;

.field private final e:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/r5r0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/r5r0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/r5r0;->f:Ll/r5r0$d;

    .line 7
    .line 8
    new-instance v0, Ll/r5r0$b;

    .line 9
    .line 10
    invoke-direct {v0}, Ll/r5r0$b;-><init>()V

    .line 11
    .line 12
    .line 13
    sput-object v0, Ll/r5r0;->g:Ll/r5r0$d;

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/r5r0;->b:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/r5r0;->c:Ljava/util/Queue;

    .line 17
    .line 18
    new-instance v0, Ljava/lang/Object;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/r5r0;->e:Ljava/lang/Object;

    .line 24
    .line 25
    new-instance v0, Ll/r5r0$e;

    .line 26
    .line 27
    invoke-direct {v0, p0, p1}, Ll/r5r0$e;-><init>(Ll/r5r0;Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/r5r0;->a:Landroid/os/HandlerThread;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Ll/r5r0;Landroid/os/Handler;)Landroid/os/Handler;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic c(Ll/r5r0;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->e:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static g(Ljava/util/Collection;Ljava/lang/Object;Ll/r5r0$d;)Z
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<",
            "L:Ljava/lang/Object;",
            "O:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Collection<",
            "T",
            "L;",
            ">;TO;",
            "Ll/r5r0$d<",
            "-T",
            "L;",
            "TO;>;)Z"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_2

    .line 3
    .line 4
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    .line 5
    .line 6
    .line 7
    move-result v1

    .line 8
    if-nez v1, :cond_2

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    goto :goto_1

    .line 13
    :cond_0
    :try_start_0
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {p2, v1, p1}, Ll/r5r0$d;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_1

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    .line 36
    const/4 v0, 0x1

    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    :cond_2
    :goto_1
    return v0
.end method

.method public static synthetic h(Ll/r5r0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method private m(Ljava/lang/Runnable;)Landroid/os/Message;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/os/Message;->obtain(Landroid/os/Handler;Ljava/lang/Runnable;)Landroid/os/Message;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic n(Ll/r5r0;)Ljava/util/Queue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->b:Ljava/util/Queue;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Ll/r5r0;)Ljava/util/Queue;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->c:Ljava/util/Queue;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a()Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public final d(Landroid/os/Message;J)Z
    .locals 3

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p2, v0

    .line 4
    .line 5
    if-gez v2, :cond_0

    .line 6
    .line 7
    move-wide p2, v0

    .line 8
    :cond_0
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    add-long/2addr v0, p2

    .line 13
    invoke-virtual {p0, p1, v0, v1}, Ll/r5r0;->k(Landroid/os/Message;J)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public final e(Ljava/lang/Runnable;)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ll/r5r0;->m(Ljava/lang/Runnable;)Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p0, p1, v0, v1}, Ll/r5r0;->d(Landroid/os/Message;J)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public final f(Ljava/lang/Runnable;J)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/r5r0;->m(Ljava/lang/Runnable;)Landroid/os/Message;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1, p2, p3}, Ll/r5r0;->d(Landroid/os/Message;J)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public i()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->a:Landroid/os/HandlerThread;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final j(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/r5r0;->b:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/r5r0;->c:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ll/r5r0;->b:Ljava/util/Queue;

    .line 18
    .line 19
    sget-object v1, Ll/r5r0;->f:Ll/r5r0$d;

    .line 20
    .line 21
    invoke-static {v0, p1, v1}, Ll/r5r0;->g(Ljava/util/Collection;Ljava/lang/Object;Ll/r5r0$d;)Z

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ll/r5r0;->c:Ljava/util/Queue;

    .line 25
    .line 26
    sget-object v1, Ll/r5r0;->g:Ll/r5r0$d;

    .line 27
    .line 28
    invoke-static {v0, p1, v1}, Ll/r5r0;->g(Ljava/util/Collection;Ljava/lang/Object;Ll/r5r0$d;)Z

    .line 29
    .line 30
    .line 31
    :cond_1
    iget-object v0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 32
    .line 33
    if-eqz v0, :cond_2

    .line 34
    .line 35
    iget-object p0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    :cond_2
    return-void
.end method

.method public final k(Landroid/os/Message;J)Z
    .locals 3

    .line 1
    iget-object v0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-object v0, p0, Ll/r5r0;->e:Ljava/lang/Object;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-object v2, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 10
    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/r5r0;->b:Ljava/util/Queue;

    .line 14
    .line 15
    new-instance v2, Ll/r5r0$f;

    .line 16
    .line 17
    invoke-direct {v2, p1, p2, p3}, Ll/r5r0$f;-><init>(Landroid/os/Message;J)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p0, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    monitor-exit v0

    .line 24
    return v1

    .line 25
    :catchall_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    monitor-exit v0

    .line 28
    goto :goto_1

    .line 29
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0

    .line 31
    :cond_1
    :goto_1
    :try_start_1
    iget-object p0, p0, Ll/r5r0;->d:Landroid/os/Handler;

    .line 32
    .line 33
    invoke-virtual {p0, p1, p2, p3}, Landroid/os/Handler;->sendMessageAtTime(Landroid/os/Message;J)Z

    .line 34
    .line 35
    .line 36
    move-result p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    return p0

    .line 38
    :catchall_1
    return v1
.end method

.method public l()Landroid/os/HandlerThread;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/r5r0;->a:Landroid/os/HandlerThread;

    .line 2
    .line 3
    return-object p0
.end method
