.class Lcom/momo/xengine/media/VideoFrameExtractorImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoFrameExtractor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;
    }
.end annotation


# instance fields
.field private final frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

.field private pointer:J

.field private final singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

.field private final videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

.field private videoSize:Landroid/util/Size;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/xengine/media/types/VideoFrame;

    .line 5
    .line 6
    invoke-direct {v0}, Lcom/momo/xengine/media/types/VideoFrame;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

    .line 10
    .line 11
    new-instance v0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 12
    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-direct {v0, v1}, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;-><init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl$1;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 18
    .line 19
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 24
    .line 25
    return-void
.end method

.method public static synthetic a(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    if-eqz v0, :cond_3

    .line 8
    .line 9
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 10
    .line 11
    iget-object v0, v0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->colors:[I

    .line 12
    .line 13
    array-length v0, v0

    .line 14
    iget-object v1, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 15
    .line 16
    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    iget-object v2, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 21
    .line 22
    invoke-virtual {v2}, Landroid/util/Size;->getHeight()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    mul-int/2addr v1, v2

    .line 27
    if-ge v0, v1, :cond_0

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_2

    .line 44
    .line 45
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    check-cast v1, Ljava/lang/Long;

    .line 50
    .line 51
    iget-wide v3, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/Long;->longValue()J

    .line 54
    .line 55
    .line 56
    move-result-wide v5

    .line 57
    iget-object v7, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 58
    .line 59
    move-object v2, p0

    .line 60
    invoke-direct/range {v2 .. v7}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->nativeGetFrameAt(JJLcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;)Z

    .line 61
    .line 62
    .line 63
    move-result p0

    .line 64
    if-eqz p0, :cond_1

    .line 65
    .line 66
    iget-object p0, v2, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 67
    .line 68
    iget-object v3, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->colors:[I

    .line 69
    .line 70
    iget v5, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->lineSize:I

    .line 71
    .line 72
    iget v6, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->width:I

    .line 73
    .line 74
    iget v7, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->height:I

    .line 75
    .line 76
    sget-object v8, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 77
    .line 78
    const/4 v4, 0x0

    .line 79
    invoke-static/range {v3 .. v8}, Landroid/graphics/Bitmap;->createBitmap([IIIIILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {v0, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    .line 85
    .line 86
    :cond_1
    move-object p0, v2

    .line 87
    goto :goto_0

    .line 88
    :cond_2
    invoke-interface {p2, v0}, Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;->onResult(Ljava/util/List;)V

    .line 89
    .line 90
    .line 91
    :cond_3
    :goto_1
    return-void
.end method

.method public static synthetic b(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Landroid/util/Size;)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/util/Size;->getWidth()I

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    invoke-virtual {p1}, Landroid/util/Size;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    invoke-direct {p0, v0, v1, v2, p1}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->nativeSetFrameSize(JII)V

    .line 18
    .line 19
    .line 20
    :cond_0
    return-void
.end method

.method public static synthetic c(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;J)V
    .locals 9

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v0, v0, v2

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-eqz v0, :cond_2

    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/momo/xengine/media/types/VideoFrame;->getData()[B

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    array-length v0, v0

    .line 17
    iget-object v2, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 18
    .line 19
    invoke-virtual {v2}, Landroid/util/Size;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v2

    .line 23
    iget-object v3, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 24
    .line 25
    invoke-virtual {v3}, Landroid/util/Size;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    mul-int/2addr v2, v3

    .line 30
    mul-int/lit8 v2, v2, 0x4

    .line 31
    .line 32
    if-ge v0, v2, :cond_0

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-wide v4, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 36
    .line 37
    iget-object v8, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

    .line 38
    .line 39
    move-object v3, p0

    .line 40
    move-wide v6, p2

    .line 41
    invoke-direct/range {v3 .. v8}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->nativeGetFrameRGBAt(JJLcom/momo/xengine/media/types/VideoFrame;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    iget-object p0, v3, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/momo/xengine/media/types/VideoFrame;->getData()[B

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-interface {p1, p0}, Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;->onResult([B)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    invoke-interface {p1, v1}, Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;->onResult([B)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    :goto_0
    invoke-interface {p1, v1}, Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;->onResult([B)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public static synthetic d(Lcom/momo/xengine/media/VideoFrameExtractorImpl;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 9
    .line 10
    return-void
.end method

.method private native nativeGetFrameAt(JJLcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;)Z
    .param p5    # Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method private native nativeGetFrameRGBAt(JJLcom/momo/xengine/media/types/VideoFrame;)Z
    .param p5    # Lcom/momo/xengine/media/types/VideoFrame;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method private native nativeGetVideoHeight(J)I
.end method

.method private native nativeGetVideoWidth(J)I
.end method

.method private native nativeInit(Ljava/lang/String;DII)J
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetFrameSize(JII)V
.end method


# virtual methods
.method public extractorFrames(Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V
    .locals 2
    .param p1    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/Long;",
            ">;",
            "Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xengine/media/a;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1, p2}, Lcom/momo/xengine/media/a;-><init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Ljava/util/List;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFramesCallback;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getFrameRGBDataAt(JLcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;)V
    .locals 2
    .param p3    # Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xengine/media/c;

    .line 4
    .line 5
    invoke-direct {v1, p0, p3, p1, p2}, Lcom/momo/xengine/media/c;-><init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Lcom/momo/xengine/media/IVideoFrameExtractor$ExtractorFrameCallback;J)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public getVideoSize()Landroid/util/Size;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Ljava/lang/String;FDII)Z
    .locals 0
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    move-wide p2, p3

    .line 2
    move p4, p5

    .line 3
    move p5, p6

    .line 4
    invoke-direct/range {p0 .. p5}, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->nativeInit(Ljava/lang/String;DII)J

    .line 5
    .line 6
    .line 7
    move-result-wide p1

    .line 8
    iput-wide p1, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->pointer:J

    .line 9
    .line 10
    new-instance p1, Landroid/util/Size;

    .line 11
    .line 12
    invoke-direct {p1, p4, p5}, Landroid/util/Size;-><init>(II)V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoSize:Landroid/util/Size;

    .line 16
    .line 17
    iget-object p1, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->videoFrame:Lcom/momo/xengine/media/types/VideoFrame;

    .line 18
    .line 19
    mul-int/2addr p5, p4

    .line 20
    mul-int/lit8 p2, p5, 0x4

    .line 21
    .line 22
    new-array p2, p2, [B

    .line 23
    .line 24
    invoke-virtual {p1, p2}, Lcom/momo/xengine/media/types/VideoFrame;->setData([B)V

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->frame:Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;

    .line 28
    .line 29
    new-array p1, p5, [I

    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl$Frame;->colors:[I

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xengine/media/d;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/momo/xengine/media/d;-><init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setFrameSize(Landroid/util/Size;)V
    .locals 2
    .param p1    # Landroid/util/Size;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoFrameExtractorImpl;->singleThreadExecutor:Ljava/util/concurrent/ExecutorService;

    .line 2
    .line 3
    new-instance v1, Lcom/momo/xengine/media/b;

    .line 4
    .line 5
    invoke-direct {v1, p0, p1}, Lcom/momo/xengine/media/b;-><init>(Lcom/momo/xengine/media/VideoFrameExtractorImpl;Landroid/util/Size;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method
