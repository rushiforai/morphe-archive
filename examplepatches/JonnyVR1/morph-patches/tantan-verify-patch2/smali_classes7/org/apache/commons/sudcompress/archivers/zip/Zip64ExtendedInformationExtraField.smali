.class public Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# static fields
.field private static final EMPTY:[B

.field static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

.field private static final LFH_MUST_HAVE_BOTH_SIZES_MSG:Ljava/lang/String; = "Zip64 extended information must contain both size values in the local file header."


# instance fields
.field private compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

.field private diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

.field private rawCentralDirectoryData:[B

.field private relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

.field private size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 5
    .line 6
    .line 7
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    new-array v0, v0, [B

    .line 11
    .line 12
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->EMPTY:[B

    .line 13
    .line 14
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 14
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 1

    const/4 v0, 0x0

    .line 13
    invoke-direct {p0, p1, p2, v0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V

    return-void
.end method

.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 7
    .line 8
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 9
    .line 10
    iput-object p4, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 11
    .line 12
    return-void
.end method

.method private addSizes([B)I
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    const/16 v1, 0x8

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v0, v2, p1, v2, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 13
    .line 14
    .line 15
    move v0, v1

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    move v0, v2

    .line 18
    :goto_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 19
    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    invoke-static {p0, v2, p1, v0, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    add-int/2addr v0, v1

    .line 30
    :cond_1
    return v0
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 5

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

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
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->addSizes([B)I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 16
    .line 17
    const/4 v3, 0x0

    .line 18
    if-eqz v2, :cond_0

    .line 19
    .line 20
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;->getBytes()[B

    .line 21
    .line 22
    .line 23
    move-result-object v2

    .line 24
    const/16 v4, 0x8

    .line 25
    .line 26
    invoke-static {v2, v3, v0, v1, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    add-int/lit8 v1, v1, 0x8

    .line 30
    .line 31
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes()[B

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    const/4 v2, 0x4

    .line 40
    invoke-static {p0, v3, v0, v1, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-object v0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 5

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    const/16 v2, 0x8

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    if-eqz v1, :cond_0

    .line 9
    .line 10
    move v1, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v1, v3

    .line 13
    :goto_0
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 14
    .line 15
    if-eqz v4, :cond_1

    .line 16
    .line 17
    move v4, v2

    .line 18
    goto :goto_1

    .line 19
    :cond_1
    move v4, v3

    .line 20
    :goto_1
    add-int/2addr v1, v4

    .line 21
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 22
    .line 23
    if-eqz v4, :cond_2

    .line 24
    .line 25
    goto :goto_2

    .line 26
    :cond_2
    move v2, v3

    .line 27
    :goto_2
    add-int/2addr v1, v2

    .line 28
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 29
    .line 30
    if-eqz p0, :cond_3

    .line 31
    .line 32
    const/4 v3, 0x4

    .line 33
    :cond_3
    add-int/2addr v1, v3

    .line 34
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method

.method public getCompressedSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getDiskStartNumber()Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 2

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->EMPTY:[B

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_1
    :goto_0
    if-eqz v0, :cond_2

    .line 14
    .line 15
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 16
    .line 17
    if-eqz v0, :cond_2

    .line 18
    .line 19
    const/16 v0, 0x10

    .line 20
    .line 21
    new-array v0, v0, [B

    .line 22
    .line 23
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->addSizes([B)I

    .line 24
    .line 25
    .line 26
    return-object v0

    .line 27
    :cond_2
    const-string p0, "Zip64 extended information must contain both size values in the local file header."

    .line 28
    .line 29
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const/4 p0, 0x0

    .line 33
    return-object p0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 4
    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0x10

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    :goto_0
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 12
    .line 13
    .line 14
    return-object v0
.end method

.method public getRelativeHeaderOffset()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public getSize()Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-object p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 2

    .line 1
    new-array v0, p3, [B

    .line 2
    .line 3
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    invoke-static {p1, p2, v0, v1, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 7
    .line 8
    .line 9
    const/16 v0, 0x1c

    .line 10
    .line 11
    if-lt p3, v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->parseFromLocalFileData([BII)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    const/16 v0, 0x18

    .line 18
    .line 19
    if-ne p3, v0, :cond_1

    .line 20
    .line 21
    new-instance p3, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 22
    .line 23
    invoke-direct {p3, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 24
    .line 25
    .line 26
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 27
    .line 28
    add-int/lit8 p3, p2, 0x8

    .line 29
    .line 30
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 31
    .line 32
    invoke-direct {v0, p1, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 36
    .line 37
    add-int/lit8 p2, p2, 0x10

    .line 38
    .line 39
    new-instance p3, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 40
    .line 41
    invoke-direct {p3, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 42
    .line 43
    .line 44
    iput-object p3, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 45
    .line 46
    return-void

    .line 47
    :cond_1
    rem-int/lit8 v0, p3, 0x8

    .line 48
    .line 49
    const/4 v1, 0x4

    .line 50
    if-ne v0, v1, :cond_2

    .line 51
    .line 52
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 53
    .line 54
    add-int/2addr p2, p3

    .line 55
    sub-int/2addr p2, v1

    .line 56
    invoke-direct {v0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 57
    .line 58
    .line 59
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 60
    .line 61
    :cond_2
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 3

    .line 1
    if-nez p3, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    const/16 v0, 0x10

    .line 5
    .line 6
    if-lt p3, v0, :cond_3

    .line 7
    .line 8
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 9
    .line 10
    invoke-direct {v0, p1, p2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 14
    .line 15
    add-int/lit8 v0, p2, 0x8

    .line 16
    .line 17
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 18
    .line 19
    invoke-direct {v1, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 20
    .line 21
    .line 22
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 23
    .line 24
    add-int/lit8 v0, p2, 0x10

    .line 25
    .line 26
    add-int/lit8 v1, p3, -0x10

    .line 27
    .line 28
    const/16 v2, 0x8

    .line 29
    .line 30
    if-lt v1, v2, :cond_1

    .line 31
    .line 32
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 33
    .line 34
    invoke-direct {v1, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 35
    .line 36
    .line 37
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 38
    .line 39
    add-int/lit8 v0, p2, 0x18

    .line 40
    .line 41
    add-int/lit8 v1, p3, -0x18

    .line 42
    .line 43
    :cond_1
    const/4 p2, 0x4

    .line 44
    if-lt v1, p2, :cond_2

    .line 45
    .line 46
    new-instance p2, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 47
    .line 48
    invoke-direct {p2, p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 49
    .line 50
    .line 51
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 52
    .line 53
    :cond_2
    :goto_0
    return-void

    .line 54
    :cond_3
    new-instance p0, Ljava/util/zip/ZipException;

    .line 55
    .line 56
    const-string p1, "Zip64 extended information must contain both size values in the local file header."

    .line 57
    .line 58
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    throw p0
.end method

.method public reparseCentralDirectoryData(ZZZZ)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 2
    .line 3
    if-eqz v0, :cond_8

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/16 v2, 0x8

    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    move v3, v2

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    move v3, v1

    .line 13
    :goto_0
    if-eqz p2, :cond_1

    .line 14
    .line 15
    move v4, v2

    .line 16
    goto :goto_1

    .line 17
    :cond_1
    move v4, v1

    .line 18
    :goto_1
    add-int/2addr v3, v4

    .line 19
    if-eqz p3, :cond_2

    .line 20
    .line 21
    move v4, v2

    .line 22
    goto :goto_2

    .line 23
    :cond_2
    move v4, v1

    .line 24
    :goto_2
    add-int/2addr v3, v4

    .line 25
    if-eqz p4, :cond_3

    .line 26
    .line 27
    const/4 v4, 0x4

    .line 28
    goto :goto_3

    .line 29
    :cond_3
    move v4, v1

    .line 30
    :goto_3
    add-int/2addr v3, v4

    .line 31
    array-length v0, v0

    .line 32
    if-lt v0, v3, :cond_7

    .line 33
    .line 34
    if-eqz p1, :cond_4

    .line 35
    .line 36
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 37
    .line 38
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 39
    .line 40
    invoke-direct {p1, v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 44
    .line 45
    move v1, v2

    .line 46
    :cond_4
    if-eqz p2, :cond_5

    .line 47
    .line 48
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 49
    .line 50
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 51
    .line 52
    invoke-direct {p1, p2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 56
    .line 57
    add-int/lit8 v1, v1, 0x8

    .line 58
    .line 59
    :cond_5
    if-eqz p3, :cond_6

    .line 60
    .line 61
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 62
    .line 63
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 64
    .line 65
    invoke-direct {p1, p2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;-><init>([BI)V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 69
    .line 70
    add-int/lit8 v1, v1, 0x8

    .line 71
    .line 72
    :cond_6
    if-eqz p4, :cond_8

    .line 73
    .line 74
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 75
    .line 76
    iget-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 77
    .line 78
    invoke-direct {p1, p2, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;-><init>([BI)V

    .line 79
    .line 80
    .line 81
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 82
    .line 83
    return-void

    .line 84
    :cond_7
    new-instance p1, Ljava/util/zip/ZipException;

    .line 85
    .line 86
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->rawCentralDirectoryData:[B

    .line 87
    .line 88
    array-length p0, p0

    .line 89
    new-instance p2, Ljava/lang/StringBuilder;

    .line 90
    .line 91
    const-string p3, "Central directory zip64 extended information extra field\'s length doesn\'t match central directory data.  Expected length "

    .line 92
    .line 93
    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 94
    .line 95
    .line 96
    invoke-virtual {p2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 97
    .line 98
    .line 99
    const-string p3, " but is "

    .line 100
    .line 101
    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 102
    .line 103
    .line 104
    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object p0

    .line 111
    invoke-direct {p1, p0}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 112
    .line 113
    .line 114
    throw p1

    .line 115
    :cond_8
    return-void
.end method

.method public setCompressedSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->compressedSize:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-void
.end method

.method public setDiskStartNumber(Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->diskStart:Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;

    .line 2
    .line 3
    return-void
.end method

.method public setRelativeHeaderOffset(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->relativeHeaderOffset:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-void
.end method

.method public setSize(Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/Zip64ExtendedInformationExtraField;->size:Lorg/apache/commons/sudcompress/archivers/zip/ZipEightByteInteger;

    .line 2
    .line 3
    return-void
.end method
