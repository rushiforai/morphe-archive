.class final Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;
.super Ljava/lang/Object;
.source "AbstractFutureState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractFutureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "Waiter"
.end annotation


# static fields
.field static final TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;


# instance fields
.field volatile next:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

.field volatile thread:Ljava/lang/Thread;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 297
    new-instance v0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;-><init>(Z)V

    sput-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    return-void
.end method

.method constructor <init>()V
    .registers 2

    .line 308
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 310
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v0

    # invokes: Lcom/google/common/util/concurrent/AbstractFutureState;->putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V
    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/AbstractFutureState;->access$000(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V

    return-void
.end method

.method constructor <init>(Z)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "unused"
        }
    .end annotation

    .line 306
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method setNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "next"
        }
    .end annotation

    .line 316
    # invokes: Lcom/google/common/util/concurrent/AbstractFutureState;->putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    invoke-static {p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState;->access$100(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    return-void
.end method

.method unpark()V
    .registers 3

    .line 323
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    if-eqz v0, :cond_0

    const/4 v1, 0x0

    .line 325
    iput-object v1, p0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    .line 326
    invoke-static {v0}, Ljava/util/concurrent/locks/LockSupport;->unpark(Ljava/lang/Thread;)V

    :cond_0
    return-void
.end method
