.class public final Lnicoid/network238/okhttp3/ResponseBody$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/ResponseBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0012\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u00072\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u000b2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\u001d\u0010\u0006\u001a\u00020\u0005*\u00020\u000c2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\tH\u0007\u00a2\u0006\u0002\u0008\nJ\'\u0010\r\u001a\u00020\u0005*\u00020\u000e2\n\u0008\u0002\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u0010H\u0007\u00a2\u0006\u0002\u0008\nJ\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0011\u001a\u00020\u0007H\u0007J\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0011\u001a\u00020\u000bH\u0007J\u001a\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u0011\u001a\u00020\u000cH\u0007J\"\u0010\n\u001a\u00020\u00052\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u000eH\u0007R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/ResponseBody$Companion;",
        "",
        "<init>",
        "()V",
        "EMPTY",
        "Lnicoid/network238/okhttp3/ResponseBody;",
        "toResponseBody",
        "",
        "contentType",
        "Lnicoid/network238/okhttp3/MediaType;",
        "create",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "asResponseBody",
        "Lnicoid/network238/okio/BufferedSource;",
        "contentLength",
        "",
        "content",
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

    .line 229
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/ResponseBody$Companion;-><init>()V

    return-void
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/ResponseBody$Companion;Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 244
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/ResponseBody$Companion;Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;JILjava/lang/Object;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 7

    and-int/lit8 p6, p5, 0x1

    if-eqz p6, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_1

    const-wide/16 p3, -0x1

    .line 269
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/ResponseBody$Companion;Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 261
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic create$default(Lnicoid/network238/okhttp3/ResponseBody$Companion;[BLnicoid/network238/okhttp3/MediaType;ILjava/lang/Object;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 253
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 245
    invoke-static {p2}, Lnicoid/network238/okhttp3/internal/Internal;->chooseCharset(Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/kotlin/Pair;

    move-result-object p2

    invoke-virtual {p2}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/nio/charset/Charset;

    invoke-virtual {p2}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lnicoid/network238/okhttp3/MediaType;

    .line 246
    new-instance v1, Lnicoid/network238/okio/Buffer;

    invoke-direct {v1}, Lnicoid/network238/okio/Buffer;-><init>()V

    invoke-virtual {v1, p1, v0}, Lnicoid/network238/okio/Buffer;->writeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/Buffer;

    move-result-object p1

    .line 247
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p0, p1, p2, v0, v1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;JLnicoid/network238/okio/BufferedSource;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 5

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 340
    invoke-virtual {p0, p4, p1, p2, p3}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;Ljava/lang/String;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 294
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Ljava/lang/String;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 324
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okhttp3/MediaType;[B)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 309
    invoke-virtual {p0, p2, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 273
    new-instance v0, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;

    invoke-direct {v0, p2, p3, p4, p1}, Lnicoid/network238/okhttp3/ResponseBody$Companion$asResponseBody$1;-><init>(Lnicoid/network238/okhttp3/MediaType;JLnicoid/network238/okio/BufferedSource;)V

    return-object v0
.end method

.method public final create(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 262
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 263
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 264
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p1

    int-to-long v1, p1

    invoke-virtual {p0, v0, p2, v1, v2}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method

.method public final create([BLnicoid/network238/okhttp3/MediaType;)Lnicoid/network238/okhttp3/ResponseBody;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 254
    new-instance v0, Lnicoid/network238/okio/Buffer;

    invoke-direct {v0}, Lnicoid/network238/okio/Buffer;-><init>()V

    .line 255
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Buffer;->write([B)Lnicoid/network238/okio/Buffer;

    move-result-object v0

    .line 256
    array-length p1, p1

    int-to-long v1, p1

    invoke-virtual {p0, v0, p2, v1, v2}, Lnicoid/network238/okhttp3/ResponseBody$Companion;->create(Lnicoid/network238/okio/BufferedSource;Lnicoid/network238/okhttp3/MediaType;J)Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p1

    return-object p1
.end method
