.class public final Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Dns$Call;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000b\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001:\u0001%B/\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\t\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0008\u0010\u0012\u001a\u00020\tH\u0016J\u0010\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\u0008\u0010\u0017\u001a\u00020\u0014H\u0016J \u0010\u0018\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u001eH\u0002J;\u0010\u0018\u001a\u00020\u00142\n\u0008\u0002\u0010\u001b\u001a\u0004\u0018\u00010\u001c2\u000e\u0008\u0002\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020!0 2\n\u0008\u0002\u0010\"\u001a\u0004\u0018\u00010#2\u0008\u0008\u0002\u0010$\u001a\u00020\tH\u0082\u0010R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0096\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u000eR\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u0010X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006&"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "request",
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "queryFactory",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
        "includeIPv6",
        "",
        "includeServiceMetadata",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns$Request;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;ZZ)V",
        "getRequest",
        "()Lnicoid/network238/okhttp3/Dns$Request;",
        "state",
        "Ljava/util/concurrent/atomic/AtomicReference;",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;",
        "isCanceled",
        "enqueue",
        "",
        "callback",
        "Lnicoid/network238/okhttp3/Dns$Callback;",
        "cancel",
        "updateStateAndCallCallbacks",
        "question",
        "Lnicoid/network238/okhttp3/internal/dns/Question;",
        "completedQuery",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
        "dnsResponse",
        "Lnicoid/network238/okhttp3/internal/dns/DnsMessage;",
        "newRecords",
        "",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "newException",
        "Ljava/io/IOException;",
        "lockHeldByThisThread",
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
.field private final includeIPv6:Z

.field private final includeServiceMetadata:Z

.field private final queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

.field private final request:Lnicoid/network238/okhttp3/Dns$Request;

.field private final state:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;",
            ">;"
        }
    .end annotation
.end field

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns$Request;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;ZZ)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 58
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->request:Lnicoid/network238/okhttp3/Dns$Request;

    .line 59
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    .line 60
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->includeIPv6:Z

    .line 61
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->includeServiceMetadata:Z

    .line 63
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    new-instance p2, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;

    const/4 p3, 0x1

    const/4 p4, 0x0

    const/4 p5, 0x0

    invoke-direct {p2, p5, p3, p4}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;-><init>(ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-direct {p1, p2}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    return-void
.end method

.method public static final synthetic access$updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 4

    .line 55
    invoke-direct {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V

    return-void
.end method

.method static final enqueue$lambda$1(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;)Lnicoid/network238/kotlin/Unit;
    .registers 4

    .line 102
    new-instance v0, Ljava/io/IOException;

    const-string v1, "canceled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    invoke-interface {p0, p1, v0}, Lnicoid/network238/okhttp3/Dns$Callback;->onFailure(Lnicoid/network238/okhttp3/Dns$Call;Ljava/io/IOException;)V

    .line 103
    sget-object p0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p0
.end method

.method private final updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;Z)V
    .registers 23
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/internal/dns/DnsQuery;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;",
            "Ljava/io/IOException;",
            "Z)V"
        }
    .end annotation

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move-object/from16 v3, p3

    move/from16 v4, p4

    .line 245
    :cond_0
    :goto_0
    iget-object v5, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v5}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v5

    instance-of v6, v5, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    const/4 v7, 0x0

    if-eqz v6, :cond_1

    check-cast v5, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    goto :goto_1

    :cond_1
    move-object v5, v7

    :goto_1
    if-eqz v5, :cond_8

    if-eqz v1, :cond_2

    .line 250
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getRunningQueries()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->minus(Ljava/lang/Iterable;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    move-object v12, v6

    goto :goto_2

    .line 251
    :cond_2
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getRunningQueries()Ljava/util/List;

    move-result-object v6

    move-object v12, v6

    :goto_2
    if-eqz v3, :cond_3

    .line 256
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getPendingExceptions()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, v3}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    move-object v14, v6

    goto :goto_3

    .line 257
    :cond_3
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getPendingExceptions()Ljava/util/List;

    move-result-object v6

    move-object v14, v6

    .line 262
    :goto_3
    invoke-interface {v2}, Ljava/util/Collection;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_4

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getPendingRecords()Ljava/util/List;

    move-result-object v6

    invoke-static {v6, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v6

    move-object v13, v6

    goto :goto_4

    .line 263
    :cond_4
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getPendingRecords()Ljava/util/List;

    move-result-object v6

    move-object v13, v6

    .line 266
    :goto_4
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v6

    const/4 v15, 0x0

    const/16 v16, 0x1

    if-nez v4, :cond_5

    .line 267
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getLockHeld()Z

    move-result v8

    if-eqz v8, :cond_5

    move/from16 v11, v16

    goto :goto_5

    :cond_5
    move v11, v15

    :goto_5
    if-nez v6, :cond_6

    .line 273
    invoke-interface {v13}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-nez v8, :cond_7

    :cond_6
    if-eqz v11, :cond_9

    .line 276
    :cond_7
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCanceled()Z

    move-result v9

    .line 277
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v10

    .line 275
    new-instance v8, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    invoke-direct/range {v8 .. v14}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;-><init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 283
    iget-object v6, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v6, v5, v8}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    :cond_8
    return-void

    :cond_9
    if-eqz v6, :cond_a

    .line 291
    new-instance v8, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCanceled()Z

    move-result v9

    invoke-direct {v8, v9}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;-><init>(Z)V

    move-object/from16 p1, v13

    goto :goto_6

    .line 296
    :cond_a
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCanceled()Z

    move-result v9

    .line 297
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v10

    .line 300
    move-object v8, v13

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v13

    .line 295
    move-object v11, v8

    new-instance v8, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    move-object/from16 v17, v11

    const/4 v11, 0x1

    move-object/from16 p1, v17

    invoke-direct/range {v8 .. v14}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;-><init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;)V

    .line 305
    :goto_6
    iget-object v9, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v9, v5, v8}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_0

    if-eqz v6, :cond_b

    .line 307
    invoke-interface {v14}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    move/from16 v15, v16

    goto :goto_7

    :cond_b
    nop

    .line 308
    :goto_7
    invoke-interface/range {p1 .. p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_c

    if-nez v15, :cond_c

    goto :goto_8

    .line 309
    :cond_c
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v1

    move-object/from16 v13, p1

    invoke-interface {v1, v0, v15, v13}, Lnicoid/network238/okhttp3/Dns$Callback;->onRecords(Lnicoid/network238/okhttp3/Dns$Call;ZLjava/util/List;)V

    :goto_8
    if-eqz v6, :cond_d

    .line 316
    invoke-interface {v14}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_d

    .line 317
    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getCallback()Lnicoid/network238/okhttp3/Dns$Callback;

    move-result-object v1

    invoke-static {v1, v0, v14}, Lnicoid/network238/okhttp3/internal/dns/_StateMachineDnsCallKt;->onFailure(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/Dns$Call;Ljava/util/List;)V

    .line 239
    :cond_d
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object v2

    move-object v1, v7

    move-object v3, v1

    move/from16 v4, v16

    goto/16 :goto_0
.end method

.method private final updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Lnicoid/network238/okhttp3/internal/dns/DnsMessage;)V
    .registers 22

    .line 170
    :try_start_0
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getResponseCode()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x2

    if-eq v0, v1, :cond_0

    .line 173
    new-instance v0, Ljava/net/UnknownHostException;

    invoke-direct {v0}, Ljava/net/UnknownHostException;-><init>()V

    throw v0

    .line 172
    :cond_0
    new-instance v0, Ljava/net/UnknownHostException;

    const-string v1, "DNS server failure"

    invoke-direct {v0, v1}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 171
    :cond_1
    invoke-virtual/range {p3 .. p3}, Lnicoid/network238/okhttp3/internal/dns/DnsMessage;->getAnswers()Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1

    .line 183
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/internal/dns/Question;->getType()I

    move-result v1

    const/16 v2, 0xa

    const/4 v3, 0x1

    if-eq v1, v3, :cond_c

    const/16 v3, 0x1c

    if-eq v1, v3, :cond_c

    const/16 v3, 0x41

    if-ne v1, v3, :cond_b

    .line 391
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 400
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    if-eqz v4, :cond_2

    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 187
    :cond_3
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->shuffled(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    .line 402
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$updateStateAndCallCallbacks$$inlined$sortedBy$1;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$updateStateAndCallCallbacks$$inlined$sortedBy$1;-><init>()V

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->sortedWith(Ljava/lang/Iterable;Ljava/util/Comparator;)Ljava/util/List;

    move-result-object v0

    .line 403
    new-instance v1, Ljava/util/ArrayList;

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 404
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_1
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_a

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 405
    move-object v3, v0

    check-cast v3, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;

    .line 192
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getPriority()I

    move-result v0

    if-nez v0, :cond_4

    .line 193
    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/16 v9, 0xe

    const/4 v10, 0x0

    move-object/from16 v4, p0

    move-object/from16 v5, p2

    invoke-static/range {v4 .. v10}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks$default(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;ZILjava/lang/Object;)V

    return-void

    .line 199
    :cond_4
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getTargetName()Ljava/lang/String;

    move-result-object v0

    const-string v4, ""

    invoke-static {v0, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const/4 v5, 0x0

    if-eqz v4, :cond_5

    move-object v0, v5

    :cond_5
    if-nez v0, :cond_6

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v0

    :cond_6
    move-object v7, v0

    .line 201
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getAlpnIds()Ljava/util/List;

    move-result-object v0

    if-eqz v0, :cond_9

    .line 407
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4}, Ljava/util/ArrayList;-><init>()V

    .line 416
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :cond_7
    :goto_2
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_8

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 415
    check-cast v0, Ljava/lang/String;

    .line 203
    :try_start_1
    sget-object v8, Lnicoid/network238/okhttp3/Protocol;->Companion:Lnicoid/network238/okhttp3/Protocol$Companion;

    invoke-virtual {v8, v0}, Lnicoid/network238/okhttp3/Protocol$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_3

    :catch_0
    move-exception v0

    move-object v0, v5

    :goto_3
    if-eqz v0, :cond_7

    .line 415
    invoke-interface {v4, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 416
    :cond_8
    move-object v8, v4

    goto :goto_4

    .line 415
    :cond_9
    move-object v8, v5

    .line 208
    :goto_4
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getPort()I

    move-result v9

    .line 209
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getIpAddressHints()Ljava/util/List;

    move-result-object v10

    .line 210
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$Https;->getEchConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v11

    .line 198
    new-instance v6, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    invoke-direct/range {v6 .. v11}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;-><init>(Ljava/lang/String;Ljava/util/List;ILjava/util/List;Lnicoid/network238/okio/ByteString;)V

    .line 405
    invoke-interface {v1, v6}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 404
    :cond_a
    move-object v13, v1

    goto :goto_7

    .line 432
    :cond_b
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 227
    const-string v1, "unexpected question type"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 421
    :cond_c
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 430
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_d
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_e

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    if-eqz v4, :cond_d

    invoke-interface {v1, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 432
    :cond_e
    new-instance v0, Ljava/util/ArrayList;

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 433
    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    :goto_6
    if-ge v3, v2, :cond_f

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    .line 434
    check-cast v4, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;

    .line 219
    new-instance v5, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    .line 220
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v6

    invoke-virtual {v6}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v6

    .line 221
    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/dns/ResourceRecord$IpAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v4

    .line 219
    invoke-direct {v5, v6, v4}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;-><init>(Ljava/lang/String;Ljava/net/InetAddress;)V

    .line 434
    invoke-interface {v0, v5}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_6

    .line 433
    :cond_f
    move-object v13, v0

    .line 434
    :goto_7
    nop

    .line 231
    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0xc

    const/16 v17, 0x0

    move-object/from16 v11, p0

    move-object/from16 v12, p2

    invoke-static/range {v11 .. v17}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks$default(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;ZILjava/lang/Object;)V

    return-void

    :catch_1
    move-exception v0

    move-object v14, v0

    .line 176
    const/4 v13, 0x0

    const/4 v15, 0x0

    const/16 v16, 0xa

    const/16 v17, 0x0

    move-object/from16 v11, p0

    move-object/from16 v12, p2

    invoke-static/range {v11 .. v17}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks$default(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;ZILjava/lang/Object;)V

    return-void
.end method

.method static synthetic updateStateAndCallCallbacks$default(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;ZILjava/lang/Object;)V
    .registers 8

    and-int/lit8 p6, p5, 0x1

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move-object p1, v0

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    .line 239
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p2

    :cond_1
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_2

    move-object p3, v0

    :cond_2
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_3

    const/4 p4, 0x0

    .line 237
    :cond_3
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->updateStateAndCallCallbacks(Lnicoid/network238/okhttp3/internal/dns/DnsQuery;Ljava/util/List;Ljava/io/IOException;Z)V

    return-void
.end method


# virtual methods
.method public cancel()V
    .registers 4

    .line 150
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;

    .line 151
    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;->cancel()Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;

    move-result-object v1

    .line 152
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v2, v0, v1}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 154
    instance-of v1, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    if-eqz v1, :cond_1

    .line 155
    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;->getRunningQueries()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 156
    invoke-interface {v1}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery;->cancel()V

    goto :goto_0

    :cond_1
    return-void
.end method

.method public enqueue(Lnicoid/network238/okhttp3/Dns$Callback;)V
    .registers 19

    move-object/from16 v0, p0

    invoke-virtual/range {p1 .. p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->createListBuilder()Ljava/util/List;

    move-result-object v1

    .line 70
    iget-boolean v2, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->includeServiceMetadata:Z

    if-eqz v2, :cond_1

    .line 74
    new-instance v3, Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 76
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Request;->port()I

    move-result v2

    const/16 v4, 0x1bb

    if-ne v2, v4, :cond_0

    .line 77
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v2

    move-object v4, v2

    goto :goto_0

    .line 78
    :cond_0
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v4, "_"

    invoke-direct {v2, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Dns$Request;->port()I

    move-result v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const-string v4, "._https."

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v4, v2

    :goto_0
    nop

    .line 74
    const/16 v5, 0x41

    const/4 v6, 0x0

    const/4 v7, 0x4

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 73
    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 84
    :cond_1
    iget-boolean v2, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->includeIPv6:Z

    if-eqz v2, :cond_2

    .line 85
    new-instance v3, Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x4

    const/4 v8, 0x0

    const/16 v5, 0x1c

    const/4 v6, 0x0

    invoke-direct/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 87
    :cond_2
    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v5

    const/4 v8, 0x4

    const/4 v9, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-direct/range {v4 .. v9}, Lnicoid/network238/okhttp3/internal/dns/Question;-><init>(Ljava/lang/String;IIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 69
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->build(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    .line 92
    :cond_3
    :goto_1
    iget-object v2, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;

    if-eqz v3, :cond_4

    check-cast v2, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;

    goto :goto_2

    :cond_4
    const/4 v2, 0x0

    :goto_2
    if-eqz v2, :cond_9

    .line 96
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Idle;->getCanceled()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 97
    new-instance v3, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;

    const/4 v4, 0x1

    invoke-direct {v3, v4}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Complete;-><init>(Z)V

    .line 99
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v4, v2, v3}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_5

    .line 101
    iget-object v1, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v2

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->getRequest()Lnicoid/network238/okhttp3/Dns$Request;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v3, " dns"

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    new-instance v7, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;

    move-object/from16 v10, p1

    invoke-direct {v7, v10, v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$0;-><init>(Lnicoid/network238/okhttp3/Dns$Callback;Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;)V

    const/4 v8, 0x6

    const/4 v9, 0x0

    const-wide/16 v4, 0x0

    const/4 v6, 0x0

    invoke-static/range {v2 .. v9}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->execute$default(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;Ljava/lang/String;JZLnicoid/network238/kotlin/jvm/functions/Function0;ILjava/lang/Object;)V

    return-void

    .line 99
    :cond_5
    move-object/from16 v10, p1

    goto :goto_1

    .line 385
    :cond_6
    move-object/from16 v10, p1

    new-instance v3, Ljava/util/LinkedHashMap;

    const/16 v4, 0xa

    invoke-static {v1, v4}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v4

    invoke-static {v4}, Lnicoid/network238/kotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v4

    const/16 v5, 0x10

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 387
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_3
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_7

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 388
    move-object v6, v5

    check-cast v6, Lnicoid/network238/okhttp3/internal/dns/Question;

    .line 110
    iget-object v7, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    invoke-interface {v7, v6}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;->newQuery(Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    move-result-object v6

    .line 388
    invoke-interface {v3, v5, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 114
    :cond_7
    new-instance v8, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;

    .line 117
    invoke-interface {v3}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/kotlin/collections/CollectionsKt;->toList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v12

    .line 114
    const/4 v9, 0x0

    const/4 v11, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/16 v15, 0x34

    const/16 v16, 0x0

    invoke-direct/range {v8 .. v16}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State$Running;-><init>(ZLnicoid/network238/okhttp3/Dns$Callback;ZLjava/util/List;Ljava/util/List;Ljava/util/List;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 120
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {v4, v2, v8}, Lnicoid/network238/okhttp3/internal/TagsKt$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 122
    invoke-interface {v3}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/Map$Entry;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lnicoid/network238/okhttp3/internal/dns/Question;

    invoke-interface {v2}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/internal/dns/DnsQuery;

    .line 125
    new-instance v4, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;

    invoke-direct {v4, v0, v3, v2}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$enqueue$2;-><init>(Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;Lnicoid/network238/okhttp3/internal/dns/Question;Lnicoid/network238/okhttp3/internal/dns/DnsQuery;)V

    .line 123
    invoke-interface {v2, v4}, Lnicoid/network238/okhttp3/internal/dns/DnsQuery;->enqueue(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Callback;)V

    goto :goto_4

    :cond_8
    return-void

    .line 92
    :cond_9
    new-instance v1, Ljava/lang/IllegalStateException;

    .line 93
    const-string v2, "already enqueued"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public getRequest()Lnicoid/network238/okhttp3/Dns$Request;
    .registers 2

    .line 58
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->request:Lnicoid/network238/okhttp3/Dns$Request;

    return-object v0
.end method

.method public isCanceled()Z
    .registers 2

    .line 65
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;->state:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall$State;->getCanceled()Z

    move-result v0

    return v0
.end method
