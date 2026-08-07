.class public final Ll/jpj0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ljava/lang/Thread$UncaughtExceptionHandler;


# direct methods
.method public constructor <init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 0
    .param p1    # Ljava/lang/Thread$UncaughtExceptionHandler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/jpj0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic a(Ll/jpj0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/jpj0;->c()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static d(Ljava/lang/Thread$UncaughtExceptionHandler;)V
    .locals 4
    .param p0    # Ljava/lang/Thread$UncaughtExceptionHandler;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    new-instance v0, Ll/jpj0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/jpj0;-><init>(Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-virtual {v0}, Ll/jpj0;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    new-instance v2, Lcom/tantanapp/beatles/safety/exception/IgnoreException;

    .line 16
    .line 17
    const-string v3, "Hook mH failed!"

    .line 18
    .line 19
    invoke-direct {v2, v3, v0}, Lcom/tantanapp/beatles/safety/exception/IgnoreException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 20
    .line 21
    .line 22
    invoke-interface {p0, v1, v2}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method


# virtual methods
.method public final b()V
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Lcom/tantanapp/beatles/utils/ReflectException;
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/ygl;->c()Landroid/os/Handler;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    new-instance v0, Landroid/os/Handler;

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    new-instance v1, Ll/jpj0$a;

    .line 17
    .line 18
    invoke-direct {v1, p0}, Ll/jpj0$a;-><init>(Ll/jpj0;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const-string v2, "mCallback"

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Ll/puc0;->e(Ljava/lang/String;)Ll/puc0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    invoke-virtual {v1}, Ll/puc0;->h()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Landroid/os/Handler$Callback;

    .line 39
    .line 40
    invoke-static {v0}, Ll/puc0;->l(Ljava/lang/Object;)Ll/puc0;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    new-instance v4, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;

    .line 45
    .line 46
    iget-object p0, p0, Ll/jpj0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 47
    .line 48
    invoke-direct {v4, v0, v1, p0}, Lcom/tantanapp/beatles/safety/core/hook/ProxyHandlerCallback;-><init>(Landroid/os/Handler;Landroid/os/Handler$Callback;Ljava/lang/Thread$UncaughtExceptionHandler;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v2, v4}, Ll/puc0;->p(Ljava/lang/String;Ljava/lang/Object;)Ll/puc0;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public final c()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :goto_0
    :try_start_0
    invoke-static {}, Landroid/os/Looper;->loop()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    goto :goto_1

    .line 6
    :catchall_0
    move-exception v1

    .line 7
    iget-object v2, p0, Ll/jpj0;->a:Ljava/lang/Thread$UncaughtExceptionHandler;

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v3

    .line 13
    invoke-interface {v2, v3, v1}, Ljava/lang/Thread$UncaughtExceptionHandler;->uncaughtException(Ljava/lang/Thread;Ljava/lang/Throwable;)V

    .line 14
    .line 15
    .line 16
    :goto_1
    add-int/lit8 v1, v0, 0x1

    .line 17
    .line 18
    const v2, 0x7fffffff

    .line 19
    .line 20
    .line 21
    if-lt v0, v2, :cond_0

    .line 22
    .line 23
    invoke-static {}, Ll/yx0;->d()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    move v0, v1

    .line 28
    goto :goto_0
.end method
