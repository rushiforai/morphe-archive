.class public Lnicoid/network238/okio/ByteString;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Serializable;
.implements Ljava/lang/Comparable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/ByteString$Companion;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/io/Serializable;",
        "Ljava/lang/Comparable<",
        "Lnicoid/network238/okio/ByteString;",
        ">;"
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000n\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000f\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0015\n\u0002\u0010\u0005\n\u0002\u0008\u000c\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0011\n\u0002\u0010\u0000\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0004\u0008\u0016\u0018\u0000 `2\u00020\u00012\u0008\u0012\u0004\u0012\u00020\u00000\u0002:\u0001`B\u0011\u0008\u0000\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\u0010\u0010\u0015\u001a\u00020\u00102\u0006\u0010\u0016\u001a\u00020\u0017H\u0016J\u0012\u0010\u0018\u001a\u00020\u00102\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u001aH\u0017J\u0006\u0010\u001b\u001a\u00020\u0000J\u0006\u0010\u001c\u001a\u00020\u0000J\u0006\u0010\u001d\u001a\u00020\u0000J\u0006\u0010\u001e\u001a\u00020\u0000J\u0015\u0010\u001f\u001a\u00020\u00002\u0006\u0010 \u001a\u00020\u0010H\u0010\u00a2\u0006\u0002\u0008!J\u0010\u0010\"\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u0000H\u0016J\u0010\u0010$\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u0000H\u0016J\u0010\u0010%\u001a\u00020\u00002\u0006\u0010#\u001a\u00020\u0000H\u0016J\u001d\u0010&\u001a\u00020\u00002\u0006\u0010 \u001a\u00020\u00102\u0006\u0010#\u001a\u00020\u0000H\u0010\u00a2\u0006\u0002\u0008\'J\u0012\u0010(\u001a\u00020\u00102\u0008\u0008\u0002\u0010\u0019\u001a\u00020\u001aH\u0017J\u0008\u0010)\u001a\u00020\u0010H\u0016J\u0008\u0010*\u001a\u00020\u0000H\u0016J\u0008\u0010+\u001a\u00020\u0000H\u0016J\u001c\u0010,\u001a\u00020\u00002\u0008\u0008\u0002\u0010-\u001a\u00020\n2\u0008\u0008\u0002\u0010.\u001a\u00020\nH\u0017J\u0015\u0010/\u001a\u0002002\u0006\u00101\u001a\u00020\nH\u0010\u00a2\u0006\u0002\u00082J\u0016\u00103\u001a\u0002002\u0006\u00104\u001a\u00020\nH\u0087\u0002\u00a2\u0006\u0002\u00085J\r\u00107\u001a\u00020\nH\u0010\u00a2\u0006\u0002\u00088J\u0008\u00109\u001a\u00020\u0004H\u0016J\r\u0010:\u001a\u00020\u0004H\u0010\u00a2\u0006\u0002\u0008;J\u0008\u0010<\u001a\u00020=H\u0016J\u0010\u0010>\u001a\u00020?2\u0006\u0010@\u001a\u00020AH\u0016J%\u0010>\u001a\u00020?2\u0006\u0010B\u001a\u00020C2\u0006\u0010D\u001a\u00020\n2\u0006\u0010E\u001a\u00020\nH\u0010\u00a2\u0006\u0002\u0008FJ(\u0010G\u001a\u00020\u001a2\u0006\u0010D\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00002\u0006\u0010I\u001a\u00020\n2\u0006\u0010E\u001a\u00020\nH\u0016J(\u0010G\u001a\u00020\u001a2\u0006\u0010D\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00042\u0006\u0010I\u001a\u00020\n2\u0006\u0010E\u001a\u00020\nH\u0016J,\u0010J\u001a\u00020?2\u0008\u0008\u0002\u0010D\u001a\u00020\n2\u0006\u0010K\u001a\u00020\u00042\u0008\u0008\u0002\u0010L\u001a\u00020\n2\u0006\u0010E\u001a\u00020\nH\u0016J\u000e\u0010M\u001a\u00020\u001a2\u0006\u0010N\u001a\u00020\u0000J\u000e\u0010M\u001a\u00020\u001a2\u0006\u0010N\u001a\u00020\u0004J\u000e\u0010O\u001a\u00020\u001a2\u0006\u0010P\u001a\u00020\u0000J\u000e\u0010O\u001a\u00020\u001a2\u0006\u0010P\u001a\u00020\u0004J\u001a\u0010Q\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00002\u0008\u0008\u0002\u0010R\u001a\u00020\nH\u0007J\u001a\u0010Q\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00042\u0008\u0008\u0002\u0010R\u001a\u00020\nH\u0017J\u001a\u0010S\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00002\u0008\u0008\u0002\u0010R\u001a\u00020\nH\u0007J\u001a\u0010S\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u00042\u0008\u0008\u0002\u0010R\u001a\u00020\nH\u0017J\u0013\u0010T\u001a\u00020\u001a2\u0008\u0010H\u001a\u0004\u0018\u00010UH\u0096\u0002J\u0016\u0010T\u001a\u00020\u001a2\u0006\u0010H\u001a\u00020\u00002\u0006\u0010V\u001a\u00020\u001aJ\u0008\u0010\t\u001a\u00020\nH\u0016J\u0011\u0010W\u001a\u00020\n2\u0006\u0010H\u001a\u00020\u0000H\u0096\u0002J\u0008\u0010X\u001a\u00020\u0010H\u0016J\u0010\u0010Y\u001a\u00020?2\u0006\u0010Z\u001a\u00020[H\u0002J\u0010\u0010\\\u001a\u00020?2\u0006\u0010@\u001a\u00020]H\u0002J\u0015\u00105\u001a\u0002002\u0006\u00104\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008^J\r\u00106\u001a\u00020\nH\u0007\u00a2\u0006\u0002\u0008_R\u0014\u0010\u0003\u001a\u00020\u0004X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u001a\u0010\t\u001a\u00020\nX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000eR\u001c\u0010\u000f\u001a\u0004\u0018\u00010\u0010X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0011\u0010\u0012\"\u0004\u0008\u0013\u0010\u0014R\u0011\u00106\u001a\u00020\n8G\u00a2\u0006\u0006\u001a\u0004\u00086\u0010\u000c\u00a8\u0006a"
    }
    d2 = {
        "Lnicoid/network238/okio/ByteString;",
        "Ljava/io/Serializable;",
        "",
        "data",
        "",
        "<init>",
        "([B)V",
        "getData$okio",
        "()[B",
        "hashCode",
        "",
        "getHashCode$okio",
        "()I",
        "setHashCode$okio",
        "(I)V",
        "utf8",
        "",
        "getUtf8$okio",
        "()Ljava/lang/String;",
        "setUtf8$okio",
        "(Ljava/lang/String;)V",
        "string",
        "charset",
        "Ljava/nio/charset/Charset;",
        "base64",
        "includePadding",
        "",
        "md5",
        "sha1",
        "sha256",
        "sha512",
        "digest",
        "algorithm",
        "digest$okio",
        "hmacSha1",
        "key",
        "hmacSha256",
        "hmacSha512",
        "hmac",
        "hmac$okio",
        "base64Url",
        "hex",
        "toAsciiLowercase",
        "toAsciiUppercase",
        "substring",
        "beginIndex",
        "endIndex",
        "internalGet",
        "",
        "pos",
        "internalGet$okio",
        "get",
        "index",
        "getByte",
        "size",
        "getSize",
        "getSize$okio",
        "toByteArray",
        "internalArray",
        "internalArray$okio",
        "asByteBuffer",
        "Ljava/nio/ByteBuffer;",
        "write",
        "",
        "out",
        "Ljava/io/OutputStream;",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "offset",
        "byteCount",
        "write$okio",
        "rangeEquals",
        "other",
        "otherOffset",
        "copyInto",
        "target",
        "targetOffset",
        "startsWith",
        "prefix",
        "endsWith",
        "suffix",
        "indexOf",
        "fromIndex",
        "lastIndexOf",
        "equals",
        "",
        "constantTime",
        "compareTo",
        "toString",
        "readObject",
        "in",
        "Ljava/io/ObjectInputStream;",
        "writeObject",
        "Ljava/io/ObjectOutputStream;",
        "-deprecated_getByte",
        "-deprecated_size",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okio/ByteString$Companion;

.field public static final EMPTY:Lnicoid/network238/okio/ByteString;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final data:[B

.field private transient hashCode:I

.field private transient utf8:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/okio/ByteString$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    .line 238
    new-instance v0, Lnicoid/network238/okio/ByteString;

    const/4 v1, 0x0

    new-array v1, v1, [B

    invoke-direct {v0, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    sput-object v0, Lnicoid/network238/okio/ByteString;->EMPTY:Lnicoid/network238/okio/ByteString;

    return-void
.end method

.method public constructor <init>([B)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 61
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 63
    iput-object p1, p0, Lnicoid/network238/okio/ByteString;->data:[B

    return-void
.end method

.method public static synthetic base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;
    .registers 4

    if-nez p3, :cond_1

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 74
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString;->base64(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: base64"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic base64Url$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;
    .registers 4

    if-nez p3, :cond_1

    const/4 p3, 0x1

    and-int/2addr p2, p3

    if-eqz p2, :cond_0

    move p1, p3

    .line 112
    :cond_0
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString;->base64Url(Z)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: base64Url"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic copyInto$default(Lnicoid/network238/okio/ByteString;I[BIIILjava/lang/Object;)V
    .registers 8

    if-nez p6, :cond_2

    and-int/lit8 p6, p5, 0x1

    const/4 v0, 0x0

    if-eqz p6, :cond_0

    move p1, v0

    :cond_0
    and-int/lit8 p5, p5, 0x4

    if-eqz p5, :cond_1

    move p3, v0

    .line 165
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okio/ByteString;->copyInto(I[BII)V

    return-void

    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: copyInto"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/ByteString$Companion;->decodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final decodeHex(Ljava/lang/String;Z)Lnicoid/network238/okio/ByteString;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->decodeHex(Ljava/lang/String;Z)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;
    .registers 3

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->encodeString(Ljava/lang/String;Ljava/nio/charset/Charset;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic indexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 181
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->indexOf(Lnicoid/network238/okio/ByteString;I)I

    move-result p0

    return p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: indexOf"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic indexOf$default(Lnicoid/network238/okio/ByteString;[BIILjava/lang/Object;)I
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 184
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->indexOf([BI)I

    move-result p0

    return p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: indexOf"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic lastIndexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 184
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    .line 187
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->lastIndexOf(Lnicoid/network238/okio/ByteString;I)I

    move-result p0

    return p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: lastIndexOf"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic lastIndexOf$default(Lnicoid/network238/okio/ByteString;[BIILjava/lang/Object;)I
    .registers 5

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 184
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    .line 190
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->lastIndexOf([BI)I

    move-result p0

    return p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: lastIndexOf"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static final of(Ljava/nio/ByteBuffer;)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/ByteString$Companion;->of(Ljava/nio/ByteBuffer;)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final varargs of([B)Lnicoid/network238/okio/ByteString;
    .registers 2

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/okio/ByteString$Companion;->of([B)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final of([BII)Lnicoid/network238/okio/ByteString;
    .registers 4

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0, p1, p2}, Lnicoid/network238/okio/ByteString$Companion;->of([BII)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method public static final read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/okio/ByteString$Companion;->read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0
.end method

.method private final readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readInt()I

    move-result v0

    .line 206
    sget-object v1, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {v1, p1, v0}, Lnicoid/network238/okio/ByteString$Companion;->read(Ljava/io/InputStream;I)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    .line 207
    const-class v0, Lnicoid/network238/okio/ByteString;

    const-string v1, "data"

    invoke-virtual {v0, v1}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v0

    .line 208
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    .line 209
    iget-object p1, p1, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-virtual {v0, p0, p1}, Ljava/lang/reflect/Field;->set(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method public static synthetic substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;
    .registers 5

    if-nez p4, :cond_2

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 106
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result p2

    .line 121
    :cond_1
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->substring(II)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0

    :cond_2
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: substring"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 214
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    array-length v0, v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeInt(I)V

    .line 215
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->write([B)V

    return-void
.end method


# virtual methods
.method public final -deprecated_getByte(I)B
    .registers 2

    .line 224
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result p1

    return p1
.end method

.method public final -deprecated_size()I
    .registers 2

    .line 232
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    return v0
.end method

.method public asByteBuffer()Ljava/nio/ByteBuffer;
    .registers 2

    .line 140
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-static {v0}, Ljava/nio/ByteBuffer;->wrap([B)Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->asReadOnlyBuffer()Ljava/nio/ByteBuffer;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public final base64()Ljava/lang/String;
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->base64$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public base64(Z)Ljava/lang/String;
    .registers 5

    .line 385
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    invoke-static {v0, p1, v1, v2, v1}, Lnicoid/network238/okio/-Base64;->encodeBase64$default([BZ[BILjava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final base64Url()Ljava/lang/String;
    .registers 4

    const/4 v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->base64Url$default(Lnicoid/network238/okio/ByteString;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public base64Url(Z)Ljava/lang/String;
    .registers 4

    .line 386
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    invoke-static {}, Lnicoid/network238/okio/-Base64;->getBASE64_URL_SAFE()[B

    move-result-object v1

    invoke-static {v0, p1, v1}, Lnicoid/network238/okio/-Base64;->encodeBase64([BZ[B)Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public bridge synthetic compareTo(Ljava/lang/Object;)I
    .registers 2

    .line 61
    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString;->compareTo(Lnicoid/network238/okio/ByteString;)I

    move-result p1

    return p1
.end method

.method public compareTo(Lnicoid/network238/okio/ByteString;)I
    .registers 9

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 491
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    .line 492
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    .line 494
    invoke-static {v0, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v2, :cond_1

    .line 496
    invoke-virtual {p0, v4}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v5

    and-int/lit16 v5, v5, 0xff

    .line 498
    invoke-virtual {p1, v4}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v6

    and-int/lit16 v6, v6, 0xff

    if-ne v5, v6, :cond_0

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    :cond_0
    if-ge v5, v6, :cond_3

    goto :goto_1

    :cond_1
    if-ne v0, v1, :cond_2

    return v3

    :cond_2
    if-ge v0, v1, :cond_3

    :goto_1
    const/4 p1, -0x1

    return p1

    :cond_3
    const/4 p1, 0x1

    return p1
.end method

.method public copyInto(I[BII)V
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 461
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    add-int/2addr p4, p1

    invoke-static {v0, p2, p3, p1, p4}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    return-void
.end method

.method public digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    invoke-static {p1}, Ljava/security/MessageDigest;->getInstance(Ljava/lang/String;)Ljava/security/MessageDigest;

    move-result-object p1

    .line 86
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v2, v1}, Ljava/security/MessageDigest;->update([BII)V

    .line 87
    invoke-virtual {p1}, Ljava/security/MessageDigest;->digest()[B

    move-result-object p1

    .line 89
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0
.end method

.method public final endsWith(Lnicoid/network238/okio/ByteString;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 465
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    sub-int/2addr v0, v1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Lnicoid/network238/okio/ByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result p1

    return p1
.end method

.method public final endsWith([B)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 466
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    array-length v1, p1

    sub-int/2addr v0, v1

    array-length v1, p1

    const/4 v2, 0x0

    invoke-virtual {p0, v0, p1, v2, v1}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p1

    return p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 5

    if-eq p1, p0, :cond_0

    .line 484
    instance-of v0, p1, Lnicoid/network238/okio/ByteString;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    check-cast p1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    if-ne v0, v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {p1, v1, v0, v1, v2}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p1

    if-eqz p1, :cond_1

    :cond_0
    const/4 p1, 0x1

    return p1

    :cond_1
    return v1
.end method

.method public final equals(Lnicoid/network238/okio/ByteString;Z)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eqz p2, :cond_0

    .line 195
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-ByteString;->commonEqualsConstantTime(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Z

    move-result p1

    return p1

    :cond_0
    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public final getByte(I)B
    .registers 2

    .line 127
    invoke-virtual {p0, p1}, Lnicoid/network238/okio/ByteString;->internalGet$okio(I)B

    move-result p1

    return p1
.end method

.method public final getData$okio()[B
    .registers 2

    .line 63
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    return-object v0
.end method

.method public final getHashCode$okio()I
    .registers 2

    .line 65
    iget v0, p0, Lnicoid/network238/okio/ByteString;->hashCode:I

    return v0
.end method

.method public getSize$okio()I
    .registers 2

    .line 453
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    return v0
.end method

.method public final getUtf8$okio()Ljava/lang/String;
    .registers 2

    .line 66
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->utf8:Ljava/lang/String;

    return-object v0
.end method

.method public hashCode()I
    .registers 2

    .line 486
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getHashCode$okio()I

    move-result v0

    if-eqz v0, :cond_0

    return v0

    .line 488
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    invoke-static {v0}, Ljava/util/Arrays;->hashCode([B)I

    move-result v0

    .line 489
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->setHashCode$okio(I)V

    return v0
.end method

.method public hex()Ljava/lang/String;
    .registers 10

    .line 387
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    shl-int/lit8 v0, v0, 0x1

    new-array v0, v0, [C

    .line 389
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v3, v2, :cond_0

    aget-byte v5, v1, v3

    add-int/lit8 v6, v4, 0x1

    .line 390
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v7

    shr-int/lit8 v8, v5, 0x4

    and-int/lit8 v8, v8, 0xf

    aget-char v7, v7, v8

    aput-char v7, v0, v4

    add-int/lit8 v4, v4, 0x2

    .line 392
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v7

    and-int/lit8 v5, v5, 0xf

    .line 393
    aget-char v5, v7, v5

    aput-char v5, v0, v6

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 394
    :cond_0
    invoke-static {v0}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([C)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public hmac$okio(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 103
    :try_start_0
    invoke-static {p1}, Ljavax/crypto/Mac;->getInstance(Ljava/lang/String;)Ljavax/crypto/Mac;

    move-result-object v0

    .line 104
    new-instance v1, Ljavax/crypto/spec/SecretKeySpec;

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->toByteArray()[B

    move-result-object p2

    invoke-direct {v1, p2, p1}, Ljavax/crypto/spec/SecretKeySpec;-><init>([BLjava/lang/String;)V

    invoke-virtual {v0, v1}, Ljavax/crypto/Mac;->init(Ljava/security/Key;)V

    .line 105
    new-instance p1, Lnicoid/network238/okio/ByteString;

    iget-object p2, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-virtual {v0, p2}, Ljavax/crypto/Mac;->doFinal([B)[B

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p1, p2}, Lnicoid/network238/okio/ByteString;-><init>([B)V
    :try_end_0
    .catch Ljava/security/InvalidKeyException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p1

    :catch_0
    move-exception p1

    .line 107
    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/Throwable;)V

    throw p2
.end method

.method public hmacSha1(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 93
    const-string v0, "HmacSHA1"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okio/ByteString;->hmac$okio(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public hmacSha256(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 96
    const-string v0, "HmacSHA256"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okio/ByteString;->hmac$okio(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public hmacSha512(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    const-string v0, "HmacSHA512"

    invoke-virtual {p0, v0, p1}, Lnicoid/network238/okio/ByteString;->hmac$okio(Ljava/lang/String;Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public final indexOf(Lnicoid/network238/okio/ByteString;)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->indexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final indexOf(Lnicoid/network238/okio/ByteString;I)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 181
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->indexOf([BI)I

    move-result p1

    return p1
.end method

.method public final indexOf([B)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->indexOf$default(Lnicoid/network238/okio/ByteString;[BIILjava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public indexOf([BI)I
    .registers 7

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 467
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    array-length v1, p1

    sub-int/2addr v0, v1

    .line 468
    const/4 v1, 0x0

    invoke-static {p2, v1}, Ljava/lang/Math;->max(II)I

    move-result p2

    if-gt p2, v0, :cond_1

    .line 469
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v3, p1

    invoke-static {v2, p2, p1, v1, v3}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v2

    if-eqz v2, :cond_0

    return p2

    :cond_0
    if-eq p2, v0, :cond_1

    add-int/lit8 p2, p2, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public internalArray$okio()[B
    .registers 2

    .line 455
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    return-object v0
.end method

.method public internalGet$okio(I)B
    .registers 3

    .line 452
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    aget-byte p1, v0, p1

    return p1
.end method

.method public final lastIndexOf(Lnicoid/network238/okio/ByteString;)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->lastIndexOf$default(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;IILjava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public final lastIndexOf(Lnicoid/network238/okio/ByteString;I)I
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 474
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/ByteString;->lastIndexOf([BI)I

    move-result p1

    return p1
.end method

.method public final lastIndexOf([B)I
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->lastIndexOf$default(Lnicoid/network238/okio/ByteString;[BIILjava/lang/Object;)I

    move-result p1

    return p1
.end method

.method public lastIndexOf([BI)I
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 475
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    array-length v1, p1

    sub-int/2addr v0, v1

    .line 476
    invoke-static {p2, v0}, Ljava/lang/Math;->min(II)I

    move-result p2

    :goto_0
    const/4 v0, -0x1

    if-ge v0, p2, :cond_1

    .line 477
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v1, p1

    const/4 v2, 0x0

    invoke-static {v0, p2, p1, v2, v1}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v0

    if-eqz v0, :cond_0

    return p2

    :cond_0
    add-int/lit8 p2, p2, -0x1

    goto :goto_0

    :cond_1
    return v0
.end method

.method public final md5()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 76
    const-string v0, "MD5"

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public rangeEquals(ILnicoid/network238/okio/ByteString;II)Z
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 456
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    invoke-virtual {p2, p3, v0, p1, p4}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p1

    return p1
.end method

.method public rangeEquals(I[BII)Z
    .registers 6

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_0

    .line 457
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    sub-int/2addr v0, p4

    if-gt p1, v0, :cond_0

    if-ltz p3, :cond_0

    .line 458
    array-length v0, p2

    sub-int/2addr v0, p4

    if-gt p3, v0, :cond_0

    .line 459
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    invoke-static {v0, p1, p2, p3, p4}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result p1

    if-eqz p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public final setHashCode$okio(I)V
    .registers 2

    .line 65
    iput p1, p0, Lnicoid/network238/okio/ByteString;->hashCode:I

    return-void
.end method

.method public final setUtf8$okio(Ljava/lang/String;)V
    .registers 2

    .line 66
    iput-object p1, p0, Lnicoid/network238/okio/ByteString;->utf8:Ljava/lang/String;

    return-void
.end method

.method public final sha1()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 78
    const-string v0, "SHA-1"

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha256()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 80
    const-string v0, "SHA-256"

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final sha512()Lnicoid/network238/okio/ByteString;
    .registers 2

    .line 82
    const-string v0, "SHA-512"

    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->digest$okio(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final size()I
    .registers 2

    .line 131
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getSize$okio()I

    move-result v0

    return v0
.end method

.method public final startsWith(Lnicoid/network238/okio/ByteString;)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 463
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v1, v0}, Lnicoid/network238/okio/ByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result p1

    return p1
.end method

.method public final startsWith([B)Z
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 464
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, v1, p1, v1, v0}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result p1

    return p1
.end method

.method public string(Ljava/nio/charset/Charset;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Ljava/lang/String;

    .line 71
    iget-object v1, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-direct {v0, v1, p1}, Ljava/lang/String;-><init>([BLjava/nio/charset/Charset;)V

    return-object v0
.end method

.method public final substring()Lnicoid/network238/okio/ByteString;
    .registers 4

    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, v2, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    return-object v0
.end method

.method public final substring(I)Lnicoid/network238/okio/ByteString;
    .registers 5

    const/4 v0, 0x2

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-static {p0, p1, v2, v0, v1}, Lnicoid/network238/okio/ByteString;->substring$default(Lnicoid/network238/okio/ByteString;IIILjava/lang/Object;)Lnicoid/network238/okio/ByteString;

    move-result-object p1

    return-object p1
.end method

.method public substring(II)Lnicoid/network238/okio/ByteString;
    .registers 5

    if-ltz p1, :cond_3

    .line 443
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    if-gt p2, v0, :cond_2

    sub-int v0, p2, p1

    if-ltz v0, :cond_1

    if-nez p1, :cond_0

    .line 448
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    if-ne p2, v0, :cond_0

    return-object p0

    .line 451
    :cond_0
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    invoke-static {v1, p1, p2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object p1

    invoke-direct {v0, p1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0

    .line 446
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "endIndex < beginIndex"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 443
    :cond_2
    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "endIndex > length("

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object p2

    array-length p2, p2

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const/16 p2, 0x29

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    new-instance p2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p2, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p2

    .line 441
    :cond_3
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "beginIndex < 0"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public toAsciiLowercase()Lnicoid/network238/okio/ByteString;
    .registers 7

    const/4 v0, 0x0

    .line 396
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 397
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    aget-byte v1, v1, v0

    const/16 v2, 0x41

    if-lt v1, v2, :cond_2

    const/16 v3, 0x5a

    if-gt v1, v3, :cond_2

    .line 404
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    array-length v5, v4

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    add-int/lit8 v1, v1, 0x20

    int-to-byte v1, v1

    .line 405
    aput-byte v1, v4, v0

    .line 406
    :goto_1
    array-length v0, v4

    if-ge v5, v0, :cond_1

    .line 407
    aget-byte v0, v4, v5

    if-lt v0, v2, :cond_0

    if-gt v0, v3, :cond_0

    add-int/lit8 v0, v0, 0x20

    int-to-byte v0, v0

    .line 412
    aput-byte v0, v4, v5

    goto :goto_2

    :cond_0
    nop

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 415
    :cond_1
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-direct {v0, v4}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-object p0
.end method

.method public toAsciiUppercase()Lnicoid/network238/okio/ByteString;
    .registers 7

    const/4 v0, 0x0

    .line 419
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    if-ge v0, v1, :cond_3

    .line 420
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    aget-byte v1, v1, v0

    const/16 v2, 0x61

    if-lt v1, v2, :cond_2

    const/16 v3, 0x7a

    if-gt v1, v3, :cond_2

    .line 427
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    array-length v5, v4

    invoke-static {v4, v5}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v4

    add-int/lit8 v5, v0, 0x1

    add-int/lit8 v1, v1, -0x20

    int-to-byte v1, v1

    .line 428
    aput-byte v1, v4, v0

    .line 429
    :goto_1
    array-length v0, v4

    if-ge v5, v0, :cond_1

    .line 430
    aget-byte v0, v4, v5

    if-lt v0, v2, :cond_0

    if-gt v0, v3, :cond_0

    add-int/lit8 v0, v0, -0x20

    int-to-byte v0, v0

    .line 435
    aput-byte v0, v4, v5

    goto :goto_2

    :cond_0
    nop

    :goto_2
    add-int/lit8 v5, v5, 0x1

    goto :goto_1

    .line 438
    :cond_1
    new-instance v0, Lnicoid/network238/okio/ByteString;

    invoke-direct {v0, v4}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v0

    :cond_2
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_3
    return-object p0
.end method

.method public toByteArray()[B
    .registers 3

    .line 454
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v1, v0

    invoke-static {v0, v1}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 20

    .line 507
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    if-nez v0, :cond_0

    .line 201
    const-string v0, "[size=0]"

    return-object v0

    .line 509
    :cond_0
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    const/16 v1, 0x40

    # invokes: Lnicoid/network238/okio/internal/-ByteString;->codePointIndexToCharIndex([BI)I
    invoke-static {v0, v1}, Lnicoid/network238/okio/internal/-ByteString;->access$codePointIndexToCharIndex([BI)I

    move-result v0

    const/4 v2, -0x1

    const-string v3, "\u2026]"

    const-string v4, "[size="

    const/16 v5, 0x5d

    const/4 v6, 0x0

    if-ne v0, v2, :cond_4

    .line 511
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    array-length v0, v0

    if-gt v0, v1, :cond_1

    .line 512
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[hex="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 514
    :cond_1
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v2, " hex="

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    .line 517
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    if-gt v1, v2, :cond_3

    .line 522
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    if-ne v1, v2, :cond_2

    move-object/from16 v2, p0

    goto :goto_0

    .line 525
    :cond_2
    new-instance v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    invoke-static {v4, v6, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v1

    invoke-direct {v2, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    .line 514
    :goto_0
    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 517
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "endIndex > length("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 526
    :cond_4
    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v1

    .line 527
    invoke-virtual {v1, v6, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v7

    .line 528
    const/4 v11, 0x4

    const/4 v12, 0x0

    const-string v8, "\\"

    const-string v9, "\\\\"

    const/4 v10, 0x0

    invoke-static/range {v7 .. v12}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v13

    .line 529
    const/16 v17, 0x4

    const/16 v18, 0x0

    const-string v14, "\n"

    const-string v15, "\\n"

    const/16 v16, 0x0

    invoke-static/range {v13 .. v18}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v6

    .line 530
    const/4 v10, 0x4

    const/4 v11, 0x0

    const-string v7, "\r"

    const-string v8, "\\r"

    const/4 v9, 0x0

    invoke-static/range {v6 .. v11}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    .line 531
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    move-result v1

    if-ge v0, v1, :cond_5

    .line 532
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual/range {p0 .. p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " text="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 534
    :cond_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "[text="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public utf8()Ljava/lang/String;
    .registers 2

    .line 378
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getUtf8$okio()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    .line 381
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v0

    invoke-static {v0}, Lnicoid/network238/okio/_JvmPlatformKt;->toUtf8String([B)Ljava/lang/String;

    move-result-object v0

    .line 382
    invoke-virtual {p0, v0}, Lnicoid/network238/okio/ByteString;->setUtf8$okio(Ljava/lang/String;)V

    :cond_0
    return-object v0
.end method

.method public write(Ljava/io/OutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 145
    iget-object v0, p0, Lnicoid/network238/okio/ByteString;->data:[B

    invoke-virtual {p1, v0}, Ljava/io/OutputStream;->write([B)V

    return-void
.end method

.method public write$okio(Lnicoid/network238/okio/Buffer;II)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 149
    invoke-static {p0, p1, p2, p3}, Lnicoid/network238/okio/internal/-ByteString;->commonWrite(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/Buffer;II)V

    return-void
.end method
