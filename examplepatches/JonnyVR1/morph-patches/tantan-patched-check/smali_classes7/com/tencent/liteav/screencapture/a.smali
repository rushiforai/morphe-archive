.class public Lcom/tencent/liteav/screencapture/a;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/liteav/screencapture/a$b;,
        Lcom/tencent/liteav/screencapture/a$a;
    }
.end annotation


# instance fields
.field protected final a:Landroid/os/Handler;

.field protected volatile b:Landroid/os/HandlerThread;

.field protected volatile c:Lcom/tencent/liteav/screencapture/a$b;

.field protected volatile d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/screencapture/b;",
            ">;"
        }
    .end annotation
.end field

.field protected volatile e:I

.field protected f:I

.field protected g:I

.field protected h:I

.field protected i:Z

.field private final j:Z

.field private final k:Landroid/content/Context;

.field private l:Ljava/lang/Object;

.field private m:I

.field private n:I

.field private o:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/basic/b/b;",
            ">;"
        }
    .end annotation
.end field

.field private p:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/tencent/liteav/screencapture/a$a;",
            ">;"
        }
    .end annotation
.end field

.field private q:Lcom/tencent/liteav/screencapture/c$b;


# direct methods
.method public constructor <init>(Landroid/content/Context;ZLcom/tencent/liteav/screencapture/a$a;)V
    .locals 4

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->d:Ljava/lang/ref/WeakReference;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput v1, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 13
    .line 14
    const/16 v1, 0x2d0

    .line 15
    .line 16
    iput v1, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 17
    .line 18
    const/16 v2, 0x500

    .line 19
    .line 20
    iput v2, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 21
    .line 22
    const/16 v3, 0x14

    .line 23
    .line 24
    iput v3, p0, Lcom/tencent/liteav/screencapture/a;->h:I

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    iput-boolean v3, p0, Lcom/tencent/liteav/screencapture/a;->i:Z

    .line 28
    .line 29
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->l:Ljava/lang/Object;

    .line 30
    .line 31
    iput v1, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 32
    .line 33
    iput v2, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 34
    .line 35
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->o:Ljava/lang/ref/WeakReference;

    .line 36
    .line 37
    new-instance v0, Lcom/tencent/liteav/screencapture/a$1;

    .line 38
    .line 39
    invoke-direct {v0, p0}, Lcom/tencent/liteav/screencapture/a$1;-><init>(Lcom/tencent/liteav/screencapture/a;)V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->q:Lcom/tencent/liteav/screencapture/c$b;

    .line 43
    .line 44
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 45
    .line 46
    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 47
    .line 48
    .line 49
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->p:Ljava/lang/ref/WeakReference;

    .line 50
    .line 51
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a;->k:Landroid/content/Context;

    .line 56
    .line 57
    new-instance p1, Landroid/os/Handler;

    .line 58
    .line 59
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 60
    .line 61
    .line 62
    move-result-object p3

    .line 63
    invoke-direct {p1, p3}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a;->a:Landroid/os/Handler;

    .line 67
    .line 68
    iput-boolean p2, p0, Lcom/tencent/liteav/screencapture/a;->j:Z

    .line 69
    .line 70
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 98
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->o:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method public static synthetic a(Lcom/tencent/liteav/screencapture/a;Ljava/lang/ref/WeakReference;)Ljava/lang/ref/WeakReference;
    .locals 0

    .line 76
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a;->p:Ljava/lang/ref/WeakReference;

    return-object p1
.end method

.method public static synthetic b(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/a$a;
    .locals 0

    .line 97
    invoke-direct {p0}, Lcom/tencent/liteav/screencapture/a;->d()Lcom/tencent/liteav/screencapture/a$a;

    move-result-object p0

    return-object p0
.end method

.method private c(II)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/liteav/screencapture/a;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_4

    .line 4
    .line 5
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->k:Landroid/content/Context;

    .line 6
    .line 7
    const-string v1, "window"

    .line 8
    .line 9
    invoke-virtual {v0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    check-cast v0, Landroid/view/WindowManager;

    .line 14
    .line 15
    invoke-interface {v0}, Landroid/view/WindowManager;->getDefaultDisplay()Landroid/view/Display;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {v0}, Landroid/view/Display;->getRotation()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    const/4 v1, 0x2

    .line 26
    if-ne v0, v1, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-ge p1, p2, :cond_1

    .line 30
    .line 31
    iput p2, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 32
    .line 33
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 37
    .line 38
    iput p2, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 39
    .line 40
    goto :goto_1

    .line 41
    :cond_2
    :goto_0
    if-le p1, p2, :cond_3

    .line 42
    .line 43
    iput p2, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 44
    .line 45
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 46
    .line 47
    goto :goto_1

    .line 48
    :cond_3
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 49
    .line 50
    iput p2, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 51
    .line 52
    goto :goto_1

    .line 53
    :cond_4
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 54
    .line 55
    iput p2, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 56
    .line 57
    :goto_1
    iget p1, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 58
    .line 59
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 60
    .line 61
    iget p1, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 62
    .line 63
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 64
    .line 65
    return-void
.end method

.method public static synthetic c(Lcom/tencent/liteav/screencapture/a;)Z
    .locals 0

    .line 66
    iget-boolean p0, p0, Lcom/tencent/liteav/screencapture/a;->j:Z

    return p0
.end method

.method public static synthetic d(Lcom/tencent/liteav/screencapture/a;)I
    .locals 0

    .line 14
    iget p0, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    return p0
.end method

.method private d()Lcom/tencent/liteav/screencapture/a$a;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->p:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Lcom/tencent/liteav/screencapture/a$a;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const/4 p0, 0x0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Lcom/tencent/liteav/screencapture/a;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic f(Lcom/tencent/liteav/screencapture/a;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->l:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic g(Lcom/tencent/liteav/screencapture/a;)Landroid/content/Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->k:Landroid/content/Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic h(Lcom/tencent/liteav/screencapture/a;)Lcom/tencent/liteav/screencapture/c$b;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->q:Lcom/tencent/liteav/screencapture/c$b;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public a(III)I
    .locals 0

    .line 77
    iput p3, p0, Lcom/tencent/liteav/screencapture/a;->h:I

    .line 78
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/screencapture/a;->c(II)V

    .line 79
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a;->a()V

    .line 80
    const-string p0, "TXCScreenCapture"

    const-string p1, "start screen capture"

    invoke-static {p0, p1}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public a()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a;->b()V

    .line 2
    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    new-instance v0, Landroid/os/HandlerThread;

    .line 6
    .line 7
    const-string v1, "ScreenCaptureGLThread"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 13
    .line 14
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 17
    .line 18
    .line 19
    new-instance v0, Lcom/tencent/liteav/screencapture/a$b;

    .line 20
    .line 21
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 22
    .line 23
    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-direct {v0, p0, v1, p0}, Lcom/tencent/liteav/screencapture/a$b;-><init>(Lcom/tencent/liteav/screencapture/a;Landroid/os/Looper;Lcom/tencent/liteav/screencapture/a;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 31
    .line 32
    iget v0, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 33
    .line 34
    const/4 v1, 0x1

    .line 35
    add-int/2addr v0, v1

    .line 36
    iput v0, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 37
    .line 38
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 39
    .line 40
    iget v2, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 41
    .line 42
    iput v2, v0, Lcom/tencent/liteav/screencapture/a$b;->a:I

    .line 43
    .line 44
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 45
    .line 46
    iget v2, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 47
    .line 48
    iput v2, v0, Lcom/tencent/liteav/screencapture/a$b;->e:I

    .line 49
    .line 50
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 51
    .line 52
    iget v2, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 53
    .line 54
    iput v2, v0, Lcom/tencent/liteav/screencapture/a$b;->f:I

    .line 55
    .line 56
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 57
    .line 58
    iget v2, p0, Lcom/tencent/liteav/screencapture/a;->h:I

    .line 59
    .line 60
    if-ge v2, v1, :cond_0

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_0
    move v1, v2

    .line 64
    :goto_0
    iput v1, v0, Lcom/tencent/liteav/screencapture/a$b;->g:I

    .line 65
    .line 66
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    const/16 v0, 0x64

    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lcom/tencent/liteav/screencapture/a;->b(I)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :catchall_0
    move-exception v0

    .line 74
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 75
    throw v0
.end method

.method public a(I)V
    .locals 1

    .line 92
    iput p1, p0, Lcom/tencent/liteav/screencapture/a;->h:I

    const/16 v0, 0x67

    .line 93
    invoke-virtual {p0, v0, p1}, Lcom/tencent/liteav/screencapture/a;->b(II)V

    return-void
.end method

.method public a(II)V
    .locals 1

    .line 94
    invoke-direct {p0, p1, p2}, Lcom/tencent/liteav/screencapture/a;->c(II)V

    const/16 v0, 0x69

    .line 95
    invoke-virtual {p0, v0, p1, p2}, Lcom/tencent/liteav/screencapture/a;->b(III)V

    return-void
.end method

.method public a(IJ)V
    .locals 1

    .line 99
    monitor-enter p0

    .line 100
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 101
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {v0, p1, p2, p3}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 102
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a(ILjava/lang/Runnable;)V
    .locals 1

    .line 103
    monitor-enter p0

    .line 104
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 105
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 106
    iput p1, v0, Landroid/os/Message;->what:I

    .line 107
    iput-object p2, v0, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 108
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 109
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public a(ILjavax/microedition/khronos/egl/EGLContext;IIIJ)V
    .locals 0

    .line 110
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a;->c()Lcom/tencent/liteav/screencapture/b;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 111
    invoke-interface/range {p0 .. p7}, Lcom/tencent/liteav/screencapture/b;->a(ILjavax/microedition/khronos/egl/EGLContext;IIIJ)V

    :cond_0
    return-void
.end method

.method public a(Lcom/tencent/liteav/basic/b/b;)V
    .locals 1

    .line 91
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->o:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Lcom/tencent/liteav/screencapture/b;)V
    .locals 1

    .line 90
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->d:Ljava/lang/ref/WeakReference;

    return-void
.end method

.method public a(Ljava/lang/Object;)V
    .locals 2

    .line 81
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "stop encode: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "TXCScreenCapture"

    invoke-static {v1, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    iput-object p1, p0, Lcom/tencent/liteav/screencapture/a;->l:Ljava/lang/Object;

    .line 83
    invoke-virtual {p0}, Lcom/tencent/liteav/screencapture/a;->b()V

    return-void
.end method

.method public declared-synchronized a(Ljava/lang/Runnable;)V
    .locals 1

    monitor-enter p0

    .line 96
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 97
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method public a(Z)V
    .locals 1

    .line 84
    monitor-enter p0

    .line 85
    :try_start_0
    new-instance v0, Lcom/tencent/liteav/screencapture/a$2;

    invoke-direct {v0, p0, p1}, Lcom/tencent/liteav/screencapture/a$2;-><init>(Lcom/tencent/liteav/screencapture/a;Z)V

    .line 86
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz p1, :cond_0

    .line 87
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 88
    :cond_0
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    .line 89
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b()V
    .locals 3

    .line 69
    monitor-enter p0

    .line 70
    :try_start_0
    iget v0, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/tencent/liteav/screencapture/a;->e:I

    .line 71
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 72
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 73
    iget-object v1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 74
    new-instance v2, Lcom/tencent/liteav/screencapture/a$3;

    invoke-direct {v2, p0, v1, v0}, Lcom/tencent/liteav/screencapture/a$3;-><init>(Lcom/tencent/liteav/screencapture/a;Landroid/os/Handler;Landroid/os/HandlerThread;)V

    const/16 v0, 0x65

    invoke-virtual {p0, v0, v2}, Lcom/tencent/liteav/screencapture/a;->a(ILjava/lang/Runnable;)V

    goto :goto_0

    :catchall_0
    move-exception v0

    goto :goto_1

    :cond_0
    :goto_0
    const/4 v0, 0x0

    .line 75
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    .line 76
    iput-object v0, p0, Lcom/tencent/liteav/screencapture/a;->b:Landroid/os/HandlerThread;

    .line 77
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0
.end method

.method public b(I)V
    .locals 1

    .line 78
    monitor-enter p0

    .line 79
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 80
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {v0, p1}, Landroid/os/Handler;->sendEmptyMessage(I)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 81
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b(II)V
    .locals 1

    .line 82
    monitor-enter p0

    .line 83
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 84
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 85
    iput p1, v0, Landroid/os/Message;->what:I

    .line 86
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 87
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 88
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b(III)V
    .locals 1

    .line 89
    monitor-enter p0

    .line 90
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    if-eqz v0, :cond_0

    .line 91
    new-instance v0, Landroid/os/Message;

    invoke-direct {v0}, Landroid/os/Message;-><init>()V

    .line 92
    iput p1, v0, Landroid/os/Message;->what:I

    .line 93
    iput p2, v0, Landroid/os/Message;->arg1:I

    .line 94
    iput p3, v0, Landroid/os/Message;->arg2:I

    .line 95
    iget-object p1, p0, Lcom/tencent/liteav/screencapture/a;->c:Lcom/tencent/liteav/screencapture/a$b;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    goto :goto_0

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 96
    :cond_0
    :goto_0
    monitor-exit p0

    return-void

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public b(Z)V
    .locals 3

    .line 1
    iget v0, p0, Lcom/tencent/liteav/screencapture/a;->f:I

    .line 2
    .line 3
    if-eqz p1, :cond_2

    .line 4
    .line 5
    iget v1, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 6
    .line 7
    if-ge v0, v1, :cond_0

    .line 8
    .line 9
    move v2, v0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v2, v1

    .line 12
    :goto_0
    iput v2, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 13
    .line 14
    if-ge v0, v1, :cond_1

    .line 15
    .line 16
    move v0, v1

    .line 17
    :cond_1
    iput v0, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 18
    .line 19
    goto :goto_3

    .line 20
    :cond_2
    iget v1, p0, Lcom/tencent/liteav/screencapture/a;->g:I

    .line 21
    .line 22
    if-ge v0, v1, :cond_3

    .line 23
    .line 24
    move v2, v1

    .line 25
    goto :goto_1

    .line 26
    :cond_3
    move v2, v0

    .line 27
    :goto_1
    iput v2, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 28
    .line 29
    if-ge v0, v1, :cond_4

    .line 30
    .line 31
    goto :goto_2

    .line 32
    :cond_4
    move v0, v1

    .line 33
    :goto_2
    iput v0, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 34
    .line 35
    :goto_3
    sget-object v0, Ljava/util/Locale;->ENGLISH:Ljava/util/Locale;

    .line 36
    .line 37
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iget v1, p0, Lcom/tencent/liteav/screencapture/a;->m:I

    .line 42
    .line 43
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    iget p0, p0, Lcom/tencent/liteav/screencapture/a;->n:I

    .line 48
    .line 49
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    filled-new-array {p1, v1, p0}, [Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    const-string p1, "reset screen capture isPortrait[%b] output size[%d/%d]"

    .line 58
    .line 59
    invoke-static {v0, p1, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    const-string p1, "TXCScreenCapture"

    .line 64
    .line 65
    invoke-static {p1, p0}, Lcom/tencent/liteav/basic/log/TXCLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public c()Lcom/tencent/liteav/screencapture/b;
    .locals 1

    .line 67
    iget-object v0, p0, Lcom/tencent/liteav/screencapture/a;->d:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/tencent/liteav/screencapture/a;->d:Ljava/lang/ref/WeakReference;

    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/tencent/liteav/screencapture/b;

    return-object p0
.end method

.method public c(I)V
    .locals 0

    .line 68
    invoke-direct {p0}, Lcom/tencent/liteav/screencapture/a;->d()Lcom/tencent/liteav/screencapture/a$a;

    move-result-object p0

    if-eqz p0, :cond_0

    if-nez p1, :cond_0

    .line 69
    invoke-interface {p0}, Lcom/tencent/liteav/screencapture/a$a;->onScreenCaptureStarted()V

    :cond_0
    return-void
.end method
