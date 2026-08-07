.class Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "CompressedEntry"
.end annotation


# instance fields
.field final compressedSize:J

.field final crc:J

.field final size:J

.field final zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;JJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 5
    .line 6
    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->crc:J

    .line 7
    .line 8
    iput-wide p4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->compressedSize:J

    .line 9
    .line 10
    iput-wide p6, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->size:J

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public transferToArchiveEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 2
    .line 3
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->getZipArchiveEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->compressedSize:J

    .line 8
    .line 9
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCompressedSize(J)V

    .line 10
    .line 11
    .line 12
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->size:J

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setSize(J)V

    .line 15
    .line 16
    .line 17
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->crc:J

    .line 18
    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/util/zip/ZipEntry;->setCrc(J)V

    .line 20
    .line 21
    .line 22
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->zipArchiveEntryRequest:Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;

    .line 23
    .line 24
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->getMethod()I

    .line 25
    .line 26
    .line 27
    move-result p0

    .line 28
    invoke-virtual {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;->setMethod(I)V

    .line 29
    .line 30
    .line 31
    return-object v0
.end method
