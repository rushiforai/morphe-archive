.class public final Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000>\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0018\u00002\u00020\u0001:\u0001\u0017B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u0007\u001a\u00020\u0008H\u0016J\u0010\u0010\t\u001a\u00020\u00082\u0006\u0010\n\u001a\u00020\u000bH\u0016J2\u0010\u000c\u001a\u00020\r2\u0006\u0010\n\u001a\u00020\u000b2\u0008\u0010\u000e\u001a\u0004\u0018\u00010\u000f2\u000c\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00120\u00112\u0008\u0010\u0013\u001a\u0004\u0018\u00010\u0014H\u0016J\u0012\u0010\u0015\u001a\u0004\u0018\u00010\u000f2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u0012\u0010\u0016\u001a\u0004\u0018\u00010\u00012\u0006\u0010\n\u001a\u00020\u000bH\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0001X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;",
        "Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;",
        "socketAdapterFactory",
        "Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V",
        "delegate",
        "isSupported",
        "",
        "matchesSocket",
        "sslSocket",
        "Ljavax/net/ssl/SSLSocket;",
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
        "getDelegate",
        "Factory",
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


# instance fields
.field private delegate:Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

.field private final socketAdapterFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->socketAdapterFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    return-void
.end method

.method private final declared-synchronized getDelegate(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;
    .registers 3

    monitor-enter p0

    .line 51
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->delegate:Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->socketAdapterFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->socketAdapterFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;->create(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->delegate:Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    .line 55
    :cond_0
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->delegate:Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object p1

    .line 50
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
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

    .line 45
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->getDelegate(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->configureTlsExtensions(Ljavax/net/ssl/SSLSocket;Ljava/lang/String;Ljava/util/List;Lnicoid/network238/okio/ByteString;)V

    :cond_0
    return-void
.end method

.method public getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->getDelegate(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;

    move-result-object v0

    if-eqz v0, :cond_0

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;->getSelectedProtocol(Ljavax/net/ssl/SSLSocket;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public isSupported()Z
    .registers 2

    const/4 v0, 0x1

    return v0
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter;->socketAdapterFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    invoke-interface {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;->matchesSocket(Ljavax/net/ssl/SSLSocket;)Z

    move-result p1

    return p1
.end method
