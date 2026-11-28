.class abstract Lcom/google/common/util/concurrent/AggregateFutureState;
.super Lcom/google/common/util/concurrent/AbstractFuture$TrustedFuture;
.source "AggregateFutureState.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<OutputT:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/AbstractFuture$TrustedFuture<",
        "TOutputT;>;"
    }
.end annotation


# static fields
.field private static final REMAINING_COUNT_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater<",
            "-",
            "Lcom/google/common/util/concurrent/AggregateFutureState<",
            "*>;>;"
        }
    .end annotation
.end field

.field private static final SEEN_EXCEPTIONS_UPDATER:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater<",
            "-",
            "Lcom/google/common/util/concurrent/AggregateFutureState<",
            "*>;-",
            "Ljava/util/Set<",
            "Ljava/lang/Throwable;",
            ">;>;"
        }
    .end annotation
.end field


# instance fields
.field volatile remainingField:I

.field volatile seenExceptionsField:Ljava/util/Set;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 55
    const-class v0, Ljava/util/Set;

    const-string v1, "seenExceptionsField"

    .line 56
    const-class v2, Lcom/google/common/util/concurrent/AggregateFutureState;

    invoke-static {v2, v0, v1}, Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/AggregateFutureState;->SEEN_EXCEPTIONS_UPDATER:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    .line 59
    const-string v0, "remainingField"

    invoke-static {v2, v0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->newUpdater(Ljava/lang/Class;Ljava/lang/String;)Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    move-result-object v0

    sput-object v0, Lcom/google/common/util/concurrent/AggregateFutureState;->REMAINING_COUNT_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    return-void
.end method

.method constructor <init>(I)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "remainingFutures"
        }
    .end annotation

    .line 61
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFuture$TrustedFuture;-><init>()V

    const/4 v0, 0x0

    .line 49
    iput-object v0, p0, Lcom/google/common/util/concurrent/AggregateFutureState;->seenExceptionsField:Ljava/util/Set;

    .line 62
    iput p1, p0, Lcom/google/common/util/concurrent/AggregateFutureState;->remainingField:I

    return-void
.end method


# virtual methods
.method abstract addInitialException(Ljava/util/Set;)V
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "seen"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Set<",
            "Ljava/lang/Throwable;",
            ">;)V"
        }
    .end annotation
.end method

.method final clearSeenExceptions()V
    .registers 2

    const/4 v0, 0x0

    .line 132
    iput-object v0, p0, Lcom/google/common/util/concurrent/AggregateFutureState;->seenExceptionsField:Ljava/util/Set;

    return-void
.end method

.method final decrementRemainingAndGet()I
    .registers 2

    .line 128
    sget-object v0, Lcom/google/common/util/concurrent/AggregateFutureState;->REMAINING_COUNT_UPDATER:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v0, p0}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->decrementAndGet(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method final getOrInitSeenExceptions()Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 84
    iget-object v0, p0, Lcom/google/common/util/concurrent/AggregateFutureState;->seenExceptionsField:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 101
    invoke-static {}, Lcom/google/common/collect/Sets;->newConcurrentHashSet()Ljava/util/Set;

    move-result-object v0

    .line 107
    invoke-virtual {p0, v0}, Lcom/google/common/util/concurrent/AggregateFutureState;->addInitialException(Ljava/util/Set;)V

    .line 109
    sget-object v1, Lcom/google/common/util/concurrent/AggregateFutureState;->SEEN_EXCEPTIONS_UPDATER:Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;

    const/4 v2, 0x0

    invoke-static {v1, p0, v2, v0}, Landroidx/concurrent/futures/AbstractResolvableFuture$SafeAtomicHelper$0;->m(Ljava/util/concurrent/atomic/AtomicReferenceFieldUpdater;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 119
    iget-object p0, p0, Lcom/google/common/util/concurrent/AggregateFutureState;->seenExceptionsField:Ljava/util/Set;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Set;

    return-object p0

    :cond_0
    return-object v0
.end method
