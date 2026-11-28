.class public final Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000$\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\"\u0010\u000b\u001a\u00020\t2\u0006\u0010\u000c\u001a\u00020\r2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\r2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\rR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0011\u0010\u0008\u001a\u00020\t\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\n\u00a8\u0006\u0010"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;",
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
        "atLeastVersion",
        "major",
        "",
        "minor",
        "patch",
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

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;-><init>()V

    return-void
.end method

.method public static synthetic atLeastVersion$default(Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;IIIILjava/lang/Object;)Z
    .registers 7

    and-int/lit8 p5, p4, 0x2

    const/4 v0, 0x0

    if-eqz p5, :cond_0

    move p2, v0

    :cond_0
    and-int/lit8 p4, p4, 0x4

    if-eqz p4, :cond_1

    move p3, v0

    .line 81
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter$Companion;->atLeastVersion(III)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final atLeastVersion(III)Z
    .registers 6

    .line 86
    invoke-static {}, Lorg/conscrypt/Conscrypt;->version()Lorg/conscrypt/Conscrypt$Version;

    move-result-object v0

    if-nez v0, :cond_0

    goto :goto_1

    .line 88
    :cond_0
    invoke-virtual {v0}, Lorg/conscrypt/Conscrypt$Version;->major()I

    move-result v1

    if-eq v1, p1, :cond_1

    .line 89
    invoke-virtual {v0}, Lorg/conscrypt/Conscrypt$Version;->major()I

    move-result p2

    if-le p2, p1, :cond_3

    goto :goto_0

    .line 92
    :cond_1
    invoke-virtual {v0}, Lorg/conscrypt/Conscrypt$Version;->minor()I

    move-result p1

    if-eq p1, p2, :cond_2

    .line 93
    invoke-virtual {v0}, Lorg/conscrypt/Conscrypt$Version;->minor()I

    move-result p1

    if-le p1, p2, :cond_3

    goto :goto_0

    .line 96
    :cond_2
    invoke-virtual {v0}, Lorg/conscrypt/Conscrypt$Version;->patch()I

    move-result p1

    if-lt p1, p3, :cond_3

    :goto_0
    const/4 p1, 0x1

    return p1

    :cond_3
    :goto_1
    const/4 p1, 0x0

    return p1
.end method

.method public final getFactory()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    .registers 2

    .line 57
    # getter for: Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->factory:Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->access$getFactory$cp()Lnicoid/network238/okhttp3/internal/platform/android/DeferredSocketAdapter$Factory;

    move-result-object v0

    return-object v0
.end method

.method public final isSupported()Z
    .registers 2

    .line 64
    # getter for: Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->isSupported:Z
    invoke-static {}, Lnicoid/network238/okhttp3/internal/platform/android/ConscryptSocketAdapter;->access$isSupported$cp()Z

    move-result v0

    return v0
.end method
