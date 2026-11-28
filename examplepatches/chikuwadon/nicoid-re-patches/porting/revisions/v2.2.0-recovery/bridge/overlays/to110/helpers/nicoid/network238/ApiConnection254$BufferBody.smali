.class final Lnicoid/network238/ApiConnection254$BufferBody;
.super Ljava/io/OutputStream;
.source "ApiConnection254.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/ApiConnection254;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "BufferBody"
.end annotation


# instance fields
.field private final bytes:Ljava/io/ByteArrayOutputStream;

.field private closed:Z


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 55
    invoke-direct {p0}, Ljava/io/OutputStream;-><init>()V

    .line 56
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v0}, Ljava/io/ByteArrayOutputStream;-><init>()V

    iput-object v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->bytes:Ljava/io/ByteArrayOutputStream;

    return-void
.end method

.method synthetic constructor <init>(Lnicoid/network238/ApiConnection254$1;)V
    .registers 2

    .line 55
    invoke-direct {p0}, Lnicoid/network238/ApiConnection254$BufferBody;-><init>()V

    return-void
.end method

.method private check(I)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 57
    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->closed:Z

    if-nez v0, :cond_1

    if-ltz p1, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->bytes:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v0

    const/high16 v1, 0x100000

    sub-int/2addr v1, v0

    if-gt p1, v1, :cond_0

    return-void

    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "API request too large"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Closed"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method


# virtual methods
.method public declared-synchronized close()V
    .registers 2

    monitor-enter p0

    .line 60
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->closed:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 60
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

.method declared-synchronized seal()[B
    .registers 2

    monitor-enter p0

    .line 61
    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->closed:Z

    iget-object v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->bytes:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    .line 61
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

.method public declared-synchronized write(I)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 58
    const/4 v0, 0x1

    :try_start_0
    invoke-direct {p0, v0}, Lnicoid/network238/ApiConnection254$BufferBody;->check(I)V

    iget-object v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->bytes:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1}, Ljava/io/ByteArrayOutputStream;->write(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 58
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

.method public declared-synchronized write([BII)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 59
    if-ltz p2, :cond_0

    if-ltz p3, :cond_0

    :try_start_0
    array-length v0, p1

    sub-int/2addr v0, p3

    if-gt p2, v0, :cond_0

    invoke-direct {p0, p3}, Lnicoid/network238/ApiConnection254$BufferBody;->check(I)V

    iget-object v0, p0, Lnicoid/network238/ApiConnection254$BufferBody;->bytes:Ljava/io/ByteArrayOutputStream;

    invoke-virtual {v0, p1, p2, p3}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IndexOutOfBoundsException;

    invoke-direct {p1}, Ljava/lang/IndexOutOfBoundsException;-><init>()V

    throw p1

    .line 59
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
