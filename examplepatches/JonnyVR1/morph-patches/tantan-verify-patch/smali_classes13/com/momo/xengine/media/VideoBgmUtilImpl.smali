.class public Lcom/momo/xengine/media/VideoBgmUtilImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoBgmUtil;
.implements Ljava/lang/Runnable;


# instance fields
.field private config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

.field private pointer:J

.field private progressCallback:Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xengine/media/VideoBgmUtilImpl;)Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->progressCallback:Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method private static isFileExists(Ljava/lang/String;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method private native nativeInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;F)J
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetProgressCallback(JLcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;)V
.end method

.method private native nativeStart(J)V
.end method

.method private native nativeStop(J)V
.end method


# virtual methods
.method public init(Lcom/momo/xengine/media/VideoBgmChangerConfig;)Z
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_2

    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getVideoPath()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-eqz v1, :cond_2

    .line 9
    .line 10
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getVideoPath()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-nez v1, :cond_2

    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getBgmPath()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getBgmPath()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    if-nez v1, :cond_2

    .line 35
    .line 36
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getOutputPath()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getOutputPath()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v1

    .line 46
    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    if-eqz v1, :cond_0

    .line 51
    .line 52
    goto :goto_0

    .line 53
    :cond_0
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getVideoPath()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    invoke-static {v1}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->isFileExists(Ljava/lang/String;)Z

    .line 58
    .line 59
    .line 60
    move-result v1

    .line 61
    if-eqz v1, :cond_2

    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getBgmPath()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v1

    .line 67
    invoke-static {v1}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->isFileExists(Ljava/lang/String;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-nez v1, :cond_1

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

    .line 75
    .line 76
    const/4 p0, 0x1

    .line 77
    return p0

    .line 78
    :cond_2
    :goto_0
    return v0
.end method

.method public release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-nez v4, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->nativeRelease(J)V

    .line 11
    .line 12
    .line 13
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 14
    .line 15
    return-void
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->progressCallback:Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getVideoPath()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iget-object v1, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

    .line 14
    .line 15
    invoke-virtual {v1}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getBgmPath()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iget-object v2, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

    .line 20
    .line 21
    invoke-virtual {v2}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getOutputPath()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    iget-object v3, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->config:Lcom/momo/xengine/media/VideoBgmChangerConfig;

    .line 26
    .line 27
    invoke-virtual {v3}, Lcom/momo/xengine/media/VideoBgmChangerConfig;->getVolumeRate()F

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    invoke-direct {p0, v0, v1, v2, v3}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->nativeInit(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;F)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 36
    .line 37
    const-wide/16 v2, 0x0

    .line 38
    .line 39
    cmp-long v0, v0, v2

    .line 40
    .line 41
    if-nez v0, :cond_0

    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->progressCallback:Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 44
    .line 45
    const/4 v1, 0x0

    .line 46
    invoke-interface {v0, v1}, Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;->onResult(Z)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 50
    .line 51
    new-instance v2, Lcom/momo/xengine/media/VideoBgmUtilImpl$1;

    .line 52
    .line 53
    invoke-direct {v2, p0}, Lcom/momo/xengine/media/VideoBgmUtilImpl$1;-><init>(Lcom/momo/xengine/media/VideoBgmUtilImpl;)V

    .line 54
    .line 55
    .line 56
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->nativeSetProgressCallback(JLcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 60
    .line 61
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->nativeStart(J)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public setProgressCallback(Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;)V
    .locals 0
    .param p1    # Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->progressCallback:Lcom/momo/xengine/media/IVideoBgmUtil$ProgressCallback;

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Thread;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public stop()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoBgmUtilImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoBgmUtilImpl;->nativeStop(J)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
