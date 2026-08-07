.class public abstract Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# instance fields
.field private data:[B

.field private nameCRC32:J

.field private unicodeName:[B


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[B)V
    .locals 2

    .line 36
    array-length v0, p2

    const/4 v1, 0x0

    invoke-direct {p0, p1, p2, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;-><init>(Ljava/lang/String;[BII)V

    return-void
.end method

.method public constructor <init>(Ljava/lang/String;[BII)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/zip/CRC32;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/zip/CRC32;-><init>()V

    .line 7
    .line 8
    .line 9
    invoke-virtual {v0, p2, p3, p4}, Ljava/util/zip/CRC32;->update([BII)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/zip/CRC32;->getValue()J

    .line 13
    .line 14
    .line 15
    move-result-wide p2

    .line 16
    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 17
    .line 18
    :try_start_0
    const-string p2, "UTF-8"

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B
    :try_end_0
    .catch Ljava/io/UnsupportedEncodingException; {:try_start_0 .. :try_end_0} :catch_0

    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    const-string p1, "FATAL: UTF-8 encoding not supported."

    .line 29
    .line 30
    invoke-static {p1, p0}, Ll/vtq0;->a(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    const/4 p0, 0x0

    .line 34
    throw p0
.end method

.method private assembleData()V
    .locals 6

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    array-length v0, v0

    .line 7
    const/4 v1, 0x5

    .line 8
    add-int/2addr v0, v1

    .line 9
    new-array v0, v0, [B

    .line 10
    .line 11
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    const/4 v3, 0x1

    .line 15
    aput-byte v3, v0, v2

    .line 16
    .line 17
    iget-wide v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 18
    .line 19
    invoke-static {v4, v5}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getBytes(J)[B

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 24
    .line 25
    const/4 v5, 0x4

    .line 26
    invoke-static {v0, v2, v4, v3, v5}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 30
    .line 31
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 32
    .line 33
    array-length v3, v0

    .line 34
    invoke-static {v0, v2, p0, v1, v3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->assembleData()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    array-length v0, p0

    .line 13
    new-array v1, v0, [B

    .line 14
    .line 15
    const/4 v2, 0x0

    .line 16
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 17
    .line 18
    .line 19
    return-object v1

    .line 20
    :cond_1
    const/4 p0, 0x0

    .line 21
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->assembleData()V

    .line 6
    .line 7
    .line 8
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 9
    .line 10
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 11
    .line 12
    if-eqz p0, :cond_1

    .line 13
    .line 14
    array-length p0, p0

    .line 15
    goto :goto_0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    :goto_0
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 18
    .line 19
    .line 20
    return-object v0
.end method

.method public getLocalFileDataData()[B
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->getCentralDirectoryData()[B

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getNameCRC32()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUnicodeName()[B
    .locals 3

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    array-length v0, p0

    .line 6
    new-array v1, v0, [B

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {p0, v2, v1, v2, v0}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 10
    .line 11
    .line 12
    return-object v1

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return-object p0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->parseFromLocalFileData([BII)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 3

    .line 1
    const/4 v0, 0x5

    .line 2
    if-lt p3, v0, :cond_1

    .line 3
    .line 4
    aget-byte v1, p1, p2

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne v1, v2, :cond_0

    .line 8
    .line 9
    add-int/lit8 v1, p2, 0x1

    .line 10
    .line 11
    invoke-static {p1, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipLong;->getValue([BI)J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 16
    .line 17
    sub-int/2addr p3, v0

    .line 18
    new-array v1, p3, [B

    .line 19
    .line 20
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 21
    .line 22
    add-int/2addr p2, v0

    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {p1, p2, v1, v0, p3}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 29
    .line 30
    return-void

    .line 31
    :cond_0
    const-string p0, "Unsupported version ["

    .line 32
    .line 33
    const-string p1, "] for UniCode path extra data."

    .line 34
    .line 35
    invoke-static {p0, v1, p1}, Ll/p11;->a(Ljava/lang/String;ILjava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    new-instance p0, Ljava/util/zip/ZipException;

    .line 40
    .line 41
    const-string p1, "UniCode path extra data must have at least 5 bytes."

    .line 42
    .line 43
    invoke-direct {p0, p1}, Ljava/util/zip/ZipException;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    throw p0
.end method

.method public setNameCRC32(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->nameCRC32:J

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 5
    .line 6
    return-void
.end method

.method public setUnicodeName([B)V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p1, :cond_0

    .line 3
    .line 4
    array-length v1, p1

    .line 5
    new-array v1, v1, [B

    .line 6
    .line 7
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 8
    .line 9
    array-length v2, p1

    .line 10
    const/4 v3, 0x0

    .line 11
    invoke-static {p1, v3, v1, v3, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 12
    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->unicodeName:[B

    .line 16
    .line 17
    :goto_0
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/AbstractUnicodeExtraField;->data:[B

    .line 18
    .line 19
    return-void
.end method
