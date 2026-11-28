.class final Le/e/a/CastRelay$Session;
.super Ljava/lang/Object;
.source "CastRelay.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Le/e/a/CastRelay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Session"
.end annotation


# instance fields
.field final accepted:Ljava/util/concurrent/atomic/AtomicInteger;

.field final bytes:Ljava/util/concurrent/atomic/AtomicLong;

.field volatile closed:Z

.field final connections:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/net/HttpURLConnection;",
            ">;"
        }
    .end annotation
.end field

.field final diagnostics:Ljava/util/concurrent/ScheduledExecutorService;

.field final errors:Ljava/util/concurrent/atomic/AtomicInteger;

.field final hls:Le/e/a/CastHls;

.field final master:Ljava/net/URL;

.field final playlists:Ljava/util/concurrent/atomic/AtomicInteger;

.field final requests:Ljava/util/concurrent/atomic/AtomicInteger;

.field final resources:Ljava/util/concurrent/atomic/AtomicInteger;

.field final sockets:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/net/Socket;",
            ">;"
        }
    .end annotation
.end field

.field final workers:Ljava/util/concurrent/ThreadPoolExecutor;


# direct methods
.method constructor <init>(Ljava/net/URL;Ljava/lang/String;)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 70
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 60
    new-instance v7, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 61
    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v0, 0x10

    invoke-direct {v6, v0}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    const/4 v1, 0x4

    const/4 v2, 0x4

    const-wide/16 v3, 0x1e

    move-object v0, v7

    .line 60
    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v7, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 62
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    .line 63
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    .line 65
    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->accepted:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->requests:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->playlists:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->resources:Ljava/util/concurrent/atomic/AtomicInteger;

    new-instance v0, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 66
    new-instance v0, Ljava/util/concurrent/atomic/AtomicLong;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    .line 67
    invoke-static {}, Ljava/util/concurrent/Executors;->newSingleThreadScheduledExecutor()Ljava/util/concurrent/ScheduledExecutorService;

    move-result-object v0

    iput-object v0, p0, Le/e/a/CastRelay$Session;->diagnostics:Ljava/util/concurrent/ScheduledExecutorService;

    .line 71
    invoke-static {p1}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    iput-object p1, p0, Le/e/a/CastRelay$Session;->master:Ljava/net/URL;

    new-instance p1, Le/e/a/CastHls;

    invoke-direct {p1, p2}, Le/e/a/CastHls;-><init>(Ljava/lang/String;)V

    iput-object p1, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    const/4 p1, 0x1

    .line 72
    invoke-virtual {v7, p1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    return-void
.end method

.method private release(Ljava/net/HttpURLConnection;)V
    .registers 3

    .line 189
    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 190
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :catchall_0
    move-exception p1

    .line 189
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1
.end method

.method private serve(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 22

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    const/4 v3, 0x0

    .line 90
    :try_start_0
    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_8

    const/16 v0, 0x3a98

    .line 91
    :try_start_1
    invoke-virtual {v2, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 92
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    .line 93
    # invokes: Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;
    invoke-static {v0}, Le/e/a/CastRelay;->access$2(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v5

    const/4 v6, 0x0

    if-nez v5, :cond_0

    .line 94
    new-array v7, v6, [Ljava/lang/String;

    goto :goto_0

    :cond_0
    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 95
    :goto_0
    array-length v8, v7

    const/4 v9, 0x3

    if-eq v8, v9, :cond_2

    const/16 v0, 0x190

    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_7

    .line 118
    :try_start_2
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_8

    if-eqz v2, :cond_1

    :try_start_3
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_9

    .line 119
    :cond_1
    monitor-enter p0

    :try_start_4
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw v0

    .line 96
    :cond_2
    :try_start_5
    aget-object v8, v7, v6

    const/4 v9, 0x1

    aget-object v7, v7, v9

    .line 97
    const-string v10, "HEAD"

    invoke-virtual {v10, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v10

    .line 98
    iget-object v11, v1, Le/e/a/CastRelay$Session;->requests:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v11}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v11

    const/16 v12, 0x10

    if-gt v11, v12, :cond_6

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Cast relay request: method="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "GET|HEAD|OPTIONS"

    invoke-virtual {v8, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_3

    move-object v12, v8

    goto :goto_1

    :cond_3
    const-string v12, "other"

    :goto_1
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " route="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "/comment.json"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_4

    const-string v12, "comments"

    goto :goto_2

    :cond_4
    iget-object v12, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v12, v7}, Le/e/a/CastHls;->lookup(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v12

    if-nez v12, :cond_5

    const-string v12, "unknown"

    goto :goto_2

    :cond_5
    const-string v12, "hls"

    :goto_2
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 99
    :cond_6
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    move-object v11, v3

    .line 100
    :goto_3
    # invokes: Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;
    invoke-static {v0}, Le/e/a/CastRelay;->access$2(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_a

    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_7

    goto :goto_4

    .line 101
    :cond_7
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v5, v12

    const v12, 0x8000

    if-gt v5, v12, :cond_9

    .line 102
    const-string v16, "Range:"

    const/16 v17, 0x0

    const/16 v18, 0x6

    const/4 v13, 0x1

    const/4 v14, 0x0

    move-object v12, v15

    move-object v6, v15

    move-object/from16 v15, v16

    move/from16 v16, v17

    move/from16 v17, v18

    invoke-virtual/range {v12 .. v17}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v12

    if-eqz v12, :cond_8

    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    :cond_8
    const/4 v6, 0x0

    goto :goto_3

    .line 101
    :cond_9
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Oversized Cast request"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_a
    :goto_4
    const-string v0, "OPTIONS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_c

    const/16 v0, 0xcc

    const-wide/16 v5, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v3, v5, v6}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_7

    .line 118
    :try_start_6
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_8

    if-eqz v2, :cond_b

    :try_start_7
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_9

    .line 119
    :cond_b
    monitor-enter p0

    :try_start_8
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_1
    move-exception v0

    monitor-exit p0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    throw v0

    :cond_c
    if-nez v10, :cond_e

    .line 105
    :try_start_9
    const-string v0, "GET"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_e

    const/16 v0, 0x195

    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_7

    .line 118
    :try_start_a
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_8

    if-eqz v2, :cond_d

    :try_start_b
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_9

    .line 119
    :cond_d
    monitor-enter p0

    :try_start_c
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_2
    move-exception v0

    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_2

    throw v0

    .line 107
    :cond_e
    :try_start_d
    const-string v0, "/comment.json"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_10

    move-object/from16 v6, p1

    invoke-static {v6, v4, v10}, Le/e/a/CastComments213;->respond(Ljava/lang/Object;Ljava/io/OutputStream;Z)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 118
    :try_start_e
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_8

    if-eqz v2, :cond_f

    :try_start_f
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 119
    :cond_f
    monitor-enter p0

    :try_start_10
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_3
    move-exception v0

    monitor-exit p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_3

    throw v0

    .line 112
    :cond_10
    :try_start_11
    iget-object v0, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0, v7}, Le/e/a/CastHls;->lookup(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_15

    .line 113
    iget-boolean v5, v1, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v5, :cond_11

    goto :goto_5

    :cond_11
    if-eqz v11, :cond_13

    .line 114
    const-string v5, "bytes=(?:[0-9]+-[0-9]*|-[0-9]+)"

    invoke-virtual {v11, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_13

    const/16 v0, 0x1a0

    .line 115
    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_7

    .line 118
    :try_start_12
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_8

    if-eqz v2, :cond_12

    :try_start_13
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_13
    .catchall {:try_start_13 .. :try_end_13} :catchall_9

    .line 119
    :cond_12
    monitor-enter p0

    :try_start_14
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_4
    move-exception v0

    monitor-exit p0
    :try_end_14
    .catchall {:try_start_14 .. :try_end_14} :catchall_4

    throw v0

    .line 117
    :cond_13
    :try_start_15
    invoke-virtual {v1, v4, v0, v10, v11}, Le/e/a/CastRelay$Session;->transfer(Ljava/io/BufferedOutputStream;Ljava/net/URL;ZLjava/lang/String;)V
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_7

    .line 118
    :try_start_16
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_16
    .catchall {:try_start_16 .. :try_end_16} :catchall_8

    if-eqz v2, :cond_14

    :try_start_17
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_9

    .line 119
    :cond_14
    monitor-enter p0

    :try_start_18
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    goto :goto_9

    :catchall_5
    move-exception v0

    monitor-exit p0
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_5

    throw v0

    :cond_15
    :goto_5
    const/16 v0, 0x194

    .line 113
    :try_start_19
    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_19
    .catchall {:try_start_19 .. :try_end_19} :catchall_7

    .line 118
    :try_start_1a
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1a
    .catchall {:try_start_1a .. :try_end_1a} :catchall_8

    if-eqz v2, :cond_16

    :try_start_1b
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_1b
    .catchall {:try_start_1b .. :try_end_1b} :catchall_9

    .line 119
    :cond_16
    monitor-enter p0

    :try_start_1c
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_6
    move-exception v0

    monitor-exit p0
    :try_end_1c
    .catchall {:try_start_1c .. :try_end_1c} :catchall_6

    throw v0

    :catchall_7
    move-exception v0

    move-object v3, v0

    .line 118
    :try_start_1d
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    throw v3
    :try_end_1d
    .catchall {:try_start_1d .. :try_end_1d} :catchall_8

    :catchall_8
    move-exception v0

    if-nez v3, :cond_17

    move-object v3, v0

    goto :goto_6

    :cond_17
    if-eq v3, v0, :cond_18

    :try_start_1e
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_6

    :catchall_9
    move-exception v0

    goto :goto_7

    :cond_18
    :goto_6
    if-eqz v2, :cond_19

    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V

    :cond_19
    throw v3
    :try_end_1e
    .catchall {:try_start_1e .. :try_end_1e} :catchall_9

    :goto_7
    if-eqz v3, :cond_1a

    if-eq v3, v0, :cond_1b

    :try_start_1f
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_8

    :cond_1a
    move-object v3, v0

    :cond_1b
    :goto_8
    throw v3
    :try_end_1f
    .catch Ljava/lang/Exception; {:try_start_1f .. :try_end_1f} :catch_0
    .catchall {:try_start_1f .. :try_end_1f} :catchall_a

    :catchall_a
    move-exception v0

    goto :goto_a

    :catch_0
    move-exception v0

    :try_start_20
    iget-object v3, v1, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_20
    .catchall {:try_start_20 .. :try_end_20} :catchall_a

    .line 119
    monitor-enter p0

    :try_start_21
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    :goto_9
    return-void

    :catchall_b
    move-exception v0

    monitor-exit p0
    :try_end_21
    .catchall {:try_start_21 .. :try_end_21} :catchall_b

    throw v0

    :goto_a
    monitor-enter p0

    :try_start_22
    iget-object v3, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_22
    .catchall {:try_start_22 .. :try_end_22} :catchall_c

    throw v0

    :catchall_c
    move-exception v0

    :try_start_23
    monitor-exit p0
    :try_end_23
    .catchall {:try_start_23 .. :try_end_23} :catchall_c

    throw v0
.end method


# virtual methods
.method declared-synchronized accept(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 6

    monitor-enter p0

    .line 75
    :try_start_0
    iget-boolean v0, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v0, :cond_0

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 76
    :cond_0
    :try_start_1
    iget-object v0, p0, Le/e/a/CastRelay$Session;->accepted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    const/16 v1, 0x8

    if-gt v0, v1, :cond_1

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cast relay: incoming connection "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 77
    :cond_1
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    :try_start_2
    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Le/e/a/CastRelay$Session$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/CastRelay$Session$$ExternalSyntheticLambda0;-><init>(Le/e/a/CastRelay$Session;Ljava/lang/Object;Ljava/net/Socket;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_2
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    goto :goto_0

    :catch_0
    move-exception p1

    .line 79
    :try_start_3
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V

    invoke-static {p1}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 80
    :goto_0
    monitor-exit p0

    return-void

    :catchall_0
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized close()V
    .registers 3

    monitor-enter p0

    .line 82
    :try_start_0
    const-string v0, "closed"

    invoke-virtual {p0, v0}, Le/e/a/CastRelay$Session;->summary(Ljava/lang/String;)V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->diagnostics:Ljava/util/concurrent/ScheduledExecutorService;

    invoke-interface {v0}, Ljava/util/concurrent/ScheduledExecutorService;->shutdownNow()Ljava/util/List;

    const/4 v0, 0x1

    .line 83
    iput-boolean v0, p0, Le/e/a/CastRelay$Session;->closed:Z

    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 84
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 85
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 86
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_0

    .line 87
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0}, Le/e/a/CastHls;->clear()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 88
    monitor-exit p0

    return-void

    .line 86
    :cond_0
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_1

    .line 84
    :cond_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {v1}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    goto :goto_0

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method synthetic lambda$0$e-e-a-CastRelay$Session(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 3

    .line 78
    invoke-direct {p0, p1, p2}, Le/e/a/CastRelay$Session;->serve(Ljava/lang/Object;Ljava/net/Socket;)V

    return-void
.end method

.method reject(Ljava/io/BufferedOutputStream;I)V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cast relay response="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    const/4 v0, 0x0

    const-wide/16 v1, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, p2, v0, v1, v2}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V

    return-void
.end method

.method summary(Ljava/lang/String;)V
    .registers 5

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Cast relay summary "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, ": connections="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->accepted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " requests="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->requests:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " playlists="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->playlists:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " resources="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->resources:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p1, " bytes="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string p1, " errors="

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p1, p0, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    return-void
.end method

.method transfer(Ljava/io/BufferedOutputStream;Ljava/net/URL;ZLjava/lang/String;)V
    .registers 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 v0, 0x0

    const/4 v1, 0x0

    :goto_0
    const/4 v2, 0x0

    .line 126
    :try_start_0
    invoke-static {p2}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 127
    invoke-static {p2}, Lnicoid/network238/StreamConnection256;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_7

    .line 128
    :try_start_1
    monitor-enter p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_8

    .line 129
    :try_start_2
    iget-boolean v4, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v4, :cond_1c

    .line 130
    iget-object v4, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_6

    const/16 v4, 0x3a98

    .line 132
    :try_start_3
    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v4, 0x4e20

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 133
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 135
    const-string v4, "GET"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 136
    const-string v4, "Accept-Encoding"

    const-string v5, "identity"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 137
    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    const-string v4, "Origin"

    const-string v5, "https://www.nicovideo.jp"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 139
    const-string v4, "Referer"

    const-string v5, "https://www.nicovideo.jp/"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    iget-object v4, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v4, p2}, Le/e/a/CastHls;->cookieFor(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v4

    .line 141
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_0

    const-string v5, "Cookie"

    invoke-virtual {v3, v5, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    :cond_0
    invoke-virtual {p2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".m3u8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz p4, :cond_1

    if-nez v4, :cond_1

    .line 143
    const-string v5, "Range"

    invoke-virtual {v3, v5, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :cond_1
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    const/16 v6, 0x12d

    if-eq v5, v6, :cond_1a

    const/16 v6, 0x12e

    if-eq v5, v6, :cond_1a

    const/16 v6, 0x12f

    if-eq v5, v6, :cond_1a

    const/16 v6, 0x133

    if-eq v5, v6, :cond_1a

    const/16 v6, 0x134

    if-ne v5, v6, :cond_2

    goto/16 :goto_8

    .line 151
    :cond_2
    iget-object p4, p0, Le/e/a/CastRelay$Session;->requests:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p4

    const/16 v1, 0x10

    const/16 v6, 0xce

    const/16 v7, 0xc8

    if-le p4, v1, :cond_3

    if-eq v5, v7, :cond_5

    if-eq v5, v6, :cond_5

    :cond_3
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v1, "Cast relay HTTP "

    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_4

    const-string v1, " playlist"

    goto :goto_1

    :cond_4
    const-string v1, " resource"

    :goto_1
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_8

    :cond_5
    const/4 p4, 0x1

    if-eq v5, v7, :cond_7

    if-eq v5, v6, :cond_7

    .line 152
    :try_start_4
    invoke-virtual {p0, p1, v5}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_8

    if-eqz v3, :cond_6

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_6
    return-void

    :catch_0
    move-exception p2

    const/4 v0, 0x1

    goto/16 :goto_9

    .line 153
    :cond_7
    :try_start_5
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_8

    .line 154
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "mpegurl"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_1
    .catchall {:try_start_5 .. :try_end_5} :catchall_8

    if-eqz v6, :cond_8

    const/4 v6, 0x1

    goto :goto_2

    :cond_8
    const/4 v6, 0x0

    :goto_2
    or-int/2addr v4, v6

    if-eqz v4, :cond_e

    .line 157
    :try_start_6
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    :try_start_7
    # invokes: Le/e/a/CastRelay;->readPlaylist(Ljava/io/InputStream;)[B
    invoke-static {v1}, Le/e/a/CastRelay;->access$3(Ljava/io/InputStream;)[B

    move-result-object v5
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    if-eqz v1, :cond_9

    :try_start_8
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 158
    :cond_9
    :try_start_9
    iget-object v1, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    new-instance v6, Ljava/lang/String;

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v5, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, p2, v6}, Le/e/a/CastHls;->rewrite(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2
    :try_end_9
    .catch Ljava/io/IOException; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_8

    .line 159
    :try_start_a
    const-string v0, "application/vnd.apple.mpegurl"

    array-length v1, p2

    int-to-long v5, v1

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, v7, v0, v5, v6}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V

    if-nez p3, :cond_a

    .line 160
    invoke-virtual {p1, p2}, Ljava/io/BufferedOutputStream;->write([B)V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    array-length p2, p2

    int-to-long v5, p2

    invoke-virtual {v0, v5, v6}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    :cond_a
    iget-object p2, p0, Le/e/a/CastRelay$Session;->playlists:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_0
    .catchall {:try_start_a .. :try_end_a} :catchall_8

    goto/16 :goto_7

    :catchall_0
    move-exception p2

    if-eqz v1, :cond_b

    .line 157
    :try_start_b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_b
    throw p2
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_1

    :catchall_1
    move-exception p3

    move-object v9, p3

    move-object p3, p2

    move-object p2, v9

    goto :goto_3

    :catchall_2
    move-exception p2

    move-object p3, v2

    :goto_3
    if-eqz p3, :cond_d

    if-eq p3, p2, :cond_c

    :try_start_c
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_c
    move-object p2, p3

    :cond_d
    throw p2

    .line 162
    :cond_e
    const-string p2, "Content-Length"

    invoke-virtual {v3, p2}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_f

    const-wide/16 v6, -0x1

    goto :goto_4

    .line 163
    :cond_f
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_c} :catch_1
    .catchall {:try_start_c .. :try_end_c} :catchall_8

    :goto_4
    if-nez v1, :cond_10

    .line 164
    :try_start_d
    const-string v1, "application/octet-stream"

    :cond_10
    # invokes: Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, v5, v1, v6, v7}, Le/e/a/CastRelay;->access$4(Ljava/io/OutputStream;ILjava/lang/String;J)V

    if-nez v4, :cond_11

    .line 166
    const-string p2, "Content-Range"

    const-string v1, "Content-Range"

    invoke-virtual {v3, v1}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    # invokes: Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {p1, p2, v1}, Le/e/a/CastRelay;->access$5(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 167
    const-string p2, "Accept-Ranges"

    const-string v1, "bytes"

    # invokes: Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {p1, p2, v1}, Le/e/a/CastRelay;->access$5(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 169
    :cond_11
    const-string p2, "\r\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_d .. :try_end_d} :catch_0
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    if-nez p3, :cond_17

    .line 170
    :try_start_e
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    const v1, 0x8000

    .line 171
    :try_start_f
    new-array v1, v1, [B

    .line 172
    :goto_5
    invoke-virtual {p2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_3

    const/4 v6, -0x1

    if-ne v5, v6, :cond_12

    if-eqz p2, :cond_17

    .line 177
    :try_start_10
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_5

    goto :goto_7

    .line 173
    :cond_12
    :try_start_11
    iget-boolean v6, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v6, :cond_13

    .line 174
    invoke-virtual {p1, v1, v0, v5}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 175
    iget-object v6, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    int-to-long v7, v5

    invoke-virtual {v6, v7, v8}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    goto :goto_5

    .line 173
    :cond_13
    new-instance p3, Ljava/io/IOException;

    const-string v0, "Cast session closed"

    invoke-direct {p3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p3
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_3

    :catchall_3
    move-exception p3

    if-eqz p2, :cond_14

    .line 177
    :try_start_12
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_14
    throw p3
    :try_end_12
    .catchall {:try_start_12 .. :try_end_12} :catchall_4

    :catchall_4
    move-exception p2

    goto :goto_6

    :catchall_5
    move-exception p2

    move-object p3, v2

    :goto_6
    if-eqz p3, :cond_16

    if-eq p3, p2, :cond_15

    :try_start_13
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_15
    move-object p2, p3

    :cond_16
    throw p2

    .line 179
    :cond_17
    :goto_7
    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    if-nez v4, :cond_18

    if-nez p3, :cond_18

    iget-object p2, p0, Le/e/a/CastRelay$Session;->resources:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_13
    .catch Ljava/io/IOException; {:try_start_13 .. :try_end_13} :catch_0
    .catchall {:try_start_13 .. :try_end_13} :catchall_8

    :cond_18
    if-eqz v3, :cond_19

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_19
    return-void

    .line 146
    :cond_1a
    :goto_8
    :try_start_14
    const-string v4, "Location"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    if-ge v1, v5, :cond_1b

    if-eqz v4, :cond_1b

    .line 148
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p2, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-static {v5}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 149
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    add-int/lit8 v1, v1, 0x1

    move-object p2, v5

    goto/16 :goto_0

    .line 147
    :cond_1b
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Cast redirect failed"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_14
    .catch Ljava/io/IOException; {:try_start_14 .. :try_end_14} :catch_1
    .catchall {:try_start_14 .. :try_end_14} :catchall_8

    .line 129
    :cond_1c
    :try_start_15
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Cast session closed"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :catchall_6
    move-exception p2

    .line 128
    monitor-exit p0
    :try_end_15
    .catchall {:try_start_15 .. :try_end_15} :catchall_6

    :try_start_16
    throw p2
    :try_end_16
    .catch Ljava/io/IOException; {:try_start_16 .. :try_end_16} :catch_1
    .catchall {:try_start_16 .. :try_end_16} :catchall_8

    :catch_1
    move-exception p2

    goto :goto_9

    :catchall_7
    move-exception p1

    goto :goto_a

    :catch_2
    move-exception p2

    move-object v3, v2

    .line 183
    :goto_9
    :try_start_17
    invoke-static {p2}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 184
    iget-object p3, p0, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    if-nez v0, :cond_1e

    const/16 p2, 0x1f6

    const-wide/16 p3, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, p2, v2, p3, p4}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_17
    .catchall {:try_start_17 .. :try_end_17} :catchall_8

    if-eqz v3, :cond_1d

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_1d
    return-void

    .line 185
    :cond_1e
    :try_start_18
    throw p2
    :try_end_18
    .catchall {:try_start_18 .. :try_end_18} :catchall_8

    :catchall_8
    move-exception p1

    move-object v2, v3

    :goto_a
    if-eqz v2, :cond_1f

    .line 186
    invoke-direct {p0, v2}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_1f
    throw p1
.end method
