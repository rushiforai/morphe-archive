.class final Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "AwaitIdleTask"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u001a\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\u0008\u0002\u0018\u00002\u00020\u0001B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0008\u0010\u0008\u001a\u00020\tH\u0016R\u0011\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007\u00a8\u0006\n"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "<init>",
        "()V",
        "latch",
        "Ljava/util/concurrent/CountDownLatch;",
        "getLatch",
        "()Ljava/util/concurrent/CountDownLatch;",
        "runOnce",
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
.field private final latch:Ljava/util/concurrent/CountDownLatch;


# direct methods
.method public constructor <init>()V
    .registers 3

    .line 149
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v1, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " awaitIdle"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;Z)V

    .line 150
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->latch:Ljava/util/concurrent/CountDownLatch;

    return-void
.end method


# virtual methods
.method public final getLatch()Ljava/util/concurrent/CountDownLatch;
    .registers 2

    .line 150
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->latch:Ljava/util/concurrent/CountDownLatch;

    return-object v0
.end method

.method public runOnce()J
    .registers 3

    .line 153
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue$AwaitIdleTask;->latch:Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    const-wide/16 v0, -0x1

    return-wide v0
.end method
