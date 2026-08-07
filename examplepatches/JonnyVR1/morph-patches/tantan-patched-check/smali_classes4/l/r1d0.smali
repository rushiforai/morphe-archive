.class public Ll/r1d0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/util/concurrent/ExecutorService;

.field public static b:Ll/vpl;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sput-object v0, Ll/r1d0;->a:Ljava/util/concurrent/ExecutorService;

    .line 6
    .line 7
    invoke-static {}, Ll/i1c;->e()Ll/i1c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sput-object v0, Ll/r1d0;->b:Ll/vpl;

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()V
    .locals 0

    .line 1
    invoke-static {}, Ll/r1d0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic b()Ll/vpl;
    .locals 1

    .line 1
    sget-object v0, Ll/r1d0;->b:Ll/vpl;

    .line 2
    .line 3
    return-object v0
.end method

.method public static c(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/r1d0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/r1d0$e;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/r1d0$e;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    invoke-static {}, Ll/m4g0;->f()Ll/m4g0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/m4g0;->e()Ljava/util/concurrent/atomic/AtomicLong;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    invoke-static {v0, v1}, Ll/n4f0;->d(J)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public static e(Ljava/lang/Runnable;)V
    .locals 2

    .line 1
    sget-object v0, Ll/r1d0;->a:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Ll/r1d0$d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/r1d0$d;-><init>(Ljava/lang/Runnable;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public static f(Ll/q4f;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r1d0$b;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r1d0$b;-><init>(Ll/q4f;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->e(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static g(Ll/q4f;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r1d0$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r1d0$a;-><init>(Ll/q4f;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->e(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static h(Ll/q4f;)V
    .locals 1

    .line 1
    new-instance v0, Ll/r1d0$c;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/r1d0$c;-><init>(Ll/q4f;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/r1d0;->e(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method
