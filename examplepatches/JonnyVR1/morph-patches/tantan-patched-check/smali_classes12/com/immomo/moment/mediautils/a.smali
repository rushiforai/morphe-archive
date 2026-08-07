.class public Lcom/immomo/moment/mediautils/a;
.super Lcom/immomo/moment/mediautils/b;
.source "SourceFile"


# instance fields
.field private A:Ljava/lang/String;

.field private B:Lcom/immomo/moment/mediautils/j;

.field private C:Lcom/immomo/moment/mediautils/h;

.field private D:Lcom/immomo/moment/mediautils/AudioResampleUtils;

.field private E:Ljava/lang/Boolean;

.field private F:Z

.field private G:Ljava/nio/ByteBuffer;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/b;-><init>()V

    .line 2
    .line 3
    .line 4
    const-string v0, "AudioDecoder"

    .line 5
    .line 6
    iput-object v0, p0, Lcom/immomo/moment/mediautils/a;->A:Ljava/lang/String;

    .line 7
    .line 8
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 9
    .line 10
    iput-object v0, p0, Lcom/immomo/moment/mediautils/a;->E:Ljava/lang/Boolean;

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/a;->F:Z

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mediautils/a;->G:Ljava/nio/ByteBuffer;

    .line 17
    .line 18
    return-void
.end method

.method public static synthetic n(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/j;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/j;)Lcom/immomo/moment/mediautils/j;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/AudioResampleUtils;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a;->D:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/AudioResampleUtils;)Lcom/immomo/moment/mediautils/AudioResampleUtils;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a;->D:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/a;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a;->G:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/a;Ljava/nio/ByteBuffer;)Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a;->G:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic t(Lcom/immomo/moment/mediautils/a;)Lcom/immomo/moment/mediautils/h;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic u(Lcom/immomo/moment/mediautils/a;Lcom/immomo/moment/mediautils/h;)Lcom/immomo/moment/mediautils/h;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 2
    .line 3
    return-object p1
.end method


# virtual methods
.method public declared-synchronized b(Ljava/nio/ByteBuffer;I)Z
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/a;->F:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return v1

    .line 9
    :cond_0
    move v0, v1

    .line 10
    :goto_0
    if-lez p2, :cond_9

    .line 11
    .line 12
    :try_start_1
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    if-nez v2, :cond_7

    .line 15
    .line 16
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 17
    .line 18
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 19
    .line 20
    .line 21
    move-result v2

    .line 22
    if-gtz v2, :cond_5

    .line 23
    .line 24
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/b;->r:Z

    .line 25
    .line 26
    if-nez v2, :cond_1

    .line 27
    .line 28
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/b;->q:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    .line 30
    if-nez v2, :cond_1

    .line 31
    .line 32
    const-wide/16 v2, 0xa

    .line 33
    .line 34
    :try_start_2
    invoke-static {v2, v3}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 35
    .line 36
    .line 37
    goto :goto_0

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto/16 :goto_2

    .line 40
    .line 41
    :catch_0
    move-exception v2

    .line 42
    :try_start_3
    invoke-virtual {v2}, Ljava/lang/Throwable;->printStackTrace()V

    .line 43
    .line 44
    .line 45
    goto :goto_1

    .line 46
    :cond_1
    iget-boolean v2, p0, Lcom/immomo/moment/mediautils/b;->p:Z

    .line 47
    .line 48
    if-eqz v2, :cond_4

    .line 49
    .line 50
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 51
    .line 52
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 53
    .line 54
    .line 55
    move-result v2

    .line 56
    if-lez v2, :cond_3

    .line 57
    .line 58
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 59
    .line 60
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v2

    .line 64
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 65
    .line 66
    iput-object v2, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 67
    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 71
    .line 72
    .line 73
    goto :goto_1

    .line 74
    :cond_2
    monitor-exit p0

    .line 75
    return v1

    .line 76
    :cond_3
    monitor-exit p0

    .line 77
    return v1

    .line 78
    :cond_4
    monitor-exit p0

    .line 79
    return v1

    .line 80
    :cond_5
    :try_start_4
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 81
    .line 82
    invoke-virtual {v2}, Ljava/util/concurrent/LinkedBlockingQueue;->poll()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v2

    .line 86
    check-cast v2, Ljava/nio/ByteBuffer;

    .line 87
    .line 88
    iput-object v2, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 89
    .line 90
    invoke-virtual {v2, v1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 91
    .line 92
    .line 93
    goto :goto_1

    .line 94
    :catch_1
    move-exception p1

    .line 95
    :try_start_5
    const-string p2, "AudioDecoder"

    .line 96
    .line 97
    invoke-static {p2, p1}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 98
    .line 99
    .line 100
    iget-object p2, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 101
    .line 102
    if-eqz p2, :cond_6

    .line 103
    .line 104
    new-instance v0, Ljava/lang/StringBuilder;

    .line 105
    .line 106
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 107
    .line 108
    .line 109
    const-string v2, "readSampleData exception:"

    .line 110
    .line 111
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-static {p1}, Ll/g8g0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    const/16 v0, -0x66

    .line 126
    .line 127
    invoke-interface {p2, v0, v0, p1}, Ll/jpw;->a(IILjava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 128
    .line 129
    .line 130
    :cond_6
    monitor-exit p0

    .line 131
    return v1

    .line 132
    :cond_7
    :goto_1
    :try_start_6
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 133
    .line 134
    invoke-virtual {v2}, Ljava/nio/Buffer;->remaining()I

    .line 135
    .line 136
    .line 137
    move-result v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 138
    iget-object v3, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 139
    .line 140
    if-lt v2, p2, :cond_8

    .line 141
    .line 142
    :try_start_7
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    invoke-virtual {v3, v2, v0, p2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 147
    .line 148
    .line 149
    add-int/2addr v0, p2

    .line 150
    move p2, v1

    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_8
    invoke-virtual {v3}, Ljava/nio/Buffer;->remaining()I

    .line 154
    .line 155
    .line 156
    move-result v2

    .line 157
    iget-object v3, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 158
    .line 159
    invoke-virtual {p1}, Ljava/nio/ByteBuffer;->array()[B

    .line 160
    .line 161
    .line 162
    move-result-object v4

    .line 163
    invoke-virtual {v3, v4, v0, v2}, Ljava/nio/ByteBuffer;->get([BII)Ljava/nio/ByteBuffer;

    .line 164
    .line 165
    .line 166
    add-int/2addr v0, v2

    .line 167
    sub-int/2addr p2, v2

    .line 168
    iget-object v2, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 169
    .line 170
    iget-object v3, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 171
    .line 172
    invoke-virtual {v2, v3}, Ljava/util/concurrent/LinkedBlockingQueue;->offer(Ljava/lang/Object;)Z

    .line 173
    .line 174
    .line 175
    const/4 v2, 0x0

    .line 176
    iput-object v2, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 177
    .line 178
    goto/16 :goto_0

    .line 179
    .line 180
    :cond_9
    monitor-exit p0

    .line 181
    const/4 p0, 0x1

    .line 182
    return p0

    .line 183
    :goto_2
    :try_start_8
    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 184
    throw p1
.end method

.method public declared-synchronized c()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "AudioDecoder"

    .line 3
    .line 4
    const-string v1, "AudioDecoder release !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 10
    .line 11
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 12
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->C()V

    .line 18
    .line 19
    .line 20
    iput-object v2, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception v1

    .line 24
    goto :goto_2

    .line 25
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    :try_start_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :catchall_1
    move-exception v0

    .line 37
    goto :goto_3

    .line 38
    :cond_1
    :goto_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a;->D:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 39
    .line 40
    if-eqz v0, :cond_2

    .line 41
    .line 42
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/AudioResampleUtils;->release()V

    .line 43
    .line 44
    .line 45
    iput-object v2, p0, Lcom/immomo/moment/mediautils/a;->D:Lcom/immomo/moment/mediautils/AudioResampleUtils;

    .line 46
    .line 47
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-lez v0, :cond_3

    .line 54
    .line 55
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 58
    .line 59
    .line 60
    :cond_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-lez v0, :cond_4

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 71
    .line 72
    .line 73
    :cond_4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    iput-object v0, p0, Lcom/immomo/moment/mediautils/a;->E:Ljava/lang/Boolean;

    .line 76
    .line 77
    const/4 v0, 0x0

    .line 78
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/a;->F:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 79
    .line 80
    monitor-exit p0

    .line 81
    return-void

    .line 82
    :goto_2
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 83
    :try_start_4
    throw v1

    .line 84
    :goto_3
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 85
    throw v0
.end method

.method public declared-synchronized d(J)V
    .locals 8

    .line 1
    const-string v0, "seek:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoder"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 22
    .line 23
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 24
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 25
    .line 26
    if-eqz v1, :cond_4

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->A()V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 32
    .line 33
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/h;->w()V

    .line 34
    .line 35
    .line 36
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 37
    .line 38
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 44
    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    iput-object v1, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 48
    .line 49
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 50
    .line 51
    if-eqz v1, :cond_3

    .line 52
    .line 53
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 54
    .line 55
    const-wide/16 v4, 0x0

    .line 56
    .line 57
    cmp-long v6, v2, v4

    .line 58
    .line 59
    if-eqz v6, :cond_2

    .line 60
    .line 61
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 62
    .line 63
    cmp-long v4, v6, v4

    .line 64
    .line 65
    if-eqz v4, :cond_2

    .line 66
    .line 67
    cmp-long v4, p1, v2

    .line 68
    .line 69
    if-gez v4, :cond_0

    .line 70
    .line 71
    :goto_0
    move-wide p1, v2

    .line 72
    goto :goto_1

    .line 73
    :cond_0
    cmp-long v4, p1, v6

    .line 74
    .line 75
    if-ltz v4, :cond_1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    :goto_1
    invoke-virtual {v1, p1, p2}, Lcom/immomo/moment/mediautils/j;->f(J)V

    .line 79
    .line 80
    .line 81
    goto :goto_2

    .line 82
    :catchall_0
    move-exception p1

    .line 83
    goto :goto_3

    .line 84
    :cond_2
    invoke-virtual {v1, p1, p2}, Lcom/immomo/moment/mediautils/j;->f(J)V

    .line 85
    .line 86
    .line 87
    :cond_3
    :goto_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 88
    .line 89
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/h;->E()V

    .line 90
    .line 91
    .line 92
    const/4 p1, 0x0

    .line 93
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/b;->q:Z

    .line 94
    .line 95
    :cond_4
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 96
    monitor-exit p0

    .line 97
    return-void

    .line 98
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 99
    :try_start_3
    throw p1

    .line 100
    :catchall_1
    move-exception p1

    .line 101
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 102
    throw p1
.end method

.method public declared-synchronized e(Ljava/lang/String;)Z
    .locals 8

    .line 1
    const-string v0, "Init audio demuxer error ! File:"

    .line 2
    .line 3
    const-string v1, "Init audio demuxer error! File:"

    .line 4
    .line 5
    const-string v2, "setDataSource path = "

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-object v3, p0, Lcom/immomo/moment/mediautils/a;->A:Ljava/lang/String;

    .line 9
    .line 10
    new-instance v4, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-static {v3, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object v2, p0, Lcom/immomo/moment/mediautils/a;->E:Ljava/lang/Boolean;

    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 28
    .line 29
    .line 30
    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    const/4 v3, 0x1

    .line 32
    if-eqz v2, :cond_0

    .line 33
    .line 34
    monitor-exit p0

    .line 35
    return v3

    .line 36
    :cond_0
    const/4 v2, 0x0

    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 40
    .line 41
    if-eqz v0, :cond_1

    .line 42
    .line 43
    new-instance v3, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    const/16 v1, -0x67

    .line 56
    .line 57
    invoke-interface {v0, v1, v1, p1}, Ll/jpw;->a(IILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :catchall_0
    move-exception p1

    .line 62
    goto/16 :goto_5

    .line 63
    .line 64
    :cond_1
    :goto_0
    monitor-exit p0

    .line 65
    return v2

    .line 66
    :cond_2
    :try_start_2
    new-instance v1, Lcom/immomo/moment/mediautils/j;

    .line 67
    .line 68
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/j;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object v1, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 72
    .line 73
    new-instance v4, Lcom/immomo/moment/mediautils/a$a;

    .line 74
    .line 75
    invoke-direct {v4, p0}, Lcom/immomo/moment/mediautils/a$a;-><init>(Lcom/immomo/moment/mediautils/a;)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v1, v4}, Lcom/immomo/moment/mediautils/f;->h(Lcom/immomo/moment/mediautils/f$a;)V

    .line 79
    .line 80
    .line 81
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 82
    .line 83
    invoke-virtual {v1, p1}, Lcom/immomo/moment/mediautils/j;->c(Ljava/lang/String;)Z

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    const/4 v4, 0x0

    .line 88
    if-nez v1, :cond_3

    .line 89
    .line 90
    const-string v1, "AudioDecoder"

    .line 91
    .line 92
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-static {v1, p1}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 100
    .line 101
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/j;->e()V

    .line 102
    .line 103
    .line 104
    iput-object v4, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 105
    .line 106
    monitor-exit p0

    .line 107
    return v2

    .line 108
    :cond_3
    :try_start_3
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 109
    .line 110
    invoke-virtual {v0}, Lcom/immomo/moment/mediautils/j;->b()Ljava/util/List;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    :cond_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 119
    .line 120
    .line 121
    move-result v1

    .line 122
    if-eqz v1, :cond_5

    .line 123
    .line 124
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    check-cast v1, Landroid/media/MediaFormat;

    .line 129
    .line 130
    const-string v5, "mime"

    .line 131
    .line 132
    invoke-virtual {v1, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    const-string v6, "audio"

    .line 137
    .line 138
    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 139
    .line 140
    .line 141
    move-result v5

    .line 142
    if-eqz v5, :cond_4

    .line 143
    .line 144
    move-object v4, v1

    .line 145
    :cond_5
    if-eqz v4, :cond_d

    .line 146
    .line 147
    iget-object v0, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 148
    .line 149
    invoke-virtual {v0, v4}, Lcom/immomo/moment/mediautils/j;->g(Landroid/media/MediaFormat;)Z

    .line 150
    .line 151
    .line 152
    const-string v0, "channel-count"

    .line 153
    .line 154
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    if-eqz v0, :cond_6

    .line 159
    .line 160
    const-string v0, "channel-count"

    .line 161
    .line 162
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 167
    .line 168
    iget v1, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 169
    .line 170
    if-gtz v1, :cond_6

    .line 171
    .line 172
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 173
    .line 174
    :cond_6
    const-string v0, "sample-rate"

    .line 175
    .line 176
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    if-eqz v0, :cond_7

    .line 181
    .line 182
    const-string v0, "sample-rate"

    .line 183
    .line 184
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 189
    .line 190
    iget v1, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 191
    .line 192
    if-gtz v1, :cond_7

    .line 193
    .line 194
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 195
    .line 196
    :cond_7
    const-string v0, "bit-width"

    .line 197
    .line 198
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    if-eqz v0, :cond_8

    .line 203
    .line 204
    const-string v0, "bit-width"

    .line 205
    .line 206
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 211
    .line 212
    iget v1, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 213
    .line 214
    if-gtz v1, :cond_8

    .line 215
    .line 216
    iput v0, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 217
    .line 218
    :cond_8
    const-string v0, "durationUs"

    .line 219
    .line 220
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    if-eqz v0, :cond_a

    .line 225
    .line 226
    const-string v0, "durationUs"

    .line 227
    .line 228
    invoke-virtual {v4, v0}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 229
    .line 230
    .line 231
    move-result-wide v0

    .line 232
    iget-wide v5, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 233
    .line 234
    cmp-long v7, v0, v5

    .line 235
    .line 236
    if-gez v7, :cond_9

    .line 237
    .line 238
    const-wide/16 v5, 0x0

    .line 239
    .line 240
    iput-wide v5, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 241
    .line 242
    goto :goto_1

    .line 243
    :cond_9
    iget-object v7, p0, Lcom/immomo/moment/mediautils/a;->B:Lcom/immomo/moment/mediautils/j;

    .line 244
    .line 245
    invoke-virtual {v7, v5, v6}, Lcom/immomo/moment/mediautils/j;->f(J)V

    .line 246
    .line 247
    .line 248
    :goto_1
    iget-wide v5, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 249
    .line 250
    sub-long/2addr v0, v5

    .line 251
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/b;->j:J

    .line 252
    .line 253
    :cond_a
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 254
    .line 255
    monitor-enter v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 256
    :try_start_4
    new-instance v1, Lcom/immomo/moment/mediautils/h;

    .line 257
    .line 258
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/h;-><init>()V

    .line 259
    .line 260
    .line 261
    iput-object v1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 262
    .line 263
    invoke-virtual {v1, v4, v3}, Lcom/immomo/moment/mediautils/h;->u(Landroid/media/MediaFormat;I)Z

    .line 264
    .line 265
    .line 266
    move-result v1

    .line 267
    if-nez v1, :cond_c

    .line 268
    .line 269
    const-string v1, "AudioDecoder"

    .line 270
    .line 271
    const-string v3, "Create media codec error !"

    .line 272
    .line 273
    invoke-static {v1, v3}, Lcom/cosmos/mdlog/MDLog;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 274
    .line 275
    .line 276
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 277
    .line 278
    if-eqz v1, :cond_b

    .line 279
    .line 280
    new-instance v3, Ljava/lang/StringBuilder;

    .line 281
    .line 282
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 283
    .line 284
    .line 285
    const-string v4, "Create media codec error! File:"

    .line 286
    .line 287
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 288
    .line 289
    .line 290
    invoke-virtual {v3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 291
    .line 292
    .line 293
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 294
    .line 295
    .line 296
    move-result-object p1

    .line 297
    const/16 v3, -0x65

    .line 298
    .line 299
    invoke-interface {v1, v3, v3, p1}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 300
    .line 301
    .line 302
    goto :goto_2

    .line 303
    :catchall_1
    move-exception p1

    .line 304
    goto :goto_3

    .line 305
    :cond_b
    :goto_2
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 306
    monitor-exit p0

    .line 307
    return v2

    .line 308
    :cond_c
    :try_start_5
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 309
    .line 310
    new-instance v1, Lcom/immomo/moment/mediautils/a$b;

    .line 311
    .line 312
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/a$b;-><init>(Lcom/immomo/moment/mediautils/a;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p1, v1}, Lcom/immomo/moment/mediautils/h;->J(Lcom/immomo/moment/mediautils/h$d;)V

    .line 316
    .line 317
    .line 318
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 319
    .line 320
    new-instance v1, Lcom/immomo/moment/mediautils/a$c;

    .line 321
    .line 322
    invoke-direct {v1, p0}, Lcom/immomo/moment/mediautils/a$c;-><init>(Lcom/immomo/moment/mediautils/a;)V

    .line 323
    .line 324
    .line 325
    invoke-virtual {p1, v1}, Lcom/immomo/moment/mediautils/h;->I(Lcom/immomo/moment/mediautils/h$b;)V

    .line 326
    .line 327
    .line 328
    monitor-exit v0

    .line 329
    goto :goto_4

    .line 330
    :goto_3
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 331
    :try_start_6
    throw p1

    .line 332
    :cond_d
    :goto_4
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 333
    .line 334
    iput-object p1, p0, Lcom/immomo/moment/mediautils/a;->E:Ljava/lang/Boolean;
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 335
    .line 336
    monitor-exit p0

    .line 337
    return v3

    .line 338
    :goto_5
    :try_start_7
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 339
    throw p1
.end method

.method public declared-synchronized f(Z)V
    .locals 3

    .line 1
    const-string v0, "AudioDecoder setDecoderCycleMode is "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoder"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/b;->p:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    monitor-exit p0

    .line 24
    return-void

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p1
.end method

.method public declared-synchronized g(JJ)V
    .locals 6

    .line 1
    const-string v0, "mStartPosUs = "

    .line 2
    .line 3
    const-string v1, "AudioDecoder startPtsMs = "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    const-string v2, "AudioDecoder"

    .line 7
    .line 8
    new-instance v3, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    invoke-direct {v3, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v3, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, " durationMs = "

    .line 17
    .line 18
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v3, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-static {v2, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    const-wide/16 v1, 0x0

    .line 32
    .line 33
    cmp-long v3, p1, v1

    .line 34
    .line 35
    const-wide/16 v4, 0x3e8

    .line 36
    .line 37
    if-ltz v3, :cond_0

    .line 38
    .line 39
    mul-long/2addr p1, v4

    .line 40
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 41
    .line 42
    goto :goto_0

    .line 43
    :catchall_0
    move-exception p1

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 46
    .line 47
    :goto_0
    cmp-long p1, p3, v1

    .line 48
    .line 49
    if-ltz p1, :cond_1

    .line 50
    .line 51
    iget-wide p1, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 52
    .line 53
    mul-long/2addr p3, v4

    .line 54
    add-long/2addr p1, p3

    .line 55
    iput-wide p1, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :cond_1
    iput-wide v1, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 59
    .line 60
    :goto_1
    iget-object p1, p0, Lcom/immomo/moment/mediautils/a;->A:Ljava/lang/String;

    .line 61
    .line 62
    new-instance p2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    iget-wide p3, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 68
    .line 69
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    const-string p3, " mEndPos = "

    .line 73
    .line 74
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    iget-wide p3, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 78
    .line 79
    invoke-virtual {p2, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object p2

    .line 86
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 87
    .line 88
    .line 89
    monitor-exit p0

    .line 90
    return-void

    .line 91
    :goto_2
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 92
    throw p1
.end method

.method public declared-synchronized k(III)V
    .locals 3

    .line 1
    const-string v0, "AudioDecoder sampleRate = "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoder"

    .line 5
    .line 6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    const-string v0, " channels = "

    .line 15
    .line 16
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v0, " bits = "

    .line 23
    .line 24
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    const/4 v0, 0x1

    .line 38
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 39
    .line 40
    iput p3, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 41
    .line 42
    iput p2, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 43
    .line 44
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->g:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-void

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    throw p1
.end method

.method public declared-synchronized m()V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    const-string v0, "AudioDecoder"

    .line 3
    .line 4
    const-string v1, "AudioDecoder startDecoding !!!"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/a;->F:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 10
    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 16
    .line 17
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 18
    :try_start_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/a;->C:Lcom/immomo/moment/mediautils/h;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const/4 v2, 0x1

    .line 23
    invoke-virtual {v1, v2}, Lcom/immomo/moment/mediautils/h;->L(Z)V

    .line 24
    .line 25
    .line 26
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/a;->F:Z

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 32
    monitor-exit p0

    .line 33
    return-void

    .line 34
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 35
    :try_start_4
    throw v1

    .line 36
    :catchall_1
    move-exception v0

    .line 37
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 38
    throw v0
.end method
