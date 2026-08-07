.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->warmingUp(Landroid/os/CancellationSignal;)V
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
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->val$cs:Landroid/os/CancellationSignal;

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
    .locals 7

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "Matrix.WarmUpDelegate"

    .line 5
    .line 6
    const-string v3, "Going to warm up."

    .line 7
    .line 8
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    :try_start_0
    new-instance v3, Ljava/io/File;

    .line 13
    .line 14
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 15
    .line 16
    invoke-static {v4}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    invoke-static {v4}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->validateSavingPath(Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    invoke-direct {v3, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v3}, Ljava/io/File;->isDirectory()Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-nez v3, :cond_0

    .line 32
    .line 33
    const-string v3, "Saving path is not a directory."

    .line 34
    .line 35
    new-array v4, v0, [Ljava/lang/Object;

    .line 36
    .line 37
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 38
    .line 39
    .line 40
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 41
    .line 42
    invoke-static {v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 43
    .line 44
    .line 45
    move-result-object v3

    .line 46
    sget-object v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->WarmUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :catchall_0
    move-exception v3

    .line 53
    goto :goto_2

    .line 54
    :cond_0
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 55
    .line 56
    invoke-static {v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$300(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    if-nez v1, :cond_1

    .line 61
    .line 62
    const-string v3, "Failed to acquire warm-up invoker"

    .line 63
    .line 64
    new-array v4, v0, [Ljava/lang/Object;

    .line 65
    .line 66
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/os/OperationCanceledException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    if-eqz v1, :cond_6

    .line 70
    .line 71
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 72
    .line 73
    invoke-static {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_1
    :try_start_1
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 78
    .line 79
    invoke-static {v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    iget-object v3, v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mWarmUpDirectoriesList:Ljava/util/HashSet;

    .line 84
    .line 85
    invoke-virtual {v3}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 86
    .line 87
    .line 88
    move-result-object v3

    .line 89
    :goto_0
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    .line 90
    .line 91
    .line 92
    move-result v4

    .line 93
    if-eqz v4, :cond_2

    .line 94
    .line 95
    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    move-result-object v4

    .line 99
    check-cast v4, Ljava/lang/String;

    .line 100
    .line 101
    new-instance v5, Ljava/io/File;

    .line 102
    .line 103
    invoke-direct {v5, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->val$cs:Landroid/os/CancellationSignal;

    .line 107
    .line 108
    new-instance v6, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;

    .line 109
    .line 110
    invoke-direct {v6, p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 111
    .line 112
    .line 113
    invoke-static {v5, v4, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->iterateTargetDirectory(Ljava/io/File;Landroid/os/CancellationSignal;Ljava/io/FileFilter;)V
    :try_end_1
    .catch Landroid/os/OperationCanceledException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 114
    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_2
    :goto_1
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 118
    .line 119
    invoke-static {v3, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 120
    .line 121
    .line 122
    goto :goto_3

    .line 123
    :goto_2
    :try_start_2
    const-string v4, ""

    .line 124
    .line 125
    new-array v5, v0, [Ljava/lang/Object;

    .line 126
    .line 127
    invoke-static {v2, v3, v4, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 128
    .line 129
    .line 130
    if-eqz v1, :cond_3

    .line 131
    .line 132
    goto :goto_1

    .line 133
    :cond_3
    :goto_3
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 134
    .line 135
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    sget-object v3, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->WarmUp:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 140
    .line 141
    invoke-virtual {v1, v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 145
    .line 146
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;

    .line 147
    .line 148
    .line 149
    move-result-object v1

    .line 150
    iget-object v1, v1, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$Configuration;->mContext:Landroid/content/Context;

    .line 151
    .line 152
    invoke-static {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$700(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Landroid/content/Context;)V

    .line 153
    .line 154
    .line 155
    const-string p0, "Warm-up done."

    .line 156
    .line 157
    new-array v0, v0, [Ljava/lang/Object;

    .line 158
    .line 159
    invoke-static {v2, p0, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 160
    .line 161
    .line 162
    goto :goto_4

    .line 163
    :catchall_1
    move-exception v0

    .line 164
    if-eqz v1, :cond_4

    .line 165
    .line 166
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 167
    .line 168
    invoke-static {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 169
    .line 170
    .line 171
    :cond_4
    throw v0

    .line 172
    :catch_0
    if-eqz v1, :cond_5

    .line 173
    .line 174
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$1;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 175
    .line 176
    invoke-static {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 177
    .line 178
    .line 179
    :cond_5
    const-string p0, "Warm-up cancelled."

    .line 180
    .line 181
    new-array v0, v0, [Ljava/lang/Object;

    .line 182
    .line 183
    invoke-static {v2, p0, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 184
    .line 185
    .line 186
    :cond_6
    :goto_4
    return-void
.end method
