.class public final Le/e/a/FeedbackMedia;
.super Ljava/lang/Object;
.source "FeedbackMedia.java"


# static fields
.field static final art:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field

.field static final current:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Landroid/media/session/MediaSession;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final loading:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field static final main:Landroid/os/Handler;

.field static final worker:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 5
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/FeedbackMedia;->current:Ljava/util/Map;

    .line 6
    new-instance v0, Le/e/a/FeedbackMedia$1;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/4 v3, 0x4

    invoke-direct {v0, v3, v1, v2}, Le/e/a/FeedbackMedia$1;-><init>(IFZ)V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    sput-object v0, Le/e/a/FeedbackMedia;->art:Ljava/util/Map;

    .line 7
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    invoke-static {v0}, Ljava/util/Collections;->synchronizedSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    sput-object v0, Le/e/a/FeedbackMedia;->loading:Ljava/util/Set;

    .line 8
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadExecutor()Ljava/util/concurrent/ExecutorService;

    move-result-object v0

    sput-object v0, Le/e/a/FeedbackMedia;->worker:Ljava/util/concurrent/ExecutorService;

    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    sput-object v0, Le/e/a/FeedbackMedia;->main:Landroid/os/Handler;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static apply(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Ljava/lang/Object;)V
    .registers 8

    move-object v4, p2

    .line 11
    invoke-static {p2}, Le/e/a/FeedbackMedia;->bundle(Ljava/lang/Object;)Landroid/os/Bundle;

    move-result-object p2

    invoke-static {p2}, Le/e/a/FeedbackFixes;->bundleTitle(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Landroid/media/MediaMetadata$Builder;

    invoke-direct {v1, p1}, Landroid/media/MediaMetadata$Builder;-><init>(Landroid/media/MediaMetadata;)V

    if-eqz v0, :cond_1a

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_1a

    const-string p1, "android.media.metadata.TITLE"

    invoke-virtual {v1, p1, v0}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 12
    :cond_1a
    const/4 p1, 0x0

    if-nez p2, :cond_1f

    move-object v0, p1

    goto :goto_25

    :cond_1f
    const-string v0, "thumbImage"

    invoke-virtual {p2, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_25
    if-nez p2, :cond_29

    move-object v2, p1

    goto :goto_2f

    :cond_29
    const-string v2, "author"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_2f
    if-nez v2, :cond_39

    if-eqz p2, :cond_39

    const-string v2, "uploaderName"

    invoke-virtual {p2, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :cond_39
    if-eqz v2, :cond_46

    const-string p2, "android.media.metadata.ARTIST"

    invoke-virtual {v1, p2, v2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    move-result-object p2

    const-string v3, "android.media.metadata.DISPLAY_SUBTITLE"

    invoke-virtual {p2, v3, v2}, Landroid/media/MediaMetadata$Builder;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/media/MediaMetadata$Builder;

    .line 13
    :cond_46
    sget-object p2, Le/e/a/FeedbackMedia;->current:Ljava/util/Map;

    invoke-interface {p2, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    if-nez v0, :cond_4e

    goto :goto_56

    :cond_4e
    sget-object p1, Le/e/a/FeedbackMedia;->art:Ljava/util/Map;

    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/graphics/Bitmap;

    :goto_56
    if-eqz p1, :cond_63

    const-string p2, "android.media.metadata.ART"

    invoke-virtual {v1, p2, p1}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    move-result-object p2

    const-string v2, "android.media.metadata.ALBUM_ART"

    invoke-virtual {p2, v2, p1}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    .line 14
    :cond_63
    invoke-virtual {v1}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p2

    invoke-virtual {p0, p2}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    invoke-static {p0, p2, v4, v0}, Le/e/a/CachedMediaArtwork;->request(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Ljava/lang/Object;Ljava/lang/String;)V

    return-void
.end method

.method static bundle(Ljava/lang/Object;)Landroid/os/Bundle;
    .registers 3

    .line 9
    :try_start_0
    const-string v0, "h1"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    const-string v1, "m"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    instance-of v1, v1, Landroid/os/Bundle;

    if-eqz v1, :cond_17

    const-string v1, "m"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    goto :goto_1d

    :cond_17
    const-string v1, "l"

    invoke-static {v0, v1}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    :goto_1d
    instance-of v1, v0, Landroid/os/Bundle;

    if-eqz v1, :cond_25

    check-cast v0, Landroid/os/Bundle;
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_23} :catch_24

    return-object v0

    :catch_24
    move-exception v0

    :cond_25
    :try_start_25
    const-string v0, "s0"

    invoke-static {p0, v0}, Le/e/a/FeedbackFixes;->get(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    instance-of v0, p0, Landroid/os/Bundle;

    if-eqz v0, :cond_33

    check-cast p0, Landroid/os/Bundle;
    :try_end_31
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_31} :catch_32

    return-object p0

    :catch_32
    move-exception p0

    :cond_33
    const/4 p0, 0x0

    return-object p0
.end method

.method static synthetic lambda$apply$0(Ljava/lang/String;Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V
    .registers 5

    .line 16
    sget-object v0, Le/e/a/FeedbackMedia;->current:Ljava/util/Map;

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_26

    :try_start_c
    new-instance p0, Landroid/media/MediaMetadata$Builder;

    invoke-direct {p0, p2}, Landroid/media/MediaMetadata$Builder;-><init>(Landroid/media/MediaMetadata;)V

    const-string p2, "android.media.metadata.ART"

    invoke-virtual {p0, p2, p3}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    move-result-object p0

    const-string p2, "android.media.metadata.ALBUM_ART"

    invoke-virtual {p0, p2, p3}, Landroid/media/MediaMetadata$Builder;->putBitmap(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/media/MediaMetadata$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/MediaMetadata$Builder;->build()Landroid/media/MediaMetadata;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V
    :try_end_24
    .catch Ljava/lang/RuntimeException; {:try_start_c .. :try_end_24} :catch_25

    goto :goto_26

    :catch_25
    move-exception p0

    :cond_26
    :goto_26
    return-void
.end method

.method static synthetic lambda$apply$1(Ljava/lang/String;Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V
    .registers 8

    .line 16
    const/4 v0, 0x0

    :try_start_1
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/16 v2, 0x1388

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_14} :catch_83
    .catchall {:try_start_1 .. :try_end_14} :catchall_7c

    :try_start_14
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_18
    .catchall {:try_start_14 .. :try_end_18} :catchall_77

    :try_start_18
    invoke-static {v2}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v0
    :try_end_1c
    .catchall {:try_start_18 .. :try_end_1c} :catchall_6b

    if-eqz v2, :cond_21

    :try_start_1e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_21
    .catchall {:try_start_1e .. :try_end_21} :catchall_77

    :cond_21
    :try_start_21
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    if-eqz v0, :cond_84

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    const/16 v2, 0x280

    if-gt v1, v2, :cond_34

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    if-le v1, v2, :cond_65

    :cond_34
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v2

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    int-to-float v1, v1

    const/high16 v2, 0x44200000    # 640.0f

    div-float/2addr v2, v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    int-to-float v1, v1

    mul-float/2addr v1, v2

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    const/4 v3, 0x1

    invoke-static {v3, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v4

    int-to-float v4, v4

    mul-float/2addr v4, v2

    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    move-result v2

    invoke-static {v3, v2}, Ljava/lang/Math;->max(II)I

    move-result v2

    invoke-static {v0, v1, v2, v3}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    :cond_65
    sget-object v1, Le/e/a/FeedbackMedia;->art:Ljava/util/Map;

    invoke-interface {v1, p0, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6a
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_6a} :catch_83
    .catchall {:try_start_21 .. :try_end_6a} :catchall_7c

    goto :goto_84

    :catchall_6b
    move-exception v3

    if-eqz v2, :cond_76

    :try_start_6e
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_72

    goto :goto_76

    :catchall_72
    move-exception v2

    :try_start_73
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_76
    :goto_76
    throw v3
    :try_end_77
    .catchall {:try_start_73 .. :try_end_77} :catchall_77

    :catchall_77
    move-exception v2

    :try_start_78
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v2
    :try_end_7c
    .catch Ljava/lang/Exception; {:try_start_78 .. :try_end_7c} :catch_83
    .catchall {:try_start_78 .. :try_end_7c} :catchall_7c

    :catchall_7c
    move-exception p1

    sget-object p2, Le/e/a/FeedbackMedia;->loading:Ljava/util/Set;

    invoke-interface {p2, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    throw p1

    :catch_83
    move-exception v1

    :cond_84
    :goto_84
    sget-object v1, Le/e/a/FeedbackMedia;->loading:Ljava/util/Set;

    invoke-interface {v1, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    if-eqz v0, :cond_95

    sget-object v1, Le/e/a/FeedbackMedia;->main:Landroid/os/Handler;

    new-instance v2, Le/e/a/FeedbackMedia$$ExternalSyntheticLambda1;

    invoke-direct {v2, p0, p1, p2, v0}, Le/e/a/FeedbackMedia$$ExternalSyntheticLambda1;-><init>(Ljava/lang/String;Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;Landroid/graphics/Bitmap;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_95
    return-void
.end method
