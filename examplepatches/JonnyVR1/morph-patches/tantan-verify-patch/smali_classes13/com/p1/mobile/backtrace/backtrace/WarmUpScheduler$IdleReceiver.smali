.class final Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;
.super Landroid/content/BroadcastReceiver;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "IdleReceiver"
.end annotation


# instance fields
.field private mCancellationSignal:Landroid/os/CancellationSignal;

.field mContext:Landroid/content/Context;

.field mIdleHandler:Landroid/os/Handler;

.field private mTasks:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;",
            ">;"
        }
    .end annotation
.end field

.field private mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

.field private mWarmUpDelay:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/os/Handler;Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Landroid/content/BroadcastReceiver;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 10
    .line 11
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mContext:Landroid/content/Context;

    .line 12
    .line 13
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 14
    .line 15
    iput-object p3, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 16
    .line 17
    iput-wide p4, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mWarmUpDelay:J

    .line 18
    .line 19
    return-void
.end method

.method private declared-synchronized triggerIdle(ZZ)V
    .locals 10

    .line 1
    const-wide/16 v0, 0x3

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    const-string v1, "Matrix.WarmUpScheduler"

    .line 9
    .line 10
    const-string v2, "Idle status changed: interactive = %s, charging = %s"

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 17
    .line 18
    .line 19
    move-result-object v4

    .line 20
    filled-new-array {v3, v4}, [Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {v1, v2, v3}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    const/4 v1, 0x0

    .line 28
    const/4 v2, 0x1

    .line 29
    if-nez p1, :cond_1

    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTiming:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 32
    .line 33
    sget-object v3, Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;->WhileScreenOff:Lcom/p1/mobile/backtrace/backtrace/WeChatBacktrace$WarmUpTiming;

    .line 34
    .line 35
    if-eq p1, v3, :cond_0

    .line 36
    .line 37
    if-nez p2, :cond_1

    .line 38
    .line 39
    :cond_0
    move p1, v2

    .line 40
    goto :goto_0

    .line 41
    :catchall_0
    move-exception p1

    .line 42
    goto/16 :goto_4

    .line 43
    .line 44
    :cond_1
    move p1, v1

    .line 45
    :goto_0
    const/4 p2, 0x4

    .line 46
    const/4 v3, 0x3

    .line 47
    const/4 v4, 0x2

    .line 48
    if-eqz p1, :cond_9

    .line 49
    .line 50
    iget-object v5, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 51
    .line 52
    if-nez v5, :cond_9

    .line 53
    .line 54
    new-instance p1, Landroid/os/CancellationSignal;

    .line 55
    .line 56
    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    :goto_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_a

    .line 72
    .line 73
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    check-cast v1, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;

    .line 78
    .line 79
    sget-object v5, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$2;->$SwitchMap$com$p1$mobile$backtrace$backtrace$WarmUpScheduler$TaskType:[I

    .line 80
    .line 81
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 82
    .line 83
    .line 84
    move-result v1

    .line 85
    aget v1, v5, v1

    .line 86
    .line 87
    const-wide/16 v5, 0x3e8

    .line 88
    .line 89
    if-eq v1, v2, :cond_7

    .line 90
    .line 91
    const-wide/16 v7, 0xbb8

    .line 92
    .line 93
    if-eq v1, v4, :cond_5

    .line 94
    .line 95
    if-eq v1, v3, :cond_4

    .line 96
    .line 97
    if-eq v1, p2, :cond_2

    .line 98
    .line 99
    goto :goto_1

    .line 100
    :cond_2
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mContext:Landroid/content/Context;

    .line 101
    .line 102
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->shouldComputeDiskUsage(Landroid/content/Context;)Z

    .line 103
    .line 104
    .line 105
    move-result v1

    .line 106
    if-eqz v1, :cond_3

    .line 107
    .line 108
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 109
    .line 110
    iget-object v5, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 111
    .line 112
    invoke-static {v1, p2, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    invoke-virtual {v1, v5, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 117
    .line 118
    .line 119
    goto :goto_2

    .line 120
    :cond_3
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 121
    .line 122
    .line 123
    :goto_2
    const-string v1, "Matrix.WarmUpScheduler"

    .line 124
    .line 125
    const-string v5, "System idle, trigger disk usage in %s seconds."

    .line 126
    .line 127
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v6

    .line 131
    invoke-static {v1, v5, v6}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_4
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 136
    .line 137
    iget-object v7, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 138
    .line 139
    invoke-static {v1, v4, v7}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 140
    .line 141
    .line 142
    move-result-object v7

    .line 143
    iget-wide v8, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mWarmUpDelay:J

    .line 144
    .line 145
    invoke-virtual {v1, v7, v8, v9}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 146
    .line 147
    .line 148
    const-string v1, "Matrix.WarmUpScheduler"

    .line 149
    .line 150
    const-string v7, "System idle, trigger consume requested qut in %s seconds."

    .line 151
    .line 152
    iget-wide v8, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mWarmUpDelay:J

    .line 153
    .line 154
    div-long/2addr v8, v5

    .line 155
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 156
    .line 157
    .line 158
    move-result-object v5

    .line 159
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v5

    .line 163
    invoke-static {v1, v7, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 164
    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_5
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mContext:Landroid/content/Context;

    .line 168
    .line 169
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->needCleanUp(Landroid/content/Context;)Z

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    if-eqz v1, :cond_6

    .line 174
    .line 175
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 176
    .line 177
    iget-object v5, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 178
    .line 179
    invoke-static {v1, v3, v5}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 180
    .line 181
    .line 182
    move-result-object v5

    .line 183
    invoke-virtual {v1, v5, v7, v8}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 184
    .line 185
    .line 186
    goto :goto_3

    .line 187
    :cond_6
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 188
    .line 189
    .line 190
    :goto_3
    const-string v1, "Matrix.WarmUpScheduler"

    .line 191
    .line 192
    const-string v5, "System idle, trigger clean up in %s seconds."

    .line 193
    .line 194
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v6

    .line 198
    invoke-static {v1, v5, v6}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 199
    .line 200
    .line 201
    goto/16 :goto_1

    .line 202
    .line 203
    :cond_7
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mContext:Landroid/content/Context;

    .line 204
    .line 205
    invoke-static {v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpUtility;->hasWarmedUp(Landroid/content/Context;)Z

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    if-nez v1, :cond_8

    .line 210
    .line 211
    iget-object v1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 212
    .line 213
    iget-object v7, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 214
    .line 215
    invoke-static {v1, v2, v7}, Landroid/os/Message;->obtain(Landroid/os/Handler;ILjava/lang/Object;)Landroid/os/Message;

    .line 216
    .line 217
    .line 218
    move-result-object v7

    .line 219
    iget-wide v8, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mWarmUpDelay:J

    .line 220
    .line 221
    invoke-virtual {v1, v7, v8, v9}, Landroid/os/Handler;->sendMessageDelayed(Landroid/os/Message;J)Z

    .line 222
    .line 223
    .line 224
    const-string v1, "Matrix.WarmUpScheduler"

    .line 225
    .line 226
    const-string v7, "System idle, trigger warm up in %s seconds."

    .line 227
    .line 228
    iget-wide v8, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mWarmUpDelay:J

    .line 229
    .line 230
    div-long/2addr v8, v5

    .line 231
    invoke-static {v8, v9}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 232
    .line 233
    .line 234
    move-result-object v5

    .line 235
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v5

    .line 239
    invoke-static {v1, v7, v5}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 240
    .line 241
    .line 242
    goto/16 :goto_1

    .line 243
    .line 244
    :cond_8
    invoke-interface {p1}, Ljava/util/Iterator;->remove()V

    .line 245
    .line 246
    .line 247
    goto/16 :goto_1

    .line 248
    .line 249
    :cond_9
    if-nez p1, :cond_a

    .line 250
    .line 251
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 252
    .line 253
    if-eqz p1, :cond_a

    .line 254
    .line 255
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 256
    .line 257
    invoke-virtual {p1, v2}, Landroid/os/Handler;->removeMessages(I)V

    .line 258
    .line 259
    .line 260
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 261
    .line 262
    invoke-virtual {p1, v4}, Landroid/os/Handler;->removeMessages(I)V

    .line 263
    .line 264
    .line 265
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 266
    .line 267
    invoke-virtual {p1, v3}, Landroid/os/Handler;->removeMessages(I)V

    .line 268
    .line 269
    .line 270
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mIdleHandler:Landroid/os/Handler;

    .line 271
    .line 272
    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeMessages(I)V

    .line 273
    .line 274
    .line 275
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 276
    .line 277
    invoke-virtual {p1}, Landroid/os/CancellationSignal;->cancel()V

    .line 278
    .line 279
    .line 280
    const/4 p1, 0x0

    .line 281
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mCancellationSignal:Landroid/os/CancellationSignal;

    .line 282
    .line 283
    const-string p1, "Matrix.WarmUpScheduler"

    .line 284
    .line 285
    const-string p2, "Exit idle state, task cancelled."

    .line 286
    .line 287
    new-array v0, v1, [Ljava/lang/Object;

    .line 288
    .line 289
    invoke-static {p1, p2, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 290
    .line 291
    .line 292
    :cond_a
    monitor-exit p0

    .line 293
    return-void

    .line 294
    :goto_4
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 295
    throw p1
.end method


# virtual methods
.method public declared-synchronized arrange(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

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
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 13
    .line 14
    invoke-interface {v0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    .line 17
    monitor-exit p0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 21
    throw p1
.end method

.method public declared-synchronized finish(Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$TaskType;)I
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 3
    .line 4
    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->mTasks:Ljava/util/Set;

    .line 8
    .line 9
    invoke-interface {p1}, Ljava/util/Set;->size()I

    .line 10
    .line 11
    .line 12
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    monitor-exit p0

    .line 14
    return p1

    .line 15
    :catchall_0
    move-exception p1

    .line 16
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    throw p1
.end method

.method public onReceive(Landroid/content/Context;Landroid/content/Intent;)V
    .locals 3

    .line 1
    invoke-virtual {p2}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    monitor-enter p0

    .line 9
    :try_start_0
    invoke-virtual {p1}, Ljava/lang/String;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    const/4 v0, 0x1

    .line 14
    const/4 v1, 0x0

    .line 15
    sparse-switch p2, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    goto :goto_1

    .line 19
    :sswitch_0
    const-string p2, "android.intent.action.ACTION_POWER_CONNECTED"

    .line 20
    .line 21
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    move v2, v1

    .line 28
    move v1, v0

    .line 29
    move v0, v2

    .line 30
    goto :goto_2

    .line 31
    :catchall_0
    move-exception p1

    .line 32
    goto :goto_3

    .line 33
    :sswitch_1
    const-string p2, "android.intent.action.SCREEN_ON"

    .line 34
    .line 35
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    goto :goto_2

    .line 42
    :sswitch_2
    const-string p2, "android.intent.action.ACTION_POWER_DISCONNECTED"

    .line 43
    .line 44
    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p1

    .line 48
    :cond_1
    :goto_1
    move v0, v1

    .line 49
    goto :goto_2

    .line 50
    :sswitch_3
    const-string p2, "android.intent.action.SCREEN_OFF"

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :goto_2
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->triggerIdle(ZZ)V

    .line 54
    .line 55
    .line 56
    monitor-exit p0

    .line 57
    return-void

    .line 58
    :goto_3
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 59
    throw p1

    .line 60
    nop

    .line 61
    :sswitch_data_0
    .sparse-switch
        -0x7ed8ea7f -> :sswitch_3
        -0x7073f927 -> :sswitch_2
        -0x56ac2893 -> :sswitch_1
        0x3cbf870b -> :sswitch_0
    .end sparse-switch
.end method

.method public declared-synchronized refreshIdleStatus(Landroid/content/Context;)V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "power"

    .line 3
    .line 4
    invoke-virtual {p1, v0}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Landroid/os/PowerManager;

    .line 9
    .line 10
    invoke-virtual {v0}, Landroid/os/PowerManager;->isInteractive()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    new-instance v1, Landroid/content/IntentFilter;

    .line 15
    .line 16
    const-string v2, "android.intent.action.BATTERY_CHANGED"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Landroid/content/IntentFilter;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    invoke-static {p1, v2, v1}, Ll/jj5;->l(Landroid/content/Context;Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    const/4 v1, 0x0

    .line 27
    if-eqz p1, :cond_1

    .line 28
    .line 29
    const-string v2, "status"

    .line 30
    .line 31
    const/4 v3, -0x1

    .line 32
    invoke-virtual {p1, v2, v3}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    const/4 v2, 0x2

    .line 37
    if-eq p1, v2, :cond_0

    .line 38
    .line 39
    const/4 v2, 0x5

    .line 40
    if-ne p1, v2, :cond_1

    .line 41
    .line 42
    :cond_0
    const/4 v1, 0x1

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p1

    .line 45
    goto :goto_1

    .line 46
    :cond_1
    :goto_0
    invoke-direct {p0, v0, v1}, Lcom/p1/mobile/backtrace/backtrace/WarmUpScheduler$IdleReceiver;->triggerIdle(ZZ)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    .line 48
    .line 49
    monitor-exit p0

    .line 50
    return-void

    .line 51
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 52
    throw p1
.end method
