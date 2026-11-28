.class public final Lnicoid/network238/okhttp3/android/AndroidDns;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Dns;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000d\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0007\u0018\u00002\u00020\u0001:\u0001/BI\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u0012\u0006\u0010\u000c\u001a\u00020\r\u0012\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f\u00a2\u0006\u0004\u0008\u0011\u0010\u0012B3\u0008\u0016\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u0012\n\u0008\u0002\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\u0011\u0010\u0013J\u0016\u0010#\u001a\u0008\u0012\u0004\u0012\u00020%0$2\u0006\u0010&\u001a\u00020\'H\u0016J\u0010\u0010(\u001a\u00020)2\u0006\u0010*\u001a\u00020+H\u0016J\u0018\u0010,\u001a\u00020-2\u0006\u0010*\u001a\u00020+2\u0006\u0010\u0008\u001a\u00020\tH\u0002J\u0010\u0010.\u001a\u00020\t2\u0006\u0010*\u001a\u00020+H\u0002R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0016\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0014\u0010\u0008\u001a\u00020\tX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0018\u0010\u0019R\u0014\u0010\n\u001a\u00020\u000bX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001a\u0010\u001bR\u000e\u0010\u000c\u001a\u00020\rX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u001b\u0010\u001c\u001a\u00020\u00108BX\u0082\u0084\u0002\u00a2\u0006\u000c\n\u0004\u0008\u001f\u0010 \u001a\u0004\u0008\u001d\u0010\u001eR\u000e\u0010!\u001a\u00020\"X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00060"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/android/AndroidDns;",
        "Lnicoid/network238/okhttp3/Dns;",
        "dnsResolver",
        "Landroid/net/DnsResolver;",
        "network",
        "Landroid/net/Network;",
        "dnsCache",
        "Lnicoid/network238/okhttp3/DnsCache;",
        "includeServiceMetadata",
        "",
        "executor",
        "Ljava/util/concurrent/Executor;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "lazyNetworkSecurityPolicy",
        "Lnicoid/network238/kotlin/Lazy;",
        "Landroid/security/NetworkSecurityPolicy;",
        "<init>",
        "(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;ZLjava/util/concurrent/Executor;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/Lazy;)V",
        "(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;Z)V",
        "getDnsResolver$okhttp",
        "()Landroid/net/DnsResolver;",
        "getNetwork$okhttp",
        "()Landroid/net/Network;",
        "getIncludeServiceMetadata$okhttp",
        "()Z",
        "getExecutor$okhttp",
        "()Ljava/util/concurrent/Executor;",
        "networkSecurityPolicy",
        "getNetworkSecurityPolicy",
        "()Landroid/security/NetworkSecurityPolicy;",
        "networkSecurityPolicy$delegate",
        "Lnicoid/network238/kotlin/Lazy;",
        "queryFactory",
        "Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;",
        "lookup",
        "",
        "Ljava/net/InetAddress;",
        "hostname",
        "",
        "newCall",
        "Lnicoid/network238/okhttp3/Dns$Call;",
        "request",
        "Lnicoid/network238/okhttp3/Dns$Request;",
        "call",
        "Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;",
        "includeServiceMetadataForRequest",
        "AndroidQuery",
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
.field private final dnsResolver:Landroid/net/DnsResolver;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final includeServiceMetadata:Z

.field private final network:Landroid/net/Network;

.field private final networkSecurityPolicy$delegate:Lnicoid/network238/kotlin/Lazy;

.field private final queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

.field private final taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;


# direct methods
.method public constructor <init>(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;Z)V
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    new-instance v5, Lnicoid/network238/okhttp3/android/AndroidDns$1;

    invoke-direct {v5}, Lnicoid/network238/okhttp3/android/AndroidDns$1;-><init>()V

    .line 84
    sget-object v6, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    new-instance v0, Lnicoid/network238/okhttp3/android/AndroidDns$2;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/android/AndroidDns$2;-><init>()V

    .line 85
    invoke-static {v0}, Lnicoid/network238/kotlin/LazyKt;->lazy(Lnicoid/network238/kotlin/jvm/functions/Function0;)Lnicoid/network238/kotlin/Lazy;

    move-result-object v7

    .line 78
    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v4, p4

    invoke-direct/range {v0 .. v7}, Lnicoid/network238/okhttp3/android/AndroidDns;-><init>(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;ZLjava/util/concurrent/Executor;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/Lazy;)V

    return-void
.end method

.method public synthetic constructor <init>(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 22

    and-int/lit8 v0, p5, 0x1

    if-eqz v0, :cond_0

    .line 69
    invoke-static {}, Landroid/net/DnsResolver;->getInstance()Landroid/net/DnsResolver;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_0

    .line 0
    :cond_0
    move-object/from16 v0, p1

    .line 69
    :goto_0
    and-int/lit8 v1, p5, 0x2

    if-eqz v1, :cond_1

    const/4 v1, 0x0

    goto :goto_1

    :cond_1
    move-object/from16 v1, p2

    :goto_1
    and-int/lit8 v2, p5, 0x4

    if-eqz v2, :cond_2

    .line 71
    new-instance v3, Lnicoid/network238/okhttp3/DnsCache;

    const/16 v13, 0x1f

    const/4 v14, 0x0

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    const-wide/16 v8, 0x0

    const-wide/16 v10, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v3 .. v14}, Lnicoid/network238/okhttp3/DnsCache;-><init>(JJJJIILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    goto :goto_2

    .line 69
    :cond_2
    move-object/from16 v3, p3

    .line 71
    :goto_2
    and-int/lit8 v2, p5, 0x8

    if-eqz v2, :cond_3

    const/4 v2, 0x1

    goto :goto_3

    :cond_3
    move/from16 v2, p4

    .line 68
    :goto_3
    invoke-direct {p0, v0, v1, v3, v2}, Lnicoid/network238/okhttp3/android/AndroidDns;-><init>(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;Z)V

    return-void
.end method

.method public constructor <init>(Landroid/net/DnsResolver;Landroid/net/Network;Lnicoid/network238/okhttp3/DnsCache;ZLjava/util/concurrent/Executor;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/kotlin/Lazy;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/net/DnsResolver;",
            "Landroid/net/Network;",
            "Lnicoid/network238/okhttp3/DnsCache;",
            "Z",
            "Ljava/util/concurrent/Executor;",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
            "Lnicoid/network238/kotlin/Lazy;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 59
    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->dnsResolver:Landroid/net/DnsResolver;

    .line 60
    iput-object p2, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->network:Landroid/net/Network;

    .line 62
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->includeServiceMetadata:Z

    .line 64
    iput-object p5, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->executor:Ljava/util/concurrent/Executor;

    .line 65
    iput-object p6, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 88
    iput-object p7, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->networkSecurityPolicy$delegate:Lnicoid/network238/kotlin/Lazy;

    .line 92
    iget-object p1, p3, Lnicoid/network238/okhttp3/DnsCache;->-delegate:Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;

    new-instance p2, Lnicoid/network238/okhttp3/android/AndroidDns$0;

    invoke-direct {p2, p0}, Lnicoid/network238/okhttp3/android/AndroidDns$0;-><init>(Lnicoid/network238/okhttp3/android/AndroidDns;)V

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/internal/dns/RealDnsCache;->wrap(Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    return-void
.end method

.method static final _init_$lambda$0(Ljava/lang/Runnable;)V
    .registers 1

    .line 83
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    return-void
.end method

.method static final _init_$lambda$1()Landroid/security/NetworkSecurityPolicy;
    .registers 1

    .line 85
    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public static final synthetic access$getTaskRunner$p(Lnicoid/network238/okhttp3/android/AndroidDns;)Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
    .registers 1

    .line 56
    iget-object p0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-object p0
.end method

.method private final call(Lnicoid/network238/okhttp3/Dns$Request;Z)Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;
    .registers 9

    .line 111
    new-instance v0, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    .line 112
    iget-object v1, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->taskRunner:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 114
    iget-object v3, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->queryFactory:Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;

    if-eqz p2, :cond_0

    .line 118
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns;->includeServiceMetadataForRequest(Lnicoid/network238/okhttp3/Dns$Request;)Z

    move-result p2

    if-eqz p2, :cond_0

    const/4 p2, 0x1

    goto :goto_0

    :cond_0
    const/4 p2, 0x0

    :goto_0
    move v5, p2

    .line 111
    const/4 v4, 0x0

    move-object v2, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/Dns$Request;Lnicoid/network238/okhttp3/internal/dns/DnsQuery$Factory;ZZ)V

    return-object v0
.end method

.method private final getNetworkSecurityPolicy()Landroid/security/NetworkSecurityPolicy;
    .registers 2

    .line 88
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->networkSecurityPolicy$delegate:Lnicoid/network238/kotlin/Lazy;

    invoke-interface {v0}, Lnicoid/network238/kotlin/Lazy;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/security/NetworkSecurityPolicy;

    return-object v0
.end method

.method private final includeServiceMetadataForRequest(Lnicoid/network238/okhttp3/Dns$Request;)Z
    .registers 4

    .line 130
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x25

    if-ge v0, v1, :cond_0

    goto :goto_0

    .line 132
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/android/AndroidDns;->getNetworkSecurityPolicy()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Dns$Request;->hostname()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroid/security/NetworkSecurityPolicy;->getDomainEncryptionMode(Ljava/lang/String;)I

    move-result p1

    const/4 v0, 0x2

    if-eq p1, v0, :cond_1

    const/4 v0, 0x3

    if-eq p1, v0, :cond_1

    :goto_0
    const/4 p1, 0x0

    return p1

    :cond_1
    const/4 p1, 0x1

    return p1
.end method

.method static final queryFactory$lambda$0(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)Lnicoid/network238/okhttp3/internal/dns/DnsQuery;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    new-instance v0, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/okhttp3/android/AndroidDns$AndroidQuery;-><init>(Lnicoid/network238/okhttp3/android/AndroidDns;Lnicoid/network238/okhttp3/internal/dns/Question;)V

    return-object v0
.end method


# virtual methods
.method public final getDnsResolver$okhttp()Landroid/net/DnsResolver;
    .registers 2

    .line 59
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->dnsResolver:Landroid/net/DnsResolver;

    return-object v0
.end method

.method public final getExecutor$okhttp()Ljava/util/concurrent/Executor;
    .registers 2

    .line 64
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->executor:Ljava/util/concurrent/Executor;

    return-object v0
.end method

.method public final getIncludeServiceMetadata$okhttp()Z
    .registers 2

    .line 62
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->includeServiceMetadata:Z

    return v0
.end method

.method public final getNetwork$okhttp()Landroid/net/Network;
    .registers 2

    .line 60
    iget-object v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->network:Landroid/net/Network;

    return-object v0
.end method

.method public lookup(Ljava/lang/String;)Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 101
    new-instance v0, Lnicoid/network238/okhttp3/Dns$Request;

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, p1, v3, v1, v2}, Lnicoid/network238/okhttp3/Dns$Request;-><init>(Ljava/lang/String;IILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    invoke-direct {p0, v0, v3}, Lnicoid/network238/okhttp3/android/AndroidDns;->call(Lnicoid/network238/okhttp3/Dns$Request;Z)Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    move-result-object p1

    .line 102
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt;->execute(Lnicoid/network238/okhttp3/Dns$Call;)Ljava/util/List;

    move-result-object p1

    .line 259
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 268
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    if-eqz v2, :cond_0

    invoke-interface {v0, v1}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 270
    :cond_1
    new-instance p1, Ljava/util/ArrayList;

    const/16 v1, 0xa

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v1

    invoke-direct {p1, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 271
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :goto_1
    if-ge v3, v1, :cond_2

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v3, v3, 0x1

    .line 272
    check-cast v2, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    .line 104
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address()Ljava/net/InetAddress;

    move-result-object v2

    .line 272
    invoke-interface {p1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    return-object p1
.end method

.method public newCall(Lnicoid/network238/okhttp3/Dns$Request;)Lnicoid/network238/okhttp3/Dns$Call;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/android/AndroidDns;->includeServiceMetadata:Z

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/android/AndroidDns;->call(Lnicoid/network238/okhttp3/Dns$Request;Z)Lnicoid/network238/okhttp3/internal/dns/StateMachineDnsCall;

    move-result-object p1

    return-object p1
.end method
