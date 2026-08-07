.class final Lcom/xiaomi/push/service/n$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/xiaomi/push/service/n;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "c"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/n$c$a;
    }
.end annotation


# instance fields
.field private volatile a:J

.field private a:Lcom/xiaomi/push/service/n$c$a;

.field private volatile a:Z

.field private b:J

.field private b:Z

.field private c:Z


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/xiaomi/push/service/n$c;->a:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->a:Z

    .line 10
    .line 11
    const-wide/16 v0, 0x32

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/xiaomi/push/service/n$c;->b:J

    .line 14
    .line 15
    new-instance v0, Lcom/xiaomi/push/service/n$c$a;

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-direct {v0, v1}, Lcom/xiaomi/push/service/n$c$a;-><init>(Lcom/xiaomi/push/service/n$1;)V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 22
    .line 23
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p2}, Ljava/lang/Thread;->setDaemon(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/n$c;)Lcom/xiaomi/push/service/n$c$a;
    .locals 0

    .line 32
    iget-object p0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    return-object p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/n$c;Lcom/xiaomi/push/service/n$d;)V
    .locals 0

    .line 23
    invoke-direct {p0, p1}, Lcom/xiaomi/push/service/n$c;->a(Lcom/xiaomi/push/service/n$d;)V

    return-void
.end method

.method private a(Lcom/xiaomi/push/service/n$d;)V
    .locals 1

    .line 26
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    invoke-virtual {v0, p1}, Lcom/xiaomi/push/service/n$c$a;->a(Lcom/xiaomi/push/service/n$d;)V

    .line 27
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V

    return-void
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/n$c;)Z
    .locals 0

    .line 24
    iget-boolean p0, p0, Lcom/xiaomi/push/service/n$c;->b:Z

    return p0
.end method

.method public static synthetic a(Lcom/xiaomi/push/service/n$c;Z)Z
    .locals 0

    .line 25
    iput-boolean p1, p0, Lcom/xiaomi/push/service/n$c;->c:Z

    return p1
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 1

    monitor-enter p0

    const/4 v0, 0x1

    .line 28
    :try_start_0
    iput-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->b:Z

    .line 29
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    invoke-virtual {v0}, Lcom/xiaomi/push/service/n$c$a;->a()V

    .line 30
    invoke-virtual {p0}, Ljava/lang/Object;->notify()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0
.end method

.method public a()Z
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->a:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    iget-wide v2, p0, Lcom/xiaomi/push/service/n$c;->a:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    const-wide/32 v2, 0x927c0

    .line 13
    .line 14
    .line 15
    cmp-long p0, v0, v2

    .line 16
    .line 17
    if-lez p0, :cond_0

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_0
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public run()V
    .locals 10

    .line 1
    :goto_0
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->b:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    goto :goto_1

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    goto/16 :goto_5

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 12
    .line 13
    invoke-virtual {v0}, Lcom/xiaomi/push/service/n$c$a;->a()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    iget-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->c:Z

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    :goto_1
    return-void

    .line 25
    :cond_1
    :try_start_1
    invoke-virtual {p0}, Ljava/lang/Object;->wait()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    .line 27
    .line 28
    :catch_0
    :try_start_2
    monitor-exit p0

    .line 29
    goto :goto_0

    .line 30
    :cond_2
    invoke-static {}, Lcom/xiaomi/push/service/n;->a()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    iget-object v2, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 35
    .line 36
    invoke-virtual {v2}, Lcom/xiaomi/push/service/n$c$a;->a()Lcom/xiaomi/push/service/n$d;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    iget-object v3, v2, Lcom/xiaomi/push/service/n$d;->a:Ljava/lang/Object;

    .line 41
    .line 42
    monitor-enter v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 43
    :try_start_3
    iget-boolean v4, v2, Lcom/xiaomi/push/service/n$d;->a:Z

    .line 44
    .line 45
    const/4 v5, 0x0

    .line 46
    if-eqz v4, :cond_3

    .line 47
    .line 48
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 49
    .line 50
    invoke-virtual {v0, v5}, Lcom/xiaomi/push/service/n$c$a;->b(I)V

    .line 51
    .line 52
    .line 53
    monitor-exit v3
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 54
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 55
    goto :goto_0

    .line 56
    :catchall_1
    move-exception v0

    .line 57
    goto/16 :goto_4

    .line 58
    .line 59
    :cond_3
    :try_start_5
    iget-wide v6, v2, Lcom/xiaomi/push/service/n$d;->a:J

    .line 60
    .line 61
    sub-long/2addr v6, v0

    .line 62
    monitor-exit v3
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 63
    const-wide/16 v0, 0x0

    .line 64
    .line 65
    cmp-long v3, v6, v0

    .line 66
    .line 67
    const-wide/16 v8, 0x32

    .line 68
    .line 69
    if-lez v3, :cond_6

    .line 70
    .line 71
    :try_start_6
    iget-wide v0, p0, Lcom/xiaomi/push/service/n$c;->b:J

    .line 72
    .line 73
    cmp-long v2, v6, v0

    .line 74
    .line 75
    if-lez v2, :cond_4

    .line 76
    .line 77
    move-wide v6, v0

    .line 78
    :cond_4
    add-long/2addr v0, v8

    .line 79
    iput-wide v0, p0, Lcom/xiaomi/push/service/n$c;->b:J

    .line 80
    .line 81
    const-wide/16 v2, 0x1f4

    .line 82
    .line 83
    cmp-long v0, v0, v2

    .line 84
    .line 85
    if-lez v0, :cond_5

    .line 86
    .line 87
    iput-wide v2, p0, Lcom/xiaomi/push/service/n$c;->b:J
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 88
    .line 89
    :cond_5
    :try_start_7
    invoke-virtual {p0, v6, v7}, Ljava/lang/Object;->wait(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_1
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 90
    .line 91
    .line 92
    :catch_1
    :try_start_8
    monitor-exit p0

    .line 93
    goto :goto_0

    .line 94
    :cond_6
    iput-wide v8, p0, Lcom/xiaomi/push/service/n$c;->b:J

    .line 95
    .line 96
    iget-object v3, v2, Lcom/xiaomi/push/service/n$d;->a:Ljava/lang/Object;

    .line 97
    .line 98
    monitor-enter v3
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 99
    :try_start_9
    iget-object v4, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 100
    .line 101
    invoke-virtual {v4}, Lcom/xiaomi/push/service/n$c$a;->a()Lcom/xiaomi/push/service/n$d;

    .line 102
    .line 103
    .line 104
    move-result-object v4

    .line 105
    iget-wide v6, v4, Lcom/xiaomi/push/service/n$d;->a:J

    .line 106
    .line 107
    iget-wide v8, v2, Lcom/xiaomi/push/service/n$d;->a:J

    .line 108
    .line 109
    cmp-long v4, v6, v8

    .line 110
    .line 111
    if-eqz v4, :cond_7

    .line 112
    .line 113
    iget-object v4, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 114
    .line 115
    invoke-static {v4, v2}, Lcom/xiaomi/push/service/n$c$a;->a(Lcom/xiaomi/push/service/n$c$a;Lcom/xiaomi/push/service/n$d;)I

    .line 116
    .line 117
    .line 118
    move-result v4

    .line 119
    goto :goto_2

    .line 120
    :catchall_2
    move-exception v0

    .line 121
    goto :goto_3

    .line 122
    :cond_7
    move v4, v5

    .line 123
    :goto_2
    iget-boolean v6, v2, Lcom/xiaomi/push/service/n$d;->a:Z

    .line 124
    .line 125
    if-eqz v6, :cond_8

    .line 126
    .line 127
    iget-object v0, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 128
    .line 129
    invoke-static {v0, v2}, Lcom/xiaomi/push/service/n$c$a;->a(Lcom/xiaomi/push/service/n$c$a;Lcom/xiaomi/push/service/n$d;)I

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    invoke-virtual {v0, v1}, Lcom/xiaomi/push/service/n$c$a;->b(I)V

    .line 134
    .line 135
    .line 136
    monitor-exit v3
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 137
    :try_start_a
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_8
    :try_start_b
    iget-wide v6, v2, Lcom/xiaomi/push/service/n$d;->a:J

    .line 141
    .line 142
    invoke-virtual {v2, v6, v7}, Lcom/xiaomi/push/service/n$d;->a(J)V

    .line 143
    .line 144
    .line 145
    iget-object v6, p0, Lcom/xiaomi/push/service/n$c;->a:Lcom/xiaomi/push/service/n$c$a;

    .line 146
    .line 147
    invoke-virtual {v6, v4}, Lcom/xiaomi/push/service/n$c$a;->b(I)V

    .line 148
    .line 149
    .line 150
    iput-wide v0, v2, Lcom/xiaomi/push/service/n$d;->a:J

    .line 151
    .line 152
    monitor-exit v3
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 153
    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 154
    const/4 v0, 0x1

    .line 155
    :try_start_d
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v3

    .line 159
    iput-wide v3, p0, Lcom/xiaomi/push/service/n$c;->a:J

    .line 160
    .line 161
    iput-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->a:Z

    .line 162
    .line 163
    iget-object v1, v2, Lcom/xiaomi/push/service/n$d;->a:Lcom/xiaomi/push/service/n$b;

    .line 164
    .line 165
    invoke-interface {v1}, Ljava/lang/Runnable;->run()V

    .line 166
    .line 167
    .line 168
    iput-boolean v5, p0, Lcom/xiaomi/push/service/n$c;->a:Z
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :catchall_3
    move-exception v1

    .line 173
    monitor-enter p0

    .line 174
    :try_start_e
    iput-boolean v0, p0, Lcom/xiaomi/push/service/n$c;->b:Z

    .line 175
    .line 176
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_4

    .line 177
    throw v1

    .line 178
    :catchall_4
    move-exception v0

    .line 179
    :try_start_f
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_4

    .line 180
    throw v0

    .line 181
    :goto_3
    :try_start_10
    monitor-exit v3
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_2

    .line 182
    :try_start_11
    throw v0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 183
    :goto_4
    :try_start_12
    monitor-exit v3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_1

    .line 184
    :try_start_13
    throw v0

    .line 185
    :goto_5
    monitor-exit p0
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_0

    .line 186
    throw v0
.end method
