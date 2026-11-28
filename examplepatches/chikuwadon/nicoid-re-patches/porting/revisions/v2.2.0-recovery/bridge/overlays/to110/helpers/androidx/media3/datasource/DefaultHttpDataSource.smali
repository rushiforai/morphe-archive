.class public Landroidx/media3/datasource/DefaultHttpDataSource;
.super Landroidx/media3/datasource/BaseDataSource;
.source "DefaultHttpDataSource.java"

# interfaces
.implements Landroidx/media3/datasource/HttpDataSource;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Landroidx/media3/datasource/DefaultHttpDataSource$NullFilteringHeadersMap;,
        Landroidx/media3/datasource/DefaultHttpDataSource$Factory;
    }
.end annotation


# static fields
.field public static final DEFAULT_CONNECT_TIMEOUT_MILLIS:I = 0x1f40

.field public static final DEFAULT_READ_TIMEOUT_MILLIS:I = 0x1f40

.field private static final HTTP_STATUS_PERMANENT_REDIRECT:I = 0x134

.field private static final HTTP_STATUS_TEMPORARY_REDIRECT:I = 0x133

.field private static final MAX_REDIRECTS:I = 0x14

.field private static final TAG:Ljava/lang/String; = "DefaultHttpDataSource"


# instance fields
.field private final allowCrossProtocolRedirects:Z

.field private bytesRead:J

.field private bytesToRead:J

.field private final connectTimeoutMillis:I

.field private connection:Ljava/net/HttpURLConnection;

.field private final contentTypePredicate:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private final crossProtocolRedirectsForceOriginal:Z

.field private dataSpec:Landroidx/media3/datasource/DataSpec;

.field private final defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

.field private inputStream:Ljava/io/InputStream;

.field private final keepPostFor302Redirects:Z

.field private final readTimeoutMillis:I

.field private final requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

.field private responseCode:I

.field private transferStarted:Z

.field private final userAgent:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/lang/String;IIZZLandroidx/media3/datasource/HttpDataSource$RequestProperties;Lcom/google/common/base/Predicate;Z)V
    .registers 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "IIZZ",
            "Landroidx/media3/datasource/HttpDataSource$RequestProperties;",
            "Lcom/google/common/base/Predicate<",
            "Ljava/lang/String;",
            ">;Z)V"
        }
    .end annotation

    const/4 v0, 0x1

    .line 279
    invoke-direct {p0, v0}, Landroidx/media3/datasource/BaseDataSource;-><init>(Z)V

    .line 280
    iput-object p1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->userAgent:Ljava/lang/String;

    .line 281
    iput p2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connectTimeoutMillis:I

    .line 282
    iput p3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->readTimeoutMillis:I

    .line 283
    iput-boolean p4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->allowCrossProtocolRedirects:Z

    .line 284
    iput-boolean p5, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->crossProtocolRedirectsForceOriginal:Z

    if-eqz p4, :cond_0

    if-eqz p5, :cond_0

    .line 286
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string p1, "crossProtocolRedirectsForceOriginal should not be set if allowCrossProtocolRedirects is true"

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 290
    :cond_0
    iput-object p6, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    .line 291
    iput-object p7, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->contentTypePredicate:Lcom/google/common/base/Predicate;

    .line 292
    new-instance p1, Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-direct {p1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;-><init>()V

    iput-object p1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    .line 293
    iput-boolean p8, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->keepPostFor302Redirects:Z

    return-void
.end method

.method synthetic constructor <init>(Ljava/lang/String;IIZZLandroidx/media3/datasource/HttpDataSource$RequestProperties;Lcom/google/common/base/Predicate;ZLandroidx/media3/datasource/DefaultHttpDataSource$1;)V
    .registers 10

    .line 66
    invoke-direct/range {p0 .. p8}, Landroidx/media3/datasource/DefaultHttpDataSource;-><init>(Ljava/lang/String;IIZZLandroidx/media3/datasource/HttpDataSource$RequestProperties;Lcom/google/common/base/Predicate;Z)V

    return-void
.end method

.method private closeConnectionQuietly()V
    .registers 3

    .line 795
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz p0, :cond_0

    .line 797
    :try_start_0
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->disconnect()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 799
    const-string v0, "DefaultHttpDataSource"

    const-string v1, "Unexpected error while disconnecting"

    invoke-static {v0, v1, p0}, Landroidx/media3/common/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_0
    return-void
.end method

.method private static getCurrentThreadId()J
    .registers 3

    .line 811
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    .line 812
    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x24

    if-ge v1, v2, :cond_0

    invoke-virtual {v0}, Ljava/lang/Thread;->getId()J

    move-result-wide v0

    return-wide v0

    :cond_0
    invoke-virtual {v0}, Ljava/lang/Thread;->threadId()J

    move-result-wide v0

    return-wide v0
.end method

.method private handleRedirect(Ljava/net/URL;Ljava/lang/String;Landroidx/media3/datasource/DataSpec;)Ljava/net/URL;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    const/4 v0, 0x1

    const/16 v1, 0x7d1

    if-eqz p2, :cond_3

    .line 679
    :try_start_0
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/net/MalformedURLException; {:try_start_0 .. :try_end_0} :catch_1

    .line 689
    invoke-virtual {v2}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p2

    .line 690
    const-string v3, "https"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    const-string v3, "http"

    invoke-virtual {v3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_0

    .line 691
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v2, "Unsupported protocol redirect: "

    invoke-direct {p1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p3, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    .line 697
    :cond_0
    iget-boolean v3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->allowCrossProtocolRedirects:Z

    if-nez v3, :cond_2

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 698
    iget-boolean p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->crossProtocolRedirectsForceOriginal:Z

    if-eqz p0, :cond_1

    .line 710
    :try_start_1
    new-instance p0, Ljava/net/URL;

    invoke-virtual {v2}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p2, p1}, Ljava/lang/String;->replaceFirst(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/MalformedURLException; {:try_start_1 .. :try_end_1} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 712
    new-instance p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    invoke-direct {p1, p0, p3, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p1

    .line 699
    :cond_1
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Disallowed cross-protocol redirect ("

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 701
    invoke-virtual {p1}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " to "

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ")"

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1, p3, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    :cond_2
    return-object v2

    :catch_1
    move-exception p0

    .line 681
    new-instance p1, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    invoke-direct {p1, p0, p3, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p1

    .line 670
    :cond_3
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    const-string p1, "Null location redirect"

    invoke-direct {p0, p1, p3, v1, v0}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;II)V

    throw p0
.end method

.method private static isCompressed(Ljava/net/HttpURLConnection;)Z
    .registers 2

    .line 805
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 806
    const-string v0, "gzip"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p0

    return p0
.end method

.method private makeConnection(Landroidx/media3/datasource/DataSpec;)Ljava/net/HttpURLConnection;
    .registers 18
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v11, p1

    .line 516
    new-instance v1, Ljava/net/URL;

    iget-object v2, v11, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    invoke-virtual {v2}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 517
    iget v2, v11, Landroidx/media3/datasource/DataSpec;->httpMethod:I

    .line 518
    iget-object v3, v11, Landroidx/media3/datasource/DataSpec;->httpBody:[B

    .line 519
    iget-wide v4, v11, Landroidx/media3/datasource/DataSpec;->position:J

    .line 520
    iget-wide v6, v11, Landroidx/media3/datasource/DataSpec;->length:J

    const/4 v12, 0x1

    .line 521
    invoke-virtual {v11, v12}, Landroidx/media3/datasource/DataSpec;->isFlagSet(I)Z

    move-result v8

    .line 523
    iget-boolean v9, v0, Landroidx/media3/datasource/DefaultHttpDataSource;->allowCrossProtocolRedirects:Z

    if-nez v9, :cond_0

    iget-boolean v9, v0, Landroidx/media3/datasource/DefaultHttpDataSource;->crossProtocolRedirectsForceOriginal:Z

    if-nez v9, :cond_0

    iget-boolean v9, v0, Landroidx/media3/datasource/DefaultHttpDataSource;->keepPostFor302Redirects:Z

    if-nez v9, :cond_0

    const/4 v9, 0x1

    .line 528
    iget-object v10, v11, Landroidx/media3/datasource/DataSpec;->httpRequestHeaders:Ljava/util/Map;

    invoke-direct/range {v0 .. v10}, Landroidx/media3/datasource/DefaultHttpDataSource;->makeConnection(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object v0

    return-object v0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    add-int/lit8 v13, v0, 0x1

    const/16 v9, 0x14

    if-gt v0, v9, :cond_8

    const/4 v9, 0x0

    .line 543
    iget-object v10, v11, Landroidx/media3/datasource/DataSpec;->httpRequestHeaders:Ljava/util/Map;

    move-object/from16 v0, p0

    .line 544
    invoke-direct/range {v0 .. v10}, Landroidx/media3/datasource/DefaultHttpDataSource;->makeConnection(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object v9

    .line 553
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v10

    .line 554
    const-string v14, "Location"

    invoke-virtual {v9, v14}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const/16 v15, 0x12e

    if-eq v2, v12, :cond_1

    const/4 v12, 0x3

    if-ne v2, v12, :cond_2

    :cond_1
    const/16 v12, 0x12c

    if-eq v10, v12, :cond_7

    const/16 v12, 0x12d

    if-eq v10, v12, :cond_7

    if-eq v10, v15, :cond_7

    const/16 v12, 0x12f

    if-eq v10, v12, :cond_7

    const/16 v12, 0x133

    if-eq v10, v12, :cond_7

    const/16 v12, 0x134

    if-eq v10, v12, :cond_7

    :cond_2
    const/4 v12, 0x2

    if-ne v2, v12, :cond_6

    const/16 v12, 0x12c

    if-eq v10, v12, :cond_3

    const/16 v12, 0x12d

    if-eq v10, v12, :cond_3

    if-eq v10, v15, :cond_3

    const/16 v12, 0x12f

    if-ne v10, v12, :cond_6

    .line 569
    :cond_3
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 570
    iget-boolean v9, v0, Landroidx/media3/datasource/DefaultHttpDataSource;->keepPostFor302Redirects:Z

    if-eqz v9, :cond_4

    if-eq v10, v15, :cond_5

    :cond_4
    const/4 v3, 0x0

    const/4 v2, 0x1

    .line 577
    :cond_5
    invoke-direct {v0, v1, v14, v11}, Landroidx/media3/datasource/DefaultHttpDataSource;->handleRedirect(Ljava/net/URL;Ljava/lang/String;Landroidx/media3/datasource/DataSpec;)Ljava/net/URL;

    move-result-object v1

    goto :goto_1

    :cond_6
    return-object v9

    .line 562
    :cond_7
    invoke-virtual {v9}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 563
    invoke-direct {v0, v1, v14, v11}, Landroidx/media3/datasource/DefaultHttpDataSource;->handleRedirect(Ljava/net/URL;Ljava/lang/String;Landroidx/media3/datasource/DataSpec;)Ljava/net/URL;

    move-result-object v1

    :goto_1
    move v0, v13

    const/4 v12, 0x1

    goto :goto_0

    .line 584
    :cond_8
    new-instance v0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    new-instance v1, Ljava/net/NoRouteToHostException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Too many redirects: "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/NoRouteToHostException;-><init>(Ljava/lang/String;)V

    const/16 v2, 0x7d1

    const/4 v3, 0x1

    invoke-direct {v0, v1, v11, v2, v3}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v0
.end method

.method private makeConnection(Ljava/net/URL;I[BJJZZLjava/util/Map;)Ljava/net/HttpURLConnection;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "I[BJJZZ",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/net/HttpURLConnection;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object v2, p0

    .line 613
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;

    move-result-object p1

    .line 614
    iget v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connectTimeoutMillis:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 615
    iget v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->readTimeoutMillis:I

    invoke-virtual {p1, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 617
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 618
    iget-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->defaultRequestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    if-eqz v1, :cond_0

    .line 619
    invoke-virtual {v1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->getSnapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 621
    :cond_0
    iget-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {v1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->getSnapshot()Ljava/util/Map;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 622
    invoke-interface {v0, p10}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    move-object v3, v0

    .line 624
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p10

    invoke-interface {p10}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p10

    :goto_0
    invoke-interface {p10}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 625
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {p1, v1, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_0

    .line 628
    :cond_1
    invoke-static {p4, p5, p6, p7}, Landroidx/media3/datasource/HttpUtil;->buildRangeRequestHeader(JJ)Ljava/lang/String;

    move-result-object p4

    if-eqz p4, :cond_2

    .line 630
    const-string p5, "Range"

    invoke-virtual {p1, p5, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 632
    :cond_2
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->userAgent:Ljava/lang/String;

    if-eqz p0, :cond_3

    .line 633
    const-string p4, "User-Agent"

    invoke-virtual {p1, p4, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    if-eqz p8, :cond_4

    .line 635
    const-string p0, "gzip"

    goto :goto_1

    :cond_4
    const-string p0, "identity"

    :goto_1
    const-string p4, "Accept-Encoding"

    invoke-virtual {p1, p4, p0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 636
    invoke-virtual {p1, p9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    if-eqz p3, :cond_5

    const/4 p0, 0x1

    goto :goto_2

    :cond_5
    const/4 p0, 0x0

    .line 637
    :goto_2
    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    .line 638
    invoke-static {p2}, Landroidx/media3/datasource/DataSpec;->getStringForHttpMethod(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    if-eqz p3, :cond_6

    .line 641
    array-length p0, p3

    invoke-virtual {p1, p0}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V

    .line 642
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    .line 643
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    .line 644
    invoke-virtual {p0, p3}, Ljava/io/OutputStream;->write([B)V

    .line 645
    invoke-virtual {p0}, Ljava/io/OutputStream;->close()V

    return-object p1

    .line 647
    :cond_6
    invoke-static {v2, p1, v3}, Lnicoid/network238/MediaConnection257;->select(Ljava/lang/Object;Ljava/net/HttpURLConnection;Ljava/util/Map;)Ljava/net/HttpURLConnection;

    move-result-object p1

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->connect()V

    return-object p1
.end method

.method private readInternal([BII)I
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p3, :cond_0

    const/4 p0, 0x0

    return p0

    .line 775
    :cond_0
    iget-wide v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    const/4 v3, -0x1

    if-eqz v2, :cond_2

    .line 776
    iget-wide v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesRead:J

    sub-long/2addr v0, v4

    const-wide/16 v4, 0x0

    cmp-long v2, v0, v4

    if-nez v2, :cond_1

    return v3

    :cond_1
    int-to-long v4, p3

    .line 780
    invoke-static {v4, v5, v0, v1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v0

    long-to-int p3, v0

    .line 783
    :cond_2
    iget-object v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    invoke-static {v0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/InputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/InputStream;->read([BII)I

    move-result p1

    if-ne p1, v3, :cond_3

    return v3

    .line 788
    :cond_3
    iget-wide p2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesRead:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesRead:J

    .line 789
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesTransferred(I)V

    return p1
.end method

.method private skipFully(JLandroidx/media3/datasource/DataSpec;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-eqz v2, :cond_2

    const/16 v2, 0x1000

    .line 735
    new-array v2, v2, [B

    :goto_0
    cmp-long v3, p1, v0

    if-lez v3, :cond_2

    const-wide/16 v3, 0x1000

    .line 737
    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    .line 738
    iget-object v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    invoke-static {v4}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/io/InputStream;

    const/4 v5, 0x0

    invoke-virtual {v4, v2, v5, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .line 739
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v4

    const/4 v5, 0x1

    if-nez v4, :cond_1

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    int-to-long v4, v3

    sub-long/2addr p1, v4

    .line 753
    invoke-virtual {p0, v3}, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesTransferred(I)V

    goto :goto_0

    .line 747
    :cond_0
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    const/16 p1, 0x7d8

    invoke-direct {p0, p3, p1, v5}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    .line 740
    :cond_1
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    new-instance p1, Ljava/io/InterruptedIOException;

    invoke-direct {p1}, Ljava/io/InterruptedIOException;-><init>()V

    const/16 p2, 0x7d0

    invoke-direct {p0, p1, p3, p2, v5}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    :cond_2
    return-void
.end method


# virtual methods
.method public clearAllRequestProperties()V
    .registers 1

    .line 350
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {p0}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->clear()V

    return-void
.end method

.method public clearRequestProperty(Ljava/lang/String;)V
    .registers 2

    .line 343
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 344
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {p0, p1}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->remove(Ljava/lang/String;)V

    return-void
.end method

.method public close()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    .line 489
    :try_start_0
    iget-object v2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v2, :cond_0

    .line 492
    :try_start_1
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catch_0
    move-exception v2

    .line 494
    :try_start_2
    new-instance v3, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    iget-object v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 496
    invoke-static {v4}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroidx/media3/datasource/DataSpec;

    const/16 v5, 0x7d0

    const/4 v6, 0x3

    invoke-direct {v3, v2, v4, v5, v6}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw v3
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 502
    :cond_0
    :goto_0
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    .line 503
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 504
    iget-boolean v2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    if-eqz v2, :cond_1

    .line 505
    iput-boolean v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    .line 506
    invoke-virtual {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->transferEnded()V

    .line 508
    :cond_1
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    .line 509
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 510
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    return-void

    :catchall_0
    move-exception v2

    .line 502
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    .line 503
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 504
    iget-boolean v3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    if-eqz v3, :cond_2

    .line 505
    iput-boolean v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    .line 506
    invoke-virtual {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->transferEnded()V

    .line 508
    :cond_2
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    .line 509
    iput-object v1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 510
    invoke-static {}, Landroid/net/TrafficStats;->clearThreadStatsTag()V

    .line 511
    throw v2
.end method

.method public getResponseCode()I
    .registers 2

    .line 312
    iget-object v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    iget p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    if-lez p0, :cond_0

    return p0

    :cond_0
    const/4 p0, -0x1

    return p0
.end method

.method public getResponseHeaders()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;>;"
        }
    .end annotation

    .line 318
    iget-object v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-nez v0, :cond_0

    .line 319
    invoke-static {}, Lcom/google/common/collect/ImmutableMap;->of()Lcom/google/common/collect/ImmutableMap;

    move-result-object p0

    return-object p0

    .line 329
    :cond_0
    new-instance v0, Landroidx/media3/datasource/DefaultHttpDataSource$NullFilteringHeadersMap;

    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object p0

    invoke-direct {v0, p0}, Landroidx/media3/datasource/DefaultHttpDataSource$NullFilteringHeadersMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method

.method public getUri()Landroid/net/Uri;
    .registers 2

    .line 300
    iget-object v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_0

    .line 301
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    .line 302
    :cond_0
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    if-eqz p0, :cond_1

    .line 303
    iget-object p0, p0, Landroidx/media3/datasource/DataSpec;->uri:Landroid/net/Uri;

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public open(Landroidx/media3/datasource/DataSpec;)J
    .registers 16
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .line 357
    iput-object p1, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    const-wide/16 v0, 0x0

    .line 358
    iput-wide v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesRead:J

    .line 359
    iput-wide v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    .line 360
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->transferInitializing(Landroidx/media3/datasource/DataSpec;)V

    const/4 v2, 0x1

    .line 365
    :try_start_0
    invoke-static {}, Landroidx/media3/datasource/DefaultHttpDataSource;->getCurrentThreadId()J

    move-result-wide v3

    long-to-int v3, v3

    invoke-static {v3}, Landroid/net/TrafficStats;->setThreadStatsTag(I)V

    .line 366
    invoke-direct {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->makeConnection(Landroidx/media3/datasource/DataSpec;)Ljava/net/HttpURLConnection;

    move-result-object v3

    iput-object v3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->connection:Ljava/net/HttpURLConnection;

    .line 368
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    iput v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    .line 369
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseMessage()Ljava/lang/String;

    move-result-object v7
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3

    .line 377
    iget v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    const-string v5, "Content-Range"

    const/16 v6, 0xc8

    const-wide/16 v8, -0x1

    if-lt v4, v6, :cond_7

    const/16 v10, 0x12b

    if-gt v4, v10, :cond_7

    .line 408
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v4

    .line 409
    iget-object v7, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->contentTypePredicate:Lcom/google/common/base/Predicate;

    if-eqz v7, :cond_0

    invoke-interface {v7, v4}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_0

    .line 410
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 411
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$InvalidContentTypeException;

    invoke-direct {p0, v4, p1}, Landroidx/media3/datasource/HttpDataSource$InvalidContentTypeException;-><init>(Ljava/lang/String;Landroidx/media3/datasource/DataSpec;)V

    throw p0

    .line 417
    :cond_0
    iget v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    if-ne v4, v6, :cond_1

    iget-wide v6, p1, Landroidx/media3/datasource/DataSpec;->position:J

    cmp-long v4, v6, v0

    if-eqz v4, :cond_1

    iget-wide v0, p1, Landroidx/media3/datasource/DataSpec;->position:J

    .line 420
    :cond_1
    invoke-static {v3}, Landroidx/media3/datasource/DefaultHttpDataSource;->isCompressed(Ljava/net/HttpURLConnection;)Z

    move-result v4

    if-nez v4, :cond_4

    .line 422
    iget-wide v6, p1, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long v6, v6, v8

    if-eqz v6, :cond_2

    .line 423
    iget-wide v5, p1, Landroidx/media3/datasource/DataSpec;->length:J

    iput-wide v5, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    goto :goto_0

    .line 425
    :cond_2
    const-string v6, "Content-Length"

    .line 427
    invoke-virtual {v3, v6}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    .line 428
    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 426
    invoke-static {v6, v5}, Landroidx/media3/datasource/HttpUtil;->getContentLength(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v5

    cmp-long v7, v5, v8

    if-eqz v7, :cond_3

    sub-long v8, v5, v0

    .line 430
    :cond_3
    iput-wide v8, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    goto :goto_0

    .line 436
    :cond_4
    iget-wide v5, p1, Landroidx/media3/datasource/DataSpec;->length:J

    iput-wide v5, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    :goto_0
    const/16 v5, 0x7d0

    .line 440
    :try_start_1
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v3

    iput-object v3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    if-eqz v4, :cond_5

    .line 442
    new-instance v3, Ljava/util/zip/GZIPInputStream;

    iget-object v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;

    invoke-direct {v3, v4}, Ljava/util/zip/GZIPInputStream;-><init>(Ljava/io/InputStream;)V

    iput-object v3, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->inputStream:Ljava/io/InputStream;
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    .line 453
    :cond_5
    iput-boolean v2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    .line 454
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted(Landroidx/media3/datasource/DataSpec;)V

    .line 457
    :try_start_2
    invoke-direct {p0, v0, v1, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->skipFully(JLandroidx/media3/datasource/DataSpec;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0

    .line 471
    iget-wide p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->bytesToRead:J

    return-wide p0

    :catch_0
    move-exception v0

    .line 459
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 461
    instance-of p0, v0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    if-eqz p0, :cond_6

    .line 462
    check-cast v0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    throw v0

    .line 464
    :cond_6
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    invoke-direct {p0, v0, p1, v5, v2}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    :catch_1
    move-exception v0

    .line 445
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 446
    new-instance p0, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    invoke-direct {p0, v0, p1, v5, v2}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;-><init>(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;II)V

    throw p0

    :cond_7
    move-wide v10, v8

    .line 378
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getHeaderFields()Ljava/util/Map;

    move-result-object v9

    .line 379
    iget v4, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    const/16 v6, 0x1a0

    if-ne v4, v6, :cond_9

    .line 381
    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroidx/media3/datasource/HttpUtil;->getDocumentSize(Ljava/lang/String;)J

    move-result-wide v4

    .line 382
    iget-wide v12, p1, Landroidx/media3/datasource/DataSpec;->position:J

    cmp-long v4, v12, v4

    if-nez v4, :cond_9

    .line 383
    iput-boolean v2, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted:Z

    .line 384
    invoke-virtual {p0, p1}, Landroidx/media3/datasource/DefaultHttpDataSource;->transferStarted(Landroidx/media3/datasource/DataSpec;)V

    .line 385
    iget-wide v2, p1, Landroidx/media3/datasource/DataSpec;->length:J

    cmp-long p0, v2, v10

    if-eqz p0, :cond_8

    iget-wide p0, p1, Landroidx/media3/datasource/DataSpec;->length:J

    return-wide p0

    :cond_8
    return-wide v0

    .line 389
    :cond_9
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    if-eqz v0, :cond_a

    .line 393
    :try_start_3
    invoke-static {v0}, Lcom/google/common/io/ByteStreams;->toByteArray(Ljava/io/InputStream;)[B

    move-result-object v0

    goto :goto_1

    :cond_a
    sget-object v0, Landroidx/media3/common/util/Util;->EMPTY_BYTE_ARRAY:[B
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2

    :goto_1
    move-object v11, v0

    goto :goto_2

    .line 395
    :catch_2
    sget-object v0, Landroidx/media3/common/util/Util;->EMPTY_BYTE_ARRAY:[B

    goto :goto_1

    .line 397
    :goto_2
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 400
    iget v0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    if-ne v0, v6, :cond_b

    .line 401
    new-instance v0, Landroidx/media3/datasource/DataSourceException;

    const/16 v1, 0x7d8

    invoke-direct {v0, v1}, Landroidx/media3/datasource/DataSourceException;-><init>(I)V

    goto :goto_3

    :cond_b
    const/4 v0, 0x0

    :goto_3
    move-object v8, v0

    .line 403
    new-instance v5, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;

    iget v6, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->responseCode:I

    move-object v10, p1

    invoke-direct/range {v5 .. v11}, Landroidx/media3/datasource/HttpDataSource$InvalidResponseCodeException;-><init>(ILjava/lang/String;Ljava/io/IOException;Ljava/util/Map;Landroidx/media3/datasource/DataSpec;[B)V

    throw v5

    :catch_3
    move-exception v0

    move-object v10, p1

    move-object p1, v0

    .line 371
    invoke-direct {p0}, Landroidx/media3/datasource/DefaultHttpDataSource;->closeConnectionQuietly()V

    .line 372
    invoke-static {p1, v10, v2}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;->createForIOException(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;I)Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    move-result-object p0

    throw p0
.end method

.method openConnection(Ljava/net/URL;)Ljava/net/HttpURLConnection;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 655
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    check-cast p0, Ljava/net/HttpURLConnection;

    return-object p0
.end method

.method public read([BII)I
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;
        }
    .end annotation

    .line 478
    :try_start_0
    invoke-direct {p0, p1, p2, p3}, Landroidx/media3/datasource/DefaultHttpDataSource;->readInternal([BII)I

    move-result p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    move-exception p1

    .line 480
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->dataSpec:Landroidx/media3/datasource/DataSpec;

    .line 481
    invoke-static {p0}, Landroidx/media3/common/util/Util;->castNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroidx/media3/datasource/DataSpec;

    const/4 p2, 0x2

    .line 480
    invoke-static {p1, p0, p2}, Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;->createForIOException(Ljava/io/IOException;Landroidx/media3/datasource/DataSpec;I)Landroidx/media3/datasource/HttpDataSource$HttpDataSourceException;

    move-result-object p0

    throw p0
.end method

.method public setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    .line 335
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 336
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    iget-object p0, p0, Landroidx/media3/datasource/DefaultHttpDataSource;->requestProperties:Landroidx/media3/datasource/HttpDataSource$RequestProperties;

    invoke-virtual {p0, p1, p2}, Landroidx/media3/datasource/HttpDataSource$RequestProperties;->set(Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
