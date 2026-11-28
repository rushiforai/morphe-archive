.class public final Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000:\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u0008\n\u0002\u0010 \n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\u0010\u001a\u0008\u0012\u0004\u0012\u00020\u00110\u000e2\u0006\u0010\u0012\u001a\u00020\u0013J\u0016\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0019R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\t\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000b\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000c\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0014\u0010\r\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u000f\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u000eX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;",
        "",
        "<init>",
        "()V",
        "CONNECTION",
        "",
        "HOST",
        "KEEP_ALIVE",
        "PROXY_CONNECTION",
        "TRANSFER_ENCODING",
        "TE",
        "ENCODING",
        "UPGRADE",
        "HTTP_2_SKIPPED_REQUEST_HEADERS",
        "",
        "HTTP_2_SKIPPED_RESPONSE_HEADERS",
        "http2HeadersList",
        "Lnicoid/network238/okhttp3/internal/http2/Header;",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "readHttp2HeadersList",
        "Lnicoid/network238/okhttp3/Response$Builder;",
        "headerBlock",
        "Lnicoid/network238/okhttp3/Headers;",
        "protocol",
        "Lnicoid/network238/okhttp3/Protocol;",
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

    .line 129
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final http2HeadersList(Lnicoid/network238/okhttp3/Request;)Ljava/util/List;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Request;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/http2/Header;",
            ">;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 169
    new-instance v1, Ljava/util/ArrayList;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v2

    add-int/lit8 v2, v2, 0x4

    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(I)V

    .line 170
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_METHOD:Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 171
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_PATH:Lnicoid/network238/okio/ByteString;

    sget-object v4, Lnicoid/network238/okhttp3/internal/http/RequestLine;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/RequestLine;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v5

    invoke-virtual {v4, v5}, Lnicoid/network238/okhttp3/internal/http/RequestLine;->requestPath(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v2, v3, v4}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 172
    const-string v2, "Host"

    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Request;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    if-eqz v2, :cond_0

    .line 174
    new-instance v3, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v4, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_AUTHORITY:Lnicoid/network238/okio/ByteString;

    invoke-direct {v3, v4, v2}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 176
    :cond_0
    new-instance v2, Lnicoid/network238/okhttp3/internal/http2/Header;

    sget-object v3, Lnicoid/network238/okhttp3/internal/http2/Header;->TARGET_SCHEME:Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v2, v3, p1}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Lnicoid/network238/okio/ByteString;Ljava/lang/String;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 178
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result p1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, p1, :cond_3

    .line 180
    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    sget-object v4, Ljava/util/Locale;->US:Ljava/util/Locale;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_REQUEST_HEADERS:Ljava/util/List;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->access$getHTTP_2_SKIPPED_REQUEST_HEADERS$cp()Ljava/util/List;

    move-result-object v4

    invoke-interface {v4, v3}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 182
    const-string v4, "te"

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 183
    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "trailers"

    invoke-static {v4, v5}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2

    .line 185
    :cond_1
    new-instance v4, Lnicoid/network238/okhttp3/internal/http2/Header;

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v4, v3, v5}, Lnicoid/network238/okhttp3/internal/http2/Header;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_3
    return-object v1
.end method

.method public final readHttp2HeadersList(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 197
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 198
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v1, :cond_2

    .line 199
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v4

    .line 200
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v5

    .line 201
    const-string v6, ":status"

    invoke-static {v4, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 202
    sget-object v2, Lnicoid/network238/okhttp3/internal/http/StatusLine;->Companion:Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "HTTP/1.1 "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/internal/http/StatusLine$Companion;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/internal/http/StatusLine;

    move-result-object v2

    goto :goto_1

    .line 203
    :cond_0
    # getter for: Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->HTTP_2_SKIPPED_RESPONSE_HEADERS:Ljava/util/List;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/http2/Http2ExchangeCodec;->access$getHTTP_2_SKIPPED_RESPONSE_HEADERS$cp()Ljava/util/List;

    move-result-object v6

    invoke-interface {v6, v4}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_1

    .line 204
    invoke-virtual {v0, v4, v5}, Lnicoid/network238/okhttp3/Headers$Builder;->addLenient$okhttp(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    :cond_1
    :goto_1
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_2
    if-eqz v2, :cond_3

    .line 210
    new-instance p1, Lnicoid/network238/okhttp3/Response$Builder;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/Response$Builder;-><init>()V

    .line 211
    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Response$Builder;->protocol(Lnicoid/network238/okhttp3/Protocol;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 212
    iget p2, v2, Lnicoid/network238/okhttp3/internal/http/StatusLine;->code:I

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Response$Builder;->code(I)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 213
    iget-object p2, v2, Lnicoid/network238/okhttp3/internal/http/StatusLine;->message:Ljava/lang/String;

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Response$Builder;->message(Ljava/lang/String;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    .line 214
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object p2

    invoke-virtual {p1, p2}, Lnicoid/network238/okhttp3/Response$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p1

    return-object p1

    .line 207
    :cond_3
    new-instance p1, Ljava/net/ProtocolException;

    const-string p2, "Expected \':status\' header not present"

    invoke-direct {p1, p2}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
