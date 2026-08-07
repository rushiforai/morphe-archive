.class public Ll/whi0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/e7m;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/whi0$b;
    }
.end annotation


# instance fields
.field public final a:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final b:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final c:Ljava/util/concurrent/atomic/AtomicLong;

.field public final d:Ljava/util/concurrent/atomic/AtomicLong;

.field public final e:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final f:Ljava/util/concurrent/atomic/AtomicLong;

.field public g:Ljava/lang/ThreadGroup;

.field public h:Ll/j610;

.field public i:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Ll/whi0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 11
    .line 12
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/whi0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 19
    .line 20
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 21
    .line 22
    const-wide/16 v2, 0x0

    .line 23
    .line 24
    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Ll/whi0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 28
    .line 29
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 30
    .line 31
    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/whi0;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 35
    .line 36
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 37
    .line 38
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 39
    .line 40
    .line 41
    iput-object v0, p0, Ll/whi0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 42
    .line 43
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 44
    .line 45
    invoke-direct {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 46
    .line 47
    .line 48
    iput-object v0, p0, Ll/whi0;->f:Ljava/util/concurrent/atomic/AtomicLong;

    .line 49
    .line 50
    return-void
.end method

.method public static synthetic b(Ll/whi0;Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/whi0;->j(Ljava/lang/Runnable;)Ljava/lang/Thread;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/whi0;Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/whi0;->k(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V

    return-void
.end method

.method public static bridge synthetic d(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->e:Ljava/util/concurrent/atomic/AtomicInteger;

    return-object p0
.end method

.method public static bridge synthetic e(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->f:Ljava/util/concurrent/atomic/AtomicLong;

    return-object p0
.end method

.method public static bridge synthetic f(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/whi0;)Ljava/util/concurrent/atomic/AtomicLong;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->d:Ljava/util/concurrent/atomic/AtomicLong;

    return-object p0
.end method

.method public static i()Ll/whi0;
    .locals 1

    .line 1
    invoke-static {}, Ll/whi0$b;->a()Ll/whi0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method


# virtual methods
.method public a()Ljava/util/concurrent/ThreadPoolExecutor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->h:Ll/j610;

    .line 2
    .line 3
    return-object p0
.end method

.method public h(IIJIZ)Ll/whi0;
    .locals 18

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    new-instance v0, Ljava/lang/ThreadGroup;

    .line 4
    .line 5
    const-string v2, "tt_io_group"

    .line 6
    .line 7
    invoke-direct {v0, v2}, Ljava/lang/ThreadGroup;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, v1, Ll/whi0;->g:Ljava/lang/ThreadGroup;

    .line 11
    .line 12
    new-instance v0, Ll/whi0$a;

    .line 13
    .line 14
    new-instance v7, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 15
    .line 16
    move/from16 v2, p5

    .line 17
    .line 18
    invoke-direct {v7, v2}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>(I)V

    .line 19
    .line 20
    .line 21
    new-instance v8, Ll/uhi0;

    .line 22
    .line 23
    invoke-direct {v8, v1}, Ll/uhi0;-><init>(Ll/whi0;)V

    .line 24
    .line 25
    .line 26
    new-instance v9, Ll/vhi0;

    .line 27
    .line 28
    invoke-direct {v9, v1}, Ll/vhi0;-><init>(Ll/whi0;)V

    .line 29
    .line 30
    .line 31
    sget-object v15, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 32
    .line 33
    move/from16 v2, p1

    .line 34
    .line 35
    move/from16 v3, p2

    .line 36
    .line 37
    move-wide/from16 v4, p3

    .line 38
    .line 39
    move-object v6, v15

    .line 40
    invoke-direct/range {v0 .. v9}, Ll/whi0$a;-><init>(Ll/whi0;IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;Ljava/util/concurrent/RejectedExecutionHandler;)V

    .line 41
    .line 42
    .line 43
    iput-object v0, v1, Ll/whi0;->h:Ll/j610;

    .line 44
    .line 45
    move/from16 v2, p6

    .line 46
    .line 47
    invoke-virtual {v0, v2}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 48
    .line 49
    .line 50
    new-instance v10, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 51
    .line 52
    new-instance v16, Ljava/util/concurrent/LinkedBlockingQueue;

    .line 53
    .line 54
    invoke-direct/range {v16 .. v16}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 55
    .line 56
    .line 57
    new-instance v0, Lrx/internal/util/RxThreadFactory;

    .line 58
    .line 59
    const-string v2, "TTRxBackup-"

    .line 60
    .line 61
    invoke-direct {v0, v2}, Lrx/internal/util/RxThreadFactory;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    const/4 v11, 0x1

    .line 65
    const/4 v12, 0x1

    .line 66
    const-wide/16 v13, 0x8

    .line 67
    .line 68
    move-object/from16 v17, v0

    .line 69
    .line 70
    invoke-direct/range {v10 .. v17}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 71
    .line 72
    .line 73
    iput-object v10, v1, Ll/whi0;->i:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 74
    .line 75
    return-object v1
.end method

.method public final synthetic j(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .locals 4

    .line 1
    iget-object v0, p0, Ll/whi0;->a:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    new-instance v1, Ll/asd0;

    .line 8
    .line 9
    iget-object p0, p0, Ll/whi0;->g:Ljava/lang/ThreadGroup;

    .line 10
    .line 11
    new-instance v2, Ljava/lang/StringBuilder;

    .line 12
    .line 13
    const-string v3, "TTRxIo-t-"

    .line 14
    .line 15
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-direct {v1, p0, p1, v0}, Ll/asd0;-><init>(Ljava/lang/ThreadGroup;Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-object v1
.end method

.method public final synthetic k(Ljava/lang/Runnable;Ljava/util/concurrent/ThreadPoolExecutor;)V
    .locals 0

    .line 1
    iget-object p2, p0, Ll/whi0;->b:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/whi0;->l(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public final l(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/whi0;->i:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
