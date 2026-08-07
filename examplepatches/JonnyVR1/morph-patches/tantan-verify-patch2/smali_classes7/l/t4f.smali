.class public abstract Ll/t4f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/t4f$b;
    }
.end annotation


# static fields
.field public static final NONE:Ll/t4f;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ll/t4f$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/t4f$a;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Ll/t4f;->NONE:Ll/t4f;

    .line 7
    .line 8
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ll/t4f;Ll/ry3;)Ll/t4f;
    .locals 0

    .line 1
    return-object p0
.end method

.method public static factory(Ll/t4f;)Ll/t4f$b;
    .locals 1

    .line 1
    new-instance v0, Ll/s4f;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/s4f;-><init>(Ll/t4f;)V

    .line 4
    .line 5
    .line 6
    return-object v0
.end method


# virtual methods
.method public callEnd(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public callStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 0

    .line 1
    return-void
.end method

.method public connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 0

    .line 1
    return-void
.end method

.method public connectionAcquired(Ll/ry3;Ll/bx5;)V
    .locals 0

    .line 1
    return-void
.end method

.method public connectionReleased(Ll/ry3;Ll/bx5;)V
    .locals 0

    .line 1
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ry3;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Ljava/net/InetAddress;",
            ">;)V"
        }
    .end annotation

    .line 1
    return-void
.end method

.method public dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestBodyEnd(Ll/ry3;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestBodyStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public requestHeadersStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public responseBodyEnd(Ll/ry3;J)V
    .locals 0

    .line 1
    return-void
.end method

.method public responseBodyStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public responseFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 0

    .line 1
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public responseHeadersStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method

.method public secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 0

    .line 1
    return-void
.end method

.method public secureConnectStart(Ll/ry3;)V
    .locals 0

    .line 1
    return-void
.end method
