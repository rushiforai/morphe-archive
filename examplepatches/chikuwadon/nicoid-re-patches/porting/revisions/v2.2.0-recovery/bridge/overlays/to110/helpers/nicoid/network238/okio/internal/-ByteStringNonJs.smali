.class public final Lnicoid/network238/okio/internal/-ByteStringNonJs;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000c\n\u0000\u001a\r\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\u0010\u0010\u0003\u001a\u00020\u00042\u0006\u0010\u0005\u001a\u00020\u0006H\u0002\u00a8\u0006\u0007"
    }
    d2 = {
        "commonDecodeHex",
        "Lnicoid/network238/okio/ByteString;",
        "",
        "decodeHexDigit",
        "",
        "c",
        "",
        "okio"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final synthetic access$decodeHexDigit(C)I
    .registers 1

    .line 1
    invoke-static {p0}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I

    move-result p0

    return p0
.end method

.method public static final commonDecodeHex(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 9
    .param p0, "$this$commonDecodeHex"    # Ljava/lang/String;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 25
    .local v0, "$i$f$commonDecodeHex":I
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    rem-int/lit8 v1, v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    :goto_0
    if-eqz v1, :cond_2

    .line 27
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    div-int/lit8 v1, v1, 0x2

    new-array v4, v1, [B

    :goto_1
    if-ge v2, v1, :cond_1

    .line 28
    mul-int/lit8 v5, v2, 0x2

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v6

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v6}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v6

    shl-int/lit8 v6, v6, 0x4

    .line 29
    .local v6, "d1":I
    add-int/2addr v5, v3

    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    # invokes: Lnicoid/network238/okio/internal/-ByteStringNonJs;->decodeHexDigit(C)I
    invoke-static {v5}, Lnicoid/network238/okio/internal/-ByteStringNonJs;->access$decodeHexDigit(C)I

    move-result v5

    .line 30
    .local v5, "d2":I
    add-int v7, v6, v5

    int-to-byte v5, v7

    .end local v5    # "d2":I
    .end local v6    # "d1":I
    aput-byte v5, v4, v2

    .line 27
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    .line 32
    .local v4, "result":[B
    :cond_1
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-direct {v1, v4}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1

    .line 44
    .end local v4    # "result":[B
    :cond_2
    const/4 v1, 0x0

    .line 25
    .local v1, "$i$a$-require--ByteStringNonJs$commonDecodeHex$1":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "Unexpected hex string: "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--ByteStringNonJs$commonDecodeHex$1":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2
.end method

.method private static final decodeHexDigit(C)I
    .registers 4

    const/16 v0, 0x30

    if-gt v0, p0, :cond_0

    const/16 v1, 0x3a

    if-ge p0, v1, :cond_0

    sub-int/2addr p0, v0

    return p0

    :cond_0
    const/16 v0, 0x61

    if-gt v0, p0, :cond_1

    const/16 v0, 0x67

    if-ge p0, v0, :cond_1

    add-int/lit8 p0, p0, -0x57

    return p0

    :cond_1
    const/16 v0, 0x41

    if-gt v0, p0, :cond_2

    const/16 v0, 0x47

    if-ge p0, v0, :cond_2

    add-int/lit8 p0, p0, -0x37

    return p0

    .line 40
    :cond_2
    new-instance v0, Ljava/lang/IllegalArgumentException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected hex digit: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v0
.end method
