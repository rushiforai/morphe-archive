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
    :try_start_27
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_2b
    .catchall {:try_start_27 .. :try_end_2b} :catchall_a0

    :try_start_2b
    new-instance v2, Ljava/io/BufferedOutputStream;

    new-instance v3, Le/e/a/CacheOutputStream;

    invoke-direct {v3, v0}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V

    invoke-direct {v2, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_35
    .catchall {:try_start_2b .. :try_end_35} :catchall_94

    .line 121
    const v3, 0x8000

    :try_start_38
    new-array v3, v3, [B

    .line 123
    :goto_3a
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_46

    const/4 v5, 0x0

    invoke-virtual {v2, v3, v5, v4}, Ljava/io/OutputStream;->write([BII)V
    :try_end_45
    .catchall {:try_start_38 .. :try_end_45} :catchall_8a

    goto :goto_3a

    .line 124
    :cond_46
    :try_start_46
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_49
    .catchall {:try_start_46 .. :try_end_49} :catchall_94

    if-eqz v1, :cond_4e

    :try_start_4b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_4e
    .catchall {:try_start_4b .. :try_end_4e} :catchall_a0

    .line 125
    :cond_4e
    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 126
    nop

    .line 127
    invoke-virtual {v0}, Ljava/io/File;->length()J

    move-result-wide v1

    const-wide/16 v3, 0x0

    cmp-long p3, v1, v3

    if-eqz p3, :cond_71

    invoke-virtual {v0, p2}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p3

    if-eqz p3, :cond_71

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
    return-void

    .line 127
    :cond_71
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
    :catchall_8a
    move-exception p1

    :try_start_8b
    invoke-virtual {v2}, Ljava/io/OutputStream;->close()V
    :try_end_8e
    .catchall {:try_start_8b .. :try_end_8e} :catchall_8f

    goto :goto_93

    :catchall_8f
    move-exception p2

    :try_start_90
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_93
    throw p1
    :try_end_94
    .catchall {:try_start_90 .. :try_end_94} :catchall_94

    :catchall_94
    move-exception p1

    if-eqz v1, :cond_9f

    :try_start_97
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9a
    .catchall {:try_start_97 .. :try_end_9a} :catchall_9b

    goto :goto_9f

    :catchall_9b
    move-exception p2

    :try_start_9c
    invoke-virtual {p1, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_9f
    :goto_9f
    throw p1
    :try_end_a0
    .catchall {:try_start_9c .. :try_end_a0} :catchall_a0

    .line 125
    :catchall_a0
    move-exception p1

    invoke-virtual {p3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 126
    throw p1
.end method

.method private connect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 97
    invoke-virtual {p1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    .line 98
    const/16 v1, 0x2ee0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    .line 99
    const/16 v1, 0x4e20

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 100
    const-string v1, "User-Agent"

    const-string v2, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    const-string v1, "Referer"

    const-string v2, "https://www.nicovideo.jp/"

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 102
    iget-object v1, p0, Le/e/a/CacheHls;->cookie:Ljava/lang/String;

    if-eqz v1, :cond_31

    iget-object v1, p0, Le/e/a/CacheHls;->cookie:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_31

    const-string v1, "Cookie"

    iget-object v2, p0, Le/e/a/CacheHls;->cookie:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    :cond_31
    if-eqz p2, :cond_4b

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "bytes="

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v2, "Range"

    invoke-virtual {v0, v2, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 104
    :cond_4b
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v1

    .line 105
    const/16 v2, 0xc8

    if-lt v1, v2, :cond_5e

    const/16 v2, 0x12c

    if-ge v1, v2, :cond_5e

    if-eqz p2, :cond_5d

    const/16 p2, 0xce

    if-ne v1, p2, :cond_5e

    .line 109
    :cond_5d
    return-object v0

    .line 106
    :cond_5e
    invoke-virtual {v0}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 107
    new-instance p2, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "HTTP "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " for "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public static download(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)J
    .registers 9

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

    .line 28
    :try_start_3e
    iget-object p2, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->isDirectory()Z

    move-result p2

    if-nez p2, :cond_57

    iget-object p2, v0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->mkdirs()Z

    move-result p2

    if-eqz p2, :cond_4f

    goto :goto_57

    :cond_4f
    new-instance p0, Ljava/io/IOException;

    const-string p2, "cache directory"

    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 29
    :cond_57
    :goto_57
    new-instance p2, Ljava/net/URL;

    invoke-direct {p2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    const/4 p0, 0x0

    invoke-direct {v0, p2, p1, p0}, Le/e/a/CacheHls;->playlist(Ljava/net/URL;Ljava/io/File;I)V

    .line 30
    iget-wide v1, v0, Le/e/a/CacheHls;->mediaBytes:J

    const-wide/32 v3, 0x10000

    cmp-long p0, v1, v3

    if-ltz p0, :cond_a2

    .line 31
    new-instance p0, Le/e/a/CacheOutputStream;

    invoke-direct {p0, p3}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_6e
    .catch Ljava/lang/Exception; {:try_start_3e .. :try_end_6e} :catch_bd

    .line 32
    :try_start_6e
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
    :try_end_92
    .catchall {:try_start_6e .. :try_end_92} :catchall_98

    .line 33
    :try_start_92
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V

    .line 34
    iget-wide p0, v0, Le/e/a/CacheHls;->mediaBytes:J
    :try_end_97
    .catch Ljava/lang/Exception; {:try_start_92 .. :try_end_97} :catch_bd

    return-wide p0

    .line 31
    :catchall_98
    move-exception p2

    :try_start_99
    invoke-virtual {p0}, Ljava/io/FileOutputStream;->close()V
    :try_end_9c
    .catchall {:try_start_99 .. :try_end_9c} :catchall_9d

    goto :goto_a1

    :catchall_9d
    move-exception p0

    :try_start_9e
    invoke-virtual {p2, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_a1
    throw p2

    .line 30
    :cond_a2
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
    :try_end_bd
    .catch Ljava/lang/Exception; {:try_start_9e .. :try_end_bd} :catch_bd

    .line 35
    :catch_bd
    move-exception p0

    .line 36
    invoke-virtual {p1}, Ljava/io/File;->delete()Z

    .line 37
    invoke-virtual {p3}, Ljava/io/File;->delete()Z

    .line 38
    iget-object p1, v0, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_ca
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_da

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/io/File;

    invoke-virtual {p2}, Ljava/io/File;->delete()Z

    goto :goto_ca

    .line 39
    :cond_da
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
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_a} :catch_b

    return-wide v0

    .line 71
    :catch_b
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

    if-gt v0, v1, :cond_c5

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->isFile()Z

    move-result v1

    if-eqz v1, :cond_c5

    invoke-virtual/range {p0 .. p0}, Ljava/io/File;->getName()Ljava/lang/String;

    move-result-object v1

    const-string v4, ".m3u8"

    invoke-virtual {v1, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1b

    const-wide/16 v16, 0x0

    goto/16 :goto_c7

    .line 76
    :cond_1b
    nop

    .line 77
    nop

    .line 78
    nop

    .line 79
    :try_start_1e
    new-instance v1, Ljava/io/BufferedReader;

    new-instance v4, Ljava/io/InputStreamReader;

    new-instance v5, Le/e/a/CacheInputStream;

    move-object/from16 v6, p0

    invoke-direct {v5, v6}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V

    sget-object v7, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v4, v5, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v1, v4}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_31
    .catch Ljava/lang/NumberFormatException; {:try_start_1e .. :try_end_31} :catch_c1

    const-wide/16 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-wide v9, v4

    const/4 v11, 0x0

    .line 81
    :cond_37
    :goto_37
    :try_start_37
    invoke-virtual {v1}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v12

    const/4 v13, 0x1

    if-eqz v12, :cond_7b

    .line 82
    const-string v14, "#EXTINF:"

    invoke-virtual {v12, v14}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v14

    if-eqz v14, :cond_5d

    .line 83
    const/16 v14, 0x8

    invoke-virtual {v12, v14}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v14

    const-string v15, ","
    :try_end_4e
    .catchall {:try_start_37 .. :try_end_4e} :catchall_b4

    const-wide/16 v16, 0x0

    const/4 v2, 0x2

    :try_start_51
    invoke-virtual {v14, v15, v2}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v2

    aget-object v2, v2, v7

    .line 84
    invoke-static {v2}, Ljava/lang/Double;->parseDouble(Ljava/lang/String;)D

    move-result-wide v2

    add-double/2addr v9, v2

    goto :goto_5f

    .line 82
    :cond_5d
    const-wide/16 v16, 0x0

    .line 86
    :goto_5f
    const-string v2, "#EXT-X-STREAM-INF:"

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_69

    const/4 v11, 0x1

    goto :goto_37

    .line 87
    :cond_69
    if-eqz v11, :cond_37

    const-string v2, "#"

    invoke-virtual {v12, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_37

    invoke-virtual {v12}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v8
    :try_end_77
    .catchall {:try_start_51 .. :try_end_77} :catchall_79

    const/4 v11, 0x0

    goto :goto_37

    .line 79
    :catchall_79
    move-exception v0

    goto :goto_b7

    .line 89
    :cond_7b
    const-wide/16 v16, 0x0

    :try_start_7d
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_80
    .catch Ljava/lang/NumberFormatException; {:try_start_7d .. :try_end_80} :catch_b2

    .line 90
    cmpl-double v1, v9, v4

    if-lez v1, :cond_90

    const-wide v0, 0x408f400000000000L    # 1000.0

    mul-double v9, v9, v0

    invoke-static {v9, v10}, Ljava/lang/Math;->round(D)J

    move-result-wide v0

    return-wide v0

    .line 91
    :cond_90
    if-eqz v8, :cond_b1

    const-string v1, "/"

    invoke-virtual {v8, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b1

    const-string v1, ".."

    invoke-virtual {v8, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    if-nez v1, :cond_b1

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
    :cond_b1
    return-wide v16

    .line 89
    :catch_b2
    move-exception v0

    goto :goto_c4

    .line 79
    :catchall_b4
    move-exception v0

    const-wide/16 v16, 0x0

    :goto_b7
    move-object v2, v0

    :try_start_b8
    invoke-virtual {v1}, Ljava/io/BufferedReader;->close()V
    :try_end_bb
    .catchall {:try_start_b8 .. :try_end_bb} :catchall_bc

    goto :goto_c0

    :catchall_bc
    move-exception v0

    :try_start_bd
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_c0
    throw v2
    :try_end_c1
    .catch Ljava/lang/NumberFormatException; {:try_start_bd .. :try_end_c1} :catch_b2

    .line 89
    :catch_c1
    move-exception v0

    const-wide/16 v16, 0x0

    :goto_c4
    return-wide v16

    .line 75
    :cond_c5
    const-wide/16 v16, 0x0

    :goto_c7
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

    if-gt v5, v3, :cond_19b

    .line 162
    const/4 v7, 0x0

    invoke-direct {v1, v2, v7}, Le/e/a/CacheHls;->connect(Ljava/net/URL;Ljava/lang/String;)Ljava/net/HttpURLConnection;

    move-result-object v3

    .line 163
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 164
    :try_start_15
    new-instance v6, Ljava/io/BufferedReader;

    new-instance v8, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v9

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v8, v9, v10}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v6, v8}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_25
    .catchall {:try_start_15 .. :try_end_25} :catchall_196

    .line 166
    :goto_25
    :try_start_25
    invoke-virtual {v6}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    move-result-object v8

    if-eqz v8, :cond_2f

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_2e
    .catchall {:try_start_25 .. :try_end_2e} :catchall_18b

    goto :goto_25

    .line 167
    :cond_2f
    :try_start_2f
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_32
    .catchall {:try_start_2f .. :try_end_32} :catchall_196

    .line 168
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 169
    nop

    .line 170
    invoke-virtual {v4}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_183

    const/4 v8, 0x0

    invoke-virtual {v4, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    const-string v6, "#EXTM3U"

    invoke-virtual {v3, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_183

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

    :goto_59
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_12c

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    .line 175
    const-string v6, "#EXT-X-STREAM-INF:"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    const/16 v13, 0xa

    const/4 v14, 0x1

    if-eqz v6, :cond_7c

    .line 176
    nop

    .line 177
    if-nez v11, :cond_7a

    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 174
    :cond_7a
    const/4 v12, 0x1

    goto :goto_59

    .line 180
    :cond_7c
    const-string v6, "#EXT-X-BYTERANGE:"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v15

    if-eqz v15, :cond_8d

    .line 181
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v3

    invoke-virtual {v4, v3}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v3

    .line 182
    goto :goto_59

    .line 184
    :cond_8d
    const-string v6, "#"

    invoke-virtual {v4, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_a9

    .line 185
    const-string v6, "URI=\""

    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6

    if-eqz v6, :cond_a1

    invoke-direct {v1, v2, v4, v5}, Le/e/a/CacheHls;->replaceUri(Ljava/net/URL;Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v4

    :cond_a1
    invoke-virtual {v9, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    goto :goto_59

    .line 188
    :cond_a9
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->isEmpty()Z

    move-result v6

    if-eqz v6, :cond_b4

    goto :goto_59

    .line 189
    :cond_b4
    if-eqz v12, :cond_ba

    if-eqz v11, :cond_ba

    const/4 v12, 0x0

    goto :goto_59

    .line 190
    :cond_ba
    nop

    .line 191
    if-eqz v3, :cond_fd

    .line 192
    const-string v6, "@"

    const/4 v15, 0x2

    invoke-virtual {v3, v6, v15}, Ljava/lang/String;->split(Ljava/lang/String;I)[Ljava/lang/String;

    move-result-object v3

    .line 193
    array-length v6, v3

    if-ne v6, v15, :cond_f5

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

    goto :goto_101

    .line 193
    :cond_f5
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Implicit byte range unsupported"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 191
    :cond_fd
    const/16 v16, 0x0

    move-object v7, v3

    const/4 v6, 0x0

    .line 198
    :goto_101
    invoke-virtual {v4}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    if-nez v12, :cond_112

    const-string v8, ".m3u8"

    invoke-virtual {v4, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v4

    if-eqz v4, :cond_110

    goto :goto_112

    :cond_110
    const/4 v4, 0x0

    goto :goto_113

    :cond_112
    :goto_112
    const/4 v4, 0x1

    :goto_113
    invoke-direct/range {v1 .. v6}, Le/e/a/CacheHls;->resource(Ljava/net/URL;Ljava/lang/String;ZILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 199
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v13}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 200
    if-eqz v12, :cond_121

    const/4 v11, 0x1

    .line 201
    :cond_121
    nop

    .line 202
    move-object/from16 v2, p1

    move/from16 v5, p3

    move-object v3, v7

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v12, 0x0

    goto/16 :goto_59

    .line 203
    :cond_12c
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
    :try_start_154
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/io/OutputStream;->write([B)V
    :try_end_161
    .catchall {:try_start_154 .. :try_end_161} :catchall_178

    .line 207
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    .line 208
    invoke-virtual {v2, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result v2

    if-eqz v2, :cond_170

    .line 209
    iget-object v2, v1, Le/e/a/CacheHls;->created:Ljava/util/ArrayList;

    invoke-virtual {v2, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 210
    return-void

    .line 208
    :cond_170
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Failed writing playlist"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 205
    :catchall_178
    move-exception v0

    move-object v2, v0

    :try_start_17a
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V
    :try_end_17d
    .catchall {:try_start_17a .. :try_end_17d} :catchall_17e

    goto :goto_182

    :catchall_17e
    move-exception v0

    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_182
    throw v2

    .line 170
    :cond_183
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Not an HLS playlist"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 164
    :catchall_18b
    move-exception v0

    move-object v2, v0

    :try_start_18d
    invoke-virtual {v6}, Ljava/io/BufferedReader;->close()V
    :try_end_190
    .catchall {:try_start_18d .. :try_end_190} :catchall_191

    goto :goto_195

    :catchall_191
    move-exception v0

    :try_start_192
    invoke-virtual {v2, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_195
    throw v2
    :try_end_196
    .catchall {:try_start_192 .. :try_end_196} :catchall_196

    .line 168
    :catchall_196
    move-exception v0

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 169
    throw v0

    .line 161
    :cond_19b
    new-instance v0, Ljava/io/IOException;

    const-string v2, "Nested HLS playlists"

    invoke-direct {v0, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static readComments(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 6

    .line 60
    new-instance v0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v1, ".comments.json"

    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p0, p1}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 61
    invoke-virtual {v0}, Ljava/io/File;->isFile()Z

    move-result p0

    const/4 p1, 0x0

    if-nez p0, :cond_20

    return-object p1

    .line 62
    :cond_20
    :try_start_20
    new-instance p0, Le/e/a/CacheInputStream;

    invoke-direct {p0, v0}, Le/e/a/CacheInputStream;-><init>(Ljava/io/File;)V
    :try_end_25
    .catch Ljava/io/IOException; {:try_start_20 .. :try_end_25} :catch_60

    :try_start_25
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_2a
    .catchall {:try_start_25 .. :try_end_2a} :catchall_56

    .line 63
    const/16 v1, 0x2000

    :try_start_2c
    new-array v1, v1, [B

    .line 64
    :goto_2e
    invoke-virtual {p0, v1}, Ljava/io/InputStream;->read([B)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_3a

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v3, v2}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_2e

    .line 65
    :cond_3a
    new-instance v1, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v2

    sget-object v3, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v1, v2, v3}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_45
    .catchall {:try_start_2c .. :try_end_45} :catchall_4c

    .line 66
    :try_start_45
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_48
    .catchall {:try_start_45 .. :try_end_48} :catchall_56

    :try_start_48
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_4b
    .catch Ljava/io/IOException; {:try_start_48 .. :try_end_4b} :catch_60

    .line 65
    return-object v1

    .line 62
    :catchall_4c
    move-exception v1

    :try_start_4d
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_50
    .catchall {:try_start_4d .. :try_end_50} :catchall_51

    goto :goto_55

    :catchall_51
    move-exception v0

    :try_start_52
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_55
    throw v1
    :try_end_56
    .catchall {:try_start_52 .. :try_end_56} :catchall_56

    :catchall_56
    move-exception v0

    :try_start_57
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_5a
    .catchall {:try_start_57 .. :try_end_5a} :catchall_5b

    goto :goto_5f

    :catchall_5b
    move-exception p0

    :try_start_5c
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_5f
    throw v0
    :try_end_60
    .catch Ljava/io/IOException; {:try_start_5c .. :try_end_60} :catch_60

    .line 66
    :catch_60
    move-exception p0

    return-object p1
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
    if-gez v0, :cond_9

    return-object p2

    .line 151
    :cond_9
    add-int/lit8 v0, v0, 0x5

    .line 152
    const/16 v1, 0x22

    invoke-virtual {p2, v1, v0}, Ljava/lang/String;->indexOf(II)I

    move-result v1

    .line 153
    if-ltz v1, :cond_53

    .line 154
    invoke-virtual {p2, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v4

    .line 155
    const-string v2, "#EXT-X-MEDIA:"

    invoke-virtual {p2, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v2

    const/4 v8, 0x0

    if-nez v2, :cond_2b

    const-string v2, ".m3u8"

    invoke-virtual {v4, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-eqz v2, :cond_29

    goto :goto_2b

    :cond_29
    const/4 v5, 0x0

    goto :goto_2d

    :cond_2b
    :goto_2b
    const/4 v2, 0x1

    const/4 v5, 0x1

    .line 156
    :goto_2d
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
    :cond_53
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
    if-ltz p2, :cond_2d

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    sub-int/2addr v1, p2

    const/4 v2, 0x7

    if-gt v1, v2, :cond_2d

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

    if-eqz p2, :cond_2d

    goto :goto_2f

    .line 141
    :cond_2d
    const-string p1, ".bin"

    :goto_2f
    if-eqz p3, :cond_33

    const-string p1, ".m3u8"

    :cond_33
    invoke-direct {p0, p1}, Le/e/a/CacheHls;->nextName(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    .line 142
    new-instance p2, Le/e/a/CacheFile;

    iget-object v1, p0, Le/e/a/CacheHls;->directory:Ljava/io/File;

    invoke-direct {p2, v1, p1}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 143
    if-eqz p3, :cond_46

    add-int/lit8 p4, p4, 0x1

    invoke-direct {p0, v0, p2, p4}, Le/e/a/CacheHls;->playlist(Ljava/net/URL;Ljava/io/File;I)V

    goto :goto_49

    .line 144
    :cond_46
    invoke-direct {p0, v0, p2, p5}, Le/e/a/CacheHls;->binary(Ljava/net/URL;Ljava/io/File;Ljava/lang/String;)V

    .line 145
    :goto_49
    return-object p1
.end method

.method public static saveComments(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .registers 6

    .line 45
    if-eqz p2, :cond_7f

    const-string v0, "\"threads\""

    invoke-virtual {p2, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_b

    goto :goto_7f

    .line 46
    :cond_b
    new-instance v0, Le/e/a/CacheFile;

    invoke-direct {v0, p0}, Le/e/a/CacheFile;-><init>(Ljava/lang/String;)V

    .line 47
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    move-result p0

    if-nez p0, :cond_1d

    invoke-virtual {v0}, Ljava/io/File;->mkdirs()Z

    move-result p0

    if-nez p0, :cond_1d

    return-void

    .line 48
    :cond_1d
    new-instance p0, Le/e/a/CacheFile;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, ".comments.json"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 49
    new-instance v1, Le/e/a/CacheFile;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v2, ".comments.partial"

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, v0, p1}, Le/e/a/CacheFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 50
    :try_start_4d
    new-instance p1, Le/e/a/CacheOutputStream;

    invoke-direct {p1, v1}, Le/e/a/CacheOutputStream;-><init>(Ljava/io/File;)V
    :try_end_52
    .catch Ljava/io/IOException; {:try_start_4d .. :try_end_52} :catch_77

    .line 51
    :try_start_52
    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/OutputStream;->write([B)V

    .line 52
    invoke-virtual {v1, p0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    move-result p0
    :try_end_5f
    .catchall {:try_start_52 .. :try_end_5f} :catchall_6d

    if-eqz p0, :cond_65

    .line 53
    :try_start_61
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_64
    .catch Ljava/io/IOException; {:try_start_61 .. :try_end_64} :catch_77

    .line 56
    goto :goto_7e

    .line 52
    :cond_65
    :try_start_65
    new-instance p0, Ljava/io/IOException;

    const-string p2, "comment rename failed"

    invoke-direct {p0, p2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_6d
    .catchall {:try_start_65 .. :try_end_6d} :catchall_6d

    .line 50
    :catchall_6d
    move-exception p0

    :try_start_6e
    invoke-virtual {p1}, Ljava/io/OutputStream;->close()V
    :try_end_71
    .catchall {:try_start_6e .. :try_end_71} :catchall_72

    goto :goto_76

    :catchall_72
    move-exception p1

    :try_start_73
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :goto_76
    throw p0
    :try_end_77
    .catch Ljava/io/IOException; {:try_start_73 .. :try_end_77} :catch_77

    .line 53
    :catch_77
    move-exception p0

    .line 54
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 55
    invoke-virtual {p0}, Ljava/io/IOException;->printStackTrace()V

    .line 57
    :goto_7e
    return-void

    .line 45
    :cond_7f
    :goto_7f
    return-void
.end method
