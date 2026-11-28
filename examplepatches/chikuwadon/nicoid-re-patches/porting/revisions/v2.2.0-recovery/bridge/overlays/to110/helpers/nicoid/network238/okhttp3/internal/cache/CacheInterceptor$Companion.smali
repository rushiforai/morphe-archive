.class public final Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00052\u0006\u0010\u0007\u001a\u00020\u0005H\u0002J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0002J\u0010\u0010\u000c\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0002\u00a8\u0006\r"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;",
        "",
        "<init>",
        "()V",
        "combine",
        "Lnicoid/network238/okhttp3/Headers;",
        "cachedHeaders",
        "networkHeaders",
        "isEndToEnd",
        "",
        "fieldName",
        "",
        "isContentSpecificHeader",
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

    .line 238
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;-><init>()V

    return-void
.end method

.method public static final synthetic access$combine(Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;
    .registers 3

    .line 238
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->combine(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p0

    return-object p0
.end method

.method private final combine(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;
    .registers 12

    .line 244
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 246
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v1, :cond_3

    .line 247
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v4

    .line 248
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    .line 249
    const-string v6, "Warning"

    const/4 v7, 0x1

    invoke-static {v6, v4, v7}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_0

    const/4 v6, 0x2

    const/4 v7, 0x0

    const-string v8, "1"

    invoke-static {v5, v8, v2, v6, v7}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    goto :goto_1

    .line 253
    :cond_0
    invoke-direct {p0, v4}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->isContentSpecificHeader(Ljava/lang/String;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 254
    invoke-direct {p0, v4}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->isEndToEnd(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 255
    invoke-virtual {p2, v4}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    if-nez v6, :cond_2

    .line 257
    :cond_1
    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    :cond_2
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    nop

    .line 261
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result p1

    :goto_2
    if-ge v2, p1, :cond_5

    .line 262
    invoke-virtual {p2, v2}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v1

    .line 263
    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->isContentSpecificHeader(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_4

    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/internal/cache/CacheInterceptor$Companion;->isEndToEnd(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_4

    .line 264
    invoke-virtual {p2, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    :cond_4
    add-int/lit8 v2, v2, 0x1

    goto :goto_2

    .line 268
    :cond_5
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method

.method private final isContentSpecificHeader(Ljava/lang/String;)Z
    .registers 4

    .line 290
    const-string v0, "Content-Length"

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 291
    const-string v0, "Content-Encoding"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 292
    const-string v0, "Content-Type"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    return v1
.end method

.method private final isEndToEnd(Ljava/lang/String;)Z
    .registers 4

    .line 276
    const-string v0, "Connection"

    const/4 v1, 0x1

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 277
    const-string v0, "Keep-Alive"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 278
    const-string v0, "Proxy-Authenticate"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 279
    const-string v0, "Proxy-Authorization"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 280
    const-string v0, "TE"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 281
    const-string v0, "Trailers"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 282
    const-string v0, "Transfer-Encoding"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 283
    const-string v0, "Upgrade"

    invoke-static {v0, p1, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    return v1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method
