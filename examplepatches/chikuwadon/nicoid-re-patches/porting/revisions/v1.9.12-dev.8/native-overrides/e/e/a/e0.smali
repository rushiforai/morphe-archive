.class public Le/e/a/e0;
.super Ljava/lang/Thread;
.source ""


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ljava/lang/String;

.field public e:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public f:I

.field public g:I

.field public i:I

.field public j:I

.field public k:Le/e/a/l3/d;

.field public l:Landroid/os/Handler;

.field public m:Lorg/apache/http/client/CookieStore;

.field public n:Z

.field public o:Z

.field public p:Landroid/content/Context;


# virtual methods
.method public final a(I)V
    .registers 32

    move-object/from16 v1, p0

    move/from16 v2, p1

    iget-object v0, v1, Le/e/a/e0;->a:Ljava/lang/String;

    if-eqz v0, :cond_1c

    const-string v3, "flapi.nicovideo.jp/api/getrelation"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_18

    const-string v3, "nicovideo.jp/v1/recommend"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1c

    :cond_18
    invoke-static {v1}, Le/e/a/ModernRelated;->load(Le/e/a/e0;)V

    return-void

    :cond_1c
    iget-object v0, v1, Le/e/a/e0;->a:Ljava/lang/String;

    if-eqz v0, :cond_2a

    invoke-static {v0}, Le/e/a/RankingPages190;->isRanking(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2a

    invoke-static {v1}, Le/e/a/ModernRanking;->load(Le/e/a/e0;)V

    return-void

    :cond_2a
    iget-object v0, v1, Le/e/a/e0;->a:Ljava/lang/String;

    if-eqz v0, :cond_3a

    const-string v3, "https://nvapi.nicovideo.jp/v1/search/video"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3a

    invoke-static {v1}, Le/e/a/ModernSearch;->load(Le/e/a/e0;)V

    return-void

    :cond_3a
    :try_start_3a
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    if-nez v4, :cond_4e

    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$f;

    invoke-direct {v3, v1}, Le/e/a/e0$f;-><init>(Le/e/a/e0;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_4e
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    new-instance v5, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v5}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v6, Lorg/apache/http/protocol/BasicHttpContext;

    invoke-direct {v6}, Lorg/apache/http/protocol/BasicHttpContext;-><init>()V

    const-string v7, "http.cookie-store"

    iget-object v8, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    invoke-interface {v6, v7, v8}, Lorg/apache/http/protocol/HttpContext;->setAttribute(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v7, Lorg/apache/http/client/methods/HttpGet;

    iget-object v8, v1, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-direct {v7, v8}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    const/4 v8, 0x1

    if-ne v2, v8, :cond_74

    const-string v9, "X-Frontend-Id"

    const-string v10, "1"

    invoke-virtual {v7, v9, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_74
    const/4 v9, 0x3

    if-eq v2, v9, :cond_7e

    const/4 v10, 0x4

    if-eq v2, v10, :cond_7e

    const/16 v10, 0xa

    if-ne v2, v10, :cond_8c

    :cond_7e
    const-string v10, "X-Frontend-Id"

    const-string v11, "6"

    invoke-virtual {v7, v10, v11}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "X-Frontend-Version"

    const-string v11, "0"

    invoke-virtual {v7, v10, v11}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8c
    const/4 v10, 0x4

    if-ne v2, v10, :cond_a0

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v10

    const-string v11, "https://www.nicovideo.jp/"

    invoke-virtual {v10, v11}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_a0

    const-string v11, "Cookie"

    invoke-virtual {v7, v11, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a0
    invoke-interface {v5, v7, v6}, Lorg/apache/http/client/HttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

    move-result-object v6

    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/StatusLine;->getStatusCode()I

    move-result v7

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u30b9\u30c6\u30fc\u30bf\u30b9\uff1a"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/16 v10, 0xc8

    if-ne v7, v10, :cond_1441

    new-instance v7, Ljava/lang/String;

    invoke-interface {v6}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/http/util/EntityUtils;->toByteArray(Lorg/apache/http/HttpEntity;)[B

    move-result-object v6

    const-string v10, "UTF-8"

    invoke-direct {v7, v6, v10}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "url\uff1a"

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v10, v1, Le/e/a/e0;->a:Ljava/lang/String;

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_e1
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_e1} :catch_1453

    const-string v6, "<b>"

    const-string v11, "videoinfo"

    const-string v12, "videourl"

    const-string v13, "mylist"

    const-string v15, "posttime"

    const-string v14, "length"

    const-string v9, ""

    const-string v10, "thumbnail"

    const-string v8, "title"

    move-object/from16 v16, v5

    const/4 v5, 0x1

    if-ne v2, v5, :cond_2e7

    :try_start_f8
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_fd
    .catch Ljava/lang/Exception; {:try_start_f8 .. :try_end_fd} :catch_2c8

    move/from16 v17, v4

    :try_start_ff
    const-string v4, "data"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "items"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4
    :try_end_10b
    .catch Ljava/lang/Exception; {:try_start_ff .. :try_end_10b} :catch_2c1

    move-object/from16 v19, v7

    const/4 v5, 0x0

    const/16 v18, 0x0

    :goto_110
    :try_start_110
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7
    :try_end_114
    .catch Ljava/lang/Exception; {:try_start_110 .. :try_end_114} :catch_2be

    if-ge v5, v7, :cond_2b0

    :try_start_116
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;
    :try_end_11c
    .catch Ljava/lang/Exception; {:try_start_116 .. :try_end_11c} :catch_295

    move-object/from16 v20, v4

    :try_start_11e
    const-string v4, "count"

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2
    :try_end_128
    .catch Ljava/lang/Exception; {:try_start_11e .. :try_end_128} :catch_28e

    move/from16 v21, v5

    :try_start_12a
    new-instance v5, Le/e/a/x1;

    invoke-direct {v5}, Le/e/a/x1;-><init>()V
    :try_end_12f
    .catch Ljava/lang/Exception; {:try_start_12a .. :try_end_12f} :catch_28b

    move-object/from16 v22, v3

    :try_start_131
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_136
    .catch Ljava/lang/Exception; {:try_start_131 .. :try_end_136} :catch_284

    move-object/from16 v23, v9

    :try_start_138
    const-string v9, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "id"

    invoke-virtual {v7, v9}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v12, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v3, "url"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v5, v10, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v3, "duration"

    invoke-virtual {v7, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-virtual {v1, v3}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v3, "</b>"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v5, v14, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v2, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v3, 0x7f0f0212

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x3

    new-array v9, v3, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v3
    :try_end_18b
    .catch Ljava/lang/Exception; {:try_start_138 .. :try_end_18b} :catch_27b

    move-object/from16 v24, v14

    :try_start_18d
    const-string v14, "view"

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14
    :try_end_193
    .catch Ljava/lang/Exception; {:try_start_18d .. :try_end_193} :catch_279

    move-object/from16 v25, v15

    int-to-long v14, v14

    :try_start_196
    invoke-virtual {v3, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    const/4 v14, 0x0

    aput-object v3, v9, v14

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v3

    const-string v14, "comment"

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v3, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    const/4 v14, 0x1

    aput-object v3, v9, v14

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v3

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v3, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v3

    const/4 v14, 0x2

    aput-object v3, v9, v14

    invoke-static {v2, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v5, v11, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawplay"

    const-string v3, "view"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawres"

    const-string v3, "comment"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawmylis"

    invoke-virtual {v4, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v5, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/SimpleDateFormat;

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v9, 0x7f0f004d

    invoke-virtual {v4, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v4, "registeredAt"

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v9, 0x7f0f020e

    invoke-virtual {v4, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v9, 0x1

    new-array v14, v9, [Ljava/lang/Object;

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v14, v3

    invoke-static {v4, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2
    :try_end_231
    .catch Ljava/lang/Exception; {:try_start_196 .. :try_end_231} :catch_271

    move-object/from16 v3, v25

    :try_start_233
    invoke-virtual {v5, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_241
    .catch Ljava/lang/Exception; {:try_start_233 .. :try_end_241} :catch_26f

    add-int/lit8 v2, v18, 0x1

    :try_start_243
    const-string v4, "rank"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_24d
    .catch Ljava/lang/Exception; {:try_start_243 .. :try_end_24d} :catch_267

    move-object/from16 v9, v23

    :try_start_24f
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v4, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_259
    .catch Ljava/lang/Exception; {:try_start_24f .. :try_end_259} :catch_263

    move-object/from16 v4, v22

    :try_start_25b
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_25e
    .catch Ljava/lang/Exception; {:try_start_25b .. :try_end_25e} :catch_261

    move/from16 v18, v2

    goto :goto_2a2

    :catch_261
    move-exception v0

    goto :goto_26c

    :catch_263
    move-exception v0

    move-object/from16 v4, v22

    goto :goto_26c

    :catch_267
    move-exception v0

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    :goto_26c
    move/from16 v18, v2

    goto :goto_29e

    :catch_26f
    move-exception v0

    goto :goto_27f

    :catch_271
    move-exception v0

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    move-object/from16 v3, v25

    goto :goto_29e

    :catch_279
    move-exception v0

    goto :goto_27e

    :catch_27b
    move-exception v0

    move-object/from16 v24, v14

    :goto_27e
    move-object v3, v15

    :goto_27f
    move-object/from16 v4, v22

    move-object/from16 v9, v23

    goto :goto_29e

    :catch_284
    move-exception v0

    move-object/from16 v24, v14

    move-object v3, v15

    move-object/from16 v4, v22

    goto :goto_29e

    :catch_28b
    move-exception v0

    move-object v4, v3

    goto :goto_292

    :catch_28e
    move-exception v0

    move-object v4, v3

    move/from16 v21, v5

    :goto_292
    move-object/from16 v24, v14

    goto :goto_29d

    :catch_295
    move-exception v0

    move-object/from16 v20, v4

    move/from16 v21, v5

    move-object/from16 v24, v14

    move-object v4, v3

    :goto_29d
    move-object v3, v15

    :goto_29e
    move-object v2, v0

    :try_start_29f
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_2a2
    .catch Ljava/lang/Exception; {:try_start_29f .. :try_end_2a2} :catch_2ae

    :goto_2a2
    add-int/lit8 v5, v21, 0x1

    move/from16 v2, p1

    move-object v15, v3

    move-object v3, v4

    move-object/from16 v4, v20

    move-object/from16 v14, v24

    goto/16 :goto_110

    :catch_2ae
    move-exception v0

    goto :goto_2d1

    :cond_2b0
    move-object v4, v3

    move-object v2, v4

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object v3, v11

    move-object/from16 v22, v12

    move-object v10, v13

    move-object/from16 v24, v14

    move-object v5, v15

    goto :goto_2df

    :catch_2be
    move-exception v0

    move-object v4, v3

    goto :goto_2c5

    :catch_2c1
    move-exception v0

    move-object v4, v3

    move-object/from16 v19, v7

    :goto_2c5
    move-object/from16 v24, v14

    goto :goto_2d0

    :catch_2c8
    move-exception v0

    move/from16 v17, v4

    move-object/from16 v19, v7

    move-object/from16 v24, v14

    move-object v4, v3

    :goto_2d0
    move-object v3, v15

    :goto_2d1
    move-object v2, v0

    :try_start_2d2
    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    move-object v5, v3

    move-object v2, v4

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object v3, v11

    move-object/from16 v22, v12

    move-object v10, v13

    :goto_2df
    move-object/from16 v25, v19

    move-object/from16 v19, v6

    :goto_2e3
    move/from16 v6, p1

    goto/16 :goto_cbc

    :cond_2e7
    move/from16 v17, v4

    move-object/from16 v19, v7

    move-object/from16 v24, v14

    const/4 v5, 0x2

    move-object v4, v3

    move-object v3, v15

    if-ne v2, v5, :cond_460

    const-string v5, "<total_count>([0-9]+)</total_count>[^<]+<page_count>([0-9]+)</page_count>[^<]+<data_count>([0-9]+)</data_count>"

    const/16 v7, 0x20

    invoke-static {v5, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v7, v19

    invoke-virtual {v5, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_300
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_32f

    const/4 v14, 0x1

    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v14

    const/4 v15, 0x2

    invoke-virtual {v5, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v18

    invoke-static/range {v18 .. v18}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    move-object/from16 v18, v13

    const/4 v13, 0x3

    invoke-virtual {v5, v13}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v19

    invoke-static/range {v19 .. v19}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v13

    if-eq v13, v14, :cond_329

    iget v13, v1, Le/e/a/e0;->j:I

    if-lt v13, v15, :cond_32c

    :cond_329
    const/4 v13, 0x0

    iput v13, v1, Le/e/a/e0;->i:I

    :cond_32c
    move-object/from16 v13, v18

    goto :goto_300

    :cond_32f
    move-object/from16 v18, v13

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget v13, v1, Le/e/a/e0;->i:I

    invoke-virtual {v5, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const-string v5, "<url>([^<]+)</url>[^<]*<thumbnail>([^<]+)</thumbnail>[^<]*<title>([^<]+)</title>[^<]*<view>([^<]+)</view>[^<]*<comment>([^<]+)</comment>[^<]*<mylist>([^<]+)</mylist>[^<]*<length>([^<]+)</length>[^<]*<time>([^<]+)</time>"

    const/16 v13, 0x20

    invoke-static {v5, v13}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_34d
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_44e

    new-instance v13, Le/e/a/x1;

    invoke-direct {v13}, Le/e/a/x1;-><init>()V

    const/4 v14, 0x1

    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v12, v15}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v14, 0x2

    invoke-virtual {v5, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v13, v10, v15}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v14, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const/4 v15, 0x7

    invoke-virtual {v5, v15}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-static {v15}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v1, v15}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v15, "</b>"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v14

    move-object/from16 v15, v24

    invoke-virtual {v13, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v14, v1, Le/e/a/e0;->p:Landroid/content/Context;

    move-object/from16 v23, v9

    const v9, 0x7f0f0212

    invoke-virtual {v14, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v14

    move-object/from16 v24, v15

    const/4 v9, 0x3

    new-array v15, v9, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v9

    move-object/from16 v19, v6

    const/4 v6, 0x4

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v6

    move-object/from16 v20, v7

    int-to-long v6, v6

    invoke-virtual {v9, v6, v7}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v15, v7

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    const/4 v7, 0x5

    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    move-object/from16 v21, v10

    int-to-long v9, v7

    invoke-virtual {v6, v9, v10}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v15, v7

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    const/4 v7, 0x6

    invoke-virtual {v5, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v9, v7

    invoke-virtual {v6, v9, v10}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    aput-object v6, v15, v7

    invoke-static {v14, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v13, v11, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v6, Ljava/text/SimpleDateFormat;

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v9, 0x7f0f004d

    invoke-virtual {v7, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/util/Date;

    const/16 v9, 0x8

    invoke-virtual {v5, v9}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    const-wide/16 v14, 0x3e8

    mul-long v9, v9, v14

    invoke-direct {v7, v9, v10}, Ljava/util/Date;-><init>(J)V

    iget-object v9, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v10, 0x7f0f020e

    invoke-virtual {v9, v10}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    new-array v14, v10, [Ljava/lang/Object;

    invoke-virtual {v6, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v14, v7

    invoke-static {v9, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v13, v3, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v6, 0x3

    invoke-virtual {v5, v6}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v8, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v4, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_444
    .catch Ljava/lang/Exception; {:try_start_2d2 .. :try_end_444} :catch_1453

    move-object/from16 v6, v19

    move-object/from16 v7, v20

    move-object/from16 v10, v21

    move-object/from16 v9, v23

    goto/16 :goto_34d

    :cond_44e
    move-object v5, v3

    move-object/from16 v19, v6

    move-object/from16 v25, v7

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object v3, v11

    move-object/from16 v22, v12

    move-object/from16 v10, v18

    move v6, v2

    move-object v2, v4

    goto/16 :goto_cbc

    :cond_460
    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object/from16 v18, v13

    move-object/from16 v20, v19

    const/4 v5, 0x3

    move-object/from16 v19, v6

    if-ne v2, v5, :cond_6ba

    :try_start_46d
    new-instance v5, Lorg/json/JSONObject;
    :try_end_46f
    .catch Lorg/json/JSONException; {:try_start_46d .. :try_end_46f} :catch_69d
    .catch Ljava/lang/Exception; {:try_start_46d .. :try_end_46f} :catch_1453

    move-object/from16 v6, v20

    :try_start_471
    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "data"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5
    :try_end_47a
    .catch Lorg/json/JSONException; {:try_start_471 .. :try_end_47a} :catch_698
    .catch Ljava/lang/Exception; {:try_start_471 .. :try_end_47a} :catch_1453

    move-object/from16 v7, v18

    :try_start_47c
    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v9, "items"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    const/4 v10, 0x0

    :goto_487
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v10, v13, :cond_66b

    invoke-virtual {v9, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lorg/json/JSONObject;

    const-string v14, "video"

    invoke-virtual {v13, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v14

    new-instance v15, Le/e/a/x1;

    invoke-direct {v15}, Le/e/a/x1;-><init>()V

    move-object/from16 v18, v9

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_4a5
    .catch Lorg/json/JSONException; {:try_start_47c .. :try_end_4a5} :catch_693
    .catch Ljava/lang/Exception; {:try_start_47c .. :try_end_4a5} :catch_1453

    move-object/from16 v20, v6

    :try_start_4a7
    const-string v6, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "id"

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15, v12, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_4bc
    .catch Lorg/json/JSONException; {:try_start_4a7 .. :try_end_4bc} :catch_668
    .catch Ljava/lang/Exception; {:try_start_4a7 .. :try_end_4bc} :catch_1453

    move-object/from16 v6, v21

    :try_start_4be
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9
    :try_end_4c2
    .catch Lorg/json/JSONException; {:try_start_4be .. :try_end_4c2} :catch_663
    .catch Ljava/lang/Exception; {:try_start_4be .. :try_end_4c2} :catch_1453

    move-object/from16 v21, v12

    :try_start_4c4
    const-string v12, "url"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v15, v6, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_4d2
    .catch Lorg/json/JSONException; {:try_start_4c4 .. :try_end_4d2} :catch_65e
    .catch Ljava/lang/Exception; {:try_start_4c4 .. :try_end_4d2} :catch_1453

    move-object/from16 v12, v19

    :try_start_4d4
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_4d7
    .catch Lorg/json/JSONException; {:try_start_4d4 .. :try_end_4d7} :catch_657
    .catch Ljava/lang/Exception; {:try_start_4d4 .. :try_end_4d7} :catch_1453

    move-object/from16 v19, v12

    :try_start_4d9
    const-string v12, "duration"

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12

    invoke-virtual {v1, v12}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v12

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v12, "</b>"

    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v9
    :try_end_4f3
    .catch Lorg/json/JSONException; {:try_start_4d9 .. :try_end_4f3} :catch_65e
    .catch Ljava/lang/Exception; {:try_start_4d9 .. :try_end_4f3} :catch_1453

    move-object/from16 v12, v24

    :try_start_4f5
    invoke-virtual {v15, v12, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9
    :try_end_4fe
    .catch Lorg/json/JSONException; {:try_start_4f5 .. :try_end_4fe} :catch_650
    .catch Ljava/lang/Exception; {:try_start_4f5 .. :try_end_4fe} :catch_1453

    if-eqz v9, :cond_54a

    :try_start_500
    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_54a

    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_50e
    .catch Lorg/json/JSONException; {:try_start_500 .. :try_end_50e} :catch_545
    .catch Ljava/lang/Exception; {:try_start_500 .. :try_end_50e} :catch_1453

    move-object/from16 v13, v23

    :try_start_510
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22
    :try_end_514
    .catch Lorg/json/JSONException; {:try_start_510 .. :try_end_514} :catch_53e
    .catch Ljava/lang/Exception; {:try_start_510 .. :try_end_514} :catch_1453

    if-nez v22, :cond_539

    move-object/from16 v23, v13

    :try_start_518
    const-string v13, "\n"
    :try_end_51a
    .catch Lorg/json/JSONException; {:try_start_518 .. :try_end_51a} :catch_545
    .catch Ljava/lang/Exception; {:try_start_518 .. :try_end_51a} :catch_1453

    move-object/from16 v24, v12

    :try_start_51c
    const-string v12, "<br>"

    invoke-virtual {v9, v13, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "<br><font color=\'#000000\'> <b>"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "</b></font>"

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    goto :goto_54e

    :cond_539
    move-object/from16 v24, v12

    move-object/from16 v23, v13

    goto :goto_54c

    :catch_53e
    move-exception v0

    move-object/from16 v24, v12

    move-object/from16 v23, v13

    goto/16 :goto_65f

    :catch_545
    move-exception v0

    move-object/from16 v24, v12

    goto/16 :goto_65f

    :cond_54a
    move-object/from16 v24, v12

    :goto_54c
    move-object/from16 v9, v23

    :goto_54e
    const-string v12, "count"

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_559
    .catch Lorg/json/JSONException; {:try_start_51c .. :try_end_559} :catch_65e
    .catch Ljava/lang/Exception; {:try_start_51c .. :try_end_559} :catch_1453

    move-object/from16 v22, v6

    :try_start_55b
    iget-object v6, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v2, 0x7f0f0212

    invoke-virtual {v6, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    move-object/from16 v25, v5

    const/4 v2, 0x3

    new-array v5, v2, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    move/from16 v26, v10

    const-string v10, "view"

    invoke-virtual {v12, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10
    :try_end_575
    .catch Lorg/json/JSONException; {:try_start_55b .. :try_end_575} :catch_64c
    .catch Ljava/lang/Exception; {:try_start_55b .. :try_end_575} :catch_1453

    move-object/from16 v27, v3

    move-object/from16 v28, v4

    int-to-long v3, v10

    :try_start_57a
    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v5, v3

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    const-string v3, "comment"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v5, v3

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v5, v3

    invoke-static {v6, v5}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v15, v11, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawplay"

    const-string v3, "view"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawres"

    const-string v3, "comment"

    invoke-virtual {v12, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v2, "rawmylis"

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-virtual {v15, v2, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v3, Ljava/text/SimpleDateFormat;

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v5, 0x7f0f004d

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v4, "registeredAt"

    invoke-virtual {v14, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v2

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v5, 0x7f0f020e

    invoke-virtual {v4, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    new-array v6, v5, [Ljava/lang/Object;

    invoke-virtual {v3, v2}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v6, v3

    invoke-static {v4, v6}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2
    :try_end_61d
    .catch Lorg/json/JSONException; {:try_start_57a .. :try_end_61d} :catch_645
    .catch Ljava/lang/Exception; {:try_start_57a .. :try_end_61d} :catch_1453

    move-object/from16 v3, v27

    :try_start_61f
    invoke-virtual {v15, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_62d
    .catch Lorg/json/JSONException; {:try_start_61f .. :try_end_62d} :catch_643
    .catch Ljava/lang/Exception; {:try_start_61f .. :try_end_62d} :catch_1453

    move-object/from16 v2, v28

    :try_start_62f
    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v26, 0x1

    move-object v4, v2

    move-object/from16 v9, v18

    move-object/from16 v6, v20

    move-object/from16 v12, v21

    move-object/from16 v21, v22

    move-object/from16 v5, v25

    move/from16 v2, p1

    goto/16 :goto_487

    :catch_643
    move-exception v0

    goto :goto_648

    :catch_645
    move-exception v0

    move-object/from16 v3, v27

    :goto_648
    move-object/from16 v2, v28

    goto/16 :goto_6a5

    :catch_64c
    move-exception v0

    move-object v2, v4

    goto/16 :goto_6a5

    :catch_650
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    move-object/from16 v24, v12

    goto :goto_6a5

    :catch_657
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    move-object/from16 v19, v12

    goto :goto_6a5

    :catch_65e
    move-exception v0

    :goto_65f
    move-object v2, v4

    move-object/from16 v22, v6

    goto :goto_6a5

    :catch_663
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    goto :goto_6a3

    :catch_668
    move-exception v0

    move-object v2, v4

    goto :goto_6a1

    :cond_66b
    move-object v2, v4

    move-object/from16 v25, v5

    move-object/from16 v20, v6

    move-object/from16 v22, v21

    move-object/from16 v21, v12

    iget-object v4, v1, Le/e/a/e0;->e:Ljava/util/HashMap;

    const-string v5, "name"

    const-string v6, "name"

    move-object/from16 v9, v25

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v4, v1, Le/e/a/e0;->e:Ljava/util/HashMap;

    const-string v5, "description"

    const-string v6, "description"

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v5, v6}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_690
    .catch Lorg/json/JSONException; {:try_start_62f .. :try_end_690} :catch_691
    .catch Ljava/lang/Exception; {:try_start_62f .. :try_end_690} :catch_1453

    goto :goto_6a9

    :catch_691
    move-exception v0

    goto :goto_6a5

    :catch_693
    move-exception v0

    move-object v2, v4

    move-object/from16 v20, v6

    goto :goto_6a1

    :catch_698
    move-exception v0

    move-object v2, v4

    move-object/from16 v20, v6

    goto :goto_69f

    :catch_69d
    move-exception v0

    move-object v2, v4

    :goto_69f
    move-object/from16 v7, v18

    :goto_6a1
    move-object/from16 v22, v21

    :goto_6a3
    move-object/from16 v21, v12

    :goto_6a5
    move-object v4, v0

    :try_start_6a6
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    :goto_6a9
    new-instance v4, Le/e/a/e0$g;

    invoke-direct {v4, v1}, Le/e/a/e0$g;-><init>(Le/e/a/e0;)V

    invoke-static {v2, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_6b1
    .catch Ljava/lang/Exception; {:try_start_6a6 .. :try_end_6b1} :catch_1453

    move/from16 v6, p1

    move-object v5, v3

    move-object v10, v7

    move-object v3, v11

    move-object/from16 v25, v20

    goto/16 :goto_8e6

    :cond_6ba
    move-object v2, v4

    move-object/from16 v7, v18

    move-object/from16 v22, v21

    move-object/from16 v21, v12

    const/4 v4, 0x4

    move/from16 v5, p1

    if-ne v5, v4, :cond_8ee

    :try_start_6c6
    new-instance v4, Lorg/json/JSONObject;
    :try_end_6c8
    .catch Lorg/json/JSONException; {:try_start_6c6 .. :try_end_6c8} :catch_8d7
    .catch Ljava/text/ParseException; {:try_start_6c6 .. :try_end_6c8} :catch_8d5
    .catch Ljava/lang/Exception; {:try_start_6c6 .. :try_end_6c8} :catch_1453

    move-object/from16 v6, v20

    :try_start_6ca
    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "data"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    :goto_6da
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_8c2

    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lorg/json/JSONObject;

    const-string v12, "video"

    invoke-virtual {v10, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    new-instance v13, Le/e/a/x1;

    invoke-direct {v13}, Le/e/a/x1;-><init>()V

    invoke-static {v13, v12, v10}, Le/e/a/HistorySupport;->capture(Ljava/lang/Object;Lorg/json/JSONObject;Lorg/json/JSONObject;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "id"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14
    :try_end_70b
    .catch Lorg/json/JSONException; {:try_start_6ca .. :try_end_70b} :catch_8cf
    .catch Ljava/text/ParseException; {:try_start_6ca .. :try_end_70b} :catch_8cd
    .catch Ljava/lang/Exception; {:try_start_6ca .. :try_end_70b} :catch_1453

    move-object/from16 v15, v21

    :try_start_70d
    invoke-virtual {v13, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_710
    .catch Lorg/json/JSONException; {:try_start_70d .. :try_end_710} :catch_8b9
    .catch Ljava/text/ParseException; {:try_start_70d .. :try_end_710} :catch_8b7
    .catch Ljava/lang/Exception; {:try_start_70d .. :try_end_710} :catch_1453

    move-object/from16 v18, v4

    move-object/from16 v14, v22

    :try_start_714
    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_718
    .catch Lorg/json/JSONException; {:try_start_714 .. :try_end_718} :catch_8ae
    .catch Ljava/text/ParseException; {:try_start_714 .. :try_end_718} :catch_8ac
    .catch Ljava/lang/Exception; {:try_start_714 .. :try_end_718} :catch_1453

    move-object/from16 v21, v15

    :try_start_71a
    const-string v15, "url"

    invoke-virtual {v4, v15}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v13, v14, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_728
    .catch Lorg/json/JSONException; {:try_start_71a .. :try_end_728} :catch_8a3
    .catch Ljava/text/ParseException; {:try_start_71a .. :try_end_728} :catch_8a1
    .catch Ljava/lang/Exception; {:try_start_71a .. :try_end_728} :catch_1453

    move-object/from16 v15, v19

    :try_start_72a
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_72d
    .catch Lorg/json/JSONException; {:try_start_72a .. :try_end_72d} :catch_896
    .catch Ljava/text/ParseException; {:try_start_72a .. :try_end_72d} :catch_894
    .catch Ljava/lang/Exception; {:try_start_72a .. :try_end_72d} :catch_1453

    move-object/from16 v19, v15

    :try_start_72f
    const-string v15, "duration"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v1, v15}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v15

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v15, "</b>"

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4
    :try_end_749
    .catch Lorg/json/JSONException; {:try_start_72f .. :try_end_749} :catch_8a3
    .catch Ljava/text/ParseException; {:try_start_72f .. :try_end_749} :catch_8a1
    .catch Ljava/lang/Exception; {:try_start_72f .. :try_end_749} :catch_1453

    move-object/from16 v15, v24

    :try_start_74b
    invoke-virtual {v13, v15, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;
    :try_end_750
    .catch Lorg/json/JSONException; {:try_start_74b .. :try_end_750} :catch_888
    .catch Ljava/text/ParseException; {:try_start_74b .. :try_end_750} :catch_886
    .catch Ljava/lang/Exception; {:try_start_74b .. :try_end_750} :catch_1453

    move-object/from16 v24, v15

    :try_start_752
    const-string v15, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v15}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v15, Ljava/text/SimpleDateFormat;
    :try_end_759
    .catch Lorg/json/JSONException; {:try_start_752 .. :try_end_759} :catch_8a3
    .catch Ljava/text/ParseException; {:try_start_752 .. :try_end_759} :catch_8a1
    .catch Ljava/lang/Exception; {:try_start_752 .. :try_end_759} :catch_1453

    move-object/from16 v22, v14

    :try_start_75b
    iget-object v14, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_75d
    .catch Lorg/json/JSONException; {:try_start_75b .. :try_end_75d} :catch_8cf
    .catch Ljava/text/ParseException; {:try_start_75b .. :try_end_75d} :catch_8cd
    .catch Ljava/lang/Exception; {:try_start_75b .. :try_end_75d} :catch_1453

    move-object/from16 v20, v6

    const v6, 0x7f0f004d

    :try_start_762
    invoke-virtual {v14, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v15, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v6, "registeredAt"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v6

    const-string v14, "viewedAt"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v4, v14}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    iget-object v14, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v5, 0x7f0f0215

    invoke-virtual {v14, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    move/from16 v25, v9

    const/4 v14, 0x2

    new-array v9, v14, [Ljava/lang/Object;

    invoke-virtual {v15, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    const/4 v14, 0x0

    aput-object v4, v9, v14

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "views"

    invoke-virtual {v10, v14}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_7a0
    .catch Lorg/json/JSONException; {:try_start_762 .. :try_end_7a0} :catch_8d7
    .catch Ljava/text/ParseException; {:try_start_762 .. :try_end_7a0} :catch_8d5
    .catch Ljava/lang/Exception; {:try_start_762 .. :try_end_7a0} :catch_1453

    move-object/from16 v10, v23

    :try_start_7a2
    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v14, 0x1

    aput-object v4, v9, v14

    invoke-static {v5, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "count"

    invoke-virtual {v12, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v9, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v14, 0x7f0f0212

    invoke-virtual {v9, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9
    :try_end_7cb
    .catch Lorg/json/JSONException; {:try_start_7a2 .. :try_end_7cb} :catch_87f
    .catch Ljava/text/ParseException; {:try_start_7a2 .. :try_end_7cb} :catch_87d
    .catch Ljava/lang/Exception; {:try_start_7a2 .. :try_end_7cb} :catch_1453

    move-object/from16 v23, v10

    const/4 v14, 0x3

    :try_start_7ce
    new-array v10, v14, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v14
    :try_end_7d4
    .catch Lorg/json/JSONException; {:try_start_7ce .. :try_end_7d4} :catch_8d7
    .catch Ljava/text/ParseException; {:try_start_7ce .. :try_end_7d4} :catch_8d5
    .catch Ljava/lang/Exception; {:try_start_7ce .. :try_end_7d4} :catch_1453

    move-object/from16 v27, v3

    :try_start_7d6
    const-string v3, "view"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3
    :try_end_7dc
    .catch Lorg/json/JSONException; {:try_start_7d6 .. :try_end_7dc} :catch_87a
    .catch Ljava/text/ParseException; {:try_start_7d6 .. :try_end_7dc} :catch_877
    .catch Ljava/lang/Exception; {:try_start_7d6 .. :try_end_7dc} :catch_1453

    move-object/from16 v28, v2

    int-to-long v2, v3

    :try_start_7df
    invoke-virtual {v14, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v10, v3

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    const-string v3, "comment"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3
    :try_end_7f0
    .catch Lorg/json/JSONException; {:try_start_7df .. :try_end_7f0} :catch_871
    .catch Ljava/text/ParseException; {:try_start_7df .. :try_end_7f0} :catch_86f
    .catch Ljava/lang/Exception; {:try_start_7df .. :try_end_7f0} :catch_1453

    move-object v14, v11

    move-object/from16 v26, v12

    int-to-long v11, v3

    :try_start_7f4
    invoke-virtual {v2, v11, v12}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    aput-object v2, v10, v3

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3

    int-to-long v3, v3

    invoke-virtual {v2, v3, v4}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x2

    aput-object v2, v10, v3

    invoke-static {v9, v10}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "</b><br>"

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v3, 0x7f0f020e

    invoke-virtual {v2, v3}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x1

    new-array v4, v3, [Ljava/lang/Object;

    invoke-virtual {v15, v6}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    const/4 v6, 0x0

    aput-object v3, v4, v6

    invoke-static {v2, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2

    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v2
    :try_end_83d
    .catch Lorg/json/JSONException; {:try_start_7f4 .. :try_end_83d} :catch_86c
    .catch Ljava/text/ParseException; {:try_start_7f4 .. :try_end_83d} :catch_86a
    .catch Ljava/lang/Exception; {:try_start_7f4 .. :try_end_83d} :catch_1453

    move-object v3, v14

    :try_start_83e
    invoke-virtual {v13, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v2, v26

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_84e
    .catch Lorg/json/JSONException; {:try_start_83e .. :try_end_84e} :catch_868
    .catch Ljava/text/ParseException; {:try_start_83e .. :try_end_84e} :catch_866
    .catch Ljava/lang/Exception; {:try_start_83e .. :try_end_84e} :catch_1453

    move-object/from16 v2, v28

    :try_start_850
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_853
    .catch Lorg/json/JSONException; {:try_start_850 .. :try_end_853} :catch_863
    .catch Ljava/text/ParseException; {:try_start_850 .. :try_end_853} :catch_860
    .catch Ljava/lang/Exception; {:try_start_850 .. :try_end_853} :catch_1453

    add-int/lit8 v9, v25, 0x1

    move/from16 v5, p1

    move-object v11, v3

    move-object/from16 v4, v18

    move-object/from16 v6, v20

    move-object/from16 v3, v27

    goto/16 :goto_6da

    :catch_860
    move-exception v0

    goto/16 :goto_8db

    :catch_863
    move-exception v0

    goto/16 :goto_8db

    :catch_866
    move-exception v0

    goto :goto_873

    :catch_868
    move-exception v0

    goto :goto_873

    :catch_86a
    move-exception v0

    goto :goto_86d

    :catch_86c
    move-exception v0

    :goto_86d
    move-object v3, v14

    goto :goto_873

    :catch_86f
    move-exception v0

    goto :goto_872

    :catch_871
    move-exception v0

    :goto_872
    move-object v3, v11

    :goto_873
    move-object/from16 v2, v28

    goto/16 :goto_8db

    :catch_877
    move-exception v0

    goto/16 :goto_8da

    :catch_87a
    move-exception v0

    goto/16 :goto_8da

    :catch_87d
    move-exception v0

    goto :goto_880

    :catch_87f
    move-exception v0

    :goto_880
    move-object/from16 v27, v3

    move-object/from16 v23, v10

    goto/16 :goto_8da

    :catch_886
    move-exception v0

    goto :goto_889

    :catch_888
    move-exception v0

    :goto_889
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    move-object/from16 v24, v15

    goto/16 :goto_8db

    :catch_894
    move-exception v0

    goto :goto_897

    :catch_896
    move-exception v0

    :goto_897
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_8db

    :catch_8a1
    move-exception v0

    goto :goto_8a4

    :catch_8a3
    move-exception v0

    :goto_8a4
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    goto :goto_8db

    :catch_8ac
    move-exception v0

    goto :goto_8af

    :catch_8ae
    move-exception v0

    :goto_8af
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    goto :goto_8bf

    :catch_8b7
    move-exception v0

    goto :goto_8ba

    :catch_8b9
    move-exception v0

    :goto_8ba
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    :goto_8bf
    move-object/from16 v21, v15

    goto :goto_8db

    :cond_8c2
    move-object/from16 v27, v3

    move-object v3, v11

    move-object/from16 v25, v6

    move-object v10, v7

    move-object/from16 v5, v27

    move/from16 v6, p1

    goto :goto_8e6

    :catch_8cd
    move-exception v0

    goto :goto_8d0

    :catch_8cf
    move-exception v0

    :goto_8d0
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    goto :goto_8da

    :catch_8d5
    move-exception v0

    goto :goto_8d8

    :catch_8d7
    move-exception v0

    :goto_8d8
    move-object/from16 v27, v3

    :goto_8da
    move-object v3, v11

    :goto_8db
    move-object v4, v0

    :try_start_8dc
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V

    move/from16 v6, p1

    move-object v10, v7

    move-object/from16 v25, v20

    move-object/from16 v5, v27

    :goto_8e6
    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    goto/16 :goto_cbc

    :cond_8ee
    move-object/from16 v27, v3

    move-object v3, v11

    const/4 v4, 0x6

    move/from16 v5, p1

    if-ne v5, v4, :cond_af4

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loaddata / "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v6, v20

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_908
    .catch Ljava/lang/Exception; {:try_start_8dc .. :try_end_908} :catch_1453

    :try_start_908
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_915
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v9, v11, :cond_acd

    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    const-string v12, "total"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/json/JSONObject;

    const-string v13, "video"

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    new-instance v13, Le/e/a/x1;

    invoke-direct {v13}, Le/e/a/x1;-><init>()V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "id"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14
    :try_end_94d
    .catch Ljava/lang/Exception; {:try_start_908 .. :try_end_94d} :catch_add

    move-object/from16 v15, v21

    :try_start_94f
    invoke-virtual {v13, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v14, "thumbnailUrl"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14
    :try_end_958
    .catch Ljava/lang/Exception; {:try_start_94f .. :try_end_958} :catch_abf

    move-object/from16 v18, v4

    move-object/from16 v4, v22

    :try_start_95c
    invoke-virtual {v13, v4, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_964
    .catch Ljava/lang/Exception; {:try_start_95c .. :try_end_964} :catch_ab1

    move-object/from16 v20, v7

    move-object/from16 v7, v19

    :try_start_968
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_96b
    .catch Ljava/lang/Exception; {:try_start_968 .. :try_end_96b} :catch_aa9

    move-object/from16 v19, v7

    :try_start_96d
    const-string v7, "lengthInSeconds"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v7}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, "</b>"

    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7
    :try_end_987
    .catch Ljava/lang/Exception; {:try_start_96d .. :try_end_987} :catch_aa3

    move-object/from16 v14, v24

    :try_start_989
    invoke-virtual {v13, v14, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_98e
    .catch Ljava/lang/Exception; {:try_start_989 .. :try_end_98e} :catch_a9b

    move-object/from16 v24, v14

    const v14, 0x7f0f0212

    :try_start_993
    invoke-virtual {v7, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7
    :try_end_997
    .catch Ljava/lang/Exception; {:try_start_993 .. :try_end_997} :catch_aa3

    move-object/from16 v21, v4

    const/4 v14, 0x3

    :try_start_99a
    new-array v4, v14, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v14
    :try_end_9a0
    .catch Ljava/lang/Exception; {:try_start_99a .. :try_end_9a0} :catch_a99

    move-object/from16 v22, v15

    :try_start_9a2
    const-string v15, "viewCount"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15
    :try_end_9a8
    .catch Ljava/lang/Exception; {:try_start_9a2 .. :try_end_9a8} :catch_a95

    move-object/from16 v25, v6

    int-to-long v5, v15

    :try_start_9ab
    invoke-virtual {v14, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    aput-object v5, v4, v6

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v5

    const-string v6, "commentCount"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-long v14, v6

    invoke-virtual {v5, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v4, v6

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v5

    const-string v6, "myListCount"

    invoke-virtual {v12, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-long v14, v6

    invoke-virtual {v5, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v4, v6

    invoke-static {v7, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v13, v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawplay"

    const-string v5, "viewCount"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawres"

    const-string v5, "commentCount"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawmylis"

    const-string v5, "myListCount"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v13, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v5, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/text/SimpleDateFormat;

    iget-object v6, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v7, 0x7f0f004d

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v6, "firstRetrieve"

    invoke-virtual {v11, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    iget-object v6, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v7, 0x7f0f020e

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v12, v7, [Ljava/lang/Object;

    invoke-virtual {v5, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v12, v5

    invoke-static {v6, v12}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4
    :try_end_a4a
    .catch Ljava/lang/Exception; {:try_start_9ab .. :try_end_a4a} :catch_a93

    move-object/from16 v5, v27

    :try_start_a4c
    invoke-virtual {v13, v5, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v13, v8, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v4, 0x1

    add-int/2addr v10, v4

    const-string v4, "rank"

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_a66
    .catch Ljava/lang/Exception; {:try_start_a4c .. :try_end_a66} :catch_a8e

    move-object/from16 v7, v23

    :try_start_a68
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v4, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_a75
    .catch Ljava/lang/Exception; {:try_start_a68 .. :try_end_a75} :catch_a8b

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v27, v5

    move-object/from16 v23, v7

    move-object/from16 v4, v18

    move-object/from16 v7, v20

    move-object/from16 v6, v25

    move/from16 v5, p1

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    goto/16 :goto_915

    :catch_a8b
    move-exception v0

    goto/16 :goto_aec

    :catch_a8e
    move-exception v0

    move-object/from16 v7, v23

    goto/16 :goto_aec

    :catch_a93
    move-exception v0

    goto :goto_aba

    :catch_a95
    move-exception v0

    move-object/from16 v25, v6

    goto :goto_aba

    :catch_a99
    move-exception v0

    goto :goto_aa6

    :catch_a9b
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v24, v14

    goto :goto_ab8

    :catch_aa3
    move-exception v0

    move-object/from16 v21, v4

    :goto_aa6
    move-object/from16 v25, v6

    goto :goto_ab8

    :catch_aa9
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v19, v7

    goto :goto_ab8

    :catch_ab1
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    :goto_ab8
    move-object/from16 v22, v15

    :goto_aba
    move-object/from16 v7, v23

    move-object/from16 v5, v27

    goto :goto_aec

    :catch_abf
    move-exception v0

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    move-object/from16 v21, v22

    move-object/from16 v7, v23

    move-object/from16 v5, v27

    move-object/from16 v22, v15

    goto :goto_aec

    :cond_acd
    move-object/from16 v20, v7

    move-object/from16 v5, v27

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    move-object/from16 v25, v6

    move-object/from16 v10, v20

    goto/16 :goto_2e3

    :catch_add
    move-exception v0

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    move-object/from16 v7, v23

    move-object/from16 v5, v27

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    :goto_aec
    move-object v4, v0

    :try_start_aed
    invoke-virtual {v4}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_af0
    .catch Ljava/lang/Exception; {:try_start_aed .. :try_end_af0} :catch_1453

    move/from16 v6, p1

    goto/16 :goto_cb8

    :cond_af4
    move-object/from16 v25, v20

    move-object/from16 v5, v27

    move-object/from16 v20, v7

    move-object/from16 v7, v23

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    const/16 v4, 0xa

    move/from16 v6, p1

    if-ne v6, v4, :cond_cb8

    :try_start_b08
    new-instance v4, Lorg/json/JSONObject;
    :try_end_b0a
    .catch Lorg/json/JSONException; {:try_start_b08 .. :try_end_b0a} :catch_ca6
    .catch Ljava/lang/Exception; {:try_start_b08 .. :try_end_b0a} :catch_1453

    move-object/from16 v9, v25

    :try_start_b0c
    invoke-direct {v4, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "data"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v10, "items"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v10, 0x0

    :goto_b1c
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v10, v11, :cond_c99

    invoke-virtual {v4, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    const-string v12, "essential"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    new-instance v12, Le/e/a/x1;

    invoke-direct {v12}, Le/e/a/x1;-><init>()V

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "id"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13
    :try_end_b4a
    .catch Lorg/json/JSONException; {:try_start_b0c .. :try_end_b4a} :catch_ca0
    .catch Ljava/lang/Exception; {:try_start_b0c .. :try_end_b4a} :catch_1453

    move-object/from16 v14, v22

    :try_start_b4c
    invoke-virtual {v12, v14, v13}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_b4f
    .catch Lorg/json/JSONException; {:try_start_b4c .. :try_end_b4f} :catch_c91
    .catch Ljava/lang/Exception; {:try_start_b4c .. :try_end_b4f} :catch_1453

    move-object/from16 v13, v21

    :try_start_b51
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v18, v4

    const-string v4, "url"

    invoke-virtual {v15, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v12, v13, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_b65
    .catch Lorg/json/JSONException; {:try_start_b51 .. :try_end_b65} :catch_c89
    .catch Ljava/lang/Exception; {:try_start_b51 .. :try_end_b65} :catch_1453

    move-object/from16 v15, v19

    :try_start_b67
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_b6a
    .catch Lorg/json/JSONException; {:try_start_b67 .. :try_end_b6a} :catch_c7d
    .catch Ljava/lang/Exception; {:try_start_b67 .. :try_end_b6a} :catch_1453

    move-object/from16 v23, v7

    :try_start_b6c
    const-string v7, "duration"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-virtual {v1, v7}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, "</b>"

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4
    :try_end_b86
    .catch Lorg/json/JSONException; {:try_start_b6c .. :try_end_b86} :catch_c7b
    .catch Ljava/lang/Exception; {:try_start_b6c .. :try_end_b86} :catch_1453

    move-object/from16 v7, v24

    :try_start_b88
    invoke-virtual {v12, v7, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "count"

    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_b91
    .catch Lorg/json/JSONException; {:try_start_b88 .. :try_end_b91} :catch_c77
    .catch Ljava/lang/Exception; {:try_start_b88 .. :try_end_b91} :catch_1453

    move-object/from16 v24, v7

    :try_start_b93
    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_b95
    .catch Lorg/json/JSONException; {:try_start_b93 .. :try_end_b95} :catch_c7b
    .catch Ljava/lang/Exception; {:try_start_b93 .. :try_end_b95} :catch_1453

    move-object/from16 v19, v15

    const v15, 0x7f0f0212

    :try_start_b9a
    invoke-virtual {v7, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7
    :try_end_b9e
    .catch Lorg/json/JSONException; {:try_start_b9a .. :try_end_b9e} :catch_c75
    .catch Ljava/lang/Exception; {:try_start_b9a .. :try_end_b9e} :catch_1453

    move-object/from16 v21, v13

    const/4 v15, 0x3

    :try_start_ba1
    new-array v13, v15, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v15
    :try_end_ba7
    .catch Lorg/json/JSONException; {:try_start_ba1 .. :try_end_ba7} :catch_c73
    .catch Ljava/lang/Exception; {:try_start_ba1 .. :try_end_ba7} :catch_1453

    move-object/from16 v22, v14

    :try_start_ba9
    const-string v14, "view"

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14
    :try_end_baf
    .catch Lorg/json/JSONException; {:try_start_ba9 .. :try_end_baf} :catch_c71
    .catch Ljava/lang/Exception; {:try_start_ba9 .. :try_end_baf} :catch_1453

    move-object/from16 v25, v9

    move/from16 v26, v10

    int-to-long v9, v14

    :try_start_bb4
    invoke-virtual {v15, v9, v10}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x0

    aput-object v9, v13, v10

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v9

    const-string v10, "comment"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    int-to-long v14, v10

    invoke-virtual {v9, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v9

    const/4 v10, 0x1

    aput-object v9, v13, v10

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v9
    :try_end_bd1
    .catch Lorg/json/JSONException; {:try_start_bb4 .. :try_end_bd1} :catch_c6f
    .catch Ljava/lang/Exception; {:try_start_bb4 .. :try_end_bd1} :catch_1453

    move-object/from16 v10, v20

    :try_start_bd3
    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14

    int-to-long v14, v14

    invoke-virtual {v9, v14, v15}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v9

    const/4 v14, 0x2

    aput-object v9, v13, v14

    invoke-static {v7, v13}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v12, v3, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "rawplay"

    const-string v9, "view"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v12, v7, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "rawres"

    const-string v9, "comment"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    invoke-virtual {v12, v7, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "rawmylis"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v12, v7, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v7, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v7, Ljava/text/SimpleDateFormat;

    iget-object v9, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v13, 0x7f0f004d

    invoke-virtual {v9, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-direct {v7, v9}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v9, "registeredAt"

    invoke-virtual {v11, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v9}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    iget-object v9, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v13, 0x7f0f020e

    invoke-virtual {v9, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v9

    const/4 v13, 0x1

    new-array v14, v13, [Ljava/lang/Object;

    invoke-virtual {v7, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    aput-object v4, v14, v7

    invoke-static {v9, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v12, v5, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v11, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v8, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_c60
    .catch Lorg/json/JSONException; {:try_start_bd3 .. :try_end_c60} :catch_c6d
    .catch Ljava/lang/Exception; {:try_start_bd3 .. :try_end_c60} :catch_1453

    add-int/lit8 v4, v26, 0x1

    move-object/from16 v20, v10

    move-object/from16 v7, v23

    move-object/from16 v9, v25

    move v10, v4

    move-object/from16 v4, v18

    goto/16 :goto_b1c

    :catch_c6d
    move-exception v0

    goto :goto_cab

    :catch_c6f
    move-exception v0

    goto :goto_ca9

    :catch_c71
    move-exception v0

    goto :goto_ca3

    :catch_c73
    move-exception v0

    goto :goto_c94

    :catch_c75
    move-exception v0

    goto :goto_c8c

    :catch_c77
    move-exception v0

    move-object/from16 v24, v7

    goto :goto_c80

    :catch_c7b
    move-exception v0

    goto :goto_c80

    :catch_c7d
    move-exception v0

    move-object/from16 v23, v7

    :goto_c80
    move-object/from16 v25, v9

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_ca9

    :catch_c89
    move-exception v0

    move-object/from16 v23, v7

    :goto_c8c
    move-object/from16 v25, v9

    move-object/from16 v21, v13

    goto :goto_c96

    :catch_c91
    move-exception v0

    move-object/from16 v23, v7

    :goto_c94
    move-object/from16 v25, v9

    :goto_c96
    move-object/from16 v22, v14

    goto :goto_ca9

    :cond_c99
    move-object/from16 v23, v7

    move-object/from16 v25, v9

    move-object/from16 v10, v20

    goto :goto_caf

    :catch_ca0
    move-exception v0

    move-object/from16 v23, v7

    :goto_ca3
    move-object/from16 v25, v9

    goto :goto_ca9

    :catch_ca6
    move-exception v0

    move-object/from16 v23, v7

    :goto_ca9
    move-object/from16 v10, v20

    :goto_cab
    move-object v4, v0

    :try_start_cac
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    :goto_caf
    new-instance v4, Le/e/a/e0$h;

    invoke-direct {v4, v1}, Le/e/a/e0$h;-><init>(Le/e/a/e0;)V

    invoke-static {v2, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_cb7
    .catch Ljava/lang/Exception; {:try_start_cac .. :try_end_cb7} :catch_1453

    goto :goto_cbc

    :cond_cb8
    :goto_cb8
    move-object/from16 v23, v7

    move-object/from16 v10, v20

    :goto_cbc
    const/16 v4, 0xd

    if-ne v6, v4, :cond_e57

    :try_start_cc0
    new-instance v4, Lorg/json/JSONObject;
    :try_end_cc2
    .catch Lorg/json/JSONException; {:try_start_cc0 .. :try_end_cc2} :catch_e4e
    .catch Ljava/lang/Exception; {:try_start_cc0 .. :try_end_cc2} :catch_1453

    move-object/from16 v7, v25

    :try_start_cc4
    invoke-direct {v4, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "data"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    :goto_cd4
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v9, v11, :cond_e45

    invoke-virtual {v4, v9}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lorg/json/JSONObject;

    const-string v12, "content"

    invoke-virtual {v11, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v11

    new-instance v12, Le/e/a/x1;

    invoke-direct {v12}, Le/e/a/x1;-><init>()V

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "id"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13
    :try_end_d02
    .catch Lorg/json/JSONException; {:try_start_cc4 .. :try_end_d02} :catch_e49
    .catch Ljava/lang/Exception; {:try_start_cc4 .. :try_end_d02} :catch_1453

    move-object/from16 v14, v22

    :try_start_d04
    invoke-virtual {v12, v14, v13}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_d07
    .catch Lorg/json/JSONException; {:try_start_d04 .. :try_end_d07} :catch_e3e
    .catch Ljava/lang/Exception; {:try_start_d04 .. :try_end_d07} :catch_1453

    move-object/from16 v13, v21

    :try_start_d09
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v18, v4

    const-string v4, "url"

    invoke-virtual {v15, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v12, v13, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_d1d
    .catch Lorg/json/JSONException; {:try_start_d09 .. :try_end_d1d} :catch_e36
    .catch Ljava/lang/Exception; {:try_start_d09 .. :try_end_d1d} :catch_1453

    move-object/from16 v15, v19

    :try_start_d1f
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_d22
    .catch Lorg/json/JSONException; {:try_start_d1f .. :try_end_d22} :catch_e2c
    .catch Ljava/lang/Exception; {:try_start_d1f .. :try_end_d22} :catch_1453

    move-object/from16 v19, v15

    :try_start_d24
    const-string v15, "duration"

    invoke-virtual {v11, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15

    invoke-virtual {v1, v15}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v15

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v15, "</b>"

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4
    :try_end_d3e
    .catch Lorg/json/JSONException; {:try_start_d24 .. :try_end_d3e} :catch_e36
    .catch Ljava/lang/Exception; {:try_start_d24 .. :try_end_d3e} :catch_1453

    move-object/from16 v15, v24

    :try_start_d40
    invoke-virtual {v12, v15, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "count"

    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_d49
    .catch Lorg/json/JSONException; {:try_start_d40 .. :try_end_d49} :catch_e22
    .catch Ljava/lang/Exception; {:try_start_d40 .. :try_end_d49} :catch_1453

    move-object/from16 v24, v15

    :try_start_d4b
    iget-object v15, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_d4d
    .catch Lorg/json/JSONException; {:try_start_d4b .. :try_end_d4d} :catch_e36
    .catch Ljava/lang/Exception; {:try_start_d4b .. :try_end_d4d} :catch_1453

    move-object/from16 v21, v13

    const v13, 0x7f0f0212

    :try_start_d52
    invoke-virtual {v15, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15
    :try_end_d56
    .catch Lorg/json/JSONException; {:try_start_d52 .. :try_end_d56} :catch_e3e
    .catch Ljava/lang/Exception; {:try_start_d52 .. :try_end_d56} :catch_1453

    move-object/from16 v22, v14

    const/4 v13, 0x3

    :try_start_d59
    new-array v14, v13, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v13
    :try_end_d5f
    .catch Lorg/json/JSONException; {:try_start_d59 .. :try_end_d5f} :catch_e49
    .catch Ljava/lang/Exception; {:try_start_d59 .. :try_end_d5f} :catch_1453

    move-object/from16 v20, v7

    :try_start_d61
    const-string v7, "view"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v6, v7

    invoke-virtual {v13, v6, v7}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    aput-object v6, v14, v7

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    const-string v7, "comment"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7
    :try_end_d79
    .catch Lorg/json/JSONException; {:try_start_d61 .. :try_end_d79} :catch_e20
    .catch Ljava/lang/Exception; {:try_start_d61 .. :try_end_d79} :catch_1453

    move-object v13, v8

    int-to-long v7, v7

    :try_start_d7b
    invoke-virtual {v6, v7, v8}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    aput-object v6, v14, v7

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    int-to-long v7, v7

    invoke-virtual {v6, v7, v8}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x2

    aput-object v6, v14, v7

    invoke-static {v15, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v6

    invoke-virtual {v12, v3, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v6, "rawplay"

    const-string v7, "view"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v12, v6, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v6, "rawres"

    const-string v7, "comment"

    invoke-virtual {v4, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v12, v6, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v6, "rawmylis"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {v12, v6, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v6, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v6}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/text/SimpleDateFormat;

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v8, 0x7f0f004d

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v7, "registeredAt"

    invoke-virtual {v11, v7}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v4, v7}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v4

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v8, 0x7f0f020e

    invoke-virtual {v7, v8}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v8, 0x1

    new-array v14, v8, [Ljava/lang/Object;

    invoke-virtual {v6, v4}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x0

    aput-object v4, v14, v6

    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v12, v5, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v12, v13, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e13
    .catch Lorg/json/JSONException; {:try_start_d7b .. :try_end_e13} :catch_e1e
    .catch Ljava/lang/Exception; {:try_start_d7b .. :try_end_e13} :catch_1453

    add-int/lit8 v9, v9, 0x1

    move/from16 v6, p1

    move-object v8, v13

    move-object/from16 v4, v18

    move-object/from16 v7, v20

    goto/16 :goto_cd4

    :catch_e1e
    move-exception v0

    goto :goto_e52

    :catch_e20
    move-exception v0

    goto :goto_e4c

    :catch_e22
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v24, v15

    goto :goto_e4c

    :catch_e2c
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_e4c

    :catch_e36
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    goto :goto_e4c

    :catch_e3e
    move-exception v0

    move-object/from16 v20, v7

    move-object v13, v8

    move-object/from16 v22, v14

    goto :goto_e52

    :cond_e45
    move-object/from16 v20, v7

    move-object v13, v8

    goto :goto_e5a

    :catch_e49
    move-exception v0

    move-object/from16 v20, v7

    :goto_e4c
    move-object v13, v8

    goto :goto_e52

    :catch_e4e
    move-exception v0

    move-object v13, v8

    move-object/from16 v20, v25

    :goto_e52
    move-object v4, v0

    :try_start_e53
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    goto :goto_e5a

    :cond_e57
    move-object v13, v8

    move-object/from16 v20, v25

    :goto_e5a
    const/16 v4, 0xe

    move/from16 v6, p1

    if-ne v6, v4, :cond_10f6

    iget-object v4, v1, Le/e/a/e0;->b:Ljava/lang/String;

    const-string v7, "https?://www.nicovideo.jp/recommendations.*?"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_eba

    const-string v4, "user_tag_param: \"([^\"]+)\","

    const/16 v7, 0x20

    invoke-static {v4, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    move-object/from16 v7, v20

    invoke-virtual {v4, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object/from16 v9, v23

    :goto_e7a
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_e86

    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_e7a

    :cond_e86
    const-string v4, "first_data:([^\n]+)\n"

    const/16 v8, 0x20

    invoke-static {v4, v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object/from16 v7, v23

    :goto_e94
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_ea0

    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_e94

    :cond_ea0
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "user_tag_param : "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " / "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_eb8
    .catch Ljava/lang/Exception; {:try_start_e53 .. :try_end_eb8} :catch_1453

    const/4 v4, 0x1

    goto :goto_ebf

    :cond_eba
    move-object/from16 v7, v20

    move-object/from16 v9, v23

    const/4 v4, 0x0

    :goto_ebf
    :try_start_ebf
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "recommend_info"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "page"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v1, Le/e/a/e0;->j:I
    :try_end_ed2
    .catch Lorg/json/JSONException; {:try_start_ebf .. :try_end_ed2} :catch_10e9
    .catch Ljava/lang/Exception; {:try_start_ebf .. :try_end_ed2} :catch_1453

    if-eqz v4, :cond_f15

    :try_start_ed4
    const-string v4, "seed"

    invoke-virtual {v10, v4}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v10

    invoke-static {v10, v11}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "https://www.nicovideo.jp/api/recommendations?user_tags="

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v9, "&seed="

    invoke-virtual {v10, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Le/e/a/e0;->b:Ljava/lang/String;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "baseurl : "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v9, v1, Le/e/a/e0;->b:Ljava/lang/String;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_f0b
    .catch Lorg/json/JSONException; {:try_start_ed4 .. :try_end_f0b} :catch_f0c
    .catch Ljava/lang/Exception; {:try_start_ed4 .. :try_end_f0b} :catch_1453

    goto :goto_f15

    :catch_f0c
    move-exception v0

    move-object v4, v0

    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    goto/16 :goto_10f0

    :cond_f15
    :goto_f15
    :try_start_f15
    const-string v4, "items"

    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v8, 0x0

    :goto_f1c
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_10e3

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    const-string v10, "item_type"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "video"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_10cf

    new-instance v10, Le/e/a/x1;

    invoke-direct {v10}, Le/e/a/x1;-><init>()V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "id"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11
    :try_end_f52
    .catch Lorg/json/JSONException; {:try_start_f15 .. :try_end_f52} :catch_10e9
    .catch Ljava/lang/Exception; {:try_start_f15 .. :try_end_f52} :catch_1453

    move-object/from16 v12, v22

    :try_start_f54
    invoke-virtual {v10, v12, v11}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v11, "thumbnail_url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11
    :try_end_f5d
    .catch Lorg/json/JSONException; {:try_start_f54 .. :try_end_f5d} :catch_10cb
    .catch Ljava/lang/Exception; {:try_start_f54 .. :try_end_f5d} :catch_1453

    move-object/from16 v14, v21

    :try_start_f5f
    invoke-virtual {v10, v14, v11}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_f67
    .catch Lorg/json/JSONException; {:try_start_f5f .. :try_end_f67} :catch_10c4
    .catch Ljava/lang/Exception; {:try_start_f5f .. :try_end_f67} :catch_1453

    move-object/from16 v15, v19

    :try_start_f69
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_f6c
    .catch Lorg/json/JSONException; {:try_start_f69 .. :try_end_f6c} :catch_10b9
    .catch Ljava/lang/Exception; {:try_start_f69 .. :try_end_f6c} :catch_1453

    move-object/from16 v18, v4

    move-object/from16 v19, v7

    move-object/from16 v4, v24

    :try_start_f72
    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v7, "</b>"

    invoke-virtual {v11, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v10, v4, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "additional_info"

    invoke-virtual {v9, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    const-string v11, "sherlock"

    invoke-virtual {v7, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v7

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_f9a
    .catch Lorg/json/JSONException; {:try_start_f72 .. :try_end_f9a} :catch_10b5
    .catch Ljava/lang/Exception; {:try_start_f72 .. :try_end_f9a} :catch_1453

    move-object/from16 v24, v4

    :try_start_f9c
    const-string v4, "<br><font color=\'#000000\'> <b>"

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "tag"

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "</b></font>"

    invoke-virtual {v11, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v11, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_fba
    .catch Lorg/json/JSONException; {:try_start_f9c .. :try_end_fba} :catch_10b3
    .catch Ljava/lang/Exception; {:try_start_f9c .. :try_end_fba} :catch_1453

    move-object/from16 v20, v15

    const v15, 0x7f0f0212

    :try_start_fbf
    invoke-virtual {v11, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11
    :try_end_fc3
    .catch Lorg/json/JSONException; {:try_start_fbf .. :try_end_fc3} :catch_10ac
    .catch Ljava/lang/Exception; {:try_start_fbf .. :try_end_fc3} :catch_1453

    move-object/from16 v21, v14

    const/4 v15, 0x3

    :try_start_fc6
    new-array v14, v15, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v15
    :try_end_fcc
    .catch Lorg/json/JSONException; {:try_start_fc6 .. :try_end_fcc} :catch_10a7
    .catch Ljava/lang/Exception; {:try_start_fc6 .. :try_end_fcc} :catch_1453

    move-object/from16 v22, v12

    :try_start_fce
    const-string v12, "view_counter"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12
    :try_end_fd4
    .catch Lorg/json/JSONException; {:try_start_fce .. :try_end_fd4} :catch_10a5
    .catch Ljava/lang/Exception; {:try_start_fce .. :try_end_fd4} :catch_1453

    move-object/from16 v25, v13

    int-to-long v12, v12

    :try_start_fd7
    invoke-virtual {v15, v12, v13}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    aput-object v12, v14, v13

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v12

    const-string v13, "num_res"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13
    :try_end_fe8
    .catch Lorg/json/JSONException; {:try_start_fd7 .. :try_end_fe8} :catch_10a0
    .catch Ljava/lang/Exception; {:try_start_fd7 .. :try_end_fe8} :catch_1453

    move-object/from16 v27, v5

    int-to-long v5, v13

    :try_start_feb
    invoke-virtual {v12, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x1

    aput-object v5, v14, v6

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v5

    const-string v6, "mylist_counter"

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v6

    int-to-long v12, v6

    invoke-virtual {v5, v12, v13}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x2

    aput-object v5, v14, v6

    invoke-static {v11, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v10, v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawplay"

    const-string v5, "view_counter"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawres"

    const-string v5, "num_res"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawmylis"

    const-string v5, "mylist_counter"

    invoke-virtual {v9, v5}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v10, v4, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;

    iget-object v5, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v6, 0x7f0f004d

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v5}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v5, Ljava/util/Date;

    const-string v6, "first_retrieve"

    invoke-virtual {v9, v6}, Lorg/json/JSONObject;->getLong(Ljava/lang/String;)J

    move-result-wide v6

    const-wide/16 v11, 0x3e8

    mul-long v6, v6, v11

    invoke-direct {v5, v6, v7}, Ljava/util/Date;-><init>(J)V

    iget-object v6, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v7, 0x7f0f020e

    invoke-virtual {v6, v7}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    new-array v11, v7, [Ljava/lang/Object;

    invoke-virtual {v4, v5}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    aput-object v4, v11, v5

    invoke-static {v6, v11}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4
    :try_end_107e
    .catch Lorg/json/JSONException; {:try_start_feb .. :try_end_107e} :catch_1099
    .catch Ljava/lang/Exception; {:try_start_feb .. :try_end_107e} :catch_1453

    move-object/from16 v5, v27

    :try_start_1080
    invoke-virtual {v10, v5, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "title_short"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_108d
    .catch Lorg/json/JSONException; {:try_start_1080 .. :try_end_108d} :catch_10a0
    .catch Ljava/lang/Exception; {:try_start_1080 .. :try_end_108d} :catch_1453

    move-object/from16 v6, v25

    :try_start_108f
    invoke-virtual {v10, v6, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1095
    .catch Lorg/json/JSONException; {:try_start_108f .. :try_end_1095} :catch_1096
    .catch Ljava/lang/Exception; {:try_start_108f .. :try_end_1095} :catch_1453

    goto :goto_10d6

    :catch_1096
    move-exception v0

    goto/16 :goto_10ef

    :catch_1099
    move-exception v0

    move-object/from16 v6, v25

    move-object/from16 v5, v27

    goto/16 :goto_10ef

    :catch_10a0
    move-exception v0

    move-object/from16 v6, v25

    goto/16 :goto_10ef

    :catch_10a5
    move-exception v0

    goto :goto_10aa

    :catch_10a7
    move-exception v0

    move-object/from16 v22, v12

    :goto_10aa
    move-object v6, v13

    goto :goto_10ef

    :catch_10ac
    move-exception v0

    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    goto :goto_10ef

    :catch_10b3
    move-exception v0

    goto :goto_10bc

    :catch_10b5
    move-exception v0

    move-object/from16 v24, v4

    goto :goto_10bc

    :catch_10b9
    move-exception v0

    move-object/from16 v19, v7

    :goto_10bc
    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    move-object/from16 v20, v15

    goto :goto_10ef

    :catch_10c4
    move-exception v0

    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    goto :goto_10eb

    :catch_10cb
    move-exception v0

    move-object/from16 v22, v12

    goto :goto_10ea

    :cond_10cf
    move-object/from16 v18, v4

    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    :goto_10d6
    add-int/lit8 v8, v8, 0x1

    move-object v13, v6

    move-object/from16 v4, v18

    move-object/from16 v7, v19

    move-object/from16 v19, v20

    move/from16 v6, p1

    goto/16 :goto_f1c

    :cond_10e3
    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    goto :goto_10f3

    :catch_10e9
    move-exception v0

    :goto_10ea
    move-object v6, v13

    :goto_10eb
    move-object/from16 v20, v19

    move-object/from16 v19, v7

    :goto_10ef
    move-object v4, v0

    :goto_10f0
    :try_start_10f0
    invoke-virtual {v4}, Lorg/json/JSONException;->printStackTrace()V

    :goto_10f3
    move-object/from16 v7, v19

    goto :goto_10fb

    :cond_10f6
    move-object v6, v13

    move-object/from16 v7, v20

    move-object/from16 v20, v19

    :goto_10fb
    const/16 v4, 0xc8

    move/from16 v8, p1

    if-ne v8, v4, :cond_1339

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "loaddata / "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_1111
    .catch Ljava/lang/Exception; {:try_start_10f0 .. :try_end_1111} :catch_1453

    :try_start_1111
    invoke-static {v7}, Le/d/b/b/e/n/r/b;->g(Ljava/lang/String;)Lj/a/d/g;

    move-result-object v4

    const-string v9, ".list-table"

    invoke-virtual {v4, v9}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v9, 0x0

    :goto_1120
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_1339

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lj/a/d/i;

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    const-string v12, "loaddata / "

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "data-watch_id"

    invoke-virtual {v10, v12}, Lj/a/d/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v11, Le/e/a/x1;

    invoke-direct {v11}, Le/e/a/x1;-><init>()V

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "data-watch_id"

    invoke-virtual {v10, v13}, Lj/a/d/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12
    :try_end_115e
    .catch Ljava/lang/Exception; {:try_start_1111 .. :try_end_115e} :catch_132f

    move-object/from16 v13, v22

    :try_start_1160
    invoke-virtual {v11, v13, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v12, ".video-item-thumbnail"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_116d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_1187

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lj/a/d/i;

    const-string v15, "data-original"

    invoke-virtual {v14, v15}, Lj/a/d/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14
    :try_end_117f
    .catch Ljava/lang/Exception; {:try_start_1160 .. :try_end_117f} :catch_132b

    move-object/from16 v15, v21

    :try_start_1181
    invoke-virtual {v11, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v21, v15

    goto :goto_116d

    :cond_1187
    move-object/from16 v15, v21

    const-string v12, ".video-item-time"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v14, v23

    :goto_1195
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_11a6

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lj/a/d/i;

    invoke-virtual {v14}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v14

    goto :goto_1195

    :cond_11a6
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v18, v4

    move-object/from16 v4, v20

    invoke-virtual {v12, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "</b>"

    invoke-virtual {v12, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-static {v12}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v12
    :try_end_11c2
    .catch Ljava/lang/Exception; {:try_start_1181 .. :try_end_11c2} :catch_1325

    move-object/from16 v14, v24

    :try_start_11c4
    invoke-virtual {v11, v14, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v12, ".video-item-metaData-view > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v19, v23

    :goto_11d3
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_11e4

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lj/a/d/i;

    invoke-virtual/range {v19 .. v19}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v19

    goto :goto_11d3

    :cond_11e4
    const-string v12, ".video-item-metaData-comment > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v20, v23

    :goto_11f0
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_1201

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lj/a/d/i;

    invoke-virtual/range {v20 .. v20}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v20

    goto :goto_11f0

    :cond_1201
    const-string v12, ".video-item-metaData-mylist > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v21, v23

    :goto_120d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_121e

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lj/a/d/i;

    invoke-virtual/range {v21 .. v21}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v21

    goto :goto_120d

    :cond_121e
    iget-object v12, v1, Le/e/a/e0;->p:Landroid/content/Context;

    move-object/from16 v22, v4

    const v4, 0x7f0f0212

    invoke-virtual {v12, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12
    :try_end_1229
    .catch Ljava/lang/Exception; {:try_start_11c4 .. :try_end_1229} :catch_131f

    move-object/from16 v24, v14

    const/4 v4, 0x3

    :try_start_122c
    new-array v14, v4, [Ljava/lang/Object;

    const/4 v4, 0x0

    aput-object v19, v14, v4

    const/4 v4, 0x1

    aput-object v20, v14, v4

    const/4 v4, 0x2

    aput-object v21, v14, v4

    invoke-static {v12, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawplay"

    const/4 v12, 0x0

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v11, v4, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawres"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v11, v4, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "rawmylis"

    invoke-static {v12}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v14

    invoke-virtual {v11, v4, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, ".video-item-date"

    invoke-virtual {v10, v4}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    move-object/from16 v12, v23

    :goto_126a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_127b

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lj/a/d/i;

    invoke-virtual {v12}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v12

    goto :goto_126a

    :cond_127b
    const-string v4, "[0-9]+/[0-9]+/[0-9]+"

    invoke-virtual {v12, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_12bb

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v14, "yyyy/MM/dd"

    invoke-direct {v4, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v14, Ljava/text/SimpleDateFormat;
    :try_end_128c
    .catch Ljava/lang/Exception; {:try_start_122c .. :try_end_128c} :catch_1325

    move-object/from16 v19, v3

    :try_start_128e
    const-string v3, "yyyy\u5e74MM\u6708dd\u65e5"

    invoke-direct {v14, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v12}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v12, 0x7f0f020e

    invoke-virtual {v4, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4
    :try_end_12a0
    .catch Ljava/lang/Exception; {:try_start_128e .. :try_end_12a0} :catch_12b8

    move-object/from16 v21, v15

    const/4 v12, 0x1

    :try_start_12a3
    new-array v15, v12, [Ljava/lang/Object;

    invoke-virtual {v14, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    const/4 v12, 0x0

    aput-object v3, v15, v12

    invoke-static {v4, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    :goto_12b4
    invoke-virtual {v11, v5, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_12ed

    :catch_12b8
    move-exception v0

    goto/16 :goto_1328

    :cond_12bb
    move-object/from16 v19, v3

    move-object/from16 v21, v15

    iget-object v3, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v4, 0x7f0f020e

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    new-array v14, v4, [Ljava/lang/Object;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "<font color=\'red\'>"

    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "</font>"

    invoke-virtual {v4, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x0

    aput-object v4, v14, v12

    invoke-static {v3, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    goto :goto_12b4

    :goto_12ed
    const-string v3, "data-title"

    invoke-virtual {v10, v3}, Lj/a/d/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v11, v6, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v3, 0x1

    add-int/2addr v9, v3

    const-string v3, "rank"

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-object/from16 v10, v23

    invoke-virtual {v4, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v11, v3, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1311
    .catch Ljava/lang/Exception; {:try_start_12a3 .. :try_end_1311} :catch_131d

    move-object/from16 v23, v10

    move-object/from16 v4, v18

    move-object/from16 v3, v19

    move-object/from16 v20, v22

    move-object/from16 v22, v13

    goto/16 :goto_1120

    :catch_131d
    move-exception v0

    goto :goto_1334

    :catch_131f
    move-exception v0

    move-object/from16 v19, v3

    move-object/from16 v24, v14

    goto :goto_1328

    :catch_1325
    move-exception v0

    move-object/from16 v19, v3

    :goto_1328
    move-object/from16 v21, v15

    goto :goto_1334

    :catch_132b
    move-exception v0

    move-object/from16 v19, v3

    goto :goto_1334

    :catch_132f
    move-exception v0

    move-object/from16 v19, v3

    move-object/from16 v13, v22

    :goto_1334
    move-object v3, v0

    :try_start_1335
    invoke-virtual {v3}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_133d

    :cond_1339
    move-object/from16 v19, v3

    move-object/from16 v13, v22

    :goto_133d
    const/16 v3, 0x64

    if-ne v8, v3, :cond_141f

    const-string v3, "<item>[^<]*<title>\u7b2c([0-9]+)\u4f4d\uff1a([^<]+)</title>[^<]*<link>([^<]+)</link>[^<]*<guid isPermaLink=\"[^\"]*\">[^<]+</guid>[^<]*<pubDate>[^<]+</pubDate>[^<]*<description><!\\[CDATA\\[[^<]*<p class=\"nico-thumbnail\"><img alt=\"[^\"]*\" src=\"([^\"]*)\"[^>]*></p>.+?<p class=\"nico-info\"><small><strong class=\"nico-info-number\">[^<]+</strong>pts.\uff5c<strong class=\"nico-info-length\">([^<]+)</strong>\uff5c<strong class=\"nico-info-date\">([^<]+)</strong> \u6295\u7a3f<br/><strong>\u5408\u8a08</strong>&nbsp;&#x20;\u518d\u751f\uff1a<strong class=\"nico-info-total-view\">([^<]+)</strong>&nbsp;&#x20;\u30b3\u30e1\u30f3\u30c8\uff1a<strong class=\"nico-info-total-res\">([^<]+)</strong>&nbsp;&#x20;\u30de\u30a4\u30ea\u30b9\u30c8\uff1a<strong class=\"nico-info-total-mylist\">([^<]+)</strong><br/><strong>[^\\]]*\\]\\]></description>[^<]*</item>"

    const/16 v4, 0x20

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    :goto_134d
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_141f

    new-instance v4, Le/e/a/x1;

    invoke-direct {v4}, Le/e/a/x1;-><init>()V

    const/4 v7, 0x3

    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v13, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v7, 0x4

    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    move-object/from16 v9, v21

    invoke-virtual {v4, v9, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v7, 0x5

    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    move-object/from16 v10, v24

    invoke-virtual {v4, v10, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v11, 0x7f0f0212

    invoke-virtual {v7, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v12, 0x3

    new-array v14, v12, [Ljava/lang/Object;

    const/4 v12, 0x7

    invoke-virtual {v3, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    const/4 v15, 0x0

    aput-object v12, v14, v15

    const/16 v12, 0x8

    invoke-virtual {v3, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    const/4 v15, 0x1

    aput-object v12, v14, v15

    const/16 v12, 0x9

    invoke-virtual {v3, v12}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v12

    const/4 v15, 0x2

    aput-object v12, v14, v15

    invoke-static {v7, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    move-object/from16 v12, v19

    invoke-virtual {v4, v12, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v7, "rank"

    const/4 v14, 0x1

    invoke-virtual {v3, v14}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v4, v7, v15}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v7, Ljava/text/SimpleDateFormat;

    const-string v14, "yyyy\u5e74MM\u6708dd\u65e5 HH\uff1amm\uff1ass"

    invoke-direct {v7, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v14, Ljava/text/SimpleDateFormat;

    iget-object v15, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v11, 0x7f0f004d

    invoke-virtual {v15, v11}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v14, v11}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const/4 v11, 0x6

    invoke-virtual {v3, v11}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v7, v11}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v7

    iget-object v11, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v15, 0x7f0f020e

    invoke-virtual {v11, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11

    move-object/from16 v21, v9

    const/4 v15, 0x1

    new-array v9, v15, [Ljava/lang/Object;

    invoke-virtual {v14, v7}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v7

    const/4 v14, 0x0

    aput-object v7, v9, v14

    invoke-static {v11, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v4, v5, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const/4 v7, 0x2

    invoke-virtual {v3, v7}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-static {v9}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v4, v6, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget v4, v1, Le/e/a/e0;->i:I

    const/16 v9, 0x64

    if-ne v4, v9, :cond_1417

    iget v4, v1, Le/e/a/e0;->j:I

    const/4 v9, 0x3

    if-lt v4, v9, :cond_1415

    const/4 v4, 0x0

    iput v4, v1, Le/e/a/e0;->i:I

    goto :goto_1419

    :cond_1415
    const/4 v4, 0x0

    goto :goto_1419

    :cond_1417
    const/4 v4, 0x0

    const/4 v9, 0x3

    :goto_1419
    move-object/from16 v24, v10

    move-object/from16 v19, v12

    goto/16 :goto_134d

    :cond_141f
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int v3, v3, v17

    iput v3, v1, Le/e/a/e0;->f:I

    iget v3, v1, Le/e/a/e0;->f:I

    if-lez v3, :cond_1436

    iget-object v3, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v4, Le/e/a/e0$i;

    invoke-direct {v4, v1, v2, v8}, Le/e/a/e0$i;-><init>(Le/e/a/e0;Ljava/util/ArrayList;I)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_144b

    :cond_1436
    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$j;

    invoke-direct {v3, v1, v8}, Le/e/a/e0$j;-><init>(Le/e/a/e0;I)V

    :goto_143d
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_144b

    :cond_1441
    move-object/from16 v16, v5

    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$a;

    invoke-direct {v3, v1, v6}, Le/e/a/e0$a;-><init>(Le/e/a/e0;Lorg/apache/http/HttpResponse;)V

    goto :goto_143d

    :goto_144b
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V
    :try_end_1452
    .catch Ljava/lang/Exception; {:try_start_1335 .. :try_end_1452} :catch_1453

    goto :goto_1458

    :catch_1453
    move-exception v0

    move-object v2, v0

    invoke-virtual {v2}, Ljava/lang/Exception;->printStackTrace()V

    :goto_1458
    return-void
.end method

.method public final b(I)V
    .registers 25

    move-object/from16 v1, p0

    move/from16 v0, p1

    const-string v2, "title"

    const-string v3, "comment"

    const-string v4, "view"

    const-string v5, "thumbnail"

    const-string v6, "id"

    const-string v7, "name"

    const-string v8, "watchLater"

    new-instance v9, Ljava/util/ArrayList;

    invoke-direct {v9}, Ljava/util/ArrayList;-><init>()V

    const/4 v10, 0x5

    if-ne v0, v10, :cond_31

    iget-object v0, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const-string v10, "https://nvapi.nicovideo.jp/v1/users/me/mylists/"

    invoke-static {v10}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v10

    iget-object v11, v1, Le/e/a/e0;->a:Ljava/lang/String;

    const-string v12, "?pageSize=500&page=1"

    invoke-static {v10, v11, v12}, Le/b/a/a/a;->a(Ljava/lang/StringBuilder;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    invoke-static {v0, v10, v11}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    goto :goto_41

    :cond_31
    const/16 v10, 0x9

    if-ne v0, v10, :cond_40

    iget-object v0, v1, Le/e/a/e0;->p:Landroid/content/Context;

    iget-object v10, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    const-string v11, "https://nvapi.nicovideo.jp/v1/users/me/watch-later?pageSize=500&page=1"

    invoke-static {v0, v11, v10}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    goto :goto_41

    :cond_40
    const/4 v0, 0x0

    :goto_41
    if-nez v0, :cond_4e

    iget-object v0, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v2, Le/e/a/e0$c;

    invoke-direct {v2, v1}, Le/e/a/e0$c;-><init>(Le/e/a/e0;)V

    move-object v3, v2

    move-object v2, v1

    goto/16 :goto_2ac

    :cond_4e
    :try_start_4e
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "data"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10
    :try_end_5d
    .catch Lorg/json/JSONException; {:try_start_4e .. :try_end_5d} :catch_298
    .catch Ljava/text/ParseException; {:try_start_4e .. :try_end_5d} :catch_294

    const-string v11, "mylist"

    if-eqz v10, :cond_66

    :try_start_61
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_6a

    :cond_66
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_6a
    const-string v8, "items"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v10, 0x0

    :goto_71
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v12
    :try_end_75
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_75} :catch_298
    .catch Ljava/text/ParseException; {:try_start_61 .. :try_end_75} :catch_294

    const-string v13, ""

    const-string v14, "description"

    if-ge v10, v12, :cond_261

    :try_start_7b
    invoke-virtual {v8, v10}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lorg/json/JSONObject;

    const-string v15, "video"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 p1, v8

    new-instance v8, Le/e/a/x1;

    invoke-direct {v8}, Le/e/a/x1;-><init>()V

    invoke-static {v8, v15}, Le/e/a/HistorySupport;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    invoke-static {v8, v12}, Le/e/a/AccountRemoval227;->capture(Ljava/lang/Object;Lorg/json/JSONObject;)V

    move-object/from16 v16, v0

    const-string v0, "videourl"

    move-object/from16 v17, v7

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 v18, v10

    const-string v10, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v8, v0, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "videoid"

    invoke-virtual {v15, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v7

    invoke-virtual {v8, v0, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v15, v5}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v7, "url"

    invoke-virtual {v0, v7}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v8, v5, v0}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v0, "length"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "<b>"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v10, "duration"

    invoke-virtual {v15, v10}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v10

    invoke-virtual {v1, v10}, Le/e/a/e0;->c(I)Ljava/lang/CharSequence;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v10, "</b>"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-static {v7}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v7

    invoke-virtual {v8, v0, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_124

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_124

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_124

    const-string v7, "\n"

    const-string v10, "<br>"

    invoke-virtual {v0, v7, v10}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "<br><font color=\'#000000\'> <b>"

    invoke-virtual {v7, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "</b></font>"

    invoke-virtual {v7, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    :cond_124
    const-string v0, "count"

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v7, "videoinfo"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v1, Le/e/a/e0;->p:Landroid/content/Context;

    move-object/from16 v19, v5

    const v5, 0x7f0f0212

    invoke-virtual {v14, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    const/4 v14, 0x3

    new-array v14, v14, [Ljava/lang/Object;

    move-object/from16 v20, v6

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6
    :try_end_145
    .catch Lorg/json/JSONException; {:try_start_7b .. :try_end_145} :catch_298
    .catch Ljava/text/ParseException; {:try_start_7b .. :try_end_145} :catch_294

    move-object/from16 v21, v9

    :try_start_147
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9
    :try_end_14b
    .catch Lorg/json/JSONException; {:try_start_147 .. :try_end_14b} :catch_25f
    .catch Ljava/text/ParseException; {:try_start_147 .. :try_end_14b} :catch_25a

    move-object/from16 v22, v2

    int-to-long v1, v9

    :try_start_14e
    invoke-virtual {v6, v1, v2}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    aput-object v1, v14, v2

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {v0, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    move-object v6, v3

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x1

    aput-object v1, v14, v2

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v1

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    invoke-virtual {v1, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x2

    aput-object v1, v14, v2

    invoke-static {v5, v14}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v10, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v8, v7, v1}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "rawplay"

    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "rawres"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-virtual {v8, v1, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v1, "rawmylis"

    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    invoke-virtual {v8, v1, v0}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v0, Ljava/text/SimpleDateFormat;

    const-string v1, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v0, v1}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v1, Ljava/text/SimpleDateFormat;
    :try_end_1bb
    .catch Lorg/json/JSONException; {:try_start_14e .. :try_end_1bb} :catch_258
    .catch Ljava/text/ParseException; {:try_start_14e .. :try_end_1bb} :catch_254

    move-object/from16 v2, p0

    :try_start_1bd
    iget-object v3, v2, Le/e/a/e0;->p:Landroid/content/Context;

    const v5, 0x7f0f004d

    invoke-virtual {v3, v5}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    const-string v3, "registeredAt"

    invoke-virtual {v15, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    const-string v5, "addedAt"

    invoke-virtual {v12, v5}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    const-string v5, "posttime"

    iget-object v7, v2, Le/e/a/e0;->p:Landroid/content/Context;

    const v9, 0x7f0f0211

    invoke-virtual {v7, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v0

    const/4 v10, 0x0

    aput-object v0, v9, v10

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v0

    invoke-virtual {v8, v5, v0}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v0, v22

    invoke-virtual {v15, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v8, v0, v5}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "item_id"

    const-string v7, "itemId"

    invoke-virtual {v12, v7}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v8, v5, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v5, "first_retrieve"

    iget-object v7, v2, Le/e/a/e0;->p:Landroid/content/Context;

    const v9, 0x7f0f020e

    invoke-virtual {v7, v9}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7

    const/4 v9, 0x1

    new-array v9, v9, [Ljava/lang/Object;

    invoke-virtual {v1, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v1

    const/4 v3, 0x0

    aput-object v1, v9, v3

    invoke-static {v7, v9}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v1

    invoke-virtual {v8, v5, v1}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_239
    .catch Lorg/json/JSONException; {:try_start_1bd .. :try_end_239} :catch_252
    .catch Ljava/text/ParseException; {:try_start_1bd .. :try_end_239} :catch_250

    move-object/from16 v1, v21

    :try_start_23b
    invoke-virtual {v1, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v18, 0x1

    move-object/from16 v8, p1

    move-object v9, v1

    move-object v1, v2

    move-object v3, v6

    move-object/from16 v7, v17

    move-object/from16 v5, v19

    move-object/from16 v6, v20

    move-object v2, v0

    move-object/from16 v0, v16

    goto/16 :goto_71

    :catch_250
    move-exception v0

    goto :goto_25c

    :catch_252
    move-exception v0

    goto :goto_25c

    :catch_254
    move-exception v0

    :goto_255
    move-object/from16 v2, p0

    goto :goto_25c

    :catch_258
    move-exception v0

    goto :goto_255

    :catch_25a
    move-exception v0

    :goto_25b
    move-object v2, v1

    :goto_25c
    move-object/from16 v1, v21

    goto :goto_29a

    :catch_25f
    move-exception v0

    goto :goto_25b

    :cond_261
    move-object/from16 v16, v0

    move-object v2, v1

    move-object/from16 v17, v7

    move-object v1, v9

    iget-object v0, v2, Le/e/a/e0;->e:Ljava/util/HashMap;

    move-object/from16 v4, v16

    move-object/from16 v3, v17

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_29d

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_29d

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_29d

    iget-object v3, v2, Le/e/a/e0;->e:Ljava/util/HashMap;

    invoke-virtual {v3, v14, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_28f
    .catch Lorg/json/JSONException; {:try_start_23b .. :try_end_28f} :catch_292
    .catch Ljava/text/ParseException; {:try_start_23b .. :try_end_28f} :catch_290

    goto :goto_29d

    :catch_290
    move-exception v0

    goto :goto_29a

    :catch_292
    move-exception v0

    goto :goto_29a

    :catch_294
    move-exception v0

    :goto_295
    move-object v2, v1

    move-object v1, v9

    goto :goto_29a

    :catch_298
    move-exception v0

    goto :goto_295

    :goto_29a
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_29d
    :goto_29d
    new-instance v0, Le/e/a/e0$d;

    invoke-direct {v0, v2}, Le/e/a/e0$d;-><init>(Le/e/a/e0;)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v0, v2, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$e;

    invoke-direct {v3, v2, v1}, Le/e/a/e0$e;-><init>(Le/e/a/e0;Ljava/util/ArrayList;)V

    :goto_2ac
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
