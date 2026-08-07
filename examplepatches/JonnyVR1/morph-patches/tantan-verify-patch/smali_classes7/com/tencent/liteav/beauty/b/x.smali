.class public Lcom/tencent/liteav/beauty/b/x;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final b:Ljava/lang/String; = "x"


# instance fields
.field a:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

.field private c:Landroid/graphics/SurfaceTexture;

.field private d:I

.field private e:Z

.field private f:Landroid/media/MediaExtractor;

.field private g:Landroid/content/res/AssetFileDescriptor;

.field private h:I

.field private i:I

.field private j:I

.field private k:I

.field private l:J

.field private m:Landroid/media/MediaCodec;

.field private n:Z

.field private o:Z

.field private p:Landroid/os/Handler;

.field private q:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/tencent/liteav/beauty/b/x;->d:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Lcom/tencent/liteav/beauty/b/x;->e:Z

    .line 9
    .line 10
    iput v0, p0, Lcom/tencent/liteav/beauty/b/x;->h:I

    .line 11
    .line 12
    iput v0, p0, Lcom/tencent/liteav/beauty/b/x;->i:I

    .line 13
    .line 14
    iput v0, p0, Lcom/tencent/liteav/beauty/b/x;->j:I

    .line 15
    .line 16
    iput v0, p0, Lcom/tencent/liteav/beauty/b/x;->k:I

    .line 17
    .line 18
    iput-boolean v1, p0, Lcom/tencent/liteav/beauty/b/x;->n:Z

    .line 19
    .line 20
    new-instance v0, Ljava/lang/Object;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    .line 26
    .line 27
    return-void
.end method

.method public static synthetic a(Lcom/tencent/liteav/beauty/b/x;)Ljava/lang/Object;
    .locals 0

    .line 65
    iget-object p0, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    return-object p0
.end method

.method private b()V
    .locals 6

    .line 1
    const-string v0, "release decoder exception: "

    .line 2
    .line 3
    const-string v1, "stop decoder Exception: "

    .line 4
    .line 5
    iget-boolean v2, p0, Lcom/tencent/liteav/beauty/b/x;->e:Z

    .line 6
    .line 7
    if-eqz v2, :cond_1

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    iput-boolean v2, p0, Lcom/tencent/liteav/beauty/b/x;->e:Z

    .line 11
    .line 12
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->f:Landroid/media/MediaExtractor;

    .line 13
    .line 14
    const/4 v3, 0x0

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    invoke-virtual {v2}, Landroid/media/MediaExtractor;->release()V

    .line 18
    .line 19
    .line 20
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->f:Landroid/media/MediaExtractor;

    .line 21
    .line 22
    :cond_0
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 23
    .line 24
    invoke-virtual {v2}, Landroid/media/MediaCodec;->stop()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 25
    .line 26
    .line 27
    :try_start_1
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 28
    .line 29
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    :goto_0
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 33
    .line 34
    goto/16 :goto_7

    .line 35
    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :catch_0
    move-exception v1

    .line 39
    :try_start_2
    sget-object v2, Lcom/tencent/liteav/beauty/b/x;->b:Ljava/lang/String;

    .line 40
    .line 41
    new-instance v4, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 58
    .line 59
    .line 60
    goto :goto_0

    .line 61
    :goto_1
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 62
    .line 63
    throw v0

    .line 64
    :catchall_1
    move-exception v1

    .line 65
    goto :goto_3

    .line 66
    :catch_1
    move-exception v2

    .line 67
    :try_start_3
    sget-object v4, Lcom/tencent/liteav/beauty/b/x;->b:Ljava/lang/String;

    .line 68
    .line 69
    new-instance v5, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v1

    .line 85
    invoke-static {v4, v1}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    .line 87
    .line 88
    :try_start_4
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 89
    .line 90
    invoke-virtual {v1}, Landroid/media/MediaCodec;->release()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 91
    .line 92
    .line 93
    goto :goto_0

    .line 94
    :catchall_2
    move-exception v0

    .line 95
    goto :goto_2

    .line 96
    :catch_2
    move-exception v1

    .line 97
    :try_start_5
    sget-object v2, Lcom/tencent/liteav/beauty/b/x;->b:Ljava/lang/String;

    .line 98
    .line 99
    new-instance v4, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    invoke-static {v2, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 116
    .line 117
    .line 118
    goto :goto_0

    .line 119
    :goto_2
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 120
    .line 121
    throw v0

    .line 122
    :goto_3
    :try_start_6
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 123
    .line 124
    invoke-virtual {v2}, Landroid/media/MediaCodec;->release()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 125
    .line 126
    .line 127
    :goto_4
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 128
    .line 129
    goto :goto_5

    .line 130
    :catchall_3
    move-exception v0

    .line 131
    goto :goto_6

    .line 132
    :catch_3
    move-exception v2

    .line 133
    :try_start_7
    sget-object v4, Lcom/tencent/liteav/beauty/b/x;->b:Ljava/lang/String;

    .line 134
    .line 135
    new-instance v5, Ljava/lang/StringBuilder;

    .line 136
    .line 137
    invoke-direct {v5, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 145
    .line 146
    .line 147
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    invoke-static {v4, v0}, Lcom/tencent/liteav/basic/log/TXCLog;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 152
    .line 153
    .line 154
    goto :goto_4

    .line 155
    :goto_5
    throw v1

    .line 156
    :goto_6
    iput-object v3, p0, Lcom/tencent/liteav/beauty/b/x;->m:Landroid/media/MediaCodec;

    .line 157
    .line 158
    throw v0

    .line 159
    :cond_1
    :goto_7
    return-void
.end method

.method public static synthetic b(Lcom/tencent/liteav/beauty/b/x;)V
    .locals 0

    .line 160
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/x;->c()V

    return-void
.end method

.method private c()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/x;->b()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->a:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/tencent/liteav/beauty/b/x;->l:J

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    iput-boolean v1, p0, Lcom/tencent/liteav/beauty/b/x;->o:Z

    .line 13
    .line 14
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->c:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    invoke-virtual {v1}, Landroid/graphics/SurfaceTexture;->release()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->c:Landroid/graphics/SurfaceTexture;

    .line 22
    .line 23
    :cond_0
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    .line 24
    .line 25
    monitor-enter v1

    .line 26
    :try_start_0
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 27
    .line 28
    if-eqz v2, :cond_1

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 34
    .line 35
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 36
    .line 37
    .line 38
    move-result-object v2

    .line 39
    invoke-virtual {v2}, Landroid/os/Looper;->quit()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 43
    .line 44
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Object;->notify()V

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :catchall_0
    move-exception p0

    .line 51
    goto :goto_1

    .line 52
    :cond_1
    :goto_0
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 53
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->g:Landroid/content/res/AssetFileDescriptor;

    .line 54
    .line 55
    if-eqz v1, :cond_2

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {v1}, Landroid/content/res/AssetFileDescriptor;->close()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    .line 59
    .line 60
    :catch_0
    iput-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->g:Landroid/content/res/AssetFileDescriptor;

    .line 61
    .line 62
    :cond_2
    return-void

    .line 63
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 64
    throw p0
.end method


# virtual methods
.method public declared-synchronized a()V
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    .line 3
    .line 4
    monitor-enter v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 5
    :try_start_1
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 14
    .line 15
    invoke-virtual {v2}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 16
    .line 17
    .line 18
    move-result-object v2

    .line 19
    if-ne v1, v2, :cond_0

    .line 20
    .line 21
    invoke-direct {p0}, Lcom/tencent/liteav/beauty/b/x;->c()V

    .line 22
    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v1

    .line 26
    goto :goto_1

    .line 27
    :cond_0
    new-instance v1, Lcom/tencent/liteav/beauty/b/x$1;

    .line 28
    .line 29
    invoke-direct {v1, p0}, Lcom/tencent/liteav/beauty/b/x$1;-><init>(Lcom/tencent/liteav/beauty/b/x;)V

    .line 30
    .line 31
    .line 32
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 33
    .line 34
    const/4 v3, 0x0

    .line 35
    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    iget-object v2, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 39
    .line 40
    invoke-virtual {v2, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 41
    .line 42
    .line 43
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->p:Landroid/os/Handler;

    .line 44
    .line 45
    invoke-virtual {v1}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-virtual {v1}, Landroid/os/Looper;->quitSafely()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    .line 51
    .line 52
    :catch_0
    :try_start_2
    iget-object v1, p0, Lcom/tencent/liteav/beauty/b/x;->q:Ljava/lang/Object;

    .line 53
    .line 54
    invoke-virtual {v1}, Ljava/lang/Object;->wait()V
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    .line 56
    .line 57
    :cond_1
    :goto_0
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    monitor-exit p0

    .line 59
    return-void

    .line 60
    :goto_1
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 61
    :try_start_5
    throw v1

    .line 62
    :catchall_1
    move-exception v0

    .line 63
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 64
    throw v0
.end method
