.class final Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;
.super Ljava/io/InputStream;
.source "FileBackedOutputStream.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/io/FileBackedOutputStream;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ChannelInputStream"
.end annotation


# instance fields
.field final channel:Ljava/nio/channels/FileChannel;

.field closed:Z

.field position:J


# direct methods
.method constructor <init>(Ljava/nio/channels/FileChannel;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "channel"
        }
    .end annotation

    .line 392
    invoke-direct {p0}, Ljava/io/InputStream;-><init>()V

    .line 393
    iput-object p1, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->channel:Ljava/nio/channels/FileChannel;

    return-void
.end method


# virtual methods
.method public declared-synchronized available()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 433
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->checkOpen()V

    .line 434
    iget-object v0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v0}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v0

    iget-wide v2, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J

    sub-long/2addr v0, v2

    const-wide/16 v2, 0x0

    invoke-static {v2, v3, v0, v1}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return v0

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

.method checkOpen()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 445
    iget-boolean p0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->closed:Z

    if-nez p0, :cond_0

    return-void

    .line 446
    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Stream closed"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public declared-synchronized close()V
    .registers 2

    monitor-enter p0

    const/4 v0, 0x1

    .line 440
    :try_start_0
    iput-boolean v0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 441
    monitor-exit p0

    return-void

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

.method public declared-synchronized read()I
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    const/4 v0, 0x1

    .line 398
    :try_start_0
    new-array v1, v0, [B

    const/4 v2, 0x0

    .line 399
    invoke-virtual {p0, v1, v2, v0}, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->read([BII)I

    move-result v3

    if-ne v3, v0, :cond_0

    aget-byte v0, v1, v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    and-int/lit16 v0, v0, 0xff

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    monitor-exit p0

    return v0

    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public declared-synchronized read([BII)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "b",
            "off",
            "len"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 404
    :try_start_0
    invoke-static {p1, p2, p3}, Ljava/nio/ByteBuffer;->wrap([BII)Ljava/nio/ByteBuffer;

    move-result-object p1

    .line 405
    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->checkOpen()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-nez p3, :cond_0

    .line 407
    monitor-exit p0

    const/4 p0, 0x0

    return p0

    .line 409
    :cond_0
    :try_start_1
    iget-object p2, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->channel:Ljava/nio/channels/FileChannel;

    iget-wide v0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J

    invoke-virtual {p2, p1, v0, v1}, Ljava/nio/channels/FileChannel;->read(Ljava/nio/ByteBuffer;J)I

    move-result p1

    if-lez p1, :cond_1

    .line 411
    iget-wide p2, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J

    int-to-long v0, p1

    add-long/2addr p2, v0

    iput-wide p2, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 413
    :cond_1
    monitor-exit p0

    return p1

    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized skip(J)J
    .registers 9
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "n"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 418
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->checkOpen()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-gtz v2, :cond_0

    .line 420
    monitor-exit p0

    return-wide v0

    .line 422
    :cond_0
    :try_start_1
    iget-object v2, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->channel:Ljava/nio/channels/FileChannel;

    invoke-virtual {v2}, Ljava/nio/channels/FileChannel;->size()J

    move-result-wide v2

    iget-wide v4, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    sub-long/2addr v2, v4

    cmp-long v4, v2, v0

    if-gtz v4, :cond_1

    .line 424
    monitor-exit p0

    return-wide v0

    .line 426
    :cond_1
    :try_start_2
    invoke-static {p1, p2, v2, v3}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p1

    .line 427
    iget-wide v0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lcom/google/common/io/FileBackedOutputStream$ChannelInputStream;->position:J
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 428
    monitor-exit p0

    return-wide p1

    :goto_0
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
