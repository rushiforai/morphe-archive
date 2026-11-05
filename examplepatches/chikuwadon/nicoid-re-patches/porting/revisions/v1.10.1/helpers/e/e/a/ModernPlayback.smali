.class public final Le/e/a/ModernPlayback;
.super Ljava/lang/Object;
.source "ModernPlayback.java"


# static fields
.field public static volatile domandCookie:Ljava/lang/String;

.field public static latestWatch:Lorg/json/JSONObject;


# direct methods
.method private static available(Lorg/json/JSONArray;Z)Ljava/lang/String;
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v4, 0x0

    :goto_3
    invoke-virtual {p0}, Lorg/json/JSONArray;->length()I

    move-result v2

    if-ge v1, v2, :cond_2a

    invoke-virtual {p0, v1}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "isAvailable"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_27

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz p1, :cond_24

    if-eqz v4, :cond_21

    move-object v0, v2

    goto :goto_2a

    :cond_21
    const/4 v4, 0x1

    move-object v0, v2

    goto :goto_27

    :cond_24
    move-object v0, v2

    if-eqz p1, :cond_2a

    :cond_27
    :goto_27
    add-int/lit8 v1, v1, 0x1

    goto :goto_3

    :cond_2a
    :goto_2a
    return-object v0
.end method

.method private static captureCookie(Ljava/net/HttpURLConnection;)V
    .registers 7

    const/4 v0, 0x1

    :cond_1
    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->getHeaderFieldKey(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_33

    const-string v2, "Set-Cookie"

    invoke-virtual {v2, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->getHeaderField(I)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_2d

    const-string v2, "domand_bid="

    invoke-virtual {v1, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2d

    const-string v2, ";"

    invoke-virtual {v1, v2}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v2

    if-lez v2, :cond_2a

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    :cond_2a
    sput-object v1, Le/e/a/ModernPlayback;->domandCookie:Ljava/lang/String;

    return-void

    :cond_2d
    add-int/lit8 v0, v0, 0x1

    const/16 v1, 0x80

    if-lt v0, v1, :cond_1

    :cond_33
    return-void
.end method

.method private static fillDescription(Lorg/json/JSONObject;Landroid/os/Bundle;)V
    .registers 5

    const-string v0, "video"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_13

    const-string v1, "description"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v1, "description_original"

    invoke-virtual {p1, v1, v2}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_13
    return-void
.end method

.method public static info(Le/e/a/d0;Ljava/lang/String;)Landroid/os/Bundle;
    .registers 7

    :try_start_0
    invoke-static {p0, p1}, Le/e/a/ModernPlayback;->watch(Le/e/a/d0;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_2a

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {p0, v1}, Le/e/a/d0;->b(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v1

    invoke-static {v0, v1}, Le/e/a/ModernPlayback;->fillDescription(Lorg/json/JSONObject;Landroid/os/Bundle;)V

    iput-object v0, p0, Le/e/a/d0;->modernWatch:Lorg/json/JSONObject;

    iget-object v4, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v4}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v4

    if-nez v4, :cond_1d

    sput-object v0, Le/e/a/ModernPlayback;->latestWatch:Lorg/json/JSONObject;

    :cond_1d
    const-string v2, "nicovideo_version"

    const/4 v3, 0x2

    invoke-virtual {v1, v2, v3}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p0, v1}, Le/e/a/CachedPlayback;->initializeMetadata(Ljava/lang/Object;Landroid/os/Bundle;)V

    invoke-static {p0}, Le/e/a/ModernComments;->load(Le/e/a/d0;)V

    return-object v1

    :cond_2a
    const/4 v0, 0x0

    return-object v0
    :try_end_2c
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_2c} :catch_2c

    :catch_2c
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "metadata parsing failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    const/4 v0, 0x0

    return-object v0
.end method

.method private static notice(Le/e/a/d0;Ljava/lang/String;)V
    .registers 5

    iget-object v0, p0, Le/e/a/d0;->K:Landroid/content/Context;

    if-eqz v0, :cond_15

    new-instance v1, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v2

    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    new-instance v2, Le/e/a/ModernPlayback$Notice;

    invoke-direct {v2, v0, p1}, Le/e/a/ModernPlayback$Notice;-><init>(Landroid/content/Context;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    :cond_15
    return-void
.end method

.method public static pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;
    .registers 2

    invoke-static {p0, p1}, Le/e/a/Playback214;->pickVideo(Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static request(Le/e/a/d0;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    invoke-static {p0, p1, p2, p3}, Le/e/a/PlaybackRequest217;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static stream(Le/e/a/d0;Ljava/lang/String;)Ljava/lang/String;
    .registers 16

    invoke-static {p0, p1}, Le/e/a/Playback214;->begin(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->stream(Ljava/lang/Object;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_a

    return-object v0

    :cond_a
    const/4 v0, 0x0

    iget-object v12, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-nez v12, :cond_15

    sput-object v0, Le/e/a/ModernControls;->selectedVideo:Ljava/lang/String;

    :cond_15
    :try_start_15
    const-string v0, "HLS session start"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-static {p0, p1}, Le/e/a/ModernPlayback;->watch(Le/e/a/d0;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_126

    iput-object v0, p0, Le/e/a/d0;->modernWatch:Lorg/json/JSONObject;

    iget-object v12, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-nez v12, :cond_2c

    sput-object v0, Le/e/a/ModernPlayback;->latestWatch:Lorg/json/JSONObject;

    :cond_2c
    const-string v1, "media"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "domand"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iget v2, p0, Le/e/a/d0;->e:I

    const/4 v3, 0x4

    if-ne v2, v3, :cond_3f

    const/4 v2, 0x2

    goto :goto_45

    :cond_3f
    const/4 v3, 0x3

    if-ne v2, v3, :cond_44

    const/4 v2, 0x1

    goto :goto_45

    :cond_44
    const/4 v2, 0x0

    :goto_45
    const-string v3, "videos"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    invoke-static {p0, v3, v2}, Le/e/a/CastControls218;->pickVideo(Ljava/lang/Object;Lorg/json/JSONArray;I)Ljava/lang/String;

    move-result-object v3

    iget-object v12, p0, Le/e/a/d0;->r:Ljava/lang/Boolean;

    invoke-virtual {v12}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v12

    if-nez v12, :cond_59

    sput-object v3, Le/e/a/ModernControls;->selectedVideo:Ljava/lang/String;

    :cond_59
    const-string v4, "audios"

    invoke-virtual {v1, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-static {v4, v2}, Le/e/a/ModernPlayback;->available(Lorg/json/JSONArray;Z)Ljava/lang/String;

    move-result-object v4

    if-eqz v3, :cond_126

    if-eqz v4, :cond_126

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Selected video format: "

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-static {p0, v1, v4, v3}, Le/e/a/Quality195;->outputs(Ljava/lang/Object;Lorg/json/JSONObject;Ljava/lang/String;Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    new-instance v6, Lorg/json/JSONObject;

    invoke-direct {v6}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "outputs"

    invoke-virtual {v6, v7, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    invoke-virtual {v6}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v6

    const-string v7, "client"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v8, "watchTrackId"

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v8, "accessRightKey"

    invoke-virtual {v1, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v8, Ljava/lang/StringBuilder;

    const-string v9, "https://nvapi.nicovideo.jp/v1/watch/"

    invoke-direct {v8, v9}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "/access-rights/hls?actionTrackId="

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-static {p0, v8, v6, v1}, Le/e/a/Quality195;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    new-instance v9, Lorg/json/JSONObject;

    invoke-direct {v9, v8}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "data"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9

    const-string v10, "contentUrl"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, ".m3u8"

    invoke-virtual {v9, v10}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v10

    if-eqz v10, :cond_126

    invoke-virtual {v0}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Le/e/a/d0;->b(Ljava/lang/String;)Landroid/os/Bundle;

    move-result-object v0

    const-string v10, "description"

    invoke-virtual {v0, v10}, Landroid/os/Bundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    if-eqz v11, :cond_ec

    const-string v10, "description_original"

    invoke-virtual {v0, v10, v11}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    :cond_ec
    const-string v10, "flvUrl"

    invoke-virtual {v0, v10, v9}, Landroid/os/Bundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "nicovideo_version"

    const/4 v11, 0x2

    invoke-virtual {v0, v10, v11}, Landroid/os/Bundle;->putInt(Ljava/lang/String;I)V

    iput-object v0, p0, Le/e/a/d0;->m:Landroid/os/Bundle;

    iput-object v9, p0, Le/e/a/d0;->G:Ljava/lang/String;

    iget-object v10, p0, Le/e/a/d0;->b:Le/e/a/v;

    if-eqz v10, :cond_101

    iput-object v9, v10, Le/e/a/v;->d:Ljava/lang/String;

    :cond_101
    const-string v10, "HLS session ready; playlist sent to player"

    invoke-static {v10}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-static {p0, v0}, Le/e/a/CachedPlayback;->initializeMetadata(Ljava/lang/Object;Landroid/os/Bundle;)V

    iget-object v10, p0, Le/e/a/d0;->k:Le/e/a/l3/j;

    invoke-interface {v10, v0}, Le/e/a/l3/j;->a(Landroid/os/Bundle;)V

    iget-boolean v10, p0, Le/e/a/d0;->modernCommentsRequested:Z

    if-nez v10, :cond_122

    const/4 v10, 0x1

    iput-boolean v10, p0, Le/e/a/d0;->modernCommentsRequested:Z

    new-instance v10, Ljava/lang/Thread;

    new-instance v11, Le/e/a/ModernComments$Worker;

    invoke-direct {v11, p0}, Le/e/a/ModernComments$Worker;-><init>(Le/e/a/d0;)V

    invoke-direct {v10, v11}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v10}, Ljava/lang/Thread;->start()V

    :cond_122
    invoke-static {p0, p1}, Le/e/a/CachedPlayback;->cacheWhilePlaying(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v9

    :cond_126
    invoke-static {p0}, Le/e/a/GuestWatch;->hasFailure(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_136

    const-string v0, "HLS session: no available format"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "\u3053\u306e\u52d5\u753b\u306b\u5bfe\u5fdc\u3059\u308b\u518d\u751f\u5f62\u5f0f\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-static {p0, v1}, Le/e/a/ModernPlayback;->notice(Le/e/a/d0;Ljava/lang/String;)V

    :cond_136
    const/4 v0, 0x0

    return-object v0
    :try_end_138
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_138} :catch_138

    :catch_138
    move-exception v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    const-string v1, "nicoid-modern"

    const-string v2, "HLS session request failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    move-result v0

    const-string v1, "\u518d\u751f\u60c5\u5831\u306e\u53d6\u5f97\u306b\u5931\u6557\u3057\u307e\u3057\u305f\u3002\u901a\u4fe1\u72b6\u614b\u3084\u8996\u8074\u6a29\u9650\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-static {p0, v1}, Le/e/a/ModernPlayback;->notice(Le/e/a/d0;Ljava/lang/String;)V

    const/4 v0, 0x0

    return-object v0
.end method

.method private static watch(Le/e/a/d0;Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 3

    invoke-static {p0, p1}, Le/e/a/GuestWatch;->watch(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    return-object v0
.end method
