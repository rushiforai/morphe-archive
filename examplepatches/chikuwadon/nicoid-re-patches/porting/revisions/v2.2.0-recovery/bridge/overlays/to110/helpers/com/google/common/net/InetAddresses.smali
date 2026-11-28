.class public final Lcom/google/common/net/InetAddresses;
.super Ljava/lang/Object;
.source "InetAddresses.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/net/InetAddresses$Scope;,
        Lcom/google/common/net/InetAddresses$TeredoInfo;
    }
.end annotation


# static fields
.field private static final ANY4:Ljava/net/Inet4Address;

.field private static final IPV4_DELIMITER:C = '.'

.field private static final IPV4_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

.field private static final IPV4_PART_COUNT:I = 0x4

.field private static final IPV6_DELIMITER:C = ':'

.field private static final IPV6_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

.field private static final IPV6_PART_COUNT:I = 0x8

.field private static final LOOPBACK4:Ljava/net/Inet4Address;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    const/16 v0, 0x2e

    .line 112
    invoke-static {v0}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/InetAddresses;->IPV4_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

    const/16 v0, 0x3a

    .line 113
    invoke-static {v0}, Lcom/google/common/base/CharMatcher;->is(C)Lcom/google/common/base/CharMatcher;

    move-result-object v0

    sput-object v0, Lcom/google/common/net/InetAddresses;->IPV6_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

    .line 114
    const-string v0, "127.0.0.1"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    .line 115
    const-string v0, "0.0.0.0"

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->forString(Ljava/lang/String;)Ljava/net/InetAddress;

    move-result-object v0

    check-cast v0, Ljava/net/Inet4Address;

    sput-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 117
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic access$200()Ljava/net/Inet4Address;
    .registers 1

    .line 107
    sget-object v0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-object v0
.end method

.method private static bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "addr",
            "scope"
        }
    .end annotation

    const-string v0, "No such interface: "

    .line 426
    :try_start_0
    invoke-static {p0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0

    if-nez p1, :cond_0

    return-object p0

    .line 430
    :cond_0
    instance-of v1, p0, Ljava/net/Inet6Address;

    const-string v2, "Unexpected state, scope should only appear for ipv6"

    invoke-static {v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    .line 432
    check-cast p0, Ljava/net/Inet6Address;

    .line 433
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v1

    const/4 v2, 0x0

    invoke-static {p1, v2, v1}, Lcom/google/common/net/InetAddresses;->tryParseDecimal(Ljava/lang/String;II)I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_1

    .line 436
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getHostAddress()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    .line 435
    invoke-static {p1, p0, v1}, Ljava/net/Inet6Address;->getByAddress(Ljava/lang/String;[BI)Ljava/net/Inet6Address;

    move-result-object p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_2

    return-object p0

    .line 439
    :cond_1
    :try_start_1
    invoke-static {p1}, Ljava/net/NetworkInterface;->getByName(Ljava/lang/String;)Ljava/net/NetworkInterface;

    move-result-object v1

    if-eqz v1, :cond_2

    .line 444
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getHostAddress()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    .line 443
    invoke-static {v2, p0, v1}, Ljava/net/Inet6Address;->getByAddress(Ljava/lang/String;[BLjava/net/NetworkInterface;)Ljava/net/Inet6Address;

    move-result-object p0

    return-object p0

    .line 441
    :cond_2
    const-string p0, "No such interface: \'%s\'"

    filled-new-array {p1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-static {p0, v1}, Lcom/google/common/net/InetAddresses;->formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
    :try_end_1
    .catch Ljava/net/SocketException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/net/UnknownHostException; {:try_start_1 .. :try_end_1} :catch_0

    :catch_0
    move-exception p0

    goto :goto_0

    :catch_1
    move-exception p0

    .line 446
    :goto_0
    :try_start_2
    new-instance v1, Ljava/lang/IllegalArgumentException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v1, p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
    :try_end_2
    .catch Ljava/net/UnknownHostException; {:try_start_2 .. :try_end_2} :catch_2

    :catch_2
    move-exception p0

    .line 449
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public static coerceToInteger(Ljava/net/InetAddress;)I
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 1065
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Inet4Address;->getAddress()[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/io/ByteStreams;->newDataInput([B)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/io/ByteArrayDataInput;->readInt()I

    move-result p0

    return p0
.end method

.method private static compressLongestRunOfZeroes([I)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hextets"
        }
    .end annotation

    const/4 v0, -0x1

    const/4 v1, 0x0

    move v2, v0

    move v3, v2

    move v4, v3

    .line 515
    :goto_0
    array-length v5, p0

    add-int/lit8 v5, v5, 0x1

    if-ge v1, v5, :cond_3

    .line 516
    array-length v5, p0

    if-ge v1, v5, :cond_0

    aget v5, p0, v1

    if-nez v5, :cond_0

    if-gez v4, :cond_2

    move v4, v1

    goto :goto_1

    :cond_0
    if-ltz v4, :cond_2

    sub-int v5, v1, v4

    if-le v5, v2, :cond_1

    move v3, v4

    move v2, v5

    :cond_1
    move v4, v0

    :cond_2
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_3
    const/4 v1, 0x2

    if-lt v2, v1, :cond_4

    add-int/2addr v2, v3

    .line 530
    invoke-static {p0, v3, v2, v0}, Ljava/util/Arrays;->fill([IIII)V

    :cond_4
    return-void
.end method

.method private static convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    const/16 v0, 0x3a

    .line 343
    invoke-virtual {p0, v0}, Ljava/lang/String;->lastIndexOf(I)I

    move-result v0

    const/4 v1, 0x1

    add-int/2addr v0, v1

    const/4 v2, 0x0

    .line 344
    invoke-virtual {p0, v2, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v3

    .line 345
    invoke-virtual {p0, v0}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object p0

    .line 346
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 350
    :cond_0
    aget-byte v0, p0, v2

    and-int/lit16 v0, v0, 0xff

    shl-int/lit8 v0, v0, 0x8

    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    or-int/2addr v0, v1

    invoke-static {v0}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x2

    .line 351
    aget-byte v1, p0, v1

    and-int/lit16 v1, v1, 0xff

    shl-int/lit8 v1, v1, 0x8

    const/4 v2, 0x3

    aget-byte p0, p0, v2

    and-int/lit16 p0, p0, 0xff

    or-int/2addr v1, p0

    invoke-static {v1}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object p0

    .line 352
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v0, ":"

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static decrement(Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    .line 1185
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 1186
    array-length v1, v0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    if-ltz v1, :cond_1

    .line 1187
    aget-byte v3, v0, v1

    if-nez v3, :cond_0

    const/4 v3, -0x1

    .line 1188
    aput-byte v3, v0, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    move v3, v2

    goto :goto_1

    :cond_1
    const/4 v3, 0x0

    .line 1192
    :goto_1
    const-string v4, "Decrementing %s would wrap."

    invoke-static {v3, v4, p0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 1194
    aget-byte p0, v0, v1

    sub-int/2addr p0, v2

    int-to-byte p0, p0

    aput-byte p0, v0, v1

    const/4 p0, 0x0

    .line 1195
    invoke-static {v0, p0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method

.method public static forString(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    .line 164
    new-instance v0, Lcom/google/common/net/InetAddresses$Scope;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/net/InetAddresses$Scope;-><init>(Lcom/google/common/net/InetAddresses$1;)V

    .line 165
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;Lcom/google/common/net/InetAddresses$Scope;)[B

    move-result-object v1

    if-eqz v1, :cond_0

    .line 172
    # getter for: Lcom/google/common/net/InetAddresses$Scope;->scope:Ljava/lang/String;
    invoke-static {v0}, Lcom/google/common/net/InetAddresses$Scope;->access$100(Lcom/google/common/net/InetAddresses$Scope;)Ljava/lang/String;

    move-result-object p0

    invoke-static {v1, p0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0

    .line 169
    :cond_0
    const-string v0, "\'%s\' is not an IP string literal."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/net/InetAddresses;->formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method public static forUriString(Ljava/lang/String;)Ljava/net/InetAddress;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hostAddr"
        }
    .end annotation

    const/4 v0, 0x1

    .line 614
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->forUriStringOrNull(Ljava/lang/String;Z)Ljava/net/InetAddress;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 616
    :cond_0
    const-string v0, "Not a valid URI IP literal: \'%s\'"

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/net/InetAddresses;->formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static forUriStringOrNull(Ljava/lang/String;Z)Ljava/net/InetAddress;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "hostAddr",
            "parseScope"
        }
    .end annotation

    .line 623
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 628
    const-string v0, "["

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "]"

    invoke-virtual {p0, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 629
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    const/4 v1, 0x1

    sub-int/2addr v0, v1

    invoke-virtual {p0, v1, v0}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    const/16 v0, 0x10

    goto :goto_0

    :cond_0
    const/4 v0, 0x4

    :goto_0
    const/4 v1, 0x0

    if-eqz p1, :cond_1

    .line 637
    new-instance p1, Lcom/google/common/net/InetAddresses$Scope;

    invoke-direct {p1, v1}, Lcom/google/common/net/InetAddresses$Scope;-><init>(Lcom/google/common/net/InetAddresses$1;)V

    goto :goto_1

    :cond_1
    move-object p1, v1

    .line 638
    :goto_1
    invoke-static {p0, p1}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;Lcom/google/common/net/InetAddresses$Scope;)[B

    move-result-object p0

    if-eqz p0, :cond_3

    .line 639
    array-length v2, p0

    if-ne v2, v0, :cond_3

    if-eqz p1, :cond_2

    .line 643
    # getter for: Lcom/google/common/net/InetAddresses$Scope;->scope:Ljava/lang/String;
    invoke-static {p1}, Lcom/google/common/net/InetAddresses$Scope;->access$100(Lcom/google/common/net/InetAddresses$Scope;)Ljava/lang/String;

    move-result-object v1

    :cond_2
    invoke-static {p0, v1}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0

    :cond_3
    return-object v1
.end method

.method private static varargs formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "format",
            "args"
        }
    .end annotation

    .line 1242
    new-instance v0, Ljava/lang/IllegalArgumentException;

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-static {v1, p0, p1}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    return-object v0
.end method

.method private static fromBigInteger(Ljava/math/BigInteger;Z)Ljava/net/InetAddress;
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "address",
            "isIpv6"
        }
    .end annotation

    .line 1126
    invoke-virtual {p0}, Ljava/math/BigInteger;->signum()I

    move-result v0

    const/4 v1, 0x0

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    move v0, v1

    :goto_0
    const-string v2, "BigInteger must be greater than or equal to 0"

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    if-eqz p1, :cond_1

    const/16 p1, 0x10

    goto :goto_1

    :cond_1
    const/4 p1, 0x4

    .line 1130
    :goto_1
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    move-result-object v0

    .line 1131
    new-array v2, p1, [B

    .line 1133
    array-length v3, v0

    sub-int/2addr v3, p1

    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 1134
    array-length v4, v0

    sub-int/2addr v4, v3

    sub-int v5, p1, v4

    :goto_2
    if-ge v1, v3, :cond_3

    .line 1139
    aget-byte v6, v0, v1

    if-nez v6, :cond_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_2

    .line 1143
    :cond_2
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    filled-new-array {p1, p0}, [Ljava/lang/Object;

    move-result-object p0

    .line 1140
    const-string p1, "BigInteger cannot be converted to InetAddress because it has more than %d bytes: %s"

    invoke-static {p1, p0}, Lcom/google/common/net/InetAddresses;->formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0

    .line 1148
    :cond_3
    invoke-static {v0, v3, v2, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 1151
    :try_start_0
    invoke-static {v2}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0
    :try_end_0
    .catch Ljava/net/UnknownHostException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    move-exception p0

    .line 1153
    new-instance p1, Ljava/lang/AssertionError;

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1
.end method

.method public static fromIPv4BigInteger(Ljava/math/BigInteger;)Ljava/net/Inet4Address;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    const/4 v0, 0x0

    .line 1100
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->fromBigInteger(Ljava/math/BigInteger;Z)Ljava/net/InetAddress;

    move-result-object p0

    check-cast p0, Ljava/net/Inet4Address;

    return-object p0
.end method

.method public static fromIPv6BigInteger(Ljava/math/BigInteger;)Ljava/net/Inet6Address;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    const/4 v0, 0x1

    .line 1112
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->fromBigInteger(Ljava/math/BigInteger;Z)Ljava/net/InetAddress;

    move-result-object p0

    check-cast p0, Ljava/net/Inet6Address;

    return-object p0
.end method

.method public static fromInteger(I)Ljava/net/Inet4Address;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    .line 1088
    invoke-static {p0}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0
.end method

.method public static fromLittleEndianByteArray([B)Ljava/net/InetAddress;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "addr"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    .line 1168
    array-length v0, p0

    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 1169
    :goto_0
    array-length v2, p0

    if-ge v1, v2, :cond_0

    .line 1170
    array-length v2, p0

    sub-int/2addr v2, v1

    add-int/lit8 v2, v2, -0x1

    aget-byte v2, p0, v2

    aput-byte v2, v0, v1

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1172
    :cond_0
    invoke-static {v0}, Ljava/net/InetAddress;->getByAddress([B)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method

.method public static get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 739
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not a 6to4 address."

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 741
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/4 v0, 0x2

    const/4 v1, 0x6

    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0
.end method

.method public static getCoercedIPv4Address(Ljava/net/InetAddress;)Ljava/net/Inet4Address;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 1003
    instance-of v0, p0, Ljava/net/Inet4Address;

    if-eqz v0, :cond_0

    .line 1004
    check-cast p0, Ljava/net/Inet4Address;

    return-object p0

    .line 1008
    :cond_0
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    const/16 v3, 0xf

    const/4 v4, 0x1

    if-ge v2, v3, :cond_2

    .line 1011
    aget-byte v5, v0, v2

    if-eqz v5, :cond_1

    move v2, v1

    goto :goto_1

    :cond_1
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    move v2, v4

    :goto_1
    if-eqz v2, :cond_4

    .line 1016
    aget-byte v0, v0, v3

    if-ne v0, v4, :cond_3

    .line 1017
    sget-object p0, Lcom/google/common/net/InetAddresses;->LOOPBACK4:Ljava/net/Inet4Address;

    return-object p0

    :cond_3
    if-nez v0, :cond_4

    .line 1019
    sget-object p0, Lcom/google/common/net/InetAddresses;->ANY4:Ljava/net/Inet4Address;

    return-object p0

    .line 1022
    :cond_4
    check-cast p0, Ljava/net/Inet6Address;

    .line 1024
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_5

    .line 1025
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/Inet4Address;->hashCode()I

    move-result p0

    int-to-long v0, p0

    goto :goto_2

    .line 1028
    :cond_5
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/16 v0, 0x8

    invoke-static {p0, v1, v0}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p0

    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->getLong()J

    move-result-wide v0

    .line 1032
    :goto_2
    invoke-static {}, Lcom/google/common/hash/Hashing;->murmur3_32_fixed()Lcom/google/common/hash/HashFunction;

    move-result-object p0

    invoke-interface {p0, v0, v1}, Lcom/google/common/hash/HashFunction;->hashLong(J)Lcom/google/common/hash/HashCode;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/hash/HashCode;->asInt()I

    move-result p0

    const/high16 v0, -0x20000000

    or-int/2addr p0, v0

    const/4 v0, -0x1

    if-ne p0, v0, :cond_6

    const/4 p0, -0x2

    .line 1043
    :cond_6
    invoke-static {p0}, Lcom/google/common/primitives/Ints;->toByteArray(I)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0
.end method

.method public static getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 709
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not IPv4-compatible."

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v2

    .line 708
    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 711
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/16 v0, 0xc

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0
.end method

.method public static getEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 924
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 925
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getCompatIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0

    .line 928
    :cond_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_1

    .line 929
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->get6to4IPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0

    .line 932
    :cond_1
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 933
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/net/InetAddresses$TeredoInfo;->getClient()Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0

    .line 936
    :cond_2
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string v0, "\'%s\' has no embedded IPv4 address."

    invoke-static {v0, p0}, Lcom/google/common/net/InetAddresses;->formatIllegalArgumentException(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/IllegalArgumentException;

    move-result-object p0

    throw p0
.end method

.method private static getInet4Address([B)Ljava/net/Inet4Address;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "bytes"
        }
    .end annotation

    .line 127
    array-length v0, p0

    const/4 v1, 0x4

    if-ne v0, v1, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v1, "Byte array has invalid length for an IPv4 address: %s != 4."

    array-length v2, p0

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;I)V

    const/4 v0, 0x0

    .line 133
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0

    check-cast p0, Ljava/net/Inet4Address;

    return-object p0
.end method

.method public static getIsatapIPv4Address(Ljava/net/Inet6Address;)Ljava/net/Inet4Address;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 890
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isIsatapAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not an ISATAP address."

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 892
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/16 v0, 0xc

    const/16 v1, 0x10

    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    return-object p0
.end method

.method public static getTeredoInfo(Ljava/net/Inet6Address;)Lcom/google/common/net/InetAddresses$TeredoInfo;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 829
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    const-string v1, "Address \'%s\' is not a Teredo address."

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object v2

    invoke-static {v0, v1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 831
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/4 v0, 0x4

    const/16 v1, 0x8

    .line 832
    invoke-static {p0, v0, v1}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object v0

    .line 834
    invoke-static {p0, v1}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v1

    invoke-interface {v1}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v1

    const v2, 0xffff

    and-int/2addr v1, v2

    const/16 v3, 0xa

    .line 837
    invoke-static {p0, v3}, Lcom/google/common/io/ByteStreams;->newDataInput([BI)Lcom/google/common/io/ByteArrayDataInput;

    move-result-object v3

    invoke-interface {v3}, Lcom/google/common/io/ByteArrayDataInput;->readShort()S

    move-result v3

    not-int v3, v3

    and-int/2addr v3, v2

    const/16 v2, 0xc

    const/16 v4, 0x10

    .line 839
    invoke-static {p0, v2, v4}, Ljava/util/Arrays;->copyOfRange([BII)[B

    move-result-object p0

    const/4 v2, 0x0

    .line 840
    :goto_0
    array-length v4, p0

    if-ge v2, v4, :cond_0

    .line 842
    aget-byte v4, p0, v2

    not-int v4, v4

    int-to-byte v4, v4

    aput-byte v4, p0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    .line 844
    :cond_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->getInet4Address([B)Ljava/net/Inet4Address;

    move-result-object p0

    .line 846
    new-instance v2, Lcom/google/common/net/InetAddresses$TeredoInfo;

    invoke-direct {v2, v0, p0, v3, v1}, Lcom/google/common/net/InetAddresses$TeredoInfo;-><init>(Ljava/net/Inet4Address;Ljava/net/Inet4Address;II)V

    return-object v2
.end method

.method public static hasEmbeddedIPv4ClientAddress(Ljava/net/Inet6Address;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 908
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isCompatIPv4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->is6to4Address(Ljava/net/Inet6Address;)Z

    move-result v0

    if-nez v0, :cond_0

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method private static hextetsToIPv6String([I)Ljava/lang/String;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "hextets"
        }
    .end annotation

    .line 547
    new-instance v0, Ljava/lang/StringBuilder;

    const/16 v1, 0x27

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(I)V

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    .line 549
    :goto_0
    array-length v4, p0

    if-ge v2, v4, :cond_5

    .line 550
    aget v4, p0, v2

    if-ltz v4, :cond_0

    const/4 v4, 0x1

    goto :goto_1

    :cond_0
    move v4, v1

    :goto_1
    if-eqz v4, :cond_2

    if-eqz v3, :cond_1

    const/16 v3, 0x3a

    .line 553
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 555
    :cond_1
    aget v3, p0, v2

    invoke-static {v3}, Ljava/lang/Integer;->toHexString(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_2

    :cond_2
    if-eqz v2, :cond_3

    if-eqz v3, :cond_4

    .line 558
    :cond_3
    const-string v3, "::"

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    :cond_4
    :goto_2
    add-int/lit8 v2, v2, 0x1

    move v3, v4

    goto :goto_0

    .line 563
    :cond_5
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static increment(Ljava/net/InetAddress;)Ljava/net/InetAddress;
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    .line 1208
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    .line 1209
    array-length v1, v0

    const/4 v2, 0x1

    sub-int/2addr v1, v2

    :goto_0
    const/4 v3, 0x0

    if-ltz v1, :cond_1

    .line 1210
    aget-byte v4, v0, v1

    const/4 v5, -0x1

    if-ne v4, v5, :cond_0

    .line 1211
    aput-byte v3, v0, v1

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 1215
    :cond_1
    const-string v4, "Incrementing %s would wrap."

    invoke-static {v3, v4, p0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 1217
    aget-byte p0, v0, v1

    add-int/2addr p0, v2

    int-to-byte p0, p0

    aput-byte p0, v0, v1

    const/4 p0, 0x0

    .line 1218
    invoke-static {v0, p0}, Lcom/google/common/net/InetAddresses;->bytesToInetAddress([BLjava/lang/String;)Ljava/net/InetAddress;

    move-result-object p0

    return-object p0
.end method

.method private static ipStringToBytes(Ljava/lang/String;Lcom/google/common/net/InetAddresses$Scope;)[B
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "ipStringParam",
            "scope"
        }
    .end annotation

    const/4 v0, 0x0

    move v1, v0

    move v2, v1

    move v3, v2

    .line 206
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, -0x1

    if-ge v1, v4, :cond_4

    .line 207
    invoke-virtual {p0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v4

    const/16 v7, 0x2e

    const/4 v8, 0x1

    if-ne v4, v7, :cond_0

    move v2, v8

    goto :goto_1

    :cond_0
    const/16 v7, 0x3a

    if-ne v4, v7, :cond_2

    if-eqz v2, :cond_1

    return-object v5

    :cond_1
    move v3, v8

    goto :goto_1

    :cond_2
    const/16 v7, 0x25

    if-eq v4, v7, :cond_5

    const/16 v7, 0x10

    .line 218
    invoke-static {v4, v7}, Ljava/lang/Character;->digit(CI)I

    move-result v4

    if-ne v4, v6, :cond_3

    return-object v5

    :cond_3
    :goto_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    move v1, v6

    :cond_5
    if-eqz v3, :cond_9

    if-eqz v2, :cond_6

    .line 226
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->convertDottedQuadToHex(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_6

    return-object v5

    :cond_6
    if-eq v1, v6, :cond_8

    if-eqz p1, :cond_7

    add-int/lit8 v2, v1, 0x1

    .line 233
    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    # setter for: Lcom/google/common/net/InetAddresses$Scope;->scope:Ljava/lang/String;
    invoke-static {p1, v2}, Lcom/google/common/net/InetAddresses$Scope;->access$102(Lcom/google/common/net/InetAddresses$Scope;Ljava/lang/String;)Ljava/lang/String;

    .line 235
    :cond_7
    invoke-virtual {p0, v0, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object p0

    .line 237
    :cond_8
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV6(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0

    :cond_9
    if-eqz v2, :cond_b

    if-eq v1, v6, :cond_a

    return-object v5

    .line 242
    :cond_a
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->textToNumericFormatV4(Ljava/lang/String;)[B

    move-result-object p0

    return-object p0

    :cond_b
    return-object v5
.end method

.method public static is6to4Address(Ljava/net/Inet6Address;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 727
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/4 v0, 0x0

    .line 728
    aget-byte v1, p0, v0

    const/16 v2, 0x20

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    aget-byte p0, p0, v1

    const/4 v2, 0x2

    if-ne p0, v2, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method public static isCompatIPv4Address(Ljava/net/Inet6Address;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 685
    invoke-virtual {p0}, Ljava/net/Inet6Address;->isIPv4CompatibleAddress()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 689
    :cond_0
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/16 v0, 0xc

    .line 690
    aget-byte v0, p0, v0

    const/4 v2, 0x1

    if-nez v0, :cond_2

    const/16 v0, 0xd

    aget-byte v0, p0, v0

    if-nez v0, :cond_2

    const/16 v0, 0xe

    aget-byte v0, p0, v0

    if-nez v0, :cond_2

    const/16 v0, 0xf

    aget-byte p0, p0, v0

    if-eqz p0, :cond_1

    if-ne p0, v2, :cond_2

    :cond_1
    return v1

    :cond_2
    return v2
.end method

.method public static isInetAddress(Ljava/lang/String;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    const/4 v0, 0x0

    .line 192
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;Lcom/google/common/net/InetAddresses$Scope;)[B

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public static isIsatapAddress(Ljava/net/Inet6Address;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 866
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->isTeredoAddress(Ljava/net/Inet6Address;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    return v1

    .line 870
    :cond_0
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/16 v0, 0x8

    .line 872
    aget-byte v0, p0, v0

    const/4 v2, 0x3

    or-int/2addr v0, v2

    if-eq v0, v2, :cond_1

    return v1

    :cond_1
    const/16 v0, 0x9

    .line 879
    aget-byte v0, p0, v0

    if-nez v0, :cond_2

    const/16 v0, 0xa

    aget-byte v0, p0, v0

    const/16 v2, 0x5e

    if-ne v0, v2, :cond_2

    const/16 v0, 0xb

    aget-byte p0, p0, v0

    const/4 v0, -0x2

    if-ne p0, v0, :cond_2

    const/4 p0, 0x1

    return p0

    :cond_2
    return v1
.end method

.method public static isMappedIPv4Address(Ljava/lang/String;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    const/4 v0, 0x0

    .line 962
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->ipStringToBytes(Ljava/lang/String;Lcom/google/common/net/InetAddresses$Scope;)[B

    move-result-object p0

    const/4 v0, 0x0

    if-eqz p0, :cond_4

    .line 963
    array-length v1, p0

    const/16 v2, 0x10

    if-ne v1, v2, :cond_4

    move v1, v0

    :goto_0
    const/16 v2, 0xa

    if-ge v1, v2, :cond_1

    .line 965
    aget-byte v2, p0, v1

    if-eqz v2, :cond_0

    return v0

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    :goto_1
    const/16 v1, 0xc

    if-ge v2, v1, :cond_3

    .line 970
    aget-byte v1, p0, v2

    const/4 v3, -0x1

    if-eq v1, v3, :cond_2

    return v0

    :cond_2
    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_3
    const/4 p0, 0x1

    return p0

    :cond_4
    return v0
.end method

.method public static isMaximum(Ljava/net/InetAddress;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    .line 1230
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object p0

    .line 1231
    array-length v0, p0

    const/4 v1, 0x0

    move v2, v1

    :goto_0
    if-ge v2, v0, :cond_1

    aget-byte v3, p0, v2

    const/4 v4, -0x1

    if-eq v3, v4, :cond_0

    return v1

    :cond_0
    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x1

    return p0
.end method

.method public static isTeredoAddress(Ljava/net/Inet6Address;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 814
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getAddress()[B

    move-result-object p0

    const/4 v0, 0x0

    .line 815
    aget-byte v1, p0, v0

    const/16 v2, 0x20

    if-ne v1, v2, :cond_0

    const/4 v1, 0x1

    aget-byte v2, p0, v1

    if-ne v2, v1, :cond_0

    const/4 v2, 0x2

    aget-byte v2, p0, v2

    if-nez v2, :cond_0

    const/4 v2, 0x3

    aget-byte p0, p0, v2

    if-nez p0, :cond_0

    return v1

    :cond_0
    return v0
.end method

.method public static isUriInetAddress(Ljava/lang/String;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    const/4 v0, 0x0

    .line 663
    invoke-static {p0, v0}, Lcom/google/common/net/InetAddresses;->forUriStringOrNull(Ljava/lang/String;Z)Ljava/net/InetAddress;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v0
.end method

.method private static parseHextet(Ljava/lang/String;II)S
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "ipString",
            "start",
            "end"
        }
    .end annotation

    sub-int v0, p2, p1

    if-lez v0, :cond_1

    const/4 v1, 0x4

    if-gt v0, v1, :cond_1

    const/4 v0, 0x0

    :goto_0
    if-ge p1, p2, :cond_0

    shl-int/lit8 v0, v0, 0x4

    .line 409
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0x10

    invoke-static {v1, v2}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    or-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_0
    int-to-short p0, v0

    return p0

    .line 404
    :cond_1
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0
.end method

.method private static parseOctet(Ljava/lang/String;II)B
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "ipString",
            "start",
            "end"
        }
    .end annotation

    sub-int v0, p2, p1

    if-lez v0, :cond_4

    const/4 v1, 0x3

    if-gt v0, v1, :cond_4

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 364
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v0

    const/16 v1, 0x30

    if-ne v0, v1, :cond_0

    .line 365
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    if-ge p1, p2, :cond_2

    mul-int/lit8 v0, v0, 0xa

    .line 370
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v1

    const/16 v2, 0xa

    invoke-static {v1, v2}, Ljava/lang/Character;->digit(CI)I

    move-result v1

    if-ltz v1, :cond_1

    add-int/2addr v0, v1

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    .line 372
    :cond_1
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    :cond_2
    const/16 p0, 0xff

    if-gt v0, p0, :cond_3

    int-to-byte p0, v0

    return p0

    .line 377
    :cond_3
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0

    .line 360
    :cond_4
    new-instance p0, Ljava/lang/NumberFormatException;

    invoke-direct {p0}, Ljava/lang/NumberFormatException;-><init>()V

    throw p0
.end method

.method private static scopeWithDelimiter(Ljava/net/Inet6Address;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 492
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getScopedInterface()Ljava/net/NetworkInterface;

    move-result-object v0

    .line 493
    const-string v1, "%"

    if-eqz v0, :cond_0

    .line 494
    new-instance p0, Ljava/lang/StringBuilder;

    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/net/NetworkInterface;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 496
    :cond_0
    invoke-virtual {p0}, Ljava/net/Inet6Address;->getScopeId()I

    move-result p0

    if-eqz p0, :cond_1

    .line 498
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 500
    :cond_1
    const-string p0, ""

    return-object p0
.end method

.method private static textToNumericFormatV4(Ljava/lang/String;)[B
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    .line 248
    sget-object v0, Lcom/google/common/net/InetAddresses;->IPV4_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->countIn(Ljava/lang/CharSequence;)I

    move-result v0

    add-int/lit8 v0, v0, 0x1

    const/4 v1, 0x0

    const/4 v2, 0x4

    if-eq v0, v2, :cond_0

    return-object v1

    .line 252
    :cond_0
    new-array v0, v2, [B

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v3, v2, :cond_2

    const/16 v5, 0x2e

    .line 257
    invoke-virtual {p0, v5, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_1

    .line 259
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    .line 262
    :cond_1
    :try_start_0
    invoke-static {p0, v4, v5}, Lcom/google/common/net/InetAddresses;->parseOctet(Ljava/lang/String;II)B

    move-result v4

    aput-byte v4, v0, v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    add-int/lit8 v4, v5, 0x1

    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    :catch_0
    return-object v1

    :cond_2
    return-object v0
.end method

.method private static textToNumericFormatV6(Ljava/lang/String;)[B
    .registers 12
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ipString"
        }
    .end annotation

    .line 274
    sget-object v0, Lcom/google/common/net/InetAddresses;->IPV6_DELIMITER_MATCHER:Lcom/google/common/base/CharMatcher;

    invoke-virtual {v0, p0}, Lcom/google/common/base/CharMatcher;->countIn(Ljava/lang/CharSequence;)I

    move-result v0

    const/4 v1, 0x0

    const/4 v2, 0x2

    if-lt v0, v2, :cond_e

    const/16 v3, 0x8

    if-gt v0, v3, :cond_e

    const/4 v4, 0x1

    add-int/2addr v0, v4

    rsub-int/lit8 v5, v0, 0x8

    const/4 v6, 0x0

    move v7, v6

    move v8, v7

    .line 282
    :goto_0
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v9

    sub-int/2addr v9, v4

    const/16 v10, 0x3a

    if-ge v7, v9, :cond_4

    .line 283
    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v10, :cond_3

    add-int/lit8 v9, v7, 0x1

    invoke-virtual {p0, v9}, Ljava/lang/String;->charAt(I)C

    move-result v9

    if-ne v9, v10, :cond_3

    if-eqz v8, :cond_0

    return-object v1

    :cond_0
    add-int/lit8 v8, v5, 0x1

    if-nez v7, :cond_1

    add-int/lit8 v8, v5, 0x2

    .line 292
    :cond_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v5

    sub-int/2addr v5, v2

    if-ne v7, v5, :cond_2

    add-int/lit8 v8, v8, 0x1

    :cond_2
    move v5, v8

    move v8, v4

    :cond_3
    add-int/lit8 v7, v7, 0x1

    goto :goto_0

    .line 297
    :cond_4
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v10, :cond_5

    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-eq v7, v10, :cond_5

    return-object v1

    .line 300
    :cond_5
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v4

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v7

    if-ne v7, v10, :cond_6

    .line 301
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v7

    sub-int/2addr v7, v2

    invoke-virtual {p0, v7}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v10, :cond_6

    return-object v1

    :cond_6
    if-eqz v8, :cond_7

    if-gtz v5, :cond_8

    return-object v1

    :cond_7
    if-eq v0, v3, :cond_8

    return-object v1

    :cond_8
    const/16 v0, 0x10

    .line 311
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    move-result-object v0

    .line 317
    :try_start_0
    invoke-virtual {p0, v6}, Ljava/lang/String;->charAt(I)C

    move-result v2

    if-eq v2, v10, :cond_9

    move v4, v6

    .line 320
    :cond_9
    :goto_1
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v4, v2, :cond_d

    .line 321
    invoke-virtual {p0, v10, v4}, Ljava/lang/String;->indexOf(II)I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_a

    .line 323
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v2

    .line 325
    :cond_a
    invoke-virtual {p0, v4}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-ne v3, v10, :cond_b

    move v3, v6

    :goto_2
    if-ge v3, v5, :cond_c

    .line 328
    invoke-virtual {v0, v6}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;

    add-int/lit8 v3, v3, 0x1

    goto :goto_2

    .line 332
    :cond_b
    invoke-static {p0, v4, v2}, Lcom/google/common/net/InetAddresses;->parseHextet(Ljava/lang/String;II)S

    move-result v3

    invoke-virtual {v0, v3}, Ljava/nio/ByteBuffer;->putShort(S)Ljava/nio/ByteBuffer;
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    :cond_c
    add-int/lit8 v4, v2, 0x1

    goto :goto_1

    .line 339
    :cond_d
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->array()[B

    move-result-object p0

    return-object p0

    :catch_0
    :cond_e
    return-object v1
.end method

.method public static toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 472
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 473
    instance-of v0, p0, Ljava/net/Inet4Address;

    if-eqz v0, :cond_0

    .line 476
    invoke-virtual {p0}, Ljava/net/InetAddress;->getHostAddress()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    .line 478
    :cond_0
    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object v0

    const/16 v1, 0x8

    .line 479
    new-array v2, v1, [I

    const/4 v3, 0x0

    move v4, v3

    :goto_0
    if-ge v4, v1, :cond_1

    shl-int/lit8 v5, v4, 0x1

    .line 481
    aget-byte v6, v0, v5

    add-int/lit8 v5, v5, 0x1

    aget-byte v5, v0, v5

    invoke-static {v3, v3, v6, v5}, Lcom/google/common/primitives/Ints;->fromBytes(BBBB)I

    move-result v5

    aput v5, v2, v4

    add-int/lit8 v4, v4, 0x1

    goto :goto_0

    .line 483
    :cond_1
    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->compressLongestRunOfZeroes([I)V

    .line 485
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-static {v2}, Lcom/google/common/net/InetAddresses;->hextetsToIPv6String([I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    check-cast p0, Ljava/net/Inet6Address;

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->scopeWithDelimiter(Ljava/net/Inet6Address;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static toBigInteger(Ljava/net/InetAddress;)Ljava/math/BigInteger;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "address"
        }
    .end annotation

    .line 1078
    new-instance v0, Ljava/math/BigInteger;

    const/4 v1, 0x1

    invoke-virtual {p0}, Ljava/net/InetAddress;->getAddress()[B

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/math/BigInteger;-><init>(I[B)V

    return-object v0
.end method

.method public static toUriString(Ljava/net/InetAddress;)Ljava/lang/String;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "ip"
        }
    .end annotation

    .line 586
    instance-of v0, p0, Ljava/net/Inet6Address;

    if-eqz v0, :cond_0

    .line 587
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "["

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "]"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    .line 589
    :cond_0
    invoke-static {p0}, Lcom/google/common/net/InetAddresses;->toAddrString(Ljava/net/InetAddress;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static tryParseDecimal(Ljava/lang/String;II)I
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "string",
            "start",
            "end"
        }
    .end annotation

    const-wide/16 v0, 0x0

    :goto_0
    const-wide/32 v2, 0x7fffffff

    const/4 v4, -0x1

    if-ge p1, p2, :cond_2

    cmp-long v2, v0, v2

    if-lez v2, :cond_0

    return v4

    :cond_0
    const-wide/16 v2, 0xa

    mul-long/2addr v0, v2

    .line 390
    invoke-virtual {p0, p1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0xa

    invoke-static {v2, v3}, Ljava/lang/Character;->digit(CI)I

    move-result v2

    if-gez v2, :cond_1

    return v4

    :cond_1
    int-to-long v2, v2

    add-long/2addr v0, v2

    add-int/lit8 p1, p1, 0x1

    goto :goto_0

    :cond_2
    cmp-long p0, v0, v2

    if-lez p0, :cond_3

    return v4

    :cond_3
    long-to-int p0, v0

    return p0
.end method
