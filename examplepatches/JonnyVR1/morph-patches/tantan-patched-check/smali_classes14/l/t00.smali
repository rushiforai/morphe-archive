.class public Ll/t00;
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

.method public static final a(Lcom/p1/mobile/putong/account/data/Video;)Z
    .locals 7
    .param p0    # Lcom/p1/mobile/putong/account/data/Video;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/account/data/Video;->path:Ljava/lang/String;

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
    iput-wide v3, p0, Lcom/p1/mobile/putong/account/data/Video;->length:J

    .line 29
    .line 30
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getWidth()I

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Video;->width:I

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/immomo/moment/mediautils/VideoDataRetrieverBySoft;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v0

    .line 40
    iput v0, p0, Lcom/p1/mobile/putong/account/data/Video;->height:I
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
