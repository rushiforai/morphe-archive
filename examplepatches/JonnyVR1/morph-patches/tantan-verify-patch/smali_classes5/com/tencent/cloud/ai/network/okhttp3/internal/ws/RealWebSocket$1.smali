.class public Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tencent/cloud/ai/network/okhttp3/Callback;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->connect(Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

.field public final synthetic b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;


# direct methods
.method public constructor <init>(Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;Lcom/tencent/cloud/ai/network/okhttp3/Request;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public onFailure(Lcom/tencent/cloud/ai/network/okhttp3/Call;Ljava/io/IOException;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    invoke-virtual {p0, p2, p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onResponse(Lcom/tencent/cloud/ai/network/okhttp3/Call;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V
    .locals 7

    .line 1
    const-string p1, "OkHttp WebSocket "

    .line 2
    .line 3
    sget-object v0, Lcom/tencent/cloud/ai/network/okhttp3/internal/a;->a:Lcom/tencent/cloud/ai/network/okhttp3/internal/a;

    .line 4
    .line 5
    check-cast v0, Lcom/tencent/cloud/ai/network/okhttp3/OkHttpClient$a;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    iget-object v1, p2, Lcom/tencent/cloud/ai/network/okhttp3/Response;->m:Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;

    .line 11
    .line 12
    :try_start_0
    iget-object v0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 13
    .line 14
    invoke-virtual {v0, p2, v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->a(Lcom/tencent/cloud/ai/network/okhttp3/Response;Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a()Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;

    .line 18
    .line 19
    .line 20
    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 21
    :try_start_1
    new-instance v1, Ljava/lang/StringBuilder;

    .line 22
    .line 23
    invoke-direct {v1, p1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->a:Lcom/tencent/cloud/ai/network/okhttp3/Request;

    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/Request;->url()Lcom/tencent/cloud/ai/network/okhttp3/p;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/p;->f()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iget-object v1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 44
    .line 45
    invoke-virtual {v1, p1, v0}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->initReaderAndWriter(Ljava/lang/String;Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$Streams;)V

    .line 46
    .line 47
    .line 48
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 49
    .line 50
    iget-object v0, p1, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->b:Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;

    .line 51
    .line 52
    invoke-virtual {v0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/WebSocketListener;->onOpen(Lcom/tencent/cloud/ai/network/okhttp3/WebSocket;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 56
    .line 57
    invoke-virtual {p1}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->loopReader()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :catch_0
    move-exception v0

    .line 62
    move-object p1, v0

    .line 63
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 64
    .line 65
    const/4 p2, 0x0

    .line 66
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 67
    .line 68
    .line 69
    return-void

    .line 70
    :catch_1
    move-exception v0

    .line 71
    move-object p1, v0

    .line 72
    if-eqz v1, :cond_0

    .line 73
    .line 74
    const/4 v5, 0x1

    .line 75
    const/4 v6, 0x0

    .line 76
    const-wide/16 v2, -0x1

    .line 77
    .line 78
    const/4 v4, 0x1

    .line 79
    invoke-virtual/range {v1 .. v6}, Lcom/tencent/cloud/ai/network/okhttp3/internal/connection/b;->a(JZZLjava/io/IOException;)Ljava/io/IOException;

    .line 80
    .line 81
    .line 82
    :cond_0
    iget-object p0, p0, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket$1;->b:Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;

    .line 83
    .line 84
    invoke-virtual {p0, p1, p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/ws/RealWebSocket;->failWebSocket(Ljava/lang/Exception;Lcom/tencent/cloud/ai/network/okhttp3/Response;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p2}, Lcom/tencent/cloud/ai/network/okhttp3/internal/c;->a(Ljava/io/Closeable;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
