.class public final Le/e/a/ArtworkProbe249;
.super Ljava/lang/Object;
.source "ArtworkProbe249.java"


# static fields
.field private static final ART:Ljava/lang/String; = "android.media.metadata.ART"

.field private static final HIGH:Ljava/lang/String; = "nicoid_media_large_url"

.field private static final TAG:Ljava/lang/String; = "NicoidArtwork"

.field private static lastKey:Ljava/lang/String;

.field private static lastSelection:Ljava/lang/String;

.field private static final logged:Ljava/util/WeakHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/WeakHashMap<",
            "Landroid/media/session/MediaSession;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 15
    new-instance v0, Ljava/util/WeakHashMap;

    invoke-direct {v0}, Ljava/util/WeakHashMap;-><init>()V

    sput-object v0, Le/e/a/ArtworkProbe249;->logged:Ljava/util/WeakHashMap;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static area(Landroid/graphics/Bitmap;)J
    .registers 5

    .line 50
    if-nez p0, :cond_0

    const-wide/16 v0, 0x0

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    int-to-long v2, p0

    mul-long/2addr v0, v2

    :goto_0
    return-wide v0
.end method

.method public static choose(Landroid/graphics/Bitmap;Landroid/media/MediaMetadata;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 7

    .line 40
    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    :cond_0
    const-string v0, "android.media.metadata.ART"

    invoke-virtual {p1, v0}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 41
    :goto_0
    invoke-static {p1}, Le/e/a/ArtworkProbe249;->area(Landroid/graphics/Bitmap;)J

    move-result-wide v0

    invoke-static {p0}, Le/e/a/ArtworkProbe249;->area(Landroid/graphics/Bitmap;)J

    move-result-wide v2

    cmp-long v0, v0, v2

    if-lez v0, :cond_1

    move-object p0, p1

    .line 42
    :cond_1
    invoke-static {p2, p0}, Le/e/a/MediaArtwork248;->best(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "select highCandidate="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {p2}, Le/e/a/MediaArtwork248;->preferred(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-eqz p2, :cond_2

    const/4 p2, 0x1

    goto :goto_1

    :cond_2
    const/4 p2, 0x0

    :goto_1
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " existing="

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-static {p1}, Le/e/a/ArtworkProbe249;->size(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " local="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p0}, Le/e/a/ArtworkProbe249;->size(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " selected="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {v0}, Le/e/a/ArtworkProbe249;->size(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 44
    const-class p1, Le/e/a/ArtworkProbe249;

    monitor-enter p1

    :try_start_0
    sget-object p2, Le/e/a/ArtworkProbe249;->lastSelection:Ljava/lang/String;

    invoke-virtual {p0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_3

    sput-object p0, Le/e/a/ArtworkProbe249;->lastSelection:Ljava/lang/String;

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    :cond_3
    monitor-exit p1

    .line 45
    return-object v0

    .line 44
    :goto_2
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_2
.end method

.method public static key(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 7

    .line 18
    const-string v0, "bundle"

    .line 19
    if-eqz p0, :cond_3

    const-string v1, "nicoid_media_large_url"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const-string v1, "1"

    const-string v2, "nicoid_media_variants50"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_3

    .line 21
    :cond_0
    :try_start_0
    const-string v1, "videoId"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 22
    const-string v2, "e.e.a.ModernPlayback"

    invoke-static {v2}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v2

    const-string v3, "latestWatch"

    invoke-virtual {v2, v3}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    .line 23
    if-eqz v1, :cond_2

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_2

    instance-of v3, v2, Lorg/json/JSONObject;

    if-eqz v3, :cond_2

    .line 24
    check-cast v2, Lorg/json/JSONObject;

    const-string v3, "video"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "client"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    .line 25
    if-eqz v3, :cond_2

    const-string v5, "id"

    invoke-virtual {v3, v5}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1

    if-eqz v4, :cond_2

    const-string v3, "watchId"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 26
    :cond_1
    invoke-static {v2, p0}, Le/e/a/MediaArtwork248;->capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    const-string v0, "matchedWatch"
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 29
    :catch_0
    move-exception v1

    :cond_2
    :goto_0
    nop

    .line 31
    :cond_3
    invoke-static {p0}, Le/e/a/MediaArtwork248;->key(Landroid/os/Bundle;)Ljava/lang/String;

    move-result-object v1

    .line 32
    const-class v2, Le/e/a/ArtworkProbe249;

    monitor-enter v2

    .line 33
    if-nez v1, :cond_4

    :try_start_1
    sget-object v3, Le/e/a/ArtworkProbe249;->lastKey:Ljava/lang/String;

    if-eqz v3, :cond_7

    goto :goto_1

    :cond_4
    sget-object v3, Le/e/a/ArtworkProbe249;->lastKey:Ljava/lang/String;

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_7

    .line 34
    :goto_1
    sput-object v1, Le/e/a/ArtworkProbe249;->lastKey:Ljava/lang/String;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "key source="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " high="

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz p0, :cond_5

    const-string v5, "nicoid_media_large_url"

    invoke-virtual {p0, v5}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5

    move p0, v3

    goto :goto_2

    :cond_5
    move p0, v4

    :goto_2
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v0, " composite="

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {v1}, Le/e/a/MediaArtwork248;->preferred(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_6

    move v3, v4

    :cond_6
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 36
    :cond_7
    monitor-exit v2

    .line 37
    return-object v1

    .line 36
    :goto_3
    monitor-exit v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0

    :catchall_0
    move-exception p0

    goto :goto_3
.end method

.method public static publish(Landroid/media/session/MediaSession;Landroid/media/MediaMetadata;)V
    .registers 5

    .line 53
    invoke-virtual {p0, p1}, Landroid/media/session/MediaSession;->setMetadata(Landroid/media/MediaMetadata;)V

    .line 55
    const/4 v0, 0x0

    if-nez p1, :cond_0

    move-object p1, v0

    goto :goto_0

    :cond_0
    :try_start_0
    const-string v1, "android.media.metadata.ART"

    invoke-virtual {p1, v1}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object p1

    .line 56
    :goto_0
    if-nez p1, :cond_1

    return-void

    .line 57
    :cond_1
    invoke-static {p1}, Le/e/a/ArtworkProbe249;->size(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p1

    .line 58
    sget-object v1, Le/e/a/ArtworkProbe249;->logged:Ljava/util/WeakHashMap;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    sget-object v2, Le/e/a/ArtworkProbe249;->logged:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0}, Ljava/util/WeakHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    monitor-exit v1

    return-void

    :cond_2
    sget-object v2, Le/e/a/ArtworkProbe249;->logged:Ljava/util/WeakHashMap;

    invoke-virtual {v2, p0, p1}, Ljava/util/WeakHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    :try_start_2
    invoke-virtual {p0}, Landroid/media/session/MediaSession;->getController()Landroid/media/session/MediaController;

    move-result-object p0

    invoke-virtual {p0}, Landroid/media/session/MediaController;->getMetadata()Landroid/media/MediaMetadata;

    move-result-object p0

    .line 60
    if-eqz p0, :cond_3

    const-string v0, "android.media.metadata.ART"

    invoke-virtual {p0, v0}, Landroid/media/MediaMetadata;->getBitmap(Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 61
    :cond_3
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "publish bitmap="

    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " controller="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {v0}, Le/e/a/ArtworkProbe249;->size(Landroid/graphics/Bitmap;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V
    :try_end_2
    .catch Ljava/lang/RuntimeException; {:try_start_2 .. :try_end_2} :catch_0

    .line 62
    goto :goto_2

    .line 58
    :goto_1
    :try_start_3
    monitor-exit v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :try_start_4
    throw p0
    :try_end_4
    .catch Ljava/lang/RuntimeException; {:try_start_4 .. :try_end_4} :catch_0

    :catchall_0
    move-exception p0

    goto :goto_1

    .line 62
    :catch_0
    move-exception p0

    const-string p0, "publish controller readback unavailable"

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 63
    :goto_2
    return-void
.end method

.method public static refresh(Landroid/graphics/Bitmap;Ljava/lang/String;)Z
    .registers 2

    .line 48
    if-eqz p0, :cond_1

    invoke-static {p1}, Le/e/a/MediaArtwork248;->preferred(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result p1

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    const/16 p1, 0x500

    if-lt p0, p1, :cond_1

    :cond_0
    const/4 p0, 0x0

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    :goto_0
    return p0
.end method

.method private static size(Landroid/graphics/Bitmap;)Ljava/lang/String;
    .registers 3

    .line 51
    if-nez p0, :cond_0

    const-string p0, "none"

    goto :goto_0

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "x"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    :goto_0
    return-object p0
.end method
