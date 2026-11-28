.class public abstract Lnicoid/network238/okio/FileHandle;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okio/FileHandle$FileHandleSink;,
        Lnicoid/network238/okio/FileHandle$FileHandleSource;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0006\n\u0002\u0010\u0008\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0012\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\r\u0008&\u0018\u00002\u00060\u0001j\u0002`\u0002:\u0002/0B\u000f\u0012\u0006\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0004\u0008\u0005\u0010\u0006J&\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bJ\u001e\u0010\u0012\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u0014J\u0006\u0010\u001b\u001a\u00020\u0014J\u000e\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\u001b\u001a\u00020\u0014J&\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bJ\u001e\u0010\u001e\u001a\u00020\u001d2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u0014J\u0006\u0010 \u001a\u00020\u001dJ\u0010\u0010\u001f\u001a\u00020!2\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0014J\u000e\u0010\"\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020!J\u0016\u0010#\u001a\u00020\u001d2\u0006\u0010\u001f\u001a\u00020!2\u0006\u0010\"\u001a\u00020\u0014J\u0010\u0010\u0019\u001a\u00020$2\u0008\u0008\u0002\u0010\u0013\u001a\u00020\u0014J\u0006\u0010%\u001a\u00020$J\u000e\u0010\"\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020$J\u0016\u0010#\u001a\u00020\u001d2\u0006\u0010\u0019\u001a\u00020$2\u0006\u0010\"\u001a\u00020\u0014J\u0006\u0010&\u001a\u00020\u001dJ(\u0010\'\u001a\u00020\u000b2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bH$J(\u0010(\u001a\u00020\u001d2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00020\u00162\u0006\u0010\u0017\u001a\u00020\u000b2\u0006\u0010\u0018\u001a\u00020\u000bH$J\u0008\u0010)\u001a\u00020\u001dH$J\u0010\u0010*\u001a\u00020\u001d2\u0006\u0010\u001b\u001a\u00020\u0014H$J\u0008\u0010+\u001a\u00020\u0014H$J\u0008\u0010,\u001a\u00020\u001dH$J \u0010-\u001a\u00020\u00142\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u0014H\u0002J \u0010.\u001a\u00020\u001d2\u0006\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u001f\u001a\u00020\u001a2\u0006\u0010\u0018\u001a\u00020\u0014H\u0002R\u0011\u0010\u0003\u001a\u00020\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0007\u0010\u0008R\u000e\u0010\t\u001a\u00020\u0004X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0017\u0010\u000c\u001a\u00060\rj\u0002`\u000e\u00a2\u0006\n\n\u0002\u0010\u0011\u001a\u0004\u0008\u000f\u0010\u0010\u00a8\u00061"
    }
    d2 = {
        "Lnicoid/network238/okio/FileHandle;",
        "Ljava/io/Closeable;",
        "Lnicoid/network238/okio/Closeable;",
        "readWrite",
        "",
        "<init>",
        "(Z)V",
        "getReadWrite",
        "()Z",
        "closed",
        "openStreamCount",
        "",
        "lock",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "Lnicoid/network238/okio/Lock;",
        "getLock",
        "()Ljava/util/concurrent/locks/ReentrantLock;",
        "Ljava/util/concurrent/locks/ReentrantLock;",
        "read",
        "fileOffset",
        "",
        "array",
        "",
        "arrayOffset",
        "byteCount",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "size",
        "resize",
        "",
        "write",
        "source",
        "flush",
        "Lnicoid/network238/okio/Source;",
        "position",
        "reposition",
        "Lnicoid/network238/okio/Sink;",
        "appendingSink",
        "close",
        "protectedRead",
        "protectedWrite",
        "protectedFlush",
        "protectedResize",
        "protectedSize",
        "protectedClose",
        "readNoCloseCheck",
        "writeNoCloseCheck",
        "FileHandleSink",
        "FileHandleSource",
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

.field private final lock:Ljava/util/concurrent/locks/ReentrantLock;

.field private openStreamCount:I

.field private final readWrite:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 2

    .line 35
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-boolean p1, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    .line 55
    invoke-static {}, Lnicoid/network238/okio/_JvmPlatformKt;->newLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-void
.end method

.method public static final synthetic access$getClosed$p(Lnicoid/network238/okio/FileHandle;)Z
    .registers 1

    .line 35
    iget-boolean p0, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    return p0
.end method

.method public static final synthetic access$getOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;)I
    .registers 1

    .line 35
    iget p0, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I

    return p0
.end method

.method public static final synthetic access$readNoCloseCheck(Lnicoid/network238/okio/FileHandle;JLnicoid/network238/okio/Buffer;J)J
    .registers 6

    .line 35
    invoke-direct/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->readNoCloseCheck(JLnicoid/network238/okio/Buffer;J)J

    move-result-wide p0

    return-wide p0
.end method

.method public static final synthetic access$setOpenStreamCount$p(Lnicoid/network238/okio/FileHandle;I)V
    .registers 2

    .line 35
    iput p1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I

    return-void
.end method

.method public static final synthetic access$writeNoCloseCheck(Lnicoid/network238/okio/FileHandle;JLnicoid/network238/okio/Buffer;J)V
    .registers 6

    .line 35
    invoke-direct/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->writeNoCloseCheck(JLnicoid/network238/okio/Buffer;J)V

    return-void
.end method

.method private final readNoCloseCheck(JLnicoid/network238/okio/Buffer;J)J
    .registers 20

    move-object/from16 v0, p3

    move-wide/from16 v1, p4

    const-wide/16 v3, 0x0

    cmp-long v3, v1, v3

    if-ltz v3, :cond_3

    add-long/2addr v1, p1

    move-wide v4, p1

    :goto_0
    cmp-long v3, v4, v1

    if-gez v3, :cond_2

    .line 340
    const/4 v3, 0x1

    invoke-virtual {v0, v3}, Lnicoid/network238/okio/Buffer;->writableSegment$okio(I)Lnicoid/network238/okio/Segment;

    move-result-object v9

    .line 343
    iget-object v6, v9, Lnicoid/network238/okio/Segment;->data:[B

    .line 344
    iget v7, v9, Lnicoid/network238/okio/Segment;->limit:I

    sub-long v10, v1, v4

    rsub-int v3, v7, 0x2000

    int-to-long v12, v3

    .line 460
    invoke-static {v10, v11, v12, v13}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v10

    long-to-int v8, v10

    .line 341
    move-object v3, p0

    invoke-virtual/range {v3 .. v8}, Lnicoid/network238/okio/FileHandle;->protectedRead(J[BII)I

    move-result v6

    const/4 v3, -0x1

    if-ne v6, v3, :cond_1

    .line 349
    iget v1, v9, Lnicoid/network238/okio/Segment;->pos:I

    iget v2, v9, Lnicoid/network238/okio/Segment;->limit:I

    if-ne v1, v2, :cond_0

    .line 351
    invoke-virtual {v9}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object v1

    iput-object v1, v0, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 352
    invoke-static {v9}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    cmp-long v0, p1, v4

    if-nez v0, :cond_2

    const-wide/16 v0, -0x1

    return-wide v0

    .line 358
    :cond_1
    iget v3, v9, Lnicoid/network238/okio/Segment;->limit:I

    add-int/2addr v3, v6

    iput v3, v9, Lnicoid/network238/okio/Segment;->limit:I

    int-to-long v6, v6

    add-long/2addr v4, v6

    .line 360
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v8

    add-long/2addr v8, v6

    invoke-virtual {v0, v8, v9}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    goto :goto_0

    :cond_2
    sub-long/2addr v4, p1

    return-wide v4

    .line 334
    :cond_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "byteCount < 0: "

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw v1
.end method

.method public static synthetic sink$default(Lnicoid/network238/okio/FileHandle;JILjava/lang/Object;)Lnicoid/network238/okio/Sink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const-wide/16 p1, 0x0

    .line 219
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileHandle;->sink(J)Lnicoid/network238/okio/Sink;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: sink"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static synthetic source$default(Lnicoid/network238/okio/FileHandle;JILjava/lang/Object;)Lnicoid/network238/okio/Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    if-nez p4, :cond_1

    and-int/lit8 p3, p3, 0x1

    if-eqz p3, :cond_0

    const-wide/16 p1, 0x0

    .line 150
    :cond_0
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileHandle;->source(J)Lnicoid/network238/okio/Source;

    move-result-object p0

    return-object p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: source"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private final writeNoCloseCheck(JLnicoid/network238/okio/Buffer;J)V
    .registers 13

    .line 367
    invoke-virtual {p3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p4

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    add-long p4, p1, v4

    move-wide v1, p1

    :goto_0
    cmp-long p1, v1, p4

    if-gez p1, :cond_1

    .line 373
    iget-object p1, p3, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sub-long v3, p4, v1

    .line 374
    iget p2, p1, Lnicoid/network238/okio/Segment;->limit:I

    iget v0, p1, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr p2, v0

    int-to-long v5, p2

    .line 461
    invoke-static {v3, v4, v5, v6}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v5, v3

    .line 375
    iget-object v3, p1, Lnicoid/network238/okio/Segment;->data:[B

    iget v4, p1, Lnicoid/network238/okio/Segment;->pos:I

    move-object v0, p0

    invoke-virtual/range {v0 .. v5}, Lnicoid/network238/okio/FileHandle;->protectedWrite(J[BII)V

    .line 377
    iget p2, p1, Lnicoid/network238/okio/Segment;->pos:I

    add-int/2addr p2, v5

    iput p2, p1, Lnicoid/network238/okio/Segment;->pos:I

    int-to-long v3, v5

    add-long/2addr v1, v3

    .line 379
    invoke-virtual {p3}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v5

    sub-long/2addr v5, v3

    invoke-virtual {p3, v5, v6}, Lnicoid/network238/okio/Buffer;->setSize$okio(J)V

    .line 381
    iget p2, p1, Lnicoid/network238/okio/Segment;->pos:I

    iget v0, p1, Lnicoid/network238/okio/Segment;->limit:I

    if-ne p2, v0, :cond_0

    .line 382
    invoke-virtual {p1}, Lnicoid/network238/okio/Segment;->pop()Lnicoid/network238/okio/Segment;

    move-result-object p2

    iput-object p2, p3, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    .line 383
    invoke-static {p1}, Lnicoid/network238/okio/SegmentPool;->recycle(Lnicoid/network238/okio/Segment;)V

    :cond_0
    goto :goto_0

    :cond_1
    return-void
.end method


# virtual methods
.method public final appendingSink()Lnicoid/network238/okio/Sink;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 234
    invoke-virtual {p0}, Lnicoid/network238/okio/FileHandle;->size()J

    move-result-wide v0

    invoke-virtual {p0, v0, v1}, Lnicoid/network238/okio/FileHandle;->sink(J)Lnicoid/network238/okio/Sink;

    move-result-object v0

    return-object v0
.end method

.method public final close()V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 287
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 459
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 288
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-eqz v1, :cond_0

    goto :goto_0

    .line 289
    :cond_0
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    .line 290
    iget v1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v1, :cond_1

    .line 459
    :goto_0
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    .line 291
    :cond_1
    :try_start_1
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 459
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 292
    invoke-virtual {p0}, Lnicoid/network238/okio/FileHandle;->protectedClose()V

    return-void

    :catchall_0
    move-exception v1

    .line 459
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final flush()V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 138
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    if-eqz v0, :cond_1

    .line 139
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 452
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 140
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v1, :cond_0

    .line 141
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 452
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 142
    invoke-virtual {p0}, Lnicoid/network238/okio/FileHandle;->protectedFlush()V

    return-void

    .line 140
    :cond_0
    :try_start_1
    const-string v1, "closed"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 452
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1

    .line 138
    :cond_1
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "file handle is read-only"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public final getLock()Ljava/util/concurrent/locks/ReentrantLock;
    .registers 2

    .line 55
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    return-object v0
.end method

.method public final getReadWrite()Z
    .registers 2

    .line 41
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    return v0
.end method

.method public final position(Lnicoid/network238/okio/Sink;)J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 247
    instance-of v0, p1, Lnicoid/network238/okio/RealBufferedSink;

    if-eqz v0, :cond_0

    .line 248
    check-cast p1, Lnicoid/network238/okio/RealBufferedSink;

    .line 458
    iget-object v0, p1, Lnicoid/network238/okio/RealBufferedSink;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 248
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 249
    iget-object p1, p1, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    goto :goto_0

    .line 247
    :cond_0
    const-wide/16 v0, 0x0

    .line 252
    :goto_0
    instance-of v2, p1, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    if-eqz v2, :cond_2

    check-cast p1, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v2

    if-ne v2, p0, :cond_2

    .line 255
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 257
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getPosition()J

    move-result-wide v2

    add-long/2addr v2, v0

    return-wide v2

    .line 255
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 252
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "sink was not created by this FileHandle"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final position(Lnicoid/network238/okio/Source;)J
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 168
    instance-of v0, p1, Lnicoid/network238/okio/RealBufferedSource;

    if-eqz v0, :cond_0

    .line 169
    check-cast p1, Lnicoid/network238/okio/RealBufferedSource;

    .line 454
    iget-object v0, p1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 169
    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    .line 170
    iget-object p1, p1, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    goto :goto_0

    .line 168
    :cond_0
    const-wide/16 v0, 0x0

    .line 173
    :goto_0
    instance-of v2, p1, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    if-eqz v2, :cond_2

    check-cast p1, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v2

    if-ne v2, p0, :cond_2

    .line 176
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 178
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getPosition()J

    move-result-wide v2

    sub-long/2addr v2, v0

    return-wide v2

    .line 176
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "closed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 173
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "source was not created by this FileHandle"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method protected abstract protectedClose()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract protectedFlush()V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract protectedRead(J[BII)I
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract protectedResize(J)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract protectedSize()J
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method protected abstract protectedWrite(J[BII)V
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public final read(J[BII)I
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 69
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 445
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 70
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v0, :cond_0

    .line 71
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 445
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 72
    invoke-virtual/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->protectedRead(J[BII)I

    move-result p1

    return p1

    .line 70
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 445
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final read(JLnicoid/network238/okio/Buffer;J)J
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 81
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 447
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 82
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v0, :cond_0

    .line 83
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 447
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 84
    invoke-direct/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->readNoCloseCheck(JLnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    return-wide p1

    .line 82
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 447
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final reposition(Lnicoid/network238/okio/Sink;J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 267
    instance-of v0, p1, Lnicoid/network238/okio/RealBufferedSink;

    const-string v1, "closed"

    const-string v2, "sink was not created by this FileHandle"

    if-eqz v0, :cond_2

    .line 268
    check-cast p1, Lnicoid/network238/okio/RealBufferedSink;

    iget-object v0, p1, Lnicoid/network238/okio/RealBufferedSink;->sink:Lnicoid/network238/okio/Sink;

    .line 269
    instance-of v3, v0, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    if-eqz v3, :cond_1

    check-cast v0, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v3

    if-ne v3, p0, :cond_1

    .line 272
    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getClosed()Z

    move-result v2

    if-nez v2, :cond_0

    .line 274
    invoke-virtual {p1}, Lnicoid/network238/okio/RealBufferedSink;->emit()Lnicoid/network238/okio/BufferedSink;

    .line 275
    invoke-virtual {v0, p2, p3}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->setPosition(J)V

    return-void

    .line 272
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 269
    :cond_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 277
    :cond_2
    instance-of v0, p1, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    if-eqz v0, :cond_4

    check-cast p1, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v0

    if-ne v0, p0, :cond_4

    .line 280
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->getClosed()Z

    move-result v0

    if-nez v0, :cond_3

    .line 281
    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/FileHandle$FileHandleSink;->setPosition(J)V

    return-void

    .line 280
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 277
    :cond_4
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final reposition(Lnicoid/network238/okio/Source;J)V
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 188
    instance-of v0, p1, Lnicoid/network238/okio/RealBufferedSource;

    const-string v1, "closed"

    const-string v2, "source was not created by this FileHandle"

    if-eqz v0, :cond_3

    .line 189
    check-cast p1, Lnicoid/network238/okio/RealBufferedSource;

    iget-object v0, p1, Lnicoid/network238/okio/RealBufferedSource;->source:Lnicoid/network238/okio/Source;

    .line 190
    instance-of v3, v0, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    if-eqz v3, :cond_2

    check-cast v0, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v3

    if-ne v3, p0, :cond_2

    .line 193
    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getClosed()Z

    move-result v2

    if-nez v2, :cond_1

    .line 455
    iget-object v1, p1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 195
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    .line 196
    invoke-virtual {v0}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getPosition()J

    move-result-wide v3

    sub-long/2addr v3, v1

    sub-long v3, p2, v3

    const-wide/16 v5, 0x0

    cmp-long v5, v5, v3

    if-gtz v5, :cond_0

    cmp-long v1, v3, v1

    if-gez v1, :cond_0

    .line 199
    invoke-virtual {p1, v3, v4}, Lnicoid/network238/okio/RealBufferedSource;->skip(J)V

    return-void

    .line 456
    :cond_0
    iget-object p1, p1, Lnicoid/network238/okio/RealBufferedSource;->bufferField:Lnicoid/network238/okio/Buffer;

    .line 202
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->clear()V

    .line 203
    invoke-virtual {v0, p2, p3}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->setPosition(J)V

    return-void

    .line 193
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 190
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 206
    :cond_3
    instance-of v0, p1, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    if-eqz v0, :cond_5

    check-cast p1, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getFileHandle()Lnicoid/network238/okio/FileHandle;

    move-result-object v0

    if-ne v0, p0, :cond_5

    .line 209
    invoke-virtual {p1}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->getClosed()Z

    move-result v0

    if-nez v0, :cond_4

    .line 210
    invoke-virtual {p1, p2, p3}, Lnicoid/network238/okio/FileHandle$FileHandleSource;->setPosition(J)V

    return-void

    .line 209
    :cond_4
    new-instance p1, Ljava/lang/IllegalStateException;

    invoke-direct {p1, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 206
    :cond_5
    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-direct {p1, v2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final resize(J)V
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 104
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    if-eqz v0, :cond_1

    .line 105
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 449
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 106
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v1, :cond_0

    .line 107
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 449
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 108
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okio/FileHandle;->protectedResize(J)V

    return-void

    .line 106
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 449
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    .line 104
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "file handle is read-only"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final sink(J)Lnicoid/network238/okio/Sink;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 220
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    if-eqz v0, :cond_1

    .line 221
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 457
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 222
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v1, :cond_0

    .line 223
    iget v1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 457
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 225
    new-instance v0, Lnicoid/network238/okio/FileHandle$FileHandleSink;

    invoke-direct {v0, p0, p1, p2}, Lnicoid/network238/okio/FileHandle$FileHandleSink;-><init>(Lnicoid/network238/okio/FileHandle;J)V

    return-object v0

    .line 222
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 457
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    .line 220
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "file handle is read-only"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final size()J
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 448
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 93
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v1, :cond_0

    .line 94
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 448
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 95
    invoke-virtual {p0}, Lnicoid/network238/okio/FileHandle;->protectedSize()J

    move-result-wide v0

    return-wide v0

    .line 93
    :cond_0
    :try_start_1
    const-string v1, "closed"

    new-instance v2, Ljava/lang/IllegalStateException;

    invoke-direct {v2, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 448
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public final source(J)Lnicoid/network238/okio/Source;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    iget-object v0, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 453
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 152
    :try_start_0
    iget-boolean v1, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v1, :cond_0

    .line 153
    iget v1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I

    add-int/lit8 v1, v1, 0x1

    iput v1, p0, Lnicoid/network238/okio/FileHandle;->openStreamCount:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 453
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 155
    new-instance v0, Lnicoid/network238/okio/FileHandle$FileHandleSource;

    invoke-direct {v0, p0, p1, p2}, Lnicoid/network238/okio/FileHandle$FileHandleSource;-><init>(Lnicoid/network238/okio/FileHandle;J)V

    return-object v0

    .line 152
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception p1

    .line 453
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public final write(JLnicoid/network238/okio/Buffer;J)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    if-eqz v0, :cond_1

    .line 129
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 451
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 130
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v0, :cond_0

    .line 131
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 451
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 132
    invoke-direct/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->writeNoCloseCheck(JLnicoid/network238/okio/Buffer;J)V

    return-void

    .line 130
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 451
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    .line 128
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "file handle is read-only"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final write(J[BII)V
    .registers 8

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 118
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->readWrite:Z

    if-eqz v0, :cond_1

    .line 119
    iget-object v1, p0, Lnicoid/network238/okio/FileHandle;->lock:Ljava/util/concurrent/locks/ReentrantLock;

    .line 450
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 120
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/okio/FileHandle;->closed:Z

    if-nez v0, :cond_0

    .line 121
    sget-object v0, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 450
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 122
    invoke-virtual/range {p0 .. p5}, Lnicoid/network238/okio/FileHandle;->protectedWrite(J[BII)V

    return-void

    .line 120
    :cond_0
    :try_start_1
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 450
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1

    .line 118
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "file handle is read-only"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
