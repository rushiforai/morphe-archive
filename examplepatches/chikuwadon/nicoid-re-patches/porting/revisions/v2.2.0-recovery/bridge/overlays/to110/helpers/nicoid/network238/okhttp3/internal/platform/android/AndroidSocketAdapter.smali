.class public Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000D\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0016\u0018\u0000 \u001b2\u00020\u0001:\u0001\u001bB\u0017\u0012\u000e\u0010\u0002\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u00040\u0003\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\r\u001a\u00020\u000eH\u0016J\u0010\u0010\u000f\u001a\u00020\u000e2\u0006\u0010\u0010\u001a\u00020\u0004H\u0016J2\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0010\u001a\u00020\u00042\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u00142\u000c\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u00162\u0008\u0010\u0018\u001a\u0004\u0018\u00010\u0019H\u0016J\u0012\u0010\u001a\u001a\u0004\u0018\u00010\u00142\u0006\u0010\u0010\u001a\u00020\u0004H\u0016R\u0016\u0010\u0002\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u00040\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\t\u001a\n \n*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000b\u001a\n \n*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0016\u0010\u000c\u001a\n \n*\u0004\u0018\u00010\u00080\u0008X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
        "sslSocketClass",
        "Ljava/lang/Class;",
        "Ljavax/net/ssl/SSLSocket;",
        "<init>",
        "(Ljava/lang/Class;)V",
        "setUseSessionTickets",
        "Ljava/lang/reflect/Method;",
        "setHostname",
        "nicoid.network238.kotlin.jvm.PlatformType",
        "getAlpnSelectedProtocol",
        "setAlpnProtocols",
        "isSupported",
        "",
        "matchesSocket",
        "sslSocket",
        "configureTlsExtensions",
        "",
        "hostname",
        "",
        "protocols",
        "",
        "Lnicoid/network238/okhttp3/Protocol;",
        "echConfigList",
        "Lnicoid/network238/okio/ByteString;",
        "getSelectedProtocol",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

.field private static final playProviderFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;


# instance fields
.field private final getAlpnSelectedProtocol:Ljava/lang/reflect/Method;

.field private final setAlpnProtocols:Ljava/lang/reflect/Method;

.field private final setHostname:Ljava/lang/reflect/Method;

.field private final setUseSessionTickets:Ljava/lang/reflect/Method;

.field private final sslSocketClass:Ljava/lang/Class;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocket;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

    .line 102
    const-string v1, "com.google.android.gms.org.conscrypt"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->factory(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->playProviderFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    return-void
.end method

.method public constructor <init>(Ljava/lang/Class;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocket;",
            ">;)V"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->sslSocketClass:Ljava/lang/Class;

    .line 38
    const/4 v0, 0x1

    new-array v1, v0, [Ljava/lang/Class;

    sget-object v2, Ljava/lang/Boolean;->TYPE:Ljava/lang/Class;

    const/4 v3, 0x0

    aput-object v2, v1, v3

    const-string v2, "setUseSessionTickets"

    invoke-virtual {p1, v2, v1}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->setUseSessionTickets:Ljava/lang/reflect/Method;

    .line 39
    new-array v1, v0, [Ljava/lang/Class;

    const-class v2, Ljava/lang/String;

    aput-object v2, v1, v3

    const-string v2, "setHostname"

    invoke-virtual {p1, v2, v1}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->setHostname:Ljava/lang/reflect/Method;

    .line 40
    const-string v1, "getAlpnSelectedProtocol"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->getAlpnSelectedProtocol:Ljava/lang/reflect/Method;

    .line 42
    new-array v0, v0, [Ljava/lang/Class;

    const-class v1, [B

    aput-object v1, v0, v3

    const-string v1, "setAlpnProtocols"

    invoke-virtual {p1, v1, v0}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->setAlpnProtocols:Ljava/lang/reflect/Method;

    return-void
.end method

.method public static final synthetic access$getPlayProviderFactory$cp()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 1

    .line 34
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->playProviderFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    return-object v0
.end method


# virtual methods
.method public configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V
    .registers 6
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

    .line 55
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result p4

    if-eqz p4, :cond_1

    .line 58
    :try_start_0
    iget-object p4, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->setUseSessionTickets:Ljava/lang/reflect/Method;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p4, p1, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz p2, :cond_0

    .line 61
    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 67
    :cond_0
    iget-object p2, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->setAlpnProtocols:Ljava/lang/reflect/Method;

    .line 69
    sget-object p4, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {p4, p3}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->concatLengthPrefixed(Ljava/util/List;)[B

    move-result-object p3

    filled-new-array {p3}, [Ljava/lang/Object;

    move-result-object p3

    .line 67
    invoke-virtual {p2, p1, p3}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p1

    .line 74
    new-instance p2, Ljava/lang/AssertionError;

    invoke-direct {p2, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    :catch_1
    move-exception p1

    .line 72
    new-instance p2, Ljava/lang/AssertionError;

    invoke-direct {p2, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p2

    :cond_1
    return-void
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    goto :goto_0

    .line 86
    :cond_0
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->getAlpnSelectedProtocol:Ljava/lang/reflect/Method;

    invoke-virtual {v0, p1, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, [B

    if-eqz p1, :cond_1

    .line 87
    new-instance v0, Ljava/lang/String;

    sget-object v2, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-direct {v0, p1, v2}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V
    :try_end_0
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-object v0

    :catch_0
    move-exception p1

    .line 92
    invoke-virtual {p1}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    .line 94
    instance-of v2, v0, Ljava/lang/NullPointerException;

    if-eqz v2, :cond_2

    check-cast v0, Ljava/lang/NullPointerException;

    invoke-virtual {v0}, Ljava/lang/NullPointerException;->getMessage()Ljava/lang/String;

    move-result-object v0

    const-string v2, "ssl == null"

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    :cond_1
    :goto_0
    return-object v1

    .line 95
    :cond_2
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    :catch_1
    move-exception p1

    .line 89
    new-instance v0, Ljava/lang/AssertionError;

    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0
.end method

.method public isSupported()Z
    .registers 2

    .line 44
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform;->Companion:Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/AndroidPlatform$Companion;->isSupported()Z

    move-result v0

    return v0
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->sslSocketClass:Ljava/lang/Class;

    invoke-virtual {v0, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method
