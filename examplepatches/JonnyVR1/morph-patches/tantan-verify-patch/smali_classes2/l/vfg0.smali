.class public final Ll/vfg0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final y:Ljava/util/concurrent/ThreadPoolExecutor;


# instance fields
.field public final a:Landroid/util/SparseArray;

.field public final b:Landroid/util/SparseArray;

.field public final c:Ljava/util/concurrent/atomic/AtomicLong;

.field public final d:Ljava/util/concurrent/atomic/AtomicLong;

.field public e:Z

.field public final f:I

.field public final g:I

.field public final h:I

.field public final i:Ll/bog0;

.field public final j:Ll/aug0;

.field public final k:Ll/ehg0;

.field public final l:Z

.field public final m:Z

.field public volatile n:Ljava/util/concurrent/Future;

.field public volatile o:Ljava/lang/Thread;

.field public final p:Landroid/util/SparseArray;

.field public final q:Ll/fwg0;

.field public r:Ljava/lang/String;

.field public s:Ljava/io/IOException;

.field public final t:Ljava/util/ArrayList;

.field public u:Ljava/util/ArrayList;

.field public final v:Ll/veg0;

.field public final w:Ll/veg0;

.field public volatile x:Z


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
    const-string v1, "OkDownload file io"

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
    sput-object v0, Ll/vfg0;->y:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Ll/aug0;Ll/bog0;Ll/ehg0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 10
    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 17
    .line 18
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object v0, p0, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 24
    .line 25
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 26
    .line 27
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Ll/vfg0;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 31
    .line 32
    const/4 v0, 0x0

    .line 33
    iput-boolean v0, p0, Ll/vfg0;->e:Z

    .line 34
    .line 35
    new-instance v0, Landroid/util/SparseArray;

    .line 36
    .line 37
    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v0, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 41
    .line 42
    new-instance v0, Ll/veg0;

    .line 43
    .line 44
    invoke-direct {v0}, Ll/veg0;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Ll/vfg0;->v:Ll/veg0;

    .line 48
    .line 49
    new-instance v0, Ll/veg0;

    .line 50
    .line 51
    invoke-direct {v0}, Ll/veg0;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object v0, p0, Ll/vfg0;->w:Ll/veg0;

    .line 55
    .line 56
    const/4 v0, 0x1

    .line 57
    iput-boolean v0, p0, Ll/vfg0;->x:Z

    .line 58
    .line 59
    iput-object p1, p0, Ll/vfg0;->j:Ll/aug0;

    .line 60
    .line 61
    iget v1, p1, Ll/aug0;->i:I

    .line 62
    .line 63
    iput v1, p0, Ll/vfg0;->f:I

    .line 64
    .line 65
    iget v1, p1, Ll/aug0;->j:I

    .line 66
    .line 67
    iput v1, p0, Ll/vfg0;->g:I

    .line 68
    .line 69
    iget v1, p1, Ll/aug0;->k:I

    .line 70
    .line 71
    iput v1, p0, Ll/vfg0;->h:I

    .line 72
    .line 73
    iput-object p2, p0, Ll/vfg0;->i:Ll/bog0;

    .line 74
    .line 75
    iput-object p3, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 76
    .line 77
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 78
    .line 79
    .line 80
    move-result-object p2

    .line 81
    iget-object p2, p2, Ll/jwg0;->e:Ll/zqg0;

    .line 82
    .line 83
    iput-boolean v0, p0, Ll/vfg0;->l:Z

    .line 84
    .line 85
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 86
    .line 87
    .line 88
    move-result-object p2

    .line 89
    iget-object p2, p2, Ll/jwg0;->f:Ll/qhg0;

    .line 90
    .line 91
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 92
    .line 93
    .line 94
    move-result-object p2

    .line 95
    iget-object p2, p2, Ll/jwg0;->e:Ll/zqg0;

    .line 96
    .line 97
    iput-boolean v0, p0, Ll/vfg0;->m:Z

    .line 98
    .line 99
    new-instance p2, Ljava/util/ArrayList;

    .line 100
    .line 101
    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    .line 102
    .line 103
    .line 104
    iput-object p2, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 105
    .line 106
    new-instance p2, Ll/fwg0;

    .line 107
    .line 108
    invoke-direct {p2, p0}, Ll/fwg0;-><init>(Ll/vfg0;)V

    .line 109
    .line 110
    .line 111
    iput-object p2, p0, Ll/vfg0;->q:Ll/fwg0;

    .line 112
    .line 113
    invoke-virtual {p1}, Ll/aug0;->j()Ljava/io/File;

    .line 114
    .line 115
    .line 116
    move-result-object p1

    .line 117
    if-eqz p1, :cond_0

    .line 118
    .line 119
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Ll/vfg0;->r:Ljava/lang/String;

    .line 124
    .line 125
    :cond_0
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10

    .line 1
    iget-object v0, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 5
    .line 6
    invoke-virtual {v1}, Landroid/util/SparseArray;->size()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    new-instance v0, Landroid/util/SparseArray;

    .line 12
    .line 13
    invoke-direct {v0, v1}, Landroid/util/SparseArray;-><init>(I)V

    .line 14
    .line 15
    .line 16
    const/4 v2, 0x0

    .line 17
    move v3, v2

    .line 18
    :goto_0
    const-wide/16 v4, 0x0

    .line 19
    .line 20
    if-ge v3, v1, :cond_1

    .line 21
    .line 22
    :try_start_1
    iget-object v6, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 23
    .line 24
    invoke-virtual {v6, v3}, Landroid/util/SparseArray;->keyAt(I)I

    .line 25
    .line 26
    .line 27
    move-result v6

    .line 28
    iget-object v7, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 29
    .line 30
    invoke-virtual {v7, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v7

    .line 34
    check-cast v7, Ljava/util/concurrent/atomic/AtomicLong;

    .line 35
    .line 36
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 37
    .line 38
    .line 39
    move-result-wide v7

    .line 40
    cmp-long v4, v7, v4

    .line 41
    .line 42
    if-lez v4, :cond_0

    .line 43
    .line 44
    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 45
    .line 46
    .line 47
    move-result-object v4

    .line 48
    invoke-virtual {v0, v6, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    iget-object v4, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 52
    .line 53
    invoke-virtual {v4, v6}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    check-cast v4, Ll/ojg0;

    .line 58
    .line 59
    check-cast v4, Ll/qng0;

    .line 60
    .line 61
    iget-object v5, v4, Ll/qng0;->c:Ljava/io/BufferedOutputStream;

    .line 62
    .line 63
    invoke-virtual {v5}, Ljava/io/BufferedOutputStream;->flush()V

    .line 64
    .line 65
    .line 66
    iget-object v4, v4, Ll/qng0;->b:Landroid/os/ParcelFileDescriptor;

    .line 67
    .line 68
    invoke-virtual {v4}, Landroid/os/ParcelFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 69
    .line 70
    .line 71
    move-result-object v4

    .line 72
    invoke-virtual {v4}, Ljava/io/FileDescriptor;->sync()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 73
    .line 74
    .line 75
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :catch_0
    move-exception p0

    .line 79
    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_1
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    :goto_1
    if-ge v2, v1, :cond_2

    .line 88
    .line 89
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->keyAt(I)I

    .line 90
    .line 91
    .line 92
    move-result v3

    .line 93
    invoke-virtual {v0, v2}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    check-cast v6, Ljava/lang/Long;

    .line 98
    .line 99
    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    .line 100
    .line 101
    .line 102
    move-result-wide v6

    .line 103
    iget-object v8, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 104
    .line 105
    iget-object v9, p0, Ll/vfg0;->i:Ll/bog0;

    .line 106
    .line 107
    invoke-interface {v8, v9, v3, v6, v7}, Ll/ehg0;->g(Ll/bog0;IJ)V

    .line 108
    .line 109
    .line 110
    add-long/2addr v4, v6

    .line 111
    iget-object v8, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 112
    .line 113
    invoke-virtual {v8, v3}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v8

    .line 117
    check-cast v8, Ljava/util/concurrent/atomic/AtomicLong;

    .line 118
    .line 119
    neg-long v6, v6

    .line 120
    invoke-virtual {v8, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 121
    .line 122
    .line 123
    iget-object v6, p0, Ll/vfg0;->j:Ll/aug0;

    .line 124
    .line 125
    iget v6, v6, Ll/aug0;->b:I

    .line 126
    .line 127
    iget-object v6, p0, Ll/vfg0;->i:Ll/bog0;

    .line 128
    .line 129
    iget-object v6, v6, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 130
    .line 131
    invoke-virtual {v6, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    check-cast v3, Ll/akg0;

    .line 136
    .line 137
    iget-object v3, v3, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 138
    .line 139
    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 140
    .line 141
    .line 142
    add-int/lit8 v2, v2, 0x1

    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_2
    iget-object v0, p0, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 146
    .line 147
    neg-long v1, v4

    .line 148
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 149
    .line 150
    .line 151
    iget-object p0, p0, Ll/vfg0;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 152
    .line 153
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 154
    .line 155
    .line 156
    move-result-wide v0

    .line 157
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->set(J)V

    .line 158
    .line 159
    .line 160
    return-void

    .line 161
    :catchall_0
    move-exception p0

    .line 162
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 163
    throw p0
.end method

.method public final declared-synchronized b(I)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/ojg0;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    check-cast v0, Ll/qng0;

    .line 13
    .line 14
    iget-object v1, v0, Ll/qng0;->c:Ljava/io/BufferedOutputStream;

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 17
    .line 18
    .line 19
    iget-object v1, v0, Ll/qng0;->d:Ljava/io/FileOutputStream;

    .line 20
    .line 21
    invoke-virtual {v1}, Ljava/io/FileOutputStream;->close()V

    .line 22
    .line 23
    .line 24
    iget-object v0, v0, Ll/qng0;->b:Landroid/os/ParcelFileDescriptor;

    .line 25
    .line 26
    invoke-virtual {v0}, Landroid/os/ParcelFileDescriptor;->close()V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->remove(I)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/vfg0;->j:Ll/aug0;

    .line 35
    .line 36
    iget p1, p1, Ll/aug0;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    .line 38
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p1
.end method

.method public final c(IZ)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 2
    .line 3
    if-eqz v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 6
    .line 7
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    goto :goto_2

    .line 14
    :cond_0
    if-nez p2, :cond_1

    .line 15
    .line 16
    iget-object v0, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 17
    .line 18
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-virtual {v0, p1, v1}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p1, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 26
    .line 27
    if-eqz p1, :cond_2

    .line 28
    .line 29
    iget-object p1, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 30
    .line 31
    invoke-static {p1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 36
    .line 37
    if-eqz p1, :cond_4

    .line 38
    .line 39
    iget-object p1, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 40
    .line 41
    invoke-static {p1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 42
    .line 43
    .line 44
    :goto_1
    if-eqz p2, :cond_3

    .line 45
    .line 46
    iget-object p1, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 47
    .line 48
    invoke-static {p1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 49
    .line 50
    .line 51
    :try_start_0
    iget-object p0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 52
    .line 53
    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_0 .. :try_end_0} :catch_0

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_3
    invoke-static {}, Ljava/util/concurrent/locks/LockSupport;->park()V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    const-wide/32 v0, 0x17d7840

    .line 62
    .line 63
    .line 64
    invoke-static {v0, v1}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :catch_0
    :cond_5
    :goto_2
    return-void
.end method

.method public final d(Ll/veg0;)V
    .locals 6

    .line 1
    iget-object v0, p1, Ll/veg0;->c:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 7
    .line 8
    invoke-virtual {v0}, Ljava/util/ArrayList;->clone()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    check-cast v0, Ljava/util/List;

    .line 13
    .line 14
    new-instance v1, Ljava/util/HashSet;

    .line 15
    .line 16
    invoke-direct {v1, v0}, Ljava/util/HashSet;-><init>(Ljava/util/Collection;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iget-object v1, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    iget-object v2, p0, Ll/vfg0;->j:Ll/aug0;

    .line 30
    .line 31
    const/4 v3, 0x0

    .line 32
    if-eq v0, v1, :cond_0

    .line 33
    .line 34
    iget v0, v2, Ll/aug0;->b:I

    .line 35
    .line 36
    iget-object v0, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 39
    .line 40
    .line 41
    iput-boolean v3, p1, Ll/veg0;->a:Z

    .line 42
    .line 43
    goto :goto_0

    .line 44
    :cond_0
    iget v0, v2, Ll/aug0;->b:I

    .line 45
    .line 46
    iget-object v0, p0, Ll/vfg0;->u:Ljava/util/ArrayList;

    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    .line 49
    .line 50
    .line 51
    const/4 v0, 0x1

    .line 52
    iput-boolean v0, p1, Ll/veg0;->a:Z

    .line 53
    .line 54
    :goto_0
    iget-object v0, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 55
    .line 56
    invoke-virtual {v0}, Landroid/util/SparseArray;->clone()Landroid/util/SparseArray;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    :goto_1
    if-ge v3, v1, :cond_2

    .line 65
    .line 66
    invoke-virtual {v0, v3}, Landroid/util/SparseArray;->keyAt(I)I

    .line 67
    .line 68
    .line 69
    move-result v2

    .line 70
    iget-object v4, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 71
    .line 72
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 73
    .line 74
    .line 75
    move-result-object v5

    .line 76
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result v4

    .line 80
    if-eqz v4, :cond_1

    .line 81
    .line 82
    iget-object v4, p1, Ll/veg0;->b:Ljava/util/ArrayList;

    .line 83
    .line 84
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 85
    .line 86
    .line 87
    move-result-object v5

    .line 88
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v4

    .line 92
    if-nez v4, :cond_1

    .line 93
    .line 94
    iget-object v4, p1, Ll/veg0;->b:Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 97
    .line 98
    .line 99
    move-result-object v5

    .line 100
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 101
    .line 102
    .line 103
    iget-object v4, p1, Ll/veg0;->c:Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    invoke-virtual {v4, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    :cond_1
    add-int/lit8 v3, v3, 0x1

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_2
    return-void
.end method

.method public final declared-synchronized e(I)Ll/ojg0;
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 3
    .line 4
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/ojg0;

    .line 9
    .line 10
    if-nez v0, :cond_a

    .line 11
    .line 12
    iget-object v0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 13
    .line 14
    iget-object v0, v0, Ll/aug0;->d:Landroid/net/Uri;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    const-string v1, "file"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 23
    .line 24
    .line 25
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    iget-object v1, p0, Ll/vfg0;->j:Ll/aug0;

    .line 27
    .line 28
    if-eqz v0, :cond_4

    .line 29
    .line 30
    :try_start_1
    invoke-virtual {v1}, Ll/aug0;->j()Ljava/io/File;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    if-eqz v1, :cond_3

    .line 35
    .line 36
    iget-object v2, p0, Ll/vfg0;->j:Ll/aug0;

    .line 37
    .line 38
    iget-object v2, v2, Ll/aug0;->u:Ljava/io/File;

    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    .line 41
    .line 42
    .line 43
    move-result v3

    .line 44
    if-nez v3, :cond_1

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    if-eqz v2, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    new-instance p1, Ljava/io/IOException;

    .line 54
    .line 55
    const-string v0, "Create parent folder failed!"

    .line 56
    .line 57
    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    throw p1

    .line 61
    :catchall_0
    move-exception p1

    .line 62
    goto/16 :goto_3

    .line 63
    .line 64
    :cond_1
    :goto_0
    invoke-virtual {v1}, Ljava/io/File;->createNewFile()Z

    .line 65
    .line 66
    .line 67
    move-result v2

    .line 68
    if-eqz v2, :cond_2

    .line 69
    .line 70
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    :cond_2
    invoke-static {v1}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    .line 74
    .line 75
    .line 76
    move-result-object v1

    .line 77
    goto :goto_1

    .line 78
    :cond_3
    new-instance p1, Ljava/io/FileNotFoundException;

    .line 79
    .line 80
    const-string v0, "Filename is not ready!"

    .line 81
    .line 82
    invoke-direct {p1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    throw p1

    .line 86
    :cond_4
    iget-object v1, v1, Ll/aug0;->d:Landroid/net/Uri;

    .line 87
    .line 88
    :goto_1
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 89
    .line 90
    .line 91
    move-result-object v2

    .line 92
    iget-object v2, v2, Ll/jwg0;->e:Ll/zqg0;

    .line 93
    .line 94
    invoke-static {}, Ll/jwg0;->a()Ll/jwg0;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    iget-object v2, v2, Ll/jwg0;->h:Landroid/content/Context;

    .line 99
    .line 100
    iget v3, p0, Ll/vfg0;->f:I

    .line 101
    .line 102
    new-instance v4, Ll/qng0;

    .line 103
    .line 104
    invoke-direct {v4, v2, v1, v3}, Ll/qng0;-><init>(Landroid/content/Context;Landroid/net/Uri;I)V

    .line 105
    .line 106
    .line 107
    iget-boolean v1, p0, Ll/vfg0;->l:Z

    .line 108
    .line 109
    const-wide/16 v2, 0x0

    .line 110
    .line 111
    if-eqz v1, :cond_5

    .line 112
    .line 113
    iget-object v1, p0, Ll/vfg0;->i:Ll/bog0;

    .line 114
    .line 115
    iget-object v1, v1, Ll/bog0;->g:Ljava/util/ArrayList;

    .line 116
    .line 117
    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    check-cast v1, Ll/akg0;

    .line 122
    .line 123
    iget-wide v5, v1, Ll/akg0;->a:J

    .line 124
    .line 125
    iget-object v1, v1, Ll/akg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 126
    .line 127
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 128
    .line 129
    .line 130
    move-result-wide v7

    .line 131
    add-long/2addr v7, v5

    .line 132
    cmp-long v1, v7, v2

    .line 133
    .line 134
    if-lez v1, :cond_5

    .line 135
    .line 136
    iget-object v1, v4, Ll/qng0;->a:Ljava/nio/channels/FileChannel;

    .line 137
    .line 138
    invoke-virtual {v1, v7, v8}, Ljava/nio/channels/FileChannel;->position(J)Ljava/nio/channels/FileChannel;

    .line 139
    .line 140
    .line 141
    iget-object v1, p0, Ll/vfg0;->j:Ll/aug0;

    .line 142
    .line 143
    iget v1, v1, Ll/aug0;->b:I

    .line 144
    .line 145
    :cond_5
    iget-boolean v1, p0, Ll/vfg0;->x:Z

    .line 146
    .line 147
    if-eqz v1, :cond_6

    .line 148
    .line 149
    iget-object v1, p0, Ll/vfg0;->k:Ll/ehg0;

    .line 150
    .line 151
    iget-object v5, p0, Ll/vfg0;->j:Ll/aug0;

    .line 152
    .line 153
    iget v5, v5, Ll/aug0;->b:I

    .line 154
    .line 155
    invoke-interface {v1, v5}, Ll/ehg0;->f(I)Z

    .line 156
    .line 157
    .line 158
    :cond_6
    iget-object v1, p0, Ll/vfg0;->i:Ll/bog0;

    .line 159
    .line 160
    iget-boolean v1, v1, Ll/bog0;->i:Z

    .line 161
    .line 162
    if-nez v1, :cond_9

    .line 163
    .line 164
    iget-boolean v1, p0, Ll/vfg0;->x:Z

    .line 165
    .line 166
    if-eqz v1, :cond_9

    .line 167
    .line 168
    iget-boolean v1, p0, Ll/vfg0;->m:Z

    .line 169
    .line 170
    if-eqz v1, :cond_9

    .line 171
    .line 172
    iget-object v1, p0, Ll/vfg0;->i:Ll/bog0;

    .line 173
    .line 174
    invoke-virtual {v1}, Ll/bog0;->c()J

    .line 175
    .line 176
    .line 177
    move-result-wide v5

    .line 178
    if-eqz v0, :cond_8

    .line 179
    .line 180
    iget-object v0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 181
    .line 182
    invoke-virtual {v0}, Ll/aug0;->j()Ljava/io/File;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    invoke-virtual {v0}, Ljava/io/File;->length()J

    .line 187
    .line 188
    .line 189
    move-result-wide v7

    .line 190
    sub-long v7, v5, v7

    .line 191
    .line 192
    cmp-long v1, v7, v2

    .line 193
    .line 194
    if-lez v1, :cond_9

    .line 195
    .line 196
    new-instance v1, Landroid/os/StatFs;

    .line 197
    .line 198
    invoke-virtual {v0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-direct {v1, v0}, Landroid/os/StatFs;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-static {v1}, Ll/ytg0;->b(Landroid/os/StatFs;)J

    .line 206
    .line 207
    .line 208
    move-result-wide v0

    .line 209
    cmp-long v2, v0, v7

    .line 210
    .line 211
    if-ltz v2, :cond_7

    .line 212
    .line 213
    invoke-virtual {v4, v5, v6}, Ll/qng0;->a(J)V

    .line 214
    .line 215
    .line 216
    goto :goto_2

    .line 217
    :cond_7
    new-instance p1, LSudchar/Sudint;

    .line 218
    .line 219
    invoke-direct {p1, v7, v8, v0, v1}, LSudchar/Sudint;-><init>(JJ)V

    .line 220
    .line 221
    .line 222
    throw p1

    .line 223
    :cond_8
    invoke-virtual {v4, v5, v6}, Ll/qng0;->a(J)V

    .line 224
    .line 225
    .line 226
    :cond_9
    :goto_2
    iget-object v0, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 227
    .line 228
    monitor-enter v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 229
    :try_start_2
    iget-object v1, p0, Ll/vfg0;->a:Landroid/util/SparseArray;

    .line 230
    .line 231
    invoke-virtual {v1, p1, v4}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 232
    .line 233
    .line 234
    iget-object v1, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 235
    .line 236
    new-instance v2, Ljava/util/concurrent/atomic/AtomicLong;

    .line 237
    .line 238
    invoke-direct {v2}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v1, p1, v2}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    .line 242
    .line 243
    .line 244
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 245
    const/4 p1, 0x0

    .line 246
    :try_start_3
    iput-boolean p1, p0, Ll/vfg0;->x:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 247
    .line 248
    monitor-exit p0

    .line 249
    return-object v4

    .line 250
    :catchall_1
    move-exception p1

    .line 251
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 252
    :try_start_5
    throw p1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 253
    :cond_a
    monitor-exit p0

    .line 254
    return-object v0

    .line 255
    :goto_3
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 256
    throw p1
.end method

.method public final f()V
    .locals 9

    .line 1
    iget-object v0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 2
    .line 3
    iget v0, v0, Ll/aug0;->b:I

    .line 4
    .line 5
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Ll/vfg0;->o:Ljava/lang/Thread;

    .line 10
    .line 11
    iget v0, p0, Ll/vfg0;->h:I

    .line 12
    .line 13
    int-to-long v0, v0

    .line 14
    invoke-virtual {p0}, Ll/vfg0;->a()V

    .line 15
    .line 16
    .line 17
    :cond_0
    :goto_0
    sget-object v2, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 18
    .line 19
    invoke-virtual {v2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    .line 20
    .line 21
    .line 22
    move-result-wide v2

    .line 23
    invoke-static {v2, v3}, Ljava/util/concurrent/locks/LockSupport;->parkNanos(J)V

    .line 24
    .line 25
    .line 26
    iget-object v2, p0, Ll/vfg0;->w:Ll/veg0;

    .line 27
    .line 28
    invoke-virtual {p0, v2}, Ll/vfg0;->d(Ll/veg0;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Ll/vfg0;->w:Ll/veg0;

    .line 32
    .line 33
    iget-boolean v3, v2, Ll/veg0;->a:Z

    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    if-nez v3, :cond_4

    .line 38
    .line 39
    iget-object v2, v2, Ll/veg0;->c:Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-lez v2, :cond_1

    .line 46
    .line 47
    goto :goto_2

    .line 48
    :cond_1
    iget-object v0, p0, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 49
    .line 50
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 51
    .line 52
    .line 53
    move-result-wide v0

    .line 54
    iget v2, p0, Ll/vfg0;->g:I

    .line 55
    .line 56
    int-to-long v2, v2

    .line 57
    cmp-long v0, v0, v2

    .line 58
    .line 59
    if-gez v0, :cond_2

    .line 60
    .line 61
    iget v0, p0, Ll/vfg0;->h:I

    .line 62
    .line 63
    :goto_1
    int-to-long v0, v0

    .line 64
    goto :goto_0

    .line 65
    :cond_2
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v0

    .line 69
    iget-object v2, p0, Ll/vfg0;->d:Ljava/util/concurrent/atomic/AtomicLong;

    .line 70
    .line 71
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 72
    .line 73
    .line 74
    move-result-wide v2

    .line 75
    sub-long/2addr v0, v2

    .line 76
    iget v2, p0, Ll/vfg0;->h:I

    .line 77
    .line 78
    int-to-long v2, v2

    .line 79
    sub-long v0, v2, v0

    .line 80
    .line 81
    cmp-long v2, v0, v4

    .line 82
    .line 83
    if-lez v2, :cond_3

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_3
    invoke-virtual {p0}, Ll/vfg0;->a()V

    .line 87
    .line 88
    .line 89
    iget v0, p0, Ll/vfg0;->h:I

    .line 90
    .line 91
    goto :goto_1

    .line 92
    :cond_4
    :goto_2
    iget-object v2, p0, Ll/vfg0;->w:Ll/veg0;

    .line 93
    .line 94
    iget-boolean v3, v2, Ll/veg0;->a:Z

    .line 95
    .line 96
    iget-object v2, v2, Ll/veg0;->c:Ljava/util/ArrayList;

    .line 97
    .line 98
    invoke-static {v2}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    iget-object v2, p0, Ll/vfg0;->c:Ljava/util/concurrent/atomic/AtomicLong;

    .line 102
    .line 103
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 104
    .line 105
    .line 106
    move-result-wide v2

    .line 107
    cmp-long v2, v2, v4

    .line 108
    .line 109
    if-lez v2, :cond_5

    .line 110
    .line 111
    invoke-virtual {p0}, Ll/vfg0;->a()V

    .line 112
    .line 113
    .line 114
    :cond_5
    iget-object v2, p0, Ll/vfg0;->w:Ll/veg0;

    .line 115
    .line 116
    iget-object v2, v2, Ll/veg0;->c:Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    .line 119
    .line 120
    .line 121
    move-result v3

    .line 122
    const/4 v4, 0x0

    .line 123
    move v5, v4

    .line 124
    :cond_6
    :goto_3
    if-ge v5, v3, :cond_7

    .line 125
    .line 126
    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v6

    .line 130
    add-int/lit8 v5, v5, 0x1

    .line 131
    .line 132
    check-cast v6, Ljava/lang/Integer;

    .line 133
    .line 134
    iget-object v7, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 135
    .line 136
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result v8

    .line 140
    invoke-virtual {v7, v8}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    move-result-object v7

    .line 144
    check-cast v7, Ljava/lang/Thread;

    .line 145
    .line 146
    iget-object v8, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 147
    .line 148
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    invoke-virtual {v8, v6}, Landroid/util/SparseArray;->remove(I)V

    .line 153
    .line 154
    .line 155
    if-eqz v7, :cond_6

    .line 156
    .line 157
    invoke-static {v7}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_7
    iget-object v2, p0, Ll/vfg0;->w:Ll/veg0;

    .line 162
    .line 163
    iget-boolean v2, v2, Ll/veg0;->a:Z

    .line 164
    .line 165
    if-eqz v2, :cond_0

    .line 166
    .line 167
    iget-object v0, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 168
    .line 169
    invoke-virtual {v0}, Landroid/util/SparseArray;->size()I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    :goto_4
    iget-object v1, p0, Ll/vfg0;->p:Landroid/util/SparseArray;

    .line 174
    .line 175
    if-ge v4, v0, :cond_9

    .line 176
    .line 177
    invoke-virtual {v1, v4}, Landroid/util/SparseArray;->valueAt(I)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v1

    .line 181
    check-cast v1, Ljava/lang/Thread;

    .line 182
    .line 183
    if-eqz v1, :cond_8

    .line 184
    .line 185
    invoke-static {v1}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    .line 186
    .line 187
    .line 188
    :cond_8
    add-int/lit8 v4, v4, 0x1

    .line 189
    .line 190
    goto :goto_4

    .line 191
    :cond_9
    invoke-virtual {v1}, Landroid/util/SparseArray;->clear()V

    .line 192
    .line 193
    .line 194
    iget-object p0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 195
    .line 196
    iget p0, p0, Ll/aug0;->b:I

    .line 197
    .line 198
    return-void
.end method

.method public final g()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/vfg0;->s:Ljava/io/IOException;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 6
    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    iget-object v0, p0, Ll/vfg0;->q:Ll/fwg0;

    .line 10
    .line 11
    monitor-enter v0

    .line 12
    :try_start_0
    iget-object v1, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 13
    .line 14
    if-nez v1, :cond_0

    .line 15
    .line 16
    sget-object v1, Ll/vfg0;->y:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 17
    .line 18
    iget-object v2, p0, Ll/vfg0;->q:Ll/fwg0;

    .line 19
    .line 20
    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    iput-object v1, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 25
    .line 26
    goto :goto_0

    .line 27
    :catchall_0
    move-exception p0

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :goto_0
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0

    .line 33
    :cond_1
    return-void

    .line 34
    :cond_2
    throw v0
.end method

.method public final h(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/vfg0;->t:Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    :try_start_0
    iget-object v0, p0, Ll/vfg0;->s:Ljava/io/IOException;

    .line 11
    .line 12
    if-nez v0, :cond_3

    .line 13
    .line 14
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 15
    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 19
    .line 20
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    iget-object v0, p0, Ll/vfg0;->b:Landroid/util/SparseArray;

    .line 27
    .line 28
    invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/util/concurrent/atomic/AtomicLong;

    .line 33
    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 37
    .line 38
    .line 39
    move-result-wide v0

    .line 40
    const-wide/16 v2, 0x0

    .line 41
    .line 42
    cmp-long v0, v0, v2

    .line 43
    .line 44
    if-lez v0, :cond_2

    .line 45
    .line 46
    iget-object v0, p0, Ll/vfg0;->v:Ll/veg0;

    .line 47
    .line 48
    invoke-virtual {p0, v0}, Ll/vfg0;->d(Ll/veg0;)V

    .line 49
    .line 50
    .line 51
    iget-object v0, p0, Ll/vfg0;->v:Ll/veg0;

    .line 52
    .line 53
    iget-boolean v0, v0, Ll/veg0;->a:Z

    .line 54
    .line 55
    invoke-virtual {p0, p1, v0}, Ll/vfg0;->c(IZ)V

    .line 56
    .line 57
    .line 58
    goto :goto_0

    .line 59
    :catchall_0
    move-exception v0

    .line 60
    goto :goto_1

    .line 61
    :cond_0
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 62
    .line 63
    if-nez v0, :cond_1

    .line 64
    .line 65
    iget-object v0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 66
    .line 67
    iget v0, v0, Ll/aug0;->b:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    iget-object v0, p0, Ll/vfg0;->n:Ljava/util/concurrent/Future;

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/concurrent/Future;->isDone()Z

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/vfg0;->j:Ll/aug0;

    .line 76
    .line 77
    iget v0, v0, Ll/aug0;->b:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    .line 79
    :cond_2
    :goto_0
    invoke-virtual {p0, p1}, Ll/vfg0;->b(I)V

    .line 80
    .line 81
    .line 82
    return-void

    .line 83
    :cond_3
    :try_start_1
    throw v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 84
    :goto_1
    invoke-virtual {p0, p1}, Ll/vfg0;->b(I)V

    .line 85
    .line 86
    .line 87
    throw v0
.end method
