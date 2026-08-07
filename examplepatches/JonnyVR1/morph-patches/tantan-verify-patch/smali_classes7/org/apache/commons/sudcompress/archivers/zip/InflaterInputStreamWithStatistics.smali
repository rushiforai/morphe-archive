.class Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;
.super Ljava/util/zip/InflaterInputStream;
.source "SourceFile"


# instance fields
.field private compressedCount:J

.field private uncompressedCount:J


# direct methods
.method public constructor <init>(Ljava/io/InputStream;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;)V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 7
    .line 8
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V
    .locals 0

    .line 11
    invoke-direct {p0, p1, p2}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;)V

    const-wide/16 p1, 0x0

    .line 12
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 13
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    return-void
.end method

.method public constructor <init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V
    .locals 0

    .line 14
    invoke-direct {p0, p1, p2, p3}, Ljava/util/zip/InflaterInputStream;-><init>(Ljava/io/InputStream;Ljava/util/zip/Inflater;I)V

    const-wide/16 p1, 0x0

    .line 15
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 16
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    return-void
.end method


# virtual methods
.method public fill()V
    .locals 4

    .line 1
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->fill()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 5
    .line 6
    iget-object v2, p0, Ljava/util/zip/InflaterInputStream;->inf:Ljava/util/zip/Inflater;

    .line 7
    .line 8
    invoke-virtual {v2}, Ljava/util/zip/Inflater;->getRemaining()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    int-to-long v2, v2

    .line 13
    add-long/2addr v0, v2

    .line 14
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 15
    .line 16
    return-void
.end method

.method public getCompressedCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->compressedCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getUncompressedCount()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public read()I
    .locals 5

    .line 1
    invoke-super {p0}, Ljava/util/zip/InflaterInputStream;->read()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, -0x1

    .line 6
    if-le v0, v1, :cond_0

    .line 7
    .line 8
    iget-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    .line 9
    .line 10
    const-wide/16 v3, 0x1

    .line 11
    .line 12
    add-long/2addr v1, v3

    .line 13
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    .line 14
    .line 15
    :cond_0
    return v0
.end method

.method public read([BII)I
    .locals 2

    .line 16
    invoke-super {p0, p1, p2, p3}, Ljava/util/zip/InflaterInputStream;->read([BII)I

    move-result p1

    const/4 p2, -0x1

    if-le p1, p2, :cond_0

    .line 17
    iget-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/InflaterInputStreamWithStatistics;->uncompressedCount:J

    :cond_0
    return p1
.end method
