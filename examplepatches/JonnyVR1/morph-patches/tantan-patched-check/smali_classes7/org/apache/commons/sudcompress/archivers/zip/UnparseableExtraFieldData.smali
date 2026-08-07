.class public final Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/apache/commons/sudcompress/archivers/zip/ZipExtraField;


# static fields
.field private static final HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;


# instance fields
.field private centralDirectoryData:[B

.field private localFileData:[B


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    const v1, 0xacc1

    .line 4
    .line 5
    .line 6
    invoke-direct {v0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 7
    .line 8
    .line 9
    sput-object v0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 10
    .line 11
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


# virtual methods
.method public getCentralDirectoryData()[B
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->getLocalFileDataData()[B

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->copy([B)[B

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public getCentralDirectoryLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 11
    .line 12
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    .line 13
    .line 14
    array-length p0, p0

    .line 15
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method

.method public getHeaderId()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 0

    .line 1
    sget-object p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->HEADER_ID:Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    return-object p0
.end method

.method public getLocalFileDataData()[B
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->localFileData:[B

    .line 2
    .line 3
    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipUtil;->copy([B)[B

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getLocalFileDataLength()Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;
    .locals 1

    .line 1
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;

    .line 2
    .line 3
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->localFileData:[B

    .line 4
    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    array-length p0, p0

    .line 10
    :goto_0
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipShort;-><init>(I)V

    .line 11
    .line 12
    .line 13
    return-object v0
.end method

.method public parseFromCentralDirectoryData([BII)V
    .locals 1

    .line 1
    add-int v0, p2, p3

    .line 2
    .line 3
    invoke-static {p1, p2, v0}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->centralDirectoryData:[B

    .line 8
    .line 9
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->localFileData:[B

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->parseFromLocalFileData([BII)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public parseFromLocalFileData([BII)V
    .locals 0

    .line 1
    add-int/2addr p3, p2

    .line 2
    invoke-static {p1, p2, p3}, Ljava/util/Arrays;->copyOfRange([BII)[B

    .line 3
    .line 4
    .line 5
    move-result-object p1

    .line 6
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/UnparseableExtraFieldData;->localFileData:[B

    .line 7
    .line 8
    return-void
.end method
