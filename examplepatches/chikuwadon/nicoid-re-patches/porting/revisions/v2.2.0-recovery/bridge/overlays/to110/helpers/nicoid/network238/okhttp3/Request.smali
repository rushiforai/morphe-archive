.class public final Lnicoid/network238/okhttp3/Request;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/Request$Builder;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000X\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000f\u0018\u00002\u00020\u0001:\u00015B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B1\u0008\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b\u0012\n\u0008\u0002\u0010\u000c\u001a\u0004\u0018\u00010\r\u00a2\u0006\u0004\u0008\u0004\u0010\u000eJ\u0010\u0010\u001d\u001a\u0004\u0018\u00010\u000b2\u0006\u0010\u001e\u001a\u00020\u000bJ\u0014\u0010\u0008\u001a\u0008\u0012\u0004\u0012\u00020\u000b0\u001f2\u0006\u0010\u001e\u001a\u00020\u000bJ\u001e\u0010 \u001a\u0004\u0018\u0001H!\"\n\u0008\u0000\u0010!\u0018\u0001*\u00020\u0001H\u0087\u0008\u00a2\u0006\u0004\u0008\"\u0010#J%\u0010 \u001a\u0004\u0018\u0001H!\"\u0008\u0008\u0000\u0010!*\u00020\u00012\u000c\u0010$\u001a\u0008\u0012\u0004\u0012\u0002H!0%\u00a2\u0006\u0002\u0010&J\u0008\u0010 \u001a\u0004\u0018\u00010\u0001J#\u0010 \u001a\u0004\u0018\u0001H!\"\u0004\u0008\u0000\u0010!2\u000e\u0010$\u001a\n\u0012\u0006\u0008\u0001\u0012\u0002H!0\'\u00a2\u0006\u0002\u0010(J\u0006\u0010)\u001a\u00020\u0003J\r\u0010\u0006\u001a\u00020\u0007H\u0007\u00a2\u0006\u0002\u0008,J\r\u0010\n\u001a\u00020\u000bH\u0007\u00a2\u0006\u0002\u0008-J\r\u0010\u0008\u001a\u00020\tH\u0007\u00a2\u0006\u0002\u0008.J\u000f\u0010\u000c\u001a\u0004\u0018\u00010\rH\u0007\u00a2\u0006\u0002\u0008/J\r\u0010*\u001a\u00020\u0019H\u0007\u00a2\u0006\u0002\u00080J\u0008\u00101\u001a\u00020\u000bH\u0016J\u0012\u00102\u001a\u00020\u000b2\u0008\u0008\u0002\u00103\u001a\u00020\u001bH\u0007J\u000c\u00104\u001a\u00020\u000b*\u00020\u000bH\u0002R\u0013\u0010\u0006\u001a\u00020\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u000fR\u0013\u0010\n\u001a\u00020\u000b8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u0010R\u0013\u0010\u0008\u001a\u00020\t8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\u0011R\u0015\u0010\u000c\u001a\u0004\u0018\u00010\r8\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\u0012R\u0015\u0010\u0013\u001a\u0004\u0018\u00010\u00078\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0013\u0010\u000fR\u0014\u0010\u0014\u001a\u00020\u0015X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0016\u0010\u0017R\u0010\u0010\u0018\u001a\u0004\u0018\u00010\u0019X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0011\u0010\u001a\u001a\u00020\u001b8F\u00a2\u0006\u0006\u001a\u0004\u0008\u001a\u0010\u001cR\u0011\u0010*\u001a\u00020\u00198G\u00a2\u0006\u0006\u001a\u0004\u0008*\u0010+\u00a8\u00066"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Request;",
        "",
        "builder",
        "Lnicoid/network238/okhttp3/Request$Builder;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Request$Builder;)V",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "headers",
        "Lnicoid/network238/okhttp3/Headers;",
        "method",
        "",
        "body",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)V",
        "()Lnicoid/network238/okhttp3/HttpUrl;",
        "()Ljava/lang/String;",
        "()Lnicoid/network238/okhttp3/Headers;",
        "()Lnicoid/network238/okhttp3/RequestBody;",
        "cacheUrlOverride",
        "tags",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "getTags$okhttp",
        "()Lnicoid/network238/okhttp3/internal/Tags;",
        "lazyCacheControl",
        "Lnicoid/network238/okhttp3/CacheControl;",
        "isHttps",
        "",
        "()Z",
        "header",
        "name",
        "",
        "tag",
        "T",
        "reifiedTag",
        "()Ljava/lang/Object;",
        "type",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;)Ljava/lang/Object;",
        "newBuilder",
        "cacheControl",
        "()Lnicoid/network238/okhttp3/CacheControl;",
        "-deprecated_url",
        "-deprecated_method",
        "-deprecated_headers",
        "-deprecated_body",
        "-deprecated_cacheControl",
        "toString",
        "toCurl",
        "includeBody",
        "shellEscape",
        "Builder",
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
.field private final body:Lnicoid/network238/okhttp3/RequestBody;

.field private final cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

.field private final headers:Lnicoid/network238/okhttp3/Headers;

.field private lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

.field private final method:Ljava/lang/String;

.field private final tags:Lnicoid/network238/okhttp3/internal/Tags;

.field private final url:Lnicoid/network238/okhttp3/HttpUrl;


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 73
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    .line 74
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    .line 75
    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    .line 78
    const-string p2, "\u0000"

    invoke-static {p3, p2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1

    if-eqz p4, :cond_0

    .line 79
    const-string p3, "POST"

    goto :goto_0

    .line 80
    :cond_0
    const-string p3, "GET"

    .line 76
    :cond_1
    :goto_0
    invoke-virtual {p1, p3, p4}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    .line 72
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Request;-><init>(Lnicoid/network238/okhttp3/Request$Builder;)V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 7

    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_0

    .line 68
    sget-object p2, Lnicoid/network238/okhttp3/Headers;->Companion:Lnicoid/network238/okhttp3/Headers$Companion;

    const/4 p6, 0x0

    new-array p6, p6, [Ljava/lang/String;

    invoke-virtual {p2, p6}, Lnicoid/network238/okhttp3/Headers$Companion;->of([Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    :cond_0
    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_1

    .line 70
    const-string p3, "\u0000"

    :cond_1
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_2

    const/4 p4, 0x0

    .line 66
    :cond_2
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/Request;-><init>(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Request$Builder;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getUrl$okhttp()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    if-eqz v0, :cond_0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    .line 41
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getMethod$okhttp()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    .line 44
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getHeaders$okhttp()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 47
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getBody$okhttp()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    .line 50
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getCacheUrlOverride$okhttp()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    .line 52
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request$Builder;->getTags$okhttp()Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Request;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    return-void

    .line 38
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "url == null"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final shellEscape(Ljava/lang/String;)Ljava/lang/String;
    .registers 10

    .line 493
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const/4 v6, 0x4

    const/4 v7, 0x0

    const-string v3, "\'"

    const-string v4, "\'\\\'\'"

    const/4 v5, 0x0

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x27

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public static synthetic toCurl$default(Lnicoid/network238/okhttp3/Request;ZILjava/lang/Object;)Ljava/lang/String;
    .registers 4

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 454
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request;->toCurl(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_body()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 162
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public final -deprecated_cacheControl()Lnicoid/network238/okhttp3/CacheControl;
    .registers 2

    .line 170
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Request;->cacheControl()Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    return-object v0
.end method

.method public final -deprecated_headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 154
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final -deprecated_method()Ljava/lang/String;
    .registers 2

    .line 146
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    return-object v0
.end method

.method public final -deprecated_url()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 138
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method

.method public final body()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 47
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public final cacheControl()Lnicoid/network238/okhttp3/CacheControl;
    .registers 3

    .line 124
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    if-nez v0, :cond_0

    .line 126
    sget-object v0, Lnicoid/network238/okhttp3/CacheControl;->Companion:Lnicoid/network238/okhttp3/CacheControl$Companion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/CacheControl$Companion;->parse(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/CacheControl;

    move-result-object v0

    .line 127
    iput-object v0, p0, Lnicoid/network238/okhttp3/Request;->lazyCacheControl:Lnicoid/network238/okhttp3/CacheControl;

    :cond_0
    return-object v0
.end method

.method public final cacheUrlOverride()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method

.method public final getTags$okhttp()Lnicoid/network238/okhttp3/internal/Tags;
    .registers 2

    .line 52
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    return-object v0
.end method

.method public final header(Ljava/lang/String;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 86
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final headers(Ljava/lang/String;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 88
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    return-object p1
.end method

.method public final headers()Lnicoid/network238/okhttp3/Headers;
    .registers 2

    .line 44
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    return-object v0
.end method

.method public final isHttps()Z
    .registers 2

    .line 57
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    return v0
.end method

.method public final method()Ljava/lang/String;
    .registers 2

    .line 41
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    return-object v0
.end method

.method public final newBuilder()Lnicoid/network238/okhttp3/Request$Builder;
    .registers 2

    .line 115
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>(Lnicoid/network238/okhttp3/Request;)V

    return-object v0
.end method

.method public final synthetic reifiedTag()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">()TT;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 92
    .local v0, "$i$f$reifiedTag":I
    const/4 v1, 0x4

    const-string v2, "T"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v1, Ljava/lang/Object;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object v1

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/Request;->tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object v1

    return-object v1
.end method

.method public final tag()Ljava/lang/Object;
    .registers 2

    .line 497
    const-class v0, Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object v0

    invoke-virtual {p0, v0}, Lnicoid/network238/okhttp3/Request;->tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public final tag(Ljava/lang/Class;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "+TT;>;)TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 113
    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request;->tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final tag(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            ")TT;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 95
    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getJavaClass(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Class;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/Tags;->get(Lnicoid/network238/kotlin/reflect/KClass;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public final toCurl()Ljava/lang/String;
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Lnicoid/network238/okhttp3/Request;->toCurl$default(Lnicoid/network238/okhttp3/Request;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final toCurl(Z)Ljava/lang/String;
    .registers 11

    .line 455
    new-instance v0, Ljava/lang/StringBuilder;

    .line 456
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "curl "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v2, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 455
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 458
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/RequestBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/MediaType;->toString()Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    if-eqz p1, :cond_1

    .line 463
    iget-object v3, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    if-eqz v3, :cond_1

    const-string v3, "POST"

    goto :goto_1

    .line 464
    :cond_1
    const-string v3, "GET"

    .line 466
    :goto_1
    iget-object v4, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    invoke-static {v4, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_2

    .line 467
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, " \\\n  -X "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    invoke-direct {p0, v4}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 471
    :cond_2
    iget-object v3, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Headers;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_3
    :goto_2
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    const/4 v5, 0x1

    const-string v6, " \\\n  -H "

    if-eqz v4, :cond_5

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v4}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v4}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ljava/lang/String;

    if-eqz v1, :cond_4

    .line 472
    const-string v8, "Content-Type"

    invoke-static {v7, v8, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_3

    .line 473
    :cond_4
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    new-instance v6, Ljava/lang/StringBuilder;

    invoke-direct {v6}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    const-string v7, ": "

    invoke-virtual {v6, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v6

    invoke-virtual {v6, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {p0, v4}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_5
    if-eqz v1, :cond_6

    .line 477
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v4, "Content-Type: "

    invoke-virtual {v4, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {p0, v1}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_6
    if-eqz p1, :cond_8

    .line 481
    iget-object p1, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    if-eqz p1, :cond_8

    .line 482
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 483
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->body:Lnicoid/network238/okhttp3/RequestBody;

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/RequestBody;->writeTo(Lnicoid/network238/okio/BufferedSink;)V

    .line 485
    const-wide/16 v3, 0x0

    invoke-static {p1, v3, v4, v5, v2}, Lnicoid/network238/okhttp3/internal/IsProbablyUtf8Kt;->isProbablyUtf8$default(Lnicoid/network238/okio/BufferedSource;JILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 486
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " \\\n  --data "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_3

    .line 488
    :cond_7
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, " \\\n  --data-binary "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->readByteString()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Request;->shellEscape(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 455
    :cond_8
    :goto_3
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .line 173
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x20

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    .line 174
    const-string v1, "Request{method="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 175
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 176
    const-string v1, ", url="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 177
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 178
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    if-eqz v1, :cond_4

    .line 179
    const-string v1, ", headers=["

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 180
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->headers:Lnicoid/network238/okhttp3/Headers;

    .line 499
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    const/4 v2, 0x0

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_3

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v4, v2, 0x1

    if-gez v2, :cond_0

    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_0
    check-cast v3, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v3}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    invoke-virtual {v3}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-lez v2, :cond_1

    .line 182
    const-string v2, ", "

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 184
    :cond_1
    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    const/16 v2, 0x3a

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 186
    invoke-static {v5}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->isSensitiveHeader(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v3, "\u2588\u2588"

    :cond_2
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move v2, v4

    goto :goto_0

    :cond_3
    nop

    .line 188
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 190
    :cond_4
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    sget-object v2, Lnicoid/network238/okhttp3/internal/EmptyTags;->INSTANCE:Lnicoid/network238/okhttp3/internal/EmptyTags;

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_5

    .line 191
    const-string v1, ", tags="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    :cond_5
    nop

    .line 194
    const/16 v1, 0x7d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 173
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final url()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method
