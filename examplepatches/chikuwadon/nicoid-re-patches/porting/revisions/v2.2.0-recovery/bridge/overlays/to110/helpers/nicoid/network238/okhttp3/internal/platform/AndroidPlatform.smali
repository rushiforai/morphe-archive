.class public final Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;
.super Lnicoid/network238/okhttp3/internal/platform/Platform;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;,
        Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$CustomTrustRootIndex;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u008e\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0008\u0007\u0018\u0000 >2\u00020\u00012\u00020\u0002:\u0002?>B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\'\u0010\u000c\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0008\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\tH\u0016\u00a2\u0006\u0004\u0008\u000c\u0010\rJ\u000f\u0010\u000f\u001a\u00020\u000eH\u0016\u00a2\u0006\u0004\u0008\u000f\u0010\u0010J\u0019\u0010\u0014\u001a\u0004\u0018\u00010\u00132\u0006\u0010\u0012\u001a\u00020\u0011H\u0016\u00a2\u0006\u0004\u0008\u0014\u0010\u0015J9\u0010\u001f\u001a\u00020\u000b2\u0006\u0010\u0017\u001a\u00020\u00162\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u00182\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u001b0\u001a2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001dH\u0016\u00a2\u0006\u0004\u0008\u001f\u0010 J\u0019\u0010!\u001a\u0004\u0018\u00010\u00182\u0006\u0010\u0017\u001a\u00020\u0016H\u0016\u00a2\u0006\u0004\u0008!\u0010\"J\u0017\u0010$\u001a\u00020#2\u0006\u0010\u0019\u001a\u00020\u0018H\u0016\u00a2\u0006\u0004\u0008$\u0010%J\u0017\u0010\'\u001a\u00020&2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008\'\u0010(J\u0017\u0010*\u001a\u00020)2\u0006\u0010\u0014\u001a\u00020\u0013H\u0016\u00a2\u0006\u0004\u0008*\u0010+J\u001d\u0010,\u001a\u0008\u0012\u0004\u0012\u00020\u00180\u001a2\u0006\u0010\u0017\u001a\u00020\u0016H\u0016\u00a2\u0006\u0004\u0008,\u0010-J)\u00102\u001a\u00020\u000b2\u0006\u0010.\u001a\u00020\u00182\u0006\u0010/\u001a\u00020\t2\u0008\u00101\u001a\u0004\u0018\u000100H\u0016\u00a2\u0006\u0004\u00082\u00103R$\u00105\u001a\u0004\u0018\u0001048\u0016@\u0016X\u0096\u000e\u00a2\u0006\u0012\n\u0004\u00085\u00106\u001a\u0004\u00087\u00108\"\u0004\u00089\u0010:R\u001a\u0010<\u001a\u0008\u0012\u0004\u0012\u00020;0\u001a8\u0002X\u0082\u0004\u00a2\u0006\u0006\n\u0004\u0008<\u0010=\u00a8\u0006@"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;",
        "Lnicoid/network238/okhttp3/internal/platform/Platform;",
        "Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;",
        "<init>",
        "()V",
        "Ljava/net/Socket;",
        "socket",
        "Ljava/net/InetSocketAddress;",
        "address",
        "",
        "connectTimeout",
        "",
        "connectSocket",
        "(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V",
        "Ljavax/net/ssl/SSLContext;",
        "newSSLContext",
        "()Ljavax/net/ssl/SSLContext;",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "sslSocketFactory",
        "Ljavax/net/ssl/X509TrustManager;",
        "trustManager",
        "(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;",
        "Ljavax/net/ssl/SSLSocket;",
        "sslSocket",
        "",
        "hostname",
        "",
        "Lnicoid/network238/okhttp3/Protocol;",
        "protocols",
        "Lnicoid/network238/okio/ByteString;",
        "echConfigList",
        "configureTlsExtensions",
        "(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V",
        "getSelectedProtocol",
        "(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;",
        "",
        "isCleartextTrafficPermitted",
        "(Ljava/lang/String;)Z",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "buildCertificateChainCleaner",
        "(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;",
        "buildTrustRootIndex",
        "(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;",
        "getHandshakeServerNames",
        "(Ljavax/net/ssl/SSLSocket;)Ljava/util/List;",
        "message",
        "level",
        "",
        "t",
        "log",
        "(Ljava/lang/String;ILjava/lang/Throwable;)V",
        "Landroid/content/Context;",
        "applicationContext",
        "Landroid/content/Context;",
        "getApplicationContext",
        "()Landroid/content/Context;",
        "setApplicationContext",
        "(Landroid/content/Context;)V",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
        "socketAdapters",
        "Ljava/util/List;",
        "Companion",
        "CustomTrustRootIndex",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

.field private static final Tag:Ljava/lang/String;

.field private static final isSupported:Z


# instance fields
.field private applicationContext:Landroid/content/Context;

.field private final socketAdapters:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    .line 181
    const-string v0, "OkHttp"

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Tag:Ljava/lang/String;

    .line 183
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->isAndroid()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->isSupported:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .line 48
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform;-><init>()V

    .line 56
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-static {v0, v1, v2, v1}, Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;->buildIfSupported$default(Lnicoid/network238/okhttp3/internal/platform/android/StandardAndroidSocketAdapter$Companion;Ljava/lang/String;ILjava/lang/Object;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object v0

    .line 57
    new-instance v1, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v3, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->getPlayProviderFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v3

    invoke-direct {v1, v3}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    .line 59
    new-instance v3, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v4, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;->getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v4

    invoke-direct {v3, v4}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    .line 60
    new-instance v4, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v5, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;->getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v5

    invoke-direct {v4, v5}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    const/4 v5, 0x4

    new-array v5, v5, [Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    aput-object v1, v5, v2

    const/4 v0, 0x2

    aput-object v3, v5, v0

    const/4 v0, 0x3

    aput-object v4, v5, v0

    .line 55
    invoke-static {v5}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 189
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 190
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    move-object v3, v2

    check-cast v3, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    .line 61
    invoke-interface {v3}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->isSupported()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 190
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 61
    :cond_1
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->socketAdapters:Ljava/util/List;

    return-void
.end method

.method public static final synthetic access$getTag$cp()Ljava/lang/String;
    .registers 1

    .line 48
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Tag:Ljava/lang/String;

    return-object v0
.end method

.method public static final synthetic access$isSupported$cp()Z
    .registers 1

    .line 48
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->isSupported:Z

    return v0
.end method


# virtual methods
.method public buildCertificateChainCleaner(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 117
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidCertificateChainCleaner;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidCertificateChainCleaner$Companion;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidCertificateChainCleaner$Companion;->buildIfSupported(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidCertificateChainCleaner;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    :cond_0
    invoke-super {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->buildCertificateChainCleaner(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;

    move-result-object p1

    return-object p1
.end method

.method public buildTrustRootIndex(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 121
    :try_start_0
    const-string v0, "buildTrustRootIndex"

    invoke-static {v0}, Landroid/os/StrictMode;->noteSlowCall(Ljava/lang/String;)V

    .line 126
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    .line 127
    const-string v1, "findTrustAnchorByIssuerAndSignature"

    .line 128
    const/4 v2, 0x1

    new-array v3, v2, [Ljava/lang/Class;

    const-class v4, Ljava/security/cert/X509Certificate;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 126
    invoke-virtual {v0, v1, v3}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v0

    .line 130
    invoke-virtual {v0, v2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 131
    new-instance v1, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$CustomTrustRootIndex;

    invoke-direct {v1, p1, v0}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$CustomTrustRootIndex;-><init>(Ljavax/net/ssl/X509TrustManager;Ljava/lang/reflect/Method;)V
    :try_end_0
    .catch Ljava/lang/NoSuchMethodException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v1

    :catch_0
    move-exception v0

    .line 133
    invoke-super {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->buildTrustRootIndex(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;

    move-result-object p1

    return-object p1
.end method

.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 100
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->socketAdapters:Ljava/util/List;

    .line 101
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    invoke-interface {v2, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result v2

    if-eqz v2, :cond_0

    goto :goto_0

    :cond_1
    const/4 v1, 0x0

    :goto_0
    check-cast v1, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    if-eqz v1, :cond_2

    .line 102
    invoke-interface {v1, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V

    :cond_2
    return-void
.end method

.method public connectSocket(Ljava/net/Socket;Ljava/net/InetSocketAddress;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 70
    :try_start_0
    invoke-virtual {p1, p2, p3}, Ljava/net/Socket;->connect(Ljava/net/SocketAddress;I)V
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 74
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 77
    throw p1
.end method

.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getHandshakeServerNames(Ljavax/net/ssl/SSLSocket;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljavax/net/ssl/SSLSocket;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 138
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 139
    invoke-super {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getHandshakeServerNames(Ljavax/net/ssl/SSLSocket;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 107
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->socketAdapters:Ljava/util/List;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    invoke-interface {v3, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    check-cast v1, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    if-eqz v1, :cond_2

    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v2
.end method

.method public isCleartextTrafficPermitted(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 111
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public log(Ljava/lang/String;ILjava/lang/Throwable;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 150
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Tag:Ljava/lang/String;

    const/4 v1, 0x5

    if-ne p2, v1, :cond_0

    .line 148
    invoke-static {v0, p1, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    .line 150
    :cond_0
    invoke-static {v0, p1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public newSSLContext()Ljavax/net/ssl/SSLContext;
    .registers 2

    .line 83
    const-string v0, "newSSLContext"

    invoke-static {v0}, Landroid/os/StrictMode;->noteSlowCall(Ljava/lang/String;)V

    .line 85
    invoke-super {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->newSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    return-object v0
.end method

.method public setApplicationContext(Landroid/content/Context;)V
    .registers 2

    .line 52
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method public trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->socketAdapters:Ljava/util/List;

    .line 90
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    invoke-interface {v3, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->matchesSocketFactory(Ljavax/net/ssl/SSLSocketFactory;)Z

    move-result v3

    if-eqz v3, :cond_0

    goto :goto_0

    :cond_1
    move-object v1, v2

    :goto_0
    check-cast v1, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    if-eqz v1, :cond_2

    .line 91
    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v2
.end method
