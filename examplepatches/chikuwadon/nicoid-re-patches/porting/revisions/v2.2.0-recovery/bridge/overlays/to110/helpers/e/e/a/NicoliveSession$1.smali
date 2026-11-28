.class Le/e/a/NicoliveSession$1;
.super Ljava/lang/Object;
.source "NicoliveSession.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Le/e/a/NicoliveSession;->connect()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation


# instance fields
.field final synthetic this$0:Le/e/a/NicoliveSession;

.field private final synthetic val$retired:Ljava/util/concurrent/Future;

.field private final synthetic val$token:I


# direct methods
.method constructor <init>(Le/e/a/NicoliveSession;Ljava/util/concurrent/Future;I)V
    .registers 4

    .line 22
    iput-object p1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iput-object p2, p0, Le/e/a/NicoliveSession$1;->val$retired:Ljava/util/concurrent/Future;

    iput p3, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$0(Le/e/a/NicoliveSession$1;)Le/e/a/NicoliveSession;
    .registers 1

    .line 22
    iget-object p0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    return-object p0
.end method


# virtual methods
.method public run()V
    .registers 7

    .line 23
    :try_start_0
    iget-object v0, p0, Le/e/a/NicoliveSession$1;->val$retired:Ljava/util/concurrent/Future;

    if-eqz v0, :cond_0

    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const-wide/16 v2, 0xf

    invoke-interface {v0, v2, v3, v1}, Ljava/util/concurrent/Future;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    :cond_0
    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget v1, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "https://live.nicovideo.jp/watch/"

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v2, v2, Le/e/a/NicoliveSession;->id:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    iget v2, p0, Le/e/a/NicoliveSession$1;->val$token:I

    const/high16 v3, 0x200000

    invoke-virtual {v0, v1, v3, v2}, Le/e/a/NicoliveSession;->getText(Ljava/lang/String;II)Ljava/lang/String;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->id:Ljava/lang/String;

    invoke-static {v0, v1}, Le/e/a/NicoliveData$Program;->watch(Ljava/lang/String;Ljava/lang/String;)Le/e/a/NicoliveData$Program;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget v2, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-virtual {v1, v2}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v1

    if-eqz v1, :cond_7

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iput-object v0, v1, Le/e/a/NicoliveSession;->program:Le/e/a/NicoliveData$Program;

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    invoke-interface {v1, v0}, Le/e/a/NicoliveSession$Listener;->program(Le/e/a/NicoliveData$Program;)V

    .line 24
    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->ended()Z

    move-result v1

    const/4 v2, 0x1

    if-eqz v1, :cond_1

    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v0, v0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string/jumbo v1, "\u653e\u9001\u306f\u7d42\u4e86\u3057\u307e\u3057\u305f"

    invoke-interface {v0, v1, v2}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    return-void

    .line 25
    :cond_1
    iget-boolean v1, v0, Le/e/a/NicoliveData$Program;->canWatch:Z

    if-nez v1, :cond_3

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v1, v1, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    iget-boolean v0, v0, Le/e/a/NicoliveData$Program;->loggedIn:Z

    if-eqz v0, :cond_2

    const-string v0, "\u3053\u306e\u756a\u7d44\u306e\u8996\u8074\u6761\u4ef6\u3092\u78ba\u8a8d\u3057\u3066\u304f\u3060\u3055\u3044"

    goto :goto_0

    :cond_2
    const-string v0, "\u3053\u306e\u756a\u7d44\u306e\u8996\u8074\u306b\u306f\u30ed\u30b0\u30a4\u30f3\u304c\u5fc5\u8981\u3067\u3059"

    :goto_0
    invoke-interface {v1, v0, v2}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    return-void

    .line 26
    :cond_3
    invoke-virtual {v0}, Le/e/a/NicoliveData$Program;->onAir()Z

    move-result v1

    if-nez v1, :cond_4

    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v0, v0, Le/e/a/NicoliveSession;->listener:Le/e/a/NicoliveSession$Listener;

    const-string/jumbo v1, "\u958b\u6f14\u524d\u3067\u3059"

    invoke-interface {v0, v1, v2}, Le/e/a/NicoliveSession$Listener;->status(Ljava/lang/String;Z)V

    return-void

    .line 27
    :cond_4
    iget-object v1, v0, Le/e/a/NicoliveData$Program;->socket:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-eqz v1, :cond_6

    .line 28
    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v0, v0, Le/e/a/NicoliveData$Program;->socket:Ljava/lang/String;

    invoke-virtual {v1, v0, v2}, Le/e/a/NicoliveSession;->request(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    iget-object v1, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    monitor-enter v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    :try_start_1
    iget-object v2, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget v3, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-virtual {v2, v3}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v2

    if-eqz v2, :cond_5

    iget-object v2, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget-object v3, v2, Le/e/a/NicoliveSession;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    new-instance v4, Le/e/a/NicoliveSession$1$1;

    iget v5, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-direct {v4, p0, v5}, Le/e/a/NicoliveSession$1$1;-><init>(Le/e/a/NicoliveSession$1;I)V

    invoke-virtual {v3, v0, v4}, Lnicoid/network238/okhttp3/OkHttpClient;->newWebSocket(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/WebSocketListener;)Lnicoid/network238/okhttp3/WebSocket;

    move-result-object v0

    iput-object v0, v2, Le/e/a/NicoliveSession;->socket:Lnicoid/network238/okhttp3/WebSocket;

    :cond_5
    monitor-exit v1

    return-void

    :goto_1
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :try_start_2
    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 27
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "SESSION_MISSING"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 34
    :catch_0
    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget v1, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-virtual {v0, v1}, Le/e/a/NicoliveSession;->active(I)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-object v0, p0, Le/e/a/NicoliveSession$1;->this$0:Le/e/a/NicoliveSession;

    iget p0, p0, Le/e/a/NicoliveSession$1;->val$token:I

    invoke-virtual {v0, p0}, Le/e/a/NicoliveSession;->failed(I)V

    :cond_7
    return-void
.end method
