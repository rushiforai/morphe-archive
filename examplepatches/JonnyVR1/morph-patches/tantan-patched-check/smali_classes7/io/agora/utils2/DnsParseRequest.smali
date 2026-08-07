.class Lio/agora/utils2/DnsParseRequest;
.super Ljava/lang/Object;


# instance fields
.field private parseThread:Ljava/lang/Thread;


# direct methods
.method public constructor <init>()V
    .locals 1
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/utils2/DnsParseRequest;->parseThread:Ljava/lang/Thread;

    return-void
.end method

.method public static synthetic access$000(JZLjava/lang/Object;J)V
    .locals 0

    invoke-static/range {p0 .. p5}, Lio/agora/utils2/DnsParseRequest;->nativeResolveDoneCallback(JZLjava/lang/Object;J)V

    return-void
.end method

.method private static native nativeResolveDoneCallback(JZLjava/lang/Object;J)V
.end method


# virtual methods
.method public makeRequest(JLjava/lang/String;)Z
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-virtual {p3}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    :cond_0
    iget-object v0, p0, Lio/agora/utils2/DnsParseRequest;->parseThread:Ljava/lang/Thread;

    if-eqz v0, :cond_1

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    :cond_1
    new-instance v0, Ljava/lang/Thread;

    new-instance v1, Lio/agora/utils2/DnsParseRequest$1;

    invoke-direct {v1, p0, p3, p1, p2}, Lio/agora/utils2/DnsParseRequest$1;-><init>(Lio/agora/utils2/DnsParseRequest;Ljava/lang/String;J)V

    invoke-direct {v0, v1}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;)V

    iput-object v0, p0, Lio/agora/utils2/DnsParseRequest;->parseThread:Ljava/lang/Thread;

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    const/4 p0, 0x1

    return p0
.end method
