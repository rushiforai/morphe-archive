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

.field public t:Ljava/lang/String;

.field public u:Ljava/lang/String;


# virtual methods
.method public declared-synchronized a(Ljava/net/Socket;)V
    .registers 19

    move-object/from16 v8, p0

    monitor-enter p0

    const/4 v9, 0x0

    :try_start_4
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

    :cond_59
    :goto_59
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v1

    const/4 v7, 0x1

    if-eqz v1, :cond_df

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v12

    if-nez v12, :cond_68

    goto/16 :goto_df

    :cond_68
    const-string v12, "GET"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_a6

    const-string v12, "HEAD"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-nez v12, :cond_a6

    const-string v12, "POST"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_81

    goto :goto_a6

    :cond_81
    const-string v7, "Host"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    const-string v12, "Cookie"

    invoke-virtual {v1, v12}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v12

    or-int/2addr v7, v12

    if-eqz v7, :cond_91

    goto :goto_b8

    :cond_91
    new-instance v7, Ljava/lang/StringBuilder;

    invoke-direct {v7}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "\r\n"

    invoke-virtual {v7, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    goto :goto_b8

    :cond_a6
    :goto_a6
    const-string v3, "\\s"

    invoke-virtual {v1, v3}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    aget-object v6, v3, v9

    aget-object v3, v3, v7

    const-string v7, "^/"

    const-string v12, ""

    invoke-virtual {v3, v7, v12}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    :goto_b8
    const-string v7, "Range"

    invoke-virtual {v1, v7}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_59

    const-string v7, "[:\\s,\\-=]+"

    invoke-virtual {v1, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v7, v1

    const/4 v12, 0x2

    if-le v7, v12, :cond_59

    aget-object v7, v1, v12

    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v7

    if-lez v7, :cond_59

    aget-object v1, v1, v12

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v12

    invoke-static {v12, v13}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    move-object v5, v1

    goto/16 :goto_59

    :cond_df
    :goto_df
    const-string v1, "http"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_211

    iget-object v1, v8, Le/e/a/o2;->a:Ljava/lang/String;

    if-eqz v1, :cond_211

    iget-boolean v1, v8, Le/e/a/o2;->j:Z

    if-eqz v1, :cond_10d

    iget-boolean v1, v8, Le/e/a/o2;->d:Z

    if-nez v1, :cond_10d

    sget-boolean v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->v:Z

    if-eqz v1, :cond_10d

    sget-object v1, Lcom/sauzask/nicoid/NicoidDownloadCache;->t:Ljava/lang/String;

    iget-object v12, v8, Le/e/a/o2;->b:Ljava/lang/String;

    invoke-virtual {v1, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10d

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    iput-boolean v7, v8, Le/e/a/o2;->g:Z

    sget-wide v12, Lcom/sauzask/nicoid/NicoidDownloadCache;->s:J

    iput-wide v12, v8, Le/e/a/o2;->r:J

    sget-wide v12, Lcom/sauzask/nicoid/NicoidDownloadCache;->r:J

    iput-wide v12, v8, Le/e/a/o2;->s:J

    :cond_10d
    iget-object v1, v8, Le/e/a/o2;->b:Ljava/lang/String;

    if-eqz v1, :cond_149

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

    if-eqz v12, :cond_149

    iget-object v12, v8, Le/e/a/o2;->n:Le/e/a/l3/m;

    invoke-interface {v12, v9}, Le/e/a/l3/m;->a(I)V

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    iput-boolean v7, v8, Le/e/a/o2;->f:Z

    invoke-virtual {v8, v2, v3, v1, v5}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/io/File;Ljava/lang/Long;)Z

    :cond_149
    iget-boolean v1, v8, Le/e/a/o2;->f:Z

    if-nez v1, :cond_1fc

    iget-boolean v1, v8, Le/e/a/o2;->j:Z

    if-eqz v1, :cond_1fc

    iget-boolean v1, v8, Le/e/a/o2;->d:Z

    if-nez v1, :cond_1fc

    iget-object v1, v8, Le/e/a/o2;->o:[Ljava/lang/String;

    if-eqz v1, :cond_1fc

    iget-object v1, v8, Le/e/a/o2;->b:Ljava/lang/String;

    if-eqz v1, :cond_1fc

    iput-boolean v7, v8, Le/e/a/o2;->d:Z

    const-string v1, "h"

    iget-object v12, v8, Le/e/a/o2;->t:Ljava/lang/String;

    if-eqz v12, :cond_172

    :goto_165
    iget-object v1, v8, Le/e/a/o2;->q:Ljava/lang/String;

    if-nez v1, :cond_16f

    const-wide/16 v12, 0xa

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_165

    :cond_16f
    iget-object v1, v8, Le/e/a/o2;->q:Ljava/lang/String;

    goto :goto_187

    :cond_172
    const-string v12, "low"

    invoke-virtual {v3, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_17d

    const-string v1, "l"

    goto :goto_187

    :cond_17d
    const-string v12, "mid"

    invoke-virtual {v3, v12}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_187

    const-string v1, "m"

    :cond_187
    :goto_187
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

    if-eqz v1, :cond_1dc

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v13

    invoke-virtual {v12}, Ljava/io/File;->length()J

    move-result-wide v15

    cmp-long v1, v13, v15

    if-gtz v1, :cond_1da

    goto :goto_1dc

    :cond_1da
    const/4 v1, 0x1

    goto :goto_1dd

    :cond_1dc
    :goto_1dc
    const/4 v1, 0x0

    :goto_1dd
    if-eqz v1, :cond_1e8

    new-instance v12, Le/e/a/o2$c;

    invoke-direct {v12, v8, v3}, Le/e/a/o2$c;-><init>(Le/e/a/o2;Ljava/lang/String;)V

    invoke-virtual {v12}, Ljava/lang/Thread;->start()V

    goto :goto_1fd

    :cond_1e8
    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    const-string v13, "\u30b9\u30c8\u30ea\u30ad\u30e3\u30c3\u30b7\u30e5\u518d\u751f\uff1a"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v12, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v8, v2, v3, v5}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z

    goto :goto_1fd

    :cond_1fc
    const/4 v1, 0x1

    :goto_1fd
    iget-boolean v12, v8, Le/e/a/o2;->f:Z

    if-nez v12, :cond_21c

    if-eqz v1, :cond_21c

    iput-boolean v7, v8, Le/e/a/o2;->i:Z

    invoke-virtual {v5}, Ljava/lang/Long;->longValue()J

    move-result-wide v12

    move-object/from16 v1, p0

    move-object v5, v6

    move-wide v6, v12

    invoke-virtual/range {v1 .. v7}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z

    goto :goto_21c

    :cond_211
    const-string v1, "comment.json"

    invoke-virtual {v3, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_21c

    invoke-virtual {v8, v2}, Le/e/a/o2;->a(Ljava/io/BufferedOutputStream;)V

    :cond_21c
    :goto_21c
    invoke-virtual {v11}, Ljava/io/BufferedReader;->close()V

    invoke-virtual {v10}, Ljava/io/InputStream;->close()V

    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    invoke-virtual/range {p1 .. p1}, Ljava/net/Socket;->close()V
    :try_end_228
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_228} :catch_22b
    .catchall {:try_start_4 .. :try_end_228} :catchall_229

    goto :goto_243

    :catchall_229
    move-exception v0

    goto :goto_247

    :catch_22b
    move-exception v0

    :try_start_22c
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :goto_243
    iput-boolean v9, v8, Le/e/a/o2;->k:Z
    :try_end_245
    .catchall {:try_start_22c .. :try_end_245} :catchall_229

    monitor-exit p0

    return-void

    :goto_247
    monitor-exit p0

    goto :goto_24a

    :goto_249
    throw v0

    :goto_24a
    goto :goto_249
.end method

.method public declared-synchronized a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/io/File;Ljava/lang/Long;)Z
    .registers 13

    monitor-enter p0

    const/4 v0, 0x0

    if-nez p2, :cond_6

    monitor-exit p0

    return v0

    :cond_6
    :try_start_6
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

    if-lez v7, :cond_31

    const-string v3, "HTTP/1.1 206 Partial Content\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    goto :goto_3a

    :cond_31
    const-string v3, "HTTP/1.1 200 OK\r\n"

    invoke-virtual {v3}, Ljava/lang/String;->getBytes()[B

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/io/BufferedOutputStream;->write([B)V

    :goto_3a
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

    if-lez v7, :cond_85

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

    :cond_85
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
    :try_end_c1
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_c1} :catch_f6
    .catchall {:try_start_6 .. :try_end_c1} :catchall_f4

    :goto_c1
    :try_start_c1
    invoke-virtual {p3, v1}, Ljava/io/BufferedInputStream;->read([B)I

    move-result p4

    const/4 v4, -0x1

    if-eq p4, v4, :cond_d5

    sget-boolean v4, Le/e/a/o2;->v:Z
    :try_end_ca
    .catchall {:try_start_c1 .. :try_end_ca} :catchall_e5

    if-nez v4, :cond_d5

    int-to-long v4, p4

    add-long/2addr v2, v4

    :try_start_ce
    iput-wide v2, p0, Le/e/a/o2;->r:J

    invoke-virtual {p1, v1, v0, p4}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_d3
    .catch Ljava/lang/Exception; {:try_start_ce .. :try_end_d3} :catch_d4
    .catchall {:try_start_ce .. :try_end_d3} :catchall_e5

    goto :goto_c1

    :catch_d4
    const/4 v0, 0x1

    :cond_d5
    if-nez v0, :cond_de

    :try_start_d7
    sget-boolean p4, Le/e/a/o2;->v:Z

    if-nez p4, :cond_de

    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_de
    invoke-virtual {p3}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/FileInputStream;->close()V

    goto :goto_10e

    :catchall_e5
    move-exception p4

    sget-boolean v1, Le/e/a/o2;->v:Z

    if-nez v1, :cond_ed

    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_ed
    invoke-virtual {p3}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {p2}, Ljava/io/FileInputStream;->close()V

    throw p4
    :try_end_f4
    .catch Ljava/lang/Exception; {:try_start_d7 .. :try_end_f4} :catch_f6
    .catchall {:try_start_d7 .. :try_end_f4} :catchall_f4

    :catchall_f4
    move-exception p1

    goto :goto_110

    :catch_f6
    move-exception p1

    :try_start_f7
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string p3, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {p1}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_10e
    .catchall {:try_start_f7 .. :try_end_10e} :catchall_f4

    :goto_10e
    monitor-exit p0

    return v0

    :goto_110
    monitor-exit p0

    goto :goto_113

    :goto_112
    throw p1

    :goto_113
    goto :goto_112
.end method

.method public a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/Long;)Z
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

    if-eqz v2, :cond_1c

    const/4 v11, 0x1

    goto :goto_1d

    :cond_1c
    const/4 v11, 0x0

    :goto_1d
    if-nez v0, :cond_20

    return v10

    :cond_20
    :try_start_20
    iget-object v12, v1, Le/e/a/o2;->p:Landroid/content/Context;

    invoke-static {v12}, Le/e/a/o;->a(Landroid/content/Context;)V

    const-string v12, "h"

    iget-object v13, v1, Le/e/a/o2;->t:Ljava/lang/String;
    :try_end_29
    .catch Ljava/lang/Exception; {:try_start_20 .. :try_end_29} :catch_305

    if-eqz v13, :cond_3b

    :goto_2b
    :try_start_2b
    iget-object v12, v1, Le/e/a/o2;->q:Ljava/lang/String;

    if-nez v12, :cond_35

    const-wide/16 v12, 0xa

    invoke-static {v12, v13}, Ljava/lang/Thread;->sleep(J)V

    goto :goto_2b

    :cond_35
    iget-object v12, v1, Le/e/a/o2;->q:Ljava/lang/String;
    :try_end_37
    .catch Ljava/lang/Exception; {:try_start_2b .. :try_end_37} :catch_38

    goto :goto_50

    :catch_38
    move-exception v0

    goto/16 :goto_308

    :cond_3b
    :try_start_3b
    const-string v13, "low"

    invoke-virtual {v0, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13
    :try_end_41
    .catch Ljava/lang/Exception; {:try_start_3b .. :try_end_41} :catch_305

    if-eqz v13, :cond_46

    :try_start_43
    const-string v12, "l"
    :try_end_45
    .catch Ljava/lang/Exception; {:try_start_43 .. :try_end_45} :catch_38

    goto :goto_50

    :cond_46
    :try_start_46
    const-string v13, "mid"

    invoke-virtual {v0, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v13
    :try_end_4c
    .catch Ljava/lang/Exception; {:try_start_46 .. :try_end_4c} :catch_305

    if-eqz v13, :cond_50

    :try_start_4e
    const-string v12, "m"
    :try_end_50
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_50} :catch_38

    :cond_50
    :goto_50
    :try_start_50
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

    if-eqz v4, :cond_af

    return v10

    :cond_af
    invoke-virtual {v13}, Ljava/io/File;->length()J

    move-result-wide v4

    iput-wide v4, v1, Le/e/a/o2;->r:J

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    iget-wide v14, v1, Le/e/a/o2;->r:J

    cmp-long v16, v4, v14

    if-gtz v16, :cond_c2

    move-object/from16 v4, p3

    goto :goto_c8

    :cond_c2
    iget-wide v4, v1, Le/e/a/o2;->r:J

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    :goto_c8
    new-instance v5, Le/e/a/CacheOutputStream;

    iget-wide v14, v1, Le/e/a/o2;->r:J

    cmp-long v16, v14, v7

    if-lez v16, :cond_d2

    const/4 v14, 0x1

    goto :goto_d3

    :cond_d2
    const/4 v14, 0x0

    :goto_d3
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
    :try_end_105
    .catch Ljava/lang/Exception; {:try_start_50 .. :try_end_105} :catch_305

    cmp-long v0, v17, v7

    if-lez v0, :cond_128

    :try_start_109
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
    :try_end_124
    .catch Ljava/lang/Exception; {:try_start_109 .. :try_end_124} :catch_125

    goto :goto_128

    :catch_125
    move-exception v0

    goto/16 :goto_307

    :cond_128
    :goto_128
    :try_start_128
    invoke-virtual {v15, v9}, Lorg/apache/http/impl/client/DefaultHttpClient;->execute(Lorg/apache/http/client/methods/HttpUriRequest;)Lorg/apache/http/HttpResponse;

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
    :try_end_148
    .catch Ljava/lang/Exception; {:try_start_128 .. :try_end_148} :catch_305

    if-eqz v11, :cond_19d

    :try_start_14a
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
    :try_end_15e
    .catch Ljava/lang/Exception; {:try_start_14a .. :try_end_15e} :catch_125

    const/4 v9, 0x0

    :goto_15f
    const-string v10, "\r\n"

    if-ge v9, v8, :cond_196

    :try_start_163
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

    goto :goto_15f

    :cond_196
    invoke-virtual {v10}, Ljava/lang/String;->getBytes()[B

    move-result-object v0

    invoke-virtual {v2, v0}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_19d
    .catch Ljava/lang/Exception; {:try_start_163 .. :try_end_19d} :catch_125

    :cond_19d
    :try_start_19d
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
    :try_end_1cd
    .catch Ljava/lang/Exception; {:try_start_19d .. :try_end_1cd} :catch_305

    move-wide/from16 v19, p2

    :goto_1cf
    :try_start_1cf
    invoke-virtual {v7, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v10

    const/4 v4, -0x1

    if-eq v10, v4, :cond_236

    sget-boolean v4, Le/e/a/o2;->v:Z
    :try_end_1d8
    .catchall {:try_start_1cf .. :try_end_1d8} :catchall_2a2

    if-nez v4, :cond_236

    move-object/from16 v21, v12

    move-object v4, v13

    int-to-long v12, v10

    add-long v12, v19, v12

    cmp-long v22, v12, v8

    if-lez v22, :cond_20f

    cmp-long v22, v19, v8

    if-gtz v22, :cond_1ee

    move-wide/from16 v22, v12

    sub-long v12, v8, v19

    long-to-int v13, v12

    goto :goto_1f1

    :cond_1ee
    move-wide/from16 v22, v12

    const/4 v13, 0x0

    :goto_1f1
    sub-int v12, v10, v13

    move-wide/from16 v19, v8

    :try_start_1f5
    iget-wide v8, v1, Le/e/a/o2;->r:J
    :try_end_1f7
    .catch Ljava/lang/Exception; {:try_start_1f5 .. :try_end_1f7} :catch_20a
    .catchall {:try_start_1f5 .. :try_end_1f7} :catchall_203

    move-object/from16 v24, v4

    move-object/from16 p3, v5

    int-to-long v4, v12

    add-long/2addr v8, v4

    :try_start_1fd
    iput-wide v8, v1, Le/e/a/o2;->r:J

    invoke-virtual {v14, v0, v13, v12}, Ljava/io/BufferedOutputStream;->write([BII)V

    goto :goto_217

    :catchall_203
    move-exception v0

    move-object/from16 p3, v5

    move-object/from16 v5, v21

    goto/16 :goto_2a7

    :catch_20a
    move-object/from16 v24, v4

    move-object/from16 p3, v5

    goto :goto_229

    :cond_20f
    move-object/from16 v24, v4

    move-object/from16 p3, v5

    move-wide/from16 v19, v8

    move-wide/from16 v22, v12

    :goto_217
    if-eqz v11, :cond_22b

    iget-boolean v4, v1, Le/e/a/o2;->i:Z

    if-nez v4, :cond_22b

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4, v10}, Ljava/io/BufferedOutputStream;->write([BII)V
    :try_end_221
    .catch Ljava/lang/Exception; {:try_start_1fd .. :try_end_221} :catch_229
    .catchall {:try_start_1fd .. :try_end_221} :catchall_222

    goto :goto_22b

    :catchall_222
    move-exception v0

    move-object/from16 v5, v21

    move-object/from16 v4, v24

    goto/16 :goto_2a7

    :catch_229
    :goto_229
    const/4 v10, 0x1

    goto :goto_23d

    :cond_22b
    :goto_22b
    move-object/from16 v5, p3

    move-wide/from16 v8, v19

    move-object/from16 v12, v21

    move-wide/from16 v19, v22

    move-object/from16 v13, v24

    goto :goto_1cf

    :cond_236
    move-object/from16 p3, v5

    move-object/from16 v21, v12

    move-object/from16 v24, v13

    const/4 v10, 0x0

    :goto_23d
    if-eqz v11, :cond_248

    if-nez v10, :cond_248

    :try_start_241
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_248

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_248
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

    if-nez v10, :cond_26e

    invoke-virtual/range {p3 .. p3}, Ljava/io/FileOutputStream;->close()V

    invoke-virtual {v7}, Ljava/io/BufferedInputStream;->close()V

    :cond_26e
    invoke-virtual {v15}, Lorg/apache/http/impl/client/DefaultHttpClient;->getConnectionManager()Lorg/apache/http/conn/ClientConnectionManager;

    move-result-object v0

    invoke-interface {v0}, Lorg/apache/http/conn/ClientConnectionManager;->shutdown()V

    iget-wide v2, v1, Le/e/a/o2;->s:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_298

    iget-wide v2, v1, Le/e/a/o2;->r:J

    iget-wide v4, v1, Le/e/a/o2;->s:J

    cmp-long v0, v2, v4

    if-nez v0, :cond_298

    move-object/from16 v5, v21

    move-object/from16 v4, v24

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    iget-object v0, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    if-eqz v0, :cond_30b

    iget-object v0, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    const/4 v2, 0x0

    invoke-interface {v0, v2}, Le/e/a/l3/m;->a(I)V

    goto/16 :goto_30b

    :cond_298
    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_30b

    if-eqz v11, :cond_30b

    const/4 v2, 0x0

    iput-boolean v2, v1, Le/e/a/o2;->d:Z
    :try_end_2a1
    .catch Ljava/lang/Exception; {:try_start_241 .. :try_end_2a1} :catch_38

    goto :goto_30b

    :catchall_2a2
    move-exception v0

    move-object/from16 p3, v5

    move-object v5, v12

    move-object v4, v13

    :goto_2a7
    if-eqz v11, :cond_2b0

    :try_start_2a9
    sget-boolean v8, Le/e/a/o2;->v:Z

    if-nez v8, :cond_2b0

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_2b0
    .catch Ljava/lang/Exception; {:try_start_2a9 .. :try_end_2b0} :catch_125

    :cond_2b0
    :try_start_2b0
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
    :try_end_2dd
    .catch Ljava/lang/Exception; {:try_start_2b0 .. :try_end_2dd} :catch_305

    const-wide/16 v6, 0x0

    cmp-long v8, v2, v6

    if-eqz v8, :cond_2f9

    :try_start_2e3
    iget-wide v2, v1, Le/e/a/o2;->r:J

    iget-wide v6, v1, Le/e/a/o2;->s:J

    cmp-long v8, v2, v6

    if-nez v8, :cond_2f9

    invoke-virtual {v4, v5}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    iget-object v2, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    if-eqz v2, :cond_303

    iget-object v2, v1, Le/e/a/o2;->n:Le/e/a/l3/m;

    const/4 v3, 0x0

    invoke-interface {v2, v3}, Le/e/a/l3/m;->a(I)V
    :try_end_2f8
    .catch Ljava/lang/Exception; {:try_start_2e3 .. :try_end_2f8} :catch_125

    goto :goto_303

    :cond_2f9
    :try_start_2f9
    sget-boolean v2, Le/e/a/o2;->v:Z
    :try_end_2fb
    .catch Ljava/lang/Exception; {:try_start_2f9 .. :try_end_2fb} :catch_305

    if-nez v2, :cond_303

    if-eqz v11, :cond_303

    const/4 v4, 0x0

    :try_start_300
    iput-boolean v4, v1, Le/e/a/o2;->d:Z

    goto :goto_304

    :cond_303
    :goto_303
    const/4 v4, 0x0

    :goto_304
    throw v0
    :try_end_305
    .catch Ljava/lang/Exception; {:try_start_300 .. :try_end_305} :catch_125

    :catch_305
    move-exception v0

    const/4 v4, 0x0

    :goto_307
    const/4 v10, 0x0

    :goto_308
    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V

    :cond_30b
    :goto_30b
    return v10
.end method

.method public declared-synchronized a(Ljava/io/BufferedOutputStream;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)Z
    .registers 23

    move-object/from16 v1, p0

    move-object/from16 v0, p2

    move-object/from16 v2, p4

    monitor-enter p0

    const/4 v3, 0x0

    if-nez v0, :cond_c

    monitor-exit p0

    return v3

    :cond_c
    :try_start_c
    invoke-static/range {p2 .. p2}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v4

    const-string v5, "https"

    invoke-virtual {v0, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0
    :try_end_16
    .catch Ljava/lang/Exception; {:try_start_c .. :try_end_16} :catch_23e
    .catchall {:try_start_c .. :try_end_16} :catchall_23c

    if-eqz v0, :cond_2f

    :try_start_18
    invoke-static {}, Ljavax/net/ssl/SSLSocketFactory;->getDefault()Ljavax/net/SocketFactory;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocketFactory;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    const/16 v6, 0x1bb

    invoke-virtual {v0, v5, v6}, Ljavax/net/ssl/SSLSocketFactory;->createSocket(Ljava/lang/String;I)Ljava/net/Socket;

    move-result-object v0

    check-cast v0, Ljavax/net/ssl/SSLSocket;
    :try_end_2a
    .catch Ljava/lang/Exception; {:try_start_18 .. :try_end_2a} :catch_2c
    .catchall {:try_start_18 .. :try_end_2a} :catchall_23c

    :goto_2a
    move-object v5, v0

    goto :goto_46

    :catch_2c
    move-exception v0

    goto/16 :goto_240

    :cond_2f
    :try_start_2f
    new-instance v0, Ljava/net/Socket;

    invoke-virtual {v4}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4}, Landroid/net/Uri;->getPort()I

    move-result v6

    if-gez v6, :cond_3e

    const/16 v6, 0x50

    goto :goto_42

    :cond_3e
    invoke-virtual {v4}, Landroid/net/Uri;->getPort()I

    move-result v6

    :goto_42
    invoke-direct {v0, v5, v6}, Ljava/net/Socket;-><init>(Ljava/lang/String;I)V

    goto :goto_2a

    :goto_46
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
    :try_end_71
    .catch Ljava/lang/Exception; {:try_start_2f .. :try_end_71} :catch_23e
    .catchall {:try_start_2f .. :try_end_71} :catchall_23c

    if-nez v10, :cond_75

    :try_start_73
    const-string v0, ""
    :try_end_75
    .catch Ljava/lang/Exception; {:try_start_73 .. :try_end_75} :catch_2c
    .catchall {:try_start_73 .. :try_end_75} :catchall_23c

    :cond_75
    :try_start_75
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
    :try_end_156
    .catch Ljava/lang/Exception; {:try_start_75 .. :try_end_156} :catch_23e
    .catchall {:try_start_75 .. :try_end_156} :catchall_23c

    move-wide/from16 v11, p5

    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v10, 0x0

    :goto_15b
    :try_start_15b
    invoke-virtual {v8, v0}, Ljava/io/BufferedInputStream;->read([B)I

    move-result v13

    const/4 v14, -0x1

    if-eq v13, v14, :cond_207

    sget-boolean v14, Le/e/a/o2;->v:Z

    if-nez v14, :cond_207

    if-nez v2, :cond_1d8

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

    :goto_187
    array-length v14, v2

    if-ge v3, v14, :cond_1d3

    aget-object v14, v2, v3

    const-string v15, "HTTP/1.1 40"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_196

    const/4 v4, 0x1

    goto :goto_1d3

    :cond_196
    const-string v15, "HTTP/1.1 302"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_19f

    const/4 v10, 0x1

    :cond_19f
    const-string v15, "Content-Length"

    invoke-virtual {v14, v15}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_1d0

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
    :try_end_1cf
    .catchall {:try_start_15b .. :try_end_1cf} :catchall_221

    goto :goto_1d3

    :cond_1d0
    add-int/lit8 v3, v3, 0x1

    goto :goto_187

    :cond_1d3
    :goto_1d3
    move-object/from16 v2, p1

    const/4 v3, 0x1

    const/4 v14, 0x0

    goto :goto_1dc

    :cond_1d8
    move v3, v2

    const/4 v14, 0x0

    move-object/from16 v2, p1

    :goto_1dc
    :try_start_1dc
    invoke-virtual {v2, v0, v14, v13}, Ljava/io/BufferedOutputStream;->write([BII)V

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1e2
    .catch Ljava/lang/Exception; {:try_start_1dc .. :try_end_1e2} :catch_205
    .catchall {:try_start_1dc .. :try_end_1e2} :catchall_221

    if-eqz v10, :cond_1e5

    goto :goto_207

    :cond_1e5
    int-to-long v14, v13

    add-long/2addr v11, v14

    :try_start_1e7
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
    :try_end_200
    .catchall {:try_start_1e7 .. :try_end_200} :catchall_221

    move/from16 v2, p3

    const/4 v3, 0x0

    goto/16 :goto_15b

    :catch_205
    const/4 v3, 0x1

    goto :goto_208

    :cond_207
    :goto_207
    move v3, v4

    :goto_208
    :try_start_208
    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v5}, Ljava/net/Socket;->close()V

    if-nez v3, :cond_257

    sget-boolean v0, Le/e/a/o2;->v:Z

    if-nez v0, :cond_257

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    goto :goto_257

    :catchall_221
    move-exception v0

    move v3, v4

    invoke-virtual {v9}, Ljava/io/BufferedOutputStream;->close()V

    invoke-virtual {v8}, Ljava/io/BufferedInputStream;->close()V

    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    invoke-virtual {v7}, Ljava/io/OutputStream;->close()V

    invoke-virtual {v5}, Ljava/net/Socket;->close()V

    if-nez v3, :cond_23b

    sget-boolean v2, Le/e/a/o2;->v:Z

    if-nez v2, :cond_23b

    invoke-virtual/range {p1 .. p1}, Ljava/io/BufferedOutputStream;->flush()V

    :cond_23b
    throw v0
    :try_end_23c
    .catch Ljava/lang/Exception; {:try_start_208 .. :try_end_23c} :catch_2c
    .catchall {:try_start_208 .. :try_end_23c} :catchall_23c

    :catchall_23c
    move-exception v0

    goto :goto_259

    :catch_23e
    move-exception v0

    const/4 v3, 0x0

    :goto_240
    :try_start_240
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "\u30af\u30e9\u30c3\u30b7\u30e5\uff1a\n"

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v0}, Landroid/util/Log;->getStackTraceString(Ljava/lang/Throwable;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/Exception;->printStackTrace()V
    :try_end_257
    .catchall {:try_start_240 .. :try_end_257} :catchall_23c

    :cond_257
    :goto_257
    monitor-exit p0

    return v3

    :goto_259
    monitor-exit p0

    goto :goto_25c

    :goto_25b
    throw v0

    :goto_25c
    goto :goto_25b
.end method

.method public b()V
    .registers 2

    const/4 v0, 0x1

    sput-boolean v0, Le/e/a/o2;->v:Z

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/o2;->a:Ljava/lang/String;

    const/4 v0, 0x0

    iput v0, p0, Le/e/a/o2;->l:I

    :try_start_9
    iget-object v0, p0, Le/e/a/o2;->m:Ljava/net/ServerSocket;

    if-eqz v0, :cond_15

    invoke-virtual {v0}, Ljava/net/ServerSocket;->close()V
    :try_end_10
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_10} :catch_11

    goto :goto_15

    :catch_11
    move-exception v0

    invoke-virtual {v0}, Ljava/io/IOException;->printStackTrace()V

    :cond_15
    :goto_15
    return-void
.end method
