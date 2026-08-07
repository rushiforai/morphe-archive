.class public Lcom/momo/xengine/media/VideoSplicersImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IVideoSplicers;
.implements Ljava/lang/Runnable;


# instance fields
.field private outputPath:Ljava/lang/String;

.field private pointer:J

.field private splicersCallback:Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

.field private final videoList:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>()V
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
    iput-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 10
    .line 11
    const-wide/16 v0, 0x0

    .line 12
    .line 13
    iput-wide v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    iput-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->outputPath:Ljava/lang/String;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->splicersCallback:Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic access$000(Lcom/momo/xengine/media/VideoSplicersImpl;)Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->splicersCallback:Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public static synthetic access$100(Lcom/momo/xengine/media/VideoSplicersImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/media/VideoSplicersImpl;->stop()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic access$200(Lcom/momo/xengine/media/VideoSplicersImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/momo/xengine/media/VideoSplicersImpl;->release()V

    .line 2
    .line 3
    .line 4
    return-void
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

.method private native nativeInit(Ljava/lang/String;Ljava/util/List;)J
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)J"
        }
    .end annotation
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetCallback(JLcom/momo/xengine/media/IVideoSplicers$SplicersCallback;)V
.end method

.method private native nativeStart(J)V
.end method

.method private native nativeStop(J)V
.end method

.method private release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoSplicersImpl;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method private stop()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

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
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoSplicersImpl;->nativeStop(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public getList()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public init(Ljava/lang/String;)Z
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_4

    .line 7
    .line 8
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 9
    .line 10
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    goto :goto_2

    .line 17
    :cond_0
    iput-object p1, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->outputPath:Ljava/lang/String;

    .line 18
    .line 19
    move v0, v1

    .line 20
    :goto_0
    iget-object v2, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 21
    .line 22
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    iget-object v3, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 27
    .line 28
    if-ge v0, v2, :cond_3

    .line 29
    .line 30
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v2

    .line 34
    check-cast v2, Ljava/lang/String;

    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    if-nez v2, :cond_2

    .line 41
    .line 42
    iget-object v2, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 43
    .line 44
    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    check-cast v2, Ljava/lang/String;

    .line 49
    .line 50
    invoke-static {v2}, Lcom/momo/xengine/media/VideoSplicersImpl;->isFileExists(Ljava/lang/String;)Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    if-nez v2, :cond_1

    .line 55
    .line 56
    goto :goto_1

    .line 57
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 58
    .line 59
    goto :goto_0

    .line 60
    :cond_2
    :goto_1
    return v1

    .line 61
    :cond_3
    invoke-direct {p0, p1, v3}, Lcom/momo/xengine/media/VideoSplicersImpl;->nativeInit(Ljava/lang/String;Ljava/util/List;)J

    .line 62
    .line 63
    .line 64
    move-result-wide v2

    .line 65
    iput-wide v2, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 66
    .line 67
    const-wide/16 p0, 0x0

    .line 68
    .line 69
    cmp-long p0, v2, p0

    .line 70
    .line 71
    if-eqz p0, :cond_4

    .line 72
    .line 73
    const/4 p0, 0x1

    .line 74
    return p0

    .line 75
    :cond_4
    :goto_2
    return v1
.end method

.method public run()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->splicersCallback:Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->outputPath:Ljava/lang/String;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->videoList:Ljava/util/List;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    cmp-long v2, v0, v2

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    new-instance v2, Lcom/momo/xengine/media/VideoSplicersImpl$1;

    .line 32
    .line 33
    invoke-direct {v2, p0}, Lcom/momo/xengine/media/VideoSplicersImpl$1;-><init>(Lcom/momo/xengine/media/VideoSplicersImpl;)V

    .line 34
    .line 35
    .line 36
    invoke-direct {p0, v0, v1, v2}, Lcom/momo/xengine/media/VideoSplicersImpl;->nativeSetCallback(JLcom/momo/xengine/media/IVideoSplicers$SplicersCallback;)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget-wide v0, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->pointer:J

    .line 40
    .line 41
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/VideoSplicersImpl;->nativeStart(J)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public setSplicersCallback(Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;)V
    .locals 0
    .param p1    # Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    iput-object p1, p0, Lcom/momo/xengine/media/VideoSplicersImpl;->splicersCallback:Lcom/momo/xengine/media/IVideoSplicers$SplicersCallback;

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
