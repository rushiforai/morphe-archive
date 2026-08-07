.class public Lorg/eclipse/jetty/io/SimpleBuffers;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lorg/eclipse/jetty/io/Buffers;


# instance fields
.field final _buffer:Lorg/eclipse/jetty/io/Buffer;

.field _bufferOut:Z

.field final _header:Lorg/eclipse/jetty/io/Buffer;

.field _headerOut:Z


# direct methods
.method public constructor <init>(Lorg/eclipse/jetty/io/Buffer;Lorg/eclipse/jetty/io/Buffer;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 5
    .line 6
    iput-object p2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public getBuffer()Lorg/eclipse/jetty/io/Buffer;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_bufferOut:Z

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_bufferOut:Z

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-object v0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    if-eqz v0, :cond_1

    .line 18
    .line 19
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 28
    .line 29
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_headerOut:Z

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_headerOut:Z

    .line 40
    .line 41
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-object v0

    .line 45
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 50
    .line 51
    iget-object v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 58
    .line 59
    .line 60
    monitor-exit p0

    .line 61
    return-object v0

    .line 62
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 63
    .line 64
    const/16 v1, 0x1000

    .line 65
    .line 66
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 67
    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return-object v0

    .line 71
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw v0
.end method

.method public getBuffer(I)Lorg/eclipse/jetty/io/Buffer;
    .locals 1

    .line 73
    monitor-enter p0

    .line 74
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    move-result v0

    if-ne v0, p1, :cond_0

    .line 75
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/SimpleBuffers;->getHeader()Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 76
    :cond_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    move-result v0

    if-ne v0, p1, :cond_1

    .line 77
    invoke-virtual {p0}, Lorg/eclipse/jetty/io/SimpleBuffers;->getBuffer()Lorg/eclipse/jetty/io/Buffer;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :cond_1
    const/4 p1, 0x0

    .line 78
    monitor-exit p0

    return-object p1

    .line 79
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p1
.end method

.method public getHeader()Lorg/eclipse/jetty/io/Buffer;
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_headerOut:Z

    .line 8
    .line 9
    if-nez v2, :cond_0

    .line 10
    .line 11
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_headerOut:Z

    .line 12
    .line 13
    monitor-exit p0

    .line 14
    return-object v0

    .line 15
    :catchall_0
    move-exception v0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 18
    .line 19
    if-eqz v2, :cond_1

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-interface {v0}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    iget-object v2, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 28
    .line 29
    invoke-interface {v2}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-ne v0, v2, :cond_1

    .line 34
    .line 35
    iget-boolean v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_bufferOut:Z

    .line 36
    .line 37
    if-nez v0, :cond_1

    .line 38
    .line 39
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_bufferOut:Z

    .line 40
    .line 41
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 42
    .line 43
    monitor-exit p0

    .line 44
    return-object v0

    .line 45
    :cond_1
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 46
    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 50
    .line 51
    iget-object v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 52
    .line 53
    invoke-interface {v1}, Lorg/eclipse/jetty/io/Buffer;->capacity()I

    .line 54
    .line 55
    .line 56
    move-result v1

    .line 57
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 58
    .line 59
    .line 60
    monitor-exit p0

    .line 61
    return-object v0

    .line 62
    :cond_2
    new-instance v0, Lorg/eclipse/jetty/io/ByteArrayBuffer;

    .line 63
    .line 64
    const/16 v1, 0x1000

    .line 65
    .line 66
    invoke-direct {v0, v1}, Lorg/eclipse/jetty/io/ByteArrayBuffer;-><init>(I)V

    .line 67
    .line 68
    .line 69
    monitor-exit p0

    .line 70
    return-object v0

    .line 71
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 72
    throw v0
.end method

.method public returnBuffer(Lorg/eclipse/jetty/io/Buffer;)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-interface {p1}, Lorg/eclipse/jetty/io/Buffer;->clear()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_header:Lorg/eclipse/jetty/io/Buffer;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    if-ne p1, v0, :cond_0

    .line 9
    .line 10
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_headerOut:Z

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_1

    .line 15
    :cond_0
    :goto_0
    iget-object v0, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_buffer:Lorg/eclipse/jetty/io/Buffer;

    .line 16
    .line 17
    if-ne p1, v0, :cond_1

    .line 18
    .line 19
    iput-boolean v1, p0, Lorg/eclipse/jetty/io/SimpleBuffers;->_bufferOut:Z

    .line 20
    .line 21
    :cond_1
    monitor-exit p0

    .line 22
    return-void

    .line 23
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    throw p1
.end method
