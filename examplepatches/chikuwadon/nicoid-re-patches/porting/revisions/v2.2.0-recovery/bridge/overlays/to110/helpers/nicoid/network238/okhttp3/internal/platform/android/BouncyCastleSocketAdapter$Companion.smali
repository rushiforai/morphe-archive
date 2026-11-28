.class public final Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\n\u00a8\u0006\u000b"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;",
        "",
        "<init>",
        "()V",
        "factory",
        "Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "getFactory",
        "()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;",
        "isSupported",
        "",
        "()Z",
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

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 2

    .line 61
    # getter for: Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->factory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->access$getFactory$cp()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v0

    return-object v0
.end method

.method public final isSupported()Z
    .registers 2

    .line 68
    # getter for: Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->isSupported:Z
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/android/BouncyCastleSocketAdapter;->access$isSupported$cp()Z

    move-result v0

    return v0
.end method
