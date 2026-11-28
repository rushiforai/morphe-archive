.class public final Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->connect(Lnicoid/network238/okhttp3/OkHttpClient;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0018\u0010\u0008\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\t\u001a\u00020\nH\u0016\u00a8\u0006\u000b"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1",
        "Lnicoid/network238/okhttp3/Callback;",
        "onResponse",
        "",
        "call",
        "Lnicoid/network238/okhttp3/Call;",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "onFailure",
        "e",
        "Ljava/io/IOException;",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field final synthetic $request:Lnicoid/network238/okhttp3/Request;

.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/Request;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->$request:Lnicoid/network238/okhttp3/Request;

    .line 170
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public onFailure(Lnicoid/network238/okhttp3/Call;Ljava/io/IOException;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 211
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    const/4 v4, 0x6

    const/4 v5, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    move-object v1, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    return-void
.end method

.method public onResponse(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/Response;)V
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 177
    :try_start_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->checkUpgradeSuccess$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okio/Socket;

    move-result-object p1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 188
    sget-object v0, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;->Companion:Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions$Companion;->parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;

    move-result-object v0

    .line 189
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    invoke-static {v1, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->access$setExtensions$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)V

    .line 190
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    # invokes: Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->isValid(Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)Z
    invoke-static {v1, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->access$isValid(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Lnicoid/network238/okhttp3/internal/ws/WebSocketExtensions;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 191
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    monitor-enter v1

    .line 192
    :try_start_1
    # getter for: Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->messageAndCloseQueue:Ljava/util/ArrayDeque;
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->access$getMessageAndCloseQueue$p(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;)Ljava/util/ArrayDeque;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayDeque;->clear()V

    .line 193
    const-string v0, "unexpected Sec-WebSocket-Extensions in response header"

    const/16 v2, 0x3f2

    invoke-virtual {v1, v2, v0}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->close(ILjava/lang/String;)Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 191
    monitor-exit v1

    goto :goto_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    monitor-exit v1

    throw p1

    .line 198
    :cond_0
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " WebSocket "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->$request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/HttpUrl;->redact()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 199
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    .line 201
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;->asBufferedSocket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p1

    .line 199
    const/4 v2, 0x1

    invoke-virtual {v1, v0, p1, v2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->initReaderAndWriter(Ljava/lang/String;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;Z)V

    .line 204
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->loopReader(Lnicoid/network238/okhttp3/Response;)V

    return-void

    :catch_0
    move-exception v0

    move-object p1, v0

    move-object v1, p1

    .line 179
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket$connect$1;->this$0:Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;

    const/4 v4, 0x4

    const/4 v5, 0x0

    const/4 v3, 0x0

    move-object v2, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;->failWebSocket$default(Lnicoid/network238/okhttp3/internal/ws/RealWebSocket;Ljava/lang/Exception;Lnicoid/network238/okhttp3/Response;ZILjava/lang/Object;)V

    .line 180
    invoke-static {v2}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 181
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->socket()Lnicoid/network238/okio/Socket;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->getSink()Lnicoid/network238/okio/Sink;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    .line 182
    :cond_1
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->socket()Lnicoid/network238/okio/Socket;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-interface {p1}, Lnicoid/network238/okio/Socket;->getSource()Lnicoid/network238/okio/Source;

    move-result-object p1

    if-eqz p1, :cond_2

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->closeQuietly(Ljava/io/Closeable;)V

    :cond_2
    return-void
.end method
