.class public final Lnicoid/network238/okio/-Base64;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0005\n\u0002\u0010\u000e\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0002\u001a\u000e\u0010\u0006\u001a\u0004\u0018\u00010\u0001*\u00020\u0007H\u0000\u001a\u001e\u0010\u0008\u001a\u00020\u0007*\u00020\u00012\u0006\u0010\t\u001a\u00020\n2\u0008\u0008\u0002\u0010\u000b\u001a\u00020\u0001H\u0000\"\u0014\u0010\u0000\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0002\u0010\u0003\"\u0014\u0010\u0004\u001a\u00020\u0001X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0005\u0010\u0003\u00a8\u0006\u000c"
    }
    d2 = {
        "BASE64",
        "",
        "getBASE64",
        "()[B",
        "BASE64_URL_SAFE",
        "getBASE64_URL_SAFE",
        "decodeBase64ToArray",
        "",
        "encodeBase64",
        "includePadding",
        "",
        "map",
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
.field private static final BASE64:[B

.field private static final BASE64_URL_SAFE:[B


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 27
    sget-object v0, Lnicoid/network238/okio/ByteString;->Companion:Lnicoid/network238/okio/ByteString$Companion;

    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v1

    sput-object v1, Lnicoid/network238/okio/-Base64;->BASE64:[B

    .line 30
    const-string v1, "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789-_"

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/ByteString$Companion;->encodeUtf8(Ljava/lang/String;)Lnicoid/network238/okio/ByteString;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okio/ByteString;->getData$okio()[B

    move-result-object v0

    sput-object v0, Lnicoid/network238/okio/-Base64;->BASE64_URL_SAFE:[B

    return-void
.end method

.method public static final decodeBase64ToArray(Ljava/lang/String;)[B
    .registers 15

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    :goto_0
    const/16 v1, 0x9

    const/16 v2, 0x20

    const/16 v3, 0xd

    const/16 v4, 0xa

    if-lez v0, :cond_1

    add-int/lit8 v5, v0, -0x1

    .line 36
    invoke-virtual {p0, v5}, Ljava/lang/String;->charAt(I)C

    move-result v5

    const/16 v6, 0x3d

    if-eq v5, v6, :cond_0

    if-eq v5, v4, :cond_0

    if-eq v5, v3, :cond_0

    if-eq v5, v2, :cond_0

    if-eq v5, v1, :cond_0

    goto :goto_1

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    :goto_1
    int-to-long v5, v0

    const-wide/16 v7, 0x6

    mul-long/2addr v5, v7

    .line 44
    const-wide/16 v7, 0x8

    div-long/2addr v5, v7

    long-to-int v5, v5

    new-array v6, v5, [B

    const/4 v7, 0x0

    move v8, v7

    move v9, v8

    move v10, v9

    :goto_2
    if-ge v7, v0, :cond_8

    .line 50
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v11

    const/16 v12, 0x41

    if-gt v12, v11, :cond_2

    const/16 v12, 0x5b

    if-ge v11, v12, :cond_2

    add-int/lit8 v11, v11, -0x41

    goto :goto_3

    :cond_2
    const/16 v12, 0x61

    if-gt v12, v11, :cond_3

    const/16 v12, 0x7b

    if-ge v11, v12, :cond_3

    add-int/lit8 v11, v11, -0x47

    goto :goto_3

    :cond_3
    const/16 v12, 0x30

    if-gt v12, v11, :cond_4

    const/16 v12, 0x3a

    if-ge v11, v12, :cond_4

    add-int/lit8 v11, v11, 0x4

    goto :goto_3

    :cond_4
    const/16 v12, 0x2b

    if-eq v11, v12, :cond_6

    const/16 v12, 0x2d

    if-eq v11, v12, :cond_6

    const/16 v12, 0x2f

    if-eq v11, v12, :cond_5

    const/16 v12, 0x5f

    if-eq v11, v12, :cond_5

    if-eq v11, v4, :cond_7

    if-eq v11, v3, :cond_7

    if-eq v11, v2, :cond_7

    if-eq v11, v1, :cond_7

    goto :goto_5

    :cond_5
    const/16 v11, 0x3f

    goto :goto_3

    :cond_6
    const/16 v11, 0x3e

    :goto_3
    shl-int/lit8 v10, v10, 0x6

    or-int/2addr v10, v11

    add-int/lit8 v8, v8, 0x1

    .line 83
    rem-int/lit8 v11, v8, 0x4

    if-nez v11, :cond_7

    add-int/lit8 v11, v9, 0x1

    shr-int/lit8 v12, v10, 0x10

    int-to-byte v12, v12

    .line 84
    aput-byte v12, v6, v9

    add-int/lit8 v12, v9, 0x2

    shr-int/lit8 v13, v10, 0x8

    int-to-byte v13, v13

    .line 85
    aput-byte v13, v6, v11

    add-int/lit8 v9, v9, 0x3

    int-to-byte v11, v10

    .line 86
    aput-byte v11, v6, v12

    :cond_7
    add-int/lit8 v7, v7, 0x1

    goto :goto_2

    :cond_8
    nop

    .line 90
    rem-int/lit8 v8, v8, 0x4

    const/4 p0, 0x1

    if-eq v8, p0, :cond_c

    const/4 p0, 0x2

    if-eq v8, p0, :cond_9

    const/4 p0, 0x3

    if-ne v8, p0, :cond_a

    shl-int/lit8 v10, v10, 0x6

    add-int/lit8 p0, v9, 0x1

    shr-int/lit8 v0, v10, 0x10

    int-to-byte v0, v0

    .line 104
    aput-byte v0, v6, v9

    add-int/lit8 v9, v9, 0x2

    shr-int/lit8 v10, v10, 0x8

    int-to-byte v0, v10

    .line 105
    aput-byte v0, v6, p0

    goto :goto_4

    :cond_9
    shl-int/lit8 v10, v10, 0xc

    add-int/lit8 p0, v9, 0x1

    shr-int/lit8 v10, v10, 0x10

    int-to-byte v0, v10

    .line 99
    aput-byte v0, v6, v9

    move v9, p0

    :cond_a
    :goto_4
    if-ne v9, v5, :cond_b

    return-object v6

    .line 113
    :cond_b
    invoke-static {v6, v9}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    return-object p0

    :cond_c
    :goto_5
    const/4 p0, 0x0

    return-object p0
.end method

.method public static final encodeBase64([BZ[B)Ljava/lang/String;
    .registers 14

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x2

    if-eqz p1, :cond_0

    .line 121
    array-length v1, p0

    add-int/2addr v1, v0

    div-int/lit8 v1, v1, 0x3

    shl-int/2addr v1, v0

    goto :goto_0

    .line 123
    :cond_0
    array-length v1, p0

    shl-int/2addr v1, v0

    add-int/2addr v1, v0

    div-int/lit8 v1, v1, 0x3

    .line 125
    :goto_0
    new-array v1, v1, [B

    .line 127
    array-length v2, p0

    array-length v3, p0

    rem-int/lit8 v3, v3, 0x3

    sub-int/2addr v2, v3

    const/4 v3, 0x0

    move v4, v3

    :goto_1
    if-ge v3, v2, :cond_1

    add-int/lit8 v5, v3, 0x1

    .line 130
    aget-byte v6, p0, v3

    add-int/lit8 v7, v3, 0x2

    .line 131
    aget-byte v5, p0, v5

    add-int/lit8 v3, v3, 0x3

    .line 132
    aget-byte v7, p0, v7

    add-int/lit8 v8, v4, 0x1

    and-int/lit16 v9, v6, 0xff

    shr-int/2addr v9, v0

    .line 133
    aget-byte v9, p2, v9

    aput-byte v9, v1, v4

    add-int/lit8 v9, v4, 0x2

    and-int/lit8 v6, v6, 0x3

    shl-int/lit8 v6, v6, 0x4

    and-int/lit16 v10, v5, 0xff

    shr-int/lit8 v10, v10, 0x4

    or-int/2addr v6, v10

    .line 134
    aget-byte v6, p2, v6

    aput-byte v6, v1, v8

    add-int/lit8 v6, v4, 0x3

    and-int/lit8 v5, v5, 0xf

    shl-int/2addr v5, v0

    and-int/lit16 v8, v7, 0xff

    shr-int/lit8 v8, v8, 0x6

    or-int/2addr v5, v8

    .line 135
    aget-byte v5, p2, v5

    aput-byte v5, v1, v9

    add-int/lit8 v4, v4, 0x4

    and-int/lit8 v7, v7, 0x3f

    .line 136
    aget-byte v5, p2, v7

    aput-byte v5, v1, v6

    goto :goto_1

    .line 138
    :cond_1
    array-length v5, p0

    sub-int/2addr v5, v2

    const/16 v2, 0x3d

    const/4 v6, 0x1

    if-eq v5, v6, :cond_2

    if-ne v5, v0, :cond_3

    add-int/lit8 v5, v3, 0x1

    .line 149
    aget-byte v3, p0, v3

    .line 150
    aget-byte p0, p0, v5

    add-int/lit8 v5, v4, 0x1

    and-int/lit16 v6, v3, 0xff

    shr-int/2addr v6, v0

    .line 151
    aget-byte v6, p2, v6

    aput-byte v6, v1, v4

    add-int/lit8 v6, v4, 0x2

    and-int/lit8 v3, v3, 0x3

    shl-int/lit8 v3, v3, 0x4

    and-int/lit16 v7, p0, 0xff

    shr-int/lit8 v7, v7, 0x4

    or-int/2addr v3, v7

    .line 152
    aget-byte v3, p2, v3

    aput-byte v3, v1, v5

    add-int/lit8 v4, v4, 0x3

    and-int/lit8 p0, p0, 0xf

    shl-int/2addr p0, v0

    .line 153
    aget-byte p0, p2, p0

    aput-byte p0, v1, v6

    if-eqz p1, :cond_3

    .line 155
    aput-byte v2, v1, v4

    goto :goto_2

    .line 140
    :cond_2
    aget-byte p0, p0, v3

    add-int/lit8 v3, v4, 0x1

    and-int/lit16 v5, p0, 0xff

    shr-int/2addr v5, v0

    .line 141
    aget-byte v0, p2, v5

    aput-byte v0, v1, v4

    add-int/lit8 v0, v4, 0x2

    and-int/lit8 p0, p0, 0x3

    shl-int/lit8 p0, p0, 0x4

    .line 142
    aget-byte p0, p2, p0

    aput-byte p0, v1, v3

    if-eqz p1, :cond_3

    add-int/lit8 v4, v4, 0x3

    .line 144
    aput-byte v2, v1, v0

    .line 145
    aput-byte v2, v1, v4

    .line 159
    :cond_3
    :goto_2
    invoke-static {v1}, Lnicoid/network238/okio/_JvmPlatformKt;->toUtf8String([B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic encodeBase64$default([BZ[BILjava/lang/Object;)Ljava/lang/String;
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 118
    sget-object p2, Lnicoid/network238/okio/-Base64;->BASE64:[B

    .line 116
    :cond_0
    invoke-static {p0, p1, p2}, Lnicoid/network238/okio/-Base64;->encodeBase64([BZ[B)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static final getBASE64()[B
    .registers 1

    .line 26
    sget-object v0, Lnicoid/network238/okio/-Base64;->BASE64:[B

    return-object v0
.end method

.method public static final getBASE64_URL_SAFE()[B
    .registers 1

    .line 29
    sget-object v0, Lnicoid/network238/okio/-Base64;->BASE64_URL_SAFE:[B

    return-object v0
.end method
