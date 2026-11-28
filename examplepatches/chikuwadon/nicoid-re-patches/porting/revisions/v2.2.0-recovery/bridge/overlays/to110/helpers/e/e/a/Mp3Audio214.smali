.class final Le/e/a/Mp3Audio214;
.super Ljava/lang/Object;
.source "Mp3Audio214.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fetch(Le/e/a/Mp4Transfer115;Ljava/lang/Object;)Ljava/io/File;
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 23
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 24
    iget-object v0, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    .line 25
    iget-object v1, v0, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {p1, v1}, Le/e/a/GuestWatch;->watch(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_10

    .line 27
    const-string v2, "video"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 28
    const-string v3, "title"

    iget-object v4, v0, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    .line 29
    const-string v2, "media"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "domand"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    .line 30
    const-string v3, "videos"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const-string v4, "audios"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v5, 0x0

    const/4 v6, 0x0

    const v7, 0x7fffffff

    move v8, v5

    move-object v9, v6

    .line 33
    :goto_0
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v10

    const-string v11, "isAvailable"

    const-string v12, "id"

    if-lt v8, v10, :cond_d

    if-eqz v9, :cond_c

    move v3, v5

    .line 42
    :goto_1
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v3, v7, :cond_0

    move-object v7, v6

    goto :goto_2

    .line 43
    :cond_0
    invoke-virtual {v4, v3}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    .line 44
    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_b

    :goto_2
    if-eqz v7, :cond_a

    .line 49
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    new-instance v4, Lorg/json/JSONArray;

    invoke-direct {v4}, Lorg/json/JSONArray;-><init>()V

    .line 50
    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    invoke-virtual {v7, v12}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v4

    .line 49
    invoke-virtual {v3, v4}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v3

    .line 51
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v7, "https://nvapi.nicovideo.jp/v1/watch/"

    invoke-direct {v4, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v7, v0, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {v7}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    const-string v7, "/access-rights/hls?actionTrackId="

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    const-string v7, "client"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v7, "watchTrackId"

    invoke-virtual {v1, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 52
    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 55
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v7, "outputs"

    invoke-virtual {v4, v7, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v3}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v3

    .line 56
    const-string v4, "accessRightKey"

    invoke-virtual {v2, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    .line 54
    invoke-static {p1, v1, v3, v2}, Le/e/a/Quality195;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 57
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 58
    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "data"

    invoke-virtual {v1, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v1, "contentUrl"

    invoke-virtual {p1, v1}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 59
    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Le/e/a/ModernPlayback;->domandCookie:Ljava/lang/String;

    invoke-static {p1, v1, v2}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, p0, Le/e/a/Mp4Transfer115;->cookie:Ljava/lang/String;

    .line 60
    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 61
    invoke-virtual {p0, v1}, Le/e/a/Mp4Transfer115;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    .line 64
    const-string v2, "\\r?\\n"

    invoke-virtual {p1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object p1

    array-length v2, p1

    move v3, v5

    :goto_3
    if-lt v3, v2, :cond_1

    move-object p1, v6

    goto :goto_4

    :cond_1
    aget-object v4, p1, v3

    .line 65
    const-string v7, "#EXT-X-MEDIA:"

    invoke-virtual {v4, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_9

    .line 66
    invoke-static {v4}, Le/e/a/Mp4Playlist115;->attrs(Ljava/lang/String;)Ljava/util/Map;

    move-result-object v4

    .line 67
    const-string v7, "TYPE"

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    const-string v8, "AUDIO"

    invoke-virtual {v8, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_9

    const-string v7, "URI"

    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-eqz v8, :cond_9

    .line 68
    invoke-interface {v4, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/lang/String;

    invoke-static {v1, p1}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object p1

    :goto_4
    if-eqz p1, :cond_8

    .line 74
    invoke-virtual {p0, p1}, Le/e/a/Mp4Transfer115;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v1}, Le/e/a/Mp4Playlist115;->parse(Ljava/net/URL;Ljava/lang/String;)Le/e/a/Mp4Playlist115$Plan;

    move-result-object p1

    .line 75
    iget-object v1, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->isDirectory()Z

    move-result v1

    if-nez v1, :cond_2

    iget-object v1, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->mkdirs()Z

    move-result v1

    if-nez v1, :cond_2

    .line 76
    new-instance p0, Ljava/io/IOException;

    const-string p1, "MP3\u4f5c\u696d\u30d5\u30a9\u30eb\u30c0\u3092\u4f5c\u6210\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 77
    :cond_2
    const-string/jumbo v1, "\u97f3\u58f0\u306e\u307f\u53d6\u5f97\u4e2d"

    iput-object v1, v0, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 78
    iget-wide v1, p1, Le/e/a/Mp4Playlist115$Plan;->bytes:J

    iput-wide v1, v0, Le/e/a/DownloadJobs115$Job;->total:J

    .line 79
    iget-object v1, p1, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    iput v1, v0, Le/e/a/DownloadJobs115$Job;->assets:I

    .line 80
    iput v5, v0, Le/e/a/DownloadJobs115$Job;->finishedAssets:I

    const-wide/16 v1, 0x0

    .line 81
    iput-wide v1, v0, Le/e/a/DownloadJobs115$Job;->bytes:J

    .line 82
    iget-object v1, p0, Le/e/a/Mp4Transfer115;->context:Landroid/content/Context;

    invoke-static {v1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    .line 83
    new-instance v1, Ljava/io/File;

    iget-object v2, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    const-string v3, "audio-track.fragmented"

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 84
    :try_start_0
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Ljava/io/FileOutputStream;

    invoke-direct {v3, v1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 85
    :try_start_1
    iget-object p1, p1, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_5
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v3, :cond_5

    .line 90
    :try_start_2
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 91
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 92
    new-instance p1, Ljava/io/File;

    iget-object v2, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    const-string v3, "audio-only.mp4"

    invoke-direct {p1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    invoke-static {v1}, Le/e/a/FragmentedMp4117;->isFragmented(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-static {p0, v1, p1}, Le/e/a/Mp3Audio214;->muxFragmented(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;)V

    goto :goto_6

    .line 94
    :cond_3
    invoke-static {p0, v1, p1}, Le/e/a/Mp3Audio214;->muxPlatform(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;)V

    .line 95
    :goto_6
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 96
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x100

    cmp-long v1, v1, v3

    if-ltz v1, :cond_4

    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "MP3 "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {v0}, Le/e/a/Mp3Save214;->bitrate(Le/e/a/DownloadJobs115$Job;)I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v2, "kbps"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iput-object v1, v0, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    .line 98
    iget-object p0, p0, Le/e/a/Mp4Transfer115;->context:Landroid/content/Context;

    invoke-static {p0}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    return-object p1

    .line 96
    :cond_4
    new-instance p0, Ljava/io/IOException;

    const-string/jumbo p1, "\u97f3\u58f0\u30b9\u30c8\u30ea\u30fc\u30e0\u3092MP4\u3068\u3057\u3066\u8aad\u307f\u8fbc\u3081\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 85
    :cond_5
    :try_start_3
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/Mp4Playlist115$Segment;

    .line 86
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 87
    invoke-virtual {p0, v3, v2}, Le/e/a/Mp4Transfer115;->binary(Le/e/a/Mp4Playlist115$Segment;Ljava/io/OutputStream;)V

    .line 88
    iget v3, v0, Le/e/a/DownloadJobs115$Job;->finishedAssets:I

    add-int/lit8 v3, v3, 0x1

    iput v3, v0, Le/e/a/DownloadJobs115$Job;->finishedAssets:I
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    goto :goto_5

    :catchall_0
    move-exception p0

    move-object v6, p0

    .line 90
    :try_start_4
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V

    throw v6
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :catchall_1
    move-exception p0

    if-eqz v6, :cond_7

    if-eq v6, p0, :cond_6

    invoke-virtual {v6, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    move-object p0, v6

    :cond_7
    throw p0

    .line 73
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string/jumbo p1, "\u97f3\u58f0\u306e\u307f\u306eHLS\u914d\u4fe1\u304c\u898b\u3064\u304b\u308a\u307e\u305b\u3093\uff08\u52d5\u753b\u306f\u53d6\u5f97\u3057\u307e\u305b\u3093\uff09"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_9
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_3

    .line 46
    :cond_a
    new-instance p0, Ljava/io/IOException;

    const-string/jumbo p1, "\u97f3\u58f0\u306e\u307f\u306e\u914d\u4fe1\u304c\u5229\u7528\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_b
    add-int/lit8 v3, v3, 0x1

    goto/16 :goto_1

    .line 40
    :cond_c
    new-instance p0, Ljava/io/IOException;

    const-string/jumbo p1, "\u97f3\u58f0\u53d6\u5f97\u306b\u5fc5\u8981\u306a\u914d\u4fe1\u60c5\u5831\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 34
    :cond_d
    invoke-virtual {v3, v8}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v10

    .line 35
    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_f

    .line 36
    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Le/e/a/Mp4Transfer115;->height(Ljava/lang/String;)I

    move-result v11

    const-string v12, "height"

    invoke-virtual {v10, v12, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v11

    if-lez v11, :cond_e

    if-ge v11, v7, :cond_e

    move-object v9, v10

    move v7, v11

    goto :goto_7

    :cond_e
    if-nez v9, :cond_f

    move-object v9, v10

    :cond_f
    :goto_7
    add-int/lit8 v8, v8, 0x1

    goto/16 :goto_0

    .line 26
    :cond_10
    new-instance p0, Ljava/io/IOException;

    const-string p1, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static muxFragmented(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;)V
    .registers 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 103
    :try_start_0
    new-instance v2, Le/e/a/FragmentedMp4117;

    move-object/from16 v0, p1

    invoke-direct {v2, v0}, Le/e/a/FragmentedMp4117;-><init>(Ljava/io/File;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_6

    .line 105
    :try_start_1
    iget-object v0, v2, Le/e/a/FragmentedMp4117;->formats:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1

    const/4 v3, 0x0

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/FragmentedMp4117$Format;

    .line 106
    const-string v4, "audio/mp4a-latm"

    iget-object v5, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    invoke-virtual {v4, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_0

    :goto_0
    if-eqz v3, :cond_9

    .line 108
    invoke-virtual {v2, v3}, Le/e/a/FragmentedMp4117;->cursor(Le/e/a/FragmentedMp4117$Format;)Le/e/a/FragmentedMp4117$Cursor;

    move-result-object v0

    .line 109
    iget-object v4, v0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    if-eqz v4, :cond_8

    .line 110
    iget-object v4, v3, Le/e/a/FragmentedMp4117$Format;->mime:Ljava/lang/String;

    iget v5, v3, Le/e/a/FragmentedMp4117$Format;->rate:I

    iget v6, v3, Le/e/a/FragmentedMp4117$Format;->channels:I

    invoke-static {v4, v5, v6}, Landroid/media/MediaFormat;->createAudioFormat(Ljava/lang/String;II)Landroid/media/MediaFormat;

    move-result-object v4

    .line 111
    const-string v5, "csd-0"

    iget-object v3, v3, Le/e/a/FragmentedMp4117$Format;->csd0:[B

    invoke-static {v3}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v3

    invoke-virtual {v4, v5, v3}, Landroid/media/MediaFormat;->setByteBuffer(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 112
    new-instance v3, Landroid/media/MediaMuxer;

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    invoke-direct {v3, v5, v6}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_4

    .line 115
    :try_start_2
    invoke-virtual {v3, v4}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v4

    .line 116
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->start()V

    const/high16 v5, 0x100000

    const/4 v6, 0x1

    .line 117
    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 118
    new-instance v7, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v7}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 119
    iget-object v8, v0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    iget-wide v13, v8, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    const-wide/16 v8, -0x1

    .line 120
    :goto_1
    iget-object v10, v0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    const-wide/16 v11, 0x0

    if-nez v10, :cond_3

    cmp-long v0, v8, v11

    if-ltz v0, :cond_2

    .line 136
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->stop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 139
    :try_start_3
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->release()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 141
    :try_start_4
    invoke-virtual {v2}, Le/e/a/FragmentedMp4117;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_6

    return-void

    :catchall_0
    move-exception v0

    move-object v1, v0

    move-object v15, v2

    goto/16 :goto_4

    .line 135
    :cond_2
    :try_start_5
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u97f3\u58f0\u30c7\u30fc\u30bf\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 121
    :cond_3
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 122
    iget-object v8, v0, Le/e/a/FragmentedMp4117$Cursor;->sample:Le/e/a/FragmentedMp4117$Sample;

    .line 123
    iget v9, v8, Le/e/a/FragmentedMp4117$Sample;->size:I

    const/high16 v10, 0x1000000

    if-gt v9, v10, :cond_6

    .line 124
    iget v9, v8, Le/e/a/FragmentedMp4117$Sample;->size:I

    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v10

    if-le v9, v10, :cond_4

    iget v5, v8, Le/e/a/FragmentedMp4117$Sample;->size:I

    invoke-static {v5}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v5

    .line 125
    :cond_4
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v9

    check-cast v9, Ljava/nio/ByteBuffer;

    .line 126
    invoke-virtual {v0, v5}, Le/e/a/FragmentedMp4117$Cursor;->write(Ljava/nio/ByteBuffer;)I

    move-result v9

    .line 127
    invoke-virtual {v5}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    move-result-object v10

    check-cast v10, Ljava/nio/ByteBuffer;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    move-object v15, v2

    .line 128
    :try_start_6
    iget-wide v1, v8, Le/e/a/FragmentedMp4117$Sample;->timeUs:J

    sub-long/2addr v1, v13

    cmp-long v10, v1, v11

    if-ltz v10, :cond_5

    .line 130
    iget-boolean v12, v8, Le/e/a/FragmentedMp4117$Sample;->sync:Z

    const/4 v8, 0x0

    move-wide v10, v1

    invoke-virtual/range {v7 .. v12}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 131
    invoke-virtual {v3, v4, v5, v7}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    .line 133
    invoke-virtual {v0}, Le/e/a/FragmentedMp4117$Cursor;->advance()Z

    move-wide v8, v10

    move-object v2, v15

    goto :goto_1

    .line 129
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u97f3\u58f0\u306e\u6642\u523b\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_6
    move-object v15, v2

    .line 123
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u97f3\u58f0\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_2

    :catchall_2
    move-exception v0

    move-object v15, v2

    :goto_2
    if-eqz v6, :cond_7

    .line 138
    :try_start_7
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->stop()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 139
    :catch_0
    :cond_7
    :try_start_8
    invoke-virtual {v3}, Landroid/media/MediaMuxer;->release()V

    .line 140
    throw v0

    :cond_8
    move-object v15, v2

    .line 109
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u97f3\u58f0\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_9
    move-object v15, v2

    .line 107
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v1, "\u97f3\u58f0\u30d5\u30e9\u30b0\u30e1\u30f3\u30c8\u306bAAC\u30c8\u30e9\u30c3\u30af\u304c\u3042\u308a\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    :catchall_3
    move-exception v0

    goto :goto_3

    :catchall_4
    move-exception v0

    move-object v15, v2

    :goto_3
    move-object v1, v0

    .line 141
    :goto_4
    :try_start_9
    invoke-virtual {v15}, Le/e/a/FragmentedMp4117;->close()V

    throw v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_5

    :catchall_5
    move-exception v0

    goto :goto_5

    :catchall_6
    move-exception v0

    const/4 v1, 0x0

    :goto_5
    if-eqz v1, :cond_b

    if-eq v1, v0, :cond_a

    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_a
    move-object v0, v1

    :cond_b
    throw v0
.end method

.method static muxPlatform(Le/e/a/Mp4Transfer115;Ljava/io/File;Ljava/io/File;)V
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 145
    new-instance v1, Landroid/media/MediaExtractor;

    invoke-direct {v1}, Landroid/media/MediaExtractor;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x0

    .line 149
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    move v0, v3

    .line 151
    :goto_0
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v4

    if-lt v0, v4, :cond_0

    const/4 v0, -0x1

    move-object v4, v2

    goto :goto_1

    .line 152
    :cond_0
    invoke-virtual {v1, v0}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v4

    .line 153
    const-string v5, "mime"

    invoke-virtual {v4, v5}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7

    .line 154
    const-string v6, "audio/"

    invoke-virtual {v5, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_7

    :goto_1
    if-ltz v0, :cond_6

    .line 157
    invoke-virtual {v1, v0}, Landroid/media/MediaExtractor;->selectTrack(I)V

    .line 158
    new-instance v5, Landroid/media/MediaMuxer;

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v5, v0, v3}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 159
    :try_start_1
    invoke-virtual {v5, v4}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    .line 160
    invoke-virtual {v5}, Landroid/media/MediaMuxer;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const/high16 v2, 0x400000

    const/4 v4, 0x1

    .line 161
    :try_start_2
    invoke-static {v2}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v2

    .line 162
    new-instance v6, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v6}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 163
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v7

    const-wide/16 v12, 0x0

    invoke-static {v12, v13, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v14

    move/from16 v16, v3

    .line 165
    :goto_2
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v7

    cmp-long v7, v7, v12

    if-ltz v7, :cond_1

    .line 166
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    .line 167
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v7

    check-cast v7, Ljava/nio/ByteBuffer;

    .line 168
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getSampleSize()J

    move-result-wide v7

    .line 169
    invoke-virtual {v2}, Ljava/nio/ByteBuffer;->capacity()I

    move-result v9

    int-to-long v9, v9

    cmp-long v7, v7, v9

    if-gtz v7, :cond_5

    .line 170
    invoke-virtual {v1, v2, v3}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v8

    if-gez v8, :cond_3

    :cond_1
    if-eqz v16, :cond_2

    .line 179
    invoke-virtual {v5}, Landroid/media/MediaMuxer;->stop()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 181
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->release()V

    .line 182
    invoke-virtual {v5}, Landroid/media/MediaMuxer;->release()V

    return-void

    .line 178
    :cond_2
    :try_start_3
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "\u97f3\u58f0\u30c7\u30fc\u30bf\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 172
    :cond_3
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v9

    sub-long/2addr v9, v14

    invoke-static {v12, v13, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    .line 173
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->getSampleFlags()I

    move-result v7

    and-int/2addr v7, v4

    if-eqz v7, :cond_4

    move v11, v4

    goto :goto_3

    :cond_4
    move v11, v3

    :goto_3
    const/4 v7, 0x0

    invoke-virtual/range {v6 .. v11}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    .line 174
    invoke-virtual {v5, v0, v2, v6}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    add-int/lit8 v16, v16, 0x1

    .line 176
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->advance()Z

    goto :goto_2

    .line 169
    :cond_5
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v2, "\u97f3\u58f0\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception v0

    move v3, v4

    goto :goto_4

    :catchall_1
    move-exception v0

    :goto_4
    move-object v2, v5

    goto :goto_5

    .line 156
    :cond_6
    :try_start_4
    new-instance v0, Ljava/io/IOException;

    const-string/jumbo v4, "\u97f3\u58f0\u306e\u307f\u306e\u30c8\u30e9\u30c3\u30af\u3092\u958b\u3051\u307e\u305b\u3093"

    invoke-direct {v0, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    :cond_7
    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_0

    :catchall_2
    move-exception v0

    .line 181
    :goto_5
    invoke-virtual {v1}, Landroid/media/MediaExtractor;->release()V

    if-eqz v2, :cond_9

    if-eqz v3, :cond_8

    .line 182
    :try_start_5
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->stop()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    :catch_0
    :cond_8
    invoke-virtual {v2}, Landroid/media/MediaMuxer;->release()V

    .line 183
    :cond_9
    throw v0
.end method
