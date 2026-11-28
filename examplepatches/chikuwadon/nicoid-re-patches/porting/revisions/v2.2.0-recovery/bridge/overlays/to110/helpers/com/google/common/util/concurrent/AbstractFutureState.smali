.class abstract Lcom/google/common/util/concurrent/AbstractFutureState;
.super Lcom/google/common/util/concurrent/internal/InternalFutureFailureAccess;
.source "AbstractFutureState.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;,
        Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;,
        Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;,
        Lcom/google/common/util/concurrent/AbstractFutureState$AtomicReferenceFieldUpdaterAtomicHelper;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/util/concurrent/internal/InternalFutureFailureAccess;",
        "Lcom/google/common/util/concurrent/ListenableFuture<",
        "TV;>;"
    }
.end annotation


# static fields
.field private static final ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

.field static final GENERATE_CANCELLATION_CAUSES:Z

.field static final NULL:Ljava/lang/Object;

.field private static final SPIN_THRESHOLD_NANOS:J = 0x3e8L

.field static final log:Lcom/google/common/util/concurrent/LazyLogger;


# instance fields
.field volatile listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

.field volatile valueField:Ljava/lang/Object;

.field volatile waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 274
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    sput-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->NULL:Ljava/lang/Object;

    .line 281
    new-instance v0, Lcom/google/common/util/concurrent/LazyLogger;

    const-class v1, Lcom/google/common/util/concurrent/AbstractFuture;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/LazyLogger;-><init>(Ljava/lang/Class;)V

    sput-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->log:Lcom/google/common/util/concurrent/LazyLogger;

    .line 283
    invoke-static {}, Lcom/google/common/util/concurrent/AbstractFutureState;->computeGenerateCancellationCauses()Z

    move-result v0

    sput-boolean v0, Lcom/google/common/util/concurrent/AbstractFutureState;->GENERATE_CANCELLATION_CAUSES:Z

    .line 341
    invoke-static {}, Lcom/google/common/util/concurrent/AbstractFutureState;->mightBeAndroid()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 343
    :try_start_0
    new-instance v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;-><init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/Error; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 346
    :catch_0
    new-instance v0, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicReferenceFieldUpdaterAtomicHelper;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicReferenceFieldUpdaterAtomicHelper;-><init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V

    goto :goto_0

    .line 364
    :cond_0
    new-instance v0, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicReferenceFieldUpdaterAtomicHelper;

    invoke-direct {v0, v1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicReferenceFieldUpdaterAtomicHelper;-><init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V

    .line 366
    :goto_0
    sput-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    .line 371
    const-class v0, Ljava/util/concurrent/locks/LockSupport;

    return-void
.end method

.method constructor <init>()V
    .registers 1

    .line 263
    invoke-direct {p0}, Lcom/google/common/util/concurrent/internal/InternalFutureFailureAccess;-><init>()V

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V
    .registers 2

    .line 46
    invoke-static {p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState;->putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V

    return-void
.end method

.method static synthetic access$100(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .registers 2

    .line 46
    invoke-static {p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState;->putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    return-void
.end method

.method static atomicHelperTypeForTest()Ljava/lang/String;
    .registers 1

    .line 495
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->atomicHelperTypeForTest()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method static casValue(Lcom/google/common/util/concurrent/AbstractFutureState;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "future",
            "expect",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")Z"
        }
    .end annotation

    .line 69
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->casValue(Lcom/google/common/util/concurrent/AbstractFutureState;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method private casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expect",
            "update"
        }
    .end annotation

    .line 439
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z

    move-result p0

    return p0
.end method

.method private static computeGenerateCancellationCauses()Z
    .registers 2

    .line 288
    :try_start_0
    const-string v0, "guava.concurrent.generate_cancellation_cause"

    const-string v1, "false"

    .line 289
    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 288
    invoke-static {v0}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    return v0

    :catch_0
    const/4 v0, 0x0

    return v0
.end method

.method private final gasWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "update"
        }
    .end annotation

    .line 447
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->gasWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    move-result-object p0

    return-object p0
.end method

.method private static mightBeAndroid()Z
    .registers 2

    .line 708
    const-string v0, "java.runtime.name"

    const-string v1, ""

    invoke-static {v0, v1}, Ljava/lang/System;->getProperty(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 710
    const-string v1, "Android"

    invoke-virtual {v0, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x0

    return v0

    :cond_0
    const/4 v0, 0x1

    return v0
.end method

.method private static putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "waiter",
            "newValue"
        }
    .end annotation

    .line 431
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    return-void
.end method

.method private static putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "waiter",
            "newValue"
        }
    .end annotation

    .line 426
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V

    return-void
.end method

.method private removeWaiter(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    const/4 v0, 0x0

    .line 462
    iput-object v0, p1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    .line 466
    :cond_0
    :goto_0
    iget-object p1, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 467
    sget-object v1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-eq p1, v1, :cond_4

    move-object v1, v0

    :goto_1
    if-eqz p1, :cond_4

    .line 472
    iget-object v2, p1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->next:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 473
    iget-object v3, p1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    if-eqz v3, :cond_1

    move-object v1, p1

    goto :goto_2

    :cond_1
    if-eqz v1, :cond_2

    .line 476
    iput-object v2, v1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->next:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 477
    iget-object p1, v1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->thread:Ljava/lang/Thread;

    if-nez p1, :cond_3

    goto :goto_0

    .line 480
    :cond_2
    invoke-direct {p0, p1, v2}, Lcom/google/common/util/concurrent/AbstractFutureState;->casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z

    move-result p1

    if-eqz p1, :cond_0

    :cond_3
    :goto_2
    move-object p1, v2

    goto :goto_1

    :cond_4
    return-void
.end method


# virtual methods
.method final blockingGet()Ljava/lang/Object;
    .registers 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 224
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_8

    .line 227
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_0

    move v3, v1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 228
    :goto_0
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->notInstanceOfDelegatingToFuture(Ljava/lang/Object;)Z

    move-result v4

    and-int/2addr v3, v4

    if-eqz v3, :cond_1

    .line 229
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 231
    :cond_1
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 232
    sget-object v3, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-eq v0, v3, :cond_7

    .line 233
    new-instance v3, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    invoke-direct {v3}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;-><init>()V

    .line 235
    :cond_2
    invoke-virtual {v3, v0}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->setNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    .line 236
    invoke-direct {p0, v0, v3}, Lcom/google/common/util/concurrent/AbstractFutureState;->casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z

    move-result v0

    if-eqz v0, :cond_6

    .line 239
    :cond_3
    invoke-static {p0}, Ljava/util/concurrent/locks/LockSupport;->park(Ljava/lang/Object;)V

    .line 241
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v0

    if-nez v0, :cond_5

    .line 247
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    if-eqz v0, :cond_4

    move v4, v1

    goto :goto_1

    :cond_4
    move v4, v2

    .line 248
    :goto_1
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->notInstanceOfDelegatingToFuture(Ljava/lang/Object;)Z

    move-result v5

    and-int/2addr v4, v5

    if-eqz v4, :cond_3

    .line 249
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 242
    :cond_5
    invoke-direct {p0, v3}, Lcom/google/common/util/concurrent/AbstractFutureState;->removeWaiter(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    .line 243
    new-instance p0, Ljava/lang/InterruptedException;

    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    throw p0

    .line 253
    :cond_6
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 254
    sget-object v4, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-ne v0, v4, :cond_2

    .line 259
    :cond_7
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 225
    :cond_8
    new-instance p0, Ljava/lang/InterruptedException;

    invoke-direct {p0}, Ljava/lang/InterruptedException;-><init>()V

    throw p0
.end method

.method final blockingGet(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 23
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TV;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/TimeoutException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    move-object/from16 v0, p0

    move-wide/from16 v1, p1

    move-object/from16 v3, p3

    .line 123
    invoke-virtual {v3, v1, v2}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v4

    .line 125
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v6

    if-nez v6, :cond_15

    .line 128
    iget-object v6, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    const/4 v8, 0x0

    if-eqz v6, :cond_0

    const/4 v9, 0x1

    goto :goto_0

    :cond_0
    move v9, v8

    .line 129
    :goto_0
    invoke-static {v6}, Lcom/google/common/util/concurrent/AbstractFuture;->notInstanceOfDelegatingToFuture(Ljava/lang/Object;)Z

    move-result v10

    and-int/2addr v9, v10

    if-eqz v9, :cond_1

    .line 130
    invoke-static {v6}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_1
    const-wide/16 v9, 0x0

    cmp-long v6, v4, v9

    if-lez v6, :cond_2

    .line 133
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v11

    add-long/2addr v11, v4

    goto :goto_1

    :cond_2
    move-wide v11, v9

    :goto_1
    const-wide/16 v13, 0x3e8

    cmp-long v6, v4, v13

    if-ltz v6, :cond_a

    .line 136
    iget-object v6, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 137
    sget-object v15, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-eq v6, v15, :cond_9

    .line 138
    new-instance v15, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    invoke-direct {v15}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;-><init>()V

    .line 140
    :cond_3
    invoke-virtual {v15, v6}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->setNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    .line 141
    invoke-direct {v0, v6, v15}, Lcom/google/common/util/concurrent/AbstractFutureState;->casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z

    move-result v6

    if-eqz v6, :cond_8

    .line 143
    :cond_4
    invoke-static {v0, v4, v5}, Lcom/google/common/util/concurrent/OverflowAvoidingLockSupport;->parkNanos(Ljava/lang/Object;J)V

    .line 145
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v4

    if-nez v4, :cond_7

    .line 152
    iget-object v4, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    if-eqz v4, :cond_5

    const/4 v5, 0x1

    goto :goto_2

    :cond_5
    move v5, v8

    .line 153
    :goto_2
    invoke-static {v4}, Lcom/google/common/util/concurrent/AbstractFuture;->notInstanceOfDelegatingToFuture(Ljava/lang/Object;)Z

    move-result v6

    and-int/2addr v5, v6

    if-eqz v5, :cond_6

    .line 154
    invoke-static {v4}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 158
    :cond_6
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v11, v4

    cmp-long v6, v4, v13

    if-gez v6, :cond_4

    .line 161
    invoke-direct {v0, v15}, Lcom/google/common/util/concurrent/AbstractFutureState;->removeWaiter(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    goto :goto_3

    .line 146
    :cond_7
    invoke-direct {v0, v15}, Lcom/google/common/util/concurrent/AbstractFutureState;->removeWaiter(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V

    .line 147
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 166
    :cond_8
    iget-object v6, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    .line 167
    sget-object v7, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-ne v6, v7, :cond_3

    .line 172
    :cond_9
    iget-object v0, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_a
    :goto_3
    cmp-long v6, v4, v9

    if-lez v6, :cond_e

    .line 177
    iget-object v4, v0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    if-eqz v4, :cond_b

    const/4 v5, 0x1

    goto :goto_4

    :cond_b
    move v5, v8

    .line 178
    :goto_4
    invoke-static {v4}, Lcom/google/common/util/concurrent/AbstractFuture;->notInstanceOfDelegatingToFuture(Ljava/lang/Object;)Z

    move-result v6

    and-int/2addr v5, v6

    if-eqz v5, :cond_c

    .line 179
    invoke-static {v4}, Lcom/google/common/util/concurrent/AbstractFuture;->getDoneValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 181
    :cond_c
    invoke-static {}, Ljava/lang/Thread;->interrupted()Z

    move-result v4

    if-nez v4, :cond_d

    .line 184
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v4

    sub-long v4, v11, v4

    goto :goto_3

    .line 182
    :cond_d
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0

    .line 187
    :cond_e
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v6

    .line 188
    invoke-virtual {v3}, Ljava/util/concurrent/TimeUnit;->toString()Ljava/lang/String;

    move-result-object v7

    sget-object v11, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v7, v11}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v7

    .line 189
    new-instance v11, Ljava/lang/StringBuilder;

    const-string v12, "Waited "

    invoke-direct {v11, v12}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v11, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-virtual {v11, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/util/concurrent/TimeUnit;->toString()Ljava/lang/String;

    move-result-object v2

    sget-object v12, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v2, v12}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    add-long v11, v4, v13

    cmp-long v11, v11, v9

    if-gez v11, :cond_13

    .line 193
    new-instance v11, Ljava/lang/StringBuilder;

    invoke-direct {v11}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " (plus "

    invoke-virtual {v11, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v11}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    neg-long v4, v4

    .line 195
    sget-object v11, Ljava/util/concurrent/TimeUnit;->NANOSECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v3, v4, v5, v11}, Ljava/util/concurrent/TimeUnit;->convert(JLjava/util/concurrent/TimeUnit;)J

    move-result-wide v11

    .line 196
    invoke-virtual {v3, v11, v12}, Ljava/util/concurrent/TimeUnit;->toNanos(J)J

    move-result-wide v17

    sub-long v4, v4, v17

    cmp-long v3, v11, v9

    if-eqz v3, :cond_f

    cmp-long v9, v4, v13

    if-gtz v9, :cond_f

    move/from16 v16, v8

    goto :goto_5

    :cond_f
    const/16 v16, 0x1

    :goto_5
    if-lez v3, :cond_11

    .line 200
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v11, v12}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    if-eqz v16, :cond_10

    .line 202
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, ","

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 204
    :cond_10
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    :cond_11
    if-eqz v16, :cond_12

    .line 207
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v4, v5}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v2, " nanoseconds "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 210
    :cond_12
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, "delay)"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    .line 215
    :cond_13
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AbstractFutureState;->isDone()Z

    move-result v0

    if-eqz v0, :cond_14

    .line 216
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " but future completed as timeout expired"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 218
    :cond_14
    new-instance v0, Ljava/util/concurrent/TimeoutException;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v2, " for "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/util/concurrent/TimeoutException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 126
    :cond_15
    new-instance v0, Ljava/lang/InterruptedException;

    invoke-direct {v0}, Ljava/lang/InterruptedException;-><init>()V

    throw v0
.end method

.method final casListeners(Lcom/google/common/util/concurrent/AbstractFuture$Listener;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "expect",
            "update"
        }
    .end annotation

    .line 53
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->casListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Z

    move-result p0

    return p0
.end method

.method final gasListeners(Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Lcom/google/common/util/concurrent/AbstractFuture$Listener;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "update"
        }
    .end annotation

    .line 61
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState;->ATOMIC_HELPER:Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;->gasListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    move-result-object p0

    return-object p0
.end method

.method final listeners()Lcom/google/common/util/concurrent/AbstractFuture$Listener;
    .registers 1

    .line 79
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    return-object p0
.end method

.method final releaseWaiters()V
    .registers 2

    .line 84
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->TOMBSTONE:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractFutureState;->gasWaiters(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    move-result-object p0

    :goto_0
    if-eqz p0, :cond_0

    .line 86
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->unpark()V

    .line 85
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;->next:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    goto :goto_0

    :cond_0
    return-void
.end method

.method final value()Ljava/lang/Object;
    .registers 1

    .line 74
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractFutureState;->valueField:Ljava/lang/Object;

    return-object p0
.end method
