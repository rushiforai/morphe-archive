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

.field final hls:Le/e/a/CastHls;

.field final master:Ljava/net/URL;

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
    .registers 10
    .param p1, "master"    # Ljava/net/URL;
    .param p2, "cookie"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    new-instance v0, Ljava/util/concurrent/ThreadPoolExecutor;

    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    new-instance v6, Ljava/util/concurrent/ArrayBlockingQueue;

    const/16 v1, 0x10

    invoke-direct {v6, v1}, Ljava/util/concurrent/ArrayBlockingQueue;-><init>(I)V

    const/4 v1, 0x4

    const/4 v2, 0x4

    const-wide/16 v3, 0x1e

    invoke-direct/range {v0 .. v6}, Ljava/util/concurrent/ThreadPoolExecutor;-><init>(IIJLjava/util/concurrent/TimeUnit;Ljava/util/concurrent/BlockingQueue;)V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    .line 59
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    .line 60
    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    .line 63
    invoke-static {p1}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    iput-object p1, p0, Le/e/a/CastRelay$Session;->master:Ljava/net/URL;

    new-instance v0, Le/e/a/CastHls;

    invoke-direct {v0, p2}, Le/e/a/CastHls;-><init>(Ljava/lang/String;)V

    iput-object v0, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    .line 64
    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->allowCoreThreadTimeOut(Z)V

    .line 65
    return-void
.end method

.method private release(Ljava/net/HttpURLConnection;)V
    .registers 3
    .param p1, "connection"    # Ljava/net/HttpURLConnection;

    .line 177
    monitor-enter p0

    :try_start_1
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_7
    .catchall {:try_start_1 .. :try_end_7} :catchall_b

    .line 178
    invoke-virtual {p1}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 179
    return-void

    .line 177
    :catchall_b
    move-exception v0

    :try_start_c
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_c .. :try_end_d} :catchall_b

    throw v0
.end method

.method private serve(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 28
    .param p1, "server"    # Ljava/lang/Object;
    .param p2, "socket"    # Ljava/net/Socket;

    .line 80
    move-object/from16 v1, p0

    move-object/from16 v2, p2

    move-object/from16 v3, p2

    .local v3, "client":Ljava/net/Socket;
    :try_start_6
    new-instance v0, Ljava/io/BufferedOutputStream;

    invoke-virtual {v3}, Ljava/net/Socket;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v4

    invoke-direct {v0, v4}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_f
    .catchall {:try_start_6 .. :try_end_f} :catchall_1c8

    move-object v4, v0

    .line 81
    .local v4, "out":Ljava/io/BufferedOutputStream;
    const/16 v0, 0x3a98

    :try_start_12
    invoke-virtual {v3, v0}, Ljava/net/Socket;->setSoTimeout(I)V

    .line 82
    new-instance v0, Ljava/io/BufferedReader;

    new-instance v5, Ljava/io/InputStreamReader;

    invoke-virtual {v3}, Ljava/net/Socket;->getInputStream()Ljava/io/InputStream;

    move-result-object v6

    sget-object v7, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-direct {v5, v6, v7}, Ljava/io/InputStreamReader;-><init>(Ljava/io/InputStream;Ljava/nio/charset/Charset;)V

    invoke-direct {v0, v5}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V

    move-object v5, v0

    .line 83
    .local v5, "in":Ljava/io/BufferedReader;
    # invokes: Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;
    invoke-static {v5}, Le/e/a/CastRelay;->access$100(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v0

    move-object v6, v0

    .line 84
    .local v6, "first":Ljava/lang/String;
    const/4 v0, 0x0

    if-nez v6, :cond_31

    new-array v7, v0, [Ljava/lang/String;

    goto :goto_37

    :cond_31
    const-string v7, " "

    invoke-virtual {v6, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v7

    .line 85
    .local v7, "request":[Ljava/lang/String;
    :goto_37
    array-length v8, v7

    const/4 v9, 0x3

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    if-eq v8, v9, :cond_61

    const/16 v0, 0x190

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v12, v10, v11}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_43
    .catchall {:try_start_12 .. :try_end_43} :catchall_1b9

    .line 107
    :try_start_43
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_46
    .catchall {:try_start_43 .. :try_end_46} :catchall_1c8

    if-eqz v3, :cond_56

    :try_start_48
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_4b
    .catch Ljava/lang/Exception; {:try_start_48 .. :try_end_4b} :catch_51
    .catchall {:try_start_48 .. :try_end_4b} :catchall_4c

    goto :goto_56

    .line 108
    .end local v3    # "client":Ljava/net/Socket;
    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "first":Ljava/lang/String;
    .end local v7    # "request":[Ljava/lang/String;
    :catchall_4c
    move-exception v0

    move-object/from16 v10, p1

    goto/16 :goto_1e8

    .line 107
    :catch_51
    move-exception v0

    move-object/from16 v10, p1

    goto/16 :goto_1da

    .line 108
    .restart local v3    # "client":Ljava/net/Socket;
    .restart local v4    # "out":Ljava/io/BufferedOutputStream;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "first":Ljava/lang/String;
    .restart local v7    # "request":[Ljava/lang/String;
    :cond_56
    :goto_56
    monitor-enter p0

    :try_start_57
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 85
    return-void

    .line 108
    :catchall_5e
    move-exception v0

    monitor-exit p0
    :try_end_60
    .catchall {:try_start_57 .. :try_end_60} :catchall_5e

    throw v0

    .line 86
    :cond_61
    :try_start_61
    aget-object v8, v7, v0

    .local v8, "method":Ljava/lang/String;
    const/4 v9, 0x1

    aget-object v13, v7, v9

    .local v13, "path":Ljava/lang/String;
    const/4 v14, 0x0

    .line 87
    .local v14, "range":Ljava/lang/String;
    const-string v15, "HEAD"

    invoke-virtual {v15, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v15

    .line 88
    .local v15, "head":Z
    invoke-virtual {v6}, Ljava/lang/String;->length()I

    move-result v16

    .line 89
    .local v16, "size":I
    :goto_71
    # invokes: Le/e/a/CastRelay;->line(Ljava/io/BufferedReader;)Ljava/lang/String;
    invoke-static {v5}, Le/e/a/CastRelay;->access$100(Ljava/io/BufferedReader;)Ljava/lang/String;

    move-result-object v17

    move-object/from16 v18, v17

    .local v18, "header":Ljava/lang/String;
    if-eqz v17, :cond_b9

    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->isEmpty()Z

    move-result v17

    if-nez v17, :cond_b9

    .line 90
    invoke-virtual/range {v18 .. v18}, Ljava/lang/String;->length()I

    move-result v17

    const/16 v24, 0x0

    add-int v0, v16, v17

    .end local v16    # "size":I
    .local v0, "size":I
    const v9, 0x8000

    if-gt v0, v9, :cond_af

    .line 91
    const-string v21, "Range:"

    const/16 v22, 0x0

    const/16 v23, 0x6

    const/16 v19, 0x1

    const/16 v20, 0x0

    invoke-virtual/range {v18 .. v23}, Ljava/lang/String;->regionMatches(ZILjava/lang/String;II)Z

    move-result v9

    move-object/from16 v10, v18

    .end local v18    # "header":Ljava/lang/String;
    .local v10, "header":Ljava/lang/String;
    if-eqz v9, :cond_a8

    const/4 v9, 0x6

    invoke-virtual {v10, v9}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v9

    move-object v14, v9

    :cond_a8
    move/from16 v16, v0

    const/4 v0, 0x0

    const/4 v9, 0x1

    const-wide/16 v10, 0x0

    goto :goto_71

    .line 90
    .end local v10    # "header":Ljava/lang/String;
    .restart local v18    # "header":Ljava/lang/String;
    :cond_af
    move-object/from16 v10, v18

    .end local v18    # "header":Ljava/lang/String;
    .restart local v10    # "header":Ljava/lang/String;
    new-instance v9, Ljava/io/IOException;

    const-string v11, "Oversized Cast request"

    invoke-direct {v9, v11}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v3    # "client":Ljava/net/Socket;
    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    .end local p1    # "server":Ljava/lang/Object;
    .end local p2    # "socket":Ljava/net/Socket;
    throw v9

    .line 89
    .end local v0    # "size":I
    .end local v10    # "header":Ljava/lang/String;
    .restart local v3    # "client":Ljava/net/Socket;
    .restart local v4    # "out":Ljava/io/BufferedOutputStream;
    .restart local v16    # "size":I
    .restart local v18    # "header":Ljava/lang/String;
    .restart local p1    # "server":Ljava/lang/Object;
    .restart local p2    # "socket":Ljava/net/Socket;
    :cond_b9
    move-object/from16 v10, v18

    const/16 v24, 0x0

    .line 93
    .end local v18    # "header":Ljava/lang/String;
    const-string v0, "OPTIONS"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_df

    const/16 v0, 0xcc

    const-wide/16 v9, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v12, v9, v10}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_cc
    .catchall {:try_start_61 .. :try_end_cc} :catchall_1b9

    .line 107
    :try_start_cc
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_cf
    .catchall {:try_start_cc .. :try_end_cf} :catchall_1c8

    if-eqz v3, :cond_d4

    :try_start_d1
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_d4
    .catch Ljava/lang/Exception; {:try_start_d1 .. :try_end_d4} :catch_51
    .catchall {:try_start_d1 .. :try_end_d4} :catchall_4c

    .line 108
    :cond_d4
    monitor-enter p0

    :try_start_d5
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 93
    return-void

    .line 108
    :catchall_dc
    move-exception v0

    monitor-exit p0
    :try_end_de
    .catchall {:try_start_d5 .. :try_end_de} :catchall_dc

    throw v0

    .line 94
    :cond_df
    if-nez v15, :cond_103

    :try_start_e1
    const-string v0, "GET"

    invoke-virtual {v0, v8}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_103

    const/16 v0, 0x195

    const-wide/16 v9, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v12, v9, v10}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_f0
    .catchall {:try_start_e1 .. :try_end_f0} :catchall_1b9

    .line 107
    :try_start_f0
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_f3
    .catchall {:try_start_f0 .. :try_end_f3} :catchall_1c8

    if-eqz v3, :cond_f8

    :try_start_f5
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_f8
    .catch Ljava/lang/Exception; {:try_start_f5 .. :try_end_f8} :catch_51
    .catchall {:try_start_f5 .. :try_end_f8} :catchall_4c

    .line 108
    :cond_f8
    monitor-enter p0

    :try_start_f9
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 94
    return-void

    .line 108
    :catchall_100
    move-exception v0

    monitor-exit p0
    :try_end_102
    .catchall {:try_start_f9 .. :try_end_102} :catchall_100

    throw v0

    .line 96
    :cond_103
    :try_start_103
    const-string v0, "/comment.json"

    invoke-virtual {v13, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_147

    .line 97
    if-eqz v15, :cond_119

    const-string v0, "application/json"

    const-wide/16 v9, -0x1

    const/16 v11, 0xc8

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v11, v0, v9, v10}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V

    move-object/from16 v10, p1

    goto :goto_134

    .line 98
    :cond_119
    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    const-string v9, "a"

    const/4 v10, 0x1

    new-array v11, v10, [Ljava/lang/Class;

    const-class v10, Ljava/io/BufferedOutputStream;

    aput-object v10, v11, v24

    invoke-virtual {v0, v9, v11}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    const/4 v10, 0x1

    new-array v9, v10, [Ljava/lang/Object;

    aput-object v4, v9, v24
    :try_end_12f
    .catchall {:try_start_103 .. :try_end_12f} :catchall_1b9

    move-object/from16 v10, p1

    :try_start_131
    invoke-virtual {v0, v10, v9}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_134
    .catchall {:try_start_131 .. :try_end_134} :catchall_1b7

    .line 107
    :goto_134
    :try_start_134
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_137
    .catchall {:try_start_134 .. :try_end_137} :catchall_1c6

    if-eqz v3, :cond_13c

    :try_start_139
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_13c
    .catch Ljava/lang/Exception; {:try_start_139 .. :try_end_13c} :catch_1d9
    .catchall {:try_start_139 .. :try_end_13c} :catchall_1d7

    .line 108
    :cond_13c
    monitor-enter p0

    :try_start_13d
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 99
    return-void

    .line 108
    :catchall_144
    move-exception v0

    monitor-exit p0
    :try_end_146
    .catchall {:try_start_13d .. :try_end_146} :catchall_144

    throw v0

    .line 101
    :cond_147
    move-object/from16 v10, p1

    :try_start_149
    iget-object v0, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0, v13}, Le/e/a/CastHls;->lookup(Ljava/lang/String;)Ljava/net/URL;

    move-result-object v0

    move-object v9, v0

    .line 102
    .local v9, "url":Ljava/net/URL;
    if-eqz v9, :cond_19a

    iget-boolean v0, v1, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v0, :cond_15a

    move-object v11, v5

    move-object/from16 v17, v6

    goto :goto_19d

    .line 103
    :cond_15a
    if-eqz v14, :cond_181

    const-string v0, "bytes=(?:[0-9]+-[0-9]*|-[0-9]+)"

    invoke-virtual {v14, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_181

    .line 104
    const/16 v0, 0x1a0

    move-object v11, v5

    move-object/from16 v17, v6

    const-wide/16 v5, 0x0

    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "first":Ljava/lang/String;
    .local v11, "in":Ljava/io/BufferedReader;
    .local v17, "first":Ljava/lang/String;
    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v12, v5, v6}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_16e
    .catchall {:try_start_149 .. :try_end_16e} :catchall_1b7

    .line 107
    :try_start_16e
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_171
    .catchall {:try_start_16e .. :try_end_171} :catchall_1c6

    if-eqz v3, :cond_176

    :try_start_173
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_176
    .catch Ljava/lang/Exception; {:try_start_173 .. :try_end_176} :catch_1d9
    .catchall {:try_start_173 .. :try_end_176} :catchall_1d7

    .line 108
    :cond_176
    monitor-enter p0

    :try_start_177
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 104
    return-void

    .line 108
    :catchall_17e
    move-exception v0

    monitor-exit p0
    :try_end_180
    .catchall {:try_start_177 .. :try_end_180} :catchall_17e

    throw v0

    .line 103
    .end local v11    # "in":Ljava/io/BufferedReader;
    .end local v17    # "first":Ljava/lang/String;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "first":Ljava/lang/String;
    :cond_181
    move-object v11, v5

    move-object/from16 v17, v6

    .line 106
    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "first":Ljava/lang/String;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "first":Ljava/lang/String;
    :try_start_184
    invoke-virtual {v1, v4, v9, v15, v14}, Le/e/a/CastRelay$Session;->transfer(Ljava/io/BufferedOutputStream;Ljava/net/URL;ZLjava/lang/String;)V
    :try_end_187
    .catchall {:try_start_184 .. :try_end_187} :catchall_1b7

    .line 107
    .end local v7    # "request":[Ljava/lang/String;
    .end local v8    # "method":Ljava/lang/String;
    .end local v9    # "url":Ljava/net/URL;
    .end local v11    # "in":Ljava/io/BufferedReader;
    .end local v13    # "path":Ljava/lang/String;
    .end local v14    # "range":Ljava/lang/String;
    .end local v15    # "head":Z
    .end local v16    # "size":I
    .end local v17    # "first":Ljava/lang/String;
    :try_start_187
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_18a
    .catchall {:try_start_187 .. :try_end_18a} :catchall_1c6

    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    if-eqz v3, :cond_18f

    :try_start_18c
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_18f
    .catch Ljava/lang/Exception; {:try_start_18c .. :try_end_18f} :catch_1d9
    .catchall {:try_start_18c .. :try_end_18f} :catchall_1d7

    .line 108
    .end local v3    # "client":Ljava/net/Socket;
    :cond_18f
    monitor-enter p0

    :try_start_190
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    goto :goto_1e4

    :catchall_197
    move-exception v0

    monitor-exit p0
    :try_end_199
    .catchall {:try_start_190 .. :try_end_199} :catchall_197

    throw v0

    .line 102
    .restart local v3    # "client":Ljava/net/Socket;
    .restart local v4    # "out":Ljava/io/BufferedOutputStream;
    .restart local v5    # "in":Ljava/io/BufferedReader;
    .restart local v6    # "first":Ljava/lang/String;
    .restart local v7    # "request":[Ljava/lang/String;
    .restart local v8    # "method":Ljava/lang/String;
    .restart local v9    # "url":Ljava/net/URL;
    .restart local v13    # "path":Ljava/lang/String;
    .restart local v14    # "range":Ljava/lang/String;
    .restart local v15    # "head":Z
    .restart local v16    # "size":I
    :cond_19a
    move-object v11, v5

    move-object/from16 v17, v6

    .end local v5    # "in":Ljava/io/BufferedReader;
    .end local v6    # "first":Ljava/lang/String;
    .restart local v11    # "in":Ljava/io/BufferedReader;
    .restart local v17    # "first":Ljava/lang/String;
    :goto_19d
    const/16 v0, 0x194

    const-wide/16 v5, 0x0

    :try_start_1a1
    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v4, v0, v12, v5, v6}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_1a4
    .catchall {:try_start_1a1 .. :try_end_1a4} :catchall_1b7

    .line 107
    :try_start_1a4
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1a7
    .catchall {:try_start_1a4 .. :try_end_1a7} :catchall_1c6

    if-eqz v3, :cond_1ac

    :try_start_1a9
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_1ac
    .catch Ljava/lang/Exception; {:try_start_1a9 .. :try_end_1ac} :catch_1d9
    .catchall {:try_start_1a9 .. :try_end_1ac} :catchall_1d7

    .line 108
    :cond_1ac
    monitor-enter p0

    :try_start_1ad
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 102
    return-void

    .line 108
    :catchall_1b4
    move-exception v0

    monitor-exit p0
    :try_end_1b6
    .catchall {:try_start_1ad .. :try_end_1b6} :catchall_1b4

    throw v0

    .line 80
    .end local v7    # "request":[Ljava/lang/String;
    .end local v8    # "method":Ljava/lang/String;
    .end local v9    # "url":Ljava/net/URL;
    .end local v11    # "in":Ljava/io/BufferedReader;
    .end local v13    # "path":Ljava/lang/String;
    .end local v14    # "range":Ljava/lang/String;
    .end local v15    # "head":Z
    .end local v16    # "size":I
    .end local v17    # "first":Ljava/lang/String;
    :catchall_1b7
    move-exception v0

    goto :goto_1bc

    :catchall_1b9
    move-exception v0

    move-object/from16 v10, p1

    :goto_1bc
    move-object v5, v0

    :try_start_1bd
    invoke-virtual {v4}, Ljava/io/BufferedOutputStream;->close()V
    :try_end_1c0
    .catchall {:try_start_1bd .. :try_end_1c0} :catchall_1c1

    goto :goto_1c5

    :catchall_1c1
    move-exception v0

    :try_start_1c2
    invoke-virtual {v5, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v3    # "client":Ljava/net/Socket;
    .end local p1    # "server":Ljava/lang/Object;
    .end local p2    # "socket":Ljava/net/Socket;
    :goto_1c5
    throw v5
    :try_end_1c6
    .catchall {:try_start_1c2 .. :try_end_1c6} :catchall_1c6

    .end local v4    # "out":Ljava/io/BufferedOutputStream;
    .restart local v3    # "client":Ljava/net/Socket;
    .restart local p1    # "server":Ljava/lang/Object;
    .restart local p2    # "socket":Ljava/net/Socket;
    :catchall_1c6
    move-exception v0

    goto :goto_1cb

    :catchall_1c8
    move-exception v0

    move-object/from16 v10, p1

    :goto_1cb
    move-object v4, v0

    if-eqz v3, :cond_1d6

    :try_start_1ce
    invoke-virtual {v3}, Ljava/net/Socket;->close()V
    :try_end_1d1
    .catchall {:try_start_1ce .. :try_end_1d1} :catchall_1d2

    goto :goto_1d6

    :catchall_1d2
    move-exception v0

    :try_start_1d3
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local p1    # "server":Ljava/lang/Object;
    .end local p2    # "socket":Ljava/net/Socket;
    :cond_1d6
    :goto_1d6
    throw v4
    :try_end_1d7
    .catch Ljava/lang/Exception; {:try_start_1d3 .. :try_end_1d7} :catch_1d9
    .catchall {:try_start_1d3 .. :try_end_1d7} :catchall_1d7

    .line 108
    .end local v3    # "client":Ljava/net/Socket;
    .restart local p1    # "server":Ljava/lang/Object;
    .restart local p2    # "socket":Ljava/net/Socket;
    :catchall_1d7
    move-exception v0

    goto :goto_1e8

    .line 107
    :catch_1d9
    move-exception v0

    .local v0, "error":Ljava/lang/Exception;
    :goto_1da
    :try_start_1da
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_1dd
    .catchall {:try_start_1da .. :try_end_1dd} :catchall_1d7

    .line 108
    .end local v0    # "error":Ljava/lang/Exception;
    monitor-enter p0

    :try_start_1de
    iget-object v0, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0

    .line 109
    :goto_1e4
    return-void

    .line 108
    :catchall_1e5
    move-exception v0

    monitor-exit p0
    :try_end_1e7
    .catchall {:try_start_1de .. :try_end_1e7} :catchall_1e5

    throw v0

    :goto_1e8
    monitor-enter p0

    :try_start_1e9
    iget-object v3, v1, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    monitor-exit p0
    :try_end_1ef
    .catchall {:try_start_1e9 .. :try_end_1ef} :catchall_1f0

    throw v0

    :catchall_1f0
    move-exception v0

    :try_start_1f1
    monitor-exit p0
    :try_end_1f2
    .catchall {:try_start_1f1 .. :try_end_1f2} :catchall_1f0

    throw v0
.end method


# virtual methods
.method declared-synchronized accept(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 5
    .param p1, "server"    # Ljava/lang/Object;
    .param p2, "socket"    # Ljava/net/Socket;

    monitor-enter p0

    .line 67
    :try_start_1
    iget-boolean v0, p0, Le/e/a/CastRelay$Session;->closed:Z

    if-eqz v0, :cond_a

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$000(Ljava/net/Socket;)V
    :try_end_8
    .catchall {:try_start_1 .. :try_end_8} :catchall_28

    monitor-exit p0

    return-void

    .line 68
    .end local p0    # "this":Le/e/a/CastRelay$Session;
    :cond_a
    :try_start_a
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0, p2}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_f
    .catchall {:try_start_a .. :try_end_f} :catchall_28

    .line 69
    :try_start_f
    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    new-instance v1, Le/e/a/CastRelay$Session$0;

    invoke-direct {v1, p0, p1, p2}, Le/e/a/CastRelay$Session$0;-><init>(Le/e/a/CastRelay$Session;Ljava/lang/Object;Ljava/net/Socket;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ThreadPoolExecutor;->execute(Ljava/lang/Runnable;)V
    :try_end_19
    .catch Ljava/util/concurrent/RejectedExecutionException; {:try_start_f .. :try_end_19} :catch_1a
    .catchall {:try_start_f .. :try_end_19} :catchall_28

    .line 70
    goto :goto_26

    :catch_1a
    move-exception v0

    .local v0, "error":Ljava/util/concurrent/RejectedExecutionException;
    :try_start_1b
    iget-object v1, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v1, p2}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {p2}, Le/e/a/CastRelay;->access$000(Ljava/net/Socket;)V

    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V
    :try_end_26
    .catchall {:try_start_1b .. :try_end_26} :catchall_28

    .line 71
    .end local v0    # "error":Ljava/util/concurrent/RejectedExecutionException;
    :goto_26
    monitor-exit p0

    return-void

    .line 66
    .end local p1    # "server":Ljava/lang/Object;
    .end local p2    # "socket":Ljava/net/Socket;
    :catchall_28
    move-exception p1

    :try_start_29
    monitor-exit p0
    :try_end_2a
    .catchall {:try_start_29 .. :try_end_2a} :catchall_28

    throw p1
.end method

.method declared-synchronized close()V
    .registers 3

    monitor-enter p0

    .line 73
    const/4 v0, 0x1

    :try_start_2
    iput-boolean v0, p0, Le/e/a/CastRelay$Session;->closed:Z

    iget-object v0, p0, Le/e/a/CastRelay$Session;->workers:Ljava/util/concurrent/ThreadPoolExecutor;

    invoke-virtual {v0}, Ljava/util/concurrent/ThreadPoolExecutor;->shutdownNow()Ljava/util/List;

    .line 74
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_f
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1f

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/Socket;

    .local v1, "socket":Ljava/net/Socket;
    # invokes: Le/e/a/CastRelay;->closeSocket(Ljava/net/Socket;)V
    invoke-static {v1}, Le/e/a/CastRelay;->access$000(Ljava/net/Socket;)V

    .end local v1    # "socket":Ljava/net/Socket;
    goto :goto_f

    .line 75
    .end local p0    # "this":Le/e/a/CastRelay$Session;
    :cond_1f
    iget-object v0, p0, Le/e/a/CastRelay$Session;->sockets:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    .line 76
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_2a
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    .local v1, "connection":Ljava/net/HttpURLConnection;
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    .end local v1    # "connection":Ljava/net/HttpURLConnection;
    goto :goto_2a

    .line 77
    :cond_3a
    iget-object v0, p0, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->clear()V

    iget-object v0, p0, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v0}, Le/e/a/CastHls;->clear()V
    :try_end_44
    .catchall {:try_start_2 .. :try_end_44} :catchall_46

    .line 78
    monitor-exit p0

    return-void

    .line 72
    :catchall_46
    move-exception v0

    :try_start_47
    monitor-exit p0
    :try_end_48
    .catchall {:try_start_47 .. :try_end_48} :catchall_46

    throw v0
.end method

.method synthetic lambda$accept$0$e-e-a-CastRelay$Session(Ljava/lang/Object;Ljava/net/Socket;)V
    .registers 3
    .param p1, "server"    # Ljava/lang/Object;
    .param p2, "socket"    # Ljava/net/Socket;

    .line 69
    invoke-direct {p0, p1, p2}, Le/e/a/CastRelay$Session;->serve(Ljava/lang/Object;Ljava/net/Socket;)V

    return-void
.end method

.method transfer(Ljava/io/BufferedOutputStream;Ljava/net/URL;ZLjava/lang/String;)V
    .registers 24
    .param p1, "out"    # Ljava/io/BufferedOutputStream;
    .param p2, "url"    # Ljava/net/URL;
    .param p3, "head"    # Z
    .param p4, "range"    # Ljava/lang/String;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 111
    move-object/from16 v1, p0

    move-object/from16 v2, p1

    move-object/from16 v3, p4

    const/4 v0, 0x0

    .line 112
    .local v0, "connection":Ljava/net/HttpURLConnection;
    const/4 v4, 0x0

    .line 114
    .local v4, "responded":Z
    const/4 v5, 0x0

    move-object v6, v0

    move v7, v5

    move-object/from16 v5, p2

    .line 115
    .end local v0    # "connection":Ljava/net/HttpURLConnection;
    .end local p2    # "url":Ljava/net/URL;
    .local v5, "url":Ljava/net/URL;
    .local v6, "connection":Ljava/net/HttpURLConnection;
    .local v7, "redirect":I
    :goto_d
    const-wide/16 v8, 0x0

    const/4 v10, 0x0

    :try_start_10
    invoke-static {v5}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 116
    invoke-virtual {v5}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v0

    check-cast v0, Ljava/net/HttpURLConnection;

    move-object v6, v0

    .line 117
    monitor-enter p0
    :try_end_1b
    .catch Ljava/io/IOException; {:try_start_10 .. :try_end_1b} :catch_1f4
    .catchall {:try_start_10 .. :try_end_1b} :catchall_1f2

    .line 118
    :try_start_1b
    iget-boolean v0, v1, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v0, :cond_1e7

    .line 119
    iget-object v0, v1, Le/e/a/CastRelay$Session;->connections:Ljava/util/Set;

    invoke-interface {v0, v6}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    .line 120
    monitor-exit p0
    :try_end_25
    .catchall {:try_start_1b .. :try_end_25} :catchall_1ef

    .line 121
    const/16 v0, 0x3a98

    :try_start_27
    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    const/16 v0, 0x4e20

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 122
    const/4 v0, 0x0

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 124
    const-string v11, "GET"

    invoke-virtual {v6, v11}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    .line 125
    const-string v11, "Accept-Encoding"

    const-string v12, "identity"

    invoke-virtual {v6, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 126
    const-string v11, "User-Agent"

    const-string v12, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v6, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 127
    const-string v11, "Origin"

    const-string v12, "https://www.nicovideo.jp"

    invoke-virtual {v6, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 128
    const-string v11, "Referer"

    const-string v12, "https://www.nicovideo.jp/"

    invoke-virtual {v6, v11, v12}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 129
    iget-object v11, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    invoke-virtual {v11, v5}, Le/e/a/CastHls;->cookieFor(Ljava/net/URL;)Ljava/lang/String;

    move-result-object v11

    .line 130
    .local v11, "cookie":Ljava/lang/String;
    invoke-virtual {v11}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_65

    const-string v12, "Cookie"

    invoke-virtual {v6, v12, v11}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    :cond_65
    invoke-virtual {v5}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v12

    const-string v13, ".m3u8"

    invoke-virtual {v12, v13}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v12

    .line 132
    .local v12, "playlist":Z
    if-eqz v3, :cond_78

    if-nez v12, :cond_78

    const-string v13, "Range"

    invoke-virtual {v6, v13, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 133
    :cond_78
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v13

    .line 134
    .local v13, "status":I
    const/16 v14, 0x12d

    if-eq v13, v14, :cond_1c1

    const/16 v14, 0x12e

    if-eq v13, v14, :cond_1c1

    const/16 v14, 0x12f

    if-eq v13, v14, :cond_1c1

    const/16 v14, 0x133

    if-eq v13, v14, :cond_1c1

    const/16 v14, 0x134

    if-ne v13, v14, :cond_92

    goto/16 :goto_1c1

    .line 140
    :cond_92
    new-instance v14, Ljava/lang/StringBuilder;

    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    const-string v15, "Cast relay HTTP "

    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v14

    if-eqz v12, :cond_a6

    const-string v15, " playlist"

    goto :goto_a8

    :cond_a6
    const-string v15, " resource"

    :goto_a8
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v14

    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v14

    invoke-static {v14}, Le/e/a/CastDiagnostics;->record(Ljava/lang/String;)V

    .line 141
    const/16 v14, 0xc8

    if-eq v13, v14, :cond_c5

    const/16 v15, 0xce

    if-eq v13, v15, :cond_c5

    const/4 v4, 0x1

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v2, v13, v10, v8, v9}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_bf
    .catch Ljava/io/IOException; {:try_start_27 .. :try_end_bf} :catch_1f4
    .catchall {:try_start_27 .. :try_end_bf} :catchall_1f2

    .line 174
    if-eqz v6, :cond_c4

    invoke-direct {v1, v6}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    .line 141
    :cond_c4
    return-void

    .line 142
    :cond_c5
    :try_start_c5
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object v15

    .line 143
    .local v15, "type":Ljava/lang/String;
    if-eqz v15, :cond_db

    sget-object v8, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v15, v8}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "mpegurl"

    invoke-virtual {v8, v9}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v8

    if-eqz v8, :cond_db

    const/4 v8, 0x1

    goto :goto_dc

    :cond_db
    const/4 v8, 0x0

    :goto_dc
    or-int/2addr v8, v12

    .line 144
    .end local v12    # "playlist":Z
    .local v8, "playlist":Z
    if-eqz v8, :cond_134

    .line 146
    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_e3
    .catch Ljava/io/IOException; {:try_start_c5 .. :try_end_e3} :catch_1f4
    .catchall {:try_start_c5 .. :try_end_e3} :catchall_1f2

    move-object v9, v0

    .local v9, "input":Ljava/io/InputStream;
    :try_start_e4
    # invokes: Le/e/a/CastRelay;->readPlaylist(Ljava/io/InputStream;)[B
    invoke-static {v9}, Le/e/a/CastRelay;->access$300(Ljava/io/InputStream;)[B

    move-result-object v0
    :try_end_e8
    .catchall {:try_start_e4 .. :try_end_e8} :catchall_127

    .local v0, "body":[B
    if-eqz v9, :cond_ed

    :try_start_ea
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V

    .line 147
    .end local v9    # "input":Ljava/io/InputStream;
    :cond_ed
    iget-object v9, v1, Le/e/a/CastRelay$Session;->hls:Le/e/a/CastHls;

    new-instance v12, Ljava/lang/String;

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v12, v0, v10}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    invoke-virtual {v9, v5, v12}, Le/e/a/CastHls;->rewrite(Ljava/net/URL;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    sget-object v10, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v9, v10}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v9
    :try_end_100
    .catch Ljava/io/IOException; {:try_start_ea .. :try_end_100} :catch_1f4
    .catchall {:try_start_ea .. :try_end_100} :catchall_1f2

    .line 148
    .local v9, "rewritten":[B
    const/4 v4, 0x1

    :try_start_101
    const-string v10, "application/vnd.apple.mpegurl"

    array-length v12, v9
    :try_end_104
    .catch Ljava/io/IOException; {:try_start_101 .. :try_end_104} :catch_122
    .catchall {:try_start_101 .. :try_end_104} :catchall_11d

    move/from16 v16, v4

    .end local v4    # "responded":Z
    .local v16, "responded":Z
    int-to-long v3, v12

    :try_start_107
    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v2, v14, v10, v3, v4}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V

    .line 149
    if-nez p3, :cond_10f

    invoke-virtual {v2, v9}, Ljava/io/BufferedOutputStream;->write([B)V
    :try_end_10f
    .catch Ljava/io/IOException; {:try_start_107 .. :try_end_10f} :catch_118
    .catchall {:try_start_107 .. :try_end_10f} :catchall_113

    .line 150
    .end local v0    # "body":[B
    .end local v9    # "rewritten":[B
    :cond_10f
    move/from16 v4, v16

    goto/16 :goto_1b8

    .line 174
    .end local v7    # "redirect":I
    .end local v8    # "playlist":Z
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v13    # "status":I
    .end local v15    # "type":Ljava/lang/String;
    :catchall_113
    move-exception v0

    move/from16 v4, v16

    goto/16 :goto_20a

    .line 169
    :catch_118
    move-exception v0

    move/from16 v4, v16

    goto/16 :goto_1f5

    .line 174
    .end local v16    # "responded":Z
    .restart local v4    # "responded":Z
    :catchall_11d
    move-exception v0

    move/from16 v16, v4

    .end local v4    # "responded":Z
    .restart local v16    # "responded":Z
    goto/16 :goto_20a

    .line 169
    .end local v16    # "responded":Z
    .restart local v4    # "responded":Z
    :catch_122
    move-exception v0

    move/from16 v16, v4

    .end local v4    # "responded":Z
    .restart local v16    # "responded":Z
    goto/16 :goto_1f5

    .line 146
    .end local v16    # "responded":Z
    .restart local v4    # "responded":Z
    .restart local v7    # "redirect":I
    .restart local v8    # "playlist":Z
    .local v9, "input":Ljava/io/InputStream;
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v13    # "status":I
    .restart local v15    # "type":Ljava/lang/String;
    :catchall_127
    move-exception v0

    move-object v3, v0

    if-eqz v9, :cond_133

    :try_start_12b
    invoke-virtual {v9}, Ljava/io/InputStream;->close()V
    :try_end_12e
    .catchall {:try_start_12b .. :try_end_12e} :catchall_12f

    goto :goto_133

    :catchall_12f
    move-exception v0

    :try_start_130
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    :cond_133
    :goto_133
    throw v3

    .line 151
    .end local v9    # "input":Ljava/io/InputStream;
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :cond_134
    const-string v3, "Content-Length"

    invoke-virtual {v6, v3}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    .line 152
    .local v3, "length":Ljava/lang/String;
    if-nez v3, :cond_13f

    const-wide/16 v9, -0x1

    goto :goto_143

    :cond_13f
    invoke-static {v3}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v9

    .line 153
    .local v9, "count":J
    :goto_143
    const/4 v4, 0x1

    if-nez v15, :cond_149

    const-string v12, "application/octet-stream"

    goto :goto_14a

    :cond_149
    move-object v12, v15

    :goto_14a
    # invokes: Le/e/a/CastRelay;->responseStart(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v2, v13, v12, v9, v10}, Le/e/a/CastRelay;->access$400(Ljava/io/OutputStream;ILjava/lang/String;J)V

    .line 154
    if-nez v8, :cond_161

    .line 155
    const-string v12, "Content-Range"

    const-string v14, "Content-Range"

    invoke-virtual {v6, v14}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    # invokes: Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2, v12, v14}, Le/e/a/CastRelay;->access$500(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 156
    const-string v12, "Accept-Ranges"

    const-string v14, "bytes"

    # invokes: Le/e/a/CastRelay;->header(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V
    invoke-static {v2, v12, v14}, Le/e/a/CastRelay;->access$500(Ljava/io/OutputStream;Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    :cond_161
    const-string v12, "\r\n"

    sget-object v14, Ljava/nio/charset/StandardCharsets;->US_ASCII:Ljava/nio/charset/Charset;

    invoke-virtual {v12, v14}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    invoke-virtual {v2, v12}, Ljava/io/BufferedOutputStream;->write([B)V

    .line 159
    if-nez p3, :cond_1b6

    invoke-virtual {v6}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v12
    :try_end_172
    .catch Ljava/io/IOException; {:try_start_130 .. :try_end_172} :catch_1f4
    .catchall {:try_start_130 .. :try_end_172} :catchall_1f2

    .line 160
    .local v12, "input":Ljava/io/InputStream;
    const v14, 0x8000

    :try_start_175
    new-array v14, v14, [B

    .line 161
    .local v14, "buffer":[B
    :goto_177
    invoke-virtual {v12, v14}, Ljava/io/InputStream;->read([B)I

    move-result v0
    :try_end_17b
    .catchall {:try_start_175 .. :try_end_17b} :catchall_1a7

    move/from16 v17, v0

    move-object/from16 v18, v3

    .end local v3    # "length":Ljava/lang/String;
    .local v17, "n":I
    .local v18, "length":Ljava/lang/String;
    const/4 v3, -0x1

    if-eq v0, v3, :cond_19f

    .line 162
    :try_start_182
    iget-boolean v0, v1, Le/e/a/CastRelay$Session;->closed:Z

    if-nez v0, :cond_190

    .line 163
    move/from16 v0, v17

    const/4 v3, 0x0

    .end local v17    # "n":I
    .local v0, "n":I
    invoke-virtual {v2, v14, v3, v0}, Ljava/io/BufferedOutputStream;->write([BII)V

    move-object/from16 v3, v18

    const/4 v0, 0x0

    goto :goto_177

    .line 162
    .end local v0    # "n":I
    .restart local v17    # "n":I
    :cond_190
    move/from16 v0, v17

    .end local v17    # "n":I
    .restart local v0    # "n":I
    new-instance v3, Ljava/io/IOException;

    move/from16 v16, v0

    .end local v0    # "n":I
    .local v16, "n":I
    const-string v0, "Cast session closed"

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local v7    # "redirect":I
    .end local v8    # "playlist":Z
    .end local v9    # "count":J
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v12    # "input":Ljava/io/InputStream;
    .end local v13    # "status":I
    .end local v15    # "type":Ljava/lang/String;
    .end local v18    # "length":Ljava/lang/String;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    throw v3
    :try_end_19c
    .catchall {:try_start_182 .. :try_end_19c} :catchall_19c

    .line 159
    .end local v14    # "buffer":[B
    .end local v16    # "n":I
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local v7    # "redirect":I
    .restart local v8    # "playlist":Z
    .restart local v9    # "count":J
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v12    # "input":Ljava/io/InputStream;
    .restart local v13    # "status":I
    .restart local v15    # "type":Ljava/lang/String;
    .restart local v18    # "length":Ljava/lang/String;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :catchall_19c
    move-exception v0

    move-object v3, v0

    goto :goto_1ab

    .line 161
    .restart local v14    # "buffer":[B
    .restart local v17    # "n":I
    :cond_19f
    move/from16 v16, v17

    .line 165
    .end local v14    # "buffer":[B
    .end local v17    # "n":I
    if-eqz v12, :cond_1b8

    :try_start_1a3
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_1a6
    .catch Ljava/io/IOException; {:try_start_1a3 .. :try_end_1a6} :catch_1f4
    .catchall {:try_start_1a3 .. :try_end_1a6} :catchall_1f2

    goto :goto_1b8

    .line 159
    .end local v18    # "length":Ljava/lang/String;
    .restart local v3    # "length":Ljava/lang/String;
    :catchall_1a7
    move-exception v0

    move-object/from16 v18, v3

    move-object v3, v0

    .end local v3    # "length":Ljava/lang/String;
    .restart local v18    # "length":Ljava/lang/String;
    :goto_1ab
    if-eqz v12, :cond_1b5

    :try_start_1ad
    invoke-virtual {v12}, Ljava/io/InputStream;->close()V
    :try_end_1b0
    .catchall {:try_start_1ad .. :try_end_1b0} :catchall_1b1

    goto :goto_1b5

    :catchall_1b1
    move-exception v0

    :try_start_1b2
    invoke-virtual {v3, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    :cond_1b5
    :goto_1b5
    throw v3

    .end local v12    # "input":Ljava/io/InputStream;
    .end local v18    # "length":Ljava/lang/String;
    .restart local v3    # "length":Ljava/lang/String;
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :cond_1b6
    move-object/from16 v18, v3

    .line 167
    .end local v3    # "length":Ljava/lang/String;
    .end local v9    # "count":J
    :cond_1b8
    :goto_1b8
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_1bb
    .catch Ljava/io/IOException; {:try_start_1b2 .. :try_end_1bb} :catch_1f4
    .catchall {:try_start_1b2 .. :try_end_1bb} :catchall_1f2

    .line 174
    if-eqz v6, :cond_1c0

    invoke-direct {v1, v6}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    .line 167
    :cond_1c0
    return-void

    .line 135
    .end local v8    # "playlist":Z
    .end local v15    # "type":Ljava/lang/String;
    .local v12, "playlist":Z
    :cond_1c1
    :goto_1c1
    :try_start_1c1
    const-string v0, "Location"

    invoke-virtual {v6, v0}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 136
    .local v0, "location":Ljava/lang/String;
    const/4 v3, 0x5

    if-ge v7, v3, :cond_1df

    if-eqz v0, :cond_1df

    .line 137
    new-instance v3, Ljava/net/URL;

    invoke-direct {v3, v5, v0}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    .local v3, "next":Ljava/net/URL;
    invoke-static {v3}, Le/e/a/CastHls;->validate(Ljava/net/URL;)V

    .line 138
    invoke-direct {v1, v6}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    const/4 v6, 0x0

    move-object v5, v3

    .line 114
    .end local v0    # "location":Ljava/lang/String;
    .end local v3    # "next":Ljava/net/URL;
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v12    # "playlist":Z
    .end local v13    # "status":I
    add-int/lit8 v7, v7, 0x1

    move-object/from16 v3, p4

    goto/16 :goto_d

    .line 136
    .restart local v0    # "location":Ljava/lang/String;
    .restart local v11    # "cookie":Ljava/lang/String;
    .restart local v12    # "playlist":Z
    .restart local v13    # "status":I
    :cond_1df
    new-instance v3, Ljava/io/IOException;

    const-string v8, "Cast redirect failed"

    invoke-direct {v3, v8}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    throw v3
    :try_end_1e7
    .catch Ljava/io/IOException; {:try_start_1c1 .. :try_end_1e7} :catch_1f4
    .catchall {:try_start_1c1 .. :try_end_1e7} :catchall_1f2

    .line 118
    .end local v0    # "location":Ljava/lang/String;
    .end local v11    # "cookie":Ljava/lang/String;
    .end local v12    # "playlist":Z
    .end local v13    # "status":I
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :cond_1e7
    :try_start_1e7
    new-instance v0, Ljava/io/IOException;

    const-string v3, "Cast session closed"

    invoke-direct {v0, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local v7    # "redirect":I
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    throw v0

    .line 120
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local v7    # "redirect":I
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :catchall_1ef
    move-exception v0

    monitor-exit p0
    :try_end_1f1
    .catchall {:try_start_1e7 .. :try_end_1f1} :catchall_1ef

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    :try_start_1f1
    throw v0
    :try_end_1f2
    .catch Ljava/io/IOException; {:try_start_1f1 .. :try_end_1f2} :catch_1f4
    .catchall {:try_start_1f1 .. :try_end_1f2} :catchall_1f2

    .line 174
    .end local v7    # "redirect":I
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :catchall_1f2
    move-exception v0

    goto :goto_20a

    .line 169
    :catch_1f4
    move-exception v0

    .line 171
    .local v0, "error":Ljava/io/IOException;
    :goto_1f5
    :try_start_1f5
    invoke-static {v0}, Le/e/a/CastRelay;->failed(Ljava/lang/Throwable;)V

    .line 172
    if-nez v4, :cond_208

    const/16 v3, 0x1f6

    const-wide/16 v7, 0x0

    const/4 v9, 0x0

    # invokes: Le/e/a/CastRelay;->response(Ljava/io/OutputStream;ILjava/lang/String;J)V
    invoke-static {v2, v3, v9, v7, v8}, Le/e/a/CastRelay;->access$200(Ljava/io/OutputStream;ILjava/lang/String;J)V
    :try_end_202
    .catchall {:try_start_1f5 .. :try_end_202} :catchall_1f2

    .line 174
    .end local v0    # "error":Ljava/io/IOException;
    if-eqz v6, :cond_207

    invoke-direct {v1, v6}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    .line 175
    :cond_207
    return-void

    .line 173
    .restart local v0    # "error":Ljava/io/IOException;
    :cond_208
    nop

    .end local v4    # "responded":Z
    .end local v5    # "url":Ljava/net/URL;
    .end local v6    # "connection":Ljava/net/HttpURLConnection;
    .end local p1    # "out":Ljava/io/BufferedOutputStream;
    .end local p3    # "head":Z
    .end local p4    # "range":Ljava/lang/String;
    :try_start_209
    throw v0
    :try_end_20a
    .catchall {:try_start_209 .. :try_end_20a} :catchall_1f2

    .line 174
    .end local v0    # "error":Ljava/io/IOException;
    .restart local v4    # "responded":Z
    .restart local v5    # "url":Ljava/net/URL;
    .restart local v6    # "connection":Ljava/net/HttpURLConnection;
    .restart local p1    # "out":Ljava/io/BufferedOutputStream;
    .restart local p3    # "head":Z
    .restart local p4    # "range":Ljava/lang/String;
    :goto_20a
    if-eqz v6, :cond_20f

    invoke-direct {v1, v6}, Le/e/a/CastRelay$Session;->release(Ljava/net/HttpURLConnection;)V

    :cond_20f
    throw v0
.end method
