.class public final Le/e/a/ModernRanking;
.super Ljava/lang/Object;
.source "ModernRanking.java"


# direct methods
.method public static countInfo(Lorg/json/JSONObject;)Landroid/text/Spanned;
    .registers 8

    sget-object v0, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    const-string v1, "\u518d\u751f:%,d  \u30b3\u30e1\u30f3\u30c8:%,d  \u30de\u30a4\u30ea\u30b9:%,d  \u3044\u3044\u306d:%,d"

    const/4 v2, 0x4

    new-array v2, v2, [Ljava/lang/Object;

    const-string v3, "view"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v2, v6

    const-string v3, "comment"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v2, v6

    const-string v3, "mylist"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v2, v6

    const-string v3, "like"

    invoke-virtual {p0, v3}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v3

    invoke-static {v3, v4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    const/4 v6, 0x3

    aput-object v5, v2, v6

    invoke-static {v0, v1, v2}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    return-object v0
.end method

.method public static formatJst(Ljava/lang/String;)Landroid/text/Spanned;
    .registers 6

    :try_start_0
    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ssXXX"

    sget-object v2, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    invoke-virtual {v0, p0}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd HH:mm:ss"

    invoke-direct {v0, v1, v2}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;Ljava/util/Locale;)V

    const-string v1, "Asia/Tokyo"

    invoke-static {v1}, Ljava/util/TimeZone;->getTimeZone(Ljava/lang/String;)Ljava/util/TimeZone;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/text/SimpleDateFormat;->setTimeZone(Ljava/util/TimeZone;)V

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0
    :try_end_21
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_21} :catch_21

    :catch_21
    invoke-static {p0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    return-object v0
.end method

.method public static load(Le/e/a/e0;)V
    .registers 16

    :try_start_0
    const-string v0, "Ranking request started"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getLastPathSegment()Ljava/lang/String;

    move-result-object v0

    const-string v1, "{\"all\":\"e9uj2uks\",\"hot-topic\":\"e9uj2uks\",\"entertainment\":\"8kjl94d9\",\"radio\":\"oxzi6bje\",\"music_sound\":\"wq76qdin\",\"dance\":\"6yuf530c\",\"animal\":\"ne72lua2\",\"nature\":\"24aa8fkw\",\"cooking\":\"lq8d5918\",\"traveling_outdoor\":\"k1libcse\",\"vehicle\":\"3d8zlls9\",\"sports\":\"4w3p65pf\",\"society_politics_news\":\"lzicx0y6\",\"technology_craft\":\"n46kcz9u\",\"commentary_lecture\":\"v6wdx6p5\",\"anime\":\"zc49b03a\",\"game\":\"4eet3ca4\",\"other\":\"ramuboyn\"}"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "e9uj2uks"

    invoke-virtual {v2, v0, v0}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://www.nicovideo.jp/ranking/genre/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "?term="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, p0, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-static {v2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    const-string v3, "term"

    invoke-virtual {v2, v3}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_3b

    const-string v2, "24h"

    :cond_3b
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, v0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    const/16 v2, 0x1f40

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v2, "User-Agent"

    const-string v3, "Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 Chrome/120.0 Safari/537.36"

    invoke-virtual {v1, v2, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, v2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    :goto_71
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_7b

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_71

    :cond_7b
    invoke-virtual {v3}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const-string v5, "<meta name=\"server-response\" content=\"([^\"]*)\""

    invoke-static {v5}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v5

    if-eqz v5, :cond_1aa

    const/4 v5, 0x1

    invoke-virtual {v4, v5}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v4}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v4, "data"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v4, "response"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v4, "$getTeibanRanking"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v4, "data"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v4, "items"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v5

    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    const/4 v7, 0x0

    :goto_c7
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v7, v8, :cond_18e

    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "type"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "essential"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_18a

    new-instance v9, Le/e/a/x1;

    invoke-direct {v9}, Le/e/a/x1;-><init>()V

    const-string v10, "id"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->b:Ljava/lang/String;

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "https://www.nicovideo.jp/watch/"

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    iput-object v11, v9, Le/e/a/x1;->a:Ljava/lang/String;

    const-string v10, "title"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->h:Ljava/lang/String;

    invoke-static {v8}, Le/e/a/ModernVideoOwner;->name(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->y:Ljava/lang/String;

    const-string v10, "thumbnail"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "listingUrl"

    const-string v12, "url"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    const-string v12, "listingUrl"

    invoke-virtual {v10, v12, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->c:Ljava/lang/String;

    add-int/lit8 v10, v7, 0x1

    invoke-static {v10}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->g:Ljava/lang/String;

    const-string v10, "count"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "view"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v11

    iput-wide v11, v9, Le/e/a/x1;->p:J

    const-string v11, "comment"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optLong(Ljava/lang/String;)J

    move-result-wide v11

    iput-wide v11, v9, Le/e/a/x1;->q:J

    const-string v11, "mylist"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    iput v10, v9, Le/e/a/x1;->m:I

    const-string v10, "duration"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    div-int/lit8 v11, v10, 0x3c

    rem-int/lit8 v10, v10, 0x3c

    sget-object v12, Ljava/util/Locale;->JAPAN:Ljava/util/Locale;

    const-string v13, "%d:%02d"

    const/4 v14, 0x2

    new-array v14, v14, [Ljava/lang/Object;

    invoke-static {v11}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v11

    const/4 v3, 0x0

    aput-object v11, v14, v3

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    const/4 v11, 0x1

    aput-object v10, v14, v11

    invoke-static {v12, v13, v14}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->d:Landroid/text/Spanned;

    const-string v10, "registeredAt"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le/e/a/ModernRanking;->formatJst(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->f:Landroid/text/Spanned;

    const-string v10, "count"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    invoke-static {v10}, Le/e/a/ModernRanking;->countInfo(Lorg/json/JSONObject;)Landroid/text/Spanned;

    move-result-object v10

    iput-object v10, v9, Le/e/a/x1;->e:Landroid/text/Spanned;

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_18a
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_c7

    :cond_18e
    const-string v0, "Ranking response parsed"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-lez v7, :cond_1aa

    iput v7, p0, Le/e/a/e0;->f:I

    const/4 v7, 0x0

    iput v7, p0, Le/e/a/e0;->i:I

    iget-object v7, p0, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v8, Le/e/a/e0$i;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v6, v9}, Le/e/a/e0$i;-><init>(Le/e/a/e0;Ljava/util/ArrayList;I)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1aa
    const-string v0, "nicoid-modern"

    const-string v1, "No ranking videos in current page"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1ba
    :try_end_1b2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1b2} :catch_1b2

    :catch_1b2
    move-exception v0

    const-string v1, "nicoid-modern"

    const-string v2, "Modern ranking failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1ba
    const-string v0, "Ranking request failed"

    invoke-static {v0}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v1, Le/e/a/e0$c;

    invoke-direct {v1, p0}, Le/e/a/e0$c;-><init>(Le/e/a/e0;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method

.method public static populateCategories(Lcom/sauzask/nicoid/NicoidRankingActivity;)V
    .registers 7

    move-object v0, p0

    const/4 v1, 0x0

    const-string v3, ""

    const/4 v5, 0x0

    const-string v2, "\u7dcf\u5408"

    const-string v4, "e9uj2uks"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30b2\u30fc\u30e0"

    const-string v4, "4eet3ca4"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30a2\u30cb\u30e1"

    const-string v4, "zc49b03a"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30dc\u30ab\u30ed"

    const-string v4, "dshv5do5"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u97f3\u58f0\u5408\u6210\u5b9f\u6cc1\u30fb\u89e3\u8aac\u30fb\u5287\u5834"

    const-string v4, "wnm2mhv0"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30a8\u30f3\u30bf\u30e1"

    const-string v4, "8kjl94d9"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u97f3\u697d"

    const-string v4, "wq76qdin"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u6b4c\u3063\u3066\u307f\u305f"

    const-string v4, "1ya6bnqd"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u8e0a\u3063\u3066\u307f\u305f"

    const-string v4, "6yuf530c"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u6f14\u594f\u3057\u3066\u307f\u305f"

    const-string v4, "6r5jr8nd"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u89e3\u8aac\u30fb\u8b1b\u5ea7"

    const-string v4, "v6wdx6p5"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u6599\u7406"

    const-string v4, "lq8d5918"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u65c5\u884c\u30fb\u30a2\u30a6\u30c8\u30c9\u30a2"

    const-string v4, "k1libcse"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u81ea\u7136"

    const-string v4, "24aa8fkw"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u4e57\u308a\u7269"

    const-string v4, "3d8zlls9"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u6280\u8853\u30fb\u5de5\u4f5c"

    const-string v4, "n46kcz9u"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u793e\u4f1a\u30fb\u653f\u6cbb\u30fb\u6642\u4e8b"

    const-string v4, "lzicx0y6"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "MMD"

    const-string v4, "p1acxuoz"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "VTuber"

    const-string v4, "6mkdo4xd"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30e9\u30b8\u30aa"

    const-string v4, "oxzi6bje"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u30b9\u30dd\u30fc\u30c4"

    const-string v4, "4w3p65pf"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u52d5\u7269"

    const-string v4, "ne72lua2"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    const-string v2, "\u305d\u306e\u4ed6"

    const-string v4, "ramuboyn"

    invoke-virtual/range {v0 .. v5}, Lcom/sauzask/nicoid/NicoidRankingActivity;->a(ZLjava/lang/String;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method

.method public static term(I)Ljava/lang/String;
    .registers 2

    packed-switch p0, :pswitch_data_16

    const-string v0, "24h"

    return-object v0

    :pswitch_6
    const-string v0, "hour"

    return-object v0

    :pswitch_9
    const-string v0, "24h"

    return-object v0

    :pswitch_c
    const-string v0, "week"

    return-object v0

    :pswitch_f
    const-string v0, "month"

    return-object v0

    :pswitch_12
    const-string v0, "total"

    return-object v0

    nop

    :pswitch_data_16
    .packed-switch 0x0
        :pswitch_6
        :pswitch_9
        :pswitch_c
        :pswitch_f
        :pswitch_12
    .end packed-switch
.end method
