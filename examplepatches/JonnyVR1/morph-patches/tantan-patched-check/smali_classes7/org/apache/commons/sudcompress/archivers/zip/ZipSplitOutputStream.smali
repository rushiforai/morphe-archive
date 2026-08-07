.class Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;
.super Ljava/io/OutputStream;
.source "SourceFile"


# static fields
.field private static final ZIP_SEGMENT_MAX_SIZE:J = 0xffffffffL

.field private static final ZIP_SEGMENT_MIN_SIZE:J = 0x10000L


# instance fields
.field private currentSplitSegmentBytesWritten:J

.field private currentSplitSegmentIndex:I

.field private finished:Z

.field private outputStream:Ljava/io/OutputStream;

.field private final singleByte:[B

.field private final splitSize:J

.field private zipFile:Ljava/io/File;


# direct methods
.method public constructor <init>(Ljava/io/File;J)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 10
    .line 11
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->finished:Z

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    new-array v0, v0, [B

    .line 15
    .line 16
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->singleByte:[B

    .line 17
    .line 18
    const-wide/32 v0, 0x10000

    .line 19
    .line 20
    .line 21
    cmp-long v0, p2, v0

    .line 22
    .line 23
    if-ltz v0, :cond_0

    .line 24
    .line 25
    const-wide v0, 0xffffffffL

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    cmp-long v0, p2, v0

    .line 31
    .line 32
    if-gtz v0, :cond_0

    .line 33
    .line 34
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 35
    .line 36
    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->splitSize:J

    .line 37
    .line 38
    new-instance p2, Ljava/io/FileOutputStream;

    .line 39
    .line 40
    invoke-direct {p2, p1}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 41
    .line 42
    .line 43
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 44
    .line 45
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->writeZipSplitSignature()V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :cond_0
    const-string p0, "zip split segment size should between 64K and 4,294,967,295"

    .line 50
    .line 51
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    throw p0
.end method

.method private createNewSplitSegmentFile(Ljava/lang/Integer;)Ljava/io/File;
    .locals 3

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    iget p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 4
    .line 5
    add-int/lit8 p1, p1, 0x2

    .line 6
    .line 7
    goto :goto_0

    .line 8
    :cond_0
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    new-instance v1, Ljava/io/File;

    .line 23
    .line 24
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const/16 v1, 0x2e

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-gez v1, :cond_2

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_2
    const/4 v2, 0x0

    .line 41
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    :goto_1
    const/16 v1, 0x9

    .line 46
    .line 47
    if-gt p1, v1, :cond_3

    .line 48
    .line 49
    const-string v1, ".z0"

    .line 50
    .line 51
    invoke-static {p1, v1}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    goto :goto_2

    .line 56
    :cond_3
    const-string v1, ".z"

    .line 57
    .line 58
    invoke-static {p1, v1}, Ll/dmg0;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p1

    .line 62
    :goto_2
    new-instance v1, Ljava/io/File;

    .line 63
    .line 64
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    new-instance v2, Ljava/lang/StringBuilder;

    .line 71
    .line 72
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    invoke-direct {v1, p0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 89
    .line 90
    .line 91
    move-result p0

    .line 92
    if-nez p0, :cond_4

    .line 93
    .line 94
    return-object v1

    .line 95
    :cond_4
    new-instance p0, Ljava/io/IOException;

    .line 96
    .line 97
    new-instance v1, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v2, "split zip segment "

    .line 100
    .line 101
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 105
    .line 106
    .line 107
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    const-string p1, " already exists"

    .line 111
    .line 112
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 113
    .line 114
    .line 115
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    .line 120
    .line 121
    .line 122
    throw p0
.end method

.method private finish()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 6
    .line 7
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 16
    .line 17
    invoke-direct {v1, v0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const/16 v1, 0x2e

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/String;->lastIndexOf(I)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-gez v1, :cond_1

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :cond_1
    const/4 v2, 0x0

    .line 34
    invoke-virtual {v0, v2, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    :goto_0
    new-instance v1, Ljava/io/File;

    .line 39
    .line 40
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 41
    .line 42
    invoke-virtual {v2}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    new-instance v3, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    const-string v0, ".zip"

    .line 55
    .line 56
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    invoke-direct {v1, v2, v0}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 67
    .line 68
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 69
    .line 70
    .line 71
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 72
    .line 73
    invoke-virtual {v0, v1}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    if-eqz v0, :cond_2

    .line 78
    .line 79
    const/4 v0, 0x1

    .line 80
    iput-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->finished:Z

    .line 81
    .line 82
    return-void

    .line 83
    :cond_2
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 84
    .line 85
    const-string v0, " to "

    .line 86
    .line 87
    const-string v2, "Failed to rename "

    .line 88
    .line 89
    invoke-static {v2, p0, v0, v1}, Ll/ilw0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_3
    const-string p0, "This archive has already been finished"

    .line 94
    .line 95
    invoke-static {p0}, Ll/zpg0;->a(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    return-void
.end method

.method private openNewSplitSegment()Ljava/io/OutputStream;
    .locals 5

    .line 1
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 8
    .line 9
    invoke-virtual {v0}, Ljava/io/OutputStream;->close()V

    .line 10
    .line 11
    .line 12
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-direct {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->createNewSplitSegmentFile(Ljava/lang/Integer;)Ljava/io/File;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 21
    .line 22
    invoke-virtual {v3, v0}, Ljava/io/File;->renameTo(Ljava/io/File;)Z

    .line 23
    .line 24
    .line 25
    move-result v3

    .line 26
    if-eqz v3, :cond_0

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 30
    .line 31
    const-string v2, " to "

    .line 32
    .line 33
    const-string v3, "Failed to rename "

    .line 34
    .line 35
    invoke-static {v3, p0, v2, v0}, Ll/ilw0;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    return-object v1

    .line 39
    :cond_1
    :goto_0
    invoke-direct {p0, v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->createNewSplitSegmentFile(Ljava/lang/Integer;)Ljava/io/File;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 44
    .line 45
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 46
    .line 47
    .line 48
    new-instance v1, Ljava/io/FileOutputStream;

    .line 49
    .line 50
    invoke-direct {v1, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 51
    .line 52
    .line 53
    iput-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 54
    .line 55
    const-wide/16 v3, 0x0

    .line 56
    .line 57
    iput-wide v3, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 58
    .line 59
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->zipFile:Ljava/io/File;

    .line 60
    .line 61
    iget v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 62
    .line 63
    add-int/2addr v0, v2

    .line 64
    iput v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 65
    .line 66
    return-object v1
.end method

.method private writeZipSplitSignature()V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 2
    .line 3
    sget-object v1, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->DD_SIG:[B

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ljava/io/OutputStream;->write([B)V

    .line 6
    .line 7
    .line 8
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 9
    .line 10
    array-length v0, v1

    .line 11
    int-to-long v0, v0

    .line 12
    add-long/2addr v2, v0

    .line 13
    iput-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public close()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->finished:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->finish()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public getCurrentSplitSegmentBytesWritten()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getCurrentSplitSegmentIndex()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentIndex:I

    .line 2
    .line 3
    return p0
.end method

.method public prepareToWriteUnsplittableContent(J)V
    .locals 4

    .line 1
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->splitSize:J

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-gtz v2, :cond_1

    .line 6
    .line 7
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 8
    .line 9
    sub-long/2addr v0, v2

    .line 10
    cmp-long p1, v0, p1

    .line 11
    .line 12
    if-gez p1, :cond_0

    .line 13
    .line 14
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->openNewSplitSegment()Ljava/io/OutputStream;

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void

    .line 18
    :cond_1
    const-string p0, "The unsplittable content size is bigger than the split segment size"

    .line 19
    .line 20
    invoke-static {p0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public write(I)V
    .locals 2

    .line 53
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->singleByte:[B

    and-int/lit16 p1, p1, 0xff

    int-to-byte p1, p1

    const/4 v1, 0x0

    aput-byte p1, v0, v1

    .line 54
    invoke-virtual {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->write([B)V

    return-void
.end method

.method public write([B)V
    .locals 2

    .line 52
    array-length v0, p1

    const/4 v1, 0x0

    invoke-virtual {p0, p1, v1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->write([BII)V

    return-void
.end method

.method public write([BII)V
    .locals 8

    .line 1
    if-gtz p3, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 5
    .line 6
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->splitSize:J

    .line 7
    .line 8
    cmp-long v4, v0, v2

    .line 9
    .line 10
    if-ltz v4, :cond_1

    .line 11
    .line 12
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->openNewSplitSegment()Ljava/io/OutputStream;

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->write([BII)V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    int-to-long v4, p3

    .line 20
    add-long v6, v0, v4

    .line 21
    .line 22
    cmp-long v6, v6, v2

    .line 23
    .line 24
    if-lez v6, :cond_2

    .line 25
    .line 26
    long-to-int v2, v2

    .line 27
    long-to-int v0, v0

    .line 28
    sub-int/2addr v2, v0

    .line 29
    invoke-virtual {p0, p1, p2, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->write([BII)V

    .line 30
    .line 31
    .line 32
    invoke-direct {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->openNewSplitSegment()Ljava/io/OutputStream;

    .line 33
    .line 34
    .line 35
    add-int/2addr p2, v2

    .line 36
    sub-int/2addr p3, v2

    .line 37
    invoke-virtual {p0, p1, p2, p3}, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->write([BII)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_2
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->outputStream:Ljava/io/OutputStream;

    .line 42
    .line 43
    invoke-virtual {v0, p1, p2, p3}, Ljava/io/OutputStream;->write([BII)V

    .line 44
    .line 45
    .line 46
    iget-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 47
    .line 48
    add-long/2addr p1, v4

    .line 49
    iput-wide p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipSplitOutputStream;->currentSplitSegmentBytesWritten:J

    .line 50
    .line 51
    return-void
.end method
