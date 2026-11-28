.class public final Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000e\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0008\u001a\u00020\t2\u000e\u0010\n\u001a\n\u0012\u0006\u0008\u0000\u0012\u00020\u000c0\u000bH\u0002J\u000e\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;",
        "",
        "<init>",
        "()V",
        "playProviderFactory",
        "Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "getPlayProviderFactory",
        "()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "build",
        "Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;",
        "actualSSLSocketClass",
        "Ljava/lang/Class;",
        "Ljavax/net/ssl/SSLSocket;",
        "factory",
        "packageName",
        "",
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
.method private constructor <init>()V
    .registers 1

    .line 100
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$build(Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;Ljava/lang/Class;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
    .registers 2

    .line 100
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->build(Ljava/lang/Class;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;

    move-result-object p0

    return-object p0
.end method

.method private final build(Ljava/lang/Class;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Class<",
            "-",
            "Ljavax/net/ssl/SSLSocket;",
            ">;)",
            "Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;"
        }
    .end annotation

    move-object v0, p1

    :goto_0
    if-eqz v0, :cond_1

    .line 112
    invoke-virtual {v0}, Ljava/lang/Class;->getSimpleName()Ljava/lang/String;

    move-result-object v1

    const-string v2, "OpenSSLSocketImpl"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_1

    .line 113
    invoke-virtual {v0}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 116
    :cond_0
    new-instance v0, Ljava/lang/AssertionError;

    .line 117
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No OpenSSLSocketImpl superclass of socket of type "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 116
    invoke-direct {v0, p1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 122
    :cond_1
    new-instance p1, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, v0}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;-><init>(Ljava/lang/Class;)V

    return-object p1
.end method


# virtual methods
.method public final factory(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 126
    new-instance v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1;

    invoke-direct {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method public final getPlayProviderFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 2

    .line 101
    # getter for: Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->playProviderFactory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->access$getPlayProviderFactory$cp()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v0

    return-object v0
.end method
