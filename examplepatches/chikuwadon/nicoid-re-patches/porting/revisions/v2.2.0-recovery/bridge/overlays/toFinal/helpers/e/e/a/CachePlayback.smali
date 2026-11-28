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

    new-instance v8, Le/e/a/CachePlayback$1;

    invoke-direct {v8}, Le/e/a/CachePlayback$1;-><init>()V

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
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 18
    invoke-static {p1}, Le/e/a/CachePlayback;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    return-void
.end method

.method public static fromFile(Ljava/io/File;)Landroid/net/Uri;
    .registers 2

    .line 17
    invoke-static {p0}, Le/e/a/CacheFolders;->virtual(Ljava/io/File;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Le/e/a/CachePlayback;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_0
    invoke-static {p0}, Landroid/net/Uri;->fromFile(Ljava/io/File;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$0(Ljava/lang/Runnable;)Ljava/lang/Thread;
    .registers 3

    .line 15
    new-instance v0, Ljava/lang/Thread;

    const-string v1, "nicoid-cache-reader"

    invoke-direct {v0, p0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0}, Ljava/lang/Thread;->setDaemon(Z)V

    return-object v0
.end method

.method static synthetic lambda$1()V
    .registers 3

    .line 28
    :goto_0
    sget-object v0, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v0

    if-nez v0, :cond_0

    :try_start_0
    sget-object v0, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v0}, Ljava/net/ServerSocket;->accept()Ljava/net/Socket;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    :try_start_1
    sget-object v1, Le/e/a/CachePlayback;->workers:Ljava/util/concurrent/ExecutorService;

    new-instance v2, Le/e/a/CachePlayback$2;

    invoke-direct {v2, v0}, Le/e/a/CachePlayback$2;-><init>(Ljava/net/Socket;)V

    invoke-interface {v1, v2}, Ljava/util/concurrent/ExecutorService;->execute(Ljava/lang/Runnable;)V
    :try_end_1
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_1 .. :try_end_1} :catch_0
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1

    goto :goto_0

    :catch_0
    :try_start_2
    invoke-virtual {v0}, Ljava/net/Socket;->close()V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1

    goto :goto_0

    :catch_1
    :cond_0
    return-void
.end method

.method static synthetic lambda$2(Ljava/net/Socket;)V
    .registers 1

    .line 28
    invoke-static {p0}, Le/e/a/CachePlayback;->serve(Ljava/net/Socket;)V

    return-void
.end method

.method private static line(Ljava/io/BufferedReader;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const/4 v1, 0x0

    .line 48
    :cond_0
    :goto_0
    invoke-virtual {p0}, Ljava/io/BufferedReader;->read()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_1

    const/4 p0, 0x0

    return-object p0

    :cond_1
    const/16 v3, 0xa

    if-ne v2, v3, :cond_2

    .line 49
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_2
    add-int/lit8 v1, v1, 0x1

    const/16 v3, 0x1000

    if-gt v1, v3, :cond_3

    const/16 v3, 0xd

    if-eq v2, v3, :cond_0

    int-to-char v2, v2

    .line 51
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 50
    :cond_3
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Oversized cache request header"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static ownsLoopback(Landroid/net/Uri;)Z
    .registers 6

    const/4 v0, 0x0

    const-string v1, "127.0.0.1"

    invoke-virtual {p0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    sget-object v1, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/net/ServerSocket;->isClosed()Z

    move-result v2

    if-nez v2, :cond_0

    invoke-virtual {v1}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v1

    invoke-virtual {p0}, Landroid/net/Uri;->getPort()I

    move-result v2

    if-ne v1, v2, :cond_0

    invoke-virtual {p0}, Landroid/net/Uri;->getPathSegments()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    const/4 v3, 0x3

    if-ne v2, v3, :cond_0

    sget-object v2, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    const/4 v2, 0x1

    invoke-interface {v1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    sget-object v2, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    invoke-interface {v2, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    :cond_0
    return v0
.end method

.method public static parse(Ljava/lang/String;)Landroid/net/Uri;
    .registers 1

    .line 16
    invoke-static {p0}, Le/e/a/CachePlayback;->url(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p0

    return-object p0
.end method

.method private static reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/16 v0, 0xc8

    const/16 v1, 0x1a0

    if-ne p1, v0, :cond_0

    .line 56
    const-string v0, "OK"

    goto :goto_0

    :cond_0
    const/16 v0, 0xce

    if-ne p1, v0, :cond_1

    const-string v0, "Partial Content"

    goto :goto_0

    :cond_1
    if-ne p1, v1, :cond_2

    const-string v0, "Range Not Satisfiable"

    goto :goto_0

    :cond_2
    const/16 v0, 0x195

    if-ne p1, v0, :cond_3

    const-string v0, "Method Not Allowed"

    goto :goto_0

    :cond_3
    const-string v0, "Not Found"

    .line 57
    :goto_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "HTTP/1.1 "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v3, " "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, "\r\nContent-Type: "

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p8, "\r\nContent-Length: "

    invoke-virtual {v2, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p8, "\r\nAccept-Ranges: bytes\r\nConnection: close\r\n"

    invoke-virtual {v2, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p8

    .line 58
    const-string v0, "\r\n"

    if-eqz p9, :cond_4

    new-instance p9, Ljava/lang/StringBuilder;

    invoke-static {p8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p8

    invoke-direct {p9, p8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p8, "Content-Range: bytes "

    invoke-virtual {p9, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p9, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p8, "-"

    invoke-virtual {p9, p8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-long/2addr p2, p4

    const-wide/16 p4, 0x1

    sub-long/2addr p2, p4

    invoke-virtual {p9, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p2, "/"

    invoke-virtual {p9, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p9, p6, p7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p9, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p8

    :cond_4
    if-ne p1, v1, :cond_5

    .line 59
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {p8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string p2, "Content-Range: bytes */"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p6, p7}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p8

    .line 60
    :cond_5
    invoke-virtual {p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object p0

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-static {p8}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method private static serve(Ljava/net/Socket;)V
    .registers 24

    move-object/from16 v1, p0

    .line 31
    const-string v0, "/"

    const/16 v2, 0x3a98

    :try_start_0
    invoke-virtual {v1, v2}, Ljava/net/Socket;->setSoTimeout(I)V

    new-instance v2, Ljava/io/BufferedReader;

    new-instance v3, Ljava/io/InputStreamReader;

    invoke-virtual {v1}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v3, v4, v5}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 32
    invoke-static {v2}, Le/e/a/CachePlayback;->line(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_0

    if-eqz v1, :cond_1b

    goto :goto_0

    :cond_0
    const-string v4, " "

    invoke-virtual {v3, v4}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    const/4 v5, 0x3

    if-eq v4, v5, :cond_1

    if-eqz v1, :cond_1b

    .line 43
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Ljava/net/Socket;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    return-void

    :cond_1
    const/4 v12, 0x0

    .line 32
    :try_start_2
    aget-object v4, v3, v12

    const-string v6, "HEAD"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_2

    aget-object v4, v3, v12

    const-string v6, "GET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_2

    const-string v9, "text/plain"

    const/4 v10, 0x0

    const/16 v2, 0x195

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V

    if-eqz p0, :cond_1b

    goto/16 :goto_b

    :cond_2
    const/4 v1, 0x0

    const/4 v4, 0x0

    .line 33
    :goto_1
    invoke-static {v2}, Le/e/a/CachePlayback;->line(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v6

    if-eqz v6, :cond_1a

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v7

    const/4 v8, 0x6

    const/4 v9, 0x1

    if-eqz v7, :cond_17

    .line 35
    aget-object v1, v3, v9

    const/4 v14, -0x1

    invoke-virtual {v1, v0, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x4

    const/4 v6, 0x2

    if-ne v2, v3, :cond_3

    aget-object v2, v1, v5

    const-string v5, "\\?"

    invoke-virtual {v2, v5, v6}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v12

    invoke-static {v2}, Landroid/net/Uri;->decode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    goto :goto_2

    :cond_3
    const-string v2, ""

    .line 36
    :goto_2
    array-length v5, v1

    if-ne v5, v3, :cond_4

    aget-object v3, v1, v9

    sget-object v5, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4

    sget-object v3, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    aget-object v1, v1, v6

    invoke-interface {v3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    goto :goto_3

    :cond_4
    const/4 v1, 0x0

    :goto_3
    if-eqz v1, :cond_16

    .line 37
    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_16

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    const-string v0, "\\"

    invoke-virtual {v2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_16

    const-string v0, ".."

    invoke-virtual {v2, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_16

    .line 38
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-nez v1, :cond_5

    const-string v9, "text/plain"

    const/4 v10, 0x0

    const/16 v2, 0x194

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V

    if-eqz p0, :cond_1b

    goto/16 :goto_b

    .line 39
    :cond_5
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    const-wide/16 v17, 0x1

    const/4 v7, 0x1

    sub-long v9, v15, v17

    const/16 v1, 0xce

    const/16 v19, 0x0

    const-wide/16 v11, 0x0

    if-eqz v4, :cond_c

    .line 40
    :try_start_3
    const-string v3, "bytes="

    invoke-virtual {v4, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_b

    const-string v3, ","

    invoke-virtual {v4, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v3

    if-nez v3, :cond_b

    invoke-virtual {v4, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    const-string v4, "-"

    invoke-virtual {v3, v4, v14}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    array-length v4, v3

    if-ne v4, v6, :cond_a

    aget-object v4, v3, v19

    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_7

    aget-object v3, v3, v7

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3

    cmp-long v5, v3, v11

    if-lez v5, :cond_6

    sub-long v3, v15, v3

    invoke-static {v11, v12, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    goto :goto_4

    :cond_6
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_7
    aget-object v4, v3, v19

    invoke-static {v4}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v4

    aget-object v6, v3, v7

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_8

    aget-object v3, v3, v7

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    invoke-static {v9, v10, v7, v8}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v9

    :cond_8
    move-wide v3, v4

    :goto_4
    cmp-long v5, v3, v11

    if-ltz v5, :cond_9

    cmp-long v5, v3, v15

    if-gez v5, :cond_9

    cmp-long v5, v9, v3

    if-ltz v5, :cond_9

    move-object v5, v2

    move-wide v7, v15

    const/16 v2, 0xce

    goto :goto_5

    :cond_9
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_a
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0

    :cond_b
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-direct {v0}, Ljava/lang/IllegalArgumentException;-><init>()V

    throw v0
    :try_end_3
    .catch Ljava/lang/RuntimeException; {:try_start_3 .. :try_end_3} :catch_0
    .catchall {:try_start_3 .. :try_end_3} :catchall_4

    :catch_0
    :try_start_4
    const-string v9, "text/plain"

    const/4 v10, 0x0

    const/16 v2, 0x1a0

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    move-object/from16 v1, p0

    move-wide v7, v15

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    if-eqz p0, :cond_1b

    .line 43
    :try_start_5
    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto/16 :goto_c

    :cond_c
    move-wide v7, v15

    move-object v5, v2

    move-wide v3, v11

    const/16 v2, 0xc8

    :goto_5
    sub-long/2addr v9, v3

    add-long v9, v9, v17

    .line 41
    :try_start_6
    invoke-static {v11, v12, v9, v10}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v9

    invoke-static {v5}, Le/e/a/CacheFolders;->mime(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    move-wide/from16 v21, v9

    if-ne v2, v1, :cond_d

    const/4 v10, 0x1

    goto :goto_6

    :cond_d
    const/4 v10, 0x0

    :goto_6
    move-object v9, v5

    move-wide/from16 v5, v21

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    if-eqz v13, :cond_e

    if-eqz p0, :cond_1b

    goto/16 :goto_b

    .line 42
    :cond_e
    :try_start_7
    new-instance v1, Le/e/a/CacheInputStream;

    invoke-direct {v1, v0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    :goto_7
    cmp-long v0, v3, v11

    if-gtz v0, :cond_11

    const/high16 v0, 0x10000

    :try_start_8
    new-array v0, v0, [B

    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v2

    move-wide v9, v5

    :goto_8
    cmp-long v3, v9, v11

    if-gtz v3, :cond_f

    invoke-virtual {v2}, Ljava/io/OutputStream;->flush()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    :try_start_9
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    if-eqz p0, :cond_1b

    goto/16 :goto_b

    :cond_f
    const-wide/32 v3, 0x10000

    :try_start_a
    invoke-static {v9, v10, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v4, v3

    const/4 v7, 0x0

    invoke-virtual {v1, v0, v7, v4}, Ljava/io/InputStream;->read([BII)I

    move-result v3

    if-ltz v3, :cond_10

    invoke-virtual {v2, v0, v7, v3}, Ljava/io/OutputStream;->write([BII)V

    int-to-long v3, v3

    sub-long/2addr v9, v3

    goto :goto_8

    :cond_10
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0

    :cond_11
    invoke-virtual {v1, v3, v4}, Ljava/io/InputStream;->skip(J)J

    move-result-wide v8

    cmp-long v0, v8, v11

    if-gtz v0, :cond_13

    invoke-virtual {v1}, Ljava/io/InputStream;->read()I

    move-result v0

    if-eq v0, v14, :cond_12

    move-wide/from16 v8, v17

    goto :goto_9

    :cond_12
    new-instance v0, Ljava/io/EOFException;

    invoke-direct {v0}, Ljava/io/EOFException;-><init>()V

    throw v0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    :cond_13
    :goto_9
    sub-long/2addr v3, v8

    goto :goto_7

    :catchall_0
    move-exception v0

    move-object v11, v0

    :try_start_b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    throw v11
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :catchall_1
    move-exception v0

    goto :goto_a

    :catchall_2
    move-exception v0

    const/4 v11, 0x0

    :goto_a
    if-eqz v11, :cond_15

    if-eq v11, v0, :cond_14

    :try_start_c
    invoke-virtual {v11, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_14
    move-object v0, v11

    :cond_15
    throw v0

    .line 37
    :cond_16
    const-string v9, "text/plain"

    const/4 v10, 0x0

    const/16 v2, 0x194

    const-wide/16 v3, 0x0

    const-wide/16 v5, 0x0

    const-wide/16 v7, 0x0

    move-object/from16 v1, p0

    invoke-static/range {v1 .. v10}, Le/e/a/CachePlayback;->reply(Ljava/net/Socket;IJJJLjava/lang/String;Z)V

    if-eqz p0, :cond_1b

    goto :goto_b

    :cond_17
    const/16 v20, 0x1

    add-int/lit8 v1, v1, 0x1

    const/16 v9, 0x40

    if-le v1, v9, :cond_18

    if-eqz p0, :cond_1b

    goto :goto_b

    .line 33
    :cond_18
    sget-object v9, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v6, v9}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v9

    const-string v10, "range:"

    invoke-virtual {v9, v10}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_19

    invoke-virtual {v6, v8}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :cond_19
    const/4 v12, 0x0

    goto/16 :goto_1

    :cond_1a
    if-eqz p0, :cond_1b

    .line 43
    :goto_b
    :try_start_d
    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->close()V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    return-void

    :catchall_3
    move-exception v0

    const/4 v11, 0x0

    goto :goto_d

    :cond_1b
    :goto_c
    return-void

    :catchall_4
    move-exception v0

    move-object v11, v0

    if-eqz p0, :cond_1c

    :try_start_e
    invoke-virtual/range {p0 .. p0}, Ljava/net/Socket;->close()V

    :cond_1c
    throw v11
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    :catchall_5
    move-exception v0

    :goto_d
    if-eqz v11, :cond_1e

    if-eq v11, v0, :cond_1d

    :try_start_f
    invoke-virtual {v11, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1d
    move-object v0, v11

    :cond_1e
    throw v0
    :try_end_f
    .catch Ljava/io/IOException; {:try_start_f .. :try_end_f} :catch_1
    .catch Ljava/lang/RuntimeException; {:try_start_f .. :try_end_f} :catch_1

    :catch_1
    move-exception v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v2

    const-string v1, "Cached playback request failed: "

    invoke-virtual {v1, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v0, "nicoid-cache"

    invoke-static {v0, v1}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;)I

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
    :try_start_0
    sget-object v1, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_0

    monitor-exit v0

    return-void

    :cond_0
    :try_start_1
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

    new-instance v2, Le/e/a/CachePlayback$0;

    invoke-direct {v2}, Le/e/a/CachePlayback$0;-><init>()V

    const-string v3, "nicoid-cache-server"

    invoke-direct {v1, v2, v3}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/lang/Thread;->setDaemon(Z)V

    invoke-virtual {v1}, Ljava/lang/Thread;->start()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    monitor-exit v0

    return-void

    :goto_0
    :try_start_2
    monitor-exit v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0
.end method

.method public static url(Ljava/lang/String;)Ljava/lang/String;
    .registers 5

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 20
    :cond_0
    invoke-static {p0}, Le/e/a/PlaybackUrls;->directHls(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "file://"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-static {p0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->getPath()Ljava/lang/String;

    move-result-object v0

    goto :goto_0

    :cond_1
    move-object v0, p0

    :goto_0
    if-eqz v0, :cond_3

    .line 21
    const-string v1, "/@nicoid-cache/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    const-string v2, "/"

    if-nez v1, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_3

    const-string v1, "/nicoid/nicoid_cache/"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-eqz v1, :cond_3

    .line 22
    :cond_2
    new-instance p0, Le/e/a/CacheFile;

    invoke-direct {p0, v0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v1

    invoke-static {v1}, Ljava/util/UUID;->nameUUIDFromBytes([B)Ljava/util/UUID;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/UUID;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v3, Le/e/a/CachePlayback;->roots:Ljava/util/Map;

    invoke-interface {v3, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 23
    :try_start_0
    invoke-static {}, Le/e/a/CachePlayback;->start()V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "http://127.0.0.1:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Le/e/a/CachePlayback;->server:Ljava/net/ServerSocket;

    invoke-virtual {v3}, Ljava/net/ServerSocket;->getLocalPort()I

    move-result v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object v3, Le/e/a/CachePlayback;->TOKEN:Ljava/lang/String;

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 24
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Cannot open cache player"

    invoke-direct {v0, v1, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :cond_3
    return-object p0
.end method
