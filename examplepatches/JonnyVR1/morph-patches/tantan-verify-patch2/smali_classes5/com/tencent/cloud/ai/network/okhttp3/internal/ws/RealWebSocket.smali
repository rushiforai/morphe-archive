.class public final Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;
.implements Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$CancelRunnable;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;,
        Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$PingRunnable;
    }
.end annotation


# static fields
.field public static final x:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/tencent/cloud/ai/network/okhttp3/q;",
            ">;"
        }
    .end annotation
.end field

.field public static final synthetic y:Z = true


# instance fields
.field public final a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public final b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

.field public final c:Ljava/util/Random;

.field public final d:J

.field public final e:Ljava/lang/String;

.field public f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

.field public final g:Ljava/lang/Runnable;

.field public h:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;

.field public i:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

.field public j:Ljava/util/concurrent/ScheduledExecutorService;

.field public k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

.field public final l:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Lcom/tencent/cloud/ai/network/okio/ByteString;",
            ">;"
        }
    .end annotation
.end field

.field public final m:Ljava/util/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/ArrayDeque<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public n:J

.field public o:Z

.field public p:Ljava/util/concurrent/ScheduledFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ScheduledFuture<",
            "*>;"
        }
    .end annotation
.end field

.field public q:I

.field public r:Ljava/lang/String;

.field public s:Z

.field public t:I

.field public u:I

.field public v:I

.field public w:Z


# direct methods
.method public static constructor <clinit>()V
    .locals 1

    .line 1
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/q;->c:Lcom/tencent/cloud/ai/network/okhttp3/q;

    .line 2
    .line 3
    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->x:Ljava/util/List;

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/Request;Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;Ljava/util/Random;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/ArrayDeque;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->l:Ljava/util/ArrayDeque;

    .line 10
    .line 11
    new-instance v0, Ljava/util/ArrayDeque;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/ArrayDeque;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 17
    .line 18
    const/4 v0, -0x1

    .line 19
    iput v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->q:I

    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const-string v1, "GET"

    .line 26
    .line 27
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    if-eqz v0, :cond_0

    .line 32
    .line 33
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 34
    .line 35
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 36
    .line 37
    iput-object p3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->c:Ljava/util/Random;

    .line 38
    .line 39
    iput-wide p4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->d:J

    .line 40
    .line 41
    const/16 p1, 0x10

    .line 42
    .line 43
    new-array p1, p1, [B

    .line 44
    .line 45
    invoke-virtual {p3, p1}, Ljava/util/Random;->nextBytes([B)V

    .line 46
    .line 47
    .line 48
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->of([B)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->base64()Ljava/lang/String;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->e:Ljava/lang/String;

    .line 57
    .line 58
    new-instance p1, Ll/hnc0;

    .line 59
    .line 60
    invoke-direct {p1, p0}, Ll/hnc0;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->g:Ljava/lang/Runnable;

    .line 64
    .line 65
    return-void

    .line 66
    :cond_0
    const-string p0, "Request must be GET: "

    .line 67
    .line 68
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->method()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-static {p0, p1}, Ll/yg3;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    const/4 p0, 0x0

    .line 76
    throw p0
.end method

.method private synthetic a()V
    .locals 2

    .line 144
    :goto_0
    :try_start_0
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->c()Z

    move-result v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    return-void

    :catch_0
    move-exception v0

    const/4 v1, 0x0

    .line 145
    invoke-virtual {p0, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    return-void
.end method

.method public static synthetic a(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V
    .locals 0

    .line 146
    invoke-direct {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a()V

    return-void
.end method


# virtual methods
.method public a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V
    .locals 3

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x65

    .line 6
    .line 7
    if-ne v0, v1, :cond_4

    .line 8
    .line 9
    const-string v0, "Connection"

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "Upgrade"

    .line 16
    .line 17
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_3

    .line 22
    .line 23
    invoke-virtual {p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "websocket"

    .line 28
    .line 29
    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 30
    .line 31
    .line 32
    move-result v1

    .line 33
    if-eqz v1, :cond_2

    .line 34
    .line 35
    const-string v0, "Sec-WebSocket-Accept"

    .line 36
    .line 37
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    .line 42
    .line 43
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->e:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    const-string p0, "258EAFA5-E914-47DA-95CA-C5AB0DC85B11"

    .line 52
    .line 53
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->sha1()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okio/ByteString;->base64()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    if-eqz v0, :cond_1

    .line 77
    .line 78
    if-eqz p2, :cond_0

    .line 79
    .line 80
    return-void

    .line 81
    :cond_0
    const-string p0, "Web Socket exchange missing: bad interceptor?"

    .line 82
    .line 83
    invoke-static {p0}, Ll/e7b0;->a(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_1
    invoke-static {p0, p1}, Ll/fnc0;->a(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 88
    .line 89
    .line 90
    return-void

    .line 91
    :cond_2
    const-string p0, "Expected \'Upgrade\' header value \'websocket\' but was \'"

    .line 92
    .line 93
    invoke-static {p0, v0}, Ll/gnc0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    return-void

    .line 97
    :cond_3
    const-string p0, "Expected \'Connection\' header value \'Upgrade\' but was \'"

    .line 98
    .line 99
    invoke-static {p0, v0}, Ll/gnc0;->a(Ljava/lang/String;Ljava/lang/Object;)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_4
    new-instance p0, Ljava/net/ProtocolException;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->code()I

    .line 106
    .line 107
    .line 108
    move-result p2

    .line 109
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Response;->message()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    new-instance v0, Ljava/lang/StringBuilder;

    .line 114
    .line 115
    const-string v1, "Expected HTTP 101 response but was \'"

    .line 116
    .line 117
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    const-string p2, " "

    .line 124
    .line 125
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 129
    .line 130
    .line 131
    const-string p1, "\'"

    .line 132
    .line 133
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 134
    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object p1

    .line 140
    invoke-direct {p0, p1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 141
    .line 142
    .line 143
    throw p0
.end method

.method public final declared-synchronized a(Lcom/tencent/cloud/ai/network/okio/ByteString;I)Z
    .locals 6

    monitor-enter p0

    .line 147
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    const/4 v1, 0x0

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->o:Z

    if-eqz v0, :cond_0

    goto :goto_0

    .line 148
    :cond_0
    iget-wide v2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v0

    int-to-long v4, v0

    add-long/2addr v2, v4

    const-wide/32 v4, 0x1000000

    cmp-long v0, v2, v4

    if-lez v0, :cond_1

    const/16 p1, 0x3e9

    const/4 p2, 0x0

    .line 149
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 150
    :cond_1
    :try_start_1
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J

    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J

    .line 151
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;

    invoke-direct {v1, p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;-><init>(ILcom/tencent/cloud/ai/network/okio/ByteString;)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 152
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    const/4 p0, 0x1

    return p0

    :cond_2
    :goto_0
    monitor-exit p0

    return v1

    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method

.method public final b()V
    .locals 1

    .line 1
    sget-boolean v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->y:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-static {}, Ll/aqg0;->a()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->g:Ljava/lang/Runnable;

    .line 21
    .line 22
    invoke-interface {v0, p0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    return-void
.end method

.method public c()Z
    .locals 13

    .line 1
    const-string v0, "write message size: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-boolean v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    .line 5
    .line 6
    const/4 v2, 0x0

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return v2

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto/16 :goto_4

    .line 13
    .line 14
    :cond_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 15
    .line 16
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->l:Ljava/util/ArrayDeque;

    .line 17
    .line 18
    invoke-virtual {v3}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    check-cast v3, Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 23
    .line 24
    const/4 v4, 0x0

    .line 25
    const/4 v5, -0x1

    .line 26
    if-nez v3, :cond_4

    .line 27
    .line 28
    iget-object v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 29
    .line 30
    invoke-virtual {v6}, Ljava/util/ArrayDeque;->poll()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v6

    .line 34
    instance-of v7, v6, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;

    .line 35
    .line 36
    if-eqz v7, :cond_2

    .line 37
    .line 38
    iget v7, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->q:I

    .line 39
    .line 40
    iget-object v8, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->r:Ljava/lang/String;

    .line 41
    .line 42
    if-eq v7, v5, :cond_1

    .line 43
    .line 44
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 45
    .line 46
    iput-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 47
    .line 48
    iget-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 49
    .line 50
    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 51
    .line 52
    .line 53
    :goto_0
    move-object v4, v6

    .line 54
    goto :goto_1

    .line 55
    :cond_1
    iget-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 56
    .line 57
    new-instance v9, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$CancelRunnable;

    .line 58
    .line 59
    invoke-direct {v9, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$CancelRunnable;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V

    .line 60
    .line 61
    .line 62
    move-object v10, v6

    .line 63
    check-cast v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;

    .line 64
    .line 65
    iget-wide v10, v10, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->c:J

    .line 66
    .line 67
    sget-object v12, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 68
    .line 69
    invoke-interface {v5, v9, v10, v11, v12}, Ljava/util/concurrent/ScheduledExecutorService;->schedule(Ljava/lang/Runnable;JLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 70
    .line 71
    .line 72
    move-result-object v5

    .line 73
    iput-object v5, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->p:Ljava/util/concurrent/ScheduledFuture;

    .line 74
    .line 75
    move-object v5, v4

    .line 76
    goto :goto_0

    .line 77
    :cond_2
    if-nez v6, :cond_3

    .line 78
    .line 79
    monitor-exit p0

    .line 80
    return v2

    .line 81
    :cond_3
    move-object v8, v4

    .line 82
    move v7, v5

    .line 83
    move-object v5, v8

    .line 84
    goto :goto_0

    .line 85
    :cond_4
    move-object v8, v4

    .line 86
    move v7, v5

    .line 87
    move-object v5, v8

    .line 88
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    const/4 v6, 0x1

    .line 90
    if-eqz v3, :cond_5

    .line 91
    .line 92
    const/16 p0, 0xa

    .line 93
    .line 94
    :try_start_1
    invoke-virtual {v1, p0, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->b(ILcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 95
    .line 96
    .line 97
    goto/16 :goto_2

    .line 98
    .line 99
    :catchall_1
    move-exception p0

    .line 100
    goto/16 :goto_3

    .line 101
    .line 102
    :cond_5
    instance-of v3, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;

    .line 103
    .line 104
    if-eqz v3, :cond_9

    .line 105
    .line 106
    move-object v3, v4

    .line 107
    check-cast v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;

    .line 108
    .line 109
    iget-object v3, v3, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 110
    .line 111
    if-eqz v3, :cond_6

    .line 112
    .line 113
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 114
    .line 115
    .line 116
    move-result-object v7

    .line 117
    new-instance v8, Ljava/lang/StringBuilder;

    .line 118
    .line 119
    invoke-direct {v8, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    invoke-virtual {v8, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {v7, v0}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logDebug(Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    :cond_6
    check-cast v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;

    .line 137
    .line 138
    iget v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Message;->a:I

    .line 139
    .line 140
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 141
    .line 142
    .line 143
    move-result v4

    .line 144
    int-to-long v7, v4

    .line 145
    iget-boolean v4, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->h:Z

    .line 146
    .line 147
    if-nez v4, :cond_8

    .line 148
    .line 149
    iput-boolean v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->h:Z

    .line 150
    .line 151
    iget-object v1, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->g:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;

    .line 152
    .line 153
    iput v0, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->a:I

    .line 154
    .line 155
    iput-wide v7, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->b:J

    .line 156
    .line 157
    iput-boolean v6, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->c:Z

    .line 158
    .line 159
    iput-boolean v2, v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter$FrameSink;->d:Z

    .line 160
    .line 161
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okio/n;->a(Lcom/tencent/cloud/ai/network/okio/v;)Lcom/tencent/cloud/ai/network/okio/f;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    move-object v1, v0

    .line 166
    check-cast v1, Lcom/tencent/cloud/ai/network/okio/q;

    .line 167
    .line 168
    iget-boolean v2, v1, Lcom/tencent/cloud/ai/network/okio/q;->c:Z

    .line 169
    .line 170
    if-nez v2, :cond_7

    .line 171
    .line 172
    iget-object v2, v1, Lcom/tencent/cloud/ai/network/okio/q;->a:Lcom/tencent/cloud/ai/network/okio/e;

    .line 173
    .line 174
    invoke-virtual {v2, v3}, Lcom/tencent/cloud/ai/network/okio/e;->b(Lcom/tencent/cloud/ai/network/okio/ByteString;)Lcom/tencent/cloud/ai/network/okio/e;

    .line 175
    .line 176
    .line 177
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/q;->f()Lcom/tencent/cloud/ai/network/okio/f;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 178
    .line 179
    .line 180
    check-cast v0, Lcom/tencent/cloud/ai/network/okio/q;

    .line 181
    .line 182
    :try_start_2
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/q;->close()V

    .line 183
    .line 184
    .line 185
    monitor-enter p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 186
    :try_start_3
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J

    .line 187
    .line 188
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 189
    .line 190
    .line 191
    move-result v2

    .line 192
    int-to-long v2, v2

    .line 193
    sub-long/2addr v0, v2

    .line 194
    iput-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J

    .line 195
    .line 196
    monitor-exit p0

    .line 197
    goto :goto_2

    .line 198
    :catchall_2
    move-exception v0

    .line 199
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 200
    :try_start_4
    throw v0

    .line 201
    :cond_7
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 202
    .line 203
    const-string v0, "closed"

    .line 204
    .line 205
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 206
    .line 207
    .line 208
    throw p0

    .line 209
    :cond_8
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 210
    .line 211
    const-string v0, "Another message writer is active. Did you call close()?"

    .line 212
    .line 213
    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 214
    .line 215
    .line 216
    throw p0

    .line 217
    :cond_9
    instance-of v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;

    .line 218
    .line 219
    if-eqz v0, :cond_b

    .line 220
    .line 221
    check-cast v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;

    .line 222
    .line 223
    iget v0, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->a:I

    .line 224
    .line 225
    iget-object v2, v4, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;->b:Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 226
    .line 227
    invoke-virtual {v1, v0, v2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;->a(ILcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 228
    .line 229
    .line 230
    if-eqz v5, :cond_a

    .line 231
    .line 232
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 233
    .line 234
    invoke-virtual {v0, p0, v7, v8}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onClosed(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;ILjava/lang/String;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 235
    .line 236
    .line 237
    :cond_a
    :goto_2
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 238
    .line 239
    .line 240
    return v6

    .line 241
    :cond_b
    :try_start_5
    new-instance p0, Ljava/lang/AssertionError;

    .line 242
    .line 243
    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    .line 244
    .line 245
    .line 246
    throw p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 247
    :goto_3
    invoke-static {v5}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 248
    .line 249
    .line 250
    throw p0

    .line 251
    :goto_4
    :try_start_6
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 252
    throw v0
.end method

.method public cancel()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/tencent/cloud/ai/network/okhttp3/Call;->cancel()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public close(ILjava/lang/String;)Z
    .locals 6

    .line 1
    const-string v0, "reason.size() > 123: "

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(I)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    if-nez v1, :cond_4

    .line 9
    .line 10
    if-eqz p2, :cond_1

    .line 11
    .line 12
    invoke-static {p2}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    .line 17
    .line 18
    .line 19
    move-result v2

    .line 20
    int-to-long v2, v2

    .line 21
    const-wide/16 v4, 0x7b

    .line 22
    .line 23
    cmp-long v2, v2, v4

    .line 24
    .line 25
    if-gtz v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 29
    .line 30
    invoke-virtual {v0, p2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw p1

    .line 38
    :catchall_0
    move-exception p1

    .line 39
    goto :goto_2

    .line 40
    :cond_1
    const/4 v1, 0x0

    .line 41
    :goto_0
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    .line 42
    .line 43
    if-nez p2, :cond_3

    .line 44
    .line 45
    iget-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->o:Z

    .line 46
    .line 47
    if-eqz p2, :cond_2

    .line 48
    .line 49
    goto :goto_1

    .line 50
    :cond_2
    const/4 p2, 0x1

    .line 51
    iput-boolean p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->o:Z

    .line 52
    .line 53
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 54
    .line 55
    new-instance v2, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;

    .line 56
    .line 57
    const-wide/32 v3, 0xea60

    .line 58
    .line 59
    .line 60
    invoke-direct {v2, p1, v1, v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Close;-><init>(ILcom/tencent/cloud/ai/network/okio/ByteString;J)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {v0, v2}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return p2

    .line 71
    :cond_3
    :goto_1
    monitor-exit p0

    .line 72
    const/4 p0, 0x0

    .line 73
    return p0

    .line 74
    :cond_4
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    .line 75
    .line 76
    invoke-direct {p1, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    :goto_2
    monitor-exit p0

    .line 81
    throw p1
.end method

.method public connect(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/m;->a:Lcom/tencent/cloud/ai/network/okhttp3/m;

    .line 6
    .line 7
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->eventListener(Lcom/tencent/cloud/ai/network/okhttp3/m;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->x:Ljava/util/List;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->protocols(Ljava/util/List;)Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->newBuilder()Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "websocket"

    .line 28
    .line 29
    const-string v2, "Upgrade"

    .line 30
    .line 31
    invoke-virtual {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    const-string v1, "Connection"

    .line 36
    .line 37
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->e:Ljava/lang/String;

    .line 42
    .line 43
    const-string v2, "Sec-WebSocket-Key"

    .line 44
    .line 45
    invoke-virtual {v0, v2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    const-string v1, "Sec-WebSocket-Version"

    .line 50
    .line 51
    const-string v2, "13"

    .line 52
    .line 53
    invoke-virtual {v0, v1, v2}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request$Builder;->build()Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    new-instance v2, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string v3, "real connect web socket: "

    .line 68
    .line 69
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 73
    .line 74
    .line 75
    move-result-object v3

    .line 76
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    invoke-virtual {v1, v2}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logInfo(Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    sget-object v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 87
    .line 88
    check-cast v1, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 89
    .line 90
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 91
    .line 92
    .line 93
    const/4 v1, 0x1

    .line 94
    invoke-static {p1, v0, v1}, Lcom/tencent/cloud/ai/network/okhttp3/r;->a(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;Lcom/tencent/cloud/ai/network/okhttp3/Request;Z)Lcom/tencent/cloud/ai/network/okhttp3/r;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->f:Lcom/tencent/cloud/ai/network/okhttp3/Call;

    .line 99
    .line 100
    new-instance v1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;

    .line 101
    .line 102
    invoke-direct {v1, p0, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;Lcom/tencent/cloud/ai/network/okhttp3/Request;)V

    .line 103
    .line 104
    .line 105
    invoke-interface {p1, v1}, Lcom/tencent/cloud/ai/network/okhttp3/Call;->enqueue(Lcom/tencent/cloud/ai/network/okhttp3/Callback;)V

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public failWebSocket(Ljava/lang/Exception;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception p1

    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    .line 12
    .line 13
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 17
    .line 18
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->p:Ljava/util/concurrent/ScheduledFuture;

    .line 19
    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    const/4 v2, 0x0

    .line 23
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 24
    .line 25
    .line 26
    :cond_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 27
    .line 28
    if-eqz v1, :cond_2

    .line 29
    .line 30
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 31
    .line 32
    .line 33
    :cond_2
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :try_start_1
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 35
    .line 36
    invoke-virtual {v1, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onFailure(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;Ljava/lang/Throwable;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 37
    .line 38
    .line 39
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :catchall_1
    move-exception p0

    .line 44
    invoke-static {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 45
    .line 46
    .line 47
    throw p0

    .line 48
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    throw p1
.end method

.method public initReaderAndWriter(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;)V
    .locals 11

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 3
    .line 4
    new-instance v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 5
    .line 6
    iget-boolean v1, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->client:Z

    .line 7
    .line 8
    iget-object v2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->sink:Lcom/tencent/cloud/ai/network/okio/f;

    .line 9
    .line 10
    iget-object v3, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->c:Ljava/util/Random;

    .line 11
    .line 12
    invoke-direct {v0, v1, v2, v3}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;-><init>(ZLcom/tencent/cloud/ai/network/okio/f;Ljava/util/Random;)V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->i:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketWriter;

    .line 16
    .line 17
    new-instance v4, Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    invoke-static {p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    const/4 v0, 0x1

    .line 25
    invoke-direct {v4, v0, p1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;-><init>(ILjava/util/concurrent/ThreadFactory;)V

    .line 26
    .line 27
    .line 28
    iput-object v4, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 29
    .line 30
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->d:J

    .line 31
    .line 32
    const-wide/16 v2, 0x0

    .line 33
    .line 34
    cmp-long p1, v0, v2

    .line 35
    .line 36
    if-eqz p1, :cond_0

    .line 37
    .line 38
    new-instance v5, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$PingRunnable;

    .line 39
    .line 40
    invoke-direct {v5, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$PingRunnable;-><init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;)V

    .line 41
    .line 42
    .line 43
    iget-wide v6, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->d:J

    .line 44
    .line 45
    sget-object v10, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 46
    .line 47
    move-wide v8, v6

    .line 48
    invoke-interface/range {v4 .. v10}, Ljava/util/concurrent/ScheduledExecutorService;->scheduleAtFixedRate(Ljava/lang/Runnable;JJLjava/util/concurrent/TimeUnit;)Ljava/util/concurrent/ScheduledFuture;

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    move-object p1, v0

    .line 54
    goto :goto_1

    .line 55
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b()V

    .line 64
    .line 65
    .line 66
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 67
    new-instance p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;

    .line 68
    .line 69
    iget-boolean v0, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->client:Z

    .line 70
    .line 71
    iget-object p2, p2, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;->source:Lcom/tencent/cloud/ai/network/okio/g;

    .line 72
    .line 73
    invoke-direct {p1, v0, p2, p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;-><init>(ZLcom/tencent/cloud/ai/network/okio/g;Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;)V

    .line 74
    .line 75
    .line 76
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;

    .line 77
    .line 78
    return-void

    .line 79
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p1
.end method

.method public loopReader()V
    .locals 8

    .line 1
    :goto_0
    iget v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->q:I

    .line 2
    .line 3
    const/4 v1, -0x1

    .line 4
    if-ne v0, v1, :cond_a

    .line 5
    .line 6
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->h:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b()V

    .line 9
    .line 10
    .line 11
    iget-boolean v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->h:Z

    .line 12
    .line 13
    if-eqz v1, :cond_0

    .line 14
    .line 15
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a()V

    .line 16
    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget v1, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 20
    .line 21
    const/4 v2, 0x1

    .line 22
    if-eq v1, v2, :cond_2

    .line 23
    .line 24
    const/4 v3, 0x2

    .line 25
    if-ne v1, v3, :cond_1

    .line 26
    .line 27
    goto :goto_1

    .line 28
    :cond_1
    new-instance p0, Ljava/net/ProtocolException;

    .line 29
    .line 30
    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    new-instance v1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "Unknown opcode: "

    .line 37
    .line 38
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    throw p0

    .line 52
    :cond_2
    :goto_1
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->d:Z

    .line 53
    .line 54
    if-nez v3, :cond_9

    .line 55
    .line 56
    iget-wide v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 57
    .line 58
    const-wide/16 v5, 0x0

    .line 59
    .line 60
    cmp-long v5, v3, v5

    .line 61
    .line 62
    if-lez v5, :cond_3

    .line 63
    .line 64
    iget-object v5, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b:Lcom/tencent/cloud/ai/network/okio/g;

    .line 65
    .line 66
    iget-object v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 67
    .line 68
    invoke-interface {v5, v6, v3, v4}, Lcom/tencent/cloud/ai/network/okio/g;->b(Lcom/tencent/cloud/ai/network/okio/e;J)V

    .line 69
    .line 70
    .line 71
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a:Z

    .line 72
    .line 73
    if-nez v3, :cond_3

    .line 74
    .line 75
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 76
    .line 77
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 78
    .line 79
    invoke-virtual {v3, v4}, Lcom/tencent/cloud/ai/network/okio/e;->a(Lcom/tencent/cloud/ai/network/okio/e$b;)Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 80
    .line 81
    .line 82
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 83
    .line 84
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 85
    .line 86
    iget-wide v4, v4, Lcom/tencent/cloud/ai/network/okio/e;->b:J

    .line 87
    .line 88
    iget-wide v6, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->f:J

    .line 89
    .line 90
    sub-long/2addr v4, v6

    .line 91
    invoke-virtual {v3, v4, v5}, Lcom/tencent/cloud/ai/network/okio/e$b;->h(J)I

    .line 92
    .line 93
    .line 94
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 95
    .line 96
    iget-object v4, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->k:[B

    .line 97
    .line 98
    invoke-static {v3, v4}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketProtocol;->a(Lcom/tencent/cloud/ai/network/okio/e$b;[B)V

    .line 99
    .line 100
    .line 101
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->l:Lcom/tencent/cloud/ai/network/okio/e$b;

    .line 102
    .line 103
    invoke-virtual {v3}, Lcom/tencent/cloud/ai/network/okio/e$b;->close()V

    .line 104
    .line 105
    .line 106
    :cond_3
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->g:Z

    .line 107
    .line 108
    if-eqz v3, :cond_5

    .line 109
    .line 110
    iget-object v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->c:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;

    .line 111
    .line 112
    if-ne v1, v2, :cond_4

    .line 113
    .line 114
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 115
    .line 116
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->n()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-interface {v3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_4
    iget-object v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->j:Lcom/tencent/cloud/ai/network/okio/e;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okio/e;->m()Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-interface {v3, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader$FrameCallback;->onReadMessage(Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    .line 131
    .line 132
    .line 133
    goto/16 :goto_0

    .line 134
    .line 135
    :cond_5
    :goto_2
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->d:Z

    .line 136
    .line 137
    if-nez v3, :cond_7

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->b()V

    .line 140
    .line 141
    .line 142
    iget-boolean v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->h:Z

    .line 143
    .line 144
    if-nez v3, :cond_6

    .line 145
    .line 146
    goto :goto_3

    .line 147
    :cond_6
    invoke-virtual {v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->a()V

    .line 148
    .line 149
    .line 150
    goto :goto_2

    .line 151
    :cond_7
    :goto_3
    iget v3, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 152
    .line 153
    if-nez v3, :cond_8

    .line 154
    .line 155
    goto :goto_1

    .line 156
    :cond_8
    new-instance p0, Ljava/net/ProtocolException;

    .line 157
    .line 158
    iget v0, v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/WebSocketReader;->e:I

    .line 159
    .line 160
    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    new-instance v1, Ljava/lang/StringBuilder;

    .line 165
    .line 166
    const-string v2, "Expected continuation opcode. Got: "

    .line 167
    .line 168
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 172
    .line 173
    .line 174
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-direct {p0, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    throw p0

    .line 182
    :cond_9
    const-string p0, "closed"

    .line 183
    .line 184
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    :cond_a
    return-void
.end method

.method public onReadClose(ILjava/lang/String;)V
    .locals 3

    .line 1
    const/4 v0, -0x1

    .line 2
    if-eq p1, v0, :cond_4

    .line 3
    .line 4
    monitor-enter p0

    .line 5
    :try_start_0
    iget v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->q:I

    .line 6
    .line 7
    if-ne v1, v0, :cond_3

    .line 8
    .line 9
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->q:I

    .line 10
    .line 11
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->r:Ljava/lang/String;

    .line 12
    .line 13
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->o:Z

    .line 14
    .line 15
    const/4 v1, 0x0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 27
    .line 28
    iput-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->k:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 29
    .line 30
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->p:Ljava/util/concurrent/ScheduledFuture;

    .line 31
    .line 32
    if-eqz v1, :cond_0

    .line 33
    .line 34
    const/4 v2, 0x0

    .line 35
    invoke-interface {v1, v2}, Ljava/util/concurrent/Future;->cancel(Z)Z

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :catchall_0
    move-exception p1

    .line 40
    goto :goto_3

    .line 41
    :cond_0
    :goto_0
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->j:Ljava/util/concurrent/ScheduledExecutorService;

    .line 42
    .line 43
    invoke-interface {v1}, Ljava/util/concurrent/ExecutorService;->shutdown()V

    .line 44
    .line 45
    .line 46
    move-object v1, v0

    .line 47
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 48
    :try_start_1
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 49
    .line 50
    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onClosing(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz v1, :cond_2

    .line 54
    .line 55
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 56
    .line 57
    invoke-virtual {v0, p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onClosed(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;ILjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 58
    .line 59
    .line 60
    goto :goto_1

    .line 61
    :catchall_1
    move-exception p0

    .line 62
    goto :goto_2

    .line 63
    :cond_2
    :goto_1
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :goto_2
    invoke-static {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 68
    .line 69
    .line 70
    throw p0

    .line 71
    :cond_3
    :try_start_2
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 72
    .line 73
    const-string p2, "already closed"

    .line 74
    .line 75
    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 76
    .line 77
    .line 78
    throw p1

    .line 79
    :goto_3
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 80
    throw p1

    .line 81
    :cond_4
    invoke-static {}, Ll/fig0;->a()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public onReadMessage(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 3

    .line 33
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "real web socket bytes receive message: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 34
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 35
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logDebug(Ljava/lang/String;)V

    .line 36
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onMessage(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;Lcom/tencent/cloud/ai/network/okio/ByteString;)V

    return-void
.end method

.method public onReadMessage(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->getInstance()Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "real web socket receive message: "

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Ljava/lang/String;->getBytes()[B

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    array-length v2, v2

    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Lcom/tencent/cloud/ai/network/helper/AiOkHttpHelper;->logDebug(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 28
    .line 29
    invoke-virtual {v0, p0, p1}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onMessage(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public declared-synchronized onReadPing(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->s:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->o:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->m:Ljava/util/ArrayDeque;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/ArrayDeque;->isEmpty()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception p1

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->l:Ljava/util/ArrayDeque;

    .line 22
    .line 23
    invoke-virtual {v0, p1}, Ljava/util/ArrayDeque;->add(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b()V

    .line 27
    .line 28
    .line 29
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->u:I

    .line 30
    .line 31
    add-int/lit8 p1, p1, 0x1

    .line 32
    .line 33
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->u:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    monitor-exit p0

    .line 36
    return-void

    .line 37
    :cond_1
    :goto_0
    monitor-exit p0

    .line 38
    return-void

    .line 39
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p1
.end method

.method public declared-synchronized onReadPong(Lcom/tencent/cloud/ai/network/okio/ByteString;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->v:I

    .line 3
    .line 4
    add-int/lit8 p1, p1, 0x1

    .line 5
    .line 6
    iput p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->v:I

    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-boolean p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->w:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    throw p1
.end method

.method public declared-synchronized queueSize()J
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->n:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-wide v0

    .line 6
    :catchall_0
    move-exception v0

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw v0
.end method

.method public request()Lcom/tencent/cloud/ai/network/okhttp3/Request;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 2
    .line 3
    return-object p0
.end method

.method public send(Lcom/tencent/cloud/ai/network/okio/ByteString;)Z
    .locals 1

    if-eqz p1, :cond_0

    const/4 v0, 0x2

    .line 20
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;I)Z

    move-result p0

    return p0

    .line 21
    :cond_0
    const-string p0, "bytes == null"

    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public send(Ljava/lang/String;)Z
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tencent/cloud/ai/network/okio/ByteString;->encodeUtf8(Ljava/lang/String;)Lcom/tencent/cloud/ai/network/okio/ByteString;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a(Lcom/tencent/cloud/ai/network/okio/ByteString;I)Z

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    return p0

    .line 13
    :cond_0
    const-string p0, "text == null"

    .line 14
    .line 15
    invoke-static {p0}, Ll/mnd0;->a(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method
