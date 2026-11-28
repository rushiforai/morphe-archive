.class public final Lnicoid/network238/okio/internal/_Utf8Kt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0014\n\u0000\n\u0002\u0010\u000e\n\u0002\u0010\u0012\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0003\u001a \u0010\u0000\u001a\u00020\u0001*\u00020\u00022\u0008\u0008\u0002\u0010\u0003\u001a\u00020\u00042\u0008\u0008\u0002\u0010\u0005\u001a\u00020\u0004H\u0000\u001a\u000c\u0010\u0006\u001a\u00020\u0002*\u00020\u0001H\u0000\u00a8\u0006\u0007"
    }
    d2 = {
        "commonToUtf8String",
        "",
        "",
        "beginIndex",
        "",
        "endIndex",
        "commonAsUtf8ToByteArray",
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
.method public static final commonAsUtf8ToByteArray(Ljava/lang/String;)[B
    .registers 12

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    shl-int/lit8 v0, v0, 0x2

    new-array v0, v0, [B

    .line 46
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    :goto_0
    if-ge v2, v1, :cond_7

    .line 47
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    .line 48
    const/16 v4, 0x80

    invoke-static {v3, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v5

    if-ltz v5, :cond_6

    .line 50
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    move v3, v2

    :cond_0
    :goto_1
    if-ge v2, v1, :cond_5

    .line 241
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    .line 244
    invoke-static {v5, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v6

    if-gez v6, :cond_1

    int-to-byte v5, v5

    add-int/lit8 v6, v3, 0x1

    .line 51
    aput-byte v5, v0, v3

    add-int/lit8 v2, v2, 0x1

    :goto_2
    move v3, v6

    if-ge v2, v1, :cond_0

    .line 250
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v5

    if-gez v5, :cond_0

    add-int/lit8 v5, v2, 0x1

    .line 251
    invoke-virtual {p0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v2

    int-to-byte v2, v2

    add-int/lit8 v6, v3, 0x1

    .line 51
    aput-byte v2, v0, v3

    move v2, v5

    goto :goto_2

    :cond_1
    nop

    .line 255
    const/16 v6, 0x800

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v6

    if-gez v6, :cond_2

    shr-int/lit8 v6, v5, 0x6

    or-int/lit16 v6, v6, 0xc0

    int-to-byte v6, v6

    add-int/lit8 v7, v3, 0x1

    .line 51
    aput-byte v6, v0, v3

    and-int/lit8 v5, v5, 0x3f

    or-int/2addr v5, v4

    int-to-byte v5, v5

    add-int/lit8 v3, v3, 0x2

    aput-byte v5, v0, v7

    :goto_3
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_2
    const v6, 0xd800

    const/16 v7, 0x3f

    if-gt v6, v5, :cond_4

    const v6, 0xe000

    if-ge v5, v6, :cond_4

    .line 278
    const v8, 0xdbff

    invoke-static {v5, v8}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->compare(II)I

    move-result v8

    if-gtz v8, :cond_3

    add-int/lit8 v8, v2, 0x1

    if-le v1, v8, :cond_3

    .line 280
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v9

    const v10, 0xdc00

    if-gt v10, v9, :cond_3

    if-ge v9, v6, :cond_3

    shl-int/lit8 v5, v5, 0xa

    .line 289
    invoke-virtual {p0, v8}, Ljava/lang/String;->charAt(I)C

    move-result v6

    add-int/2addr v5, v6

    const v6, -0x35fdc00

    add-int/2addr v5, v6

    shr-int/lit8 v6, v5, 0x12

    or-int/lit16 v6, v6, 0xf0

    int-to-byte v6, v6

    add-int/lit8 v8, v3, 0x1

    .line 51
    aput-byte v6, v0, v3

    shr-int/lit8 v6, v5, 0xc

    and-int/2addr v6, v7

    or-int/2addr v6, v4

    int-to-byte v6, v6

    add-int/lit8 v9, v3, 0x2

    aput-byte v6, v0, v8

    shr-int/lit8 v6, v5, 0x6

    and-int/2addr v6, v7

    or-int/2addr v6, v4

    int-to-byte v6, v6

    add-int/lit8 v8, v3, 0x3

    aput-byte v6, v0, v9

    and-int/2addr v5, v7

    or-int/2addr v5, v4

    int-to-byte v5, v5

    add-int/lit8 v3, v3, 0x4

    aput-byte v5, v0, v8

    add-int/lit8 v2, v2, 0x2

    goto/16 :goto_1

    :cond_3
    add-int/lit8 v5, v3, 0x1

    aput-byte v7, v0, v3

    add-int/lit8 v2, v2, 0x1

    move v3, v5

    goto/16 :goto_1

    :cond_4
    shr-int/lit8 v6, v5, 0xc

    or-int/lit16 v6, v6, 0xe0

    int-to-byte v6, v6

    add-int/lit8 v8, v3, 0x1

    aput-byte v6, v0, v3

    shr-int/lit8 v6, v5, 0x6

    and-int/2addr v6, v7

    or-int/2addr v6, v4

    int-to-byte v6, v6

    add-int/lit8 v7, v3, 0x2

    aput-byte v6, v0, v8

    and-int/lit8 v5, v5, 0x3f

    or-int/2addr v5, v4

    int-to-byte v5, v5

    add-int/lit8 v3, v3, 0x3

    aput-byte v5, v0, v7

    goto :goto_3

    .line 53
    :cond_5
    invoke-static {v0, v3}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0

    :cond_6
    int-to-byte v3, v3

    .line 55
    aput-byte v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto/16 :goto_0

    .line 58
    :cond_7
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result p0

    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0
.end method

.method public static final commonToUtf8String([BII)Ljava/lang/String;
    .registers 19

    move-object/from16 v0, p0

    move/from16 v1, p1

    move/from16 v2, p2

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz v1, :cond_18

    .line 28
    array-length v3, v0

    if-gt v2, v3, :cond_18

    if-gt v1, v2, :cond_18

    sub-int v3, v2, v1

    .line 31
    new-array v3, v3, [C

    const/4 v4, 0x0

    move v5, v4

    :goto_0
    if-ge v1, v2, :cond_17

    .line 63
    aget-byte v6, v0, v1

    if-ltz v6, :cond_1

    int-to-char v6, v6

    add-int/lit8 v7, v5, 0x1

    .line 35
    aput-char v6, v3, v5

    add-int/lit8 v1, v1, 0x1

    :goto_1
    move v5, v7

    if-ge v1, v2, :cond_0

    .line 72
    aget-byte v6, v0, v1

    if-ltz v6, :cond_0

    add-int/lit8 v1, v1, 0x1

    int-to-char v6, v6

    add-int/lit8 v7, v5, 0x1

    .line 35
    aput-char v6, v3, v5

    goto :goto_1

    .line 73
    :cond_0
    sget-object v6, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto :goto_0

    :cond_1
    shr-int/lit8 v7, v6, 0x5

    const/4 v8, -0x2

    const/16 v10, 0x80

    const v11, 0xfffd

    const/4 v12, 0x1

    if-ne v7, v8, :cond_5

    add-int/lit8 v7, v1, 0x1

    if-gt v2, v7, :cond_2

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 78
    :goto_2
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    move v9, v12

    goto/16 :goto_8

    .line 86
    :cond_2
    aget-byte v7, v0, v7

    and-int/lit16 v8, v7, 0xc0

    if-ne v8, v10, :cond_4

    xor-int/lit16 v7, v7, 0xf80

    shl-int/lit8 v6, v6, 0x6

    xor-int/2addr v7, v6

    if-ge v7, v10, :cond_3

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 78
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto/16 :goto_5

    :cond_3
    int-to-char v6, v7

    add-int/lit8 v7, v5, 0x1

    .line 35
    aput-char v6, v3, v5

    .line 78
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v6, v7

    goto/16 :goto_5

    :cond_4
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    goto :goto_2

    .line 78
    :cond_5
    shr-int/lit8 v7, v6, 0x4

    const v13, 0xe000

    const v14, 0xd800

    const/4 v15, 0x3

    if-ne v7, v8, :cond_b

    add-int/lit8 v7, v1, 0x2

    if-gt v2, v7, :cond_6

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 112
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    add-int/lit8 v5, v1, 0x1

    if-le v2, v5, :cond_d

    .line 116
    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xc0

    if-ne v5, v10, :cond_d

    goto/16 :goto_5

    :cond_6
    add-int/lit8 v8, v1, 0x1

    .line 126
    aget-byte v8, v0, v8

    and-int/lit16 v9, v8, 0xc0

    if-ne v9, v10, :cond_a

    .line 132
    aget-byte v7, v0, v7

    and-int/lit16 v9, v7, 0xc0

    if-ne v9, v10, :cond_9

    const v9, -0x1e080

    xor-int/2addr v7, v9

    shl-int/lit8 v8, v8, 0x6

    xor-int/2addr v7, v8

    shl-int/lit8 v6, v6, 0xc

    xor-int/2addr v7, v6

    const/16 v6, 0x800

    if-ge v7, v6, :cond_7

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 112
    :goto_3
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto :goto_4

    :cond_7
    if-gt v14, v7, :cond_8

    if-ge v7, v13, :cond_8

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    goto :goto_3

    .line 112
    :cond_8
    int-to-char v6, v7

    add-int/lit8 v7, v5, 0x1

    .line 35
    aput-char v6, v3, v5

    .line 112
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v6, v7

    goto :goto_4

    :cond_9
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 112
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    const/4 v9, 0x2

    goto/16 :goto_8

    :cond_a
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 112
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    move v9, v12

    goto/16 :goto_8

    :cond_b
    shr-int/lit8 v7, v6, 0x3

    if-ne v7, v8, :cond_16

    add-int/lit8 v7, v1, 0x3

    if-gt v2, v7, :cond_e

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 176
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    add-int/lit8 v5, v1, 0x1

    if-le v2, v5, :cond_d

    .line 177
    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xc0

    if-ne v5, v10, :cond_d

    add-int/lit8 v5, v1, 0x2

    if-le v2, v5, :cond_c

    .line 180
    aget-byte v5, v0, v5

    and-int/lit16 v5, v5, 0xc0

    if-ne v5, v10, :cond_c

    :goto_4
    move v5, v6

    move v9, v15

    goto/16 :goto_8

    :cond_c
    :goto_5
    move v5, v6

    const/4 v9, 0x2

    goto/16 :goto_8

    :cond_d
    move v5, v6

    move v9, v12

    goto/16 :goto_8

    :cond_e
    add-int/lit8 v8, v1, 0x1

    .line 190
    aget-byte v8, v0, v8

    and-int/lit16 v9, v8, 0xc0

    if-ne v9, v10, :cond_15

    add-int/lit8 v9, v1, 0x2

    .line 196
    aget-byte v9, v0, v9

    and-int/lit16 v12, v9, 0xc0

    if-ne v12, v10, :cond_14

    .line 202
    aget-byte v7, v0, v7

    and-int/lit16 v12, v7, 0xc0

    if-ne v12, v10, :cond_13

    const v10, 0x381f80

    xor-int/2addr v7, v10

    shl-int/lit8 v9, v9, 0x6

    xor-int/2addr v7, v9

    shl-int/lit8 v8, v8, 0xc

    xor-int/2addr v7, v8

    shl-int/lit8 v6, v6, 0x12

    xor-int/2addr v7, v6

    const v6, 0x10ffff

    if-le v7, v6, :cond_f

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 176
    :goto_6
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto :goto_7

    :cond_f
    if-gt v14, v7, :cond_10

    if-ge v7, v13, :cond_10

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    goto :goto_6

    .line 176
    :cond_10
    const/high16 v6, 0x10000

    if-ge v7, v6, :cond_11

    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    goto :goto_6

    .line 176
    :cond_11
    if-eq v7, v11, :cond_12

    ushr-int/lit8 v6, v7, 0xa

    const v8, 0xd7c0

    add-int/2addr v6, v8

    int-to-char v6, v6

    add-int/lit8 v8, v5, 0x1

    .line 35
    aput-char v6, v3, v5

    and-int/lit16 v7, v7, 0x3ff

    const v6, 0xdc00

    add-int/2addr v7, v6

    int-to-char v6, v7

    add-int/lit8 v5, v5, 0x2

    aput-char v6, v3, v8

    move v6, v5

    goto :goto_6

    :cond_12
    add-int/lit8 v6, v5, 0x1

    aput-char v11, v3, v5

    goto :goto_6

    .line 176
    :goto_7
    const/4 v9, 0x4

    move v5, v6

    goto :goto_8

    :cond_13
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 176
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    move v9, v15

    goto :goto_8

    :cond_14
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 176
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    const/4 v9, 0x2

    goto :goto_8

    :cond_15
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    .line 176
    sget-object v5, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    move v5, v6

    move v9, v12

    :goto_8
    add-int/2addr v1, v9

    goto/16 :goto_0

    :cond_16
    add-int/lit8 v6, v5, 0x1

    .line 35
    aput-char v11, v3, v5

    add-int/lit8 v1, v1, 0x1

    move v5, v6

    goto/16 :goto_0

    :cond_17
    nop

    .line 38
    invoke-static {v3, v4, v5}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([CII)Ljava/lang/String;

    move-result-object v0

    return-object v0

    .line 29
    :cond_18
    new-instance v3, Ljava/lang/ArrayIndexOutOfBoundsException;

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v5, "size="

    invoke-direct {v4, v5}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    array-length v0, v0

    invoke-virtual {v4, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v4, " beginIndex="

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " endIndex="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v3, v0}, Ljava/lang/ArrayIndexOutOfBoundsException;-><init>(Ljava/lang/String;)V

    throw v3
.end method

.method public static synthetic commonToUtf8String$default([BIIILjava/lang/Object;)Ljava/lang/String;
    .registers 5

    and-int/lit8 p4, p3, 0x1

    if-eqz p4, :cond_0

    const/4 p1, 0x0

    :cond_0
    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_1

    .line 27
    array-length p2, p0

    :cond_1
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/internal/_Utf8Kt;->commonToUtf8String([BII)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
