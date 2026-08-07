.class public Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field private static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final ONE_THOUSAND:Ljava/math/BigInteger;

.field private static final ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private gid:Ljava/math/BigInteger;

.field private uid:Ljava/math/BigInteger;

.field private version:I


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0x7875

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 17
    .line 18
    const-wide/16 v0, 0x3e8

    .line 19
    .line 20
    invoke-static {v0, v1}, Ljava/math/BigInteger;->valueOf(J)Ljava/math/BigInteger;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->ONE_THOUSAND:Ljava/math/BigInteger;

    .line 25
    .line 26
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 6
    .line 7
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->reset()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method private reset()V
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->ONE_THOUSAND:Ljava/math/BigInteger;

    .line 2
    .line 3
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 4
    .line 5
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 6
    .line 7
    return-void
.end method

.method public static trimLeadingZeroesForceMinLength([B)[B
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    return-object p0

    .line 4
    :cond_0
    array-length v0, p0

    .line 5
    const/4 v1, 0x0

    .line 6
    move v2, v1

    .line 7
    :goto_0
    if-ge v1, v0, :cond_1

    .line 8
    .line 9
    aget-byte v3, p0, v1

    .line 10
    .line 11
    if-nez v3, :cond_1

    .line 12
    .line 13
    add-int/lit8 v2, v2, 0x1

    .line 14
    .line 15
    add-int/lit8 v1, v1, 0x1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    array-length v0, p0

    .line 19
    sub-int/2addr v0, v2

    .line 20
    const/4 v1, 0x1

    .line 21
    invoke-static {v1, v0}, Ljava/lang/Math;->max(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    new-array v1, v0, [B

    .line 26
    .line 27
    array-length v3, p0

    .line 28
    sub-int/2addr v3, v2

    .line 29
    sub-int v3, v0, v3

    .line 30
    .line 31
    sub-int/2addr v0, v3

    .line 32
    invoke-static {p0, v2, v1, v3, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 33
    .line 34
    .line 35
    return-object v1
.end method


# virtual methods
.method public clone()Ljava/lang/Object;
    .locals 0

    .line 1
    invoke-super {p0}, Ljava/lang/Object;->clone()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;

    .line 7
    .line 8
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 9
    .line 10
    iget v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 11
    .line 12
    if-ne v0, v2, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 15
    .line 16
    iget-object v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 17
    .line 18
    invoke-virtual {v0, v2}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 25
    .line 26
    iget-object p1, p1, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ljava/math/BigInteger;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_0

    .line 33
    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :cond_0
    return v1
.end method

.method public getCentralDirectoryData()[B
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    new-array p0, p0, [B

    .line 3
    .line 4
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getGID()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->bigToLong(Ljava/math/BigInteger;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 8

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/math/BigInteger;->toByteArray()[B

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->trimLeadingZeroesForceMinLength([B)[B

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const/4 v2, 0x0

    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    array-length v3, v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    move v3, v2

    .line 23
    :goto_0
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->trimLeadingZeroesForceMinLength([B)[B

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    array-length v4, v1

    .line 30
    goto :goto_1

    .line 31
    :cond_1
    move v4, v2

    .line 32
    :goto_1
    add-int/lit8 v5, v3, 0x3

    .line 33
    .line 34
    add-int v6, v5, v4

    .line 35
    .line 36
    new-array v6, v6, [B

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->reverse([B)[B

    .line 41
    .line 42
    .line 43
    :cond_2
    if-eqz v1, :cond_3

    .line 44
    .line 45
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->reverse([B)[B

    .line 46
    .line 47
    .line 48
    :cond_3
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 49
    .line 50
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->unsignedIntToSignedByte(I)B

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    aput-byte p0, v6, v2

    .line 55
    .line 56
    invoke-static {v3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->unsignedIntToSignedByte(I)B

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    const/4 v7, 0x1

    .line 61
    aput-byte p0, v6, v7

    .line 62
    .line 63
    const/4 p0, 0x2

    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    invoke-static {v0, v2, v6, p0, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 67
    .line 68
    .line 69
    :cond_4
    add-int/2addr p0, v3

    .line 70
    invoke-static {v4}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->unsignedIntToSignedByte(I)B

    .line 71
    .line 72
    .line 73
    move-result v0

    .line 74
    aput-byte v0, v6, p0

    .line 75
    .line 76
    if-eqz v1, :cond_5

    .line 77
    .line 78
    invoke-static {v1, v2, v6, v5, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 79
    .line 80
    .line 81
    :cond_5
    return-object v6
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->trimLeadingZeroesForceMinLength([B)[B

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    move v0, v1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    array-length v0, v0

    .line 17
    :goto_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/math/BigInteger;->toByteArray()[B

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->trimLeadingZeroesForceMinLength([B)[B

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    if-nez p0, :cond_1

    .line 28
    .line 29
    goto :goto_1

    .line 30
    :cond_1
    array-length v1, p0

    .line 31
    :goto_1
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 32
    .line 33
    add-int/lit8 v0, v0, 0x3

    .line 34
    .line 35
    add-int/2addr v0, v1

    .line 36
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public getUID()J
    .locals 2

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->bigToLong(Ljava/math/BigInteger;)J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    return-wide v0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 2
    .line 3
    const v1, -0x12d687

    .line 4
    .line 5
    .line 6
    mul-int/2addr v0, v1

    .line 7
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/math/BigInteger;->hashCode()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    const/16 v2, 0x10

    .line 14
    .line 15
    invoke-static {v1, v2}, Ljava/lang/Integer;->rotateLeft(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    xor-int/2addr v0, v1

    .line 20
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/math/BigInteger;->hashCode()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    xor-int/2addr p0, v0

    .line 27
    return p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 6

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->reset()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x3

    .line 5
    const-string v1, " bytes"

    .line 6
    .line 7
    if-lt p3, v0, :cond_2

    .line 8
    .line 9
    add-int/lit8 v0, p2, 0x1

    .line 10
    .line 11
    aget-byte v2, p1, p2

    .line 12
    .line 13
    invoke-static {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->signedByteToUnsignedInt(B)I

    .line 14
    .line 15
    .line 16
    move-result v2

    .line 17
    iput v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->version:I

    .line 18
    .line 19
    add-int/lit8 p2, p2, 0x2

    .line 20
    .line 21
    aget-byte v0, p1, v0

    .line 22
    .line 23
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->signedByteToUnsignedInt(B)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/lit8 v2, v0, 0x3

    .line 28
    .line 29
    const-string v3, " doesn\'t fit into "

    .line 30
    .line 31
    if-gt v2, p3, :cond_1

    .line 32
    .line 33
    add-int/2addr v0, p2

    .line 34
    invoke-static {p1, p2, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    new-instance v4, Ljava/math/BigInteger;

    .line 39
    .line 40
    invoke-static {p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->reverse([B)[B

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    const/4 v5, 0x1

    .line 45
    invoke-direct {v4, v5, p2}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 46
    .line 47
    .line 48
    iput-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 49
    .line 50
    add-int/lit8 p2, v0, 0x1

    .line 51
    .line 52
    aget-byte v0, p1, v0

    .line 53
    .line 54
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->signedByteToUnsignedInt(B)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    add-int/2addr v2, v0

    .line 59
    if-gt v2, p3, :cond_0

    .line 60
    .line 61
    add-int/2addr v0, p2

    .line 62
    invoke-static {p1, p2, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    new-instance p2, Ljava/math/BigInteger;

    .line 67
    .line 68
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->reverse([B)[B

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    invoke-direct {p2, v5, p1}, Ljava/math/BigInteger;-><init>(I[B)V

    .line 73
    .line 74
    .line 75
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 76
    .line 77
    return-void

    .line 78
    :cond_0
    new-instance p0, Ljava/util/zip/ZipException;

    .line 79
    .line 80
    new-instance p1, Ljava/lang/StringBuilder;

    .line 81
    .line 82
    const-string p2, "X7875_NewUnix invalid: gidSize "

    .line 83
    .line 84
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    throw p0

    .line 107
    :cond_1
    new-instance p0, Ljava/util/zip/ZipException;

    .line 108
    .line 109
    new-instance p1, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string p2, "X7875_NewUnix invalid: uidSize "

    .line 112
    .line 113
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {p1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    invoke-virtual {p1, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 123
    .line 124
    .line 125
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 133
    .line 134
    .line 135
    throw p0

    .line 136
    :cond_2
    const-string p0, "X7875_NewUnix length is too short, only "

    .line 137
    .line 138
    invoke-static {p0, p3, v1}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 139
    .line 140
    .line 141
    return-void
.end method

.method public setGID(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->longToBig(J)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 6
    .line 7
    return-void
.end method

.method public setUID(J)V
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->longToBig(J)Ljava/math/BigInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 6
    .line 7
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "0x7875 Zip Extra Field: UID="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->uid:Ljava/math/BigInteger;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, " GID="

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X7875_NewUnix;->gid:Ljava/math/BigInteger;

    .line 19
    .line 20
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    return-object p0
.end method
