.class final Lnicoid/network238/okio/FileHandle$FileHandleSource;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okio/FileHandle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FileHandleSource"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0018\u0010\u0014\u001a\u00020\u00052\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u0005H\u0016J\u0008\u0010\u0018\u001a\u00020\u0019H\u0016J\u0008\u0010\u001a\u001a\u00020\u001bH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u001a\u0010\u0004\u001a\u00020\u0005X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\n\u0010\u000b\"\u0004\u0008\u000c\u0010\rR\u001a\u0010\u000e\u001a\u00020\u000fX\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0010\u0010\u0011\"\u0004\u0008\u0012\u0010\u0013\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okio/FileHandle$FileHandleSource;",
        "Lnicoid/network238/okio/Source;",
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
        "read",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "close",
        "",
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

    .line 418
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 419
    iput-object p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    .line 420
    iput-wide p2, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 434
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->closed:Z

    if-eqz v0, :cond_0

    return-void

    .line 435
    :cond_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->closed:Z

    .line 436
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    .line 446
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 437
    :try_start_0
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;)I

    move-result v2

    add-int/lit8 v2, v2, -0x1

    invoke-static {v1, v2}, Lnicoid/network238/okio/FileHandle;->access$setOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;I)V

    .line 438
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;)I

    move-result v1

    if-nez v1, :cond_1

    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    # getter for: Lnicoid/network238/okio/FileHandle;->closed:Z
    invoke-static {v1}, Lnicoid/network238/okio/FileHandle;->access$getClosed$p(Lnicoid/network238/okio/FileHandle;)Z

    move-result v1

    if-eqz v1, :cond_1

    .line 439
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 446
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 440
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

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

.method public final getClosed()Z
    .registers 2

    .line 422
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->closed:Z

    return v0
.end method

.method public final getFileHandle()Lnicoid/network238/okio/FileHandle;
    .registers 2

    .line 419
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    return-object v0
.end method

.method public final getPosition()J
    .registers 3

    .line 420
    iget-wide v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    return-wide v0
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 425
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->closed:Z

    if-nez v0, :cond_1

    .line 426
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->fileHandle:Lnicoid/network238/okio/FileHandle;

    iget-wide v2, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    move-object v4, p1

    move-wide v5, p2

    # invokes: Lnicoid/network238/okio/FileHandle;->readNoCloseCheck(JLnicoid/network238/okio/Buffer;J)J
    invoke-static/range {v1 .. v6}, Lnicoid/network238/okio/FileHandle;->access$readNoCloseCheck(Lnicoid/network238/okio/FileHandle;JLnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    const-wide/16 v0, -0x1

    cmp-long p3, p1, v0

    if-eqz p3, :cond_0

    .line 427
    iget-wide v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    :cond_0
    return-wide p1

    .line 425
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "closed"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final setClosed(Z)V
    .registers 2

    .line 422
    iput-boolean p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->closed:Z

    return-void
.end method

.method public final setPosition(J)V
    .registers 3

    .line 420
    iput-wide p1, p0, Lnicoid/network238/okio/FileHandle$FileHandleSource;->position:J

    return-void
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 431
    sget-object v0, Lnicoid/network238/okio/Timeout;->NONE:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method
