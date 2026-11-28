.class public final Lnicoid/network238/okhttp3/HttpUrl$Builder;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/HttpUrl;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000N\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0002\u0008\u000e\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010!\n\u0002\u0008\u0013\n\u0002\u0010\u000b\n\u0002\u0008\u0012\n\u0002\u0010\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0013\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00002\u0006\u0010\u0004\u001a\u00020\u0005J\u000e\u0010$\u001a\u00020\u00002\u0006\u0010$\u001a\u00020\u0005J\u000e\u0010\n\u001a\u00020\u00002\u0006\u0010\n\u001a\u00020\u0005J\u000e\u0010%\u001a\u00020\u00002\u0006\u0010%\u001a\u00020\u0005J\u000e\u0010\r\u001a\u00020\u00002\u0006\u0010\r\u001a\u00020\u0005J\u000e\u0010\u0010\u001a\u00020\u00002\u0006\u0010\u0010\u001a\u00020\u0005J\u000e\u0010\u0013\u001a\u00020\u00002\u0006\u0010\u0013\u001a\u00020\u0014J\u000e\u0010&\u001a\u00020\u00002\u0006\u0010\'\u001a\u00020\u0005J\u000e\u0010(\u001a\u00020\u00002\u0006\u0010)\u001a\u00020\u0005J\u000e\u0010*\u001a\u00020\u00002\u0006\u0010+\u001a\u00020\u0005J\u000e\u0010,\u001a\u00020\u00002\u0006\u0010\u0019\u001a\u00020\u0005J\u0018\u0010(\u001a\u00020\u00002\u0006\u0010)\u001a\u00020\u00052\u0006\u0010-\u001a\u00020.H\u0002J\u0016\u0010/\u001a\u00020\u00002\u0006\u00100\u001a\u00020\u00142\u0006\u0010\'\u001a\u00020\u0005J\u0016\u00101\u001a\u00020\u00002\u0006\u00100\u001a\u00020\u00142\u0006\u0010+\u001a\u00020\u0005J\u000e\u00102\u001a\u00020\u00002\u0006\u00100\u001a\u00020\u0014J\u000e\u00103\u001a\u00020\u00002\u0006\u00103\u001a\u00020\u0005J\u0010\u00104\u001a\u00020\u00002\u0008\u00104\u001a\u0004\u0018\u00010\u0005J\u0010\u00105\u001a\u00020\u00002\u0008\u00105\u001a\u0004\u0018\u00010\u0005J\u0018\u00106\u001a\u00020\u00002\u0006\u00107\u001a\u00020\u00052\u0008\u00108\u001a\u0004\u0018\u00010\u0005J\u0018\u00109\u001a\u00020\u00002\u0006\u0010:\u001a\u00020\u00052\u0008\u0010;\u001a\u0004\u0018\u00010\u0005J\u0018\u0010<\u001a\u00020\u00002\u0006\u00107\u001a\u00020\u00052\u0008\u00108\u001a\u0004\u0018\u00010\u0005J\u0018\u0010=\u001a\u00020\u00002\u0006\u0010:\u001a\u00020\u00052\u0008\u0010;\u001a\u0004\u0018\u00010\u0005J\u000e\u0010>\u001a\u00020\u00002\u0006\u00107\u001a\u00020\u0005J\u000e\u0010?\u001a\u00020\u00002\u0006\u0010:\u001a\u00020\u0005J\u0010\u0010@\u001a\u00020A2\u0006\u0010B\u001a\u00020\u0005H\u0002J\u0010\u0010C\u001a\u00020\u00002\u0008\u0010C\u001a\u0004\u0018\u00010\u0005J\u0010\u0010!\u001a\u00020\u00002\u0008\u0010!\u001a\u0004\u0018\u00010\u0005J\r\u0010D\u001a\u00020\u0000H\u0000\u00a2\u0006\u0002\u0008EJ\u0006\u0010F\u001a\u00020GJ\u0008\u0010H\u001a\u00020\u0014H\u0002J\u0008\u0010I\u001a\u00020\u0005H\u0016J\u001e\u0010J\u001a\u00020A*\u0008\u0012\u0004\u0012\u00020\u00050K2\n\u0010L\u001a\u00060Mj\u0002`NH\u0002J\u001f\u0010O\u001a\u00020\u00002\u0008\u0010P\u001a\u0004\u0018\u00010G2\u0006\u0010Q\u001a\u00020\u0005H\u0000\u00a2\u0006\u0002\u0008RJ \u0010S\u001a\u00020A2\u0006\u0010Q\u001a\u00020\u00052\u0006\u0010T\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u0014H\u0002J0\u0010V\u001a\u00020A2\u0006\u0010Q\u001a\u00020\u00052\u0006\u0010W\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u00142\u0006\u0010X\u001a\u00020.2\u0006\u0010-\u001a\u00020.H\u0002J\u0008\u0010Y\u001a\u00020AH\u0002J\u0010\u0010Z\u001a\u00020.2\u0006\u0010Q\u001a\u00020\u0005H\u0002J\u0010\u0010[\u001a\u00020.2\u0006\u0010Q\u001a\u00020\u0005H\u0002J\u0014\u0010\\\u001a\n\u0012\u0006\u0012\u0004\u0018\u00010\u00050\u001a*\u00020\u0005H\u0002J \u0010]\u001a\u00020\u00142\u0006\u0010Q\u001a\u00020\u00052\u0006\u0010W\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u0014H\u0002J\u001c\u0010^\u001a\u00020\u0014*\u00020\u00052\u0006\u0010W\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u0014H\u0002J \u0010_\u001a\u00020\u00142\u0006\u0010Q\u001a\u00020\u00052\u0006\u0010W\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u0014H\u0002J \u0010`\u001a\u00020\u00142\u0006\u0010Q\u001a\u00020\u00052\u0006\u0010W\u001a\u00020\u00142\u0006\u0010U\u001a\u00020\u0014H\u0002R\u001c\u0010\u0004\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\"\u0004\u0008\u0008\u0010\tR\u001a\u0010\n\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u0007\"\u0004\u0008\u000c\u0010\tR\u001a\u0010\r\u001a\u00020\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u0007\"\u0004\u0008\u000f\u0010\tR\u001c\u0010\u0010\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0007\"\u0004\u0008\u0012\u0010\tR\u001a\u0010\u0013\u001a\u00020\u0014X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0015\u0010\u0016\"\u0004\u0008\u0017\u0010\u0018R\u001a\u0010\u0019\u001a\u0008\u0012\u0004\u0012\u00020\u00050\u001aX\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u001b\u0010\u001cR$\u0010\u001d\u001a\u000c\u0012\u0006\u0012\u0004\u0018\u00010\u0005\u0018\u00010\u001aX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u001e\u0010\u001c\"\u0004\u0008\u001f\u0010 R\u001c\u0010!\u001a\u0004\u0018\u00010\u0005X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\"\u0010\u0007\"\u0004\u0008#\u0010\t\u00a8\u0006a"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/HttpUrl$Builder;",
        "",
        "<init>",
        "()V",
        "scheme",
        "",
        "getScheme$okhttp",
        "()Ljava/lang/String;",
        "setScheme$okhttp",
        "(Ljava/lang/String;)V",
        "encodedUsername",
        "getEncodedUsername$okhttp",
        "setEncodedUsername$okhttp",
        "encodedPassword",
        "getEncodedPassword$okhttp",
        "setEncodedPassword$okhttp",
        "host",
        "getHost$okhttp",
        "setHost$okhttp",
        "port",
        "",
        "getPort$okhttp",
        "()I",
        "setPort$okhttp",
        "(I)V",
        "encodedPathSegments",
        "",
        "getEncodedPathSegments$okhttp",
        "()Ljava/util/List;",
        "encodedQueryNamesAndValues",
        "getEncodedQueryNamesAndValues$okhttp",
        "setEncodedQueryNamesAndValues$okhttp",
        "(Ljava/util/List;)V",
        "encodedFragment",
        "getEncodedFragment$okhttp",
        "setEncodedFragment$okhttp",
        "username",
        "password",
        "addPathSegment",
        "pathSegment",
        "addPathSegments",
        "pathSegments",
        "addEncodedPathSegment",
        "encodedPathSegment",
        "addEncodedPathSegments",
        "alreadyEncoded",
        "",
        "setPathSegment",
        "index",
        "setEncodedPathSegment",
        "removePathSegment",
        "encodedPath",
        "query",
        "encodedQuery",
        "addQueryParameter",
        "name",
        "value",
        "addEncodedQueryParameter",
        "encodedName",
        "encodedValue",
        "setQueryParameter",
        "setEncodedQueryParameter",
        "removeAllQueryParameters",
        "removeAllEncodedQueryParameters",
        "removeAllCanonicalQueryParameters",
        "",
        "canonicalName",
        "fragment",
        "reencodeForUri",
        "reencodeForUri$okhttp",
        "build",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "effectivePort",
        "toString",
        "toPathString",
        "",
        "out",
        "Ljava/lang/StringBuilder;",
        "Lnicoid/network238/kotlin/text/StringBuilder;",
        "parse",
        "base",
        "input",
        "parse$okhttp",
        "resolvePath",
        "startPos",
        "limit",
        "push",
        "pos",
        "addTrailingSlash",
        "pop",
        "isDot",
        "isDotDot",
        "toQueryNamesAndValues",
        "schemeDelimiterOffset",
        "slashCount",
        "portColonOffset",
        "parsePort",
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
.field private encodedFragment:Ljava/lang/String;

.field private encodedPassword:Ljava/lang/String;

.field private final encodedPathSegments:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private encodedQueryNamesAndValues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field private encodedUsername:Ljava/lang/String;

.field private host:Ljava/lang/String;

.field private port:I

.field private scheme:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 935
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 937
    const-string v0, ""

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 938
    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    .line 940
    const/4 v1, -0x1

    iput v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    .line 941
    filled-new-array {v0}, [Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->mutableListOf([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    return-void
.end method

.method private final addPathSegments(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 10

    const/4 v0, 0x0

    move v3, v0

    .line 1037
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const-string v2, "/\\"

    invoke-static {p1, v2, v3, v1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v4

    .line 1038
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v4, v1, :cond_0

    const/4 v1, 0x1

    move v5, v1

    goto :goto_1

    :cond_0
    move v5, v0

    .line 1039
    :goto_1
    move-object v1, p0

    move-object v2, p1

    move v6, p2

    invoke-direct/range {v1 .. v6}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    add-int/lit8 v3, v4, 0x1

    .line 1041
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1

    if-le v3, p1, :cond_1

    return-object v1

    :cond_1
    move-object p1, v2

    move p2, v6

    goto :goto_0
.end method

.method private final effectivePort()I
    .registers 3

    .line 1272
    iget v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    return v0

    :cond_0
    sget-object v0, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->defaultPort(Ljava/lang/String;)I

    move-result v0

    return v0
.end method

.method private final isDot(Ljava/lang/String;)Z
    .registers 4

    .line 1591
    const-string v0, "."

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    const-string v0, "%2e"

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    return v1
.end method

.method private final isDotDot(Ljava/lang/String;)Z
    .registers 4

    .line 1594
    const-string v0, ".."

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    const/4 v1, 0x1

    if-nez v0, :cond_0

    .line 1595
    const-string v0, "%2e."

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1596
    const-string v0, ".%2e"

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v0

    if-nez v0, :cond_0

    .line 1597
    const-string v0, "%2e%2e"

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result p1

    if-nez p1, :cond_0

    const/4 p1, 0x0

    return p1

    :cond_0
    return v1
.end method

.method private final parsePort(Ljava/lang/String;II)I
    .registers 14

    .line 1702
    :try_start_0
    const-string v3, ""

    const/16 v8, 0x78

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1703
    invoke-static {p1}, Ljava/lang/Integer;->parseInt(Ljava/lang/String;)I

    move-result p1
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const/4 p2, 0x1

    if-gt p2, p1, :cond_0

    const/high16 p2, 0x10000

    if-ge p1, p2, :cond_0

    return p1

    :catch_0
    move-exception v0

    :cond_0
    const/4 p1, -0x1

    return p1
.end method

.method private final pop()V
    .registers 4

    .line 1581
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-interface {v0, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    .line 1584
    invoke-interface {v0}, Ljava/lang/CharSequence;->length()I

    move-result v0

    const-string v1, ""

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 1585
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-interface {v0, v2, v1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 1587
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private final portColonOffset(Ljava/lang/String;II)I
    .registers 6

    :goto_0
    if-ge p2, p3, :cond_3

    .line 1679
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x3a

    if-eq v0, v1, :cond_2

    const/16 v1, 0x5b

    if-ne v0, v1, :cond_1

    :cond_0
    add-int/lit8 p2, p2, 0x1

    if-ge p2, p3, :cond_1

    .line 1682
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x5d

    if-ne v0, v1, :cond_0

    :cond_1
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_2
    return p2

    :cond_3
    return p3
.end method

.method private final push(Ljava/lang/String;IIZZ)V
    .registers 16

    .line 1547
    const/16 v8, 0x70

    const/4 v9, 0x0

    const-string v3, " \"<>^`{}|/\\?#"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    move v1, p2

    move v2, p3

    move v4, p5

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1553
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_0

    goto :goto_1

    .line 1556
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result p2

    if-eqz p2, :cond_1

    .line 1557
    invoke-direct {p0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->pop()V

    return-void

    .line 1560
    :cond_1
    iget-object p2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p2}, Ljava/util/List;->size()I

    move-result p3

    add-int/lit8 p3, p3, -0x1

    invoke-interface {p2, p3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/CharSequence;

    invoke-interface {p2}, Ljava/lang/CharSequence;->length()I

    move-result p2

    .line 1563
    iget-object p3, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    if-nez p2, :cond_2

    .line 1561
    invoke-interface {p3}, Ljava/util/List;->size()I

    move-result p2

    add-int/lit8 p2, p2, -0x1

    invoke-interface {p3, p2, p1}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    .line 1563
    :cond_2
    invoke-interface {p3, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_0
    if-eqz p4, :cond_3

    .line 1566
    iget-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    const-string p2, ""

    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_3
    :goto_1
    return-void
.end method

.method private final removeAllCanonicalQueryParameters(Ljava/lang/String;)V
    .registers 6

    .line 1187
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x2

    const/4 v1, 0x0

    const/4 v2, -0x2

    invoke-static {v0, v1, v2}, Lnicoid/network238/kotlin/internal/ProgressionUtilKt;->getProgressionLastElement(III)I

    move-result v1

    if-gt v1, v0, :cond_1

    .line 1188
    :goto_0
    iget-object v2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    invoke-static {p1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1189
    iget-object v2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    add-int/lit8 v3, v0, 0x1

    invoke-interface {v2, v3}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1190
    iget-object v2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1191
    iget-object v2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_0

    .line 1192
    const/4 p1, 0x0

    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-void

    :cond_0
    if-eq v0, v1, :cond_1

    add-int/lit8 v0, v0, -0x2

    goto :goto_0

    :cond_1
    return-void
.end method

.method private final resolvePath(Ljava/lang/String;II)V
    .registers 14

    if-eq p2, p3, :cond_3

    .line 1516
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x2f

    const-string v2, ""

    const/4 v3, 0x1

    if-eq v0, v1, :cond_0

    const/16 v1, 0x5c

    if-eq v0, v1, :cond_0

    .line 1524
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v1

    sub-int/2addr v1, v3

    invoke-interface {v0, v1, v2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    move v6, p2

    goto :goto_0

    .line 1519
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 1520
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 p2, p2, 0x1

    move v6, p2

    :goto_0
    if-ge v6, p3, :cond_3

    .line 1530
    const-string p2, "/\\"

    invoke-static {p1, p2, v6, p3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v7

    if-ge v7, p3, :cond_1

    move v8, v3

    goto :goto_1

    :cond_1
    const/4 p2, 0x0

    move v8, p2

    .line 1532
    :goto_1
    const/4 v9, 0x1

    move-object v4, p0

    move-object v5, p1

    invoke-direct/range {v4 .. v9}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    if-eqz v8, :cond_2

    add-int/lit8 v6, v7, 0x1

    move-object p1, v5

    goto :goto_0

    :cond_2
    move-object p1, v5

    move v6, v7

    goto :goto_0

    :cond_3
    return-void
.end method

.method private final schemeDelimiterOffset(Ljava/lang/String;II)I
    .registers 9

    sub-int v0, p3, p2

    const/4 v1, 0x2

    if-lt v0, v1, :cond_6

    .line 1635
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    .line 1636
    const/16 v1, 0x61

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v2

    const/16 v3, 0x41

    if-ltz v2, :cond_0

    const/16 v2, 0x7a

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v2

    if-lez v2, :cond_1

    :cond_0
    invoke-static {v0, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v2

    if-ltz v2, :cond_6

    const/16 v2, 0x5a

    invoke-static {v0, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v0

    if-gtz v0, :cond_6

    :cond_1
    add-int/lit8 p2, p2, 0x1

    :goto_0
    if-ge p2, p3, :cond_6

    .line 1639
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v0

    if-gt v1, v0, :cond_2

    const/16 v2, 0x7b

    if-lt v0, v2, :cond_5

    :cond_2
    if-gt v3, v0, :cond_3

    const/16 v2, 0x5b

    if-lt v0, v2, :cond_5

    :cond_3
    const/16 v2, 0x30

    const/16 v4, 0x3a

    if-gt v2, v0, :cond_4

    if-lt v0, v4, :cond_5

    :cond_4
    const/16 v2, 0x2b

    if-eq v0, v2, :cond_5

    const/16 v2, 0x2d

    if-eq v0, v2, :cond_5

    const/16 v2, 0x2e

    if-eq v0, v2, :cond_5

    if-ne v0, v4, :cond_6

    return p2

    :cond_5
    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_6
    const/4 p1, -0x1

    return p1
.end method

.method private final slashCount(Ljava/lang/String;II)I
    .registers 7

    const/4 v0, 0x0

    :goto_0
    if-ge p2, p3, :cond_1

    .line 1661
    invoke-virtual {p1, p2}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x2f

    if-eq v1, v2, :cond_0

    const/16 v2, 0x5c

    if-eq v1, v2, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, 0x1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    return v0
.end method

.method private final toPathString(Ljava/util/List;Ljava/lang/StringBuilder;)V
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;",
            "Ljava/lang/StringBuilder;",
            ")V"
        }
    .end annotation

    .line 1326
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    .line 1327
    const/16 v2, 0x2f

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1328
    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    invoke-virtual {p2, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method private final toQueryNamesAndValues(Ljava/lang/String;)Ljava/util/List;
    .registers 10
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

    .line 1605
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    const/4 v1, 0x0

    move v4, v1

    .line 1607
    :goto_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    if-gt v4, v1, :cond_2

    .line 1608
    const/16 v3, 0x26

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x0

    move-object v2, p1

    invoke-static/range {v2 .. v7}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_0

    .line 1609
    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result p1

    :cond_0
    nop

    .line 1611
    const/16 v3, 0x3d

    const/4 v5, 0x0

    const/4 v6, 0x4

    const/4 v7, 0x0

    invoke-static/range {v2 .. v7}, Lnicoid/network238/kotlin/text/StringsKt;->indexOf$default(Ljava/lang/CharSequence;CIZILjava/lang/Object;)I

    move-result v3

    if-eq v3, v1, :cond_1

    if-gt v3, p1, :cond_1

    .line 1616
    invoke-virtual {v2, v4, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v3, v3, 0x1

    .line 1617
    invoke-virtual {v2, v3, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1613
    :cond_1
    invoke-virtual {v2, v4, p1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1614
    const/4 v1, 0x0

    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :goto_1
    add-int/lit8 v4, p1, 0x1

    move-object p1, v2

    goto :goto_0

    :cond_2
    return-object v0
.end method


# virtual methods
.method public final addEncodedPathSegment(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1019
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    .line 1016
    const/4 v2, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    return-object v0
.end method

.method public final addEncodedPathSegments(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1029
    const/4 v0, 0x1

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->addPathSegments(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final addEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1130
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    .line 1131
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1132
    const/16 v9, 0x53

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " \"\'<>#&="

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1131
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1138
    iget-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_1

    .line 1139
    const/16 v8, 0x53

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\'<>#&="

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 1138
    :goto_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final addPathSegment(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1005
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->push(Ljava/lang/String;IIZZ)V

    return-object v0
.end method

.method public final addPathSegments(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1012
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->addPathSegments(Ljava/lang/String;Z)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    move-result-object p1

    return-object p1
.end method

.method public final addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 14

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1110
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    .line 1111
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1112
    const/16 v9, 0x5b

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1111
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 1117
    iget-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_1

    .line 1118
    const/16 v8, 0x5b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    goto :goto_0

    :cond_1
    const/4 p2, 0x0

    .line 1117
    :goto_0
    invoke-interface {p1, p2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public final build()Lnicoid/network238/okhttp3/HttpUrl;
    .registers 18

    .line 1260
    move-object/from16 v0, p0

    iget-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    if-eqz v2, :cond_6

    .line 1261
    iget-object v3, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    const/4 v7, 0x7

    const/4 v8, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    invoke-static/range {v3 .. v8}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    .line 1262
    iget-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    const/4 v8, 0x7

    const/4 v9, 0x0

    const/4 v7, 0x0

    invoke-static/range {v4 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 1263
    iget-object v5, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    if-eqz v5, :cond_5

    .line 1264
    invoke-direct {v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->effectivePort()I

    move-result v6

    .line 1265
    iget-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    .line 1819
    new-instance v7, Ljava/util/ArrayList;

    const/16 v8, 0xa

    invoke-static {v1, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v9

    invoke-direct {v7, v9}, Ljava/util/ArrayList;-><init>(I)V

    .line 1820
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_0

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    .line 1821
    move-object v10, v9

    check-cast v10, Ljava/lang/String;

    .line 1265
    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x7

    const/4 v15, 0x0

    invoke-static/range {v10 .. v15}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1821
    invoke-interface {v7, v9}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 1266
    :cond_0
    iget-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    const/4 v9, 0x0

    if-eqz v1, :cond_3

    .line 1823
    new-instance v10, Ljava/util/ArrayList;

    invoke-static {v1, v8}, Lnicoid/network238/kotlin/collections/CollectionsKt;->collectionSizeOrDefault(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-direct {v10, v8}, Ljava/util/ArrayList;-><init>(I)V

    .line 1824
    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    .line 1825
    move-object v11, v8

    check-cast v11, Ljava/lang/String;

    if-eqz v11, :cond_1

    .line 1266
    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x1

    const/4 v15, 0x3

    const/16 v16, 0x0

    invoke-static/range {v11 .. v16}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    goto :goto_2

    :cond_1
    move-object v8, v9

    .line 1825
    :goto_2
    invoke-interface {v10, v8}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_1

    .line 1824
    :cond_2
    move-object v8, v10

    goto :goto_3

    .line 1825
    :cond_3
    move-object v8, v9

    .line 1267
    :goto_3
    iget-object v10, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v10, :cond_4

    const/4 v14, 0x7

    const/4 v15, 0x0

    const/4 v11, 0x0

    const/4 v12, 0x0

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v9

    .line 1268
    :cond_4
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->toString()Ljava/lang/String;

    move-result-object v10

    .line 1259
    new-instance v1, Lnicoid/network238/okhttp3/HttpUrl;

    const/4 v11, 0x0

    invoke-direct/range {v1 .. v11}, Lnicoid/network238/okhttp3/HttpUrl;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ILjava/util/List;Ljava/util/List;Ljava/lang/String;Ljava/lang/String;Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v1

    .line 1263
    :cond_5
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "host == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 1260
    :cond_6
    new-instance v1, Ljava/lang/IllegalStateException;

    const-string v2, "scheme == null"

    invoke-direct {v1, v2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public final encodedFragment(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    if-eqz p1, :cond_0

    .line 1211
    const/16 v8, 0x33

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, ""

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1210
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object p0
.end method

.method public final encodedPassword(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 979
    const/16 v8, 0x73

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 978
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-object p0
.end method

.method public final encodedPath(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1080
    const/4 v0, 0x2

    const/4 v1, 0x0

    const-string v2, "/"

    const/4 v3, 0x0

    invoke-static {p1, v2, v3, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith$default(Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 1081
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    invoke-direct {p0, p1, v3, v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->resolvePath(Ljava/lang/String;II)V

    return-object p0

    .line 1080
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected encodedPath: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final encodedQuery(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    if-eqz p1, :cond_0

    .line 1098
    const/16 v8, 0x53

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\'<>#"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1102
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->toQueryNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1096
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-object p0
.end method

.method public final encodedUsername(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 965
    const/16 v8, 0x73

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 964
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-object p0
.end method

.method public final fragment(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    if-eqz p1, :cond_0

    .line 1202
    const/16 v8, 0x3b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, ""

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1201
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object p0
.end method

.method public final getEncodedFragment$okhttp()Ljava/lang/String;
    .registers 2

    .line 943
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object v0
.end method

.method public final getEncodedPassword$okhttp()Ljava/lang/String;
    .registers 2

    .line 938
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-object v0
.end method

.method public final getEncodedPathSegments$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 941
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    return-object v0
.end method

.method public final getEncodedQueryNamesAndValues$okhttp()Ljava/util/List;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 942
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-object v0
.end method

.method public final getEncodedUsername$okhttp()Ljava/lang/String;
    .registers 2

    .line 937
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-object v0
.end method

.method public final getHost$okhttp()Ljava/lang/String;
    .registers 2

    .line 939
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    return-object v0
.end method

.method public final getPort$okhttp()I
    .registers 2

    .line 940
    iget v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    return v0
.end method

.method public final getScheme$okhttp()Ljava/lang/String;
    .registers 2

    .line 936
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    return-object v0
.end method

.method public final host(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 992
    const/4 v1, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x7

    const/4 v5, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 994
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    return-object p0

    .line 993
    :cond_0
    new-instance p1, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected host: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final parse$okhttp(Lnicoid/network238/okhttp3/HttpUrl;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1336
    const/4 v2, 0x0

    const/4 v3, 0x3

    const/4 v4, 0x0

    invoke-static {v1, v2, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfFirstNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I

    move-result v3

    .line 1337
    const/4 v5, 0x2

    invoke-static {v1, v3, v2, v5, v4}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->indexOfLastNonAsciiWhitespace$default(Ljava/lang/String;IIILjava/lang/Object;)I

    move-result v11

    .line 1340
    invoke-direct {v0, v1, v3, v11}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->schemeDelimiterOffset(Ljava/lang/String;II)I

    move-result v4

    const/4 v12, 0x1

    const/4 v13, -0x1

    if-eq v4, v13, :cond_2

    .line 1343
    const-string v6, "https:"

    invoke-static {v1, v6, v3, v12}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith(Ljava/lang/String;Ljava/lang/String;IZ)Z

    move-result v6

    if-eqz v6, :cond_0

    .line 1344
    const-string v4, "https"

    iput-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    add-int/lit8 v3, v3, 0x6

    goto :goto_0

    .line 1348
    :cond_0
    const-string v6, "http:"

    invoke-static {v1, v6, v3, v12}, Lnicoid/network238/kotlin/text/StringsKt;->startsWith(Ljava/lang/String;Ljava/lang/String;IZ)Z

    move-result v6

    if-eqz v6, :cond_1

    .line 1349
    const-string v4, "http"

    iput-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    add-int/lit8 v3, v3, 0x5

    goto :goto_0

    .line 1354
    :cond_1
    new-instance v3, Ljava/lang/IllegalArgumentException;

    .line 1355
    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "Expected URL scheme \'http\' or \'https\' but was \'"

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1356
    invoke-virtual {v1, v2, v4}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1355
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const/16 v2, 0x27

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1354
    invoke-direct {v3, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    :cond_2
    if-eqz p1, :cond_12

    .line 1361
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    :goto_0
    nop

    .line 1372
    invoke-direct {v0, v1, v3, v11}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->slashCount(Ljava/lang/String;II)I

    move-result v4

    const/16 v14, 0x3f

    const/16 v15, 0x23

    if-ge v4, v5, :cond_6

    if-eqz p1, :cond_6

    .line 1373
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v5

    iget-object v6, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_3

    goto :goto_1

    .line 1459
    :cond_3
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedUsername()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    .line 1460
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPassword()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    .line 1461
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1462
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v2

    iput v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    .line 1463
    iget-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->clear()V

    .line 1464
    iget-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPathSegments()Ljava/util/List;

    move-result-object v4

    invoke-interface {v2, v4}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    if-eq v3, v11, :cond_4

    .line 1465
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-ne v2, v15, :cond_5

    .line 1466
    :cond_4
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQuery(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    .line 1471
    :cond_5
    move/from16 v20, v12

    goto/16 :goto_7

    .line 1466
    :cond_6
    :goto_1
    add-int/2addr v3, v4

    move/from16 v16, v2

    move/from16 v17, v16

    move v2, v3

    .line 1385
    :cond_7
    :goto_2
    const-string v3, "@/\\?#"

    invoke-static {v1, v3, v2, v11}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v3

    if-eq v3, v11, :cond_8

    .line 1388
    invoke-virtual {v1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    goto :goto_3

    :cond_8
    move v4, v13

    :goto_3
    if-eq v4, v13, :cond_c

    if-eq v4, v15, :cond_c

    const/16 v5, 0x2f

    if-eq v4, v5, :cond_c

    const/16 v5, 0x5c

    if-eq v4, v5, :cond_c

    if-eq v4, v14, :cond_c

    const/16 v5, 0x40

    if-ne v4, v5, :cond_7

    const-string v4, "%40"

    if-nez v16, :cond_b

    .line 1396
    const/16 v5, 0x3a

    invoke-static {v1, v5, v2, v3}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v5

    .line 1398
    const/16 v9, 0x70

    const/4 v10, 0x0

    move-object v6, v4

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    move v7, v3

    move v3, v5

    const/4 v5, 0x1

    move-object v8, v6

    const/4 v6, 0x0

    move/from16 v18, v7

    const/4 v7, 0x0

    move-object/from16 v19, v8

    const/4 v8, 0x0

    move/from16 v20, v12

    move/from16 v12, v18

    move-object/from16 v15, v19

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    if-eqz v17, :cond_9

    .line 1406
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 1404
    :cond_9
    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    if-eq v3, v12, :cond_a

    add-int/lit8 v2, v3, 0x1

    .line 1413
    const/16 v9, 0x70

    const/4 v10, 0x0

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p2

    move v3, v12

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1412
    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    move/from16 v16, v20

    goto :goto_4

    .line 1404
    :cond_a
    move v3, v12

    .line 1412
    :goto_4
    move-object/from16 v1, p2

    move v7, v3

    move/from16 v17, v20

    goto :goto_5

    .line 1422
    :cond_b
    move-object v15, v4

    move/from16 v20, v12

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v12

    .line 1423
    const/16 v9, 0x70

    const/4 v10, 0x0

    const-string v4, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    move-object/from16 v1, p2

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1422
    move v7, v3

    invoke-virtual {v12, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    :goto_5
    add-int/lit8 v2, v7, 0x1

    move/from16 v12, v20

    const/16 v15, 0x23

    goto/16 :goto_2

    .line 1388
    :cond_c
    move v7, v3

    move/from16 v20, v12

    .line 1435
    invoke-direct {v0, v1, v2, v7}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->portColonOffset(Ljava/lang/String;II)I

    move-result v3

    add-int/lit8 v8, v3, 0x1

    const/16 v9, 0x22

    if-ge v8, v7, :cond_e

    .line 1437
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1438
    invoke-direct {v0, v1, v8, v7}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->parsePort(Ljava/lang/String;II)I

    move-result v4

    iput v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    if-eq v4, v13, :cond_d

    goto :goto_6

    .line 1440
    :cond_d
    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Invalid URL port: \""

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 1441
    invoke-virtual {v1, v8, v7}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    .line 1440
    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1439
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    :cond_e
    nop

    .line 1446
    const/4 v4, 0x0

    const/4 v5, 0x4

    const/4 v6, 0x0

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->percentDecode$default(Ljava/lang/String;IIZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lnicoid/network238/okhttp3/internal/_HostnamesCommonKt;->toCanonicalHost(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1447
    sget-object v4, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    iget-object v5, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v5}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->defaultPort(Ljava/lang/String;)I

    move-result v4

    iput v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    .line 1449
    :goto_6
    iget-object v4, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    if-eqz v4, :cond_11

    move v3, v7

    .line 1471
    :goto_7
    const-string v2, "?#"

    invoke-static {v1, v2, v3, v11}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;Ljava/lang/String;II)I

    move-result v2

    .line 1472
    invoke-direct {v0, v1, v3, v2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->resolvePath(Ljava/lang/String;II)V

    if-ge v2, v11, :cond_f

    .line 1476
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v14, :cond_f

    .line 1477
    const/16 v3, 0x23

    invoke-static {v1, v3, v2, v11}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->delimiterOffset(Ljava/lang/String;CII)I

    move-result v4

    add-int/lit8 v2, v2, 0x1

    .line 1480
    const/16 v9, 0x50

    const/4 v10, 0x0

    move v3, v4

    const-string v4, " \"\'<>#"

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1486
    invoke-direct {v0, v2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->toQueryNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object v2

    .line 1478
    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    move v2, v3

    :cond_f
    if-ge v2, v11, :cond_10

    .line 1491
    invoke-virtual {v1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    const/16 v4, 0x23

    if-ne v3, v4, :cond_10

    add-int/lit8 v2, v2, 0x1

    .line 1493
    const/16 v9, 0x30

    const/4 v10, 0x0

    const-string v4, ""

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x1

    move v3, v11

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    .line 1492
    iput-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    :cond_10
    return-object v0

    .line 1450
    :cond_11
    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "Invalid URL host: \""

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, v2, v3}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1449
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 1363
    :cond_12
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v2

    const/4 v3, 0x6

    if-le v2, v3, :cond_13

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v1, v3}, Lnicoid/network238/kotlin/text/StringsKt;->take(Ljava/lang/String;I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, "..."

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 1364
    :cond_13
    new-instance v2, Ljava/lang/IllegalArgumentException;

    .line 1365
    const-string v3, "Expected URL scheme \'http\' or \'https\' but no scheme was found for "

    invoke-virtual {v3, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    .line 1364
    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method public final password(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 973
    const/16 v8, 0x7b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-object p0
.end method

.method public final port(I)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 4

    const/4 v0, 0x1

    if-gt v0, p1, :cond_0

    const/high16 v0, 0x10000

    if-ge p1, v0, :cond_0

    .line 1000
    iput p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    return-object p0

    .line 999
    :cond_0
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "unexpected port: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final query(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    if-eqz p1, :cond_0

    .line 1088
    const/16 v8, 0x5b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\'<>#"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 1091
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->toQueryNamesAndValues(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    .line 1086
    :goto_0
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-object p0
.end method

.method public final reencodeForUri$okhttp()Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 18

    .line 1224
    move-object/from16 v0, p0

    iget-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    new-instance v3, Lnicoid/network238/kotlin/text/Regex;

    const-string v4, "[\"<>^`{|}]"

    invoke-direct {v3, v4}, Lnicoid/network238/kotlin/text/Regex;-><init>(Ljava/lang/String;)V

    const-string v4, ""

    invoke-virtual {v3, v1, v4}, Lnicoid/network238/kotlin/text/Regex;->replace(Ljava/lang/CharSequence;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    iput-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    .line 1226
    iget-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    if-ge v4, v1, :cond_1

    .line 1227
    iget-object v5, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    .line 1228
    invoke-interface {v5, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ljava/lang/String;

    const/16 v15, 0x63

    const/16 v16, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    const-string v10, "[]"

    const/4 v11, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v7 .. v16}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 1227
    invoke-interface {v5, v4, v6}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v4, v4, 0x1

    goto :goto_1

    .line 1235
    :cond_1
    iget-object v1, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz v1, :cond_3

    .line 1237
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v4

    :goto_2
    if-ge v3, v4, :cond_3

    .line 1239
    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v5

    move-object v6, v5

    check-cast v6, Ljava/lang/String;

    if-eqz v6, :cond_2

    const/16 v14, 0x43

    const/4 v15, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    const-string v9, "\\^`{|}"

    const/4 v10, 0x1

    const/4 v11, 0x1

    const/4 v12, 0x1

    const/4 v13, 0x0

    invoke-static/range {v6 .. v15}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v5

    goto :goto_3

    :cond_2
    move-object v5, v2

    .line 1238
    :goto_3
    invoke-interface {v1, v3, v5}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 1249
    :cond_3
    iget-object v5, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v5, :cond_4

    const/16 v13, 0x23

    const/4 v14, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    const-string v8, " \"#<>\\^`{|}"

    const/4 v9, 0x1

    const/4 v10, 0x1

    const/4 v11, 0x0

    const/4 v12, 0x1

    invoke-static/range {v5 .. v14}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 1248
    :cond_4
    iput-object v2, v0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-object v0
.end method

.method public final removeAllEncodedQueryParameters(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1176
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    return-object p0

    .line 1178
    :cond_0
    const/16 v9, 0x53

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " \"\'<>#&="

    const/4 v5, 0x1

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1177
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->removeAllCanonicalQueryParameters(Ljava/lang/String;)V

    return-object p0
.end method

.method public final removeAllQueryParameters(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 13

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1165
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-nez v0, :cond_0

    return-object p0

    .line 1167
    :cond_0
    const/16 v9, 0x5b

    const/4 v10, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const-string v4, " !\"#$&\'(),/:;<=>?@[]\\^`{|}~"

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    const/4 v8, 0x0

    move-object v1, p1

    invoke-static/range {v1 .. v10}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    .line 1171
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->removeAllCanonicalQueryParameters(Ljava/lang/String;)V

    return-object p0
.end method

.method public final removePathSegment(I)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 3

    .line 1072
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, p1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 1073
    iget-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1074
    iget-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    const-string v0, ""

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object p0
.end method

.method public final scheme(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 951
    const-string v0, "http"

    const/4 v1, 0x1

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_0

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    return-object p0

    .line 952
    :cond_0
    const-string v0, "https"

    invoke-static {p1, v0, v1}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_1

    iput-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    return-object p0

    .line 953
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "unexpected scheme: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final setEncodedFragment$okhttp(Ljava/lang/String;)V
    .registers 2

    .line 943
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    return-void
.end method

.method public final setEncodedPassword$okhttp(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 938
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    return-void
.end method

.method public final setEncodedPathSegment(ILjava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 13

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1060
    const/16 v8, 0x73

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"<>^`{}|/\\?#"

    const/4 v4, 0x1

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1064
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v1, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    .line 1065
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result p1

    if-nez p1, :cond_0

    return-object p0

    .line 1066
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "unexpected path segment: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1065
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final setEncodedQueryNamesAndValues$okhttp(Ljava/util/List;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 942
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    return-void
.end method

.method public final setEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1159
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->removeAllEncodedQueryParameters(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    .line 1160
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->addEncodedQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    return-object p0
.end method

.method public final setEncodedUsername$okhttp(Ljava/lang/String;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 937
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-void
.end method

.method public final setHost$okhttp(Ljava/lang/String;)V
    .registers 2

    .line 939
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    return-void
.end method

.method public final setPathSegment(ILjava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 13

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1048
    const/16 v8, 0x7b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"<>^`{}|/\\?#"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p2

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p2

    .line 1049
    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDot(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    invoke-direct {p0, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->isDotDot(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 1052
    iget-object v0, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-interface {v0, p1, p2}, Ljava/util/List;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-object p0

    .line 1050
    :cond_0
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "unexpected path segment: "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    .line 1049
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final setPort$okhttp(I)V
    .registers 2

    .line 940
    iput p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    return-void
.end method

.method public final setQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1151
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->removeAllQueryParameters(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    .line 1152
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->addQueryParameter(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;

    return-object p0
.end method

.method public final setScheme$okhttp(Ljava/lang/String;)V
    .registers 2

    .line 936
    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 7

    .line 1275
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 1276
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    if-eqz v1, :cond_0

    .line 1277
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1278
    const-string v1, "://"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 1280
    :cond_0
    const-string v1, "//"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1283
    :goto_0
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    const/16 v2, 0x3a

    if-gtz v1, :cond_1

    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_3

    .line 1284
    :cond_1
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1285
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-interface {v1}, Ljava/lang/CharSequence;->length()I

    move-result v1

    if-lez v1, :cond_2

    .line 1286
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1287
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPassword:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_2
    nop

    .line 1289
    const/16 v1, 0x40

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1292
    :cond_3
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    if-eqz v1, :cond_5

    .line 1293
    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v3, 0x2

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-static {v1, v2, v5, v3, v4}, Lnicoid/network238/kotlin/text/StringsKt;->contains$default(Ljava/lang/CharSequence;CZILjava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    .line 1295
    const/16 v1, 0x5b

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1296
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1297
    const/16 v1, 0x5d

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    goto :goto_1

    .line 1299
    :cond_4
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->host:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1303
    :cond_5
    :goto_1
    iget v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->port:I

    const/4 v3, -0x1

    if-ne v1, v3, :cond_6

    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    if-nez v1, :cond_6

    goto :goto_2

    .line 1304
    :cond_6
    invoke-direct {p0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->effectivePort()I

    move-result v1

    .line 1305
    iget-object v3, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->scheme:Ljava/lang/String;

    if-eqz v3, :cond_7

    sget-object v4, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v4, v3}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->defaultPort(Ljava/lang/String;)I

    move-result v3

    if-ne v1, v3, :cond_7

    goto :goto_2

    .line 1306
    :cond_7
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1307
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 1311
    :goto_2
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedPathSegments:Ljava/util/List;

    invoke-direct {p0, v1, v0}, Lnicoid/network238/okhttp3/HttpUrl$Builder;->toPathString(Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 1313
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    if-eqz v1, :cond_8

    .line 1314
    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1315
    sget-object v1, Lnicoid/network238/okhttp3/HttpUrl;->Companion:Lnicoid/network238/okhttp3/HttpUrl$Companion;

    iget-object v2, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedQueryNamesAndValues:Ljava/util/List;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    # invokes: Lnicoid/network238/okhttp3/HttpUrl$Companion;->toQueryString(Ljava/util/List;Ljava/lang/StringBuilder;)V
    invoke-static {v1, v2, v0}, Lnicoid/network238/okhttp3/HttpUrl$Companion;->access$toQueryString(Lnicoid/network238/okhttp3/HttpUrl$Companion;Ljava/util/List;Ljava/lang/StringBuilder;)V

    .line 1318
    :cond_8
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    if-eqz v1, :cond_9

    .line 1319
    const/16 v1, 0x23

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 1320
    iget-object v1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedFragment:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 1275
    :cond_9
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final username(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl$Builder;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 959
    const/16 v8, 0x7b

    const/4 v9, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x0

    const-string v3, " \"\':;<=>@[]^`{}|/\\?#"

    const/4 v4, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x0

    move-object v0, p1

    invoke-static/range {v0 .. v9}, Lnicoid/network238/okhttp3/internal/url/_UrlKt;->canonicalize$default(Ljava/lang/String;IILjava/lang/String;ZZZZILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okhttp3/HttpUrl$Builder;->encodedUsername:Ljava/lang/String;

    return-object p0
.end method
