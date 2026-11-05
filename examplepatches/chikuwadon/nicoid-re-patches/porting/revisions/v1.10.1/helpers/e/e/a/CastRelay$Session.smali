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

    :try_start_1
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_b

    .line 190
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :catchall_b
    move-exception p1

    .line 189
    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw p1
.end method

.method private serve(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 22

    move-object/from16 v1, p0

    move-object/from16 v2, p2

    const/4 v3, 0x0

    .line 90
    :try_start_5
    new-instance v4, Ljava/io/BufferedOutputStream;

    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v0

    invoke-direct {v4, v0}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_e
    .catchall {:try_start_5 .. :try_end_e} :catchall_1ad

    const/16 v0, 0x3a98

    .line 91
    :try_start_10
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

    if-nez v5, :cond_2d

    .line 94
    new-array v7, v6, [Ljava/lang/String;

    goto :goto_33

    :cond_2d
    const-string v7, " "

    invoke-virtual {v5, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 95
    :goto_33
    array-length v8, v7

    const/4 v9, 0x3

    if-eq v8, v9, :cond_4f

    const/16 v0, 0x190

    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_3c
    .catchall {:try_start_10 .. :try_end_3c} :catchall_1a7

    .line 118
    :try_start_3c
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_3f
    .catchall {:try_start_3c .. :try_end_3f} :catchall_1ad

    if-eqz v2, :cond_44

    :try_start_41
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_44
    .catchall {:try_start_41 .. :try_end_44} :catchall_1b8

    .line 119
    :cond_44
    monitor-enter p0

    :try_start_45
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_4c
    move-exception v0

    monitor-exit p0
    :try_end_4e
    .catchall {:try_start_45 .. :try_end_4e} :catchall_4c

    throw v0

    .line 96
    :cond_4f
    :try_start_4f
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

    if-gt v11, v12, :cond_a1

    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Cast relay request: method="

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v12, "GET|HEAD|OPTIONS"

    invoke-virtual {v8, v12}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_75

    move-object v12, v8

    goto :goto_77

    :cond_75
    const-string v12, "other"

    :goto_77
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, " route="

    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v12, "/comment.json"

    invoke-virtual {v7, v12}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-eqz v12, :cond_8a

    const-string v12, "comments"

    goto :goto_97

    :cond_8a
    iget-object v12, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v12, v7}, Le/e/a/CastHls;->lookup(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v12

    if-nez v12, :cond_95

    const-string v12, "unknown"

    goto :goto_97

    :cond_95
    const-string v12, "hls"

    :goto_97
    invoke-virtual {v11, v12}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v11

    invoke-static {v11}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 99
    :cond_a1
    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v5

    move-object v11, v3

    .line 100
    :goto_a6
    # invokes: Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;
    invoke-static {v0}, Le/e/a/CastRelay;->access$2(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v15

    if-eqz v15, :cond_e6

    invoke-virtual {v15}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-eqz v12, :cond_b3

    goto :goto_e6

    .line 101
    :cond_b3
    invoke-virtual {v15}, Ljava/lang/String;->length()I

    move-result v12

    add-int/2addr v5, v12

    const v12, 0x8000

    if-gt v5, v12, :cond_de

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

    if-eqz v12, :cond_dc

    const/4 v11, 0x6

    invoke-virtual {v6, v11}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v11

    :cond_dc
    const/4 v6, 0x0

    goto :goto_a6

    .line 101
    :cond_de
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Oversized Cast request"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 104
    :cond_e6
    :goto_e6
    const-string v0, "OPTIONS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_108

    const/16 v0, 0xcc

    const-wide/16 v5, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v3, v5, v6}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_f5
    .catchall {:try_start_4f .. :try_end_f5} :catchall_1a7

    .line 118
    :try_start_f5
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_f8
    .catchall {:try_start_f5 .. :try_end_f8} :catchall_1ad

    if-eqz v2, :cond_fd

    :try_start_fa
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_fd
    .catchall {:try_start_fa .. :try_end_fd} :catchall_1b8

    .line 119
    :cond_fd
    monitor-enter p0

    :try_start_fe
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_105
    move-exception v0

    monitor-exit p0
    :try_end_107
    .catchall {:try_start_fe .. :try_end_107} :catchall_105

    throw v0

    :cond_108
    if-nez v10, :cond_12a

    .line 105
    :try_start_10a
    const-string v0, "GET"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_12a

    const/16 v0, 0x195

    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_117
    .catchall {:try_start_10a .. :try_end_117} :catchall_1a7

    .line 118
    :try_start_117
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_11a
    .catchall {:try_start_117 .. :try_end_11a} :catchall_1ad

    if-eqz v2, :cond_11f

    :try_start_11c
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_11f
    .catchall {:try_start_11c .. :try_end_11f} :catchall_1b8

    .line 119
    :cond_11f
    monitor-enter p0

    :try_start_120
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_127
    move-exception v0

    monitor-exit p0
    :try_end_129
    .catchall {:try_start_120 .. :try_end_129} :catchall_127

    throw v0

    .line 107
    :cond_12a
    :try_start_12a
    const-string v0, "/comment.json"

    invoke-virtual {v7, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14a

    move-object/from16 v6, p1

    invoke-static {v6, v4, v10}, Le/e/a/CastComments213;->respond(Ljava/lang/Object;Ljava/io/OutputStream;Z)V
    :try_end_137
    .catchall {:try_start_12a .. :try_end_137} :catchall_1a7

    .line 118
    :try_start_137
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_13a
    .catchall {:try_start_137 .. :try_end_13a} :catchall_1ad

    if-eqz v2, :cond_13f

    :try_start_13c
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_13f
    .catchall {:try_start_13c .. :try_end_13f} :catchall_1b8

    .line 119
    :cond_13f
    monitor-enter p0

    :try_start_140
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_147
    move-exception v0

    monitor-exit p0
    :try_end_149
    .catchall {:try_start_140 .. :try_end_149} :catchall_147

    throw v0

    .line 112
    :cond_14a
    :try_start_14a
    iget-object v0, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0, v7}, Le/e/a/CastHls;->lookup(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    if-eqz v0, :cond_18f

    .line 113
    iget-boolean v5, v1, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v5, :cond_157

    goto :goto_18f

    :cond_157
    if-eqz v11, :cond_179

    .line 114
    const-string v5, "bytes=(?:[0-9]+-[0-9]*|-[0-9]+)"

    invoke-virtual {v11, v5}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v5

    if-nez v5, :cond_179

    const/16 v0, 0x1a0

    .line 115
    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_166
    .catchall {:try_start_14a .. :try_end_166} :catchall_1a7

    .line 118
    :try_start_166
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_169
    .catchall {:try_start_166 .. :try_end_169} :catchall_1ad

    if-eqz v2, :cond_16e

    :try_start_16b
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_16e
    .catchall {:try_start_16b .. :try_end_16e} :catchall_1b8

    .line 119
    :cond_16e
    monitor-enter p0

    :try_start_16f
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_176
    move-exception v0

    monitor-exit p0
    :try_end_178
    .catchall {:try_start_16f .. :try_end_178} :catchall_176

    throw v0

    .line 117
    :cond_179
    :try_start_179
    invoke-virtual {v1, v4, v0, v10, v11}, Le/e/a/CastRelay$Session;->transfer(Ljava/io/BufferedOutputStream;Ljava/net/URL;ZLjava/lang/String;)V
    :try_end_17c
    .catchall {:try_start_179 .. :try_end_17c} :catchall_1a7

    .line 118
    :try_start_17c
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_17f
    .catchall {:try_start_17c .. :try_end_17f} :catchall_1ad

    if-eqz v2, :cond_184

    :try_start_181
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_184
    .catchall {:try_start_181 .. :try_end_184} :catchall_1b8

    .line 119
    :cond_184
    monitor-enter p0

    :try_start_185
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    goto :goto_1dc

    :catchall_18c
    move-exception v0

    monitor-exit p0
    :try_end_18e
    .catchall {:try_start_185 .. :try_end_18e} :catchall_18c

    throw v0

    :cond_18f
    :goto_18f
    const/16 v0, 0x194

    .line 113
    :try_start_191
    invoke-virtual {v1, v4, v0}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_194
    .catchall {:try_start_191 .. :try_end_194} :catchall_1a7

    .line 118
    :try_start_194
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_197
    .catchall {:try_start_194 .. :try_end_197} :catchall_1ad

    if-eqz v2, :cond_19c

    :try_start_199
    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V
    :try_end_19c
    .catchall {:try_start_199 .. :try_end_19c} :catchall_1b8

    .line 119
    :cond_19c
    monitor-enter p0

    :try_start_19d
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    return-void

    :catchall_1a4
    move-exception v0

    monitor-exit p0
    :try_end_1a6
    .catchall {:try_start_19d .. :try_end_1a6} :catchall_1a4

    throw v0

    :catchall_1a7
    move-exception v0

    move-object v3, v0

    .line 118
    :try_start_1a9
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V

    throw v3
    :try_end_1ad
    .catchall {:try_start_1a9 .. :try_end_1ad} :catchall_1ad

    :catchall_1ad
    move-exception v0

    if-nez v3, :cond_1b2

    move-object v3, v0

    goto :goto_1ba

    :cond_1b2
    if-eq v3, v0, :cond_1ba

    :try_start_1b4
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1ba

    :catchall_1b8
    move-exception v0

    goto :goto_1c0

    :cond_1ba
    :goto_1ba
    if-eqz v2, :cond_1bf

    invoke-virtual/range {p2 .. p2}, Ljava/net/Socket;->close()V

    :cond_1bf
    throw v3
    :try_end_1c0
    .catchall {:try_start_1b4 .. :try_end_1c0} :catchall_1b8

    :goto_1c0
    if-eqz v3, :cond_1c8

    if-eq v3, v0, :cond_1c9

    :try_start_1c4
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_1c9

    :cond_1c8
    move-object v3, v0

    :cond_1c9
    :goto_1c9
    throw v3
    :try_end_1ca
    .catch Ljava/lang/Exception; {:try_start_1c4 .. :try_end_1ca} :catch_1cc
    .catchall {:try_start_1c4 .. :try_end_1ca} :catchall_1ca

    :catchall_1ca
    move-exception v0

    goto :goto_1e0

    :catch_1cc
    move-exception v0

    :try_start_1cd
    iget-object v3, v1, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_1d5
    .catchall {:try_start_1cd .. :try_end_1d5} :catchall_1ca

    .line 119
    monitor-enter p0

    :try_start_1d6
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    :goto_1dc
    return-void

    :catchall_1dd
    move-exception v0

    monitor-exit p0
    :try_end_1df
    .catchall {:try_start_1d6 .. :try_end_1df} :catchall_1dd

    throw v0

    :goto_1e0
    monitor-enter p0

    :try_start_1e1
    iget-object v3, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_1e7
    .catchall {:try_start_1e1 .. :try_end_1e7} :catchall_1e8

    throw v0

    :catchall_1e8
    move-exception v0

    :try_start_1e9
    monitor-exit p0
    :try_end_1ea
    .catchall {:try_start_1e9 .. :try_end_1ea} :catchall_1e8

    throw v0
.end method


# virtual methods
.method declared-synchronized accept(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 6

    monitor-enter p0

    .line 75
    :try_start_1
    iget-boolean v0, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v0, :cond_a

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_43

    monitor-exit p0

    return-void

    .line 76
    :cond_a
    :try_start_a
    iget-object v0, p0, Le/e/a/CastRelay$Session;->accepted:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    move-result v0

    const/16 v1, 0x8

    if-gt v0, v1, :cond_25

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Cast relay: incoming connection "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 77
    :cond_25
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_2a
    .catchall {:try_start_a .. :try_end_2a} :catchall_43

    .line 78
    :try_start_2a
    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Le/e/a/CastRelay$Session$$ExternalSyntheticLambda0;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/CastRelay$Session$$ExternalSyntheticLambda0;-><init>(Le/e/a/CastRelay$Session;Ljava/lang/Object;Ljava/net/Socket;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_34
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_2a .. :try_end_34} :catch_35
    .catchall {:try_start_2a .. :try_end_34} :catchall_43

    goto :goto_41

    :catch_35
    move-exception p1

    .line 79
    :try_start_36
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V

    invoke-static {p1}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_41
    .catchall {:try_start_36 .. :try_end_41} :catchall_43

    .line 80
    :goto_41
    monitor-exit p0

    return-void

    :catchall_43
    move-exception p1

    monitor-exit p0

    throw p1
.end method

.method declared-synchronized close()V
    .registers 3

    monitor-enter p0

    .line 82
    :try_start_1
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

    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_46

    .line 85
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 86
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_3c

    .line 87
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0}, Le/e/a/CastHls;->clear()V
    :try_end_3a
    .catchall {:try_start_1 .. :try_end_3a} :catchall_50

    .line 88
    monitor-exit p0

    return-void

    .line 86
    :cond_3c
    :try_start_3c
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    goto :goto_2a

    .line 84
    :cond_46
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {v1}, Le/e/a/CastRelay;->access$1(Ljava/net/Socket;)V
    :try_end_4f
    .catchall {:try_start_3c .. :try_end_4f} :catchall_50

    goto :goto_19

    :catchall_50
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

    :goto_2
    const/4 v2, 0x0

    .line 126
    :try_start_3
    invoke-static {p2}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 127
    invoke-virtual {p2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_c
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_c} :catch_1e8
    .catchall {:try_start_3 .. :try_end_c} :catchall_1e6

    .line 128
    :try_start_c
    monitor-enter p0
    :try_end_d
    .catch Ljava/io/IOException; {:try_start_c .. :try_end_d} :catch_1e4
    .catchall {:try_start_c .. :try_end_d} :catchall_202

    .line 129
    :try_start_d
    iget-boolean v4, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v4, :cond_1d9

    .line 130
    iget-object v4, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v4, v3}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 128
    monitor-exit p0
    :try_end_17
    .catchall {:try_start_d .. :try_end_17} :catchall_1e1

    const/16 v4, 0x3a98

    .line 132
    :try_start_19
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

    if-nez v5, :cond_56

    const-string v5, "Cookie"

    invoke-virtual {v3, v5, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 142
    :cond_56
    invoke-virtual {p2}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v4

    const-string v5, ".m3u8"

    invoke-virtual {v4, v5}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-eqz p4, :cond_69

    if-nez v4, :cond_69

    .line 143
    const-string v5, "Range"

    invoke-virtual {v3, v5, p4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 144
    :cond_69
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v5

    const/16 v6, 0x12d

    if-eq v5, v6, :cond_1b6

    const/16 v6, 0x12e

    if-eq v5, v6, :cond_1b6

    const/16 v6, 0x12f

    if-eq v5, v6, :cond_1b6

    const/16 v6, 0x133

    if-eq v5, v6, :cond_1b6

    const/16 v6, 0x134

    if-ne v5, v6, :cond_83

    goto/16 :goto_1b6

    .line 151
    :cond_83
    iget-object p4, p0, Le/e/a/CastRelay$Session;->requests:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p4}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p4

    const/16 v1, 0x10

    const/16 v6, 0xce

    const/16 v7, 0xc8

    if-le p4, v1, :cond_95

    if-eq v5, v7, :cond_b0

    if-eq v5, v6, :cond_b0

    :cond_95
    new-instance p4, Ljava/lang/StringBuilder;

    const-string v1, "Cast relay HTTP "

    invoke-direct {p4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    if-eqz v4, :cond_a4

    const-string v1, " playlist"

    goto :goto_a6

    :cond_a4
    const-string v1, " resource"

    :goto_a6
    invoke-virtual {p4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V
    :try_end_b0
    .catch Ljava/io/IOException; {:try_start_19 .. :try_end_b0} :catch_1e4
    .catchall {:try_start_19 .. :try_end_b0} :catchall_202

    :cond_b0
    const/4 p4, 0x1

    if-eq v5, v7, :cond_c2

    if-eq v5, v6, :cond_c2

    .line 152
    :try_start_b5
    invoke-virtual {p0, p1, v5}, Le/e/a/CastRelay$Session;->reject(Ljava/io/BufferedOutputStream;I)V
    :try_end_b8
    .catch Ljava/io/IOException; {:try_start_b5 .. :try_end_b8} :catch_be
    .catchall {:try_start_b5 .. :try_end_b8} :catchall_202

    if-eqz v3, :cond_bd

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_bd
    return-void

    :catch_be
    move-exception p2

    const/4 v0, 0x1

    goto/16 :goto_1ea

    .line 153
    :cond_c2
    :try_start_c2
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_d8

    .line 154
    sget-object v6, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, v6}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v6

    const-string v8, "mpegurl"

    invoke-virtual {v6, v8}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v6
    :try_end_d4
    .catch Ljava/io/IOException; {:try_start_c2 .. :try_end_d4} :catch_1e4
    .catchall {:try_start_c2 .. :try_end_d4} :catchall_202

    if-eqz v6, :cond_d8

    const/4 v6, 0x1

    goto :goto_d9

    :cond_d8
    const/4 v6, 0x0

    :goto_d9
    or-int/2addr v4, v6

    if-eqz v4, :cond_12d

    .line 157
    :try_start_dc
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_e0
    .catchall {:try_start_dc .. :try_end_e0} :catchall_122

    :try_start_e0
    # invokes: Le/e/a/CastRelay;->readPlaylist(Ljava/io/InputStream;)[B
    invoke-static {v1}, Le/e/a/CastRelay;->access$3(Ljava/io/InputStream;)[B

    move-result-object v5
    :try_end_e4
    .catchall {:try_start_e0 .. :try_end_e4} :catchall_116

    if-eqz v1, :cond_e9

    :try_start_e6
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_e9
    .catchall {:try_start_e6 .. :try_end_e9} :catchall_122

    .line 158
    :cond_e9
    :try_start_e9
    iget-object v1, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    new-instance v6, Ljava/lang/String;

    sget-object v8, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v6, v5, v8}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v1, p2, v6}, Le/e/a/CastHls;->rewrite(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    sget-object v1, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2
    :try_end_fc
    .catch Ljava/io/IOException; {:try_start_e9 .. :try_end_fc} :catch_1e4
    .catchall {:try_start_e9 .. :try_end_fc} :catchall_202

    .line 159
    :try_start_fc
    const-string v0, "application/vnd.apple.mpegurl"

    array-length v1, p2

    int-to-long v5, v1

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, v7, v0, v5, v6}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V

    if-nez p3, :cond_10f

    .line 160
    invoke-virtual {p1, p2}, Ljava/io/BufferedOutputStream;->write([B)V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    array-length p2, p2

    int-to-long v5, p2

    invoke-virtual {v0, v5, v6}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    :cond_10f
    iget-object p2, p0, Le/e/a/CastRelay$Session;->playlists:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_114
    .catch Ljava/io/IOException; {:try_start_fc .. :try_end_114} :catch_be
    .catchall {:try_start_fc .. :try_end_114} :catchall_202

    goto/16 :goto_1a4

    :catchall_116
    move-exception p2

    if-eqz v1, :cond_11c

    .line 157
    :try_start_119
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_11c
    throw p2
    :try_end_11d
    .catchall {:try_start_119 .. :try_end_11d} :catchall_11d

    :catchall_11d
    move-exception p3

    move-object v9, p3

    move-object p3, p2

    move-object p2, v9

    goto :goto_124

    :catchall_122
    move-exception p2

    move-object p3, v2

    :goto_124
    if-eqz p3, :cond_12c

    if-eq p3, p2, :cond_12b

    :try_start_128
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_12b
    move-object p2, p3

    :cond_12c
    throw p2

    .line 162
    :cond_12d
    const-string p2, "Content-Length"

    invoke-virtual {v3, p2}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    if-nez p2, :cond_138

    const-wide/16 v6, -0x1

    goto :goto_13c

    .line 163
    :cond_138
    invoke-static {p2}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v6
    :try_end_13c
    .catch Ljava/io/IOException; {:try_start_128 .. :try_end_13c} :catch_1e4
    .catchall {:try_start_128 .. :try_end_13c} :catchall_202

    :goto_13c
    if-nez v1, :cond_140

    .line 164
    :try_start_13e
    const-string v1, "application/octet-stream"

    :cond_140
    # invokes: Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, v5, v1, v6, v7}, Le/e/a/CastRelay;->access$4(Ljava/io/OutputStream;ILjava/lang/String;J)V

    if-nez v4, :cond_157

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
    :cond_157
    const-string p2, "\r\n"

    sget-object v1, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {p2, v1}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_162
    .catch Ljava/io/IOException; {:try_start_13e .. :try_end_162} :catch_be
    .catchall {:try_start_13e .. :try_end_162} :catchall_202

    if-nez p3, :cond_1a4

    .line 170
    :try_start_164
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p2
    :try_end_168
    .catchall {:try_start_164 .. :try_end_168} :catchall_199

    const v1, 0x8000

    .line 171
    :try_start_16b
    new-array v1, v1, [B

    .line 172
    :goto_16d
    invoke-virtual {p2, v1}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_171
    .catchall {:try_start_16b .. :try_end_171} :catchall_190

    const/4 v6, -0x1

    if-ne v5, v6, :cond_17a

    if-eqz p2, :cond_1a4

    .line 177
    :try_start_176
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V
    :try_end_179
    .catchall {:try_start_176 .. :try_end_179} :catchall_199

    goto :goto_1a4

    .line 173
    :cond_17a
    :try_start_17a
    iget-boolean v6, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v6, :cond_188

    .line 174
    invoke-virtual {p1, v1, v0, v5}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 175
    iget-object v6, p0, Le/e/a/CastRelay$Session;->bytes:Ljava/util/concurrent/atomic/AtomicLong;

    int-to-long v7, v5

    invoke-virtual {v6, v7, v8}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    goto :goto_16d

    .line 173
    :cond_188
    new-instance p3, Ljava/io/IOException;

    const-string v0, "Cast session closed"

    invoke-direct {p3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p3
    :try_end_190
    .catchall {:try_start_17a .. :try_end_190} :catchall_190

    :catchall_190
    move-exception p3

    if-eqz p2, :cond_196

    .line 177
    :try_start_193
    invoke-virtual {p2}, Ljava/io/InputStream;->close()V

    :cond_196
    throw p3
    :try_end_197
    .catchall {:try_start_193 .. :try_end_197} :catchall_197

    :catchall_197
    move-exception p2

    goto :goto_19b

    :catchall_199
    move-exception p2

    move-object p3, v2

    :goto_19b
    if-eqz p3, :cond_1a3

    if-eq p3, p2, :cond_1a2

    :try_start_19f
    invoke-virtual {p3, p2}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1a2
    move-object p2, p3

    :cond_1a3
    throw p2

    .line 179
    :cond_1a4
    :goto_1a4
    invoke-virtual {p1}, Ljava/io/BufferedOutputStream;->flush()V

    if-nez v4, :cond_1b0

    if-nez p3, :cond_1b0

    iget-object p2, p0, Le/e/a/CastRelay$Session;->resources:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p2}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I
    :try_end_1b0
    .catch Ljava/io/IOException; {:try_start_19f .. :try_end_1b0} :catch_be
    .catchall {:try_start_19f .. :try_end_1b0} :catchall_202

    :cond_1b0
    if-eqz v3, :cond_1b5

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_1b5
    return-void

    .line 146
    :cond_1b6
    :goto_1b6
    :try_start_1b6
    const-string v4, "Location"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x5

    if-ge v1, v5, :cond_1d1

    if-eqz v4, :cond_1d1

    .line 148
    new-instance v5, Ljava/net/URL;

    invoke-direct {v5, p2, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-static {v5}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 149
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    add-int/lit8 v1, v1, 0x1

    move-object p2, v5

    goto/16 :goto_2

    .line 147
    :cond_1d1
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Cast redirect failed"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1d9
    .catch Ljava/io/IOException; {:try_start_1b6 .. :try_end_1d9} :catch_1e4
    .catchall {:try_start_1b6 .. :try_end_1d9} :catchall_202

    .line 129
    :cond_1d9
    :try_start_1d9
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Cast session closed"

    invoke-direct {p2, p3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p2

    :catchall_1e1
    move-exception p2

    .line 128
    monitor-exit p0
    :try_end_1e3
    .catchall {:try_start_1d9 .. :try_end_1e3} :catchall_1e1

    :try_start_1e3
    throw p2
    :try_end_1e4
    .catch Ljava/io/IOException; {:try_start_1e3 .. :try_end_1e4} :catch_1e4
    .catchall {:try_start_1e3 .. :try_end_1e4} :catchall_202

    :catch_1e4
    move-exception p2

    goto :goto_1ea

    :catchall_1e6
    move-exception p1

    goto :goto_204

    :catch_1e8
    move-exception p2

    move-object v3, v2

    .line 183
    :goto_1ea
    :try_start_1ea
    invoke-static {p2}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 184
    iget-object p3, p0, Le/e/a/CastRelay$Session;->errors:Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-virtual {p3}, Ljava/util/concurrent/atomic/AtomicInteger;->incrementAndGet()I

    if-nez v0, :cond_201

    const/16 p2, 0x1f6

    const-wide/16 p3, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {p1, p2, v2, p3, p4}, Le/e/a/CastRelay;->access$0(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_1fb
    .catchall {:try_start_1ea .. :try_end_1fb} :catchall_202

    if-eqz v3, :cond_200

    .line 186
    invoke-direct {p0, v3}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_200
    return-void

    .line 185
    :cond_201
    :try_start_201
    throw p2
    :try_end_202
    .catchall {:try_start_201 .. :try_end_202} :catchall_202

    :catchall_202
    move-exception p1

    move-object v2, v3

    :goto_204
    if-eqz v2, :cond_209

    .line 186
    invoke-direct {p0, v2}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_209
    throw p1
.end method
