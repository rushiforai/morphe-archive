.class final Lkotlin/io/encoding/DecodeInputStream;
.super Ljava/io/InputStream;
.source "Base64IOStream.kt"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0008\t\n\u0002\u0010\u0002\n\u0002\u0008\u000b\n\u0002\u0018\u0002\u0008\u0003\u0018\u00002\u00020\u0001B\u0019\u0008F\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J\u0008\u0010\u0014\u001a\u00020\u000fH\u0016J \u0010\u0014\u001a\u00020\u000f2\u0006\u0010\u0015\u001a\u00020\u000b2\u0006\u0010\u0016\u001a\u00020\u000f2\u0006\u0010\u0017\u001a\u00020\u000fH\u0016J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016J*\u0010\u001a\u001a\u00020\u000f2\u0006\u0010\u001b\u001a\u00020\u000b2\u0006\u0010\u001c\u001a\u00020\u000f2\u0006\u0010\u001d\u001a\u00020\u000f2\u0006\u0010\u001e\u001a\u00020\u000fH\u0082\u0080\u0004J\"\u0010\u001f\u001a\u00020\u00192\u0006\u0010\u001b\u001a\u00020\u000b2\u0006\u0010\u001c\u001a\u00020\u000f2\u0006\u0010\u0017\u001a\u00020\u000fH\u0082\u0080\u0004J\n\u0010 \u001a\u00020\u0019H\u0082\u0080\u0004J\n\u0010!\u001a\u00020\u0019H\u0082\u0080\u0004J\u0012\u0010\"\u001a\u00020\u000f2\u0006\u0010\u001e\u001a\u00020\u000fH\u0082\u0080\u0004J\n\u0010#\u001a\u00020\u000fH\u0082\u0080\u0004R\u000f\u0010\u0002\u001a\u00020\u0001X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0003\u001a\u00020\u0004X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0007\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\u0008X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\n\u001a\u00020\u000bX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000c\u001a\u00020\u000bX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\r\u001a\u00020\u000bX\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u000e\u001a\u00020\u000fX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0010\u001a\u00020\u000fX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0015\u0010\u0011\u001a\u00020\u000f8BX\u0082\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013\u00ca\u0001\u0002\u0008%\u00a8\u0006$"
    }
    d2 = {
        "Lkotlin/io/encoding/DecodeInputStream;",
        "Ljava/io/InputStream;",
        "input",
        "base64",
        "Lkotlin/io/encoding/Base64;",
        "<init>",
        "(Ljava/io/InputStream;Lkotlin/io/encoding/Base64;)V",
        "isClosed",
        "",
        "isEOF",
        "singleByteBuffer",
        "",
        "symbolBuffer",
        "byteBuffer",
        "byteBufferStartIndex",
        "",
        "byteBufferEndIndex",
        "byteBufferLength",
        "getByteBufferLength",
        "()I",
        "read",
        "destination",
        "offset",
        "length",
        "close",
        "",
        "decodeSymbolBufferInto",
        "dst",
        "dstOffset",
        "dstEndIndex",
        "symbolBufferLength",
        "copyByteBufferInto",
        "resetByteBufferIfEmpty",
        "shiftByteBufferToStartIfNeeded",
        "handlePaddingSymbol",
        "readNextSymbol",
        "kotlin-stdlib",
        "Lkotlin/io/encoding/ExperimentalEncodingApi;"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final base64:Lkotlin/io/encoding/Base64;

.field private final byteBuffer:[B

.field private byteBufferEndIndex:I

.field private byteBufferStartIndex:I

.field private final input:Ljava/io/InputStream;

.field private isClosed:Z

.field private isEOF:Z

.field private final singleByteBuffer:[B

.field private final symbolBuffer:[B


# direct methods
.method public constructor <init>(Ljava/io/InputStream;Lkotlin/io/encoding/Base64;)V
    .registers 4

    const-string v0, "input"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "base64"

    invoke-static {p2, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 72
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 74
    iput-object p1, p0, Lkotlin/io/encoding/DecodeInputStream;->input:Ljava/io/InputStream;

    .line 75
    iput-object p2, p0, Lkotlin/io/encoding/DecodeInputStream;->base64:Lkotlin/io/encoding/Base64;

    const/4 p1, 0x1

    .line 79
    new-array p1, p1, [B

    iput-object p1, p0, Lkotlin/io/encoding/DecodeInputStream;->singleByteBuffer:[B

    const/16 p1, 0x400

    .line 81
    new-array p2, p1, [B

    iput-object p2, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    .line 83
    new-array p1, p1, [B

    iput-object p1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBuffer:[B

    return-void
.end method

.method private final copyByteBufferInto([BII)V
    .registers 7

    .line 182
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBuffer:[B

    .line 185
    iget v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    add-int v2, v1, p3

    .line 182
    invoke-static {v0, p1, p2, v1, v2}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 188
    iget p1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    add-int/2addr p1, p3

    iput p1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    .line 189
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->resetByteBufferIfEmpty()V

    return-void
.end method

.method private final decodeSymbolBufferInto([BIII)I
    .registers 11

    .line 167
    iget v3, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->base64:Lkotlin/io/encoding/Base64;

    .line 168
    iget-object v1, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    .line 169
    iget-object v2, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBuffer:[B

    const/4 v4, 0x0

    move v5, p4

    .line 167
    invoke-virtual/range {v0 .. v5}, Lkotlin/io/encoding/Base64;->decodeIntoByteArray([B[BIII)I

    move-result p4

    add-int/2addr v3, p4

    iput v3, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    .line 175
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->getByteBufferLength()I

    move-result p4

    sub-int/2addr p3, p2

    invoke-static {p4, p3}, Ljava/lang/Math;->min(II)I

    move-result p3

    .line 176
    invoke-direct {p0, p1, p2, p3}, Lkotlin/io/encoding/DecodeInputStream;->copyByteBufferInto([BII)V

    .line 177
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->shiftByteBufferToStartIfNeeded()V

    return p3
.end method

.method private final getByteBufferLength()I
    .registers 2

    .line 87
    iget v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    iget p0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    sub-int/2addr v0, p0

    return v0
.end method

.method private final handlePaddingSymbol(I)I
    .registers 5

    .line 211
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    const/16 v1, 0x3d

    aput-byte v1, v0, p1

    and-int/lit8 v0, p1, 0x3

    const/4 v1, 0x2

    if-ne v0, v1, :cond_1a

    .line 215
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->readNextSymbol()I

    move-result v0

    if-ltz v0, :cond_18

    .line 217
    iget-object p0, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    add-int/lit8 v2, p1, 0x1

    int-to-byte v0, v0

    aput-byte v0, p0, v2

    :cond_18
    add-int/2addr p1, v1

    return p1

    :cond_1a
    add-int/lit8 p1, p1, 0x1

    return p1
.end method

.method private final readNextSymbol()I
    .registers 3

    .line 227
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->base64:Lkotlin/io/encoding/Base64;

    invoke-virtual {v0}, Lkotlin/io/encoding/Base64;->isMimeScheme$kotlin_stdlib()Z

    move-result v0

    if-nez v0, :cond_f

    .line 228
    iget-object p0, p0, Lkotlin/io/encoding/DecodeInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->read()I

    move-result p0

    return p0

    .line 233
    :cond_f
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {v0}, Ljava/io/InputStream;->read()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1e

    .line 234
    invoke-static {v0}, Lkotlin/io/encoding/Base64Kt;->isInMimeAlphabet(I)Z

    move-result v1

    if-eqz v1, :cond_f

    :cond_1e
    return v0
.end method

.method private final resetByteBufferIfEmpty()V
    .registers 3

    .line 193
    iget v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    iget v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    if-ne v0, v1, :cond_b

    const/4 v0, 0x0

    .line 194
    iput v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    .line 195
    iput v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    :cond_b
    return-void
.end method

.method private final shiftByteBufferToStartIfNeeded()V
    .registers 5

    .line 201
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBuffer:[B

    array-length v1, v0

    iget v2, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    sub-int/2addr v1, v2

    .line 202
    iget-object v3, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    array-length v3, v3

    div-int/lit8 v3, v3, 0x4

    mul-int/lit8 v3, v3, 0x3

    if-le v3, v1, :cond_1e

    .line 204
    iget v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    const/4 v3, 0x0

    invoke-static {v0, v0, v3, v1, v2}, Lkotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 205
    iget v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    iget v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    sub-int/2addr v0, v1

    iput v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    .line 206
    iput v3, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    :cond_1e
    return-void
.end method


# virtual methods
.method public close()V
    .registers 2

    .line 158
    iget-boolean v0, p0, Lkotlin/io/encoding/DecodeInputStream;->isClosed:Z

    if-nez v0, :cond_c

    const/4 v0, 0x1

    .line 159
    iput-boolean v0, p0, Lkotlin/io/encoding/DecodeInputStream;->isClosed:Z

    .line 160
    iget-object p0, p0, Lkotlin/io/encoding/DecodeInputStream;->input:Ljava/io/InputStream;

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_c
    return-void
.end method

.method public read()I
    .registers 5

    .line 90
    iget v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    iget v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferEndIndex:I

    const/4 v2, 0x1

    if-ge v0, v1, :cond_14

    .line 91
    iget-object v1, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBuffer:[B

    aget-byte v1, v1, v0

    and-int/lit16 v1, v1, 0xff

    add-int/2addr v0, v2

    .line 92
    iput v0, p0, Lkotlin/io/encoding/DecodeInputStream;->byteBufferStartIndex:I

    .line 93
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->resetByteBufferIfEmpty()V

    return v1

    .line 96
    :cond_14
    iget-object v0, p0, Lkotlin/io/encoding/DecodeInputStream;->singleByteBuffer:[B

    const/4 v1, 0x0

    invoke-virtual {p0, v0, v1, v2}, Lkotlin/io/encoding/DecodeInputStream;->read([BII)I

    move-result v0

    const/4 v3, -0x1

    if-eq v0, v3, :cond_33

    if-ne v0, v2, :cond_27

    .line 98
    iget-object p0, p0, Lkotlin/io/encoding/DecodeInputStream;->singleByteBuffer:[B

    aget-byte p0, p0, v1

    and-int/lit16 p0, p0, 0xff

    return p0

    :cond_27
    new-instance p0, Ljava/lang/IllegalStateException;

    .line 99
    const-string v0, "Unreachable"

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_33
    return v3
.end method

.method public read([BII)I
    .registers 13

    const-string v0, "destination"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    if-ltz p2, :cond_86

    if-ltz p3, :cond_86

    add-int v0, p2, p3

    .line 104
    array-length v1, p1

    if-gt v0, v1, :cond_86

    .line 107
    iget-boolean v1, p0, Lkotlin/io/encoding/DecodeInputStream;->isClosed:Z

    if-nez v1, :cond_7e

    .line 110
    iget-boolean v1, p0, Lkotlin/io/encoding/DecodeInputStream;->isEOF:Z

    const/4 v2, -0x1

    if-eqz v1, :cond_18

    return v2

    :cond_18
    const/4 v1, 0x0

    if-nez p3, :cond_1c

    return v1

    .line 117
    :cond_1c
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->getByteBufferLength()I

    move-result v3

    if-lt v3, p3, :cond_26

    .line 118
    invoke-direct {p0, p1, p2, p3}, Lkotlin/io/encoding/DecodeInputStream;->copyByteBufferInto([BII)V

    return p3

    .line 122
    :cond_26
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->getByteBufferLength()I

    move-result v3

    sub-int/2addr p3, v3

    add-int/lit8 p3, p3, 0x2

    .line 123
    div-int/lit8 p3, p3, 0x3

    mul-int/lit8 p3, p3, 0x4

    move v3, p2

    .line 128
    :goto_32
    iget-boolean v4, p0, Lkotlin/io/encoding/DecodeInputStream;->isEOF:Z

    if-nez v4, :cond_77

    if-lez p3, :cond_77

    .line 130
    iget-object v4, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    array-length v4, v4

    invoke-static {v4, p3}, Ljava/lang/Math;->min(II)I

    move-result v4

    move v5, v1

    .line 132
    :goto_40
    iget-boolean v6, p0, Lkotlin/io/encoding/DecodeInputStream;->isEOF:Z

    if-nez v6, :cond_63

    if-ge v5, v4, :cond_63

    .line 133
    invoke-direct {p0}, Lkotlin/io/encoding/DecodeInputStream;->readNextSymbol()I

    move-result v6

    const/4 v7, 0x1

    if-eq v6, v2, :cond_60

    const/16 v8, 0x3d

    if-eq v6, v8, :cond_59

    .line 141
    iget-object v7, p0, Lkotlin/io/encoding/DecodeInputStream;->symbolBuffer:[B

    int-to-byte v6, v6

    aput-byte v6, v7, v5

    add-int/lit8 v5, v5, 0x1

    goto :goto_40

    .line 137
    :cond_59
    invoke-direct {p0, v5}, Lkotlin/io/encoding/DecodeInputStream;->handlePaddingSymbol(I)I

    move-result v5

    .line 138
    iput-boolean v7, p0, Lkotlin/io/encoding/DecodeInputStream;->isEOF:Z

    goto :goto_40

    .line 135
    :cond_60
    iput-boolean v7, p0, Lkotlin/io/encoding/DecodeInputStream;->isEOF:Z

    goto :goto_40

    :cond_63
    if-nez v6, :cond_70

    if-ne v5, v4, :cond_68

    goto :goto_70

    .line 147
    :cond_68
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Check failed."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_70
    :goto_70
    sub-int/2addr p3, v5

    .line 151
    invoke-direct {p0, p1, v3, v0, v5}, Lkotlin/io/encoding/DecodeInputStream;->decodeSymbolBufferInto([BIII)I

    move-result v4

    add-int/2addr v3, v4

    goto :goto_32

    :cond_77
    if-ne v3, p2, :cond_7c

    if-eqz v4, :cond_7c

    return v2

    :cond_7c
    sub-int/2addr v3, p2

    return v3

    .line 108
    :cond_7e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "The input stream is closed."

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 105
    :cond_86
    new-instance p0, Ljava/lang/IndexOutOfBoundsException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "offset: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", length: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, ", buffer size: "

    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    array-length p1, p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
