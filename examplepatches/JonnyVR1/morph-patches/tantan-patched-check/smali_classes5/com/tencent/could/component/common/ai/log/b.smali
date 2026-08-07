.class public Lcom/tencent/could/component/common/ai/log/b;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

.field public b:I

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field public e:Lcom/tencent/could/component/common/ai/log/c;

.field public f:Landroid/os/HandlerThread;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/tencent/could/component/common/ai/log/AiLogConfig;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    iput p2, p0, Lcom/tencent/could/component/common/ai/log/b;->b:I

    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object p2

    .line 16
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/b;->c:Ljava/lang/String;

    .line 17
    .line 18
    new-instance p2, Ljava/lang/ref/WeakReference;

    .line 19
    .line 20
    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/b;->d:Ljava/lang/ref/WeakReference;

    .line 24
    .line 25
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/log/b;->a(Landroid/content/Context;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method


# virtual methods
.method public a(ILjava/lang/String;Ljava/lang/String;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isOpen()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_2

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getMinLevel()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-ge p1, v0, :cond_1

    .line 18
    .line 19
    goto/16 :goto_2

    .line 20
    .line 21
    :cond_1
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isLogCat()Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_2

    .line 28
    .line 29
    packed-switch p1, :pswitch_data_0

    .line 30
    .line 31
    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    const-string v1, "do not know logLevel \uff01 msg: "

    .line 35
    .line 36
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    invoke-static {p2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :pswitch_0
    invoke-static {p2, p3}, Landroid/util/Log;->wtf(Ljava/lang/String;Ljava/lang/String;)I

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :pswitch_1
    invoke-static {p2, p3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    :cond_2
    :goto_0
    :pswitch_2
    sget-object v0, Lcom/tencent/could/component/common/ai/log/e$a;->a:Lcom/tencent/could/component/common/ai/log/e;

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    .line 61
    .line 62
    const-class v1, Lcom/tencent/could/component/common/ai/log/e;

    .line 63
    .line 64
    monitor-enter v1

    .line 65
    :try_start_0
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/log/e;->a:Lcom/tencent/could/component/common/ai/utils/SimplePool;

    .line 66
    .line 67
    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/utils/SimplePool;->acquire()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    check-cast v0, Lcom/tencent/could/component/common/ai/log/d;

    .line 72
    .line 73
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 74
    if-nez v0, :cond_3

    .line 75
    .line 76
    new-instance v0, Lcom/tencent/could/component/common/ai/log/d;

    .line 77
    .line 78
    invoke-direct {v0, p1, p2, p3}, Lcom/tencent/could/component/common/ai/log/d;-><init>(ILjava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    goto :goto_1

    .line 82
    :cond_3
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 83
    .line 84
    .line 85
    move-result-wide v1

    .line 86
    iput-wide v1, v0, Lcom/tencent/could/component/common/ai/log/d;->b:J

    .line 87
    .line 88
    iput p1, v0, Lcom/tencent/could/component/common/ai/log/d;->a:I

    .line 89
    .line 90
    iput-object p2, v0, Lcom/tencent/could/component/common/ai/log/d;->c:Ljava/lang/String;

    .line 91
    .line 92
    iput-object p3, v0, Lcom/tencent/could/component/common/ai/log/d;->d:Ljava/lang/String;

    .line 93
    .line 94
    :goto_1
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-virtual {p1}, Ljava/lang/Thread;->getId()J

    .line 99
    .line 100
    .line 101
    move-result-wide p1

    .line 102
    iget p3, p0, Lcom/tencent/could/component/common/ai/log/b;->b:I

    .line 103
    .line 104
    new-instance v1, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    const-string p3, "-"

    .line 113
    .line 114
    invoke-virtual {v1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-virtual {v1, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 118
    .line 119
    .line 120
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, v0, Lcom/tencent/could/component/common/ai/log/d;->e:Ljava/lang/String;

    .line 125
    .line 126
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/log/b;->c:Ljava/lang/String;

    .line 127
    .line 128
    iput-object p1, v0, Lcom/tencent/could/component/common/ai/log/d;->f:Ljava/lang/String;

    .line 129
    .line 130
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/b;->e:Lcom/tencent/could/component/common/ai/log/c;

    .line 131
    .line 132
    if-eqz p0, :cond_4

    .line 133
    .line 134
    invoke-virtual {p0}, Landroid/os/Handler;->obtainMessage()Landroid/os/Message;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    const/4 p2, 0x1

    .line 139
    iput p2, p1, Landroid/os/Message;->what:I

    .line 140
    .line 141
    iput-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 142
    .line 143
    invoke-virtual {p0, p1}, Landroid/os/Handler;->sendMessage(Landroid/os/Message;)Z

    .line 144
    .line 145
    .line 146
    :cond_4
    :goto_2
    return-void

    .line 147
    :catchall_0
    move-exception p0

    .line 148
    :try_start_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 149
    throw p0

    .line 150
    nop

    .line 151
    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public a(Landroid/content/Context;)V
    .locals 3

    .line 151
    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "FileLogThread"

    invoke-direct {v0, v1}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/b;->f:Landroid/os/HandlerThread;

    .line 152
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 153
    new-instance v0, Lcom/tencent/could/component/common/ai/log/c;

    iget-object v1, p0, Lcom/tencent/could/component/common/ai/log/b;->f:Landroid/os/HandlerThread;

    invoke-virtual {v1}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v1

    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    invoke-direct {v0, v1, v2, p1}, Lcom/tencent/could/component/common/ai/log/c;-><init>(Landroid/os/Looper;Lcom/tencent/could/component/common/ai/log/AiLogConfig;Landroid/content/Context;)V

    iput-object v0, p0, Lcom/tencent/could/component/common/ai/log/b;->e:Lcom/tencent/could/component/common/ai/log/c;

    .line 154
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/log/b;->a:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    invoke-virtual {p1}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDirLog()Ljava/lang/String;

    move-result-object p1

    .line 155
    invoke-static {}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->getInstance()Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;

    move-result-object v0

    new-instance v1, Lcom/tencent/could/component/common/ai/log/a;

    invoke-direct {v1, p0, p1}, Lcom/tencent/could/component/common/ai/log/a;-><init>(Lcom/tencent/could/component/common/ai/log/b;Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Lcom/tencent/could/component/common/ai/utils/ThreadPoolUtil;->addWork(Ljava/lang/Runnable;)V

    return-void
.end method
