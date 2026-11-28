.class public final Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->factory(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
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
        "nicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1",
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


# instance fields
.field final synthetic $packageName:Ljava/lang/String;


# direct methods
.method constructor <init>(Ljava/lang/String;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1;->$packageName:Ljava/lang/String;

    .line 126
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public create(Ljavax/net/ssl/SSLSocket;)Lnicoid/network238/okhttp3/internal/platform/android/SocketAdapter;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    sget-object v0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;->Companion:Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    # invokes: Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->build(Ljava/lang/Class;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;
    invoke-static {v0, p1}, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;->access$build(Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion;Ljava/lang/Class;)Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter;

    move-result-object p1

    return-object p1
.end method

.method public matchesSocket(Ljavax/net/ssl/SSLSocket;)Z
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/platform/android/AndroidSocketAdapter$Companion$factory$1;->$packageName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x2e

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-static {p1, v0, v3, v1, v2}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result p1

    return p1
.end method
