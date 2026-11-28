.class public final Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/Closeable;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u000e\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u0007J\u0008\u0010\u000f\u001a\u00020\rH\u0016J\u0014\u0010\u0010\u001a\u00020\u0003*\u00020\u00072\u0006\u0010\u0011\u001a\u00020\u0012H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0008\u001a\u00020\tX\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0013"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;",
        "Ljava/io/Closeable;",
        "noContextTakeover",
        "",
        "<init>",
        "(Z)V",
        "deflatedBytes",
        "Lnicoid/network238/okio/Buffer;",
        "deflater",
        "Ljava/util/zip/Deflater;",
        "deflaterSink",
        "Lnicoid/network238/okio/DeflaterSink;",
        "deflate",
        "",
        "buffer",
        "close",
        "endsWith",
        "suffix",
        "Lnicoid/network238/okio/ByteString;",
        "okhttp"
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
.field private final deflatedBytes:Lnicoid/network238/okio/Buffer;

.field private final deflater:Ljava/util/zip/Deflater;

.field private final deflaterSink:Lnicoid/network238/okio/DeflaterSink;

.field private final noContextTakeover:Z


# direct methods
.method public constructor <init>(Z)V
    .registers 5

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->noContextTakeover:Z

    .line 32
    new-instance p1, Lnicoid/network238/okio/Buffer;

    invoke-direct {p1}, Lnicoid/network238/okio/Buffer;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    .line 35
    new-instance v0, Ljava/util/zip/Deflater;

    const/4 v1, -0x1

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Ljava/util/zip/Deflater;-><init>(IZ)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflater:Ljava/util/zip/Deflater;

    .line 41
    new-instance v1, Lnicoid/network238/okio/DeflaterSink;

    invoke-direct {v1, p1, v0}, Lnicoid/network238/okio/DeflaterSink;-><init>(Lnicoid/network238/okio/Sink;Ljava/util/zip/Deflater;)V

    iput-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    return-void
.end method

.method private final endsWith(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;)Z
    .registers 7

    .line 71
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    invoke-virtual {p2}, Lnicoid/network238/okio/ByteString;->size()I

    move-result v2

    int-to-long v2, v2

    sub-long/2addr v0, v2

    invoke-virtual {p1, v0, v1, p2}, Lnicoid/network238/okio/Buffer;->rangeEquals(JLnicoid/network238/okio/ByteString;)Z

    move-result p1

    return p1
.end method


# virtual methods
.method public close()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/DeflaterSink;->close()V

    return-void
.end method

.method public final deflate(Lnicoid/network238/okio/Buffer;)V
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 46
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_2

    .line 48
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->noContextTakeover:Z

    if-eqz v0, :cond_0

    .line 49
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflater:Ljava/util/zip/Deflater;

    invoke-virtual {v0}, Ljava/util/zip/Deflater;->reset()V

    .line 52
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {v0, p1, v1, v2}, Lnicoid/network238/okio/DeflaterSink;->write(Lnicoid/network238/okio/Buffer;J)V

    .line 53
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflaterSink:Lnicoid/network238/okio/DeflaterSink;

    invoke-virtual {v0}, Lnicoid/network238/okio/DeflaterSink;->flush()V

    .line 55
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    # getter for: Lnicoid/network238/okhttp3/internal/ws/MessageDeflaterKt;->EMPTY_DEFLATE_BLOCK:Lnicoid/network238/okio/ByteString;
    invoke-static {}, Lnicoid/network238/okhttp3/internal/ws/MessageDeflaterKt;->access$getEMPTY_DEFLATE_BLOCK$p()Lnicoid/network238/okio/ByteString;

    move-result-object v1

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->endsWith(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/ByteString;)Z

    move-result v0

    .line 62
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    if-eqz v0, :cond_1

    .line 56
    invoke-virtual {v1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x4

    sub-long/2addr v0, v2

    .line 57
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    const/4 v3, 0x1

    const/4 v4, 0x0

    invoke-static {v2, v4, v3, v4}, Lnicoid/network238/okio/Buffer;->readAndWriteUnsafe$default(Lnicoid/network238/okio/Buffer;Lnicoid/network238/okio/Buffer$UnsafeCursor;ILjava/lang/Object;)Lnicoid/network238/okio/Buffer$UnsafeCursor;

    move-result-object v2

    .line 58
    :try_start_0
    invoke-virtual {v2, v0, v1}, Lnicoid/network238/okio/Buffer$UnsafeCursor;->resizeBuffer(J)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 57
    invoke-static {v2, v4}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    goto :goto_0

    :catchall_0
    move-exception p1

    :try_start_1
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :catchall_1
    move-exception v0

    invoke-static {v2, p1}, Lnicoid/network238/kotlin/io/CloseableKt;->closeFinally(Ljava/io/Closeable;Ljava/lang/Throwable;)V

    throw v0

    :cond_1
    nop

    .line 62
    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Lnicoid/network238/okio/Buffer;->writeByte(I)Lnicoid/network238/okio/Buffer;

    .line 65
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/ws/MessageDeflater;->deflatedBytes:Lnicoid/network238/okio/Buffer;

    invoke-virtual {v0}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v1

    invoke-virtual {p1, v0, v1, v2}, Lnicoid/network238/okio/Buffer;->write(Lnicoid/network238/okio/Buffer;J)V

    return-void

    .line 46
    :cond_2
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Failed requirement."

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
