.class public final Le/e/a/PageCache;
.super Ljava/lang/Object;
.source "PageCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/PageCache$Entry;,
        Le/e/a/PageCache$Flight;
    }
.end annotation


# static fields
.field private static final MARKER:[B

.field static final TTL_NANOS:J = 0x6fc23ac00L

.field private static bytes:I

.field private static final flights:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/PageCache$Flight;",
            ">;"
        }
    .end annotation
.end field

.field private static generation:J

.field private static final pages:Ljava/util/LinkedHashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/LinkedHashMap<",
            "Ljava/lang/String;",
            "Le/e/a/PageCache$Entry;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 17
    new-instance v0, Ljava/util/LinkedHashMap;

    const/high16 v1, 0x3f400000    # 0.75f

    const/4 v2, 0x1

    const/16 v3, 0x10

    invoke-direct {v0, v3, v1, v2}, Ljava/util/LinkedHashMap;-><init>(IFZ)V

    sput-object v0, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    .line 20
    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Le/e/a/PageCache;->flights:Ljava/util/Map;

    .line 21
    const-string v0, "<meta name=\"server-response\" content=\""

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v0, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v0

    sput-object v0, Le/e/a/PageCache;->MARKER:[B

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private static await(Le/e/a/PageCache$Flight;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .registers 14
    .param p0, "flight"    # Le/e/a/PageCache$Flight;
    .param p1, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 91
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getConnectTimeout()I

    move-result v0

    int-to-long v0, v0

    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->getReadTimeout()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    const-wide/16 v2, 0x4e20

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    .line 92
    .local v0, "timeout":J
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    add-long/2addr v2, v4

    .line 93
    .local v2, "deadline":J
    const-class v4, Le/e/a/PageCache;

    monitor-enter v4

    .line 94
    :goto_1f
    :try_start_1f
    iget-boolean v5, p0, Le/e/a/PageCache$Flight;->done:Z

    if-nez v5, :cond_72

    .line 95
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v5

    if-nez v5, :cond_6a

    .line 96
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v5
    :try_end_31
    .catchall {:try_start_1f .. :try_end_31} :catchall_82

    sub-long v5, v2, v5

    .line 97
    .local v5, "remaining":J
    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-lez v9, :cond_62

    .line 98
    :try_start_39
    const-class v7, Le/e/a/PageCache;

    sget-object v8, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v8, v5, v6}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v8

    const-wide/16 v10, 0xfa

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v8

    const-wide/16 v10, 0x1

    invoke-static {v10, v11, v8, v9}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v8

    invoke-virtual {v7, v8, v9}, Ljava/lang/Object;->wait(J)V
    :try_end_50
    .catch Ljava/lang/InterruptedException; {:try_start_39 .. :try_end_50} :catch_52
    .catchall {:try_start_39 .. :try_end_50} :catchall_82

    .line 99
    nop

    .line 100
    .end local v5    # "remaining":J
    goto :goto_1f

    .line 99
    .restart local v5    # "remaining":J
    :catch_52
    move-exception v7

    .local v7, "interrupted":Ljava/lang/InterruptedException;
    :try_start_53
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v8

    invoke-virtual {v8}, Ljava/lang/Thread;->interrupt()V

    new-instance v8, Ljava/io/InterruptedIOException;

    const-string v9, "List page wait cancelled"

    invoke-direct {v8, v9}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "timeout":J
    .end local v2    # "deadline":J
    .end local p0    # "flight":Le/e/a/PageCache$Flight;
    .end local p1    # "connection":Ljava/net/HttpURLConnection;
    throw v8

    .line 97
    .end local v7    # "interrupted":Ljava/lang/InterruptedException;
    .restart local v0    # "timeout":J
    .restart local v2    # "deadline":J
    .restart local p0    # "flight":Le/e/a/PageCache$Flight;
    .restart local p1    # "connection":Ljava/net/HttpURLConnection;
    :cond_62
    new-instance v7, Ljava/net/SocketTimeoutException;

    const-string v8, "List page wait timed out"

    invoke-direct {v7, v8}, Ljava/net/SocketTimeoutException;-><init>(Ljava/lang/String;)V

    .end local v0    # "timeout":J
    .end local v2    # "deadline":J
    .end local p0    # "flight":Le/e/a/PageCache$Flight;
    .end local p1    # "connection":Ljava/net/HttpURLConnection;
    throw v7

    .line 95
    .end local v5    # "remaining":J
    .restart local v0    # "timeout":J
    .restart local v2    # "deadline":J
    .restart local p0    # "flight":Le/e/a/PageCache$Flight;
    .restart local p1    # "connection":Ljava/net/HttpURLConnection;
    :cond_6a
    new-instance v5, Ljava/io/InterruptedIOException;

    const-string v6, "List page wait cancelled"

    invoke-direct {v5, v6}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "timeout":J
    .end local v2    # "deadline":J
    .end local p0    # "flight":Le/e/a/PageCache$Flight;
    .end local p1    # "connection":Ljava/net/HttpURLConnection;
    throw v5

    .line 101
    .restart local v0    # "timeout":J
    .restart local v2    # "deadline":J
    .restart local p0    # "flight":Le/e/a/PageCache$Flight;
    .restart local p1    # "connection":Ljava/net/HttpURLConnection;
    :cond_72
    iget-object v5, p0, Le/e/a/PageCache$Flight;->error:Ljava/io/IOException;

    if-nez v5, :cond_7f

    .line 102
    new-instance v5, Ljava/io/ByteArrayInputStream;

    iget-object v6, p0, Le/e/a/PageCache$Flight;->data:[B

    invoke-direct {v5, v6}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    monitor-exit v4

    return-object v5

    .line 101
    :cond_7f
    iget-object v5, p0, Le/e/a/PageCache$Flight;->error:Ljava/io/IOException;

    .end local v0    # "timeout":J
    .end local v2    # "deadline":J
    .end local p0    # "flight":Le/e/a/PageCache$Flight;
    .end local p1    # "connection":Ljava/net/HttpURLConnection;
    throw v5

    .line 103
    .restart local v0    # "timeout":J
    .restart local v2    # "deadline":J
    .restart local p0    # "flight":Le/e/a/PageCache$Flight;
    .restart local p1    # "connection":Ljava/net/HttpURLConnection;
    :catchall_82
    move-exception v5

    monitor-exit v4
    :try_end_84
    .catchall {:try_start_53 .. :try_end_84} :catchall_82

    throw v5
.end method

.method private static containsMarker([B)Z
    .registers 5
    .param p0, "data"    # [B

    .line 106
    const/4 v0, 0x0

    .local v0, "i":I
    :goto_1
    array-length v1, p0

    sget-object v2, Le/e/a/PageCache;->MARKER:[B

    array-length v2, v2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    if-gt v0, v1, :cond_2a

    .line 107
    aget-byte v1, p0, v0

    sget-object v3, Le/e/a/PageCache;->MARKER:[B

    aget-byte v2, v3, v2

    if-eq v1, v2, :cond_12

    goto :goto_22

    .line 108
    :cond_12
    const/4 v1, 0x1

    .local v1, "n":I
    :goto_13
    sget-object v2, Le/e/a/PageCache;->MARKER:[B

    array-length v2, v2

    if-ge v1, v2, :cond_28

    add-int v2, v0, v1

    aget-byte v2, p0, v2

    sget-object v3, Le/e/a/PageCache;->MARKER:[B

    aget-byte v3, v3, v1

    if-eq v2, v3, :cond_25

    .line 106
    .end local v1    # "n":I
    :goto_22
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    .line 108
    .restart local v1    # "n":I
    :cond_25
    add-int/lit8 v1, v1, 0x1

    goto :goto_13

    .line 109
    .end local v1    # "n":I
    :cond_28
    const/4 v1, 0x1

    return v1

    .line 111
    .end local v0    # "i":I
    :cond_2a
    return v2
.end method

.method private static fetch(Ljava/net/HttpURLConnection;)[B
    .registers 9
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 114
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v0

    .line 116
    .local v0, "started":J
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v2

    .local v2, "input":Ljava/io/InputStream;
    :try_start_8
    new-instance v3, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v3}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_d
    .catchall {:try_start_8 .. :try_end_d} :catchall_76

    .line 117
    .local v3, "body":Ljava/io/ByteArrayOutputStream;
    const/16 v4, 0x2000

    :try_start_f
    new-array v4, v4, [B

    .line 118
    .local v4, "buffer":[B
    :goto_11
    invoke-virtual {v2, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5

    move v6, v5

    .local v6, "n":I
    const/4 v7, -0x1

    if-eq v5, v7, :cond_2f

    .line 119
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v6

    const/high16 v7, 0x800000

    if-gt v5, v7, :cond_27

    .line 120
    const/4 v5, 0x0

    invoke-virtual {v3, v4, v5, v6}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_11

    .line 119
    :cond_27
    new-instance v5, Ljava/io/IOException;

    const-string v7, "Oversized list page"

    invoke-direct {v5, v7}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v0    # "started":J
    .end local v2    # "input":Ljava/io/InputStream;
    .end local v3    # "body":Ljava/io/ByteArrayOutputStream;
    .end local p0    # "connection":Ljava/net/HttpURLConnection;
    throw v5

    .line 122
    .end local v6    # "n":I
    .restart local v0    # "started":J
    .restart local v2    # "input":Ljava/io/InputStream;
    .restart local v3    # "body":Ljava/io/ByteArrayOutputStream;
    .restart local p0    # "connection":Ljava/net/HttpURLConnection;
    :cond_2f
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v5
    :try_end_33
    .catchall {:try_start_f .. :try_end_33} :catchall_6c

    .line 123
    .end local v4    # "buffer":[B
    .local v5, "data":[B
    :try_start_33
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_36
    .catchall {:try_start_33 .. :try_end_36} :catchall_76

    .end local v3    # "body":Ljava/io/ByteArrayOutputStream;
    if-eqz v2, :cond_3b

    invoke-virtual {v2}, Ljava/io/InputStream;->close()V

    .line 124
    .end local v2    # "input":Ljava/io/InputStream;
    :cond_3b
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "List page fetched in "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    sub-long/2addr v3, v0

    const-wide/32 v6, 0xf4240

    div-long/2addr v3, v6

    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " ms, "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    array-length v3, v5

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v3, " bytes"

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Le/e/a/PageCache;->record(Ljava/lang/String;)V

    .line 125
    return-object v5

    .line 116
    .end local v5    # "data":[B
    .restart local v2    # "input":Ljava/io/InputStream;
    .restart local v3    # "body":Ljava/io/ByteArrayOutputStream;
    :catchall_6c
    move-exception v4

    :try_start_6d
    invoke-virtual {v3}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_70
    .catchall {:try_start_6d .. :try_end_70} :catchall_71

    goto :goto_75

    :catchall_71
    move-exception v5

    :try_start_72
    invoke-virtual {v4, v5}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v0    # "started":J
    .end local v2    # "input":Ljava/io/InputStream;
    .end local p0    # "connection":Ljava/net/HttpURLConnection;
    :goto_75
    throw v4
    :try_end_76
    .catchall {:try_start_72 .. :try_end_76} :catchall_76

    .end local v3    # "body":Ljava/io/ByteArrayOutputStream;
    .restart local v0    # "started":J
    .restart local v2    # "input":Ljava/io/InputStream;
    .restart local p0    # "connection":Ljava/net/HttpURLConnection;
    :catchall_76
    move-exception v3

    if-eqz v2, :cond_81

    :try_start_79
    invoke-virtual {v2}, Ljava/io/InputStream;->close()V
    :try_end_7c
    .catchall {:try_start_79 .. :try_end_7c} :catchall_7d

    goto :goto_81

    :catchall_7d
    move-exception v4

    invoke-virtual {v3, v4}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_81
    :goto_81
    throw v3
.end method

.method public static input(Ljava/net/HttpURLConnection;)Ljava/io/InputStream;
    .registers 14
    .param p0, "connection"    # Ljava/net/HttpURLConnection;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 47
    invoke-static {p0}, Le/e/a/PageCache;->key(Ljava/net/HttpURLConnection;)Ljava/lang/String;

    move-result-object v1

    .local v1, "key":Ljava/lang/String;
    const/4 v2, 0x0

    .local v2, "flight":Le/e/a/PageCache$Flight;
    const/4 v3, 0x0

    .line 48
    .local v3, "leader":Z
    const-class v4, Le/e/a/PageCache;

    monitor-enter v4

    .line 49
    :try_start_9
    sget-wide v5, Le/e/a/PageCache;->generation:J

    .line 50
    .local v5, "epoch":J
    const/4 v7, 0x0

    if-nez v1, :cond_10

    move-object v0, v7

    goto :goto_18

    :cond_10
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    invoke-static {v1, v8, v9}, Le/e/a/PageCache;->lookup(Ljava/lang/String;J)[B

    move-result-object v0

    :goto_18
    move-object v8, v0

    .line 51
    .local v8, "cached":[B
    if-nez v8, :cond_4b

    if-eqz v1, :cond_4b

    .line 52
    sget-object v0, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v0, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le/e/a/PageCache$Flight;

    move-object v2, v0

    .line 53
    if-eqz v2, :cond_30

    iget-wide v9, v2, Le/e/a/PageCache$Flight;->epoch:J

    cmp-long v0, v9, v5

    if-eqz v0, :cond_30

    const/4 v0, 0x0

    move-object v2, v0

    .line 54
    :cond_30
    if-nez v2, :cond_4b

    sget-object v0, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v0

    const/16 v9, 0x20

    if-ge v0, v9, :cond_4b

    .line 55
    new-instance v0, Le/e/a/PageCache$Flight;

    invoke-direct {v0, v5, v6}, Le/e/a/PageCache$Flight;-><init>(J)V

    move-object v2, v0

    sget-object v0, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_47
    .catchall {:try_start_9 .. :try_end_47} :catchall_e9

    const/4 v0, 0x1

    move v10, v0

    move-object v9, v2

    .end local v3    # "leader":Z
    .local v0, "leader":Z
    goto :goto_4d

    .line 58
    .end local v0    # "leader":Z
    .restart local v3    # "leader":Z
    :cond_4b
    move-object v9, v2

    move v10, v3

    .end local v2    # "flight":Le/e/a/PageCache$Flight;
    .end local v3    # "leader":Z
    .local v9, "flight":Le/e/a/PageCache$Flight;
    .local v10, "leader":Z
    :goto_4d
    :try_start_4d
    monitor-exit v4
    :try_end_4e
    .catchall {:try_start_4d .. :try_end_4e} :catchall_e5

    .line 59
    if-eqz v8, :cond_5b

    const-string v0, "List page cache hit"

    invoke-static {v0}, Le/e/a/PageCache;->record(Ljava/lang/String;)V

    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v8}, Ljava/io/ByteArrayInputStream;-><init>([B)V

    return-object v0

    .line 60
    :cond_5b
    if-eqz v9, :cond_64

    if-nez v10, :cond_64

    invoke-static {v9, p0}, Le/e/a/PageCache;->await(Le/e/a/PageCache$Flight;Ljava/net/HttpURLConnection;)Ljava/io/InputStream;

    move-result-object v0

    return-object v0

    .line 61
    :cond_64
    const/4 v2, 0x0

    .local v2, "data":[B
    const/4 v11, 0x0

    .line 63
    .local v11, "error":Ljava/io/IOException;
    const/4 v12, 0x1

    :try_start_67
    invoke-static {p0}, Le/e/a/PageCache;->fetch(Ljava/net/HttpURLConnection;)[B

    move-result-object v0

    move-object v2, v0

    .line 64
    if-eqz v1, :cond_7b

    invoke-static {v2}, Le/e/a/PageCache;->containsMarker([B)Z

    move-result v0

    if-eqz v0, :cond_7b

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v3

    invoke-static/range {v1 .. v6}, Le/e/a/PageCache;->save(Ljava/lang/String;[BJJ)V

    .line 65
    :cond_7b
    new-instance v0, Ljava/io/ByteArrayInputStream;

    invoke-direct {v0, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_80
    .catch Ljava/io/IOException; {:try_start_67 .. :try_end_80} :catch_b2
    .catchall {:try_start_67 .. :try_end_80} :catchall_b0

    .line 68
    if-eqz v9, :cond_af

    const-class v3, Le/e/a/PageCache;

    monitor-enter v3

    .line 69
    :try_start_85
    iput-object v2, v9, Le/e/a/PageCache$Flight;->data:[B

    .line 70
    if-eqz v11, :cond_8b

    move-object v7, v11

    goto :goto_94

    :cond_8b
    if-nez v2, :cond_94

    new-instance v7, Ljava/io/IOException;

    const-string v4, "List page fetch failed"

    invoke-direct {v7, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_94
    :goto_94
    iput-object v7, v9, Le/e/a/PageCache$Flight;->error:Ljava/io/IOException;

    .line 71
    iput-boolean v12, v9, Le/e/a/PageCache$Flight;->done:Z

    .line 72
    sget-object v4, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v9, :cond_a5

    sget-object v4, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_a5
    const-class v4, Le/e/a/PageCache;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 74
    monitor-exit v3

    goto :goto_af

    :catchall_ac
    move-exception v0

    monitor-exit v3
    :try_end_ae
    .catchall {:try_start_85 .. :try_end_ae} :catchall_ac

    throw v0

    .line 65
    :cond_af
    :goto_af
    return-object v0

    .line 68
    :catchall_b0
    move-exception v0

    goto :goto_b5

    .line 66
    :catch_b2
    move-exception v0

    .local v0, "failure":Ljava/io/IOException;
    move-object v11, v0

    .end local v1    # "key":Ljava/lang/String;
    .end local v2    # "data":[B
    .end local v5    # "epoch":J
    .end local v8    # "cached":[B
    .end local v9    # "flight":Le/e/a/PageCache$Flight;
    .end local v10    # "leader":Z
    .end local v11    # "error":Ljava/io/IOException;
    .end local p0    # "connection":Ljava/net/HttpURLConnection;
    :try_start_b4
    throw v0
    :try_end_b5
    .catchall {:try_start_b4 .. :try_end_b5} :catchall_b0

    .line 68
    .end local v0    # "failure":Ljava/io/IOException;
    .restart local v1    # "key":Ljava/lang/String;
    .restart local v2    # "data":[B
    .restart local v5    # "epoch":J
    .restart local v8    # "cached":[B
    .restart local v9    # "flight":Le/e/a/PageCache$Flight;
    .restart local v10    # "leader":Z
    .restart local v11    # "error":Ljava/io/IOException;
    .restart local p0    # "connection":Ljava/net/HttpURLConnection;
    :goto_b5
    if-eqz v9, :cond_e4

    const-class v3, Le/e/a/PageCache;

    monitor-enter v3

    .line 69
    :try_start_ba
    iput-object v2, v9, Le/e/a/PageCache$Flight;->data:[B

    .line 70
    if-eqz v11, :cond_c0

    move-object v7, v11

    goto :goto_c9

    :cond_c0
    if-nez v2, :cond_c9

    new-instance v7, Ljava/io/IOException;

    const-string v4, "List page fetch failed"

    invoke-direct {v7, v4}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :cond_c9
    :goto_c9
    iput-object v7, v9, Le/e/a/PageCache$Flight;->error:Ljava/io/IOException;

    .line 71
    iput-boolean v12, v9, Le/e/a/PageCache$Flight;->done:Z

    .line 72
    sget-object v4, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    if-ne v4, v9, :cond_da

    sget-object v4, Le/e/a/PageCache;->flights:Ljava/util/Map;

    invoke-interface {v4, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    .line 73
    :cond_da
    const-class v4, Le/e/a/PageCache;

    invoke-virtual {v4}, Ljava/lang/Object;->notifyAll()V

    .line 74
    monitor-exit v3

    goto :goto_e4

    :catchall_e1
    move-exception v0

    monitor-exit v3
    :try_end_e3
    .catchall {:try_start_ba .. :try_end_e3} :catchall_e1

    throw v0

    .line 75
    :cond_e4
    :goto_e4
    throw v0

    .line 58
    .end local v2    # "data":[B
    .end local v5    # "epoch":J
    .end local v8    # "cached":[B
    .end local v11    # "error":Ljava/io/IOException;
    :catchall_e5
    move-exception v0

    move-object v2, v9

    move v3, v10

    goto :goto_ea

    .end local v9    # "flight":Le/e/a/PageCache$Flight;
    .end local v10    # "leader":Z
    .local v2, "flight":Le/e/a/PageCache$Flight;
    .restart local v3    # "leader":Z
    :catchall_e9
    move-exception v0

    :goto_ea
    :try_start_ea
    monitor-exit v4
    :try_end_eb
    .catchall {:try_start_ea .. :try_end_eb} :catchall_e9

    throw v0
.end method

.method private static key(Ljava/net/HttpURLConnection;)Ljava/lang/String;
    .registers 7
    .param p0, "connection"    # Ljava/net/HttpURLConnection;

    .line 81
    const/4 v0, 0x0

    :try_start_1
    const-string v1, "GET"

    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getRequestMethod()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_e

    return-object v0

    .line 82
    :cond_e
    new-instance v1, Ljava/util/TreeMap;

    sget-object v2, Ljava/lang/String;->CASE_INSENSITIVE_ORDER:Ljava/util/Comparator;

    invoke-direct {v1, v2}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    .line 83
    .local v1, "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getRequestProperties()Ljava/util/Map;

    move-result-object v2

    invoke-interface {v1, v2}, Ljava/util/Map;->putAll(Ljava/util/Map;)V

    .line 84
    invoke-virtual {p0}, Ljava/net/HttpURLConnection;->getURL()Ljava/net/URL;

    move-result-object v2

    invoke-virtual {v2}, Ljava/net/URL;->toExternalForm()Ljava/lang/String;

    move-result-object v2

    .line 85
    .local v2, "url":Ljava/lang/String;
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v3

    if-eqz v3, :cond_2b

    return-object v2

    .line 86
    :cond_2b
    const-string v3, "SHA-256"

    invoke-static {v3}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object v3

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    sget-object v5, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v4, v5}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/security/MessageDigest;->digest([B)[B

    move-result-object v3

    .line 87
    .local v3, "digest":[B
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    const-string v5, "\n"

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-static {v3}, Ljava/util/Arrays;->toString([B)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0
    :try_end_5a
    .catch Ljava/lang/IllegalStateException; {:try_start_1 .. :try_end_5a} :catch_5d
    .catch Ljava/security/NoSuchAlgorithmException; {:try_start_1 .. :try_end_5a} :catch_5b

    return-object v0

    .line 88
    .end local v1    # "headers":Ljava/util/Map;, "Ljava/util/Map<Ljava/lang/String;Ljava/util/List<Ljava/lang/String;>;>;"
    .end local v2    # "url":Ljava/lang/String;
    .end local v3    # "digest":[B
    :catch_5b
    move-exception v1

    goto :goto_5e

    :catch_5d
    move-exception v1

    .local v1, "error":Ljava/lang/Exception;
    :goto_5e
    return-object v0
.end method

.method static declared-synchronized lookup(Ljava/lang/String;J)[B
    .registers 11
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "now"    # J

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 32
    :try_start_3
    sget-object v1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v1, p0}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/PageCache$Entry;
    :try_end_b
    .catchall {:try_start_3 .. :try_end_b} :catchall_30

    .line 33
    .local v1, "entry":Le/e/a/PageCache$Entry;
    const/4 v2, 0x0

    if-nez v1, :cond_10

    monitor-exit v0

    return-object v2

    .line 34
    :cond_10
    :try_start_10
    iget-wide v3, v1, Le/e/a/PageCache$Entry;->at:J

    sub-long v3, p1, v3

    const-wide v5, 0x6fc23ac00L

    cmp-long v7, v3, v5

    if-ltz v7, :cond_2c

    sget-object v3, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, p0}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    sget v3, Le/e/a/PageCache;->bytes:I

    iget-object v4, v1, Le/e/a/PageCache$Entry;->data:[B

    array-length v4, v4

    sub-int/2addr v3, v4

    sput v3, Le/e/a/PageCache;->bytes:I
    :try_end_2a
    .catchall {:try_start_10 .. :try_end_2a} :catchall_30

    monitor-exit v0

    return-object v2

    .line 35
    :cond_2c
    :try_start_2c
    iget-object v2, v1, Le/e/a/PageCache$Entry;->data:[B
    :try_end_2e
    .catchall {:try_start_2c .. :try_end_2e} :catchall_30

    monitor-exit v0

    return-object v2

    .line 31
    .end local v1    # "entry":Le/e/a/PageCache$Entry;
    .end local p0    # "key":Ljava/lang/String;
    .end local p1    # "now":J
    :catchall_30
    move-exception p0

    :try_start_31
    monitor-exit v0
    :try_end_32
    .catchall {:try_start_31 .. :try_end_32} :catchall_30

    throw p0
.end method

.method private static record(Ljava/lang/String;)V
    .registers 7
    .param p0, "message"    # Ljava/lang/String;

    .line 128
    :try_start_0
    const-string v0, "e.e.a.ModernDebug"

    invoke-static {v0}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v0

    const-string v1, "record"

    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/lang/String;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    new-array v1, v2, [Ljava/lang/Object;

    aput-object p0, v1, v5

    const/4 v2, 0x0

    invoke-virtual {v0, v2, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_1c
    .catch Ljava/lang/ReflectiveOperationException; {:try_start_0 .. :try_end_1c} :catch_1d

    goto :goto_1e

    .line 129
    :catch_1d
    move-exception v0

    :goto_1e
    nop

    .line 130
    return-void
.end method

.method public static declared-synchronized refresh()V
    .registers 5

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 30
    :try_start_3
    sget-wide v1, Le/e/a/PageCache;->generation:J

    const-wide/16 v3, 0x1

    add-long/2addr v1, v3

    sput-wide v1, Le/e/a/PageCache;->generation:J

    sget-object v1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v1}, Ljava/util/LinkedHashMap;->clear()V

    const/4 v1, 0x0

    sput v1, Le/e/a/PageCache;->bytes:I
    :try_end_12
    .catchall {:try_start_3 .. :try_end_12} :catchall_14

    monitor-exit v0

    return-void

    .line 30
    :catchall_14
    move-exception v1

    :try_start_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_15 .. :try_end_16} :catchall_14

    throw v1
.end method

.method static declared-synchronized save(Ljava/lang/String;[BJJ)V
    .registers 11
    .param p0, "key"    # Ljava/lang/String;
    .param p1, "data"    # [B
    .param p2, "at"    # J
    .param p4, "epoch"    # J

    const-class v0, Le/e/a/PageCache;

    monitor-enter v0

    .line 38
    :try_start_3
    sget-wide v1, Le/e/a/PageCache;->generation:J

    cmp-long v3, p4, v1

    if-nez v3, :cond_68

    array-length v1, p1

    const/high16 v2, 0x200000

    if-le v1, v2, :cond_f

    goto :goto_68

    .line 39
    :cond_f
    sget-object v1, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    new-instance v2, Le/e/a/PageCache$Entry;

    invoke-direct {v2, p1, p2, p3}, Le/e/a/PageCache$Entry;-><init>([BJ)V

    invoke-virtual {v1, p0, v2}, Ljava/util/LinkedHashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Le/e/a/PageCache$Entry;

    .local v1, "old":Le/e/a/PageCache$Entry;
    if-eqz v1, :cond_26

    sget v2, Le/e/a/PageCache;->bytes:I

    iget-object v3, v1, Le/e/a/PageCache$Entry;->data:[B

    array-length v3, v3

    sub-int/2addr v2, v3

    sput v2, Le/e/a/PageCache;->bytes:I

    .line 40
    :cond_26
    sget v2, Le/e/a/PageCache;->bytes:I

    array-length v3, p1

    add-int/2addr v2, v3

    sput v2, Le/e/a/PageCache;->bytes:I

    .line 41
    :goto_2c
    sget-object v2, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->size()I

    move-result v2

    const/16 v3, 0x8

    if-gt v2, v3, :cond_3f

    sget v2, Le/e/a/PageCache;->bytes:I
    :try_end_38
    .catchall {:try_start_3 .. :try_end_38} :catchall_6a

    const/high16 v3, 0x800000

    if-le v2, v3, :cond_3d

    goto :goto_3f

    .line 45
    :cond_3d
    monitor-exit v0

    return-void

    .line 42
    :cond_3f
    :goto_3f
    :try_start_3f
    sget-object v2, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-virtual {v2}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    .line 43
    .local v2, "first":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Le/e/a/PageCache$Entry;>;"
    sget v3, Le/e/a/PageCache;->bytes:I

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Le/e/a/PageCache$Entry;

    iget-object v4, v4, Le/e/a/PageCache$Entry;->data:[B

    array-length v4, v4

    sub-int/2addr v3, v4

    sput v3, Le/e/a/PageCache;->bytes:I

    sget-object v3, Le/e/a/PageCache;->pages:Ljava/util/LinkedHashMap;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/LinkedHashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_66
    .catchall {:try_start_3f .. :try_end_66} :catchall_6a

    .line 44
    nop

    .end local v2    # "first":Ljava/util/Map$Entry;, "Ljava/util/Map$Entry<Ljava/lang/String;Le/e/a/PageCache$Entry;>;"
    goto :goto_2c

    .line 38
    .end local v1    # "old":Le/e/a/PageCache$Entry;
    :cond_68
    :goto_68
    monitor-exit v0

    return-void

    .line 37
    .end local p0    # "key":Ljava/lang/String;
    .end local p1    # "data":[B
    .end local p2    # "at":J
    .end local p4    # "epoch":J
    :catchall_6a
    move-exception p0

    :try_start_6b
    monitor-exit v0
    :try_end_6c
    .catchall {:try_start_6b .. :try_end_6c} :catchall_6a

    throw p0
.end method
