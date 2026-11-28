.class public final Lnicoid/network238/okio/Pipe$source$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okio/Source;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okio/Pipe;-><init>(J)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000%\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0002\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0018\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\u0005H\u0016J\u0008\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u000b"
    }
    d2 = {
        "nicoid/network238/okio/Pipe$source$1",
        "Lnicoid/network238/okio/Source;",
        "timeout",
        "Lnicoid/network238/okio/Timeout;",
        "read",
        "",
        "sink",
        "Lnicoid/network238/okio/Buffer;",
        "byteCount",
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
.field final synthetic this$0:Lnicoid/network238/okio/Pipe;

.field private final timeout:Lnicoid/network238/okio/Timeout;


# direct methods
.method constructor <init>(Lnicoid/network238/okio/Pipe;)V
    .registers 2

    iput-object p1, p0, Lnicoid/network238/okio/Pipe$source$1;->this$0:Lnicoid/network238/okio/Pipe;

    .line 131
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 132
    new-instance p1, Lnicoid/network238/okio/Timeout;

    invoke-direct {p1}, Lnicoid/network238/okio/Timeout;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okio/Pipe$source$1;->timeout:Lnicoid/network238/okio/Timeout;

    return-void
.end method


# virtual methods
.method public close()V
    .registers 4

    .line 152
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$source$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/Pipe$source$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 153
    const/4 v2, 0x1

    :try_start_0
    invoke-virtual {v1, v2}, Lnicoid/network238/okio/Pipe;->setSourceClosed$okio(Z)V

    .line 154
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/concurrent/locks/Condition;->signalAll()V

    .line 155
    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 152
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void

    :catchall_0
    move-exception v1

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw v1
.end method

.method public read(Lnicoid/network238/okio/Buffer;J)J
    .registers 12

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 135
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$source$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-virtual {v0}, Lnicoid/network238/okio/Pipe;->getLock()Ljava/util/concurrent/locks/ReentrantLock;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/okio/Pipe$source$1;->this$0:Lnicoid/network238/okio/Pipe;

    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 136
    :try_start_0
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSourceClosed$okio()Z

    move-result v2

    if-nez v2, :cond_4

    .line 137
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCanceled$okio()Z

    move-result v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    const-string v3, "canceled"

    if-nez v2, :cond_3

    .line 139
    :goto_0
    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okio/Buffer;->size()J

    move-result-wide v4

    const-wide/16 v6, 0x0

    cmp-long v2, v4, v6

    if-nez v2, :cond_2

    .line 140
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getSinkClosed$okio()Z

    move-result v2
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-eqz v2, :cond_0

    .line 135
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    const-wide/16 p1, -0x1

    return-wide p1

    .line 141
    :cond_0
    :try_start_2
    iget-object v2, p0, Lnicoid/network238/okio/Pipe$source$1;->timeout:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object v4

    invoke-virtual {v2, v4}, Lnicoid/network238/okio/Timeout;->awaitSignal(Ljava/util/concurrent/locks/Condition;)V

    .line 142
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCanceled$okio()Z

    move-result v2

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 145
    :cond_2
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getBuffer$okio()Lnicoid/network238/okio/Buffer;

    move-result-object v2

    invoke-virtual {v2, p1, p2, p3}, Lnicoid/network238/okio/Buffer;->read(Lnicoid/network238/okio/Buffer;J)J

    move-result-wide p1

    .line 146
    invoke-virtual {v1}, Lnicoid/network238/okio/Pipe;->getCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/concurrent/locks/Condition;->signalAll()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 135
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-wide p1

    .line 137
    :cond_3
    :try_start_3
    new-instance p1, Ljava/io/IOException;

    invoke-direct {p1, v3}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 136
    :cond_4
    const-string p1, "closed"

    new-instance p2, Ljava/lang/IllegalStateException;

    invoke-direct {p2, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    :catchall_0
    move-exception p1

    .line 135
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    throw p1
.end method

.method public timeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 158
    iget-object v0, p0, Lnicoid/network238/okio/Pipe$source$1;->timeout:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method
