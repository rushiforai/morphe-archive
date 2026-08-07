.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Interceptor;


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    .line 5
    .line 6
    return-void
.end method

.method public static a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 1

    if-eqz p0, :cond_0

    .line 30
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 31
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object p0

    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object p0

    :cond_0
    return-object p0
.end method

.method public static a(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "Content-Length"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_1

    .line 8
    .line 9
    const-string v0, "Content-Encoding"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const-string v0, "Content-Type"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_0

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    const/4 p0, 0x0

    .line 27
    return p0

    .line 28
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 29
    return p0
.end method

.method public static b(Ljava/lang/String;)Z
    .locals 1

    .line 1
    const-string v0, "Connection"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    const-string v0, "Keep-Alive"

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_0

    .line 16
    .line 17
    const-string v0, "Proxy-Authenticate"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_0

    .line 24
    .line 25
    const-string v0, "Proxy-Authorization"

    .line 26
    .line 27
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const-string v0, "TE"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    const-string v0, "Trailers"

    .line 42
    .line 43
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    if-nez v0, :cond_0

    .line 48
    .line 49
    const-string v0, "Transfer-Encoding"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-nez v0, :cond_0

    .line 56
    .line 57
    const-string v0, "Upgrade"

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    if-nez p0, :cond_0

    .line 64
    .line 65
    const/4 p0, 0x1

    .line 66
    return p0

    .line 67
    :cond_0
    const/4 p0, 0x0

    .line 68
    return p0
.end method


# virtual methods
.method public intercept(Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;)Lcom/tencent/cloud/ai/network/okhttp3/Response;
    .locals 30

    move-object/from16 v0, p0

    .line 1
    iget-object v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    if-eqz v1, :cond_0

    .line 2
    invoke-interface/range {p1 .. p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    move-result-object v3

    invoke-interface {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->b(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 3
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    .line 4
    invoke-interface/range {p1 .. p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    move-result-object v5

    const/4 v7, -0x1

    if-eqz v1, :cond_7

    .line 5
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide v10

    .line 6
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide v12

    .line 7
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object v14

    .line 8
    invoke-virtual {v14}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    move-result v15

    move/from16 v20, v7

    const/4 v6, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    :goto_1
    if-ge v6, v15, :cond_6

    .line 9
    invoke-virtual {v14, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    move-result-object v8

    .line 10
    invoke-virtual {v14, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    move-result-object v9

    const-string v2, "Date"

    .line 11
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 12
    invoke-static {v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/b;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v19

    move-object/from16 v18, v9

    goto :goto_2

    :cond_1
    const-string v2, "Expires"

    .line 13
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 14
    invoke-static {v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/b;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v21

    goto :goto_2

    :cond_2
    const-string v2, "Last-Modified"

    .line 15
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 16
    invoke-static {v9}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/b;->a(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v22

    move-object/from16 v17, v9

    goto :goto_2

    :cond_3
    const-string v2, "ETag"

    .line 17
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_4

    move-object/from16 v16, v9

    goto :goto_2

    :cond_4
    const-string v2, "Age"

    .line 18
    invoke-virtual {v2, v8}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 19
    invoke-static {v9, v7}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->a(Ljava/lang/String;I)I

    move-result v20

    :cond_5
    :goto_2
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    :cond_6
    move/from16 v2, v20

    goto :goto_3

    :cond_7
    move v2, v7

    const-wide/16 v10, 0x0

    const-wide/16 v12, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x0

    const/16 v18, 0x0

    const/16 v19, 0x0

    const/16 v21, 0x0

    const/16 v22, 0x0

    :goto_3
    const-string v6, "Warning"

    if-nez v1, :cond_8

    .line 20
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    const/4 v8, 0x0

    invoke-direct {v2, v5, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    goto/16 :goto_10

    :cond_8
    const/4 v8, 0x0

    .line 21
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->isHttps()Z

    move-result v9

    if-eqz v9, :cond_9

    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->handshake()Lcom/tencent/cloud/ai/network/okhttp3/n;

    move-result-object v9

    if-nez v9, :cond_9

    .line 22
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-direct {v2, v5, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    goto/16 :goto_10

    .line 23
    :cond_9
    invoke-static {v1, v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/Request;)Z

    move-result v9

    if-nez v9, :cond_a

    .line 24
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-direct {v2, v5, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    goto/16 :goto_10

    .line 25
    :cond_a
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    move-result-object v8

    .line 26
    iget-boolean v9, v8, Lcom/tencent/cloud/ai/network/okhttp3/d;->a:Z

    if-nez v9, :cond_1e

    .line 27
    const-string v9, "If-Modified-Since"

    invoke-virtual {v5, v9}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    if-nez v14, :cond_1e

    const-string v14, "If-None-Match"

    invoke-virtual {v5, v14}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_b

    goto/16 :goto_f

    .line 28
    :cond_b
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    move-result-object v15

    if-eqz v19, :cond_c

    .line 29
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    move-result-wide v25

    move-object/from16 v27, v8

    sub-long v7, v12, v25

    move-wide/from16 v25, v3

    const-wide/16 v3, 0x0

    invoke-static {v3, v4, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    goto :goto_4

    :cond_c
    move-wide/from16 v25, v3

    move-object/from16 v27, v8

    const-wide/16 v7, 0x0

    :goto_4
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v4, -0x1

    if-eq v2, v4, :cond_d

    move-object v4, v9

    move-wide/from16 v28, v10

    int-to-long v9, v2

    .line 30
    invoke-virtual {v3, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v9

    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v7

    goto :goto_5

    :cond_d
    move-object v4, v9

    move-wide/from16 v28, v10

    :goto_5
    sub-long v9, v12, v28

    sub-long v25, v25, v12

    add-long/2addr v7, v9

    add-long v7, v7, v25

    .line 31
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    move-result-object v2

    .line 32
    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    const/4 v9, -0x1

    if-eq v2, v9, :cond_e

    int-to-long v9, v2

    .line 33
    invoke-virtual {v3, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v9

    :goto_6
    move-object/from16 v2, v27

    const-wide/16 v23, 0x0

    goto :goto_b

    :cond_e
    if-eqz v21, :cond_11

    if-eqz v19, :cond_f

    .line 34
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    .line 35
    :cond_f
    invoke-virtual/range {v21 .. v21}, Ljava/util/Date;->getTime()J

    move-result-wide v9

    sub-long/2addr v9, v12

    const-wide/16 v23, 0x0

    cmp-long v2, v9, v23

    if-lez v2, :cond_10

    goto :goto_6

    :cond_10
    const-wide/16 v23, 0x0

    goto :goto_a

    :cond_11
    if-eqz v22, :cond_10

    .line 36
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    move-result-object v2

    .line 37
    iget-object v9, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->f:Ljava/util/List;

    if-nez v9, :cond_12

    const/4 v2, 0x0

    goto :goto_7

    .line 38
    :cond_12
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    iget-object v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/p;->f:Ljava/util/List;

    invoke-static {v9, v2}, Lcom/tencent/cloud/ai/network/okhttp3/p;->a(Ljava/lang/StringBuilder;Ljava/util/List;)V

    .line 40
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :goto_7
    if-nez v2, :cond_10

    if-eqz v19, :cond_13

    .line 41
    invoke-virtual/range {v19 .. v19}, Ljava/util/Date;->getTime()J

    move-result-wide v10

    goto :goto_8

    :cond_13
    move-wide/from16 v10, v28

    .line 42
    :goto_8
    invoke-virtual/range {v22 .. v22}, Ljava/util/Date;->getTime()J

    move-result-wide v12

    sub-long/2addr v10, v12

    const-wide/16 v23, 0x0

    cmp-long v2, v10, v23

    if-lez v2, :cond_14

    const-wide/16 v12, 0xa

    .line 43
    div-long v9, v10, v12

    :goto_9
    move-object/from16 v2, v27

    goto :goto_b

    :cond_14
    :goto_a
    move-wide/from16 v9, v23

    goto :goto_9

    .line 44
    :goto_b
    iget v11, v2, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    const/4 v12, -0x1

    if-eq v11, v12, :cond_15

    int-to-long v12, v11

    .line 45
    invoke-virtual {v3, v12, v13}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v11

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    .line 46
    :cond_15
    iget v11, v2, Lcom/tencent/cloud/ai/network/okhttp3/d;->i:I

    const/4 v12, -0x1

    if-eq v11, v12, :cond_16

    int-to-long v12, v11

    .line 47
    invoke-virtual {v3, v12, v13}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v11

    goto :goto_c

    :cond_16
    move-wide/from16 v11, v23

    .line 48
    :goto_c
    iget-boolean v13, v15, Lcom/tencent/cloud/ai/network/okhttp3/d;->g:Z

    if-nez v13, :cond_17

    .line 49
    iget v2, v2, Lcom/tencent/cloud/ai/network/okhttp3/d;->h:I

    const/4 v13, -0x1

    if-eq v2, v13, :cond_17

    move-wide/from16 v25, v7

    int-to-long v7, v2

    .line 50
    invoke-virtual {v3, v7, v8}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v2

    goto :goto_d

    :cond_17
    move-wide/from16 v25, v7

    move-wide/from16 v2, v23

    .line 51
    :goto_d
    iget-boolean v7, v15, Lcom/tencent/cloud/ai/network/okhttp3/d;->a:Z

    if-nez v7, :cond_1a

    add-long v7, v25, v11

    add-long/2addr v2, v9

    cmp-long v2, v7, v2

    if-gez v2, :cond_1a

    .line 52
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v2

    cmp-long v3, v7, v9

    if-ltz v3, :cond_18

    const-string v3, "110 HttpURLConnection \"Response is stale\""

    .line 53
    invoke-virtual {v2, v6, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    :cond_18
    const-wide/32 v3, 0x5265c00

    cmp-long v3, v25, v3

    if-lez v3, :cond_19

    .line 54
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    move-result-object v3

    .line 55
    iget v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/d;->c:I

    const/4 v12, -0x1

    if-ne v3, v12, :cond_19

    if-nez v21, :cond_19

    const-string v3, "113 HttpURLConnection \"Heuristic expiration\""

    .line 56
    invoke-virtual {v2, v6, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    .line 57
    :cond_19
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v2

    const/4 v8, 0x0

    invoke-direct {v3, v8, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    move-object v2, v3

    goto :goto_10

    :cond_1a
    if-eqz v16, :cond_1b

    move-object v9, v14

    goto :goto_e

    :cond_1b
    if-eqz v22, :cond_1c

    move-object v9, v4

    move-object/from16 v16, v17

    goto :goto_e

    :cond_1c
    if-eqz v19, :cond_1d

    move-object v9, v4

    move-object/from16 v16, v18

    .line 58
    :goto_e
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a()Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    move-result-object v2

    .line 59
    sget-object v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 60
    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    invoke-interface {v3, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 62
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/o$a;->a:Ljava/util/List;

    invoke-virtual/range {v16 .. v16}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 63
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    move-result-object v3

    .line 64
    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/o;

    invoke-direct {v4, v2}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/o$a;)V

    .line 65
    invoke-virtual {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    move-result-object v2

    .line 66
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    move-result-object v2

    .line 67
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-direct {v3, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    move-object v2, v3

    const/4 v8, 0x0

    goto :goto_10

    .line 68
    :cond_1d
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    const/4 v8, 0x0

    invoke-direct {v2, v5, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    goto :goto_10

    :cond_1e
    :goto_f
    const/4 v8, 0x0

    .line 69
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-direct {v2, v5, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 70
    :goto_10
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    if-eqz v3, :cond_1f

    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->cacheControl()Lcom/tencent/cloud/ai/network/okhttp3/d;

    move-result-object v3

    .line 71
    iget-boolean v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/d;->j:Z

    if-eqz v3, :cond_1f

    .line 72
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;

    invoke-direct {v2, v8, v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 73
    :cond_1f
    iget-object v3, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 74
    iget-object v4, v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->b:Lcom/tencent/cloud/ai/network/okhttp3/Response;

    .line 75
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    if-eqz v5, :cond_20

    .line 76
    invoke-interface {v5, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;)V

    :cond_20
    if-eqz v1, :cond_21

    if-nez v4, :cond_21

    .line 77
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v2

    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    :cond_21
    if-nez v3, :cond_22

    if-nez v4, :cond_22

    .line 78
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    invoke-direct {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;-><init>()V

    .line 79
    invoke-interface/range {p1 .. p1}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->request()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->request(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 80
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->protocol(Lcom/tencent/cloud/ai/network/okhttp3/q;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    const/16 v1, 0x1f8

    .line 81
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->code(I)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    const-string v1, "Unsatisfiable Request (only-if-cached)"

    .line 82
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->c:Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    .line 83
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    const-wide/16 v1, -0x1

    .line 84
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    .line 85
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    .line 86
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v0

    return-object v0

    :cond_22
    if-nez v3, :cond_23

    .line 87
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    .line 88
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->cacheResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    .line 89
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v0

    return-object v0

    :cond_23
    move-object/from16 v2, p1

    .line 90
    :try_start_0
    invoke-interface {v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Interceptor$Chain;->proceed(Lcom/tencent/cloud/ai/network/okhttp3/Request;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez v2, :cond_24

    if-eqz v1, :cond_24

    .line 91
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v1

    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    :cond_24
    if-eqz v4, :cond_2c

    .line 92
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    move-result v1

    const/16 v5, 0x130

    if-ne v1, v5, :cond_2b

    .line 93
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 94
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object v3

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->headers()Lcom/tencent/cloud/ai/network/okhttp3/o;

    move-result-object v5

    .line 95
    new-instance v7, Lcom/tencent/cloud/ai/network/okhttp3/o$a;

    invoke-direct {v7}, Lcom/tencent/cloud/ai/network/okhttp3/o$a;-><init>()V

    .line 96
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    move-result v8

    const/4 v9, 0x0

    :goto_11
    if-ge v9, v8, :cond_28

    .line 97
    invoke-virtual {v3, v9}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    move-result-object v10

    .line 98
    invoke-virtual {v3, v9}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    move-result-object v11

    .line 99
    invoke-virtual {v6, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_25

    const-string v12, "1"

    invoke-virtual {v11, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_25

    goto :goto_12

    .line 100
    :cond_25
    invoke-static {v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_26

    .line 101
    invoke-static {v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->b(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_26

    .line 102
    invoke-virtual {v5, v10}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v12

    if-nez v12, :cond_27

    .line 103
    :cond_26
    sget-object v12, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    invoke-virtual {v12, v7, v10, v11}, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/o$a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_27
    :goto_12
    add-int/lit8 v9, v9, 0x1

    goto :goto_11

    .line 104
    :cond_28
    invoke-virtual {v5}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b()I

    move-result v3

    const/4 v6, 0x0

    :goto_13
    if-ge v6, v3, :cond_2a

    .line 105
    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->a(I)Ljava/lang/String;

    move-result-object v8

    .line 106
    invoke-static {v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Ljava/lang/String;)Z

    move-result v9

    if-nez v9, :cond_29

    invoke-static {v8}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->b(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_29

    .line 107
    sget-object v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    invoke-virtual {v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/o;->b(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v9, v7, v8, v10}, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a(Lcom/tencent/cloud/ai/network/okhttp3/o$a;Ljava/lang/String;Ljava/lang/String;)V

    :cond_29
    add-int/lit8 v6, v6, 0x1

    goto :goto_13

    .line 108
    :cond_2a
    new-instance v3, Lcom/tencent/cloud/ai/network/okhttp3/o;

    invoke-direct {v3, v7}, Lcom/tencent/cloud/ai/network/okhttp3/o;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/o$a;)V

    .line 109
    invoke-virtual {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->headers(Lcom/tencent/cloud/ai/network/okhttp3/o;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 110
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->sentRequestAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 111
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide v5

    invoke-virtual {v1, v5, v6}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->receivedResponseAtMillis(J)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 112
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->cacheResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 113
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v3

    invoke-virtual {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->networkResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 114
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v1

    .line 115
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->close()V

    .line 116
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->a()V

    .line 117
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    invoke-interface {v0, v4, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    return-object v1

    .line 118
    :cond_2b
    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v1

    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 119
    :cond_2c
    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 120
    invoke-static {v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v4

    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->cacheResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 121
    invoke-static {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->networkResponse(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    .line 122
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v1

    .line 123
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    if-eqz v2, :cond_32

    .line 124
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/c;->b(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Z

    move-result v2

    if-eqz v2, :cond_2f

    invoke-static {v1, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/c;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/Request;)Z

    move-result v2

    if-eqz v2, :cond_2f

    .line 125
    iget-object v2, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    invoke-interface {v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;)Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;

    move-result-object v2

    if-nez v2, :cond_2d

    goto :goto_15

    .line 126
    :cond_2d
    invoke-interface {v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;->a()Lcom/tencent/cloud/ai/network/okio/v;

    move-result-object v3

    if-nez v3, :cond_2e

    goto :goto_15

    .line 127
    :cond_2e
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v4

    invoke-virtual {v4}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->source()Lcom/tencent/cloud/ai/network/okio/g;

    move-result-object v4

    .line 128
    invoke-static {v3}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/v;)Lcom/tencent/cloud/ai/network/okio/f;

    move-result-object v3

    .line 129
    new-instance v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;

    invoke-direct {v5, v0, v4, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/a;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;Lcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/b;Lcom/tencent/cloud/ai/network/okio/f;)V

    const-string v0, "Content-Type"

    .line 130
    invoke-virtual {v1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 131
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v2

    .line 132
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v1

    new-instance v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;

    .line 133
    new-instance v6, Lcom/tencent/cloud/ai/network/okio/r;

    invoke-direct {v6, v5}, Lcom/tencent/cloud/ai/network/okio/r;-><init>(Lcom/tencent/cloud/ai/network/okio/w;)V

    .line 134
    invoke-direct {v4, v0, v2, v3, v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/http/d;-><init>(Ljava/lang/String;JLcom/tencent/cloud/ai/network/okio/g;)V

    invoke-virtual {v1, v4}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->body(Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;)Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Response;

    move-result-object v0

    return-object v0

    .line 136
    :cond_2f
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v2

    const-string v4, "POST"

    .line 137
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_31

    const-string v4, "PATCH"

    .line 138
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_31

    const-string v4, "PUT"

    .line 139
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_31

    const-string v4, "DELETE"

    .line 140
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_31

    const-string v4, "MOVE"

    .line 141
    invoke-virtual {v2, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_30

    goto :goto_14

    :cond_30
    return-object v1

    .line 142
    :cond_31
    :goto_14
    :try_start_1
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/CacheInterceptor;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;

    invoke-interface {v0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/cache/d;->a(Lcom/tencent/cloud/ai/network/okhttp3/Request;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    :cond_32
    :goto_15
    return-object v1

    :catchall_0
    move-exception v0

    if-eqz v1, :cond_33

    .line 143
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->body()Lcom/tencent/cloud/ai/network/okhttp3/ResponseBody;

    move-result-object v1

    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 144
    :cond_33
    throw v0
.end method
