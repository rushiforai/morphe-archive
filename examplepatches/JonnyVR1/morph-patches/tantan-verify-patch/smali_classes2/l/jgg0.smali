.class public final Ll/jgg0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# static fields
.field public static final q:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field public final a:I

.field public final b:Ll/aug0;

.field public final c:Ll/bog0;

.field public final d:Ll/ixg0;

.field public final e:Ljava/util/ArrayList;

.field public final f:Ljava/util/ArrayList;

.field public g:I

.field public h:I

.field public i:J

.field public volatile j:Ll/rug0;

.field public k:J

.field public volatile l:Ljava/lang/Thread;

.field public final m:Ll/d0h0;

.field public final n:Ll/ehg0;

.field public final o:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public final p:Ll/qfg0;


# direct methods
.method static constructor <clinit>()V
    .locals 8

    .line 1
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    .line 2
    .line 3
    new-instance v6, Ljava/util/concurrent/SynchronousQueue;

    .line 4
    .line 5
    invoke-direct {v6}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    .line 6
    .line 7
    .line 8
    new-instance v7, Ll/vng0;

    .line 9
    .line 10
    const-string v1, "OkDownload Cancel Block"

    .line 11
    .line 12
    invoke-direct {v7, v1}, Ll/vng0;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const v2, 0x7fffffff

    .line 16
    .line 17
    .line 18
    const-wide/16 v3, 0x3c

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 22
    .line 23
    invoke-direct/range {v0 .. v7}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    .line 24
    .line 25
    .line 26
    sput-object v0, Ll/jgg0;->q:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(ILl/aug0;Ll/bog0;Ll/ixg0;Ll/ehg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayList;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Ll/jgg0;->g:I

    .line 20
    .line 21
    iput v0, p0, Ll/jgg0;->h:I

    .line 22
    .line 23
    new-instance v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 24
    .line 25
    invoke-direct {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 29
    .line 30
    new-instance v0, Ll/qfg0;

    .line 31
    .line 32
    invoke-direct {v0, p0}, Ll/qfg0;-><init>(Ll/jgg0;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Ll/jgg0;->p:Ll/qfg0;

    .line 36
    .line 37
    iput p1, p0, Ll/jgg0;->a:I

    .line 38
    .line 39
    iput-object p2, p0, Ll/jgg0;->b:Ll/aug0;

    .line 40
    .line 41
    iput-object p4, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 42
    .line 43
    iput-object p3, p0, Ll/jgg0;->c:Ll/bog0;

    .line 44
    .line 45
    iput-object p5, p0, Ll/jgg0;->n:Ll/ehg0;

    .line 46
    .line 47
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iget-object p1, p1, Ll/jwg0;->b:Ll/d0h0;

    .line 52
    .line 53
    iput-object p1, p0, Ll/jgg0;->m:Ll/d0h0;

    .line 54
    .line 55
    return-void
.end method


# virtual methods
.method public final declared-synchronized a()Ll/csg0;
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 3
    .line 4
    invoke-virtual {v0}, Ll/ixg0;->c()Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-nez v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    iget-object v0, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 15
    .line 16
    iget-object v0, v0, Ll/ixg0;->a:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    iget-object v0, p0, Ll/jgg0;->c:Ll/bog0;

    .line 22
    .line 23
    iget-object v0, v0, Ll/bog0;->b:Ljava/lang/String;

    .line 24
    .line 25
    :goto_0
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    iget-object v1, v1, Ll/jwg0;->d:Ll/pog0;

    .line 30
    .line 31
    invoke-virtual {v1, v0}, Ll/pog0;->a(Ljava/lang/String;)Ll/rug0;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iput-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 36
    .line 37
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;

    .line 38
    .line 39
    iget-object v1, p0, Ll/jgg0;->b:Ll/aug0;

    .line 40
    .line 41
    iget-object v1, v1, Ll/aug0;->x:Ljava/util/Map;

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Ll/rug0;->b(Ljava/util/Map;)V

    .line 44
    .line 45
    .line 46
    goto :goto_1

    .line 47
    :catchall_0
    move-exception v0

    .line 48
    goto :goto_2

    .line 49
    :cond_1
    :goto_1
    iget-object v0, p0, Ll/jgg0;->j:Ll/rug0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    .line 51
    monitor-exit p0

    .line 52
    return-object v0

    .line 53
    :cond_2
    :try_start_1
    sget-object v0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 54
    .line 55
    throw v0

    .line 56
    :goto_2
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw v0
.end method

.method public final b()J
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ixg0;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget v1, p0, Ll/jgg0;->h:I

    .line 12
    .line 13
    add-int/lit8 v2, v1, 0x1

    .line 14
    .line 15
    iput v2, p0, Ll/jgg0;->h:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/ztg0;

    .line 22
    .line 23
    invoke-interface {v0, p0}, Ll/ztg0;->a(Ll/jgg0;)J

    .line 24
    .line 25
    .line 26
    move-result-wide v0

    .line 27
    return-wide v0

    .line 28
    :cond_0
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 29
    .line 30
    throw p0
.end method

.method public final c()Ll/vkg0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ixg0;->c()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 10
    .line 11
    iget v1, p0, Ll/jgg0;->g:I

    .line 12
    .line 13
    add-int/lit8 v2, v1, 0x1

    .line 14
    .line 15
    iput v2, p0, Ll/jgg0;->g:I

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    check-cast v0, Ll/wng0;

    .line 22
    .line 23
    invoke-interface {v0, p0}, Ll/wng0;->b(Ll/jgg0;)Ll/vkg0;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0

    .line 28
    :cond_0
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 29
    .line 30
    throw p0
.end method

.method public final d()V
    .locals 11

    .line 1
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Ll/jwg0;->b:Ll/d0h0;

    .line 6
    .line 7
    new-instance v1, Ll/iwg0;

    .line 8
    .line 9
    invoke-direct {v1}, Ll/iwg0;-><init>()V

    .line 10
    .line 11
    .line 12
    new-instance v2, Ll/ujg0;

    .line 13
    .line 14
    invoke-direct {v2}, Ll/ujg0;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v3, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-virtual {v3, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-object v3, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 23
    .line 24
    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 25
    .line 26
    .line 27
    iget-object v3, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 28
    .line 29
    new-instance v4, Ll/nrg0;

    .line 30
    .line 31
    invoke-direct {v4}, Ll/nrg0;-><init>()V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    iget-object v3, p0, Ll/jgg0;->e:Ljava/util/ArrayList;

    .line 38
    .line 39
    new-instance v4, Ll/ckg0;

    .line 40
    .line 41
    invoke-direct {v4}, Ll/ckg0;-><init>()V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    const/4 v3, 0x0

    .line 48
    iput v3, p0, Ll/jgg0;->g:I

    .line 49
    .line 50
    invoke-virtual {p0}, Ll/jgg0;->c()Ll/vkg0;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    iget-object v5, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 55
    .line 56
    invoke-virtual {v5}, Ll/ixg0;->c()Z

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    if-nez v5, :cond_4

    .line 61
    .line 62
    iget-object v5, v0, Ll/d0h0;->a:Ll/oyg0;

    .line 63
    .line 64
    iget-object v6, p0, Ll/jgg0;->b:Ll/aug0;

    .line 65
    .line 66
    iget v7, p0, Ll/jgg0;->a:I

    .line 67
    .line 68
    iget-wide v8, p0, Ll/jgg0;->i:J

    .line 69
    .line 70
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    .line 72
    .line 73
    iget v10, v6, Ll/aug0;->b:I

    .line 74
    .line 75
    iget-boolean v10, v6, Ll/aug0;->n:Z

    .line 76
    .line 77
    if-eqz v10, :cond_0

    .line 78
    .line 79
    iget-object v5, v5, Ll/oyg0;->a:Landroid/os/Handler;

    .line 80
    .line 81
    new-instance v10, Ll/ppg0;

    .line 82
    .line 83
    invoke-direct {v10, v6, v7, v8, v9}, Ll/ppg0;-><init>(Ll/aug0;IJ)V

    .line 84
    .line 85
    .line 86
    invoke-virtual {v5, v10}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 87
    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_0
    iget-object v5, v6, Ll/aug0;->p:Ll/eog0;

    .line 91
    .line 92
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    .line 94
    .line 95
    :goto_0
    new-instance v5, Ll/frg0;

    .line 96
    .line 97
    iget v6, p0, Ll/jgg0;->a:I

    .line 98
    .line 99
    check-cast v4, Ll/rug0;

    .line 100
    .line 101
    iget-object v4, v4, Ll/rug0;->d:Ll/i5d0;

    .line 102
    .line 103
    if-eqz v4, :cond_3

    .line 104
    .line 105
    invoke-virtual {v4}, Ll/i5d0;->k()Ll/k5d0;

    .line 106
    .line 107
    .line 108
    move-result-object v4

    .line 109
    if-eqz v4, :cond_2

    .line 110
    .line 111
    invoke-virtual {v4}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 112
    .line 113
    .line 114
    move-result-object v4

    .line 115
    iget-object v7, p0, Ll/jgg0;->d:Ll/ixg0;

    .line 116
    .line 117
    invoke-virtual {v7}, Ll/ixg0;->a()Ll/vfg0;

    .line 118
    .line 119
    .line 120
    move-result-object v7

    .line 121
    iget-object v8, p0, Ll/jgg0;->b:Ll/aug0;

    .line 122
    .line 123
    invoke-direct {v5, v6, v4, v7, v8}, Ll/frg0;-><init>(ILjava/io/InputStream;Ll/vfg0;Ll/aug0;)V

    .line 124
    .line 125
    .line 126
    iget-object v4, p0, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 127
    .line 128
    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    iget-object v1, p0, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 134
    .line 135
    .line 136
    iget-object v1, p0, Ll/jgg0;->f:Ljava/util/ArrayList;

    .line 137
    .line 138
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    iput v3, p0, Ll/jgg0;->h:I

    .line 142
    .line 143
    invoke-virtual {p0}, Ll/jgg0;->b()J

    .line 144
    .line 145
    .line 146
    move-result-wide v1

    .line 147
    iget-object v0, v0, Ll/d0h0;->a:Ll/oyg0;

    .line 148
    .line 149
    iget-object v3, p0, Ll/jgg0;->b:Ll/aug0;

    .line 150
    .line 151
    iget p0, p0, Ll/jgg0;->a:I

    .line 152
    .line 153
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 154
    .line 155
    .line 156
    iget v4, v3, Ll/aug0;->b:I

    .line 157
    .line 158
    iget-boolean v4, v3, Ll/aug0;->n:Z

    .line 159
    .line 160
    if-eqz v4, :cond_1

    .line 161
    .line 162
    iget-object v0, v0, Ll/oyg0;->a:Landroid/os/Handler;

    .line 163
    .line 164
    new-instance v4, Ll/qqg0;

    .line 165
    .line 166
    invoke-direct {v4, v3, p0, v1, v2}, Ll/qqg0;-><init>(Ll/aug0;IJ)V

    .line 167
    .line 168
    .line 169
    invoke-virtual {v0, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :cond_1
    iget-object v0, v3, Ll/aug0;->p:Ll/eog0;

    .line 174
    .line 175
    invoke-virtual {v0, v3, p0, v1, v2}, Ll/rkg0;->e(Ll/aug0;IJ)V

    .line 176
    .line 177
    .line 178
    return-void

    .line 179
    :cond_2
    const-string p0, "no body found on response!"

    .line 180
    .line 181
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 182
    .line 183
    .line 184
    return-void

    .line 185
    :cond_3
    const-string p0, "Please invoke execute first!"

    .line 186
    .line 187
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 188
    .line 189
    .line 190
    return-void

    .line 191
    :cond_4
    sget-object p0, LSudchar/Sudfor;->Suddo:LSudchar/Sudfor;

    .line 192
    .line 193
    throw p0
.end method

.method public final run()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Ll/jgg0;->l:Ljava/lang/Thread;

    .line 14
    .line 15
    const/4 v0, 0x1

    .line 16
    :try_start_0
    invoke-virtual {p0}, Ll/jgg0;->d()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object v1, p0, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 22
    .line 23
    .line 24
    sget-object v0, Ll/jgg0;->q:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 25
    .line 26
    iget-object p0, p0, Ll/jgg0;->p:Ll/qfg0;

    .line 27
    .line 28
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v1

    .line 33
    iget-object v2, p0, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 34
    .line 35
    invoke-virtual {v2, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 36
    .line 37
    .line 38
    sget-object v0, Ll/jgg0;->q:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 39
    .line 40
    iget-object p0, p0, Ll/jgg0;->p:Ll/qfg0;

    .line 41
    .line 42
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 43
    .line 44
    .line 45
    throw v1

    .line 46
    :catch_0
    iget-object v1, p0, Ll/jgg0;->o:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 47
    .line 48
    invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    .line 49
    .line 50
    .line 51
    sget-object v0, Ll/jgg0;->q:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 52
    .line 53
    iget-object p0, p0, Ll/jgg0;->p:Ll/qfg0;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :cond_0
    new-instance p0, Ljava/lang/IllegalAccessError;

    .line 60
    .line 61
    const-string v0, "The chain has been finished!"

    .line 62
    .line 63
    invoke-direct {p0, v0}, Ljava/lang/IllegalAccessError;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    throw p0
.end method
