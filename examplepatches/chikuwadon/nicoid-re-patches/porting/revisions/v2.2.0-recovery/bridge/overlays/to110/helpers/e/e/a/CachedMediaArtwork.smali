.class public final Le/e/a/CachedMediaArtwork;
.super Ljava/lang/Object;
.source "CachedMediaArtwork.java"


# static fields
.field private static final ART:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field static final CURRENT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/media/session/MediaSession;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field static final MAIN:Landroid/os/Handler;

.field static final WORKER:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 20
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/CachedMediaArtwork;->MAIN:Landroid/os/Handler;

    .line 21
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/CachedMediaArtwork;->WORKER:Ljava/util/concurrent/ExecutorService;

    .line 22
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    .line 23
    new-instance v0, Le/e/a/CachedMediaArtwork$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x8

    invoke-direct {v0, v3, v1, v2}, Le/e/a/CachedMediaArtwork$1;-><init>(IFZ)V

    sput-object v0, Le/e/a/CachedMediaArtwork;->ART:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 63
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;)V
    .registers 12

    .line 39
    sget-object v0, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    const/4 v1, 0x0

    if-nez p2, :cond_1

    move-object p2, v1

    goto :goto_0

    .line 40
    :cond_1
    invoke-static {p2}, Le/e/a/CachedMediaArtwork;->read(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p2

    :goto_0
    invoke-static {p2, p3, p4}, Le/e/a/ArtworkProbe249;->choose(Landroid/graphics/Bitmap;Landroid/media/MediaMetadata;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p2

    if-eqz p2, :cond_2

    .line 43
    sget-object p4, Le/e/a/CachedMediaArtwork;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/CachedMediaArtwork$2;

    invoke-direct {v0, p0, p1, p3, p2}, Le/e/a/CachedMediaArtwork$2;-><init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V

    invoke-virtual {p4, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_2
    if-eqz p4, :cond_4

    .line 52
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_4

    .line 53
    monitor-enter v0

    :try_start_1
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, p1, :cond_3

    monitor-exit v0

    return-void

    :cond_3
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    :try_start_2
    const-string p1, "e.e.a.FeedbackMedia"

    invoke-static {p1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object p1

    const-string p2, "lambda$apply$1"

    const/4 v0, 0x3

    new-array v2, v0, [Ljava/lang/Class;

    const-class v3, Ljava/lang/String;

    const/4 v4, 0x0

    aput-object v3, v2, v4

    const-class v3, Landroid/media/session/MediaSession;

    const/4 v5, 0x1

    aput-object v3, v2, v5

    const-class v3, Landroid/media/MediaMetadata;

    const/4 v6, 0x2

    aput-object v3, v2, v6

    invoke-virtual {p1, p2, v2}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    .line 57
    invoke-virtual {p1, v5}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    new-array p2, v0, [Ljava/lang/Object;

    aput-object p4, p2, v4

    aput-object p0, p2, v5

    aput-object p3, p2, v6

    invoke-virtual {p1, v1, p2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-void

    .line 53
    :goto_1
    :try_start_3
    monitor-exit v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catch_0
    :cond_4
    return-void

    .line 39
    :goto_2
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    throw p0

    :catchall_1
    move-exception p0

    goto :goto_2
.end method

.method static synthetic lambda$1(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V
    .registers 6

    .line 44
    sget-object v0, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 46
    :try_start_1
    new-instance p1, Landroid/media/MediaMetadata$Builder;

    invoke-direct {p1, p2}, Landroid/media/MediaMetadata$Builder;-><init>(Landroid/media/MediaMetadata;)V

    .line 47
    const-string p2, "android.media.metadata.ART"

    invoke-virtual {p1, p2, p3}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    move-result-object p1

    .line 48
    const-string p2, "android.media.metadata.ALBUM_ART"

    invoke-virtual {p1, p2, p3}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    move-result-object p1

    invoke-virtual {p1}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p1

    .line 49
    invoke-static {p0, p1}, Le/e/a/ArtworkProbe249;->publish(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V

    invoke-static {p0}, Le/e/a/MediaControls;->artworkChanged(Landroid/media/session/MediaSession;)V
    :try_end_1
    .catch Ljava/lang/RuntimeException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    return-void

    .line 44
    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_0
.end method

.method static read(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 8

    .line 65
    sget-object v0, Le/e/a/CachedMediaArtwork;->ART:Ljava/util/Map;

    monitor-enter v0

    :try_start_0
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_0

    monitor-exit v0

    return-object v1

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    const/4 v0, 0x0

    .line 67
    :try_start_1
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x1

    .line 68
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 69
    :try_start_2
    new-instance v3, Le/e/a/CacheInputStream;

    new-instance v4, Le/e/a/CacheFile;

    invoke-direct {v4, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    :try_start_3
    invoke-static {v3, v0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    :try_start_4
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    .line 70
    :try_start_5
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v3, :cond_7

    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v3, :cond_7

    const/4 v3, 0x1

    .line 73
    :goto_0
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    div-int/2addr v4, v3

    const/16 v5, 0x800

    if-gt v4, v5, :cond_6

    const/4 v4, 0x0

    .line 74
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 76
    :try_start_6
    new-instance v3, Le/e/a/CacheInputStream;

    new-instance v4, Le/e/a/CacheFile;

    invoke-direct {v4, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    :try_start_7
    invoke-static {v3, v0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_1

    :try_start_8
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-nez v1, :cond_1

    return-object v0

    .line 78
    :cond_1
    :try_start_9
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/16 v4, 0x500

    if-le v3, v4, :cond_3

    const/high16 v4, 0x44a00000    # 1280.0f

    int-to-float v3, v3

    div-float/2addr v4, v3

    .line 79
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    int-to-float v3, v3

    mul-float v3, v3, v4

    invoke-static {v3}, Ljava/lang/Math;->round(F)I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    int-to-float v5, v5

    mul-float v5, v5, v4

    invoke-static {v5}, Ljava/lang/Math;->round(F)I

    move-result v4

    invoke-static {v2, v4}, Ljava/lang/Math;->max(II)I

    move-result v4

    invoke-static {v1, v3, v4, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v2

    if-eq v2, v1, :cond_2

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_2
    move-object v1, v2

    .line 80
    :cond_3
    sget-object v2, Le/e/a/CachedMediaArtwork;->ART:Ljava/util/Map;

    monitor-enter v2
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    :try_start_a
    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2

    return-object v1

    :goto_1
    monitor-exit v2
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :try_start_b
    throw p0
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :catchall_1
    move-exception p0

    .line 76
    :try_start_c
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    :catchall_2
    move-exception v1

    move-object v6, v1

    move-object v1, p0

    move-object p0, v6

    goto :goto_2

    :catchall_3
    move-exception p0

    move-object v1, v0

    :goto_2
    if-eqz v1, :cond_5

    if-eq v1, p0, :cond_4

    :try_start_d
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    move-object p0, v1

    :cond_5
    throw p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_0

    :cond_6
    shl-int/lit8 v3, v3, 0x1

    goto/16 :goto_0

    :cond_7
    return-object v0

    :catchall_4
    move-exception p0

    .line 69
    :try_start_e
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    :catchall_5
    move-exception v1

    move-object v6, v1

    move-object v1, p0

    move-object p0, v6

    goto :goto_3

    :catchall_6
    move-exception p0

    move-object v1, v0

    :goto_3
    if-eqz v1, :cond_9

    if-eq v1, p0, :cond_8

    :try_start_f
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_8
    move-object p0, v1

    :cond_9
    throw p0
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    :catch_0
    return-object v0

    .line 65
    :goto_4
    :try_start_10
    monitor-exit v0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_7

    throw p0

    :catchall_7
    move-exception p0

    goto :goto_4
.end method

.method public static request(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 11

    move-object v6, p2

    .line 28
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v1, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v1

    :try_start_0
    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    const-string v0, "android.media.metadata.ART"

    invoke-virtual {p1, v0}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    invoke-static {v0, p3}, Le/e/a/ArtworkProbe249;->refresh(Landroid/graphics/Bitmap;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 33
    :cond_0
    :try_start_1
    instance-of v0, p2, Landroid/content/Context;

    if-eqz v0, :cond_1

    move-object v0, p2

    check-cast v0, Landroid/content/Context;

    goto :goto_0

    :cond_1
    const-string v0, "A1"

    invoke-static {p2, v0}, Le/e/a/CachedMediaArtwork;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 34
    :goto_0
    instance-of v1, p2, Landroid/content/Context;

    if-eqz v1, :cond_2

    const-string v1, "f"

    goto :goto_1

    :cond_2
    const-string v1, "b0"

    :goto_1
    invoke-static {p2, v1}, Le/e/a/CachedMediaArtwork;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 35
    const-string v1, "(?:sm|so|nm|ss)[0-9]+"

    invoke-virtual {p2, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-static {v0}, Le/e/a/CacheFolders;->root(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v0, "/nicoid/nicoid_cache/"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, ".thm"

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    :cond_3
    const/4 p2, 0x0

    :goto_2
    move-object v3, p2

    .line 38
    move-object v0, p0

    move-object v1, v2

    move-object v2, v3

    move-object v3, p1

    move-object v4, p3

    move-object v5, v6

    invoke-static/range {v0 .. v5}, Le/e/a/ArtworkRetry251;->start(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;Ljava/lang/Object;)V

    return-void

    .line 29
    :goto_3
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_3
.end method
