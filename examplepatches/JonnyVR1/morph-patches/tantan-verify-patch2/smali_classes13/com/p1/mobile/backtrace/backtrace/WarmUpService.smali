.class public Lcom/p1/mobile/backtrace/backtrace/WarmUpService;
.super Landroid/app/Service;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RecyclerCallback;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvokerImpl;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteConnection;,
        Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RemoteInvoker;
    }
.end annotation


# static fields
.field static final ARGS_WARM_UP_ELF_START_OFFSET:Ljava/lang/String; = "elf-start-offset"

.field static final ARGS_WARM_UP_PATH_OF_ELF:Ljava/lang/String; = "path-of-elf"

.field static final ARGS_WARM_UP_SAVING_PATH:Ljava/lang/String; = "saving-path"

.field static final BIND_ARGS_ENABLE_LOGGER:Ljava/lang/String; = "enable-logger"

.field static final BIND_ARGS_PATH_OF_XLOG_SO:Ljava/lang/String; = "path-of-xlog-so"

.field static final CMD_WARM_UP_SINGLE_ELF_FILE:I = 0x64

.field private static final INTERVAL_OF_CHECK:J = 0xea60L

.field public static final INVALID_ARGUMENT:I = -0x1

.field private static final INVOKE_ARGS:Ljava/lang/String; = "invoke-args"

.field private static final INVOKE_RESP:Ljava/lang/String; = "invoke-resp"

.field private static final MSG_SUICIDE:I = 0x1

.field static final OK:I = 0x0

.field static final RESULT_OF_WARM_UP:Ljava/lang/String; = "warm-up-result"

.field private static final TAG:Ljava/lang/String; = "Matrix.WarmUpService"

.field public static final WARM_UP_FAILED:I = -0x2

.field public static final WARM_UP_FAILED_TOO_MANY_TIMES:I = -0x3

.field private static volatile sHasInitiated:Z

.field private static volatile sHasLoaded:Z

.field private static sRecycler:Landroid/os/HandlerThread;

.field private static sRecyclerHandler:Landroid/os/Handler;

.field private static final sRecyclerLock:[B

.field private static final sWorkingCall:Ljava/util/concurrent/atomic/AtomicInteger;


# instance fields
.field private final mMessenger:Landroid/os/Messenger;

.field private final mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sWorkingCall:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 8
    .line 9
    new-array v0, v1, [B

    .line 10
    .line 11
    sput-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerLock:[B

    .line 12
    .line 13
    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Messenger;

    .line 5
    .line 6
    new-instance v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$1;

    .line 7
    .line 8
    invoke-direct {v1, p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$1;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService;)V

    .line 9
    .line 10
    .line 11
    invoke-direct {v0, v1}, Landroid/os/Messenger;-><init>(Landroid/os/Handler;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->mMessenger:Landroid/os/Messenger;

    .line 15
    .line 16
    new-instance v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 17
    .line 18
    invoke-direct {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 22
    .line 23
    return-void
.end method

.method public static synthetic access$100(Lcom/p1/mobile/backtrace/backtrace/WarmUpService;ILandroid/os/Bundle;)Landroid/os/Bundle;
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->call(ILandroid/os/Bundle;)Landroid/os/Bundle;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method private declared-synchronized call(ILandroid/os/Bundle;)Landroid/os/Bundle;
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-direct {p0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->removeScheduledSuicide()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    :try_start_1
    new-instance v1, Landroid/os/Bundle;

    .line 7
    .line 8
    invoke-direct {v1}, Landroid/os/Bundle;-><init>()V

    .line 9
    .line 10
    .line 11
    const-string v2, "warm-up-result"

    .line 12
    .line 13
    const/4 v3, -0x1

    .line 14
    invoke-virtual {v1, v2, v3}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 15
    .line 16
    .line 17
    if-nez p2, :cond_0

    .line 18
    .line 19
    const-string p1, "Matrix.WarmUpService"

    .line 20
    .line 21
    const-string p2, "Args is null."

    .line 22
    .line 23
    new-array v2, v0, [Ljava/lang/Object;

    .line 24
    .line 25
    invoke-static {p1, p2, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 26
    .line 27
    .line 28
    :try_start_2
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 29
    .line 30
    .line 31
    monitor-exit p0

    .line 32
    return-object v1

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto/16 :goto_3

    .line 35
    .line 36
    :catchall_1
    move-exception p1

    .line 37
    goto/16 :goto_2

    .line 38
    .line 39
    :cond_0
    :try_start_3
    const-string v2, "saving-path"

    .line 40
    .line 41
    const/4 v3, 0x0

    .line 42
    invoke-virtual {p2, v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const-string v4, "Matrix.WarmUpService"

    .line 47
    .line 48
    const-string v5, "Invoke from client with savingPath: %s."

    .line 49
    .line 50
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    move-result-object v6

    .line 54
    invoke-static {v4, v5, v6}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 55
    .line 56
    .line 57
    invoke-direct {p0, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->isNullOrNil(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v4

    .line 61
    if-eqz v4, :cond_1

    .line 62
    .line 63
    const-string p1, "Matrix.WarmUpService"

    .line 64
    .line 65
    const-string p2, "Saving path is empty."

    .line 66
    .line 67
    new-array v2, v0, [Ljava/lang/Object;

    .line 68
    .line 69
    invoke-static {p1, p2, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 70
    .line 71
    .line 72
    :try_start_4
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 73
    .line 74
    .line 75
    monitor-exit p0

    .line 76
    return-object v1

    .line 77
    :cond_1
    :try_start_5
    iget-object v4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->mWarmUpDelegate:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;

    .line 78
    .line 79
    invoke-virtual {v4, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->setSavingPath(Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    const/16 v2, 0x64

    .line 83
    .line 84
    if-ne p1, v2, :cond_6

    .line 85
    .line 86
    const-string p1, "path-of-elf"

    .line 87
    .line 88
    invoke-virtual {p2, p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    invoke-direct {p0, p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->isNullOrNil(Ljava/lang/String;)Z

    .line 93
    .line 94
    .line 95
    move-result v2

    .line 96
    if-eqz v2, :cond_2

    .line 97
    .line 98
    const-string p1, "Matrix.WarmUpService"

    .line 99
    .line 100
    const-string p2, "Warm-up so path is empty."

    .line 101
    .line 102
    new-array v2, v0, [Ljava/lang/Object;

    .line 103
    .line 104
    invoke-static {p1, p2, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 105
    .line 106
    .line 107
    :try_start_6
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 108
    .line 109
    .line 110
    monitor-exit p0

    .line 111
    return-object v1

    .line 112
    :cond_2
    :try_start_7
    const-string v2, "elf-start-offset"

    .line 113
    .line 114
    invoke-virtual {p2, v2, v0}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;I)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    const-string v2, "Matrix.WarmUpService"

    .line 119
    .line 120
    const-string v3, "Warm up so path %s offset %s."

    .line 121
    .line 122
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 123
    .line 124
    .line 125
    move-result-object v4

    .line 126
    filled-new-array {p1, v4}, [Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v4

    .line 130
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 131
    .line 132
    .line 133
    invoke-static {p0, p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->checkAndMark(Landroid/content/Context;Ljava/lang/String;I)Z

    .line 134
    .line 135
    .line 136
    move-result v2

    .line 137
    if-nez v2, :cond_3

    .line 138
    .line 139
    const/4 p1, -0x3

    .line 140
    goto :goto_0

    .line 141
    :cond_3
    const/4 v2, 0x1

    .line 142
    invoke-static {p1, p2, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate;->internalWarmUpSoPath(Ljava/lang/String;IZ)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    invoke-static {p1, p2}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktraceNative;->testLoadQut(Ljava/lang/String;I)Z

    .line 147
    .line 148
    .line 149
    move-result v3

    .line 150
    if-nez v3, :cond_4

    .line 151
    .line 152
    const-string v2, "Matrix.WarmUpService"

    .line 153
    .line 154
    const-string v3, "Warm up elf %s:%s success, but test load qut failed!"

    .line 155
    .line 156
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    filled-new-array {p1, v4}, [Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 165
    .line 166
    .line 167
    move v2, v0

    .line 168
    :cond_4
    invoke-static {p0, p1, p2, v2}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility$UnfinishedManagement;->result(Landroid/content/Context;Ljava/lang/String;IZ)V

    .line 169
    .line 170
    .line 171
    if-eqz v2, :cond_5

    .line 172
    .line 173
    move p1, v0

    .line 174
    goto :goto_0

    .line 175
    :cond_5
    const/4 p1, -0x2

    .line 176
    :goto_0
    const-string p2, "warm-up-result"

    .line 177
    .line 178
    invoke-virtual {v1, p2, p1}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    .line 179
    .line 180
    .line 181
    goto :goto_1

    .line 182
    :cond_6
    const-string p2, "Matrix.WarmUpService"

    .line 183
    .line 184
    const-string v2, "Unknown cmd: %s"

    .line 185
    .line 186
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    filled-new-array {p1}, [Ljava/lang/Object;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    invoke-static {p2, v2, p1}, Lcom/p1/mobile/backtrace/MatrixLog;->w(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    .line 195
    .line 196
    .line 197
    :goto_1
    :try_start_8
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 198
    .line 199
    .line 200
    monitor-exit p0

    .line 201
    return-object v1

    .line 202
    :goto_2
    :try_start_9
    invoke-static {v0}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V

    .line 203
    .line 204
    .line 205
    throw p1

    .line 206
    :goto_3
    monitor-exit p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    .line 207
    throw p1
.end method

.method private static declared-synchronized init()V
    .locals 6

    .line 1
    const-class v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasInitiated:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    sget-object v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerLock:[B

    .line 11
    .line 12
    monitor-enter v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 13
    :try_start_2
    sget-object v2, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecycler:Landroid/os/HandlerThread;

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    new-instance v2, Landroid/os/HandlerThread;

    .line 18
    .line 19
    const-string v3, "backtrace-recycler"

    .line 20
    .line 21
    invoke-direct {v2, v3}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    sput-object v2, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecycler:Landroid/os/HandlerThread;

    .line 25
    .line 26
    invoke-virtual {v2}, Ljava/lang/Thread;->start()V

    .line 27
    .line 28
    .line 29
    new-instance v2, Landroid/os/Handler;

    .line 30
    .line 31
    sget-object v3, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecycler:Landroid/os/HandlerThread;

    .line 32
    .line 33
    invoke-virtual {v3}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    .line 34
    .line 35
    .line 36
    move-result-object v3

    .line 37
    new-instance v4, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RecyclerCallback;

    .line 38
    .line 39
    const/4 v5, 0x0

    .line 40
    invoke-direct {v4, v5}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService$RecyclerCallback;-><init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpService$1;)V

    .line 41
    .line 42
    .line 43
    invoke-direct {v2, v3, v4}, Landroid/os/Handler;-><init>(Landroid/os/Looper;Landroid/os/Handler$Callback;)V

    .line 44
    .line 45
    .line 46
    sput-object v2, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerHandler:Landroid/os/Handler;

    .line 47
    .line 48
    goto :goto_0

    .line 49
    :catchall_0
    move-exception v2

    .line 50
    goto :goto_1

    .line 51
    :cond_1
    :goto_0
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    const/4 v1, 0x1

    .line 53
    :try_start_3
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->scheduleSuicide(Z)V

    .line 54
    .line 55
    .line 56
    sput-boolean v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasInitiated:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 57
    .line 58
    monitor-exit v0

    .line 59
    return-void

    .line 60
    :catchall_1
    move-exception v1

    .line 61
    goto :goto_2

    .line 62
    :goto_1
    :try_start_4
    monitor-exit v1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 63
    :try_start_5
    throw v2

    .line 64
    :goto_2
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 65
    throw v1
.end method

.method private isNullOrNil(Ljava/lang/String;)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_1

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method private static declared-synchronized loadLibrary(Landroid/content/Intent;)V
    .locals 5

    .line 1
    const-class v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasLoaded:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :cond_0
    :try_start_1
    const-string v1, "Matrix.WarmUpService"

    .line 11
    .line 12
    const-string v2, "Init called."

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    new-array v4, v3, [Ljava/lang/Object;

    .line 16
    .line 17
    invoke-static {v1, v2, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->loadLibrary()V

    .line 21
    .line 22
    .line 23
    const-string v1, "enable-logger"

    .line 24
    .line 25
    invoke-virtual {p0, v1, v3}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    const-string v2, "path-of-xlog-so"

    .line 30
    .line 31
    invoke-virtual {p0, v2}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    const-string v2, "Matrix.WarmUpService"

    .line 36
    .line 37
    const-string v3, "Enable logger: %s"

    .line 38
    .line 39
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object v4

    .line 43
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v4

    .line 47
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 48
    .line 49
    .line 50
    const-string v2, "Matrix.WarmUpService"

    .line 51
    .line 52
    const-string v3, "Path of XLog: %s"

    .line 53
    .line 54
    filled-new-array {p0}, [Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object v4

    .line 58
    invoke-static {v2, v3, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 59
    .line 60
    .line 61
    invoke-static {p0}, Lcom/p1/mobile/backtrace/xlog/XLogNative;->setXLogger(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace;->enableLogger(Z)V

    .line 65
    .line 66
    .line 67
    const/4 p0, 0x1

    .line 68
    sput-boolean p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasLoaded:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 69
    .line 70
    monitor-exit v0

    .line 71
    return-void

    .line 72
    :catchall_0
    move-exception p0

    .line 73
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 74
    throw p0
.end method

.method private removeScheduledSuicide()V
    .locals 2

    .line 1
    const-string p0, "Matrix.WarmUpService"

    .line 2
    .line 3
    const-string v0, "Remove scheduled suicide"

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    new-array v1, v1, [Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerLock:[B

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    :try_start_0
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerHandler:Landroid/os/Handler;

    .line 15
    .line 16
    const/4 v1, 0x1

    .line 17
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    .line 18
    .line 19
    .line 20
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sWorkingCall:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    throw v0
.end method

.method private static scheduleSuicide(Z)V
    .locals 4

    .line 1
    const-string v0, "Matrix.WarmUpService"

    .line 2
    .line 3
    const-string v1, "Schedule suicide"

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    new-array v2, v2, [Ljava/lang/Object;

    .line 7
    .line 8
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerLock:[B

    .line 12
    .line 13
    monitor-enter v0

    .line 14
    const-wide/32 v1, 0xea60

    .line 15
    .line 16
    .line 17
    const/4 v3, 0x1

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    :try_start_0
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerHandler:Landroid/os/Handler;

    .line 21
    .line 22
    invoke-virtual {p0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_1

    .line 28
    :cond_0
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sWorkingCall:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    if-nez p0, :cond_1

    .line 35
    .line 36
    sget-object p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sRecyclerHandler:Landroid/os/Handler;

    .line 37
    .line 38
    invoke-virtual {p0, v3, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 39
    .line 40
    .line 41
    :cond_1
    :goto_0
    monitor-exit v0

    .line 42
    return-void

    .line 43
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0
.end method


# virtual methods
.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .locals 1
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    sget-boolean v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasLoaded:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {p1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->loadLibrary(Landroid/content/Intent;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->mMessenger:Landroid/os/Messenger;

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/os/Messenger;->getBinder()Landroid/os/IBinder;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public onCreate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    .line 2
    .line 3
    .line 4
    sget-boolean p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->sHasInitiated:Z

    .line 5
    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    invoke-static {}, Lcom/p1/mobile/backtrace/backtrace/WarmUpService;->init()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method
