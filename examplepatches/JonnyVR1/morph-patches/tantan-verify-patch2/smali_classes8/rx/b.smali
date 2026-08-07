.class public Lrx/b;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/b$j;,
        Lrx/b$i;,
        Lrx/b$h;
    }
.end annotation


# static fields
.field public static final b:Lrx/b;

.field public static final c:Lrx/b;


# instance fields
.field public final a:Lrx/b$h;


# direct methods
.method static constructor <clinit>()V
    .locals 3

    .line 1
    new-instance v0, Lrx/b;

    .line 2
    .line 3
    new-instance v1, Lrx/b$b;

    .line 4
    .line 5
    invoke-direct {v1}, Lrx/b$b;-><init>()V

    .line 6
    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-direct {v0, v1, v2}, Lrx/b;-><init>(Lrx/b$h;Z)V

    .line 10
    .line 11
    .line 12
    sput-object v0, Lrx/b;->b:Lrx/b;

    .line 13
    .line 14
    new-instance v0, Lrx/b;

    .line 15
    .line 16
    new-instance v1, Lrx/b$e;

    .line 17
    .line 18
    invoke-direct {v1}, Lrx/b$e;-><init>()V

    .line 19
    .line 20
    .line 21
    invoke-direct {v0, v1, v2}, Lrx/b;-><init>(Lrx/b$h;Z)V

    .line 22
    .line 23
    .line 24
    sput-object v0, Lrx/b;->c:Lrx/b;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>(Lrx/b$h;)V
    .locals 0

    .line 13
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 14
    invoke-static {p1}, Ll/hrd0;->g(Lrx/b$h;)Lrx/b$h;

    move-result-object p1

    iput-object p1, p0, Lrx/b;->a:Lrx/b$h;

    return-void
.end method

.method public constructor <init>(Lrx/b$h;Z)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    invoke-static {p1}, Ll/hrd0;->g(Lrx/b$h;)Lrx/b$h;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    :cond_0
    iput-object p1, p0, Lrx/b;->a:Lrx/b$h;

    .line 11
    .line 12
    return-void
.end method

.method public static synthetic a(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lrx/b;->d(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static c(Lrx/b$h;)Lrx/b;
    .locals 1

    .line 1
    invoke-static {p0}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    :try_start_0
    new-instance v0, Lrx/b;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lrx/b;-><init>(Lrx/b$h;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    return-object v0

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 12
    .line 13
    .line 14
    invoke-static {p0}, Lrx/b;->j(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    throw p0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    throw p0
.end method

.method public static d(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-interface {v1, v0, p0}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static e(Ljava/util/concurrent/Callable;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/Callable<",
            "*>;)",
            "Lrx/b;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrx/b$g;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lrx/b$g;-><init>(Ljava/util/concurrent/Callable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/b;->c(Lrx/b$h;)Lrx/b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static f(Lrx/c;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "*>;)",
            "Lrx/b;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lrx/b$a;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lrx/b$a;-><init>(Lrx/c;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/b;->c(Lrx/b$h;)Lrx/b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static g(Ljava/lang/Iterable;)Lrx/b;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Lrx/b;",
            ">;)",
            "Lrx/b;"
        }
    .end annotation

    .line 1
    invoke-static {p0}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    new-instance v0, Ll/qo5;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Ll/qo5;-><init>(Ljava/lang/Iterable;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Lrx/b;->c(Lrx/b$h;)Lrx/b;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static h(Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)TT;"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    return-object p0
.end method

.method public static j(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/NullPointerException;

    .line 2
    .line 3
    const-string v1, "Actually not, but can\'t pass out an exception otherwise..."

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->initCause(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 9
    .line 10
    .line 11
    return-object v0
.end method


# virtual methods
.method public final b(Lrx/c;)Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lrx/c<",
            "TT;>;)",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Lrx/b;->k()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-virtual {p1, p0}, Lrx/c;->delaySubscription(Lrx/c;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public final i()Ll/kcg0;
    .locals 2

    .line 1
    new-instance v0, Ll/mu10;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/mu10;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Lrx/b$c;

    .line 7
    .line 8
    invoke-direct {v1, p0, v0}, Lrx/b$c;-><init>(Lrx/b;Ll/mu10;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0, v1}, Lrx/b;->n(Lrx/b$j;)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public final k()Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()",
            "Lrx/c<",
            "TT;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Lrx/b$f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/b$f;-><init>(Lrx/b;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public final l(Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/gcg0<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-virtual {p0, p1, v0}, Lrx/b;->m(Ll/gcg0;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public final m(Ll/gcg0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ll/gcg0<",
            "TT;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    if-eqz p2, :cond_0

    .line 5
    .line 6
    :try_start_0
    invoke-virtual {p1}, Ll/gcg0;->d()V

    .line 7
    .line 8
    .line 9
    :cond_0
    new-instance p2, Lrx/b$d;

    .line 10
    .line 11
    invoke-direct {p2, p0, p1}, Lrx/b$d;-><init>(Lrx/b;Ll/gcg0;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0, p2}, Lrx/b;->n(Lrx/b$j;)V

    .line 15
    .line 16
    .line 17
    invoke-static {p1}, Ll/hrd0;->o(Ll/kcg0;)Ll/kcg0;
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    .line 20
    return-void

    .line 21
    :catchall_0
    move-exception p0

    .line 22
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Ll/hrd0;->m(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 30
    .line 31
    .line 32
    invoke-static {p0}, Lrx/b;->j(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    throw p0

    .line 37
    :catch_0
    move-exception p0

    .line 38
    throw p0
.end method

.method public final n(Lrx/b$j;)V
    .locals 1

    .line 1
    invoke-static {p1}, Lrx/b;->h(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Lrx/b;->a:Lrx/b$h;

    .line 5
    .line 6
    invoke-static {p0, v0}, Ll/hrd0;->e(Lrx/b;Lrx/b$h;)Lrx/b$h;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p0

    .line 15
    invoke-static {p0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p0}, Ll/hrd0;->d(Ljava/lang/Throwable;)Ljava/lang/Throwable;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    invoke-static {p0}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    invoke-static {p0}, Lrx/b;->j(Ljava/lang/Throwable;)Ljava/lang/NullPointerException;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    throw p0

    .line 30
    :catch_0
    move-exception p0

    .line 31
    throw p0
.end method
