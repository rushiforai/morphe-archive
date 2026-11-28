.class public Le/e/a/o2;
.super Ljava/lang/Thread;
.source ""


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/o2$c;
    }
.end annotation


# static fields
.field public static v:Z

.field public static w:Ljava/lang/String;


# instance fields
.field public a:Ljava/lang/String;

.field public b:Ljava/lang/String;

.field public c:J

.field public d:Z

.field public e:Ljava/lang/String;

.field public f:Z

.field public g:Z

.field public i:Z

.field public j:Z

.field public k:Z

.field public l:I

.field public m:Ljava/net/ServerSocket;

.field public n:Le/e/a/l3/m;

.field public o:[Ljava/lang/String;

.field public p:Landroid/content/Context;

.field public q:Ljava/lang/String;

.field public r:J

.field public s:J

.field private volatile stopRequested116:Z

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;


# direct methods
.method private nicoidReDownload270(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z
    .registers 29

    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, p2

    const-string v3, "\u52d5\u753b\u53d6\u5f97\u5b8c\u4e86 : "

    const-string v4, ".mp4"

    const-string v5, "/nicoid/nicoid_cache/"

    const-string v6, " / "

    const-wide/16 v7, 0x0

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    iget-object v9, v1, Le/e/a/o2;->b:Ljava/lang/String;

    sput-object v9, Le/e/a/o2;->w:Ljava/lang/String;

    const/4 v10, 0x0

    if-eqz v2, :cond_0

    const/4 v11, 0x1

    goto :goto_0

    :cond_0
    const/4 v11, 0x0

    :goto_0
    if-nez v0, :cond_1

    return v10

    :cond_1
    :try_start_0
    iget-object v12, v1, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v12}, Le/e/a/o;->a(Landroid/content/Context;)V

    const-string v12, "h"

    iget-object v13, v1, Le/e/a/o2;->t:Ljava/lang/String;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_4

    if-eqz v13, :cond_3

    :goto_1
    :try_start_1
    iget-object v12, v1, Le/e/a/o2;->q:Ljava/lang/String;

    if-nez v12, :cond_2

    const-wide/16 v12, 0xa

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_1

    :cond_2
    iget-object v12, v1, Le/e/a/o2;->q:Ljava/lang/String;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_2

    :catch_0
    move-exception v0

    goto/16 :goto_11

    :cond_3
    :try_start_2
    const-string v13, "low"

    invoke-virtual {v0, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_4

    if-eqz v13, :cond_4

    :try_start_3
    const-string v12, "l"
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    goto :goto_2

    :cond_4
    :try_start_4
    const-string v13, "mid"

    invoke-virtual {v0, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_4

    if-eqz v13, :cond_5

    :try_start_5
    const-string v12, "m"
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    :cond_5
    :goto_2
    :try_start_6
    iget-object v13, v1, Le/e/a/o2;->o:[Ljava/lang/String;

    const/4 v14, 0x2

    aget-object v13, v13, v14

    iget-object v14, v1, Le/e/a/o2;->b:Ljava/lang/String;

    iget-object v15, v1, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v13, v14, v15}, Le/e/a/o;->a(Ljava/lang/String;Ljava/lang/String;Landroid/content/Context;)V

    new-instance v13, Le/e/a/CacheFile;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v15}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v15, v1, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v15, "_"

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v13, v12}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    new-instance v12, Le/e/a/CacheFile;

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v15, v1, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v15}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v15

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v5, v1, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v14, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v12, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v4

    if-eqz v4, :cond_6

    return v10

    :cond_6
    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v4

    iput-wide v4, v1, Le/e/a/o2;->r:J

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-wide v14, v1, Le/e/a/o2;->r:J

    cmp-long v16, v4, v14

    if-gtz v16, :cond_7

    move-object/from16 v4, p3

    goto :goto_3

    :cond_7
    iget-wide v4, v1, Le/e/a/o2;->r:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_3
    new-instance v5, Le/e/a/CacheOutputStream;

    iget-wide v14, v1, Le/e/a/o2;->r:J

    cmp-long v16, v14, v7

    if-lez v16, :cond_8

    const/4 v14, 0x1

    goto :goto_4

    :cond_8
    const/4 v14, 0x0

    :goto_4
    invoke-direct {v5, v13, v14}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;Z)V

    new-instance v14, Ljava/io/BufferedOutputStream;

    invoke-direct {v14, v5}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v15, Lorg/apache/http/impl/client/DefaultHttpClient;

    invoke-direct {v15}, Lorg/apache/http/impl/client/DefaultHttpClient;-><init>()V

    new-instance v9, Lorg/apache/http/client/methods/HttpGet;

    invoke-direct {v9, v0}, Lorg/apache/http/client/methods/HttpGet;-><init>(Ljava/lang/String;)V

    const-string v0, "Cookie"

    iget-object v10, v1, Le/e/a/o2;->a:Ljava/lang/String;

    invoke-virtual {v9, v0, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Connection"

    const-string v10, "keep-alive"

    invoke-virtual {v9, v0, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Accept-Encoding"

    const-string v10, "gzip,deflate"

    invoke-virtual {v9, v0, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    const-string v0, "Accept"

    const-string v10, "*/*"

    invoke-virtual {v9, v0, v10}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v17
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_4

    cmp-long v0, v17, v7

    if-lez v0, :cond_9

    :try_start_7
    const-string v0, "Range"

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v7, "bytes="

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v7, "-"

    invoke-virtual {v10, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v9, v0, v7}, Lorg/apache/http/client/methods/HttpGet;->setHeader(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_1

    goto :goto_5

    :catch_1
    move-exception v0

    goto/16 :goto_10

    :cond_9
    :goto_5
    :try_start_8
    invoke-static {v15, v9}, Lnicoid/network238/LegacyGet258;->executeDownload(Lorg/apache/http/client/HttpClient;Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v7

    invoke-interface {v7}, Lorg/apache/http/HttpEntity;->getContentLength()J

    move-result-wide v7

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v9

    add-long/2addr v7, v9

    iput-wide v7, v1, Le/e/a/o2;->s:J

    new-instance v7, Ljava/io/BufferedInputStream;

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getEntity()Lorg/apache/http/HttpEntity;

    move-result-object v8

    invoke-interface {v8}, Lorg/apache/http/HttpEntity;->getContent()Ljava/io/InputStream;

    move-result-object v8

    invoke-direct {v7, v8}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_4

    if-eqz v11, :cond_b

    :try_start_9
    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getStatusLine()Lorg/apache/http/StatusLine;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->getBytes()[B

    move-result-object v8

    invoke-virtual {v2, v8}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-interface {v0}, Lorg/apache/http/HttpResponse;->getAllHeaders()[Lorg/apache/http/Header;

    move-result-object v0

    array-length v8, v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1

    const/4 v9, 0x0

    :goto_6
    const-string v10, "\r\n"

    if-ge v9, v8, :cond_a

    :try_start_a
    aget-object v19, v0, v9

    move-object/from16 p2, v0

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    move/from16 p3, v8

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/Header;->getName()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v8, ": "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-interface/range {v19 .. v19}, Lorg/apache/http/Header;->getValue()Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v0, p2

    move/from16 v8, p3

    goto :goto_6

    :cond_a
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_a
    .catch Ljava/lang/Exception; {:try_start_a .. :try_end_a} :catch_1

    :cond_b
    :try_start_b
    iget-object v0, v1, Le/e/a/o2;->p:Landroid/content/Context;

    iget-wide v8, v1, Le/e/a/o2;->s:J

    invoke-static {v0, v8, v9}, Le/e/a/o;->a(Landroid/content/Context;J)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v8, "\u52d5\u753b\u53d6\u5f97\u958b\u59cb : "

    invoke-virtual {v0, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, v1, Le/e/a/o2;->r:J

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, v1, Le/e/a/o2;->s:J

    invoke-virtual {v0, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/16 v0, 0x2000

    new-array v0, v0, [B

    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    move-result-wide v8

    move-wide/from16 p2, v8

    iget-wide v8, v1, Le/e/a/o2;->r:J
    :try_end_b
    .catch Ljava/lang/Exception; {:try_start_b .. :try_end_b} :catch_4

    move-wide/from16 v19, p2

    :goto_7
    :try_start_c
    invoke-virtual {v7, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v10

    const/4 v4, -0x1

    if-eq v10, v4, :cond_f

    sget-boolean v4, Le/e/a/o2;->v:Z
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    if-nez v4, :cond_f

    move-object/from16 v21, v12

    move-object v4, v13

    int-to-long v12, v10

    add-long v12, v19, v12

    cmp-long v22, v12, v8

    if-lez v22, :cond_d

    cmp-long v22, v19, v8

    if-gtz v22, :cond_c

    move-wide/from16 v22, v12

    sub-long v12, v8, v19

    long-to-int v13, v12

    goto :goto_8

    :cond_c
    move-wide/from16 v22, v12

    const/4 v13, 0x0

    :goto_8
    sub-int v12, v10, v13

    move-wide/from16 v19, v8

    :try_start_d
    iget-wide v8, v1, Le/e/a/o2;->r:J
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_2
    .catchall {:try_start_d .. :try_end_d} :catchall_0

    move-object/from16 v24, v4

    move-object/from16 p3, v5

    int-to-long v4, v12

    add-long/2addr v8, v4

    :try_start_e
    iput-wide v8, v1, Le/e/a/o2;->r:J

    invoke-virtual {v14, v0, v13, v12}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_9

    :catchall_0
    move-exception v0

    move-object/from16 p3, v5

    move-object/from16 v5, v21

    goto/16 :goto_d

    :catch_2
    move-object/from16 v24, v4

    move-object/from16 p3, v5

    goto :goto_a

    :cond_d
    move-object/from16 v24, v4

    move-object/from16 p3, v5

    move-wide/from16 v19, v8

    move-wide/from16 v22, v12

    :goto_9
    if-eqz v11, :cond_e

    iget-boolean v4, v1, Le/e/a/o2;->i:Z

    if-nez v4, :cond_e

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v10}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_e
    .catch Ljava/lang/Exception; {:try_start_e .. :try_end_e} :catch_3
    .catchall {:try_start_e .. :try_end_e} :catchall_1

    goto :goto_b

    :catchall_1
    move-exception v0

    move-object/from16 v5, v21

    move-object/from16 v4, v24

    goto/16 :goto_d

    :catch_3
    :goto_a
    const/4 v10, 0x1

    goto :goto_c

    :cond_e
    :goto_b
    move-object/from16 v5, p3

    move-wide/from16 v8, v19

    move-object/from16 v12, v21

    move-wide/from16 v19, v22

    move-object/from16 v13, v24

    goto :goto_7

    :cond_f
    move-object/from16 p3, v5

    move-object/from16 v21, v12

    move-object/from16 v24, v13

    const/4 v10, 0x0

    :goto_c
    if-eqz v11, :cond_10

    if-nez v10, :cond_10

    :try_start_f
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_10

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_10
    invoke-virtual {v14}, Ljava/io/BufferedOutputStream;->close()V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, v1, Le/e/a/o2;->r:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v2, v1, Le/e/a/o2;->s:J

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/4 v2, 0x0

    sput-object v2, Le/e/a/o2;->w:Ljava/lang/String;

    if-nez v10, :cond_11

    invoke-virtual/range {p3 .. p3}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_11
    invoke-virtual {v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    iget-wide v2, v1, Le/e/a/o2;->s:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_12

    iget-wide v2, v1, Le/e/a/o2;->r:J

    iget-wide v4, v1, Le/e/a/o2;->s:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_12

    move-object/from16 v5, v21

    move-object/from16 v4, v24

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    iget-object v0, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    if-eqz v0, :cond_16

    iget-object v0, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Le/e/a/l3/m;->a(I)V

    goto/16 :goto_12

    :cond_12
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_16

    if-eqz v11, :cond_16

    const/4 v2, 0x0

    iput-boolean v2, v1, Le/e/a/o2;->d:Z
    :try_end_f
    .catch Ljava/lang/Exception; {:try_start_f .. :try_end_f} :catch_0

    goto :goto_12

    :catchall_2
    move-exception v0

    move-object/from16 p3, v5

    move-object v5, v12

    move-object v4, v13

    :goto_d
    if-eqz v11, :cond_13

    :try_start_10
    sget-boolean v8, Le/e/a/o2;->v:Z

    if-nez v8, :cond_13

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_10
    .catch Ljava/lang/Exception; {:try_start_10 .. :try_end_10} :catch_1

    :cond_13
    :try_start_11
    invoke-virtual {v14}, Ljava/io/BufferedOutputStream;->close()V

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, v1, Le/e/a/o2;->r:J

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v8, v1, Le/e/a/o2;->s:J

    invoke-virtual {v2, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/4 v2, 0x0

    sput-object v2, Le/e/a/o2;->w:Ljava/lang/String;

    invoke-virtual/range {p3 .. p3}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v2

    invoke-interface {v2}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    iget-wide v2, v1, Le/e/a/o2;->s:J
    :try_end_11
    .catch Ljava/lang/Exception; {:try_start_11 .. :try_end_11} :catch_4

    const-wide/16 v6, 0x0

    cmp-long v8, v2, v6

    if-eqz v8, :cond_14

    :try_start_12
    iget-wide v2, v1, Le/e/a/o2;->r:J

    iget-wide v6, v1, Le/e/a/o2;->s:J

    cmp-long v8, v2, v6

    if-nez v8, :cond_14

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    iget-object v2, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    if-eqz v2, :cond_15

    iget-object v2, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Le/e/a/l3/m;->a(I)V
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_12 .. :try_end_12} :catch_1

    goto :goto_e

    :cond_14
    :try_start_13
    sget-boolean v2, Le/e/a/o2;->v:Z
    :try_end_13
    .catch Ljava/lang/Exception; {:try_start_13 .. :try_end_13} :catch_4

    if-nez v2, :cond_15

    if-eqz v11, :cond_15

    const/4 v4, 0x0

    :try_start_14
    iput-boolean v4, v1, Le/e/a/o2;->d:Z

    goto :goto_f

    :cond_15
    :goto_e
    const/4 v4, 0x0

    :goto_f
    throw v0
    :try_end_14
    .catch Ljava/lang/Exception; {:try_start_14 .. :try_end_14} :catch_1

    :catch_4
    move-exception v0

    const/4 v4, 0x0

    :goto_10
    const/4 v10, 0x0

    :goto_11
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_16
    :goto_12
    return v10
.end method


# virtual methods
.method public declared-synchronized a(Ljava/net/Socket;)V
    .registers 19

    move-object/from16 v8, p0

    monitor-enter p0

    const/4 v9, 0x0

    :try_start_0
    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getInetAddress()Ljava/net/InetAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/net/InetAddress;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getPort()I

    move-result v1

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "\u63a5\u7d9a\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v3, v8, Le/e/a/o2;->l:I

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, "  IP\uff1a"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " \u30dd\u30fc\u30c8\uff1a"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v10

    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-direct {v2, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v11, Ljava/io/BufferedReader;

    new-instance v1, Ljava/io/InputStreamReader;

    const-string v3, "UTF-8"

    invoke-direct {v1, v10, v3}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/lang/String;)V

    invoke-direct {v11, v1}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    const-string v1, ""

    const-string v3, ""

    const-string v4, ""

    const-wide/16 v5, 0x0

    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v5

    move-object v6, v3

    move-object v3, v1

    :cond_0
    :goto_0
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    const/4 v7, 0x1

    if-eqz v1, :cond_5

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v12

    if-nez v12, :cond_1

    goto/16 :goto_3

    :cond_1
    const-string v12, "GET"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    const-string v12, "HEAD"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_4

    const-string v12, "POST"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    goto :goto_1

    :cond_2
    const-string v7, "Host"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    const-string v12, "Cookie"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    or-int/2addr v7, v12

    if-eqz v7, :cond_3

    goto :goto_2

    :cond_3
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\r\n"

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_2

    :cond_4
    :goto_1
    const-string v3, "\\s"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v6, v3, v9

    aget-object v3, v3, v7

    const-string v7, "^/"

    const-string v12, ""

    invoke-virtual {v3, v7, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_2
    const-string v7, "Range"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_0

    const-string v7, "[:\\s,\\-=]+"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v7, v1

    const/4 v12, 0x2

    if-le v7, v12, :cond_0

    aget-object v7, v1, v12

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_0

    aget-object v1, v1, v12

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    move-object v5, v1

    goto/16 :goto_0

    :cond_5
    :goto_3
    const-string v1, "http"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object v1, v8, Le/e/a/o2;->a:Ljava/lang/String;

    if-eqz v1, :cond_10

    iget-boolean v1, v8, Le/e/a/o2;->j:Z

    if-eqz v1, :cond_6

    iget-boolean v1, v8, Le/e/a/o2;->d:Z

    if-nez v1, :cond_6

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-eqz v1, :cond_6

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    iget-object v12, v8, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_6

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    iput-boolean v7, v8, Le/e/a/o2;->g:Z

    sget-wide v12, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    iput-wide v12, v8, Le/e/a/o2;->r:J

    sget-wide v12, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    iput-wide v12, v8, Le/e/a/o2;->s:J

    :cond_6
    iget-object v1, v8, Le/e/a/o2;->b:Ljava/lang/String;

    if-eqz v1, :cond_7

    new-instance v1, Le/e/a/CacheFile;

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v13, v8, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v13}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, "/nicoid/nicoid_cache/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v8, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v13, ".mp4"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    invoke-direct {v1, v12}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v12

    if-eqz v12, :cond_7

    iget-object v12, v8, Le/e/a/o2;->n:Le/e/a/l3/m;

    invoke-interface {v12, v9}, Le/e/a/l3/m;->a(I)V

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    iput-boolean v7, v8, Le/e/a/o2;->f:Z

    invoke-virtual {v8, v2, v3, v1, v5}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/io/File;Ljava/lang/Long;)Z

    :cond_7
    iget-boolean v1, v8, Le/e/a/o2;->f:Z

    if-nez v1, :cond_f

    iget-boolean v1, v8, Le/e/a/o2;->j:Z

    if-eqz v1, :cond_f

    iget-boolean v1, v8, Le/e/a/o2;->d:Z

    if-nez v1, :cond_f

    iget-object v1, v8, Le/e/a/o2;->o:[Ljava/lang/String;

    if-eqz v1, :cond_f

    iget-object v1, v8, Le/e/a/o2;->b:Ljava/lang/String;

    if-eqz v1, :cond_f

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    const-string v1, "h"

    iget-object v12, v8, Le/e/a/o2;->t:Ljava/lang/String;

    if-eqz v12, :cond_9

    :goto_4
    iget-object v1, v8, Le/e/a/o2;->q:Ljava/lang/String;

    if-nez v1, :cond_8

    const-wide/16 v12, 0xa

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_4

    :cond_8
    iget-object v1, v8, Le/e/a/o2;->q:Ljava/lang/String;

    goto :goto_5

    :cond_9
    const-string v12, "low"

    invoke-virtual {v3, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_a

    const-string v1, "l"

    goto :goto_5

    :cond_a
    const-string v12, "mid"

    invoke-virtual {v3, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_b

    const-string v1, "m"

    :cond_b
    :goto_5
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u30ad\u30e3\u30c3\u30b7\u30e5\u518d\u751f\u3084\u3093videoQuality:"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v13, v8, Le/e/a/o2;->q:Ljava/lang/String;

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v12, Le/e/a/CacheFile;

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v14, v8, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v14}, Le/e/a/o;->c(Landroid/content/Context;)Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "/nicoid/nicoid_cache/"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v14, v8, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v14, "_"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, ".mp4"

    invoke-virtual {v13, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v12, v1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_d

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    invoke-virtual {v12}, Ljava/io/File;->length()J

    move-result-wide v15

    cmp-long v1, v13, v15

    if-gtz v1, :cond_c

    goto :goto_6

    :cond_c
    const/4 v1, 0x1

    goto :goto_7

    :cond_d
    :goto_6
    const/4 v1, 0x0

    :goto_7
    if-eqz v1, :cond_e

    new-instance v12, Le/e/a/o2$c;

    invoke-direct {v12, v8, v3}, Le/e/a/o2$c;-><init>(Le/e/a/o2;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/lang/Thread;->start()V

    goto :goto_8

    :cond_e
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u30b9\u30c8\u30ea\u30ad\u30e3\u30c3\u30b7\u30e5\u518d\u751f\uff1a"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v8, v2, v3, v5}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z

    goto :goto_8

    :cond_f
    const/4 v1, 0x1

    :goto_8
    iget-boolean v12, v8, Le/e/a/o2;->f:Z

    if-nez v12, :cond_11

    if-eqz v1, :cond_11

    iput-boolean v7, v8, Le/e/a/o2;->i:Z

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    move-object/from16 v1, p0

    move-object v5, v6

    move-wide v6, v12

    invoke-virtual/range {v1 .. v7}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z

    goto :goto_9

    :cond_10
    const-string v1, "comment.json"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_11

    invoke-virtual {v8, v2}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;)V

    :cond_11
    :goto_9
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->close()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_a

    :catchall_0
    move-exception v0

    goto :goto_b

    :catch_0
    move-exception v0

    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_a
    iput-boolean v9, v8, Le/e/a/o2;->k:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    :goto_b
    monitor-exit p0

    goto :goto_d

    :goto_c
    throw v0

    :goto_d
    goto :goto_c
.end method

.method public declared-synchronized a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/io/File;Ljava/lang/Long;)Z
    .registers 13

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p2, :cond_0

    monitor-exit p0

    return v0

    :cond_0
    :try_start_0
    invoke-virtual {p3}, Ljava/io/File;->length()J

    move-result-wide v1

    iput-wide v1, p0, Le/e/a/o2;->s:J

    new-instance p2, Le/e/a/CacheInputStream;

    invoke-direct {p2, p3}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    new-instance p3, Ljava/io/BufferedInputStream;

    invoke-direct {p3, p2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    invoke-virtual {p3, v3, v4}, Ljava/io/BufferedInputStream;->skip(J)J

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    const-wide/16 v5, 0x0

    cmp-long v7, v3, v5

    if-lez v7, :cond_1

    const-string v3, "HTTP/1.1 206 Partial Content\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    goto :goto_0

    :cond_1
    const-string v3, "HTTP/1.1 200 OK\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    :goto_0
    const-string v3, "Content-Type: video/mp4\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    const-string v3, "Accept-Ranges: bytes\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v3

    cmp-long v7, v3, v5

    if-lez v7, :cond_2

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Content-Range: bytes "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, p4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v4, "-"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-wide/16 v4, 0x1

    sub-long v4, v1, v4

    invoke-virtual {v3, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v4, "\r\n"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    :cond_2
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "Content-Length:"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    sub-long/2addr v1, v4

    invoke-virtual {v3, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, "\r\n"

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    const-string v1, "Connection: close\r\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    const-string v1, "\r\n"

    invoke-virtual {v1}, Ljava/lang/String;->getBytes()[B

    move-result-object v1

    invoke-virtual {p1, v1}, Ljava/io/BufferedOutputStream;->write([B)V

    const/16 v1, 0x1000

    new-array v1, v1, [B

    invoke-virtual {p4}, Ljava/lang/Long;->longValue()J

    move-result-wide v2
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    :goto_1
    :try_start_1
    invoke-virtual {p3, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result p4

    const/4 v4, -0x1

    if-eq p4, v4, :cond_3

    sget-boolean v4, Le/e/a/o2;->v:Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v4, :cond_3

    int-to-long v4, p4

    add-long/2addr v2, v4

    :try_start_2
    iput-wide v2, p0, Le/e/a/o2;->r:J

    invoke-virtual {p1, v1, v0, p4}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_1

    :catch_0
    const/4 v0, 0x1

    :cond_3
    if-nez v0, :cond_4

    :try_start_3
    sget-boolean p4, Le/e/a/o2;->v:Z

    if-nez p4, :cond_4

    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_4
    invoke-virtual {p3}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/FileInputStream;->close()V

    goto :goto_2

    :catchall_0
    move-exception p4

    sget-boolean v1, Le/e/a/o2;->v:Z

    if-nez v1, :cond_5

    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_5
    invoke-virtual {p3}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/FileInputStream;->close()V

    throw p4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception p1

    goto :goto_3

    :catch_1
    move-exception p1

    :try_start_4
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    :goto_2
    monitor-exit p0

    return v0

    :goto_3
    monitor-exit p0

    goto :goto_5

    :goto_4
    throw p1

    :goto_5
    goto :goto_4
.end method

.method public a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z
    .registers 5

    invoke-static {}, Lnicoid/network238/LegacyGet258;->beginDownload()V

    :try_start_0
    invoke-direct/range {p0 .. p3}, Le/e/a/o2;->nicoidReDownload270(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    invoke-static {}, Lnicoid/network238/LegacyGet258;->endDownload()V

    return v0

    :catchall_0
    move-exception v0

    invoke-static {}, Lnicoid/network238/LegacyGet258;->endDownload()V

    throw v0
.end method

.method public declared-synchronized a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z
    .registers 23

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    move-object/from16 v2, p4

    monitor-enter p0

    const/4 v3, 0x0

    if-nez v0, :cond_0

    monitor-exit p0

    return v3

    :cond_0
    :try_start_0
    invoke-static/range {p2 .. p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const-string v5, "https"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-eqz v0, :cond_1

    :try_start_1
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x1bb

    invoke-virtual {v0, v5, v6}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :goto_0
    move-object v5, v0

    goto :goto_2

    :catch_0
    move-exception v0

    goto/16 :goto_9

    :cond_1
    :try_start_2
    new-instance v0, Ljava/net/Socket;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Landroid/net/Uri;->getPort()I

    move-result v6

    if-gez v6, :cond_2

    const/16 v6, 0x50

    goto :goto_1

    :cond_2
    invoke-virtual {v4}, Landroid/net/Uri;->getPort()I

    move-result v6

    :goto_1
    invoke-direct {v0, v5, v6}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    goto :goto_0

    :goto_2
    invoke-virtual {v5}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    invoke-virtual {v5}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v7

    new-instance v8, Ljava/io/BufferedInputStream;

    invoke-direct {v8, v6}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    new-instance v9, Ljava/io/BufferedOutputStream;

    invoke-direct {v9, v7}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "?"

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4}, Landroid/net/Uri;->getQuery()Ljava/lang/String;

    move-result-object v10
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    if-nez v10, :cond_3

    :try_start_3
    const-string v0, ""
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_3
    :try_start_4
    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, " HTTP/1.1\r\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "Host: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v11, "\r\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "uri.getPort(): "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getPort()I

    move-result v11

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v11, "\r\n"

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    const-string v11, "\u30c7\u30d0\u30c3\u30b0 cookiestring: "

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v11, v1, Le/e/a/o2;->a:Ljava/lang/String;

    invoke-virtual {v10, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    new-instance v10, Ljava/lang/StringBuilder;

    invoke-direct {v10}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " "

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v10, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, " HTTP/1.1\r\n"

    invoke-virtual {v10, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v10}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Host: "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Cookie:"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v2, v1, Le/e/a/o2;->a:Ljava/lang/String;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "\r\n"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual/range {p3 .. p3}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    const-string v0, "\r\n"

    invoke-virtual {v0}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/io/BufferedOutputStream;->write([B)V

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->flush()V

    const/16 v0, 0x2000

    new-array v0, v0, [B
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    move-wide/from16 v11, p5

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_3
    :try_start_5
    invoke-virtual {v8, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_a

    sget-boolean v14, Le/e/a/o2;->v:Z

    if-nez v14, :cond_a

    if-nez v2, :cond_8

    new-instance v2, Ljava/lang/String;

    const-string v14, "UTF-8"

    invoke-direct {v2, v0, v14}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    const-string v14, "\r\n"

    invoke-virtual {v2, v14}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "hea.length:"

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length v3, v2

    invoke-virtual {v14, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    const/4 v3, 0x0

    :goto_4
    array-length v14, v2

    if-ge v3, v14, :cond_7

    aget-object v14, v2, v3

    const-string v15, "HTTP/1.1 40"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_4

    const/4 v4, 0x1

    goto :goto_5

    :cond_4
    const-string v15, "HTTP/1.1 302"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_5

    const/4 v10, 0x1

    :cond_5
    const-string v15, "Content-Length"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_6

    const-string v2, ":"

    invoke-virtual {v14, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    const/4 v14, 0x1

    aget-object v2, v2, v14

    invoke-virtual {v2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result v2

    int-to-long v2, v2

    add-long v2, v2, p5

    iput-wide v2, v1, Le/e/a/o2;->s:J

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "cachetotalsize:"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v1, Le/e/a/o2;->s:J

    invoke-virtual {v2, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    goto :goto_5

    :cond_6
    add-int/lit8 v3, v3, 0x1

    goto :goto_4

    :cond_7
    :goto_5
    move-object/from16 v2, p1

    const/4 v3, 0x1

    const/4 v14, 0x0

    goto :goto_6

    :cond_8
    move v3, v2

    const/4 v14, 0x0

    move-object/from16 v2, p1

    :goto_6
    :try_start_6
    invoke-virtual {v2, v0, v14, v13}, Ljava/io/BufferedOutputStream;->write([BII)V

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    if-eqz v10, :cond_9

    goto :goto_7

    :cond_9
    int-to-long v14, v13

    add-long/2addr v11, v14

    :try_start_7
    iput-wide v11, v1, Le/e/a/o2;->r:J

    new-instance v13, Ljava/lang/StringBuilder;

    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    const-string v14, "cacheloadsize:"

    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v14, v1, Le/e/a/o2;->s:J

    move/from16 p3, v3

    iget-wide v2, v1, Le/e/a/o2;->r:J

    sub-long/2addr v14, v2

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    move/from16 v2, p3

    const/4 v3, 0x0

    goto/16 :goto_3

    :catch_1
    const/4 v3, 0x1

    goto :goto_8

    :cond_a
    :goto_7
    move v3, v4

    :goto_8
    :try_start_8
    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v5}, Ljava/net/Socket;->close()V

    if-nez v3, :cond_c

    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_c

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    goto :goto_a

    :catchall_0
    move-exception v0

    move v3, v4

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v5}, Ljava/net/Socket;->close()V

    if-nez v3, :cond_b

    sget-boolean v2, Le/e/a/o2;->v:Z

    if-nez v2, :cond_b

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_b
    throw v0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_0
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_b

    :catch_2
    move-exception v0

    const/4 v3, 0x0

    :goto_9
    :try_start_9
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    :cond_c
    :goto_a
    monitor-exit p0

    return v3

    :goto_b
    monitor-exit p0

    goto :goto_d

    :goto_c
    throw v0

    :goto_d
    goto :goto_c
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Le/e/a/o2;->stopRequested116:Z

    sput-boolean v0, Le/e/a/o2;->v:Z

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/o2;->a:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/o2;->l:I

    :try_start_0
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_0
    :goto_0
    return-void
.end method

.method public run()V
    .registers 5

    const/4 v0, 0x0

    const/4 v3, 0x0

    :try_start_0
    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    const/4 v2, 0x1

    if-nez v1, :cond_0

    const/4 v0, 0x1

    :cond_0
    if-nez v0, :cond_1

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_1

    const/4 v0, 0x1

    :cond_1
    if-eqz v0, :cond_2

    new-instance v0, Ljava/net/ServerSocket;

    const v1, 0xce7e

    invoke-direct {v0, v1}, Ljava/net/ServerSocket;-><init>(I)V

    iput-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v0, v2}, Ljava/net/ServerSocket;->setReuseAddress(Z)V

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "\u63a5\u7d9a "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_2
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/o2$a;

    invoke-direct {v1, p0}, Le/e/a/o2$a;-><init>(Le/e/a/o2;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    iget-object v0, p0, Le/e/a/o2;->t:Ljava/lang/String;

    if-eqz v0, :cond_3

    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Le/e/a/o2$b;

    invoke-direct {v1, p0}, Le/e/a/o2$b;-><init>(Le/e/a/o2;)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_0
    .catch Ljava/net/BindException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1

    :cond_3
    :goto_0
    :try_start_1
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_5

    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_5

    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    monitor-enter v0
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    iget-boolean v1, p0, Le/e/a/o2;->k:Z

    if-nez v1, :cond_4

    iput-boolean v2, p0, Le/e/a/o2;->k:Z

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    const/4 v3, 0x1

    invoke-virtual {v1}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v1

    const/4 v3, 0x0

    invoke-virtual {v1, v2}, Ljava/net/Socket;->setReuseAddress(Z)V

    invoke-virtual {p0, v1}, Le/e/a/o2;->a(Ljava/net/Socket;)V

    :cond_4
    monitor-exit v0

    goto :goto_0

    :catchall_0
    move-exception v1

    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    :try_start_3
    throw v1
    :try_end_3
    .catch Ljava/net/SocketException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :cond_5
    :try_start_4
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v0, :cond_8

    :goto_1
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;
    :try_end_4
    .catch Ljava/net/BindException; {:try_start_4 .. :try_end_4} :catch_2
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1

    goto :goto_3

    :catchall_1
    move-exception v0

    :try_start_5
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    :try_start_6
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;
    :try_end_6
    .catch Ljava/net/BindException; {:try_start_6 .. :try_end_6} :catch_2
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_1

    if-eqz v0, :cond_8

    goto :goto_1

    :catch_0
    move-exception v0

    :try_start_7
    if-eqz v3, :cond_6

    iget-boolean v1, p0, Le/e/a/o2;->stopRequested116:Z

    if-eqz v1, :cond_6

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v1, :cond_6

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v1

    if-eqz v1, :cond_6

    goto :goto_2

    :cond_6
    invoke-virtual {v0}, Ljava/net/SocketException;->printStackTrace()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :goto_2
    :try_start_8
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v0, :cond_8

    goto :goto_1

    :goto_3
    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V

    goto :goto_4

    :catchall_2
    move-exception v0

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v1, :cond_7

    iget-object v1, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    invoke-virtual {v1}, Ljava/net/ServerSocket;->close()V

    :cond_7
    throw v0
    :try_end_8
    .catch Ljava/net/BindException; {:try_start_8 .. :try_end_8} :catch_2
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1

    :catch_1
    move-exception v0

    const-string v1, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-static {v1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    goto :goto_4

    :catch_2
    move-exception v0

    const-string v1, "BindException"

    invoke-static {v1}, Le/b/a/a/a;->a(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    :cond_8
    :goto_4
    return-void
.end method
