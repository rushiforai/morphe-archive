.class public final Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;,
        Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\t\u0018\u0000 \r2\u00020\u0001:\u0002\u000c\rB\u001d\u0008\u0000\u0012\u0008\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u0012\u0008\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007R\u0013\u0010\u0002\u001a\u0004\u0018\u00010\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0013\u0010\u0004\u001a\u0004\u0018\u00010\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000b\u00a8\u0006\u000e"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;",
        "",
        "networkRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "cacheResponse",
        "Lnicoid/network238/okhttp3/Response;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V",
        "getNetworkRequest",
        "()Lnicoid/network238/okhttp3/Request;",
        "getCacheResponse",
        "()Lnicoid/network238/okhttp3/Response;",
        "Factory",
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
.field public static final Companion:Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;


# instance fields
.field private final cacheResponse:Lnicoid/network238/okhttp3/Response;

.field private final networkRequest:Lnicoid/network238/okhttp3/Request;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->Companion:Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V
    .registers 3

    .line 46
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 48
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->networkRequest:Lnicoid/network238/okhttp3/Request;

    .line 50
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-void
.end method


# virtual methods
.method public final getCacheResponse()Lnicoid/network238/okhttp3/Response;
    .registers 2

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    return-object v0
.end method

.method public final getNetworkRequest()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 48
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->networkRequest:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method
