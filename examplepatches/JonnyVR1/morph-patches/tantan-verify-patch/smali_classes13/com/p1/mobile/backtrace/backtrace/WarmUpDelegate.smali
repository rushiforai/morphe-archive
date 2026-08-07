.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$LocalWarmUpInvoker;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;
    }
.end annotation


# static fields
.field private static final ACTION_WARMED_UP:Ljava/lang/String; = "action.backtrace.warmed-up"

.field private static final PERMISSION_WARMED_UP:Ljava/lang/String; = ".backtrace.warmed_up"

.field private static final TAG:Ljava/lang/String; = "Matrix.WarmUpDelegate"

.field private static final TASK_TAG_CLEAN_UP:Ljava/lang/String; = "clean-up"

.field private static final TASK_TAG_COMPUTE_DISK_USAGE:Ljava/lang/String; = "compute-disk-usage"

.field private static final TASK_TAG_CONSUMING_UP:Ljava/lang/String; = "consuming-up"

.field private static final TASK_TAG_WARM_UP:Ljava/lang/String; = "warm-up"

.field static volatile sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;


# instance fields
.field private mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

.field private mIsolateRemote:Z

.field private final mPrepared:[Z

.field mSavingPath:Ljava/lang/String;

.field private mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

.field private mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

.field private mWarmedUpReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mIsolateRemote:Z

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    new-array v1, v1, [Z

    .line 9
    .line 10
    aput-boolean v0, v1, v0

    .line 11
    .line 12
    iput-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mPrepared:[Z

    .line 13
    .line 14
    return-void
.end method

.method public static synthetic access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$300(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->acquireWarmUpInvoker()Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic access$400(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)Z
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->warmUpBlocked(Ljava/lang/String;I)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public static synthetic access$500(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->warmUpFailed(Ljava/lang/String;I)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->releaseWarmUpInvoker(Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$700(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->broadcastWarmedUp(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$800(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->updateBacktraceMode(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private acquireWarmUpInvoker()Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mIsolateRemote:Z

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_1

    .line 5
    .line 6
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;

    .line 7
    .line 8
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mSavingPath:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {v0, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    new-instance v2, Landroid/os/Bundle;

    .line 14
    .line 15
    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 19
    .line 20
    iget-boolean v3, v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mEnableIsolateProcessLog:Z

    .line 21
    .line 22
    const-string v4, "enable-logger"

    .line 23
    .line 24
    invoke-virtual {v2, v4, v3}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 28
    .line 29
    iget-object v3, v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mPathOfXLogSo:Ljava/lang/String;

    .line 30
    .line 31
    const-string v4, "path-of-xlog-so"

    .line 32
    .line 33
    invoke-virtual {v2, v4, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 37
    .line 38
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 39
    .line 40
    invoke-virtual {v0, p0, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->connect(Landroid/content/Context;Landroid/os/Bundle;)Z

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    if-eqz p0, :cond_0

    .line 45
    .line 46
    return-object v0

    .line 47
    :cond_0
    return-object v1

    .line 48
    :cond_1
    new-instance p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$LocalWarmUpInvoker;

    .line 49
    .line 50
    invoke-direct {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$LocalWarmUpInvoker;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;)V

    .line 51
    .line 52
    .line 53
    return-object p0
.end method

.method private broadcastWarmedUp(Landroid/content/Context;)V
    .locals 5

    .line 1
    const-string v0, "Matrix.WarmUpDelegate"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    :try_start_0
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->warmUpMarkedFile(Landroid/content/Context;)Ljava/io/File;

    .line 5
    .line 6
    .line 7
    move-result-object v2

    .line 8
    invoke-virtual {v2}, Ljava/io/File;->createNewFile()Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    iget-object v3, v3, Landroid/content/pm/ApplicationInfo;->nativeLibraryDir:Ljava/lang/String;

    .line 16
    .line 17
    invoke-static {v2, v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->writeContentToFile(Ljava/io/File;Ljava/lang/String;)Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v2

    .line 22
    const-string v3, ""

    .line 23
    .line 24
    new-array v4, v1, [Ljava/lang/Object;

    .line 25
    .line 26
    invoke-static {v0, v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    const/4 v2, 0x1

    .line 30
    invoke-static {v2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setWarmedUp(Z)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 34
    .line 35
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mBacktraceMode:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 36
    .line 37
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->updateBacktraceMode(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "Broadcast warmed up message to other processes."

    .line 41
    .line 42
    new-array v2, v1, [Ljava/lang/Object;

    .line 43
    .line 44
    invoke-static {v0, p0, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    new-instance p0, Landroid/content/Intent;

    .line 48
    .line 49
    const-string v0, "action.backtrace.warmed-up"

    .line 50
    .line 51
    invoke-direct {p0, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const-string v0, "pid"

    .line 55
    .line 56
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 57
    .line 58
    .line 59
    move-result v2

    .line 60
    invoke-virtual {p0, v0, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    .line 61
    .line 62
    .line 63
    new-instance v0, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    const-string v2, ".backtrace.warmed_up"

    .line 76
    .line 77
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p1, p0, v0}, Landroid/content/Context;->sendBroadcast(Landroid/content/Intent;Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 88
    .line 89
    if-eqz p0, :cond_0

    .line 90
    .line 91
    sget-object p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->WarmedUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 92
    .line 93
    new-array v0, v1, [Ljava/lang/Object;

    .line 94
    .line 95
    invoke-interface {p0, p1, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 96
    .line 97
    .line 98
    :cond_0
    return-void
.end method

.method public static internalWarmUpSoPath(Ljava/lang/String;IZ)Z
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->warmUp(Ljava/lang/String;IZ)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method private releaseWarmUpInvoker(Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mIsolateRemote:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 10
    .line 11
    invoke-virtual {p1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$RemoteWarmUpInvoker;->disconnect(Landroid/content/Context;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private static updateBacktraceMode(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->FpUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->DwarfUntilQuickenWarmedUp:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->Quicken:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;

    .line 12
    .line 13
    iget p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;->value:I

    .line 14
    .line 15
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setBacktraceMode(I)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private warmUpBlocked(Ljava/lang/String;I)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->check(Landroid/content/Context;Ljava/lang/String;I)Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 v0, p0, 0x1

    .line 10
    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    filled-new-array {p1, p0}, [Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    const-string p1, "Matrix.WarmUpDelegate"

    .line 22
    .line 23
    const-string p2, "Elf file %s:%s has blocked and will not do warm-up."

    .line 24
    .line 25
    invoke-static {p1, p2, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return v0
.end method

.method private warmUpFailed(Ljava/lang/String;I)V
    .locals 1

    .line 1
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->WarmUpFailed:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 6
    .line 7
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 8
    .line 9
    .line 10
    move-result-object p2

    .line 11
    filled-new-array {p1, p2}, [Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-interface {p0, v0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method


# virtual methods
.method public cleaningUp(Landroid/os/CancellationSignal;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/os/CancellationSignal;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "clean-up"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->arrangeTask(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public computeDiskUsage(Landroid/os/CancellationSignal;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/os/CancellationSignal;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "compute-disk-usage"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->arrangeTask(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public consumingRequestedQut(Landroid/os/CancellationSignal;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/os/CancellationSignal;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "consuming-up"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->arrangeTask(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public isBacktraceThreadBlocked()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->isThreadBlocked()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public prepare(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)V
    .locals 9

    .line 1
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mPrepared:[Z

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mPrepared:[Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    aget-boolean v3, v0, v2

    .line 8
    .line 9
    if-eqz v3, :cond_0

    .line 10
    .line 11
    monitor-exit v1

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    move-object p0, v0

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 v3, 0x1

    .line 17
    aput-boolean v3, v0, v2

    .line 18
    .line 19
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 20
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 21
    .line 22
    iget-boolean v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mWarmUpInIsolateProcess:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mIsolateRemote:Z

    .line 25
    .line 26
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 27
    .line 28
    const-string v1, "WeChatBacktraceTask"

    .line 29
    .line 30
    invoke-direct {v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 34
    .line 35
    new-instance v3, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 36
    .line 37
    iget-object v5, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 38
    .line 39
    iget-object v6, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mWarmUpTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 40
    .line 41
    iget-wide v7, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mWarmUpDelay:J

    .line 42
    .line 43
    move-object v4, p0

    .line 44
    invoke-direct/range {v3 .. v8}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/content/Context;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;J)V

    .line 45
    .line 46
    .line 47
    iput-object v3, v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 48
    .line 49
    iget-boolean p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mIsWarmUpProcess:Z

    .line 50
    .line 51
    if-eqz p0, :cond_3

    .line 52
    .line 53
    iget-object p0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_1

    .line 60
    .line 61
    const-string p1, "Matrix.WarmUpDelegate"

    .line 62
    .line 63
    const-string v0, "Has not been warmed up"

    .line 64
    .line 65
    new-array v1, v2, [Ljava/lang/Object;

    .line 66
    .line 67
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    iget-object p1, v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->WarmUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 73
    .line 74
    invoke-virtual {p1, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 75
    .line 76
    .line 77
    :cond_1
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->needCleanUp(Landroid/content/Context;)Z

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    if-eqz p1, :cond_2

    .line 82
    .line 83
    const-string p1, "Matrix.WarmUpDelegate"

    .line 84
    .line 85
    const-string v0, "Need clean up"

    .line 86
    .line 87
    new-array v1, v2, [Ljava/lang/Object;

    .line 88
    .line 89
    invoke-static {p1, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    iget-object p1, v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->CleanUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 95
    .line 96
    invoke-virtual {p1, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 97
    .line 98
    .line 99
    :cond_2
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->shouldComputeDiskUsage(Landroid/content/Context;)Z

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    if-eqz p0, :cond_3

    .line 104
    .line 105
    const-string p0, "Matrix.WarmUpDelegate"

    .line 106
    .line 107
    const-string p1, "Should schedule disk usage task."

    .line 108
    .line 109
    new-array v0, v2, [Ljava/lang/Object;

    .line 110
    .line 111
    invoke-static {p0, p1, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 112
    .line 113
    .line 114
    iget-object p0, v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 115
    .line 116
    sget-object p1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 117
    .line 118
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 119
    .line 120
    .line 121
    :cond_3
    return-void

    .line 122
    :goto_0
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 123
    throw p0
.end method

.method public declared-synchronized registerWarmedUpReceiver(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 3
    .line 4
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 5
    .line 6
    .line 7
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmedUpReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;

    .line 17
    .line 18
    invoke-direct {v0, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;-><init>(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Mode;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmedUpReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;

    .line 22
    .line 23
    const-string p2, "Matrix.WarmUpDelegate"

    .line 24
    .line 25
    const-string v0, "Register warm-up receiver."

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    new-array v1, v1, [Ljava/lang/Object;

    .line 29
    .line 30
    invoke-static {p2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    new-instance p2, Landroid/content/IntentFilter;

    .line 34
    .line 35
    invoke-direct {p2}, Landroid/content/IntentFilter;-><init>()V

    .line 36
    .line 37
    .line 38
    const-string v0, "action.backtrace.warmed-up"

    .line 39
    .line 40
    invoke-virtual {p2, v0}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 44
    .line 45
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmedUpReceiver:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$WarmedUpReceiver;

    .line 46
    .line 47
    new-instance v2, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 50
    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 53
    .line 54
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const-string p1, ".backtrace.warmed_up"

    .line 62
    .line 63
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    const/4 v2, 0x0

    .line 71
    invoke-virtual {v0, v1, p2, p1, v2}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;Ljava/lang/String;Landroid/os/Handler;)Landroid/content/Intent;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 72
    .line 73
    .line 74
    monitor-exit p0

    .line 75
    return-void

    .line 76
    :catchall_0
    move-exception p1

    .line 77
    goto :goto_0

    .line 78
    :cond_1
    monitor-exit p0

    .line 79
    return-void

    .line 80
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    throw p1
.end method

.method public requestConsuming()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mConfiguration:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 4
    .line 5
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mWarmUpScheduler:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 13
    .line 14
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->RequestConsuming:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 15
    .line 16
    invoke-virtual {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->scheduleTask(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public setSavingPath(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mSavingPath:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->setSavingPath(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public warmingUp(Landroid/os/CancellationSignal;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mThreadTaskExecutor:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/os/CancellationSignal;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "warm-up"

    .line 9
    .line 10
    invoke-virtual {v0, v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$ThreadTaskExecutor;->arrangeTask(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
