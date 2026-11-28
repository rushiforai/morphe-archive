.class public final Le/e/a/CacheHls;
.super Ljava/lang/Object;
.source "CacheHls.java"


# instance fields
.field private final cookie:Ljava/lang/String;

.field private final created:Ljava/util/ArrayList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayList<",
            "Ljava/io/File;",
            ">;"
        }
    .end annotation
.end field

.field private final directory:Ljava/io/File;

.field private mediaBytes:J

.field private number:I

.field private final prefix:Ljava/lang/String;


# direct methods
.method private constructor <init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    .line 17
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 13
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    .line 18
    iput-object p1, p0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, "_asset_"

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Le/e/a/CacheHls;->prefix:Ljava/lang/String;

    .line 20
    iput-object p3, p0, Le/e/a/CacheHls;->cookie:Ljava/lang/String;

    .line 21
    return-void
.end method

.method private binary(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;)V
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 117
    invoke-direct {p0, p1, p3}, Le/e/a/CacheHls;->connect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object p3

    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getContentLength()I

    move-result v5

    invoke-static {v5}, Le/e/a/CacheProgress;->asset(I)V

    .line 118
    new-instance v0, Le/e/a/CacheFile;

    iget-object v1, p0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, ".partial"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 119
    iget-object v1, p0, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 120
    :try_start_0
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    :try_start_1
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Le/e/a/CacheOutputStream;

    invoke-direct {v3, v0}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 121
    const v3, 0x8000

    :try_start_2
    new-array v3, v3, [B

    .line 123
    :goto_0
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_0

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/OutputStream;->write([BII)V

    invoke-static {v4}, Le/e/a/CacheProgress;->bytes(I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    .line 124
    :cond_0
    :try_start_3
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    if-eqz v1, :cond_1

    :try_start_4
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 125
    :cond_1
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 126
    nop

    .line 127
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p3, v1, v3

    if-eqz p3, :cond_2

    invoke-virtual {v0, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_2

    .line 128
    iget-object p1, p0, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 129
    iget-wide v0, p0, Le/e/a/CacheHls;->mediaBytes:J

    invoke-virtual {p2}, Ljava/io/File;->length()J

    move-result-wide p1

    add-long/2addr v0, p1

    iput-wide v0, p0, Le/e/a/CacheHls;->mediaBytes:J

    .line 130
    invoke-static {}, Le/e/a/CacheProgress;->assetDone()V

    return-void

    .line 127
    :cond_2
    new-instance p2, Ljava/io/IOException;

    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v0, "Empty or failed segment "

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 120
    :catchall_0
    move-exception p1

    :try_start_5
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p2

    :try_start_6
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :catchall_2
    move-exception p1

    if-eqz v1, :cond_3

    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    goto :goto_2

    :catchall_3
    move-exception p2

    :try_start_8
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_3
    :goto_2
    throw p1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_4

    .line 125
    :catchall_4
    move-exception p1

    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 126
    throw p1
.end method

.method private connect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .registers 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 6
    iget-object p0, p0, Le/e/a/CacheHls;->cookie:Ljava/lang/String;

    .line 7
    if-eqz p2, :cond_1

    const-string v0, "[0-9]+-[0-9]*"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid byte range"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 8
    :cond_1
    :goto_0
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    const/4 v2, 0x5

    if-gt v1, v2, :cond_b

    .line 9
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_a

    .line 10
    invoke-static {p1}, Le/e/a/SecurityPolicy240;->secure(Ljava/net/URL;)Z

    move-result v3

    if-eqz v3, :cond_9

    .line 11
    invoke-static {p1}, Lnicoid/network238/StreamConnection256;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 12
    nop

    .line 14
    :try_start_0
    invoke-static {v3}, Le/e/a/CacheControl110;->connection(Ljava/net/HttpURLConnection;)V

    .line 15
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 16
    const/16 v4, 0x2ee0

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v4, 0x4e20

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 17
    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    const-string v4, "Referer"

    const-string v5, "https://www.nicovideo.jp/"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    const-string v4, "Origin"

    const-string v5, "https://www.nicovideo.jp"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, p0, v5}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 21
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_2

    const-string v5, "Cookie"

    invoke-virtual {v3, v5, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    :cond_2
    if-eqz p2, :cond_3

    const-string v4, "Range"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "bytes="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 23
    :cond_3
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 24
    const/16 v5, 0x12d

    if-eq v4, v5, :cond_7

    const/16 v5, 0x12e

    if-eq v4, v5, :cond_7

    const/16 v5, 0x12f

    if-eq v4, v5, :cond_7

    const/16 v5, 0x133

    if-eq v4, v5, :cond_7

    const/16 v5, 0x134

    if-ne v4, v5, :cond_4

    goto :goto_2

    .line 29
    :cond_4
    const/16 p0, 0xc8

    if-lt v4, p0, :cond_6

    const/16 p0, 0x12c

    if-ge v4, p0, :cond_6

    if-eqz p2, :cond_5

    const/16 p0, 0xce

    if-ne v4, p0, :cond_6

    .line 31
    :cond_5
    nop

    .line 32
    return-object v3

    .line 30
    :cond_6
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Media HTTP "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 25
    :cond_7
    :goto_2
    const-string v4, "Location"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 26
    if-eqz v4, :cond_8

    if-eq v1, v2, :cond_8

    .line 27
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p1, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 27
    nop

    .line 8
    add-int/lit8 v1, v1, 0x1

    move-object p1, v2

    goto/16 :goto_1

    .line 26
    :cond_8
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid media redirect"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    :catchall_0
    move-exception p0

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    .line 10
    :cond_9
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid secure media destination"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 9
    :cond_a
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    .line 34
    :cond_b
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Too many media redirects"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .registers 10

    .line 24
    new-instance v0, Le/e/a/CacheHls;

    new-instance v1, Le/e/a/CacheFile;

    invoke-direct {v1, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    invoke-direct {v0, v1, p2, p3}, Le/e/a/CacheHls;-><init>(Ljava/io/File;Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    new-instance p1, Le/e/a/CacheFile;

    iget-object p3, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".m3u8"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p1, p3, v1}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 26
    new-instance p3, Le/e/a/CacheFile;

    iget-object v1, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v2, ".mp4"

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p3, v1, p2}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 27
    iget-object v1, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    move-result-object v1

    const-string v2, ".mp4"

    const-string v4, ""

    invoke-virtual {p2, v2, v4}, Ljava/lang/String;->replace(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2}, Le/e/a/CachedPlayback;->completedBytes(Ljava/lang/String;Ljava/lang/String;)J

    move-result-wide v1

    const-wide/16 v4, 0x0

    cmp-long v4, v1, v4

    if-lez v4, :cond_0

    return-wide v1

    :cond_0
    invoke-static {p0, v0}, Le/e/a/CacheProgress;->prepare(Ljava/lang/String;Ljava/lang/Object;)V

    .line 28
    :try_start_0
    iget-object p2, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-nez p2, :cond_2

    iget-object p2, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result p2

    if-eqz p2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string p2, "cache directory"

    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 29
    :cond_2
    :goto_0
    new-instance p2, Ljava/net/URL;

    invoke-direct {p2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-direct {v0, p2, p1, p0}, Le/e/a/CacheHls;->playlist(Ljava/net/URL;Ljava/io/File;I)V

    invoke-static {}, Le/e/a/CacheControl110;->check()V

    .line 30
    iget-wide v1, v0, Le/e/a/CacheHls;->mediaBytes:J

    const-wide/32 v3, 0x10000

    cmp-long p0, v1, v3

    if-ltz p0, :cond_3

    .line 31
    new-instance p0, Le/e/a/CacheOutputStream;

    invoke-direct {p0, p3}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 32
    :try_start_1
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HLS cache: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v1, v0, Le/e/a/CacheHls;->mediaBytes:J

    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string v1, " bytes\n"

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p0, p2}, Ljava/io/FileOutputStream;->write([B)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 33
    :try_start_2
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 34
    iget-wide p0, v0, Le/e/a/CacheHls;->mediaBytes:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    return-wide p0

    .line 31
    :catchall_0
    move-exception p2

    :try_start_3
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    goto :goto_1

    :catchall_1
    move-exception p0

    :try_start_4
    invoke-virtual {p2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_1
    throw p2

    .line 30
    :cond_3
    new-instance p0, Ljava/io/IOException;

    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v1, "HLS contains no media: "

    invoke-virtual {p2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    iget-wide v1, v0, Le/e/a/CacheHls;->mediaBytes:J

    invoke-virtual {p2, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 37
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 38
    iget-object p1, v0, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_4

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    goto :goto_2

    .line 39
    :cond_4
    invoke-virtual {p0}, Ljava/lang/Exception;->printStackTrace()V

    .line 40
    const-wide/16 p0, -0x2

    return-wide p0
.end method

.method public static durationMillis(Ljava/lang/String;)J
    .registers 3

    .line 70
    :try_start_0
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-static {v0, p0}, Le/e/a/CacheHls;->parseDuration(Ljava/io/File;I)J

    move-result-wide v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    return-wide v0

    .line 71
    :catch_0
    move-exception p0

    const-wide/16 v0, 0x0

    return-wide v0
.end method

.method private nextName(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Le/e/a/CacheHls;->prefix:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget v1, p0, Le/e/a/CacheHls;->number:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Le/e/a/CacheHls;->number:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method private static parseDuration(Ljava/io/File;I)J
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 75
    move/from16 v0, p1

    const/4 v1, 0x4

    if-gt v0, v1, :cond_7

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_7

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v4, ".m3u8"

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    const-wide/16 v16, 0x0

    goto/16 :goto_5

    .line 76
    :cond_0
    nop

    .line 77
    nop

    .line 78
    nop

    .line 79
    :try_start_0
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    new-instance v5, Le/e/a/CacheInputStream;

    move-object/from16 v6, p0

    invoke-direct {v5, v6}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_1

    const-wide/16 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v9, v4

    const/4 v11, 0x0

    .line 81
    :cond_1
    :goto_0
    :try_start_1
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    if-eqz v12, :cond_4

    .line 82
    const-string v14, "#EXTINF:"

    invoke-virtual {v12, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_2

    .line 83
    const/16 v14, 0x8

    invoke-virtual {v12, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, ","
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    const-wide/16 v16, 0x0

    const/4 v2, 0x2

    :try_start_2
    invoke-virtual {v14, v15, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v7

    .line 84
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    add-double/2addr v9, v2

    goto :goto_1

    .line 82
    :cond_2
    const-wide/16 v16, 0x0

    .line 86
    :goto_1
    const-string v2, "#EXT-X-STREAM-INF:"

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    const/4 v11, 0x1

    goto :goto_0

    .line 87
    :cond_3
    if-eqz v11, :cond_1

    const-string v2, "#"

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    const/4 v11, 0x0

    goto :goto_0

    .line 79
    :catchall_0
    move-exception v0

    goto :goto_2

    .line 89
    :cond_4
    const-wide/16 v16, 0x0

    :try_start_3
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_3
    .catch Ljava/lang/NumberFormatException; {:try_start_3 .. :try_end_3} :catch_0

    .line 90
    cmpl-double v1, v9, v4

    if-lez v1, :cond_5

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double v9, v9, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    return-wide v0

    .line 91
    :cond_5
    if-eqz v8, :cond_6

    const-string v1, "/"

    invoke-virtual {v8, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    const-string v1, ".."

    invoke-virtual {v8, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_6

    .line 92
    new-instance v1, Le/e/a/CacheFile;

    invoke-virtual {v6}, Ljava/io/File;->getParentFile()Ljava/io/File;

    move-result-object v2

    invoke-direct {v1, v2, v8}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    add-int/2addr v0, v13

    invoke-static {v1, v0}, Le/e/a/CacheHls;->parseDuration(Ljava/io/File;I)J

    move-result-wide v0

    return-wide v0

    .line 93
    :cond_6
    return-wide v16

    .line 89
    :catch_0
    move-exception v0

    goto :goto_4

    .line 79
    :catchall_1
    move-exception v0

    const-wide/16 v16, 0x0

    :goto_2
    move-object v2, v0

    :try_start_4
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    goto :goto_3

    :catchall_2
    move-exception v0

    :try_start_5
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_3
    throw v2
    :try_end_5
    .catch Ljava/lang/NumberFormatException; {:try_start_5 .. :try_end_5} :catch_0

    .line 89
    :catch_1
    move-exception v0

    const-wide/16 v16, 0x0

    :goto_4
    return-wide v16

    .line 75
    :cond_7
    const-wide/16 v16, 0x0

    :goto_5
    return-wide v16
.end method

.method private playlist(Ljava/net/URL;Ljava/io/File;I)V
    .registers 23
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 161
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v0, p2

    move/from16 v5, p3

    const/4 v3, 0x4

    if-gt v5, v3, :cond_10

    .line 162
    const/4 v7, 0x0

    invoke-direct {v1, v2, v7}, Le/e/a/CacheHls;->connect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v3

    .line 163
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 164
    :try_start_0
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v6, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 166
    :goto_0
    :try_start_1
    invoke-static {}, Le/e/a/CacheControl110;->check()V

    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_0

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    goto :goto_0

    .line 167
    :cond_0
    :try_start_2
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_4

    .line 168
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 169
    nop

    .line 170
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_f

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v6, "#EXTM3U"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_f

    .line 171
    new-instance v9, Ljava/lang/StringBuilder;

    invoke-direct {v9}, Ljava/lang/StringBuilder;-><init>()V

    .line 172
    nop

    .line 173
    nop

    .line 174
    invoke-virtual {v4}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v10

    move-object v3, v7

    const/4 v11, 0x0

    const/4 v12, 0x0

    :goto_1
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_d

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 175
    const-string v6, "#EXT-X-STREAM-INF:"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xa

    const/4 v14, 0x1

    if-eqz v6, :cond_2

    .line 176
    nop

    .line 177
    if-nez v11, :cond_1

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    :cond_1
    const/4 v12, 0x1

    goto :goto_1

    .line 180
    :cond_2
    const-string v6, "#EXT-X-BYTERANGE:"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_3

    .line 181
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 182
    goto :goto_1

    .line 184
    :cond_3
    const-string v6, "#"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_5

    .line 185
    const-string v6, "URI=\""

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_4

    invoke-direct {v1, v2, v4, v5}, Le/e/a/CacheHls;->replaceUri(Ljava/net/URL;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    :cond_4
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    goto :goto_1

    .line 188
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_6

    goto :goto_1

    .line 189
    :cond_6
    if-eqz v12, :cond_7

    if-eqz v11, :cond_7

    const/4 v12, 0x0

    goto :goto_1

    .line 190
    :cond_7
    nop

    .line 191
    if-eqz v3, :cond_9

    .line 192
    const-string v6, "@"

    const/4 v15, 0x2

    invoke-virtual {v3, v6, v15}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 193
    array-length v6, v3

    if-ne v6, v15, :cond_8

    .line 194
    aget-object v6, v3, v14

    const/16 v16, 0x0

    invoke-static {v6}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v7

    .line 195
    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v14, "-"

    invoke-virtual {v6, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    aget-object v3, v3, v16

    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v17

    add-long v7, v7, v17

    const-wide/16 v17, 0x1

    sub-long v7, v7, v17

    invoke-virtual {v6, v7, v8}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 196
    move-object v6, v3

    const/4 v7, 0x0

    goto :goto_2

    .line 193
    :cond_8
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Implicit byte range unsupported"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_9
    const/16 v16, 0x0

    move-object v7, v3

    const/4 v6, 0x0

    .line 198
    :goto_2
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    if-nez v12, :cond_b

    const-string v8, ".m3u8"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_a

    goto :goto_3

    :cond_a
    const/4 v4, 0x0

    goto :goto_4

    :cond_b
    :goto_3
    const/4 v4, 0x1

    :goto_4
    invoke-direct/range {v1 .. v6}, Le/e/a/CacheHls;->resource(Ljava/net/URL;Ljava/lang/String;ZILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 199
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    if-eqz v12, :cond_c

    const/4 v11, 0x1

    .line 201
    :cond_c
    nop

    .line 202
    move-object/from16 v2, p1

    move/from16 v5, p3

    move-object v3, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x0

    goto/16 :goto_1

    .line 203
    :cond_d
    new-instance v2, Le/e/a/CacheFile;

    iget-object v3, v1, Le/e/a/CacheHls;->directory:Ljava/io/File;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, ".partial"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 204
    iget-object v3, v1, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 205
    new-instance v3, Le/e/a/CacheOutputStream;

    invoke-direct {v3, v2}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V

    .line 206
    :try_start_3
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 207
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 208
    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_e

    .line 209
    iget-object v2, v1, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    return-void

    .line 208
    :cond_e
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Failed writing playlist"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :catchall_0
    move-exception v0

    move-object v2, v0

    :try_start_4
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    goto :goto_5

    :catchall_1
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5
    throw v2

    .line 170
    :cond_f
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Not an HLS playlist"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :catchall_2
    move-exception v0

    move-object v2, v0

    :try_start_5
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    goto :goto_6

    :catchall_3
    move-exception v0

    :try_start_6
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_6
    throw v2
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 168
    :catchall_4
    move-exception v0

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 169
    throw v0

    .line 161
    :cond_10
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Nested HLS playlists"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readComments(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-static {p0, p1}, Le/e/a/CacheComments;->read(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method private replaceUri(Ljava/net/URL;Ljava/lang/String;I)Ljava/lang/String;
    .registers 13
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 149
    const-string v0, "URI=\""

    invoke-virtual {p2, v0}, Ljava/lang/String;->indexOf(Ljava/lang/String;)I

    move-result v0

    .line 150
    if-gez v0, :cond_0

    return-object p2

    .line 151
    :cond_0
    add-int/lit8 v0, v0, 0x5

    .line 152
    const/16 v1, 0x22

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 153
    if-ltz v1, :cond_3

    .line 154
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 155
    const-string v2, "#EXT-X-MEDIA:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v8, 0x0

    if-nez v2, :cond_2

    const-string v2, ".m3u8"

    invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    const/4 v5, 0x0

    goto :goto_1

    :cond_2
    :goto_0
    const/4 v2, 0x1

    const/4 v5, 0x1

    .line 156
    :goto_1
    const/4 v7, 0x0

    move-object v2, p0

    move-object v3, p1

    move v6, p3

    invoke-direct/range {v2 .. v7}, Le/e/a/CacheHls;->resource(Ljava/net/URL;Ljava/lang/String;ZILjava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 157
    new-instance p3, Ljava/lang/StringBuilder;

    invoke-direct {p3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p2, v8, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p3

    invoke-virtual {p3, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p2, v1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 153
    :cond_3
    new-instance p1, Ljava/io/IOException;

    const-string p2, "Malformed HLS URI"

    invoke-direct {p1, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private resource(Ljava/net/URL;Ljava/lang/String;ZILjava/lang/String;)Ljava/lang/String;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 133
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, p1, p2}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .line 134
    invoke-virtual {v0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p1

    .line 135
    nop

    .line 136
    const/16 p2, 0x2e

    invoke-virtual {p1, p2}, Ljava/lang/String;->lastIndexOf(I)I

    move-result p2

    .line 137
    if-ltz p2, :cond_0

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, p2

    const/4 v2, 0x7

    if-gt v1, v2, :cond_0

    .line 138
    invoke-virtual {p1, p2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    sget-object p2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p1, p2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p1

    .line 139
    const-string p2, "\\.(m4s|mp4|ts|aac|vtt|m3u8)"

    invoke-virtual {p1, p2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_0

    .line 141
    :cond_0
    const-string p1, ".bin"

    :goto_0
    if-eqz p3, :cond_1

    const-string p1, ".m3u8"

    :cond_1
    invoke-direct {p0, p1}, Le/e/a/CacheHls;->nextName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 142
    new-instance p2, Le/e/a/CacheFile;

    iget-object v1, p0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-direct {p2, v1, p1}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    if-eqz p3, :cond_2

    add-int/lit8 p4, p4, 0x1

    invoke-direct {p0, v0, p2, p4}, Le/e/a/CacheHls;->playlist(Ljava/net/URL;Ljava/io/File;I)V

    goto :goto_1

    .line 144
    :cond_2
    invoke-direct {p0, v0, p2, p5}, Le/e/a/CacheHls;->binary(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;)V

    .line 145
    :goto_1
    return-object p1
.end method

.method public static saveComments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 3

    invoke-static {p0, p1, p2}, Le/e/a/CacheComments;->save(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method
