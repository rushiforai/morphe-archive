.class Le/e/a/NicoliveSession$1$1;
.super Lnicoid/network238/okhttp3/WebSocketListener;
.source "NicoliveSession.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession$1;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Le/e/a/NicoliveSession$1;

.field private final synthetic val$token:I


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession$1;I)V
    .registers 3

    .line 28
    iput-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    iput p2, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-direct {p0}, Lnicoid/network238/okhttp3/WebSocketListener;-><init>()V

    return-void
.end method


# virtual methods
.method public onClosed(Lnicoid/network238/okhttp3/WebSocket;ILjava/lang/String;)V
    .registers 4

    .line 32
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p3, "closed gen="

    invoke-direct {p1, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p3, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p3, " code="

    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SOCKET"

    invoke-static {p2, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p1}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p1

    iget p2, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result p1

    if-eqz p1, :cond_0

    iget-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p1}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p1

    iget p0, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p0}, Le/e/a/NicoliveSession;->failed(I)V

    :cond_0
    return-void
.end method

.method public onFailure(Lnicoid/network238/okhttp3/WebSocket;Ljava/lang/Throwable;Lnicoid/network238/okhttp3/Response;)V
    .registers 5

    .line 31
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "failure gen="

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v0, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, " error="

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p2, :cond_0

    const-string p2, "unknown"

    goto :goto_0

    :cond_0
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object p2

    :goto_0
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p2, " http="

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    if-nez p3, :cond_1

    const/4 p2, -0x1

    goto :goto_1

    :cond_1
    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result p2

    :goto_1
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    const-string p2, "SOCKET"

    invoke-static {p2, p1}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    iget-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p1}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p1

    iget p2, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result p1

    if-eqz p1, :cond_2

    iget-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p1}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p1

    iget p0, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p0}, Le/e/a/NicoliveSession;->failed(I)V

    :cond_2
    return-void
.end method

.method public onMessage(Lnicoid/network238/okhttp3/WebSocket;Ljava/lang/String;)V
    .registers 5

    .line 30
    iget-object v0, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {v0}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object v0

    iget v1, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {v0}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object v0

    new-instance v1, Lorg/json/JSONObject;

    invoke-direct {v1, p2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    iget p2, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {v0, p1, v1, p2}, Le/e/a/NicoliveSession;->message(Lnicoid/network238/okhttp3/WebSocket;Lorg/json/JSONObject;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    iget-object p0, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p0}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p0

    iget-object p0, p0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string p1, "\u53d7\u4fe1\u60c5\u5831\u3092\u51e6\u7406\u3067\u304d\u307e\u305b\u3093\u3067\u3057\u305f"

    const/4 p2, 0x0

    invoke-interface {p0, p1, p2}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    return-void
.end method

.method public onOpen(Lnicoid/network238/okhttp3/WebSocket;Lnicoid/network238/okhttp3/Response;)V
    .registers 9

    .line 29
    const-string p2, "protocol"

    iget-object v0, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {v0}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object v0

    iget v1, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-interface {p1}, Lnicoid/network238/okhttp3/WebSocket;->cancel()V

    return-void

    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "opened gen="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "SOCKET"

    invoke-static {v1, v0}, Le/e/a/NicoliveDiagnostics;->record(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "reconnect"

    const/4 v2, 0x0

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "room"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "webSocket"

    invoke-virtual {v3, p2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v3

    const-string v4, "commentable"

    const/4 v5, 0x1

    invoke-virtual {v3, v4, v5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "stream"

    new-instance v3, Lorg/json/JSONObject;

    invoke-direct {v3}, Lorg/json/JSONObject;-><init>()V

    const-string v4, "hls"

    invoke-virtual {v3, p2, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "quality"

    iget-object v4, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {v4}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object v4

    iget-object v4, v4, Le/e/a/NicoliveSession;->preferred:Ljava/lang/String;

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "latency"

    const-string v4, "high"

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    const-string v3, "chasePlay"

    iget-object v4, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {v4}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object v4

    invoke-static {v4}, Le/e/a/LiveResumePosition;->chase(Le/e/a/NicoliveSession;)Z

    move-result v4

    invoke-virtual {p2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    move-result-object p2

    const-string v2, "accessRightMethod"

    const-string v3, "single_cookie"

    invoke-virtual {p2, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    new-instance v0, Lorg/json/JSONObject;

    invoke-direct {v0}, Lorg/json/JSONObject;-><init>()V

    const-string v1, "type"

    const-string v2, "startWatching"

    invoke-virtual {v0, v1, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {v0, v1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object p2

    invoke-virtual {p2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-interface {p1, p2}, Lnicoid/network238/okhttp3/WebSocket;->send(Ljava/lang/String;)Z
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    iget-object p1, p0, Le/e/a/NicoliveSession$1$1;->this$1:Le/e/a/NicoliveSession$1;

    # getter for: Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;
    invoke-static {p1}, Le/e/a/NicoliveSession$1;->access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;

    move-result-object p1

    iget p0, p0, Le/e/a/NicoliveSession$1$1;->val$token:I

    invoke-virtual {p1, p0}, Le/e/a/NicoliveSession;->failed(I)V

    return-void
.end method
