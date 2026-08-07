.class public abstract Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final DOS_TIME_MIN:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-wide/16 v0, 0x2100

    .line 2
    .line 3
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    .line 8
    .line 9
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static adjustToLong(I)J
    .locals 4

    int-to-long v0, p0

    if-gez p0, :cond_0

    const-wide v2, 0x100000000L

    add-long/2addr v0, v2

    :cond_0
    return-wide v0
.end method

.method public static bigToLong(Ljava/math/BigInteger;)J
    .locals 3

    .line 1
    invoke-virtual {p0}, Ljava/math/BigInteger;->bitLength()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/16 v1, 0x3f

    .line 6
    .line 7
    if-gt v0, v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/math/BigInteger;->longValue()J

    .line 10
    .line 11
    .line 12
    move-result-wide v0

    .line 13
    return-wide v0

    .line 14
    :cond_0
    new-instance v0, Ljava/lang/NumberFormatException;

    .line 15
    .line 16
    new-instance v1, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v2, "The BigInteger cannot fit inside a 64 bit java long: ["

    .line 19
    .line 20
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string p0, "]"

    .line 27
    .line 28
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-direct {v0, p0}, Ljava/lang/NumberFormatException;-><init>(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    throw v0
.end method

.method public static canHandleEntryData(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 1

    .line 1
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public static checkRequestedFeatures(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V
    .locals 2

    .line 1
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->supportsEncryptionOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_2

    .line 6
    .line 7
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->supportsMethodOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getMethodByCode(I)Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 24
    .line 25
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->METHOD:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 26
    .line 27
    invoke-direct {v0, v1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 28
    .line 29
    .line 30
    throw v0

    .line 31
    :cond_0
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 32
    .line 33
    invoke-direct {v1, v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 34
    .line 35
    .line 36
    throw v1

    .line 37
    :cond_1
    return-void

    .line 38
    :cond_2
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;

    .line 39
    .line 40
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;->ENCRYPTION:Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;

    .line 41
    .line 42
    invoke-direct {v0, v1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/UnsupportedZipFeatureException$Feature;Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public static copy([B[BI)V
    .locals 2

    if-eqz p0, :cond_0

    .line 11
    array-length v0, p0

    const/4 v1, 0x0

    invoke-static {p0, v1, p1, p2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    :cond_0
    return-void
.end method

.method public static copy([B)[B
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public static dosToJavaTime(J)J
    .locals 7

    .line 1
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/16 v1, 0x19

    .line 6
    .line 7
    shr-long v1, p0, v1

    .line 8
    .line 9
    const-wide/16 v3, 0x7f

    .line 10
    .line 11
    and-long/2addr v1, v3

    .line 12
    long-to-int v1, v1

    .line 13
    add-int/lit16 v1, v1, 0x7bc

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    invoke-virtual {v0, v2, v1}, Ljava/util/Calendar;->set(II)V

    .line 17
    .line 18
    .line 19
    const/16 v1, 0x15

    .line 20
    .line 21
    shr-long v3, p0, v1

    .line 22
    .line 23
    const-wide/16 v5, 0xf

    .line 24
    .line 25
    and-long/2addr v3, v5

    .line 26
    long-to-int v1, v3

    .line 27
    sub-int/2addr v1, v2

    .line 28
    const/4 v3, 0x2

    .line 29
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 30
    .line 31
    .line 32
    const/16 v1, 0x10

    .line 33
    .line 34
    shr-long v3, p0, v1

    .line 35
    .line 36
    long-to-int v1, v3

    .line 37
    and-int/lit8 v1, v1, 0x1f

    .line 38
    .line 39
    const/4 v3, 0x5

    .line 40
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 41
    .line 42
    .line 43
    const/16 v1, 0xb

    .line 44
    .line 45
    shr-long v4, p0, v1

    .line 46
    .line 47
    long-to-int v4, v4

    .line 48
    and-int/lit8 v4, v4, 0x1f

    .line 49
    .line 50
    invoke-virtual {v0, v1, v4}, Ljava/util/Calendar;->set(II)V

    .line 51
    .line 52
    .line 53
    shr-long v3, p0, v3

    .line 54
    .line 55
    long-to-int v1, v3

    .line 56
    and-int/lit8 v1, v1, 0x3f

    .line 57
    .line 58
    const/16 v3, 0xc

    .line 59
    .line 60
    invoke-virtual {v0, v3, v1}, Ljava/util/Calendar;->set(II)V

    .line 61
    .line 62
    .line 63
    shl-long/2addr p0, v2

    .line 64
    long-to-int p0, p0

    .line 65
    and-int/lit8 p0, p0, 0x3e

    .line 66
    .line 67
    const/16 p1, 0xd

    .line 68
    .line 69
    invoke-virtual {v0, p1, p0}, Ljava/util/Calendar;->set(II)V

    .line 70
    .line 71
    .line 72
    const/16 p0, 0xe

    .line 73
    .line 74
    const/4 p1, 0x0

    .line 75
    invoke-virtual {v0, p0, p1}, Ljava/util/Calendar;->set(II)V

    .line 76
    .line 77
    .line 78
    invoke-virtual {v0}, Ljava/util/Calendar;->getTime()Ljava/util/Date;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 83
    .line 84
    .line 85
    move-result-wide p0

    .line 86
    return-wide p0
.end method

.method public static fromDosTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)Ljava/util/Date;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    new-instance p0, Ljava/util/Date;

    .line 6
    .line 7
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->dosToJavaTime(J)J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 12
    .line 13
    .line 14
    return-object p0
.end method

.method private static getUnicodeStringIfOriginalMatches(Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;
    .locals 5

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p0, :cond_0

    .line 3
    .line 4
    new-instance v1, Ljava/util/zip/CRC32;

    .line 5
    .line 6
    invoke-direct {v1}, Ljava/util/zip/CRC32;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v1, p1}, Ljava/util/zip/CRC32;->update([B)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/zip/CRC32;->getValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->getNameCRC32()J

    .line 17
    .line 18
    .line 19
    move-result-wide v3

    .line 20
    cmp-long p1, v1, v3

    .line 21
    .line 22
    if-nez p1, :cond_0

    .line 23
    .line 24
    :try_start_0
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncodingHelper;->UTF8_ZIP_ENCODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;

    .line 25
    .line 26
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->getUnicodeName()[B

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-interface {p1, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEncoding;->decode([B)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 34
    return-object p0

    .line 35
    :catch_0
    :cond_0
    return-object v0
.end method

.method public static longToBig(J)Ljava/math/BigInteger;
    .locals 3

    .line 1
    const-wide/32 v0, -0x80000000

    .line 2
    .line 3
    .line 4
    cmp-long v0, p0, v0

    .line 5
    .line 6
    if-ltz v0, :cond_1

    .line 7
    .line 8
    const-wide/16 v1, 0x0

    .line 9
    .line 10
    cmp-long v1, p0, v1

    .line 11
    .line 12
    if-gez v1, :cond_0

    .line 13
    .line 14
    if-ltz v0, :cond_0

    .line 15
    .line 16
    long-to-int p0, p0

    .line 17
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->adjustToLong(I)J

    .line 18
    .line 19
    .line 20
    move-result-wide p0

    .line 21
    :cond_0
    invoke-static {p0, p1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0

    .line 26
    :cond_1
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 27
    .line 28
    new-instance v1, Ljava/lang/StringBuilder;

    .line 29
    .line 30
    const-string v2, "Negative longs < -2^31 not permitted: ["

    .line 31
    .line 32
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v1, p0, p1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    const-string p0, "]"

    .line 39
    .line 40
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-direct {v0, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    throw v0
.end method

.method public static reverse([B)[B
    .locals 5

    .line 1
    array-length v0, p0

    .line 2
    add-int/lit8 v0, v0, -0x1

    .line 3
    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    array-length v2, p0

    .line 6
    div-int/lit8 v2, v2, 0x2

    .line 7
    .line 8
    if-ge v1, v2, :cond_0

    .line 9
    .line 10
    aget-byte v2, p0, v1

    .line 11
    .line 12
    sub-int v3, v0, v1

    .line 13
    .line 14
    aget-byte v4, p0, v3

    .line 15
    .line 16
    aput-byte v4, p0, v1

    .line 17
    .line 18
    aput-byte v2, p0, v3

    .line 19
    .line 20
    add-int/lit8 v1, v1, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    return-object p0
.end method

.method public static setNameAndCommentFromExtraFields(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;[B[B)V
    .locals 3

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;->UPATH_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    instance-of v1, v0, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_0

    .line 11
    .line 12
    check-cast v0, Lorg/apache/commons/sudcompress/archivers/zip/UnicodePathExtraField;

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    move-object v0, v2

    .line 16
    :goto_0
    invoke-static {v0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    if-eqz p1, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setName(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;->UNICODE_EXTRA_FIELD:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setNameSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$NameSource;)V

    .line 28
    .line 29
    .line 30
    :cond_1
    if-eqz p2, :cond_3

    .line 31
    .line 32
    array-length p1, p2

    .line 33
    if-lez p1, :cond_3

    .line 34
    .line 35
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;->UCOM_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 36
    .line 37
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getExtraField(Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;)Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;

    .line 42
    .line 43
    if-eqz v0, :cond_2

    .line 44
    .line 45
    move-object v2, p1

    .line 46
    check-cast v2, Lorg/apache/commons/sudcompress/archivers/zip/UnicodeCommentExtraField;

    .line 47
    .line 48
    :cond_2
    invoke-static {v2, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->getUnicodeStringIfOriginalMatches(Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;[B)Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    if-eqz p1, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Ljava/util/zip/ZipEntry;->setComment(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;->UNICODE_EXTRA_FIELD:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setCommentSource(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry$CommentSource;)V

    .line 60
    .line 61
    .line 62
    :cond_3
    return-void
.end method

.method public static signedByteToUnsignedInt(B)I
    .locals 0

    if-ltz p0, :cond_0

    return p0

    :cond_0
    add-int/lit16 p0, p0, 0x100

    return p0
.end method

.method private static supportsEncryptionOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getGeneralPurposeBit()Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/GeneralPurposeBit;->usesEncryption()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    xor-int/lit8 p0, p0, 0x1

    .line 10
    .line 11
    return p0
.end method

.method private static supportsMethodOf(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;)Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->UNSHRINKING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eq v0, v1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->IMPLODING:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 24
    .line 25
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    if-eq v0, v1, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/16 v1, 0x8

    .line 36
    .line 37
    if-eq v0, v1, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->ENHANCED_DEFLATED:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 44
    .line 45
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 46
    .line 47
    .line 48
    move-result v1

    .line 49
    if-eq v0, v1, :cond_1

    .line 50
    .line 51
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->getMethod()I

    .line 52
    .line 53
    .line 54
    move-result p0

    .line 55
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->BZIP2:Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;

    .line 56
    .line 57
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipMethod;->getCode()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-ne p0, v0, :cond_0

    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    const/4 p0, 0x0

    .line 65
    return p0

    .line 66
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 67
    return p0
.end method

.method public static toDosTime(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 3

    .line 73
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    move-result-wide v1

    invoke-static {v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->toDosTime(J)[B

    move-result-object p0

    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([B)V

    return-object v0
.end method

.method public static toDosTime(J[BI)V
    .locals 1

    .line 72
    invoke-static {}, Ljava/util/Calendar;->getInstance()Ljava/util/Calendar;

    move-result-object v0

    invoke-static {v0, p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->toDosTime(Ljava/util/Calendar;J[BI)V

    return-void
.end method

.method public static toDosTime(Ljava/util/Calendar;J[BI)V
    .locals 3

    .line 1
    invoke-virtual {p0, p1, p2}, Ljava/util/Calendar;->setTimeInMillis(J)V

    .line 2
    .line 3
    .line 4
    const/4 p1, 0x1

    .line 5
    invoke-virtual {p0, p1}, Ljava/util/Calendar;->get(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/16 v0, 0x7bc

    .line 10
    .line 11
    if-ge p2, v0, :cond_0

    .line 12
    .line 13
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->DOS_TIME_MIN:[B

    .line 14
    .line 15
    invoke-static {p0, p3, p4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->copy([B[BI)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    const/4 v1, 0x2

    .line 20
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    add-int/2addr v1, p1

    .line 25
    sub-int/2addr p2, v0

    .line 26
    shl-int/lit8 p2, p2, 0x19

    .line 27
    .line 28
    shl-int/lit8 v0, v1, 0x15

    .line 29
    .line 30
    or-int/2addr p2, v0

    .line 31
    const/4 v0, 0x5

    .line 32
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    shl-int/lit8 v1, v1, 0x10

    .line 37
    .line 38
    or-int/2addr p2, v1

    .line 39
    const/16 v1, 0xb

    .line 40
    .line 41
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    shl-int/lit8 v1, v2, 0xb

    .line 46
    .line 47
    or-int/2addr p2, v1

    .line 48
    const/16 v1, 0xc

    .line 49
    .line 50
    invoke-virtual {p0, v1}, Ljava/util/Calendar;->get(I)I

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    shl-int/lit8 v0, v1, 0x5

    .line 55
    .line 56
    or-int/2addr p2, v0

    .line 57
    const/16 v0, 0xd

    .line 58
    .line 59
    invoke-virtual {p0, v0}, Ljava/util/Calendar;->get(I)I

    .line 60
    .line 61
    .line 62
    move-result p0

    .line 63
    shr-int/2addr p0, p1

    .line 64
    or-int/2addr p0, p2

    .line 65
    int-to-long p0, p0

    .line 66
    invoke-static {p0, p1, p3, p4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->putLong(J[BI)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public static toDosTime(J)[B
    .locals 2

    const/4 v0, 0x4

    .line 70
    new-array v0, v0, [B

    const/4 v1, 0x0

    .line 71
    invoke-static {p0, p1, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->toDosTime(J[BI)V

    return-object v0
.end method

.method public static unsignedIntToSignedByte(I)B
    .locals 2

    .line 1
    const/16 v0, 0xff

    .line 2
    .line 3
    if-gt p0, v0, :cond_1

    .line 4
    .line 5
    if-ltz p0, :cond_1

    .line 6
    .line 7
    const/16 v0, 0x80

    .line 8
    .line 9
    if-ge p0, v0, :cond_0

    .line 10
    .line 11
    int-to-byte p0, p0

    .line 12
    return p0

    .line 13
    :cond_0
    add-int/lit16 p0, p0, -0x100

    .line 14
    .line 15
    int-to-byte p0, p0

    .line 16
    return p0

    .line 17
    :cond_1
    const-string v0, "Can only convert non-negative integers between [0,255] to byte: ["

    .line 18
    .line 19
    const-string v1, "]"

    .line 20
    .line 21
    invoke-static {v0, p0, v1}, Ll/i2r0;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    const/4 p0, 0x0

    .line 25
    return p0
.end method
