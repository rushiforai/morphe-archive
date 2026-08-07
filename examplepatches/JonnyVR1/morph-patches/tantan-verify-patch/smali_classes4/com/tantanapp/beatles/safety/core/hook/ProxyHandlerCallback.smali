.class public Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/os/Handler$Callback;


# instance fields
.field public final a:Ll/y40;

.field public final b:Landroid/os/Handler;

.field public final c:Landroid/os/Handler$Callback;

.field public final d:Ljava/lang/Thread$UncaughtExceptionHandler;

.field public final e:I

.field public final f:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Handler;Landroid/os/Handler$Callback;Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 1
    .param p3    # Ljava/lang/Thread$UncaughtExceptionHandler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback$1;

    .line 5
    .line 6
    invoke-direct {v0, p0}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback$1;-><init>(Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->f:Ljava/util/Set;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->b:Landroid/os/Handler;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->c:Landroid/os/Handler$Callback;

    .line 14
    .line 15
    invoke-static {}, Ll/y40;->c()Ll/y40;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    iput-object p2, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->a:Ll/y40;

    .line 20
    .line 21
    iput-object p3, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->d:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 22
    .line 23
    invoke-static {p1}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    const-string p3, "SCHEDULE_CRASH"

    .line 28
    .line 29
    invoke-virtual {p2, p3}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    invoke-virtual {p2}, Ll/puc0;->h()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    check-cast p2, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {p2}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    iput p2, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->e:I

    .line 44
    .line 45
    invoke-static {p1}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const-string p1, "SERVICE_ARGS"

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p0}, Ll/puc0;->h()Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    check-cast p0, Ljava/lang/Integer;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 62
    .line 63
    .line 64
    invoke-interface {v0, p0}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 65
    .line 66
    .line 67
    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/Throwable;)Z
    .locals 5

    .line 1
    invoke-virtual {p1}, Ljava/lang/Throwable;->getStackTrace()[Ljava/lang/StackTraceElement;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    array-length p1, p0

    .line 6
    const/4 v0, 0x0

    .line 7
    move v1, v0

    .line 8
    :goto_0
    if-ge v1, p1, :cond_1

    .line 9
    .line 10
    aget-object v2, p0, v1

    .line 11
    .line 12
    const-string v3, "android.app.ActivityThread"

    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getClassName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v4

    .line 18
    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v3

    .line 22
    if-eqz v3, :cond_0

    .line 23
    .line 24
    const-string v3, "handleTopResumedActivityChanged"

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/StackTraceElement;->getMethodName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    if-eqz v2, :cond_0

    .line 35
    .line 36
    const/4 p0, 0x1

    .line 37
    return p0

    .line 38
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return v0
.end method

.method public final b(Landroid/os/Message;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->a:Ll/y40;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    :try_start_0
    iget v0, p1, Landroid/os/Message;->what:I

    .line 8
    .line 9
    invoke-virtual {p0, v0, p1}, Ll/y40;->a(ILandroid/os/Message;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 10
    .line 11
    .line 12
    :catch_0
    :cond_0
    return-void
.end method

.method public final c(Landroid/os/Message;Ljava/lang/Thread;Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    const-class v0, Landroid/os/DeadObjectException;

    .line 2
    .line 3
    invoke-static {p3, v0}, Lcom/tantanapp/beatles/safety/utils/ThrowableUtils;->a(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_2

    .line 8
    .line 9
    const-class v0, Landroid/os/DeadSystemException;

    .line 10
    .line 11
    invoke-static {p3, v0}, Lcom/tantanapp/beatles/safety/utils/ThrowableUtils;->a(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-class v0, Ljava/lang/IllegalStateException;

    .line 19
    .line 20
    invoke-static {p3, v0}, Lcom/tantanapp/beatles/safety/utils/ThrowableUtils;->a(Ljava/lang/Throwable;Ljava/lang/Class;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 27
    .line 28
    const/16 v1, 0x1d

    .line 29
    .line 30
    if-lt v0, v1, :cond_1

    .line 31
    .line 32
    invoke-virtual {p0, p3}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->a(Ljava/lang/Throwable;)Z

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    if-eqz v0, :cond_1

    .line 37
    .line 38
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->d:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 39
    .line 40
    new-instance p1, Lcom/tantanapp/beatles/safety/exception/IgnoreException;

    .line 41
    .line 42
    const-string v0, "catch IllegalStateException in ActivityThreadHandlerCallback"

    .line 43
    .line 44
    invoke-direct {p1, v0, p3}, Lcom/tantanapp/beatles/safety/exception/IgnoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {p0, p2, p1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void

    .line 51
    :cond_1
    invoke-virtual {p0, p1}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->b(Landroid/os/Message;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->d:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 55
    .line 56
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    new-instance p2, Lcom/tantanapp/beatles/safety/exception/ActivityLifecycleException;

    .line 61
    .line 62
    const-string v0, "Activity\u751f\u547d\u5468\u671f\u5f02\u5e38"

    .line 63
    .line 64
    invoke-direct {p2, v0, p3}, Lcom/tantanapp/beatles/safety/exception/ActivityLifecycleException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 65
    .line 66
    .line 67
    invoke-interface {p0, p1, p2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :cond_2
    :goto_0
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->d:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 72
    .line 73
    new-instance p1, Lcom/tantanapp/beatles/safety/exception/IgnoreException;

    .line 74
    .line 75
    const-string v0, "catch DeadObjectException in ActivityThreadHandlerCallback"

    .line 76
    .line 77
    invoke-direct {p1, v0, p3}, Lcom/tantanapp/beatles/safety/exception/IgnoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    invoke-interface {p0, p2, p1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public final d(Landroid/os/Message;)V
    .locals 2

    .line 1
    :try_start_0
    iget-object v0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->b:Landroid/os/Handler;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/os/Handler;->handleMessage(Landroid/os/Message;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {p0, p1, v1, v0}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->c(Landroid/os/Message;Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)Z
    .locals 3
    .param p1    # Landroid/os/Message;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    iget v1, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->e:I

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    if-ne v0, v1, :cond_0

    .line 7
    .line 8
    return v2

    .line 9
    :cond_0
    iget-object v1, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->f:Ljava/util/Set;

    .line 10
    .line 11
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-interface {v1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->d(Landroid/os/Message;)V

    .line 22
    .line 23
    .line 24
    return v2

    .line 25
    :cond_1
    iget-object p0, p0, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;->c:Landroid/os/Handler$Callback;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    invoke-interface {p0, p1}, Landroid/os/Handler$Callback;->handleMessage(Landroid/os/Message;)Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    return v2

    .line 36
    :cond_2
    const/4 p0, 0x0

    .line 37
    return p0
.end method
