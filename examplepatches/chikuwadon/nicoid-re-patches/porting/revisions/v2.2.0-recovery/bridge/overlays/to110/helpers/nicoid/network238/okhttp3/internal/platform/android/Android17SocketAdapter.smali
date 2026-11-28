.class public final Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\t\u0008\u0001\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u0008\u001a\u00020\u0005H\u0016J\u0012\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J2\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\r\u001a\u0004\u0018\u00010\n2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016\u00a8\u0006\u0014"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter;",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
        "<init>",
        "()V",
        "matchesSocket",
        "",
        "sslSocket",
        "Ljavax/net/ssl/SSLSocket;",
        "isSupported",
        "getSelectedProtocol",
        "",
        "configureTlsExtensions",
        "",
        "hostname",
        "protocols",
        "",
        "Lnicoid/network238/okhttp3/Protocol;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    const/4 v0, 0x1

    invoke-static {p1, v0}, Landroid/net/ssl/SSLSockets;->setUseSessionTickets(Ljavax/net/ssl/SSLSocket;Z)V

    .line 65
    :try_start_0
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getSSLParameters()Ljavax/net/ssl/SSLParameters;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_1

    .line 75
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v1, p3}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->alpnProtocolNames(Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    .line 109
    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/String;

    invoke-interface {p3, v1}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/lang/String;

    .line 75
    invoke-virtual {v0, p3}, Ljavax/net/ssl/SSLParameters;->setApplicationProtocols([Ljava/lang/String;)V

    .line 77
    invoke-virtual {p1, v0}, Ljavax/net/ssl/SSLSocket;->setSSLParameters(Ljavax/net/ssl/SSLParameters;)V

    if-eqz p2, :cond_0

    if-eqz p4, :cond_0

    .line 86
    :try_start_1
    invoke-virtual {p4}, Lnicoid/network238/okio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-static {p2}, Landroid/net/ssl/EchConfigList;->fromBytes([B)Landroid/net/ssl/EchConfigList;

    move-result-object p2
    :try_end_1
    .catch Landroid/net/ssl/InvalidEchDataException; {:try_start_1 .. :try_end_1} :catch_0

    goto :goto_0

    :catch_0
    move-exception p2

    const/4 p2, 0x0

    :goto_0
    if-eqz p2, :cond_0

    .line 94
    invoke-static {p1, p2}, Landroid/net/ssl/SSLSockets;->setEchConfigList(Ljavax/net/ssl/SSLSocket;Landroid/net/ssl/EchConfigList;)V

    :cond_0
    return-void

    :catch_1
    move-exception p1

    .line 71
    new-instance p2, Ljava/io/IOException;

    const-string p3, "Android internal error"

    invoke-direct {p2, p3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p2
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 50
    invoke-virtual {p1}, Ljavax/net/ssl/SSLSocket;->getApplicationProtocol()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 51
    const-string v0, ""

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isSupported()Z
    .registers 2

    .line 45
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;->isSupported()Z

    move-result v0

    return v0
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 43
    invoke-static {p1}, Landroid/net/ssl/SSLSockets;->isSupportedSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result p1

    return p1
.end method
