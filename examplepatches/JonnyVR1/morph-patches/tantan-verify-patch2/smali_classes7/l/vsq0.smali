.class public Ll/vsq0;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/vsq0$c;,
        Ll/vsq0$d;
    }
.end annotation


# instance fields
.field private a:Ll/vsq0$c;

.field private b:Landroid/os/Handler;

.field private volatile c:Z

.field private final d:Z

.field private e:I

.field private volatile f:Ll/vsq0$d;


# direct methods
.method public constructor <init>()V
    .locals 1

    const/4 v0, 0x0

    .line 29
    invoke-direct {p0, v0}, Ll/vsq0;-><init>(Z)V

    return-void
.end method

.method public constructor <init>(Z)V
    .locals 1

    const/4 v0, 0x0

    .line 28
    invoke-direct {p0, p1, v0}, Ll/vsq0;-><init>(ZI)V

    return-void
.end method

.method public constructor <init>(ZI)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Ll/vsq0;->b:Landroid/os/Handler;

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-boolean v0, p0, Ll/vsq0;->c:Z

    .line 9
    .line 10
    iput v0, p0, Ll/vsq0;->e:I

    .line 11
    .line 12
    new-instance v0, Ll/vsq0$a;

    .line 13
    .line 14
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-direct {v0, p0, v1}, Ll/vsq0$a;-><init>(Ll/vsq0;Landroid/os/Looper;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Ll/vsq0;->b:Landroid/os/Handler;

    .line 22
    .line 23
    iput-boolean p1, p0, Ll/vsq0;->d:Z

    .line 24
    .line 25
    iput p2, p0, Ll/vsq0;->e:I

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Ll/vsq0;)I
    .locals 0

    .line 1
    iget p0, p0, Ll/vsq0;->e:I

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic b(Ll/vsq0;)Landroid/os/Handler;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/vsq0;->b:Landroid/os/Handler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic c(Ll/vsq0;Ll/vsq0$d;)Ll/vsq0$d;
    .locals 0

    .line 1
    iput-object p1, p0, Ll/vsq0;->f:Ll/vsq0$d;

    .line 2
    .line 3
    return-object p1
.end method

.method private declared-synchronized d()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Ll/vsq0;->a:Ll/vsq0$c;

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Ll/vsq0;->c:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    monitor-exit p0

    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception v0

    .line 11
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 12
    throw v0
.end method

.method public static synthetic g(Ll/vsq0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/vsq0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic h(Ll/vsq0;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/vsq0;->c:Z

    .line 2
    .line 3
    return p0
.end method


# virtual methods
.method public declared-synchronized e(Ll/vsq0$d;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/vsq0;->a:Ll/vsq0$c;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Ll/vsq0$c;

    .line 7
    .line 8
    invoke-direct {v0, p0}, Ll/vsq0$c;-><init>(Ll/vsq0;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/vsq0;->a:Ll/vsq0$c;

    .line 12
    .line 13
    iget-boolean v1, p0, Ll/vsq0;->d:Z

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 16
    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-boolean v0, p0, Ll/vsq0;->c:Z

    .line 20
    .line 21
    iget-object v0, p0, Ll/vsq0;->a:Ll/vsq0$c;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 24
    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/vsq0;->a:Ll/vsq0$c;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ll/vsq0$c;->b(Ll/vsq0$d;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return-void

    .line 36
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public f(Ll/vsq0$d;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vsq0;->b:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/vsq0$b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Ll/vsq0$b;-><init>(Ll/vsq0;Ll/vsq0$d;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1, p2, p3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 9
    .line 10
    .line 11
    return-void
.end method
