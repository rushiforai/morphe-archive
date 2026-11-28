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

    if-eqz v0, :cond_1

    const-string v3, "flapi.nicovideo.jp/api/getrelation"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_0

    const-string v3, "nicovideo.jp/v1/recommend"

    invoke-virtual {v0, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_1

    :cond_0
    invoke-static {v1}, Le/e/a/ModernRelated;->load(Le/e/a/e0;)V

    return-void

    :cond_1
    iget-object v0, v1, Le/e/a/e0;->a:Ljava/lang/String;

    if-eqz v0, :cond_2

    invoke-static {v0}, Le/e/a/RankingPages190;->isRanking(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_2

    invoke-static {v1}, Le/e/a/ModernRanking;->load(Le/e/a/e0;)V

    return-void

    :cond_2
    iget-object v0, v1, Le/e/a/e0;->a:Ljava/lang/String;

    if-eqz v0, :cond_3

    const-string v3, "https://nvapi.nicovideo.jp/v1/search/video"

    invoke-virtual {v0, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_3

    invoke-static {v1}, Le/e/a/ModernSearch;->load(Le/e/a/e0;)V

    return-void

    :cond_3
    :try_start_0
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    iget-object v4, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    if-nez v4, :cond_4

    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$f;

    invoke-direct {v3, v1}, Le/e/a/e0$f;-><init>(Le/e/a/e0;)V

    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_4
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

    if-ne v2, v8, :cond_5

    const-string v9, "X-Frontend-Id"

    const-string v10, "1"

    invoke-virtual {v7, v9, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_5
    const/4 v9, 0x3

    if-eq v2, v9, :cond_6

    const/4 v10, 0x4

    if-eq v2, v10, :cond_6

    const/16 v10, 0xa

    if-ne v2, v10, :cond_7

    :cond_6
    const-string v10, "X-Frontend-Id"

    const-string v11, "6"

    invoke-virtual {v7, v10, v11}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v10, "X-Frontend-Version"

    const-string v11, "0"

    invoke-virtual {v7, v10, v11}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7
    const/4 v10, 0x4

    if-ne v2, v10, :cond_8

    invoke-static {}, Landroid/webkit/CookieManager;->getInstance()Landroid/webkit/CookieManager;

    move-result-object v10

    const-string v11, "https://www.nicovideo.jp/"

    invoke-virtual {v10, v11}, Landroid/webkit/CookieManager;->getCookie(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    if-eqz v10, :cond_8

    const-string v11, "Cookie"

    invoke-virtual {v7, v11, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8
    invoke-static {v5, v7, v6}, Lnicoid/network238/LegacyGet258;->executeHistoryRC3(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;Lorg/apache/http/protocol/HttpContext;)Lorg/apache/http/HttpResponse;

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

    if-ne v7, v10, :cond_2f

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
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_69

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

    if-ne v2, v5, :cond_a

    :try_start_1
    new-instance v5, Lorg/json/JSONObject;

    invoke-direct {v5, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_e

    move/from16 v17, v4

    :try_start_2
    const-string v4, "data"

    invoke-virtual {v5, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v5, "items"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_d

    move-object/from16 v19, v7

    const/4 v5, 0x0

    const/16 v18, 0x0

    :goto_0
    :try_start_3
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v7
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_c

    if-ge v5, v7, :cond_9

    :try_start_4
    invoke-virtual {v4, v5}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lorg/json/JSONObject;
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_a

    move-object/from16 v20, v4

    :try_start_5
    const-string v4, "count"

    invoke-virtual {v7, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_9

    move/from16 v21, v5

    :try_start_6
    new-instance v5, Le/e/a/x1;

    invoke-direct {v5}, Le/e/a/x1;-><init>()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_8

    move-object/from16 v22, v3

    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_7

    move-object/from16 v23, v9

    :try_start_8
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
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_6

    move-object/from16 v24, v14

    :try_start_9
    const-string v14, "view"

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_5

    move-object/from16 v25, v15

    int-to-long v14, v14

    :try_start_a
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
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_4

    move-object/from16 v3, v25

    :try_start_b
    invoke-virtual {v5, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v7, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v5, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_3

    add-int/lit8 v2, v18, 0x1

    :try_start_c
    const-string v4, "rank"

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    :try_end_c
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_c} :catch_2

    move-object/from16 v9, v23

    :try_start_d
    invoke-virtual {v7, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v5, v4, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1

    move-object/from16 v4, v22

    :try_start_e
    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_0

    move/from16 v18, v2

    goto :goto_7

    :catch_0
    move-exception v0

    goto :goto_1

    :catch_1
    move-exception v0

    move-object/from16 v4, v22

    goto :goto_1

    :catch_2
    move-exception v0

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    :goto_1
    move/from16 v18, v2

    goto :goto_6

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    move-object/from16 v4, v22

    move-object/from16 v9, v23

    move-object/from16 v3, v25

    goto :goto_6

    :catch_5
    move-exception v0

    goto :goto_2

    :catch_6
    move-exception v0

    move-object/from16 v24, v14

    :goto_2
    move-object v3, v15

    :goto_3
    move-object/from16 v4, v22

    move-object/from16 v9, v23

    goto :goto_6

    :catch_7
    move-exception v0

    move-object/from16 v24, v14

    move-object v3, v15

    move-object/from16 v4, v22

    goto :goto_6

    :catch_8
    move-exception v0

    move-object v4, v3

    goto :goto_4

    :catch_9
    move-exception v0

    move-object v4, v3

    move/from16 v21, v5

    :goto_4
    move-object/from16 v24, v14

    goto :goto_5

    :catch_a
    move-exception v0

    move-object/from16 v20, v4

    move/from16 v21, v5

    move-object/from16 v24, v14

    move-object v4, v3

    :goto_5
    move-object v3, v15

    :goto_6
    move-object v2, v0

    :try_start_f
    invoke-static {v2}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_b

    :goto_7
    add-int/lit8 v5, v21, 0x1

    move/from16 v2, p1

    move-object v15, v3

    move-object v3, v4

    move-object/from16 v4, v20

    move-object/from16 v14, v24

    goto/16 :goto_0

    :catch_b
    move-exception v0

    goto :goto_a

    :cond_9
    move-object v4, v3

    move-object v2, v4

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object v3, v11

    move-object/from16 v22, v12

    move-object v10, v13

    move-object/from16 v24, v14

    move-object v5, v15

    goto :goto_b

    :catch_c
    move-exception v0

    move-object v4, v3

    goto :goto_8

    :catch_d
    move-exception v0

    move-object v4, v3

    move-object/from16 v19, v7

    :goto_8
    move-object/from16 v24, v14

    goto :goto_9

    :catch_e
    move-exception v0

    move/from16 v17, v4

    move-object/from16 v19, v7

    move-object/from16 v24, v14

    move-object v4, v3

    :goto_9
    move-object v3, v15

    :goto_a
    move-object v2, v0

    :try_start_10
    invoke-static {v2}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    move-object v5, v3

    move-object v2, v4

    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object v3, v11

    move-object/from16 v22, v12

    move-object v10, v13

    :goto_b
    move-object/from16 v25, v19

    move-object/from16 v19, v6

    :goto_c
    move/from16 v6, p1

    goto/16 :goto_38

    :cond_a
    move/from16 v17, v4

    move-object/from16 v19, v7

    move-object/from16 v24, v14

    const/4 v5, 0x2

    move-object v4, v3

    move-object v3, v15

    if-ne v2, v5, :cond_f

    const-string v5, "<total_count>([0-9]+)</total_count>[^<]+<page_count>([0-9]+)</page_count>[^<]+<data_count>([0-9]+)</data_count>"

    const/16 v7, 0x20

    invoke-static {v5, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v5

    move-object/from16 v7, v19

    invoke-virtual {v5, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v5

    :goto_d
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v14

    if-eqz v14, :cond_d

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

    if-eq v13, v14, :cond_b

    iget v13, v1, Le/e/a/e0;->j:I

    if-lt v13, v15, :cond_c

    :cond_b
    const/4 v13, 0x0

    iput v13, v1, Le/e/a/e0;->i:I

    :cond_c
    move-object/from16 v13, v18

    goto :goto_d

    :cond_d
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

    :goto_e
    invoke-virtual {v5}, Ljava/util/regex/Matcher;->find()Z

    move-result v13

    if-eqz v13, :cond_e

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
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_69

    move-object/from16 v6, v19

    move-object/from16 v7, v20

    move-object/from16 v10, v21

    move-object/from16 v9, v23

    goto/16 :goto_e

    :cond_e
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

    goto/16 :goto_38

    :cond_f
    move-object/from16 v23, v9

    move-object/from16 v21, v10

    move-object/from16 v18, v13

    move-object/from16 v20, v19

    const/4 v5, 0x3

    move-object/from16 v19, v6

    if-ne v2, v5, :cond_13

    :try_start_11
    new-instance v5, Lorg/json/JSONObject;
    :try_end_11
    .catch Lorg/json/JSONException; {:try_start_11 .. :try_end_11} :catch_1c
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_69

    move-object/from16 v6, v20

    :try_start_12
    invoke-direct {v5, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v7, "data"

    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5
    :try_end_12
    .catch Lorg/json/JSONException; {:try_start_12 .. :try_end_12} :catch_1b
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_69

    move-object/from16 v7, v18

    :try_start_13
    invoke-virtual {v5, v7}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v5

    const-string v9, "items"

    invoke-virtual {v5, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v9

    const/4 v10, 0x0

    :goto_f
    invoke-virtual {v9}, Lorg/json/JSONArray;->length()I

    move-result v13

    if-ge v10, v13, :cond_12

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
    :try_end_13
    .catch Lorg/json/JSONException; {:try_start_13 .. :try_end_13} :catch_1a
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_69

    move-object/from16 v20, v6

    :try_start_14
    const-string v6, "http://www.nicovideo.jp/watch/"

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v6, "id"

    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v6

    invoke-virtual {v9, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v15, v12, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_14
    .catch Lorg/json/JSONException; {:try_start_14 .. :try_end_14} :catch_18
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_69

    move-object/from16 v6, v21

    :try_start_15
    invoke-virtual {v14, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v9
    :try_end_15
    .catch Lorg/json/JSONException; {:try_start_15 .. :try_end_15} :catch_17
    .catch Ljava/lang/Exception; {:try_start_15 .. :try_end_15} :catch_69

    move-object/from16 v21, v12

    :try_start_16
    const-string v12, "url"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v9

    invoke-virtual {v15, v6, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_16
    .catch Lorg/json/JSONException; {:try_start_16 .. :try_end_16} :catch_16
    .catch Ljava/lang/Exception; {:try_start_16 .. :try_end_16} :catch_69

    move-object/from16 v12, v19

    :try_start_17
    invoke-virtual {v9, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_17
    .catch Lorg/json/JSONException; {:try_start_17 .. :try_end_17} :catch_15
    .catch Ljava/lang/Exception; {:try_start_17 .. :try_end_17} :catch_69

    move-object/from16 v19, v12

    :try_start_18
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
    :try_end_18
    .catch Lorg/json/JSONException; {:try_start_18 .. :try_end_18} :catch_16
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_18} :catch_69

    move-object/from16 v12, v24

    :try_start_19
    invoke-virtual {v15, v12, v9}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v9
    :try_end_19
    .catch Lorg/json/JSONException; {:try_start_19 .. :try_end_19} :catch_14
    .catch Ljava/lang/Exception; {:try_start_19 .. :try_end_19} :catch_69

    if-eqz v9, :cond_11

    :try_start_1a
    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_11

    const-string v9, "description"

    invoke-virtual {v13, v9}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_1a
    .catch Lorg/json/JSONException; {:try_start_1a .. :try_end_1a} :catch_10
    .catch Ljava/lang/Exception; {:try_start_1a .. :try_end_1a} :catch_69

    move-object/from16 v13, v23

    :try_start_1b
    invoke-virtual {v9, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v22
    :try_end_1b
    .catch Lorg/json/JSONException; {:try_start_1b .. :try_end_1b} :catch_f
    .catch Ljava/lang/Exception; {:try_start_1b .. :try_end_1b} :catch_69

    if-nez v22, :cond_10

    move-object/from16 v23, v13

    :try_start_1c
    const-string v13, "\n"
    :try_end_1c
    .catch Lorg/json/JSONException; {:try_start_1c .. :try_end_1c} :catch_10
    .catch Ljava/lang/Exception; {:try_start_1c .. :try_end_1c} :catch_69

    move-object/from16 v24, v12

    :try_start_1d
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

    goto :goto_11

    :cond_10
    move-object/from16 v24, v12

    move-object/from16 v23, v13

    goto :goto_10

    :catch_f
    move-exception v0

    move-object/from16 v24, v12

    move-object/from16 v23, v13

    goto/16 :goto_13

    :catch_10
    move-exception v0

    move-object/from16 v24, v12

    goto/16 :goto_13

    :cond_11
    move-object/from16 v24, v12

    :goto_10
    move-object/from16 v9, v23

    :goto_11
    const-string v12, "count"

    invoke-virtual {v14, v12}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v12

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_1d
    .catch Lorg/json/JSONException; {:try_start_1d .. :try_end_1d} :catch_16
    .catch Ljava/lang/Exception; {:try_start_1d .. :try_end_1d} :catch_69

    move-object/from16 v22, v6

    :try_start_1e
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
    :try_end_1e
    .catch Lorg/json/JSONException; {:try_start_1e .. :try_end_1e} :catch_13
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_1e} :catch_69

    move-object/from16 v27, v3

    move-object/from16 v28, v4

    int-to-long v3, v10

    :try_start_1f
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
    :try_end_1f
    .catch Lorg/json/JSONException; {:try_start_1f .. :try_end_1f} :catch_12
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_69

    move-object/from16 v3, v27

    :try_start_20
    invoke-virtual {v15, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v14, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v15, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_20
    .catch Lorg/json/JSONException; {:try_start_20 .. :try_end_20} :catch_11
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_20} :catch_69

    move-object/from16 v2, v28

    :try_start_21
    invoke-virtual {v2, v15}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    add-int/lit8 v10, v26, 0x1

    move-object v4, v2

    move-object/from16 v9, v18

    move-object/from16 v6, v20

    move-object/from16 v12, v21

    move-object/from16 v21, v22

    move-object/from16 v5, v25

    move/from16 v2, p1

    goto/16 :goto_f

    :catch_11
    move-exception v0

    goto :goto_12

    :catch_12
    move-exception v0

    move-object/from16 v3, v27

    :goto_12
    move-object/from16 v2, v28

    goto/16 :goto_17

    :catch_13
    move-exception v0

    move-object v2, v4

    goto/16 :goto_17

    :catch_14
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    move-object/from16 v24, v12

    goto :goto_17

    :catch_15
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    move-object/from16 v19, v12

    goto :goto_17

    :catch_16
    move-exception v0

    :goto_13
    move-object v2, v4

    move-object/from16 v22, v6

    goto :goto_17

    :catch_17
    move-exception v0

    move-object v2, v4

    move-object/from16 v22, v6

    goto :goto_16

    :catch_18
    move-exception v0

    move-object v2, v4

    goto :goto_15

    :cond_12
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
    :try_end_21
    .catch Lorg/json/JSONException; {:try_start_21 .. :try_end_21} :catch_19
    .catch Ljava/lang/Exception; {:try_start_21 .. :try_end_21} :catch_69

    goto :goto_18

    :catch_19
    move-exception v0

    goto :goto_17

    :catch_1a
    move-exception v0

    move-object v2, v4

    move-object/from16 v20, v6

    goto :goto_15

    :catch_1b
    move-exception v0

    move-object v2, v4

    move-object/from16 v20, v6

    goto :goto_14

    :catch_1c
    move-exception v0

    move-object v2, v4

    :goto_14
    move-object/from16 v7, v18

    :goto_15
    move-object/from16 v22, v21

    :goto_16
    move-object/from16 v21, v12

    :goto_17
    move-object v4, v0

    :try_start_22
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    :goto_18
    new-instance v4, Le/e/a/e0$g;

    invoke-direct {v4, v1}, Le/e/a/e0$g;-><init>(Le/e/a/e0;)V

    invoke-static {v2, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_22
    .catch Ljava/lang/Exception; {:try_start_22 .. :try_end_22} :catch_69

    move/from16 v6, p1

    move-object v5, v3

    move-object v10, v7

    move-object v3, v11

    move-object/from16 v25, v20

    goto/16 :goto_28

    :cond_13
    move-object v2, v4

    move-object/from16 v7, v18

    move-object/from16 v22, v21

    move-object/from16 v21, v12

    const/4 v4, 0x4

    move/from16 v5, p1

    if-ne v5, v4, :cond_15

    :try_start_23
    new-instance v4, Lorg/json/JSONObject;
    :try_end_23
    .catch Lorg/json/JSONException; {:try_start_23 .. :try_end_23} :catch_36
    .catch Ljava/text/ParseException; {:try_start_23 .. :try_end_23} :catch_35
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_23} :catch_69

    move-object/from16 v6, v20

    :try_start_24
    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "data"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    :goto_19
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v10

    if-ge v9, v10, :cond_14

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
    :try_end_24
    .catch Lorg/json/JSONException; {:try_start_24 .. :try_end_24} :catch_34
    .catch Ljava/text/ParseException; {:try_start_24 .. :try_end_24} :catch_33
    .catch Ljava/lang/Exception; {:try_start_24 .. :try_end_24} :catch_69

    move-object/from16 v15, v21

    :try_start_25
    invoke-virtual {v13, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_25
    .catch Lorg/json/JSONException; {:try_start_25 .. :try_end_25} :catch_32
    .catch Ljava/text/ParseException; {:try_start_25 .. :try_end_25} :catch_31
    .catch Ljava/lang/Exception; {:try_start_25 .. :try_end_25} :catch_69

    move-object/from16 v18, v4

    move-object/from16 v14, v22

    :try_start_26
    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_26
    .catch Lorg/json/JSONException; {:try_start_26 .. :try_end_26} :catch_30
    .catch Ljava/text/ParseException; {:try_start_26 .. :try_end_26} :catch_2f
    .catch Ljava/lang/Exception; {:try_start_26 .. :try_end_26} :catch_69

    move-object/from16 v21, v15

    :try_start_27
    const-string v15, "url"

    invoke-virtual {v4, v15}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v13, v14, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_27
    .catch Lorg/json/JSONException; {:try_start_27 .. :try_end_27} :catch_2e
    .catch Ljava/text/ParseException; {:try_start_27 .. :try_end_27} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_27 .. :try_end_27} :catch_69

    move-object/from16 v15, v19

    :try_start_28
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_28
    .catch Lorg/json/JSONException; {:try_start_28 .. :try_end_28} :catch_2c
    .catch Ljava/text/ParseException; {:try_start_28 .. :try_end_28} :catch_2b
    .catch Ljava/lang/Exception; {:try_start_28 .. :try_end_28} :catch_69

    move-object/from16 v19, v15

    :try_start_29
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
    :try_end_29
    .catch Lorg/json/JSONException; {:try_start_29 .. :try_end_29} :catch_2e
    .catch Ljava/text/ParseException; {:try_start_29 .. :try_end_29} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_29 .. :try_end_29} :catch_69

    move-object/from16 v15, v24

    :try_start_2a
    invoke-virtual {v13, v15, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/text/SimpleDateFormat;
    :try_end_2a
    .catch Lorg/json/JSONException; {:try_start_2a .. :try_end_2a} :catch_2a
    .catch Ljava/text/ParseException; {:try_start_2a .. :try_end_2a} :catch_29
    .catch Ljava/lang/Exception; {:try_start_2a .. :try_end_2a} :catch_69

    move-object/from16 v24, v15

    :try_start_2b
    const-string v15, "yyyy-MM-dd\'T\'HH:mm:ssZ"

    invoke-direct {v4, v15}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v15, Ljava/text/SimpleDateFormat;
    :try_end_2b
    .catch Lorg/json/JSONException; {:try_start_2b .. :try_end_2b} :catch_2e
    .catch Ljava/text/ParseException; {:try_start_2b .. :try_end_2b} :catch_2d
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_2b} :catch_69

    move-object/from16 v22, v14

    :try_start_2c
    iget-object v14, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_2c
    .catch Lorg/json/JSONException; {:try_start_2c .. :try_end_2c} :catch_34
    .catch Ljava/text/ParseException; {:try_start_2c .. :try_end_2c} :catch_33
    .catch Ljava/lang/Exception; {:try_start_2c .. :try_end_2c} :catch_69

    move-object/from16 v20, v6

    const v6, 0x7f0f004d

    :try_start_2d
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
    :try_end_2d
    .catch Lorg/json/JSONException; {:try_start_2d .. :try_end_2d} :catch_36
    .catch Ljava/text/ParseException; {:try_start_2d .. :try_end_2d} :catch_35
    .catch Ljava/lang/Exception; {:try_start_2d .. :try_end_2d} :catch_69

    move-object/from16 v10, v23

    :try_start_2e
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
    :try_end_2e
    .catch Lorg/json/JSONException; {:try_start_2e .. :try_end_2e} :catch_28
    .catch Ljava/text/ParseException; {:try_start_2e .. :try_end_2e} :catch_27
    .catch Ljava/lang/Exception; {:try_start_2e .. :try_end_2e} :catch_69

    move-object/from16 v23, v10

    const/4 v14, 0x3

    :try_start_2f
    new-array v10, v14, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v14
    :try_end_2f
    .catch Lorg/json/JSONException; {:try_start_2f .. :try_end_2f} :catch_36
    .catch Ljava/text/ParseException; {:try_start_2f .. :try_end_2f} :catch_35
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_2f} :catch_69

    move-object/from16 v27, v3

    :try_start_30
    const-string v3, "view"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3
    :try_end_30
    .catch Lorg/json/JSONException; {:try_start_30 .. :try_end_30} :catch_26
    .catch Ljava/text/ParseException; {:try_start_30 .. :try_end_30} :catch_25
    .catch Ljava/lang/Exception; {:try_start_30 .. :try_end_30} :catch_69

    move-object/from16 v28, v2

    int-to-long v2, v3

    :try_start_31
    invoke-virtual {v14, v2, v3}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v2

    const/4 v3, 0x0

    aput-object v2, v10, v3

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v2

    const-string v3, "comment"

    invoke-virtual {v4, v3}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v3
    :try_end_31
    .catch Lorg/json/JSONException; {:try_start_31 .. :try_end_31} :catch_24
    .catch Ljava/text/ParseException; {:try_start_31 .. :try_end_31} :catch_23
    .catch Ljava/lang/Exception; {:try_start_31 .. :try_end_31} :catch_69

    move-object v14, v11

    move-object/from16 v26, v12

    int-to-long v11, v3

    :try_start_32
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
    :try_end_32
    .catch Lorg/json/JSONException; {:try_start_32 .. :try_end_32} :catch_22
    .catch Ljava/text/ParseException; {:try_start_32 .. :try_end_32} :catch_21
    .catch Ljava/lang/Exception; {:try_start_32 .. :try_end_32} :catch_69

    move-object v3, v14

    :try_start_33
    invoke-virtual {v13, v3, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v2, v26

    invoke-virtual {v2, v8}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v13, v8, v2}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_33
    .catch Lorg/json/JSONException; {:try_start_33 .. :try_end_33} :catch_20
    .catch Ljava/text/ParseException; {:try_start_33 .. :try_end_33} :catch_1f
    .catch Ljava/lang/Exception; {:try_start_33 .. :try_end_33} :catch_69

    move-object/from16 v2, v28

    :try_start_34
    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_34
    .catch Lorg/json/JSONException; {:try_start_34 .. :try_end_34} :catch_1e
    .catch Ljava/text/ParseException; {:try_start_34 .. :try_end_34} :catch_1d
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_34} :catch_69

    add-int/lit8 v9, v25, 0x1

    move/from16 v5, p1

    move-object v11, v3

    move-object/from16 v4, v18

    move-object/from16 v6, v20

    move-object/from16 v3, v27

    goto/16 :goto_19

    :catch_1d
    move-exception v0

    goto/16 :goto_27

    :catch_1e
    move-exception v0

    goto/16 :goto_27

    :catch_1f
    move-exception v0

    goto :goto_1c

    :catch_20
    move-exception v0

    goto :goto_1c

    :catch_21
    move-exception v0

    goto :goto_1a

    :catch_22
    move-exception v0

    :goto_1a
    move-object v3, v14

    goto :goto_1c

    :catch_23
    move-exception v0

    goto :goto_1b

    :catch_24
    move-exception v0

    :goto_1b
    move-object v3, v11

    :goto_1c
    move-object/from16 v2, v28

    goto/16 :goto_27

    :catch_25
    move-exception v0

    goto/16 :goto_26

    :catch_26
    move-exception v0

    goto/16 :goto_26

    :catch_27
    move-exception v0

    goto :goto_1d

    :catch_28
    move-exception v0

    :goto_1d
    move-object/from16 v27, v3

    move-object/from16 v23, v10

    goto/16 :goto_26

    :catch_29
    move-exception v0

    goto :goto_1e

    :catch_2a
    move-exception v0

    :goto_1e
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    move-object/from16 v24, v15

    goto/16 :goto_27

    :catch_2b
    move-exception v0

    goto :goto_1f

    :catch_2c
    move-exception v0

    :goto_1f
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_27

    :catch_2d
    move-exception v0

    goto :goto_20

    :catch_2e
    move-exception v0

    :goto_20
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    goto :goto_27

    :catch_2f
    move-exception v0

    goto :goto_21

    :catch_30
    move-exception v0

    :goto_21
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    move-object/from16 v22, v14

    goto :goto_23

    :catch_31
    move-exception v0

    goto :goto_22

    :catch_32
    move-exception v0

    :goto_22
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    move-object v3, v11

    :goto_23
    move-object/from16 v21, v15

    goto :goto_27

    :cond_14
    move-object/from16 v27, v3

    move-object v3, v11

    move-object/from16 v25, v6

    move-object v10, v7

    move-object/from16 v5, v27

    move/from16 v6, p1

    goto :goto_28

    :catch_33
    move-exception v0

    goto :goto_24

    :catch_34
    move-exception v0

    :goto_24
    move-object/from16 v27, v3

    move-object/from16 v20, v6

    goto :goto_26

    :catch_35
    move-exception v0

    goto :goto_25

    :catch_36
    move-exception v0

    :goto_25
    move-object/from16 v27, v3

    :goto_26
    move-object v3, v11

    :goto_27
    move-object v4, v0

    :try_start_35
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    move/from16 v6, p1

    move-object v10, v7

    move-object/from16 v25, v20

    move-object/from16 v5, v27

    :goto_28
    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    goto/16 :goto_38

    :cond_15
    move-object/from16 v27, v3

    move-object v3, v11

    const/4 v4, 0x6

    move/from16 v5, p1

    if-ne v5, v4, :cond_17

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "loaddata / "

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-object/from16 v6, v20

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_35
    .catch Ljava/lang/Exception; {:try_start_35 .. :try_end_35} :catch_69

    :try_start_36
    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4, v6}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    const/4 v10, 0x0

    :goto_29
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v9, v11, :cond_16

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
    :try_end_36
    .catch Ljava/lang/Exception; {:try_start_36 .. :try_end_36} :catch_41

    move-object/from16 v15, v21

    :try_start_37
    invoke-virtual {v13, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v14, "thumbnailUrl"

    invoke-virtual {v11, v14}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v14
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_37 .. :try_end_37} :catch_40

    move-object/from16 v18, v4

    move-object/from16 v4, v22

    :try_start_38
    invoke-virtual {v13, v4, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_38
    .catch Ljava/lang/Exception; {:try_start_38 .. :try_end_38} :catch_3f

    move-object/from16 v20, v7

    move-object/from16 v7, v19

    :try_start_39
    invoke-virtual {v14, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_39
    .catch Ljava/lang/Exception; {:try_start_39 .. :try_end_39} :catch_3e

    move-object/from16 v19, v7

    :try_start_3a
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
    :try_end_3a
    .catch Ljava/lang/Exception; {:try_start_3a .. :try_end_3a} :catch_3d

    move-object/from16 v14, v24

    :try_start_3b
    invoke-virtual {v13, v14, v7}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_3b
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_3b} :catch_3c

    move-object/from16 v24, v14

    const v14, 0x7f0f0212

    :try_start_3c
    invoke-virtual {v7, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7
    :try_end_3c
    .catch Ljava/lang/Exception; {:try_start_3c .. :try_end_3c} :catch_3d

    move-object/from16 v21, v4

    const/4 v14, 0x3

    :try_start_3d
    new-array v4, v14, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v14
    :try_end_3d
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_3d} :catch_3b

    move-object/from16 v22, v15

    :try_start_3e
    const-string v15, "viewCount"

    invoke-virtual {v12, v15}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v15
    :try_end_3e
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_3e} :catch_3a

    move-object/from16 v25, v6

    int-to-long v5, v15

    :try_start_3f
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
    :try_end_3f
    .catch Ljava/lang/Exception; {:try_start_3f .. :try_end_3f} :catch_39

    move-object/from16 v5, v27

    :try_start_40
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
    :try_end_40
    .catch Ljava/lang/Exception; {:try_start_40 .. :try_end_40} :catch_38

    move-object/from16 v7, v23

    :try_start_41
    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v13, v4, v6}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v13}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_41 .. :try_end_41} :catch_37

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

    goto/16 :goto_29

    :catch_37
    move-exception v0

    goto/16 :goto_2d

    :catch_38
    move-exception v0

    move-object/from16 v7, v23

    goto/16 :goto_2d

    :catch_39
    move-exception v0

    goto :goto_2c

    :catch_3a
    move-exception v0

    move-object/from16 v25, v6

    goto :goto_2c

    :catch_3b
    move-exception v0

    goto :goto_2a

    :catch_3c
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v24, v14

    goto :goto_2b

    :catch_3d
    move-exception v0

    move-object/from16 v21, v4

    :goto_2a
    move-object/from16 v25, v6

    goto :goto_2b

    :catch_3e
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v19, v7

    goto :goto_2b

    :catch_3f
    move-exception v0

    move-object/from16 v21, v4

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    :goto_2b
    move-object/from16 v22, v15

    :goto_2c
    move-object/from16 v7, v23

    move-object/from16 v5, v27

    goto :goto_2d

    :catch_40
    move-exception v0

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    move-object/from16 v21, v22

    move-object/from16 v7, v23

    move-object/from16 v5, v27

    move-object/from16 v22, v15

    goto :goto_2d

    :cond_16
    move-object/from16 v20, v7

    move-object/from16 v5, v27

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    move-object/from16 v25, v6

    move-object/from16 v10, v20

    goto/16 :goto_c

    :catch_41
    move-exception v0

    move-object/from16 v25, v6

    move-object/from16 v20, v7

    move-object/from16 v7, v23

    move-object/from16 v5, v27

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    :goto_2d
    move-object v4, v0

    :try_start_42
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V
    :try_end_42
    .catch Ljava/lang/Exception; {:try_start_42 .. :try_end_42} :catch_69

    move/from16 v6, p1

    goto/16 :goto_37

    :cond_17
    move-object/from16 v25, v20

    move-object/from16 v5, v27

    move-object/from16 v20, v7

    move-object/from16 v7, v23

    move-object/from16 v29, v22

    move-object/from16 v22, v21

    move-object/from16 v21, v29

    const/16 v4, 0xa

    move/from16 v6, p1

    if-ne v6, v4, :cond_19

    :try_start_43
    new-instance v4, Lorg/json/JSONObject;
    :try_end_43
    .catch Lorg/json/JSONException; {:try_start_43 .. :try_end_43} :catch_4d
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_43} :catch_69

    move-object/from16 v9, v25

    :try_start_44
    invoke-direct {v4, v9}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "data"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v10, "items"

    invoke-virtual {v4, v10}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v10, 0x0

    :goto_2e
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v10, v11, :cond_18

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
    :try_end_44
    .catch Lorg/json/JSONException; {:try_start_44 .. :try_end_44} :catch_4c
    .catch Ljava/lang/Exception; {:try_start_44 .. :try_end_44} :catch_69

    move-object/from16 v14, v22

    :try_start_45
    invoke-virtual {v12, v14, v13}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_45
    .catch Lorg/json/JSONException; {:try_start_45 .. :try_end_45} :catch_4b
    .catch Ljava/lang/Exception; {:try_start_45 .. :try_end_45} :catch_69

    move-object/from16 v13, v21

    :try_start_46
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v18, v4

    const-string v4, "url"

    invoke-virtual {v15, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v12, v13, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_46
    .catch Lorg/json/JSONException; {:try_start_46 .. :try_end_46} :catch_4a
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_46} :catch_69

    move-object/from16 v15, v19

    :try_start_47
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_47
    .catch Lorg/json/JSONException; {:try_start_47 .. :try_end_47} :catch_49
    .catch Ljava/lang/Exception; {:try_start_47 .. :try_end_47} :catch_69

    move-object/from16 v23, v7

    :try_start_48
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
    :try_end_48
    .catch Lorg/json/JSONException; {:try_start_48 .. :try_end_48} :catch_48
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_48} :catch_69

    move-object/from16 v7, v24

    :try_start_49
    invoke-virtual {v12, v7, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "count"

    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_49
    .catch Lorg/json/JSONException; {:try_start_49 .. :try_end_49} :catch_47
    .catch Ljava/lang/Exception; {:try_start_49 .. :try_end_49} :catch_69

    move-object/from16 v24, v7

    :try_start_4a
    iget-object v7, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_4a
    .catch Lorg/json/JSONException; {:try_start_4a .. :try_end_4a} :catch_48
    .catch Ljava/lang/Exception; {:try_start_4a .. :try_end_4a} :catch_69

    move-object/from16 v19, v15

    const v15, 0x7f0f0212

    :try_start_4b
    invoke-virtual {v7, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v7
    :try_end_4b
    .catch Lorg/json/JSONException; {:try_start_4b .. :try_end_4b} :catch_46
    .catch Ljava/lang/Exception; {:try_start_4b .. :try_end_4b} :catch_69

    move-object/from16 v21, v13

    const/4 v15, 0x3

    :try_start_4c
    new-array v13, v15, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v15
    :try_end_4c
    .catch Lorg/json/JSONException; {:try_start_4c .. :try_end_4c} :catch_45
    .catch Ljava/lang/Exception; {:try_start_4c .. :try_end_4c} :catch_69

    move-object/from16 v22, v14

    :try_start_4d
    const-string v14, "view"

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v14
    :try_end_4d
    .catch Lorg/json/JSONException; {:try_start_4d .. :try_end_4d} :catch_44
    .catch Ljava/lang/Exception; {:try_start_4d .. :try_end_4d} :catch_69

    move-object/from16 v25, v9

    move/from16 v26, v10

    int-to-long v9, v14

    :try_start_4e
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
    :try_end_4e
    .catch Lorg/json/JSONException; {:try_start_4e .. :try_end_4e} :catch_43
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_4e} :catch_69

    move-object/from16 v10, v20

    :try_start_4f
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
    :try_end_4f
    .catch Lorg/json/JSONException; {:try_start_4f .. :try_end_4f} :catch_42
    .catch Ljava/lang/Exception; {:try_start_4f .. :try_end_4f} :catch_69

    add-int/lit8 v4, v26, 0x1

    move-object/from16 v20, v10

    move-object/from16 v7, v23

    move-object/from16 v9, v25

    move v10, v4

    move-object/from16 v4, v18

    goto/16 :goto_2e

    :catch_42
    move-exception v0

    goto :goto_35

    :catch_43
    move-exception v0

    goto :goto_34

    :catch_44
    move-exception v0

    goto :goto_33

    :catch_45
    move-exception v0

    goto :goto_31

    :catch_46
    move-exception v0

    goto :goto_30

    :catch_47
    move-exception v0

    move-object/from16 v24, v7

    goto :goto_2f

    :catch_48
    move-exception v0

    goto :goto_2f

    :catch_49
    move-exception v0

    move-object/from16 v23, v7

    :goto_2f
    move-object/from16 v25, v9

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_34

    :catch_4a
    move-exception v0

    move-object/from16 v23, v7

    :goto_30
    move-object/from16 v25, v9

    move-object/from16 v21, v13

    goto :goto_32

    :catch_4b
    move-exception v0

    move-object/from16 v23, v7

    :goto_31
    move-object/from16 v25, v9

    :goto_32
    move-object/from16 v22, v14

    goto :goto_34

    :cond_18
    move-object/from16 v23, v7

    move-object/from16 v25, v9

    move-object/from16 v10, v20

    goto :goto_36

    :catch_4c
    move-exception v0

    move-object/from16 v23, v7

    :goto_33
    move-object/from16 v25, v9

    goto :goto_34

    :catch_4d
    move-exception v0

    move-object/from16 v23, v7

    :goto_34
    move-object/from16 v10, v20

    :goto_35
    move-object v4, v0

    :try_start_50
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    :goto_36
    new-instance v4, Le/e/a/e0$h;

    invoke-direct {v4, v1}, Le/e/a/e0$h;-><init>(Le/e/a/e0;)V

    invoke-static {v2, v4}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_50} :catch_69

    goto :goto_38

    :cond_19
    :goto_37
    move-object/from16 v23, v7

    move-object/from16 v10, v20

    :goto_38
    const/16 v4, 0xd

    if-ne v6, v4, :cond_1b

    :try_start_51
    new-instance v4, Lorg/json/JSONObject;
    :try_end_51
    .catch Lorg/json/JSONException; {:try_start_51 .. :try_end_51} :catch_55
    .catch Ljava/lang/Exception; {:try_start_51 .. :try_end_51} :catch_69

    move-object/from16 v7, v25

    :try_start_52
    invoke-direct {v4, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v9, "data"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    const-string v9, "items"

    invoke-virtual {v4, v9}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v9, 0x0

    :goto_39
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v11

    if-ge v9, v11, :cond_1a

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
    :try_end_52
    .catch Lorg/json/JSONException; {:try_start_52 .. :try_end_52} :catch_54
    .catch Ljava/lang/Exception; {:try_start_52 .. :try_end_52} :catch_69

    move-object/from16 v14, v22

    :try_start_53
    invoke-virtual {v12, v14, v13}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V
    :try_end_53
    .catch Lorg/json/JSONException; {:try_start_53 .. :try_end_53} :catch_53
    .catch Ljava/lang/Exception; {:try_start_53 .. :try_end_53} :catch_69

    move-object/from16 v13, v21

    :try_start_54
    invoke-virtual {v11, v13}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v15

    move-object/from16 v18, v4

    const-string v4, "url"

    invoke-virtual {v15, v4}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v12, v13, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_54
    .catch Lorg/json/JSONException; {:try_start_54 .. :try_end_54} :catch_52
    .catch Ljava/lang/Exception; {:try_start_54 .. :try_end_54} :catch_69

    move-object/from16 v15, v19

    :try_start_55
    invoke-virtual {v4, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_55
    .catch Lorg/json/JSONException; {:try_start_55 .. :try_end_55} :catch_51
    .catch Ljava/lang/Exception; {:try_start_55 .. :try_end_55} :catch_69

    move-object/from16 v19, v15

    :try_start_56
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
    :try_end_56
    .catch Lorg/json/JSONException; {:try_start_56 .. :try_end_56} :catch_52
    .catch Ljava/lang/Exception; {:try_start_56 .. :try_end_56} :catch_69

    move-object/from16 v15, v24

    :try_start_57
    invoke-virtual {v12, v15, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "count"

    invoke-virtual {v11, v4}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4
    :try_end_57
    .catch Lorg/json/JSONException; {:try_start_57 .. :try_end_57} :catch_50
    .catch Ljava/lang/Exception; {:try_start_57 .. :try_end_57} :catch_69

    move-object/from16 v24, v15

    :try_start_58
    iget-object v15, v1, Le/e/a/e0;->p:Landroid/content/Context;
    :try_end_58
    .catch Lorg/json/JSONException; {:try_start_58 .. :try_end_58} :catch_52
    .catch Ljava/lang/Exception; {:try_start_58 .. :try_end_58} :catch_69

    move-object/from16 v21, v13

    const v13, 0x7f0f0212

    :try_start_59
    invoke-virtual {v15, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v15
    :try_end_59
    .catch Lorg/json/JSONException; {:try_start_59 .. :try_end_59} :catch_53
    .catch Ljava/lang/Exception; {:try_start_59 .. :try_end_59} :catch_69

    move-object/from16 v22, v14

    const/4 v13, 0x3

    :try_start_5a
    new-array v14, v13, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v13
    :try_end_5a
    .catch Lorg/json/JSONException; {:try_start_5a .. :try_end_5a} :catch_54
    .catch Ljava/lang/Exception; {:try_start_5a .. :try_end_5a} :catch_69

    move-object/from16 v20, v7

    :try_start_5b
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
    :try_end_5b
    .catch Lorg/json/JSONException; {:try_start_5b .. :try_end_5b} :catch_4f
    .catch Ljava/lang/Exception; {:try_start_5b .. :try_end_5b} :catch_69

    move-object v13, v8

    int-to-long v7, v7

    :try_start_5c
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
    :try_end_5c
    .catch Lorg/json/JSONException; {:try_start_5c .. :try_end_5c} :catch_4e
    .catch Ljava/lang/Exception; {:try_start_5c .. :try_end_5c} :catch_69

    add-int/lit8 v9, v9, 0x1

    move/from16 v6, p1

    move-object v8, v13

    move-object/from16 v4, v18

    move-object/from16 v7, v20

    goto/16 :goto_39

    :catch_4e
    move-exception v0

    goto :goto_3b

    :catch_4f
    move-exception v0

    goto :goto_3a

    :catch_50
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v24, v15

    goto :goto_3a

    :catch_51
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    move-object/from16 v19, v15

    goto :goto_3a

    :catch_52
    move-exception v0

    move-object/from16 v20, v7

    move-object/from16 v21, v13

    move-object/from16 v22, v14

    goto :goto_3a

    :catch_53
    move-exception v0

    move-object/from16 v20, v7

    move-object v13, v8

    move-object/from16 v22, v14

    goto :goto_3b

    :cond_1a
    move-object/from16 v20, v7

    move-object v13, v8

    goto :goto_3c

    :catch_54
    move-exception v0

    move-object/from16 v20, v7

    :goto_3a
    move-object v13, v8

    goto :goto_3b

    :catch_55
    move-exception v0

    move-object v13, v8

    move-object/from16 v20, v25

    :goto_3b
    move-object v4, v0

    :try_start_5d
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    goto :goto_3c

    :cond_1b
    move-object v13, v8

    move-object/from16 v20, v25

    :goto_3c
    const/16 v4, 0xe

    move/from16 v6, p1

    if-ne v6, v4, :cond_22

    iget-object v4, v1, Le/e/a/e0;->b:Ljava/lang/String;

    const-string v7, "https?://www.nicovideo.jp/recommendations.*?"

    invoke-virtual {v4, v7}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1e

    const-string v4, "user_tag_param: \"([^\"]+)\","

    const/16 v7, 0x20

    invoke-static {v4, v7}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    move-object/from16 v7, v20

    invoke-virtual {v4, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object/from16 v9, v23

    :goto_3d
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_1c

    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v9

    goto :goto_3d

    :cond_1c
    const-string v4, "first_data:([^\n]+)\n"

    const/16 v8, 0x20

    invoke-static {v4, v8}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v4

    invoke-virtual {v4, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v4

    move-object/from16 v7, v23

    :goto_3e
    invoke-virtual {v4}, Ljava/util/regex/Matcher;->find()Z

    move-result v8

    if-eqz v8, :cond_1d

    const/4 v8, 0x1

    invoke-virtual {v4, v8}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v7

    goto :goto_3e

    :cond_1d
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "user_tag_param : "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, " / "

    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5d
    .catch Ljava/lang/Exception; {:try_start_5d .. :try_end_5d} :catch_69

    const/4 v4, 0x1

    goto :goto_3f

    :cond_1e
    move-object/from16 v7, v20

    move-object/from16 v9, v23

    const/4 v4, 0x0

    :goto_3f
    :try_start_5e
    new-instance v8, Lorg/json/JSONObject;

    invoke-direct {v8, v7}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v10, "recommend_info"

    invoke-virtual {v8, v10}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v10

    const-string v11, "page"

    invoke-virtual {v10, v11}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v11

    iput v11, v1, Le/e/a/e0;->j:I
    :try_end_5e
    .catch Lorg/json/JSONException; {:try_start_5e .. :try_end_5e} :catch_62
    .catch Ljava/lang/Exception; {:try_start_5e .. :try_end_5e} :catch_69

    if-eqz v4, :cond_1f

    :try_start_5f
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
    :try_end_5f
    .catch Lorg/json/JSONException; {:try_start_5f .. :try_end_5f} :catch_56
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_5f} :catch_69

    goto :goto_40

    :catch_56
    move-exception v0

    move-object v4, v0

    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    goto/16 :goto_48

    :cond_1f
    :goto_40
    :try_start_60
    const-string v4, "items"

    invoke-virtual {v8, v4}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v4

    const/4 v8, 0x0

    :goto_41
    invoke-virtual {v4}, Lorg/json/JSONArray;->length()I

    move-result v9

    if-ge v8, v9, :cond_21

    invoke-virtual {v4, v8}, Lorg/json/JSONArray;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lorg/json/JSONObject;

    const-string v10, "item_type"

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    const-string v11, "video"

    invoke-virtual {v10, v11}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_20

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
    :try_end_60
    .catch Lorg/json/JSONException; {:try_start_60 .. :try_end_60} :catch_62
    .catch Ljava/lang/Exception; {:try_start_60 .. :try_end_60} :catch_69

    move-object/from16 v12, v22

    :try_start_61
    invoke-virtual {v10, v12, v11}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v11, "thumbnail_url"

    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v11
    :try_end_61
    .catch Lorg/json/JSONException; {:try_start_61 .. :try_end_61} :catch_61
    .catch Ljava/lang/Exception; {:try_start_61 .. :try_end_61} :catch_69

    move-object/from16 v14, v21

    :try_start_62
    invoke-virtual {v10, v14, v11}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V
    :try_end_62
    .catch Lorg/json/JSONException; {:try_start_62 .. :try_end_62} :catch_60
    .catch Ljava/lang/Exception; {:try_start_62 .. :try_end_62} :catch_69

    move-object/from16 v15, v19

    :try_start_63
    invoke-virtual {v11, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    :try_end_63
    .catch Lorg/json/JSONException; {:try_start_63 .. :try_end_63} :catch_5f
    .catch Ljava/lang/Exception; {:try_start_63 .. :try_end_63} :catch_69

    move-object/from16 v18, v4

    move-object/from16 v19, v7

    move-object/from16 v4, v24

    :try_start_64
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
    :try_end_64
    .catch Lorg/json/JSONException; {:try_start_64 .. :try_end_64} :catch_5e
    .catch Ljava/lang/Exception; {:try_start_64 .. :try_end_64} :catch_69

    move-object/from16 v24, v4

    :try_start_65
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
    :try_end_65
    .catch Lorg/json/JSONException; {:try_start_65 .. :try_end_65} :catch_5d
    .catch Ljava/lang/Exception; {:try_start_65 .. :try_end_65} :catch_69

    move-object/from16 v20, v15

    const v15, 0x7f0f0212

    :try_start_66
    invoke-virtual {v11, v15}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v11
    :try_end_66
    .catch Lorg/json/JSONException; {:try_start_66 .. :try_end_66} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_66 .. :try_end_66} :catch_69

    move-object/from16 v21, v14

    const/4 v15, 0x3

    :try_start_67
    new-array v14, v15, [Ljava/lang/Object;

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v15
    :try_end_67
    .catch Lorg/json/JSONException; {:try_start_67 .. :try_end_67} :catch_5b
    .catch Ljava/lang/Exception; {:try_start_67 .. :try_end_67} :catch_69

    move-object/from16 v22, v12

    :try_start_68
    const-string v12, "view_counter"

    invoke-virtual {v9, v12}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v12
    :try_end_68
    .catch Lorg/json/JSONException; {:try_start_68 .. :try_end_68} :catch_5a
    .catch Ljava/lang/Exception; {:try_start_68 .. :try_end_68} :catch_69

    move-object/from16 v25, v13

    int-to-long v12, v12

    :try_start_69
    invoke-virtual {v15, v12, v13}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x0

    aput-object v12, v14, v13

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v12

    const-string v13, "num_res"

    invoke-virtual {v9, v13}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v13
    :try_end_69
    .catch Lorg/json/JSONException; {:try_start_69 .. :try_end_69} :catch_59
    .catch Ljava/lang/Exception; {:try_start_69 .. :try_end_69} :catch_69

    move-object/from16 v27, v5

    int-to-long v5, v13

    :try_start_6a
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
    :try_end_6a
    .catch Lorg/json/JSONException; {:try_start_6a .. :try_end_6a} :catch_58
    .catch Ljava/lang/Exception; {:try_start_6a .. :try_end_6a} :catch_69

    move-object/from16 v5, v27

    :try_start_6b
    invoke-virtual {v10, v5, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v4, "title_short"

    invoke-virtual {v9, v4}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lorg/apache/commons/lang3/StringEscapeUtils;->unescapeHtml4(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_6b
    .catch Lorg/json/JSONException; {:try_start_6b .. :try_end_6b} :catch_59
    .catch Ljava/lang/Exception; {:try_start_6b .. :try_end_6b} :catch_69

    move-object/from16 v6, v25

    :try_start_6c
    invoke-virtual {v10, v6, v4}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    invoke-virtual {v2, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_6c
    .catch Lorg/json/JSONException; {:try_start_6c .. :try_end_6c} :catch_57
    .catch Ljava/lang/Exception; {:try_start_6c .. :try_end_6c} :catch_69

    goto :goto_44

    :catch_57
    move-exception v0

    goto/16 :goto_47

    :catch_58
    move-exception v0

    move-object/from16 v6, v25

    move-object/from16 v5, v27

    goto/16 :goto_47

    :catch_59
    move-exception v0

    move-object/from16 v6, v25

    goto/16 :goto_47

    :catch_5a
    move-exception v0

    goto :goto_42

    :catch_5b
    move-exception v0

    move-object/from16 v22, v12

    :goto_42
    move-object v6, v13

    goto :goto_47

    :catch_5c
    move-exception v0

    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    goto :goto_47

    :catch_5d
    move-exception v0

    goto :goto_43

    :catch_5e
    move-exception v0

    move-object/from16 v24, v4

    goto :goto_43

    :catch_5f
    move-exception v0

    move-object/from16 v19, v7

    :goto_43
    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    move-object/from16 v20, v15

    goto :goto_47

    :catch_60
    move-exception v0

    move-object/from16 v22, v12

    move-object v6, v13

    move-object/from16 v21, v14

    goto :goto_46

    :catch_61
    move-exception v0

    move-object/from16 v22, v12

    goto :goto_45

    :cond_20
    move-object/from16 v18, v4

    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    :goto_44
    add-int/lit8 v8, v8, 0x1

    move-object v13, v6

    move-object/from16 v4, v18

    move-object/from16 v7, v19

    move-object/from16 v19, v20

    move/from16 v6, p1

    goto/16 :goto_41

    :cond_21
    move-object v6, v13

    move-object/from16 v20, v19

    move-object/from16 v19, v7

    goto :goto_49

    :catch_62
    move-exception v0

    :goto_45
    move-object v6, v13

    :goto_46
    move-object/from16 v20, v19

    move-object/from16 v19, v7

    :goto_47
    move-object v4, v0

    :goto_48
    :try_start_6d
    invoke-static {v4}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    :goto_49
    move-object/from16 v7, v19

    goto :goto_4a

    :cond_22
    move-object v6, v13

    move-object/from16 v7, v20

    move-object/from16 v20, v19

    :goto_4a
    const/16 v4, 0xc8

    move/from16 v8, p1

    if-ne v8, v4, :cond_2a

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v9, "loaddata / "

    invoke-virtual {v4, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_6d
    .catch Ljava/lang/Exception; {:try_start_6d .. :try_end_6d} :catch_69

    :try_start_6e
    invoke-static {v7}, Le/d/b/b/e/n/r/b;->g(Ljava/lang/String;)Lj/a/d/g;

    move-result-object v4

    const-string v9, ".list-table"

    invoke-virtual {v4, v9}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v4

    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v4

    const/4 v9, 0x0

    :goto_4b
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_2a

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
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_6e .. :try_end_6e} :catch_68

    move-object/from16 v13, v22

    :try_start_6f
    invoke-virtual {v11, v13, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v12, ".video-item-thumbnail"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    :goto_4c
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_23

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lj/a/d/i;

    const-string v15, "data-original"

    invoke-virtual {v14, v15}, Lj/a/d/m;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14
    :try_end_6f
    .catch Ljava/lang/Exception; {:try_start_6f .. :try_end_6f} :catch_67

    move-object/from16 v15, v21

    :try_start_70
    invoke-virtual {v11, v15, v14}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    move-object/from16 v21, v15

    goto :goto_4c

    :cond_23
    move-object/from16 v15, v21

    const-string v12, ".video-item-time"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v14, v23

    :goto_4d
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v18

    if-eqz v18, :cond_24

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Lj/a/d/i;

    invoke-virtual {v14}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v14

    goto :goto_4d

    :cond_24
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
    :try_end_70
    .catch Ljava/lang/Exception; {:try_start_70 .. :try_end_70} :catch_66

    move-object/from16 v14, v24

    :try_start_71
    invoke-virtual {v11, v14, v12}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    const-string v12, ".video-item-metaData-view > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v19, v23

    :goto_4e
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v20

    if-eqz v20, :cond_25

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v19

    check-cast v19, Lj/a/d/i;

    invoke-virtual/range {v19 .. v19}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v19

    goto :goto_4e

    :cond_25
    const-string v12, ".video-item-metaData-comment > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v20, v23

    :goto_4f
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v21

    if-eqz v21, :cond_26

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v20

    check-cast v20, Lj/a/d/i;

    invoke-virtual/range {v20 .. v20}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v20

    goto :goto_4f

    :cond_26
    const-string v12, ".video-item-metaData-mylist > .count"

    invoke-virtual {v10, v12}, Lj/a/d/i;->f(Ljava/lang/String;)Lj/a/f/b;

    move-result-object v12

    invoke-virtual {v12}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v12

    move-object/from16 v21, v23

    :goto_50
    invoke-interface {v12}, Ljava/util/Iterator;->hasNext()Z

    move-result v22

    if-eqz v22, :cond_27

    invoke-interface {v12}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v21

    check-cast v21, Lj/a/d/i;

    invoke-virtual/range {v21 .. v21}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v21

    goto :goto_50

    :cond_27
    iget-object v12, v1, Le/e/a/e0;->p:Landroid/content/Context;

    move-object/from16 v22, v4

    const v4, 0x7f0f0212

    invoke-virtual {v12, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v12
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_71 .. :try_end_71} :catch_65

    move-object/from16 v24, v14

    const/4 v4, 0x3

    :try_start_72
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

    :goto_51
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v14

    if-eqz v14, :cond_28

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lj/a/d/i;

    invoke-virtual {v12}, Lj/a/d/i;->p()Ljava/lang/String;

    move-result-object v12

    goto :goto_51

    :cond_28
    const-string v4, "[0-9]+/[0-9]+/[0-9]+"

    invoke-virtual {v12, v4}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_29

    new-instance v4, Ljava/text/SimpleDateFormat;

    const-string v14, "yyyy/MM/dd"

    invoke-direct {v4, v14}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    new-instance v14, Ljava/text/SimpleDateFormat;
    :try_end_72
    .catch Ljava/lang/Exception; {:try_start_72 .. :try_end_72} :catch_66

    move-object/from16 v19, v3

    :try_start_73
    const-string v3, "yyyy\u5e74MM\u6708dd\u65e5"

    invoke-direct {v14, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v12}, Ljava/text/SimpleDateFormat;->parse(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v3

    iget-object v4, v1, Le/e/a/e0;->p:Landroid/content/Context;

    const v12, 0x7f0f020e

    invoke-virtual {v4, v12}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4
    :try_end_73
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_73} :catch_63

    move-object/from16 v21, v15

    const/4 v12, 0x1

    :try_start_74
    new-array v15, v12, [Ljava/lang/Object;

    invoke-virtual {v14, v3}, Ljava/text/SimpleDateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object v3

    const/4 v12, 0x0

    aput-object v3, v15, v12

    invoke-static {v4, v15}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object v3

    :goto_52
    invoke-virtual {v11, v5, v3}, Le/e/a/x1;->a(Ljava/lang/String;Ljava/lang/Object;)V

    goto :goto_53

    :catch_63
    move-exception v0

    goto/16 :goto_54

    :cond_29
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

    goto :goto_52

    :goto_53
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
    :try_end_74
    .catch Ljava/lang/Exception; {:try_start_74 .. :try_end_74} :catch_64

    move-object/from16 v23, v10

    move-object/from16 v4, v18

    move-object/from16 v3, v19

    move-object/from16 v20, v22

    move-object/from16 v22, v13

    goto/16 :goto_4b

    :catch_64
    move-exception v0

    goto :goto_55

    :catch_65
    move-exception v0

    move-object/from16 v19, v3

    move-object/from16 v24, v14

    goto :goto_54

    :catch_66
    move-exception v0

    move-object/from16 v19, v3

    :goto_54
    move-object/from16 v21, v15

    goto :goto_55

    :catch_67
    move-exception v0

    move-object/from16 v19, v3

    goto :goto_55

    :catch_68
    move-exception v0

    move-object/from16 v19, v3

    move-object/from16 v13, v22

    :goto_55
    move-object v3, v0

    :try_start_75
    invoke-static {v3}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    goto :goto_56

    :cond_2a
    move-object/from16 v19, v3

    move-object/from16 v13, v22

    :goto_56
    const/16 v3, 0x64

    if-ne v8, v3, :cond_2d

    const-string v3, "<item>[^<]*<title>\u7b2c([0-9]+)\u4f4d\uff1a([^<]+)</title>[^<]*<link>([^<]+)</link>[^<]*<guid isPermaLink=\"[^\"]*\">[^<]+</guid>[^<]*<pubDate>[^<]+</pubDate>[^<]*<description><!\\[CDATA\\[[^<]*<p class=\"nico-thumbnail\"><img alt=\"[^\"]*\" src=\"([^\"]*)\"[^>]*></p>.+?<p class=\"nico-info\"><small><strong class=\"nico-info-number\">[^<]+</strong>pts.\uff5c<strong class=\"nico-info-length\">([^<]+)</strong>\uff5c<strong class=\"nico-info-date\">([^<]+)</strong> \u6295\u7a3f<br/><strong>\u5408\u8a08</strong>&nbsp;&#x20;\u518d\u751f\uff1a<strong class=\"nico-info-total-view\">([^<]+)</strong>&nbsp;&#x20;\u30b3\u30e1\u30f3\u30c8\uff1a<strong class=\"nico-info-total-res\">([^<]+)</strong>&nbsp;&#x20;\u30de\u30a4\u30ea\u30b9\u30c8\uff1a<strong class=\"nico-info-total-mylist\">([^<]+)</strong><br/><strong>[^\\]]*\\]\\]></description>[^<]*</item>"

    const/16 v4, 0x20

    invoke-static {v3, v4}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v3

    :goto_57
    invoke-virtual {v3}, Ljava/util/regex/Matcher;->find()Z

    move-result v4

    if-eqz v4, :cond_2d

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

    if-ne v4, v9, :cond_2c

    iget v4, v1, Le/e/a/e0;->j:I

    const/4 v9, 0x3

    if-lt v4, v9, :cond_2b

    const/4 v4, 0x0

    iput v4, v1, Le/e/a/e0;->i:I

    goto :goto_58

    :cond_2b
    const/4 v4, 0x0

    goto :goto_58

    :cond_2c
    const/4 v4, 0x0

    const/4 v9, 0x3

    :goto_58
    move-object/from16 v24, v10

    move-object/from16 v19, v12

    goto/16 :goto_57

    :cond_2d
    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    sub-int v3, v3, v17

    iput v3, v1, Le/e/a/e0;->f:I

    iget v3, v1, Le/e/a/e0;->f:I

    if-lez v3, :cond_2e

    iget-object v3, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v4, Le/e/a/e0$i;

    invoke-direct {v4, v1, v2, v8}, Le/e/a/e0$i;-><init>(Le/e/a/e0;Ljava/util/ArrayList;I)V

    invoke-virtual {v3, v4}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5a

    :cond_2e
    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$j;

    invoke-direct {v3, v1, v8}, Le/e/a/e0$j;-><init>(Le/e/a/e0;I)V

    :goto_59
    invoke-virtual {v2, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    goto :goto_5a

    :cond_2f
    move-object/from16 v16, v5

    iget-object v2, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$a;

    invoke-direct {v3, v1, v6}, Le/e/a/e0$a;-><init>(Le/e/a/e0;Lorg/apache/http/HttpResponse;)V

    goto :goto_59

    :goto_5a
    invoke-interface/range {v16 .. v16}, Lorg/apache/http/client/HttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_75} :catch_69

    goto :goto_5b

    :catch_69
    move-exception v0

    move-object v2, v0

    invoke-static {v2}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    :goto_5b
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

    if-ne v0, v10, :cond_0

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

    goto :goto_0

    :cond_0
    const/16 v10, 0x9

    if-ne v0, v10, :cond_1

    iget-object v0, v1, Le/e/a/e0;->p:Landroid/content/Context;

    iget-object v10, v1, Le/e/a/e0;->m:Lorg/apache/http/client/CookieStore;

    const-string v11, "https://nvapi.nicovideo.jp/v1/users/me/watch-later?pageSize=500&page=1"

    invoke-static {v0, v11, v10}, Le/e/a/v0;->a(Landroid/content/Context;Ljava/lang/String;Lorg/apache/http/client/CookieStore;)Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_2

    iget-object v0, v1, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v2, Le/e/a/e0$c;

    invoke-direct {v2, v1}, Le/e/a/e0$c;-><init>(Le/e/a/e0;)V

    move-object v3, v2

    move-object v2, v1

    goto/16 :goto_9

    :cond_2
    :try_start_0
    new-instance v10, Lorg/json/JSONObject;

    invoke-direct {v10, v0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v0, "data"

    invoke-virtual {v10, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v10
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_9
    .catch Ljava/text/ParseException; {:try_start_0 .. :try_end_0} :catch_8

    const-string v11, "mylist"

    if-eqz v10, :cond_3

    :try_start_1
    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    goto :goto_1

    :cond_3
    invoke-virtual {v0, v11}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    :goto_1
    const-string v8, "items"

    invoke-virtual {v0, v8}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v8

    const/4 v10, 0x0

    :goto_2
    invoke-virtual {v8}, Lorg/json/JSONArray;->length()I

    move-result v12
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_9
    .catch Ljava/text/ParseException; {:try_start_1 .. :try_end_1} :catch_8

    const-string v13, ""

    const-string v14, "description"

    if-ge v10, v12, :cond_5

    :try_start_2
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

    if-eqz v0, :cond_4

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_4

    invoke-virtual {v12, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_4

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

    :cond_4
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
    :try_end_2
    .catch Lorg/json/JSONException; {:try_start_2 .. :try_end_2} :catch_9
    .catch Ljava/text/ParseException; {:try_start_2 .. :try_end_2} :catch_8

    move-object/from16 v21, v9

    :try_start_3
    invoke-virtual {v0, v4}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v9
    :try_end_3
    .catch Lorg/json/JSONException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/text/ParseException; {:try_start_3 .. :try_end_3} :catch_4

    move-object/from16 v22, v2

    int-to-long v1, v9

    :try_start_4
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
    :try_end_4
    .catch Lorg/json/JSONException; {:try_start_4 .. :try_end_4} :catch_3
    .catch Ljava/text/ParseException; {:try_start_4 .. :try_end_4} :catch_2

    move-object/from16 v2, p0

    :try_start_5
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
    :try_end_5
    .catch Lorg/json/JSONException; {:try_start_5 .. :try_end_5} :catch_1
    .catch Ljava/text/ParseException; {:try_start_5 .. :try_end_5} :catch_0

    move-object/from16 v1, v21

    :try_start_6
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

    goto/16 :goto_2

    :catch_0
    move-exception v0

    goto :goto_5

    :catch_1
    move-exception v0

    goto :goto_5

    :catch_2
    move-exception v0

    :goto_3
    move-object/from16 v2, p0

    goto :goto_5

    :catch_3
    move-exception v0

    goto :goto_3

    :catch_4
    move-exception v0

    :goto_4
    move-object v2, v1

    :goto_5
    move-object/from16 v1, v21

    goto :goto_7

    :catch_5
    move-exception v0

    goto :goto_4

    :cond_5
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

    if-eqz v0, :cond_6

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->isNull(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6

    invoke-virtual {v4, v14}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0, v13}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-object v3, v2, Le/e/a/e0;->e:Ljava/util/HashMap;

    invoke-virtual {v3, v14, v0}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_6
    .catch Lorg/json/JSONException; {:try_start_6 .. :try_end_6} :catch_7
    .catch Ljava/text/ParseException; {:try_start_6 .. :try_end_6} :catch_6

    goto :goto_8

    :catch_6
    move-exception v0

    goto :goto_7

    :catch_7
    move-exception v0

    goto :goto_7

    :catch_8
    move-exception v0

    :goto_6
    move-object v2, v1

    move-object v1, v9

    goto :goto_7

    :catch_9
    move-exception v0

    goto :goto_6

    :goto_7
    invoke-static {v0}, Lnicoid/network238/LegacyGet258;->logListErrorRC3(Ljava/lang/Throwable;)V

    :cond_6
    :goto_8
    new-instance v0, Le/e/a/e0$d;

    invoke-direct {v0, v2}, Le/e/a/e0$d;-><init>(Le/e/a/e0;)V

    invoke-static {v1, v0}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    iget-object v0, v2, Le/e/a/e0;->l:Landroid/os/Handler;

    new-instance v3, Le/e/a/e0$e;

    invoke-direct {v3, v2, v1}, Le/e/a/e0$e;-><init>(Le/e/a/e0;Ljava/util/ArrayList;)V

    :goto_9
    invoke-virtual {v0, v3}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void
.end method
