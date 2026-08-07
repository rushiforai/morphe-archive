.class public Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;
.super Lorg/eclipse/jetty/io/AbstractBuffer;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/Buffer;


# static fields
.field static final synthetic $assertionsDisabled:Z


# instance fields
.field final _capacity:I

.field final _channel:Ljava/nio/channels/FileChannel;

.field final _file:Ljava/io/RandomAccessFile;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method public constructor <init>(Ljava/io/File;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    const/4 v0, 0x2

    const/4 v1, 0x1

    .line 47
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 48
    new-instance v0, Ljava/io/RandomAccessFile;

    const-string v1, "rw"

    invoke-direct {v0, p1, v1}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 49
    invoke-virtual {v0}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object v0

    iput-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_channel:Ljava/nio/channels/FileChannel;

    const v0, 0x7fffffff

    .line 50
    iput v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_capacity:I

    const/4 v0, 0x0

    .line 51
    invoke-virtual {p0, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 52
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide v0

    long-to-int p1, v0

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;I)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    const/4 v0, 0x2

    const/4 v1, 0x1

    .line 41
    invoke-direct {p0, v0, v1}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 42
    iput p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_capacity:I

    .line 43
    new-instance p2, Ljava/io/RandomAccessFile;

    const-string v0, "rw"

    invoke-direct {p2, p1, v0}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    iput-object p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 44
    invoke-virtual {p2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    move-result-object p2

    iput-object p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_channel:Ljava/nio/channels/FileChannel;

    const/4 p2, 0x0

    .line 45
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 46
    invoke-virtual {p1}, Ljava/io/File;->length()J

    move-result-wide p1

    long-to-int p1, p1

    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    return-void
.end method

.method public constructor <init>(Ljava/io/File;II)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/FileNotFoundException;
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p3, v0}, Lorg/eclipse/jetty/io/AbstractBuffer;-><init>(IZ)V

    .line 3
    .line 4
    .line 5
    iput p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_capacity:I

    .line 6
    .line 7
    new-instance p2, Ljava/io/RandomAccessFile;

    .line 8
    .line 9
    const/4 v0, 0x2

    .line 10
    if-ne p3, v0, :cond_0

    .line 11
    .line 12
    const-string p3, "rw"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p3, "r"

    .line 16
    .line 17
    :goto_0
    invoke-direct {p2, p1, p3}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iput-object p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 21
    .line 22
    invoke-virtual {p2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 23
    .line 24
    .line 25
    move-result-object p2

    .line 26
    iput-object p2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_channel:Ljava/nio/channels/FileChannel;

    .line 27
    .line 28
    const/4 p2, 0x0

    .line 29
    invoke-virtual {p0, p2}, Lorg/eclipse/jetty/io/AbstractBuffer;->setGetIndex(I)V

    .line 30
    .line 31
    .line 32
    invoke-virtual {p1}, Ljava/io/File;->length()J

    .line 33
    .line 34
    .line 35
    move-result-wide p1

    .line 36
    long-to-int p1, p1

    .line 37
    invoke-virtual {p0, p1}, Lorg/eclipse/jetty/io/AbstractBuffer;->setPutIndex(I)V

    .line 38
    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public array()[B
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public capacity()I
    .locals 0

    .line 1
    iget p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_capacity:I

    .line 2
    .line 3
    return p0
.end method

.method public clear()V
    .locals 3

    .line 1
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    monitor-enter v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    :try_start_1
    invoke-super {p0}, Lorg/eclipse/jetty/io/AbstractBuffer;->clear()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    invoke-virtual {p0, v1, v2}, Ljava/io/RandomAccessFile;->setLength(J)V

    .line 12
    .line 13
    .line 14
    monitor-exit v0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p0

    .line 17
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 18
    :try_start_2
    throw p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    invoke-static {p0}, Ll/iig0;->a(Ljava/lang/Throwable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public peek()B
    .locals 5

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 5
    .line 6
    int-to-long v1, v1

    .line 7
    iget-object v3, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 8
    .line 9
    invoke-virtual {v3}, Ljava/io/RandomAccessFile;->getFilePointer()J

    .line 10
    .line 11
    .line 12
    move-result-wide v3

    .line 13
    cmp-long v1, v1, v3

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 18
    .line 19
    iget v2, p0, Lorg/eclipse/jetty/io/AbstractBuffer;->_get:I

    .line 20
    .line 21
    int-to-long v2, v2

    .line 22
    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 23
    .line 24
    .line 25
    goto :goto_0

    .line 26
    :catchall_0
    move-exception p0

    .line 27
    goto :goto_2

    .line 28
    :catch_0
    move-exception p0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :goto_0
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 31
    .line 32
    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readByte()B

    .line 33
    .line 34
    .line 35
    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    :try_start_1
    monitor-exit v0

    .line 37
    return p0

    .line 38
    :goto_1
    new-instance v1, Ljava/lang/RuntimeException;

    .line 39
    .line 40
    invoke-direct {v1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    throw v1

    .line 44
    :goto_2
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 45
    throw p0
.end method

.method public peek(I)B
    .locals 4

    .line 46
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    monitor-enter v0

    .line 47
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 48
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {p0}, Ljava/io/RandomAccessFile;->readByte()B

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 49
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 50
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public peek(I[BII)I
    .locals 4

    .line 51
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    monitor-enter v0

    .line 52
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 53
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {p0, p2, p3, p4}, Ljava/io/RandomAccessFile;->read([BII)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    :try_start_1
    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 54
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 55
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public poke(I[BII)I
    .locals 4

    .line 28
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    monitor-enter v0

    .line 29
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    int-to-long v2, p1

    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 30
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    invoke-virtual {p0, p2, p3, p4}, Ljava/io/RandomAccessFile;->write([BII)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    :try_start_1
    monitor-exit v0

    return p4

    :catchall_0
    move-exception p0

    goto :goto_0

    :catch_0
    move-exception p0

    .line 32
    new-instance p1, Ljava/lang/RuntimeException;

    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw p1

    .line 33
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method

.method public poke(IB)V
    .locals 4

    .line 1
    iget-object v0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 5
    .line 6
    int-to-long v2, p1

    .line 7
    invoke-virtual {v1, v2, v3}, Ljava/io/RandomAccessFile;->seek(J)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 11
    .line 12
    invoke-virtual {p0, p2}, Ljava/io/RandomAccessFile;->writeByte(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    .line 14
    .line 15
    :try_start_1
    monitor-exit v0

    .line 16
    return-void

    .line 17
    :catchall_0
    move-exception p0

    .line 18
    goto :goto_0

    .line 19
    :catch_0
    move-exception p0

    .line 20
    new-instance p1, Ljava/lang/RuntimeException;

    .line 21
    .line 22
    invoke-direct {p1, p0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    throw p1

    .line 26
    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 27
    throw p0
.end method

.method public writeTo(Ljava/nio/channels/WritableByteChannel;II)I
    .locals 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object v1, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_file:Ljava/io/RandomAccessFile;

    .line 2
    .line 3
    monitor-enter v1

    .line 4
    :try_start_0
    iget-object v2, p0, Lorg/eclipse/jetty/io/nio/RandomAccessFileBuffer;->_channel:Ljava/nio/channels/FileChannel;

    .line 5
    .line 6
    int-to-long v3, p2

    .line 7
    int-to-long v5, p3

    .line 8
    move-object v7, p1

    .line 9
    invoke-virtual/range {v2 .. v7}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J

    .line 10
    .line 11
    .line 12
    move-result-wide p0

    .line 13
    long-to-int p0, p0

    .line 14
    monitor-exit v1

    .line 15
    return p0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    move-object p0, v0

    .line 18
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    throw p0
.end method
