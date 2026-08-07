.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvoker;
.implements Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteConnection;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpService;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "RemoteInvokerImpl"
.end annotation


# static fields
.field private static final TAG:Ljava/lang/String; = "Matrix.WarmUpInvoker"


# instance fields
.field private final mBound:[Z

.field mConnection:Landroid/content/ServiceConnection;

.field final mHandlerThread:[Landroid/os/HandlerThread;

.field volatile mReq:Landroid/os/Messenger;

.field volatile mResp:Landroid/os/Messenger;

.field final mResult:[Landroid/os/Bundle;


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
    filled-new-array {v0}, [Landroid/os/Bundle;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    iput-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 10
    .line 11
    filled-new-array {v0}, [Landroid/os/HandlerThread;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 16
    .line 17
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;

    .line 18
    .line 19
    invoke-direct {v0, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mConnection:Landroid/content/ServiceConnection;

    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    new-array v0, v0, [Z

    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    aput-boolean v1, v0, v1

    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic access$000(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;)[Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 2
    .line 3
    return-object p0
.end method

.method private checkThread()V
    .locals 1

    .line 1
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-eq p0, v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    const-string p0, "Should not call this from main thread!"

    .line 13
    .line 14
    invoke-static {p0}, Ll/azk0;->a(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method


# virtual methods
.method public call(ILandroid/os/Bundle;)Landroid/os/Bundle;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mReq:Landroid/os/Messenger;

    .line 4
    .line 5
    if-eqz v2, :cond_0

    .line 6
    .line 7
    new-instance v3, Landroid/os/Bundle;

    .line 8
    .line 9
    invoke-direct {v3}, Landroid/os/Bundle;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v4, "invoke-args"

    .line 13
    .line 14
    invoke-virtual {v3, v4, p2}, Landroid/os/Bundle;->putBundle(Ljava/lang/String;Landroid/os/Bundle;)V

    .line 15
    .line 16
    .line 17
    const-string p2, "invoke-resp"

    .line 18
    .line 19
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResp:Landroid/os/Messenger;

    .line 20
    .line 21
    invoke-virtual {v4}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    invoke-virtual {v3, p2, v4}, Landroid/os/Bundle;->putBinder(Ljava/lang/String;Landroid/os/IBinder;)V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, p1, v3}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {v2, p1}, Landroid/os/Messenger;->send(Landroid/os/Message;)V

    .line 33
    .line 34
    .line 35
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 36
    .line 37
    monitor-enter p1
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 38
    :try_start_1
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 39
    .line 40
    aput-object v1, p2, v0

    .line 41
    .line 42
    const-wide/32 v2, 0x493e0

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2, v2, v3}, Ljava/lang/Object;->wait(J)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 49
    .line 50
    aget-object p0, p0, v0

    .line 51
    .line 52
    monitor-exit p1

    .line 53
    return-object p0

    .line 54
    :catchall_0
    move-exception p0

    .line 55
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    :try_start_2
    throw p0
    :try_end_2
    .catch Landroid/os/RemoteException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0

    .line 57
    :catch_0
    move-exception p0

    .line 58
    goto :goto_0

    .line 59
    :catch_1
    move-exception p0

    .line 60
    :goto_0
    const-string p1, "Matrix.WarmUpInvoker"

    .line 61
    .line 62
    const-string p2, ""

    .line 63
    .line 64
    new-array v0, v0, [Ljava/lang/Object;

    .line 65
    .line 66
    invoke-static {p1, p0, p2, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 67
    .line 68
    .line 69
    :cond_0
    return-object v1
.end method

.method public connect(Landroid/content/Context;Landroid/os/Bundle;)Z
    .locals 8

    .line 1
    const-string v0, "warm-up-remote-invoker-"

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->checkThread()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    aget-boolean v1, v1, v2

    .line 10
    .line 11
    const/4 v3, 0x1

    .line 12
    if-eqz v1, :cond_0

    .line 13
    .line 14
    return v3

    .line 15
    :cond_0
    const-string v1, "Matrix.WarmUpInvoker"

    .line 16
    .line 17
    const-string v4, "Start connecting to remote. (%s)"

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 24
    .line 25
    .line 26
    move-result-object v5

    .line 27
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    invoke-static {v1, v4, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 32
    .line 33
    .line 34
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 35
    .line 36
    monitor-enter v1

    .line 37
    :try_start_0
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 38
    .line 39
    aget-object v4, v4, v2

    .line 40
    .line 41
    const/4 v5, 0x0

    .line 42
    if-eqz v4, :cond_1

    .line 43
    .line 44
    invoke-virtual {v4}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 48
    .line 49
    aput-object v5, v4, v2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception p0

    .line 53
    goto/16 :goto_4

    .line 54
    .line 55
    :cond_1
    :goto_0
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 56
    .line 57
    new-instance v6, Landroid/os/HandlerThread;

    .line 58
    .line 59
    new-instance v7, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    invoke-direct {v7, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 65
    .line 66
    .line 67
    move-result v0

    .line 68
    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    invoke-direct {v6, v0}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    aput-object v6, v4, v2

    .line 79
    .line 80
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 81
    .line 82
    aget-object v0, v0, v2

    .line 83
    .line 84
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 85
    .line 86
    .line 87
    new-instance v0, Landroid/os/Messenger;

    .line 88
    .line 89
    new-instance v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;

    .line 90
    .line 91
    iget-object v6, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 92
    .line 93
    aget-object v6, v6, v2

    .line 94
    .line 95
    invoke-virtual {v6}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 96
    .line 97
    .line 98
    move-result-object v6

    .line 99
    invoke-direct {v4, p0, v6}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl$2;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;Landroid/os/Looper;)V

    .line 100
    .line 101
    .line 102
    invoke-direct {v0, v4}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 103
    .line 104
    .line 105
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResp:Landroid/os/Messenger;

    .line 106
    .line 107
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 108
    new-instance v0, Landroid/content/Intent;

    .line 109
    .line 110
    invoke-direct {v0}, Landroid/content/Intent;-><init>()V

    .line 111
    .line 112
    .line 113
    new-instance v1, Landroid/content/ComponentName;

    .line 114
    .line 115
    const-class v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;

    .line 116
    .line 117
    invoke-direct {v1, p1, v4}, Landroid/content/ComponentName;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, v1}, Landroid/content/Intent;->setComponent(Landroid/content/ComponentName;)Landroid/content/Intent;

    .line 121
    .line 122
    .line 123
    const-string v1, "enable-logger"

    .line 124
    .line 125
    const-string v4, "enable-logger"

    .line 126
    .line 127
    invoke-virtual {p2, v4, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 128
    .line 129
    .line 130
    move-result v4

    .line 131
    invoke-virtual {v0, v1, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 132
    .line 133
    .line 134
    const-string v1, "path-of-xlog-so"

    .line 135
    .line 136
    const-string v4, "path-of-xlog-so"

    .line 137
    .line 138
    invoke-virtual {p2, v4, v5}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object p2

    .line 142
    invoke-virtual {v0, v1, p2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 143
    .line 144
    .line 145
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mConnection:Landroid/content/ServiceConnection;

    .line 146
    .line 147
    invoke-virtual {p1, v0, p2, v3}, Landroid/content/Context;->bindService(Landroid/content/Intent;Landroid/content/ServiceConnection;I)Z

    .line 148
    .line 149
    .line 150
    :try_start_1
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 151
    .line 152
    monitor-enter p2
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0

    .line 153
    :try_start_2
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 154
    .line 155
    aget-boolean v1, v0, v2

    .line 156
    .line 157
    if-nez v1, :cond_2

    .line 158
    .line 159
    const-wide/32 v3, 0xea60

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0, v3, v4}, Ljava/lang/Object;->wait(J)V

    .line 163
    .line 164
    .line 165
    goto :goto_1

    .line 166
    :catchall_1
    move-exception v0

    .line 167
    goto :goto_2

    .line 168
    :cond_2
    :goto_1
    monitor-exit p2

    .line 169
    goto :goto_3

    .line 170
    :goto_2
    monitor-exit p2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 171
    :try_start_3
    throw v0
    :try_end_3
    .catch Ljava/lang/InterruptedException; {:try_start_3 .. :try_end_3} :catch_0

    .line 172
    :catch_0
    move-exception p2

    .line 173
    const-string v0, "Matrix.WarmUpInvoker"

    .line 174
    .line 175
    const-string v1, ""

    .line 176
    .line 177
    new-array v3, v2, [Ljava/lang/Object;

    .line 178
    .line 179
    invoke-static {v0, p2, v1, v3}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 180
    .line 181
    .line 182
    :goto_3
    iget-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 183
    .line 184
    aget-boolean p2, p2, v2

    .line 185
    .line 186
    if-nez p2, :cond_3

    .line 187
    .line 188
    invoke-virtual {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->disconnect(Landroid/content/Context;)V

    .line 189
    .line 190
    .line 191
    :cond_3
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 192
    .line 193
    aget-boolean p0, p0, v2

    .line 194
    .line 195
    return p0

    .line 196
    :goto_4
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 197
    throw p0
.end method

.method public disconnect(Landroid/content/Context;)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mConnection:Landroid/content/ServiceConnection;

    .line 3
    .line 4
    invoke-virtual {p1, v1}, Landroid/content/Context;->unbindService(Landroid/content/ServiceConnection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    goto :goto_0

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    const-string v1, "Matrix.WarmUpInvoker"

    .line 10
    .line 11
    const-string v2, ""

    .line 12
    .line 13
    new-array v3, v0, [Ljava/lang/Object;

    .line 14
    .line 15
    invoke-static {v1, p1, v2, v3}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    :goto_0
    const-string p1, "Matrix.WarmUpInvoker"

    .line 19
    .line 20
    const-string v1, "Start disconnecting to remote. (%s)"

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 27
    .line 28
    .line 29
    move-result-object v2

    .line 30
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    invoke-static {p1, v1, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 35
    .line 36
    .line 37
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 38
    .line 39
    monitor-enter p1

    .line 40
    :try_start_1
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 41
    .line 42
    aget-object v1, v1, v0

    .line 43
    .line 44
    const/4 v2, 0x0

    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    invoke-virtual {v1}, Landroid/os/HandlerThread;->quitSafely()Z

    .line 48
    .line 49
    .line 50
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mHandlerThread:[Landroid/os/HandlerThread;

    .line 51
    .line 52
    aput-object v2, v1, v0

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :catchall_1
    move-exception p0

    .line 56
    goto :goto_2

    .line 57
    :cond_0
    :goto_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 59
    .line 60
    monitor-enter v1

    .line 61
    :try_start_2
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mResult:[Landroid/os/Bundle;

    .line 62
    .line 63
    aput-object v2, p0, v0

    .line 64
    .line 65
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 66
    .line 67
    .line 68
    monitor-exit v1

    .line 69
    return-void

    .line 70
    :catchall_2
    move-exception p0

    .line 71
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 72
    throw p0

    .line 73
    :goto_2
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 74
    throw p0
.end method

.method public isConnected()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;->mBound:[Z

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    aget-boolean p0, p0, v0

    .line 5
    .line 6
    return p0
.end method
