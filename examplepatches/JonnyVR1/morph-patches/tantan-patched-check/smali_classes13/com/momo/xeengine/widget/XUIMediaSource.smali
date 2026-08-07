.class public Lcom/momo/xeengine/widget/XUIMediaSource;
.super Landroid/media/MediaDataSource;
.source "SourceFile"


# instance fields
.field private nativeHandle:J

.field private final path:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Landroid/media/MediaDataSource;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J

    .line 7
    .line 8
    iput-object p1, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->path:Ljava/lang/String;

    .line 9
    .line 10
    invoke-direct {p0, p1}, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeOpen(Ljava/lang/String;)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J

    .line 15
    .line 16
    return-void
.end method

.method private native nativeClose(J)V
.end method

.method private native nativeGetSize(J)J
.end method

.method private native nativeOpen(Ljava/lang/String;)J
.end method

.method private native nativeReadAt(JJ[BII)I
.end method


# virtual methods
.method public close()V
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeClose(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_1

    .line 18
    :cond_0
    :goto_0
    monitor-exit p0

    .line 19
    return-void

    .line 20
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v0
.end method

.method public getPath()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->path:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()J
    .locals 5

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v4, v0, v2

    .line 7
    .line 8
    if-eqz v4, :cond_0

    .line 9
    .line 10
    invoke-direct {p0, v0, v1}, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeGetSize(J)J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    monitor-exit p0

    .line 15
    return-wide v0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_0

    .line 18
    :cond_0
    monitor-exit p0

    .line 19
    return-wide v2

    .line 20
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw v0
.end method

.method public readAt(J[BII)I
    .locals 9

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v2, p0, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeHandle:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    cmp-long v0, v2, v0

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    move-object v1, p0

    .line 11
    move-wide v4, p1

    .line 12
    move-object v6, p3

    .line 13
    move v7, p4

    .line 14
    move v8, p5

    .line 15
    :try_start_1
    invoke-direct/range {v1 .. v8}, Lcom/momo/xeengine/widget/XUIMediaSource;->nativeReadAt(JJ[BII)I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    monitor-exit v1

    .line 20
    return p0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    :goto_0
    move-object p0, v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    move-object v1, p0

    .line 25
    monitor-exit v1

    .line 26
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :catchall_1
    move-exception v0

    .line 29
    move-object v1, p0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    throw p0
.end method
