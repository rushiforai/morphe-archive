.class public final Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u0000 \u00132\u00020\u0001:\u0001\u0013B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u0008\u001a\u00020\u0005H\u0016J\u0012\u0010\t\u001a\u0004\u0018\u00010\n2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J2\u0010\u000b\u001a\u00020\u000c2\u0006\u0010\u0006\u001a\u00020\u00072\u0008\u0010\r\u001a\u0004\u0018\u00010\n2\u000c\u0010\u000e\u001a\u0008\u0012\u0004\u0012\u00020\u00100\u000f2\u0008\u0010\u0011\u001a\u0004\u0018\u00010\u0012H\u0016\u00a8\u0006\u0014"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

.field private static final factory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

.field private static final isSupported:Z


# direct methods
.method static constructor <clinit>()V
    .registers 3

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

    .line 62
    new-instance v1, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion$factory$1;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion$factory$1;-><init>()V

    sput-object v1, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->factory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    .line 71
    const/4 v1, 0x0

    :try_start_0
    const-string v2, "org.bouncycastle.jsse.provider.BouncyCastleJsseProvider"

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getClassLoader()Ljava/lang/ClassLoader;

    move-result-object v0

    invoke-static {v2, v1, v0}, Ljava/lang/Class;->forName(Ljava/lang/String;ZLjava/lang/ClassLoader;)Ljava/lang/Class;
    :try_end_0
    .catch Ljava/lang/ClassNotFoundException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 v1, 0x1

    goto :goto_0

    :catch_0
    move-exception v0

    .line 69
    :goto_0
    sput-boolean v1, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->isSupported:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 27
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static final synthetic access$getFactory$cp()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 1

    .line 27
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->factory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    return-object v0
.end method

.method public static final synthetic access$isSupported$cp()Z
    .registers 1

    .line 27
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->isSupported:Z

    return v0
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 5
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

    .line 48
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 49
    check-cast p1, Lorg/bouncycastle/jsse/BCSSLSocket;

    .line 51
    invoke-interface {p1}, Lorg/bouncycastle/jsse/BCSSLSocket;->getParameters()Lorg/bouncycastle/jsse/BCSSLParameters;

    move-result-object p2

    .line 54
    sget-object p4, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {p4, p3}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->alpnProtocolNames(Ljava/util/List;)Ljava/util/List;

    move-result-object p3

    .line 81
    const/4 p4, 0x0

    new-array p4, p4, [Ljava/lang/String;

    invoke-interface {p3, p4}, Ljava/util/Collection;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p3

    check-cast p3, [Ljava/lang/String;

    .line 54
    invoke-virtual {p2, p3}, Lorg/bouncycastle/jsse/BCSSLParameters;->setApplicationProtocols([Ljava/lang/String;)V

    .line 56
    invoke-interface {p1, p2}, Lorg/bouncycastle/jsse/BCSSLSocket;->setParameters(Lorg/bouncycastle/jsse/BCSSLParameters;)V

    :cond_0
    return-void
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    check-cast p1, Lorg/bouncycastle/jsse/BCSSLSocket;

    .line 35
    invoke-interface {p1}, Lorg/bouncycastle/jsse/BCSSLSocket;->getApplicationProtocol()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 36
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

    .line 30
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->isSupported:Z

    return v0
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 28
    instance-of p1, p1, Lorg/bouncycastle/jsse/BCSSLSocket;

    return p1
.end method
