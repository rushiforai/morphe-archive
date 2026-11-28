.class public final Le/e/a/ArtworkRetry251;
.super Ljava/lang/Object;
.source "ArtworkRetry251.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ArtworkRetry251$Publish;,
        Le/e/a/ArtworkRetry251$Retry;
    }
.end annotation


# static fields
.field private static final ART:Ljava/lang/String; = "android.media.metadata.ART"


# instance fields
.field private attempt:I

.field private final id:Ljava/lang/String;

.field private key:Ljava/lang/String;

.field private final metadata:Landroid/media/MediaMetadata;

.field private final owner:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private final path:Ljava/lang/String;

.field private final session:Landroid/media/session/MediaSession;

.field private final token:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 7

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Le/e/a/ArtworkRetry251;->session:Landroid/media/session/MediaSession;

    iput-object p2, p0, Le/e/a/ArtworkRetry251;->token:Ljava/lang/Object;

    iput-object p3, p0, Le/e/a/ArtworkRetry251;->path:Ljava/lang/String;

    iput-object p4, p0, Le/e/a/ArtworkRetry251;->metadata:Landroid/media/MediaMetadata;

    iput-object p5, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    new-instance p1, Ljava/lang/ref/WeakReference;

    invoke-direct {p1, p6}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Le/e/a/ArtworkRetry251;->owner:Ljava/lang/ref/WeakReference;

    invoke-static {p6}, Le/e/a/ArtworkRetry251;->identity(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/ArtworkRetry251;->id:Ljava/lang/String;

    return-void
.end method

.method static synthetic access$000(Le/e/a/ArtworkRetry251;)Z
    .registers 1

    .line 10
    invoke-direct {p0}, Le/e/a/ArtworkRetry251;->current()Z

    move-result p0

    return p0
.end method

.method static synthetic access$100(Le/e/a/ArtworkRetry251;)Z
    .registers 1

    .line 10
    invoke-direct {p0}, Le/e/a/ArtworkRetry251;->same()Z

    move-result p0

    return p0
.end method

.method static synthetic access$200(Le/e/a/ArtworkRetry251;)Landroid/media/session/MediaSession;
    .registers 1

    .line 10
    iget-object p0, p0, Le/e/a/ArtworkRetry251;->session:Landroid/media/session/MediaSession;

    return-object p0
.end method

.method static synthetic access$300(Le/e/a/ArtworkRetry251;)Ljava/lang/ref/WeakReference;
    .registers 1

    .line 10
    iget-object p0, p0, Le/e/a/ArtworkRetry251;->owner:Ljava/lang/ref/WeakReference;

    return-object p0
.end method

.method static synthetic access$400(Le/e/a/ArtworkRetry251;)Ljava/lang/String;
    .registers 1

    .line 10
    iget-object p0, p0, Le/e/a/ArtworkRetry251;->id:Ljava/lang/String;

    return-object p0
.end method

.method static synthetic access$502(Le/e/a/ArtworkRetry251;Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 10
    iput-object p1, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    return-object p1
.end method

.method static synthetic access$600(Le/e/a/ArtworkRetry251;)Ljava/lang/Object;
    .registers 1

    .line 10
    iget-object p0, p0, Le/e/a/ArtworkRetry251;->token:Ljava/lang/Object;

    return-object p0
.end method

.method static synthetic access$700(Le/e/a/ArtworkRetry251;)Landroid/media/MediaMetadata;
    .registers 1

    .line 10
    iget-object p0, p0, Le/e/a/ArtworkRetry251;->metadata:Landroid/media/MediaMetadata;

    return-object p0
.end method

.method private static area(Landroid/graphics/Bitmap;)J
    .registers 5

    .line 21
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    int-to-long v2, p0

    mul-long/2addr v0, v2

    goto :goto_0

    :cond_0
    const-wide/16 v0, 0x0

    :goto_0
    return-wide v0
.end method

.method private current()Z
    .registers 4

    .line 17
    sget-object v0, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    iget-object v2, p0, Le/e/a/ArtworkRetry251;->session:Landroid/media/session/MediaSession;

    invoke-interface {v1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p0, Le/e/a/ArtworkRetry251;->token:Ljava/lang/Object;

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    :goto_0
    monitor-exit v0

    return v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_1
.end method

.method static identity(Ljava/lang/Object;)Ljava/lang/String;
    .registers 4

    .line 16
    const/4 v0, 0x0

    if-eqz p0, :cond_3

    :try_start_0
    invoke-static {p0}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object v1

    if-nez v1, :cond_0

    move-object v1, v0

    goto :goto_0

    :cond_0
    const-string v2, "videoId"

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    return-object v1

    :cond_1
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    instance-of v2, p0, Landroid/content/Context;

    if-eqz v2, :cond_2

    const-string v2, "f"

    goto :goto_1

    :cond_2
    const-string v2, "b0"

    :goto_1
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_3

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception p0

    :cond_3
    :goto_2
    return-object v0
.end method

.method static log(Ljava/lang/String;)V
    .registers 3

    .line 19
    const-string v0, "NicoidArtwork"

    invoke-static {v0, p0}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "artwork "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    return-void
.end method

.method public static retain(Landroid/media/session/MediaSession;Ljava/lang/String;Landroid/graphics/Bitmap;Ljava/lang/Object;)Landroid/graphics/Bitmap;
    .registers 8

    .line 20
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p1, p3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p0}, Landroid/media/session/MediaSession;->getController()Landroid/media/session/MediaController;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    goto :goto_0

    :cond_0
    const-string p1, "android.media.metadata.ART"

    invoke-virtual {p0, p1}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p0

    :goto_0
    invoke-static {p0}, Le/e/a/ArtworkRetry251;->area(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    invoke-static {p2}, Le/e/a/ArtworkRetry251;->area(Landroid/graphics/Bitmap;)J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    cmp-long p1, v0, v2

    if-lez p1, :cond_1

    return-object p0

    :catch_0
    move-exception p0

    :cond_1
    return-object p2
.end method

.method private same()Z
    .registers 3

    .line 18
    iget-object v0, p0, Le/e/a/ArtworkRetry251;->owner:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ArtworkRetry251;->identity(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ArtworkRetry251;->id:Ljava/lang/String;

    if-eqz v1, :cond_0

    iget-object v1, p0, Le/e/a/ArtworkRetry251;->id:Ljava/lang/String;

    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    return v0
.end method

.method public static start(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;Ljava/lang/Object;)V
    .registers 14

    .line 15
    sget-object v0, Le/e/a/CachedMediaArtwork;->WORKER:Ljava/util/concurrent/ExecutorService;

    new-instance v1, Le/e/a/ArtworkRetry251;

    move-object v2, p0

    move-object v3, p1

    move-object v4, p2

    move-object v5, p3

    move-object v6, p4

    move-object v7, p5

    invoke-direct/range {v1 .. v7}, Le/e/a/ArtworkRetry251;-><init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public run()V
    .registers 5

    .line 23
    invoke-direct {p0}, Le/e/a/ArtworkRetry251;->current()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 24
    :cond_0
    nop

    .line 25
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Le/e/a/ArtworkRetry251;->path:Ljava/lang/String;

    if-nez v1, :cond_1

    move-object v1, v0

    goto :goto_0

    :cond_1
    iget-object v1, p0, Le/e/a/ArtworkRetry251;->path:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/CachedMediaArtwork;->read(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    :goto_0
    iget-object v2, p0, Le/e/a/ArtworkRetry251;->metadata:Landroid/media/MediaMetadata;

    iget-object v3, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    invoke-static {v1, v2, v3}, Le/e/a/ArtworkProbe249;->choose(Landroid/graphics/Bitmap;Landroid/media/MediaMetadata;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-nez v0, :cond_2

    iget-object v1, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    invoke-static {v1}, Le/e/a/MediaArtwork248;->fallback(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "worker error="

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 26
    :cond_2
    :goto_1
    invoke-direct {p0}, Le/e/a/ArtworkRetry251;->current()Z

    move-result v1

    if-nez v1, :cond_3

    return-void

    .line 27
    :cond_3
    const-string v1, "attempt="

    if-eqz v0, :cond_4

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget v2, p0, Le/e/a/ArtworkRetry251;->attempt:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " result="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "x"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    sget-object v1, Le/e/a/CachedMediaArtwork;->MAIN:Landroid/os/Handler;

    new-instance v2, Le/e/a/ArtworkRetry251$Publish;

    invoke-direct {v2, p0, v0}, Le/e/a/ArtworkRetry251$Publish;-><init>(Le/e/a/ArtworkRetry251;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    .line 28
    :cond_4
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Le/e/a/ArtworkRetry251;->attempt:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " result=none key="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    const/4 v2, 0x1

    if-eqz v1, :cond_5

    iget-object v1, p0, Le/e/a/ArtworkRetry251;->key:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_5

    move v1, v2

    goto :goto_2

    :cond_5
    const/4 v1, 0x0

    :goto_2
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 29
    iget v0, p0, Le/e/a/ArtworkRetry251;->attempt:I

    const/4 v1, 0x2

    if-ge v0, v1, :cond_7

    iget v0, p0, Le/e/a/ArtworkRetry251;->attempt:I

    if-nez v0, :cond_6

    const-wide/16 v0, 0x5dc

    goto :goto_3

    :cond_6
    const-wide/16 v0, 0xdac

    :goto_3
    iget v3, p0, Le/e/a/ArtworkRetry251;->attempt:I

    add-int/2addr v3, v2

    iput v3, p0, Le/e/a/ArtworkRetry251;->attempt:I

    sget-object v2, Le/e/a/CachedMediaArtwork;->MAIN:Landroid/os/Handler;

    new-instance v3, Le/e/a/ArtworkRetry251$Retry;

    invoke-direct {v3, p0}, Le/e/a/ArtworkRetry251$Retry;-><init>(Le/e/a/ArtworkRetry251;)V

    invoke-virtual {v2, v3, v0, v1}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    goto :goto_4

    :cond_7
    const-string v0, "retry exhausted"

    invoke-static {v0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 30
    :goto_4
    return-void
.end method
