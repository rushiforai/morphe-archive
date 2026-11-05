.class final Le/e/a/Mp4Transfer115;
.super Ljava/lang/Object;
.source "Mp4Transfer115.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/Mp4Transfer115$Track;
    }
.end annotation


# instance fields
.field volatile connection:Ljava/net/HttpURLConnection;

.field final context:Landroid/content/Context;

.field cookie:Ljava/lang/String;

.field final folder:Ljava/io/File;

.field final job:Le/e/a/DownloadJobs115$Job;

.field final keys:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "[B>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroid/content/Context;Le/e/a/DownloadJobs115$Job;)V
    .registers 6

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 5
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->keys:Ljava/util/Map;

    .line 6
    iput-object p1, p0, Le/e/a/Mp4Transfer115;->context:Landroid/content/Context;

    iput-object p2, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    new-instance v0, Ljava/io/File;

    invoke-virtual {p1}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "mp4-"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p2, p2, Le/e/a/DownloadJobs115$Job;->token:Ljava/lang/String;

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {v0, p1, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    return-void
.end method

.method static height(Ljava/lang/String;)I
    .registers 2

    .line 26
    const-string v0, "(?:^|[^0-9])([0-9]{3,4})p(?:[^0-9]|$)"

    invoke-static {v0}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;)Ljava/util/regex/Pattern;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_1a

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p0

    goto :goto_1b

    :cond_1a
    const/4 p0, 0x0

    :goto_1b
    return p0
.end method


# virtual methods
.method binary(Le/e/a/Mp4Playlist115$Segment;Ljava/io/OutputStream;)V
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 27
    move-object/from16 v7, p0

    move-object/from16 v0, p1

    move-object/from16 v8, p2

    iget-object v1, v0, Le/e/a/Mp4Playlist115$Segment;->key:Ljava/net/URL;

    const/4 v9, 0x0

    if-eqz v1, :cond_36

    iget-object v1, v0, Le/e/a/Mp4Playlist115$Segment;->key:Ljava/net/URL;

    invoke-virtual {v1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v1

    iget-object v2, v7, Le/e/a/Mp4Transfer115;->keys:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    if-nez v2, :cond_34

    iget-object v2, v0, Le/e/a/Mp4Playlist115$Segment;->key:Ljava/net/URL;

    const/16 v3, 0x10

    invoke-virtual {v7, v2, v3}, Le/e/a/Mp4Transfer115;->small(Ljava/net/URL;I)[B

    move-result-object v2

    array-length v4, v2

    if-ne v4, v3, :cond_2c

    iget-object v3, v7, Le/e/a/Mp4Transfer115;->keys:Ljava/util/Map;

    invoke-interface {v3, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_34

    :cond_2c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u914d\u4fe1\u30ad\u30fc\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :cond_34
    :goto_34
    move-object v10, v2

    goto :goto_37

    :cond_36
    move-object v10, v9

    .line 28
    :goto_37
    iget-object v2, v0, Le/e/a/Mp4Playlist115$Segment;->url:Ljava/net/URL;

    iget-wide v3, v0, Le/e/a/Mp4Playlist115$Segment;->length:J

    iget-wide v5, v0, Le/e/a/Mp4Playlist115$Segment;->offset:J

    move-object/from16 v1, p0

    invoke-virtual/range {v1 .. v6}, Le/e/a/Mp4Transfer115;->open(Ljava/net/URL;JJ)Ljava/net/HttpURLConnection;

    move-result-object v1

    iget-wide v2, v0, Le/e/a/Mp4Playlist115$Segment;->length:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-lez v2, :cond_4e

    iget-wide v2, v0, Le/e/a/Mp4Playlist115$Segment;->length:J

    goto :goto_52

    :cond_4e
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v2

    :goto_52
    iget-object v6, v7, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iput-wide v4, v6, Le/e/a/DownloadJobs115$Job;->assetBytes:J

    iget-object v6, v7, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iput-wide v2, v6, Le/e/a/DownloadJobs115$Job;->assetSize:J

    :try_start_5a
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v6
    :try_end_5e
    .catchall {:try_start_5a .. :try_end_5e} :catchall_f7

    .line 29
    if-eqz v10, :cond_79

    :try_start_60
    const-string v11, "AES/CBC/PKCS5Padding"

    invoke-static {v11}, Ljavax/crypto/Cipher;->getInstance(Ljava/lang/String;)Ljavax/crypto/Cipher;

    move-result-object v11

    new-instance v12, Ljavax/crypto/spec/SecretKeySpec;

    const-string v13, "AES"

    invoke-direct {v12, v10, v13}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    new-instance v10, Ljavax/crypto/spec/IvParameterSpec;

    iget-object v0, v0, Le/e/a/Mp4Playlist115$Segment;->iv:[B

    invoke-direct {v10, v0}, Ljavax/crypto/spec/IvParameterSpec;-><init>([B)V

    const/4 v0, 0x2

    invoke-virtual {v11, v0, v12, v10}, Ljavax/crypto/Cipher;->init(ILjava/security/Key;Ljava/security/spec/AlgorithmParameterSpec;)V

    goto :goto_7a

    :cond_79
    move-object v11, v9

    .line 30
    :goto_7a
    const/high16 v0, 0x10000

    new-array v0, v0, [B

    move-wide v12, v4

    :goto_7f
    invoke-virtual {v6, v0}, Ljava/io/InputStream;->read([B)I

    move-result v10

    const/4 v14, -0x1

    if-ne v10, v14, :cond_af

    cmp-long v0, v2, v4

    if-ltz v0, :cond_97

    cmp-long v0, v12, v2

    if-nez v0, :cond_8f

    goto :goto_97

    :cond_8f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u914d\u4fe1\u30c7\u30fc\u30bf\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_96
    throw v0

    :cond_97
    :goto_97
    if-eqz v11, :cond_a0

    invoke-virtual {v11}, Ljavax/crypto/Cipher;->doFinal()[B

    move-result-object v0

    invoke-virtual {v8, v0}, Ljava/io/OutputStream;->write([B)V
    :try_end_a0
    .catchall {:try_start_60 .. :try_end_a0} :catchall_ed

    .line 31
    :cond_a0
    if-eqz v6, :cond_a9

    :try_start_a2
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V
    :try_end_a5
    .catchall {:try_start_a2 .. :try_end_a5} :catchall_a6

    goto :goto_a9

    :catchall_a6
    move-exception v0

    move-object v2, v9

    goto :goto_f9

    :cond_a9
    :goto_a9
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v9, v7, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    return-void

    .line 30
    :cond_af
    :try_start_af
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    int-to-long v14, v10

    add-long/2addr v12, v14

    cmp-long v16, v2, v4

    if-lez v16, :cond_c5

    cmp-long v16, v12, v2

    if-gtz v16, :cond_bd

    goto :goto_c5

    :cond_bd
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u914d\u4fe1\u30c7\u30fc\u30bf\u304c\u9577\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_96

    :cond_c5
    :goto_c5
    iget-object v4, v7, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    move/from16 p1, v10

    iget-wide v9, v4, Le/e/a/DownloadJobs115$Job;->bytes:J

    add-long/2addr v9, v14

    iput-wide v9, v4, Le/e/a/DownloadJobs115$Job;->bytes:J

    iget-object v4, v7, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iput-wide v12, v4, Le/e/a/DownloadJobs115$Job;->assetBytes:J

    const/4 v4, 0x0

    if-nez v11, :cond_db

    move/from16 v9, p1

    invoke-virtual {v8, v0, v4, v9}, Ljava/io/OutputStream;->write([BII)V

    goto :goto_e6

    :cond_db
    move/from16 v9, p1

    invoke-virtual {v11, v0, v4, v9}, Ljavax/crypto/Cipher;->update([BII)[B

    move-result-object v4

    if-eqz v4, :cond_e6

    invoke-virtual {v8, v4}, Ljava/io/OutputStream;->write([B)V

    :cond_e6
    :goto_e6
    invoke-static {}, Le/e/a/DownloadWorker115;->progress()V
    :try_end_e9
    .catchall {:try_start_af .. :try_end_e9} :catchall_ed

    const-wide/16 v4, 0x0

    const/4 v9, 0x0

    goto :goto_7f

    .line 31
    :catchall_ed
    move-exception v0

    move-object v2, v0

    if-eqz v6, :cond_f4

    :try_start_f1
    invoke-virtual {v6}, Ljava/io/InputStream;->close()V

    :cond_f4
    throw v2
    :try_end_f5
    .catchall {:try_start_f1 .. :try_end_f5} :catchall_f5

    :catchall_f5
    move-exception v0

    goto :goto_f9

    :catchall_f7
    move-exception v0

    const/4 v2, 0x0

    :goto_f9
    if-eqz v2, :cond_101

    if-eq v2, v0, :cond_102

    :try_start_fd
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_102

    :cond_101
    move-object v2, v0

    :cond_102
    :goto_102
    throw v2
    :try_end_103
    .catchall {:try_start_fd .. :try_end_103} :catchall_103

    :catchall_103
    move-exception v0

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    const/4 v1, 0x0

    iput-object v1, v7, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    throw v0
.end method

.method cancel()V
    .registers 2

    .line 40
    iget-object v0, p0, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    if-eqz v0, :cond_7

    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_7
    return-void
.end method

.method check()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 7
    iget-object v0, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-boolean v0, v0, Le/e/a/DownloadJobs115$Job;->cancelled:Z

    if-nez v0, :cond_17

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-boolean v0, v0, Le/e/a/DownloadJobs115$Job;->paused:Z

    if-nez v0, :cond_17

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v0

    if-nez v0, :cond_17

    return-void

    :cond_17
    new-instance v0, Ljava/io/InterruptedIOException;

    invoke-direct {v0}, Ljava/io/InterruptedIOException;-><init>()V

    throw v0
.end method

.method clean()V
    .registers 6

    .line 41
    iget-object v0, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    const/4 v1, 0x0

    if-eqz v0, :cond_16

    array-length v2, v0

    move v3, v1

    :goto_b
    if-lt v3, v2, :cond_e

    goto :goto_16

    :cond_e
    aget-object v4, v0, v3

    invoke-virtual {v4}, Ljava/io/File;->delete()Z

    add-int/lit8 v3, v3, 0x1

    goto :goto_b

    :cond_16
    :goto_16
    iget-object v0, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    const/4 v0, 0x0

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->cookie:Ljava/lang/String;

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->keys:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_28
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_34

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->keys:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->clear()V

    return-void

    :cond_34
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, [B

    invoke-static {v2, v1}, Ljava/util/Arrays;->fill([BB)V

    goto :goto_28
.end method

.method synthetic lambda$0$e-e-a-Mp4Transfer115(Ljava/net/URL;)Ljava/lang/String;
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 22
    invoke-virtual {p0, p1}, Le/e/a/Mp4Transfer115;->text(Ljava/net/URL;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method mux(Ljava/util/List;Ljava/io/File;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 33
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_17

    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/io/File;

    invoke-static {v0}, Le/e/a/FragmentedMp4117;->isFragmented(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_17

    invoke-static {p0, p1, p2}, Le/e/a/FragmentMux117;->mux(Le/e/a/Mp4Transfer115;Ljava/util/List;Ljava/io/File;)V

    return-void

    :cond_17
    invoke-virtual {p0, p1, p2}, Le/e/a/Mp4Transfer115;->platformMux(Ljava/util/List;Ljava/io/File;)V

    return-void
.end method

.method open(Ljava/net/URL;JJ)Ljava/net/HttpURLConnection;
    .registers 22
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    move-object/from16 v1, p0

    move-wide/from16 v2, p4

    const/4 v0, 0x0

    move-object/from16 v4, p1

    move v5, v0

    :goto_8
    const/4 v6, 0x6

    if-ge v5, v6, :cond_11e

    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v6

    invoke-static {v4, v6}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    invoke-virtual {v4}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v6

    check-cast v6, Ljava/net/HttpURLConnection;

    iput-object v6, v1, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    .line 10
    const/4 v7, 0x0

    :try_start_1e
    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 v8, 0x2ee0

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v8, 0x4e20

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const-string v8, "User-Agent"

    const-string v9, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "Referer"

    const-string v9, "https://www.nicovideo.jp/"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v8, "Origin"

    const-string v9, "https://www.nicovideo.jp"

    invoke-virtual {v6, v8, v9}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v4}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v8

    iget-object v9, v1, Le/e/a/Mp4Transfer115;->cookie:Ljava/lang/String;

    invoke-static {v8, v9, v7}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/String;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_55

    const-string v9, "Cookie"

    invoke-virtual {v6, v9, v8}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_55
    .catch Ljava/lang/Exception; {:try_start_1e .. :try_end_55} :catch_117

    :cond_55
    const-wide/16 v8, 0x0

    cmp-long v8, p2, v8

    const-wide/16 v9, 0x1

    const-string v11, "-"

    if-lez v8, :cond_7e

    :try_start_5f
    const-string v12, "Range"

    new-instance v13, Ljava/lang/StringBuilder;

    const-string v14, "bytes="

    invoke-direct {v13, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v13, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v13

    add-long v14, v2, p2

    sub-long/2addr v14, v9

    invoke-virtual {v13, v14, v15}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v13

    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v6, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_7e
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v13, 0x12d

    if-eq v12, v13, :cond_fa

    const/16 v13, 0x12e

    if-eq v12, v13, :cond_fa

    const/16 v13, 0x12f

    if-eq v12, v13, :cond_fa

    const/16 v13, 0x133

    if-eq v12, v13, :cond_fa

    const/16 v13, 0x134

    if-ne v12, v13, :cond_97

    goto :goto_fa

    :cond_97
    const/16 v0, 0xc8

    if-lt v12, v0, :cond_df

    const/16 v0, 0x12c

    if-ge v12, v0, :cond_df

    if-lez v8, :cond_a5

    const/16 v0, 0xce

    if-ne v12, v0, :cond_df

    :cond_a5
    if-lez v8, :cond_de

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v4, "bytes "

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    add-long v2, v2, p2

    sub-long/2addr v2, v9

    invoke-virtual {v0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, "/"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "Content-Range"

    invoke-virtual {v6, v2}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_d6

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_d6

    goto :goto_de

    :cond_d6
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u914d\u4fe1\u7bc4\u56f2\u304c\u4e00\u81f4\u3057\u307e\u305b\u3093"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_dd
    throw v0

    :cond_de
    :goto_de
    return-object v6

    :cond_df
    new-instance v0, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "\u52d5\u753b\u53d6\u5f97\u306b\u5931\u6557\u3057\u307e\u3057\u305f (HTTP "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v12}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ")"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_dd

    :cond_fa
    :goto_fa
    const-string v8, "Location"

    invoke-virtual {v6, v8}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_10f

    invoke-static {v4, v8}, Le/e/a/Mp4Playlist115;->resolve(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URL;

    move-result-object v4

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v7, v1, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    .line 9
    add-int/lit8 v5, v5, 0x1

    goto/16 :goto_8

    .line 10
    :cond_10f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u914d\u4fe1\u5148\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_116
    .catch Ljava/lang/Exception; {:try_start_5f .. :try_end_116} :catch_117

    goto :goto_dd

    .line 11
    :catch_117
    move-exception v0

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v7, v1, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    throw v0

    .line 12
    :cond_11e
    new-instance v0, Ljava/io/IOException;

    const-string v2, "\u914d\u4fe1\u5148\u306e\u8ee2\u9001\u304c\u591a\u3059\u304e\u307e\u3059"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method platformMux(Ljava/util/List;Ljava/io/File;)V
    .registers 24
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/io/File;",
            ">;",
            "Ljava/io/File;",
            ")V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 34
    const-string v0, "max-input-size"

    const-string v1, "video/"

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    const/4 v5, 0x0

    :try_start_f
    new-instance v6, Landroid/media/MediaMuxer;

    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v7

    invoke-direct {v6, v7, v5}, Landroid/media/MediaMuxer;-><init>(Ljava/lang/String;I)V
    :try_end_18
    .catchall {:try_start_f .. :try_end_18} :catchall_209

    .line 35
    :try_start_18
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    const/high16 v8, 0x400000

    move v9, v5

    move v10, v9

    :goto_20
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v11
    :try_end_24
    .catchall {:try_start_18 .. :try_end_24} :catchall_205

    const-wide/16 v12, 0x0

    if-nez v11, :cond_16c

    .line 36
    if-eqz v9, :cond_15f

    if-eqz v10, :cond_15f

    const/high16 v0, 0x4000000

    const-string v1, "\u52d5\u753b\u30d5\u30ec\u30fc\u30e0\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    if-gt v8, v0, :cond_159

    :try_start_32
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide v9, 0x7fffffffffffffffL

    :goto_3b
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-nez v7, :cond_139

    invoke-virtual {v6}, Landroid/media/MediaMuxer;->start()V
    :try_end_44
    .catchall {:try_start_32 .. :try_end_44} :catchall_167

    :try_start_44
    invoke-static {v8}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    new-instance v7, Landroid/media/MediaCodec$BufferInfo;

    invoke-direct {v7}, Landroid/media/MediaCodec$BufferInfo;-><init>()V

    .line 37
    :goto_4d
    invoke-virtual/range {p0 .. p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v11

    const/4 v15, 0x0

    :goto_55
    invoke-interface {v11}, Ljava/util/Iterator;->hasNext()Z

    move-result v16

    if-nez v16, :cond_107

    if-nez v15, :cond_97

    .line 38
    invoke-virtual {v6}, Landroid/media/MediaMuxer;->stop()V
    :try_end_60
    .catchall {:try_start_44 .. :try_end_60} :catchall_133

    :try_start_60
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_64
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1
    :try_end_68
    .catchall {:try_start_60 .. :try_end_68} :catchall_167

    if-nez v1, :cond_82

    .line 39
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6e
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_78

    invoke-virtual {v6}, Landroid/media/MediaMuxer;->release()V

    return-void

    :cond_78
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/media/MediaExtractor;

    invoke-virtual {v0}, Landroid/media/MediaExtractor;->release()V

    goto :goto_6e

    .line 38
    :cond_82
    :try_start_82
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Mp4Transfer115$Track;

    iget-wide v3, v1, Le/e/a/Mp4Transfer115$Track;->last:J

    cmp-long v1, v3, v12

    if-ltz v1, :cond_8f

    goto :goto_64

    :cond_8f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "MP4\u30c8\u30e9\u30c3\u30af\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_97
    .catchall {:try_start_82 .. :try_end_97} :catchall_167

    .line 37
    :cond_97
    :try_start_97
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->clear()Ljava/nio/Buffer;

    move-result-object v11

    check-cast v11, Ljava/nio/ByteBuffer;

    iget-object v11, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getSampleSize()J

    move-result-wide v16

    int-to-long v12, v8

    cmp-long v11, v16, v12

    if-gtz v11, :cond_101

    iget-object v11, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v11, v0, v5}, Landroid/media/MediaExtractor;->readSampleData(Ljava/nio/ByteBuffer;I)I

    move-result v17

    if-ltz v17, :cond_f9

    iget-object v11, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v11}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v11

    sub-long/2addr v11, v9

    const-wide/16 v18, 0x0

    cmp-long v13, v11, v18

    if-ltz v13, :cond_f1

    iget-object v13, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v13}, Landroid/media/MediaExtractor;->getSampleFlags()I

    move-result v13

    and-int/lit8 v16, v13, 0x2

    if-nez v16, :cond_e9

    and-int/lit8 v13, v13, 0x1

    if-eqz v13, :cond_ce

    const/16 v20, 0x1

    goto :goto_d0

    :cond_ce
    move/from16 v20, v5

    :goto_d0
    const/16 v16, 0x0

    move-object v13, v15

    move-object v15, v7

    move-wide/from16 v18, v11

    invoke-virtual/range {v15 .. v20}, Landroid/media/MediaCodec$BufferInfo;->set(IIJI)V

    iget v15, v13, Le/e/a/Mp4Transfer115$Track;->target:I

    invoke-virtual {v6, v15, v0, v7}, Landroid/media/MediaMuxer;->writeSampleData(ILjava/nio/ByteBuffer;Landroid/media/MediaCodec$BufferInfo;)V

    iput-wide v11, v13, Le/e/a/Mp4Transfer115$Track;->last:J

    iget-object v11, v13, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v11}, Landroid/media/MediaExtractor;->advance()Z

    const-wide/16 v12, 0x0

    goto/16 :goto_4d

    :cond_e9
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u6697\u53f7\u5316\u3055\u308c\u305f\u30c8\u30e9\u30c3\u30af\u306f\u4fdd\u5b58\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_f0
    throw v0

    :cond_f1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u52d5\u753b\u306e\u6642\u523b\u304c\u4e0d\u6b63\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_f0

    :cond_f9
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u52d5\u753b\u30c7\u30fc\u30bf\u304c\u9014\u4e2d\u3067\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_f0

    :cond_101
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_f0

    :cond_107
    move-object v13, v15

    invoke-interface {v11}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v15, v12

    check-cast v15, Le/e/a/Mp4Transfer115$Track;

    iget-object v12, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v12}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v16

    const-wide/16 v18, 0x0

    cmp-long v12, v16, v18

    if-ltz v12, :cond_12e

    if-eqz v13, :cond_12d

    iget-object v12, v15, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v12}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v16

    iget-object v12, v13, Le/e/a/Mp4Transfer115$Track;->extractor:Landroid/media/MediaExtractor;

    invoke-virtual {v12}, Landroid/media/MediaExtractor;->getSampleTime()J

    move-result-wide v18
    :try_end_129
    .catchall {:try_start_97 .. :try_end_129} :catchall_133

    cmp-long v12, v16, v18

    if-gez v12, :cond_12e

    :cond_12d
    goto :goto_12f

    :cond_12e
    move-object v15, v13

    :goto_12f
    const-wide/16 v12, 0x0

    goto/16 :goto_55

    .line 39
    :catchall_133
    move-exception v0

    move-object v1, v0

    move-object v4, v6

    const/4 v5, 0x1

    goto/16 :goto_20d

    .line 36
    :cond_139
    :try_start_139
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Le/e/a/Mp4Transfer115$Track;

    iget-wide v11, v7, Le/e/a/Mp4Transfer115$Track;->first:J

    const-wide/16 v15, 0x0

    cmp-long v11, v11, v15

    if-ltz v11, :cond_151

    iget-wide v11, v7, Le/e/a/Mp4Transfer115$Track;->first:J

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    const-wide/16 v12, 0x0

    goto/16 :goto_3b

    :cond_151
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u52d5\u753b\u30c8\u30e9\u30c3\u30af\u304c\u7a7a\u3067\u3059"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_158
    throw v0

    :cond_159
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_158

    :cond_15f
    new-instance v0, Ljava/io/IOException;

    const-string v1, "\u6620\u50cf\u307e\u305f\u306f\u97f3\u58f0\u3092MP4\u3078\u683c\u7d0d\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V
    :try_end_166
    .catchall {:try_start_139 .. :try_end_166} :catchall_167

    goto :goto_158

    .line 39
    :catchall_167
    move-exception v0

    move-object v1, v0

    move-object v4, v6

    goto/16 :goto_20d

    .line 35
    :cond_16c
    :try_start_16c
    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Ljava/io/File;

    new-instance v12, Landroid/media/MediaExtractor;

    invoke-direct {v12}, Landroid/media/MediaExtractor;-><init>()V

    invoke-interface {v2, v12}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v13

    invoke-virtual {v12, v13}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    move v13, v5

    :goto_182
    invoke-virtual {v12}, Landroid/media/MediaExtractor;->getTrackCount()I

    move-result v15

    if-lt v13, v15, :cond_18a

    goto/16 :goto_20

    :cond_18a
    invoke-virtual {v12, v13}, Landroid/media/MediaExtractor;->getTrackFormat(I)Landroid/media/MediaFormat;

    move-result-object v15

    const-string v4, "mime"

    invoke-virtual {v15, v4}, Landroid/media/MediaFormat;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_1f7

    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v17

    if-nez v17, :cond_1aa

    const-string v5, "audio/"

    invoke-virtual {v4, v5}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_1aa

    :goto_1a4
    move-object/from16 v18, v0

    move-object v5, v1

    const-wide/16 v19, 0x0

    goto :goto_1fd

    :cond_1aa
    invoke-virtual {v4, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_1b3

    if-eqz v9, :cond_1b6

    goto :goto_1a4

    :cond_1b3
    if-eqz v10, :cond_1b6

    goto :goto_1a4

    :cond_1b6
    invoke-virtual {v15, v0}, Landroid/media/MediaFormat;->containsKey(Ljava/lang/String;)Z

    move-result v5

    if-eqz v5, :cond_1c4

    invoke-virtual {v15, v0}, Landroid/media/MediaFormat;->getInteger(Ljava/lang/String;)I

    move-result v5

    invoke-static {v8, v5}, Ljava/lang/Math;->max(II)I

    move-result v8

    :cond_1c4
    new-instance v5, Landroid/media/MediaExtractor;

    invoke-direct {v5}, Landroid/media/MediaExtractor;-><init>()V

    invoke-interface {v2, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v14

    invoke-virtual {v5, v14}, Landroid/media/MediaExtractor;->setDataSource(Ljava/lang/String;)V

    invoke-virtual {v5, v13}, Landroid/media/MediaExtractor;->selectTrack(I)V

    new-instance v14, Le/e/a/Mp4Transfer115$Track;

    move-object/from16 v18, v0

    const/4 v0, -0x1

    invoke-direct {v14, v5, v0}, Le/e/a/Mp4Transfer115$Track;-><init>(Landroid/media/MediaExtractor;I)V

    move-object v5, v1

    iget-wide v0, v14, Le/e/a/Mp4Transfer115$Track;->first:J

    const-wide/16 v19, 0x0

    cmp-long v0, v0, v19

    if-gez v0, :cond_1e8

    :goto_1e7
    goto :goto_1fd

    :cond_1e8
    invoke-virtual {v6, v15}, Landroid/media/MediaMuxer;->addTrack(Landroid/media/MediaFormat;)I

    move-result v0

    iput v0, v14, Le/e/a/Mp4Transfer115$Track;->target:I

    invoke-interface {v3, v14}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_1f1
    .catchall {:try_start_16c .. :try_end_1f1} :catchall_205

    if-eqz v4, :cond_1f5

    const/4 v9, 0x1

    goto :goto_1fd

    :cond_1f5
    const/4 v10, 0x1

    goto :goto_1fd

    :cond_1f7
    move-object/from16 v18, v0

    move-object v5, v1

    const-wide/16 v19, 0x0

    goto :goto_1e7

    :goto_1fd
    add-int/lit8 v13, v13, 0x1

    move-object v1, v5

    move-object/from16 v0, v18

    const/4 v5, 0x0

    goto/16 :goto_182

    .line 39
    :catchall_205
    move-exception v0

    move-object v1, v0

    move-object v4, v6

    goto :goto_20c

    :catchall_209
    move-exception v0

    move-object v1, v0

    const/4 v4, 0x0

    :goto_20c
    const/4 v5, 0x0

    :goto_20d
    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_211
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_227

    if-eqz v4, :cond_223

    if-eqz v5, :cond_220

    :try_start_21b
    invoke-virtual {v4}, Landroid/media/MediaMuxer;->stop()V
    :try_end_21e
    .catch Ljava/lang/Exception; {:try_start_21b .. :try_end_21e} :catch_21f

    goto :goto_220

    :catch_21f
    move-exception v0

    :cond_220
    :goto_220
    invoke-virtual {v4}, Landroid/media/MediaMuxer;->release()V

    :cond_223
    invoke-virtual/range {p2 .. p2}, Ljava/io/File;->delete()Z

    throw v1

    :cond_227
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/media/MediaExtractor;

    invoke-virtual {v2}, Landroid/media/MediaExtractor;->release()V

    goto :goto_211
.end method

.method run(Ljava/lang/Object;)Ljava/io/File;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 17
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v0, v0, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {p1, v0}, Le/e/a/GuestWatch;->watch(Ljava/lang/Object;Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_247

    .line 18
    const-string v1, "video"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    iget-object v2, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v3, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v3, v3, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    const-string v4, "title"

    invoke-virtual {v1, v4, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iput-object v1, v2, Le/e/a/DownloadJobs115$Job;->title:Ljava/lang/String;

    const-string v1, "media"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "domand"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "videos"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v2

    const-string v3, "audios"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONArray(Ljava/lang/String;)Lorg/json/JSONArray;

    move-result-object v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, -0x1

    move v7, v4

    move-object v8, v5

    :goto_3e
    invoke-virtual {v2}, Lorg/json/JSONArray;->length()I

    move-result v9

    const-string v10, "isAvailable"

    const-string v11, "id"

    if-lt v7, v9, :cond_217

    .line 19
    if-eqz v8, :cond_20f

    move v2, v4

    :goto_4b
    invoke-virtual {v3}, Lorg/json/JSONArray;->length()I

    move-result v7

    if-lt v2, v7, :cond_53

    move-object v2, v5

    goto :goto_65

    :cond_53
    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v7

    invoke-virtual {v7, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v7

    if-eqz v7, :cond_20b

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    :goto_65
    if-eqz v2, :cond_203

    iget-object v3, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    if-lez v6, :cond_7f

    new-instance v7, Ljava/lang/StringBuilder;

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v6, "p"

    invoke-virtual {v7, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v6

    goto :goto_83

    :cond_7f
    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    :goto_83
    iput-object v6, v3, Le/e/a/DownloadJobs115$Job;->quality:Ljava/lang/String;

    .line 20
    new-instance v3, Lorg/json/JSONArray;

    invoke-direct {v3}, Lorg/json/JSONArray;-><init>()V

    new-instance v6, Lorg/json/JSONArray;

    invoke-direct {v6}, Lorg/json/JSONArray;-><init>()V

    invoke-virtual {v8, v11}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v6

    invoke-virtual {v6, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    invoke-virtual {v3, v2}, Lorg/json/JSONArray;->put(Ljava/lang/Object;)Lorg/json/JSONArray;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v6, "https://nvapi.nicovideo.jp/v1/watch/"

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-object v6, v6, Le/e/a/DownloadJobs115$Job;->id:Ljava/lang/String;

    invoke-static {v6}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "/access-rights/hls?actionTrackId="

    invoke-virtual {v3, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v6, "client"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v6, "watchTrackId"

    invoke-virtual {v0, v6}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 21
    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v6, "outputs"

    invoke-virtual {v3, v6, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    const-string v3, "accessRightKey"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {p1, v0, v2, v1}, Le/e/a/Quality195;->request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "data"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    const-string v0, "contentUrl"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Le/e/a/ModernPlayback;->domandCookie:Ljava/lang/String;

    invoke-static {p1, v0, v1}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->cookie:Ljava/lang/String;

    .line 22
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    new-instance p1, Le/e/a/Mp4Transfer115$$ExternalSyntheticLambda0;

    invoke-direct {p1, p0}, Le/e/a/Mp4Transfer115$$ExternalSyntheticLambda0;-><init>(Le/e/a/Mp4Transfer115;)V

    invoke-static {v0, p1}, Le/e/a/Mp4Playlist115;->load(Ljava/net/URL;Le/e/a/Mp4Playlist115$Fetch;)Ljava/util/List;

    move-result-object p1

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    const-wide/16 v1, 0x0

    iput-wide v1, v0, Le/e/a/DownloadJobs115$Job;->total:J

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_121
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-nez v3, :cond_1ce

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result v0

    if-nez v0, :cond_140

    iget-object v0, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result v0

    if-eqz v0, :cond_138

    goto :goto_140

    :cond_138
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u4f5c\u696d\u30d5\u30a9\u30eb\u30c0\u3092\u4f5c\u6210\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_140
    :goto_140
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    const-string v2, "\u30c0\u30a6\u30f3\u30ed\u30fc\u30c9\u4e2d"

    iput-object v2, v1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    .line 23
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_14f
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_16d

    .line 24
    iget-object p1, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    const-string v1, "MP4\u4f5c\u6210\u4e2d"

    iput-object v1, p1, Le/e/a/DownloadJobs115$Job;->phase:Ljava/lang/String;

    iget-object p1, p0, Le/e/a/Mp4Transfer115;->context:Landroid/content/Context;

    invoke-static {p1}, Le/e/a/DownloadJobs115;->changed(Landroid/content/Context;)V

    new-instance p1, Ljava/io/File;

    iget-object v1, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    const-string v2, "complete.mp4"

    invoke-direct {p1, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    invoke-virtual {p0, v0, p1}, Le/e/a/Mp4Transfer115;->mux(Ljava/util/List;Ljava/io/File;)V

    return-object p1

    .line 23
    :cond_16d
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/Mp4Playlist115$Plan;

    new-instance v2, Ljava/io/File;

    iget-object v3, p0, Le/e/a/Mp4Transfer115;->folder:Ljava/io/File;

    new-instance v6, Ljava/lang/StringBuilder;

    const-string v7, "track-"

    invoke-direct {v6, v7}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    add-int/lit8 v7, v4, 0x1

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_18b
    new-instance v3, Ljava/io/BufferedOutputStream;

    new-instance v4, Ljava/io/FileOutputStream;

    invoke-direct {v4, v2}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v3, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_195
    .catchall {:try_start_18b .. :try_end_195} :catchall_1c4

    :try_start_195
    iget-object v1, v1, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_19b
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4
    :try_end_19f
    .catchall {:try_start_195 .. :try_end_19f} :catchall_1be

    if-nez v4, :cond_1a9

    :try_start_1a1
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_1a4
    .catchall {:try_start_1a1 .. :try_end_1a4} :catchall_1c4

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move v4, v7

    goto :goto_14f

    :cond_1a9
    :try_start_1a9
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/Mp4Playlist115$Segment;

    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-virtual {p0, v4, v3}, Le/e/a/Mp4Transfer115;->binary(Le/e/a/Mp4Playlist115$Segment;Ljava/io/OutputStream;)V

    iget-object v4, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget v6, v4, Le/e/a/DownloadJobs115$Job;->finishedAssets:I

    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Le/e/a/DownloadJobs115$Job;->finishedAssets:I
    :try_end_1bd
    .catchall {:try_start_1a9 .. :try_end_1bd} :catchall_1be

    goto :goto_19b

    :catchall_1be
    move-exception p1

    move-object v5, p1

    :try_start_1c0
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    throw v5
    :try_end_1c4
    .catchall {:try_start_1c0 .. :try_end_1c4} :catchall_1c4

    :catchall_1c4
    move-exception p1

    if-eqz v5, :cond_1cd

    if-eq v5, p1, :cond_1cc

    invoke-virtual {v5, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1cc
    move-object p1, v5

    :cond_1cd
    throw p1

    .line 22
    :cond_1ce
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Le/e/a/Mp4Playlist115$Plan;

    iget-object v6, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget v7, v6, Le/e/a/DownloadJobs115$Job;->assets:I

    iget-object v8, v3, Le/e/a/Mp4Playlist115$Plan;->segments:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v8

    add-int/2addr v7, v8

    iput v7, v6, Le/e/a/DownloadJobs115$Job;->assets:I

    iget-wide v6, v3, Le/e/a/Mp4Playlist115$Plan;->bytes:J

    cmp-long v6, v6, v1

    if-ltz v6, :cond_1fb

    iget-object v6, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v6, v6, Le/e/a/DownloadJobs115$Job;->total:J

    cmp-long v6, v6, v1

    if-gez v6, :cond_1f0

    goto :goto_1fb

    :cond_1f0
    iget-object v6, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget-wide v7, v6, Le/e/a/DownloadJobs115$Job;->total:J

    iget-wide v9, v3, Le/e/a/Mp4Playlist115$Plan;->bytes:J

    add-long/2addr v7, v9

    iput-wide v7, v6, Le/e/a/DownloadJobs115$Job;->total:J

    goto/16 :goto_121

    :cond_1fb
    :goto_1fb
    iget-object v3, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    const-wide/16 v6, -0x1

    iput-wide v6, v3, Le/e/a/DownloadJobs115$Job;->total:J

    goto/16 :goto_121

    .line 19
    :cond_203
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u97f3\u58f0\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_20b
    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_4b

    :cond_20f
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u6307\u5b9a\u3057\u305f\u753b\u8cea\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 18
    :cond_217
    invoke-virtual {v2, v7}, Lorg/json/JSONArray;->getJSONObject(I)Lorg/json/JSONObject;

    move-result-object v9

    invoke-virtual {v9, v10}, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z

    move-result v10

    if-nez v10, :cond_222

    :cond_221
    :goto_221
    goto :goto_243

    :cond_222
    invoke-virtual {v9, v11}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Le/e/a/Mp4Transfer115;->height(Ljava/lang/String;)I

    move-result v10

    const-string v11, "height"

    invoke-virtual {v9, v11, v10}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v10

    iget-object v11, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget v11, v11, Le/e/a/DownloadJobs115$Job;->height:I

    if-lez v11, :cond_23f

    if-lez v10, :cond_221

    iget-object v11, p0, Le/e/a/Mp4Transfer115;->job:Le/e/a/DownloadJobs115$Job;

    iget v11, v11, Le/e/a/DownloadJobs115$Job;->height:I

    if-le v10, v11, :cond_23f

    goto :goto_221

    :cond_23f
    if-le v10, v6, :cond_221

    move-object v8, v9

    move v6, v10

    :goto_243
    add-int/lit8 v7, v7, 0x1

    goto/16 :goto_3e

    .line 17
    :cond_247
    new-instance p1, Ljava/io/IOException;

    const-string v0, "\u52d5\u753b\u60c5\u5831\u3092\u53d6\u5f97\u3067\u304d\u307e\u305b\u3093\u3002\u8996\u8074\u6a29\u9650\u3084\u901a\u4fe1\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method small(Ljava/net/URL;I)[B
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 14
    const-wide/16 v2, -0x1

    const-wide/16 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-virtual/range {v0 .. v5}, Le/e/a/Mp4Transfer115;->open(Ljava/net/URL;JJ)Ljava/net/HttpURLConnection;

    move-result-object p1

    const/4 v0, 0x0

    :try_start_b
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_f
    .catchall {:try_start_b .. :try_end_f} :catchall_6a

    :try_start_f
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_14
    .catchall {:try_start_f .. :try_end_14} :catchall_52

    const/16 v3, 0x2000

    :try_start_16
    new-array v3, v3, [B

    :goto_18
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_31

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p2
    :try_end_23
    .catchall {:try_start_16 .. :try_end_23} :catchall_48

    :try_start_23
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_26
    .catchall {:try_start_23 .. :try_end_26} :catchall_52

    if-eqz v1, :cond_2b

    :try_start_28
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_2b
    .catchall {:try_start_28 .. :try_end_2b} :catchall_6a

    :cond_2b
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    return-object p2

    :cond_31
    :try_start_31
    invoke-virtual {p0}, Le/e/a/Mp4Transfer115;->check()V

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    if-gt v5, p2, :cond_40

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_18

    :cond_40
    new-instance p2, Ljava/io/IOException;

    const-string v3, "\u914d\u4fe1\u60c5\u5831\u304c\u5927\u304d\u3059\u304e\u307e\u3059"

    invoke-direct {p2, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_48
    .catchall {:try_start_31 .. :try_end_48} :catchall_48

    :catchall_48
    move-exception p2

    :try_start_49
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw p2
    :try_end_4d
    .catchall {:try_start_49 .. :try_end_4d} :catchall_4d

    :catchall_4d
    move-exception v2

    move-object v6, v2

    move-object v2, p2

    move-object p2, v6

    goto :goto_54

    :catchall_52
    move-exception p2

    move-object v2, v0

    :goto_54
    if-nez v2, :cond_57

    goto :goto_60

    :cond_57
    if-eq v2, p2, :cond_5f

    :try_start_59
    invoke-virtual {v2, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V
    :try_end_5c
    .catchall {:try_start_59 .. :try_end_5c} :catchall_5d

    goto :goto_5f

    :catchall_5d
    move-exception p2

    goto :goto_6c

    :cond_5f
    :goto_5f
    move-object p2, v2

    :goto_60
    if-eqz v1, :cond_65

    :try_start_62
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_65
    throw p2
    :try_end_66
    .catchall {:try_start_62 .. :try_end_66} :catchall_66

    :catchall_66
    move-exception v1

    move-object v2, p2

    move-object p2, v1

    goto :goto_6c

    :catchall_6a
    move-exception p2

    move-object v2, v0

    :goto_6c
    if-eqz v2, :cond_74

    if-eq v2, p2, :cond_73

    :try_start_70
    invoke-virtual {v2, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_73
    move-object p2, v2

    :cond_74
    throw p2
    :try_end_75
    .catchall {:try_start_70 .. :try_end_75} :catchall_75

    :catchall_75
    move-exception p2

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    iput-object v0, p0, Le/e/a/Mp4Transfer115;->connection:Ljava/net/HttpURLConnection;

    throw p2
.end method

.method text(Ljava/net/URL;)Ljava/lang/String;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 15
    new-instance v0, Ljava/lang/String;

    const/high16 v1, 0x400000

    invoke-virtual {p0, p1, v1}, Le/e/a/Mp4Transfer115;->small(Ljava/net/URL;I)[B

    move-result-object p1

    const-string v1, "UTF-8"

    invoke-direct {v0, p1, v1}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    return-object v0
.end method
