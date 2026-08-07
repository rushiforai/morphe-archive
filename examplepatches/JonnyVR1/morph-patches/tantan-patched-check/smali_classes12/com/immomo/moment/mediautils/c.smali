.class public Lcom/immomo/moment/mediautils/c;
.super Lcom/immomo/moment/mediautils/b;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/immomo/moment/mediautils/c$a;
    }
.end annotation


# instance fields
.field private A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

.field private B:Lcom/immomo/moment/mediautils/c$a;

.field private C:Ljava/lang/Thread;

.field private D:Z

.field private E:Z

.field private F:Z

.field private G:Ljava/lang/Object;

.field private H:Z


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/b;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/immomo/moment/mediautils/FFVideoDecoder;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 10
    .line 11
    new-instance v0, Lcom/immomo/moment/mediautils/c$a;

    .line 12
    .line 13
    invoke-direct {v0, p0}, Lcom/immomo/moment/mediautils/c$a;-><init>(Lcom/immomo/moment/mediautils/c;)V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/immomo/moment/mediautils/c;->B:Lcom/immomo/moment/mediautils/c$a;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lcom/immomo/moment/mediautils/c;->C:Ljava/lang/Thread;

    .line 20
    .line 21
    const/4 v0, 0x0

    .line 22
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->D:Z

    .line 23
    .line 24
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->E:Z

    .line 25
    .line 26
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->F:Z

    .line 27
    .line 28
    new-instance v1, Ljava/lang/Object;

    .line 29
    .line 30
    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/immomo/moment/mediautils/c;->G:Ljava/lang/Object;

    .line 34
    .line 35
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->H:Z

    .line 36
    .line 37
    return-void
.end method

.method public static synthetic n(Lcom/immomo/moment/mediautils/c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/c;->H:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic o(Lcom/immomo/moment/mediautils/c;)Lcom/immomo/moment/mediautils/FFVideoDecoder;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic p(Lcom/immomo/moment/mediautils/c;Lcom/immomo/moment/mediautils/FFVideoDecoder;)Lcom/immomo/moment/mediautils/FFVideoDecoder;
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 2
    .line 3
    return-object p1
.end method

.method public static synthetic q(Lcom/immomo/moment/mediautils/c;)Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/immomo/moment/mediautils/c;->D:Z

    .line 2
    .line 3
    return p0
.end method

.method public static synthetic r(Lcom/immomo/moment/mediautils/c;)Ljava/lang/Object;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/moment/mediautils/c;->G:Ljava/lang/Object;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic s(Lcom/immomo/moment/mediautils/c;Z)Z
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/c;->E:Z

    .line 2
    .line 3
    return p1
.end method

.method private declared-synchronized t()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->resume()V

    .line 10
    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :goto_1
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 19
    :try_start_3
    throw v1

    .line 20
    :catchall_1
    move-exception v0

    .line 21
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 22
    throw v0
.end method

.method private declared-synchronized u(J)V
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 6
    .line 7
    if-eqz v1, :cond_3

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->pause()V

    .line 10
    .line 11
    .line 12
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 13
    .line 14
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 20
    .line 21
    .line 22
    const/4 v1, 0x0

    .line 23
    iput-object v1, p0, Lcom/immomo/moment/mediautils/b;->m:Ljava/nio/ByteBuffer;

    .line 24
    .line 25
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 26
    .line 27
    const-wide/16 v3, 0x0

    .line 28
    .line 29
    cmp-long v5, v1, v3

    .line 30
    .line 31
    const-wide/16 v6, 0x3e8

    .line 32
    .line 33
    if-eqz v5, :cond_2

    .line 34
    .line 35
    iget-wide v8, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 36
    .line 37
    cmp-long v3, v8, v3

    .line 38
    .line 39
    if-eqz v3, :cond_2

    .line 40
    .line 41
    cmp-long v3, p1, v1

    .line 42
    .line 43
    if-gez v3, :cond_0

    .line 44
    .line 45
    :goto_0
    move-wide p1, v1

    .line 46
    goto :goto_1

    .line 47
    :cond_0
    cmp-long v3, p1, v8

    .line 48
    .line 49
    if-ltz v3, :cond_1

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    :goto_1
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 53
    .line 54
    div-long/2addr p1, v6

    .line 55
    invoke-virtual {v1, p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->seek(J)V

    .line 56
    .line 57
    .line 58
    goto :goto_2

    .line 59
    :catchall_0
    move-exception p1

    .line 60
    goto :goto_3

    .line 61
    :cond_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 62
    .line 63
    div-long/2addr p1, v6

    .line 64
    invoke-virtual {v1, p1, p2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->seek(J)V

    .line 65
    .line 66
    .line 67
    :goto_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 68
    .line 69
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->resume()V

    .line 70
    .line 71
    .line 72
    const/4 p1, 0x0

    .line 73
    iput-boolean p1, p0, Lcom/immomo/moment/mediautils/b;->q:Z

    .line 74
    .line 75
    :cond_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 76
    monitor-exit p0

    .line 77
    return-void

    .line 78
    :goto_3
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 79
    :try_start_3
    throw p1

    .line 80
    :catchall_1
    move-exception p1

    .line 81
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 82
    throw p1
.end method


# virtual methods
.method public declared-synchronized b(Ljava/nio/ByteBuffer;I)Z
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->F:Z
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
    const-string v2, "Soft readSampleData exception:"

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
    const-string v0, "AudioDecoderBySoft"

    .line 3
    .line 4
    const-string v1, "release"

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Lcom/immomo/moment/mediautils/c;->C:Ljava/lang/Thread;

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    iput-boolean v2, p0, Lcom/immomo/moment/mediautils/c;->H:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    :try_start_1
    invoke-virtual {v0}, Ljava/lang/Thread;->join()V
    :try_end_1
    .catch Ljava/lang/InterruptedException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_3

    .line 23
    :catch_0
    move-exception v0

    .line 24
    :try_start_2
    const-string v2, "AudioDecoderBySoft"

    .line 25
    .line 26
    invoke-static {v2, v0}, Lcom/cosmos/mdlog/MDLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :goto_0
    iput-object v1, p0, Lcom/immomo/moment/mediautils/c;->C:Ljava/lang/Thread;

    .line 30
    .line 31
    :cond_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 32
    .line 33
    monitor-enter v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    :try_start_3
    iget-object v2, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 35
    .line 36
    if-eqz v2, :cond_1

    .line 37
    .line 38
    invoke-virtual {v2}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->release()V

    .line 39
    .line 40
    .line 41
    iput-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 42
    .line 43
    goto :goto_1

    .line 44
    :catchall_1
    move-exception v1

    .line 45
    goto :goto_2

    .line 46
    :cond_1
    :goto_1
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 47
    :try_start_4
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    if-lez v0, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->t:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 56
    .line 57
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 58
    .line 59
    .line 60
    :cond_2
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 61
    .line 62
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-lez v0, :cond_3

    .line 67
    .line 68
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->u:Ljava/util/concurrent/LinkedBlockingQueue;

    .line 69
    .line 70
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->clear()V

    .line 71
    .line 72
    .line 73
    :cond_3
    const/4 v0, 0x0

    .line 74
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->F:Z
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 75
    .line 76
    monitor-exit p0

    .line 77
    return-void

    .line 78
    :goto_2
    :try_start_5
    monitor-exit v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 79
    :try_start_6
    throw v1

    .line 80
    :goto_3
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 81
    throw v0
.end method

.method public declared-synchronized d(J)V
    .locals 3

    .line 1
    const-string v0, "seek:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoderBySoft"

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
    invoke-direct {p0, p1, p2}, Lcom/immomo/moment/mediautils/c;->u(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    .line 23
    .line 24
    monitor-exit p0

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public declared-synchronized e(Ljava/lang/String;)Z
    .locals 13

    .line 1
    const-string v0, "Soft Init audio prepare error! File:"

    .line 2
    .line 3
    const-string v1, "start Seek:"

    .line 4
    .line 5
    const-string v2, "resample for smaplebit:"

    .line 6
    .line 7
    const-string v3, "source sampleRate:"

    .line 8
    .line 9
    const-string v4, "path:"

    .line 10
    .line 11
    const-string v5, "Soft Init audio demuxer error! File:"

    .line 12
    .line 13
    monitor-enter p0

    .line 14
    const/4 v6, 0x0

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    :try_start_0
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 18
    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/16 v1, -0x67

    .line 34
    .line 35
    invoke-interface {v0, v1, v1, p1}, Ll/jpw;->a(IILjava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    move-object p1, v0

    .line 41
    goto/16 :goto_6

    .line 42
    .line 43
    :cond_0
    :goto_0
    monitor-exit p0

    .line 44
    return v6

    .line 45
    :cond_1
    :try_start_1
    const-string v5, "AudioDecoderBySoft"

    .line 46
    .line 47
    invoke-virtual {v4, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v4

    .line 51
    invoke-static {v5, v4}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object v4, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 55
    .line 56
    monitor-enter v4
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    :try_start_2
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 58
    .line 59
    if-nez v5, :cond_2

    .line 60
    .line 61
    monitor-exit v4
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 62
    monitor-exit p0

    .line 63
    return v6

    .line 64
    :catchall_1
    move-exception v0

    .line 65
    move-object p1, v0

    .line 66
    goto/16 :goto_5

    .line 67
    .line 68
    :cond_2
    :try_start_3
    invoke-virtual {v5, p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setDataSource(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 72
    .line 73
    const/4 v6, 0x1

    .line 74
    invoke-virtual {v5, v6}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->selectMeidaTrack(I)V

    .line 75
    .line 76
    .line 77
    iget-object v7, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 78
    .line 79
    iget-wide v8, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 80
    .line 81
    iget-wide v10, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 82
    .line 83
    const/4 v12, 0x0

    .line 84
    invoke-virtual/range {v7 .. v12}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setDecoderRange(JJZ)V

    .line 85
    .line 86
    .line 87
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 88
    .line 89
    iget v7, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 90
    .line 91
    iget v8, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 92
    .line 93
    iget v9, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 94
    .line 95
    invoke-virtual {v5, v7, v8, v9}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setOutAudioInfo(III)V

    .line 96
    .line 97
    .line 98
    iget-object v5, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 99
    .line 100
    invoke-virtual {v5}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->prepare()Z

    .line 101
    .line 102
    .line 103
    move-result v5

    .line 104
    if-eqz v5, :cond_b

    .line 105
    .line 106
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 107
    .line 108
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getSampleRate()I

    .line 109
    .line 110
    .line 111
    move-result p1

    .line 112
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 113
    .line 114
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 115
    .line 116
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioChannel()I

    .line 117
    .line 118
    .line 119
    move-result p1

    .line 120
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 121
    .line 122
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 123
    .line 124
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getAudioBits()I

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 129
    .line 130
    const-string p1, "AudioDecoderBySoft"

    .line 131
    .line 132
    new-instance v0, Ljava/lang/StringBuilder;

    .line 133
    .line 134
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 135
    .line 136
    .line 137
    iget v3, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 138
    .line 139
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 140
    .line 141
    .line 142
    const-string v3, " SampleChannels:"

    .line 143
    .line 144
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    iget v3, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 148
    .line 149
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    const-string v3, " SampleBits:"

    .line 153
    .line 154
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 155
    .line 156
    .line 157
    iget v3, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 158
    .line 159
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    .line 168
    .line 169
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 170
    .line 171
    if-gtz p1, :cond_3

    .line 172
    .line 173
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 174
    .line 175
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 176
    .line 177
    :cond_3
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 178
    .line 179
    if-gtz p1, :cond_4

    .line 180
    .line 181
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 182
    .line 183
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 184
    .line 185
    :cond_4
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 186
    .line 187
    if-gtz p1, :cond_5

    .line 188
    .line 189
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 190
    .line 191
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 192
    .line 193
    :cond_5
    iget-boolean p1, p0, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 194
    .line 195
    if-nez p1, :cond_8

    .line 196
    .line 197
    const-string p1, "AudioDecoderBySoft"

    .line 198
    .line 199
    const-string v0, "Do not use resample!"

    .line 200
    .line 201
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->d:I

    .line 205
    .line 206
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 207
    .line 208
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->f:I

    .line 209
    .line 210
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 211
    .line 212
    iget p1, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 213
    .line 214
    const/16 v0, 0x10

    .line 215
    .line 216
    if-eq p1, v0, :cond_7

    .line 217
    .line 218
    const/16 v0, 0x8

    .line 219
    .line 220
    if-ne p1, v0, :cond_6

    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_6
    const-string p1, "AudioDecoderBySoft"

    .line 224
    .line 225
    new-instance v0, Ljava/lang/StringBuilder;

    .line 226
    .line 227
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    iget v2, p0, Lcom/immomo/moment/mediautils/b;->e:I

    .line 231
    .line 232
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 233
    .line 234
    .line 235
    const-string v2, "->mDstSampleBits:"

    .line 236
    .line 237
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 238
    .line 239
    .line 240
    iget v2, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 241
    .line 242
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 243
    .line 244
    .line 245
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 250
    .line 251
    .line 252
    iput-boolean v6, p0, Lcom/immomo/moment/mediautils/b;->s:Z

    .line 253
    .line 254
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 255
    .line 256
    iget v0, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 257
    .line 258
    iget v2, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 259
    .line 260
    iget v3, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 261
    .line 262
    invoke-virtual {p1, v0, v2, v3}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->setOutAudioInfo(III)V

    .line 263
    .line 264
    .line 265
    goto :goto_2

    .line 266
    :cond_7
    :goto_1
    iput p1, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 267
    .line 268
    :cond_8
    :goto_2
    iget-object p1, p0, Lcom/immomo/moment/mediautils/b;->b:Lcom/immomo/moment/mediautils/b$a;

    .line 269
    .line 270
    if-eqz p1, :cond_9

    .line 271
    .line 272
    iget v0, p0, Lcom/immomo/moment/mediautils/b;->g:I

    .line 273
    .line 274
    iget v2, p0, Lcom/immomo/moment/mediautils/b;->i:I

    .line 275
    .line 276
    iget v3, p0, Lcom/immomo/moment/mediautils/b;->h:I

    .line 277
    .line 278
    invoke-interface {p1, v0, v2, v3}, Lcom/immomo/moment/mediautils/b$a;->a(III)V

    .line 279
    .line 280
    .line 281
    :cond_9
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 282
    .line 283
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->getVideoDuration()I

    .line 284
    .line 285
    .line 286
    move-result p1

    .line 287
    int-to-long v2, p1

    .line 288
    iput-wide v2, p0, Lcom/immomo/moment/mediautils/b;->j:J

    .line 289
    .line 290
    iget-wide v6, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 291
    .line 292
    cmp-long p1, v2, v6

    .line 293
    .line 294
    if-gez p1, :cond_a

    .line 295
    .line 296
    const-wide/16 v0, 0x0

    .line 297
    .line 298
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 299
    .line 300
    goto :goto_3

    .line 301
    :cond_a
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 302
    .line 303
    const-wide/16 v2, 0x3e8

    .line 304
    .line 305
    div-long/2addr v6, v2

    .line 306
    invoke-virtual {p1, v6, v7}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->seek(J)V

    .line 307
    .line 308
    .line 309
    const-string p1, "AudioDecoderBySoft"

    .line 310
    .line 311
    new-instance v0, Ljava/lang/StringBuilder;

    .line 312
    .line 313
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 314
    .line 315
    .line 316
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 317
    .line 318
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 319
    .line 320
    .line 321
    const-string v1, " mEndPosUs:"

    .line 322
    .line 323
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 324
    .line 325
    .line 326
    iget-wide v1, p0, Lcom/immomo/moment/mediautils/b;->o:J

    .line 327
    .line 328
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 329
    .line 330
    .line 331
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    :goto_3
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/b;->j:J

    .line 339
    .line 340
    iget-wide v2, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 341
    .line 342
    sub-long/2addr v0, v2

    .line 343
    iput-wide v0, p0, Lcom/immomo/moment/mediautils/b;->j:J

    .line 344
    .line 345
    iget-object p1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 346
    .line 347
    invoke-virtual {p1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->start()Z

    .line 348
    .line 349
    .line 350
    new-instance p1, Ljava/lang/Thread;

    .line 351
    .line 352
    iget-object v0, p0, Lcom/immomo/moment/mediautils/c;->B:Lcom/immomo/moment/mediautils/c$a;

    .line 353
    .line 354
    const-string v1, "getAMeidaTh"

    .line 355
    .line 356
    invoke-direct {p1, v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 357
    .line 358
    .line 359
    iput-object p1, p0, Lcom/immomo/moment/mediautils/c;->C:Ljava/lang/Thread;

    .line 360
    .line 361
    invoke-virtual {p1}, Ljava/lang/Thread;->start()V

    .line 362
    .line 363
    .line 364
    const-string p1, "AudioDecoderBySoft"

    .line 365
    .line 366
    const-string v0, "Prepare Complete  Success!!"

    .line 367
    .line 368
    invoke-static {p1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 369
    .line 370
    .line 371
    goto :goto_4

    .line 372
    :cond_b
    const-string v1, "AudioDecoderBySoft"

    .line 373
    .line 374
    const-string v2, "Prepare Complete Failed !!"

    .line 375
    .line 376
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 377
    .line 378
    .line 379
    iget-object v1, p0, Lcom/immomo/moment/mediautils/b;->c:Ll/jpw;

    .line 380
    .line 381
    if-eqz v1, :cond_c

    .line 382
    .line 383
    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object p1

    .line 387
    const/16 v0, -0x68

    .line 388
    .line 389
    invoke-interface {v1, v0, v0, p1}, Ll/jpw;->a(IILjava/lang/String;)V

    .line 390
    .line 391
    .line 392
    :cond_c
    :goto_4
    monitor-exit v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 393
    monitor-exit p0

    .line 394
    return v5

    .line 395
    :goto_5
    :try_start_4
    monitor-exit v4
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 396
    :try_start_5
    throw p1

    .line 397
    :goto_6
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 398
    throw p1
.end method

.method public declared-synchronized f(Z)V
    .locals 3

    .line 1
    const-string v0, "setDecoderCycleMode:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoderBySoft"

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
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    const-string v0, "mStartPosUs:"

    .line 2
    .line 3
    const-string v1, "startPtsMs = "

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    const-string v2, "AudioDecoderBySoft"

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
    const-string p1, "AudioDecoderBySoft"

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
    const-string p3, " mEndPos:"

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
    invoke-static {p1, p2}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V
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
    const-string v0, "dst sampleRate:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoderBySoft"

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
    const-string v0, " SampleChannels:"

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
    const-string v0, " SampleBits:"

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
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

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
    .locals 5

    .line 1
    const-string v0, " mStartPosUs:"

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    const-string v1, "AudioDecoderBySoft"

    .line 5
    .line 6
    const-string v2, "startDecoding !!!"

    .line 7
    .line 8
    invoke-static {v1, v2}, Lcom/cosmos/mdlog/MDLog;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-boolean v1, p0, Lcom/immomo/moment/mediautils/c;->F:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    const-string v1, "AudioDecoderBySoft"

    .line 16
    .line 17
    new-instance v2, Ljava/lang/StringBuilder;

    .line 18
    .line 19
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-wide v3, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 23
    .line 24
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v1, v0}, Lcom/cosmos/mdlog/MDLog;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-wide v0, p0, Lcom/immomo/moment/mediautils/b;->n:J

    .line 35
    .line 36
    invoke-direct {p0, v0, v1}, Lcom/immomo/moment/mediautils/c;->u(J)V

    .line 37
    .line 38
    .line 39
    invoke-direct {p0}, Lcom/immomo/moment/mediautils/c;->t()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :catchall_0
    move-exception v0

    .line 45
    goto :goto_2

    .line 46
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/immomo/moment/mediautils/b;->l:Ljava/lang/Object;

    .line 47
    .line 48
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    :try_start_2
    iget-object v1, p0, Lcom/immomo/moment/mediautils/c;->A:Lcom/immomo/moment/mediautils/FFVideoDecoder;

    .line 50
    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/FFVideoDecoder;->start()Z

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    iput-boolean v1, p0, Lcom/immomo/moment/mediautils/c;->F:Z

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :catchall_1
    move-exception v1

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    :goto_0
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 63
    const/4 v0, 0x0

    .line 64
    :try_start_3
    iput-boolean v0, p0, Lcom/immomo/moment/mediautils/c;->D:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 65
    .line 66
    monitor-exit p0

    .line 67
    return-void

    .line 68
    :goto_1
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 69
    :try_start_5
    throw v1

    .line 70
    :goto_2
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 71
    throw v0
.end method
