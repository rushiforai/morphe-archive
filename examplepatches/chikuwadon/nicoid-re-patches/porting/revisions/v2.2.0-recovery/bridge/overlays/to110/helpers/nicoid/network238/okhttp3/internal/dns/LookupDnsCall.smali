.class public final Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Dns$Call;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000H\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u0008\u0007\u0018\u00002\u00020\u00012\u00020\u0002:\u0001\u0019B\u001f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0008\u00a2\u0006\u0004\u0008\t\u0010\nJ\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u0013H\u0016J\u0008\u0010\u0014\u001a\u00020\u0011H\u0016J\u0008\u0010\u0015\u001a\u00020\u0016H\u0016J\u0008\u0010\u0017\u001a\u00020\u0018H\u0016R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0005\u001a\u00020\u0006X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0007\u001a\u00020\u0008X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u0014\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u000f0\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "delegate",
        "Lnicoid/network238/okhttp3/Dns;",
        "request",
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns;Lnicoid/network238/okhttp3/Dns$Request;)V",
        "getRequest",
        "()Lnicoid/network238/okhttp3/Dns$Request;",
        "state",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;",
        "enqueue",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "cancel",
        "isCanceled",
        "",
        "runOnce",
        "",
        "State",
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
.field private final delegate:Lnicoid/network238/okhttp3/Dns;

.field private final request:Lnicoid/network238/okhttp3/Dns$Request;

.field private final state:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;",
            ">;"
        }
    .end annotation
.end field

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns;Lnicoid/network238/okhttp3/Dns$Request;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 41
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p3}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " dns"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 36
    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;Z)V

    .line 38
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 39
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->delegate:Lnicoid/network238/okhttp3/Dns;

    .line 40
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->request:Lnicoid/network238/okhttp3/Dns$Request;

    .line 43
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object p2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method static final cancel$lambda$0(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    instance-of v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    if-nez v0, :cond_0

    sget-object v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method static final enqueue$lambda$0(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    instance-of p0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;

    return p0
.end method

.method static final runOnce$lambda$0(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    instance-of p0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    return p0
.end method

.method static final runOnce$lambda$2(Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 71
    instance-of p0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    return p0
.end method


# virtual methods
.method public cancel()V
    .registers 4

    .line 55
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Canceled;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Canceled;

    new-instance v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$3;

    invoke-direct {v2}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$3;-><init>()V

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->testAndSet(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;

    .line 56
    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-eqz v0, :cond_1

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v0

    if-eqz v0, :cond_1

    new-instance v1, Ljava/io/IOException;

    const-string v2, "canceled"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, p0, v1}, Lnicoid/network238/okhttp3/Dns$Callback;->onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V

    :cond_1
    return-void
.end method

.method public enqueue(Lnicoid/network238/okhttp3/Dns$Callback;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    invoke-direct {v1, p1}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;-><init>(Lnicoid/network238/okhttp3/Dns$Callback;)V

    new-instance v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$0;

    invoke-direct {v2}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$0;-><init>()V

    invoke-static {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->testAndSet(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;

    .line 48
    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Idle;

    if-eqz v1, :cond_0

    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v0

    const/4 v4, 0x2

    const/4 v5, 0x0

    const-wide/16 v2, 0x0

    move-object v1, p0

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->schedule$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Lnicoid/network238/okhttp3/internal/concurrent/Task;JILjava/lang/Object;)V

    return-void

    .line 49
    :cond_0
    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    if-nez v1, :cond_2

    sget-object v1, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_2

    .line 50
    sget-object v1, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Canceled;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Canceled;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    new-instance v0, Ljava/io/IOException;

    const-string v1, "canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {p1, p0, v0}, Lnicoid/network238/okhttp3/Dns$Callback;->onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V

    return-void

    .line 47
    :cond_1
    new-instance p1, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;

    invoke-direct {p1}, Lnicoid/network238/kotlin/NoWhenBranchMatchedException;-><init>()V

    throw p1

    .line 49
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "already enqueued"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getRequest()Lnicoid/network238/okhttp3/Dns$Request;
    .registers 2

    .line 40
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->request:Lnicoid/network238/okhttp3/Dns$Request;

    return-object v0
.end method

.method public isCanceled()Z
    .registers 2

    .line 59
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Canceled;

    return v0
.end method

.method public runOnce()J
    .registers 8

    .line 63
    const/4 v0, 0x0

    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->delegate:Lnicoid/network238/okhttp3/Dns;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v2

    invoke-interface {v1, v2}, Lnicoid/network238/okhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    .line 64
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v3, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;

    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$1;

    invoke-direct {v4}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$1;-><init>()V

    invoke-static {v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->testAndSet(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;

    .line 65
    instance-of v3, v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    if-eqz v3, :cond_0

    check-cast v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    goto :goto_0

    :cond_0
    move-object v2, v0

    :goto_0
    if-eqz v2, :cond_3

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v2

    if-eqz v2, :cond_3

    .line 93
    new-instance v3, Ljava/util/ArrayList;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/ArrayList;-><init>(I)V

    .line 94
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 95
    check-cast v4, Ljava/net/InetAddress;

    .line 68
    new-instance v5, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v6

    invoke-direct {v5, v6, v4}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;-><init>(Ljava/lang/String;Ljava/net/InetAddress;)V

    .line 95
    invoke-interface {v3, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 65
    :cond_1
    const/4 v1, 0x1

    invoke-interface {v2, p0, v1, v3}, Lnicoid/network238/okhttp3/Dns$Callback;->onRecords(Lnicoid/network238/okhttp3/Dns$Call;ZLjava/util/List;)V
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_2

    :catch_0
    move-exception v1

    .line 71
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v3, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;->INSTANCE:Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Complete;

    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$2;

    invoke-direct {v4}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$2;-><init>()V

    invoke-static {v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->testAndSet(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State;

    .line 72
    instance-of v3, v2, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    if-eqz v3, :cond_2

    move-object v0, v2

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;

    :cond_2
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v0

    if-eqz v0, :cond_3

    invoke-interface {v0, p0, v1}, Lnicoid/network238/okhttp3/Dns$Callback;->onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V

    :cond_3
    :goto_2
    const-wide/16 v0, -0x1

    return-wide v0
.end method
