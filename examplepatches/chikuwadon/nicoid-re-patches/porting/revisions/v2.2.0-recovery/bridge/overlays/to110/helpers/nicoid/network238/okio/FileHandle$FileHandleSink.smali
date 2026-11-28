.class final Lnicoid/network238/okio/FileHandle$FileHandleSink;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/FileHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileHandleSink"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0005\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u00172\u0006\u0010\u0018\u001a\u00020\u0005H\u0016J\u0008\u0010\u0019\u001a\u00020\u0015H\u0016J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016J\u0008\u0010\u001c\u001a\u00020\u0015H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u001a\u0010\u000e\u001a\u00020\u000fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okio/FileHandle$FileHandleSink;",
        "Lnicoid/network238/okio/Sink;",
        "fileHandle",
        "Lnicoid/network238/okio/FileHandle;",
        "position",
        "",
        "<init>",
        "(Lnicoid/network238/okio/FileHandle;J)V",
        "getFileHandle",
        "()Lnicoid/network238/okio/FileHandle;",
        "getPosition",
        "()J",
        "setPosition",
        "(J)V",
        "closed",
        "",
        "getClosed",
        "()Z",
        "setClosed",
        "(Z)V",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "flush",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
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
.field private closed:Z

.field private final fileHandle:Lnicoid/network238/okio/FileHandle;

.field private position:J


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/FileHandle;J)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 388
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 389
    iput-object p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    .line 390
    iput-wide p2, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 408
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 409
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    .line 410
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    .line 446
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 411
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Lnicoid/network238/okio/FileHandle;->access$setOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;I)V

    .line 412
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;)I

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->closed:Z
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getClosed$p(Lnicoid/network238/okio/FileHandle;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 413
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 414
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle;->protectedClose()V

    return-void

    .line 446
    :cond_1
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public flush()V
    .registers 3

    .line 401
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    if-nez v0, :cond_0

    .line 402
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle;->protectedFlush()V

    return-void

    .line 401
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "closed"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getClosed()Z
    .registers 2

    .line 392
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    return v0
.end method

.method public final getFileHandle()Lnicoid/network238/okio/FileHandle;
    .registers 2

    .line 389
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    return-object v0
.end method

.method public final getPosition()J
    .registers 3

    .line 390
    iget-wide v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    return-wide v0
.end method

.method public final setClosed(Z)V
    .registers 2

    .line 392
    iput-boolean p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    return-void
.end method

.method public final setPosition(J)V
    .registers 3

    .line 390
    iput-wide p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 405
    sget-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 395
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->closed:Z

    if-nez v0, :cond_0

    .line 396
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->fileHandle:Lnicoid/network238/okio/FileHandle;

    iget-wide v2, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    move-object v4, p1

    move-wide v5, p2

    # invokes: Lnicoid/network238/okio/FileHandle;->writeNoCloseCheck(JLnicoid/network238/okio/Buffer;J)V
    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/FileHandle;->access$writeNoCloseCheck(Lnicoid/network238/okio/FileHandle;JLnicoid/network238/okio/Buffer;J)V

    .line 397
    iget-wide p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    add-long/2addr p1, v5

    iput-wide p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSink;->position:J

    return-void

    .line 395
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
