.class public final Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000&\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0008\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001a\u0010\u0011\u001a\u00020\u00122\u0008\u0008\u0002\u0010\n\u001a\u00020\t2\u0008\u0008\u0002\u0010\r\u001a\u00020\tJ\u0008\u0010\u0013\u001a\u00020\u0014H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u001e\u0010\n\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\t@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000b\u0010\u000cR\u001e\u0010\r\u001a\u00020\t2\u0006\u0010\u0008\u001a\u00020\t@BX\u0086\u000e\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u000e\u0010\u000cR\u0011\u0010\u000f\u001a\u00020\t8F\u00a2\u0006\u0006\u001a\u0004\u0008\u0010\u0010\u000c\u00a8\u0006\u0015"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;",
        "",
        "streamId",
        "",
        "<init>",
        "(I)V",
        "getStreamId",
        "()I",
        "value",
        "",
        "total",
        "getTotal",
        "()J",
        "acknowledged",
        "getAcknowledged",
        "unacknowledged",
        "getUnacknowledged",
        "update",
        "",
        "toString",
        "",
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
.field private acknowledged:J

.field private final streamId:I

.field private total:J


# direct methods
.method public constructor <init>(I)V
    .registers 2

    .line 18
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 19
    iput p1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->streamId:I

    return-void
.end method

.method public static synthetic update$default(Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;JJILjava/lang/Object;)V
    .registers 9

    and-int/lit8 p6, p5, 0x1

    const-wide/16 v0, 0x0

    if-eqz p6, :cond_0

    move-wide p1, v0

    :cond_0
    and-int/lit8 p5, p5, 0x2

    if-eqz p5, :cond_1

    move-wide p3, v0

    .line 33
    :cond_1
    invoke-virtual {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->update(JJ)V

    return-void
.end method


# virtual methods
.method public final getAcknowledged()J
    .registers 3

    .line 26
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->acknowledged:J

    return-wide v0
.end method

.method public final getStreamId()I
    .registers 2

    .line 19
    iget v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->streamId:I

    return v0
.end method

.method public final getTotal()J
    .registers 3

    .line 22
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->total:J

    return-wide v0
.end method

.method public final declared-synchronized getUnacknowledged()J
    .registers 5

    monitor-enter p0

    .line 30
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->total:J

    iget-wide v2, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->acknowledged:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v0, v2

    monitor-exit p0

    return-wide v0

    .line 30
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

.method public toString()Ljava/lang/String;
    .registers 4

    .line 47
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "WindowCounter(streamId="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->streamId:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", total="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->total:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", acknowledged="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->acknowledged:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, ", unacknowledged="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->getUnacknowledged()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public final declared-synchronized update(JJ)V
    .registers 8

    monitor-enter p0

    const-wide/16 v0, 0x0

    cmp-long v2, p1, v0

    if-ltz v2, :cond_2

    cmp-long v0, p3, v0

    if-ltz v0, :cond_1

    .line 40
    :try_start_0
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->total:J

    add-long/2addr v0, p1

    iput-wide v0, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->total:J

    .line 41
    iget-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->acknowledged:J

    add-long/2addr p1, p3

    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/http2/flowcontrol/WindowCounter;->acknowledged:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    cmp-long p1, p1, v0

    if-gtz p1, :cond_0

    monitor-exit p0

    return-void

    .line 43
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 38
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 37
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 36
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method
