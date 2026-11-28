.class public final Lnicoid/network238/okhttp3/internal/platform/Android10Platform;
.super Lnicoid/network238/okhttp3/internal/platform/Platform;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u008a\u0001\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0002\u0008\u0007\u0018\u0000 42\u00020\u00012\u00020\u0002:\u00014B\u0007\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u0012\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0008\u0010\u0012\u001a\u00020\u0013H\u0016J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J2\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00192\u0008\u0010\u001a\u001a\u0004\u0018\u00010\u001b2\u000c\u0010\u001c\u001a\u0008\u0012\u0004\u0012\u00020\u001d0\u000c2\u0008\u0010\u001e\u001a\u0004\u0018\u00010\u001fH\u0016J\u0012\u0010 \u001a\u0004\u0018\u00010!2\u0006\u0010\"\u001a\u00020#H\u0017J\u0012\u0010$\u001a\u0004\u0018\u00010\u001b2\u0006\u0010\u0018\u001a\u00020\u0019H\u0016J\u0012\u0010%\u001a\u0004\u0018\u00010&2\u0006\u0010\'\u001a\u00020\u001bH\u0016J\u001a\u0010(\u001a\u00020\u00172\u0006\u0010)\u001a\u00020\u001b2\u0008\u0010*\u001a\u0004\u0018\u00010&H\u0016J\u0010\u0010+\u001a\u00020,2\u0006\u0010\u001a\u001a\u00020\u001bH\u0017J\u0010\u0010-\u001a\u00020.2\u0006\u0010\u000e\u001a\u00020\u000fH\u0016J\"\u0010/\u001a\u00020\u00172\u0006\u0010)\u001a\u00020\u001b2\u0006\u00100\u001a\u0002012\u0008\u00102\u001a\u0004\u0018\u000103H\u0016R\u001c\u0010\u0005\u001a\u0004\u0018\u00010\u0006X\u0096\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008\"\u0004\u0008\t\u0010\nR\u0014\u0010\u000b\u001a\u0008\u0012\u0004\u0012\u00020\r0\u000cX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u00065"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/Android10Platform;",
        "Lnicoid/network238/okhttp3/internal/platform/Platform;",
        "Lnicoid/network238/okhttp3/internal/platform/ContextAwarePlatform;",
        "<init>",
        "()V",
        "applicationContext",
        "Landroid/content/Context;",
        "getApplicationContext",
        "()Landroid/content/Context;",
        "setApplicationContext",
        "(Landroid/content/Context;)V",
        "socketAdapters",
        "",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
        "trustManager",
        "Ljavax/net/ssl/X509TrustManager;",
        "sslSocketFactory",
        "Ljavax/net/ssl/SSLSocketFactory;",
        "newSSLContext",
        "Ljavax/net/ssl/SSLContext;",
        "buildTrustRootIndex",
        "Lnicoid/network238/okhttp3/internal/tls/TrustRootIndex;",
        "configureTlsExtensions",
        "",
        "sslSocket",
        "Ljavax/net/ssl/SSLSocket;",
        "hostname",
        "",
        "protocols",
        "Lnicoid/network238/okhttp3/Protocol;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "echRetryPlan",
        "Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;",
        "exception",
        "Ljavax/net/ssl/SSLException;",
        "getSelectedProtocol",
        "getStackTraceForCloseable",
        "",
        "closer",
        "logCloseableLeak",
        "message",
        "stackTrace",
        "isCleartextTrafficPermitted",
        "",
        "buildCertificateChainCleaner",
        "Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;",
        "log",
        "level",
        "",
        "t",
        "",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;

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

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Android10Platform$Companion;

    .line 147
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->isAndroid()Z

    move-result v0

    if-eqz v0, :cond_0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1d

    if-lt v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    sput-boolean v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->isSupported:Z

    return-void
.end method

.method public constructor <init>()V
    .registers 8

    .line 48
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform;-><init>()V

    .line 56
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/android/Android17SocketAdapter$Companion;->buildIfSupported()Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object v0

    .line 57
    sget-object v1, Lnicoid/network238/okhttp3/internal/platform/android/Android10SocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/Android10SocketAdapter$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/platform/android/Android10SocketAdapter$Companion;->buildIfSupported()Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object v1

    .line 58
    new-instance v2, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v3, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->getPlayProviderFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v3

    invoke-direct {v2, v3}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    .line 60
    new-instance v3, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v4, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;->getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v4

    invoke-direct {v3, v4}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    .line 61
    new-instance v4, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;

    sget-object v5, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

    invoke-virtual {v5}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;->getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v5

    invoke-direct {v4, v5}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;-><init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V

    const/4 v5, 0x5

    new-array v5, v5, [Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    const/4 v6, 0x0

    aput-object v0, v5, v6

    const/4 v0, 0x1

    aput-object v1, v5, v0

    const/4 v0, 0x2

    aput-object v2, v5, v0

    const/4 v0, 0x3

    aput-object v3, v5, v0

    const/4 v0, 0x4

    aput-object v4, v5, v0

    .line 55
    invoke-static {v5}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOfNotNull([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    .line 153
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 154
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

    .line 62
    invoke-interface {v3}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->isSupported()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 154
    invoke-interface {v1, v2}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 62
    :cond_1
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->socketAdapters:Ljava/util/List;

    return-void
.end method

.method public static final synthetic access$isSupported$cp()Z
    .registers 1

    .line 48
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->isSupported:Z

    return v0
.end method


# virtual methods
.method public buildCertificateChainCleaner(Ljavax/net/ssl/X509TrustManager;)Lnicoid/network238/okhttp3/internal/tls/CertificateChainCleaner;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 132
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
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 76
    const-string v0, "buildTrustRootIndex"

    invoke-static {v0}, Landroid/os/StrictMode;->noteSlowCall(Ljava/lang/String;)V

    .line 78
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
            "+",
            "Lnicoid/network238/okhttp3/Protocol;",
            ">;",
            "Lnicoid/network238/okio/ByteString;",
            ")V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->socketAdapters:Ljava/util/List;

    .line 89
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

    .line 90
    invoke-interface {v1, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V

    :cond_2
    return-void
.end method

.method public echRetryPlan(Ljavax/net/ssl/SSLException;)Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x25

    const/4 v2, 0x0

    if-lt v0, v1, :cond_2

    instance-of v0, p1, Landroid/net/ssl/EchConfigMismatchException;

    if-eqz v0, :cond_2

    .line 97
    check-cast p1, Landroid/net/ssl/EchConfigMismatchException;

    invoke-virtual {p1}, Landroid/net/ssl/EchConfigMismatchException;->getPublicHostname()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 98
    :cond_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;->Companion:Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan$Companion;

    .line 100
    invoke-virtual {p1}, Landroid/net/ssl/EchConfigMismatchException;->getRetryConfigList()Landroid/net/ssl/EchConfigList;

    move-result-object p1

    if-eqz p1, :cond_1

    invoke-virtual {p1}, Landroid/net/ssl/EchConfigList;->toBytes()[B

    move-result-object v4

    if-eqz v4, :cond_1

    sget-object v3, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const/4 v7, 0x3

    const/4 v8, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okio/ByteString$Companion;->of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v2

    .line 98
    :cond_1
    invoke-virtual {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan$Companion;->getOrNull(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/internal/ech/EchRetryPlan;

    move-result-object p1

    return-object p1

    :cond_2
    :goto_0
    return-object v2
.end method

.method public getApplicationContext()Landroid/content/Context;
    .registers 2

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->applicationContext:Landroid/content/Context;

    return-object v0
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 106
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->socketAdapters:Ljava/util/List;

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

.method public getStackTraceForCloseable(Ljava/lang/String;)Ljava/lang/Object;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 109
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 110
    new-instance v0, Landroid/util/CloseGuard;

    invoke-direct {v0}, Landroid/util/CloseGuard;-><init>()V

    invoke-virtual {v0, p1}, Landroid/util/CloseGuard;->open(Ljava/lang/String;)V

    return-object v0

    .line 112
    :cond_0
    invoke-super {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/Platform;->getStackTraceForCloseable(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public isCleartextTrafficPermitted(Ljava/lang/String;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    invoke-static {}, Landroid/security/NetworkSecurityPolicy;->getInstance()Landroid/security/NetworkSecurityPolicy;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/security/NetworkSecurityPolicy;->isCleartextTrafficPermitted(Ljava/lang/String;)Z

    move-result p1

    return p1
.end method

.method public log(Ljava/lang/String;ILjava/lang/Throwable;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x5

    if-ne p2, v0, :cond_0

    .line 140
    sget-object p2, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;->getTag()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1, p3}, Landroid/util/Log;->w(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void

    .line 142
    :cond_0
    sget-object p2, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    invoke-virtual {p2}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;->getTag()Ljava/lang/String;

    move-result-object p2

    invoke-static {p2, p1, p3}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    return-void
.end method

.method public logCloseableLeak(Ljava/lang/String;Ljava/lang/Object;)V
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 119
    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x1e

    if-lt v0, v1, :cond_0

    .line 120
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p2, Landroid/util/CloseGuard;

    invoke-virtual {p2}, Landroid/util/CloseGuard;->warnIfOpen()V

    return-void

    .line 123
    :cond_0
    invoke-super {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/platform/Platform;->logCloseableLeak(Ljava/lang/String;Ljava/lang/Object;)V

    return-void
.end method

.method public newSSLContext()Ljavax/net/ssl/SSLContext;
    .registers 2

    .line 70
    const-string v0, "newSSLContext"

    invoke-static {v0}, Landroid/os/StrictMode;->noteSlowCall(Ljava/lang/String;)V

    .line 72
    invoke-super {p0}, Lnicoid/network238/okhttp3/internal/platform/Platform;->newSSLContext()Ljavax/net/ssl/SSLContext;

    move-result-object v0

    return-object v0
.end method

.method public setApplicationContext(Landroid/content/Context;)V
    .registers 2

    .line 52
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->applicationContext:Landroid/content/Context;

    return-void
.end method

.method public trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/Android10Platform;->socketAdapters:Ljava/util/List;

    .line 66
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

    .line 67
    invoke-interface {v1, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->trustManager(Ljavax/net/ssl/SSLSocketFactory;)Ljavax/net/ssl/X509TrustManager;

    move-result-object p1

    return-object p1

    :cond_2
    return-object v2
.end method
