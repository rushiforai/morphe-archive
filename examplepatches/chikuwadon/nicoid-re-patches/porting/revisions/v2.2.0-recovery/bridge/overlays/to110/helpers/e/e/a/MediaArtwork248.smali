.class public final Le/e/a/MediaArtwork248;
.super Ljava/lang/Object;
.source "MediaArtwork248.java"


# static fields
.field private static final BYTES:I = 0x800000

.field private static final CAPTURED:Ljava/lang/String; = "nicoid_media_variants50"

.field private static final HIGH:Ljava/lang/String; = "nicoid_media_large_url"

.field private static final LEGACY:Ljava/lang/String; = "nicoid_media_legacy_url"

.field private static final MAX:I = 0x500

.field private static final PLAYER:Ljava/lang/String; = "nicoid_media_player_url"

.field private static final PLAYER_PREFIX:Ljava/lang/String; = "player:"

.field private static final SAMPLE:I = 0x800

.field private static failedAt:J

.field private static failedUrl:Ljava/lang/String;

.field private static final recent:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Landroid/graphics/Bitmap;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/4 v3, 0x4

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 19
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static best(Ljava/lang/String;Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .registers 13

    .line 63
    invoke-static {p0}, Le/e/a/MediaArtwork248;->playerFirst(Ljava/lang/String;)Z

    move-result v0

    .line 64
    invoke-static {p0}, Le/e/a/MediaArtwork248;->preferred(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_8

    const/16 v1, 0x500

    if-nez v0, :cond_0

    if-eqz p1, :cond_0

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v2

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v3

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    if-ge v2, v1, :cond_8

    .line 65
    :cond_0
    const-string v2, "\n"

    const/4 v3, -0x1

    invoke-virtual {p0, v2, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    .line 66
    const/4 v3, 0x0

    :goto_0
    array-length v4, v2

    add-int/lit8 v4, v4, -0x1

    if-ge v3, v4, :cond_7

    const/4 v4, 0x3

    if-ge v3, v4, :cond_7

    .line 67
    if-nez v3, :cond_1

    invoke-static {p0}, Le/e/a/MediaArtwork248;->preferred(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_1

    :cond_1
    aget-object v4, v2, v3

    :goto_1
    invoke-static {v4}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_2

    goto :goto_2

    .line 68
    :cond_2
    invoke-static {v4, v3}, Le/e/a/MediaArtwork248;->loadCandidate(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object v4

    .line 69
    if-eqz v0, :cond_3

    if-nez v3, :cond_3

    invoke-static {v4}, Le/e/a/MediaArtwork248;->sufficientPlayer(Landroid/graphics/Bitmap;)Z

    move-result v5

    if-eqz v5, :cond_3

    const-string p0, "selected source=player"

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    return-object v4

    .line 70
    :cond_3
    if-eqz v4, :cond_5

    if-eqz p1, :cond_4

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v5

    int-to-long v5, v5

    invoke-virtual {v4}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v7

    int-to-long v7, v7

    mul-long/2addr v5, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v9

    int-to-long v9, v9

    mul-long/2addr v7, v9

    cmp-long v5, v5, v7

    if-lez v5, :cond_5

    :cond_4
    move-object p1, v4

    .line 71
    :cond_5
    if-eqz p1, :cond_6

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v4

    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v5

    invoke-static {v4, v5}, Ljava/lang/Math;->max(II)I

    move-result v4

    if-lt v4, v1, :cond_6

    goto :goto_3

    .line 66
    :cond_6
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 73
    :cond_7
    :goto_3
    return-object p1

    .line 64
    :cond_8
    return-object p1
.end method

.method public static capture(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 6

    .line 21
    if-eqz p0, :cond_8

    if-eqz p1, :cond_8

    .line 22
    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 23
    if-nez p0, :cond_0

    return-void

    .line 24
    :cond_0
    const-string v0, "thumbnail"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    .line 25
    if-nez p0, :cond_1

    return-void

    .line 26
    :cond_1
    const-string v0, "ogp"

    const-string v1, ""

    invoke-virtual {p0, v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v2, "player"

    invoke-virtual {p0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "largeUrl"

    invoke-virtual {p0, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 27
    invoke-static {v0}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    move-object v1, v0

    goto :goto_0

    :cond_2
    invoke-static {v2}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    move-object v1, v2

    goto :goto_0

    :cond_3
    invoke-static {p0}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_4

    move-object v1, p0

    goto :goto_0

    :cond_4
    const/4 v1, 0x0

    .line 28
    :goto_0
    const-string v3, "nicoid_media_large_url"

    if-eqz v1, :cond_5

    invoke-virtual {p1, v3, v1}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_1

    :cond_5
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 29
    :goto_1
    invoke-static {v2}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "nicoid_media_player_url"

    if-eqz v1, :cond_6

    invoke-virtual {p1, v3, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_2

    :cond_6
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 30
    :goto_2
    invoke-static {p0}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v1

    const-string v3, "nicoid_media_legacy_url"

    if-eqz v1, :cond_7

    invoke-virtual {p1, v3, p0}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_3

    :cond_7
    invoke-virtual {p1, v3}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    .line 31
    :goto_3
    const-string v1, "nicoid_media_variants50"

    const-string v3, "1"

    invoke-virtual {p1, v1, v3}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "variants ogp="

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v0}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " player="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {v2}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " large="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {p0}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result p0

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 33
    return-void

    .line 21
    :cond_8
    return-void
.end method

.method public static decode(Ljava/io/InputStream;)Landroid/graphics/Bitmap;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    invoke-static {p0}, Le/e/a/MediaArtwork248;->readBounded(Ljava/io/InputStream;)[B

    move-result-object p0

    .line 105
    const/4 v0, 0x0

    if-nez p0, :cond_0

    return-object v0

    .line 106
    :cond_0
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v2, 0x1

    iput-boolean v2, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 107
    array-length v3, p0

    const/4 v4, 0x0

    invoke-static {p0, v4, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 108
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lez v3, :cond_4

    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lez v3, :cond_4

    .line 109
    iget v3, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    invoke-static {v3, v5}, Le/e/a/MediaArtwork248;->sampleSize(II)I

    move-result v3

    iput v3, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 110
    array-length v3, p0

    invoke-static {p0, v4, v3, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0

    .line 111
    if-nez p0, :cond_1

    return-object v0

    .line 112
    :cond_1
    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 113
    const/16 v4, 0x500

    if-gt v3, v4, :cond_2

    return-object p0

    .line 114
    :cond_2
    int-to-float v0, v0

    const/high16 v4, 0x44a00000    # 1280.0f

    int-to-float v3, v3

    div-float/2addr v4, v3

    mul-float/2addr v0, v4

    invoke-static {v0}, Ljava/lang/Math;->round(F)I

    move-result v0

    invoke-static {v2, v0}, Ljava/lang/Math;->max(II)I

    move-result v0

    int-to-float v1, v1

    mul-float/2addr v1, v4

    invoke-static {v1}, Ljava/lang/Math;->round(F)I

    move-result v1

    invoke-static {v2, v1}, Ljava/lang/Math;->max(II)I

    move-result v1

    invoke-static {p0, v0, v1, v2}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;

    move-result-object v0

    .line 115
    if-eq v0, p0, :cond_3

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->recycle()V

    :cond_3
    return-object v0

    .line 108
    :cond_4
    return-object v0
.end method

.method public static fallback(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 5

    .line 97
    invoke-static {p0}, Le/e/a/MediaArtwork248;->original(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 98
    const/4 v0, 0x0

    if-eqz p0, :cond_2

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 100
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_1

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, "https"

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_0

    const-string v2, "http"

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v1, :cond_1

    .line 101
    :cond_0
    const/4 v0, 0x3

    invoke-static {p0, v0}, Le/e/a/MediaArtwork248;->loadCandidate(Ljava/lang/String;I)Landroid/graphics/Bitmap;

    move-result-object p0

    return-object p0

    .line 100
    :catch_0
    move-exception p0

    :cond_1
    return-object v0

    .line 98
    :cond_2
    return-object v0
.end method

.method public static key(Landroid/os/Bundle;)Ljava/lang/String;
    .registers 8

    .line 44
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 45
    :cond_0
    const-string v0, "thumbImage"

    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "nicoid_media_large_url"

    invoke-virtual {p0, v1}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 46
    const-string v2, "nicoid_media_player_url"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 47
    invoke-static {v2}, Le/e/a/MediaArtwork248;->validCdn(Ljava/lang/String;)Z

    move-result v3

    .line 48
    invoke-static {v1}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    if-nez v3, :cond_1

    return-object v0

    .line 49
    :cond_1
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    .line 50
    if-eqz v3, :cond_2

    invoke-virtual {v4, v2}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    .line 51
    :cond_2
    const-string v2, "nicoid_media_legacy_url"

    invoke-virtual {p0, v2}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {v1, p0}, [Ljava/lang/String;

    move-result-object p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/4 v5, 0x2

    if-ge v2, v5, :cond_4

    aget-object v5, p0, v2

    invoke-static {v5}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_3

    invoke-virtual {v5, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_3

    invoke-virtual {v4, v5}, Ljava/util/LinkedHashSet;->add(Ljava/lang/Object;)Z

    :cond_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 52
    :cond_4
    const/16 p0, 0xa

    if-eqz v0, :cond_5

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_5

    invoke-virtual {v0, p0}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_5

    const/16 v2, 0xd

    invoke-virtual {v0, v2}, Ljava/lang/String;->indexOf(I)I

    move-result v2

    if-gez v2, :cond_5

    const/4 v1, 0x1

    .line 54
    :cond_5
    if-nez v3, :cond_6

    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_6

    return-object v0

    .line 55
    :cond_6
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4}, Ljava/util/LinkedHashSet;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_8

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->length()I

    move-result v6

    if-lez v6, :cond_7

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    :cond_7
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 56
    :cond_8
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, ""

    if-eqz v3, :cond_9

    const-string v3, "player:"

    goto :goto_2

    :cond_9
    move-object v3, v4

    :goto_2
    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string v2, "\n"

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    if-nez v1, :cond_a

    move-object v0, v4

    :cond_a
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static loadCandidate(Ljava/lang/String;I)Landroid/graphics/Bitmap;
    .registers 11

    .line 77
    sget-object v0, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    monitor-enter v0

    :try_start_0
    sget-object v1, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/graphics/Bitmap;

    const/4 v2, 0x0

    if-nez v1, :cond_0

    sget-object v3, Le/e/a/MediaArtwork248;->failedUrl:Ljava/lang/String;

    invoke-virtual {p0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_0

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sget-wide v5, Le/e/a/MediaArtwork248;->failedAt:J

    sub-long/2addr v3, v5

    const-wide/16 v5, 0x3e8

    cmp-long v3, v3, v5

    if-gez v3, :cond_0

    monitor-exit v0

    return-object v2

    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 78
    const-string v0, "cache"

    .line 79
    if-nez v1, :cond_8

    .line 80
    nop

    .line 82
    :try_start_1
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Lnicoid/network238/ReadOnlyConnection239;->openImage(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 83
    const/16 v2, 0x1388

    :try_start_2
    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v0, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 84
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "http="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 85
    const/16 v4, 0xc8

    if-ne v2, v4, :cond_2

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v4

    const-wide/32 v6, 0x800000

    cmp-long v2, v4, v6

    if-gtz v2, :cond_2

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    :try_start_3
    invoke-static {v2}, Le/e/a/MediaArtwork248;->decode(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    if-eqz v2, :cond_2

    :try_start_4
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    goto :goto_1

    :catchall_0
    move-exception v3

    if-eqz v2, :cond_1

    :try_start_5
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_0

    :catchall_1
    move-exception v2

    :try_start_6
    invoke-virtual {v3, v2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1
    :goto_0
    throw v3
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 87
    :cond_2
    :goto_1
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 88
    :cond_3
    move-object v0, v3

    goto :goto_3

    .line 86
    :catch_0
    move-exception v2

    goto :goto_2

    .line 87
    :catchall_2
    move-exception p0

    goto :goto_6

    .line 86
    :catch_1
    move-exception v0

    move-object v8, v2

    move-object v2, v0

    move-object v0, v8

    :goto_2
    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "error="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 87
    if-eqz v0, :cond_4

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 88
    :cond_4
    move-object v0, v2

    :goto_3
    sget-object v2, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    monitor-enter v2

    .line 89
    if-eqz v1, :cond_5

    :try_start_8
    sget-object v3, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p0, v1}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_4
    sget-object p0, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->size()I

    move-result p0

    const/4 v3, 0x2

    if-le p0, v3, :cond_6

    sget-object p0, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    sget-object v3, Le/e/a/MediaArtwork248;->recent:Ljava/util/LinkedHashMap;

    invoke-virtual {v3}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {p0, v3}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_4

    .line 90
    :cond_5
    sput-object p0, Le/e/a/MediaArtwork248;->failedUrl:Ljava/lang/String;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    sput-wide v3, Le/e/a/MediaArtwork248;->failedAt:J

    .line 91
    :cond_6
    monitor-exit v2

    goto :goto_7

    :goto_5
    monitor-exit v2
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    throw p0

    :catchall_3
    move-exception p0

    goto :goto_5

    .line 87
    :catchall_4
    move-exception p0

    move-object v2, v0

    :goto_6
    if-eqz v2, :cond_7

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_7
    throw p0

    .line 93
    :cond_8
    :goto_7
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "candidate="

    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " "

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " decoded="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    if-nez v1, :cond_9

    const-string p1, "none"

    goto :goto_8

    :cond_9
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, "x"

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    :goto_8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/ArtworkRetry251;->log(Ljava/lang/String;)V

    .line 94
    return-object v1

    .line 77
    :goto_9
    :try_start_9
    monitor-exit v0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    throw p0

    :catchall_5
    move-exception p0

    goto :goto_9
.end method

.method public static original(Ljava/lang/String;)Ljava/lang/String;
    .registers 2

    .line 58
    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    const/16 v0, 0xa

    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    if-ltz v0, :cond_1

    add-int/lit8 v0, v0, 0x1

    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    :cond_1
    return-object p0
.end method

.method static playerFirst(Ljava/lang/String;)Z
    .registers 3

    .line 59
    if-eqz p0, :cond_0

    const-string v0, "player:"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_0

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result p0

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    if-le p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static preferred(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    .line 60
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-ltz v1, :cond_1

    invoke-static {p0}, Le/e/a/MediaArtwork248;->playerFirst(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "player:"

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_1
    return-object v0
.end method

.method static readBounded(Ljava/io/InputStream;)[B
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 119
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    const/16 v1, 0x2000

    new-array v1, v1, [B

    const/4 v2, 0x0

    move v3, v2

    .line 120
    :cond_0
    :goto_0
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_2

    if-eqz v4, :cond_0

    const/high16 v5, 0x800000

    sub-int/2addr v5, v3

    if-le v4, v5, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    invoke-virtual {v0, v1, v2, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    add-int/2addr v3, v4

    goto :goto_0

    :cond_2
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0
.end method

.method static sampleSize(II)I
    .registers 5

    .line 117
    const/4 v0, 0x1

    :goto_0
    invoke-static {p0, p1}, Ljava/lang/Math;->max(II)I

    move-result v1

    div-int/2addr v1, v0

    const/16 v2, 0x800

    if-le v1, v2, :cond_0

    mul-int/lit8 v0, v0, 0x2

    goto :goto_0

    :cond_0
    return v0
.end method

.method static sufficientPlayer(Landroid/graphics/Bitmap;)Z
    .registers 3

    .line 61
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->isRecycled()Z

    move-result v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result v1

    invoke-static {v0, v1}, Ljava/lang/Math;->max(II)I

    move-result v0

    const/16 v1, 0x3c0

    if-lt v0, v1, :cond_0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getWidth()I

    move-result v0

    invoke-virtual {p0}, Landroid/graphics/Bitmap;->getHeight()I

    move-result p0

    invoke-static {v0, p0}, Ljava/lang/Math;->min(II)I

    move-result p0

    const/16 v0, 0x21c

    if-lt p0, v0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static valid(Ljava/lang/String;)Z
    .registers 4

    .line 35
    const/4 v0, 0x0

    if-eqz p0, :cond_1

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1

    const/16 v1, 0xa

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    const/16 v1, 0xd

    invoke-virtual {p0, v1}, Ljava/lang/String;->indexOf(I)I

    move-result v1

    if-gez v1, :cond_1

    .line 36
    :try_start_0
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const-string p0, "https"

    invoke-virtual {v1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-virtual {v1}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_0

    invoke-virtual {v1}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    :cond_0
    :goto_0
    return v0

    .line 35
    :cond_1
    return v0
.end method

.method static validCdn(Ljava/lang/String;)Z
    .registers 4

    .line 39
    invoke-static {p0}, Le/e/a/MediaArtwork248;->valid(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 40
    :cond_0
    :try_start_0
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v2, "nimg.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1

    const-string v2, ".nimg.jp"

    invoke-virtual {p0, v2}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2

    :cond_1
    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result p0

    const/4 v2, -0x1

    if-eq p0, v2, :cond_3

    invoke-virtual {v0}, Ljava/net/URL;->getPort()I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    const/16 v0, 0x1bb

    if-eq p0, v0, :cond_3

    :cond_2
    goto :goto_0

    :cond_3
    const/4 v1, 0x1

    goto :goto_0

    :catch_0
    move-exception p0

    :goto_0
    return v1
.end method
