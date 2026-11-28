.class public final Lnicoid/network238/okhttp3/CacheControl;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/CacheControl$Builder;,
        Lnicoid/network238/okhttp3/CacheControl$Companion;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\n\n\u0002\u0010\u000e\n\u0002\u0008\u0016\u0018\u0000 &2\u00020\u0001:\u0002%&Bs\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0003\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u0012\u0006\u0010\u0007\u001a\u00020\u0006\u0012\u0006\u0010\u0008\u001a\u00020\u0003\u0012\u0006\u0010\t\u001a\u00020\u0003\u0012\u0006\u0010\n\u001a\u00020\u0003\u0012\u0006\u0010\u000b\u001a\u00020\u0006\u0012\u0006\u0010\u000c\u001a\u00020\u0006\u0012\u0006\u0010\r\u001a\u00020\u0003\u0012\u0006\u0010\u000e\u001a\u00020\u0003\u0012\u0006\u0010\u000f\u001a\u00020\u0003\u0012\u0008\u0010\u0010\u001a\u0004\u0018\u00010\u0011\u00a2\u0006\u0004\u0008\u0012\u0010\u0013J\r\u0010\u0002\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u001aJ\r\u0010\u0004\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u001bJ\r\u0010\u0005\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\u001cJ\r\u0010\u0007\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\u001dJ\r\u0010\n\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\u001eJ\r\u0010\u000b\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008\u001fJ\r\u0010\u000c\u001a\u00020\u0006H\u0007\u00a2\u0006\u0002\u0008 J\r\u0010\r\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008!J\r\u0010\u000e\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008\"J\r\u0010\u000f\u001a\u00020\u0003H\u0007\u00a2\u0006\u0002\u0008#J\u0008\u0010$\u001a\u00020\u0011H\u0016R\u0013\u0010\u0002\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0014R\u0013\u0010\u0004\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0004\u0010\u0014R\u0013\u0010\u0005\u001a\u00020\u00068\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0015R\u0013\u0010\u0007\u001a\u00020\u00068\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0015R\u0011\u0010\u0008\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0014R\u0011\u0010\t\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\u0014R\u0013\u0010\n\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u0014R\u0013\u0010\u000b\u001a\u00020\u00068\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u0015R\u0013\u0010\u000c\u001a\u00020\u00068\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u0015R\u0013\u0010\r\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\r\u0010\u0014R\u0013\u0010\u000e\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u0014R\u0013\u0010\u000f\u001a\u00020\u00038\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000f\u0010\u0014R\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0011X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017\"\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\'"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CacheControl;",
        "",
        "noCache",
        "",
        "noStore",
        "maxAgeSeconds",
        "",
        "sMaxAgeSeconds",
        "isPrivate",
        "isPublic",
        "mustRevalidate",
        "maxStaleSeconds",
        "minFreshSeconds",
        "onlyIfCached",
        "noTransform",
        "immutable",
        "headerValue",
        "",
        "<init>",
        "(ZZIIZZZIIZZZLjava/lang/String;)V",
        "()Z",
        "()I",
        "getHeaderValue$okhttp",
        "()Ljava/lang/String;",
        "setHeaderValue$okhttp",
        "(Ljava/lang/String;)V",
        "-deprecated_noCache",
        "-deprecated_noStore",
        "-deprecated_maxAgeSeconds",
        "-deprecated_sMaxAgeSeconds",
        "-deprecated_mustRevalidate",
        "-deprecated_maxStaleSeconds",
        "-deprecated_minFreshSeconds",
        "-deprecated_onlyIfCached",
        "-deprecated_noTransform",
        "-deprecated_immutable",
        "toString",
        "Builder",
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
.field public static final Companion:Lnicoid/network238/okhttp3/CacheControl$Companion;

.field public static final FORCE_CACHE:Lnicoid/network238/okhttp3/CacheControl;

.field public static final FORCE_NETWORK:Lnicoid/network238/okhttp3/CacheControl;


# instance fields
.field private headerValue:Ljava/lang/String;

.field private final immutable:Z

.field private final isPrivate:Z

.field private final isPublic:Z

.field private final maxAgeSeconds:I

.field private final maxStaleSeconds:I

.field private final minFreshSeconds:I

.field private final mustRevalidate:Z

.field private final noCache:Z

.field private final noStore:Z

.field private final noTransform:Z

.field private final onlyIfCached:Z

.field private final sMaxAgeSeconds:I


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okhttp3/CacheControl$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/CacheControl$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/CacheControl;->Companion:Lnicoid/network238/okhttp3/CacheControl$Companion;

    .line 268
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonForceNetwork(Lnicoid/network238/okhttp3/CacheControl$Companion;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/CacheControl;->FORCE_NETWORK:Lnicoid/network238/okhttp3/CacheControl;

    .line 276
    invoke-static {v0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonForceCache(Lnicoid/network238/okhttp3/CacheControl$Companion;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/CacheControl;->FORCE_CACHE:Lnicoid/network238/okhttp3/CacheControl;

    return-void
.end method

.method public constructor <init>(ZZIIZZZIIZZZLjava/lang/String;)V
    .registers 14

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 46
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl;->noCache:Z

    .line 48
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/CacheControl;->noStore:Z

    .line 50
    iput p3, p0, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds:I

    .line 55
    iput p4, p0, Lnicoid/network238/okhttp3/CacheControl;->sMaxAgeSeconds:I

    .line 56
    iput-boolean p5, p0, Lnicoid/network238/okhttp3/CacheControl;->isPrivate:Z

    .line 57
    iput-boolean p6, p0, Lnicoid/network238/okhttp3/CacheControl;->isPublic:Z

    .line 58
    iput-boolean p7, p0, Lnicoid/network238/okhttp3/CacheControl;->mustRevalidate:Z

    .line 59
    iput p8, p0, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds:I

    .line 60
    iput p9, p0, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds:I

    .line 67
    iput-boolean p10, p0, Lnicoid/network238/okhttp3/CacheControl;->onlyIfCached:Z

    .line 68
    iput-boolean p11, p0, Lnicoid/network238/okhttp3/CacheControl;->noTransform:Z

    .line 69
    iput-boolean p12, p0, Lnicoid/network238/okhttp3/CacheControl;->immutable:Z

    .line 70
    iput-object p13, p0, Lnicoid/network238/okhttp3/CacheControl;->headerValue:Ljava/lang/String;

    return-void
.end method

.method public static final parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/CacheControl;
    .registers 2

    sget-object v0, Lnicoid/network238/okhttp3/CacheControl;->Companion:Lnicoid/network238/okhttp3/CacheControl$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okhttp3/CacheControl$Companion;->parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_immutable()Z
    .registers 2

    .line 150
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->immutable:Z

    return v0
.end method

.method public final -deprecated_maxAgeSeconds()I
    .registers 2

    .line 94
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds:I

    return v0
.end method

.method public final -deprecated_maxStaleSeconds()I
    .registers 2

    .line 118
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds:I

    return v0
.end method

.method public final -deprecated_minFreshSeconds()I
    .registers 2

    .line 126
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds:I

    return v0
.end method

.method public final -deprecated_mustRevalidate()Z
    .registers 2

    .line 110
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->mustRevalidate:Z

    return v0
.end method

.method public final -deprecated_noCache()Z
    .registers 2

    .line 78
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noCache:Z

    return v0
.end method

.method public final -deprecated_noStore()Z
    .registers 2

    .line 86
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noStore:Z

    return v0
.end method

.method public final -deprecated_noTransform()Z
    .registers 2

    .line 142
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noTransform:Z

    return v0
.end method

.method public final -deprecated_onlyIfCached()Z
    .registers 2

    .line 134
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->onlyIfCached:Z

    return v0
.end method

.method public final -deprecated_sMaxAgeSeconds()I
    .registers 2

    .line 102
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->sMaxAgeSeconds:I

    return v0
.end method

.method public final getHeaderValue$okhttp()Ljava/lang/String;
    .registers 2

    .line 70
    iget-object v0, p0, Lnicoid/network238/okhttp3/CacheControl;->headerValue:Ljava/lang/String;

    return-object v0
.end method

.method public final immutable()Z
    .registers 2

    .line 69
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->immutable:Z

    return v0
.end method

.method public final isPrivate()Z
    .registers 2

    .line 56
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->isPrivate:Z

    return v0
.end method

.method public final isPublic()Z
    .registers 2

    .line 57
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->isPublic:Z

    return v0
.end method

.method public final maxAgeSeconds()I
    .registers 2

    .line 50
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds:I

    return v0
.end method

.method public final maxStaleSeconds()I
    .registers 2

    .line 59
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds:I

    return v0
.end method

.method public final minFreshSeconds()I
    .registers 2

    .line 60
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds:I

    return v0
.end method

.method public final mustRevalidate()Z
    .registers 2

    .line 58
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->mustRevalidate:Z

    return v0
.end method

.method public final noCache()Z
    .registers 2

    .line 46
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noCache:Z

    return v0
.end method

.method public final noStore()Z
    .registers 2

    .line 48
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noStore:Z

    return v0
.end method

.method public final noTransform()Z
    .registers 2

    .line 68
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->noTransform:Z

    return v0
.end method

.method public final onlyIfCached()Z
    .registers 2

    .line 67
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl;->onlyIfCached:Z

    return v0
.end method

.method public final sMaxAgeSeconds()I
    .registers 2

    .line 55
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl;->sMaxAgeSeconds:I

    return v0
.end method

.method public final setHeaderValue$okhttp(Ljava/lang/String;)V
    .registers 2

    .line 70
    iput-object p1, p0, Lnicoid/network238/okhttp3/CacheControl;->headerValue:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 152
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonToString(Lnicoid/network238/okhttp3/CacheControl;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
