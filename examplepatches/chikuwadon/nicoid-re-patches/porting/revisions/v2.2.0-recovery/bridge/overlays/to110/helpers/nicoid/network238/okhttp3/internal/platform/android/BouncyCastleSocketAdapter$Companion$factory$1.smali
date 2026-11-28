.class public final Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion$factory$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001d\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0010\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u0005H\u0016J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0004\u001a\u00020\u0005H\u0016\u00a8\u0006\u0008"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion$factory$1",
        "Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "matchesSocket",
        "",
        "sslSocket",
        "Ljavax/net/ssl/SSLSocket;",
        "create",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
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


# direct methods
.method constructor <init>()V
    .registers 1

    .line 62
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 65
    new-instance p1, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;-><init>()V

    return-object p1
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;->isSupported()Z

    move-result v0

    if-eqz v0, :cond_0

    instance-of p1, p1, Lorg/bouncycastle/jsse/BCSSLSocket;

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
