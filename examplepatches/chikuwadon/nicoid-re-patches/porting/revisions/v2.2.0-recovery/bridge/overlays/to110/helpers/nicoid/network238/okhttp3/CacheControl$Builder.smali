.class public final Lnicoid/network238/okhttp3/CacheControl$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/CacheControl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0002\u0008\u0014\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0006\u0010\u0004\u001a\u00020\u0000J\u0006\u0010\n\u001a\u00020\u0000J\u0006\u0010\u0019\u001a\u00020\u0000J\u0006\u0010\u001c\u001a\u00020\u0000J\u0006\u0010\u001f\u001a\u00020\u0000J\u0015\u0010\"\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020#\u00a2\u0006\u0004\u0008$\u0010%J\u0015\u0010&\u001a\u00020\u00002\u0006\u0010&\u001a\u00020#\u00a2\u0006\u0004\u0008\'\u0010%J\u0015\u0010(\u001a\u00020\u00002\u0006\u0010(\u001a\u00020#\u00a2\u0006\u0004\u0008)\u0010%J\u0016\u0010\"\u001a\u00020\u00002\u0006\u0010\"\u001a\u00020\u000e2\u0006\u0010*\u001a\u00020+J\u0016\u0010&\u001a\u00020\u00002\u0006\u0010&\u001a\u00020\u000e2\u0006\u0010*\u001a\u00020+J\u0016\u0010(\u001a\u00020\u00002\u0006\u0010(\u001a\u00020\u000e2\u0006\u0010*\u001a\u00020+J\u0006\u0010,\u001a\u00020-R\u001a\u0010\u0004\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007\"\u0004\u0008\u000c\u0010\tR\u001a\u0010\r\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0010\"\u0004\u0008\u0015\u0010\u0012R\u001a\u0010\u0016\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0017\u0010\u0010\"\u0004\u0008\u0018\u0010\u0012R\u001a\u0010\u0019\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001a\u0010\u0007\"\u0004\u0008\u001b\u0010\tR\u001a\u0010\u001c\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001d\u0010\u0007\"\u0004\u0008\u001e\u0010\tR\u001a\u0010\u001f\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010\u0007\"\u0004\u0008!\u0010\t\u00a8\u0006."
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CacheControl$Builder;",
        "",
        "<init>",
        "()V",
        "noCache",
        "",
        "getNoCache$okhttp",
        "()Z",
        "setNoCache$okhttp",
        "(Z)V",
        "noStore",
        "getNoStore$okhttp",
        "setNoStore$okhttp",
        "maxAgeSeconds",
        "",
        "getMaxAgeSeconds$okhttp",
        "()I",
        "setMaxAgeSeconds$okhttp",
        "(I)V",
        "maxStaleSeconds",
        "getMaxStaleSeconds$okhttp",
        "setMaxStaleSeconds$okhttp",
        "minFreshSeconds",
        "getMinFreshSeconds$okhttp",
        "setMinFreshSeconds$okhttp",
        "onlyIfCached",
        "getOnlyIfCached$okhttp",
        "setOnlyIfCached$okhttp",
        "noTransform",
        "getNoTransform$okhttp",
        "setNoTransform$okhttp",
        "immutable",
        "getImmutable$okhttp",
        "setImmutable$okhttp",
        "maxAge",
        "Lnicoid/network238/kotlin/time/Duration;",
        "maxAge-LRDsOJo",
        "(J)Lnicoid/network238/okhttp3/CacheControl$Builder;",
        "maxStale",
        "maxStale-LRDsOJo",
        "minFresh",
        "minFresh-LRDsOJo",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "build",
        "Lnicoid/network238/okhttp3/CacheControl;",
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
.field private immutable:Z

.field private maxAgeSeconds:I

.field private maxStaleSeconds:I

.field private minFreshSeconds:I

.field private noCache:Z

.field private noStore:Z

.field private noTransform:Z

.field private onlyIfCached:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 155
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 158
    const/4 v0, -0x1

    iput v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxAgeSeconds:I

    .line 159
    iput v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStaleSeconds:I

    .line 160
    iput v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->minFreshSeconds:I

    return-void
.end method


# virtual methods
.method public final build()Lnicoid/network238/okhttp3/CacheControl;
    .registers 2

    .line 259
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonBuild(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    return-object v0
.end method

.method public final getImmutable$okhttp()Z
    .registers 2

    .line 163
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->immutable:Z

    return v0
.end method

.method public final getMaxAgeSeconds$okhttp()I
    .registers 2

    .line 158
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxAgeSeconds:I

    return v0
.end method

.method public final getMaxStaleSeconds$okhttp()I
    .registers 2

    .line 159
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStaleSeconds:I

    return v0
.end method

.method public final getMinFreshSeconds$okhttp()I
    .registers 2

    .line 160
    iget v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->minFreshSeconds:I

    return v0
.end method

.method public final getNoCache$okhttp()Z
    .registers 2

    .line 156
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noCache:Z

    return v0
.end method

.method public final getNoStore$okhttp()Z
    .registers 2

    .line 157
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noStore:Z

    return v0
.end method

.method public final getNoTransform$okhttp()Z
    .registers 2

    .line 162
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noTransform:Z

    return v0
.end method

.method public final getOnlyIfCached$okhttp()Z
    .registers 2

    .line 161
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->onlyIfCached:Z

    return v0
.end method

.method public final immutable()Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    .line 180
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonImmutable(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final maxAge(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_0

    int-to-long v0, p1

    .line 222
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide p1

    .line 223
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxAgeSeconds:I

    return-object p0

    .line 221
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "maxAge < 0: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final maxAge-LRDsOJo(J)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    .line 191
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->getInWholeSeconds-impl(J)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 193
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxAgeSeconds:I

    return-object p0

    .line 192
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "maxAge < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final maxStale(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_0

    int-to-long v0, p1

    .line 238
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide p1

    .line 239
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStaleSeconds:I

    return-object p0

    .line 237
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "maxStale < 0: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final maxStale-LRDsOJo(J)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    .line 198
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->getInWholeSeconds-impl(J)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 200
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStaleSeconds:I

    return-object p0

    .line 199
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "maxStale < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final minFresh(ILjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_0

    int-to-long v0, p1

    .line 255
    invoke-virtual {p2, v0, v1}, Ljava/util/concurrent/TimeUnit;->toSeconds(J)J

    move-result-wide p1

    .line 256
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->minFreshSeconds:I

    return-object p0

    .line 254
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    const-string v0, "minFresh < 0: "

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final minFresh-LRDsOJo(J)Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 5

    .line 205
    invoke-static {p1, p2}, Lnicoid/network238/kotlin/time/Duration;->getInWholeSeconds-impl(J)J

    move-result-wide p1

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-ltz v0, :cond_0

    .line 207
    invoke-static {p1, p2}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonClampToInt(J)I

    move-result p1

    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->minFreshSeconds:I

    return-object p0

    .line 206
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "minFresh < 0: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final noCache()Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    .line 166
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonNoCache(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final noStore()Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    .line 169
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonNoStore(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final noTransform()Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    .line 178
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonNoTransform(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final onlyIfCached()Lnicoid/network238/okhttp3/CacheControl$Builder;
    .registers 2

    .line 175
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_CacheControlCommonKt;->commonOnlyIfCached(Lnicoid/network238/okhttp3/CacheControl$Builder;)Lnicoid/network238/okhttp3/CacheControl$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final setImmutable$okhttp(Z)V
    .registers 2

    .line 163
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->immutable:Z

    return-void
.end method

.method public final setMaxAgeSeconds$okhttp(I)V
    .registers 2

    .line 158
    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxAgeSeconds:I

    return-void
.end method

.method public final setMaxStaleSeconds$okhttp(I)V
    .registers 2

    .line 159
    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->maxStaleSeconds:I

    return-void
.end method

.method public final setMinFreshSeconds$okhttp(I)V
    .registers 2

    .line 160
    iput p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->minFreshSeconds:I

    return-void
.end method

.method public final setNoCache$okhttp(Z)V
    .registers 2

    .line 156
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noCache:Z

    return-void
.end method

.method public final setNoStore$okhttp(Z)V
    .registers 2

    .line 157
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noStore:Z

    return-void
.end method

.method public final setNoTransform$okhttp(Z)V
    .registers 2

    .line 162
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->noTransform:Z

    return-void
.end method

.method public final setOnlyIfCached$okhttp(Z)V
    .registers 2

    .line 161
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/CacheControl$Builder;->onlyIfCached:Z

    return-void
.end method
