.class public final Lnicoid/network238/okhttp3/Cache$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/Cache;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000L\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\"\n\u0002\u0008\u0004\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0010\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\u000cH\u0007J\u0015\u0010\r\u001a\u00020\u00052\u0006\u0010\u000e\u001a\u00020\u000fH\u0000\u00a2\u0006\u0002\u0008\u0010J\u001e\u0010\u0011\u001a\u00020\u00122\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0018J\n\u0010\u0019\u001a\u00020\u0012*\u00020\u0014J\u0012\u0010\u001a\u001a\u0008\u0012\u0004\u0012\u00020\n0\u001b*\u00020\u0016H\u0002J\n\u0010\u001c\u001a\u00020\u0016*\u00020\u0014J\u0018\u0010\u001c\u001a\u00020\u00162\u0006\u0010\u001d\u001a\u00020\u00162\u0006\u0010\u001e\u001a\u00020\u0016H\u0002R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0007\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/Cache$Companion;",
        "",
        "<init>",
        "()V",
        "VERSION",
        "",
        "ENTRY_METADATA",
        "ENTRY_BODY",
        "ENTRY_COUNT",
        "key",
        "",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "readInt",
        "source",
        "Lnicoid/network238/okio/BufferedSource;",
        "readInt$okhttp",
        "varyMatches",
        "",
        "cachedResponse",
        "Lnicoid/network238/okhttp3/Response;",
        "cachedRequest",
        "Lnicoid/network238/okhttp3/Headers;",
        "newRequest",
        "Lnicoid/network238/okhttp3/Request;",
        "hasVaryAll",
        "varyFields",
        "",
        "varyHeaders",
        "requestHeaders",
        "responseHeaders",
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

    .line 740
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/Cache$Companion;-><init>()V

    return-void
.end method

.method private final varyFields(Lnicoid/network238/okhttp3/Headers;)Ljava/util/Set;
    .registers 15
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Headers;",
            ")",
            "Ljava/util/Set<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 789
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x0

    move v3, v2

    :goto_0
    if-ge v3, v0, :cond_3

    .line 790
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v4

    const-string v5, "Vary"

    const/4 v6, 0x1

    invoke-static {v5, v4, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v4

    if-nez v4, :cond_0

    goto :goto_2

    .line 794
    :cond_0
    invoke-virtual {p1, v3}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v7

    if-nez v1, :cond_1

    .line 796
    new-instance v1, Ljava/util/TreeSet;

    sget-object v4, Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;->INSTANCE:Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;

    invoke-static {v4}, Lnicoid/network238/kotlin/text/StringsKt;->getCASE_INSENSITIVE_ORDER(Lnicoid/network238/kotlin/jvm/internal/StringCompanionObject;)Ljava/util/Comparator;

    move-result-object v4

    invoke-direct {v1, v4}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    :cond_1
    nop

    .line 798
    new-array v8, v6, [C

    const/16 v4, 0x2c

    aput-char v4, v8, v2

    const/4 v11, 0x6

    const/4 v12, 0x0

    const/4 v9, 0x0

    const/4 v10, 0x0

    invoke-static/range {v7 .. v12}, Lnicoid/network238/kotlin/text/StringsKt;->split$default(Ljava/lang/CharSequence;[CZIILjava/lang/Object;)Ljava/util/List;

    move-result-object v4

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_1
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 799
    invoke-static {v5}, Lnicoid/network238/kotlin/text/StringsKt;->trim(Ljava/lang/CharSequence;)Ljava/lang/CharSequence;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-interface {v1, v5}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_1

    :cond_2
    :goto_2
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :cond_3
    if-nez v1, :cond_4

    .line 802
    invoke-static {}, Lnicoid/network238/kotlin/collections/SetsKt;->emptySet()Ljava/util/Set;

    move-result-object p1

    return-object p1

    :cond_4
    return-object v1
.end method

.method private final varyHeaders(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;
    .registers 8

    .line 824
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/Cache$Companion;->varyFields(Lnicoid/network238/okhttp3/Headers;)Ljava/util/Set;

    move-result-object p2

    .line 825
    invoke-interface {p2}, Ljava/util/Set;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object p1, Lnicoid/network238/okhttp3/Headers;->EMPTY:Lnicoid/network238/okhttp3/Headers;

    return-object p1

    .line 827
    :cond_0
    new-instance v0, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    .line 828
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_2

    .line 829
    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v3

    .line 830
    invoke-interface {p2, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 831
    invoke-virtual {p1, v2}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v0, v3, v4}, Lnicoid/network238/okhttp3/Headers$Builder;->add(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 834
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method


# virtual methods
.method public final hasVaryAll(Lnicoid/network238/okhttp3/Response;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 782
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->varyFields(Lnicoid/network238/okhttp3/Headers;)Ljava/util/Set;

    move-result-object p1

    const-string v0, "*"

    invoke-interface {p1, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final key(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 748
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    .line 749
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->toString()Ljava/lang/String;

    move-result-object p1

    .line 750
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 751
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->md5()Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 752
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final readInt$okhttp(Lnicoid/network238/okio/BufferedSource;)I
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const-string v0, "expected an int but was \""

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 757
    :try_start_0
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readDecimalLong()J

    move-result-wide v1

    .line 758
    invoke-interface {p1}, Lnicoid/network238/okio/BufferedSource;->readUtf8LineStrict()Ljava/lang/String;

    move-result-object p1

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-ltz v3, :cond_0

    const-wide/32 v3, 0x7fffffff

    cmp-long v3, v1, v3

    if-gtz v3, :cond_0

    .line 759
    invoke-interface {p1}, Ljava/lang/CharSequence;->length()I

    move-result v3

    if-gtz v3, :cond_0

    long-to-int p1, v1

    return p1

    .line 760
    :cond_0
    new-instance v3, Ljava/io/IOException;

    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v4, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 v0, 0x22

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :catch_0
    move-exception p1

    .line 764
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {p1}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final varyHeaders(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Headers;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 811
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->networkResponse()Lnicoid/network238/okhttp3/Response;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    .line 812
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    .line 813
    invoke-direct {p0, v0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->varyHeaders(Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    return-object p1
.end method

.method public final varyMatches(Lnicoid/network238/okhttp3/Response;Lnicoid/network238/okhttp3/Headers;Lnicoid/network238/okhttp3/Request;)Z
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 777
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object p1

    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/Cache$Companion;->varyFields(Lnicoid/network238/okhttp3/Headers;)Ljava/util/Set;

    move-result-object p1

    .line 839
    instance-of v0, p1, Ljava/util/Collection;

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 840
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 778
    invoke-virtual {p2, v0}, Lnicoid/network238/okhttp3/Headers;->values(Ljava/lang/String;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {p3, v0}, Lnicoid/network238/okhttp3/Request;->headers(Ljava/lang/String;)Ljava/util/List;

    move-result-object v0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method
