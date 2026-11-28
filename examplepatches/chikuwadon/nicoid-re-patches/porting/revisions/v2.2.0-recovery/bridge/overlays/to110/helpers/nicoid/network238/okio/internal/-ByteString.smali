.class public final Lnicoid/network238/okio/internal/-ByteString;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000T\n\u0000\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0019\n\u0002\u0008\u0007\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0005\n\u0002\u0008\u0003\n\u0002\u0010\u0012\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\n\n\u0002\u0010\u0000\n\u0002\u0008\n\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010\u000c\n\u0000\u001a\r\u0010\u0000\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\u0015\u0010\u0003\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0005H\u0080\u0008\u001a\u0015\u0010\u0006\u001a\u00020\u0001*\u00020\u00022\u0006\u0010\u0004\u001a\u00020\u0005H\u0080\u0008\u001a\r\u0010\u000b\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\r\u0010\u000c\u001a\u00020\u0002*\u00020\u0002H\u0080\u0008\u001a\r\u0010\r\u001a\u00020\u0002*\u00020\u0002H\u0080\u0008\u001a\u001d\u0010\u000e\u001a\u00020\u0002*\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0010H\u0080\u0008\u001a\u0015\u0010\u0012\u001a\u00020\u0013*\u00020\u00022\u0006\u0010\u0014\u001a\u00020\u0010H\u0080\u0008\u001a\r\u0010\u0015\u001a\u00020\u0010*\u00020\u0002H\u0080\u0008\u001a\r\u0010\u0016\u001a\u00020\u0017*\u00020\u0002H\u0080\u0008\u001a\r\u0010\u0018\u001a\u00020\u0017*\u00020\u0002H\u0080\u0008\u001a-\u0010\u0019\u001a\u00020\u0005*\u00020\u00022\u0006\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u001b\u001a\u00020\u00022\u0006\u0010\u001c\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0080\u0008\u001a-\u0010\u0019\u001a\u00020\u0005*\u00020\u00022\u0006\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u001b\u001a\u00020\u00172\u0006\u0010\u001c\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0080\u0008\u001a-\u0010\u001e\u001a\u00020\u001f*\u00020\u00022\u0006\u0010\u001a\u001a\u00020\u00102\u0006\u0010 \u001a\u00020\u00172\u0006\u0010!\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0080\u0008\u001a\u0015\u0010\"\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020\u0002H\u0080\u0008\u001a\u0015\u0010\"\u001a\u00020\u0005*\u00020\u00022\u0006\u0010#\u001a\u00020\u0017H\u0080\u0008\u001a\u0015\u0010$\u001a\u00020\u0005*\u00020\u00022\u0006\u0010%\u001a\u00020\u0002H\u0080\u0008\u001a\u0015\u0010$\u001a\u00020\u0005*\u00020\u00022\u0006\u0010%\u001a\u00020\u0017H\u0080\u0008\u001a\u001d\u0010&\u001a\u00020\u0010*\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u00172\u0006\u0010\'\u001a\u00020\u0010H\u0080\u0008\u001a\u001d\u0010(\u001a\u00020\u0010*\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u00022\u0006\u0010\'\u001a\u00020\u0010H\u0080\u0008\u001a\u001d\u0010(\u001a\u00020\u0010*\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u00172\u0006\u0010\'\u001a\u00020\u0010H\u0080\u0008\u001a\u0017\u0010)\u001a\u00020\u0005*\u00020\u00022\u0008\u0010\u001b\u001a\u0004\u0018\u00010*H\u0080\u0008\u001a\u0014\u0010+\u001a\u00020\u0005*\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u0002H\u0000\u001a\r\u0010,\u001a\u00020\u0010*\u00020\u0002H\u0080\u0008\u001a\u0015\u0010-\u001a\u00020\u0010*\u00020\u00022\u0006\u0010\u001b\u001a\u00020\u0002H\u0080\u0008\u001a\u0011\u0010.\u001a\u00020\u00022\u0006\u0010/\u001a\u00020\u0017H\u0080\u0008\u001a\u001d\u00100\u001a\u00020\u0002*\u00020\u00172\u0006\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0080\u0008\u001a\r\u00101\u001a\u00020\u0002*\u00020\u0001H\u0080\u0008\u001a\u000f\u00102\u001a\u0004\u0018\u00010\u0002*\u00020\u0001H\u0080\u0008\u001a$\u00103\u001a\u00020\u001f*\u00020\u00022\u0006\u00104\u001a\u0002052\u0006\u0010\u001a\u001a\u00020\u00102\u0006\u0010\u001d\u001a\u00020\u0010H\u0000\u001a\r\u00106\u001a\u00020\u0001*\u00020\u0002H\u0080\u0008\u001a\u0018\u00107\u001a\u00020\u00102\u0006\u00108\u001a\u00020\u00172\u0006\u00109\u001a\u00020\u0010H\u0002\u001a\u000c\u0010:\u001a\u00020\u0002*\u00020\u0001H\u0000\u001a\u0010\u0010;\u001a\u00020\u00102\u0006\u0010<\u001a\u00020=H\u0002\"\u0014\u0010\u0007\u001a\u00020\u0008X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\t\u0010\n\u00a8\u0006>"
    }
    d2 = {
        "commonUtf8",
        "",
        "Lnicoid/network238/okio/ByteString;",
        "commonBase64",
        "includePadding",
        "",
        "commonBase64Url",
        "HEX_DIGIT_CHARS",
        "",
        "getHEX_DIGIT_CHARS",
        "()[C",
        "commonHex",
        "commonToAsciiLowercase",
        "commonToAsciiUppercase",
        "commonSubstring",
        "beginIndex",
        "",
        "endIndex",
        "commonGetByte",
        "",
        "pos",
        "commonGetSize",
        "commonToByteArray",
        "",
        "commonInternalArray",
        "commonRangeEquals",
        "offset",
        "other",
        "otherOffset",
        "byteCount",
        "commonCopyInto",
        "",
        "target",
        "targetOffset",
        "commonStartsWith",
        "prefix",
        "commonEndsWith",
        "suffix",
        "commonIndexOf",
        "fromIndex",
        "commonLastIndexOf",
        "commonEquals",
        "",
        "commonEqualsConstantTime",
        "commonHashCode",
        "commonCompareTo",
        "commonOf",
        "data",
        "commonToByteString",
        "commonEncodeUtf8",
        "commonDecodeBase64",
        "commonWrite",
        "buffer",
        "Lnicoid/network238/okio/Buffer;",
        "commonToString",
        "codePointIndexToCharIndex",
        "s",
        "codePointCount",
        "decodeHexIgnoreWhitespace",
        "decodeHexDigitIgnoreWhitespace",
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


# static fields
.field private static final HEX_DIGIT_CHARS:[C


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 58
    const/16 v0, 0x10

    new-array v0, v0, [C

    fill-array-data v0, :array_0

    sput-object v0, Lnicoid/network238/okio/internal/-ByteString;->HEX_DIGIT_CHARS:[C

    return-void

    :array_0
    .array-data 2
        0x30s
        0x31s
        0x32s
        0x33s
        0x34s
        0x35s
        0x36s
        0x37s
        0x38s
        0x39s
        0x61s
        0x62s
        0x63s
        0x64s
        0x65s
        0x66s
    .end array-data
.end method

.method public static final synthetic access$codePointIndexToCharIndex([BI)I
    .registers 2

    .line 1
    invoke-static {p0, p1}, Lnicoid/network238/okio/internal/-ByteString;->codePointIndexToCharIndex([BI)I

    move-result p0

    return p0
.end method

.method private static final codePointIndexToCharIndex([BI)I
    .registers 19

    .line 334
    move-object/from16 v0, p0

    move/from16 v1, p1

    array-length v2, v0

    const/4 v3, 0x0

    move v4, v3

    move v5, v4

    :goto_0
    if-ge v3, v2, :cond_31

    .line 404
    aget-byte v6, v0, v3

    const/16 v7, 0xa0

    const/16 v8, 0x20

    const/16 v9, 0x7f

    const/16 v10, 0xd

    const v11, 0xfffd

    const/16 v12, 0xa

    const/high16 v13, 0x10000

    if-ltz v6, :cond_b

    add-int/lit8 v16, v4, 0x1

    if-eq v4, v1, :cond_31

    if-eq v6, v12, :cond_1

    if-eq v6, v10, :cond_1

    if-ltz v6, :cond_0

    if-lt v6, v8, :cond_2

    :cond_0
    if-gt v9, v6, :cond_1

    if-lt v6, v7, :cond_2

    :cond_1
    if-ne v6, v11, :cond_3

    :cond_2
    goto/16 :goto_d

    :cond_3
    if-ge v6, v13, :cond_4

    const/4 v4, 0x1

    goto :goto_1

    :cond_4
    const/4 v4, 0x2

    :goto_1
    add-int/2addr v5, v4

    add-int/lit8 v3, v3, 0x1

    move/from16 v4, v16

    :goto_2
    if-ge v3, v2, :cond_a

    .line 413
    aget-byte v6, v0, v3

    if-ltz v6, :cond_a

    add-int/lit8 v3, v3, 0x1

    add-int/lit8 v16, v4, 0x1

    if-eq v4, v1, :cond_31

    if-eq v6, v12, :cond_6

    if-eq v6, v10, :cond_6

    if-ltz v6, :cond_5

    if-lt v6, v8, :cond_7

    :cond_5
    if-gt v9, v6, :cond_6

    if-lt v6, v7, :cond_7

    :cond_6
    if-ne v6, v11, :cond_8

    :cond_7
    goto/16 :goto_d

    :cond_8
    if-ge v6, v13, :cond_9

    const/4 v4, 0x1

    goto :goto_3

    :cond_9
    const/4 v4, 0x2

    :goto_3
    add-int/2addr v5, v4

    move/from16 v4, v16

    goto :goto_2

    .line 414
    :cond_a
    sget-object v6, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    goto :goto_0

    :cond_b
    shr-int/lit8 v14, v6, 0x5

    const/4 v15, -0x2

    const/16 v13, 0x80

    if-ne v14, v15, :cond_15

    add-int/lit8 v14, v3, 0x1

    if-gt v2, v14, :cond_c

    if-ne v4, v1, :cond_30

    goto/16 :goto_e

    .line 426
    :cond_c
    aget-byte v14, v0, v14

    and-int/lit16 v15, v14, 0xc0

    if-ne v15, v13, :cond_14

    xor-int/lit16 v14, v14, 0xf80

    shl-int/lit8 v6, v6, 0x6

    xor-int/2addr v14, v6

    if-ge v14, v13, :cond_d

    if-ne v4, v1, :cond_11

    goto :goto_4

    :cond_d
    add-int/lit8 v6, v4, 0x1

    if-ne v4, v1, :cond_e

    :goto_4
    goto/16 :goto_e

    :cond_e
    if-eq v14, v12, :cond_10

    if-eq v14, v10, :cond_10

    if-ltz v14, :cond_f

    if-lt v14, v8, :cond_11

    :cond_f
    if-gt v9, v14, :cond_10

    if-lt v14, v7, :cond_11

    :cond_10
    if-ne v14, v11, :cond_12

    :cond_11
    goto/16 :goto_d

    :cond_12
    const/high16 v4, 0x10000

    if-ge v14, v4, :cond_13

    const/4 v14, 0x1

    goto :goto_5

    :cond_13
    const/4 v14, 0x2

    :goto_5
    add-int/2addr v5, v14

    .line 418
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    add-int/lit8 v3, v3, 0x2

    move v4, v6

    goto/16 :goto_0

    :cond_14
    if-ne v4, v1, :cond_30

    goto :goto_6

    :cond_15
    shr-int/lit8 v14, v6, 0x4

    const v11, 0xe000

    const v7, 0xd800

    if-ne v14, v15, :cond_21

    add-int/lit8 v14, v3, 0x2

    if-gt v2, v14, :cond_16

    if-ne v4, v1, :cond_30

    :goto_6
    goto/16 :goto_e

    :cond_16
    add-int/lit8 v15, v3, 0x1

    .line 466
    aget-byte v15, v0, v15

    and-int/lit16 v9, v15, 0xc0

    if-ne v9, v13, :cond_20

    .line 473
    aget-byte v9, v0, v14

    and-int/lit16 v14, v9, 0xc0

    if-ne v14, v13, :cond_1f

    const v13, -0x1e080

    xor-int/2addr v9, v13

    shl-int/lit8 v15, v15, 0x6

    xor-int/2addr v9, v15

    shl-int/lit8 v6, v6, 0xc

    xor-int/2addr v9, v6

    const/16 v6, 0x800

    if-ge v9, v6, :cond_17

    if-ne v4, v1, :cond_1c

    goto :goto_7

    :cond_17
    if-gt v7, v9, :cond_18

    if-ge v9, v11, :cond_18

    if-ne v4, v1, :cond_1c

    goto :goto_7

    :cond_18
    add-int/lit8 v6, v4, 0x1

    if-ne v4, v1, :cond_19

    :goto_7
    goto/16 :goto_e

    :cond_19
    if-eq v9, v12, :cond_1b

    if-eq v9, v10, :cond_1b

    if-ltz v9, :cond_1a

    if-lt v9, v8, :cond_1c

    :cond_1a
    const/16 v4, 0x7f

    if-gt v4, v9, :cond_1b

    const/16 v4, 0xa0

    if-lt v9, v4, :cond_1c

    :cond_1b
    const v4, 0xfffd

    if-ne v9, v4, :cond_1d

    :cond_1c
    goto/16 :goto_d

    :cond_1d
    const/high16 v4, 0x10000

    if-ge v9, v4, :cond_1e

    const/4 v14, 0x1

    goto :goto_8

    :cond_1e
    const/4 v14, 0x2

    :goto_8
    add-int/2addr v5, v14

    .line 451
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    add-int/lit8 v3, v3, 0x3

    move v4, v6

    goto/16 :goto_0

    :cond_1f
    if-ne v4, v1, :cond_30

    goto :goto_9

    :cond_20
    if-ne v4, v1, :cond_30

    goto :goto_9

    :cond_21
    shr-int/lit8 v9, v6, 0x3

    if-ne v9, v15, :cond_2f

    add-int/lit8 v9, v3, 0x3

    if-gt v2, v9, :cond_22

    if-ne v4, v1, :cond_30

    :goto_9
    goto/16 :goto_e

    :cond_22
    add-int/lit8 v14, v3, 0x1

    .line 519
    aget-byte v14, v0, v14

    and-int/lit16 v15, v14, 0xc0

    if-ne v15, v13, :cond_2e

    add-int/lit8 v15, v3, 0x2

    .line 526
    aget-byte v15, v0, v15

    and-int/lit16 v8, v15, 0xc0

    if-ne v8, v13, :cond_2d

    .line 533
    aget-byte v8, v0, v9

    and-int/lit16 v9, v8, 0xc0

    if-ne v9, v13, :cond_2c

    const v9, 0x381f80

    xor-int/2addr v8, v9

    shl-int/lit8 v15, v15, 0x6

    xor-int/2addr v8, v15

    shl-int/lit8 v14, v14, 0xc

    xor-int/2addr v8, v14

    shl-int/lit8 v6, v6, 0x12

    xor-int/2addr v8, v6

    const v6, 0x10ffff

    if-le v8, v6, :cond_23

    if-ne v4, v1, :cond_29

    goto :goto_a

    :cond_23
    if-gt v7, v8, :cond_24

    if-ge v8, v11, :cond_24

    if-ne v4, v1, :cond_29

    goto :goto_a

    :cond_24
    const/high16 v6, 0x10000

    if-ge v8, v6, :cond_25

    if-ne v4, v1, :cond_29

    goto :goto_a

    :cond_25
    add-int/lit8 v6, v4, 0x1

    if-ne v4, v1, :cond_26

    :goto_a
    goto :goto_e

    :cond_26
    if-eq v8, v12, :cond_28

    if-eq v8, v10, :cond_28

    if-ltz v8, :cond_27

    const/16 v4, 0x20

    if-lt v8, v4, :cond_29

    :cond_27
    const/16 v4, 0x7f

    if-gt v4, v8, :cond_28

    const/16 v4, 0xa0

    if-lt v8, v4, :cond_29

    :cond_28
    const v4, 0xfffd

    if-ne v8, v4, :cond_2a

    :cond_29
    goto :goto_d

    :cond_2a
    const/high16 v4, 0x10000

    if-ge v8, v4, :cond_2b

    const/4 v14, 0x1

    goto :goto_b

    :cond_2b
    const/4 v14, 0x2

    :goto_b
    add-int/2addr v5, v14

    .line 501
    sget-object v4, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    add-int/lit8 v3, v3, 0x4

    move v4, v6

    goto/16 :goto_0

    :cond_2c
    if-ne v4, v1, :cond_30

    goto :goto_c

    :cond_2d
    if-ne v4, v1, :cond_30

    goto :goto_c

    :cond_2e
    if-ne v4, v1, :cond_30

    goto :goto_c

    :cond_2f
    if-ne v4, v1, :cond_30

    :goto_c
    goto :goto_e

    :cond_30
    :goto_d
    const/4 v0, -0x1

    return v0

    :cond_31
    :goto_e
    return v5
.end method

.method public static final commonBase64(Lnicoid/network238/okio/ByteString;Z)Ljava/lang/String;
    .registers 6
    .param p0, "$this$commonBase64"    # Lnicoid/network238/okio/ByteString;
    .param p1, "includePadding"    # Z

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 52
    .local v0, "$i$f$commonBase64":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    const/4 v2, 0x0

    const/4 v3, 0x2

    invoke-static {v1, p1, v2, v3, v2}, Lnicoid/network238/okio/-Base64;->encodeBase64$default([BZ[BILjava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static final commonBase64Url(Lnicoid/network238/okio/ByteString;Z)Ljava/lang/String;
    .registers 5
    .param p0, "$this$commonBase64Url"    # Lnicoid/network238/okio/ByteString;
    .param p1, "includePadding"    # Z

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 55
    .local v0, "$i$f$commonBase64Url":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    invoke-static {}, Lnicoid/network238/okio/-Base64;->getBASE64_URL_SAFE()[B

    move-result-object v2

    invoke-static {v1, p1, v2}, Lnicoid/network238/okio/-Base64;->encodeBase64([BZ[B)Ljava/lang/String;

    move-result-object v1

    return-object v1
.end method

.method public static final commonCompareTo(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)I
    .registers 13
    .param p0, "$this$commonCompareTo"    # Lnicoid/network238/okio/ByteString;
    .param p1, "other"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 259
    .local v0, "$i$f$commonCompareTo":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    .line 260
    .local v1, "sizeA":I
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    .line 261
    .local v2, "sizeB":I
    const/4 v3, 0x0

    .line 262
    .local v3, "i":I
    invoke-static {v1, v2}, Ljava/lang/Math;->min(II)I

    move-result v4

    .line 263
    .local v4, "size":I
    :goto_0
    const/4 v5, -0x1

    const/4 v6, 0x1

    if-ge v3, v4, :cond_2

    .line 264
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v7

    .local v7, "$this$and$iv":B
    const/16 v8, 0xff

    .local v8, "other$iv":I
    const/4 v9, 0x0

    .line 389
    .local v9, "$i$f$and":I
    and-int/2addr v7, v8

    .line 264
    .end local v7    # "$this$and$iv":B
    .end local v8    # "other$iv":I
    .end local v9    # "$i$f$and":I
    nop

    .line 265
    .local v7, "byteA":I
    invoke-virtual {p1, v3}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v8

    .local v8, "$this$and$iv":B
    const/16 v9, 0xff

    .local v9, "other$iv":I
    const/4 v10, 0x0

    .line 390
    .local v10, "$i$f$and":I
    and-int/2addr v8, v9

    .line 265
    .end local v8    # "$this$and$iv":B
    .end local v9    # "other$iv":I
    .end local v10    # "$i$f$and":I
    nop

    .line 266
    .local v8, "byteB":I
    if-ne v7, v8, :cond_0

    .line 267
    add-int/lit8 v3, v3, 0x1

    .line 268
    goto :goto_0

    .line 270
    :cond_0
    if-lt v7, v8, :cond_1

    move v5, v6

    :cond_1
    return v5

    .line 272
    .end local v7    # "byteA":I
    .end local v8    # "byteB":I
    :cond_2
    if-ne v1, v2, :cond_3

    const/4 v5, 0x0

    return v5

    .line 273
    :cond_3
    if-lt v1, v2, :cond_4

    move v5, v6

    :cond_4
    return v5
.end method

.method public static final commonCopyInto(Lnicoid/network238/okio/ByteString;I[BII)V
    .registers 8
    .param p0, "$this$commonCopyInto"    # Lnicoid/network238/okio/ByteString;
    .param p1, "offset"    # I
    .param p2, "target"    # [B
    .param p3, "targetOffset"    # I
    .param p4, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "target"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 182
    .local v0, "$i$f$commonCopyInto":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    add-int v2, p1, p4

    invoke-static {v1, p2, p3, p1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([B[BIII)[B

    .line 183
    return-void
.end method

.method public static final commonDecodeBase64(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 4
    .param p0, "$this$commonDecodeBase64"    # Ljava/lang/String;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 294
    .local v0, "$i$f$commonDecodeBase64":I
    invoke-static {p0}, Lnicoid/network238/okio/-Base64;->decodeBase64ToArray(Ljava/lang/String;)[B

    move-result-object v1

    .line 295
    .local v1, "decoded":[B
    if-eqz v1, :cond_0

    new-instance v2, Lnicoid/network238/okio/ByteString;

    invoke-direct {v2, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    goto :goto_0

    :cond_0
    const/4 v2, 0x0

    :goto_0
    return-object v2
.end method

.method public static final commonEncodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 4
    .param p0, "$this$commonEncodeUtf8"    # Ljava/lang/String;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 287
    .local v0, "$i$f$commonEncodeUtf8":I
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-static {p0}, Lnicoid/network238/okio/_JvmPlatformKt;->asUtf8ToByteArray(Ljava/lang/String;)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    .line 288
    .local v1, "byteString":Lnicoid/network238/okio/ByteString;
    invoke-virtual {v1, p0}, Lnicoid/network238/okio/ByteString;->setUtf8$okio(Ljava/lang/String;)V

    .line 289
    return-object v1
.end method

.method public static final commonEndsWith(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Z
    .registers 6
    .param p0, "$this$commonEndsWith"    # Lnicoid/network238/okio/ByteString;
    .param p1, "suffix"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "suffix"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 195
    .local v0, "$i$f$commonEndsWith":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v3

    invoke-virtual {p0, v1, p1, v2, v3}, Lnicoid/network238/okio/ByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result v1

    return v1
.end method

.method public static final commonEndsWith(Lnicoid/network238/okio/ByteString;[B)Z
    .registers 6
    .param p0, "$this$commonEndsWith"    # Lnicoid/network238/okio/ByteString;
    .param p1, "suffix"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "suffix"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 199
    .local v0, "$i$f$commonEndsWith":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    array-length v2, p1

    sub-int/2addr v1, v2

    const/4 v2, 0x0

    array-length v3, p1

    invoke-virtual {p0, v1, p1, v2, v3}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v1

    return v1
.end method

.method public static final commonEquals(Lnicoid/network238/okio/ByteString;Ljava/lang/Object;)Z
    .registers 8
    .param p0, "$this$commonEquals"    # Lnicoid/network238/okio/ByteString;
    .param p1, "other"    # Ljava/lang/Object;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 231
    .local v0, "$i$f$commonEquals":I
    nop

    .line 232
    const/4 v1, 0x1

    if-ne p1, p0, :cond_0

    goto :goto_0

    .line 233
    :cond_0
    instance-of v2, p1, Lnicoid/network238/okio/ByteString;

    const/4 v3, 0x0

    if-eqz v2, :cond_2

    move-object v2, p1

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    array-length v4, v4

    if-ne v2, v4, :cond_1

    move-object v2, p1

    check-cast v2, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v5

    array-length v5, v5

    invoke-virtual {v2, v3, v4, v3, v5}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    goto :goto_0

    .line 234
    :cond_2
    move v1, v3

    .line 231
    :goto_0
    return v1
.end method

.method public static final commonEqualsConstantTime(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Z
    .registers 8

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-eq p1, p0, :cond_1

    .line 240
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_2

    .line 242
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v0

    move v1, v2

    move v3, v1

    :goto_0
    if-ge v1, v0, :cond_0

    .line 243
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v4

    invoke-virtual {p1, v1}, Lnicoid/network238/okio/ByteString;->getByte(I)B

    move-result v5

    xor-int/2addr v4, v5

    or-int/2addr v3, v4

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    if-nez v3, :cond_2

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    return v2
.end method

.method public static final commonGetByte(Lnicoid/network238/okio/ByteString;I)B
    .registers 4
    .param p0, "$this$commonGetByte"    # Lnicoid/network238/okio/ByteString;
    .param p1, "pos"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 142
    .local v0, "$i$f$commonGetByte":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    aget-byte v1, v1, p1

    return v1
.end method

.method public static final commonGetSize(Lnicoid/network238/okio/ByteString;)I
    .registers 3
    .param p0, "$this$commonGetSize"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 145
    .local v0, "$i$f$commonGetSize":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    return v1
.end method

.method public static final commonHashCode(Lnicoid/network238/okio/ByteString;)I
    .registers 6
    .param p0, "$this$commonHashCode"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 250
    .local v0, "$i$f$commonHashCode":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getHashCode$okio()I

    move-result v1

    .line 251
    .local v1, "result":I
    if-eqz v1, :cond_0

    return v1

    .line 252
    :cond_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    invoke-static {v2}, Ljava/util/Arrays;->hashCode([B)I

    move-result v2

    move v3, v2

    .local v3, "it":I
    const/4 v4, 0x0

    .line 253
    .local v4, "$i$a$-also--ByteString$commonHashCode$1":I
    invoke-virtual {p0, v3}, Lnicoid/network238/okio/ByteString;->setHashCode$okio(I)V

    .line 254
    nop

    .line 252
    .end local v3    # "it":I
    .end local v4    # "$i$a$-also--ByteString$commonHashCode$1":I
    return v2
.end method

.method public static final commonHex(Lnicoid/network238/okio/ByteString;)Ljava/lang/String;
    .registers 13
    .param p0, "$this$commonHex"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 62
    .local v0, "$i$f$commonHex":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    mul-int/lit8 v1, v1, 0x2

    new-array v1, v1, [C

    .line 63
    .local v1, "result":[C
    const/4 v2, 0x0

    .line 64
    .local v2, "c":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v3

    array-length v4, v3

    const/4 v5, 0x0

    :goto_0
    if-ge v5, v4, :cond_0

    aget-byte v6, v3, v5

    .line 65
    .local v6, "b":B
    add-int/lit8 v7, v2, 0x1

    .end local v2    # "c":I
    .local v7, "c":I
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v8

    const/4 v9, 0x4

    .local v9, "other$iv":I
    move v10, v6

    .local v10, "$this$shr$iv":B
    const/4 v11, 0x0

    .line 386
    .local v11, "$i$f$shr":I
    shr-int/2addr v10, v9

    .line 65
    .end local v9    # "other$iv":I
    .end local v10    # "$this$shr$iv":B
    .end local v11    # "$i$f$shr":I
    and-int/lit8 v10, v10, 0xf

    aget-char v8, v8, v10

    aput-char v8, v1, v2

    .line 66
    add-int/lit8 v2, v7, 0x1

    .end local v7    # "c":I
    .restart local v2    # "c":I
    invoke-static {}, Lnicoid/network238/okio/internal/-ByteString;->getHEX_DIGIT_CHARS()[C

    move-result-object v8

    const/16 v9, 0xf

    .restart local v9    # "other$iv":I
    move v10, v6

    .local v10, "$this$and$iv":B
    const/4 v11, 0x0

    .line 387
    .local v11, "$i$f$and":I
    and-int/2addr v10, v9

    .end local v9    # "other$iv":I
    .end local v10    # "$this$and$iv":B
    .end local v11    # "$i$f$and":I
    aget-char v8, v8, v10

    aput-char v8, v1, v7

    .line 64
    .end local v6    # "b":B
    add-int/lit8 v5, v5, 0x1

    goto :goto_0

    .line 68
    :cond_0
    invoke-static {v1}, Lnicoid/network238/kotlin/text/StringsKt;->concatToString([C)Ljava/lang/String;

    move-result-object v3

    return-object v3
.end method

.method public static final commonIndexOf(Lnicoid/network238/okio/ByteString;[BI)I
    .registers 9
    .param p0, "$this$commonIndexOf"    # Lnicoid/network238/okio/ByteString;
    .param p1, "other"    # [B
    .param p2, "fromIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 203
    .local v0, "$i$f$commonIndexOf":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    array-length v2, p1

    sub-int/2addr v1, v2

    .line 204
    .local v1, "limit":I
    const/4 v2, 0x0

    invoke-static {p2, v2}, Ljava/lang/Math;->max(II)I

    move-result v3

    .local v3, "i":I
    if-gt v3, v1, :cond_1

    .line 205
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    array-length v5, p1

    invoke-static {v4, v3, p1, v2, v5}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v4

    if-eqz v4, :cond_0

    .line 206
    return v3

    .line 204
    :cond_0
    if-eq v3, v1, :cond_1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 209
    .end local v3    # "i":I
    :cond_1
    const/4 v2, -0x1

    return v2
.end method

.method public static final commonInternalArray(Lnicoid/network238/okio/ByteString;)[B
    .registers 3
    .param p0, "$this$commonInternalArray"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 151
    .local v0, "$i$f$commonInternalArray":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    return-object v1
.end method

.method public static final commonLastIndexOf(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;I)I
    .registers 5
    .param p0, "$this$commonLastIndexOf"    # Lnicoid/network238/okio/ByteString;
    .param p1, "other"    # Lnicoid/network238/okio/ByteString;
    .param p2, "fromIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 216
    .local v0, "$i$f$commonLastIndexOf":I
    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v1

    invoke-virtual {p0, v1, p2}, Lnicoid/network238/okio/ByteString;->lastIndexOf([BI)I

    move-result v1

    return v1
.end method

.method public static final commonLastIndexOf(Lnicoid/network238/okio/ByteString;[BI)I
    .registers 9
    .param p0, "$this$commonLastIndexOf"    # Lnicoid/network238/okio/ByteString;
    .param p1, "other"    # [B
    .param p2, "fromIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 220
    .local v0, "$i$f$commonLastIndexOf":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    array-length v2, p1

    sub-int/2addr v1, v2

    .line 221
    .local v1, "limit":I
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    move-result v2

    .local v2, "i":I
    :goto_0
    const/4 v3, -0x1

    if-ge v3, v2, :cond_1

    .line 222
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v3

    const/4 v4, 0x0

    array-length v5, p1

    invoke-static {v3, v2, p1, v4, v5}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v3

    if-eqz v3, :cond_0

    .line 223
    return v2

    .line 221
    :cond_0
    add-int/lit8 v2, v2, -0x1

    goto :goto_0

    .line 226
    .end local v2    # "i":I
    :cond_1
    return v3
.end method

.method public static final commonOf([B)Lnicoid/network238/okio/ByteString;
    .registers 5
    .param p0, "data"    # [B

    const-string v0, "data"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 277
    .local v0, "$i$f$commonOf":I
    new-instance v1, Lnicoid/network238/okio/ByteString;

    array-length v2, p0

    invoke-static {p0, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v2

    const-string v3, "copyOf(...)"

    invoke-static {v2, v3}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    invoke-direct {v1, v2}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1
.end method

.method public static final commonRangeEquals(Lnicoid/network238/okio/ByteString;ILnicoid/network238/okio/ByteString;II)Z
    .registers 7
    .param p0, "$this$commonRangeEquals"    # Lnicoid/network238/okio/ByteString;
    .param p1, "offset"    # I
    .param p2, "other"    # Lnicoid/network238/okio/ByteString;
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 159
    .local v0, "$i$f$commonRangeEquals":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    invoke-virtual {p2, p3, v1, p1, p4}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v1

    return v1
.end method

.method public static final commonRangeEquals(Lnicoid/network238/okio/ByteString;I[BII)Z
    .registers 7
    .param p0, "$this$commonRangeEquals"    # Lnicoid/network238/okio/ByteString;
    .param p1, "offset"    # I
    .param p2, "other"    # [B
    .param p3, "otherOffset"    # I
    .param p4, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "other"

    invoke-static {p2, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 169
    .local v0, "$i$f$commonRangeEquals":I
    if-ltz p1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    sub-int/2addr v1, p4

    if-gt p1, v1, :cond_0

    .line 170
    if-ltz p3, :cond_0

    array-length v1, p2

    sub-int/2addr v1, p4

    if-gt p3, v1, :cond_0

    .line 171
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    invoke-static {v1, p1, p2, p3, p4}, Lnicoid/network238/okio/-SegmentedByteString;->arrayRangeEquals([BI[BII)Z

    move-result v1

    if-eqz v1, :cond_0

    const/4 v1, 0x1

    goto :goto_0

    :cond_0
    const/4 v1, 0x0

    .line 168
    :goto_0
    return v1
.end method

.method public static final commonStartsWith(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/ByteString;)Z
    .registers 5
    .param p0, "$this$commonStartsWith"    # Lnicoid/network238/okio/ByteString;
    .param p1, "prefix"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "prefix"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 187
    .local v0, "$i$f$commonStartsWith":I
    const/4 v1, 0x0

    invoke-virtual {p1}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    invoke-virtual {p0, v1, p1, v1, v2}, Lnicoid/network238/okio/ByteString;->rangeEquals(ILnicoid/network238/okio/ByteString;II)Z

    move-result v1

    return v1
.end method

.method public static final commonStartsWith(Lnicoid/network238/okio/ByteString;[B)Z
    .registers 5
    .param p0, "$this$commonStartsWith"    # Lnicoid/network238/okio/ByteString;
    .param p1, "prefix"    # [B

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const-string v0, "prefix"

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 191
    .local v0, "$i$f$commonStartsWith":I
    const/4 v1, 0x0

    array-length v2, p1

    invoke-virtual {p0, v1, p1, v1, v2}, Lnicoid/network238/okio/ByteString;->rangeEquals(I[BII)Z

    move-result v1

    return v1
.end method

.method public static final commonSubstring(Lnicoid/network238/okio/ByteString;II)Lnicoid/network238/okio/ByteString;
    .registers 7
    .param p0, "$this$commonSubstring"    # Lnicoid/network238/okio/ByteString;
    .param p1, "beginIndex"    # I
    .param p2, "endIndex"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 129
    .local v0, "$i$f$commonSubstring":I
    const/4 v1, 0x1

    const/4 v2, 0x0

    if-ltz p1, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    if-eqz v3, :cond_6

    .line 130
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v3

    array-length v3, v3

    if-gt p2, v3, :cond_1

    move v3, v1

    goto :goto_1

    :cond_1
    move v3, v2

    :goto_1
    if-eqz v3, :cond_5

    .line 132
    sub-int v3, p2, p1

    .line 133
    .local v3, "subLen":I
    if-gez v3, :cond_2

    move v1, v2

    :cond_2
    if-eqz v1, :cond_4

    .line 135
    if-nez p1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v1, v1

    if-ne p2, v1, :cond_3

    .line 136
    return-object p0

    .line 138
    :cond_3
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    invoke-static {v2, p1, p2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1

    .line 388
    :cond_4
    const/4 v1, 0x0

    .line 133
    .local v1, "$i$a$-require--ByteString$commonSubstring$3":I
    nop

    .end local v1    # "$i$a$-require--ByteString$commonSubstring$3":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "endIndex < beginIndex"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 388
    .end local v3    # "subLen":I
    :cond_5
    const/4 v1, 0x0

    .line 130
    .local v1, "$i$a$-require--ByteString$commonSubstring$2":I
    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "endIndex > length("

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v3

    array-length v3, v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v2

    const/16 v3, 0x29

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .end local v1    # "$i$a$-require--ByteString$commonSubstring$2":I
    new-instance v2, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v2, v1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v2

    .line 388
    :cond_6
    const/4 v1, 0x0

    .line 129
    .local v1, "$i$a$-require--ByteString$commonSubstring$1":I
    nop

    .end local v1    # "$i$a$-require--ByteString$commonSubstring$1":I
    new-instance v1, Ljava/lang/IllegalArgumentException;

    const-string v2, "beginIndex < 0"

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static final commonToAsciiLowercase(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 9
    .param p0, "$this$commonToAsciiLowercase"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 74
    .local v0, "$i$f$commonToAsciiLowercase":I
    const/4 v1, 0x0

    .line 75
    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 76
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    aget-byte v2, v2, v1

    .line 77
    .local v2, "c":B
    const/16 v3, 0x41

    if-lt v2, v3, :cond_2

    const/16 v4, 0x5a

    if-gt v2, v4, :cond_2

    .line 83
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v5

    array-length v6, v5

    invoke-static {v5, v6}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v5

    const-string v6, "copyOf(...)"

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 84
    .local v5, "lowercase":[B
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "i":I
    .local v6, "i":I
    add-int/lit8 v7, v2, 0x20

    int-to-byte v7, v7

    aput-byte v7, v5, v1

    .line 85
    :goto_1
    array-length v1, v5

    if-ge v6, v1, :cond_1

    .line 86
    aget-byte v2, v5, v6

    .line 87
    if-lt v2, v3, :cond_0

    if-gt v2, v4, :cond_0

    .line 91
    add-int/lit8 v1, v2, 0x20

    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 92
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 88
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 89
    goto :goto_1

    .line 94
    :cond_1
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-direct {v1, v5}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1

    .line 78
    .end local v5    # "lowercase":[B
    .end local v6    # "i":I
    .restart local v1    # "i":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 79
    goto :goto_0

    .line 96
    .end local v2    # "c":B
    :cond_3
    return-object p0
.end method

.method public static final commonToAsciiUppercase(Lnicoid/network238/okio/ByteString;)Lnicoid/network238/okio/ByteString;
    .registers 9
    .param p0, "$this$commonToAsciiUppercase"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 102
    .local v0, "$i$f$commonToAsciiUppercase":I
    const/4 v1, 0x0

    .line 103
    .local v1, "i":I
    :goto_0
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    if-ge v1, v2, :cond_3

    .line 104
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    aget-byte v2, v2, v1

    .line 105
    .local v2, "c":B
    const/16 v3, 0x61

    if-lt v2, v3, :cond_2

    const/16 v4, 0x7a

    if-gt v2, v4, :cond_2

    .line 111
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v5

    array-length v6, v5

    invoke-static {v5, v6}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v5

    const-string v6, "copyOf(...)"

    invoke-static {v5, v6}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 112
    .local v5, "lowercase":[B
    add-int/lit8 v6, v1, 0x1

    .end local v1    # "i":I
    .local v6, "i":I
    add-int/lit8 v7, v2, -0x20

    int-to-byte v7, v7

    aput-byte v7, v5, v1

    .line 113
    :goto_1
    array-length v1, v5

    if-ge v6, v1, :cond_1

    .line 114
    aget-byte v2, v5, v6

    .line 115
    if-lt v2, v3, :cond_0

    if-gt v2, v4, :cond_0

    .line 119
    add-int/lit8 v1, v2, -0x20

    int-to-byte v1, v1

    aput-byte v1, v5, v6

    .line 120
    add-int/lit8 v6, v6, 0x1

    goto :goto_1

    .line 116
    :cond_0
    add-int/lit8 v6, v6, 0x1

    .line 117
    goto :goto_1

    .line 122
    :cond_1
    new-instance v1, Lnicoid/network238/okio/ByteString;

    invoke-direct {v1, v5}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1

    .line 106
    .end local v5    # "lowercase":[B
    .end local v6    # "i":I
    .restart local v1    # "i":I
    :cond_2
    add-int/lit8 v1, v1, 0x1

    .line 107
    goto :goto_0

    .line 124
    .end local v2    # "c":B
    :cond_3
    return-object p0
.end method

.method public static final commonToByteArray(Lnicoid/network238/okio/ByteString;)[B
    .registers 4
    .param p0, "$this$commonToByteArray"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 148
    .local v0, "$i$f$commonToByteArray":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    array-length v2, v1

    invoke-static {v1, v2}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object v1

    const-string v2, "copyOf(...)"

    invoke-static {v1, v2}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    return-object v1
.end method

.method public static final commonToByteString([BII)Lnicoid/network238/okio/ByteString;
    .registers 11
    .param p0, "$this$commonToByteString"    # [B
    .param p1, "offset"    # I
    .param p2, "byteCount"    # I

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 281
    .local v0, "$i$f$commonToByteString":I
    array-length v1, p0

    int-to-long v2, v1

    int-to-long v4, p1

    int-to-long v6, p2

    invoke-static/range {v2 .. v7}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    .line 282
    new-instance v1, Lnicoid/network238/okio/ByteString;

    add-int v2, p1, p2

    invoke-static {p0, p1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v2

    invoke-direct {v1, v2}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object v1
.end method

.method public static final commonToString(Lnicoid/network238/okio/ByteString;)Ljava/lang/String;
    .registers 23
    .param p0, "$this$commonToString"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    move-object/from16 v1, p0

    invoke-static {v1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 308
    .local v0, "$i$f$commonToString":I
    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    array-length v2, v2

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_0

    move v2, v3

    goto :goto_0

    :cond_0
    move v2, v4

    :goto_0
    if-eqz v2, :cond_1

    const-string v2, "[size=0]"

    return-object v2

    .line 310
    :cond_1
    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v2

    const/16 v5, 0x40

    # invokes: Lnicoid/network238/okio/internal/-ByteString;->codePointIndexToCharIndex([BI)I
    invoke-static {v2, v5}, Lnicoid/network238/okio/internal/-ByteString;->access$codePointIndexToCharIndex([BI)I

    move-result v2

    .line 311
    .local v2, "i":I
    const/4 v6, -0x1

    const-string v7, "\u2026]"

    const-string v8, "[size="

    const/16 v9, 0x5d

    if-ne v2, v6, :cond_8

    .line 312
    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v6

    array-length v6, v6

    if-gt v6, v5, :cond_2

    .line 313
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    const-string v4, "[hex="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    goto :goto_3

    .line 315
    :cond_2
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " hex="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    const/4 v6, 0x0

    .local v6, "beginIndex$iv":I
    const/16 v8, 0x40

    .local v8, "endIndex$iv":I
    move-object/from16 v9, p0

    .local v9, "$this$commonSubstring$iv":Lnicoid/network238/okio/ByteString;
    const/4 v10, 0x0

    .line 391
    .local v10, "$i$f$commonSubstring":I
    nop

    .line 393
    invoke-virtual {v9}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v11

    array-length v11, v11

    if-gt v8, v11, :cond_3

    move v11, v3

    goto :goto_1

    :cond_3
    move v11, v4

    :goto_1
    if-eqz v11, :cond_7

    .line 395
    sub-int v11, v8, v6

    .line 396
    .local v11, "subLen$iv":I
    if-gez v11, :cond_4

    move v3, v4

    :cond_4
    if-eqz v3, :cond_6

    .line 398
    invoke-virtual {v9}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v3

    array-length v3, v3

    if-ne v8, v3, :cond_5

    .line 399
    goto :goto_2

    .line 401
    :cond_5
    new-instance v3, Lnicoid/network238/okio/ByteString;

    invoke-virtual {v9}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v4

    invoke-static {v4, v6, v8}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([BII)[B

    move-result-object v4

    invoke-direct {v3, v4}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    move-object v9, v3

    .line 315
    .end local v6    # "beginIndex$iv":I
    .end local v8    # "endIndex$iv":I
    .end local v9    # "$this$commonSubstring$iv":Lnicoid/network238/okio/ByteString;
    .end local v10    # "$i$f$commonSubstring":I
    .end local v11    # "subLen$iv":I
    :goto_2
    invoke-virtual {v9}, Lnicoid/network238/okio/ByteString;->hex()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v5, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .line 312
    :goto_3
    return-object v3

    .line 392
    .restart local v6    # "beginIndex$iv":I
    .restart local v8    # "endIndex$iv":I
    .restart local v9    # "$this$commonSubstring$iv":Lnicoid/network238/okio/ByteString;
    .restart local v10    # "$i$f$commonSubstring":I
    .restart local v11    # "subLen$iv":I
    :cond_6
    const/4 v3, 0x0

    .line 396
    .local v3, "$i$a$-require--ByteString$commonSubstring$3$iv":I
    nop

    .end local v3    # "$i$a$-require--ByteString$commonSubstring$3$iv":I
    new-instance v3, Ljava/lang/IllegalArgumentException;

    const-string v4, "endIndex < beginIndex"

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-direct {v3, v4}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 392
    .end local v11    # "subLen$iv":I
    :cond_7
    const/4 v3, 0x0

    .line 393
    .local v3, "$i$a$-require--ByteString$commonSubstring$2$iv":I
    new-instance v4, Ljava/lang/StringBuilder;

    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    const-string v5, "endIndex > length("

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v9}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v5

    array-length v5, v5

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v4

    const/16 v5, 0x29

    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    .end local v3    # "$i$a$-require--ByteString$commonSubstring$2$iv":I
    new-instance v4, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v3}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v4, v3}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v4

    .line 319
    .end local v6    # "beginIndex$iv":I
    .end local v8    # "endIndex$iv":I
    .end local v9    # "$this$commonSubstring$iv":Lnicoid/network238/okio/ByteString;
    .end local v10    # "$i$f$commonSubstring":I
    :cond_8
    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->utf8()Ljava/lang/String;

    move-result-object v3

    .line 320
    .local v3, "text":Ljava/lang/String;
    invoke-virtual {v3, v4, v2}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v10

    const-string v4, "substring(...)"

    invoke-static {v10, v4}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullExpressionValue(Ljava/lang/Object;Ljava/lang/String;)V

    .line 321
    const/4 v14, 0x4

    const/4 v15, 0x0

    const-string v11, "\\"

    const-string v12, "\\\\"

    const/4 v13, 0x0

    invoke-static/range {v10 .. v15}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v16

    .line 322
    const/16 v20, 0x4

    const/16 v21, 0x0

    const-string v17, "\n"

    const-string v18, "\\n"

    const/16 v19, 0x0

    invoke-static/range {v16 .. v21}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v10

    .line 323
    const-string v11, "\r"

    const-string v12, "\\r"

    invoke-static/range {v10 .. v15}, Lnicoid/network238/kotlin/text/StringsKt;->replace$default(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZILjava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    .line 320
    nop

    .line 324
    .local v4, "safeText":Ljava/lang/String;
    invoke-virtual {v3}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v2, v5, :cond_9

    .line 325
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v6

    array-length v6, v6

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v5

    const-string v6, " text="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    goto :goto_4

    .line 327
    :cond_9
    new-instance v5, Ljava/lang/StringBuilder;

    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    const-string v6, "[text="

    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5, v9}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    .line 324
    :goto_4
    return-object v5
.end method

.method public static final commonUtf8(Lnicoid/network238/okio/ByteString;)Ljava/lang/String;
    .registers 4
    .param p0, "$this$commonUtf8"    # Lnicoid/network238/okio/ByteString;

    const-string v0, "<this>"

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    const/4 v0, 0x0

    .line 42
    .local v0, "$i$f$commonUtf8":I
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getUtf8$okio()Ljava/lang/String;

    move-result-object v1

    .line 43
    .local v1, "result":Ljava/lang/String;
    if-nez v1, :cond_0

    .line 45
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->internalArray$okio()[B

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/okio/_JvmPlatformKt;->toUtf8String([B)Ljava/lang/String;

    move-result-object v1

    .line 46
    invoke-virtual {p0, v1}, Lnicoid/network238/okio/ByteString;->setUtf8$okio(Ljava/lang/String;)V

    .line 48
    :cond_0
    return-object v1
.end method

.method public static final commonWrite(Lnicoid/network238/okio/ByteString;Lnicoid/network238/okio/Buffer;II)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 303
    invoke-virtual {p0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object p0

    invoke-virtual {p1, p0, p2, p3}, Lnicoid/network238/okio/Buffer;->write([BII)Lnicoid/network238/okio/Buffer;

    return-void
.end method

.method private static final decodeHexDigitIgnoreWhitespace(C)I
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

    :cond_2
    const/16 v0, 0x20

    if-eq p0, v0, :cond_3

    const/16 v0, 0xd

    if-eq p0, v0, :cond_3

    const/16 v0, 0xa

    if-eq p0, v0, :cond_3

    const/16 v0, 0x9

    if-eq p0, v0, :cond_3

    .line 382
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

    :cond_3
    const/4 p0, -0x1

    return p0
.end method

.method public static final decodeHexIgnoreWhitespace(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;
    .registers 9

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 353
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    div-int/lit8 v0, v0, 0x2

    new-array v1, v0, [B

    const/4 v2, 0x0

    move v3, v2

    move v4, v3

    .line 355
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    if-ge v3, v5, :cond_3

    add-int/lit8 v5, v3, 0x1

    .line 356
    invoke-virtual {p0, v3}, Ljava/lang/String;->charAt(I)C

    move-result v3

    invoke-static {v3}, Lnicoid/network238/okio/internal/-ByteString;->decodeHexDigitIgnoreWhitespace(C)I

    move-result v3

    const/4 v6, -0x1

    if-eq v3, v6, :cond_2

    .line 359
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    if-ge v5, v7, :cond_1

    add-int/lit8 v7, v5, 0x1

    .line 360
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    invoke-static {v5}, Lnicoid/network238/okio/internal/-ByteString;->decodeHexDigitIgnoreWhitespace(C)I

    move-result v5

    if-eq v5, v6, :cond_0

    add-int/lit8 v6, v4, 0x1

    shl-int/lit8 v3, v3, 0x4

    add-int/2addr v3, v5

    int-to-byte v3, v3

    .line 363
    aput-byte v3, v1, v4

    move v4, v6

    move v3, v7

    goto :goto_0

    .line 360
    :cond_0
    move v5, v7

    goto :goto_1

    .line 367
    :cond_1
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Expected an even number of hex digits but was: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    shl-int/lit8 v4, v4, 0x1

    add-int/lit8 v4, v4, 0x1

    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 356
    :cond_2
    move v3, v5

    goto :goto_0

    .line 367
    :cond_3
    if-ge v4, v0, :cond_4

    .line 371
    sget-object p0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    invoke-virtual {p0, v1, v2, v4}, Lnicoid/network238/okio/ByteString$Companion;->of([BII)Lnicoid/network238/okio/ByteString;

    move-result-object p0

    return-object p0

    .line 372
    :cond_4
    new-instance p0, Lnicoid/network238/okio/ByteString;

    invoke-direct {p0, v1}, Lnicoid/network238/okio/ByteString;-><init>([B)V

    return-object p0
.end method

.method public static final getHEX_DIGIT_CHARS()[C
    .registers 1

    .line 57
    sget-object v0, Lnicoid/network238/okio/internal/-ByteString;->HEX_DIGIT_CHARS:[C

    return-object v0
.end method
