.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->cleaningUp(Landroid/os/CancellationSignal;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

.field final synthetic val$cs:Landroid/os/CancellationSignal;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/os/CancellationSignal;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->val$cs:Landroid/os/CancellationSignal;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public run()V
    .locals 6

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 4
    .line 5
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->validateSavingPath(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Matrix.WarmUpDelegate"

    .line 25
    .line 26
    const-string v3, "Going to clean up saving path(%s).."

    .line 27
    .line 28
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-nez v1, :cond_0

    .line 36
    .line 37
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 38
    .line 39
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->CleanUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 44
    .line 45
    invoke-virtual {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    new-instance v1, Ljava/util/HashMap;

    .line 50
    .line 51
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 52
    .line 53
    .line 54
    const/4 v3, 0x0

    .line 55
    :try_start_0
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->val$cs:Landroid/os/CancellationSignal;

    .line 56
    .line 57
    new-instance v5, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;

    .line 58
    .line 59
    invoke-direct {v5, p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;Ljava/util/HashMap;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v0, v4, v5}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->iterateTargetDirectory(Ljava/io/File;Landroid/os/CancellationSignal;Ljava/io/FileFilter;)V
    :try_end_0
    .catch Landroid/os/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_0

    .line 66
    :catchall_0
    move-exception v1

    .line 67
    const-string v4, ""

    .line 68
    .line 69
    new-array v5, v3, [Ljava/lang/Object;

    .line 70
    .line 71
    invoke-static {v2, v1, v4, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 72
    .line 73
    .line 74
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 75
    .line 76
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    iget-object v1, v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 81
    .line 82
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->markCleanUpTimestamp(Landroid/content/Context;)V

    .line 83
    .line 84
    .line 85
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 86
    .line 87
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->CleanUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 92
    .line 93
    invoke-virtual {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 101
    .line 102
    .line 103
    move-result-object p0

    .line 104
    const-string v0, "Clean up saving path(%s) done."

    .line 105
    .line 106
    invoke-static {v2, v0, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 107
    .line 108
    .line 109
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 110
    .line 111
    if-eqz p0, :cond_1

    .line 112
    .line 113
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->CleanedUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 114
    .line 115
    new-array v1, v3, [Ljava/lang/Object;

    .line 116
    .line 117
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 118
    .line 119
    .line 120
    goto :goto_1

    .line 121
    :catch_0
    invoke-virtual {v0}, Ljava/io/File;->getAbsoluteFile()Ljava/io/File;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 126
    .line 127
    .line 128
    move-result-object p0

    .line 129
    const-string v0, "Clean up saving path(%s) cancelled."

    .line 130
    .line 131
    invoke-static {v2, v0, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    :goto_1
    return-void
.end method
