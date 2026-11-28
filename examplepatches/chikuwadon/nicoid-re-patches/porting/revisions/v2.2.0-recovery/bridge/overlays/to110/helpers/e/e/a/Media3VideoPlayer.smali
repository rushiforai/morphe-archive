.class public final Le/e/a/Media3VideoPlayer;
.super Ljava/lang/Object;
.source "Media3VideoPlayer.java"

# interfaces
.implements Landroidx/media3/common/Player$Listener;


# static fields
.field private static final PREVIEW_SEEK:Landroidx/media3/exoplayer/SeekParameters;


# instance fields
.field private bindingRetainedView:Z

.field private completedFrameSurface:Landroid/view/Surface;

.field private completedReturn:Z

.field private final context:Landroid/content/Context;

.field private firstFrameStartedAt:J

.field private handoffOutput:Landroid/view/Surface;

.field private listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

.field private final main:Landroid/os/Handler;

.field private networkAttempts:I

.field private networkBuffering:Z

.field private ownsCurrentSurface:Z

.field private ownsViewSurface:Z

.field private pendingSeek:Z

.field private final player:Landroidx/media3/exoplayer/ExoPlayer;

.field private popupReady:Ljava/lang/Runnable;

.field private final popupReadyTimeout:Ljava/lang/Runnable;

.field private progressBar:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/widget/SeekBar;",
            ">;"
        }
    .end annotation
.end field

.field private released:Z

.field private renderedOutput:Ljava/lang/Object;

.field private requestedSeek:J

.field private final retryNetwork:Ljava/lang/Runnable;

.field private final sampleWhilePlaying:Ljava/lang/Runnable;

.field private volatile sampledBuffer:I

.field private volatile sampledDuration:J

.field private volatile sampledPlaying:Z

.field private volatile sampledPosition:J

.field private volatile sampledSpeed:F

.field private scrubbing:Z

.field private skipPopupAutoStart:Z

.field private soughtAfterCompletion:Z

.field private surface:Landroid/view/Surface;

.field private final updateBuffer:Ljava/lang/Runnable;

.field private waitingForDestination:Z


# direct methods
.method public static synthetic $r8$lambda$NK1G5Lec5eThG4ZqVxXe0usJwY0(Le/e/a/Media3VideoPlayer;)V
    .registers 1

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->retryNetworkPlayback()V

    return-void
.end method

.method public static synthetic $r8$lambda$pr_H7FNg2HJSWVINmA-KDgWn6JY(Le/e/a/Media3VideoPlayer;)V
    .registers 1

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->finishSeek()V

    return-void
.end method

.method static constructor <clinit>()V
    .registers 3

    .line 35
    new-instance v0, Landroidx/media3/exoplayer/SeekParameters;

    const-wide/32 v1, 0x3d090

    invoke-direct {v0, v1, v2, v1, v2}, Landroidx/media3/exoplayer/SeekParameters;-><init>(JJ)V

    sput-object v0, Le/e/a/Media3VideoPlayer;->PREVIEW_SEEK:Landroidx/media3/exoplayer/SeekParameters;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Z)V
    .registers 6

    .line 103
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    .line 45
    new-instance v0, Le/e/a/Media3VideoPlayer$4;

    invoke-direct {v0, p0}, Le/e/a/Media3VideoPlayer$4;-><init>(Le/e/a/Media3VideoPlayer;)V

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->popupReadyTimeout:Ljava/lang/Runnable;

    const/high16 v0, 0x3f800000    # 1.0f

    .line 50
    iput v0, p0, Le/e/a/Media3VideoPlayer;->sampledSpeed:F

    .line 55
    new-instance v0, Le/e/a/Media3VideoPlayer$1;

    invoke-direct {v0, p0}, Le/e/a/Media3VideoPlayer$1;-><init>(Le/e/a/Media3VideoPlayer;)V

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->sampleWhilePlaying:Ljava/lang/Runnable;

    const-wide/16 v0, -0x1

    .line 70
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    .line 72
    new-instance v2, Le/e/a/Media3VideoPlayer$5;

    invoke-direct {v2, p0}, Le/e/a/Media3VideoPlayer$5;-><init>(Le/e/a/Media3VideoPlayer;)V

    iput-object v2, p0, Le/e/a/Media3VideoPlayer;->retryNetwork:Ljava/lang/Runnable;

    .line 87
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    .line 88
    new-instance v0, Le/e/a/Media3VideoPlayer$2;

    invoke-direct {v0, p0}, Le/e/a/Media3VideoPlayer$2;-><init>(Le/e/a/Media3VideoPlayer;)V

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    .line 104
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->context:Landroid/content/Context;

    .line 105
    iput-boolean p2, p0, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    .line 106
    iput-boolean p2, p0, Le/e/a/Media3VideoPlayer;->ownsCurrentSurface:Z

    .line 107
    new-instance p2, Landroidx/media3/exoplayer/ExoPlayer$Builder;

    invoke-direct {p2, p1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;-><init>(Landroid/content/Context;)V

    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->createTrackSelector236(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;

    move-result-object v0

    invoke-virtual {p2, v0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setTrackSelector(Landroidx/media3/exoplayer/trackselection/TrackSelector;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    .line 108
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setLooper(Landroid/os/Looper;)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object p1

    .line 109
    new-instance p2, Landroidx/media3/common/AudioAttributes$Builder;

    invoke-direct {p2}, Landroidx/media3/common/AudioAttributes$Builder;-><init>()V

    const/4 v0, 0x1

    invoke-virtual {p2, v0}, Landroidx/media3/common/AudioAttributes$Builder;->setUsage(I)Landroidx/media3/common/AudioAttributes$Builder;

    move-result-object p2

    const/4 v0, 0x3

    .line 110
    invoke-virtual {p2, v0}, Landroidx/media3/common/AudioAttributes$Builder;->setContentType(I)Landroidx/media3/common/AudioAttributes$Builder;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/media3/common/AudioAttributes$Builder;->build()Landroidx/media3/common/AudioAttributes;

    move-result-object p2

    const/4 v0, 0x0

    .line 109
    invoke-virtual {p1, p2, v0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)Landroidx/media3/exoplayer/ExoPlayer$Builder;

    move-result-object p1

    .line 111
    invoke-virtual {p1}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->build()Landroidx/media3/exoplayer/ExoPlayer;

    move-result-object p1

    .line 107
    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    .line 112
    invoke-interface {p1, p0}, Landroidx/media3/exoplayer/ExoPlayer;->addListener(Landroidx/media3/common/Player$Listener;)V

    .line 113
    new-instance p2, Le/e/a/Media3VideoPlayer$3;

    invoke-direct {p2, p0}, Le/e/a/Media3VideoPlayer$3;-><init>(Le/e/a/Media3VideoPlayer;)V

    invoke-interface {p1, p2}, Landroidx/media3/exoplayer/ExoPlayer;->addAnalyticsListener(Landroidx/media3/exoplayer/analytics/AnalyticsListener;)V

    return-void
.end method

.method static synthetic access$0(Le/e/a/Media3VideoPlayer;)V
    .registers 1

    .line 454
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->refreshClock()V

    return-void
.end method

.method static synthetic access$1(Le/e/a/Media3VideoPlayer;)Z
    .registers 1

    .line 49
    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->sampledPlaying:Z

    return p0
.end method

.method static synthetic access$10(Le/e/a/Media3VideoPlayer;)Ljava/lang/Runnable;
    .registers 1

    .line 44
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    return-object p0
.end method

.method static synthetic access$11(Le/e/a/Media3VideoPlayer;)Landroid/view/Surface;
    .registers 1

    .line 42
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    return-object p0
.end method

.method static synthetic access$12(Le/e/a/Media3VideoPlayer;Ljava/lang/String;)V
    .registers 2

    .line 188
    invoke-direct {p0, p1}, Le/e/a/Media3VideoPlayer;->completePopupOutput(Ljava/lang/String;)V

    return-void
.end method

.method static synthetic access$2(Le/e/a/Media3VideoPlayer;)Landroidx/media3/exoplayer/ExoPlayer;
    .registers 1

    .line 37
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    return-object p0
.end method

.method static synthetic access$3(Le/e/a/Media3VideoPlayer;)Landroid/os/Handler;
    .registers 1

    .line 38
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    return-object p0
.end method

.method static synthetic access$4(Le/e/a/Media3VideoPlayer;)Z
    .registers 1

    .line 66
    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    return p0
.end method

.method static synthetic access$5(Le/e/a/Media3VideoPlayer;)Lcom/devbrackets/android/exomedia/core/ListenerMux;
    .registers 1

    .line 46
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    return-object p0
.end method

.method static synthetic access$6(Le/e/a/Media3VideoPlayer;I)V
    .registers 2

    .line 51
    iput p1, p0, Le/e/a/Media3VideoPlayer;->sampledBuffer:I

    return-void
.end method

.method static synthetic access$7(Le/e/a/Media3VideoPlayer;)I
    .registers 1

    .line 51
    iget p0, p0, Le/e/a/Media3VideoPlayer;->sampledBuffer:I

    return p0
.end method

.method static synthetic access$8(Le/e/a/Media3VideoPlayer;)V
    .registers 1

    .line 491
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->updateBufferedPosition()V

    return-void
.end method

.method static synthetic access$9(Le/e/a/Media3VideoPlayer;Ljava/lang/Object;)V
    .registers 2

    .line 43
    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->renderedOutput:Ljava/lang/Object;

    return-void
.end method

.method private clearNetworkRecovery()V
    .registers 3

    .line 82
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->retryNetwork:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 83
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    .line 84
    iput v0, p0, Le/e/a/Media3VideoPlayer;->networkAttempts:I

    const-wide/16 v0, -0x1

    .line 85
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    return-void
.end method

.method private completePopupOutput(Ljava/lang/String;)V
    .registers 6

    .line 189
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    const/4 v1, 0x0

    .line 190
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    .line 191
    iget-object v2, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v3, p0, Le/e/a/Media3VideoPlayer;->popupReadyTimeout:Ljava/lang/Runnable;

    invoke-virtual {v2, v3}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    if-eqz v0, :cond_1

    .line 192
    iget-boolean v2, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v2, :cond_1

    .line 193
    iget-boolean v2, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    if-eqz v2, :cond_0

    const/4 v2, 0x0

    .line 194
    iput-boolean v2, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    .line 195
    invoke-direct {p0, v1, v2}, Le/e/a/Media3VideoPlayer;->setVideoOutput(Landroid/view/Surface;Z)V

    .line 197
    :cond_0
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v1, "Media3 popup output: "

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    .line 198
    invoke-interface {v0}, Ljava/lang/Runnable;->run()V

    :cond_1
    return-void
.end method

.method private static createTrackSelector236(Landroid/content/Context;)Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;
    .registers 7

    new-instance v0, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;

    const/16 v1, 0x7d0

    const/16 v2, 0x61a8

    const/16 v3, 0x61a8

    const v4, 0x3f333333    # 0.7f

    invoke-direct {v0, v1, v2, v3, v4}, Landroidx/media3/exoplayer/trackselection/AdaptiveTrackSelection$Factory;-><init>(IIIF)V

    new-instance v5, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;

    invoke-direct {v5, p0, v0}, Landroidx/media3/exoplayer/trackselection/DefaultTrackSelector;-><init>(Landroid/content/Context;Landroidx/media3/exoplayer/trackselection/ExoTrackSelection$Factory;)V

    return-object v5
.end method

.method public static describeError(Ljava/lang/Exception;)Ljava/lang/String;
    .registers 5

    const/4 v0, 0x0

    move-object v1, p0

    :goto_0
    if-eqz v1, :cond_3

    const/16 v2, 0x8

    if-ge v0, v2, :cond_3

    .line 687
    instance-of v2, v1, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    if-eqz v2, :cond_2

    .line 689
    check-cast v1, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    .line 690
    iget-object p0, v1, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;->dataSpec:Landroidx/media3/datasource/DataSpec;

    iget-object p0, p0, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    .line 692
    const-string v0, "127.0.0.1"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const-string v2, "HTTP "

    if-nez v0, :cond_1

    const-string v0, "localhost"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 695
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, v1, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " @ "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 696
    invoke-virtual {p0}, Landroid/net/Uri;->isHierarchical()Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "Signature"

    invoke-virtual {p0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_0

    const-string p0, " [signed]"

    goto :goto_1

    :cond_0
    const-string p0, " [no signature]"

    :goto_1
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 695
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 693
    :cond_1
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, v1, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;->responseCode:I

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " @ local cache"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    .line 686
    invoke-virtual {v1}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    goto/16 :goto_0

    .line 699
    :cond_3
    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_4

    invoke-virtual {p0}, Ljava/lang/Exception;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    :cond_4
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private finishSeek()V
    .registers 3

    .line 444
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x0

    .line 445
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    const-wide/16 v0, -0x1

    .line 446
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    .line 447
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p0, :cond_0

    .line 448
    invoke-virtual {p0}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onSeekComplete()V

    :cond_0
    return-void
.end method

.method private group(Ljava/lang/Enum;I)Landroidx/media3/common/Tracks$Group;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;I)",
            "Landroidx/media3/common/Tracks$Group;"
        }
    .end annotation

    .line 566
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    const/4 v1, 0x0

    if-nez v0, :cond_3

    if-ltz p2, :cond_3

    .line 569
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->trackType(Ljava/lang/Enum;)I

    move-result p1

    .line 570
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentTracks()Landroidx/media3/common/Tracks;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/media3/common/Tracks;->getGroups()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_1

    return-object v1

    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/media3/common/Tracks$Group;

    .line 571
    invoke-virtual {v0}, Landroidx/media3/common/Tracks$Group;->getType()I

    move-result v2

    if-ne v2, p1, :cond_0

    add-int/lit8 v2, p2, -0x1

    if-nez p2, :cond_2

    return-object v0

    :cond_2
    move p2, v2

    goto :goto_0

    :cond_3
    return-object v1
.end method

.method static synthetic lambda$3(Le/e/a/VideoHttpSource$Credential;)Landroidx/media3/datasource/DataSource;
    .registers 2

    .line 258
    new-instance v0, Le/e/a/VideoHttpSource;

    invoke-direct {v0, p0}, Le/e/a/VideoHttpSource;-><init>(Le/e/a/VideoHttpSource$Credential;)V

    return-object v0
.end method

.method static synthetic lambda$5(Ljava/lang/Enum;)Ljava/util/List;
    .registers 1

    .line 584
    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    return-object p0
.end method

.method private static reconnectable(Landroidx/media3/common/PlaybackException;)Z
    .registers 6

    .line 671
    iget v0, p0, Landroidx/media3/common/PlaybackException;->errorCode:I

    const/16 v1, 0x7d1

    const/4 v2, 0x1

    if-eq v0, v1, :cond_4

    .line 672
    iget v0, p0, Landroidx/media3/common/PlaybackException;->errorCode:I

    const/16 v1, 0x7d2

    if-eq v0, v1, :cond_4

    .line 673
    iget v0, p0, Landroidx/media3/common/PlaybackException;->errorCode:I

    const/16 v1, 0x7d0

    const/4 v3, 0x0

    if-eq v0, v1, :cond_0

    return v3

    .line 674
    :cond_0
    invoke-virtual {p0}, Landroidx/media3/common/PlaybackException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    move v0, v3

    :goto_0
    if-eqz p0, :cond_3

    const/16 v1, 0x8

    if-ge v0, v1, :cond_3

    .line 676
    instance-of v1, p0, Ljava/net/SocketException;

    if-nez v1, :cond_2

    instance-of v1, p0, Ljava/net/SocketTimeoutException;

    if-nez v1, :cond_2

    .line 677
    instance-of v1, p0, Ljava/net/UnknownHostException;

    if-nez v1, :cond_2

    .line 678
    instance-of v1, p0, Ljava/io/EOFException;

    if-eqz v1, :cond_1

    .line 679
    const-string v1, "Truncated HTTP response"

    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 675
    invoke-virtual {p0}, Ljava/lang/Throwable;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    goto :goto_0

    :cond_2
    return v2

    :cond_3
    return v3

    :cond_4
    return v2
.end method

.method private refreshClock()V
    .registers 8

    .line 455
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->isPrepared()Z

    move-result v0

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    move v0, v2

    :goto_0
    const-wide/16 v3, 0x0

    if-eqz v0, :cond_1

    .line 456
    iget-object v5, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v5}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v5

    goto :goto_1

    :cond_1
    move-wide v5, v3

    :goto_1
    iput-wide v5, p0, Le/e/a/Media3VideoPlayer;->sampledPosition:J

    if-eqz v0, :cond_2

    .line 457
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    :cond_2
    iput-wide v3, p0, Le/e/a/Media3VideoPlayer;->sampledDuration:J

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-eqz v0, :cond_3

    iput-wide v3, p0, Le/e/a/Media3VideoPlayer;->sampledPosition:J

    .line 458
    :cond_3
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_4

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v0

    if-nez v0, :cond_5

    :cond_4
    move v1, v2

    :cond_5
    iput-boolean v1, p0, Le/e/a/Media3VideoPlayer;->sampledPlaying:Z

    .line 459
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_6

    const/high16 v0, 0x3f800000    # 1.0f

    goto :goto_2

    :cond_6
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object v0

    iget v0, v0, Landroidx/media3/common/PlaybackParameters;->speed:F

    :goto_2
    iput v0, p0, Le/e/a/Media3VideoPlayer;->sampledSpeed:F

    .line 460
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getBufferedPercentage()I

    move-result v2

    :cond_7
    iput v2, p0, Le/e/a/Media3VideoPlayer;->sampledBuffer:I

    return-void
.end method

.method private releaseSurface(Landroid/view/Surface;Z)V
    .registers 3

    if-eqz p2, :cond_0

    if-eqz p1, :cond_0

    .line 389
    invoke-virtual {p1}, Landroid/view/Surface;->release()V

    :cond_0
    return-void
.end method

.method private replayCompletedReturn()V
    .registers 4

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v1

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->seekToDefaultPosition()V

    const/4 v2, 0x1

    if-ne v1, v2, :cond_0

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    :cond_0
    return-void
.end method

.method private resetListeners()V
    .registers 3

    .line 306
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 307
    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->setNotifiedPrepared(Z)V

    .line 308
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    invoke-virtual {p0, v1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->setNotifiedCompleted(Z)V

    :cond_0
    return-void
.end method

.method private retryNetworkPlayback()V
    .registers 5

    .line 75
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 76
    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    iget-object v2, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v2, v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(J)V

    .line 77
    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    :cond_1
    return-void
.end method

.method private setVideoOutput(Landroid/view/Surface;Z)V
    .registers 5

    .line 378
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    if-eq v0, p1, :cond_0

    .line 380
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setVideoSurface(Landroid/view/Surface;)V

    .line 381
    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    .line 382
    iget-boolean p1, p0, Le/e/a/Media3VideoPlayer;->ownsCurrentSurface:Z

    invoke-direct {p0, v0, p1}, Le/e/a/Media3VideoPlayer;->releaseSurface(Landroid/view/Surface;Z)V

    .line 383
    iput-boolean p2, p0, Le/e/a/Media3VideoPlayer;->ownsCurrentSurface:Z

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->showCompletedFrameIfNeeded()V

    :cond_0
    return-void
.end method

.method private showCompletedFrameIfNeeded()V
    .registers 9

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    if-eqz v0, :cond_1

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->completedFrameSurface:Landroid/view/Surface;

    if-eq v0, v1, :cond_1

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v6, v2, v4

    if-lez v6, :cond_1

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->completedFrameSurface:Landroid/view/Surface;

    const-wide/16 v6, 0x64

    sub-long/2addr v2, v6

    invoke-static {v2, v3, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v2

    iget-object v6, p0, Le/e/a/Media3VideoPlayer;->renderedOutput:Ljava/lang/Object;

    if-ne v0, v6, :cond_0

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v4

    cmp-long v6, v4, v2

    if-gez v6, :cond_1

    :cond_0
    invoke-interface {v1, v2, v3}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(J)V

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_1

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    :cond_1
    return-void
.end method

.method private static trackType(Ljava/lang/Enum;)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)I"
        }
    .end annotation

    .line 539
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->hashCode()I

    move-result v0

    const v1, -0x5bd28a0d

    if-eq v0, v1, :cond_1

    const v1, 0x3bba3b6

    if-eq v0, v1, :cond_0

    const v1, 0x4de1c5b

    if-ne v0, v1, :cond_2

    const-string v0, "VIDEO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x2

    return p0

    :cond_0
    const-string v0, "AUDIO"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_1
    const-string v0, "CLOSED_CAPTION"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_3

    :cond_2
    const/4 p0, 0x5

    return p0

    :cond_3
    const/4 p0, 0x3

    return p0
.end method

.method private updateBufferedPosition()V
    .registers 6

    .line 492
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->progressBar:Ljava/lang/ref/WeakReference;

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/widget/SeekBar;

    :goto_0
    if-eqz v0, :cond_1

    .line 493
    invoke-virtual {v0}, Landroid/widget/SeekBar;->isAttachedToWindow()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 494
    invoke-virtual {v0}, Landroid/widget/SeekBar;->getMax()I

    move-result v1

    int-to-long v1, v1

    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->getBufferedPosition()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    long-to-int p0, v1

    invoke-virtual {v0, p0}, Landroid/widget/SeekBar;->setSecondaryProgress(I)V

    :cond_1
    return-void
.end method


# virtual methods
.method awaitPopupOutput(ZLjava/lang/Runnable;)V
    .registers 5

    if-nez p1, :cond_1

    .line 173
    iget-boolean p1, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    const/4 p1, 0x0

    .line 174
    invoke-direct {p0, p1, v0}, Le/e/a/Media3VideoPlayer;->setVideoOutput(Landroid/view/Surface;Z)V

    .line 176
    :cond_0
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    .line 177
    invoke-interface {p2}, Ljava/lang/Runnable;->run()V

    return-void

    .line 180
    :cond_1
    iput-object p2, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    .line 181
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    if-eqz p1, :cond_2

    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->renderedOutput:Ljava/lang/Object;

    if-ne p2, p1, :cond_2

    .line 182
    const-string p1, "first frame"

    invoke-direct {p0, p1}, Le/e/a/Media3VideoPlayer;->completePopupOutput(Ljava/lang/String;)V

    return-void

    .line 184
    :cond_2
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->popupReadyTimeout:Ljava/lang/Runnable;

    const-wide/16 v0, 0x2bc

    invoke-virtual {p1, p0, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void
.end method

.method bindProgress(Landroid/widget/SeekBar;)V
    .registers 3

    .line 487
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->progressBar:Ljava/lang/ref/WeakReference;

    .line 488
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->updateBufferedPosition()V

    return-void
.end method

.method bindReturnedView(Ljava/lang/reflect/Method;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ReflectiveOperationException;
        }
    .end annotation

    .line 208
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    const/4 v1, 0x1

    .line 209
    iput-boolean v1, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    .line 211
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 213
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    return-object p1

    :catchall_0
    move-exception p1

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    .line 214
    throw p1
.end method

.method canMoveTo(Le/e/a/Media3VideoPlayer;)Z
    .registers 2

    .line 142
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->hasPlaybackSession()Z

    move-result p0

    if-eqz p0, :cond_0

    if-eqz p1, :cond_0

    iget-boolean p0, p1, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez p0, :cond_0

    iget-object p0, p1, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p0, :cond_0

    .line 143
    iget-object p0, p1, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public clearSelectedTracks(Ljava/lang/Enum;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)V"
        }
    .end annotation

    .line 548
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    .line 549
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    .line 550
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->trackType(Ljava/lang/Enum;)I

    move-result p1

    invoke-virtual {v0, p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->clearOverridesOfType(I)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object p1

    .line 549
    invoke-interface {p0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    :cond_0
    return-void
.end method

.method currentUri()Landroid/net/Uri;
    .registers 2

    .line 137
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 138
    iget-object v0, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    if-eqz v0, :cond_0

    iget-object p0, p0, Landroidx/media3/common/MediaItem;->localConfiguration:Landroidx/media3/common/MediaItem$LocalConfiguration;

    iget-object p0, p0, Landroidx/media3/common/MediaItem$LocalConfiguration;->uri:Landroid/net/Uri;

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method endScrubbing()V
    .registers 3

    .line 414
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->scrubbing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    .line 415
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->scrubbing:Z

    .line 416
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setScrubbingModeEnabled(Z)V

    .line 417
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    sget-object v0, Landroidx/media3/exoplayer/SeekParameters;->EXACT:Landroidx/media3/exoplayer/SeekParameters;

    invoke-interface {p0, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setSeekParameters(Landroidx/media3/exoplayer/SeekParameters;)V

    :cond_0
    return-void
.end method

.method public getAvailableTracks([Ljava/lang/Enum;)Ljava/util/Map;
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "([",
            "Ljava/lang/Enum<",
            "*>;)",
            "Ljava/util/Map<",
            "Ljava/lang/Enum<",
            "*>;",
            "Ljava/util/List<",
            "Landroidx/media3/common/TrackGroup;",
            ">;>;"
        }
    .end annotation

    .line 579
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 580
    iget-boolean v1, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v1, :cond_2

    .line 581
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    aget-object v3, p1, v2

    .line 582
    iget-object v4, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v4}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentTracks()Landroidx/media3/common/Tracks;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/media3/common/Tracks;->getGroups()Lcom/google/common/collect/ImmutableList;

    move-result-object v4

    invoke-virtual {v4}, Lcom/google/common/collect/ImmutableList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_0
    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-nez v5, :cond_1

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroidx/media3/common/Tracks$Group;

    .line 583
    invoke-virtual {v5}, Landroidx/media3/common/Tracks$Group;->getType()I

    move-result v6

    invoke-static {v3}, Le/e/a/Media3VideoPlayer;->trackType(Ljava/lang/Enum;)I

    move-result v7

    if-ne v6, v7, :cond_0

    .line 584
    new-instance v6, Le/e/a/Media3VideoPlayer$0;

    invoke-direct {v6}, Le/e/a/Media3VideoPlayer$0;-><init>()V

    invoke-interface {v0, v3, v6}, Ljava/util/Map;->computeIfAbsent(Ljava/lang/Object;Ljava/util/function/Function;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/util/List;

    .line 585
    invoke-virtual {v5}, Landroidx/media3/common/Tracks$Group;->getMediaTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object v5

    invoke-interface {v6, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    return-object v0
.end method

.method public getBufferedPercent()I
    .registers 3

    .line 478
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getApplicationLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 479
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getBufferedPercentage()I

    move-result p0

    return p0

    :cond_1
    iget p0, p0, Le/e/a/Media3VideoPlayer;->sampledBuffer:I

    return p0
.end method

.method getBufferedPosition()J
    .registers 3

    .line 483
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    const-wide/16 v0, 0x0

    return-wide v0

    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getBufferedPosition()J

    move-result-wide v0

    return-wide v0
.end method

.method public getCurrentPosition()J
    .registers 3

    .line 464
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 465
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->refreshClock()V

    .line 467
    :cond_0
    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->sampledPosition:J

    return-wide v0
.end method

.method public getDuration()J
    .registers 3

    .line 471
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_0

    .line 472
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->refreshClock()V

    .line 474
    :cond_0
    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->sampledDuration:J

    return-wide v0
.end method

.method public getPlaybackSpeed()F
    .registers 3

    .line 516
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getApplicationLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 517
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    const/high16 p0, 0x3f800000    # 1.0f

    return p0

    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object p0

    iget p0, p0, Landroidx/media3/common/PlaybackParameters;->speed:F

    return p0

    :cond_1
    iget p0, p0, Le/e/a/Media3VideoPlayer;->sampledSpeed:F

    return p0
.end method

.method public getSelectedTrackIndex(Ljava/lang/Enum;I)I
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;I)I"
        }
    .end annotation

    .line 594
    invoke-direct {p0, p1, p2}, Le/e/a/Media3VideoPlayer;->group(Ljava/lang/Enum;I)Landroidx/media3/common/Tracks$Group;

    move-result-object p0

    if-eqz p0, :cond_1

    const/4 p1, 0x0

    .line 596
    :goto_0
    iget p2, p0, Landroidx/media3/common/Tracks$Group;->length:I

    if-ge p1, p2, :cond_1

    .line 597
    invoke-virtual {p0, p1}, Landroidx/media3/common/Tracks$Group;->isTrackSelected(I)Z

    move-result p2

    if-eqz p2, :cond_0

    return p1

    :cond_0
    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, -0x1

    return p0
.end method

.method public getSurface()Landroid/view/Surface;
    .registers 1

    .line 348
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    return-object p0
.end method

.method public getVolume()F
    .registers 2

    .line 529
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getVolume()F

    move-result p0

    return p0
.end method

.method hasPlaybackSession()Z
    .registers 3

    .line 129
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_1

    .line 130
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 131
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x4

    if-eq v0, v1, :cond_0

    const/4 v1, 0x3

    if-eq v0, v1, :cond_0

    .line 132
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1

    .line 133
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->isPrepared()Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method isBindingRetainedView()Z
    .registers 1

    .line 203
    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    return p0
.end method

.method isCompletedReturn()Z
    .registers 2

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    return v0
.end method

.method public isPlaying()Z
    .registers 3

    .line 499
    invoke-static {}, Landroid/os/Looper;->myLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    if-ne v0, v1, :cond_1

    .line 500
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0

    :cond_1
    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->sampledPlaying:Z

    return p0
.end method

.method public isRendererEnabled(Ljava/lang/Enum;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;)Z"
        }
    .end annotation

    .line 555
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object p0

    iget-object p0, p0, Landroidx/media3/common/TrackSelectionParameters;->disabledTrackTypes:Lcom/google/common/collect/ImmutableSet;

    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->trackType(Ljava/lang/Enum;)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSet;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method isScrubbing()Z
    .registers 1

    .line 394
    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->scrubbing:Z

    return p0
.end method

.method synthetic lambda$0$e-e-a-Media3VideoPlayer()V
    .registers 2

    .line 45
    const-string v0, "frame callback timeout"

    invoke-direct {p0, v0}, Le/e/a/Media3VideoPlayer;->completePopupOutput(Ljava/lang/String;)V

    return-void
.end method

.method synthetic lambda$2$e-e-a-Media3VideoPlayer()V
    .registers 2

    .line 0
    const/4 v0, 0x0

    .line 228
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    return-void
.end method

.method moveTo(Le/e/a/Media3VideoPlayer;Z)V
    .registers 7

    .line 147
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    const/4 v0, 0x0

    .line 148
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    .line 150
    iget-object v0, p1, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    .line 151
    iget-object v1, p1, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->clearVideoSurface()V

    const/4 v1, 0x0

    .line 152
    iput-object v1, p1, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    .line 153
    iget-object v2, p1, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    iput-object v2, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    .line 154
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->progressBar:Ljava/lang/ref/WeakReference;

    const/4 v2, 0x1

    .line 155
    iput-boolean v2, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    .line 156
    iput-boolean v2, p0, Le/e/a/Media3VideoPlayer;->skipPopupAutoStart:Z

    .line 157
    iget-boolean v3, p1, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    iput-boolean v3, p0, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    .line 158
    iput-boolean v2, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    .line 159
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    if-eqz p2, :cond_0

    .line 162
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->suspendVideoOutput()V

    .line 163
    iget-boolean p2, p1, Le/e/a/Media3VideoPlayer;->ownsCurrentSurface:Z

    invoke-direct {p0, v0, p2}, Le/e/a/Media3VideoPlayer;->releaseSurface(Landroid/view/Surface;Z)V

    goto :goto_0

    :cond_0
    if-eqz v0, :cond_1

    .line 165
    invoke-virtual {p0, v0}, Le/e/a/Media3VideoPlayer;->setSurface(Landroid/view/Surface;)V

    .line 167
    :cond_1
    :goto_0
    invoke-virtual {p1}, Le/e/a/Media3VideoPlayer;->release()V

    return-void
.end method

.method notifyRetainedView()V
    .registers 4

    .line 222
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v0, :cond_0

    .line 223
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v1

    const/4 v2, 0x3

    invoke-virtual {v0, v1, v2}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onStateChanged(ZI)V

    .line 224
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->refreshClock()V

    .line 225
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getVideoSize()Landroidx/media3/common/VideoSize;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/Media3VideoPlayer;->onVideoSizeChanged(Landroidx/media3/common/VideoSize;)V

    .line 226
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 227
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 228
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    new-instance v1, Le/e/a/Media3VideoPlayer$6;

    invoke-direct {v1, p0}, Le/e/a/Media3VideoPlayer$6;-><init>(Le/e/a/Media3VideoPlayer;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onEvents(Landroidx/media3/common/Player;Landroidx/media3/common/Player$Events;)V
    .registers 5

    .line 615
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    invoke-static {p0, p1, p2}, Le/e/a/Media3Diagnostics276;->onEvents(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_1

    invoke-static {p0}, Le/e/a/MiniCompletion;->ended(Le/e/a/Media3VideoPlayer;)V

    :cond_1
    const/4 v0, 0x5

    const/4 v1, 0x4

    .line 618
    filled-new-array {v1, v0}, [I

    move-result-object v0

    invoke-virtual {p2, v0}, Landroidx/media3/common/Player$Events;->containsAny([I)Z

    move-result p2

    if-eqz p2, :cond_6

    .line 619
    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p2, :cond_5

    iget-boolean p2, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez p2, :cond_5

    iget-boolean p2, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-nez p2, :cond_5

    .line 620
    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlaybackState()I

    move-result p2

    const/4 v0, 0x3

    if-ne p2, v0, :cond_2

    .line 621
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-eqz v0, :cond_2

    .line 622
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->clearNetworkRecovery()V

    .line 624
    :cond_2
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    if-ne p2, v0, :cond_3

    const/4 p2, 0x2

    :cond_3
    if-ne p2, v1, :cond_4

    .line 625
    invoke-interface {p1}, Landroidx/media3/common/Player;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_5

    .line 626
    :cond_4
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    invoke-interface {p1}, Landroidx/media3/common/Player;->getPlayWhenReady()Z

    move-result p1

    invoke-virtual {v0, p1, p2}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onStateChanged(ZI)V

    .line 629
    :cond_5
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 630
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    .line 632
    :cond_6
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->sampleWhilePlaying:Ljava/lang/Runnable;

    invoke-virtual {p1, p2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 633
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->sampleWhilePlaying:Ljava/lang/Runnable;

    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 634
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->finishSeek()V

    return-void
.end method

.method public onPlayWhenReadyChanged(ZI)V
    .registers 3

    invoke-static {p0, p1, p2}, Le/e/a/Media3Diagnostics276;->onPlayIntentChange(Ljava/lang/Object;ZI)V

    return-void
.end method

.method public onPlayerError(Landroidx/media3/common/PlaybackException;)V
    .registers 6

    .line 655
    invoke-static {p0, p1}, Le/e/a/Media3Diagnostics276;->onError(Ljava/lang/Object;Ljava/lang/Throwable;)V

    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    .line 656
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 657
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->reconnectable(Landroidx/media3/common/PlaybackException;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget v0, p0, Le/e/a/Media3VideoPlayer;->networkAttempts:I

    const/4 v1, 0x6

    if-ge v0, v1, :cond_1

    const/4 p1, 0x1

    .line 658
    iput-boolean p1, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    .line 659
    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    const-wide/16 v2, 0x0

    cmp-long p1, v0, v2

    if-gez p1, :cond_0

    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    .line 660
    :cond_0
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->retryNetwork:Ljava/lang/Runnable;

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 661
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->retryNetwork:Ljava/lang/Runnable;

    iget v1, p0, Le/e/a/Media3VideoPlayer;->networkAttempts:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Le/e/a/Media3VideoPlayer;->networkAttempts:I

    const/4 v2, 0x4

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const-wide/16 v2, 0x3e8

    shl-long/2addr v2, v1

    invoke-virtual {p1, v0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 662
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p1, :cond_2

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p0

    const/4 v0, 0x2

    invoke-virtual {p1, p0, v0}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onStateChanged(ZI)V

    return-void

    :cond_1
    const/4 v0, 0x0

    .line 665
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    .line 666
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->clearNetworkRecovery()V

    .line 667
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_2

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p0, :cond_2

    const/4 v0, 0x0

    invoke-virtual {p0, v0, p1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onError(Lcom/devbrackets/android/exomedia/core/exoplayer/ExoMediaPlayer;Ljava/lang/Exception;)V

    :cond_2
    return-void
.end method

.method public onPositionDiscontinuity(Landroidx/media3/common/Player$PositionInfo;Landroidx/media3/common/Player$PositionInfo;I)V
    .registers 4

    const/4 p1, 0x1

    if-ne p3, p1, :cond_0

    .line 439
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    new-instance p2, Le/e/a/Media3VideoPlayer$7;

    invoke-direct {p2, p0}, Le/e/a/Media3VideoPlayer$7;-><init>(Le/e/a/Media3VideoPlayer;)V

    invoke-virtual {p1, p2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_0
    return-void
.end method

.method public onRenderedFirstFrame()V
    .registers 5

    .line 646
    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    .line 647
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iget-wide v2, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    sub-long/2addr v0, v2

    const-wide/16 v2, -0x1

    .line 648
    iput-wide v2, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    .line 649
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v2, "Media3 first video frame: "

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v0, " ms"

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method public onVideoSizeChanged(Landroidx/media3/common/VideoSize;)V
    .registers 5

    .line 639
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v0, :cond_0

    iget v0, p1, Landroidx/media3/common/VideoSize;->width:I

    if-lez v0, :cond_0

    iget v0, p1, Landroidx/media3/common/VideoSize;->height:I

    if-lez v0, :cond_0

    .line 640
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    iget v0, p1, Landroidx/media3/common/VideoSize;->width:I

    iget v1, p1, Landroidx/media3/common/VideoSize;->height:I

    const/4 v2, 0x0

    iget p1, p1, Landroidx/media3/common/VideoSize;->pixelWidthHeightRatio:F

    invoke-virtual {p0, v0, v1, v2, p1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->onVideoSizeChanged(IIIF)V

    :cond_0
    return-void
.end method

.method public pause()V
    .registers 2

    .line 274
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->onPause(Ljava/lang/Object;)V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_0

    .line 275
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    :cond_0
    return-void
.end method

.method public pauseForHandoff()V
    .registers 2

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->onHandoffPause(Ljava/lang/Object;)V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    :cond_0
    return-void
.end method

.method presentationRatio()F
    .registers 5

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getVideoSize()Landroidx/media3/common/VideoSize;

    move-result-object v0

    iget v1, v0, Landroidx/media3/common/VideoSize;->width:I

    iget v2, v0, Landroidx/media3/common/VideoSize;->height:I

    if-lez v1, :cond_0

    if-lez v2, :cond_0

    int-to-float v1, v1

    int-to-float v2, v2

    iget v3, v0, Landroidx/media3/common/VideoSize;->pixelWidthHeightRatio:F

    mul-float/2addr v1, v3

    div-float/2addr v2, v1

    return v2

    :cond_0
    const/4 v2, 0x0

    return v2
.end method

.method previewPosition(J)V
    .registers 5

    .line 408
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->scrubbing:Z

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    .line 409
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const-wide/16 v0, 0x0

    invoke-static {v0, v1, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    invoke-interface {p0, p1, p2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(J)V

    :cond_0
    return-void
.end method

.method public release()V
    .registers 4

    .line 327
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    const/4 v0, 0x1

    .line 328
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    .line 329
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->clearNetworkRecovery()V

    .line 330
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->updateBuffer:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 331
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->sampleWhilePlaying:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 332
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->popupReadyTimeout:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v0, 0x0

    .line 333
    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    const-wide/16 v1, 0x0

    .line 334
    iput-wide v1, p0, Le/e/a/Media3VideoPlayer;->sampledPosition:J

    .line 335
    iput-wide v1, p0, Le/e/a/Media3VideoPlayer;->sampledDuration:J

    const/4 v1, 0x0

    .line 336
    iput-boolean v1, p0, Le/e/a/Media3VideoPlayer;->sampledPlaying:Z

    const/high16 v2, 0x3f800000    # 1.0f

    .line 337
    iput v2, p0, Le/e/a/Media3VideoPlayer;->sampledSpeed:F

    .line 338
    iput v1, p0, Le/e/a/Media3VideoPlayer;->sampledBuffer:I

    .line 339
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1, p0}, Landroidx/media3/exoplayer/ExoPlayer;->removeListener(Landroidx/media3/common/Player$Listener;)V

    .line 340
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->release()V

    .line 341
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    iget-boolean v2, p0, Le/e/a/Media3VideoPlayer;->ownsCurrentSurface:Z

    invoke-direct {p0, v1, v2}, Le/e/a/Media3VideoPlayer;->releaseSurface(Landroid/view/Surface;Z)V

    .line 342
    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->surface:Landroid/view/Surface;

    .line 343
    iput-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    :cond_0
    return-void
.end method

.method public restart()Z
    .registers 8

    .line 280
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    const/4 v1, 0x0

    if-nez v0, :cond_7

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_7

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_7

    invoke-static {p0}, Le/e/a/MiniCompletion;->takeCompleted(Le/e/a/Media3VideoPlayer;)Z

    move-result v0

    if-eqz v0, :cond_0

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    :cond_0
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->start()V

    const/4 v0, 0x1

    return v0

    .line 283
    :cond_1
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    .line 284
    iget-boolean v2, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    .line 285
    iput-boolean v1, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    if-ne v0, v3, :cond_2

    .line 286
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 287
    :cond_2
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    return v3

    .line 290
    :cond_3
    iget-boolean v2, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-eqz v2, :cond_4

    .line 291
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    return v3

    :cond_4
    if-eq v0, v3, :cond_5

    const/4 v2, 0x4

    if-eq v0, v2, :cond_5

    return v1

    .line 297
    :cond_5
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->resetListeners()V

    .line 298
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    .line 299
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-wide v1, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    const-wide/16 v4, 0x0

    cmp-long v6, v1, v4

    if-gez v6, :cond_6

    move-wide v1, v4

    :cond_6
    invoke-interface {v0, v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(J)V

    .line 300
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 301
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    return v3

    :cond_7
    return v1
.end method

.method restoreCompletedReturn(Z)Z
    .registers 11

    const/4 v0, 0x0

    iget-boolean v1, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v1, :cond_2

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v2

    if-nez v2, :cond_2

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v2

    const/4 v3, 0x4

    if-eq v2, v3, :cond_0

    if-nez p1, :cond_0

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->isPlaying()Z

    move-result v3

    if-nez v3, :cond_2

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getDuration()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_2

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v5

    cmp-long v7, v5, v3

    if-ltz v7, :cond_2

    :cond_0
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    const/4 v2, 0x1

    iput-boolean v2, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    iget-object v3, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v3, :cond_1

    invoke-virtual {v3, v2}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->setNotifiedCompleted(Z)V

    :cond_1
    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    const/4 v3, 0x0

    iput-object v3, p0, Le/e/a/Media3VideoPlayer;->completedFrameSurface:Landroid/view/Surface;

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->showCompletedFrameIfNeeded()V

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->refreshClock()V

    return v2

    :cond_2
    return v0
.end method

.method public seekTo(J)V
    .registers 6

    .line 422
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_3

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_3

    const/4 v0, 0x1

    .line 423
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    iget-boolean v1, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    if-eqz v1, :cond_0

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    :cond_0
    const-wide/16 v1, 0x0

    .line 424
    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->max(JJ)J

    move-result-wide p1

    iput-wide p1, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    .line 425
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result p1

    const/4 p2, 0x4

    if-ne p1, p2, :cond_1

    .line 426
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    .line 427
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    .line 428
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p1, :cond_1

    const/4 p2, 0x0

    invoke-virtual {p1, p2}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->setNotifiedCompleted(Z)V

    .line 430
    :cond_1
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-wide v0, p0, Le/e/a/Media3VideoPlayer;->requestedSeek:J

    invoke-interface {p1, v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->seekTo(J)V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    if-eqz v0, :cond_2

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_2

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 431
    :cond_2
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->finishSeek()V

    :cond_3
    return-void
.end method

.method public setListenerMux(Lcom/devbrackets/android/exomedia/core/ListenerMux;)V
    .registers 2

    .line 125
    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    return-void
.end method

.method public setPlaybackSpeed(F)Z
    .registers 3

    .line 504
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_1

    invoke-static {p1}, Ljava/lang/Float;->isFinite(F)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-lez v0, :cond_1

    .line 507
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_0

    .line 508
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setPlaybackSpeed(F)V

    .line 509
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackParameters()Landroidx/media3/common/PlaybackParameters;

    move-result-object p1

    iget p1, p1, Landroidx/media3/common/PlaybackParameters;->speed:F

    iput p1, p0, Le/e/a/Media3VideoPlayer;->sampledSpeed:F

    :cond_0
    const/4 p0, 0x1

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method

.method public setRendererEnabled(Ljava/lang/Enum;Z)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;Z)V"
        }
    .end annotation

    .line 559
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    .line 560
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    .line 561
    invoke-static {p1}, Le/e/a/Media3VideoPlayer;->trackType(Ljava/lang/Enum;)I

    move-result p1

    xor-int/lit8 p2, p2, 0x1

    invoke-virtual {v0, p1, p2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object p1

    .line 560
    invoke-interface {p0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    :cond_0
    return-void
.end method

.method public setRepeatMode(I)V
    .registers 3

    .line 533
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_0

    .line 534
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setRepeatMode(I)V

    :cond_0
    return-void
.end method

.method public setSurface(Landroid/view/Surface;)V
    .registers 3

    .line 352
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    .line 353
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    invoke-direct {p0, p1, v0}, Le/e/a/Media3VideoPlayer;->releaseSurface(Landroid/view/Surface;Z)V

    return-void

    .line 356
    :cond_0
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    if-eqz v0, :cond_2

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/view/Surface;->isValid()Z

    move-result v0

    if-nez v0, :cond_2

    .line 357
    :cond_1
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    invoke-direct {p0, p1, v0}, Le/e/a/Media3VideoPlayer;->releaseSurface(Landroid/view/Surface;Z)V

    return-void

    :cond_2
    const/4 v0, 0x0

    .line 360
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    .line 361
    iput-object p1, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    .line 362
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->ownsViewSurface:Z

    invoke-direct {p0, p1, v0}, Le/e/a/Media3VideoPlayer;->setVideoOutput(Landroid/view/Surface;Z)V

    return-void
.end method

.method public setTrack(Ljava/lang/Enum;II)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Enum<",
            "*>;II)V"
        }
    .end annotation

    .line 606
    invoke-direct {p0, p1, p2}, Le/e/a/Media3VideoPlayer;->group(Ljava/lang/Enum;I)Landroidx/media3/common/Tracks$Group;

    move-result-object p1

    if-eqz p1, :cond_0

    if-ltz p3, :cond_0

    .line 607
    iget p2, p1, Landroidx/media3/common/Tracks$Group;->length:I

    if-ge p3, p2, :cond_0

    .line 608
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object p2

    invoke-virtual {p2}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p2

    .line 609
    new-instance v0, Landroidx/media3/common/TrackSelectionOverride;

    invoke-virtual {p1}, Landroidx/media3/common/Tracks$Group;->getMediaTrackGroup()Landroidx/media3/common/TrackGroup;

    move-result-object p1

    invoke-direct {v0, p1, p3}, Landroidx/media3/common/TrackSelectionOverride;-><init>(Landroidx/media3/common/TrackGroup;I)V

    invoke-virtual {p2, v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setOverrideForType(Landroidx/media3/common/TrackSelectionOverride;)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object p1

    .line 608
    invoke-interface {p0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    :cond_0
    return-void
.end method

.method public setVideoUri(Landroid/net/Uri;)V
    .registers 6

    invoke-static {p0}, Le/e/a/MiniCompletion;->clearCompleted(Le/e/a/Media3VideoPlayer;)V

    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->completedReturn:Z

    .line 233
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    .line 236
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    .line 237
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->clearNetworkRecovery()V

    .line 238
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->soughtAfterCompletion:Z

    .line 239
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    .line 240
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->skipPopupAutoStart:Z

    .line 241
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v2, p0, Le/e/a/Media3VideoPlayer;->popupReadyTimeout:Ljava/lang/Runnable;

    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    const/4 v1, 0x0

    .line 242
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->popupReady:Ljava/lang/Runnable;

    .line 243
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->waitingForDestination:Z

    .line 244
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    .line 245
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->renderedOutput:Ljava/lang/Object;

    .line 246
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    const-wide/16 v0, 0x0

    .line 247
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->sampledPosition:J

    .line 248
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->sampledDuration:J

    if-nez p1, :cond_1

    const-wide/16 v0, -0x1

    goto :goto_0

    .line 249
    :cond_1
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    :goto_0
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    .line 250
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->resetListeners()V

    if-nez p1, :cond_2

    .line 252
    iget-object p1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    .line 253
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->clearMediaItems()V

    return-void

    .line 256
    :cond_2
    iget-object v2, p0, Le/e/a/Media3VideoPlayer;->context:Landroid/content/Context;

    invoke-static {v2}, Lnicoid/network238/NetworkInit;->init(Landroid/content/Context;)V

    new-instance v0, Le/e/a/VideoHttpSource$Credential;

    sget-object v1, Le/e/a/ModernPlayback;->domandCookie:Ljava/lang/String;

    invoke-direct {v0, v1}, Le/e/a/VideoHttpSource$Credential;-><init>(Ljava/lang/String;)V

    .line 257
    new-instance v1, Landroidx/media3/datasource/DefaultDataSource$Factory;

    iget-object v2, p0, Le/e/a/Media3VideoPlayer;->context:Landroid/content/Context;

    .line 258
    new-instance v3, Le/e/a/Media3VideoPlayer$8;

    invoke-direct {v3, v0}, Le/e/a/Media3VideoPlayer$8;-><init>(Le/e/a/VideoHttpSource$Credential;)V

    .line 257
    invoke-direct {v1, v2, v3}, Landroidx/media3/datasource/DefaultDataSource$Factory;-><init>(Landroid/content/Context;Landroidx/media3/datasource/DataSource$Factory;)V

    .line 259
    invoke-static {p1}, Landroidx/media3/common/MediaItem;->fromUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem;

    move-result-object p1

    .line 260
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v2, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;

    invoke-direct {v2, v1}, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;-><init>(Landroidx/media3/datasource/DataSource$Factory;)V

    invoke-virtual {v2, p1}, Landroidx/media3/exoplayer/source/DefaultMediaSourceFactory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/source/MediaSource;

    move-result-object p1

    invoke-interface {v0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    .line 261
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    return-void
.end method

.method public setVolume(F)Z
    .registers 3

    .line 521
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-eqz v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 524
    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0, p1}, Landroidx/media3/exoplayer/ExoPlayer;->setVolume(F)V

    const/4 p0, 0x1

    return p0
.end method

.method skipPopupAutoStart()Z
    .registers 2

    .line 218
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_0

    iget-boolean p0, p0, Le/e/a/Media3VideoPlayer;->skipPopupAutoStart:Z

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public start()V
    .registers 3

    .line 265
    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->onStart(Ljava/lang/Object;)V

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_3

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->bindingRetainedView:Z

    if-nez v0, :cond_3

    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->replayCompletedReturn()V

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->networkBuffering:Z

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->main:Landroid/os/Handler;

    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->retryNetwork:Ljava/lang/Runnable;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->retryNetworkPlayback()V

    goto :goto_0

    :cond_0
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 266
    :cond_1
    :goto_0
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz v0, :cond_2

    const/4 v1, 0x0

    .line 267
    invoke-virtual {v0, v1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->setNotifiedCompleted(Z)V

    .line 269
    :cond_2
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    :cond_3
    return-void
.end method

.method startScrubbing()Z
    .registers 4

    .line 398
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    invoke-static {p0}, Le/e/a/Media3Diagnostics276;->canPreviewLocalMedia(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->isCurrentMediaItemSeekable()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v0

    const/4 v1, 0x3

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    .line 401
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->scrubbing:Z

    .line 402
    iget-object v1, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    sget-object v2, Le/e/a/Media3VideoPlayer;->PREVIEW_SEEK:Landroidx/media3/exoplayer/SeekParameters;

    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->setSeekParameters(Landroidx/media3/exoplayer/SeekParameters;)V

    .line 403
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setScrubbingModeEnabled(Z)V

    return v0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public stop(Lcom/devbrackets/android/exomedia/core/video/ClearableSurface;Z)V
    .registers 5

    .line 313
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_1

    const/4 v0, 0x0

    .line 314
    iput-boolean v0, p0, Le/e/a/Media3VideoPlayer;->pendingSeek:Z

    .line 315
    invoke-direct {p0}, Le/e/a/Media3VideoPlayer;->clearNetworkRecovery()V

    const-wide/16 v0, -0x1

    .line 316
    iput-wide v0, p0, Le/e/a/Media3VideoPlayer;->firstFrameStartedAt:J

    .line 317
    invoke-virtual {p0}, Le/e/a/Media3VideoPlayer;->endScrubbing()V

    .line 318
    iget-object v0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    if-eqz p2, :cond_0

    .line 319
    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    if-eqz p2, :cond_0

    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p2}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result p2

    const/4 v0, 0x1

    if-eq p2, v0, :cond_0

    .line 320
    iget-object p2, p0, Le/e/a/Media3VideoPlayer;->listeners:Lcom/devbrackets/android/exomedia/core/ListenerMux;

    invoke-virtual {p2, p1}, Lcom/devbrackets/android/exomedia/core/ListenerMux;->clearSurfaceWhenReady(Lcom/devbrackets/android/exomedia/core/video/ClearableSurface;)V

    .line 322
    :cond_0
    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    :cond_1
    return-void
.end method

.method stopForReplacement()V
    .registers 2

    .line 366
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    iget-object p0, p0, Le/e/a/Media3VideoPlayer;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    :cond_0
    return-void
.end method

.method suspendVideoOutput()V
    .registers 3

    .line 370
    iget-boolean v0, p0, Le/e/a/Media3VideoPlayer;->released:Z

    if-nez v0, :cond_0

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 371
    invoke-direct {p0, v1, v0}, Le/e/a/Media3VideoPlayer;->setVideoOutput(Landroid/view/Surface;Z)V

    .line 372
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->handoffOutput:Landroid/view/Surface;

    .line 373
    iput-object v1, p0, Le/e/a/Media3VideoPlayer;->renderedOutput:Ljava/lang/Object;

    :cond_0
    return-void
.end method
