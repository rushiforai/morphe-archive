.class public final Lnicoid/network238/okio/-SegmentedByteString;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010\n\n\u0002\u0010\u0008\n\u0002\u0008\u0004\n\u0002\u0010\u0005\n\u0002\u0008\u0008\n\u0002\u0010\u000b\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00032\u0006\u0010\u0005\u001a\u00020\u0003H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0007*\u00020\u0007H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0008*\u00020\u0008H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0003*\u00020\u0003H\u0000\u001a\u0015\u0010\t\u001a\u00020\u0008*\u00020\u00082\u0006\u0010\n\u001a\u00020\u0008H\u0080\u000c\u001a\u0015\u0010\u000b\u001a\u00020\u0003*\u00020\u00032\u0006\u0010\n\u001a\u00020\u0008H\u0080\u000c\u001a\u0015\u0010\u000c\u001a\u00020\u0008*\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0008H\u0080\u000c\u001a\u0015\u0010\u000f\u001a\u00020\u0008*\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0008H\u0080\u000c\u001a\u0015\u0010\u0010\u001a\u00020\u0008*\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0008H\u0080\u000c\u001a\u0015\u0010\u0010\u001a\u00020\u0003*\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0003H\u0080\u000c\u001a\u0015\u0010\u0011\u001a\u00020\r*\u00020\r2\u0006\u0010\u000e\u001a\u00020\rH\u0080\u000c\u001a\u0015\u0010\u0010\u001a\u00020\u0003*\u00020\u00082\u0006\u0010\u000e\u001a\u00020\u0003H\u0080\u000c\u001a\u0019\u0010\u0012\u001a\u00020\u00032\u0006\u0010\u0013\u001a\u00020\u00032\u0006\u0010\u0014\u001a\u00020\u0008H\u0080\u0008\u001a\u0019\u0010\u0012\u001a\u00020\u00032\u0006\u0010\u0013\u001a\u00020\u00082\u0006\u0010\u0014\u001a\u00020\u0003H\u0080\u0008\u001a0\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0013\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u00082\u0006\u0010\u0014\u001a\u00020\u00172\u0006\u0010\u0019\u001a\u00020\u00082\u0006\u0010\u0005\u001a\u00020\u0008H\u0000\u001a\u000c\u0010\u001a\u001a\u00020\u001b*\u00020\rH\u0000\u001a\u000c\u0010\u001a\u001a\u00020\u001b*\u00020\u0008H\u0000\u001a\u000c\u0010\u001a\u001a\u00020\u001b*\u00020\u0003H\u0000\u00a8\u0006\u001c"
    }
    d2 = {
        "checkOffsetAndCount",
        "",
        "size",
        "",
        "offset",
        "byteCount",
        "reverseBytes",
        "",
        "",
        "leftRotate",
        "bitCount",
        "rightRotate",
        "shr",
        "",
        "other",
        "shl",
        "and",
        "xor",
        "minOf",
        "a",
        "b",
        "arrayRangeEquals",
        "",
        "",
        "aOffset",
        "bOffset",
        "toHexString",
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
.method public static final and(BI)I
    .registers 4
    .param p0, "$this$and"    # B
    .param p1, "other"    # I

    const/4 v0, 0x0

    .line 75
    .local v0, "$i$f$and":I
    and-int v1, p0, p1

    return v1
.end method

.method public static final and(BJ)J
    .registers 6
    .param p0, "$this$and"    # B
    .param p1, "other"    # J

    const/4 v0, 0x0

    .line 78
    .local v0, "$i$f$and":I
    int-to-long v1, p0

    and-long/2addr v1, p1

    return-wide v1
.end method

.method public static final and(IJ)J
    .registers 6
    .param p0, "$this$and"    # I
    .param p1, "other"    # J

    const/4 v0, 0x0

    .line 84
    .local v0, "$i$f$and":I
    int-to-long v1, p0

    and-long/2addr v1, p1

    return-wide v1
.end method

.method public static final arrayRangeEquals([BI[BII)Z
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    if-ge v1, p4, :cond_1

    add-int v2, v1, p1

    .line 100
    aget-byte v2, p0, v2

    add-int v3, v1, p3

    aget-byte v3, p2, v3

    if-eq v2, v3, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static final checkOffsetAndCount(JJJ)V
    .registers 10

    or-long v0, p2, p4

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-ltz v0, :cond_0

    cmp-long v0, p2, p0

    if-gtz v0, :cond_0

    sub-long v0, p0, p2

    cmp-long v0, v0, p4

    if-ltz v0, :cond_0

    return-void

    .line 25
    :cond_0
    new-instance v0, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "size="

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " offset="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " byteCount="

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static final leftRotate(II)I
    .registers 5
    .param p0, "$this$leftRotate"    # I
    .param p1, "bitCount"    # I

    const/4 v0, 0x0

    .line 60
    .local v0, "$i$f$leftRotate":I
    shl-int v1, p0, p1

    rsub-int/lit8 v2, p1, 0x20

    ushr-int v2, p0, v2

    or-int/2addr v1, v2

    return v1
.end method

.method public static final minOf(IJ)J
    .registers 6
    .param p0, "a"    # I
    .param p1, "b"    # J

    const/4 v0, 0x0

    .line 90
    .local v0, "$i$f$minOf":I
    int-to-long v1, p0

    invoke-static {v1, v2, p1, p2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    return-wide v1
.end method

.method public static final minOf(JI)J
    .registers 6
    .param p0, "a"    # J
    .param p2, "b"    # I

    const/4 v0, 0x0

    .line 87
    .local v0, "$i$f$minOf":I
    int-to-long v1, p2

    invoke-static {p0, p1, v1, v2}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v1

    return-wide v1
.end method

.method public static final reverseBytes(I)I
    .registers 3

    const/high16 v0, -0x1000000

    and-int/2addr v0, p0

    ushr-int/lit8 v0, v0, 0x18

    const/high16 v1, 0xff0000

    and-int/2addr v1, p0

    ushr-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    const v1, 0xff00

    and-int/2addr v1, p0

    shl-int/lit8 v1, v1, 0x8

    or-int/2addr v0, v1

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x18

    or-int/2addr v0, p0

    return v0
.end method

.method public static final reverseBytes(J)J
    .registers 10

    const-wide/high16 v0, -0x100000000000000L

    and-long/2addr v0, p0

    const/16 v2, 0x38

    ushr-long/2addr v0, v2

    const-wide/high16 v3, 0xff000000000000L

    and-long/2addr v3, p0

    const/16 v5, 0x28

    ushr-long/2addr v3, v5

    or-long/2addr v0, v3

    const-wide v3, 0xff0000000000L

    and-long/2addr v3, p0

    const/16 v6, 0x18

    ushr-long/2addr v3, v6

    or-long/2addr v0, v3

    const-wide v3, 0xff00000000L

    and-long/2addr v3, p0

    const/16 v7, 0x8

    ushr-long/2addr v3, v7

    or-long/2addr v0, v3

    const-wide v3, 0xff000000L

    and-long/2addr v3, p0

    shl-long/2addr v3, v7

    or-long/2addr v0, v3

    const-wide/32 v3, 0xff0000

    and-long/2addr v3, p0

    shl-long/2addr v3, v6

    or-long/2addr v0, v3

    const-wide/32 v3, 0xff00

    and-long/2addr v3, p0

    shl-long/2addr v3, v5

    or-long/2addr v0, v3

    const-wide/16 v3, 0xff

    and-long/2addr p0, v3

    shl-long/2addr p0, v2

    or-long/2addr v0, p0

    return-wide v0
.end method

.method public static final reverseBytes(S)S
    .registers 2

    const v0, 0xff00

    and-int/2addr v0, p0

    ushr-int/lit8 v0, v0, 0x8

    and-int/lit16 p0, p0, 0xff

    shl-int/lit8 p0, p0, 0x8

    or-int/2addr v0, p0

    int-to-short p0, v0

    return p0
.end method

.method public static final rightRotate(JI)J
    .registers 8
    .param p0, "$this$rightRotate"    # J
    .param p2, "bitCount"    # I

    const/4 v0, 0x0

    .line 65
    .local v0, "$i$f$rightRotate":I
    ushr-long v1, p0, p2

    rsub-int/lit8 v3, p2, 0x40

    shl-long v3, p0, v3

    or-long/2addr v1, v3

    return-wide v1
.end method

.method public static final shl(BI)I
    .registers 4
    .param p0, "$this$shl"    # B
    .param p1, "other"    # I

    const/4 v0, 0x0

    .line 72
    .local v0, "$i$f$shl":I
    shl-int v1, p0, p1

    return v1
.end method

.method public static final shr(BI)I
    .registers 4
    .param p0, "$this$shr"    # B
    .param p1, "other"    # I

    const/4 v0, 0x0

    .line 69
    .local v0, "$i$f$shr":I
    shr-int v1, p0, p1

    return v1
.end method

.method public static final toHexString(B)Ljava/lang/String;
    .registers 4

    .line 107
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v0

    shr-int/lit8 v1, p0, 0x4

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    .line 108
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v1

    and-int/lit8 p0, p0, 0xf

    .line 167
    aget-char p0, v1, p0

    const/4 v1, 0x2

    new-array v1, v1, [C

    const/4 v2, 0x0

    aput-char v0, v1, v2

    const/4 v0, 0x1

    aput-char p0, v1, v0

    .line 109
    invoke-static {v1}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([C)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final toHexString(I)Ljava/lang/String;
    .registers 11

    if-nez p0, :cond_0

    .line 113
    const-string p0, "0"

    return-object p0

    :cond_0
    nop

    .line 116
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v0

    shr-int/lit8 v1, p0, 0x1c

    and-int/lit8 v1, v1, 0xf

    aget-char v0, v0, v1

    .line 117
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v1

    shr-int/lit8 v2, p0, 0x18

    and-int/lit8 v2, v2, 0xf

    aget-char v1, v1, v2

    .line 118
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v2

    shr-int/lit8 v3, p0, 0x14

    and-int/lit8 v3, v3, 0xf

    aget-char v2, v2, v3

    .line 119
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v3

    shr-int/lit8 v4, p0, 0x10

    and-int/lit8 v4, v4, 0xf

    aget-char v3, v3, v4

    .line 120
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v4

    shr-int/lit8 v5, p0, 0xc

    and-int/lit8 v5, v5, 0xf

    aget-char v4, v4, v5

    .line 121
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v5

    shr-int/lit8 v6, p0, 0x8

    and-int/lit8 v6, v6, 0xf

    aget-char v5, v5, v6

    .line 122
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v6

    shr-int/lit8 v7, p0, 0x4

    and-int/lit8 v7, v7, 0xf

    aget-char v6, v6, v7

    .line 123
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v7

    and-int/lit8 p0, p0, 0xf

    aget-char p0, v7, p0

    const/16 v7, 0x8

    new-array v8, v7, [C

    const/4 v9, 0x0

    aput-char v0, v8, v9

    const/4 v0, 0x1

    aput-char v1, v8, v0

    const/4 v0, 0x2

    aput-char v2, v8, v0

    const/4 v0, 0x3

    aput-char v3, v8, v0

    const/4 v0, 0x4

    aput-char v4, v8, v0

    const/4 v0, 0x5

    aput-char v5, v8, v0

    const/4 v0, 0x6

    aput-char v6, v8, v0

    const/4 v0, 0x7

    aput-char p0, v8, v0

    :goto_0
    if-ge v9, v7, :cond_1

    .line 128
    aget-char p0, v8, v9

    const/16 v0, 0x30

    if-ne p0, v0, :cond_1

    add-int/lit8 v9, v9, 0x1

    goto :goto_0

    .line 132
    :cond_1
    invoke-static {v8, v9, v7}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([CII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final toHexString(J)Ljava/lang/String;
    .registers 27

    const-wide/16 v0, 0x0

    cmp-long v0, p0, v0

    if-nez v0, :cond_0

    .line 136
    const-string v0, "0"

    return-object v0

    :cond_0
    nop

    .line 139
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v0

    const/16 v1, 0x3c

    shr-long v1, p0, v1

    const-wide/16 v3, 0xf

    and-long/2addr v1, v3

    long-to-int v1, v1

    aget-char v0, v0, v1

    .line 140
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v1

    const/16 v2, 0x38

    shr-long v5, p0, v2

    and-long/2addr v5, v3

    long-to-int v2, v5

    aget-char v1, v1, v2

    .line 141
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v2

    const/16 v5, 0x34

    shr-long v5, p0, v5

    and-long/2addr v5, v3

    long-to-int v5, v5

    aget-char v2, v2, v5

    .line 142
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v5

    const/16 v6, 0x30

    shr-long v7, p0, v6

    and-long/2addr v7, v3

    long-to-int v7, v7

    aget-char v5, v5, v7

    .line 143
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v7

    const/16 v8, 0x2c

    shr-long v8, p0, v8

    and-long/2addr v8, v3

    long-to-int v8, v8

    aget-char v7, v7, v8

    .line 144
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v8

    const/16 v9, 0x28

    shr-long v9, p0, v9

    and-long/2addr v9, v3

    long-to-int v9, v9

    aget-char v8, v8, v9

    .line 145
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v9

    const/16 v10, 0x24

    shr-long v10, p0, v10

    and-long/2addr v10, v3

    long-to-int v10, v10

    aget-char v9, v9, v10

    .line 146
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v10

    const/16 v11, 0x20

    shr-long v11, p0, v11

    and-long/2addr v11, v3

    long-to-int v11, v11

    aget-char v10, v10, v11

    .line 147
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v11

    const/16 v12, 0x1c

    shr-long v12, p0, v12

    and-long/2addr v12, v3

    long-to-int v12, v12

    aget-char v11, v11, v12

    .line 148
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v12

    const/16 v13, 0x18

    shr-long v13, p0, v13

    and-long/2addr v13, v3

    long-to-int v13, v13

    aget-char v12, v12, v13

    .line 149
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v13

    const/16 v14, 0x14

    shr-long v14, p0, v14

    and-long/2addr v14, v3

    long-to-int v14, v14

    aget-char v13, v13, v14

    .line 150
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v14

    const/16 v15, 0x10

    shr-long v16, p0, v15

    move-wide/from16 v18, v3

    and-long v3, v16, v18

    long-to-int v3, v3

    aget-char v3, v14, v3

    .line 151
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v4

    const/16 v14, 0xc

    shr-long v16, p0, v14

    move/from16 v20, v7

    and-long v6, v16, v18

    long-to-int v6, v6

    aget-char v4, v4, v6

    .line 152
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v6

    const/16 v7, 0x8

    shr-long v16, p0, v7

    move/from16 v22, v7

    move/from16 v21, v8

    and-long v7, v16, v18

    long-to-int v7, v7

    aget-char v6, v6, v7

    .line 153
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v7

    const/4 v8, 0x4

    shr-long v16, p0, v8

    move/from16 v24, v8

    move/from16 v23, v9

    and-long v8, v16, v18

    long-to-int v8, v8

    aget-char v7, v7, v8

    .line 154
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v8

    move/from16 v16, v14

    and-long v14, p0, v18

    long-to-int v14, v14

    aget-char v8, v8, v14

    const/16 v9, 0x10

    new-array v14, v9, [C

    const/4 v15, 0x0

    aput-char v0, v14, v15

    const/4 v0, 0x1

    aput-char v1, v14, v0

    const/4 v0, 0x2

    aput-char v2, v14, v0

    const/4 v0, 0x3

    aput-char v5, v14, v0

    aput-char v20, v14, v24

    const/4 v0, 0x5

    aput-char v21, v14, v0

    const/4 v0, 0x6

    aput-char v23, v14, v0

    const/4 v0, 0x7

    aput-char v10, v14, v0

    aput-char v11, v14, v22

    const/16 v0, 0x9

    aput-char v12, v14, v0

    const/16 v0, 0xa

    aput-char v13, v14, v0

    const/16 v0, 0xb

    aput-char v3, v14, v0

    aput-char v4, v14, v16

    const/16 v0, 0xd

    aput-char v6, v14, v0

    const/16 v0, 0xe

    aput-char v7, v14, v0

    const/16 v0, 0xf

    aput-char v8, v14, v0

    :goto_0
    const/16 v9, 0x10

    if-ge v15, v9, :cond_1

    .line 159
    aget-char v0, v14, v15

    const/16 v1, 0x30

    if-ne v0, v1, :cond_1

    add-int/lit8 v15, v15, 0x1

    goto :goto_0

    .line 163
    :cond_1
    const/16 v9, 0x10

    invoke-static {v14, v15, v9}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public static final xor(BB)B
    .registers 4
    .param p0, "$this$xor"    # B
    .param p1, "other"    # B

    const/4 v0, 0x0

    .line 81
    .local v0, "$i$f$xor":I
    xor-int v1, p0, p1

    int-to-byte v1, v1

    return v1
.end method
