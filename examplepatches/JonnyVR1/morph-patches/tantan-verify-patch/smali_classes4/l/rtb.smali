.class public Ll/rtb;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Thread$UncaughtExceptionHandler;


# instance fields
.field public final a:Ljava/lang/Thread$UncaughtExceptionHandler;

.field public final b:Ll/j5m;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/j5m<",
            "Lcom/tantanapp/beatles/safety/core/AbsSafetyPolicy;",
            ">;"
        }
    .end annotation
.end field

.field public final c:Landroid/os/Handler;

.field public d:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Ljava/lang/Thread;->getDefaultUncaughtExceptionHandler()Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/rtb;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 9
    .line 10
    new-instance v0, Landroid/os/Handler;

    .line 11
    .line 12
    invoke-direct {v0}, Landroid/os/Handler;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Ll/rtb;->c:Landroid/os/Handler;

    .line 16
    .line 17
    invoke-static {}, Ll/du2;->m()Ll/j5m;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Ll/rtb;->b:Ll/j5m;

    .line 22
    .line 23
    new-instance v1, Ll/rtb$a;

    .line 24
    .line 25
    invoke-direct {v1, p0}, Ll/rtb$a;-><init>(Ll/rtb;)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/rtb;->d:Ljava/lang/Runnable;

    .line 29
    .line 30
    invoke-static {}, Ll/f9r;->b()Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    iget-object v2, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 35
    .line 36
    check-cast v2, Ljava/lang/Integer;

    .line 37
    .line 38
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    const/4 v3, 0x3

    .line 43
    if-gt v2, v3, :cond_0

    .line 44
    .line 45
    iget-object v2, v1, Ll/pf60;->a:Ljava/lang/Object;

    .line 46
    .line 47
    check-cast v2, Ljava/lang/Integer;

    .line 48
    .line 49
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v2

    .line 53
    iget-object v1, v1, Ll/pf60;->b:Ljava/lang/Object;

    .line 54
    .line 55
    check-cast v1, Ljava/lang/Integer;

    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    add-int/lit8 v1, v1, 0x1

    .line 62
    .line 63
    invoke-static {v2, v1}, Ll/f9r;->d(II)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/rtb;->d:Ljava/lang/Runnable;

    .line 67
    .line 68
    const-wide/16 v1, 0x7530

    .line 69
    .line 70
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 71
    .line 72
    .line 73
    return-void

    .line 74
    :cond_0
    iget-object p0, p0, Ll/rtb;->d:Ljava/lang/Runnable;

    .line 75
    .line 76
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 77
    .line 78
    .line 79
    return-void
.end method

.method public static synthetic a(Ll/rtb;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/rtb;->g(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final b()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/rtb;->b:Ll/j5m;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ll/j5m;->b()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final c(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/rtb;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {v0}, Ll/euj0;->b(Ljava/lang/Thread$UncaughtExceptionHandler;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/rtb;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 12
    .line 13
    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    invoke-static {}, Ll/yx0;->d()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    invoke-static {p0}, Ljava/lang/Thread;->setDefaultUncaughtExceptionHandler(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/rtb;->b()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/rtb$b;

    .line 11
    .line 12
    invoke-direct {v0, p0}, Ll/rtb$b;-><init>(Ll/rtb;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/jpj0;->d(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public final e(Ljava/lang/Thread;)Z
    .locals 0

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public final f()Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/rtb;->b()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/rtb;->b:Ll/j5m;

    .line 8
    .line 9
    invoke-interface {p0}, Ll/j5m;->d()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-eqz p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final g(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 5

    .line 1
    invoke-static {}, Ll/g9r;->d()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/rtb;->d:Ljava/lang/Runnable;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object v1, p0, Ll/rtb;->c:Landroid/os/Handler;

    .line 9
    .line 10
    invoke-virtual {v1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Ll/rtb;->d:Ljava/lang/Runnable;

    .line 15
    .line 16
    :cond_0
    invoke-static {}, Ll/g9r;->c()Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/4 v1, -0x1

    .line 23
    invoke-static {v1}, Ll/f9r;->a(I)V

    .line 24
    .line 25
    .line 26
    :cond_1
    invoke-static {}, Ll/duj0;->d()Ll/duj0;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {p0, p1}, Ll/rtb;->e(Ljava/lang/Thread;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    invoke-virtual {v1, p2}, Ll/duj0;->c(Ljava/lang/Throwable;)Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    const/4 v4, 0x0

    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    invoke-virtual {v1, p1, p2, v4}, Ll/duj0;->k(Ljava/lang/Thread;Ljava/lang/Throwable;Z)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {p0, p1, p2}, Ll/rtb;->c(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :cond_2
    invoke-virtual {p0}, Ll/rtb;->b()Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-virtual {v1, p1, p2, v3}, Ll/duj0;->e(Ljava/lang/Thread;Ljava/lang/Throwable;Z)Z

    .line 53
    .line 54
    .line 55
    move-result v3

    .line 56
    if-eqz v3, :cond_3

    .line 57
    .line 58
    return-void

    .line 59
    :cond_3
    const/4 v3, 0x1

    .line 60
    if-nez v2, :cond_4

    .line 61
    .line 62
    invoke-virtual {v1, p1, p2, v3}, Ll/duj0;->k(Ljava/lang/Thread;Ljava/lang/Throwable;Z)V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_4
    if-nez v0, :cond_6

    .line 67
    .line 68
    invoke-static {p2}, Lcom/tantanapp/beatles/safety/utils/ThrowableUtils;->c(Ljava/lang/Throwable;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_6

    .line 73
    .line 74
    invoke-virtual {p0}, Ll/rtb;->b()Z

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    if-eqz v0, :cond_6

    .line 79
    .line 80
    instance-of v0, p2, Lcom/tantanapp/beatles/safety/exception/ActivityLifecycleException;

    .line 81
    .line 82
    if-eqz v0, :cond_5

    .line 83
    .line 84
    invoke-virtual {p0}, Ll/rtb;->f()Z

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    if-nez v0, :cond_5

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_5
    iget-object p0, p0, Ll/rtb;->b:Ll/j5m;

    .line 92
    .line 93
    invoke-interface {p0}, Ll/j5m;->a()V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v1, p1, p2, v3}, Ll/duj0;->k(Ljava/lang/Thread;Ljava/lang/Throwable;Z)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :cond_6
    :goto_0
    invoke-virtual {v1, p1, p2, v4}, Ll/duj0;->k(Ljava/lang/Thread;Ljava/lang/Throwable;Z)V

    .line 101
    .line 102
    .line 103
    invoke-virtual {p0, p1, p2}, Ll/rtb;->c(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 104
    .line 105
    .line 106
    return-void
.end method

.method public uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 1
    .param p1    # Ljava/lang/Thread;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Throwable;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0, p1}, Ll/rtb;->e(Ljava/lang/Thread;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/rtb;->b()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    return-void

    .line 15
    :cond_1
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/rtb;->g(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method
