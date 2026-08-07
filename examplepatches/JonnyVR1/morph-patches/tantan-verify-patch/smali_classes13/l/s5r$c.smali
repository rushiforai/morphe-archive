.class Ll/s5r$c;
.super Ljava/lang/Thread;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/s5r;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "c"
.end annotation


# instance fields
.field private a:Z

.field private b:Z

.field private c:Z

.field private d:Z

.field private e:J

.field private f:Ljava/util/concurrent/locks/Lock;

.field private g:Ljava/util/concurrent/locks/Condition;

.field private h:I

.field private i:Z

.field private j:Z

.field final synthetic k:Ll/s5r;


# direct methods
.method public constructor <init>(Ll/s5r;)V
    .locals 2

    .line 1
    iput-object p1, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Thread;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-boolean p1, p0, Ll/s5r$c;->a:Z

    .line 8
    .line 9
    iput-boolean p1, p0, Ll/s5r$c;->b:Z

    .line 10
    .line 11
    iput-boolean p1, p0, Ll/s5r$c;->c:Z

    .line 12
    .line 13
    iput-boolean p1, p0, Ll/s5r$c;->d:Z

    .line 14
    .line 15
    const-wide/16 v0, -0x1

    .line 16
    .line 17
    iput-wide v0, p0, Ll/s5r$c;->e:J

    .line 18
    .line 19
    new-instance v0, Ljava/util/concurrent/locks/ReentrantLock;

    .line 20
    .line 21
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantLock;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 25
    .line 26
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iput-object v0, p0, Ll/s5r$c;->g:Ljava/util/concurrent/locks/Condition;

    .line 31
    .line 32
    iput p1, p0, Ll/s5r$c;->h:I

    .line 33
    .line 34
    iput-boolean p1, p0, Ll/s5r$c;->i:Z

    .line 35
    .line 36
    iput-boolean p1, p0, Ll/s5r$c;->j:Z

    .line 37
    .line 38
    const-string p1, "HUOHL_KtvPlayer_MusicPlay"

    .line 39
    .line 40
    invoke-virtual {p0, p1}, Ljava/lang/Thread;->setName(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/lang/Thread;->start()V

    .line 44
    .line 45
    .line 46
    return-void
.end method


# virtual methods
.method public a()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/s5r$c;->b:Z

    .line 3
    .line 4
    iput-boolean v0, p0, Ll/s5r$c;->a:Z

    .line 5
    .line 6
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Ll/s5r$c;->g:Ljava/util/concurrent/locks/Condition;

    .line 12
    .line 13
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 22
    .line 23
    const-string v0, "===== \u4f34\u594f\u64ad\u653e \u9000\u51fa"

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public b(Z)V
    .locals 4

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 4
    .line 5
    const-string v1, "===== \u4f34\u594f\u64ad\u653e \u6682\u505c"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-wide v0, p0, Ll/s5r$c;->e:J

    .line 12
    .line 13
    const-wide/16 v2, 0x0

    .line 14
    .line 15
    cmp-long v0, v0, v2

    .line 16
    .line 17
    if-lez v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 20
    .line 21
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    const-string v2, "===== \u4f34\u594f\u7ee7\u7eed\u64ad\u653e, \u4f34\u594f\u6587\u4ef6\u6062\u590d\u5230\u4f4d\u7f6e\uff1a"

    .line 24
    .line 25
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-wide v2, p0, Ll/s5r$c;->e:J

    .line 29
    .line 30
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v0, v1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-wide/16 v0, -0x1

    .line 41
    .line 42
    iput-wide v0, p0, Ll/s5r$c;->e:J

    .line 43
    .line 44
    :cond_1
    :goto_0
    iput-boolean p1, p0, Ll/s5r$c;->c:Z

    .line 45
    .line 46
    xor-int/lit8 p1, p1, 0x1

    .line 47
    .line 48
    iput-boolean p1, p0, Ll/s5r$c;->d:Z

    .line 49
    .line 50
    return-void
.end method

.method public c(I)V
    .locals 4

    .line 1
    :catch_0
    :goto_0
    :try_start_0
    iget-boolean v0, p0, Ll/s5r$c;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0xa

    .line 6
    .line 7
    invoke-static {v0, v1}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    const/16 p1, 0x1d

    .line 20
    .line 21
    invoke-interface {v0, p0, p1, v1}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 28
    .line 29
    .line 30
    iput p1, p0, Ll/s5r$c;->h:I

    .line 31
    .line 32
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 33
    .line 34
    int-to-long v2, p1

    .line 35
    invoke-static {v0, v2, v3}, Ll/s5r;->r(Ll/s5r;J)J

    .line 36
    .line 37
    .line 38
    iput-boolean v1, p0, Ll/s5r$c;->b:Z

    .line 39
    .line 40
    iput-boolean v1, p0, Ll/s5r$c;->c:Z

    .line 41
    .line 42
    iget-object v0, p0, Ll/s5r$c;->g:Ljava/util/concurrent/locks/Condition;

    .line 43
    .line 44
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 48
    .line 49
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 53
    .line 54
    new-instance v0, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string v1, "===== \u5f00\u59cb\u4f34\u594f\u64ad\u653e, \u5f00\u59cb\u65f6\u95f4\uff1a"

    .line 57
    .line 58
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Ll/s5r$c;->b:Z

    .line 8
    .line 9
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 10
    .line 11
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 12
    .line 13
    .line 14
    iget-object p0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 15
    .line 16
    const-string v0, "===== \u4f34\u594f\u64ad\u653e \u505c\u6b62"

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    const-string p0, "HUOHL_KtvPlayer"

    .line 22
    .line 23
    const-string v0, "not playMusic at now"

    .line 24
    .line 25
    invoke-static {p0, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public run()V
    .locals 12

    .line 1
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 2
    .line 3
    invoke-static {v0}, Ll/s5r;->s(Ll/s5r;)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    mul-int/lit8 v0, v0, 0x4

    .line 8
    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    :cond_0
    :goto_0
    iget-boolean v0, p0, Ll/s5r$c;->a:Z

    .line 12
    .line 13
    const/16 v1, 0x14

    .line 14
    .line 15
    const-string v2, "HUOHL_KtvPlayer"

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    const/4 v4, 0x0

    .line 19
    if-nez v0, :cond_f

    .line 20
    .line 21
    invoke-static {}, Ll/s5r;->t()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    const-wide/16 v5, 0x64

    .line 26
    .line 27
    const/4 v7, 0x1

    .line 28
    if-nez v0, :cond_3

    .line 29
    .line 30
    invoke-static {}, Ll/s5r;->g()Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 37
    .line 38
    if-eqz v0, :cond_1

    .line 39
    .line 40
    const/16 v8, 0xe

    .line 41
    .line 42
    invoke-interface {v0, v3, v8, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 43
    .line 44
    .line 45
    :cond_1
    invoke-static {v7}, Ll/s5r;->u(Z)Z

    .line 46
    .line 47
    .line 48
    goto :goto_1

    .line 49
    :cond_2
    :try_start_0
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 50
    .line 51
    .line 52
    goto :goto_0

    .line 53
    :catch_0
    :cond_3
    :goto_1
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 54
    .line 55
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 56
    .line 57
    .line 58
    :try_start_1
    iput-boolean v7, p0, Ll/s5r$c;->j:Z

    .line 59
    .line 60
    const-string v0, "***********\u4f34\u594f\u64ad\u653e:wait playMusic task***************"

    .line 61
    .line 62
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 63
    .line 64
    .line 65
    iget-object v0, p0, Ll/s5r$c;->g:Ljava/util/concurrent/locks/Condition;

    .line 66
    .line 67
    invoke-interface {v0}, Ljava/util/concurrent/locks/Condition;->await()V

    .line 68
    .line 69
    .line 70
    const-string v0, "***********\u4f34\u594f\u64ad\u653e:wait Signal*******************"

    .line 71
    .line 72
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 73
    .line 74
    .line 75
    :catch_1
    iget-object v0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 76
    .line 77
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :catchall_0
    move-exception v0

    .line 82
    iget-object p0, p0, Ll/s5r$c;->f:Ljava/util/concurrent/locks/Lock;

    .line 83
    .line 84
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 85
    .line 86
    .line 87
    throw v0

    .line 88
    :goto_2
    const-string v0, "==============\u4f34\u594f\u64ad\u653e: PlayJob PlayStart================"

    .line 89
    .line 90
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 91
    .line 92
    .line 93
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 94
    .line 95
    if-eqz v0, :cond_4

    .line 96
    .line 97
    const/16 v8, 0xb

    .line 98
    .line 99
    invoke-interface {v0, v3, v8, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 100
    .line 101
    .line 102
    :cond_4
    iput-boolean v7, p0, Ll/s5r$c;->d:Z

    .line 103
    .line 104
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 105
    .line 106
    const-wide/16 v7, 0x0

    .line 107
    .line 108
    invoke-static {v0, v7, v8}, Ll/s5r;->w(Ll/s5r;J)J

    .line 109
    .line 110
    .line 111
    :catch_2
    :cond_5
    :goto_3
    iget-boolean v0, p0, Ll/s5r$c;->b:Z

    .line 112
    .line 113
    if-eqz v0, :cond_7

    .line 114
    .line 115
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 116
    .line 117
    invoke-static {v0}, Ll/s5r;->y(Ll/s5r;)Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    if-eqz v0, :cond_6

    .line 122
    .line 123
    const-string v0, "===============\u4f34\u594f\u64ad\u653e: StopPlay ==============="

    .line 124
    .line 125
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    :cond_6
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 129
    .line 130
    if-eqz v0, :cond_d

    .line 131
    .line 132
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 133
    .line 134
    invoke-static {v0}, Ll/s5r;->v(Ll/s5r;)J

    .line 135
    .line 136
    .line 137
    move-result-wide v1

    .line 138
    invoke-virtual {v0, v1, v2}, Ll/s5r;->E(J)J

    .line 139
    .line 140
    .line 141
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 142
    .line 143
    const/16 v1, 0x12

    .line 144
    .line 145
    invoke-interface {v0, v3, v1, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 146
    .line 147
    .line 148
    goto/16 :goto_5

    .line 149
    .line 150
    :cond_7
    iget-boolean v0, p0, Ll/s5r$c;->c:Z

    .line 151
    .line 152
    if-eqz v0, :cond_9

    .line 153
    .line 154
    :try_start_2
    iget-wide v9, p0, Ll/s5r$c;->e:J

    .line 155
    .line 156
    cmp-long v0, v9, v7

    .line 157
    .line 158
    if-gez v0, :cond_8

    .line 159
    .line 160
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 161
    .line 162
    iget-object v0, v0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 163
    .line 164
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFilePointer()J

    .line 165
    .line 166
    .line 167
    move-result-wide v9

    .line 168
    iput-wide v9, p0, Ll/s5r$c;->e:J

    .line 169
    .line 170
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 171
    .line 172
    new-instance v9, Ljava/lang/StringBuilder;

    .line 173
    .line 174
    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 175
    .line 176
    .line 177
    const-string v10, "===== \u4f34\u594f\u6682\u505c\u64ad\u653e\uff0c\u5f53\u524d\u64ad\u653e\u4f4d\u7f6e\uff1a"

    .line 178
    .line 179
    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    .line 181
    .line 182
    iget-wide v10, p0, Ll/s5r$c;->e:J

    .line 183
    .line 184
    invoke-virtual {v9, v10, v11}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v9

    .line 191
    invoke-virtual {v0, v9}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 192
    .line 193
    .line 194
    :cond_8
    invoke-static {v5, v6}, Ljava/lang/Thread;->sleep(J)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 195
    .line 196
    .line 197
    goto :goto_3

    .line 198
    :cond_9
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 199
    .line 200
    iget-object v0, v0, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 201
    .line 202
    if-nez v0, :cond_b

    .line 203
    .line 204
    :try_start_3
    invoke-static {}, Ll/s5r;->g()Z

    .line 205
    .line 206
    .line 207
    move-result v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 208
    iget-object v9, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 209
    .line 210
    if-eqz v0, :cond_a

    .line 211
    .line 212
    :try_start_4
    new-instance v0, Ljava/io/RandomAccessFile;

    .line 213
    .line 214
    new-instance v10, Ljava/io/File;

    .line 215
    .line 216
    invoke-static {}, Ll/s5r;->z()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v11

    .line 220
    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 221
    .line 222
    .line 223
    const-string v11, "r"

    .line 224
    .line 225
    invoke-direct {v0, v10, v11}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iput-object v0, v9, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 229
    .line 230
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 231
    .line 232
    const-string v9, "======\u6253\u5f00PCM\u6587\u4ef6 \u5f00\u59cb\u8bfb\u53d6\u3002\u3002\u3002\u3002"

    .line 233
    .line 234
    invoke-virtual {v0, v9}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    goto :goto_4

    .line 238
    :cond_a
    new-instance v0, Ljava/lang/StringBuilder;

    .line 239
    .line 240
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 241
    .line 242
    .line 243
    const-string v10, "======\u89e3\u7801\u672a\u5f00\u59cb, PCM \u6587\u4ef6\u4e0d\u5b58\u5728, "

    .line 244
    .line 245
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    invoke-static {}, Ll/s5r;->z()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v10

    .line 252
    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 253
    .line 254
    .line 255
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-virtual {v9, v0}, Ll/s5r;->J(Ljava/lang/String;)V

    .line 260
    .line 261
    .line 262
    const-wide/16 v9, 0x1f4

    .line 263
    .line 264
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_3

    .line 265
    .line 266
    .line 267
    goto/16 :goto_3

    .line 268
    .line 269
    :catch_3
    :cond_b
    :goto_4
    iget v0, p0, Ll/s5r$c;->h:I

    .line 270
    .line 271
    if-lez v0, :cond_c

    .line 272
    .line 273
    :try_start_5
    iget-object v9, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 274
    .line 275
    iget-object v10, v9, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 276
    .line 277
    if-eqz v10, :cond_c

    .line 278
    .line 279
    int-to-long v10, v0

    .line 280
    invoke-virtual {v9, v10, v11}, Ll/s5r;->I(J)J

    .line 281
    .line 282
    .line 283
    move-result-wide v9

    .line 284
    long-to-int v0, v9

    .line 285
    iget-object v9, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 286
    .line 287
    iget-object v9, v9, Ll/s5r;->a:Ljava/io/RandomAccessFile;

    .line 288
    .line 289
    int-to-long v10, v0

    .line 290
    invoke-virtual {v9, v10, v11}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 291
    .line 292
    .line 293
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 294
    .line 295
    invoke-static {v0, v10, v11}, Ll/s5r;->w(Ll/s5r;J)J

    .line 296
    .line 297
    .line 298
    iput v4, p0, Ll/s5r$c;->h:I
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 299
    .line 300
    :cond_c
    :try_start_6
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 301
    .line 302
    invoke-static {v0}, Ll/s5r;->h(Ll/s5r;)Ljava/util/concurrent/LinkedBlockingQueue;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->size()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    if-ge v0, v1, :cond_e

    .line 311
    .line 312
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 313
    .line 314
    invoke-virtual {v0}, Ll/s5r;->O()I

    .line 315
    .line 316
    .line 317
    move-result v0
    :try_end_6
    .catch Ljava/lang/InterruptedException; {:try_start_6 .. :try_end_6} :catch_2

    .line 318
    if-gez v0, :cond_5

    .line 319
    .line 320
    :cond_d
    :goto_5
    iput-boolean v4, p0, Ll/s5r$c;->c:Z

    .line 321
    .line 322
    iput-boolean v4, p0, Ll/s5r$c;->d:Z

    .line 323
    .line 324
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 325
    .line 326
    invoke-static {v0, v7, v8}, Ll/s5r;->r(Ll/s5r;J)J

    .line 327
    .line 328
    .line 329
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 330
    .line 331
    if-eqz v0, :cond_0

    .line 332
    .line 333
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 334
    .line 335
    invoke-static {v0}, Ll/s5r;->v(Ll/s5r;)J

    .line 336
    .line 337
    .line 338
    move-result-wide v0

    .line 339
    cmp-long v0, v0, v7

    .line 340
    .line 341
    if-lez v0, :cond_0

    .line 342
    .line 343
    iget-boolean v0, p0, Ll/s5r$c;->b:Z

    .line 344
    .line 345
    if-nez v0, :cond_0

    .line 346
    .line 347
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 348
    .line 349
    invoke-static {v0}, Ll/s5r;->v(Ll/s5r;)J

    .line 350
    .line 351
    .line 352
    move-result-wide v1

    .line 353
    invoke-virtual {v0, v1, v2}, Ll/s5r;->E(J)J

    .line 354
    .line 355
    .line 356
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 357
    .line 358
    const/16 v1, 0x13

    .line 359
    .line 360
    invoke-interface {v0, v3, v1, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 361
    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :cond_e
    const-wide/16 v9, 0xa

    .line 366
    .line 367
    :try_start_7
    invoke-static {v9, v10}, Ljava/lang/Thread;->sleep(J)V
    :try_end_7
    .catch Ljava/lang/InterruptedException; {:try_start_7 .. :try_end_7} :catch_2

    .line 368
    .line 369
    .line 370
    goto/16 :goto_3

    .line 371
    .line 372
    :cond_f
    iget-object v0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 373
    .line 374
    invoke-static {v0}, Ll/s5r;->y(Ll/s5r;)Z

    .line 375
    .line 376
    .line 377
    move-result v0

    .line 378
    if-eqz v0, :cond_10

    .line 379
    .line 380
    const-string v0, "==================\u4f34\u594f\u64ad\u653e: Exit=================="

    .line 381
    .line 382
    invoke-static {v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 383
    .line 384
    .line 385
    :cond_10
    sget-object v0, Ll/s5r;->y:Ll/gb1;

    .line 386
    .line 387
    if-eqz v0, :cond_11

    .line 388
    .line 389
    iget-object p0, p0, Ll/s5r$c;->k:Ll/s5r;

    .line 390
    .line 391
    invoke-static {p0}, Ll/s5r;->v(Ll/s5r;)J

    .line 392
    .line 393
    .line 394
    move-result-wide v5

    .line 395
    invoke-virtual {p0, v5, v6}, Ll/s5r;->E(J)J

    .line 396
    .line 397
    .line 398
    sget-object p0, Ll/s5r;->y:Ll/gb1;

    .line 399
    .line 400
    invoke-interface {p0, v3, v1, v4}, Ll/gb1;->a(Ljava/lang/Object;II)V

    .line 401
    .line 402
    .line 403
    :cond_11
    return-void
.end method
