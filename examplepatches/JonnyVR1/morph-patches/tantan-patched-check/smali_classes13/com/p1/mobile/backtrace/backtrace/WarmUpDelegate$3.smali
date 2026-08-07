.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->consumingRequestedQut(Landroid/os/CancellationSignal;)V
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
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->val$cs:Landroid/os/CancellationSignal;

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
    .locals 11

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Ljava/lang/Object;

    .line 3
    .line 4
    const-string v2, "Matrix.WarmUpDelegate"

    .line 5
    .line 6
    const-string v3, "Going to consume requested QUT."

    .line 7
    .line 8
    invoke-static {v2, v3, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->consumeRequestedQut()[Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iget-object v3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 16
    .line 17
    invoke-static {v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$300(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    if-nez v3, :cond_0

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 24
    .line 25
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->RequestConsuming:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 30
    .line 31
    invoke-virtual {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 32
    .line 33
    .line 34
    const-string p0, "Failed to acquire warm-up invoker."

    .line 35
    .line 36
    new-array v0, v0, [Ljava/lang/Object;

    .line 37
    .line 38
    invoke-static {v2, p0, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :cond_0
    :try_start_0
    array-length v4, v1

    .line 43
    move v5, v0

    .line 44
    :goto_0
    if-ge v5, v4, :cond_5

    .line 45
    .line 46
    aget-object v6, v1, v5

    .line 47
    .line 48
    const/16 v7, 0x3a

    .line 49
    .line 50
    invoke-virtual {v6, v7}, Ljava/lang/String;->lastIndexOf(I)I

    .line 51
    .line 52
    .line 53
    move-result v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 54
    const/4 v8, -0x1

    .line 55
    if-eq v7, v8, :cond_1

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {v6, v0, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v8
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 61
    add-int/lit8 v7, v7, 0x1

    .line 62
    .line 63
    :try_start_2
    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    invoke-static {v7}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 68
    .line 69
    .line 70
    move-result-object v7

    .line 71
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 72
    .line 73
    .line 74
    move-result v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 75
    goto :goto_1

    .line 76
    :catchall_0
    move-object v8, v6

    .line 77
    :catchall_1
    move v7, v0

    .line 78
    goto :goto_1

    .line 79
    :cond_1
    move v7, v0

    .line 80
    move-object v8, v6

    .line 81
    :goto_1
    :try_start_3
    iget-object v9, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 82
    .line 83
    invoke-static {v9, v8, v7}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$400(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)Z

    .line 84
    .line 85
    .line 86
    move-result v9

    .line 87
    if-nez v9, :cond_2

    .line 88
    .line 89
    invoke-interface {v3, v8, v7}, Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;->warmUp(Ljava/lang/String;I)Z

    .line 90
    .line 91
    .line 92
    move-result v9

    .line 93
    if-nez v9, :cond_3

    .line 94
    .line 95
    iget-object v10, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 96
    .line 97
    invoke-static {v10, v8, v7}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$500(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Ljava/lang/String;I)V

    .line 98
    .line 99
    .line 100
    goto :goto_2

    .line 101
    :catchall_2
    move-exception v0

    .line 102
    goto :goto_4

    .line 103
    :cond_2
    move v9, v0

    .line 104
    :cond_3
    :goto_2
    const-string v7, "Consumed requested QUT -> %s, ret = %s."

    .line 105
    .line 106
    invoke-static {v9}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 107
    .line 108
    .line 109
    move-result-object v8

    .line 110
    filled-new-array {v6, v8}, [Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    move-result-object v6

    .line 114
    invoke-static {v2, v7, v6}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 115
    .line 116
    .line 117
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->val$cs:Landroid/os/CancellationSignal;

    .line 118
    .line 119
    if-eqz v6, :cond_4

    .line 120
    .line 121
    invoke-virtual {v6}, Landroid/os/CancellationSignal;->isCanceled()Z

    .line 122
    .line 123
    .line 124
    move-result v6

    .line 125
    if-eqz v6, :cond_4

    .line 126
    .line 127
    const-string v1, "Consume requested QUT canceled."

    .line 128
    .line 129
    new-array v4, v0, [Ljava/lang/Object;

    .line 130
    .line 131
    invoke-static {v2, v1, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    goto :goto_3

    .line 135
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 136
    .line 137
    goto :goto_0

    .line 138
    :cond_5
    :goto_3
    const-string v1, "Consume requested QUT done."

    .line 139
    .line 140
    new-array v0, v0, [Ljava/lang/Object;

    .line 141
    .line 142
    invoke-static {v2, v1, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 146
    .line 147
    invoke-static {v0, v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 151
    .line 152
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->RequestConsuming:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 157
    .line 158
    invoke-virtual {p0, v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :goto_4
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 163
    .line 164
    invoke-static {v1, v3}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$600(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;Lcom/p1/mobile/backtrace/backtrace/WarmUpInvoker;)V

    .line 165
    .line 166
    .line 167
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$3;->this$0:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 168
    .line 169
    invoke-static {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->access$200(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;)Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;

    .line 170
    .line 171
    .line 172
    move-result-object p0

    .line 173
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;->RequestConsuming:Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 174
    .line 175
    invoke-virtual {p0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;->taskFinished(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V

    .line 176
    .line 177
    .line 178
    throw v0
.end method
