.class public Lnicoid/network238/okhttp3/Request$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Request;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000`\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u00002\u00020\u0001B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0002\u0010\u0003B\u0011\u0008\u0010\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0002\u0010\u0006J\u0010\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u0008H\u0016J\u0010\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020\u000eH\u0016J\u0010\u0010(\u001a\u00020\u000e2\u0006\u0010\u0007\u001a\u00020\u000eH\u0002J\u0010\u0010\u0007\u001a\u00020\u00002\u0006\u0010\u0007\u001a\u00020)H\u0016J\u0018\u0010*\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\u000e2\u0006\u0010,\u001a\u00020\u000eH\u0016J\u0018\u0010-\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\u000e2\u0006\u0010,\u001a\u00020\u000eH\u0016J\u0010\u0010.\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\u000eH\u0016J\u0010\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020/H\u0016J\u0010\u00100\u001a\u00020\u00002\u0006\u00100\u001a\u000201H\u0016J\u0008\u00102\u001a\u00020\u0000H\u0016J\u0008\u00103\u001a\u00020\u0000H\u0016J\u0010\u00104\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0014\u00105\u001a\u00020\u00002\n\u0008\u0002\u0010\u0019\u001a\u0004\u0018\u00010\u001aH\u0017J\u0010\u00106\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0010\u00107\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u0010\u00108\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u001aH\u0016J\u001a\u0010\r\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u000e2\u0008\u0010\u0019\u001a\u0004\u0018\u00010\u001aH\u0016J&\u00109\u001a\u00020\u0000\"\n\u0008\u0000\u0010:\u0018\u0001*\u00020\u00012\u0008\u00109\u001a\u0004\u0018\u0001H:H\u0087\u0008\u00a2\u0006\u0004\u0008;\u0010<J-\u00109\u001a\u00020\u0000\"\u0008\u0008\u0000\u0010:*\u00020\u00012\u000c\u0010=\u001a\u0008\u0012\u0004\u0012\u0002H:0>2\u0008\u00109\u001a\u0004\u0018\u0001H:\u00a2\u0006\u0002\u0010?J\u0012\u00109\u001a\u00020\u00002\u0008\u00109\u001a\u0004\u0018\u00010\u0001H\u0016J-\u00109\u001a\u00020\u0000\"\u0004\u0008\u0000\u0010:2\u000e\u0010=\u001a\n\u0012\u0006\u0008\u0000\u0012\u0002H:0@2\u0008\u00109\u001a\u0004\u0018\u0001H:H\u0016\u00a2\u0006\u0002\u0010AJ\u0010\u0010\u001f\u001a\u00020\u00002\u0008\u0010\u001f\u001a\u0004\u0018\u00010\u0008J\u0006\u0010B\u001a\u00020\u0000J\u0008\u0010C\u001a\u00020\u0005H\u0016R\u001c\u0010\u0007\u001a\u0004\u0018\u00010\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\t\u0010\n\"\u0004\u0008\u000b\u0010\u000cR\u001a\u0010\r\u001a\u00020\u000eX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u001a\u0010\u0013\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u001c\u0010\u0019\u001a\u0004\u0018\u00010\u001aX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001b\u0010\u001c\"\u0004\u0008\u001d\u0010\u001eR\u001c\u0010\u001f\u001a\u0004\u0018\u00010\u0008X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008 \u0010\n\"\u0004\u0008!\u0010\u000cR\u001a\u0010\"\u001a\u00020#X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008$\u0010%\"\u0004\u0008&\u0010\'\u00a8\u0006D"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Request$Builder;",
        "",
        "<init>",
        "()V",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "(Lnicoid/network238/okhttp3/Request;)V",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "getUrl$okhttp",
        "()Lnicoid/network238/okhttp3/HttpUrl;",
        "setUrl$okhttp",
        "(Lnicoid/network238/okhttp3/HttpUrl;)V",
        "method",
        "",
        "getMethod$okhttp",
        "()Ljava/lang/String;",
        "setMethod$okhttp",
        "(Ljava/lang/String;)V",
        "headers",
        "Lnicoid/network238/okhttp3/Headers$Builder;",
        "getHeaders$okhttp",
        "()Lnicoid/network238/okhttp3/Headers$Builder;",
        "setHeaders$okhttp",
        "(Lnicoid/network238/okhttp3/Headers$Builder;)V",
        "body",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "getBody$okhttp",
        "()Lnicoid/network238/okhttp3/RequestBody;",
        "setBody$okhttp",
        "(Lnicoid/network238/okhttp3/RequestBody;)V",
        "cacheUrlOverride",
        "getCacheUrlOverride$okhttp",
        "setCacheUrlOverride$okhttp",
        "tags",
        "Lnicoid/network238/okhttp3/internal/Tags;",
        "getTags$okhttp",
        "()Lnicoid/network238/okhttp3/internal/Tags;",
        "setTags$okhttp",
        "(Lnicoid/network238/okhttp3/internal/Tags;)V",
        "canonicalUrl",
        "Ljava/net/URL;",
        "header",
        "name",
        "value",
        "addHeader",
        "removeHeader",
        "Lnicoid/network238/okhttp3/Headers;",
        "cacheControl",
        "Lnicoid/network238/okhttp3/CacheControl;",
        "get",
        "head",
        "post",
        "delete",
        "put",
        "patch",
        "query",
        "tag",
        "T",
        "reifiedTag",
        "(Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;",
        "type",
        "Lnicoid/network238/kotlin/reflect/KClass;",
        "(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;",
        "Ljava/lang/Class;",
        "(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;",
        "gzip",
        "build",
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
.field private body:Lnicoid/network238/okhttp3/RequestBody;

.field private cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

.field private headers:Lnicoid/network238/okhttp3/Headers$Builder;

.field private method:Ljava/lang/String;

.field private tags:Lnicoid/network238/okhttp3/internal/Tags;

.field private url:Lnicoid/network238/okhttp3/HttpUrl;


# direct methods
.method public constructor <init>()V
    .registers 2

    .line 205
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    sget-object v0, Lnicoid/network238/okhttp3/internal/EmptyTags;->INSTANCE:Lnicoid/network238/okhttp3/internal/EmptyTags;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    .line 206
    const-string v0, "GET"

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 207
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Request;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 210
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 203
    sget-object v0, Lnicoid/network238/okhttp3/internal/EmptyTags;->INSTANCE:Lnicoid/network238/okhttp3/internal/EmptyTags;

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    .line 211
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->url:Lnicoid/network238/okhttp3/HttpUrl;

    .line 212
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 213
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->body()Lnicoid/network238/okhttp3/RequestBody;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    .line 214
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->getTags$okhttp()Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    .line 215
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    .line 216
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->cacheUrlOverride()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    return-void
.end method

.method private final canonicalUrl(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 235
    const-string v0, "ws:"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_0

    const/4 v0, 0x3

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "http:"

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    return-object p1

    .line 236
    :cond_0
    const-string v0, "wss:"

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-eqz v0, :cond_1

    const/4 v0, 0x4

    invoke-virtual {p1, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p1

    const-string v0, "https:"

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    :cond_1
    return-object p1
.end method

.method public static synthetic delete$default(Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/RequestBody;ILjava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 4

    if-nez p3, :cond_1

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 304
    sget-object p1, Lnicoid/network238/okhttp3/RequestBody;->EMPTY:Lnicoid/network238/okhttp3/RequestBody;

    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->delete(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: delete"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public addHeader(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 269
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public build()Lnicoid/network238/okhttp3/Request;
    .registers 2

    .line 432
    new-instance v0, Lnicoid/network238/okhttp3/Request;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/Request;-><init>(Lnicoid/network238/okhttp3/Request$Builder;)V

    return-object v0
.end method

.method public cacheControl(Lnicoid/network238/okhttp3/CacheControl;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 290
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/CacheControl;->toString()Ljava/lang/String;

    move-result-object p1

    .line 292
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-string v1, "Cache-Control"

    if-nez v0, :cond_0

    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1

    .line 293
    :cond_0
    invoke-virtual {p0, v1, p1}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final cacheUrlOverride(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 2

    .line 402
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    return-object p0
.end method

.method public final delete()Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/Request$Builder;->delete$default(Lnicoid/network238/okhttp3/Request$Builder;Lnicoid/network238/okhttp3/RequestBody;ILjava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public delete(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    .line 304
    const-string v0, "DELETE"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public get()Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    .line 297
    const-string v0, "GET"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public final getBody$okhttp()Lnicoid/network238/okhttp3/RequestBody;
    .registers 2

    .line 201
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object v0
.end method

.method public final getCacheUrlOverride$okhttp()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 202
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method

.method public final getHeaders$okhttp()Lnicoid/network238/okhttp3/Headers$Builder;
    .registers 2

    .line 200
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-object v0
.end method

.method public final getMethod$okhttp()Ljava/lang/String;
    .registers 2

    .line 199
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->method:Ljava/lang/String;

    return-object v0
.end method

.method public final getTags$okhttp()Lnicoid/network238/okhttp3/internal/Tags;
    .registers 2

    .line 203
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    return-object v0
.end method

.method public final getUrl$okhttp()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 2

    .line 198
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-object v0
.end method

.method public final gzip()Lnicoid/network238/okhttp3/Request$Builder;
    .registers 5

    .line 420
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    if-eqz v0, :cond_1

    .line 423
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v2, "Content-Encoding"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_0

    .line 428
    iget-object v1, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v3, "gzip"

    invoke-virtual {v1, v2, v3}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    .line 429
    new-instance v1, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;

    invoke-direct {v1, v0}, Lnicoid/network238/okhttp3/internal/http/GzipRequestBody;-><init>(Lnicoid/network238/okhttp3/RequestBody;)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object p0

    .line 425
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Content-Encoding already set: "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    .line 424
    new-instance v1, Ljava/lang/IllegalStateException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 421
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "cannot gzip a request that has no body"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public head()Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    .line 299
    const-string v0, "HEAD"

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    return-object v0
.end method

.method public header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 255
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 281
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->newBuilder()Lnicoid/network238/okhttp3/Headers$Builder;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 337
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v0

    if-lez v0, :cond_3

    const-string v0, "method "

    if-nez p2, :cond_1

    .line 341
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->requiresRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    goto :goto_0

    .line 342
    :cond_0
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " must have a request body."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 341
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 345
    :cond_1
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpMethod;->permitsRequestBody(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 349
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->method:Ljava/lang/String;

    .line 350
    iput-object p2, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-object p0

    .line 346
    :cond_2
    new-instance p2, Ljava/lang/StringBuilder;

    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string p2, " must not have a request body."

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 345
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 337
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "method.isEmpty() == true"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public patch(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 308
    const-string v0, "PATCH"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public post(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 301
    const-string v0, "POST"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public put(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 306
    const-string v0, "PUT"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public query(Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    const-string v0, "QUERY"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final synthetic reifiedTag(Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 5
    .param p1, "tag"    # Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(TT;)",
            "Lnicoid/network238/okhttp3/Request$Builder;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 361
    .local v0, "$i$f$reifiedTag":I
    const/4 v1, 0x4

    const-string v2, "T"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->reifiedOperationMarker(ILjava/lang/String;)V

    const-class v1, Ljava/lang/Object;

    invoke-static {v1}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object v1

    invoke-virtual {p0, v1, p1}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    return-object v1
.end method

.method public removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 275
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers$Builder;->removeAll(Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    return-object p0
.end method

.method public final setBody$okhttp(Lnicoid/network238/okhttp3/RequestBody;)V
    .registers 2

    .line 201
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->body:Lnicoid/network238/okhttp3/RequestBody;

    return-void
.end method

.method public final setCacheUrlOverride$okhttp(Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 2

    .line 202
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->cacheUrlOverride:Lnicoid/network238/okhttp3/HttpUrl;

    return-void
.end method

.method public final setHeaders$okhttp(Lnicoid/network238/okhttp3/Headers$Builder;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 200
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    return-void
.end method

.method public final setMethod$okhttp(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 199
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->method:Ljava/lang/String;

    return-void
.end method

.method public final setTags$okhttp(Lnicoid/network238/okhttp3/internal/Tags;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 203
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    return-void
.end method

.method public final setUrl$okhttp(Lnicoid/network238/okhttp3/HttpUrl;)V
    .registers 2

    .line 198
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-void
.end method

.method public tag(Ljava/lang/Class;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Class<",
            "-TT;>;TT;)",
            "Lnicoid/network238/okhttp3/Request$Builder;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 391
    invoke-static {p1}, Lnicoid/network238/kotlin/jvm/JvmClassMappingKt;->getKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public tag(Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    .line 379
    const-class v0, Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/Reflection;->getOrCreateKotlinClass(Ljava/lang/Class;)Lnicoid/network238/kotlin/reflect/KClass;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->tag(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final tag(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Lnicoid/network238/kotlin/reflect/KClass;",
            "TT;)",
            "Lnicoid/network238/okhttp3/Request$Builder;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 375
    iget-object v0, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/Tags;->plus(Lnicoid/network238/kotlin/reflect/KClass;Ljava/lang/Object;)Lnicoid/network238/okhttp3/internal/Tags;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->tags:Lnicoid/network238/okhttp3/internal/Tags;

    return-object p0
.end method

.method public url(Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 230
    sget-object v0, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->canonicalUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public url(Ljava/net/URL;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    sget-object v0, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    invoke-virtual {p1}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object p1

    return-object p1
.end method

.method public url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 221
    iput-object p1, p0, Lnicoid/network238/okhttp3/Request$Builder;->url:Lnicoid/network238/okhttp3/HttpUrl;

    return-object p0
.end method
