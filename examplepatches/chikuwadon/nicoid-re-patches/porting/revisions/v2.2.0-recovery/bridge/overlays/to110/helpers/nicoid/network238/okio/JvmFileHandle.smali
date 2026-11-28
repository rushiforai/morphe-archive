.class public final Lnicoid/network238/okio/JvmFileHandle;
.super Lnicoid/network238/okio/FileHandle;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0002\n\u0002\u0010\u0008\n\u0002\u0008\u0002\n\u0002\u0010\u0012\n\u0002\u0008\u0006\u0008\u0000\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0010\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000bH\u0014J\u0008\u0010\u000c\u001a\u00020\u000bH\u0014J(\u0010\r\u001a\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u000eH\u0014J(\u0010\u0014\u001a\u00020\t2\u0006\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0012\u001a\u00020\u000e2\u0006\u0010\u0013\u001a\u00020\u000eH\u0014J\u0008\u0010\u0015\u001a\u00020\tH\u0014J\u0008\u0010\u0016\u001a\u00020\tH\u0014R\u000e\u0010\u0004\u001a\u00020\u0005X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0017"
    }
    d2 = {
        "Lnicoid/network238/okio/JvmFileHandle;",
        "Lnicoid/network238/okio/FileHandle;",
        "readWrite",
        "",
        "randomAccessFile",
        "Ljava/io/RandomAccessFile;",
        "<init>",
        "(ZLjava/io/RandomAccessFile;)V",
        "protectedResize",
        "",
        "size",
        "",
        "protectedSize",
        "protectedRead",
        "",
        "fileOffset",
        "array",
        "",
        "arrayOffset",
        "byteCount",
        "protectedWrite",
        "protectedFlush",
        "protectedClose",
        "okio"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final randomAccessFile:Ljava/io/RandomAccessFile;


# direct methods
.method public constructor <init>(ZLjava/io/RandomAccessFile;)V
    .registers 3

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 20
    invoke-direct {p0, p1}, Lnicoid/network238/okio/FileHandle;-><init>(Z)V

    .line 22
    iput-object p2, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    return-void
.end method


# virtual methods
.method protected declared-synchronized protectedClose()V
    .registers 2

    monitor-enter p0

    .line 79
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->close()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 79
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method protected declared-synchronized protectedFlush()V
    .registers 2

    monitor-enter p0

    .line 74
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getFD()Ljava/io/FileDescriptor;

    move-result-object v0

    invoke-virtual {v0}, Ljava/io/FileDescriptor;->sync()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 74
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method protected declared-synchronized protectedRead(J[BII)I
    .registers 7

    monitor-enter p0

    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 48
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    const/4 p1, 0x0

    :goto_0
    if-ge p1, p5, :cond_1

    .line 51
    iget-object p2, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    sub-int v0, p5, p1

    invoke-virtual {p2, p3, p4, v0}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const/4 v0, -0x1

    if-ne p2, v0, :cond_0

    if-nez p1, :cond_1

    monitor-exit p0

    return v0

    :cond_0
    add-int/2addr p1, p2

    goto :goto_0

    :cond_1
    monitor-exit p0

    return p1

    .line 47
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1
.end method

.method protected declared-synchronized protectedResize(J)V
    .registers 10

    monitor-enter p0

    .line 27
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/okio/FileHandle;->size()J

    move-result-wide v2

    sub-long v0, p1, v2

    const-wide/16 v4, 0x0

    cmp-long v4, v0, v4

    if-lez v4, :cond_0

    long-to-int v6, v0

    .line 30
    new-array v4, v6, [B

    const/4 v5, 0x0

    move-object v1, p0

    invoke-virtual/range {v1 .. v6}, Lnicoid/network238/okio/JvmFileHandle;->protectedWrite(J[BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 32
    :cond_0
    :try_start_1
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->setLength(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    monitor-exit p0

    return-void

    .line 26
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception v0

    move-object p1, v0

    goto :goto_0
.end method

.method protected declared-synchronized protectedSize()J
    .registers 3

    monitor-enter p0

    .line 38
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->length()J

    move-result-wide v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-wide v0

    .line 38
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method protected declared-synchronized protectedWrite(J[BII)V
    .registers 7

    monitor-enter p0

    :try_start_0
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    iget-object v0, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {v0, p1, p2}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 69
    iget-object p1, p0, Lnicoid/network238/okio/JvmFileHandle;->randomAccessFile:Ljava/io/RandomAccessFile;

    invoke-virtual {p1, p3, p4, p5}, Ljava/io/RandomAccessFile;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 67
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
