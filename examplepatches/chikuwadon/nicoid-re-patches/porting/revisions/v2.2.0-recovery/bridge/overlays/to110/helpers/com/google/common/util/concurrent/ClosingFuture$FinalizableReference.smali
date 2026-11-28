.class final Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;
.super Lcom/google/common/base/FinalizablePhantomReference;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FinalizableReference"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/base/FinalizablePhantomReference<",
        "Lcom/google/common/util/concurrent/ClosingFuture<",
        "*>;>;"
    }
.end annotation


# static fields
.field static final referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

.field static final references:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final state:Lcom/google/common/util/concurrent/ClosingFuture$State;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ClosingFuture$State<",
            "*>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 1

    .line 2340
    new-instance v0, Lcom/google/common/base/FinalizableReferenceQueue;

    invoke-direct {v0}, Lcom/google/common/base/FinalizableReferenceQueue;-><init>()V

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

    .line 2341
    invoke-static {}, Lcom/google/common/collect/Sets;->newConcurrentHashSet()Ljava/util/Set;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->references:Ljava/util/Set;

    return-void
.end method

.method constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "referent"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ClosingFuture<",
            "*>;)V"
        }
    .end annotation

    .line 2354
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->referenceQueue:Lcom/google/common/base/FinalizableReferenceQueue;

    invoke-direct {p0, p1, v0}, Lcom/google/common/base/FinalizablePhantomReference;-><init>(Ljava/lang/Object;Lcom/google/common/base/FinalizableReferenceQueue;)V

    .line 2355
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;
    invoke-static {p1}, Lcom/google/common/util/concurrent/ClosingFuture;->access$300(Lcom/google/common/util/concurrent/ClosingFuture;)Lcom/google/common/util/concurrent/ClosingFuture$State;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;

    return-void
.end method

.method static register(Lcom/google/common/util/concurrent/ClosingFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "future"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ClosingFuture<",
            "*>;)V"
        }
    .end annotation

    .line 2345
    :try_start_0
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->references:Ljava/util/Set;

    new-instance v1, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;

    invoke-direct {v1, p0}, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;-><init>(Lcom/google/common/util/concurrent/ClosingFuture;)V

    invoke-interface {v0, v1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2347
    invoke-static {p0}, Lcom/google/common/util/concurrent/ClosingFuture;->reachabilityFence(Ljava/lang/Object;)V

    return-void

    :catchall_0
    move-exception v0

    invoke-static {p0}, Lcom/google/common/util/concurrent/ClosingFuture;->reachabilityFence(Ljava/lang/Object;)V

    .line 2348
    throw v0
.end method


# virtual methods
.method public finalizeReferent()V
    .registers 2

    .line 2360
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->references:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    .line 2361
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$FinalizableReference;->state:Lcom/google/common/util/concurrent/ClosingFuture$State;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeIfLeaked()V

    return-void
.end method
