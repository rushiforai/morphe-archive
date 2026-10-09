.class public final Le/e/a/CachePlayback;
.super Ljava/lang/Object;
.source "CachePlayback.java"


# static fields
.field private static final TOKEN:Ljava/lang/String;

.field private static final roots:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private static server:Ljava/net/ServerSocket;

.field private static final workers:Ljava/util/concurrent/ExecutorService;


# direct methods
.method static constructor <clinit>()V
    .registers 9

    .line 13
    invoke-static {}, Ljava/util/UUID;->randomUUID()Ljava/util/UUID;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v0

    sput-object v0, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    .line 14
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    sput-object v0, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    .line 15
    new-instance v1, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v6, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v7, Ljava/util/concurrent/SynchronousQueue;

    invoke-direct {v7}, Ljava/util/concurrent/SynchronousQueue;-><init>()V

    new-instance v8, Le/e/a/CachePlayback$2;

    invoke-direct {v8}, Le/e/a/CachePlayback$2;-><init>()V

    const/4 v2, 0x0

    const/4 v3, 0x3

    const-wide/16 v4, 0x1e

    invoke-direct/range {v1 .. v8}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;Ljava/util/concurrent/ThreadFactory;)V

    sput-object v1, Le/e/a/CachePlayback;->workers:Ljava/util/concurrent/ExecutorService;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static dataSource(Landroid/media/MediaPlayer;Ljava/lang/String;)V
    .registers 3
    .param p0, "p"    # Landroid/media/MediaPlayer;
    .param p1, "value"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    invoke-static {p1}, Le/e/a/CachePlayback;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    return-void
.end method

.method public static fromFile(Ljava/io/File;)Landroid/net/Uri;
    .registers 2
    .param p0, "f"    # Ljava/io/File;

    .line 17
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_f

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    goto :goto_13

    :cond_f
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object v0

    :goto_13
    return-object v0
.end method

.method static synthetic lambda$start$1(Ljava/net/Socket;)V
    .registers 1
    .param p0, "s"    # Ljava/net/Socket;

    .line 28
    invoke-static {p0}, Le/e/a/CachePlayback;->serve(Ljava/net/Socket;)V

    return-void
.end method

.method static synthetic lambda$start$2()V
    .registers 3

    .line 28
    :goto_0
    sget-object v0, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_1f

    :try_start_8
    sget-object v0, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0
    :try_end_e
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_e} :catch_1e

    .local v0, "s":Ljava/net/Socket;
    :try_start_e
    sget-object v1, Le/e/a/CachePlayback;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CachePlayback$0;

    invoke-direct {v2, v0}, Le/e/a/CachePlayback$0;-><init>(Ljava/net/Socket;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_18
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_e .. :try_end_18} :catch_19
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_18} :catch_1e

    goto :goto_0

    :catch_19
    move-exception v1

    .local v1, "e":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_1a
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_1d
    .catch Ljava/io/IOException; {:try_start_1a .. :try_end_1d} :catch_1e

    goto :goto_0

    .end local v0    # "s":Ljava/net/Socket;
    .end local v1    # "e":Ljava/util/concurrent/RejectedExecutionException;
    :catch_1e
    move-exception v0

    :cond_1f
    return-void
.end method

.method static synthetic lambda$static$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3
    .param p0, "r"    # Ljava/lang/Runnable;

    .line 15
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-cache-reader"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .local v0, "t":Ljava/lang/Thread;
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method public static parse(Ljava/lang/String;)Landroid/net/Uri;
    .registers 2
    .param p0, "value"    # Ljava/lang/String;

    .line 16
    invoke-static {p0}, Le/e/a/CachePlayback;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    return-object v0
.end method

.method private static reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    .registers 27
    .param p0, "socket"    # Ljava/net/Socket;
    .param p1, "status"    # I
    .param p2, "start"    # J
    .param p4, "count"    # J
    .param p6, "size"    # J
    .param p8, "mime"    # Ljava/lang/String;
    .param p9, "range"    # Z
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 45
    move/from16 v0, p1

    move-wide/from16 v1, p2

    move-wide/from16 v3, p4

    move-wide/from16 v5, p6

    const/16 v7, 0xc8

    const/16 v8, 0x1a0

    if-ne v0, v7, :cond_11

    const-string v7, "OK"

    goto :goto_26

    :cond_11
    const/16 v7, 0xce

    if-ne v0, v7, :cond_18

    const-string v7, "Partial Content"

    goto :goto_26

    :cond_18
    if-ne v0, v8, :cond_1d

    const-string v7, "Range Not Satisfiable"

    goto :goto_26

    :cond_1d
    const/16 v7, 0x195

    if-ne v0, v7, :cond_24

    const-string v7, "Method Not Allowed"

    goto :goto_26

    :cond_24
    const-string v7, "Not Found"

    .line 46
    .local v7, "reason":Ljava/lang/String;
    :goto_26
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    const-string v10, "HTTP/1.1 "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, " "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v10, "\r\nContent-Type: "

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    move-object/from16 v10, p8

    invoke-virtual {v9, v10}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "\r\nContent-Length: "

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v9

    const-string v11, "\r\nAccept-Ranges: bytes\r\nConnection: close\r\n"

    invoke-virtual {v9, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 47
    .local v9, "headers":Ljava/lang/String;
    const-string v11, "\r\n"

    if-eqz p9, :cond_97

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "Content-Range: bytes "

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "-"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    add-long v13, v1, v3

    const-wide/16 v15, 0x1

    sub-long/2addr v13, v15

    invoke-virtual {v12, v13, v14}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    const-string v13, "/"

    invoke-virtual {v12, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 48
    :cond_97
    if-ne v0, v8, :cond_b4

    new-instance v8, Ljava/lang/StringBuilder;

    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v8, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    const-string v12, "Content-Range: bytes */"

    invoke-virtual {v8, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v5, v6}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v9

    .line 49
    :cond_b4
    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v8

    new-instance v12, Ljava/lang/StringBuilder;

    invoke-direct {v12}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v12, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    invoke-virtual {v12, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v11

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    sget-object v12, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v11, v12}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v11

    invoke-virtual {v8, v11}, Ljava/io/OutputStream;->write([B)V

    .line 50
    return-void
.end method

.method private static serve(Ljava/net/Socket;)V
    .registers 37
    .param p0, "socket"    # Ljava/net/Socket;

    .line 31
    const-string v0, "/"

    move-object/from16 v1, p0

    .local v1, "s":Ljava/net/Socket;
    const/16 v2, 0x3a98

    :try_start_6
    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v11, v2

    .line 32
    .local v11, "reader":Ljava/io/BufferedReader;
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v2

    move-object v12, v2

    .local v12, "first":Ljava/lang/String;
    if-eqz v12, :cond_33f

    invoke-virtual {v12}, Ljava/lang/String;->length()I

    move-result v2

    const/16 v3, 0x1000

    if-le v2, v3, :cond_2d

    move-object/from16 v30, v11

    goto/16 :goto_341

    :cond_2d
    const-string v2, " "

    invoke-virtual {v12, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v2

    move-object v13, v2

    .local v13, "req":[Ljava/lang/String;
    array-length v2, v13
    :try_end_35
    .catchall {:try_start_6 .. :try_end_35} :catchall_347

    const/4 v4, 0x3

    if-eq v2, v4, :cond_3e

    .line 42
    if-eqz v1, :cond_3d

    :try_start_3a
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_3d
    .catch Ljava/io/IOException; {:try_start_3a .. :try_end_3d} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_3a .. :try_end_3d} :catch_354

    .line 32
    :cond_3d
    return-void

    :cond_3e
    const/4 v14, 0x0

    :try_start_3f
    aget-object v2, v13, v14

    const-string v5, "HEAD"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    move v15, v2

    .local v15, "head":Z
    if-nez v15, :cond_68

    aget-object v2, v13, v14

    const-string v5, "GET"

    invoke-virtual {v2, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_68

    const-string v9, "text/plain"

    const/4 v10, 0x0

    const/16 v2, 0x195

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_62
    .catchall {:try_start_3f .. :try_end_62} :catchall_347

    .line 42
    if-eqz v1, :cond_67

    :try_start_64
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_67
    .catch Ljava/io/IOException; {:try_start_64 .. :try_end_67} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_64 .. :try_end_67} :catch_354

    .line 32
    :cond_67
    return-void

    .line 33
    :cond_68
    const/4 v2, 0x0

    .local v2, "range":Ljava/lang/String;
    const/4 v5, 0x0

    move/from16 v16, v5

    .local v16, "lines":I
    :goto_6c
    :try_start_6c
    invoke-virtual {v11}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v5

    move-object v6, v5

    .local v6, "line":Ljava/lang/String;
    const/4 v7, 0x6

    if-eqz v5, :cond_a7

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_a7

    add-int/lit8 v5, v16, 0x1

    .end local v16    # "lines":I
    .local v5, "lines":I
    const/16 v8, 0x40

    if-gt v5, v8, :cond_a1

    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v8

    if-le v8, v3, :cond_87

    goto :goto_a1

    :cond_87
    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "range:"

    invoke-virtual {v8, v9}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v8

    if-eqz v8, :cond_9e

    invoke-virtual {v6, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v7
    :try_end_9d
    .catchall {:try_start_6c .. :try_end_9d} :catchall_347

    move-object v2, v7

    :cond_9e
    move/from16 v16, v5

    goto :goto_6c

    .line 42
    :cond_a1
    :goto_a1
    if-eqz v1, :cond_a6

    :try_start_a3
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_a6
    .catch Ljava/io/IOException; {:try_start_a3 .. :try_end_a6} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_a3 .. :try_end_a6} :catch_354

    .line 33
    :cond_a6
    return-void

    .line 34
    .end local v5    # "lines":I
    .restart local v16    # "lines":I
    :cond_a7
    const/4 v3, 0x1

    :try_start_a8
    aget-object v5, v13, v3

    const/4 v8, -0x1

    invoke-virtual {v5, v0, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v5

    .local v5, "parts":[Ljava/lang/String;
    array-length v9, v5

    const/4 v10, 0x4

    const/16 v17, 0x1

    const/4 v3, 0x2

    if-ne v9, v10, :cond_c5

    aget-object v4, v5, v4

    const-string v9, "\\?"

    invoke-virtual {v4, v9, v3}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v4

    aget-object v4, v4, v14

    invoke-static {v4}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_c7

    :cond_c5
    const-string v4, ""

    .line 35
    .local v4, "name":Ljava/lang/String;
    :goto_c7
    array-length v9, v5

    if-ne v9, v10, :cond_df

    aget-object v9, v5, v17

    sget-object v10, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    invoke-virtual {v9, v10}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_df

    sget-object v9, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    aget-object v10, v5, v3

    invoke-interface {v9, v10}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;
    :try_end_de
    .catchall {:try_start_a8 .. :try_end_de} :catchall_347

    goto :goto_e0

    :cond_df
    const/4 v9, 0x0

    .line 36
    .local v9, "root":Ljava/lang/String;
    :goto_e0
    if-eqz v9, :cond_314

    :try_start_e2
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v10

    if-nez v10, :cond_314

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_314

    const-string v0, "\\"

    invoke-virtual {v4, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_314

    const-string v0, ".."

    invoke-virtual {v4, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_110

    move-object/from16 v17, v1

    move-object/from16 v26, v2

    move-object/from16 v21, v4

    move-object/from16 v19, v5

    move-object/from16 v18, v6

    move-object/from16 v22, v9

    move-object/from16 v30, v11

    move/from16 v20, v15

    goto/16 :goto_324

    .line 37
    :cond_110
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v9, v4}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    move-object v10, v0

    .local v10, "file":Ljava/io/File;
    invoke-virtual {v10}, Ljava/io/File;->isFile()Z

    move-result v0
    :try_end_11a
    .catchall {:try_start_e2 .. :try_end_11a} :catchall_30f

    if-nez v0, :cond_146

    move-object v3, v9

    .end local v9    # "root":Ljava/lang/String;
    .local v3, "root":Ljava/lang/String;
    :try_start_11d
    const-string v9, "text/plain"

    move-object v7, v10

    .end local v10    # "file":Ljava/io/File;
    .local v7, "file":Ljava/io/File;
    const/4 v10, 0x0

    move-object v8, v2

    .end local v2    # "range":Ljava/lang/String;
    .local v8, "range":Ljava/lang/String;
    const/16 v2, 0x194

    move-object/from16 v17, v3

    move-object v14, v4

    .end local v3    # "root":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    .local v14, "name":Ljava/lang/String;
    .local v17, "root":Ljava/lang/String;
    const-wide/16 v3, 0x0

    move-object/from16 v19, v5

    move-object/from16 v18, v6

    .end local v5    # "parts":[Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .local v18, "line":Ljava/lang/String;
    .local v19, "parts":[Ljava/lang/String;
    const-wide/16 v5, 0x0

    move-object/from16 v21, v7

    move-object/from16 v20, v8

    .end local v7    # "file":Ljava/io/File;
    .end local v8    # "range":Ljava/lang/String;
    .local v20, "range":Ljava/lang/String;
    .local v21, "file":Ljava/io/File;
    const-wide/16 v7, 0x0

    move-object/from16 v22, v21

    move-object/from16 v21, v14

    move-object/from16 v14, v22

    move-object/from16 v22, v17

    .end local v17    # "root":Ljava/lang/String;
    .local v14, "file":Ljava/io/File;
    .local v21, "name":Ljava/lang/String;
    .local v22, "root":Ljava/lang/String;
    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_140
    .catchall {:try_start_11d .. :try_end_140} :catchall_347

    .line 42
    if-eqz v1, :cond_145

    :try_start_142
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_145
    .catch Ljava/io/IOException; {:try_start_142 .. :try_end_145} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_142 .. :try_end_145} :catch_354

    .line 37
    :cond_145
    return-void

    .line 38
    .end local v14    # "file":Ljava/io/File;
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "range":Ljava/lang/String;
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v4    # "name":Ljava/lang/String;
    .restart local v5    # "parts":[Ljava/lang/String;
    .restart local v6    # "line":Ljava/lang/String;
    .restart local v9    # "root":Ljava/lang/String;
    .restart local v10    # "file":Ljava/io/File;
    :cond_146
    move-object/from16 v21, v4

    move-object/from16 v19, v5

    move-object/from16 v18, v6

    move-object/from16 v22, v9

    move-object v4, v10

    .end local v5    # "parts":[Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .end local v9    # "root":Ljava/lang/String;
    .end local v10    # "file":Ljava/io/File;
    .local v4, "file":Ljava/io/File;
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    :try_start_14f
    invoke-virtual {v4}, Ljava/io/File;->length()J

    move-result-wide v5
    :try_end_153
    .catchall {:try_start_14f .. :try_end_153} :catchall_30f

    .local v5, "size":J
    const-wide/16 v9, 0x0

    .local v9, "start":J
    const-wide/16 v23, 0x1

    move/from16 v20, v15

    const/4 v0, 0x0

    .end local v15    # "head":Z
    .local v20, "head":Z
    sub-long v14, v5, v23

    .local v14, "end":J
    const/16 v25, 0xc8

    .line 39
    .local v25, "status":I
    move-object/from16 v26, v1

    const/16 v27, 0x0

    .end local v1    # "s":Ljava/net/Socket;
    .local v26, "s":Ljava/net/Socket;
    if-eqz v2, :cond_235

    const-wide/16 v28, 0x0

    :try_start_166
    const-string v0, "bytes="

    invoke-virtual {v2, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1f7

    const-string v0, ","

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_1f7

    invoke-virtual {v2, v7}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "-"

    invoke-virtual {v0, v1, v8}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v0

    .local v0, "r":[Ljava/lang/String;
    array-length v1, v0

    if-ne v1, v3, :cond_1ee

    aget-object v1, v0, v27

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_1ab

    aget-object v1, v0, v17

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v30
    :try_end_191
    .catch Ljava/lang/RuntimeException; {:try_start_166 .. :try_end_191} :catch_208
    .catchall {:try_start_166 .. :try_end_191} :catchall_202

    .local v30, "suffix":J
    cmp-long v1, v30, v28

    if-lez v1, :cond_1a2

    move-wide/from16 v32, v9

    .end local v9    # "start":J
    .local v32, "start":J
    sub-long v8, v5, v30

    move-object v3, v2

    move-wide/from16 v1, v28

    .end local v2    # "range":Ljava/lang/String;
    .local v3, "range":Ljava/lang/String;
    :try_start_19c
    invoke-static {v1, v2, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    move-wide v9, v8

    .end local v30    # "suffix":J
    .end local v32    # "start":J
    .local v8, "start":J
    goto :goto_1c8

    .end local v3    # "range":Ljava/lang/String;
    .end local v8    # "start":J
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v9    # "start":J
    .restart local v30    # "suffix":J
    :cond_1a2
    move-object v3, v2

    move-wide/from16 v32, v9

    .end local v2    # "range":Ljava/lang/String;
    .end local v9    # "start":J
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v32    # "start":J
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "size":J
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v26    # "s":Ljava/net/Socket;
    .end local v32    # "start":J
    .end local p0    # "socket":Ljava/net/Socket;
    throw v1

    .end local v30    # "suffix":J
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v9    # "start":J
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    .restart local v26    # "s":Ljava/net/Socket;
    .restart local p0    # "socket":Ljava/net/Socket;
    :cond_1ab
    move-object v3, v2

    move-wide/from16 v32, v9

    .end local v2    # "range":Ljava/lang/String;
    .end local v9    # "start":J
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v32    # "start":J
    aget-object v1, v0, v27

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1
    :try_end_1b4
    .catch Ljava/lang/RuntimeException; {:try_start_19c .. :try_end_1b4} :catch_200
    .catchall {:try_start_19c .. :try_end_1b4} :catchall_202

    move-wide v9, v1

    .end local v32    # "start":J
    .restart local v9    # "start":J
    :try_start_1b5
    aget-object v1, v0, v17

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_1c8

    aget-object v1, v0, v17

    invoke-static {v1}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v1

    invoke-static {v14, v15, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    move-wide v14, v1

    :cond_1c8
    :goto_1c8
    const-wide/16 v28, 0x0

    cmp-long v1, v9, v28

    if-ltz v1, :cond_1e4

    cmp-long v1, v9, v5

    if-gez v1, :cond_1e4

    cmp-long v1, v14, v9

    if-ltz v1, :cond_1e4

    const/16 v25, 0xce

    .end local v0    # "r":[Ljava/lang/String;
    move-object/from16 v30, v11

    move-object/from16 v1, v26

    move-object/from16 v26, v3

    move-object v11, v4

    move-wide v3, v9

    move/from16 v2, v25

    goto/16 :goto_242

    .restart local v0    # "r":[Ljava/lang/String;
    :cond_1e4
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "size":J
    .end local v9    # "start":J
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v26    # "s":Ljava/net/Socket;
    .end local p0    # "socket":Ljava/net/Socket;
    throw v1
    :try_end_1ea
    .catch Ljava/lang/RuntimeException; {:try_start_1b5 .. :try_end_1ea} :catch_1ea
    .catchall {:try_start_1b5 .. :try_end_1ea} :catchall_202

    .end local v0    # "r":[Ljava/lang/String;
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v9    # "start":J
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    .restart local v26    # "s":Ljava/net/Socket;
    .restart local p0    # "socket":Ljava/net/Socket;
    :catch_1ea
    move-exception v0

    move-wide/from16 v32, v9

    goto :goto_20c

    .end local v3    # "range":Ljava/lang/String;
    .restart local v0    # "r":[Ljava/lang/String;
    .restart local v2    # "range":Ljava/lang/String;
    :cond_1ee
    move-object v3, v2

    move-wide/from16 v32, v9

    .end local v2    # "range":Ljava/lang/String;
    .end local v9    # "start":J
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v32    # "start":J
    :try_start_1f1
    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-direct {v1}, Ljava/lang/IllegalArgumentException;-><init>()V

    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "size":J
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v26    # "s":Ljava/net/Socket;
    .end local v32    # "start":J
    .end local p0    # "socket":Ljava/net/Socket;
    throw v1

    .end local v0    # "r":[Ljava/lang/String;
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v9    # "start":J
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    .restart local v26    # "s":Ljava/net/Socket;
    .restart local p0    # "socket":Ljava/net/Socket;
    :cond_1f7
    move-object v3, v2

    move-wide/from16 v32, v9

    .end local v2    # "range":Ljava/lang/String;
    .end local v9    # "start":J
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v32    # "start":J
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "size":J
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v26    # "s":Ljava/net/Socket;
    .end local v32    # "start":J
    .end local p0    # "socket":Ljava/net/Socket;
    throw v0
    :try_end_200
    .catch Ljava/lang/RuntimeException; {:try_start_1f1 .. :try_end_200} :catch_200
    .catchall {:try_start_1f1 .. :try_end_200} :catchall_202

    .restart local v3    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    .restart local v26    # "s":Ljava/net/Socket;
    .restart local v32    # "start":J
    .restart local p0    # "socket":Ljava/net/Socket;
    :catch_200
    move-exception v0

    goto :goto_20c

    .line 31
    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v5    # "size":J
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v32    # "start":J
    :catchall_202
    move-exception v0

    move-object v2, v0

    move-object/from16 v1, v26

    goto/16 :goto_349

    .line 39
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v9    # "start":J
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    :catch_208
    move-exception v0

    move-object v3, v2

    move-wide/from16 v32, v9

    .end local v2    # "range":Ljava/lang/String;
    .end local v9    # "start":J
    .local v0, "e":Ljava/lang/RuntimeException;
    .restart local v3    # "range":Ljava/lang/String;
    .restart local v32    # "start":J
    :goto_20c
    :try_start_20c
    const-string v9, "text/plain"
    :try_end_20e
    .catchall {:try_start_20c .. :try_end_20e} :catchall_22f

    const/4 v10, 0x0

    const/16 v2, 0x1a0

    move-object v8, v3

    move-object v7, v4

    .end local v3    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .restart local v7    # "file":Ljava/io/File;
    .local v8, "range":Ljava/lang/String;
    const-wide/16 v3, 0x0

    move-object/from16 v17, v7

    move-object v1, v8

    move-wide v7, v5

    .end local v5    # "size":J
    .end local v8    # "range":Ljava/lang/String;
    .local v1, "range":Ljava/lang/String;
    .local v7, "size":J
    .local v17, "file":Ljava/io/File;
    const-wide/16 v5, 0x0

    move-object/from16 v30, v26

    move-object/from16 v26, v1

    move-object/from16 v1, v30

    move-object/from16 v30, v11

    move-object/from16 v11, v17

    .end local v17    # "file":Ljava/io/File;
    .local v1, "s":Ljava/net/Socket;
    .local v11, "file":Ljava/io/File;
    .local v26, "range":Ljava/lang/String;
    .local v30, "reader":Ljava/io/BufferedReader;
    :try_start_225
    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_228
    .catchall {:try_start_225 .. :try_end_228} :catchall_347

    move-wide v5, v7

    .line 42
    .end local v7    # "size":J
    .restart local v5    # "size":J
    if-eqz v1, :cond_22e

    :try_start_22b
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_22e
    .catch Ljava/io/IOException; {:try_start_22b .. :try_end_22e} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_22b .. :try_end_22e} :catch_354

    .line 39
    :cond_22e
    return-void

    .line 31
    .end local v0    # "e":Ljava/lang/RuntimeException;
    .end local v1    # "s":Ljava/net/Socket;
    .end local v5    # "size":J
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v25    # "status":I
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .end local v32    # "start":J
    .local v26, "s":Ljava/net/Socket;
    :catchall_22f
    move-exception v0

    move-object/from16 v1, v26

    move-object v2, v0

    .end local v26    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    goto/16 :goto_349

    .line 39
    .end local v1    # "s":Ljava/net/Socket;
    .restart local v2    # "range":Ljava/lang/String;
    .restart local v4    # "file":Ljava/io/File;
    .restart local v5    # "size":J
    .restart local v9    # "start":J
    .local v11, "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v25    # "status":I
    .restart local v26    # "s":Ljava/net/Socket;
    :cond_235
    move-wide/from16 v32, v9

    move-object/from16 v30, v11

    move-object/from16 v1, v26

    move-object/from16 v26, v2

    move-object v11, v4

    .end local v2    # "range":Ljava/lang/String;
    .end local v4    # "file":Ljava/io/File;
    .end local v9    # "start":J
    .restart local v1    # "s":Ljava/net/Socket;
    .local v11, "file":Ljava/io/File;
    .local v26, "range":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v32    # "start":J
    move-wide/from16 v3, v32

    move/from16 v2, v25

    .line 40
    .end local v25    # "status":I
    .end local v32    # "start":J
    .local v2, "status":I
    .local v3, "start":J
    :goto_242
    sub-long v8, v14, v3

    add-long v8, v8, v23

    move-object v10, v1

    const-wide/16 v0, 0x0

    .end local v1    # "s":Ljava/net/Socket;
    .local v10, "s":Ljava/net/Socket;
    :try_start_249
    invoke-static {v0, v1, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    move-wide/from16 v34, v8

    move-wide v7, v5

    move-wide/from16 v5, v34

    const/16 v23, -0x1

    .local v5, "count":J
    .restart local v7    # "size":J
    invoke-static/range {v21 .. v21}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9
    :try_end_258
    .catchall {:try_start_249 .. :try_end_258} :catchall_308

    const/16 v0, 0xce

    if-ne v2, v0, :cond_25f

    move-object v1, v10

    const/4 v10, 0x1

    goto :goto_261

    :cond_25f
    move-object v1, v10

    const/4 v10, 0x0

    .end local v10    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    :goto_261
    const/4 v0, -0x1

    const-wide/16 v28, 0x0

    :try_start_264
    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_267
    .catchall {:try_start_264 .. :try_end_267} :catchall_30f

    .line 41
    if-eqz v20, :cond_26f

    .line 42
    if-eqz v1, :cond_26e

    :try_start_26b
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_26e
    .catch Ljava/io/IOException; {:try_start_26b .. :try_end_26e} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_26b .. :try_end_26e} :catch_354

    .line 41
    :cond_26e
    return-void

    :cond_26f
    :try_start_26f
    new-instance v9, Le/e/a/CacheInputStream;

    invoke-direct {v9, v11}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_274
    .catchall {:try_start_26f .. :try_end_274} :catchall_30f

    .local v9, "in":Ljava/io/InputStream;
    move-wide/from16 v23, v3

    move-object/from16 v17, v1

    move-wide/from16 v0, v23

    .end local v1    # "s":Ljava/net/Socket;
    .local v0, "skip":J
    .local v17, "s":Ljava/net/Socket;
    :goto_27a
    cmp-long v23, v0, v28

    if-lez v23, :cond_2a6

    :try_start_27e
    invoke-virtual {v9, v0, v1}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v23

    .local v23, "n":J
    cmp-long v25, v23, v28

    if-gtz v25, :cond_298

    invoke-virtual {v9}, Ljava/io/InputStream;->read()I

    move-result v10

    move-wide/from16 v31, v0

    const/4 v0, -0x1

    .end local v0    # "skip":J
    .local v31, "skip":J
    if-eq v10, v0, :cond_292

    const-wide/16 v23, 0x1

    goto :goto_29b

    :cond_292
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .end local v2    # "status":I
    .end local v3    # "start":J
    .end local v5    # "count":J
    .end local v7    # "size":J
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v17    # "s":Ljava/net/Socket;
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v26    # "range":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .end local p0    # "socket":Ljava/net/Socket;
    throw v0
    :try_end_298
    .catchall {:try_start_27e .. :try_end_298} :catchall_2a0

    .end local v31    # "skip":J
    .restart local v0    # "skip":J
    .restart local v2    # "status":I
    .restart local v3    # "start":J
    .restart local v5    # "count":J
    .restart local v7    # "size":J
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v17    # "s":Ljava/net/Socket;
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v26    # "range":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    .restart local p0    # "socket":Ljava/net/Socket;
    :cond_298
    move-wide/from16 v31, v0

    const/4 v0, -0x1

    .end local v0    # "skip":J
    .restart local v31    # "skip":J
    :goto_29b
    sub-long v23, v31, v23

    move-wide/from16 v0, v23

    .end local v31    # "skip":J
    .local v23, "skip":J
    goto :goto_27a

    .end local v23    # "skip":J
    :catchall_2a0
    move-exception v0

    move-object v1, v0

    move-wide/from16 v23, v3

    move v4, v2

    goto :goto_2fa

    .restart local v0    # "skip":J
    :cond_2a6
    move-wide/from16 v31, v0

    .end local v0    # "skip":J
    .restart local v31    # "skip":J
    const/high16 v0, 0x10000

    :try_start_2aa
    new-array v0, v0, [B

    .local v0, "b":[B
    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v1

    .local v1, "out":Ljava/io/OutputStream;
    :goto_2b0
    cmp-long v10, v5, v28

    if-lez v10, :cond_2df

    array-length v10, v0
    :try_end_2b5
    .catchall {:try_start_2aa .. :try_end_2b5} :catchall_2f5

    move-wide/from16 v23, v3

    move v4, v2

    .end local v2    # "status":I
    .end local v3    # "start":J
    .local v4, "status":I
    .local v23, "start":J
    int-to-long v2, v10

    :try_start_2b9
    invoke-static {v5, v6, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v2

    long-to-int v3, v2

    const/4 v2, 0x0

    invoke-virtual {v9, v0, v2, v3}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    .local v3, "n":I
    if-ltz v3, :cond_2d6

    invoke-virtual {v1, v0, v2, v3}, Ljava/io/OutputStream;->write([BII)V

    move-object v10, v0

    move-object/from16 v25, v1

    .end local v0    # "b":[B
    .end local v1    # "out":Ljava/io/OutputStream;
    .local v10, "b":[B
    .local v25, "out":Ljava/io/OutputStream;
    int-to-long v0, v3

    sub-long/2addr v5, v0

    move v2, v4

    move-object v0, v10

    move-wide/from16 v3, v23

    move-object/from16 v1, v25

    const/16 v27, 0x0

    .end local v3    # "n":I
    goto :goto_2b0

    .end local v10    # "b":[B
    .end local v25    # "out":Ljava/io/OutputStream;
    .restart local v0    # "b":[B
    .restart local v1    # "out":Ljava/io/OutputStream;
    .restart local v3    # "n":I
    :cond_2d6
    move-object v10, v0

    move-object/from16 v25, v1

    .end local v0    # "b":[B
    .end local v1    # "out":Ljava/io/OutputStream;
    .restart local v10    # "b":[B
    .restart local v25    # "out":Ljava/io/OutputStream;
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    .end local v4    # "status":I
    .end local v5    # "count":J
    .end local v7    # "size":J
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v17    # "s":Ljava/net/Socket;
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v23    # "start":J
    .end local v26    # "range":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .end local p0    # "socket":Ljava/net/Socket;
    throw v0

    .end local v10    # "b":[B
    .end local v25    # "out":Ljava/io/OutputStream;
    .restart local v0    # "b":[B
    .restart local v1    # "out":Ljava/io/OutputStream;
    .restart local v2    # "status":I
    .local v3, "start":J
    .restart local v5    # "count":J
    .restart local v7    # "size":J
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v17    # "s":Ljava/net/Socket;
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v26    # "range":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    .restart local p0    # "socket":Ljava/net/Socket;
    :cond_2df
    move-object v10, v0

    move-object/from16 v25, v1

    move-wide/from16 v23, v3

    move v4, v2

    .end local v0    # "b":[B
    .end local v1    # "out":Ljava/io/OutputStream;
    .end local v2    # "status":I
    .end local v3    # "start":J
    .restart local v4    # "status":I
    .restart local v10    # "b":[B
    .restart local v23    # "start":J
    .restart local v25    # "out":Ljava/io/OutputStream;
    invoke-virtual/range {v25 .. v25}, Ljava/io/OutputStream;->flush()V
    :try_end_2e8
    .catchall {:try_start_2b9 .. :try_end_2e8} :catchall_2f2

    .end local v10    # "b":[B
    .end local v25    # "out":Ljava/io/OutputStream;
    .end local v31    # "skip":J
    :try_start_2e8
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_2eb
    .catchall {:try_start_2e8 .. :try_end_2eb} :catchall_303

    .line 42
    .end local v4    # "status":I
    .end local v5    # "count":J
    .end local v7    # "size":J
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v23    # "start":J
    .end local v26    # "range":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    if-eqz v17, :cond_35e

    :try_start_2ed
    invoke-virtual/range {v17 .. v17}, Ljava/net/Socket;->close()V
    :try_end_2f0
    .catch Ljava/io/IOException; {:try_start_2ed .. :try_end_2f0} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_2ed .. :try_end_2f0} :catch_354

    goto/16 :goto_35e

    .line 41
    .restart local v4    # "status":I
    .restart local v5    # "count":J
    .restart local v7    # "size":J
    .restart local v9    # "in":Ljava/io/InputStream;
    .restart local v11    # "file":Ljava/io/File;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v14    # "end":J
    .restart local v16    # "lines":I
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v23    # "start":J
    .restart local v26    # "range":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :catchall_2f2
    move-exception v0

    move-object v1, v0

    goto :goto_2fa

    .end local v4    # "status":I
    .end local v23    # "start":J
    .restart local v2    # "status":I
    .restart local v3    # "start":J
    :catchall_2f5
    move-exception v0

    move-wide/from16 v23, v3

    move v4, v2

    move-object v1, v0

    .end local v2    # "status":I
    .end local v3    # "start":J
    .restart local v4    # "status":I
    .restart local v23    # "start":J
    :goto_2fa
    :try_start_2fa
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_2fd
    .catchall {:try_start_2fa .. :try_end_2fd} :catchall_2fe

    goto :goto_302

    :catchall_2fe
    move-exception v0

    :try_start_2ff
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v17    # "s":Ljava/net/Socket;
    .end local p0    # "socket":Ljava/net/Socket;
    :goto_302
    throw v1
    :try_end_303
    .catchall {:try_start_2ff .. :try_end_303} :catchall_303

    .line 31
    .end local v4    # "status":I
    .end local v5    # "count":J
    .end local v7    # "size":J
    .end local v9    # "in":Ljava/io/InputStream;
    .end local v11    # "file":Ljava/io/File;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v14    # "end":J
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v23    # "start":J
    .end local v26    # "range":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "s":Ljava/net/Socket;
    .restart local p0    # "socket":Ljava/net/Socket;
    :catchall_303
    move-exception v0

    move-object v2, v0

    move-object/from16 v1, v17

    goto :goto_349

    .end local v17    # "s":Ljava/net/Socket;
    .local v10, "s":Ljava/net/Socket;
    :catchall_308
    move-exception v0

    move-object/from16 v17, v10

    move-object v2, v0

    move-object/from16 v1, v17

    .end local v10    # "s":Ljava/net/Socket;
    .restart local v17    # "s":Ljava/net/Socket;
    goto :goto_349

    .end local v17    # "s":Ljava/net/Socket;
    .local v1, "s":Ljava/net/Socket;
    :catchall_30f
    move-exception v0

    move-object/from16 v17, v1

    move-object v2, v0

    .end local v1    # "s":Ljava/net/Socket;
    .restart local v17    # "s":Ljava/net/Socket;
    goto :goto_349

    .line 36
    .end local v17    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    .local v2, "range":Ljava/lang/String;
    .local v4, "name":Ljava/lang/String;
    .local v5, "parts":[Ljava/lang/String;
    .restart local v6    # "line":Ljava/lang/String;
    .local v9, "root":Ljava/lang/String;
    .local v11, "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    .restart local v13    # "req":[Ljava/lang/String;
    .restart local v15    # "head":Z
    .restart local v16    # "lines":I
    :cond_314
    move-object/from16 v17, v1

    move-object/from16 v26, v2

    move-object/from16 v21, v4

    move-object/from16 v19, v5

    move-object/from16 v18, v6

    move-object/from16 v22, v9

    move-object/from16 v30, v11

    move/from16 v20, v15

    .end local v1    # "s":Ljava/net/Socket;
    .end local v2    # "range":Ljava/lang/String;
    .end local v4    # "name":Ljava/lang/String;
    .end local v5    # "parts":[Ljava/lang/String;
    .end local v6    # "line":Ljava/lang/String;
    .end local v9    # "root":Ljava/lang/String;
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .end local v15    # "head":Z
    .restart local v17    # "s":Ljava/net/Socket;
    .restart local v18    # "line":Ljava/lang/String;
    .restart local v19    # "parts":[Ljava/lang/String;
    .restart local v20    # "head":Z
    .restart local v21    # "name":Ljava/lang/String;
    .restart local v22    # "root":Ljava/lang/String;
    .restart local v26    # "range":Ljava/lang/String;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :goto_324
    :try_start_324
    const-string v9, "text/plain"
    :try_end_326
    .catchall {:try_start_324 .. :try_end_326} :catchall_33a

    const/4 v10, 0x0

    const/16 v2, 0x194

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object/from16 v1, v17

    .end local v17    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    :try_start_331
    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_334
    .catchall {:try_start_331 .. :try_end_334} :catchall_347

    .line 42
    if-eqz v1, :cond_339

    :try_start_336
    invoke-virtual {v1}, Ljava/net/Socket;->close()V

    .line 36
    :cond_339
    return-void

    .line 31
    .end local v1    # "s":Ljava/net/Socket;
    .end local v12    # "first":Ljava/lang/String;
    .end local v13    # "req":[Ljava/lang/String;
    .end local v16    # "lines":I
    .end local v18    # "line":Ljava/lang/String;
    .end local v19    # "parts":[Ljava/lang/String;
    .end local v20    # "head":Z
    .end local v21    # "name":Ljava/lang/String;
    .end local v22    # "root":Ljava/lang/String;
    .end local v26    # "range":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    .restart local v17    # "s":Ljava/net/Socket;
    :catchall_33a
    move-exception v0

    move-object/from16 v1, v17

    move-object v2, v0

    .end local v17    # "s":Ljava/net/Socket;
    .restart local v1    # "s":Ljava/net/Socket;
    goto :goto_349

    .line 32
    .restart local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v12    # "first":Ljava/lang/String;
    :cond_33f
    move-object/from16 v30, v11

    .line 42
    .end local v11    # "reader":Ljava/io/BufferedReader;
    .restart local v30    # "reader":Ljava/io/BufferedReader;
    :goto_341
    if-eqz v1, :cond_346

    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_346
    .catch Ljava/io/IOException; {:try_start_336 .. :try_end_346} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_336 .. :try_end_346} :catch_354

    .line 32
    :cond_346
    return-void

    .line 31
    .end local v12    # "first":Ljava/lang/String;
    .end local v30    # "reader":Ljava/io/BufferedReader;
    :catchall_347
    move-exception v0

    move-object v2, v0

    :goto_349
    if-eqz v1, :cond_353

    :try_start_34b
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_34e
    .catchall {:try_start_34b .. :try_end_34e} :catchall_34f

    goto :goto_353

    :catchall_34f
    move-exception v0

    :try_start_350
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p0    # "socket":Ljava/net/Socket;
    :cond_353
    :goto_353
    throw v2
    :try_end_354
    .catch Ljava/io/IOException; {:try_start_350 .. :try_end_354} :catch_356
    .catch Ljava/lang/RuntimeException; {:try_start_350 .. :try_end_354} :catch_354

    .line 42
    .end local v1    # "s":Ljava/net/Socket;
    .restart local p0    # "socket":Ljava/net/Socket;
    :catch_354
    move-exception v0

    goto :goto_357

    :catch_356
    move-exception v0

    .local v0, "e":Ljava/lang/Exception;
    :goto_357
    const-string v1, "nicoid-cache"

    const-string v2, "Cached playback request failed"

    invoke-static {v1, v2}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .end local v0    # "e":Ljava/lang/Exception;
    :cond_35e
    :goto_35e
    return-void
.end method

.method private static declared-synchronized start()V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-class v0, Le/e/a/CachePlayback;

    monitor-enter v0

    .line 27
    :try_start_3
    sget-object v1, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;
    :try_end_5
    .catchall {:try_start_3 .. :try_end_5} :catchall_2e

    if-eqz v1, :cond_9

    monitor-exit v0

    return-void

    :cond_9
    :try_start_9
    new-instance v1, Ljava/net/ServerSocket;

    const-string v2, "127.0.0.1"

    invoke-static {v2}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v2

    const/4 v3, 0x0

    const/16 v4, 0x8

    invoke-direct {v1, v3, v4, v2}, Ljava/net/ServerSocket;-><init>(IILjava/net/InetAddress;)V

    sput-object v1, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    .line 28
    new-instance v1, Ljava/lang/Thread;

    new-instance v2, Le/e/a/CachePlayback$1;

    invoke-direct {v2}, Le/e/a/CachePlayback$1;-><init>()V

    const-string v3, "nicoid-cache-server"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .local v1, "accept":Ljava/lang/Thread;
    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_2c
    .catchall {:try_start_9 .. :try_end_2c} :catchall_2e

    .line 29
    monitor-exit v0

    return-void

    .line 26
    .end local v1    # "accept":Ljava/lang/Thread;
    :catchall_2e
    move-exception v1

    :try_start_2f
    monitor-exit v0
    :try_end_30
    .catchall {:try_start_2f .. :try_end_30} :catchall_2e

    throw v1
.end method

.method public static url(Ljava/lang/String;)Ljava/lang/String;
    .registers 8
    .param p0, "value"    # Ljava/lang/String;

    .line 20
    if-nez p0, :cond_4

    const/4 v0, 0x0

    return-object v0

    :cond_4
    const-string v0, "file://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_15

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_16

    :cond_15
    move-object v0, p0

    .line 21
    .local v0, "path":Ljava/lang/String;
    :goto_16
    if-eqz v0, :cond_89

    const-string v1, "/@nicoid-cache/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_21

    goto :goto_89

    .line 22
    :cond_21
    new-instance v2, Le/e/a/CacheFile;

    invoke-direct {v2, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    .local v2, "f":Ljava/io/File;
    invoke-virtual {v2}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v3

    .local v3, "parent":Ljava/lang/String;
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    invoke-virtual {v3, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x2

    const-string v5, "/"

    invoke-virtual {v1, v5, v4}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    const/4 v4, 0x0

    aget-object v1, v1, v4

    .local v1, "id":Ljava/lang/String;
    sget-object v4, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    invoke-interface {v4, v1, v3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :try_start_41
    invoke-static {}, Le/e/a/CachePlayback;->start()V

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "http://127.0.0.1:"

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v6, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v6}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    sget-object v6, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4
    :try_end_7f
    .catch Ljava/io/IOException; {:try_start_41 .. :try_end_7f} :catch_80

    return-object v4

    .line 24
    :catch_80
    move-exception v4

    .local v4, "e":Ljava/io/IOException;
    new-instance v5, Ljava/lang/IllegalStateException;

    const-string v6, "Cannot open cache player"

    invoke-direct {v5, v6, v4}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v5

    .line 21
    .end local v1    # "id":Ljava/lang/String;
    .end local v2    # "f":Ljava/io/File;
    .end local v3    # "parent":Ljava/lang/String;
    .end local v4    # "e":Ljava/io/IOException;
    :cond_89
    :goto_89
    return-object p0
.end method
