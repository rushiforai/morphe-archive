.class public abstract Lnicoid/network238/okhttp3/internal/concurrent/Task;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00000\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\t\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0008\u0003\u0008&\u0018\u00002\u00020\u0001B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0008\u0010\u0018\u001a\u00020\u0013H&J\u0015\u0010\u0019\u001a\u00020\u001a2\u0006\u0010\u000c\u001a\u00020\rH\u0000\u00a2\u0006\u0002\u0008\u001bJ\u0008\u0010\u001c\u001a\u00020\u0003H\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000bR\u001c\u0010\u000c\u001a\u0004\u0018\u00010\rX\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000e\u0010\u000f\"\u0004\u0008\u0010\u0010\u0011R\u001a\u0010\u0012\u001a\u00020\u0013X\u0080\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015\"\u0004\u0008\u0016\u0010\u0017\u00a8\u0006\u001d"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "",
        "name",
        "",
        "cancelable",
        "",
        "<init>",
        "(Ljava/lang/String;Z)V",
        "getName",
        "()Ljava/lang/String;",
        "getCancelable",
        "()Z",
        "queue",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "getQueue$okhttp",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "setQueue$okhttp",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V",
        "nextExecuteNanoTime",
        "",
        "getNextExecuteNanoTime$okhttp",
        "()J",
        "setNextExecuteNanoTime$okhttp",
        "(J)V",
        "runOnce",
        "initQueue",
        "",
        "initQueue$okhttp",
        "toString",
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
.field private final cancelable:Z

.field private final name:Ljava/lang/String;

.field private nextExecuteNanoTime:J

.field private queue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;


# direct methods
.method public constructor <init>(Ljava/lang/String;Z)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 50
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->name:Ljava/lang/String;

    .line 51
    iput-boolean p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->cancelable:Z

    .line 57
    const-wide/16 p1, -0x1

    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->nextExecuteNanoTime:J

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/String;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x1

    .line 49
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;Z)V

    return-void
.end method


# virtual methods
.method public final getCancelable()Z
    .registers 2

    .line 51
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->cancelable:Z

    return v0
.end method

.method public final getName()Ljava/lang/String;
    .registers 2

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->name:Ljava/lang/String;

    return-object v0
.end method

.method public final getNextExecuteNanoTime$okhttp()J
    .registers 3

    .line 57
    iget-wide v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->nextExecuteNanoTime:J

    return-wide v0
.end method

.method public final getQueue$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .registers 2

    .line 54
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->queue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    return-object v0
.end method

.method public final initQueue$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->queue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    if-ne v0, p1, :cond_0

    return-void

    :cond_0
    if-nez v0, :cond_1

    .line 66
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->queue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    return-void

    .line 65
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "task is in multiple queues"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public abstract runOnce()J
.end method

.method public final setNextExecuteNanoTime$okhttp(J)V
    .registers 3

    .line 57
    iput-wide p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->nextExecuteNanoTime:J

    return-void
.end method

.method public final setQueue$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V
    .registers 2

    .line 54
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->queue:Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 69
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/Task;->name:Ljava/lang/String;

    return-object v0
.end method
