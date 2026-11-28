.class public final Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;
.super Ljava/net/ProxySelector;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u0008\u0012\u0004\u0012\u00020\u00060\u00052\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u0008H\u0016J&\u0010\t\u001a\u00020\n2\u0008\u0010\u0007\u001a\u0004\u0018\u00010\u00082\u0008\u0010\u000b\u001a\u0004\u0018\u00010\u000c2\u0008\u0010\r\u001a\u0004\u0018\u00010\u000eH\u0016\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;",
        "Ljava/net/ProxySelector;",
        "<init>",
        "()V",
        "select",
        "",
        "Ljava/net/Proxy;",
        "uri",
        "Ljava/net/URI;",
        "connectFailed",
        "",
        "sa",
        "Ljava/net/SocketAddress;",
        "ioe",
        "Ljava/io/IOException;",
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
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;->INSTANCE:Lnicoid/network238/okhttp3/internal/proxy/NullProxySelector;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/net/ProxySelector;-><init>()V

    return-void
.end method


# virtual methods
.method public connectFailed(Ljava/net/URI;Ljava/net/SocketAddress;Ljava/io/IOException;)V
    .registers 4

    return-void
.end method

.method public select(Ljava/net/URI;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/net/URI;",
            ")",
            "Ljava/util/List<",
            "Ljava/net/Proxy;",
            ">;"
        }
    .end annotation

    if-eqz p1, :cond_0

    .line 30
    sget-object p1, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    return-object p1

    .line 29
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "uri must not be null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
