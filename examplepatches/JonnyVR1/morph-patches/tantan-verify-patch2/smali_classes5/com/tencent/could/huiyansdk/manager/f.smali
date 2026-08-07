.class public Lcom/tencent/could/huiyansdk/manager/f;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Ljava/util/concurrent/ArrayBlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ArrayBlockingQueue<",
            "[B>;"
        }
    .end annotation
.end field

.field public volatile b:I

.field public volatile c:I

.field public d:Landroid/media/MediaCodec;

.field public e:Landroid/media/MediaMuxer;

.field public f:I

.field public g:Ljava/lang/String;

.field public h:Ljava/lang/String;

.field public i:Ljava/lang/Object;

.field public volatile j:Z

.field public volatile k:Z

.field public l:I

.field public m:J

.field public volatile n:Z

.field public o:I

.field public p:Z

.field public q:Z

.field public r:Z

.field public s:Z

.field public t:Z

.field public u:I

.field public v:I

.field public final w:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>()V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ArrayBlockingQueue;

    .line 5
    .line 6
    const/16 v1, 0xa

    .line 7
    .line 8
    invoke-direct {v0, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 12
    .line 13
    const/4 v0, -0x1

    .line 14
    iput v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->f:I

    .line 15
    .line 16
    const/4 v1, 0x0

    .line 17
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    .line 18
    .line 19
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->k:Z

    .line 20
    .line 21
    iput v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->l:I

    .line 22
    .line 23
    const/4 v2, 0x1

    .line 24
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->n:Z

    .line 25
    .line 26
    iput v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->o:I

    .line 27
    .line 28
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->p:Z

    .line 29
    .line 30
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->q:Z

    .line 31
    .line 32
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->r:Z

    .line 33
    .line 34
    iput-boolean v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->s:Z

    .line 35
    .line 36
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->t:Z

    .line 37
    .line 38
    iput v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->u:I

    .line 39
    .line 40
    iput v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->v:I

    .line 41
    .line 42
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 43
    .line 44
    invoke-direct {v0, v2}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 45
    .line 46
    .line 47
    iput-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->w:Ljava/util/concurrent/CountDownLatch;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->b()V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static synthetic a(Lcom/tencent/could/huiyansdk/manager/f;Lcom/tencent/could/huiyansdk/callback/e;)V
    .locals 0

    .line 380
    invoke-direct {p0, p1}, Lcom/tencent/could/huiyansdk/manager/f;->b(Lcom/tencent/could/huiyansdk/callback/e;)V

    return-void
.end method

.method private b(Lcom/tencent/could/huiyansdk/callback/e;)V
    .locals 6

    .line 83
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x1

    .line 84
    :try_start_0
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    .line 85
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    invoke-virtual {v2}, Ljava/lang/Object;->wait()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 86
    :catch_0
    :try_start_1
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    const-string v3, "VideoRecorderManager"

    const-string v4, "wait thread is interrupted!"

    const/4 v5, 0x2

    .line 87
    :try_start_2
    invoke-virtual {v2, v5, v3, v4}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 88
    :goto_0
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/manager/f;->a(Lcom/tencent/could/huiyansdk/callback/e;)Ljava/lang/String;

    move-result-object v2

    .line 89
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_0

    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    invoke-virtual {v3, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 90
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/f;->h:Ljava/lang/String;

    invoke-static {v3, v4}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->copyFile(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 91
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->h:Ljava/lang/String;

    :cond_0
    if-eqz p1, :cond_1

    .line 92
    invoke-interface {p1, v1, v2}, Lcom/tencent/could/huiyansdk/callback/e;->a(ZLjava/lang/String;)V

    .line 93
    :cond_1
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->a()V

    .line 94
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0
.end method

.method public static synthetic b(Lcom/tencent/could/huiyansdk/manager/f;)V
    .locals 0

    .line 95
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/manager/f;->f()V

    return-void
.end method

.method public static synthetic c(Lcom/tencent/could/huiyansdk/manager/f;)V
    .locals 0

    .line 61
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/manager/f;->e()V

    return-void
.end method

.method public static synthetic d(Lcom/tencent/could/huiyansdk/manager/f;)V
    .locals 0

    .line 19
    invoke-direct {p0}, Lcom/tencent/could/huiyansdk/manager/f;->g()V

    return-void
.end method

.method private e()V
    .locals 4

    .line 1
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 10
    .line 11
    const-string v0, "VideoRecorderManager"

    .line 12
    .line 13
    const-string v1, "Context is null"

    .line 14
    .line 15
    const/4 v2, 0x2

    .line 16
    invoke-virtual {p0, v2, v0, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->d:Z

    .line 21
    .line 22
    const-string v1, "video"

    .line 23
    .line 24
    const-string v2, "cloud-huiyan"

    .line 25
    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    new-instance p0, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 31
    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    invoke-virtual {v0, v3}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    goto :goto_0

    .line 60
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    sget-object v0, Ljava/io/File;->separator:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 75
    .line 76
    .line 77
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 78
    .line 79
    .line 80
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    :goto_0
    new-instance v0, Ljava/io/File;

    .line 91
    .line 92
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 96
    .line 97
    .line 98
    move-result p0

    .line 99
    if-eqz p0, :cond_3

    .line 100
    .line 101
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    if-eqz p0, :cond_4

    .line 106
    .line 107
    array-length v1, p0

    .line 108
    if-nez v1, :cond_2

    .line 109
    .line 110
    goto :goto_2

    .line 111
    :cond_2
    array-length v1, p0

    .line 112
    const/4 v2, 0x0

    .line 113
    :goto_1
    if-ge v2, v1, :cond_3

    .line 114
    .line 115
    aget-object v3, p0, v2

    .line 116
    .line 117
    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    .line 118
    .line 119
    .line 120
    add-int/lit8 v2, v2, 0x1

    .line 121
    .line 122
    goto :goto_1

    .line 123
    :cond_3
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    if-eqz p0, :cond_4

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 130
    .line 131
    .line 132
    :cond_4
    :goto_2
    return-void
.end method

.method private f()V
    .locals 14

    .line 1
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->q:Z

    .line 2
    .line 3
    const-string v1, "VideoRecorderManager"

    .line 4
    .line 5
    const/4 v2, 0x2

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 9
    .line 10
    const-string v3, "do not need video"

    .line 11
    .line 12
    invoke-virtual {v0, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    goto/16 :goto_5

    .line 16
    .line 17
    :cond_0
    const/4 v0, 0x0

    .line 18
    iput v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->l:I

    .line 19
    .line 20
    invoke-static {}, Landroid/media/MediaCodecList;->getCodecCount()I

    .line 21
    .line 22
    .line 23
    move-result v3

    .line 24
    const/4 v4, 0x0

    .line 25
    move v5, v0

    .line 26
    move-object v6, v4

    .line 27
    :goto_0
    const/4 v7, -0x1

    .line 28
    const-string v8, "video/avc"

    .line 29
    .line 30
    const/4 v9, 0x1

    .line 31
    if-ge v5, v3, :cond_6

    .line 32
    .line 33
    if-nez v6, :cond_6

    .line 34
    .line 35
    invoke-static {v5}, Landroid/media/MediaCodecList;->getCodecInfoAt(I)Landroid/media/MediaCodecInfo;

    .line 36
    .line 37
    .line 38
    move-result-object v10

    .line 39
    invoke-virtual {v10}, Landroid/media/MediaCodecInfo;->isEncoder()Z

    .line 40
    .line 41
    .line 42
    move-result v11

    .line 43
    if-nez v11, :cond_1

    .line 44
    .line 45
    goto :goto_2

    .line 46
    :cond_1
    invoke-virtual {v10}, Landroid/media/MediaCodecInfo;->getSupportedTypes()[Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v11

    .line 50
    if-nez v11, :cond_2

    .line 51
    .line 52
    goto :goto_3

    .line 53
    :cond_2
    move v7, v0

    .line 54
    move v12, v7

    .line 55
    :goto_1
    array-length v13, v11

    .line 56
    if-ge v7, v13, :cond_4

    .line 57
    .line 58
    if-nez v12, :cond_4

    .line 59
    .line 60
    aget-object v13, v11, v7

    .line 61
    .line 62
    invoke-virtual {v13, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v13

    .line 66
    if-eqz v13, :cond_3

    .line 67
    .line 68
    move v12, v9

    .line 69
    :cond_3
    add-int/lit8 v7, v7, 0x1

    .line 70
    .line 71
    goto :goto_1

    .line 72
    :cond_4
    if-nez v12, :cond_5

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    move-object v6, v10

    .line 76
    :goto_2
    add-int/lit8 v5, v5, 0x1

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :cond_6
    if-nez v6, :cond_7

    .line 80
    .line 81
    goto :goto_3

    .line 82
    :cond_7
    invoke-virtual {v6, v8}, Landroid/media/MediaCodecInfo;->getCapabilitiesForType(Ljava/lang/String;)Landroid/media/MediaCodecInfo$CodecCapabilities;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    iget-object v5, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 87
    .line 88
    const/16 v6, 0x15

    .line 89
    .line 90
    invoke-virtual {p0, v6, v5}, Lcom/tencent/could/huiyansdk/manager/f;->a(I[I)Z

    .line 91
    .line 92
    .line 93
    move-result v5

    .line 94
    if-eqz v5, :cond_8

    .line 95
    .line 96
    goto :goto_4

    .line 97
    :cond_8
    iget-object v3, v3, Landroid/media/MediaCodecInfo$CodecCapabilities;->colorFormats:[I

    .line 98
    .line 99
    const/16 v6, 0x13

    .line 100
    .line 101
    invoke-virtual {p0, v6, v3}, Lcom/tencent/could/huiyansdk/manager/f;->a(I[I)Z

    .line 102
    .line 103
    .line 104
    move-result v3

    .line 105
    if-eqz v3, :cond_9

    .line 106
    .line 107
    goto :goto_4

    .line 108
    :cond_9
    :goto_3
    move v6, v7

    .line 109
    :goto_4
    iput v6, p0, Lcom/tencent/could/huiyansdk/manager/f;->o:I

    .line 110
    .line 111
    if-ne v6, v7, :cond_a

    .line 112
    .line 113
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->n:Z

    .line 114
    .line 115
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 116
    .line 117
    const-string v3, "this phone not support video!"

    .line 118
    .line 119
    invoke-virtual {v0, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    goto/16 :goto_5

    .line 123
    .line 124
    :cond_a
    new-instance v3, Ljava/lang/Object;

    .line 125
    .line 126
    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    .line 127
    .line 128
    .line 129
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    .line 130
    .line 131
    iput-boolean v9, p0, Lcom/tencent/could/huiyansdk/manager/f;->n:Z

    .line 132
    .line 133
    iget v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 134
    .line 135
    iget v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 136
    .line 137
    invoke-static {v8, v3, v5}, Landroid/media/MediaFormat;->createVideoFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    .line 138
    .line 139
    .line 140
    move-result-object v3

    .line 141
    iget v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->o:I

    .line 142
    .line 143
    const-string v6, "color-format"

    .line 144
    .line 145
    invoke-virtual {v3, v6, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 146
    .line 147
    .line 148
    const-string v5, "frame-rate"

    .line 149
    .line 150
    const/16 v6, 0x1e

    .line 151
    .line 152
    invoke-virtual {v3, v5, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 153
    .line 154
    .line 155
    const-string v5, "bitrate"

    .line 156
    .line 157
    const v6, 0xf4240

    .line 158
    .line 159
    .line 160
    invoke-virtual {v3, v5, v6}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 161
    .line 162
    .line 163
    const-string v5, "i-frame-interval"

    .line 164
    .line 165
    invoke-virtual {v3, v5, v9}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 166
    .line 167
    .line 168
    iget v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 169
    .line 170
    const-string v6, "width"

    .line 171
    .line 172
    invoke-virtual {v3, v6, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 173
    .line 174
    .line 175
    iget v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 176
    .line 177
    const-string v6, "height"

    .line 178
    .line 179
    invoke-virtual {v3, v6, v5}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 180
    .line 181
    .line 182
    :try_start_0
    invoke-static {v8}, Landroid/media/MediaCodec;->createEncoderByType(Ljava/lang/String;)Landroid/media/MediaCodec;

    .line 183
    .line 184
    .line 185
    move-result-object v5

    .line 186
    iput-object v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    .line 187
    .line 188
    invoke-virtual {v5, v3, v4, v4, v9}, Landroid/media/MediaCodec;->configure(Landroid/media/MediaFormat;Landroid/view/Surface;Landroid/media/MediaCrypto;I)V

    .line 189
    .line 190
    .line 191
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    .line 192
    .line 193
    invoke-virtual {v3}, Landroid/media/MediaCodec;->start()V

    .line 194
    .line 195
    .line 196
    const-string v3, "temp.mp4"

    .line 197
    .line 198
    invoke-virtual {p0, v3}, Lcom/tencent/could/huiyansdk/manager/f;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v3

    .line 202
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 203
    .line 204
    new-instance v3, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 207
    .line 208
    .line 209
    const-string v4, "HuiYanVideo_"

    .line 210
    .line 211
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 212
    .line 213
    .line 214
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 215
    .line 216
    .line 217
    move-result-wide v4

    .line 218
    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 219
    .line 220
    .line 221
    const-string v4, ".mp4"

    .line 222
    .line 223
    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 224
    .line 225
    .line 226
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    invoke-virtual {p0, v3}, Lcom/tencent/could/huiyansdk/manager/f;->a(Ljava/lang/String;)Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->h:Ljava/lang/String;

    .line 235
    .line 236
    new-instance v3, Landroid/media/MediaMuxer;

    .line 237
    .line 238
    iget-object v4, p0, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 239
    .line 240
    invoke-direct {v3, v4, v0}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 241
    .line 242
    .line 243
    iput-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    .line 244
    .line 245
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->c()I

    .line 246
    .line 247
    .line 248
    move-result v4

    .line 249
    invoke-virtual {v3, v4}, Landroid/media/MediaMuxer;->setOrientationHint(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 250
    .line 251
    .line 252
    goto :goto_5

    .line 253
    :catch_0
    move-exception v3

    .line 254
    sget-object v4, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 255
    .line 256
    new-instance v5, Ljava/lang/StringBuilder;

    .line 257
    .line 258
    const-string v6, "init error! e: "

    .line 259
    .line 260
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 261
    .line 262
    .line 263
    invoke-virtual {v3}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 268
    .line 269
    .line 270
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v3

    .line 274
    invoke-virtual {v4, v2, v1, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 275
    .line 276
    .line 277
    iput-boolean v9, p0, Lcom/tencent/could/huiyansdk/manager/f;->p:Z

    .line 278
    .line 279
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->n:Z

    .line 280
    .line 281
    :goto_5
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/f;->w:Ljava/util/concurrent/CountDownLatch;

    .line 282
    .line 283
    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 284
    .line 285
    .line 286
    return-void
.end method

.method private g()V
    .locals 8

    .line 1
    const/4 v0, 0x2

    .line 2
    :try_start_0
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->w:Ljava/util/concurrent/CountDownLatch;

    .line 3
    .line 4
    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->await()V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0

    .line 5
    .line 6
    .line 7
    goto :goto_0

    .line 8
    :catch_0
    move-exception v1

    .line 9
    sget-object v2, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 10
    .line 11
    const-string v3, "VideoRecorderManager"

    .line 12
    .line 13
    new-instance v4, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    const-string v5, "countDownLatch.wait(): "

    .line 16
    .line 17
    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v2, v0, v3, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    :goto_0
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    if-nez v1, :cond_d

    .line 38
    .line 39
    iget-wide v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->m:J

    .line 40
    .line 41
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/util/concurrent/ArrayBlockingQueue;->size()I

    .line 44
    .line 45
    .line 46
    move-result v1

    .line 47
    if-lez v1, :cond_0

    .line 48
    .line 49
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->a:Ljava/util/concurrent/ArrayBlockingQueue;

    .line 50
    .line 51
    invoke-virtual {v1}, Ljava/util/concurrent/ArrayBlockingQueue;->poll()Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    check-cast v1, [B

    .line 56
    .line 57
    :try_start_1
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/manager/f;->a([B)[B

    .line 58
    .line 59
    .line 60
    move-result-object v5

    .line 61
    sget-object v6, Lcom/tencent/could/huiyansdk/utils/b$a;->a:Lcom/tencent/could/huiyansdk/utils/b;

    .line 62
    .line 63
    invoke-virtual {v6, v1}, Lcom/tencent/could/huiyansdk/utils/b;->a([B)Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 64
    .line 65
    .line 66
    :try_start_2
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 67
    .line 68
    const/16 v6, 0x280

    .line 69
    .line 70
    if-ne v1, v6, :cond_1

    .line 71
    .line 72
    const/16 v1, 0x1c0

    .line 73
    .line 74
    iput v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catchall_0
    move-exception v0

    .line 78
    move-object v1, v5

    .line 79
    goto/16 :goto_6

    .line 80
    .line 81
    :catch_1
    move-exception v1

    .line 82
    goto :goto_4

    .line 83
    :cond_1
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 84
    .line 85
    const/16 v6, 0x500

    .line 86
    .line 87
    if-ne v1, v6, :cond_2

    .line 88
    .line 89
    const/16 v1, 0x2c0

    .line 90
    .line 91
    iput v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 92
    .line 93
    :cond_2
    :goto_1
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->s:Z

    .line 94
    .line 95
    if-eqz v1, :cond_3

    .line 96
    .line 97
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 98
    .line 99
    iget v6, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 100
    .line 101
    invoke-virtual {p0, v5, v1, v6}, Lcom/tencent/could/huiyansdk/manager/f;->b([BII)V

    .line 102
    .line 103
    .line 104
    :cond_3
    iget-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->t:Z

    .line 105
    .line 106
    if-eqz v1, :cond_4

    .line 107
    .line 108
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 109
    .line 110
    iget v6, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 111
    .line 112
    invoke-virtual {p0, v5, v1, v6}, Lcom/tencent/could/huiyansdk/manager/f;->c([BII)[B

    .line 113
    .line 114
    .line 115
    move-result-object v5

    .line 116
    :cond_4
    iget v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 117
    .line 118
    iget v6, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 119
    .line 120
    invoke-virtual {p0, v5, v1, v6}, Lcom/tencent/could/huiyansdk/manager/f;->a([BII)[B

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    if-nez v2, :cond_7

    .line 125
    .line 126
    invoke-virtual {p0, v5}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 127
    .line 128
    .line 129
    if-eqz v2, :cond_6

    .line 130
    .line 131
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 132
    .line 133
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 134
    .line 135
    if-nez v1, :cond_5

    .line 136
    .line 137
    goto :goto_2

    .line 138
    :cond_5
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/utils/i;->release(Ljava/lang/Object;)Z

    .line 139
    .line 140
    .line 141
    :cond_6
    :goto_2
    invoke-virtual {p0, v5}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V

    .line 142
    .line 143
    .line 144
    goto :goto_0

    .line 145
    :cond_7
    :try_start_3
    invoke-virtual {p0, v2, v3, v4}, Lcom/tencent/could/huiyansdk/manager/f;->a([BJ)V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 146
    .line 147
    .line 148
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 149
    .line 150
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 151
    .line 152
    if-nez v1, :cond_8

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_8
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/utils/i;->release(Ljava/lang/Object;)Z

    .line 156
    .line 157
    .line 158
    :goto_3
    invoke-virtual {p0, v5}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V

    .line 159
    .line 160
    .line 161
    goto :goto_0

    .line 162
    :catchall_1
    move-exception v0

    .line 163
    goto :goto_6

    .line 164
    :catch_2
    move-exception v3

    .line 165
    move-object v5, v1

    .line 166
    move-object v1, v3

    .line 167
    :goto_4
    :try_start_4
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 168
    .line 169
    const-string v4, "VideoRecorderManager"

    .line 170
    .line 171
    :try_start_5
    new-instance v6, Ljava/lang/StringBuilder;

    .line 172
    .line 173
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 174
    .line 175
    .line 176
    const-string v7, "record video has some error! "

    .line 177
    .line 178
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 179
    .line 180
    .line 181
    invoke-virtual {v1}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    invoke-virtual {v6, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    invoke-virtual {v3, v0, v4, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    const/4 v1, 0x1

    .line 196
    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 197
    .line 198
    if-eqz v2, :cond_a

    .line 199
    .line 200
    sget-object v1, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 201
    .line 202
    iget-object v1, v1, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 203
    .line 204
    if-nez v1, :cond_9

    .line 205
    .line 206
    goto :goto_5

    .line 207
    :cond_9
    invoke-virtual {v1, v2}, Lcom/tencent/could/huiyansdk/utils/i;->release(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    :cond_a
    :goto_5
    invoke-virtual {p0, v5}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V

    .line 211
    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :goto_6
    if-eqz v2, :cond_c

    .line 216
    .line 217
    sget-object v3, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 218
    .line 219
    iget-object v3, v3, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    .line 220
    .line 221
    if-nez v3, :cond_b

    .line 222
    .line 223
    goto :goto_7

    .line 224
    :cond_b
    invoke-virtual {v3, v2}, Lcom/tencent/could/huiyansdk/utils/i;->release(Ljava/lang/Object;)Z

    .line 225
    .line 226
    .line 227
    :cond_c
    :goto_7
    invoke-virtual {p0, v1}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V

    .line 228
    .line 229
    .line 230
    throw v0

    .line 231
    :cond_d
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    .line 232
    .line 233
    monitor-enter v1

    .line 234
    :try_start_6
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;
    :try_end_6
    .catch Ljava/lang/RuntimeException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 235
    .line 236
    if-eqz v3, :cond_e

    .line 237
    .line 238
    :try_start_7
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->stop()V
    :try_end_7
    .catch Ljava/lang/IllegalStateException; {:try_start_7 .. :try_end_7} :catch_4
    .catch Ljava/lang/RuntimeException; {:try_start_7 .. :try_end_7} :catch_3
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 239
    .line 240
    .line 241
    goto :goto_8

    .line 242
    :catchall_2
    move-exception v0

    .line 243
    goto :goto_b

    .line 244
    :catch_3
    move-exception v2

    .line 245
    goto :goto_9

    .line 246
    :catch_4
    move-exception v3

    .line 247
    :try_start_8
    sget-object v4, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_8
    .catch Ljava/lang/RuntimeException; {:try_start_8 .. :try_end_8} :catch_3
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 248
    .line 249
    const-string v5, "VideoRecorderManager"

    .line 250
    .line 251
    :try_start_9
    new-instance v6, Ljava/lang/StringBuilder;

    .line 252
    .line 253
    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    .line 254
    .line 255
    .line 256
    const-string v7, "mediaMuxer.stop(): "

    .line 257
    .line 258
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v3}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v3

    .line 265
    invoke-virtual {v6, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v3

    .line 272
    invoke-virtual {v4, v0, v5, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 273
    .line 274
    .line 275
    :goto_8
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    .line 276
    .line 277
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->release()V

    .line 278
    .line 279
    .line 280
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    .line 281
    .line 282
    :cond_e
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    .line 283
    .line 284
    if-eqz v3, :cond_f

    .line 285
    .line 286
    invoke-virtual {v3}, Landroid/media/MediaCodec;->stop()V

    .line 287
    .line 288
    .line 289
    iget-object v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    .line 290
    .line 291
    invoke-virtual {v3}, Landroid/media/MediaCodec;->release()V

    .line 292
    .line 293
    .line 294
    iput-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;
    :try_end_9
    .catch Ljava/lang/RuntimeException; {:try_start_9 .. :try_end_9} :catch_3
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 295
    .line 296
    :cond_f
    :try_start_a
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 297
    .line 298
    goto :goto_a

    .line 299
    :catchall_3
    move-exception p0

    .line 300
    goto :goto_c

    .line 301
    :goto_9
    :try_start_b
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    .line 302
    .line 303
    const-string v4, "VideoRecorderManager"

    .line 304
    .line 305
    :try_start_c
    new-instance v5, Ljava/lang/StringBuilder;

    .line 306
    .line 307
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 308
    .line 309
    .line 310
    const-string v6, "release media state error! e: "

    .line 311
    .line 312
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 313
    .line 314
    .line 315
    invoke-virtual {v2}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v2

    .line 326
    invoke-virtual {v3, v0, v4, v2}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    .line 327
    .line 328
    .line 329
    :try_start_d
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    .line 330
    .line 331
    :goto_a
    invoke-virtual {v0}, Ljava/lang/Object;->notifyAll()V

    .line 332
    .line 333
    .line 334
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->k:Z

    .line 335
    .line 336
    if-eqz v0, :cond_10

    .line 337
    .line 338
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->a()V

    .line 339
    .line 340
    .line 341
    :cond_10
    monitor-exit v1

    .line 342
    return-void

    .line 343
    :goto_b
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/f;->i:Ljava/lang/Object;

    .line 344
    .line 345
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 346
    .line 347
    .line 348
    throw v0

    .line 349
    :goto_c
    monitor-exit v1
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    .line 350
    throw p0
.end method


# virtual methods
.method public final a(Lcom/tencent/could/huiyansdk/callback/e;)Ljava/lang/String;
    .locals 19

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    const-string v0, "max-width"

    .line 6
    .line 7
    const-string v3, "max-height"

    .line 8
    .line 9
    const-string v4, "max-input-size"

    .line 10
    .line 11
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/f;->d()Z

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const-string v6, ""

    .line 16
    .line 17
    const/4 v7, 0x2

    .line 18
    const-string v8, "VideoRecorderManager"

    .line 19
    .line 20
    if-eqz v5, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 23
    .line 24
    const-string v1, "cutVideoTheVideo do not need video"

    .line 25
    .line 26
    invoke-virtual {v0, v7, v8, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    return-object v6

    .line 30
    :cond_0
    sget-object v5, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 31
    .line 32
    iget-object v5, v5, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 33
    .line 34
    const/4 v9, 0x1

    .line 35
    if-nez v5, :cond_1

    .line 36
    .line 37
    move v5, v9

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-virtual {v5}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isCutRecordVideo()Z

    .line 40
    .line 41
    .line 42
    move-result v5

    .line 43
    :goto_0
    if-nez v5, :cond_2

    .line 44
    .line 45
    iget-object v0, v1, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 46
    .line 47
    return-object v0

    .line 48
    :cond_2
    new-instance v5, Landroid/media/MediaExtractor;

    .line 49
    .line 50
    invoke-direct {v5}, Landroid/media/MediaExtractor;-><init>()V

    .line 51
    .line 52
    .line 53
    :try_start_0
    iget-object v10, v1, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 54
    .line 55
    invoke-virtual {v5, v10}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    const/4 v10, 0x0

    .line 59
    move v11, v10

    .line 60
    :goto_1
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->getTrackCount()I

    .line 61
    .line 62
    .line 63
    move-result v12

    .line 64
    if-ge v11, v12, :cond_4

    .line 65
    .line 66
    invoke-virtual {v5, v11}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 67
    .line 68
    .line 69
    move-result-object v12

    .line 70
    const-string v13, "mime"

    .line 71
    .line 72
    invoke-virtual {v12, v13}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v12

    .line 76
    const-string v13, "video/"

    .line 77
    .line 78
    invoke-virtual {v12, v13}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 79
    .line 80
    .line 81
    move-result v12
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2

    .line 82
    if-eqz v12, :cond_3

    .line 83
    .line 84
    goto :goto_2

    .line 85
    :cond_3
    add-int/lit8 v11, v11, 0x1

    .line 86
    .line 87
    goto :goto_1

    .line 88
    :cond_4
    move v11, v10

    .line 89
    :goto_2
    :try_start_1
    invoke-virtual {v5, v11}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    .line 90
    .line 91
    .line 92
    move-result-object v12
    :try_end_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2

    .line 93
    :try_start_2
    invoke-virtual {v5, v11}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 94
    .line 95
    .line 96
    const-string v13, "durationUs"

    .line 97
    .line 98
    invoke-virtual {v12, v13}, Landroid/media/MediaFormat;->getLong(Ljava/lang/String;)J

    .line 99
    .line 100
    .line 101
    move-result-wide v13

    .line 102
    sget-object v15, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 103
    .line 104
    iget-object v15, v15, Lcom/tencent/could/huiyansdk/api/j;->b:Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    .line 105
    .line 106
    if-nez v15, :cond_5

    .line 107
    .line 108
    const-wide/16 v15, 0x7d0

    .line 109
    .line 110
    goto :goto_3

    .line 111
    :cond_5
    invoke-virtual {v15}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->getCutVideoDuration()J

    .line 112
    .line 113
    .line 114
    move-result-wide v15

    .line 115
    :goto_3
    const-wide/16 v17, 0x3e8

    .line 116
    .line 117
    mul-long v15, v15, v17

    .line 118
    .line 119
    sub-long/2addr v13, v15

    .line 120
    const-wide/16 v15, 0x0

    .line 121
    .line 122
    cmp-long v15, v13, v15

    .line 123
    .line 124
    if-gez v15, :cond_6

    .line 125
    .line 126
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->release()V

    .line 127
    .line 128
    .line 129
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2

    .line 130
    .line 131
    const-string v3, "use order video!"

    .line 132
    .line 133
    :try_start_3
    invoke-virtual {v0, v7, v8, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object v0, v1, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 137
    .line 138
    return-object v0

    .line 139
    :cond_6
    invoke-virtual {v5, v13, v14, v10}, Landroid/media/MediaExtractor;->seekTo(JI)V

    .line 140
    .line 141
    .line 142
    invoke-virtual {v12, v4}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 143
    .line 144
    .line 145
    move-result v13

    .line 146
    if-eqz v13, :cond_7

    .line 147
    .line 148
    goto :goto_4

    .line 149
    :cond_7
    const-string v13, "height"

    .line 150
    .line 151
    invoke-virtual {v12, v13}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 152
    .line 153
    .line 154
    move-result v13

    .line 155
    invoke-virtual {v12, v3}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 156
    .line 157
    .line 158
    move-result v14

    .line 159
    if-eqz v14, :cond_8

    .line 160
    .line 161
    invoke-virtual {v12, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 162
    .line 163
    .line 164
    move-result v3

    .line 165
    invoke-static {v13, v3}, Ljava/lang/Math;->max(II)I

    .line 166
    .line 167
    .line 168
    move-result v13

    .line 169
    :cond_8
    const-string v3, "width"

    .line 170
    .line 171
    invoke-virtual {v12, v3}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 172
    .line 173
    .line 174
    move-result v3

    .line 175
    invoke-virtual {v12, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    .line 176
    .line 177
    .line 178
    move-result v14

    .line 179
    if-eqz v14, :cond_9

    .line 180
    .line 181
    invoke-virtual {v12, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-static {v13, v0}, Ljava/lang/Math;->max(II)I

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    :cond_9
    add-int/lit8 v3, v3, 0xf

    .line 190
    .line 191
    div-int/lit8 v3, v3, 0x10

    .line 192
    .line 193
    add-int/lit8 v13, v13, 0xf

    .line 194
    .line 195
    div-int/lit8 v13, v13, 0x10

    .line 196
    .line 197
    mul-int/2addr v3, v13

    .line 198
    mul-int/lit16 v3, v3, 0x300

    .line 199
    .line 200
    div-int/lit8 v3, v3, 0x4

    .line 201
    .line 202
    invoke-virtual {v12, v4, v3}, Landroid/media/MediaFormat;->setInteger(Ljava/lang/String;I)V

    .line 203
    .line 204
    .line 205
    :goto_4
    invoke-virtual {v12, v4}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 210
    .line 211
    .line 212
    move-result-object v0

    .line 213
    new-instance v3, Landroid/media/MediaCodec$BufferInfo;

    .line 214
    .line 215
    invoke-direct {v3}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 216
    .line 217
    .line 218
    new-instance v4, Landroid/media/MediaMuxer;

    .line 219
    .line 220
    iget-object v13, v1, Lcom/tencent/could/huiyansdk/manager/f;->h:Ljava/lang/String;

    .line 221
    .line 222
    invoke-direct {v4, v13, v10}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V

    .line 223
    .line 224
    .line 225
    invoke-virtual {v4, v12}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    .line 226
    .line 227
    .line 228
    move-result v12

    .line 229
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/f;->c()I

    .line 230
    .line 231
    .line 232
    move-result v13

    .line 233
    invoke-virtual {v4, v13}, Landroid/media/MediaMuxer;->setOrientationHint(I)V

    .line 234
    .line 235
    .line 236
    invoke-virtual {v4}, Landroid/media/MediaMuxer;->start()V

    .line 237
    .line 238
    .line 239
    :goto_5
    invoke-virtual {v5, v0, v10}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    .line 240
    .line 241
    .line 242
    move-result v13

    .line 243
    if-gez v13, :cond_a

    .line 244
    .line 245
    invoke-virtual {v5, v11}, Landroid/media/MediaExtractor;->unselectTrack(I)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    .line 246
    .line 247
    .line 248
    :try_start_4
    invoke-virtual {v4}, Landroid/media/MediaMuxer;->stop()V

    .line 249
    .line 250
    .line 251
    invoke-virtual {v4}, Landroid/media/MediaMuxer;->release()V
    :try_end_4
    .catch Ljava/lang/IllegalStateException; {:try_start_4 .. :try_end_4} :catch_0
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2

    .line 252
    .line 253
    .line 254
    goto :goto_6

    .line 255
    :catch_0
    move-exception v0

    .line 256
    :try_start_5
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 257
    .line 258
    new-instance v4, Ljava/lang/StringBuilder;

    .line 259
    .line 260
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 261
    .line 262
    .line 263
    const-string v10, "cutMediaMuxer.stop(): "

    .line 264
    .line 265
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0}, Ljava/lang/Throwable;->getLocalizedMessage()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 276
    .line 277
    .line 278
    move-result-object v0

    .line 279
    invoke-virtual {v3, v7, v8, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :goto_6
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->release()V

    .line 283
    .line 284
    .line 285
    iget-object v0, v1, Lcom/tencent/could/huiyansdk/manager/f;->h:Ljava/lang/String;

    .line 286
    .line 287
    return-object v0

    .line 288
    :cond_a
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->getSampleFlags()I

    .line 289
    .line 290
    .line 291
    move-result v14

    .line 292
    iput v10, v3, Landroid/media/MediaCodec$BufferInfo;->offset:I

    .line 293
    .line 294
    iput v13, v3, Landroid/media/MediaCodec$BufferInfo;->size:I

    .line 295
    .line 296
    iput v14, v3, Landroid/media/MediaCodec$BufferInfo;->flags:I

    .line 297
    .line 298
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->getSampleTime()J

    .line 299
    .line 300
    .line 301
    move-result-wide v13

    .line 302
    iput-wide v13, v3, Landroid/media/MediaCodec$BufferInfo;->presentationTimeUs:J

    .line 303
    .line 304
    invoke-virtual {v4, v12, v0, v3}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 305
    .line 306
    .line 307
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->advance()Z

    .line 308
    .line 309
    .line 310
    goto :goto_5

    .line 311
    :catch_1
    invoke-virtual {v5}, Landroid/media/MediaExtractor;->release()V

    .line 312
    .line 313
    .line 314
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/e$a;->a:Lcom/tencent/could/huiyansdk/utils/e;
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_2

    .line 315
    .line 316
    const-string v3, "mediaExtractor.getTrackFormat(sourceVideoTrack) IllegalArgumentException "

    .line 317
    .line 318
    :try_start_6
    iget-boolean v0, v0, Lcom/tencent/could/huiyansdk/utils/e;->a:Z

    .line 319
    .line 320
    if-nez v0, :cond_b

    .line 321
    .line 322
    goto :goto_7

    .line 323
    :cond_b
    invoke-static {v8, v3}, Lcom/tencent/could/component/common/ai/log/AiLog;->error(Ljava/lang/String;Ljava/lang/String;)V

    .line 324
    .line 325
    .line 326
    :goto_7
    iget-object v0, v1, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_2

    .line 327
    .line 328
    return-object v0

    .line 329
    :catch_2
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 330
    .line 331
    const-string v3, "Open Video Fail!"

    .line 332
    .line 333
    invoke-virtual {v0, v7, v8, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 334
    .line 335
    .line 336
    if-eqz v2, :cond_c

    .line 337
    .line 338
    invoke-interface {v2, v9, v6}, Lcom/tencent/could/huiyansdk/callback/e;->a(ZLjava/lang/String;)V

    .line 339
    .line 340
    .line 341
    :cond_c
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/manager/f;->a()V

    .line 342
    .line 343
    .line 344
    const/4 v0, 0x0

    .line 345
    return-object v0
.end method

.method public final a(Ljava/lang/String;)Ljava/lang/String;
    .locals 7

    .line 346
    sget-object p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi$a;->a:Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;

    .line 347
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->a()Landroid/content/Context;

    move-result-object v0

    const/4 v1, 0x0

    const-string v2, "VideoRecorderManager"

    const/4 v3, 0x2

    if-nez v0, :cond_0

    .line 348
    sget-object p0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string p1, "Context is null"

    .line 349
    invoke-virtual {p0, v3, v2, p1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 350
    :cond_0
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "cloud-huiyan"

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v5, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "video"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 351
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/base/HuiYanBaseApi;->d:Z

    if-eqz p0, :cond_1

    .line 352
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Landroid/content/Context;->getExternalFilesDir(Ljava/lang/String;)Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    goto :goto_0

    .line 353
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 354
    :goto_0
    new-instance p1, Ljava/io/File;

    invoke-direct {p1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 355
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v0

    if-nez v0, :cond_2

    .line 356
    invoke-virtual {p1}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-nez v0, :cond_2

    .line 357
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v1, "Create parent dir error!"

    .line 358
    invoke-virtual {v0, v3, v2, v1}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 359
    :cond_2
    invoke-virtual {p1}, Ljava/io/File;->exists()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 360
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    move-result p1

    if-nez p1, :cond_3

    .line 361
    sget-object p1, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    const-string v0, "delete last video error!"

    .line 362
    invoke-virtual {p1, v3, v2, v0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    :cond_3
    return-object p0
.end method

.method public final a()V
    .locals 2

    .line 424
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/manager/f;->g:Ljava/lang/String;

    .line 425
    new-instance v0, Ljava/io/File;

    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 426
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 427
    :cond_0
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    move-result v0

    if-nez v0, :cond_1

    .line 428
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "delete temp video error path:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    const-string v0, "VideoRecorderManager"

    invoke-static {v0, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    :cond_1
    :goto_0
    return-void
.end method

.method public a(III)V
    .locals 4

    const/4 v0, 0x0

    .line 364
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->r:Z

    .line 365
    iput p1, p0, Lcom/tencent/could/huiyansdk/manager/f;->b:I

    .line 366
    iput p2, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    .line 367
    sget-object v1, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 368
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->d()Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_0

    .line 369
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->r:Z

    const/16 v2, 0x2c0

    .line 370
    iput v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    goto :goto_0

    :cond_0
    const/16 v2, 0x1c0

    .line 371
    iput v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->c:I

    :goto_0
    const/4 v2, 0x5

    if-ne v2, p3, :cond_1

    .line 372
    iput-boolean v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->t:Z

    .line 373
    :cond_1
    invoke-virtual {v1}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    move-result-object p3

    if-eqz p3, :cond_2

    .line 374
    invoke-virtual {p3}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isUseBackCamera()Z

    move-result p3

    if-eqz p3, :cond_2

    .line 375
    iput-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->s:Z

    .line 376
    :cond_2
    iput p1, p0, Lcom/tencent/could/huiyansdk/manager/f;->u:I

    .line 377
    iput p2, p0, Lcom/tencent/could/huiyansdk/manager/f;->v:I

    .line 378
    sget-object p1, Lcom/tencent/could/huiyansdk/utils/j$a;->a:Lcom/tencent/could/huiyansdk/utils/j;

    .line 379
    new-instance p2, Ll/k1r0;

    invoke-direct {p2, p0}, Ll/k1r0;-><init>(Lcom/tencent/could/huiyansdk/manager/f;)V

    invoke-virtual {p1, p2}, Lcom/tencent/could/huiyansdk/utils/j;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final a([BJ)V
    .locals 12

    .line 381
    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getInputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 382
    iget-object v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    invoke-virtual {v1}, Landroid/media/MediaCodec;->getOutputBuffers()[Ljava/nio/ByteBuffer;

    move-result-object v1

    .line 383
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    const-wide/16 v3, 0x0

    invoke-virtual {v2, v3, v4}, Landroid/media/MediaCodec;->dequeueInputBuffer(J)I

    move-result v6

    if-ltz v6, :cond_0

    .line 384
    aget-object v0, v0, v6

    .line 385
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    .line 386
    invoke-virtual {v0, p1}, Ljava/nio/ByteBuffer;->put([B)Ljava/nio/ByteBuffer;

    .line 387
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v7

    sub-long/2addr v7, p2

    const-wide/16 p2, 0x3e8

    div-long v9, v7, p2

    .line 388
    iget-object v5, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    array-length v8, p1

    const/4 v7, 0x0

    const/4 v11, 0x0

    invoke-virtual/range {v5 .. v11}, Landroid/media/MediaCodec;->queueInputBuffer(IIIJI)V

    .line 389
    :cond_0
    new-instance p1, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {p1}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 390
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    invoke-virtual {p2, p1, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result p2

    const/4 p3, -0x2

    if-ne p2, p3, :cond_1

    .line 391
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    iget-object v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    invoke-virtual {v0}, Landroid/media/MediaCodec;->getOutputFormat()Landroid/media/MediaFormat;

    move-result-object v0

    invoke-virtual {p3, v0}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result p3

    iput p3, p0, Lcom/tencent/could/huiyansdk/manager/f;->f:I

    if-ltz p3, :cond_1

    .line 392
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    invoke-virtual {p3}, Landroid/media/MediaMuxer;->start()V

    :cond_1
    :goto_0
    if-lez p2, :cond_3

    .line 393
    aget-object p3, v1, p2

    .line 394
    iget v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->f:I

    if-ltz v0, :cond_2

    .line 395
    iget-object v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->e:Landroid/media/MediaMuxer;

    invoke-virtual {v2, v0, p3, p1}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 396
    :cond_2
    iget-object p3, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    const/4 v0, 0x0

    invoke-virtual {p3, p2, v0}, Landroid/media/MediaCodec;->releaseOutputBuffer(IZ)V

    .line 397
    iget-object p2, p0, Lcom/tencent/could/huiyansdk/manager/f;->d:Landroid/media/MediaCodec;

    invoke-virtual {p2, p1, v3, v4}, Landroid/media/MediaCodec;->dequeueOutputBuffer(Landroid/media/MediaCodec$BufferInfo;J)I

    move-result p2

    goto :goto_0

    :cond_3
    return-void
.end method

.method public final a(I[I)Z
    .locals 3

    .line 363
    array-length p0, p2

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p0, :cond_1

    aget v2, p2, v1

    if-ne v2, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public final a([B)[B
    .locals 8

    .line 416
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->r:Z

    .line 417
    iget v2, p0, Lcom/tencent/could/huiyansdk/manager/f;->u:I

    if-eqz v0, :cond_0

    add-int/lit16 v0, v2, -0x500

    .line 418
    div-int/lit8 v4, v0, 0x2

    .line 419
    iget v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->v:I

    add-int/lit16 p0, v3, -0x2c0

    div-int/lit8 v5, p0, 0x2

    const/16 v6, 0x500

    const/16 v7, 0x2c0

    move-object v1, p1

    .line 420
    invoke-static/range {v1 .. v7}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->clipNV21([BIIIIII)[B

    move-result-object p0

    return-object p0

    :cond_0
    move-object v1, p1

    add-int/lit16 p1, v2, -0x280

    .line 421
    div-int/lit8 v4, p1, 0x2

    .line 422
    iget v3, p0, Lcom/tencent/could/huiyansdk/manager/f;->v:I

    add-int/lit16 p0, v3, -0x1c0

    div-int/lit8 v5, p0, 0x2

    const/16 v6, 0x280

    const/16 v7, 0x1c0

    .line 423
    invoke-static/range {v1 .. v7}, Lcom/tencent/could/huiyansdk/utils/CommonUtils;->clipNV21([BIIIIII)[B

    move-result-object p0

    return-object p0
.end method

.method public final a([BII)[B
    .locals 4

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 398
    :cond_0
    iget p0, p0, Lcom/tencent/could/huiyansdk/manager/f;->o:I

    const/16 v1, 0x13

    const/4 v2, 0x0

    if-eq p0, v1, :cond_6

    const/16 v1, 0x15

    if-eq p0, v1, :cond_1

    return-object v0

    .line 399
    :cond_1
    sget-object p0, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 400
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/utils/a;->a()[B

    move-result-object p0

    if-nez p0, :cond_2

    mul-int p0, p2, p3

    mul-int/lit8 p0, p0, 0x3

    .line 401
    div-int/lit8 p0, p0, 0x2

    new-array p0, p0, [B

    :cond_2
    mul-int/2addr p2, p3

    move p3, v2

    :goto_0
    if-ge p3, p2, :cond_3

    .line 402
    aget-byte v0, p1, p3

    aput-byte v0, p0, p3

    add-int/lit8 p3, p3, 0x1

    goto :goto_0

    :cond_3
    move p3, v2

    .line 403
    :goto_1
    div-int/lit8 v0, p2, 0x2

    if-ge p3, v0, :cond_4

    add-int v0, p2, p3

    add-int/lit8 v1, v0, -0x1

    .line 404
    aget-byte v0, p1, v0

    aput-byte v0, p0, v1

    add-int/lit8 p3, p3, 0x2

    goto :goto_1

    :cond_4
    :goto_2
    if-ge v2, v0, :cond_5

    add-int p3, p2, v2

    add-int/lit8 v1, p3, -0x1

    .line 405
    aget-byte v1, p1, v1

    aput-byte v1, p0, p3

    add-int/lit8 v2, v2, 0x2

    goto :goto_2

    :cond_5
    return-object p0

    .line 406
    :cond_6
    sget-object p0, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 407
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/utils/a;->a()[B

    move-result-object p0

    if-nez p0, :cond_7

    mul-int p0, p2, p3

    mul-int/lit8 p0, p0, 0x3

    .line 408
    div-int/lit8 p0, p0, 0x2

    new-array p0, p0, [B

    :cond_7
    mul-int/2addr p2, p3

    .line 409
    invoke-static {p0, v2, p2}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p3

    .line 410
    div-int/lit8 v0, p2, 0x4

    invoke-static {p0, p2, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v1

    add-int v3, p2, v0

    .line 411
    invoke-static {p0, v3, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 412
    invoke-virtual {p3, p1, v2, p2}, Ljava/nio/ByteBuffer;->put([BII)Ljava/nio/ByteBuffer;

    .line 413
    :goto_3
    array-length p3, p1

    if-ge p2, p3, :cond_8

    .line 414
    aget-byte p3, p1, p2

    invoke-virtual {v0, p3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 p3, p2, 0x1

    .line 415
    aget-byte p3, p1, p3

    invoke-virtual {v1, p3}, Ljava/nio/ByteBuffer;->put(B)Ljava/nio/ByteBuffer;

    add-int/lit8 p2, p2, 0x2

    goto :goto_3

    :cond_8
    return-object p0
.end method

.method public final b()V
    .locals 2

    .line 77
    sget-object v0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 78
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 79
    :cond_0
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isRecordVideo()Z

    move-result v1

    iput-boolean v1, p0, Lcom/tencent/could/huiyansdk/manager/f;->q:Z

    .line 80
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isDeleteVideoCache()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 81
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/j$a;->a:Lcom/tencent/could/huiyansdk/utils/j;

    .line 82
    new-instance v1, Ll/i1r0;

    invoke-direct {v1, p0}, Ll/i1r0;-><init>(Lcom/tencent/could/huiyansdk/manager/f;)V

    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/j;->a(Ljava/lang/Runnable;)V

    :cond_1
    :goto_0
    return-void
.end method

.method public final b([B)V
    .locals 0

    .line 74
    sget-object p0, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 75
    iget-object p0, p0, Lcom/tencent/could/huiyansdk/utils/a;->a:Lcom/tencent/could/huiyansdk/utils/i;

    if-nez p0, :cond_0

    return-void

    .line 76
    :cond_0
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/utils/i;->release(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b([BII)V
    .locals 7

    .line 1
    const/4 p0, 0x0

    .line 2
    move v0, p0

    .line 3
    :cond_0
    if-ge v0, p3, :cond_1

    .line 4
    .line 5
    mul-int v1, v0, p2

    .line 6
    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    mul-int v2, v0, p2

    .line 10
    .line 11
    add-int/lit8 v2, v2, -0x1

    .line 12
    .line 13
    :goto_0
    if-ge v1, v2, :cond_0

    .line 14
    .line 15
    aget-byte v3, p1, v1

    .line 16
    .line 17
    aget-byte v4, p1, v2

    .line 18
    .line 19
    aput-byte v4, p1, v1

    .line 20
    .line 21
    aput-byte v3, p1, v2

    .line 22
    .line 23
    add-int/lit8 v1, v1, 0x1

    .line 24
    .line 25
    add-int/lit8 v2, v2, -0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    mul-int v0, p2, p3

    .line 29
    .line 30
    :cond_2
    div-int/lit8 v1, p3, 0x2

    .line 31
    .line 32
    if-ge p0, v1, :cond_3

    .line 33
    .line 34
    mul-int v1, p0, p2

    .line 35
    .line 36
    add-int/lit8 p0, p0, 0x1

    .line 37
    .line 38
    mul-int v2, p0, p2

    .line 39
    .line 40
    add-int/lit8 v2, v2, -0x2

    .line 41
    .line 42
    :goto_1
    if-ge v1, v2, :cond_2

    .line 43
    .line 44
    add-int v3, v1, v0

    .line 45
    .line 46
    aget-byte v4, p1, v3

    .line 47
    .line 48
    add-int v5, v2, v0

    .line 49
    .line 50
    aget-byte v6, p1, v5

    .line 51
    .line 52
    aput-byte v6, p1, v3

    .line 53
    .line 54
    aput-byte v4, p1, v5

    .line 55
    .line 56
    add-int/lit8 v3, v3, 0x1

    .line 57
    .line 58
    aget-byte v4, p1, v3

    .line 59
    .line 60
    add-int/lit8 v5, v5, 0x1

    .line 61
    .line 62
    aget-byte v6, p1, v5

    .line 63
    .line 64
    aput-byte v6, p1, v3

    .line 65
    .line 66
    aput-byte v4, p1, v5

    .line 67
    .line 68
    add-int/lit8 v1, v1, 0x2

    .line 69
    .line 70
    add-int/lit8 v2, v2, -0x2

    .line 71
    .line 72
    goto :goto_1

    .line 73
    :cond_3
    return-void
.end method

.method public final c()I
    .locals 1

    .line 62
    sget-object p0, Lcom/tencent/could/huiyansdk/api/j$a;->a:Lcom/tencent/could/huiyansdk/api/j;

    .line 63
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/api/j;->b()Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;

    move-result-object p0

    const/16 v0, 0x5a

    if-nez p0, :cond_0

    return v0

    .line 64
    :cond_0
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/entity/HuiYanSdkConfig;->isLandMode()Z

    move-result p0

    if-nez p0, :cond_1

    return v0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public c(Lcom/tencent/could/huiyansdk/callback/e;)V
    .locals 3

    .line 65
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->d()Z

    move-result v0

    const-string v1, ""

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    if-eqz p1, :cond_1

    .line 66
    invoke-interface {p1, v2, v1}, Lcom/tencent/could/huiyansdk/callback/e;->a(ZLjava/lang/String;)V

    return-void

    .line 67
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->j:Z

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    .line 68
    invoke-interface {p1, v2, v1}, Lcom/tencent/could/huiyansdk/callback/e;->a(ZLjava/lang/String;)V

    :cond_1
    return-void

    .line 69
    :cond_2
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/j$a;->a:Lcom/tencent/could/huiyansdk/utils/j;

    .line 70
    new-instance v1, Ll/m1r0;

    invoke-direct {v1, p0, p1}, Ll/m1r0;-><init>(Lcom/tencent/could/huiyansdk/manager/f;Lcom/tencent/could/huiyansdk/callback/e;)V

    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/j;->a(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final c([BII)[B
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/a$a;->a:Lcom/tencent/could/huiyansdk/utils/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/tencent/could/huiyansdk/utils/a;->a()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    mul-int v0, p2, p3

    .line 10
    .line 11
    mul-int/lit8 v0, v0, 0x3

    .line 12
    .line 13
    div-int/lit8 v0, v0, 0x2

    .line 14
    .line 15
    new-array v0, v0, [B

    .line 16
    .line 17
    :cond_0
    mul-int/2addr p2, p3

    .line 18
    add-int/lit8 p3, p2, -0x1

    .line 19
    .line 20
    const/4 v1, 0x0

    .line 21
    :goto_0
    if-ltz p3, :cond_1

    .line 22
    .line 23
    aget-byte v2, p1, p3

    .line 24
    .line 25
    aput-byte v2, v0, v1

    .line 26
    .line 27
    add-int/lit8 v1, v1, 0x1

    .line 28
    .line 29
    add-int/lit8 p3, p3, -0x1

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_1
    mul-int/lit8 p3, p2, 0x3

    .line 33
    .line 34
    div-int/lit8 p3, p3, 0x2

    .line 35
    .line 36
    add-int/lit8 p3, p3, -0x1

    .line 37
    .line 38
    :goto_1
    if-lt p3, p2, :cond_2

    .line 39
    .line 40
    add-int/lit8 v2, v1, 0x1

    .line 41
    .line 42
    add-int/lit8 v3, p3, -0x1

    .line 43
    .line 44
    aget-byte v3, p1, v3

    .line 45
    .line 46
    aput-byte v3, v0, v1

    .line 47
    .line 48
    add-int/lit8 v1, v1, 0x2

    .line 49
    .line 50
    aget-byte v3, p1, p3

    .line 51
    .line 52
    aput-byte v3, v0, v2

    .line 53
    .line 54
    add-int/lit8 p3, p3, -0x2

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_2
    invoke-virtual {p0, p1}, Lcom/tencent/could/huiyansdk/manager/f;->b([B)V

    .line 58
    .line 59
    .line 60
    return-object v0
.end method

.method public final d()Z
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->q:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    return v1

    .line 7
    :cond_0
    iget-boolean v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->n:Z

    .line 8
    .line 9
    if-nez v0, :cond_1

    .line 10
    .line 11
    return v1

    .line 12
    :cond_1
    iget-boolean p0, p0, Lcom/tencent/could/huiyansdk/manager/f;->p:Z

    .line 13
    .line 14
    if-eqz p0, :cond_2

    .line 15
    .line 16
    return v1

    .line 17
    :cond_2
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public h()V
    .locals 4

    .line 1
    sget-object v0, Lcom/tencent/could/huiyansdk/manager/e$a;->a:Lcom/tencent/could/huiyansdk/manager/e;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    const-string v2, "VideoRecorderManager"

    .line 5
    .line 6
    const-string v3, "start thread encoder video!"

    .line 7
    .line 8
    invoke-virtual {v0, v1, v2, v3}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    sget-object v3, Lcom/tencent/could/huiyansdk/manager/b$b;->a:Lcom/tencent/could/huiyansdk/manager/b;

    .line 12
    .line 13
    iput-boolean v1, v3, Lcom/tencent/could/huiyansdk/manager/b;->s:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/tencent/could/huiyansdk/manager/f;->d()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const-string p0, "start thread not need video!"

    .line 22
    .line 23
    const/4 v1, 0x2

    .line 24
    invoke-virtual {v0, v1, v2, p0}, Lcom/tencent/could/huiyansdk/manager/e;->a(ILjava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p0, Lcom/tencent/could/huiyansdk/manager/f;->m:J

    .line 33
    .line 34
    sget-object v0, Lcom/tencent/could/huiyansdk/utils/j$a;->a:Lcom/tencent/could/huiyansdk/utils/j;

    .line 35
    .line 36
    new-instance v1, Ll/g1r0;

    .line 37
    .line 38
    invoke-direct {v1, p0}, Ll/g1r0;-><init>(Lcom/tencent/could/huiyansdk/manager/f;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v0, v1}, Lcom/tencent/could/huiyansdk/utils/j;->a(Ljava/lang/Runnable;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method
