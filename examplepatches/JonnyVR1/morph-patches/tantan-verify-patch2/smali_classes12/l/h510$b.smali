.class public abstract Ll/h510$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/h510;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x409
    name = "b"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/h510$b$b;,
        Ll/h510$b$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<Params:",
        "Ljava/lang/Object;",
        "Progress:",
        "Ljava/lang/Object;",
        "Result:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# static fields
.field private static f:Ll/h510$b$b;


# instance fields
.field private a:[Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[TParams;"
        }
    .end annotation
.end field

.field private volatile b:Z

.field private volatile c:Z

.field private volatile d:J

.field private e:Ljava/lang/Object;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/h510$b;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/h510$b;->b:Z

    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/h510$b;Ljava/lang/Object;)Ljava/lang/Object;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/h510$b;->e:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic b(Ll/h510$b;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/h510$b;->b:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic c(Ll/h510$b;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/h510$b;->g()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ll/h510$b;Ll/h510$b$a;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/h510$b;->k(Ll/h510$b$a;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final varargs e([Ljava/lang/Object;)Ll/h510$b$a;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)",
            "Ll/h510$b$a<",
            "TResult;TProgress;>;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/h510$b$a;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ll/h510$b$a;-><init>(Ll/h510$a;)V

    .line 5
    .line 6
    .line 7
    :try_start_0
    invoke-virtual {p0}, Ll/h510$b;->i()Z

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    if-nez v1, :cond_0

    .line 12
    .line 13
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v1}, Ljava/lang/Thread;->getId()J

    .line 18
    .line 19
    .line 20
    move-result-wide v1

    .line 21
    iput-wide v1, p0, Ll/h510$b;->d:J

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ll/h510$b;->f([Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    iput-object p1, v0, Ll/h510$b$a;->b:Ljava/lang/Object;

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    new-instance p1, Ljava/lang/Exception;

    .line 33
    .line 34
    const-string v1, "task already canceled"

    .line 35
    .line 36
    invoke-direct {p1, v1}, Ljava/lang/Exception;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iput-object p1, v0, Ll/h510$b$a;->d:Ljava/lang/Throwable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    goto :goto_1

    .line 42
    :goto_0
    iput-object p1, v0, Ll/h510$b$a;->d:Ljava/lang/Throwable;

    .line 43
    .line 44
    :goto_1
    iput-object p0, v0, Ll/h510$b$a;->a:Ll/h510$b;

    .line 45
    .line 46
    return-object v0
.end method

.method private g()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/h510$b;->e:Ljava/lang/Object;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_1

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/h510$b;->i()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    new-instance v0, Ll/h510$b$a;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-direct {v0, v1}, Ll/h510$b$a;-><init>(Ll/h510$a;)V

    .line 16
    .line 17
    .line 18
    iput-object p0, v0, Ll/h510$b$a;->a:Ll/h510$b;

    .line 19
    .line 20
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const/4 v2, 0x3

    .line 25
    iput v2, v1, Landroid/os/Message;->what:I

    .line 26
    .line 27
    iput-object v0, v1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 28
    .line 29
    invoke-static {}, Ll/h510$b;->h()Landroid/os/Handler;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-virtual {v0, v1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 34
    .line 35
    .line 36
    :cond_1
    invoke-static {}, Ll/h510;->a()Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    iget-object v1, p0, Ll/h510$b;->e:Ljava/lang/Object;

    .line 41
    .line 42
    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Ljava/util/List;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z
    :try_end_0
    .catch Ljava/lang/UnsupportedOperationException; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :catch_0
    move-exception v1

    .line 55
    const-string v2, "MomoTaskExecutor"

    .line 56
    .line 57
    const-string v3, "finish: "

    .line 58
    .line 59
    invoke-static {v2, v3, v1}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 60
    .line 61
    .line 62
    :goto_0
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-eqz v0, :cond_2

    .line 67
    .line 68
    invoke-static {}, Ll/h510;->a()Ljava/util/Map;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object p0, p0, Ll/h510$b;->e:Ljava/lang/Object;

    .line 73
    .line 74
    invoke-interface {v0, p0}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    :cond_2
    :goto_1
    return-void
.end method

.method public static h()Landroid/os/Handler;
    .locals 2

    .line 1
    sget-object v0, Ll/h510$b;->f:Ll/h510$b$b;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    const-class v0, Ll/h510;

    .line 6
    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    sget-object v1, Ll/h510$b;->f:Ll/h510$b$b;

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    new-instance v1, Ll/h510$b$b;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/h510$b$b;-><init>()V

    .line 15
    .line 16
    .line 17
    sput-object v1, Ll/h510$b;->f:Ll/h510$b$b;

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v1

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    goto :goto_2

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw v1

    .line 26
    :cond_1
    :goto_2
    sget-object v0, Ll/h510$b;->f:Ll/h510$b$b;

    .line 27
    .line 28
    return-object v0
.end method

.method private final k(Ll/h510$b$a;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/h510$b$a<",
            "TResult;TProgress;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/h510$b;->g()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/h510$b;->o()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p1, Ll/h510$b$a;->d:Ljava/lang/Throwable;

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p1, p1, Ll/h510$b$a;->b:Ljava/lang/Object;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Ll/h510$b;->p(Ljava/lang/Object;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    instance-of v1, v0, Ljava/lang/Exception;

    .line 18
    .line 19
    if-eqz v1, :cond_1

    .line 20
    .line 21
    check-cast v0, Ljava/lang/Exception;

    .line 22
    .line 23
    invoke-virtual {p0, v0}, Ll/h510$b;->n(Ljava/lang/Exception;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_1
    new-instance v0, Ljava/lang/Exception;

    .line 28
    .line 29
    iget-object p1, p1, Ll/h510$b$a;->d:Ljava/lang/Throwable;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Ljava/lang/Exception;-><init>(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0, v0}, Ll/h510$b;->n(Ljava/lang/Exception;)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public varargs abstract f([Ljava/lang/Object;)Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TParams;)TResult;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation
.end method

.method public final i()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/h510$b;->c:Z

    .line 2
    .line 3
    return p0
.end method

.method public j()V
    .locals 0

    .line 1
    return-void
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public varargs m([Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([TProgress;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public n(Ljava/lang/Exception;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/h510;->b()Ll/krl;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public o()V
    .locals 0

    .line 1
    return-void
.end method

.method public p(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TResult;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public run()V
    .locals 2

    .line 1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    iget-boolean v0, p0, Ll/h510$b;->b:Z

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-direct {p0}, Ll/h510$b;->g()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ll/h510$b;->a:[Ljava/lang/Object;

    .line 20
    .line 21
    invoke-direct {p0, v0}, Ll/h510$b;->e([Ljava/lang/Object;)Ll/h510$b$a;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sget-boolean v1, Ll/lv0;->b:Z

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    invoke-static {v0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    :cond_1
    iget-boolean v1, p0, Ll/h510$b;->b:Z

    .line 40
    .line 41
    if-eqz v1, :cond_3

    .line 42
    .line 43
    sget-boolean v0, Ll/lv0;->b:Z

    .line 44
    .line 45
    if-eqz v0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    :cond_2
    invoke-direct {p0}, Ll/h510$b;->g()V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :cond_3
    invoke-static {}, Landroid/os/Message;->obtain()Landroid/os/Message;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    const/4 v1, 0x1

    .line 63
    iput v1, p0, Landroid/os/Message;->what:I

    .line 64
    .line 65
    iput-object v0, p0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 66
    .line 67
    invoke-static {}, Ll/h510$b;->h()Landroid/os/Handler;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-virtual {v0, p0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 72
    .line 73
    .line 74
    return-void
.end method
