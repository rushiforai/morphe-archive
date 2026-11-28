.class public Lnicoid/network238/okhttp3/CompressionInterceptor;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u000e\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\u0008\u0016\u0018\u00002\u00020\u0001:\u0001\u0018B\u001b\u0012\u0012\u0010\u0002\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00040\u0003\"\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0010\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0011H\u0016J\u0015\u0010\u0012\u001a\u00020\u000f2\u0006\u0010\u0013\u001a\u00020\u000fH\u0000\u00a2\u0006\u0002\u0008\u0014J\u0017\u0010\u0015\u001a\u0004\u0018\u00010\u00042\u0006\u0010\u0016\u001a\u00020\u000bH\u0000\u00a2\u0006\u0002\u0008\u0017R\u001b\u0010\u0002\u001a\n\u0012\u0006\u0008\u0001\u0012\u00020\u00040\u0003\u00a2\u0006\n\n\u0002\u0010\t\u001a\u0004\u0008\u0007\u0010\u0008R\u0014\u0010\n\u001a\u00020\u000bX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000c\u0010\r\u00a8\u0006\u0019"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/CompressionInterceptor;",
        "Lnicoid/network238/okhttp3/Interceptor;",
        "algorithms",
        "",
        "Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;",
        "<init>",
        "([Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;)V",
        "getAlgorithms",
        "()[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;",
        "[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;",
        "acceptEncoding",
        "",
        "getAcceptEncoding$okhttp",
        "()Ljava/lang/String;",
        "intercept",
        "Lnicoid/network238/okhttp3/Response;",
        "chain",
        "Lnicoid/network238/okhttp3/Interceptor$Chain;",
        "decompress",
        "response",
        "decompress$okhttp",
        "lookupDecompressor",
        "encoding",
        "lookupDecompressor$okhttp",
        "DecompressionAlgorithm",
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
.field private final acceptEncoding:Ljava/lang/String;

.field private final algorithms:[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;


# direct methods
.method public varargs constructor <init>([Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->algorithms:[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;

    .line 97
    new-instance v0, Ljava/util/ArrayList;

    array-length v1, p1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    .line 98
    array-length v1, p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_0

    aget-object v3, p1, v2

    .line 40
    invoke-interface {v3}, Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;->getEncoding()Ljava/lang/String;

    move-result-object v3

    .line 99
    invoke-interface {v0, v3}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 41
    :cond_0
    const/16 v7, 0x3e

    const/4 v8, 0x0

    const-string v1, ", "

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v0 .. v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->joinToString$default(Ljava/lang/Iterable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->acceptEncoding:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final decompress$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result v0

    if-nez v0, :cond_0

    goto :goto_0

    .line 67
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    .line 68
    const/4 v1, 0x2

    const-string v2, "Content-Encoding"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v1, v3}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    if-nez v1, :cond_1

    goto :goto_0

    .line 70
    :cond_1
    invoke-virtual {p0, v1}, Lnicoid/network238/okhttp3/CompressionInterceptor;->lookupDecompressor$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;

    move-result-object v1

    if-nez v1, :cond_2

    :goto_0
    return-object p1

    .line 72
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->source()Lnicoid/network238/okio/BufferedSource;

    move-result-object v3

    invoke-interface {v1, v3}, Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;->decompress(Lnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okio/Source;

    move-result-object v1

    invoke-static {v1}, Lnicoid/network238/okio/Okio;->buffer(Lnicoid/network238/okio/Source;)Lnicoid/network238/okio/BufferedSource;

    move-result-object v1

    .line 75
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 76
    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 77
    const-string v2, "Content-Length"

    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Response$Builder;->removeHeader(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 78
    sget-object v2, Lnicoid/network238/okhttp3/ResponseBody;->Companion:Lnicoid/network238/okhttp3/ResponseBody$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v0

    const-wide/16 v3, -0x1

    invoke-virtual {v2, v1, v0, v3, v4}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {p1, v0}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 79
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method

.method public final getAcceptEncoding$okhttp()Ljava/lang/String;
    .registers 2

    .line 37
    iget-object v0, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->acceptEncoding:Ljava/lang/String;

    return-object v0
.end method

.method public final getAlgorithms()[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;
    .registers 2

    .line 35
    iget-object v0, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->algorithms:[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;

    return-object v0
.end method

.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    iget-object v0, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->algorithms:[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;

    array-length v0, v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-nez v0, :cond_1

    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    const-string v1, "Accept-Encoding"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 47
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 48
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 49
    iget-object v2, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->acceptEncoding:Ljava/lang/String;

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    .line 50
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 52
    invoke-interface {p1, v0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    .line 54
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/CompressionInterceptor;->decompress$okhttp(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1

    .line 56
    :cond_1
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-interface {p1, v0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1
.end method

.method public final lookupDecompressor$okhttp(Ljava/lang/String;)Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 83
    iget-object v0, p0, Lnicoid/network238/okhttp3/CompressionInterceptor;->algorithms:[Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;

    array-length v1, v0

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    aget-object v3, v0, v2

    .line 84
    invoke-interface {v3}, Lnicoid/network238/okhttp3/CompressionInterceptor$DecompressionAlgorithm;->getEncoding()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x1

    invoke-static {v4, p1, v5}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-eqz v4, :cond_0

    return-object v3

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, 0x0

    return-object p1
.end method
