.class public final Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/tantan/library/svga/data/fetcher/DataFetcher;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;,
        Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;,
        Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$DefaultHttpFactory;,
        Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$RetryInterceptor;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Lcom/tantan/library/svga/data/fetcher/DataFetcher<",
        "Ljava/io/InputStream;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010$\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0002\u0008\u0005\u0018\u0000 \u00122\u0008\u0012\u0004\u0012\u00020\u00020\u0001:\u0004\u0012\u0013\u0014\u0015B\u000f\u0008\u0016\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0002\u0010\u0005B\u0017\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0002\u0010\u0008J\n\u0010\r\u001a\u0004\u0018\u00010\u0002H\u0016J&\u0010\u000e\u001a\u0004\u0018\u00010\u00022\u0006\u0010\u0003\u001a\u00020\u00042\u0012\u0010\u000f\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\nH\u0002J\u0008\u0010\u0010\u001a\u00020\u0011H\u0016R\u001a\u0010\t\u001a\u000e\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\u000b0\nX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\u0002X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0003\u001a\u00020\u0004X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0016"
    }
    d2 = {
        "Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;",
        "Lcom/tantan/library/svga/data/fetcher/DataFetcher;",
        "Ljava/io/InputStream;",
        "url",
        "Ljava/net/URL;",
        "(Ljava/net/URL;)V",
        "factory",
        "Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;",
        "(Ljava/net/URL;Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;)V",
        "defaultHeaders",
        "",
        "",
        "stream",
        "loadData",
        "loadDataWithUrl",
        "headers",
        "recycle",
        "",
        "Companion",
        "DefaultHttpFactory",
        "HttpFactory",
        "RetryInterceptor",
        "svga_lib_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x8,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final Companion:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private static final DEFAULT_HTTP_FACTORY:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# instance fields
.field private defaultHeaders:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private final factory:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field

.field private stream:Ljava/io/InputStream;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final url:Ljava/net/URL;
    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, v1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;-><init>(Lkotlin/jvm/internal/DefaultConstructorMarker;)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->Companion:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$Companion;

    .line 8
    .line 9
    new-instance v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$DefaultHttpFactory;

    .line 10
    .line 11
    invoke-direct {v0}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$DefaultHttpFactory;-><init>()V

    .line 12
    .line 13
    .line 14
    sput-object v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->DEFAULT_HTTP_FACTORY:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 15
    .line 16
    return-void
.end method

.method public constructor <init>(Ljava/net/URL;)V
    .locals 1
    .param p1    # Ljava/net/URL;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    sget-object v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->DEFAULT_HTTP_FACTORY:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    invoke-direct {p0, p1, v0}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;-><init>(Ljava/net/URL;Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;)V

    return-void
.end method

.method public constructor <init>(Ljava/net/URL;Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;)V
    .locals 2
    .param p1    # Ljava/net/URL;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    iput-object p1, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->url:Ljava/net/URL;

    .line 11
    .line 12
    iput-object p2, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->factory:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 13
    .line 14
    new-instance p1, Lkotlin/Pair;

    .line 15
    .line 16
    const-string p2, "Connection"

    .line 17
    .line 18
    const-string v0, "close"

    .line 19
    .line 20
    invoke-direct {p1, p2, v0}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 21
    .line 22
    .line 23
    new-instance p2, Lkotlin/Pair;

    .line 24
    .line 25
    const-string v0, "Accept-Encoding"

    .line 26
    .line 27
    const-string v1, "identity"

    .line 28
    .line 29
    invoke-direct {p2, v0, v1}, Lkotlin/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 30
    .line 31
    .line 32
    filled-new-array {p1, p2}, [Lkotlin/Pair;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {p1}, Lkotlin/collections/MapsKt;->mapOf([Lkotlin/Pair;)Ljava/util/Map;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iput-object p1, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->defaultHeaders:Ljava/util/Map;

    .line 41
    .line 42
    return-void
.end method

.method public static final synthetic access$getDEFAULT_HTTP_FACTORY$cp()Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;
    .locals 1

    .line 1
    sget-object v0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->DEFAULT_HTTP_FACTORY:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 2
    .line 3
    return-object v0
.end method

.method private final loadDataWithUrl(Ljava/net/URL;Ljava/util/Map;)Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URL;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)",
            "Ljava/io/InputStream;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance v0, Ll/x1d0$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/x1d0$a;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1}, Ll/x1d0$a;->r(Ljava/net/URL;)Ll/x1d0$a;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-interface {p2}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    .line 19
    .line 20
    .line 21
    move-result-object p2

    .line 22
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    check-cast v0, Ljava/util/Map$Entry;

    .line 33
    .line 34
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    check-cast v1, Ljava/lang/String;

    .line 39
    .line 40
    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    check-cast v0, Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p1, v1, v0}, Ll/x1d0$a;->a(Ljava/lang/String;Ljava/lang/String;)Ll/x1d0$a;

    .line 47
    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p0, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->factory:Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 51
    .line 52
    invoke-interface {p0}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;->get()Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    .line 62
    .line 63
    invoke-interface {p0, p1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher$HttpFactory;->fetcher(Ll/x1d0;)Ll/i5d0;

    .line 64
    .line 65
    .line 66
    move-result-object p0

    .line 67
    if-eqz p0, :cond_1

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/i5d0;->k()Ll/k5d0;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    if-eqz p0, :cond_1

    .line 74
    .line 75
    invoke-virtual {p0}, Ll/k5d0;->byteStream()Ljava/io/InputStream;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    return-object p0

    .line 80
    :cond_1
    const/4 p0, 0x0

    .line 81
    return-object p0
.end method


# virtual methods
.method public loadData()Ljava/io/InputStream;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->url:Ljava/net/URL;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->defaultHeaders:Ljava/util/Map;

    .line 4
    .line 5
    invoke-direct {p0, v0, v1}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->loadDataWithUrl(Ljava/net/URL;Ljava/util/Map;)Ljava/io/InputStream;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iput-object v0, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->stream:Ljava/io/InputStream;

    .line 10
    .line 11
    return-object v0
.end method

.method public bridge synthetic loadData()Ljava/lang/Object;
    .locals 0

    .line 12
    invoke-virtual {p0}, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->loadData()Ljava/io/InputStream;

    move-result-object p0

    return-object p0
.end method

.method public recycle()V
    .locals 0

    .line 1
    :try_start_0
    iget-object p0, p0, Lcom/tantan/library/svga/data/fetcher/NetworkResourceFetcher;->stream:Ljava/io/InputStream;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 6
    .line 7
    .line 8
    :catch_0
    :cond_0
    return-void
.end method
