.class public final Le/e/a/ModernSearch;
.super Ljava/lang/Object;
.source "ModernSearch.java"


# direct methods
.method public static load(Le/e/a/e0;)V
    .registers 16

    :try_start_0
    iget-object v0, p0, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v1, "keyword"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_11

    const-string v2, "search"

    goto :goto_17

    :cond_11
    const-string v2, "tag"

    invoke-virtual {v0, v2}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_17
    if-eqz v1, :cond_1db

    const-string v3, "https://www.nicovideo.jp"

    invoke-static {v3}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v3

    invoke-virtual {v3}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v3, v2}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v3, v1}, Landroid/net/Uri$Builder;->appendPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    const-string v1, "sortKey"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_36

    const-string v2, "sort"

    invoke-virtual {v3, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_36
    const-string v1, "sortOrder"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_43

    const-string v2, "order"

    invoke-virtual {v3, v2, v1}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    :cond_43
    const-string v1, "page"

    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-nez v2, :cond_4d

    const-string v2, "1"

    :cond_4d
    invoke-virtual {v3, v1, v2}, Landroid/net/Uri$Builder;->appendQueryParameter(Ljava/lang/String;Ljava/lang/String;)Landroid/net/Uri$Builder;

    invoke-virtual {v3}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

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

    invoke-static/range {p0 .. p0}, Le/e/a/Followup3;->loading(Ljava/lang/Object;)V

    invoke-static {v1}, Le/e/a/Followup3;->connected(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    new-instance v3, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    const-string v5, "UTF-8"

    invoke-direct {v4, v2, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    :goto_8d
    invoke-virtual {v3}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    if-eqz v5, :cond_97

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_8d

    :cond_97
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

    if-eqz v5, :cond_1db

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

    const-string v4, "$getSearchVideoV2"

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

    :goto_e3
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    if-ge v7, v8, :cond_1aa

    invoke-virtual {v5, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v8

    const-string v9, "type"

    invoke-virtual {v8, v9}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "essential"

    invoke-virtual {v10, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_1a6

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

    :cond_1a6
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_e3

    :cond_1aa
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-static {v7}, Le/e/a/Followup3;->parsed(I)V

    if-lez v7, :cond_1db

    iget v8, p0, Le/e/a/e0;->f:I

    add-int/2addr v7, v8

    iput v7, p0, Le/e/a/e0;->f:I

    iget v8, p0, Le/e/a/e0;->j:I

    if-nez v8, :cond_1bf

    const/4 v8, 0x1

    iput v8, p0, Le/e/a/e0;->j:I

    :cond_1bf
    invoke-virtual {v5}, Lorg/json/JSONArray;->length()I

    move-result v8

    const/16 v9, 0x20

    if-lt v8, v9, :cond_1cb

    move v8, v7

    iput v8, p0, Le/e/a/e0;->i:I

    goto :goto_1cf

    :cond_1cb
    add-int/lit8 v7, v7, 0x1

    iput v7, p0, Le/e/a/e0;->i:I

    :goto_1cf
    iget-object v7, p0, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v8, Le/e/a/e0$i;

    const/4 v9, 0x0

    invoke-direct {v8, p0, v6, v9}, Le/e/a/e0$i;-><init>(Le/e/a/e0;Ljava/util/ArrayList;I)V

    invoke-virtual {v7, v8}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_1db
    const-string v0, "nicoid-modern"

    const-string v1, "No search videos in current page"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_1ee
    :try_end_1e3
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_1e3} :catch_1e3

    :catch_1e3
    move-exception v0

    invoke-static {v0}, Le/e/a/Followup3;->failure(Ljava/lang/Exception;)V

    const-string v1, "nicoid-modern"

    const-string v2, "Modern search failed"

    invoke-static {v1, v2, v0}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    :goto_1ee
    iget-object v0, p0, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v1, Le/e/a/e0$c;

    invoke-direct {v1, p0}, Le/e/a/e0$c;-><init>(Le/e/a/e0;)V

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
