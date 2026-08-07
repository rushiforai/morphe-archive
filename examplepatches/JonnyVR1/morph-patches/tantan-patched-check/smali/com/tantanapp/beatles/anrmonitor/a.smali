.class public Lcom/tantanapp/beatles/anrmonitor/a;
.super Ljava/lang/Thread;
.source "SourceFile"


# instance fields
.field public final a:Landroid/os/Handler;

.field public final b:I

.field public volatile c:J

.field public volatile d:Z

.field public e:J

.field public f:Ljava/lang/String;

.field public g:Z

.field public h:Z

.field public i:Ll/i1;

.field public j:Landroid/content/Context;

.field public final k:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(ILl/i1;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/os/Handler;

    .line 5
    .line 6
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->a:Landroid/os/Handler;

    .line 14
    .line 15
    const-wide/16 v0, 0x0

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 18
    .line 19
    const/4 v2, 0x0

    .line 20
    iput-boolean v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->d:Z

    .line 21
    .line 22
    iput-wide v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->e:J

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    iput-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->f:Ljava/lang/String;

    .line 26
    .line 27
    iput-boolean v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->g:Z

    .line 28
    .line 29
    iput-boolean v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->h:Z

    .line 30
    .line 31
    new-instance v0, Lcom/tantanapp/beatles/anrmonitor/a$a;

    .line 32
    .line 33
    invoke-direct {v0, p0}, Lcom/tantanapp/beatles/anrmonitor/a$a;-><init>(Lcom/tantanapp/beatles/anrmonitor/a;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->k:Ljava/lang/Runnable;

    .line 37
    .line 38
    iput p1, p0, Lcom/tantanapp/beatles/anrmonitor/a;->b:I

    .line 39
    .line 40
    iput-object p2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->i:Ll/i1;

    .line 41
    .line 42
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;ILl/i1;)V
    .locals 0

    .line 43
    invoke-direct {p0, p2, p3}, Lcom/tantanapp/beatles/anrmonitor/a;-><init>(ILl/i1;)V

    .line 44
    iput-object p1, p0, Lcom/tantanapp/beatles/anrmonitor/a;->j:Landroid/content/Context;

    return-void
.end method

.method public static synthetic a(Lcom/tantanapp/beatles/anrmonitor/a;J)J
    .locals 0

    .line 1
    iput-wide p1, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 2
    .line 3
    return-wide p1
.end method

.method public static synthetic b(Lcom/tantanapp/beatles/anrmonitor/a;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/tantanapp/beatles/anrmonitor/a;->d:Z

    .line 2
    .line 3
    return p1
.end method


# virtual methods
.method public c()Lcom/tantanapp/beatles/anrmonitor/a;
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->f:Ljava/lang/String;

    .line 3
    .line 4
    return-object p0
.end method

.method public run()V
    .locals 11

    return-void

    .line 1
    const-string v0, "|ANRMonitor|"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->b:I

    .line 7
    .line 8
    int-to-long v0, v0

    .line 9
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Thread;->isInterrupted()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-nez v2, :cond_8

    .line 14
    .line 15
    iget-wide v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 16
    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v2, v2, v4

    .line 20
    .line 21
    const/4 v3, 0x1

    .line 22
    const/4 v6, 0x0

    .line 23
    if-nez v2, :cond_1

    .line 24
    .line 25
    move v2, v3

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    move v2, v6

    .line 28
    :goto_1
    iget-wide v7, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 29
    .line 30
    add-long/2addr v7, v0

    .line 31
    iput-wide v7, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 32
    .line 33
    if-eqz v2, :cond_2

    .line 34
    .line 35
    iget-object v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->a:Landroid/os/Handler;

    .line 36
    .line 37
    iget-object v7, p0, Lcom/tantanapp/beatles/anrmonitor/a;->k:Ljava/lang/Runnable;

    .line 38
    .line 39
    invoke-virtual {v2, v7}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 40
    .line 41
    .line 42
    :cond_2
    :try_start_0
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    iget-wide v7, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 46
    .line 47
    cmp-long v2, v7, v4

    .line 48
    .line 49
    if-eqz v2, :cond_0

    .line 50
    .line 51
    iget-boolean v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->d:Z

    .line 52
    .line 53
    if-nez v2, :cond_0

    .line 54
    .line 55
    iget-boolean v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->h:Z

    .line 56
    .line 57
    if-nez v2, :cond_4

    .line 58
    .line 59
    invoke-static {}, Landroid/os/Debug;->isDebuggerConnected()Z

    .line 60
    .line 61
    .line 62
    move-result v2

    .line 63
    if-nez v2, :cond_3

    .line 64
    .line 65
    invoke-static {}, Landroid/os/Debug;->waitingForDebugger()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    if-eqz v2, :cond_4

    .line 70
    .line 71
    :cond_3
    const-string v2, "An ANR was detected but ignored because the debugger is connected (you can prevent this with setIgnoreDebugger(true))"

    .line 72
    .line 73
    new-array v4, v6, [Ljava/lang/Object;

    .line 74
    .line 75
    invoke-static {v2, v4}, Ll/f610;->f(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 76
    .line 77
    .line 78
    iput-boolean v3, p0, Lcom/tantanapp/beatles/anrmonitor/a;->d:Z

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :cond_4
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 82
    .line 83
    .line 84
    move-result-wide v4

    .line 85
    iget-wide v7, p0, Lcom/tantanapp/beatles/anrmonitor/a;->e:J

    .line 86
    .line 87
    sub-long v7, v4, v7

    .line 88
    .line 89
    const-wide/16 v9, 0x4e20

    .line 90
    .line 91
    cmp-long v2, v7, v9

    .line 92
    .line 93
    if-gez v2, :cond_5

    .line 94
    .line 95
    const-string v2, "should not process ANR too Fre in 20000"

    .line 96
    .line 97
    new-array v3, v6, [Ljava/lang/Object;

    .line 98
    .line 99
    invoke-static {v2, v3}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_5
    iget-object v2, p0, Lcom/tantanapp/beatles/anrmonitor/a;->j:Landroid/content/Context;

    .line 104
    .line 105
    invoke-static {v2, v9, v10}, Ll/vc60;->d(Landroid/content/Context;J)Landroid/app/ActivityManager$ProcessErrorStateInfo;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    if-eqz v2, :cond_7

    .line 110
    .line 111
    const-string v0, "anr detected! found visiable anr , start to process!"

    .line 112
    .line 113
    const-string v1, "[beatles][crash][anr]"

    .line 114
    .line 115
    invoke-static {v1, v0}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    iput-wide v4, p0, Lcom/tantanapp/beatles/anrmonitor/a;->e:J

    .line 119
    .line 120
    iget-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->f:Ljava/lang/String;

    .line 121
    .line 122
    iget-wide v4, p0, Lcom/tantanapp/beatles/anrmonitor/a;->c:J

    .line 123
    .line 124
    if-eqz v0, :cond_6

    .line 125
    .line 126
    iget-object v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->f:Ljava/lang/String;

    .line 127
    .line 128
    iget-boolean v6, p0, Lcom/tantanapp/beatles/anrmonitor/a;->g:Z

    .line 129
    .line 130
    invoke-static {v4, v5, v0, v6}, Lcom/tantanapp/beatles/anrmonitor/ANRError;->New(JLjava/lang/String;Z)Lcom/tantanapp/beatles/anrmonitor/ANRError;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    goto :goto_2

    .line 135
    :cond_6
    invoke-static {v4, v5}, Lcom/tantanapp/beatles/anrmonitor/ANRError;->NewMainOnly(J)Lcom/tantanapp/beatles/anrmonitor/ANRError;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    :goto_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 140
    .line 141
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 142
    .line 143
    .line 144
    iget-object v5, v2, Landroid/app/ActivityManager$ProcessErrorStateInfo;->shortMsg:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 147
    .line 148
    .line 149
    const-string v5, "\n"

    .line 150
    .line 151
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 152
    .line 153
    .line 154
    iget-object v6, v2, Landroid/app/ActivityManager$ProcessErrorStateInfo;->longMsg:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 157
    .line 158
    .line 159
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v4

    .line 166
    iget-object v2, v2, Landroid/app/ActivityManager$ProcessErrorStateInfo;->shortMsg:Ljava/lang/String;

    .line 167
    .line 168
    invoke-static {v0, v2, v4}, Ll/j1;->a(Ljava/lang/Throwable;Ljava/lang/String;Ljava/lang/String;)Lcom/tantanapp/beatles/v2/data/MonitorEvent;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    const-string v2, "content:"

    .line 173
    .line 174
    invoke-virtual {v2, v4}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    invoke-static {v1, v2}, Ll/du2;->v(Ljava/lang/String;Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    iget-object v1, p0, Lcom/tantanapp/beatles/anrmonitor/a;->i:Ll/i1;

    .line 182
    .line 183
    invoke-virtual {v1, v0}, Ll/c610;->j(Lcom/tantanapp/beatles/v2/data/MonitorEvent;)V

    .line 184
    .line 185
    .line 186
    iget v0, p0, Lcom/tantanapp/beatles/anrmonitor/a;->b:I

    .line 187
    .line 188
    int-to-long v0, v0

    .line 189
    iput-boolean v3, p0, Lcom/tantanapp/beatles/anrmonitor/a;->d:Z

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_7
    const-string v2, "process state is unvisiable!"

    .line 194
    .line 195
    new-array v3, v6, [Ljava/lang/Object;

    .line 196
    .line 197
    invoke-static {v2, v3}, Ll/f610;->a(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 198
    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :catch_0
    :cond_8
    return-void
.end method
