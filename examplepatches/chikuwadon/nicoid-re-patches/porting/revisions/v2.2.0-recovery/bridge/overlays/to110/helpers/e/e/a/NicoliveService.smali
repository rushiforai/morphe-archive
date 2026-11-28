.class public Le/e/a/NicoliveService;
.super Landroid/app/Service;
.source "NicoliveService.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/NicoliveService$CookieSource;,
        Le/e/a/NicoliveService$LocalBinder;,
        Le/e/a/NicoliveService$Observer;
    }
.end annotation


# static fields
.field public static volatile active:Le/e/a/NicoliveService;


# instance fields
.field activeStreamQuality:Ljava/lang/String;

.field activeStreamUri:Ljava/lang/String;

.field artworkProgramId:Ljava/lang/String;

.field artworkTask:Ljava/util/concurrent/Future;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/Future<",
            "*>;"
        }
    .end annotation
.end field

.field artworkToken:I

.field final artworkWork:Ljava/util/concurrent/ExecutorService;

.field aspect:F

.field audioOnly:Z

.field commentVisible:Z

.field commentsConnected:Z

.field cryptoRecoveryCount:I

.field cryptoRecoveryPending:Z

.field cryptoRecoveryStart:J

.field deliveredCount:J

.field frame:Le/e/a/NicolivePlayerFrame;

.field final history:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Le/e/a/NicoliveData$Chat;",
            ">;"
        }
    .end annotation
.end field

.field id:Ljava/lang/String;

.field final incoming:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Le/e/a/NicoliveData$Chat;",
            ">;"
        }
    .end annotation
.end field

.field keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

.field private final liveWindowRecovery:Le/e/a/LiveWindowRecovery;

.field final main:Landroid/os/Handler;

.field manager:Landroid/view/WindowManager;

.field mediaArtwork:Landroid/graphics/Bitmap;

.field volatile mediaCookies:Lorg/json/JSONArray;

.field mediaSession:Landroid/media/session/MediaSession;

.field ng:Le/e/a/NicoliveNg;

.field final observers:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Le/e/a/NicoliveService$Observer;",
            ">;"
        }
    .end annotation
.end field

.field pausedAt:J

.field player:Landroidx/media3/exoplayer/ExoPlayer;

.field popup:Le/e/a/NicolivePlayerFrame;

.field popupParams:Landroid/view/WindowManager$LayoutParams;

.field program:Le/e/a/NicoliveData$Program;

.field qualities:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private resumePosition:Le/e/a/LiveResumePosition;

.field final scheduled:Ljava/util/PriorityQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/PriorityQueue<",
            "Le/e/a/NicoliveData$Chat;",
            ">;"
        }
    .end annotation
.end field

.field selected:Ljava/lang/String;

.field volatile serial:I

.field session:Le/e/a/NicoliveSession;

.field status:Ljava/lang/String;

.field volatile stopped:Z

.field terminal:Z

.field final tick:Ljava/lang/Runnable;

.field userPaused:Z

.field final window:Landroidx/media3/common/Timeline$Window;


# direct methods
.method public constructor <init>()V
    .registers 4

    .line 7
    invoke-direct {p0}, Landroid/app/Service;-><init>()V

    .line 11
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->newSetFromMap(Ljava/util/Map;)Ljava/util/Set;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    .line 12
    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    new-instance v0, Ljava/util/ArrayDeque;

    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveService;->incoming:Ljava/util/ArrayDeque;

    .line 13
    new-instance v0, Ljava/util/PriorityQueue;

    new-instance v1, Le/e/a/NicoliveService$1;

    invoke-direct {v1, p0}, Le/e/a/NicoliveService$1;-><init>(Le/e/a/NicoliveService;)V

    const/16 v2, 0x20

    invoke-direct {v0, v2, v1}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->scheduled:Ljava/util/PriorityQueue;

    .line 14
    new-instance v0, Le/e/a/LiveWindowRecovery;

    invoke-direct {v0}, Le/e/a/LiveWindowRecovery;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveService;->liveWindowRecovery:Le/e/a/LiveWindowRecovery;

    .line 16
    new-instance v0, Landroidx/media3/common/Timeline$Window;

    invoke-direct {v0}, Landroidx/media3/common/Timeline$Window;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveService;->window:Landroidx/media3/common/Timeline$Window;

    .line 17
    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    const-string v1, "abr"

    iput-object v1, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    iput-object v1, p0, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    new-instance v1, Lorg/json/JSONArray;

    invoke-direct {v1}, Lorg/json/JSONArray;-><init>()V

    iput-object v1, p0, Le/e/a/NicoliveService;->mediaCookies:Lorg/json/JSONArray;

    iput-object v0, p0, Le/e/a/NicoliveService;->activeStreamUri:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Le/e/a/NicoliveService;->commentVisible:Z

    const v1, 0x3fe38e39

    iput v1, p0, Le/e/a/NicoliveService;->aspect:F

    .line 19
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v1

    iput-object v1, p0, Le/e/a/NicoliveService;->artworkWork:Ljava/util/concurrent/ExecutorService;

    .line 21
    iput-object v0, p0, Le/e/a/NicoliveService;->artworkProgramId:Ljava/lang/String;

    .line 23
    new-instance v0, Le/e/a/NicoliveService$2;

    invoke-direct {v0, p0}, Le/e/a/NicoliveService$2;-><init>(Le/e/a/NicoliveService;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->tick:Ljava/lang/Runnable;

    return-void
.end method

.method static synthetic access$0(Le/e/a/NicoliveService;)Le/e/a/LiveResumePosition;
    .registers 1

    .line 15
    iget-object p0, p0, Le/e/a/NicoliveService;->resumePosition:Le/e/a/LiveResumePosition;

    return-object p0
.end method

.method private cancelNotification()V
    .registers 2

    .line 257
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/app/NotificationManager;

    if-eqz p0, :cond_0

    const/16 v0, 0x7d0

    .line 258
    invoke-virtual {p0, v0}, Landroid/app/NotificationManager;->cancel(I)V

    :cond_0
    return-void
.end method

.method private clearMediaSession()V
    .registers 6

    .line 245
    iget-object v0, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 247
    iput-object v1, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    .line 249
    :try_start_0
    new-instance p0, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {p0}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v1, -0x1

    const/4 v3, 0x0

    const/4 v4, 0x1

    .line 250
    invoke-virtual {p0, v4, v1, v2, v3}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    move-result-object p0

    .line 251
    invoke-virtual {p0}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object p0

    .line 249
    invoke-virtual {v0, p0}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    const/4 p0, 0x0

    .line 252
    invoke-virtual {v0, p0}, Landroid/media/session/MediaSession;->setActive(Z)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 253
    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V

    return-void

    :catchall_0
    move-exception p0

    invoke-virtual {v0}, Landroid/media/session/MediaSession;->release()V

    throw p0

    :cond_0
    return-void
.end method

.method private clearMediaSessionAndNotification()V
    .registers 1

    .line 261
    invoke-direct {p0}, Le/e/a/NicoliveService;->clearMediaSession()V

    .line 262
    invoke-direct {p0}, Le/e/a/NicoliveService;->cancelNotification()V

    return-void
.end method


# virtual methods
.method action(Ljava/lang/String;I)Landroid/app/PendingIntent;
    .registers 5

    .line 311
    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    invoke-virtual {v0, p1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object p1

    const/high16 v0, 0xc000000

    invoke-static {p0, p2, p1, v0}, Landroid/app/PendingIntent;->getService(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object p0

    return-object p0
.end method

.method applyStream(Lorg/json/JSONObject;)V
    .registers 12

    const/4 v0, 0x0

    .line 104
    :try_start_0
    iput-boolean v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    const-string v1, "cookies"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_0

    iput-object v1, p0, Le/e/a/NicoliveService;->mediaCookies:Lorg/json/JSONArray;

    :cond_0
    iget-object v1, p0, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    const-string v1, "availableQualities"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v1

    if-eqz v1, :cond_1

    move v2, v0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v3

    if-ge v2, v3, :cond_1

    iget-object v3, p0, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    invoke-virtual {v1, v2}, Lorg/json/JSONArray;->optString(I)Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 105
    :cond_1
    const-string v1, "uri"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 106
    iget-object v1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v1

    .line 107
    iget-object v2, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v2}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v2

    const/4 v3, 0x1

    if-eqz v2, :cond_3

    iget-object v2, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v2}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v2

    if-nez v2, :cond_3

    const/4 v2, 0x3

    if-eq v1, v2, :cond_2

    const/4 v2, 0x2

    if-ne v1, v2, :cond_3

    :cond_2
    move v2, v3

    goto :goto_1

    :cond_3
    move v2, v0

    .line 109
    :goto_1
    iget-object v4, p0, Le/e/a/NicoliveService;->activeStreamUri:Ljava/lang/String;

    iget-object v5, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    iget-object v6, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    invoke-static {v4, p1, v5, v6, v2}, Le/e/a/LiveStreamUpdatePolicy;->reuse(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 110
    const-string v5, " state="

    const-string v6, "STREAM"

    const-string v7, "nicoid-live"

    if-eqz v4, :cond_4

    .line 111
    :try_start_1
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "reused-source;cookieCount="

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/NicoliveService;->mediaCookies:Lorg/json/JSONArray;

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v2

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v6, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    .line 114
    const-string p1, "Stream credentials updated without player reset"

    invoke-static {v7, p1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 115
    iput-boolean v0, p0, Le/e/a/NicoliveService;->terminal:Z

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void

    .line 117
    :cond_4
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v8, "Stream source updated, sameUri="

    invoke-direct {v4, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v8, p0, Le/e/a/NicoliveService;->activeStreamUri:Ljava/lang/String;

    invoke-virtual {p1, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v8, ", qualityChanged="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v8, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    iget-object v9, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    invoke-virtual {v8, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    xor-int/2addr v8, v3

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v8, ", active="

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v7, v2}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "new-source;cookieCount="

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Le/e/a/NicoliveService;->mediaCookies:Lorg/json/JSONArray;

    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " qualityChanged="

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    iget-object v4, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    xor-int/2addr v1, v3

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v6, v1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    .line 119
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v1

    .line 120
    new-instance v2, Le/e/a/NicoliveService$6;

    invoke-direct {v2, p0}, Le/e/a/NicoliveService$6;-><init>(Le/e/a/NicoliveService;)V

    .line 121
    new-instance v4, Landroidx/media3/common/MediaItem$Builder;

    invoke-direct {v4}, Landroidx/media3/common/MediaItem$Builder;-><init>()V

    invoke-virtual {v4, v1}, Landroidx/media3/common/MediaItem$Builder;->setUri(Landroid/net/Uri;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    const-string v4, "application/x-mpegURL"

    invoke-virtual {v1, v4}, Landroidx/media3/common/MediaItem$Builder;->setMimeType(Ljava/lang/String;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    new-instance v4, Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;

    invoke-direct {v4}, Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;-><init>()V

    const/high16 v5, 0x3f800000    # 1.0f

    invoke-virtual {v4, v5}, Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;->setMaxPlaybackSpeed(F)Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;

    move-result-object v4

    invoke-virtual {v4, v5}, Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;->setMinPlaybackSpeed(F)Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;

    move-result-object v4

    invoke-virtual {v4}, Landroidx/media3/common/MediaItem$LiveConfiguration$Builder;->build()Landroidx/media3/common/MediaItem$LiveConfiguration;

    move-result-object v4

    invoke-virtual {v1, v4}, Landroidx/media3/common/MediaItem$Builder;->setLiveConfiguration(Landroidx/media3/common/MediaItem$LiveConfiguration;)Landroidx/media3/common/MediaItem$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media3/common/MediaItem$Builder;->build()Landroidx/media3/common/MediaItem;

    move-result-object v1

    .line 122
    new-instance v4, Le/e/a/HlsKeyRefreshingPlaylistParser;

    invoke-direct {v4}, Le/e/a/HlsKeyRefreshingPlaylistParser;-><init>()V

    iput-object v4, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    iget-object v4, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v5, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;

    invoke-direct {v5, v2}, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;-><init>(Landroidx/media3/datasource/DataSource$Factory;)V

    iget-object v2, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    invoke-virtual {v5, v2}, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;->setPlaylistParserFactory(Landroidx/media3/exoplayer/hls/playlist/HlsPlaylistParserFactory;)Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;

    move-result-object v2

    invoke-virtual {v2, v1}, Landroidx/media3/exoplayer/hls/HlsMediaSource$Factory;->createMediaSource(Landroidx/media3/common/MediaItem;)Landroidx/media3/exoplayer/hls/HlsMediaSource;

    move-result-object v1

    invoke-interface {v4, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setMediaSource(Landroidx/media3/exoplayer/source/MediaSource;)V

    iget-object v1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v1}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    iget-object v1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-boolean v2, p0, Le/e/a/NicoliveService;->userPaused:Z

    xor-int/2addr v2, v3

    invoke-interface {v1, v2}, Landroidx/media3/exoplayer/ExoPlayer;->setPlayWhenReady(Z)V

    .line 123
    iput-object p1, p0, Le/e/a/NicoliveService;->activeStreamUri:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    iput-object p1, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    iput-boolean v0, p0, Le/e/a/NicoliveService;->terminal:Z

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    return-void

    .line 124
    :catch_0
    const-string/jumbo p1, "\u914d\u4fe1\u60c5\u5831\u3092\u8aad\u307f\u53d6\u308c\u307e\u305b\u3093\u3067\u3057\u305f"

    iput-object p1, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void
.end method

.method attach(Le/e/a/NicolivePlayerFrame;)V
    .registers 4

    .line 201
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_1

    iget-object v1, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eq v1, p1, :cond_1

    if-eqz v1, :cond_0

    iget-object v1, v1, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->clearVideoTextureView(Landroid/view/TextureView;)V

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v0}, Le/e/a/NicoliveCommentsView;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    const/4 v1, 0x0

    iput-object v1, v0, Le/e/a/NicoliveCommentsView;->service:Le/e/a/NicoliveService;

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iput-object v1, v0, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    :cond_0
    iput-object p1, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz p1, :cond_1

    iput-object p0, p1, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v0, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    iput-object p0, v0, Le/e/a/NicoliveCommentsView;->service:Le/e/a/NicoliveService;

    iget-object v0, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    iget-boolean v1, p0, Le/e/a/NicoliveService;->commentVisible:Z

    iput-boolean v1, v0, Le/e/a/NicoliveCommentsView;->enabled:Z

    iget v0, p0, Le/e/a/NicoliveService;->aspect:F

    invoke-virtual {p1, v0}, Le/e/a/NicolivePlayerFrame;->aspect(F)V

    iget-object p0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    iget-object v0, p1, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-interface {p0, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setVideoTextureView(Landroid/view/TextureView;)V

    invoke-virtual {p1}, Le/e/a/NicolivePlayerFrame;->updateControls()V

    :cond_1
    return-void
.end method

.method clearArtwork()V
    .registers 4

    .line 268
    iget v0, p0, Le/e/a/NicoliveService;->artworkToken:I

    const/4 v1, 0x1

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/NicoliveService;->artworkToken:I

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    const-string v2, ""

    iput-object v2, p0, Le/e/a/NicoliveService;->artworkProgramId:Ljava/lang/String;

    .line 269
    iget-object v2, p0, Le/e/a/NicoliveService;->artworkTask:Ljava/util/concurrent/Future;

    if-eqz v2, :cond_0

    invoke-interface {v2, v1}, Ljava/util/concurrent/Future;->cancel(Z)Z

    iput-object v0, p0, Le/e/a/NicoliveService;->artworkTask:Ljava/util/concurrent/Future;

    :cond_0
    return-void
.end method

.method closePopup()V
    .registers 4

    .line 221
    iget-object v0, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    iput-object v1, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    :try_start_0
    iget-object v2, p0, Le/e/a/NicoliveService;->manager:Landroid/view/WindowManager;

    invoke-interface {v2, v0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iput-object v1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    return-void
.end method

.method cornerResizePopup(IIIFFZZ)V
    .registers 20

    .line 213
    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_0

    iget v0, p0, Le/e/a/NicoliveService;->aspect:F

    const/4 v1, 0x0

    cmpl-float v0, v0, v1

    if-lez v0, :cond_0

    .line 214
    invoke-virtual {p0}, Le/e/a/NicoliveService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    .line 216
    iget v8, p0, Le/e/a/NicoliveService;->aspect:F

    iget v9, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v10, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    const/high16 v0, 0x43400000    # 192.0f

    invoke-static {p0, v0}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v11

    move v1, p1

    move v2, p2

    move v3, p3

    move/from16 v4, p4

    move/from16 v5, p5

    move/from16 v6, p6

    move/from16 v7, p7

    .line 215
    invoke-static/range {v1 .. v11}, Le/e/a/NicolivePopupCorner202;->bounds(IIIFFZZFIII)[I

    move-result-object p1

    .line 217
    iget-object p2, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/4 p3, 0x2

    aget p3, p1, p3

    iput p3, p2, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object p2, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/4 p3, 0x3

    aget p3, p1, p3

    iput p3, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    const/4 p2, 0x0

    .line 218
    aget p1, p1, p2

    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->resizePopup(I)V

    :cond_0
    return-void
.end method

.method detach(Le/e/a/NicolivePlayerFrame;)V
    .registers 4

    .line 202
    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-ne v0, p1, :cond_1

    if-eqz p1, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_0

    iget-object v1, p1, Le/e/a/NicolivePlayerFrame;->video:Landroid/view/TextureView;

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->clearVideoTextureView(Landroid/view/TextureView;)V

    :cond_0
    const/4 v0, 0x0

    iput-object v0, p1, Le/e/a/NicolivePlayerFrame;->owner:Le/e/a/NicoliveService;

    iget-object v1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v1}, Le/e/a/NicoliveCommentsView;->clear()V

    iget-object p1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    iput-object v0, p1, Le/e/a/NicoliveCommentsView;->service:Le/e/a/NicoliveService;

    iput-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    :cond_1
    return-void
.end method

.method foreground()V
    .registers 3

    .line 265
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    const/16 v0, 0x7d0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notification()Landroid/app/Notification;

    move-result-object v1

    invoke-virtual {p0, v0, v1}, Le/e/a/NicoliveService;->startForeground(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method

.method goLive()V
    .registers 3

    .line 196
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/NicoliveService;->userPaused:Z

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->seekToDefaultPosition()V

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    iget-object v0, p0, Le/e/a/NicoliveService;->scheduled:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_1

    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v0}, Le/e/a/NicoliveCommentsView;->clear()V

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void
.end method

.method handlePlaybackError(Landroidx/media3/common/PlaybackException;)V
    .registers 14

    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getErrorCodeName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    const-string v1, " cause="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    if-nez v1, :cond_0

    const-string v1, "none"

    goto :goto_0

    :cond_0
    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getCause()Ljava/lang/Throwable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string v1, " aesManifest="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v1, :cond_1

    iget-boolean v1, v1, Le/e/a/HlsKeyRefreshingPlaylistParser;->sawAes128:Z

    if-eqz v1, :cond_1

    move v1, v2

    goto :goto_1

    :cond_1
    move v1, v3

    :goto_1
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 54
    const-string v1, " blankGaps="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    const-wide/16 v4, 0x0

    if-nez v1, :cond_2

    move-wide v6, v4

    goto :goto_2

    :cond_2
    iget-object v1, v1, Le/e/a/HlsKeyRefreshingPlaylistParser;->blankGapTags:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    :goto_2
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 55
    const-string v1, " llPartsSuppressed="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    if-nez v1, :cond_3

    move-wide v6, v4

    goto :goto_3

    :cond_3
    iget-object v1, v1, Le/e/a/HlsKeyRefreshingPlaylistParser;->llPartsSuppressed:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v6

    :goto_3
    invoke-virtual {v0, v6, v7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 51
    const-string v1, "PLAYER_ERROR"

    invoke-static {v1, v0}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    .line 56
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v0

    .line 57
    iget v6, p1, Landroidx/media3/common/PlaybackException;->errorCode:I

    const/16 v7, 0x3ea

    if-ne v6, v7, :cond_5

    .line 58
    iget-object v6, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v6, :cond_5

    invoke-interface {v6}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result v6

    if-eqz v6, :cond_5

    iget-object v6, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v6}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItem()Landroidx/media3/common/MediaItem;

    move-result-object v6

    if-eqz v6, :cond_5

    .line 59
    iget-object v6, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v6, :cond_5

    iget-boolean v6, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v6, :cond_5

    iget-boolean v6, p0, Le/e/a/NicoliveService;->userPaused:Z

    if-nez v6, :cond_5

    iget-boolean v6, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v6, :cond_5

    .line 60
    iget-object v6, p0, Le/e/a/NicoliveService;->liveWindowRecovery:Le/e/a/LiveWindowRecovery;

    invoke-virtual {v6, v0, v1}, Le/e/a/LiveWindowRecovery;->claimAttempt(J)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 61
    const-string p1, "PLAYER_RECOVERY"

    const-string v0, "seek-to-live-default"

    invoke-static {p1, v0}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    iget-object p1, p0, Le/e/a/NicoliveService;->scheduled:Ljava/util/PriorityQueue;

    invoke-virtual {p1}, Ljava/util/PriorityQueue;->clear()V

    .line 63
    iget-object p1, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz p1, :cond_4

    iget-object p1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {p1}, Le/e/a/NicoliveCommentsView;->clear()V

    .line 64
    :cond_4
    iget-object p1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->seekToDefaultPosition()V

    .line 65
    iget-object p1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->prepare()V

    .line 66
    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void

    .line 69
    :cond_5
    invoke-static {p1}, Le/e/a/LiveRecoveryPolicy;->isAes128Failure(Ljava/lang/Throwable;)Z

    move-result v6

    const-string v7, "nicoid-live"

    if-nez v6, :cond_6

    iget-object v6, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    if-eqz v6, :cond_a

    iget-boolean v6, v6, Le/e/a/HlsKeyRefreshingPlaylistParser;->sawAes128:Z

    if-eqz v6, :cond_a

    invoke-static {p1}, Le/e/a/LiveRecoveryPolicy;->isCorruptedFmp4Failure(Ljava/lang/Throwable;)Z

    move-result v6

    if-eqz v6, :cond_a

    :cond_6
    iget-object v6, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v6, :cond_a

    iget-boolean v6, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v6, :cond_a

    iget-boolean v6, p0, Le/e/a/NicoliveService;->userPaused:Z

    if-nez v6, :cond_a

    iget-boolean v6, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v6, :cond_a

    .line 70
    iget-wide v8, p0, Le/e/a/NicoliveService;->cryptoRecoveryStart:J

    cmp-long v6, v8, v4

    if-eqz v6, :cond_7

    cmp-long v6, v0, v8

    if-ltz v6, :cond_7

    sub-long v8, v0, v8

    const-wide/32 v10, 0x493e0

    cmp-long v6, v8, v10

    if-lez v6, :cond_8

    .line 71
    :cond_7
    iput-wide v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryStart:J

    iput v3, p0, Le/e/a/NicoliveService;->cryptoRecoveryCount:I

    .line 73
    :cond_8
    iget v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryCount:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_a

    iget-boolean v1, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    if-nez v1, :cond_a

    add-int/2addr v0, v2

    .line 74
    iput v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryCount:I

    iget v1, p0, Le/e/a/NicoliveService;->serial:I

    .line 75
    iput-boolean v2, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    .line 76
    const-string v2, "HLS\u914d\u4fe1\u30c7\u30fc\u30bf\u3092\u518d\u53d6\u5f97\u3057\u3066\u3044\u307e\u3059\u2026"

    iput-object v2, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    .line 77
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Encrypted HLS consistency error ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getErrorCodeName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, "); blankGaps="

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    if-eqz p1, :cond_9

    iget-object p1, p1, Le/e/a/HlsKeyRefreshingPlaylistParser;->blankGapTags:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v4

    :cond_9
    invoke-virtual {v2, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, "; refreshing watch session "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, "/3"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 78
    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    invoke-virtual {p0}, Le/e/a/NicoliveService;->updateNotification()V

    .line 79
    iget-object p1, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    new-instance v2, Le/e/a/NicoliveService$9;

    invoke-direct {v2, p0, v1}, Le/e/a/NicoliveService$9;-><init>(Le/e/a/NicoliveService;I)V

    .line 83
    invoke-static {v0}, Le/e/a/LiveRecoveryPolicy;->retryDelayMs(I)J

    move-result-wide v0

    .line 79
    invoke-virtual {p1, v2, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    return-void

    .line 87
    :cond_a
    iput-boolean v3, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    .line 88
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Unrecoverable media playback error, code="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Landroidx/media3/common/PlaybackException;->getErrorCodeName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {v7, p1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 89
    const-string/jumbo p1, "\u6620\u50cf\u3092\u518d\u751f\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f\u3002\u518d\u63a5\u7d9a\u3092\u304a\u8a66\u3057\u304f\u3060\u3055\u3044"

    iput-object p1, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    .line 90
    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    invoke-virtual {p0}, Le/e/a/NicoliveService;->updateNotification()V

    return-void
.end method

.method synthetic lambda$0$e-e-a-NicoliveService(I)V
    .registers 3

    .line 80
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    iget v0, p0, Le/e/a/NicoliveService;->serial:I

    if-ne p1, v0, :cond_0

    iget-object p1, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz p1, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->userPaused:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    .line 81
    iput-boolean v0, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    invoke-virtual {p1}, Le/e/a/NicoliveSession;->reconnect()V

    :cond_0
    return-void
.end method

.method synthetic lambda$1$e-e-a-NicoliveService(Ljava/util/ArrayList;ILjava/lang/String;)V
    .registers 14

    .line 292
    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    .line 293
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-eqz v3, :cond_1

    return-void

    :cond_1
    add-int/lit8 v2, v2, 0x1

    .line 295
    invoke-static {v1}, Le/e/a/NicoliveArtwork;->fetch(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    :cond_2
    move-object v7, v1

    move v9, v2

    .line 300
    iget-object v0, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    new-instance v3, Le/e/a/NicoliveService$11;

    move-object v4, p0

    move-object v8, p1

    move v5, p2

    move-object v6, p3

    invoke-direct/range {v3 .. v9}, Le/e/a/NicoliveService$11;-><init>(Le/e/a/NicoliveService;ILjava/lang/String;Landroid/graphics/Bitmap;Ljava/util/ArrayList;I)V

    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method synthetic lambda$2$e-e-a-NicoliveService(ILjava/lang/String;Landroid/graphics/Bitmap;Ljava/util/ArrayList;I)V
    .registers 7

    .line 301
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_1

    iget v0, p0, Le/e/a/NicoliveService;->artworkToken:I

    if-ne p1, v0, :cond_1

    iget-object p1, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz p1, :cond_1

    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 302
    iput-object p3, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    .line 304
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "candidates="

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4}, Ljava/util/ArrayList;->size()I

    move-result p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 305
    const-string p2, " attempted="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " result="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p3, :cond_0

    const-string p2, "unavailable"

    goto :goto_0

    :cond_0
    const-string p2, "decoded"

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 304
    const-string p2, "ARTWORK"

    invoke-static {p2, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz p3, :cond_1

    .line 306
    invoke-virtual {p0}, Le/e/a/NicoliveService;->updateNotification()V

    :cond_1
    return-void
.end method

.method movePopup(II)V
    .registers 4

    .line 220
    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iput p1, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iput p2, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget p1, p1, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->resizePopup(I)V

    return-void
.end method

.method notification()Landroid/app/Notification;
    .registers 15

    .line 315
    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "program"

    iget-object v2, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x24000000

    .line 316
    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    const/16 v1, 0x7d0

    const/high16 v2, 0xc000000

    .line 317
    invoke-static {p0, v1, v0, v2}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v0

    .line 319
    iget-object v1, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v1, :cond_0

    iget-object v1, v1, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_0

    iget-object v1, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-object v1, v1, Le/e/a/NicoliveData$Program;->title:Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v1, "nicoid Re / \u751f\u653e\u9001"

    .line 320
    :goto_0
    iget-object v2, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v2, :cond_1

    iget-object v2, v2, Le/e/a/NicoliveData$Program;->owner:Ljava/lang/String;

    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_1

    iget-object v2, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-object v2, v2, Le/e/a/NicoliveData$Program;->owner:Ljava/lang/String;

    goto :goto_1

    :cond_1
    iget-object v2, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    .line 321
    :goto_1
    invoke-virtual {p0}, Le/e/a/NicoliveService;->playRequested()Z

    move-result v3

    .line 322
    iget-object v4, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz v4, :cond_2

    invoke-interface {v4}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayerError()Landroidx/media3/exoplayer/ExoPlaybackException;

    move-result-object v4

    if-eqz v4, :cond_2

    iget-boolean v4, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    if-nez v4, :cond_2

    move v4, v6

    goto :goto_2

    :cond_2
    move v4, v5

    .line 323
    :goto_2
    iget-object v7, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const/4 v8, 0x2

    if-eqz v7, :cond_3

    invoke-interface {v7}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v7

    if-eq v7, v6, :cond_3

    iget-object v7, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v7}, Landroidx/media3/exoplayer/ExoPlayer;->getPlaybackState()I

    move-result v7

    if-eq v7, v8, :cond_3

    iget-boolean v7, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    if-nez v7, :cond_3

    move v7, v5

    goto :goto_3

    :cond_3
    move v7, v6

    .line 324
    :goto_3
    invoke-virtual {p0}, Le/e/a/NicoliveService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget v9, v9, Landroid/content/pm/ApplicationInfo;->icon:I

    const v10, 0x1080024

    if-eqz v9, :cond_4

    invoke-virtual {p0}, Le/e/a/NicoliveService;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object v9

    iget v9, v9, Landroid/content/pm/ApplicationInfo;->icon:I

    goto :goto_4

    :cond_4
    move v9, v10

    .line 325
    :goto_4
    new-instance v11, Landroid/app/Notification$Builder;

    const-string v12, "nicoid_live"

    invoke-direct {v11, p0, v12}, Landroid/app/Notification$Builder;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    .line 326
    invoke-virtual {v11, v9}, Landroid/app/Notification$Builder;->setSmallIcon(I)Landroid/app/Notification$Builder;

    move-result-object v9

    invoke-virtual {v9, v1}, Landroid/app/Notification$Builder;->setContentTitle(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    invoke-virtual {v9, v2}, Landroid/app/Notification$Builder;->setContentText(Ljava/lang/CharSequence;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 327
    invoke-virtual {v9, v0}, Landroid/app/Notification$Builder;->setContentIntent(Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/app/Notification$Builder;->setOngoing(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/app/Notification$Builder;->setOnlyAlertOnce(Z)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 328
    const-string v11, "transport"

    invoke-virtual {v9, v11}, Landroid/app/Notification$Builder;->setCategory(Ljava/lang/String;)Landroid/app/Notification$Builder;

    move-result-object v9

    invoke-virtual {v9, v6}, Landroid/app/Notification$Builder;->setVisibility(I)Landroid/app/Notification$Builder;

    move-result-object v9

    if-eqz v4, :cond_5

    const v10, 0x108005f

    goto :goto_5

    :cond_5
    if-eqz v3, :cond_6

    const v10, 0x1080023

    :cond_6
    :goto_5
    if-eqz v4, :cond_7

    .line 330
    const-string v11, "\u518d\u63a5\u7d9a"

    goto :goto_6

    :cond_7
    if-eqz v3, :cond_8

    const-string v11, "\u4e00\u6642\u505c\u6b62"

    goto :goto_6

    :cond_8
    const-string v11, "\u518d\u751f"

    :goto_6
    if-eqz v4, :cond_9

    const-string v12, "reconnect"

    goto :goto_7

    :cond_9
    const-string v12, "toggle"

    :goto_7
    const/16 v13, 0x7d1

    invoke-virtual {p0, v12, v13}, Le/e/a/NicoliveService;->action(Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v12

    .line 329
    invoke-virtual {v9, v10, v11, v12}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 331
    const-string v10, "stop"

    const/16 v11, 0x7d2

    invoke-virtual {p0, v10, v11}, Le/e/a/NicoliveService;->action(Ljava/lang/String;I)Landroid/app/PendingIntent;

    move-result-object v10

    const v11, 0x1080038

    const-string/jumbo v12, "\u7d42\u4e86"

    invoke-virtual {v9, v11, v12, v10}, Landroid/app/Notification$Builder;->addAction(ILjava/lang/CharSequence;Landroid/app/PendingIntent;)Landroid/app/Notification$Builder;

    move-result-object v9

    .line 332
    iget-object v10, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    if-eqz v10, :cond_a

    invoke-virtual {v9, v10}, Landroid/app/Notification$Builder;->setLargeIcon(Landroid/graphics/Bitmap;)Landroid/app/Notification$Builder;

    .line 333
    :cond_a
    iget-object v10, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    if-eqz v10, :cond_10

    .line 334
    invoke-virtual {v10, v0}, Landroid/media/session/MediaSession;->setSessionActivity(Landroid/app/PendingIntent;)V

    .line 335
    new-instance v0, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v0}, Landroid/media/MediaMetadata$Builder;-><init>()V

    const-string v10, "android.media.metadata.TITLE"

    invoke-virtual {v0, v10, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v0

    .line 336
    const-string v10, "android.media.metadata.DISPLAY_TITLE"

    invoke-virtual {v0, v10, v1}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v0

    .line 337
    const-string v1, "android.media.metadata.ARTIST"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v0

    .line 338
    const-string v1, "android.media.metadata.DISPLAY_SUBTITLE"

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object v0

    .line 339
    iget-object v1, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    if-eqz v1, :cond_b

    .line 340
    const-string v2, "android.media.metadata.ART"

    invoke-virtual {v0, v2, v1}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 341
    const-string v1, "android.media.metadata.ALBUM_ART"

    iget-object v2, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 342
    const-string v1, "android.media.metadata.DISPLAY_ICON"

    iget-object v2, p0, Le/e/a/NicoliveService;->mediaArtwork:Landroid/graphics/Bitmap;

    invoke-virtual {v0, v1, v2}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 344
    :cond_b
    iget-object v1, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    invoke-virtual {v0}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    if-eqz v4, :cond_c

    const/4 v8, 0x7

    goto :goto_8

    .line 345
    :cond_c
    invoke-virtual {p0}, Le/e/a/NicoliveService;->playing()Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 v8, 0x3

    goto :goto_8

    :cond_d
    if-eqz v3, :cond_e

    if-eqz v7, :cond_e

    const/4 v8, 0x6

    .line 347
    :cond_e
    :goto_8
    iget-object v0, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    new-instance v1, Landroid/media/session/PlaybackState$Builder;

    invoke-direct {v1}, Landroid/media/session/PlaybackState$Builder;-><init>()V

    const-wide/16 v2, 0x207

    .line 348
    invoke-virtual {v1, v2, v3}, Landroid/media/session/PlaybackState$Builder;->setActions(J)Landroid/media/session/PlaybackState$Builder;

    move-result-object v1

    .line 350
    invoke-virtual {p0}, Le/e/a/NicoliveService;->playing()Z

    move-result v2

    if-eqz v2, :cond_f

    const/high16 v2, 0x3f800000    # 1.0f

    goto :goto_9

    :cond_f
    const/4 v2, 0x0

    :goto_9
    const-wide/16 v3, -0x1

    invoke-virtual {v1, v8, v3, v4, v2}, Landroid/media/session/PlaybackState$Builder;->setState(IJF)Landroid/media/session/PlaybackState$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroid/media/session/PlaybackState$Builder;->build()Landroid/media/session/PlaybackState;

    move-result-object v1

    .line 347
    invoke-virtual {v0, v1}, Landroid/media/session/MediaSession;->setPlaybackState(Landroid/media/session/PlaybackState;)V

    .line 351
    new-instance v0, Landroid/app/Notification$MediaStyle;

    invoke-direct {v0}, Landroid/app/Notification$MediaStyle;-><init>()V

    iget-object p0, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    invoke-virtual {p0}, Landroid/media/session/MediaSession;->getSessionToken()Landroid/media/session/MediaSession$Token;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/app/Notification$MediaStyle;->setMediaSession(Landroid/media/session/MediaSession$Token;)Landroid/app/Notification$MediaStyle;

    move-result-object p0

    .line 352
    filled-new-array {v5, v6}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/app/Notification$MediaStyle;->setShowActionsInCompactView([I)Landroid/app/Notification$MediaStyle;

    move-result-object p0

    .line 351
    invoke-virtual {v9, p0}, Landroid/app/Notification$Builder;->setStyle(Landroid/app/Notification$Style;)Landroid/app/Notification$Builder;

    .line 354
    :cond_10
    invoke-virtual {v9}, Landroid/app/Notification$Builder;->build()Landroid/app/Notification;

    move-result-object p0

    return-object p0
.end method

.method notifyObservers()V
    .registers 2

    .line 42
    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NicoliveService$Observer;

    invoke-interface {v0}, Le/e/a/NicoliveService$Observer;->changed()V

    goto :goto_0
.end method

.method public observe(Le/e/a/NicoliveService$Observer;)V
    .registers 2

    .line 41
    iget-object p0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    invoke-interface {p1}, Le/e/a/NicoliveService$Observer;->changed()V

    return-void
.end method

.method public onBind(Landroid/content/Intent;)Landroid/os/IBinder;
    .registers 2

    .line 40
    new-instance p1, Le/e/a/NicoliveService$LocalBinder;

    invoke-direct {p1, p0}, Le/e/a/NicoliveService$LocalBinder;-><init>(Le/e/a/NicoliveService;)V

    return-object p1
.end method

.method public onCreate()V
    .registers 5

    .line 28
    invoke-super {p0}, Landroid/app/Service;->onCreate()V

    new-instance v0, Le/e/a/LiveResumePosition;

    invoke-direct {v0, p0}, Le/e/a/LiveResumePosition;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->resumePosition:Le/e/a/LiveResumePosition;

    sput-object p0, Le/e/a/NicoliveService;->active:Le/e/a/NicoliveService;

    const-string v0, "window"

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/WindowManager;

    iput-object v0, p0, Le/e/a/NicoliveService;->manager:Landroid/view/WindowManager;

    new-instance v0, Le/e/a/NicoliveNg;

    invoke-direct {v0, p0}, Le/e/a/NicoliveNg;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    invoke-static {p0}, Le/e/a/NicoliveDiagnostics;->init(Landroid/content/Context;)V

    .line 29
    new-instance v0, Landroid/app/NotificationChannel;

    const-string/jumbo v1, "\u751f\u653e\u9001\u306e\u518d\u751f"

    const/4 v2, 0x2

    const-string v3, "nicoid_live"

    invoke-direct {v0, v3, v1, v2}, Landroid/app/NotificationChannel;-><init>(Ljava/lang/String;Ljava/lang/CharSequence;I)V

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/app/NotificationChannel;->setShowBadge(Z)V

    const-string v1, "notification"

    invoke-virtual {p0, v1}, Le/e/a/NicoliveService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/NotificationManager;

    invoke-virtual {v1, v0}, Landroid/app/NotificationManager;->createNotificationChannel(Landroid/app/NotificationChannel;)V

    .line 30
    new-instance v0, Landroid/media/session/MediaSession;

    const-string v1, "nicoid-live"

    invoke-direct {v0, p0, v1}, Landroid/media/session/MediaSession;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    new-instance v1, Le/e/a/NicoliveService$3;

    invoke-direct {v1, p0}, Le/e/a/NicoliveService$3;-><init>(Le/e/a/NicoliveService;)V

    iget-object v2, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    invoke-virtual {v0, v1, v2}, Landroid/media/session/MediaSession;->setCallback(Landroid/media/session/MediaSession$Callback;Landroid/os/Handler;)V

    iget-object v0, p0, Le/e/a/NicoliveService;->mediaSession:Landroid/media/session/MediaSession;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Landroid/media/session/MediaSession;->setActive(Z)V

    .line 31
    invoke-virtual {p0}, Le/e/a/NicoliveService;->foreground()V

    new-instance v0, Landroidx/media3/exoplayer/ExoPlayer$Builder;

    invoke-direct {v0, p0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroidx/media3/exoplayer/ExoPlayer$Builder;->build()Landroidx/media3/exoplayer/ExoPlayer;

    move-result-object v0

    iput-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v2, Landroidx/media3/common/AudioAttributes$Builder;

    invoke-direct {v2}, Landroidx/media3/common/AudioAttributes$Builder;-><init>()V

    invoke-virtual {v2, v1}, Landroidx/media3/common/AudioAttributes$Builder;->setUsage(I)Landroidx/media3/common/AudioAttributes$Builder;

    move-result-object v2

    const/4 v3, 0x3

    invoke-virtual {v2, v3}, Landroidx/media3/common/AudioAttributes$Builder;->setContentType(I)Landroidx/media3/common/AudioAttributes$Builder;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media3/common/AudioAttributes$Builder;->build()Landroidx/media3/common/AudioAttributes;

    move-result-object v2

    invoke-interface {v0, v2, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setAudioAttributes(Landroidx/media3/common/AudioAttributes;Z)V

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setHandleAudioBecomingNoisy(Z)V

    .line 32
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    new-instance v1, Le/e/a/NicoliveService$4;

    invoke-direct {v1, p0}, Le/e/a/NicoliveService$4;-><init>(Le/e/a/NicoliveService;)V

    invoke-interface {v0, v1}, Landroidx/media3/exoplayer/ExoPlayer;->addListener(Landroidx/media3/common/Player$Listener;)V

    .line 34
    iget-object v0, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    iget-object p0, p0, Le/e/a/NicoliveService;->tick:Ljava/lang/Runnable;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public onDestroy()V
    .registers 2

    .line 361
    invoke-virtual {p0}, Le/e/a/NicoliveService;->stopPlayback()V

    sget-object v0, Le/e/a/NicoliveService;->active:Le/e/a/NicoliveService;

    if-ne v0, p0, :cond_0

    const/4 v0, 0x0

    sput-object v0, Le/e/a/NicoliveService;->active:Le/e/a/NicoliveService;

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    invoke-super {p0}, Landroid/app/Service;->onDestroy()V

    return-void
.end method

.method public onStartCommand(Landroid/content/Intent;II)I
    .registers 5

    const/4 p2, 0x2

    if-eqz p1, :cond_6

    .line 36
    invoke-virtual {p1}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object p3

    const-string v0, "stop"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->stopPlayback()V

    return p2

    :cond_0
    const-string v0, "toggle"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveService;->playRequested()Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-virtual {p0}, Le/e/a/NicoliveService;->pause()V

    goto :goto_0

    :cond_1
    invoke-virtual {p0}, Le/e/a/NicoliveService;->resume()V

    goto :goto_0

    :cond_2
    const-string v0, "popup"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Le/e/a/NicoliveService;->showPopup()V

    goto :goto_0

    :cond_3
    const-string v0, "reconnect"

    invoke-virtual {v0, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_5

    iget-object p1, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_6

    iget-object p1, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    :cond_4
    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->open(Ljava/lang/String;)V

    goto :goto_0

    :cond_5
    const-string p3, "program"

    invoke-virtual {p1, p3}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/NicoliveData;->id(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_6

    iget-boolean p3, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez p3, :cond_4

    iget-object p3, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p3

    if-eqz p3, :cond_4

    .line 37
    :cond_6
    :goto_0
    iget-object p1, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_7

    invoke-virtual {p0}, Le/e/a/NicoliveService;->stopPlayback()V

    :cond_7
    return p2
.end method

.method open(Ljava/lang/String;)V
    .registers 9

    .line 92
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_2

    iget-object v1, p0, Le/e/a/NicoliveService;->resumePosition:Le/e/a/LiveResumePosition;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v2

    const/4 v4, 0x1

    invoke-virtual {v1, v0, v2, v3, v4}, Le/e/a/LiveResumePosition;->save(Landroidx/media3/exoplayer/ExoPlayer;JZ)V

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->clearMediaItems()V

    iget-object v0, p0, Le/e/a/NicoliveService;->resumePosition:Le/e/a/LiveResumePosition;

    invoke-virtual {v0, p1}, Le/e/a/LiveResumePosition;->open(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/NicoliveService;->liveWindowRecovery:Le/e/a/LiveWindowRecovery;

    invoke-virtual {v0}, Le/e/a/LiveWindowRecovery;->reset()V

    const-string v0, "WATCH"

    const-string v1, "begin-new-session"

    invoke-static {v0, v1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveService;->activeStreamUri:Ljava/lang/String;

    const-string v0, ""

    iput-object v0, p0, Le/e/a/NicoliveService;->activeStreamQuality:Ljava/lang/String;

    new-instance v0, Lorg/json/JSONArray;

    invoke-direct {v0}, Lorg/json/JSONArray;-><init>()V

    iput-object v0, p0, Le/e/a/NicoliveService;->mediaCookies:Lorg/json/JSONArray;

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/NicoliveService;->keyParser:Le/e/a/HlsKeyRefreshingPlaylistParser;

    invoke-virtual {p0}, Le/e/a/NicoliveService;->clearArtwork()V

    const/4 v1, 0x0

    iput-boolean v1, p0, Le/e/a/NicoliveService;->cryptoRecoveryPending:Z

    iput v1, p0, Le/e/a/NicoliveService;->cryptoRecoveryCount:I

    const-wide/16 v2, 0x0

    iput-wide v2, p0, Le/e/a/NicoliveService;->cryptoRecoveryStart:J

    iget v5, p0, Le/e/a/NicoliveService;->serial:I

    add-int/2addr v5, v4

    iput v5, p0, Le/e/a/NicoliveService;->serial:I

    iget-object v4, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    iget-object v6, p0, Le/e/a/NicoliveService;->tick:Ljava/lang/Runnable;

    invoke-virtual {v4, v6}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    iget-object v4, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    iget-object v6, p0, Le/e/a/NicoliveService;->tick:Ljava/lang/Runnable;

    invoke-virtual {v4, v6}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    invoke-static {p0}, Le/e/a/NicoliveEntry;->beforeLive(Landroid/content/Context;)V

    iget-object v4, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v4, :cond_0

    invoke-virtual {v4}, Le/e/a/NicoliveSession;->close()V

    :cond_0
    iput-object p1, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    iput-object v0, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iput-boolean v1, p0, Le/e/a/NicoliveService;->terminal:Z

    const-string/jumbo p1, "\u63a5\u7d9a\u4e2d\u2026"

    iput-object p1, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->clear()V

    const-string p1, "abr"

    iput-object p1, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    iput-boolean v1, p0, Le/e/a/NicoliveService;->audioOnly:Z

    iput-boolean v1, p0, Le/e/a/NicoliveService;->userPaused:Z

    iput-wide v2, p0, Le/e/a/NicoliveService;->deliveredCount:J

    iput-boolean v1, p0, Le/e/a/NicoliveService;->commentsConnected:Z

    iput-wide v2, p0, Le/e/a/NicoliveService;->pausedAt:J

    iget-object p1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v2

    const/4 v3, 0x2

    invoke-virtual {v2, v3, v1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v1

    invoke-virtual {v1}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v1

    invoke-interface {p1, v1}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    iget-object p1, p0, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    invoke-virtual {p1}, Ljava/util/ArrayDeque;->clear()V

    iget-object p1, p0, Le/e/a/NicoliveService;->scheduled:Ljava/util/PriorityQueue;

    invoke-virtual {p1}, Ljava/util/PriorityQueue;->clear()V

    iget-object p1, p0, Le/e/a/NicoliveService;->incoming:Ljava/util/ArrayDeque;

    monitor-enter p1

    :try_start_0
    iget-object v1, p0, Le/e/a/NicoliveService;->incoming:Ljava/util/ArrayDeque;

    invoke-virtual {v1}, Ljava/util/ArrayDeque;->clear()V

    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    iget-object p1, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz p1, :cond_1

    iget-object p1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {p1}, Le/e/a/NicoliveCommentsView;->clear()V

    :cond_1
    iget-object p1, p0, Le/e/a/NicoliveService;->ng:Le/e/a/NicoliveNg;

    invoke-virtual {p1}, Le/e/a/NicoliveNg;->reload()V

    iget-object p1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->stop()V

    .line 93
    const-string p1, ""

    :try_start_1
    invoke-static {p0, v0}, Le/e/a/SessionCookies194;->cookie(Landroid/content/Context;Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 94
    :catch_0
    invoke-static {p0}, Lnicoid/network238/NetworkInit;->init(Landroid/content/Context;)V

    new-instance v0, Le/e/a/NicoliveSession;

    iget-object v1, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    new-instance v2, Le/e/a/NicoliveService$5;

    invoke-direct {v2, p0, v5}, Le/e/a/NicoliveService$5;-><init>(Le/e/a/NicoliveService;I)V

    invoke-direct {v0, v1, p1, v2}, Le/e/a/NicoliveSession;-><init>(Ljava/lang/String;Ljava/lang/String;Le/e/a/NicoliveSession$Listener;)V

    iput-object v0, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    .line 102
    invoke-virtual {p0}, Le/e/a/NicoliveService;->foreground()V

    iget-object p1, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    invoke-virtual {p1}, Le/e/a/NicoliveSession;->start()V

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void

    .line 92
    :goto_0
    :try_start_2
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :cond_2
    return-void
.end method

.method pause()V
    .registers 3

    .line 194
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/NicoliveService;->userPaused:Z

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Le/e/a/NicoliveService;->pausedAt:J

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->pause()V

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void
.end method

.method playRequested()Z
    .registers 1

    .line 192
    iget-object p0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getPlayWhenReady()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method playbackEpoch()J
    .registers 8

    .line 193
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_1

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentTimeline()Landroidx/media3/common/Timeline;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/Timeline;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentTimeline()Landroidx/media3/common/Timeline;

    move-result-object v0

    iget-object v3, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v3}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentMediaItemIndex()I

    move-result v3

    iget-object v4, p0, Le/e/a/NicoliveService;->window:Landroidx/media3/common/Timeline$Window;

    invoke-virtual {v0, v3, v4}, Landroidx/media3/common/Timeline;->getWindow(ILandroidx/media3/common/Timeline$Window;)Landroidx/media3/common/Timeline$Window;

    iget-object v0, p0, Le/e/a/NicoliveService;->window:Landroidx/media3/common/Timeline$Window;

    iget-wide v3, v0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    const-wide v5, -0x7fffffffffffffffL    # -4.9E-324

    cmp-long v0, v3, v5

    if-nez v0, :cond_0

    return-wide v1

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveService;->window:Landroidx/media3/common/Timeline$Window;

    iget-wide v3, v0, Landroidx/media3/common/Timeline$Window;->windowStartTimeMs:J

    iget-object p0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->getCurrentPosition()J

    move-result-wide v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    add-long/2addr v3, v0

    return-wide v3

    :catch_0
    :cond_1
    return-wide v1
.end method

.method playing()Z
    .registers 1

    .line 191
    iget-object p0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz p0, :cond_0

    invoke-interface {p0}, Landroidx/media3/exoplayer/ExoPlayer;->isPlaying()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method reconnect()V
    .registers 3

    .line 197
    iget-object v0, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveService;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "reconnect"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->startForegroundService(Landroid/content/Intent;)Landroid/content/ComponentName;

    :cond_0
    return-void
.end method

.method requestArtwork(Le/e/a/NicoliveData$Program;)V
    .registers 6

    .line 272
    invoke-virtual {p0}, Le/e/a/NicoliveService;->clearArtwork()V

    if-nez p1, :cond_0

    return-void

    .line 274
    :cond_0
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 275
    iget-object v1, p1, Le/e/a/NicoliveData$Program;->mediaThumbnails:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_1
    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_4

    .line 279
    iget-object v1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/NicoliveArtwork;->isTrusted(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    iget-object v1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 280
    iget-object v1, p1, Le/e/a/NicoliveData$Program;->thumbnail:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 281
    :cond_2
    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 282
    const-string p0, "ARTWORK"

    const-string p1, "no trusted artwork candidate for current live program"

    invoke-static {p0, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    return-void

    .line 285
    :cond_3
    iget v1, p0, Le/e/a/NicoliveService;->artworkToken:I

    .line 286
    iget-object p1, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    .line 287
    iput-object p1, p0, Le/e/a/NicoliveService;->artworkProgramId:Ljava/lang/String;

    .line 288
    iget-object v2, p0, Le/e/a/NicoliveService;->artworkWork:Ljava/util/concurrent/ExecutorService;

    new-instance v3, Le/e/a/NicoliveService$10;

    invoke-direct {v3, p0, v0, v1, p1}, Le/e/a/NicoliveService$10;-><init>(Le/e/a/NicoliveService;Ljava/util/ArrayList;ILjava/lang/String;)V

    invoke-interface {v2, v3}, Ljava/util/concurrent/ExecutorService;->submit(Ljava/lang/Runnable;)Ljava/util/concurrent/Future;

    move-result-object p1

    iput-object p1, p0, Le/e/a/NicoliveService;->artworkTask:Ljava/util/concurrent/Future;

    return-void

    .line 275
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    .line 276
    invoke-static {v2}, Le/e/a/NicoliveArtwork;->isTrusted(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_1

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    .line 277
    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0
.end method

.method resizePopup(I)V
    .registers 7

    .line 207
    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v1, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    iget v3, p0, Le/e/a/NicoliveService;->aspect:F

    mul-float/2addr v2, v3

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iget-object v2, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/high16 v3, 0x43400000    # 192.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {v3, v1}, Ljava/lang/Math;->min(II)I

    move-result v3

    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    iput p1, v2, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    const/high16 v2, 0x42300000    # 44.0f

    invoke-static {p0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v2

    iget-object v3, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    int-to-float v3, v3

    iget v4, p0, Le/e/a/NicoliveService;->aspect:F

    div-float/2addr v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->height:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget v2, v0, Landroid/util/DisplayMetrics;->widthPixels:I

    iget-object v3, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->width:I

    sub-int/2addr v2, v3

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v1

    const/4 v2, 0x0

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    iput v1, p1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget v0, v0, Landroid/util/DisplayMetrics;->heightPixels:I

    iget-object v3, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v3, v3, Landroid/view/WindowManager$LayoutParams;->height:I

    sub-int/2addr v0, v3

    invoke-static {v1, v0}, Ljava/lang/Math;->min(II)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    iput v0, p1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object p1, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Le/e/a/NicolivePlayerFrame;->isAttachedToWindow()Z

    move-result p1

    if-eqz p1, :cond_0

    :try_start_0
    iget-object p1, p0, Le/e/a/NicoliveService;->manager:Landroid/view/WindowManager;

    iget-object v0, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    iget-object p0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {p1, v0, p0}, Landroid/view/WindowManager;->updateViewLayout(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    :cond_0
    return-void
.end method

.method resume()V
    .registers 5

    .line 195
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-nez v0, :cond_0

    return-void

    :cond_0
    const/4 v0, 0x0

    iput-boolean v0, p0, Le/e/a/NicoliveService;->userPaused:Z

    iget-wide v0, p0, Le/e/a/NicoliveService;->pausedAt:J

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-lez v0, :cond_3

    iget-object v0, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    invoke-static {v0}, Le/e/a/LiveResumePosition;->chase(Le/e/a/NicoliveSession;)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->seekToDefaultPosition()V

    :cond_1
    iget-object v0, p0, Le/e/a/NicoliveService;->scheduled:Ljava/util/PriorityQueue;

    invoke-virtual {v0}, Ljava/util/PriorityQueue;->clear()V

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_2

    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v0}, Le/e/a/NicoliveCommentsView;->clear()V

    :cond_2
    iput-wide v2, p0, Le/e/a/NicoliveService;->pausedAt:J

    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->play()V

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void
.end method

.method returnToActivity()V
    .registers 4

    .line 223
    new-instance v0, Landroid/content/Intent;

    const-class v1, Le/e/a/NicoliveActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "program"

    iget-object v2, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x34000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->startActivity(Landroid/content/Intent;)V

    return-void
.end method

.method returnToFrame(Le/e/a/NicolivePlayerFrame;)V
    .registers 4

    .line 222
    iget-object v0, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->attach(Le/e/a/NicolivePlayerFrame;)V

    if-eqz v0, :cond_0

    const/4 p1, 0x0

    iput-object p1, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    :try_start_0
    iget-object v1, p0, Le/e/a/NicoliveService;->manager:Landroid/view/WindowManager;

    invoke-interface {v1, v0}, Landroid/view/WindowManager;->removeView(Landroid/view/View;)V
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    iput-object p1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    :cond_0
    return-void
.end method

.method saveHistory(Le/e/a/NicoliveData$Program;)V
    .registers 9

    .line 360
    const-string v0, "nicolive_history"

    :try_start_0
    invoke-static {p0}, Landroid/preference/PreferenceManager;->getDefaultSharedPreferences(Landroid/content/Context;)Landroid/content/SharedPreferences;

    move-result-object p0

    new-instance v1, Lorg/json/JSONArray;

    const-string v2, "[]"

    invoke-interface {p0, v0, v2}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    new-instance v2, Lorg/json/JSONArray;

    invoke-direct {v2}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {p1}, Le/e/a/NicoliveData$Program;->stored()Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v2, v3}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    const/4 v3, 0x0

    :goto_0
    invoke-virtual {v1}, Lorg/json/JSONArray;->length()I

    move-result v4

    if-ge v3, v4, :cond_1

    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v4

    const/16 v5, 0x64

    if-ge v4, v5, :cond_1

    invoke-virtual {v1, v3}, Lorg/json/JSONArray;->optJSONObject(I)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_0

    iget-object v5, p1, Le/e/a/NicoliveData$Program;->id:Ljava/lang/String;

    const-string v6, "nicoliveProgramId"

    invoke-virtual {v4, v6}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v5, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_0

    invoke-virtual {v2, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_1
    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-virtual {v2}, Lorg/json/JSONArray;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    return-void
.end method

.method scalePopup(FFF)V
    .registers 10

    .line 208
    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    if-eqz v0, :cond_1

    const/4 v0, 0x0

    cmpg-float v0, p1, v0

    if-lez v0, :cond_1

    invoke-static {p1}, Ljava/lang/Float;->isNaN(F)Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p1}, Ljava/lang/Float;->isInfinite(F)Z

    move-result v0

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    iget-object v1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v1, v1, Landroid/view/WindowManager$LayoutParams;->height:I

    invoke-virtual {p0}, Le/e/a/NicoliveService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v3, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    iget v2, v2, Landroid/util/DisplayMetrics;->heightPixels:I

    int-to-float v2, v2

    iget v4, p0, Le/e/a/NicoliveService;->aspect:F

    mul-float/2addr v2, v4

    invoke-static {v2}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/high16 v3, 0x43400000    # 192.0f

    invoke-static {p0, v3}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v3

    invoke-static {v3, v2}, Ljava/lang/Math;->min(II)I

    move-result v3

    int-to-float v4, v0

    mul-float/2addr p1, v4

    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    move-result p1

    invoke-static {p1, v2}, Ljava/lang/Math;->min(II)I

    move-result p1

    invoke-static {v3, p1}, Ljava/lang/Math;->max(II)I

    move-result p1

    int-to-float v2, p1

    iget v3, p0, Le/e/a/NicoliveService;->aspect:F

    div-float v3, v2, v3

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    if-lez v0, :cond_0

    if-lez v1, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v5, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    div-float/2addr v2, v4

    const/high16 v4, 0x3f800000    # 1.0f

    sub-float v2, v4, v2

    mul-float/2addr p2, v2

    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    move-result p2

    add-int/2addr v5, p2

    iput v5, v0, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object p2, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    int-to-float v2, v3

    int-to-float v1, v1

    div-float/2addr v2, v1

    sub-float/2addr v4, v2

    mul-float/2addr p3, v4

    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    move-result p3

    add-int/2addr v0, p3

    iput v0, p2, Landroid/view/WindowManager$LayoutParams;->y:I

    :cond_0
    invoke-virtual {p0, p1}, Le/e/a/NicoliveService;->resizePopup(I)V

    :cond_1
    return-void
.end method

.method selectQuality(Ljava/lang/String;)V
    .registers 5

    .line 199
    iget-object v0, p0, Le/e/a/NicoliveService;->qualities:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v0, :cond_1

    invoke-virtual {v0, p1}, Le/e/a/NicoliveSession;->quality(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    iput-object p1, p0, Le/e/a/NicoliveService;->selected:Ljava/lang/String;

    const-string v0, "audio_"

    invoke-virtual {p1, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p1

    iput-boolean p1, p0, Le/e/a/NicoliveService;->audioOnly:Z

    iget-object p1, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-interface {p1}, Landroidx/media3/exoplayer/ExoPlayer;->getTrackSelectionParameters()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/TrackSelectionParameters;->buildUpon()Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    const/4 v1, 0x2

    iget-boolean v2, p0, Le/e/a/NicoliveService;->audioOnly:Z

    invoke-virtual {v0, v1, v2}, Landroidx/media3/common/TrackSelectionParameters$Builder;->setTrackTypeDisabled(IZ)Landroidx/media3/common/TrackSelectionParameters$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/media3/common/TrackSelectionParameters$Builder;->build()Landroidx/media3/common/TrackSelectionParameters;

    move-result-object v0

    invoke-interface {p1, v0}, Landroidx/media3/exoplayer/ExoPlayer;->setTrackSelectionParameters(Landroidx/media3/common/TrackSelectionParameters;)V

    iget-object p1, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz p1, :cond_0

    iget-object p1, p1, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {p1}, Le/e/a/NicoliveCommentsView;->clear()V

    :cond_0
    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    :cond_1
    return-void
.end method

.method send(Ljava/lang/String;Z)Z
    .registers 6

    .line 198
    invoke-virtual {p0}, Le/e/a/NicoliveService;->playing()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->playbackEpoch()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2, p2}, Le/e/a/NicoliveSession;->post(Ljava/lang/String;JZ)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method showPopup()V
    .registers 10

    .line 203
    iget-object v0, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    if-nez v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveService;->id:Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-static {p0}, Landroid/provider/Settings;->canDrawOverlays(Landroid/content/Context;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u8868\u793a\u306e\u6a29\u9650\u3092\u8a31\u53ef\u3057\u3066\u304f\u3060\u3055\u3044"

    iput-object v0, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    return-void

    .line 204
    :cond_0
    invoke-static {p0}, Le/e/a/UiTheme191;->context(Landroid/content/Context;)Landroid/content/Context;

    move-result-object v0

    new-instance v1, Le/e/a/NicolivePlayerFrame;

    const/4 v2, 0x1

    invoke-direct {v1, v0, v2}, Le/e/a/NicolivePlayerFrame;-><init>(Landroid/content/Context;Z)V

    iput-object v1, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    new-instance v3, Landroid/view/WindowManager$LayoutParams;

    const/high16 v1, 0x43960000    # 300.0f

    invoke-static {v0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v1

    invoke-virtual {p0}, Le/e/a/NicoliveService;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v2

    iget v2, v2, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    const/high16 v1, 0x43520000    # 210.0f

    invoke-static {v0, v1}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v5

    const/16 v7, 0x8

    const/4 v8, -0x3

    const/16 v6, 0x7f6

    invoke-direct/range {v3 .. v8}, Landroid/view/WindowManager$LayoutParams;-><init>(IIIII)V

    iput-object v3, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/16 v1, 0x33

    iput v1, v3, Landroid/view/WindowManager$LayoutParams;->gravity:I

    iget-object v1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/4 v2, 0x0

    iput v2, v1, Landroid/view/WindowManager$LayoutParams;->x:I

    iget-object v1, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    const/high16 v2, 0x42a00000    # 80.0f

    invoke-static {v0, v2}, Le/e/a/NicoliveUi;->dp(Landroid/content/Context;F)I

    move-result v0

    iput v0, v1, Landroid/view/WindowManager$LayoutParams;->y:I

    iget-object v0, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    iget v0, v0, Landroid/view/WindowManager$LayoutParams;->width:I

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->resizePopup(I)V

    .line 205
    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveService;->manager:Landroid/view/WindowManager;

    iget-object v1, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    iget-object v2, p0, Le/e/a/NicoliveService;->popupParams:Landroid/view/WindowManager$LayoutParams;

    invoke-interface {v0, v1, v2}, Landroid/view/WindowManager;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    iget-object v0, p0, Le/e/a/NicoliveService;->popup:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->attach(Le/e/a/NicolivePlayerFrame;)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    invoke-virtual {p0}, Le/e/a/NicoliveService;->closePopup()V

    const-string v0, "\u30dd\u30c3\u30d7\u30a2\u30c3\u30d7\u3092\u8868\u793a\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    iput-object v0, p0, Le/e/a/NicoliveService;->status:Ljava/lang/String;

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notifyObservers()V

    :cond_1
    return-void
.end method

.method stopPlayback()V
    .registers 6

    .line 225
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    const/4 v1, 0x1

    if-nez v0, :cond_0

    iget-object v0, p0, Le/e/a/NicoliveService;->resumePosition:Le/e/a/LiveResumePosition;

    iget-object v2, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    invoke-virtual {v0, v2, v3, v4, v1}, Le/e/a/LiveResumePosition;->save(Landroidx/media3/exoplayer/ExoPlayer;JZ)V

    .line 226
    :cond_0
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-eqz v0, :cond_1

    invoke-direct {p0}, Le/e/a/NicoliveService;->clearMediaSessionAndNotification()V

    return-void

    .line 227
    :cond_1
    iput-boolean v1, p0, Le/e/a/NicoliveService;->stopped:Z

    .line 228
    invoke-virtual {p0}, Le/e/a/NicoliveService;->clearArtwork()V

    .line 229
    iget-object v0, p0, Le/e/a/NicoliveService;->artworkWork:Ljava/util/concurrent/ExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ExecutorService;->shutdownNow()Ljava/util/List;

    .line 230
    iget v0, p0, Le/e/a/NicoliveService;->serial:I

    add-int/2addr v0, v1

    iput v0, p0, Le/e/a/NicoliveService;->serial:I

    .line 231
    invoke-virtual {p0}, Le/e/a/NicoliveService;->closePopup()V

    .line 232
    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-eqz v0, :cond_2

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->detach(Le/e/a/NicolivePlayerFrame;)V

    .line 233
    :cond_2
    iget-object v0, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    const/4 v2, 0x0

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Le/e/a/NicoliveSession;->close()V

    iput-object v2, p0, Le/e/a/NicoliveService;->session:Le/e/a/NicoliveSession;

    .line 234
    :cond_3
    iget-object v0, p0, Le/e/a/NicoliveService;->main:Landroid/os/Handler;

    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V

    .line 235
    iget-object v0, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    if-eqz v0, :cond_4

    invoke-interface {v0}, Landroidx/media3/exoplayer/ExoPlayer;->release()V

    iput-object v2, p0, Le/e/a/NicoliveService;->player:Landroidx/media3/exoplayer/ExoPlayer;

    .line 236
    :cond_4
    invoke-direct {p0}, Le/e/a/NicoliveService;->clearMediaSession()V

    .line 237
    :try_start_0
    invoke-virtual {p0, v1}, Le/e/a/NicoliveService;->stopForeground(Z)V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    .line 238
    const-string v1, "nicoid-live"

    const-string v2, "Unable to remove foreground state"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 240
    :goto_0
    invoke-direct {p0}, Le/e/a/NicoliveService;->cancelNotification()V

    .line 241
    invoke-virtual {p0}, Le/e/a/NicoliveService;->stopSelf()V

    .line 242
    new-instance v0, Ljava/util/ArrayList;

    iget-object p0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/NicoliveService$Observer;

    invoke-interface {v0}, Le/e/a/NicoliveService$Observer;->changed()V

    goto :goto_1
.end method

.method toggleComments()V
    .registers 11

    .line 200
    iget-boolean v0, p0, Le/e/a/NicoliveService;->commentVisible:Z

    xor-int/lit8 v0, v0, 0x1

    iput-boolean v0, p0, Le/e/a/NicoliveService;->commentVisible:Z

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    if-nez v0, :cond_0

    return-void

    :cond_0
    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    iget-boolean v1, p0, Le/e/a/NicoliveService;->commentVisible:Z

    iput-boolean v1, v0, Le/e/a/NicoliveCommentsView;->enabled:Z

    iget-object v0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v0, v0, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v0}, Le/e/a/NicoliveCommentsView;->clear()V

    iget-boolean v0, p0, Le/e/a/NicoliveService;->commentVisible:Z

    if-eqz v0, :cond_2

    iget-object v0, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    if-eqz v0, :cond_2

    iget-boolean v0, p0, Le/e/a/NicoliveService;->audioOnly:Z

    if-nez v0, :cond_2

    invoke-virtual {p0}, Le/e/a/NicoliveService;->playbackEpoch()J

    move-result-wide v0

    iget-object v2, p0, Le/e/a/NicoliveService;->history:Ljava/util/ArrayDeque;

    invoke-virtual {v2}, Ljava/util/ArrayDeque;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_1
    :goto_0
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/NicoliveData$Chat;

    iget-object v4, p0, Le/e/a/NicoliveService;->program:Le/e/a/NicoliveData$Program;

    iget-wide v4, v4, Le/e/a/NicoliveData$Program;->vposBase:J

    const-wide/16 v6, 0x3e8

    mul-long/2addr v4, v6

    iget-wide v6, v3, Le/e/a/NicoliveData$Chat;->vpos:J

    const-wide/16 v8, 0xa

    mul-long/2addr v6, v8

    add-long/2addr v4, v6

    iget-object v6, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v6, v6, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v6}, Le/e/a/NicoliveCommentsView;->duration()J

    move-result-wide v6

    sub-long v6, v0, v6

    cmp-long v6, v4, v6

    if-ltz v6, :cond_1

    const-wide/16 v6, 0x96

    add-long/2addr v6, v0

    cmp-long v6, v4, v6

    if-gtz v6, :cond_1

    iget-object v6, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    iget-object v6, v6, Le/e/a/NicolivePlayerFrame;->comments:Le/e/a/NicoliveCommentsView;

    invoke-virtual {v6, v3, v4, v5}, Le/e/a/NicoliveCommentsView;->add(Le/e/a/NicoliveData$Chat;J)V

    goto :goto_0

    :cond_2
    iget-object p0, p0, Le/e/a/NicoliveService;->frame:Le/e/a/NicolivePlayerFrame;

    invoke-virtual {p0}, Le/e/a/NicolivePlayerFrame;->updateControls()V

    return-void
.end method

.method public unobserve(Le/e/a/NicoliveService$Observer;)V
    .registers 2

    .line 41
    iget-object p0, p0, Le/e/a/NicoliveService;->observers:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    return-void
.end method

.method updateNotification()V
    .registers 3

    .line 357
    iget-boolean v0, p0, Le/e/a/NicoliveService;->stopped:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Le/e/a/NicoliveService;->terminal:Z

    if-nez v0, :cond_0

    .line 358
    const-string v0, "notification"

    invoke-virtual {p0, v0}, Le/e/a/NicoliveService;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/app/NotificationManager;

    const/16 v1, 0x7d0

    invoke-virtual {p0}, Le/e/a/NicoliveService;->notification()Landroid/app/Notification;

    move-result-object p0

    invoke-virtual {v0, v1, p0}, Landroid/app/NotificationManager;->notify(ILandroid/app/Notification;)V

    :cond_0
    return-void
.end method
