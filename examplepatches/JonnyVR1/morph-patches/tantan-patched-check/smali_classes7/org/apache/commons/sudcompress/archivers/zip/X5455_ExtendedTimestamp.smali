.class public Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;
.implements Ljava/lang/Cloneable;
.implements Ljava/io/Serializable;


# static fields
.field public static final ACCESS_TIME_BIT:B = 0x2t

.field public static final CREATE_TIME_BIT:B = 0x4t

.field private static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field public static final MODIFY_TIME_BIT:B = 0x1t

.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

.field private bit0_modifyTimePresent:Z

.field private bit1_accessTimePresent:Z

.field private bit2_createTimePresent:Z

.field private createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

.field private flags:B

.field private modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0x5455

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
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

.method private static dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 4

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    const-wide/16 v2, 0x3e8

    .line 10
    .line 11
    div-long/2addr v0, v2

    .line 12
    invoke-static {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->unixTimeToZipLong(J)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method private reset()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->setFlags(B)V

    .line 3
    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 7
    .line 8
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 11
    .line 12
    return-void
.end method

.method private static unixTimeToZipLong(J)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 2

    .line 1
    const-wide/32 v0, -0x80000000

    .line 2
    .line 3
    .line 4
    cmp-long v0, p0, v0

    .line 5
    .line 6
    if-ltz v0, :cond_0

    .line 7
    .line 8
    const-wide/32 v0, 0x7fffffff

    .line 9
    .line 10
    .line 11
    cmp-long v0, p0, v0

    .line 12
    .line 13
    if-gtz v0, :cond_0

    .line 14
    .line 15
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 16
    .line 17
    invoke-direct {v0, p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>(J)V

    .line 18
    .line 19
    .line 20
    return-object v0

    .line 21
    :cond_0
    const-string v0, "X5455 timestamps must fit in a signed 32 bit integer: "

    .line 22
    .line 23
    invoke-static {v0, p0, p1}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0
.end method

.method private static zipLongToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)Ljava/util/Date;
    .locals 5

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    new-instance v0, Ljava/util/Date;

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getIntValue()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    int-to-long v1, p0

    .line 10
    const-wide/16 v3, 0x3e8

    .line 11
    .line 12
    mul-long/2addr v1, v3

    .line 13
    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    .line 14
    .line 15
    .line 16
    return-object v0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return-object p0
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
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_3

    .line 5
    .line 6
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;

    .line 7
    .line 8
    iget-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 9
    .line 10
    and-int/lit8 v0, v0, 0x7

    .line 11
    .line 12
    iget-byte v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 13
    .line 14
    and-int/lit8 v2, v2, 0x7

    .line 15
    .line 16
    if-ne v0, v2, :cond_3

    .line 17
    .line 18
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 19
    .line 20
    iget-object v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 21
    .line 22
    if-eq v0, v2, :cond_0

    .line 23
    .line 24
    if-eqz v0, :cond_3

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_3

    .line 31
    .line 32
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 33
    .line 34
    iget-object v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 35
    .line 36
    if-eq v0, v2, :cond_1

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    :cond_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 47
    .line 48
    iget-object p1, p1, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 49
    .line 50
    if-eq p0, p1, :cond_2

    .line 51
    .line 52
    if-eqz p0, :cond_3

    .line 53
    .line 54
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    if-eqz p0, :cond_3

    .line 59
    .line 60
    :cond_2
    const/4 p0, 0x1

    .line 61
    return p0

    .line 62
    :cond_3
    return v1
.end method

.method public getAccessJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->zipLongToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAccessTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCentralDirectoryData()[B
    .locals 1

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getLocalFileDataData()[B

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {v0, p0}, Ljava/util/Arrays;->copyOf([BI)[B

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x4

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    add-int/lit8 p0, p0, 0x1

    .line 11
    .line 12
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 13
    .line 14
    .line 15
    return-object v0
.end method

.method public getCreateJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->zipLongToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCreateTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    return-object p0
.end method

.method public getFlags()B
    .locals 0

    .line 1
    iget-byte p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 2
    .line 3
    return p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 6

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    const/4 v1, 0x0

    .line 12
    aput-byte v1, v0, v1

    .line 13
    .line 14
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 15
    .line 16
    const/4 v3, 0x4

    .line 17
    const/4 v4, 0x1

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    aput-byte v4, v0, v1

    .line 21
    .line 22
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 23
    .line 24
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-static {v2, v1, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 29
    .line 30
    .line 31
    const/4 v4, 0x5

    .line 32
    :cond_0
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 33
    .line 34
    if-eqz v2, :cond_1

    .line 35
    .line 36
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 37
    .line 38
    if-eqz v2, :cond_1

    .line 39
    .line 40
    aget-byte v5, v0, v1

    .line 41
    .line 42
    or-int/lit8 v5, v5, 0x2

    .line 43
    .line 44
    int-to-byte v5, v5

    .line 45
    aput-byte v5, v0, v1

    .line 46
    .line 47
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2, v1, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 52
    .line 53
    .line 54
    add-int/lit8 v4, v4, 0x4

    .line 55
    .line 56
    :cond_1
    iget-boolean v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 57
    .line 58
    if-eqz v2, :cond_2

    .line 59
    .line 60
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 61
    .line 62
    if-eqz p0, :cond_2

    .line 63
    .line 64
    aget-byte v2, v0, v1

    .line 65
    .line 66
    or-int/2addr v2, v3

    .line 67
    int-to-byte v2, v2

    .line 68
    aput-byte v2, v0, v1

    .line 69
    .line 70
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-static {p0, v1, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 75
    .line 76
    .line 77
    :cond_2
    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 5

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x4

    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    move v1, v3

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v1, v2

    .line 12
    :goto_0
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    iget-boolean v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 15
    .line 16
    if-eqz v4, :cond_1

    .line 17
    .line 18
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 19
    .line 20
    if-eqz v4, :cond_1

    .line 21
    .line 22
    move v4, v3

    .line 23
    goto :goto_1

    .line 24
    :cond_1
    move v4, v2

    .line 25
    :goto_1
    add-int/2addr v1, v4

    .line 26
    iget-boolean v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 27
    .line 28
    if-eqz v4, :cond_2

    .line 29
    .line 30
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 31
    .line 32
    if-eqz p0, :cond_2

    .line 33
    .line 34
    move v2, v3

    .line 35
    :cond_2
    add-int/2addr v1, v2

    .line 36
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 37
    .line 38
    .line 39
    return-object v0
.end method

.method public getModifyJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->zipLongToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getModifyTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 2
    .line 3
    and-int/lit8 v0, v0, 0x7

    .line 4
    .line 5
    mul-int/lit8 v0, v0, -0x7b

    .line 6
    .line 7
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 8
    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->hashCode()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    xor-int/2addr v0, v1

    .line 16
    :cond_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 17
    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->hashCode()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    const/16 v2, 0xb

    .line 25
    .line 26
    invoke-static {v1, v2}, Ljava/lang/Integer;->rotateLeft(II)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    xor-int/2addr v0, v1

    .line 31
    :cond_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 32
    .line 33
    if-eqz p0, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->hashCode()I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    const/16 v1, 0x16

    .line 40
    .line 41
    invoke-static {p0, v1}, Ljava/lang/Integer;->rotateLeft(II)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    xor-int/2addr p0, v0

    .line 46
    return p0

    .line 47
    :cond_2
    return v0
.end method

.method public isBit0_modifyTimePresent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBit1_accessTimePresent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 2
    .line 3
    return p0
.end method

.method public isBit2_createTimePresent()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 2
    .line 3
    return p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->parseFromLocalFileData([BII)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->reset()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x1

    .line 5
    if-lt p3, v0, :cond_3

    .line 6
    .line 7
    add-int/2addr p3, p2

    .line 8
    add-int/lit8 v0, p2, 0x1

    .line 9
    .line 10
    aget-byte v1, p1, p2

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->setFlags(B)V

    .line 13
    .line 14
    .line 15
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    add-int/lit8 p2, p2, 0x5

    .line 20
    .line 21
    if-gt p2, p3, :cond_0

    .line 22
    .line 23
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 24
    .line 25
    invoke-direct {v1, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 26
    .line 27
    .line 28
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 29
    .line 30
    move v0, p2

    .line 31
    :cond_0
    iget-boolean p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 32
    .line 33
    if-eqz p2, :cond_1

    .line 34
    .line 35
    add-int/lit8 p2, v0, 0x4

    .line 36
    .line 37
    if-gt p2, p3, :cond_1

    .line 38
    .line 39
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 40
    .line 41
    invoke-direct {v1, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 42
    .line 43
    .line 44
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 45
    .line 46
    move v0, p2

    .line 47
    :cond_1
    iget-boolean p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 48
    .line 49
    if-eqz p2, :cond_2

    .line 50
    .line 51
    add-int/lit8 p2, v0, 0x4

    .line 52
    .line 53
    if-gt p2, p3, :cond_2

    .line 54
    .line 55
    new-instance p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 56
    .line 57
    invoke-direct {p2, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 58
    .line 59
    .line 60
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 61
    .line 62
    :cond_2
    return-void

    .line 63
    :cond_3
    const-string p0, "X5455_ExtendedTimestamp too short, only "

    .line 64
    .line 65
    const-string p1, " bytes"

    .line 66
    .line 67
    invoke-static {p0, p3, p1}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    return-void
.end method

.method public setAccessJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->setAccessTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setAccessTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 7
    .line 8
    iget-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    or-int/lit8 v0, v0, 0x2

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    and-int/lit8 v0, v0, -0x3

    .line 16
    .line 17
    :goto_1
    int-to-byte v0, v0

    .line 18
    iput-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 19
    .line 20
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 21
    .line 22
    return-void
.end method

.method public setCreateJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->setCreateTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setCreateTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 1

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    goto :goto_0

    .line 5
    :cond_0
    const/4 v0, 0x0

    .line 6
    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 7
    .line 8
    iget-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 9
    .line 10
    if-eqz p1, :cond_1

    .line 11
    .line 12
    or-int/lit8 v0, v0, 0x4

    .line 13
    .line 14
    goto :goto_1

    .line 15
    :cond_1
    and-int/lit8 v0, v0, -0x5

    .line 16
    .line 17
    :goto_1
    int-to-byte v0, v0

    .line 18
    iput-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 19
    .line 20
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 21
    .line 22
    return-void
.end method

.method public setFlags(B)V
    .locals 4

    .line 1
    iput-byte p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 2
    .line 3
    and-int/lit8 v0, p1, 0x1

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v0, v2, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    move v0, v1

    .line 12
    :goto_0
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 13
    .line 14
    and-int/lit8 v0, p1, 0x2

    .line 15
    .line 16
    const/4 v3, 0x2

    .line 17
    if-ne v0, v3, :cond_1

    .line 18
    .line 19
    move v0, v2

    .line 20
    goto :goto_1

    .line 21
    :cond_1
    move v0, v1

    .line 22
    :goto_1
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 23
    .line 24
    const/4 v0, 0x4

    .line 25
    and-int/2addr p1, v0

    .line 26
    if-ne p1, v0, :cond_2

    .line 27
    .line 28
    move v1, v2

    .line 29
    :cond_2
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 30
    .line 31
    return-void
.end method

.method public setModifyJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->dateToZipLong(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->setModifyTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setModifyTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    move v1, v0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const/4 v1, 0x0

    .line 7
    :goto_0
    iput-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 8
    .line 9
    iget-byte v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 10
    .line 11
    if-eqz p1, :cond_1

    .line 12
    .line 13
    or-int/2addr v0, v1

    .line 14
    goto :goto_1

    .line 15
    :cond_1
    and-int/lit8 v0, v1, -0x2

    .line 16
    .line 17
    :goto_1
    int-to-byte v0, v0

    .line 18
    iput-byte v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 19
    .line 20
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 21
    .line 22
    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "0x5455 Zip Extra Field: Flags="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-byte v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->flags:B

    .line 9
    .line 10
    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->unsignedIntToSignedByte(I)B

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    invoke-static {v1}, Ljava/lang/Integer;->toBinaryString(I)Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit0_modifyTimePresent:Z

    .line 27
    .line 28
    const-string v2, "] "

    .line 29
    .line 30
    if-eqz v1, :cond_0

    .line 31
    .line 32
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 33
    .line 34
    if-eqz v1, :cond_0

    .line 35
    .line 36
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getModifyJavaTime()Ljava/util/Date;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const-string v3, " Modify:["

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    :cond_0
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit1_accessTimePresent:Z

    .line 52
    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 56
    .line 57
    if-eqz v1, :cond_1

    .line 58
    .line 59
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getAccessJavaTime()Ljava/util/Date;

    .line 60
    .line 61
    .line 62
    move-result-object v1

    .line 63
    const-string v3, " Access:["

    .line 64
    .line 65
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    :cond_1
    iget-boolean v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->bit2_createTimePresent:Z

    .line 75
    .line 76
    if-eqz v1, :cond_2

    .line 77
    .line 78
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X5455_ExtendedTimestamp;->getCreateJavaTime()Ljava/util/Date;

    .line 83
    .line 84
    .line 85
    move-result-object p0

    .line 86
    const-string v1, " Create:["

    .line 87
    .line 88
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 92
    .line 93
    .line 94
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 95
    .line 96
    .line 97
    :cond_2
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object p0

    .line 101
    return-object p0
.end method
