.class public Lio/agora/utils2/HttpRequest;
.super Ljava/lang/Object;


# instance fields
.field private headers:Ljava/util/HashMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashMap<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private httpProxy:Ljava/net/Proxy;

.field private httpTask:Lio/agora/utils2/HttpAsyncTask;


# direct methods
.method public constructor <init>(JLjava/lang/String;I)V
    .locals 3
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/utils2/HttpRequest;->httpTask:Lio/agora/utils2/HttpAsyncTask;

    iput-object v0, p0, Lio/agora/utils2/HttpRequest;->httpProxy:Ljava/net/Proxy;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lio/agora/utils2/HttpRequest;->headers:Ljava/util/HashMap;

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    new-instance v0, Ljava/net/Proxy;

    sget-object v1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    new-instance v2, Ljava/net/InetSocketAddress;

    invoke-direct {v2, p3, p4}, Ljava/net/InetSocketAddress;-><init>(Ljava/lang/String;I)V

    invoke-direct {v0, v1, v2}, Ljava/net/Proxy;-><init>(Ljava/net/Proxy$Type;Ljava/net/SocketAddress;)V

    iput-object v0, p0, Lio/agora/utils2/HttpRequest;->httpProxy:Ljava/net/Proxy;

    :cond_0
    new-instance p3, Lio/agora/utils2/HttpAsyncTask;

    invoke-direct {p3, p1, p2}, Lio/agora/utils2/HttpAsyncTask;-><init>(J)V

    iput-object p3, p0, Lio/agora/utils2/HttpRequest;->httpTask:Lio/agora/utils2/HttpAsyncTask;

    return-void
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/utils2/HttpRequest;->headers:Ljava/util/HashMap;

    invoke-virtual {p0, p1, p2}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method

.method public send(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;[BI)Z
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    new-instance v0, Lio/agora/utils2/HttpAsyncTaskParam;

    invoke-direct {v0}, Lio/agora/utils2/HttpAsyncTaskParam;-><init>()V

    iput-object p1, v0, Lio/agora/utils2/HttpAsyncTaskParam;->fullUrl:Ljava/lang/String;

    iput-object p2, v0, Lio/agora/utils2/HttpAsyncTaskParam;->method:Ljava/lang/String;

    iput-object p3, v0, Lio/agora/utils2/HttpAsyncTaskParam;->user:Ljava/lang/String;

    iput-object p4, v0, Lio/agora/utils2/HttpAsyncTaskParam;->pass:Ljava/lang/String;

    iput-object p5, v0, Lio/agora/utils2/HttpAsyncTaskParam;->agent:Ljava/lang/String;

    iput-object p6, v0, Lio/agora/utils2/HttpAsyncTaskParam;->body:[B

    iget-object p1, p0, Lio/agora/utils2/HttpRequest;->httpProxy:Ljava/net/Proxy;

    iput-object p1, v0, Lio/agora/utils2/HttpAsyncTaskParam;->httpProxy:Ljava/net/Proxy;

    iget-object p1, p0, Lio/agora/utils2/HttpRequest;->headers:Ljava/util/HashMap;

    iput-object p1, v0, Lio/agora/utils2/HttpAsyncTaskParam;->headers:Ljava/util/HashMap;

    iput p7, v0, Lio/agora/utils2/HttpAsyncTaskParam;->timeout_millsec:I

    iget-object p0, p0, Lio/agora/utils2/HttpRequest;->httpTask:Lio/agora/utils2/HttpAsyncTask;

    filled-new-array {v0}, [Lio/agora/utils2/HttpAsyncTaskParam;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/os/AsyncTask;->execute([Ljava/lang/Object;)Landroid/os/AsyncTask;

    const/4 p0, 0x1

    return p0
.end method
