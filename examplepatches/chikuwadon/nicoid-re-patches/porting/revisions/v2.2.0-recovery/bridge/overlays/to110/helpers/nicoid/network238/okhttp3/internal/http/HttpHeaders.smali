.class public final Lnicoid/network238/okhttp3/internal/http/HttpHeaders;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000T\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010!\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0005\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u001a\u0018\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u0004*\u00020\u00062\u0006\u0010\u0007\u001a\u00020\u0008\u001a\u001a\u0010\t\u001a\u00020\n*\u00020\u000b2\u000c\u0010\u000c\u001a\u0008\u0012\u0004\u0012\u00020\u00050\rH\u0002\u001a\u000c\u0010\u000e\u001a\u00020\u000f*\u00020\u000bH\u0002\u001a\u0014\u0010\u0010\u001a\u00020\u000f*\u00020\u000b2\u0006\u0010\u0011\u001a\u00020\u0012H\u0002\u001a\u000e\u0010\u0013\u001a\u0004\u0018\u00010\u0008*\u00020\u000bH\u0002\u001a\u000e\u0010\u0014\u001a\u0004\u0018\u00010\u0008*\u00020\u000bH\u0002\u001a\u001a\u0010\u0015\u001a\u00020\n*\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u00182\u0006\u0010\u0019\u001a\u00020\u0006\u001a\n\u0010\u001a\u001a\u00020\u000f*\u00020\u001b\u001a\u0010\u0010\u001c\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u001bH\u0007\"\u000e\u0010\u0000\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\"\u000e\u0010\u0002\u001a\u00020\u0001X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001e"
    }
    d2 = {
        "QUOTED_STRING_DELIMITERS",
        "Lnicoid/network238/okio/ByteString;",
        "TOKEN_DELIMITERS",
        "parseChallenges",
        "",
        "Lnicoid/network238/okhttp3/Challenge;",
        "Lnicoid/network238/okhttp3/Headers;",
        "headerName",
        "",
        "readChallengeHeader",
        "",
        "Lnicoid/network238/okio/Buffer;",
        "result",
        "",
        "skipCommasAndWhitespace",
        "",
        "startsWith",
        "prefix",
        "",
        "readQuotedString",
        "readToken",
        "receiveHeaders",
        "Lnicoid/network238/okhttp3/CookieJar;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "headers",
        "promisesBody",
        "Lnicoid/network238/okhttp3/Response;",
        "hasBody",
        "response",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field private static final QUOTED_STRING_DELIMITERS:Lnicoid/network238/okio/ByteString;

.field private static final TOKEN_DELIMITERS:Lnicoid/network238/okio/ByteString;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 36
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, "\"\\"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    sput-object v1, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lnicoid/network238/okio/ByteString;

    .line 37
    const-string v1, "\t ,="

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public static final hasBody(Lnicoid/network238/okhttp3/Response;)Z
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 253
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->promisesBody(Lnicoid/network238/okhttp3/Response;)Z

    move-result p0

    return p0
.end method

.method public static final parseChallenges(Lnicoid/network238/okhttp3/Headers;Ljava/lang/String;)Ljava/util/List;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Headers;",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Challenge;",
            ">;"
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 59
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 60
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_1

    .line 61
    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {p1, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 62
    new-instance v3, Lnicoid/network238/okio/Buffer;

    invoke-direct {v3}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {p0, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Lnicoid/network238/okio/Buffer;->writeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/Buffer;

    move-result-object v3

    .line 64
    :try_start_0
    invoke-static {v3, v0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readChallengeHeader(Lnicoid/network238/okio/Buffer;Ljava/util/List;)V
    :try_end_0
    .catch Ljava/io/EOFException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_1

    :catch_0
    move-exception v3

    .line 66
    sget-object v4, Lnicoid/network238/okhttp3/internal/platform/Platform;->Companion:Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;

    invoke-virtual {v4}, Lnicoid/network238/okhttp3/internal/platform/Platform$Companion;->get()Lnicoid/network238/okhttp3/internal/platform/Platform;

    move-result-object v4

    const-string v5, "Unable to parse challenge"

    const/4 v6, 0x5

    invoke-virtual {v4, v5, v6, v3}, Lnicoid/network238/okhttp3/internal/platform/Platform;->log(Ljava/lang/String;ILjava/lang/Throwable;)V

    :cond_0
    :goto_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method public static final promisesBody(Lnicoid/network238/okhttp3/Response;)Z
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 225
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v0

    const-string v1, "HEAD"

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 229
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x64

    const/4 v2, 0x1

    if-lt v0, v1, :cond_1

    const/16 v1, 0xc8

    if-lt v0, v1, :cond_2

    :cond_1
    const/16 v1, 0xcc

    if-eq v0, v1, :cond_2

    const/16 v1, 0x130

    if-eq v0, v1, :cond_2

    goto :goto_1

    .line 239
    :cond_2
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->headersContentLength(Lnicoid/network238/okhttp3/Response;)J

    move-result-wide v0

    const-wide/16 v3, -0x1

    cmp-long v0, v0, v3

    if-nez v0, :cond_3

    .line 240
    const-string v0, "Transfer-Encoding"

    const/4 v1, 0x2

    const/4 v3, 0x0

    invoke-static {p0, v0, v3, v1, v3}, Lnicoid/network238/okhttp3/Response;->header$default(Lnicoid/network238/okhttp3/Response;Ljava/lang/String;Ljava/lang/String;ILjava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    const-string v0, "chunked"

    invoke-static {v0, p0, v2}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p0

    if-nez p0, :cond_3

    :goto_0
    const/4 p0, 0x0

    return p0

    :cond_3
    :goto_1
    return v2
.end method

.method private static final readChallengeHeader(Lnicoid/network238/okio/Buffer;Ljava/util/List;)V
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okio/Buffer;",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Challenge;",
            ">;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    const/4 v0, 0x0

    move-object v1, v0

    :goto_0
    if-nez v1, :cond_0

    .line 80
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    .line 81
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readToken(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;

    move-result-object v1

    if-eqz v1, :cond_a

    .line 88
    :cond_0
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    move-result v2

    .line 89
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readToken(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;

    move-result-object v3

    if-nez v3, :cond_2

    .line 91
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result p0

    if-nez p0, :cond_1

    goto/16 :goto_3

    .line 92
    :cond_1
    new-instance p0, Lnicoid/network238/okhttp3/Challenge;

    invoke-static {}, Lnicoid/network238/kotlin/collections/MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object v0

    invoke-direct {p0, v1, v0}, Lnicoid/network238/okhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2
    nop

    .line 96
    const/16 v4, 0x3d

    invoke-static {p0, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->skipAll(Lnicoid/network238/okio/Buffer;B)I

    move-result v5

    .line 97
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    move-result v6

    if-nez v2, :cond_4

    if-nez v6, :cond_3

    .line 100
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v2

    if-eqz v2, :cond_4

    .line 102
    :cond_3
    new-instance v2, Lnicoid/network238/okhttp3/Challenge;

    .line 104
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    const-string v3, "="

    invoke-static {v3, v5}, Lnicoid/network238/kotlin/text/StringsKt;->repeat(Ljava/lang/CharSequence;I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v4, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v0, v3}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 102
    invoke-direct {v2, v1, v3}, Lnicoid/network238/okhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    .line 101
    invoke-interface {p1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v1, v0

    goto :goto_0

    .line 112
    :cond_4
    new-instance v2, Ljava/util/LinkedHashMap;

    invoke-direct {v2}, Ljava/util/LinkedHashMap;-><init>()V

    .line 113
    invoke-static {p0, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->skipAll(Lnicoid/network238/okio/Buffer;B)I

    move-result v6

    add-int/2addr v5, v6

    :goto_1
    if-nez v3, :cond_5

    .line 116
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readToken(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;

    move-result-object v3

    .line 117
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    move-result v5

    if-nez v5, :cond_c

    .line 118
    invoke-static {p0, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->skipAll(Lnicoid/network238/okio/Buffer;B)I

    move-result v5

    :cond_5
    if-eqz v5, :cond_c

    const/4 v6, 0x1

    if-le v5, v6, :cond_6

    goto :goto_3

    .line 122
    :cond_6
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    move-result v6

    if-nez v6, :cond_a

    .line 126
    const/16 v6, 0x22

    invoke-static {p0, v6}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->startsWith(Lnicoid/network238/okio/Buffer;B)Z

    move-result v6

    if-eqz v6, :cond_7

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readQuotedString(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;

    move-result-object v6

    goto :goto_2

    .line 127
    :cond_7
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->readToken(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;

    move-result-object v6

    :goto_2
    if-nez v6, :cond_8

    goto :goto_3

    .line 130
    :cond_8
    invoke-interface {v2, v3, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-eqz v3, :cond_9

    goto :goto_3

    .line 133
    :cond_9
    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z

    move-result v3

    if-nez v3, :cond_b

    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v3

    if-nez v3, :cond_b

    :cond_a
    :goto_3
    return-void

    .line 113
    :cond_b
    move-object v3, v0

    goto :goto_1

    .line 135
    :cond_c
    new-instance v4, Lnicoid/network238/okhttp3/Challenge;

    invoke-direct {v4, v1, v2}, Lnicoid/network238/okhttp3/Challenge;-><init>(Ljava/lang/String;Ljava/util/Map;)V

    invoke-interface {p1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    move-object v1, v3

    goto/16 :goto_0
.end method

.method private static final readQuotedString(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/EOFException;
        }
    .end annotation

    .line 172
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    move-result v0

    const/16 v1, 0x22

    if-ne v0, v1, :cond_3

    .line 173
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 175
    :goto_0
    sget-object v2, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->QUOTED_STRING_DELIMITERS:Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, v2}, Lnicoid/network238/okio/Buffer;->indexOfElement(Lnicoid/network238/okio/ByteString;)J

    move-result-wide v2

    const-wide/16 v4, -0x1

    cmp-long v4, v2, v4

    if-nez v4, :cond_0

    goto :goto_1

    .line 178
    :cond_0
    invoke-virtual {p0, v2, v3}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v4

    if-ne v4, v1, :cond_1

    .line 179
    invoke-virtual {v0, p0, v2, v3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 181
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    .line 182
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->readUtf8()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 185
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x1

    add-long v8, v2, v6

    cmp-long v4, v4, v8

    if-nez v4, :cond_2

    :goto_1
    const/4 p0, 0x0

    return-object p0

    .line 186
    :cond_2
    invoke-virtual {v0, p0, v2, v3}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 188
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    .line 189
    invoke-virtual {v0, p0, v6, v7}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    goto :goto_0

    .line 172
    :cond_3
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private static final readToken(Lnicoid/network238/okio/Buffer;)Ljava/lang/String;
    .registers 5

    .line 198
    sget-object v0, Lnicoid/network238/okhttp3/internal/http/HttpHeaders;->TOKEN_DELIMITERS:Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/Buffer;->indexOfElement(Lnicoid/network238/okio/ByteString;)J

    move-result-wide v0

    const-wide/16 v2, -0x1

    cmp-long v2, v0, v2

    if-nez v2, :cond_0

    .line 199
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    :cond_0
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-eqz v2, :cond_1

    .line 202
    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->readUtf8(J)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final receiveHeaders(Lnicoid/network238/okhttp3/CookieJar;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 211
    sget-object v0, Lnicoid/network238/okhttp3/CookieJar;->NO_COOKIES:Lnicoid/network238/okhttp3/CookieJar;

    if-ne p0, v0, :cond_0

    goto :goto_0

    .line 213
    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/Cookie;->Companion:Lnicoid/network238/okhttp3/Cookie$Companion;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Cookie$Companion;->parseAll(Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Headers;)Ljava/util/List;

    move-result-object p2

    .line 214
    invoke-interface {p2}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    :goto_0
    return-void

    .line 216
    :cond_1
    invoke-interface {p0, p1, p2}, Lnicoid/network238/okhttp3/CookieJar;->saveFromResponse(Lnicoid/network238/okhttp3/HttpUrl;Ljava/util/List;)V

    return-void
.end method

.method private static final skipCommasAndWhitespace(Lnicoid/network238/okio/Buffer;)Z
    .registers 4

    const/4 v0, 0x0

    .line 142
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v1

    if-nez v1, :cond_2

    .line 143
    const-wide/16 v1, 0x0

    invoke-virtual {p0, v1, v2}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result v1

    const/16 v2, 0x2c

    if-ne v1, v2, :cond_0

    .line 146
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/16 v2, 0x20

    if-eq v1, v2, :cond_1

    const/16 v2, 0x9

    if-eq v1, v2, :cond_1

    goto :goto_1

    .line 151
    :cond_1
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->readByte()B

    goto :goto_0

    :cond_2
    :goto_1
    return v0
.end method

.method private static final startsWith(Lnicoid/network238/okio/Buffer;B)Z
    .registers 4

    .line 163
    invoke-virtual {p0}, Lnicoid/network238/okio/Buffer;->exhausted()Z

    move-result v0

    if-nez v0, :cond_0

    const-wide/16 v0, 0x0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/Buffer;->getByte(J)B

    move-result p0

    if-ne p0, p1, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
