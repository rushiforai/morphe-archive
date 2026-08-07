.class public Ltech/sud/runtime/component/c/e;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private a:J

.field private b:Ljava/util/concurrent/atomic/AtomicLong;

.field private c:[I

.field private d:Landroid/app/ActivityManager;

.field private e:Z

.field private f:Z

.field private g:Ljava/util/concurrent/ScheduledExecutorService;

.field private final h:Landroid/content/ComponentCallbacks2;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 12

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Ltech/sud/runtime/component/c/e;->a:J

    .line 7
    .line 8
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 9
    .line 10
    invoke-direct {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>(J)V

    .line 11
    .line 12
    .line 13
    iput-object v2, p0, Ltech/sud/runtime/component/c/e;->b:Ljava/util/concurrent/atomic/AtomicLong;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    new-array v1, v0, [I

    .line 17
    .line 18
    iput-object v1, p0, Ltech/sud/runtime/component/c/e;->c:[I

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/e;->e:Z

    .line 22
    .line 23
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/e;->f:Z

    .line 24
    .line 25
    new-instance v2, Ltech/sud/runtime/component/c/e$1;

    .line 26
    .line 27
    invoke-direct {v2, p0}, Ltech/sud/runtime/component/c/e$1;-><init>(Ltech/sud/runtime/component/c/e;)V

    .line 28
    .line 29
    .line 30
    iput-object v2, p0, Ltech/sud/runtime/component/c/e;->h:Landroid/content/ComponentCallbacks2;

    .line 31
    .line 32
    const-string v3, "activity"

    .line 33
    .line 34
    invoke-virtual {p1, v3}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v3

    .line 38
    check-cast v3, Landroid/app/ActivityManager;

    .line 39
    .line 40
    iput-object v3, p0, Ltech/sud/runtime/component/c/e;->d:Landroid/app/ActivityManager;

    .line 41
    .line 42
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    invoke-static {}, Ltech/sud/runtime/core/JNIShell;->deviceIs64Bit()Z

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/e;->f:Z

    .line 51
    .line 52
    if-nez v4, :cond_1

    .line 53
    .line 54
    invoke-direct {p0}, Ltech/sud/runtime/component/c/e;->b()J

    .line 55
    .line 56
    .line 57
    move-result-wide v4

    .line 58
    iput-wide v4, p0, Ltech/sud/runtime/component/c/e;->a:J

    .line 59
    .line 60
    const-wide/32 v6, 0x2dc6c0

    .line 61
    .line 62
    .line 63
    cmp-long v4, v4, v6

    .line 64
    .line 65
    if-lez v4, :cond_0

    .line 66
    .line 67
    iput-wide v6, p0, Ltech/sud/runtime/component/c/e;->a:J

    .line 68
    .line 69
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/e;->f:Z

    .line 70
    .line 71
    :cond_0
    iget-object v4, p0, Ltech/sud/runtime/component/c/e;->c:[I

    .line 72
    .line 73
    aput v3, v4, v1

    .line 74
    .line 75
    :cond_1
    invoke-virtual {p1, v2}, Landroid/content/Context;->registerComponentCallbacks(Landroid/content/ComponentCallbacks;)V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Ljava/util/concurrent/Executors;->newScheduledThreadPool(I)Ljava/util/concurrent/ScheduledExecutorService;

    .line 79
    .line 80
    .line 81
    move-result-object v5

    .line 82
    iput-object v5, p0, Ltech/sud/runtime/component/c/e;->g:Ljava/util/concurrent/ScheduledExecutorService;

    .line 83
    .line 84
    new-instance v6, Ltech/sud/runtime/component/c/e$2;

    .line 85
    .line 86
    invoke-direct {v6, p0}, Ltech/sud/runtime/component/c/e$2;-><init>(Ltech/sud/runtime/component/c/e;)V

    .line 87
    .line 88
    .line 89
    const-wide/16 v7, 0x2

    .line 90
    .line 91
    const-wide/16 v9, 0x2

    .line 92
    .line 93
    sget-object v11, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 94
    .line 95
    invoke-interface/range {v5 .. v11}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method private a(I)V
    .locals 1

    .line 1
    const/4 v0, 0x5

    .line 2
    if-eq p1, v0, :cond_1

    .line 3
    .line 4
    const/16 v0, 0xa

    .line 5
    .line 6
    if-eq p1, v0, :cond_1

    .line 7
    .line 8
    const/16 v0, 0xf

    .line 9
    .line 10
    if-eq p1, v0, :cond_1

    .line 11
    .line 12
    const/16 v0, 0x28

    .line 13
    .line 14
    if-eq p1, v0, :cond_0

    .line 15
    .line 16
    const/16 v0, 0x3c

    .line 17
    .line 18
    if-eq p1, v0, :cond_0

    .line 19
    .line 20
    const/16 v0, 0x50

    .line 21
    .line 22
    if-eq p1, v0, :cond_0

    .line 23
    .line 24
    return-void

    .line 25
    :cond_0
    invoke-direct {p0}, Ltech/sud/runtime/component/c/e;->c()V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    invoke-direct {p0}, Ltech/sud/runtime/component/c/e;->c()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private a(J)V
    .locals 0

    .line 41
    iget-object p0, p0, Ltech/sud/runtime/component/c/e;->b:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/e;I)V
    .locals 0

    .line 42
    invoke-direct {p0, p1}, Ltech/sud/runtime/component/c/e;->a(I)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/e;J)V
    .locals 0

    .line 33
    invoke-direct {p0, p1, p2}, Ltech/sud/runtime/component/c/e;->a(J)V

    return-void
.end method

.method public static synthetic a(Ltech/sud/runtime/component/c/e;)[I
    .locals 0

    .line 34
    iget-object p0, p0, Ltech/sud/runtime/component/c/e;->c:[I

    return-object p0
.end method

.method private b()J
    .locals 2

    .line 1
    const-string p0, "/proc/meminfo"

    .line 2
    .line 3
    :try_start_0
    new-instance v0, Ljava/io/FileReader;

    .line 4
    .line 5
    invoke-direct {v0, p0}, Ljava/io/FileReader;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p0, Ljava/io/BufferedReader;

    .line 9
    .line 10
    const/16 v1, 0x2000

    .line 11
    .line 12
    invoke-direct {p0, v0, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;I)V

    .line 13
    .line 14
    .line 15
    :cond_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-eqz v0, :cond_1

    .line 20
    .line 21
    const-string v1, "MemTotal"

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    :cond_1
    invoke-virtual {p0}, Ljava/io/BufferedReader;->close()V

    .line 30
    .line 31
    .line 32
    const-string p0, " kB"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    const/4 v0, 0x0

    .line 39
    aget-object p0, p0, v0

    .line 40
    .line 41
    const-string v0, " "

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    array-length v0, p0

    .line 48
    add-int/lit8 v0, v0, -0x1

    .line 49
    .line 50
    aget-object p0, p0, v0

    .line 51
    .line 52
    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    int-to-long v0, p0

    .line 57
    return-wide v0

    .line 58
    :catch_0
    const-string p0, "Memory"

    .line 59
    .line 60
    const-string v0, "getTotalMemory failed"

    .line 61
    .line 62
    invoke-static {p0, v0}, Ltech/sud/runtime/component/h/f;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    const-wide/16 v0, 0x0

    .line 66
    .line 67
    return-wide v0
.end method

.method public static synthetic b(Ltech/sud/runtime/component/c/e;)Landroid/app/ActivityManager;
    .locals 0

    .line 68
    iget-object p0, p0, Ltech/sud/runtime/component/c/e;->d:Landroid/app/ActivityManager;

    return-object p0
.end method

.method private c()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ltech/sud/runtime/component/c/e;->e:Z

    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/content/Context;)V
    .locals 1

    .line 35
    iget-object v0, p0, Ltech/sud/runtime/component/c/e;->g:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 36
    :try_start_0
    iget-object p0, p0, Ltech/sud/runtime/component/c/e;->h:Landroid/content/ComponentCallbacks2;

    invoke-virtual {p1, p0}, Landroid/content/Context;->unregisterComponentCallbacks(Landroid/content/ComponentCallbacks;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 37
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    return-void
.end method

.method public a()Z
    .locals 7

    .line 38
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/e;->e:Z

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_1

    .line 39
    iget-boolean v0, p0, Ltech/sud/runtime/component/c/e;->f:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Ltech/sud/runtime/component/c/e;->b:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v3

    iget-wide v5, p0, Ltech/sud/runtime/component/c/e;->a:J

    cmp-long p0, v3, v5

    if-ltz p0, :cond_0

    return v2

    :cond_0
    return v1

    .line 40
    :cond_1
    iput-boolean v1, p0, Ltech/sud/runtime/component/c/e;->e:Z

    return v2
.end method
