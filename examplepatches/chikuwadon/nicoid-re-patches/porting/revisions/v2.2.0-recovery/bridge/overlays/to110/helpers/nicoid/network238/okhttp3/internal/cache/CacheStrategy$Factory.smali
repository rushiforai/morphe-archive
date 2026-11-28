.class public final Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Factory"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000@\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\u0018\u00002\u00020\u0001B!\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0008\u0010\u0006\u001a\u0004\u0018\u00010\u0007\u00a2\u0006\u0004\u0008\u0008\u0010\tJ\u0008\u0010\u0018\u001a\u00020\u0019H\u0002J\u0006\u0010\u001a\u001a\u00020\u001bJ\u0008\u0010\u001c\u001a\u00020\u001bH\u0002J\u0008\u0010\u001d\u001a\u00020\u0003H\u0002J\u0008\u0010\u001e\u001a\u00020\u0003H\u0002J\u0010\u0010\u001f\u001a\u00020\u00192\u0006\u0010\u0004\u001a\u00020\u0005H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u0010\u0010\u0006\u001a\u0004\u0018\u00010\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u000e\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0010\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0011\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0012\u001a\u0004\u0018\u00010\rX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u0003X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0015\u001a\u0004\u0018\u00010\u000fX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e\u00a2\u0006\u0002\n\u0000\u00a8\u0006 "
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;",
        "",
        "nowMillis",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "cacheResponse",
        "Lnicoid/network238/okhttp3/Response;",
        "<init>",
        "(JLnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V",
        "getRequest$okhttp",
        "()Lnicoid/network238/okhttp3/Request;",
        "servedDate",
        "Ljava/util/Date;",
        "servedDateString",
        "",
        "lastModified",
        "lastModifiedString",
        "expires",
        "sentRequestMillis",
        "receivedResponseMillis",
        "etag",
        "ageSeconds",
        "",
        "isFreshnessLifetimeHeuristic",
        "",
        "compute",
        "Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;",
        "computeCandidate",
        "computeFreshnessLifetime",
        "cacheResponseAge",
        "hasConditions",
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
.field private ageSeconds:I

.field private final cacheResponse:Lnicoid/network238/okhttp3/Response;

.field private etag:Ljava/lang/String;

.field private expires:Ljava/util/Date;

.field private lastModified:Ljava/util/Date;

.field private lastModifiedString:Ljava/lang/String;

.field private final nowMillis:J

.field private receivedResponseMillis:J

.field private final request:Lnicoid/network238/okhttp3/Request;

.field private sentRequestMillis:J

.field private servedDate:Ljava/util/Date;

.field private servedDateString:Ljava/lang/String;


# direct methods
.method public constructor <init>(JLnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V
    .registers 9

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 53
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->nowMillis:J

    .line 54
    iput-object p3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    .line 55
    iput-object p4, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    .line 87
    const/4 p1, -0x1

    iput p1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->ageSeconds:I

    if-eqz p4, :cond_5

    .line 97
    invoke-virtual {p4}, Lnicoid/network238/okhttp3/Response;->sentRequestAtMillis()J

    move-result-wide p2

    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->sentRequestMillis:J

    .line 98
    invoke-virtual {p4}, Lnicoid/network238/okhttp3/Response;->receivedResponseAtMillis()J

    move-result-wide p2

    iput-wide p2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->receivedResponseMillis:J

    .line 99
    invoke-virtual {p4}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    .line 100
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result p3

    const/4 p4, 0x0

    :goto_0
    if-ge p4, p3, :cond_5

    .line 101
    invoke-virtual {p2, p4}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    .line 102
    invoke-virtual {p2, p4}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v1

    .line 104
    const-string v2, "Date"

    const/4 v3, 0x1

    invoke-static {v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 105
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateOrNull(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    .line 106
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    goto :goto_1

    .line 109
    :cond_0
    const-string v2, "Expires"

    invoke-static {v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 110
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateOrNull(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->expires:Ljava/util/Date;

    goto :goto_1

    .line 113
    :cond_1
    const-string v2, "Last-Modified"

    invoke-static {v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2

    .line 114
    invoke-static {v1}, Lnicoid/network238/okhttp3/internal/http/DateFormattingKt;->toHttpDateOrNull(Ljava/lang/String;)Ljava/util/Date;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    .line 115
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    goto :goto_1

    .line 118
    :cond_2
    const-string v2, "ETag"

    invoke-static {v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_3

    .line 119
    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->etag:Ljava/lang/String;

    goto :goto_1

    .line 122
    :cond_3
    const-string v2, "Age"

    invoke-static {v0, v2, v3}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_4

    .line 123
    invoke-static {v1, p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->toNonNegativeInt(Ljava/lang/String;I)I

    move-result v0

    iput v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->ageSeconds:I

    :cond_4
    :goto_1
    add-int/lit8 p4, p4, 0x1

    goto :goto_0

    :cond_5
    return-void
.end method

.method private final cacheResponseAge()J
    .registers 12

    .line 267
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_0

    .line 270
    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->receivedResponseMillis:J

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    goto :goto_0

    :cond_0
    move-wide v3, v1

    .line 276
    :goto_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->ageSeconds:I

    const/4 v5, -0x1

    if-eq v0, v5, :cond_1

    .line 277
    sget-object v5, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    int-to-long v6, v0

    invoke-virtual {v5, v6, v7}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v5

    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v3

    .line 282
    :cond_1
    iget-wide v5, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->receivedResponseMillis:J

    iget-wide v7, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->sentRequestMillis:J

    sub-long/2addr v5, v7

    invoke-static {v1, v2, v5, v6}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v5

    .line 283
    iget-wide v7, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->nowMillis:J

    iget-wide v9, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->receivedResponseMillis:J

    sub-long/2addr v7, v9

    invoke-static {v1, v2, v7, v8}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    add-long/2addr v3, v5

    add-long/2addr v3, v0

    return-wide v3
.end method

.method private final computeCandidate()Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;
    .registers 14

    .line 145
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    .line 146
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, v2, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v0

    .line 150
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->handshake()Lnicoid/network238/okhttp3/Handshake;

    move-result-object v0

    if-nez v0, :cond_1

    .line 151
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, v2, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v0

    .line 157
    :cond_1
    sget-object v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->Companion:Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0, v2, v3}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Companion;->isCacheable(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Request;)Z

    move-result v0

    if-nez v0, :cond_2

    .line 158
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, v2, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v0

    .line 161
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    .line 162
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->noCache()Z

    move-result v2

    if-nez v2, :cond_c

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->hasConditions(Lnicoid/network238/okhttp3/Request;)Z

    move-result v2

    if-nez v2, :cond_c

    .line 166
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v2

    .line 168
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponseAge()J

    move-result-wide v3

    .line 169
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->computeFreshnessLifetime()J

    move-result-wide v5

    .line 171
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v7

    const/4 v8, -0x1

    if-eq v7, v8, :cond_3

    .line 172
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v9

    int-to-long v9, v9

    invoke-virtual {v7, v9, v10}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v9

    invoke-static {v5, v6, v9, v10}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v5

    :cond_3
    nop

    .line 176
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds()I

    move-result v7

    const-wide/16 v9, 0x0

    if-eq v7, v8, :cond_4

    .line 177
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->minFreshSeconds()I

    move-result v11

    int-to-long v11, v11

    invoke-virtual {v7, v11, v12}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v11

    goto :goto_0

    .line 176
    :cond_4
    move-wide v11, v9

    .line 177
    :goto_0
    nop

    .line 181
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/CacheControl;->mustRevalidate()Z

    move-result v7

    if-nez v7, :cond_5

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds()I

    move-result v7

    if-eq v7, v8, :cond_5

    .line 182
    sget-object v7, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxStaleSeconds()I

    move-result v0

    int-to-long v8, v0

    invoke-virtual {v7, v8, v9}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v9

    .line 185
    :cond_5
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/CacheControl;->noCache()Z

    move-result v0

    if-nez v0, :cond_8

    add-long/2addr v11, v3

    add-long/2addr v9, v5

    cmp-long v0, v11, v9

    if-gez v0, :cond_8

    .line 186
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    cmp-long v2, v11, v5

    const-string v5, "Warning"

    if-ltz v2, :cond_6

    .line 188
    const-string v2, "110 HttpURLConnection \"Response is stale\""

    invoke-virtual {v0, v5, v2}, Lnicoid/network238/okhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    :cond_6
    const-wide/32 v6, 0x5265c00

    cmp-long v2, v3, v6

    if-lez v2, :cond_7

    .line 191
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->isFreshnessLifetimeHeuristic()Z

    move-result v2

    if-eqz v2, :cond_7

    .line 192
    const-string v2, "113 HttpURLConnection \"Heuristic expiration\""

    invoke-virtual {v0, v5, v2}, Lnicoid/network238/okhttp3/Response$Builder;->addHeader(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    .line 194
    :cond_7
    new-instance v2, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    invoke-direct {v2, v1, v0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v2

    .line 202
    :cond_8
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->etag:Ljava/lang/String;

    if-eqz v0, :cond_9

    .line 203
    const-string v1, "If-None-Match"

    goto :goto_1

    .line 207
    :cond_9
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    const-string v2, "If-Modified-Since"

    if-eqz v0, :cond_a

    .line 208
    nop

    .line 209
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModifiedString:Ljava/lang/String;

    move-object v1, v2

    goto :goto_1

    .line 212
    :cond_a
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v0, :cond_b

    .line 213
    nop

    .line 214
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDateString:Ljava/lang/String;

    move-object v1, v2

    .line 222
    :goto_1
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v2

    .line 223
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v1, v0}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    .line 226
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    .line 227
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 228
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 229
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 230
    new-instance v1, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-direct {v1, v0, v2}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v1

    .line 218
    :cond_b
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, v2, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v0

    .line 163
    :cond_c
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, v2, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    return-object v0
.end method

.method private final computeFreshnessLifetime()J
    .registers 8

    .line 238
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    .line 239
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_0

    .line 240
    sget-object v1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v0

    int-to-long v2, v0

    invoke-virtual {v1, v2, v3}, Ljava/util/concurrent/TimeUnit;->toMillis(J)J

    move-result-wide v0

    return-wide v0

    .line 243
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->expires:Ljava/util/Date;

    const-wide/16 v1, 0x0

    if-eqz v0, :cond_2

    .line 245
    iget-object v3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v3, :cond_1

    invoke-virtual {v3}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    goto :goto_0

    :cond_1
    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->receivedResponseMillis:J

    .line 246
    :goto_0
    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    sub-long/2addr v5, v3

    cmp-long v0, v5, v1

    if-lez v0, :cond_4

    return-wide v5

    .line 250
    :cond_2
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    if-eqz v0, :cond_4

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->query()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_4

    .line 254
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->servedDate:Ljava/util/Date;

    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v3

    goto :goto_1

    :cond_3
    iget-wide v3, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->sentRequestMillis:J

    .line 255
    :goto_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->lastModified:Ljava/util/Date;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ljava/util/Date;->getTime()J

    move-result-wide v5

    sub-long/2addr v3, v5

    cmp-long v0, v3, v1

    if-lez v0, :cond_4

    .line 256
    const-wide/16 v0, 0xa

    div-long/2addr v3, v0

    return-wide v3

    :cond_4
    return-wide v1
.end method

.method private final hasConditions(Lnicoid/network238/okhttp3/Request;)Z
    .registers 3

    .line 293
    const-string v0, "If-Modified-Since"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    const-string v0, "If-None-Match"

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    const/4 p1, 0x1

    return p1
.end method

.method private final isFreshnessLifetimeHeuristic()Z
    .registers 3

    .line 93
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->cacheResponse:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/CacheControl;->maxAgeSeconds()I

    move-result v0

    const/4 v1, -0x1

    if-ne v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->expires:Ljava/util/Date;

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method


# virtual methods
.method public final compute()Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;
    .registers 3

    .line 132
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->computeCandidate()Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    move-result-object v0

    .line 135
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;->getNetworkRequest()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/CacheControl;->onlyIfCached()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 136
    new-instance v0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;

    const/4 v1, 0x0

    invoke-direct {v0, v1, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy;-><init>(Lnicoid/network238/okhttp3/Request;Lnicoid/network238/okhttp3/Response;)V

    :cond_0
    return-object v0
.end method

.method public final getRequest$okhttp()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 54
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/cache/CacheStrategy$Factory;->request:Lnicoid/network238/okhttp3/Request;

    return-object v0
.end method
