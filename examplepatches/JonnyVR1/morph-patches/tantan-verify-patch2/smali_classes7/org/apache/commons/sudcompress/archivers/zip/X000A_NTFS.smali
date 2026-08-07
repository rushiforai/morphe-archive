.class public Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# static fields
.field private static final EPOCH_OFFSET:J = -0x19db1ded53e8000L

.field private static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final TIME_ATTR_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final TIME_ATTR_TAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;


# instance fields
.field private accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

.field private createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

.field private modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v1, 0xa

    .line 4
    .line 5
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 11
    .line 12
    const/4 v1, 0x1

    .line 13
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 14
    .line 15
    .line 16
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_TAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 17
    .line 18
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 19
    .line 20
    const/16 v1, 0x18

    .line 21
    .line 22
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 23
    .line 24
    .line 25
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 5
    .line 6
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 7
    .line 8
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 9
    .line 10
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 11
    .line 12
    return-void
.end method

.method private static dateToZip(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 5

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, 0x0

    .line 4
    return-object p0

    .line 5
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 6
    .line 7
    invoke-virtual {p0}, Ljava/util/Date;->getTime()J

    .line 8
    .line 9
    .line 10
    move-result-wide v1

    .line 11
    const-wide/16 v3, 0x2710

    .line 12
    .line 13
    mul-long/2addr v1, v3

    .line 14
    const-wide v3, -0x19db1ded53e8000L

    .line 15
    .line 16
    .line 17
    .line 18
    .line 19
    sub-long/2addr v1, v3

    .line 20
    invoke-direct {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>(J)V

    .line 21
    .line 22
    .line 23
    return-object v0
.end method

.method private readTimeAttr([BII)V
    .locals 1

    .line 1
    const/16 v0, 0x1a

    .line 2
    .line 3
    if-lt p3, v0, :cond_0

    .line 4
    .line 5
    new-instance p3, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 6
    .line 7
    invoke-direct {p3, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>([BI)V

    .line 8
    .line 9
    .line 10
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 11
    .line 12
    invoke-virtual {v0, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    .line 13
    .line 14
    .line 15
    move-result p3

    .line 16
    if-eqz p3, :cond_0

    .line 17
    .line 18
    add-int/lit8 p3, p2, 0x2

    .line 19
    .line 20
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 21
    .line 22
    invoke-direct {v0, p1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 26
    .line 27
    add-int/lit8 p3, p2, 0xa

    .line 28
    .line 29
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 30
    .line 31
    invoke-direct {v0, p1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 35
    .line 36
    add-int/lit8 p2, p2, 0x12

    .line 37
    .line 38
    new-instance p3, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 39
    .line 40
    invoke-direct {p3, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 41
    .line 42
    .line 43
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 44
    .line 45
    :cond_0
    return-void
.end method

.method private reset()V
    .locals 1

    .line 1
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 6
    .line 7
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 8
    .line 9
    return-void
.end method

.method private static zipToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)Ljava/util/Date;
    .locals 4

    .line 1
    if-eqz p0, :cond_1

    .line 2
    .line 3
    sget-object v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->equals(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getLongValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    const-wide v2, -0x19db1ded53e8000L

    .line 17
    .line 18
    .line 19
    .line 20
    .line 21
    add-long/2addr v0, v2

    .line 22
    const-wide/16 v2, 0x2710

    .line 23
    .line 24
    div-long/2addr v0, v2

    .line 25
    new-instance p0, Ljava/util/Date;

    .line 26
    .line 27
    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    .line 28
    .line 29
    .line 30
    return-object p0

    .line 31
    :cond_1
    :goto_0
    const/4 p0, 0x0

    .line 32
    return-object p0
.end method


# virtual methods
.method public equals(Ljava/lang/Object;)Z
    .locals 3

    .line 1
    instance-of v0, p1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_4

    .line 5
    .line 6
    check-cast p1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;

    .line 7
    .line 8
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 9
    .line 10
    iget-object v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 11
    .line 12
    if-eq v0, v2, :cond_0

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->equals(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_2

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 23
    .line 24
    iget-object v2, p1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 25
    .line 26
    if-eq v0, v2, :cond_1

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    invoke-virtual {v0, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->equals(Ljava/lang/Object;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    if-eqz v0, :cond_2

    .line 35
    .line 36
    :cond_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 37
    .line 38
    iget-object p1, p1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 39
    .line 40
    if-eq p0, p1, :cond_3

    .line 41
    .line 42
    if-eqz p0, :cond_2

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->equals(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    if-eqz p0, :cond_2

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :cond_2
    return v1

    .line 52
    :cond_3
    :goto_0
    const/4 p0, 0x1

    .line 53
    return p0

    .line 54
    :cond_4
    return v1
.end method

.method public getAccessJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->zipToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getAccessTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getCentralDirectoryData()[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getLocalFileDataData()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getCreateJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->zipToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getCreateTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 5

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

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
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_TAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 12
    .line 13
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    const/4 v2, 0x0

    .line 18
    const/4 v3, 0x4

    .line 19
    const/4 v4, 0x2

    .line 20
    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 21
    .line 22
    .line 23
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_SIZE:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 24
    .line 25
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getBytes()[B

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    const/4 v3, 0x6

    .line 30
    invoke-static {v1, v2, v0, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 31
    .line 32
    .line 33
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 34
    .line 35
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/16 v3, 0x8

    .line 40
    .line 41
    invoke-static {v1, v2, v0, v3, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 42
    .line 43
    .line 44
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 45
    .line 46
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/16 v4, 0x10

    .line 51
    .line 52
    invoke-static {v1, v2, v0, v4, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 56
    .line 57
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const/16 v1, 0x18

    .line 62
    .line 63
    invoke-static {p0, v2, v0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 64
    .line 65
    .line 66
    return-object v0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/16 v0, 0x20

    .line 4
    .line 5
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 6
    .line 7
    .line 8
    return-object p0
.end method

.method public getModifyJavaTime()Ljava/util/Date;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->zipToDate(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)Ljava/util/Date;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getModifyTime()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public hashCode()I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    const/16 v1, -0x7b

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    xor-int/2addr v1, v0

    .line 12
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->hashCode()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    const/16 v2, 0xb

    .line 21
    .line 22
    invoke-static {v0, v2}, Ljava/lang/Integer;->rotateLeft(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    xor-int/2addr v1, v0

    .line 27
    :cond_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 28
    .line 29
    if-eqz p0, :cond_2

    .line 30
    .line 31
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->hashCode()I

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    const/16 v0, 0x16

    .line 36
    .line 37
    invoke-static {p0, v0}, Ljava/lang/Integer;->rotateLeft(II)I

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    xor-int/2addr p0, v1

    .line 42
    return p0

    .line 43
    :cond_2
    return v1
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->reset()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->parseFromLocalFileData([BII)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 2

    .line 1
    add-int/2addr p3, p2

    .line 2
    add-int/lit8 p2, p2, 0x4

    .line 3
    .line 4
    :goto_0
    add-int/lit8 v0, p2, 0x4

    .line 5
    .line 6
    if-gt v0, p3, :cond_1

    .line 7
    .line 8
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>([BI)V

    .line 11
    .line 12
    .line 13
    add-int/lit8 p2, p2, 0x2

    .line 14
    .line 15
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->TIME_ATTR_TAG:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->equals(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    sub-int/2addr p3, p2

    .line 24
    invoke-direct {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->readTimeAttr([BII)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 29
    .line 30
    invoke-direct {v0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>([BI)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;->getValue()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/lit8 v0, v0, 0x2

    .line 38
    .line 39
    add-int/2addr p2, v0

    .line 40
    goto :goto_0

    .line 41
    :cond_1
    return-void
.end method

.method public setAccessJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->dateToZip(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->setAccessTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setAccessTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->accessTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 6
    .line 7
    return-void
.end method

.method public setCreateJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->dateToZip(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->setCreateTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setCreateTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->createTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 6
    .line 7
    return-void
.end method

.method public setModifyJavaTime(Ljava/util/Date;)V
    .locals 0

    .line 1
    invoke-static {p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->dateToZip(Ljava/util/Date;)Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    invoke-virtual {p0, p1}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->setModifyTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setModifyTime(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    sget-object p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->ZERO:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    :cond_0
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->modifyTime:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

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
    const-string v1, "0x000A Zip Extra Field: Modify:["

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getModifyJavaTime()Ljava/util/Date;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "]  Access:["

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getAccessJavaTime()Ljava/util/Date;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    const-string v1, "]  Create:["

    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/X000A_NTFS;->getCreateJavaTime()Ljava/util/Date;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string p0, "] "

    .line 40
    .line 41
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    return-object p0
.end method
