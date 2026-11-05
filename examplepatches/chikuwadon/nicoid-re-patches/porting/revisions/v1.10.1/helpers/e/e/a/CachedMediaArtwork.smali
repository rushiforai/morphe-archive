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

.field private static final CURRENT:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/media/session/MediaSession;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field private static final MAIN:Landroid/os/Handler;

.field private static final WORKER:Ljava/util/concurrent/ExecutorService;


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

    :try_start_3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_b

    monitor-exit v0

    return-void

    :cond_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_68

    const/4 v1, 0x0

    if-nez p2, :cond_11

    move-object p2, v1

    goto :goto_15

    .line 40
    :cond_11
    invoke-static {p2}, Le/e/a/CachedMediaArtwork;->read(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p2

    :goto_15
    if-eqz p2, :cond_22

    .line 43
    sget-object p4, Le/e/a/CachedMediaArtwork;->MAIN:Landroid/os/Handler;

    new-instance v0, Le/e/a/CachedMediaArtwork$2;

    invoke-direct {v0, p0, p1, p3, p2}, Le/e/a/CachedMediaArtwork$2;-><init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V

    invoke-virtual {p4, v0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_22
    if-eqz p4, :cond_65

    .line 52
    invoke-virtual {p4}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_65

    .line 53
    monitor-enter v0

    :try_start_2b
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    if-eq p2, p1, :cond_33

    monitor-exit v0

    return-void

    :cond_33
    monitor-exit v0
    :try_end_34
    .catchall {:try_start_2b .. :try_end_34} :catchall_63

    .line 56
    :try_start_34
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
    :try_end_60
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_60} :catch_65

    return-void

    .line 53
    :goto_61
    :try_start_61
    monitor-exit v0
    :try_end_62
    .catchall {:try_start_61 .. :try_end_62} :catchall_63

    throw p0

    :catchall_63
    move-exception p0

    goto :goto_61

    :catch_65
    :cond_65
    return-void

    .line 39
    :goto_66
    :try_start_66
    monitor-exit v0
    :try_end_67
    .catchall {:try_start_66 .. :try_end_67} :catchall_68

    throw p0

    :catchall_68
    move-exception p0

    goto :goto_66
.end method

.method static synthetic lambda$1(Landroid/media/session/MediaSession;Ljava/lang/Object;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V
    .registers 6

    .line 44
    sget-object v0, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    if-eq v1, p1, :cond_b

    monitor-exit v0

    return-void

    :cond_b
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_3 .. :try_end_c} :catchall_27

    .line 46
    :try_start_c
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
    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_24} :catch_24

    :catch_24
    return-void

    .line 44
    :goto_25
    :try_start_25
    monitor-exit v0
    :try_end_26
    .catchall {:try_start_25 .. :try_end_26} :catchall_27

    throw p0

    :catchall_27
    move-exception p0

    goto :goto_25
.end method

.method static read(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 8

    .line 65
    sget-object v0, Le/e/a/CachedMediaArtwork;->ART:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    if-eqz v1, :cond_13

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v2

    if-nez v2, :cond_13

    monitor-exit v0

    return-object v1

    :cond_13
    monitor-exit v0
    :try_end_14
    .catchall {:try_start_3 .. :try_end_14} :catchall_d6

    const/4 v0, 0x0

    .line 67
    :try_start_15
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x1

    .line 68
    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z
    :try_end_1d
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_1d} :catch_d3

    .line 69
    :try_start_1d
    new-instance v3, Le/e/a/CacheInputStream;

    new-instance v4, Le/e/a/CacheFile;

    invoke-direct {v4, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_27
    .catchall {:try_start_1d .. :try_end_27} :catchall_c8

    :try_start_27
    invoke-static {v3, v0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;
    :try_end_2a
    .catchall {:try_start_27 .. :try_end_2a} :catchall_be

    :try_start_2a
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_2d
    .catchall {:try_start_2a .. :try_end_2d} :catchall_c8

    .line 70
    :try_start_2d
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v3, :cond_bd

    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v3, :cond_bd

    const/4 v3, 0x1

    .line 73
    :goto_36
    iget v4, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    div-int/2addr v4, v3

    const/16 v5, 0x500

    if-gt v4, v5, :cond_b9

    const/4 v4, 0x0

    .line 74
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_48
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_48} :catch_d3

    .line 76
    :try_start_48
    new-instance v3, Le/e/a/CacheInputStream;

    new-instance v4, Le/e/a/CacheFile;

    invoke-direct {v4, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v3, v4}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_52
    .catchall {:try_start_48 .. :try_end_52} :catchall_ae

    :try_start_52
    invoke-static {v3, v0, v1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_56
    .catchall {:try_start_52 .. :try_end_56} :catchall_a4

    :try_start_56
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V
    :try_end_59
    .catchall {:try_start_56 .. :try_end_59} :catchall_ae

    if-nez v1, :cond_5c

    return-object v0

    .line 78
    :cond_5c
    :try_start_5c
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    invoke-static {v3, v4}, Ljava/lang/Math;->max(II)I

    move-result v3

    const/16 v4, 0x280

    if-le v3, v4, :cond_98

    const/high16 v4, 0x44200000    # 640.0f

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

    if-eq v2, v1, :cond_97

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->recycle()V

    :cond_97
    move-object v1, v2

    .line 80
    :cond_98
    sget-object v2, Le/e/a/CachedMediaArtwork;->ART:Ljava/util/Map;

    monitor-enter v2
    :try_end_9b
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_9b} :catch_d3

    :try_start_9b
    invoke-interface {v2, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v2

    return-object v1

    :goto_a0
    monitor-exit v2
    :try_end_a1
    .catchall {:try_start_9b .. :try_end_a1} :catchall_a2

    :try_start_a1
    throw p0
    :try_end_a2
    .catch Ljava/lang/Exception; {:try_start_a1 .. :try_end_a2} :catch_d3

    :catchall_a2
    move-exception p0

    goto :goto_a0

    :catchall_a4
    move-exception p0

    .line 76
    :try_start_a5
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_a9
    .catchall {:try_start_a5 .. :try_end_a9} :catchall_a9

    :catchall_a9
    move-exception v1

    move-object v6, v1

    move-object v1, p0

    move-object p0, v6

    goto :goto_b0

    :catchall_ae
    move-exception p0

    move-object v1, v0

    :goto_b0
    if-eqz v1, :cond_b8

    if-eq v1, p0, :cond_b7

    :try_start_b4
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_b7
    move-object p0, v1

    :cond_b8
    throw p0
    :try_end_b9
    .catch Ljava/lang/Exception; {:try_start_b4 .. :try_end_b9} :catch_d3

    :cond_b9
    shl-int/lit8 v3, v3, 0x1

    goto/16 :goto_36

    :cond_bd
    return-object v0

    :catchall_be
    move-exception p0

    .line 69
    :try_start_bf
    invoke-virtual {v3}, Ljava/io/InputStream;->close()V

    throw p0
    :try_end_c3
    .catchall {:try_start_bf .. :try_end_c3} :catchall_c3

    :catchall_c3
    move-exception v1

    move-object v6, v1

    move-object v1, p0

    move-object p0, v6

    goto :goto_ca

    :catchall_c8
    move-exception p0

    move-object v1, v0

    :goto_ca
    if-eqz v1, :cond_d2

    if-eq v1, p0, :cond_d1

    :try_start_ce
    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_d1
    move-object p0, v1

    :cond_d2
    throw p0
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_d3} :catch_d3

    :catch_d3
    return-object v0

    .line 65
    :goto_d4
    :try_start_d4
    monitor-exit v0
    :try_end_d5
    .catchall {:try_start_d4 .. :try_end_d5} :catchall_d6

    throw p0

    :catchall_d6
    move-exception p0

    goto :goto_d4
.end method

.method public static request(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Ljava/lang/Object;Ljava/lang/String;)V
    .registers 10

    .line 28
    new-instance v2, Ljava/lang/Object;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    .line 29
    sget-object v1, Le/e/a/CachedMediaArtwork;->CURRENT:Ljava/util/Map;

    monitor-enter v1

    :try_start_8
    invoke-interface {v1, p0, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_c
    .catchall {:try_start_8 .. :try_end_c} :catchall_6f

    .line 30
    const-string v0, "android.media.metadata.ART"

    invoke-virtual {p1, v0}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    if-eqz v0, :cond_15

    return-void

    .line 33
    :cond_15
    :try_start_15
    instance-of v0, p2, Landroid/content/Context;

    if-eqz v0, :cond_1d

    move-object v0, p2

    check-cast v0, Landroid/content/Context;

    goto :goto_25

    :cond_1d
    const-string v0, "A1"

    invoke-static {p2, v0}, Le/e/a/CachedMediaArtwork;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/Context;

    .line 34
    :goto_25
    instance-of v1, p2, Landroid/content/Context;

    if-eqz v1, :cond_2c

    const-string v1, "f"

    goto :goto_2e

    :cond_2c
    const-string v1, "b0"

    :goto_2e
    invoke-static {p2, v1}, Le/e/a/CachedMediaArtwork;->field(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p2

    invoke-static {p2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 35
    const-string v1, "(?:sm|so|nm|ss)[0-9]+"

    invoke-virtual {p2, v1}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5d

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
    :try_end_5c
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_5c} :catch_5d

    goto :goto_5e

    :catch_5d
    :cond_5d
    const/4 p2, 0x0

    :goto_5e
    move-object v3, p2

    .line 38
    sget-object p2, Le/e/a/CachedMediaArtwork;->WORKER:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Le/e/a/CachedMediaArtwork$0;

    move-object v1, p0

    move-object v4, p1

    move-object v5, p3

    invoke-direct/range {v0 .. v5}, Le/e/a/CachedMediaArtwork$0;-><init>(Landroid/media/session/MediaSession;Ljava/lang/Object;Ljava/lang/String;Landroid/media/MediaMetadata;Ljava/lang/String;)V

    invoke-interface {p2, v0}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V

    return-void

    .line 29
    :goto_6d
    :try_start_6d
    monitor-exit v1
    :try_end_6e
    .catchall {:try_start_6d .. :try_end_6e} :catchall_6f

    throw p0

    :catchall_6f
    move-exception v0

    move-object p0, v0

    goto :goto_6d
.end method
