.class final Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/dns/DnsQuery;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/android/AndroidDns;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AndroidQuery"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0082\u0004\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0010\u0010\u000c\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\u001b\u0010\r\u001a\u00020\u000e2\u000c\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010H\u0002\u00a2\u0006\u0002\u0010\u0012J\u0010\u0010\u0013\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0003J\u0008\u0010\u0014\u001a\u00020\tH\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0015"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "question",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "<init>",
        "(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)V",
        "cancellationSignal",
        "Landroid/os/CancellationSignal;",
        "enqueue",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;",
        "resolveAddresses",
        "response",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "addresses",
        "",
        "Ljava/net/InetAddress;",
        "([Ljava/net/InetAddress;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "queryServiceMetadata",
        "cancel",
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
.field private final cancellationSignal:Landroid/os/CancellationSignal;

.field private final question:Lnicoid/network238/okhttp3/internal/dns/Question;

.field final synthetic this$0:Lnicoid/network238/okhttp3/android/AndroidDns;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/dns/Question;",
            ")V"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 139
    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 140
    iput-object p2, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 143
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/dns/Question;->getType()I

    move-result p1

    const/16 p2, 0x41

    if-ne p1, p2, :cond_0

    new-instance p1, Landroid/os/CancellationSignal;

    invoke-direct {p1}, Landroid/os/CancellationSignal;-><init>()V

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->cancellationSignal:Landroid/os/CancellationSignal;

    return-void
.end method

.method private final queryServiceMetadata(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 12

    .line 208
    new-instance v8, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;

    invoke-direct {v8, p1}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$queryServiceMetadata$dnsResolverCallback$1;-><init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    .line 229
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/android/AndroidDns;->getDnsResolver$okhttp()Landroid/net/DnsResolver;

    move-result-object v0

    .line 230
    iget-object v1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/android/AndroidDns;->getNetwork$okhttp()Landroid/net/Network;

    move-result-object v1

    .line 231
    iget-object v2, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v2

    .line 235
    iget-object v3, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/android/AndroidDns;->getExecutor$okhttp()Ljava/util/concurrent/Executor;

    move-result-object v6

    .line 236
    iget-object v7, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->cancellationSignal:Landroid/os/CancellationSignal;

    .line 229
    const/4 v3, 0x1

    const/16 v4, 0x41

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v8}, Landroid/net/DnsResolver;->rawQuery(Landroid/net/Network;Ljava/lang/String;IIILjava/util/concurrent/Executor;Landroid/os/CancellationSignal;Landroid/net/DnsResolver$Callback;)V
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 242
    iget-object v1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    # getter for: Lnicoid/network238/okhttp3/android/AndroidDns;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    invoke-static {v1}, Lnicoid/network238/okhttp3/android/AndroidDns;->access$getTaskRunner$p(Lnicoid/network238/okhttp3/android/AndroidDns;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v3, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " dns"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$1;

    invoke-direct {v7, p1, v0}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$1;-><init>(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;Ljava/lang/SecurityException;)V

    const/4 v8, 0x2

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method static final queryServiceMetadata$lambda$0(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;Ljava/lang/SecurityException;)Lnicoid/network238/kotlin/Unit;
    .registers 3

    .line 243
    new-instance v0, Ljava/io/IOException;

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/Throwable;)V

    invoke-interface {p0, v0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    .line 244
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private final resolveAddresses(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 11

    .line 163
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    # getter for: Lnicoid/network238/okhttp3/android/AndroidDns;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    invoke-static {v0}, Lnicoid/network238/okhttp3/android/AndroidDns;->access$getTaskRunner$p(Lnicoid/network238/okhttp3/android/AndroidDns;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v2, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " dns"

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->this$0:Lnicoid/network238/okhttp3/android/AndroidDns;

    new-instance v6, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$0;

    invoke-direct {v6, v0, p0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery$0;-><init>(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    const/4 v7, 0x2

    const/4 v8, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    invoke-static/range {v1 .. v8}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void
.end method

.method static final resolveAddresses$lambda$0(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)Lnicoid/network238/kotlin/Unit;
    .registers 4

    .line 166
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/android/AndroidDns;->getNetwork$okhttp()Landroid/net/Network;

    move-result-object p0

    if-eqz p0, :cond_0

    iget-object v0, p1, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/net/Network;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object p0

    if-eqz p0, :cond_0

    goto :goto_0

    .line 167
    :cond_0
    iget-object p0, p1, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/net/InetAddress;->getAllByName(Ljava/lang/String;)[Ljava/net/InetAddress;

    move-result-object p0

    .line 168
    :goto_0
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, p0}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->response([Ljava/net/InetAddress;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p0

    invoke-interface {p2, p0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onResponse(Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception p0

    .line 170
    invoke-interface {p2, p0}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;->onFailure(Ljava/io/IOException;)V

    .line 172
    :goto_1
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private final response([Ljava/net/InetAddress;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;
    .registers 11

    .line 180
    sget-object v0, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->Companion:Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;

    .line 181
    iget-object v1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    .line 259
    new-instance v3, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v3, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 260
    array-length v1, p1

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v5, v1, :cond_0

    aget-object v6, p1, v5

    .line 184
    new-instance v7, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    .line 185
    iget-object v8, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/internal/dns/Question;->getName()Ljava/lang/String;

    move-result-object v8

    .line 184
    invoke-direct {v7, v8, v4, v6}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;-><init>(Ljava/lang/String;ILjava/net/InetAddress;)V

    .line 261
    invoke-interface {v3, v7}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    :cond_0
    nop

    .line 180
    const/4 v1, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;->response$default(Lnicoid/network238/okhttp3/internal/dns/DnsMessage$Companion;SLjava/util/List;Ljava/util/List;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/dns/DnsMessage;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public cancel()V
    .registers 2

    .line 254
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->cancellationSignal:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_0

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    :cond_0
    return-void
.end method

.method public enqueue(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V
    .registers 4

    .line 152
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 146
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/Question;->getType()I

    move-result v0

    const/4 v1, 0x1

    if-eq v0, v1, :cond_1

    const/16 v1, 0x41

    if-ne v0, v1, :cond_0

    .line 149
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->queryServiceMetadata(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    return-void

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 152
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected query type "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->question:Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/dns/Question;->getType()I

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 147
    :cond_1
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;->resolveAddresses(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    return-void
.end method
