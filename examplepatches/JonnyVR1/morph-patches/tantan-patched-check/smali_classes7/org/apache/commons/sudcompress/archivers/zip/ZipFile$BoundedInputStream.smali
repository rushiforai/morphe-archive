.class Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;
.super Ljava/io/InputStream;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "BoundedInputStream"
.end annotation


# instance fields
.field private final end:J

.field private loc:J

.field private singleByteBuffer:Ljava/nio/ByteBuffer;

.field final synthetic this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;


# direct methods
.method public constructor <init>(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;JJ)V
    .locals 2

    .line 1
    iput-object p1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 4
    .line 5
    .line 6
    add-long v0, p2, p4

    .line 7
    .line 8
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->end:J

    .line 9
    .line 10
    cmp-long p1, v0, p2

    .line 11
    .line 12
    if-ltz p1, :cond_0

    .line 13
    .line 14
    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    .line 18
    .line 19
    new-instance p1, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    const-string v0, "Invalid length of stream at offset="

    .line 22
    .line 23
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p1, p2, p3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    const-string p2, ", length="

    .line 30
    .line 31
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {p1, p4, p5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    throw p0
.end method


# virtual methods
.method public declared-synchronized read()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 3
    .line 4
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->end:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-ltz v0, :cond_0

    .line 9
    .line 10
    monitor-exit p0

    .line 11
    const/4 p0, -0x1

    .line 12
    return p0

    .line 13
    :cond_0
    :try_start_1
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->singleByteBuffer:Ljava/nio/ByteBuffer;

    .line 14
    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x1

    .line 18
    invoke-static {v0}, Ljava/nio/ByteBuffer;->allocate(I)Ljava/nio/ByteBuffer;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->singleByteBuffer:Ljava/nio/ByteBuffer;

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_1

    .line 27
    :cond_1
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->rewind()Ljava/nio/Buffer;

    .line 28
    .line 29
    .line 30
    :goto_0
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 31
    .line 32
    iget-object v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->singleByteBuffer:Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    invoke-virtual {p0, v0, v1, v2}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->read(JLjava/nio/ByteBuffer;)I

    .line 35
    .line 36
    .line 37
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    if-gez v0, :cond_2

    .line 39
    .line 40
    monitor-exit p0

    .line 41
    return v0

    .line 42
    :cond_2
    :try_start_2
    iget-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 43
    .line 44
    const-wide/16 v2, 0x1

    .line 45
    .line 46
    add-long/2addr v0, v2

    .line 47
    iput-wide v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    .line 48
    .line 49
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->singleByteBuffer:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    invoke-virtual {v0}, Ljava/nio/ByteBuffer;->get()B

    .line 52
    .line 53
    .line 54
    move-result v0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 55
    and-int/lit16 v0, v0, 0xff

    .line 56
    .line 57
    monitor-exit p0

    .line 58
    return v0

    .line 59
    :goto_1
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 60
    throw v0
.end method

.method public read(JLjava/nio/ByteBuffer;)I
    .locals 2

    .line 65
    iget-object v0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    invoke-static {v0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)Ljava/nio/channels/SeekableByteChannel;

    move-result-object v0

    monitor-enter v0

    .line 66
    :try_start_0
    iget-object v1, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    invoke-static {v1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)Ljava/nio/channels/SeekableByteChannel;

    move-result-object v1

    invoke-interface {v1, p1, p2}, Ljava/nio/channels/SeekableByteChannel;->position(J)Ljava/nio/channels/SeekableByteChannel;

    .line 67
    iget-object p0, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->this$0:Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;

    invoke-static {p0}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;->b(Lorg/apache/commons/sudcompress/archivers/zip/ZipFile;)Ljava/nio/channels/SeekableByteChannel;

    move-result-object p0

    invoke-interface {p0, p3}, Ljava/nio/channels/SeekableByteChannel;->read(Ljava/nio/ByteBuffer;)I

    move-result p0

    .line 68
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 69
    invoke-virtual {p3}, Ljava/nio/ByteBuffer;->flip()Ljava/nio/Buffer;

    return p0

    :catchall_0
    move-exception p0

    .line 70
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public declared-synchronized read([BII)I
    .locals 8

    monitor-enter p0

    if-gtz p3, :cond_0

    monitor-exit p0

    const/4 p0, 0x0

    return p0

    :cond_0
    int-to-long v0, p3

    .line 61
    :try_start_0
    iget-wide v2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->end:J

    iget-wide v4, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long v6, v2, v4

    cmp-long v0, v0, v6

    if-lez v0, :cond_2

    cmp-long p3, v4, v2

    if-ltz p3, :cond_1

    monitor-exit p0

    const/4 p0, -0x1

    return p0

    :cond_1
    long-to-int p3, v6

    .line 62
    :cond_2
    :try_start_1
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 63
    iget-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    invoke-virtual {p0, p2, p3, p1}, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->read(JLjava/nio/ByteBuffer;)I

    move-result p1

    if-lez p1, :cond_3

    .line 64
    iget-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lorg/apache/commons/sudcompress/archivers/zip/ZipFile$BoundedInputStream;->loc:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :cond_3
    monitor-exit p0

    return p1

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1
.end method
