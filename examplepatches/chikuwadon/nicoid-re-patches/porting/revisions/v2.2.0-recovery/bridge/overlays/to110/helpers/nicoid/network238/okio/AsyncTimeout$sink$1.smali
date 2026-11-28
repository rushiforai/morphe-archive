.class public final Lnicoid/network238/okio/AsyncTimeout$sink$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Sink;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/AsyncTimeout;->sink(Lnicoid/network238/okio/Sink;)Lnicoid/network238/okio/Sink;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0008\u0010\u0008\u001a\u00020\u0003H\u0016J\u0008\u0010\t\u001a\u00020\u0003H\u0016J\u0008\u0010\n\u001a\u00020\u000bH\u0016J\u0008\u0010\u000c\u001a\u00020\rH\u0016\u00a8\u0006\u000e"
    }
    d2 = {
        "nicoid/network238/okio/AsyncTimeout$sink$1",
        "Lnicoid/network238/okio/Sink;",
        "write",
        "",
        "source",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
        "",
        "flush",
        "close",
        "timeout",
        "Lnicoid/network238/okio/AsyncTimeout;",
        "toString",
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
.field final synthetic $sink:Lnicoid/network238/okio/Sink;

.field final synthetic this$0:Lnicoid/network238/okio/AsyncTimeout;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/AsyncTimeout;Lnicoid/network238/okio/Sink;)V
    .registers 3

    iput-object p1, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iput-object p2, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->$sink:Lnicoid/network238/okio/Sink;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 161
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->$sink:Lnicoid/network238/okio/Sink;

    .line 538
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 161
    :try_start_0
    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->close()V

    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 546
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 547
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catch_0
    move-exception v1

    .line 544
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    :cond_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 546
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 547
    throw v1
.end method

.method public flush()V
    .registers 4

    .line 157
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->$sink:Lnicoid/network238/okio/Sink;

    .line 527
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 157
    :try_start_0
    invoke-interface {v1}, Lnicoid/network238/okio/Sink;->flush()V

    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 535
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v1

    if-nez v1, :cond_0

    return-void

    .line 536
    :cond_0
    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v0

    throw v0

    :catch_0
    move-exception v1

    .line 533
    :try_start_1
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {v0, v1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object v1

    :cond_1
    throw v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v1

    .line 535
    invoke-virtual {v0}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 536
    throw v1
.end method

.method public timeout()Lnicoid/network238/okio/AsyncTimeout;
    .registers 2

    .line 164
    iget-object v0, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    return-object v0
.end method

.method public bridge synthetic timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 131
    invoke-virtual {p0}, Lnicoid/network238/okio/AsyncTimeout$sink$1;->timeout()Lnicoid/network238/okio/AsyncTimeout;

    move-result-object v0

    return-object v0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 166
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "AsyncTimeout.sink("

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->$sink:Lnicoid/network238/okio/Sink;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x29

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public write(Lnicoid/network238/okio/Buffer;J)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 133
    invoke-virtual {p1}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v0

    const-wide/16 v2, 0x0

    move-wide v4, p2

    invoke-static/range {v0 .. v5}, Lnicoid/network238/okio/-SegmentedByteString;->checkOffsetAndCount(JJJ)V

    :goto_0
    const-wide/16 v0, 0x0

    cmp-long v2, p2, v0

    if-lez v2, :cond_4

    .line 139
    iget-object v2, p1, Lnicoid/network238/okio/Buffer;->head:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :goto_1
    const-wide/32 v3, 0x10000

    cmp-long v3, v0, v3

    if-gez v3, :cond_1

    .line 141
    iget v3, v2, Lnicoid/network238/okio/Segment;->limit:I

    iget v4, v2, Lnicoid/network238/okio/Segment;->pos:I

    sub-int/2addr v3, v4

    int-to-long v3, v3

    add-long/2addr v0, v3

    cmp-long v3, v0, p2

    if-ltz v3, :cond_0

    move-wide v0, p2

    goto :goto_2

    .line 147
    :cond_0
    iget-object v2, v2, Lnicoid/network238/okio/Segment;->next:Lnicoid/network238/okio/Segment;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_1

    .line 151
    :cond_1
    :goto_2
    iget-object v2, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->this$0:Lnicoid/network238/okio/AsyncTimeout;

    iget-object v3, p0, Lnicoid/network238/okio/AsyncTimeout$sink$1;->$sink:Lnicoid/network238/okio/Sink;

    .line 516
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->enter()V

    .line 151
    :try_start_0
    invoke-interface {v3, p1, v0, v1}, Lnicoid/network238/okio/Sink;->write(Lnicoid/network238/okio/Buffer;J)V

    sget-object v3, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 524
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result v3

    if-nez v3, :cond_2

    sub-long/2addr p2, v0

    goto :goto_0

    .line 525
    :cond_2
    const/4 p1, 0x0

    invoke-virtual {v2, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    throw p1

    :catch_0
    move-exception v0

    move-object p1, v0

    .line 522
    :try_start_1
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    move-result p2

    if-eqz p2, :cond_3

    invoke-virtual {v2, p1}, Lnicoid/network238/okio/AsyncTimeout;->access$newTimeoutException(Ljava/io/IOException;)Ljava/io/IOException;

    move-result-object p1

    :cond_3
    throw p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :catchall_0
    move-exception v0

    move-object p1, v0

    .line 524
    invoke-virtual {v2}, Lnicoid/network238/okio/AsyncTimeout;->exit()Z

    .line 525
    throw p1

    :cond_4
    return-void
.end method
