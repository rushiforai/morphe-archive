.class public final Lnicoid/network238/okhttp3/internal/connection/RouteSelector;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;,
        Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;,
        Lnicoid/network238/okhttp3/internal/connection/RouteSelector$WhenMappings;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\\\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0004\u0008\u0007\u0018\u0000 $2\u00020\u0001:\u0002#$B)\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0004\u0008\n\u0010\u000bJ\t\u0010\u0014\u001a\u00020\tH\u0086\u0002J\t\u0010\u0015\u001a\u00020\u0016H\u0086\u0002J\u001a\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u001a2\u0008\u0010\u001b\u001a\u0004\u0018\u00010\u000eH\u0002J\u0008\u0010\u001c\u001a\u00020\tH\u0002J\u000e\u0010\u001d\u001a\u0008\u0012\u0004\u0012\u00020\u00130\rH\u0002J\u0016\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00020\u00130\r2\u0006\u0010\u001b\u001a\u00020\u000eH\u0002J&\u0010\u001f\u001a\u0008\u0012\u0004\u0012\u00020\u00130\r2\u0006\u0010\u001b\u001a\u00020\u000e2\u0006\u0010 \u001a\u00020!2\u0006\u0010\"\u001a\u00020\u0010H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u000e0\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0011\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0012X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006%"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RouteSelector;",
        "",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "routeDatabase",
        "Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
        "fastFallback",
        "",
        "<init>",
        "(Lnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Z)V",
        "proxies",
        "",
        "Ljava/net/Proxy;",
        "nextProxyIndex",
        "",
        "postponedRoutes",
        "",
        "Lnicoid/network238/okhttp3/Route;",
        "hasNext",
        "next",
        "Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;",
        "resetNextProxy",
        "",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "proxy",
        "hasNextProxy",
        "nextProxy",
        "nextRoutes",
        "dnsLookup",
        "socketHost",
        "",
        "socketPort",
        "Selection",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;


# instance fields
.field private final address:Lnicoid/network238/okhttp3/Address;

.field private final call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

.field private final fastFallback:Z

.field private nextProxyIndex:I

.field private final postponedRoutes:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation
.end field

.field private proxies:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "+",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation
.end field

.field private final routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->Companion:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Address;Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;Lnicoid/network238/okhttp3/internal/connection/RealCall;Z)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    .line 42
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    .line 43
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 44
    iput-boolean p4, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->fastFallback:Z

    .line 47
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    .line 51
    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    .line 54
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p2

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->proxy()Ljava/net/Proxy;

    move-result-object p1

    invoke-direct {p0, p2, p1}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->resetNextProxy(Lnicoid/network238/okhttp3/HttpUrl;Ljava/net/Proxy;)V

    return-void
.end method

.method private final dnsLookup(Ljava/net/Proxy;Ljava/lang/String;I)Ljava/util/List;
    .registers 21
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/Proxy;",
            "Ljava/lang/String;",
            "I)",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation

    .line 211
    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    move/from16 v3, p3

    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v4

    .line 212
    iget-object v5, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 211
    invoke-virtual {v4, v5, v2}, Lnicoid/network238/okhttp3/EventListener;->dnsStart(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;)V

    .line 220
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v4

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v4

    if-nez v4, :cond_0

    const/16 v4, 0x50

    if-ne v3, v4, :cond_0

    const/4 v4, -0x1

    goto :goto_0

    :cond_0
    move v4, v3

    .line 224
    :goto_0
    new-instance v6, Lnicoid/network238/okhttp3/Dns$Request;

    invoke-direct {v6, v2, v4}, Lnicoid/network238/okhttp3/Dns$Request;-><init>(Ljava/lang/String;I)V

    .line 226
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Address;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v4

    invoke-interface {v4, v6}, Lnicoid/network238/okhttp3/Dns;->newCall(Lnicoid/network238/okhttp3/Dns$Request;)Lnicoid/network238/okhttp3/Dns$Call;

    move-result-object v4

    .line 227
    instance-of v6, v4, Lnicoid/network238/okhttp3/internal/dns/LookupDnsCall;

    const/16 v8, 0xa

    if-eqz v6, :cond_1

    .line 228
    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Address;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v4

    invoke-interface {v4, v2}, Lnicoid/network238/okhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object v4

    .line 311
    new-instance v5, Ljava/util/ArrayList;

    invoke-static {v4, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 312
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_a

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    .line 313
    check-cast v6, Ljava/net/InetAddress;

    .line 230
    new-instance v9, Lnicoid/network238/okhttp3/Route;

    .line 231
    iget-object v10, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    .line 233
    new-instance v11, Ljava/net/InetSocketAddress;

    invoke-direct {v11, v6, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 230
    invoke-direct {v9, v10, v1, v11}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 313
    invoke-interface {v5, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 239
    :cond_1
    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt;->execute(Lnicoid/network238/okhttp3/Dns$Call;)Ljava/util/List;

    move-result-object v4

    .line 315
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 324
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v9

    :cond_2
    :goto_2
    invoke-interface {v9}, Ljava/util/Iterator;->hasNext()Z

    move-result v10

    if-eqz v10, :cond_3

    invoke-interface {v9}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v10

    instance-of v11, v10, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    if-eqz v11, :cond_2

    invoke-interface {v6, v10}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_2

    .line 326
    :cond_3
    invoke-static {v6, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-static {v9}, Lnicoid/network238/kotlin/collections/MapsKt;->mapCapacity(I)I

    move-result v9

    const/16 v10, 0x10

    invoke-static {v9, v10}, Lnicoid/network238/kotlin/ranges/RangesKt;->coerceAtLeast(II)I

    move-result v9

    .line 327
    new-instance v10, Ljava/util/LinkedHashMap;

    invoke-direct {v10, v9}, Ljava/util/LinkedHashMap;-><init>(I)V

    .line 328
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v11, 0x0

    :goto_3
    if-ge v11, v9, :cond_4

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    .line 329
    move-object v13, v12

    check-cast v13, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    .line 244
    invoke-virtual {v13}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->hostname()Ljava/lang/String;

    move-result-object v13

    .line 329
    invoke-interface {v10, v13, v12}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_3

    .line 332
    :cond_4
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    .line 341
    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_5
    :goto_4
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_6

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    instance-of v11, v9, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    if-eqz v11, :cond_5

    invoke-interface {v6, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_4

    .line 343
    :cond_6
    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v6, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v4, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 344
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v11, 0x0

    :goto_5
    if-ge v11, v9, :cond_9

    invoke-virtual {v6, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    .line 345
    check-cast v12, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;

    .line 249
    invoke-virtual {v12}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->hostname()Ljava/lang/String;

    move-result-object v13

    invoke-interface {v10, v13}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;

    .line 250
    new-instance v14, Lnicoid/network238/okhttp3/Route;

    .line 251
    iget-object v15, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    .line 253
    new-instance v5, Ljava/net/InetSocketAddress;

    invoke-virtual {v12}, Lnicoid/network238/okhttp3/Dns$Record$IpAddress;->address()Ljava/net/InetAddress;

    move-result-object v12

    invoke-direct {v5, v12, v3}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 255
    invoke-virtual {v1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v12

    if-nez v12, :cond_7

    const/4 v12, -0x1

    goto :goto_6

    :cond_7
    sget-object v16, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v12}, Ljava/lang/Enum;->ordinal()I

    move-result v12

    aget v12, v16, v12

    :goto_6
    const/4 v7, 0x1

    if-ne v12, v7, :cond_8

    if-eqz v13, :cond_8

    .line 256
    invoke-virtual {v13}, Lnicoid/network238/okhttp3/Dns$Record$ServiceMetadata;->echConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v7

    goto :goto_7

    :cond_8
    const/4 v7, 0x0

    .line 250
    :goto_7
    invoke-direct {v14, v15, v1, v5, v7}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;Lnicoid/network238/okio/ByteString;)V

    .line 345
    invoke-interface {v4, v14}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_5

    .line 344
    :cond_9
    move-object v5, v4

    .line 264
    :cond_a
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_c

    .line 268
    iget-object v1, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v1

    .line 269
    iget-object v3, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    .line 347
    new-instance v4, Ljava/util/ArrayList;

    invoke-static {v5, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v4, v6}, Ljava/util/ArrayList;-><init>(I)V

    .line 348
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    const/4 v7, 0x0

    :goto_8
    if-ge v7, v6, :cond_b

    invoke-virtual {v5, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    .line 349
    check-cast v8, Lnicoid/network238/okhttp3/Route;

    .line 271
    invoke-virtual {v8}, Lnicoid/network238/okhttp3/Route;->socketAddress()Ljava/net/InetSocketAddress;

    move-result-object v8

    invoke-virtual {v8}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object v8

    .line 349
    invoke-interface {v4, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_8

    .line 268
    :cond_b
    invoke-virtual {v1, v3, v2, v4}, Lnicoid/network238/okhttp3/EventListener;->dnsEnd(Lnicoid/network238/okhttp3/Call;Ljava/lang/String;Ljava/util/List;)V

    return-object v5

    .line 265
    :cond_c
    new-instance v1, Ljava/net/UnknownHostException;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/Address;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " returned no addresses for "

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/net/UnknownHostException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method private final hasNextProxy()Z
    .registers 3

    .line 129
    iget v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method private final nextProxy()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 134
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 139
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    iget v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/net/Proxy;

    .line 140
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextRoutes(Ljava/net/Proxy;)Ljava/util/List;

    move-result-object v0

    return-object v0

    .line 135
    :cond_0
    new-instance v0, Ljava/net/SocketException;

    .line 136
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No route to "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "; exhausted proxy configurations: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 135
    invoke-direct {v0, v1}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method private final nextRoutes(Ljava/net/Proxy;)Ljava/util/List;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/Proxy;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Route;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 148
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->DIRECT:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_1

    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    sget-object v1, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-eq v0, v1, :cond_1

    .line 152
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v0

    .line 153
    instance-of v1, v0, Ljava/net/InetSocketAddress;

    if-eqz v1, :cond_0

    .line 156
    sget-object v1, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->Companion:Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;

    check-cast v0, Ljava/net/InetSocketAddress;

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Companion;->getSocketHost(Ljava/net/InetSocketAddress;)Ljava/lang/String;

    move-result-object v1

    .line 157
    invoke-virtual {v0}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v0

    goto :goto_0

    .line 154
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "Proxy.address() is not an InetSocketAddress: "

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 153
    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 149
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v1

    .line 150
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Address;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    :goto_0
    const/4 v2, 0x1

    if-gt v2, v0, :cond_8

    const/high16 v2, 0x10000

    if-ge v0, v2, :cond_8

    .line 164
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v2

    sget-object v3, Ljava/net/Proxy$Type;->SOCKS:Ljava/net/Proxy$Type;

    if-ne v2, v3, :cond_2

    .line 166
    new-instance v2, Lnicoid/network238/okhttp3/Route;

    .line 167
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    .line 169
    invoke-static {v1, v0}, Ljava/net/InetSocketAddress;->createUnresolved(Ljava/lang/String;I)Ljava/net/InetSocketAddress;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 166
    invoke-direct {v2, v3, p1, v0}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 165
    invoke-static {v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 174
    :cond_2
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->canParseAsIpAddress(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 176
    new-instance v2, Lnicoid/network238/okhttp3/Route;

    .line 177
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    .line 179
    new-instance v4, Ljava/net/InetSocketAddress;

    invoke-static {v1}, Ljava/net/InetAddress;->getByName(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v1

    invoke-direct {v4, v1, v0}, Ljava/net/InetSocketAddress;-><init>(Ljava/net/InetAddress;I)V

    .line 176
    invoke-direct {v2, v3, p1, v4}, Lnicoid/network238/okhttp3/Route;-><init>(Lnicoid/network238/okhttp3/Address;Ljava/net/Proxy;Ljava/net/InetSocketAddress;)V

    .line 175
    invoke-static {v2}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 184
    :cond_3
    invoke-direct {p0, p1, v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->dnsLookup(Ljava/net/Proxy;Ljava/lang/String;I)Ljava/util/List;

    move-result-object p1

    .line 307
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 308
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_4
    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_5

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lnicoid/network238/okhttp3/Route;

    .line 187
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Route;->echConfigList()Lnicoid/network238/okio/ByteString;

    move-result-object v3

    if-eqz v3, :cond_4

    .line 308
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 188
    :cond_5
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    move-object p1, v0

    .line 192
    :cond_6
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->fastFallback:Z

    if-eqz v0, :cond_7

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/connection/InetAddressOrderKt;->reorderForHappyEyeballs(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    :cond_7
    return-object p1

    .line 161
    :cond_8
    new-instance p1, Ljava/net/SocketException;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "No route to "

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x3a

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, "; port is out of range"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/net/SocketException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final resetNextProxy(Lnicoid/network238/okhttp3/HttpUrl;Ljava/net/Proxy;)V
    .registers 5

    .line 122
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/okhttp3/EventListener;->proxySelectStart(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;)V

    .line 123
    invoke-static {p2, p1, p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->resetNextProxy$selectProxies(Ljava/net/Proxy;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/internal/connection/RouteSelector;)Ljava/util/List;

    move-result-object p2

    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    .line 124
    const/4 p2, 0x0

    iput p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextProxyIndex:I

    .line 125
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/connection/RealCall;->getEventListener$okhttp()Lnicoid/network238/okhttp3/EventListener;

    move-result-object p2

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->call:Lnicoid/network238/okhttp3/internal/connection/RealCall;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->proxies:Ljava/util/List;

    invoke-virtual {p2, v0, p1, v1}, Lnicoid/network238/okhttp3/EventListener;->proxySelectEnd(Lnicoid/network238/okhttp3/Call;Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V

    return-void
.end method

.method private static final resetNextProxy$selectProxies(Ljava/net/Proxy;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/internal/connection/RouteSelector;)Ljava/util/List;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/Proxy;",
            "Lnicoid/network238/okhttp3/HttpUrl;",
            "Lnicoid/network238/okhttp3/internal/connection/RouteSelector;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    if-eqz p0, :cond_0

    .line 102
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 105
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->uri()Ljava/net/URI;

    move-result-object p0

    .line 106
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object p1

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-nez p1, :cond_1

    new-array p0, v1, [Ljava/net/Proxy;

    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object p1, p0, v0

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 113
    :cond_1
    :try_start_0
    iget-object p1, p2, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->address:Lnicoid/network238/okhttp3/Address;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Address;->proxySelector()Ljava/net/ProxySelector;

    move-result-object p1

    invoke-virtual {p1, p0}, Ljava/net/ProxySelector;->select(Ljava/net/URI;)Ljava/util/List;

    move-result-object p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    move-exception p0

    const/4 p0, 0x0

    :goto_0
    if-eqz p0, :cond_3

    .line 117
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_2

    goto :goto_1

    .line 119
    :cond_2
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->toImmutableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_3
    :goto_1
    nop

    .line 117
    new-array p0, v1, [Ljava/net/Proxy;

    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    aput-object p1, p0, v0

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->immutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final hasNext()Z
    .registers 2

    .line 60
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method public final next()Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_5

    .line 67
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 68
    :cond_0
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->hasNextProxy()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 72
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->nextProxy()Ljava/util/List;

    move-result-object v1

    .line 73
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/Route;

    .line 74
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->routeDatabase:Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;

    invoke-virtual {v3, v2}, Lnicoid/network238/okhttp3/internal/connection/RouteDatabase;->shouldPostpone(Lnicoid/network238/okhttp3/Route;)Z

    move-result v3

    if-eqz v3, :cond_1

    .line 75
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v3, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 77
    :cond_1
    invoke-interface {v0, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 81
    :cond_2
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    .line 86
    :cond_3
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_4

    .line 88
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    .line 89
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/connection/RouteSelector;->postponedRoutes:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 92
    :cond_4
    new-instance v1, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;

    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/internal/connection/RouteSelector$Selection;-><init>(Ljava/util/List;)V

    return-object v1

    .line 64
    :cond_5
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method
