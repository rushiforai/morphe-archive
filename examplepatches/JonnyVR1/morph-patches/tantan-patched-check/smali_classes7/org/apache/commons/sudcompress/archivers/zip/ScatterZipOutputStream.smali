.class public Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;,
        Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;
    }
.end annotation


# instance fields
.field private final backingStore:Ll/sng0;

.field private isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private final items:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;",
            ">;"
        }
    .end annotation
.end field

.field private final streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

.field private zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;


# direct methods
.method public constructor <init>(Ll/sng0;Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 20
    .line 21
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->backingStore:Ll/sng0;

    .line 22
    .line 23
    iput-object p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 24
    .line 25
    return-void
.end method

.method public static bridge synthetic b(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)Ll/sng0;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->backingStore:Ll/sng0;

    return-object p0
.end method

.method public static bridge synthetic d(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)Ljava/util/Queue;
    .locals 0

    .line 1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    return-object p0
.end method

.method public static fileBased(Ljava/io/File;)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 1

    const/4 v0, -0x1

    .line 16
    invoke-static {p0, v0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->fileBased(Ljava/io/File;I)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    move-result-object p0

    return-object p0
.end method

.method public static fileBased(Ljava/io/File;I)Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;
    .locals 1

    .line 1
    new-instance v0, Ll/qjg0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/qjg0;-><init>(Ljava/io/File;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->create(ILl/sng0;)Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    new-instance p1, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;

    .line 11
    .line 12
    invoke-direct {p1, v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;-><init>(Ll/sng0;Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;)V

    .line 13
    .line 14
    .line 15
    return-object p1
.end method


# virtual methods
.method public addArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;)V
    .locals 9

    .line 1
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->getPayloadStream()Ljava/io/InputStream;

    .line 2
    .line 3
    .line 4
    move-result-object v1

    .line 5
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 6
    .line 7
    invoke-virtual {p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;->getMethod()I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    invoke-virtual {v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->deflate(Ljava/io/InputStream;I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 12
    .line 13
    .line 14
    if-eqz v1, :cond_0

    .line 15
    .line 16
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    .line 17
    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    .line 20
    .line 21
    new-instance v1, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;

    .line 22
    .line 23
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 24
    .line 25
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getCrc32()J

    .line 26
    .line 27
    .line 28
    move-result-wide v3

    .line 29
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 30
    .line 31
    invoke-virtual {v2}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getBytesWrittenForLastEntry()J

    .line 32
    .line 33
    .line 34
    move-result-wide v5

    .line 35
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 36
    .line 37
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->getBytesRead()J

    .line 38
    .line 39
    .line 40
    move-result-wide v7

    .line 41
    move-object v2, p1

    .line 42
    invoke-direct/range {v1 .. v8}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntryRequest;JJJ)V

    .line 43
    .line 44
    .line 45
    invoke-interface {v0, v1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    move-object p0, v0

    .line 51
    if-eqz v1, :cond_1

    .line 52
    .line 53
    :try_start_1
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_1
    move-exception v0

    .line 58
    move-object p1, v0

    .line 59
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    :cond_1
    :goto_0
    throw p0
.end method

.method public close()V
    .locals 3

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->isClosed:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    const/4 v2, 0x1

    .line 5
    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    :try_start_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    invoke-virtual {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;->close()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_1

    .line 22
    :cond_1
    :goto_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->backingStore:Ll/sng0;

    .line 23
    .line 24
    invoke-interface {v0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    .line 27
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 28
    .line 29
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->close()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :goto_1
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->streamCompressor:Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;

    .line 34
    .line 35
    invoke-virtual {p0}, Lorg/apache/commons/sudcompress/archivers/zip/StreamCompressor;->close()V

    .line 36
    .line 37
    .line 38
    throw v0
.end method

.method public writeTo(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->backingStore:Ll/sng0;

    .line 2
    .line 3
    check-cast v0, Ll/qjg0;

    .line 4
    .line 5
    iget-boolean v1, v0, Ll/qjg0;->c:Z

    .line 6
    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    iget-object v1, v0, Ll/qjg0;->b:Ljava/io/OutputStream;

    .line 10
    .line 11
    invoke-virtual {v1}, Ljava/io/OutputStream;->close()V

    .line 12
    .line 13
    .line 14
    const/4 v1, 0x1

    .line 15
    iput-boolean v1, v0, Ll/qjg0;->c:Z

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->backingStore:Ll/sng0;

    .line 18
    .line 19
    check-cast v0, Ll/qjg0;

    .line 20
    .line 21
    invoke-virtual {v0}, Ll/qjg0;->k()Ljava/io/InputStream;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    :try_start_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->items:Ljava/util/Queue;

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 32
    .line 33
    .line 34
    move-result v1

    .line 35
    if-eqz v1, :cond_1

    .line 36
    .line 37
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    check-cast v1, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;

    .line 42
    .line 43
    new-instance v2, Ll/ung0;

    .line 44
    .line 45
    iget-wide v3, v1, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->compressedSize:J

    .line 46
    .line 47
    invoke-direct {v2, v0, v3, v4}, Ll/ung0;-><init>(Ljava/io/InputStream;J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 48
    .line 49
    .line 50
    :try_start_1
    invoke-virtual {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$CompressedEntry;->transferToArchiveEntry()Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    invoke-virtual {p1, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveOutputStream;->addRawArchiveEntry(Lorg/apache/commons/sudcompress/archivers/zip/ZipArchiveEntry;Ljava/io/InputStream;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 55
    .line 56
    .line 57
    goto :goto_0

    .line 58
    :catchall_0
    move-exception p0

    .line 59
    :try_start_2
    throw p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 60
    :catchall_1
    move-exception p0

    .line 61
    goto :goto_1

    .line 62
    :cond_1
    if-eqz v0, :cond_2

    .line 63
    .line 64
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V

    .line 65
    .line 66
    .line 67
    :cond_2
    return-void

    .line 68
    :goto_1
    if-eqz v0, :cond_3

    .line 69
    .line 70
    :try_start_3
    invoke-virtual {v0}, Ljava/io/InputStream;->close()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 71
    .line 72
    .line 73
    goto :goto_2

    .line 74
    :catchall_2
    move-exception p1

    .line 75
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    :goto_2
    throw p0
.end method

.method public zipEntryWriter()Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;
    .locals 1

    .line 1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 6
    .line 7
    invoke-direct {v0, p0}, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;-><init>(Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream;->zipEntryWriter:Lorg/apache/commons/sudcompress/archivers/zip/ScatterZipOutputStream$ZipEntryWriter;

    .line 13
    .line 14
    return-object p0
.end method
