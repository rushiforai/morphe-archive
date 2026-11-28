.class public final Lnicoid/network238/okio/ByteString$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/ByteString;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0010\u0005\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0004\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000c\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0014\u0010\u0008\u001a\u00020\u00072\n\u0010\t\u001a\u00020\n\"\u00020\u000bH\u0007J%\u0010\u000c\u001a\u00020\u0007*\u00020\n2\u0008\u0008\u0002\u0010\r\u001a\u00020\u000e2\u0008\u0008\u0002\u0010\u000f\u001a\u00020\u000eH\u0007\u00a2\u0006\u0002\u0008\u0008J\u0011\u0010\u000c\u001a\u00020\u0007*\u00020\u0010H\u0007\u00a2\u0006\u0002\u0008\u0008J\u000c\u0010\u0011\u001a\u00020\u0007*\u00020\u0012H\u0007J\u001b\u0010\u0013\u001a\u00020\u0007*\u00020\u00122\u0008\u0008\u0002\u0010\u0014\u001a\u00020\u0015H\u0007\u00a2\u0006\u0002\u0008\u0016J\u000e\u0010\u0017\u001a\u0004\u0018\u00010\u0007*\u00020\u0012H\u0007J\u000c\u0010\u0018\u001a\u00020\u0007*\u00020\u0012H\u0007J\u0014\u0010\u0018\u001a\u00020\u0007*\u00020\u00122\u0006\u0010\u0019\u001a\u00020\u001aH\u0007J\u0019\u0010\u001b\u001a\u00020\u0007*\u00020\u001c2\u0006\u0010\u000f\u001a\u00020\u000eH\u0007\u00a2\u0006\u0002\u0008\u001dJ\u0017\u0010\u0017\u001a\u0004\u0018\u00010\u00072\u0006\u0010\u001e\u001a\u00020\u0012H\u0007\u00a2\u0006\u0002\u0008\u001fJ\u0015\u0010\u0018\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u0012H\u0007\u00a2\u0006\u0002\u0008 J\u001d\u0010\u0016\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u00122\u0006\u0010\u0014\u001a\u00020\u0015H\u0007\u00a2\u0006\u0002\u0008!J\u0015\u0010\u0011\u001a\u00020\u00072\u0006\u0010\u001e\u001a\u00020\u0012H\u0007\u00a2\u0006\u0002\u0008\"J\u0015\u0010\u0008\u001a\u00020\u00072\u0006\u0010#\u001a\u00020\u0010H\u0007\u00a2\u0006\u0002\u0008$J%\u0010\u0008\u001a\u00020\u00072\u0006\u0010%\u001a\u00020\n2\u0006\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000eH\u0007\u00a2\u0006\u0002\u0008$J\u001d\u0010\u001d\u001a\u00020\u00072\u0006\u0010&\u001a\u00020\u001c2\u0006\u0010\u000f\u001a\u00020\u000eH\u0007\u00a2\u0006\u0002\u0008\'R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082T\u00a2\u0006\u0002\n\u0000R\u0010\u0010\u0006\u001a\u00020\u00078\u0006X\u0087\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006("
    }
    d2 = {
        "Lnicoid/network238/okio/ByteString$Companion;",
        "",
        "<init>",
        "()V",
        "serialVersionUID",
        "",
        "EMPTY",
        "Lnicoid/network238/okio/ByteString;",
        "of",
        "data",
        "",
        "",
        "toByteString",
        "offset",
        "",
        "byteCount",
        "Ljava/nio/ByteBuffer;",
        "encodeUtf8",
        "",
        "encode",
        "charset",
        "Ljava/nio/charset/Charset;",
        "encodeString",
        "decodeBase64",
        "decodeHex",
        "ignoreWhitespace",
        "",
        "readByteString",
        "Ljava/io/InputStream;",
        "read",
        "string",
        "-deprecated_decodeBase64",
        "-deprecated_decodeHex",
        "-deprecated_encodeString",
        "-deprecated_encodeUtf8",
        "buffer",
        "-deprecated_of",
        "array",
        "inputstream",
        "-deprecated_read",
        "okio"
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

    .line 234
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okio/ByteString$Companion;-><init>()V

    return-void
.end method

.method public static synthetic encodeString$default(Lnicoid/network238/okio/ByteString$Companion;Ljava/lang/String;Ljava/nio/charset/Charset;ILjava/lang/Object;)Lnicoid/network238/okio/ByteString;
    .registers 5

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    .line 263
    sget-object p2, Lnicoid/network238/kotlin/text/Charsets;->UTF_8:Ljava/nio/charset/Charset;

    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString$Companion;->encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic of$default(Lnicoid/network238/okio/ByteString$Companion;[BIIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;
    .registers 6

    and-int/lit8 p5, p4, 0x1

    if-eqz p5, :cond_0

    const/4 p2, 0x0

    :cond_0
    and-int/lit8 p4, p4, 0x2

    if-eqz p4, :cond_1

    .line 226
    array-length p3, p1

    .line 245
    :cond_1
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/ByteString$Companion;->of([BII)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final -deprecated_decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 308
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 319
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 330
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString$Companion;->encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 341
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_of(Ljava/nio/ByteBuffer;)Lnicoid/network238/okio/ByteString;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 352
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->of(Ljava/nio/ByteBuffer;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_of([BII)Lnicoid/network238/okio/ByteString;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 363
    invoke-virtual {p0, p1, p2, p3}, Lnicoid/network238/okio/ByteString$Companion;->of([BII)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final -deprecated_read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 374
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString$Companion;->read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 384
    invoke-static {p1}, Lnicoid/network238/okio/-Base64;->decodeBase64ToArray(Ljava/lang/String;)[B

    move-result-object p1

    if-eqz p1, :cond_0

    .line 385
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0

    :cond_0
    const/4 p1, 0x0

    return-object p1
.end method

.method public final decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 386
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    rem-int/lit8 v0, v0, 0x2

    if-nez v0, :cond_1

    .line 388
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v0, :cond_0

    shl-int/lit8 v3, v2, 0x1

    .line 389
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v4

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v4}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v4

    shl-int/lit8 v4, v4, 0x4

    add-int/lit8 v3, v3, 0x1

    .line 390
    invoke-virtual {p1, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v3}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v3

    add-int/2addr v4, v3

    int-to-byte v3, v4

    .line 391
    aput-byte v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 393
    :cond_0
    new-instance p1, Lnicoid/network238/okio/ByteString;

    invoke-direct {p1, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object p1

    .line 386
    :cond_1
    const-string v0, "Unexpected hex string: "

    invoke-virtual {v0, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v0, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final decodeHex(Ljava/lang/String;Z)Lnicoid/network238/okio/ByteString;
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    .line 273
    invoke-static {p1}, Lnicoid/network238/okio/internal/-ByteString;->decodeHexIgnoreWhitespace(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1

    .line 394
    :cond_0
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    rem-int/lit8 p2, p2, 0x2

    if-nez p2, :cond_2

    .line 396
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p2

    div-int/lit8 p2, p2, 0x2

    new-array v0, p2, [B

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_1

    shl-int/lit8 v2, v1, 0x1

    .line 397
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v3}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v3

    shl-int/lit8 v3, v3, 0x4

    add-int/lit8 v2, v2, 0x1

    .line 398
    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v2}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v2

    add-int/2addr v3, v2

    int-to-byte v2, v3

    .line 399
    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 401
    :cond_1
    new-instance p1, Lnicoid/network238/okio/ByteString;

    invoke-direct {p1, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object p1

    .line 394
    :cond_2
    const-string p2, "Unexpected hex string: "

    invoke-virtual {p2, p1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method

.method public final encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 263
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public final encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 381
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-static {p1}, Lnicoid/network238/okio/_JvmPlatformKt;->asUtf8ToByteArray(Ljava/lang/String;)[B

    move-result-object v1

    invoke-direct {v0, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    .line 382
    invoke-virtual {v0, p1}, Lnicoid/network238/okio/ByteString;->setUtf8$okio(Ljava/lang/String;)V

    return-object v0
.end method

.method public final of(Ljava/nio/ByteBuffer;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 252
    invoke-virtual {p1}, Ljava/nio/Buffer;->remaining()I

    move-result v0

    new-array v0, v0, [B

    .line 253
    invoke-virtual {p1, v0}, Ljava/nio/ByteBuffer;->get([B)Ljava/nio/ByteBuffer;

    .line 254
    new-instance p1, Lnicoid/network238/okio/ByteString;

    invoke-direct {p1, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object p1
.end method

.method public final varargs of([B)Lnicoid/network238/okio/ByteString;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 378
    new-instance v0, Lnicoid/network238/okio/ByteString;

    array-length v1, p1

    invoke-static {p1, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public final of([BII)Lnicoid/network238/okio/ByteString;
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 379
    array-length v0, p1

    int-to-long v1, v0

    int-to-long v3, p2

    int-to-long v5, p3

    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 380
    new-instance v0, Lnicoid/network238/okio/ByteString;

    add-int/2addr p3, p2

    invoke-static {p1, p2, p3}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public final read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p2, :cond_2

    .line 288
    new-array v0, p2, [B

    const/4 v1, 0x0

    :goto_0
    if-ge v1, p2, :cond_1

    sub-int v2, p2, v1

    .line 292
    invoke-virtual {p1, v0, v1, v2}, Ljava/io/InputStream;->read([BII)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_0

    add-int/2addr v1, v2

    goto :goto_0

    .line 293
    :cond_0
    new-instance p1, Ljava/io/EOFException;

    invoke-direct {p1}, Ljava/io/EOFException;-><init>()V

    throw p1

    .line 296
    :cond_1
    new-instance p1, Lnicoid/network238/okio/ByteString;

    invoke-direct {p1, v0}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object p1

    .line 286
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "byteCount < 0: "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2
.end method
