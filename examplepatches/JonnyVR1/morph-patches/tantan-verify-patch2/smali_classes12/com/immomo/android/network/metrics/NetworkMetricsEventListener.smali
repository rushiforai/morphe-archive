.class public final Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;
.super Ll/t4f;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u0086\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010 \n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\t\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0018\u00002\u00020\u0001B\u001f\u0012\u0008\u0010\u0003\u001a\u0004\u0018\u00010\u0002\u0012\u000c\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u0004\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0017\u0010\u000b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0002\u00a2\u0006\u0004\u0008\u000b\u0010\u000cJ\u0017\u0010\r\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\r\u0010\u000cJ\u001f\u0010\u0010\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u0010\u0010\u0011J-\u0010\u0015\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u000f\u001a\u00020\u000e2\u000c\u0010\u0014\u001a\u0008\u0012\u0004\u0012\u00020\u00130\u0012H\u0016\u00a2\u0006\u0004\u0008\u0015\u0010\u0016J\'\u0010\u001b\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u0019H\u0016\u00a2\u0006\u0004\u0008\u001b\u0010\u001cJ\u0017\u0010\u001d\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008\u001d\u0010\u000cJ!\u0010 \u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u001eH\u0016\u00a2\u0006\u0004\u0008 \u0010!J1\u0010$\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0010#\u001a\u0004\u0018\u00010\"H\u0016\u00a2\u0006\u0004\u0008$\u0010%J9\u0010(\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\u0018\u001a\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u00192\u0008\u0010#\u001a\u0004\u0018\u00010\"2\u0006\u0010\'\u001a\u00020&H\u0016\u00a2\u0006\u0004\u0008(\u0010)J\u001f\u0010,\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010+\u001a\u00020*H\u0016\u00a2\u0006\u0004\u0008,\u0010-J\u0017\u0010.\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008.\u0010\u000cJ\u001f\u00101\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u00100\u001a\u00020/H\u0016\u00a2\u0006\u0004\u00081\u00102J\u0017\u00103\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u00083\u0010\u000cJ\u001f\u00106\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u00105\u001a\u000204H\u0016\u00a2\u0006\u0004\u00086\u00107J\u0017\u00108\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u00088\u0010\u000cJ\u001f\u0010;\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010:\u001a\u000209H\u0016\u00a2\u0006\u0004\u0008;\u0010<J\u0017\u0010=\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008=\u0010\u000cJ\u001f\u0010>\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u00105\u001a\u000204H\u0016\u00a2\u0006\u0004\u0008>\u00107J\u0017\u0010?\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u0008H\u0016\u00a2\u0006\u0004\u0008?\u0010\u000cJ\u001f\u0010@\u001a\u00020\n2\u0006\u0010\t\u001a\u00020\u00082\u0006\u0010\'\u001a\u00020&H\u0016\u00a2\u0006\u0004\u0008@\u0010AR\u0018\u0010D\u001a\u0004\u0018\u00010\u00018\u0002@\u0002X\u0082\u000e\u00a2\u0006\u0006\n\u0004\u0008B\u0010CR\u0014\u0010H\u001a\u00020E8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008F\u0010GR\u0019\u0010\u0003\u001a\u0004\u0018\u00010\u00028\u0006\u00a2\u0006\u000c\n\u0004\u0008I\u0010J\u001a\u0004\u0008K\u0010LR\u001d\u0010\u0005\u001a\u0008\u0012\u0004\u0012\u00020\u00010\u00048\u0006\u00a2\u0006\u000c\n\u0004\u0008M\u0010N\u001a\u0004\u0008O\u0010P\u00a8\u0006Q"
    }
    d2 = {
        "Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;",
        "Ll/t4f;",
        "Ll/t4f$b;",
        "otherFactory",
        "",
        "eventListeners",
        "<init>",
        "(Ll/t4f$b;Ljava/util/List;)V",
        "Ll/ry3;",
        "call",
        "",
        "h",
        "(Ll/ry3;)V",
        "callStart",
        "",
        "domainName",
        "dnsStart",
        "(Ll/ry3;Ljava/lang/String;)V",
        "",
        "Ljava/net/InetAddress;",
        "inetAddressList",
        "dnsEnd",
        "(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V",
        "Ljava/net/InetSocketAddress;",
        "inetSocketAddress",
        "Ljava/net/Proxy;",
        "proxy",
        "connectStart",
        "(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V",
        "secureConnectStart",
        "Ll/txk;",
        "handshake",
        "secureConnectEnd",
        "(Ll/ry3;Ll/txk;)V",
        "Lokhttp3/Protocol;",
        "protocol",
        "connectEnd",
        "(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V",
        "Ljava/io/IOException;",
        "ioe",
        "connectFailed",
        "(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V",
        "Ll/bx5;",
        "connection",
        "connectionAcquired",
        "(Ll/ry3;Ll/bx5;)V",
        "requestHeadersStart",
        "Ll/x1d0;",
        "request",
        "requestHeadersEnd",
        "(Ll/ry3;Ll/x1d0;)V",
        "requestBodyStart",
        "",
        "byteCount",
        "requestBodyEnd",
        "(Ll/ry3;J)V",
        "responseHeadersStart",
        "Ll/i5d0;",
        "response",
        "responseHeadersEnd",
        "(Ll/ry3;Ll/i5d0;)V",
        "responseBodyStart",
        "responseBodyEnd",
        "callEnd",
        "callFailed",
        "(Ll/ry3;Ljava/io/IOException;)V",
        "a",
        "Ll/t4f;",
        "factoryEventListener",
        "Lcom/immomo/android/network/metrics/NetworkTrackInfo;",
        "b",
        "Lcom/immomo/android/network/metrics/NetworkTrackInfo;",
        "networkTrackInfo",
        "c",
        "Ll/t4f$b;",
        "g",
        "()Ll/t4f$b;",
        "d",
        "Ljava/util/List;",
        "f",
        "()Ljava/util/List;",
        "sdk_release"
    }
    k = 0x1
    mv = {
        0x1,
        0x4,
        0x0
    }
.end annotation


# instance fields
.field private a:Ll/t4f;

.field private final b:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

.field private final c:Ll/t4f$b;
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation
.end field

.field private final d:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/t4f;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/t4f$b;Ljava/util/List;)V
    .locals 0
    .param p1    # Ll/t4f$b;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p2    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/t4f$b;",
            "Ljava/util/List<",
            "+",
            "Ll/t4f;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/t4f;-><init>()V

    .line 5
    .line 6
    .line 7
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c:Ll/t4f$b;

    .line 8
    .line 9
    iput-object p2, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->d:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 12
    .line 13
    invoke-direct {p1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 17
    .line 18
    return-void
.end method

.method public static final synthetic b(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Ll/t4f;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->a:Ll/t4f;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic c(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;)Lcom/immomo/android/network/metrics/NetworkTrackInfo;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 2
    .line 3
    return-object p0
.end method

.method public static final synthetic d(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/t4f;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->a:Ll/t4f;

    .line 2
    .line 3
    return-void
.end method

.method public static final synthetic e(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->h(Ll/ry3;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private final h(Ll/ry3;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 2
    .line 3
    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v1

    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->H(J)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->b:Lcom/immomo/android/network/metrics/NetworkTrackInfo;

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Lcom/immomo/android/network/metrics/NetworkTrackInfo;->Y(Ll/ry3;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public callEnd(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callEnd$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public callFailed(Ll/ry3;Ljava/io/IOException;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/io/IOException;
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
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callFailed$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callFailed$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/io/IOException;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public callStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$callStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public connectEnd(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V
    .locals 6
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/net/InetSocketAddress;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/net/Proxy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lokhttp3/Protocol;
        .annotation build Lorg/jetbrains/annotations/Nullable;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectEnd$1;

    .line 11
    .line 12
    move-object v1, p0

    .line 13
    move-object v2, p1

    .line 14
    move-object v3, p2

    .line 15
    move-object v4, p3

    .line 16
    move-object v5, p4

    .line 17
    invoke-direct/range {v0 .. v5}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;)V

    .line 18
    .line 19
    .line 20
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public connectFailed(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V
    .locals 7
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/net/InetSocketAddress;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/net/Proxy;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p4    # Lokhttp3/Protocol;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param
    .param p5    # Ljava/io/IOException;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 11
    .line 12
    .line 13
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;

    .line 14
    .line 15
    move-object v1, p0

    .line 16
    move-object v2, p1

    .line 17
    move-object v3, p2

    .line 18
    move-object v4, p3

    .line 19
    move-object v5, p4

    .line 20
    move-object v6, p5

    .line 21
    invoke-direct/range {v0 .. v6}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectFailed$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;Lokhttp3/Protocol;Ljava/io/IOException;)V

    .line 22
    .line 23
    .line 24
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public connectStart(Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/net/InetSocketAddress;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/net/Proxy;
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
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectStart$1;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/net/InetSocketAddress;Ljava/net/Proxy;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public connectionAcquired(Ll/ry3;Ll/bx5;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/bx5;
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
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectionAcquired$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$connectionAcquired$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ll/bx5;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public dnsEnd(Ll/ry3;Ljava/lang/String;Ljava/util/List;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p3    # Ljava/util/List;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
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
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 8
    .line 9
    .line 10
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;

    .line 11
    .line 12
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/lang/String;Ljava/util/List;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public dnsStart(Ll/ry3;Ljava/lang/String;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
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
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsStart$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$dnsStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final f()Ljava/util/List;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ll/t4f;",
            ">;"
        }
    .end annotation

    .annotation build Lorg/jetbrains/annotations/NotNull;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->d:Ljava/util/List;

    .line 2
    .line 3
    return-object p0
.end method

.method public final g()Ll/t4f$b;
    .locals 0
    .annotation build Lorg/jetbrains/annotations/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;->c:Ll/t4f$b;

    .line 2
    .line 3
    return-object p0
.end method

.method public requestBodyEnd(Ll/ry3;J)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestBodyEnd$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestBodyEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;J)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public requestBodyStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestBodyStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestBodyStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public requestHeadersEnd(Ll/ry3;Ll/x1d0;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/x1d0;
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
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestHeadersEnd$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestHeadersEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ll/x1d0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public requestHeadersStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestHeadersStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$requestHeadersStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public responseBodyEnd(Ll/ry3;J)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseBodyEnd$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2, p3}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseBodyEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;J)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public responseBodyStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseBodyStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseBodyStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public responseHeadersEnd(Ll/ry3;Ll/i5d0;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/i5d0;
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
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;

    .line 8
    .line 9
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ll/i5d0;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public responseHeadersStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$responseHeadersStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public secureConnectEnd(Ll/ry3;Ll/txk;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param
    .param p2    # Ll/txk;
        .annotation build Lorg/jetbrains/annotations/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$secureConnectEnd$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1, p2}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$secureConnectEnd$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;Ll/txk;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public secureConnectStart(Ll/ry3;)V
    .locals 1
    .param p1    # Ll/ry3;
        .annotation build Lorg/jetbrains/annotations/NotNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$secureConnectStart$1;

    .line 5
    .line 6
    invoke-direct {v0, p0, p1}, Lcom/immomo/android/network/metrics/NetworkMetricsEventListener$secureConnectStart$1;-><init>(Lcom/immomo/android/network/metrics/NetworkMetricsEventListener;Ll/ry3;)V

    .line 7
    .line 8
    .line 9
    invoke-static {v0}, Ll/ok20;->a(Lkotlin/jvm/functions/Function0;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method
