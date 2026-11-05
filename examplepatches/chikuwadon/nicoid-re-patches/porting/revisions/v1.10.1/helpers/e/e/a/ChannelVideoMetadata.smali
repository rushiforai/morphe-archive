.class final Le/e/a/ChannelVideoMetadata;
.super Ljava/lang/Object;
.source "ChannelVideoMetadata.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/ChannelVideoMetadata$Result;
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static apiUrl(Ljava/lang/String;Z)Ljava/lang/String;
    .registers 4

    .line 11
    const-string v0, "(?:sm|nm|so)?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_31

    .line 12
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/api/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    if-eqz p1, :cond_14

    const-string p1, "v3_guest/"

    goto :goto_16

    :cond_14
    const-string p1, "v3/"

    :goto_16
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, "?actionTrackId=AAAAAAAAAA_"

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 11
    :cond_31
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "Invalid video ID"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static apply(Le/e/a/ChannelFeed$Video;Lorg/json/JSONObject;)Z
    .registers 3

    .line 30
    invoke-static {p1}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    .line 31
    iget-object v0, p0, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-static {p1, v0}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_e

    const/4 p0, 0x0

    return p0

    .line 32
    :cond_e
    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 33
    invoke-static {p0, p1}, Le/e/a/ChannelVideoMetadata;->applyVideo(Le/e/a/ChannelFeed$Video;Lorg/json/JSONObject;)Z

    move-result p0

    return p0
.end method

.method static applyFetched(Le/e/a/ChannelFeed$Video;Le/e/a/ChannelVideoMetadata$Result;)Z
    .registers 5

    .line 21
    iget-object v0, p0, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    iget-object v1, p1, Le/e/a/ChannelVideoMetadata$Result;->requestedId:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    return v1

    .line 22
    :cond_c
    iget-object p1, p1, Le/e/a/ChannelVideoMetadata$Result;->response:Lorg/json/JSONObject;

    invoke-static {p1}, Le/e/a/DetailData;->watchData(Lorg/json/JSONObject;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    .line 23
    if-nez v0, :cond_1b

    return v1

    .line 26
    :cond_1b
    iget-object v2, p0, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    invoke-static {p1, v2}, Le/e/a/DetailData;->matchesWatch(Lorg/json/JSONObject;Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3c

    iget-object p1, p0, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    const-string v2, "[0-9]+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_3b

    const-string p1, "id"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    const-string v2, "so[0-9]+"

    invoke-virtual {p1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_3c

    :cond_3b
    return v1

    .line 27
    :cond_3c
    invoke-static {p0, v0}, Le/e/a/ChannelVideoMetadata;->applyVideo(Le/e/a/ChannelFeed$Video;Lorg/json/JSONObject;)Z

    move-result p0

    return p0
.end method

.method private static applyVideo(Le/e/a/ChannelFeed$Video;Lorg/json/JSONObject;)Z
    .registers 8

    .line 36
    invoke-static {p1}, Le/e/a/DetailData;->thumbnail(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v0

    .line 37
    const-string v1, "https://"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_e

    iput-object v0, p0, Le/e/a/ChannelFeed$Video;->image:Ljava/lang/String;

    .line 38
    :cond_e
    const-string v0, "count"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 39
    if-eqz p1, :cond_5f

    const-string v0, "view"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_5f

    const-string v1, "comment"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5f

    const-string v2, "mylist"

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_5f

    .line 40
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "\u518d\u751f\u6570:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v3, " \u30b3\u30e1\u30f3\u30c8:"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-virtual {v0, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " \u30de\u30a4\u30ea\u30b9\u30c8:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p1, v2}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/ChannelFeed$Video;->counts:Ljava/lang/String;

    .line 41
    :cond_5f
    const/4 p0, 0x1

    return p0
.end method

.method static fetch(Le/e/a/ChannelFeed$Video;Le/e/a/NetworkTask;)Le/e/a/ChannelVideoMetadata$Result;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    const-string v0, "GET"

    iget-object p0, p0, Le/e/a/ChannelFeed$Video;->id:Ljava/lang/String;

    .line 16
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v1

    const-string v2, "user_session="

    invoke-virtual {v1, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    const/4 v2, 0x1

    xor-int/2addr v1, v2

    .line 17
    const/4 v3, 0x0

    :try_start_11
    new-instance v4, Le/e/a/ChannelVideoMetadata$Result;

    invoke-static {p0, v1}, Le/e/a/ChannelVideoMetadata;->apiUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v5

    if-eqz v1, :cond_1b

    const/4 v6, 0x0

    goto :goto_1c

    :cond_1b
    const/4 v6, 0x1

    :goto_1c
    invoke-static {v5, v0, v6, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v5

    invoke-direct {v4, p0, v5}, Le/e/a/ChannelVideoMetadata$Result;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V
    :try_end_23
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_23} :catch_24

    return-object v4

    .line 18
    :catch_24
    move-exception v4

    if-nez v1, :cond_3b

    invoke-virtual {p1}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v1

    if-nez v1, :cond_3b

    new-instance v1, Le/e/a/ChannelVideoMetadata$Result;

    invoke-static {p0, v2}, Le/e/a/ChannelVideoMetadata;->apiUrl(Ljava/lang/String;Z)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2, v0, v3, p1}, Le/e/a/VideoDetails;->request(Ljava/lang/String;Ljava/lang/String;ZLe/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object p1

    invoke-direct {v1, p0, p1}, Le/e/a/ChannelVideoMetadata$Result;-><init>(Ljava/lang/String;Lorg/json/JSONObject;)V

    return-object v1

    :cond_3b
    throw v4
.end method
