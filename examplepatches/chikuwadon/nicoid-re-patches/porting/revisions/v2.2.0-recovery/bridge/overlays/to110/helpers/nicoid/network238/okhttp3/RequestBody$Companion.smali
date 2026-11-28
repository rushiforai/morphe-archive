.class public final Lnicoid/network238/okhttp3/RequestBody$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/RequestBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u000b2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u000c2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ1\u0010\u0006\u001a\u00020\u0005*\u00020\r2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000fH\u0007\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u0011\u001a\u00020\u0005*\u00020\u00122\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ%\u0010\u0011\u001a\u00020\u0005*\u00020\u00132\u0006\u0010\u0014\u001a\u00020\u00152\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0016\u001a\u00020\u0007H\u0007J\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0016\u001a\u00020\u000bH\u0007J.\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0016\u001a\u00020\r2\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f2\u0008\u0008\u0002\u0010\u0010\u001a\u00020\u000fH\u0007J\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0017\u001a\u00020\u0012H\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0018"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/RequestBody$Companion;",
        "",
        "<init>",
        "()V",
        "EMPTY",
        "Lnicoid/network238/okhttp3/RequestBody;",
        "toRequestBody",
        "",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "create",
        "Lnicoid/network238/okio/ByteString;",
        "Ljava/io/FileDescriptor;",
        "",
        "offset",
        "",
        "byteCount",
        "asRequestBody",
        "Ljava/io/File;",
        "Lnicoid/network238/okio/Path;",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "content",
        "file",
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

    .line 113
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/RequestBody$Companion;-><init>()V

    return-void
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 183
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 146
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 124
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okhttp3/MediaType;[BIIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 7

    and-int/lit8 p6, p5, 0x4

    if-eqz p6, :cond_0

    const/4 p3, 0x0

    :cond_0
    and-int/lit8 p5, p5, 0x8

    if-eqz p5, :cond_1

    .line 256
    array-length p4, p2

    .line 252
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okhttp3/MediaType;[BII)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 132
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 6

    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_0

    const/4 p3, 0x0

    .line 197
    :cond_0
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;[BLnicoid/network238/okhttp3/MediaType;IIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p6, p5, 0x2

    if-eqz p6, :cond_1

    const/4 p3, 0x0

    :cond_1
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_2

    .line 166
    array-length p4, p1

    .line 163
    :cond_2
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final create(Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 184
    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion$asRequestBody$1;

    invoke-direct {v0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion$asRequestBody$1;-><init>(Lnicoid/network238/okhttp3/MediaType;Ljava/io/File;)V

    return-object v0
.end method

.method public final create(Ljava/io/FileDescriptor;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 147
    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;

    invoke-direct {v0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$2;-><init>(Lnicoid/network238/okhttp3/MediaType;Ljava/io/FileDescriptor;)V

    return-object v0
.end method

.method public final create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 125
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/Internal;->chooseCharset(Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/kotlin/Pair;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-virtual {p2}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okhttp3/MediaType;

    .line 126
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 127
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, p2, v1, v0}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;Ljava/io/File;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 272
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/io/File;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 224
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 239
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/RequestBody;
    .registers 10

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0xc

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okhttp3/MediaType;[BIIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;[BI)Lnicoid/network238/okhttp3/RequestBody;
    .registers 11

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/16 v5, 0x8

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;Lnicoid/network238/okhttp3/MediaType;[BIIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;[BII)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 257
    invoke-virtual {p0, p2, p1, p3, p4}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$1;

    invoke-direct {v0, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$1;-><init>(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)V

    return-object v0
.end method

.method public final create(Lnicoid/network238/okio/Path;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 201
    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion$asRequestBody$2;

    invoke-direct {v0, p3, p2, p1}, Lnicoid/network238/okhttp3/RequestBody$Companion$asRequestBody$2;-><init>(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;)V

    return-object v0
.end method

.method public final create([B)Lnicoid/network238/okhttp3/RequestBody;
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v5, 0x7

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;[BLnicoid/network238/okhttp3/MediaType;IIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/RequestBody;
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v5, 0x6

    const/4 v6, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;[BLnicoid/network238/okhttp3/MediaType;IIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create([BLnicoid/network238/okhttp3/MediaType;I)Lnicoid/network238/okhttp3/RequestBody;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v5, 0x4

    const/4 v6, 0x0

    const/4 v4, 0x0

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move v3, p3

    invoke-static/range {v0 .. v6}, Lnicoid/network238/okhttp3/RequestBody$Companion;->create$default(Lnicoid/network238/okhttp3/RequestBody$Companion;[BLnicoid/network238/okhttp3/MediaType;IIILjava/lang/Object;)Lnicoid/network238/okhttp3/RequestBody;

    move-result-object p1

    return-object p1
.end method

.method public final create([BLnicoid/network238/okhttp3/MediaType;II)Lnicoid/network238/okhttp3/RequestBody;
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p3

    int-to-long v5, p4

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->checkOffsetAndCount(JJJ)V

    .line 169
    new-instance v0, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;

    invoke-direct {v0, p2, p4, p1, p3}, Lnicoid/network238/okhttp3/RequestBody$Companion$toRequestBody$3;-><init>(Lnicoid/network238/okhttp3/MediaType;I[BI)V

    return-object v0
.end method
