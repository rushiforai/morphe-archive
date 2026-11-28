.class public final Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/concurrent/Lockable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;,
        Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Companion;,
        Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$RealBackend;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000V\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0008\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\t\n\u0002\u0008\u0003\n\u0002\u0010!\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0002\u0008\u0004\n\u0002\u0018\u0002\n\u0002\u0008\u0007\n\u0002\u0010 \n\u0002\u0008\u0005\u0018\u0000 -2\u00020\u0001:\u0003+,-B\u0019\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0008\u0008\u0002\u0010\u0004\u001a\u00020\u0005\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\u0015\u0010\u001b\u001a\u00020\u001c2\u0006\u0010\u001d\u001a\u00020\u0017H\u0000\u00a2\u0006\u0002\u0008\u001eJ\u0010\u0010\u001f\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020!H\u0002J \u0010\"\u001a\u00020\u001c2\u0006\u0010 \u001a\u00020!2\u0006\u0010#\u001a\u00020\u00122\u0006\u0010$\u001a\u00020\u0010H\u0002J\u0008\u0010%\u001a\u0004\u0018\u00010!J\u0008\u0010&\u001a\u00020\u001cH\u0002J\u0006\u0010\'\u001a\u00020\u0017J\u000c\u0010(\u001a\u0008\u0012\u0004\u0012\u00020\u00170)J\u0006\u0010*\u001a\u00020\u001cR\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0016\u0010\u0004\u001a\u00020\u0005X\u0080\u0004\u00a2\u0006\n\n\u0002\u0008\u000c\u001a\u0004\u0008\n\u0010\u000bR\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0010X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0011\u001a\u00020\u0012X\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0013\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0014\u001a\u00020\u000eX\u0082\u000e\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0015\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u0014\u0010\u0018\u001a\u0008\u0012\u0004\u0012\u00020\u00170\u0016X\u0082\u0004\u00a2\u0006\u0002\n\u0000R\u000e\u0010\u0019\u001a\u00020\u001aX\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006."
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "Lnicoid/network238/okhttp3/internal/concurrent/Lockable;",
        "backend",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;",
        "logger",
        "Ljava/util/logging/Logger;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;Ljava/util/logging/Logger;)V",
        "getBackend",
        "()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;",
        "getLogger$okhttp",
        "()Ljava/util/logging/Logger;",
        "logger$1",
        "nextQueueName",
        "",
        "coordinatorWaiting",
        "",
        "coordinatorWakeUpAt",
        "",
        "executeCallCount",
        "runCallCount",
        "busyQueues",
        "",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
        "readyQueues",
        "runnable",
        "Ljava/lang/Runnable;",
        "kickCoordinator",
        "",
        "taskQueue",
        "kickCoordinator$okhttp",
        "beforeRun",
        "task",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "afterRun",
        "delayNanos",
        "completedNormally",
        "awaitTaskToRun",
        "startAnotherThread",
        "newQueue",
        "activeQueues",
        "",
        "cancelAll",
        "Backend",
        "RealBackend",
        "Companion",
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


# static fields
.field public static final Companion:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Companion;

.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

.field private static final logger:Ljava/util/logging/Logger;


# instance fields
.field private final backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

.field private final busyQueues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
            ">;"
        }
    .end annotation
.end field

.field private coordinatorWaiting:Z

.field private coordinatorWakeUpAt:J

.field private executeCallCount:I

.field private final logger$1:Ljava/util/logging/Logger;

.field private nextQueueName:I

.field private final readyQueues:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
            ">;"
        }
    .end annotation
.end field

.field private runCallCount:I

.field private final runnable:Ljava/lang/Runnable;


# direct methods
.method static constructor <clinit>()V
    .registers 5

    new-instance v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->Companion:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Companion;

    .line 358
    const-class v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/util/logging/Logger;->getLogger(Ljava/lang/String;)Ljava/util/logging/Logger;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sput-object v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->logger:Ljava/util/logging/Logger;

    .line 361
    new-instance v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    new-instance v2, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$RealBackend;

    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    sget-object v4, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->okHttpName:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    const-string v4, " TaskRunner"

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    const/4 v4, 0x1

    invoke-static {v3, v4}, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->threadFactory(Ljava/lang/String;Z)Ljava/util/concurrent/ThreadFactory;

    move-result-object v3

    invoke-direct {v2, v3}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$RealBackend;-><init>(Ljava/util/concurrent/ThreadFactory;)V

    const/4 v3, 0x2

    invoke-direct {v0, v2, v1, v3, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;Ljava/util/logging/Logger;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;Ljava/util/logging/Logger;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 40
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 41
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    .line 42
    iput-object p2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->logger$1:Ljava/util/logging/Logger;

    .line 44
    const/16 p1, 0x2710

    iput p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->nextQueueName:I

    .line 60
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    .line 63
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    .line 66
    new-instance p1, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$runnable$1;

    invoke-direct {p1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$runnable$1;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->runnable:Ljava/lang/Runnable;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;Ljava/util/logging/Logger;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    .line 42
    sget-object p2, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->logger:Ljava/util/logging/Logger;

    .line 40
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;Ljava/util/logging/Logger;)V

    return-void
.end method

.method public static final synthetic access$afterRun(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)V
    .registers 5

    .line 40
    invoke-direct {p0, p1, p2, p3, p4}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->afterRun(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)V

    return-void
.end method

.method public static final synthetic access$getLogger$cp()Ljava/util/logging/Logger;
    .registers 1

    .line 40
    sget-object v0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->logger:Ljava/util/logging/Logger;

    return-object v0
.end method

.method public static final synthetic access$getRunCallCount$p(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)I
    .registers 1

    .line 40
    iget p0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->runCallCount:I

    return p0
.end method

.method public static final synthetic access$setRunCallCount$p(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;I)V
    .registers 2

    .line 40
    iput p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->runCallCount:I

    return-void
.end method

.method private final afterRun(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)V
    .registers 9

    .line 373
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 374
    new-instance p1, Ljava/lang/AssertionError;

    new-instance p2, Ljava/lang/StringBuilder;

    const-string p3, "Thread "

    invoke-direct {p2, p3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object p3

    invoke-virtual {p3}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    const-string p3, " MUST hold lock on "

    invoke-virtual {p2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-direct {p1, p2}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 142
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getQueue$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 143
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getActiveTask$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/Task;

    move-result-object v1

    if-ne v1, p1, :cond_3

    .line 145
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getCancelActiveTask$okhttp()Z

    move-result v1

    .line 146
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->setCancelActiveTask$okhttp(Z)V

    .line 147
    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->setActiveTask$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V

    .line 148
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    const-wide/16 v2, -0x1

    cmp-long v2, p2, v2

    if-eqz v2, :cond_1

    if-nez v1, :cond_1

    .line 150
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getShutdown$okhttp()Z

    move-result v1

    if-nez v1, :cond_1

    .line 151
    const/4 v1, 0x1

    invoke-virtual {v0, p1, p2, p3, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->scheduleAndDecide$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;JZ)Z

    .line 154
    :cond_1
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getFutureTasks$okhttp()Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-nez p1, :cond_2

    .line 155
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    if-nez p4, :cond_2

    .line 159
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->startAnotherThread()V

    :cond_2
    return-void

    .line 143
    :cond_3
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Check failed."

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method private final beforeRun(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V
    .registers 4

    .line 369
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 370
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    :cond_0
    nop

    .line 127
    const-wide/16 v0, -0x1

    invoke-virtual {p1, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->setNextExecuteNanoTime$okhttp(J)V

    .line 128
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getQueue$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 129
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getFutureTasks$okhttp()Ljava/util/List;

    move-result-object v1

    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 130
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 131
    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->setActiveTask$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V

    .line 132
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method private final startAnotherThread()V
    .registers 4

    .line 381
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 382
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 252
    :cond_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->executeCallCount:I

    iget v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->runCallCount:I

    if-le v0, v1, :cond_1

    return-void

    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 254
    iput v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->executeCallCount:I

    .line 255
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->runnable:Ljava/lang/Runnable;

    invoke-interface {v0, p0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->execute(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final activeQueues()Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;",
            ">;"
        }
    .end annotation

    .line 386
    monitor-enter p0

    .line 269
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->plus(Ljava/util/Collection;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 386
    monitor-exit p0

    return-object v0

    :catchall_0
    move-exception v0

    .line 269
    monitor-exit p0

    throw v0
.end method

.method public final awaitTaskToRun()Lnicoid/network238/okhttp3/internal/concurrent/Task;
    .registers 15

    .line 377
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 378
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 174
    :cond_0
    :goto_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    goto/16 :goto_3

    .line 178
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    invoke-interface {v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->nanoTime()J

    move-result-wide v2

    .line 186
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide v4, 0x7fffffffffffffffL

    move-object v6, v1

    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    const/4 v8, 0x1

    const/4 v9, 0x0

    if-eqz v7, :cond_4

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 187
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getFutureTasks$okhttp()Ljava/util/List;

    move-result-object v7

    invoke-interface {v7, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okhttp3/internal/concurrent/Task;

    .line 188
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/internal/concurrent/Task;->getNextExecuteNanoTime$okhttp()J

    move-result-wide v10

    sub-long/2addr v10, v2

    const-wide/16 v12, 0x0

    invoke-static {v12, v13, v10, v11}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v10

    cmp-long v12, v10, v12

    if-lez v12, :cond_2

    .line 193
    invoke-static {v10, v11, v4, v5}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v4

    goto :goto_1

    :cond_2
    if-eqz v6, :cond_3

    move v0, v8

    goto :goto_2

    :cond_3
    move-object v6, v7

    goto :goto_1

    .line 186
    :cond_4
    move v0, v9

    .line 193
    :goto_2
    if-eqz v6, :cond_7

    .line 214
    invoke-direct {p0, v6}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->beforeRun(Lnicoid/network238/okhttp3/internal/concurrent/Task;)V

    if-nez v0, :cond_5

    .line 217
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    if-nez v0, :cond_6

    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_6

    .line 218
    :cond_5
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->startAnotherThread()V

    :cond_6
    return-object v6

    .line 225
    :cond_7
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    if-eqz v0, :cond_9

    .line 226
    iget-wide v6, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWakeUpAt:J

    sub-long/2addr v6, v2

    cmp-long v0, v4, v6

    if-gez v0, :cond_8

    .line 227
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    invoke-interface {v0, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->coordinatorNotify(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    :cond_8
    :goto_3
    return-object v1

    :cond_9
    nop

    .line 234
    iput-boolean v8, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    add-long/2addr v2, v4

    .line 235
    iput-wide v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWakeUpAt:J

    .line 237
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    invoke-interface {v0, p0, v4, v5}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->coordinatorWait(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;J)V
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_4

    :catch_0
    move-exception v0

    .line 240
    :try_start_1
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->cancelAll()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    :goto_4
    nop

    .line 242
    iput-boolean v9, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    goto/16 :goto_0

    :catchall_0
    move-exception v0

    iput-boolean v9, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    throw v0
.end method

.method public final cancelAll()V
    .registers 4

    .line 387
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 388
    new-instance v0, Ljava/lang/AssertionError;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Thread "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    const-string v2, " MUST hold lock on "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw v0

    .line 275
    :cond_0
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_0
    const/4 v1, -0x1

    if-ge v1, v0, :cond_1

    .line 276
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->busyQueues:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAllAndDecide$okhttp()Z

    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    .line 278
    :cond_1
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_1
    if-ge v1, v0, :cond_3

    .line 279
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    .line 280
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->cancelAllAndDecide$okhttp()Z

    .line 281
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getFutureTasks$okhttp()Ljava/util/List;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_2

    .line 282
    iget-object v2, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    :cond_2
    add-int/lit8 v0, v0, -0x1

    goto :goto_1

    :cond_3
    return-void
.end method

.method public final getBackend()Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;
    .registers 2

    .line 41
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    return-object v0
.end method

.method public final getLogger$okhttp()Ljava/util/logging/Logger;
    .registers 2

    .line 42
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->logger$1:Ljava/util/logging/Logger;

    return-object v0
.end method

.method public final kickCoordinator$okhttp(Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;)V
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 365
    sget-boolean v0, Lnicoid/network238/okhttp3/internal/_UtilJvmKt;->assertionsEnabled:Z

    if-eqz v0, :cond_0

    invoke-static {p0}, Ljava/lang/Thread;->holdsLock(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 366
    new-instance p1, Ljava/lang/AssertionError;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Thread "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Thread;->getName()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const-string v1, " MUST hold lock on "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 109
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getActiveTask$okhttp()Lnicoid/network238/okhttp3/internal/concurrent/Task;

    move-result-object v0

    if-nez v0, :cond_2

    .line 110
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;->getFutureTasks$okhttp()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    .line 113
    iget-object v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->readyQueues:Ljava/util/List;

    if-nez v0, :cond_1

    .line 111
    invoke-static {v1, p1}, Lnicoid/network238/okhttp3/internal/_UtilCommonKt;->addIfAbsent(Ljava/util/List;Ljava/lang/Object;)V

    goto :goto_0

    .line 113
    :cond_1
    invoke-interface {v1, p1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 117
    :cond_2
    :goto_0
    iget-boolean p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->coordinatorWaiting:Z

    if-eqz p1, :cond_3

    .line 118
    iget-object p1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->backend:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;

    invoke-interface {p1, p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner$Backend;->coordinatorNotify(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;)V

    return-void

    .line 120
    :cond_3
    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->startAnotherThread()V

    return-void
.end method

.method public final newQueue()Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;
    .registers 5

    .line 385
    monitor-enter p0

    .line 259
    :try_start_0
    iget v0, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->nextQueueName:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->nextQueueName:I
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    monitor-exit p0

    .line 260
    new-instance v1, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "Q"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, p0, v0}, Lnicoid/network238/okhttp3/internal/concurrent/TaskQueue;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Ljava/lang/String;)V

    return-object v1

    :catchall_0
    move-exception v0

    .line 385
    monitor-exit p0

    throw v0
.end method
