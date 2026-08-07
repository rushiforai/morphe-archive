.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->computeDiskUsage(Landroid/os/CancellationSignal;)V
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
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->val$cs:Landroid/os/CancellationSignal;

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
    .locals 8

    .line 1
    const-string v0, "Compute disk usage, file count(%s), disk usage(%s)"

    .line 2
    .line 3
    const-string v1, "Matrix.WarmUpDelegate"

    .line 4
    .line 5
    new-instance v2, Ljava/io/File;

    .line 6
    .line 7
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 8
    .line 9
    iget-object v3, v3, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->mSavingPath:Ljava/lang/String;

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 15
    .line 16
    .line 17
    move-result v3

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 21
    .line 22
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    const/4 v3, 0x2

    .line 33
    new-array v3, v3, [J

    .line 34
    .line 35
    const/4 v4, 0x1

    .line 36
    const/4 v5, 0x0

    .line 37
    :try_start_0
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->val$cs:Landroid/os/CancellationSignal;

    .line 38
    .line 39
    new-instance v7, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;

    .line 40
    .line 41
    invoke-direct {v7, p0, v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;[J)V

    .line 42
    .line 43
    .line 44
    invoke-static {v2, v6, v7}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->iterateTargetDirectory(Ljava/io/File;Landroid/os/CancellationSignal;Ljava/io/FileFilter;)V
    :try_end_0
    .catch Ljava/util/concurrent/CancellationException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Landroid/os/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 48
    .line 49
    invoke-static {v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    sget-object v6, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 54
    .line 55
    invoke-virtual {v2, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 59
    .line 60
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 65
    .line 66
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->markComputeDiskUsageTimestamp(Landroid/content/Context;)V

    .line 67
    .line 68
    .line 69
    aget-wide v6, v3, v5

    .line 70
    .line 71
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    aget-wide v6, v3, v4

    .line 76
    .line 77
    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 78
    .line 79
    .line 80
    move-result-object v2

    .line 81
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->sReporter:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;

    .line 89
    .line 90
    if-eqz p0, :cond_1

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;

    .line 93
    .line 94
    aget-wide v1, v3, v5

    .line 95
    .line 96
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 97
    .line 98
    .line 99
    move-result-object v1

    .line 100
    aget-wide v2, v3, v4

    .line 101
    .line 102
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 103
    .line 104
    .line 105
    move-result-object v2

    .line 106
    filled-new-array {v1, v2}, [Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-interface {p0, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter;->onReport(Lcom/p1/mobile/backtrace/backtrace/WarmUpReporter$ReportEvent;[Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    return-void

    .line 114
    :catchall_0
    move-exception v2

    .line 115
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 116
    .line 117
    invoke-static {v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 118
    .line 119
    .line 120
    move-result-object v6

    .line 121
    sget-object v7, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 122
    .line 123
    invoke-virtual {v6, v7}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 124
    .line 125
    .line 126
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 127
    .line 128
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 133
    .line 134
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->markComputeDiskUsageTimestamp(Landroid/content/Context;)V

    .line 135
    .line 136
    .line 137
    aget-wide v5, v3, v5

    .line 138
    .line 139
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 140
    .line 141
    .line 142
    move-result-object p0

    .line 143
    aget-wide v4, v3, v4

    .line 144
    .line 145
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 146
    .line 147
    .line 148
    move-result-object v3

    .line 149
    filled-new-array {p0, v3}, [Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    move-result-object p0

    .line 153
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 154
    .line 155
    .line 156
    throw v2

    .line 157
    :catch_0
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 158
    .line 159
    invoke-static {v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 160
    .line 161
    .line 162
    move-result-object v2

    .line 163
    sget-object v6, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->DiskUsage:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 164
    .line 165
    invoke-virtual {v2, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 166
    .line 167
    .line 168
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$4;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 169
    .line 170
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 171
    .line 172
    .line 173
    move-result-object p0

    .line 174
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 175
    .line 176
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->markComputeDiskUsageTimestamp(Landroid/content/Context;)V

    .line 177
    .line 178
    .line 179
    aget-wide v5, v3, v5

    .line 180
    .line 181
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 182
    .line 183
    .line 184
    move-result-object p0

    .line 185
    aget-wide v2, v3, v4

    .line 186
    .line 187
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 188
    .line 189
    .line 190
    move-result-object v2

    .line 191
    filled-new-array {p0, v2}, [Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object p0

    .line 195
    invoke-static {v1, v0, p0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 196
    .line 197
    .line 198
    return-void
.end method
