.class public Ll/ikl0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z
    .locals 3

    .line 1
    invoke-static {p0}, Ll/ikl0;->b(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->rotate:I

    .line 6
    .line 7
    const/16 v2, 0x5a

    .line 8
    .line 9
    if-eq v1, v2, :cond_1

    .line 10
    .line 11
    const/16 v2, 0x10e

    .line 12
    .line 13
    if-ne v1, v2, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    return v0

    .line 17
    :cond_1
    :goto_0
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 20
    .line 21
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 22
    .line 23
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 24
    .line 25
    return v0
.end method

.method public static final b(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z
    .locals 7
    .param p0    # Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    new-instance v1, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getDuration()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    const-wide/16 v5, 0x3e8

    .line 26
    .line 27
    div-long/2addr v3, v5

    .line 28
    iput-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I

    .line 41
    .line 42
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getRotation()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->rotate:I

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getFrameRate()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    int-to-float v0, v0

    .line 53
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->frameRate:F
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 54
    .line 55
    const/4 v2, 0x1

    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p0

    .line 58
    goto :goto_1

    .line 59
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 60
    .line 61
    .line 62
    return v2

    .line 63
    :goto_1
    :try_start_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 64
    .line 65
    .line 66
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0, p0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 71
    .line 72
    .line 73
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 74
    .line 75
    .line 76
    return v2

    .line 77
    :catchall_1
    move-exception p0

    .line 78
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 79
    .line 80
    .line 81
    throw p0

    .line 82
    :cond_1
    const-string p0, "Video path cannot be null."

    .line 83
    .line 84
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    return v2
.end method

.method public static final c(Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;)Z
    .locals 7
    .param p0    # Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->path:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v1

    .line 7
    const/4 v2, 0x0

    .line 8
    if-nez v1, :cond_1

    .line 9
    .line 10
    new-instance v1, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;

    .line 11
    .line 12
    invoke-direct {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;-><init>()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    invoke-virtual {v1, v0}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->init(Ljava/lang/String;)Z

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    if-eqz v0, :cond_0

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getDuration()J

    .line 22
    .line 23
    .line 24
    move-result-wide v3

    .line 25
    const-wide/16 v5, 0x3e8

    .line 26
    .line 27
    div-long/2addr v3, v5

    .line 28
    iput-wide v3, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->length:J

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->width:I

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/camera/momosdk/Video;->height:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 41
    .line 42
    const/4 v2, 0x1

    .line 43
    goto :goto_0

    .line 44
    :catchall_0
    move-exception p0

    .line 45
    goto :goto_1

    .line 46
    :cond_0
    :goto_0
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 47
    .line 48
    .line 49
    return v2

    .line 50
    :goto_1
    :try_start_1
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-static {}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->getInstance()Lcom/tantanapp/media/ttmediautils/log/Log4Android;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0, p0}, Lcom/tantanapp/media/ttmediautils/log/Log4Android;->e(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    .line 59
    .line 60
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 61
    .line 62
    .line 63
    return v2

    .line 64
    :catchall_1
    move-exception p0

    .line 65
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->release()V

    .line 66
    .line 67
    .line 68
    throw p0

    .line 69
    :cond_1
    const-string p0, "Video path cannot be null."

    .line 70
    .line 71
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    return v2
.end method
