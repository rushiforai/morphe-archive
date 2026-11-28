.class final Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;
.super Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;
.source "AbstractFutureState.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractFutureState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnsafeAtomicHelper"
.end annotation


# static fields
.field static final LISTENERS_OFFSET:J

.field static final UNSAFE:Lsun/misc/Unsafe;

.field static final VALUE_OFFSET:J

.field static final WAITERS_OFFSET:J

.field static final WAITER_NEXT_OFFSET:J

.field static final WAITER_THREAD_OFFSET:J


# direct methods
.method static constructor <clinit>()V
    .registers 6

    .line 544
    :try_start_0
    invoke-static {}, Lsun/misc/Unsafe;->getUnsafe()Lsun/misc/Unsafe;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/SecurityException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    .line 547
    :catch_0
    :try_start_1
    new-instance v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper$1;

    invoke-direct {v0}, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper$1;-><init>()V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_3

    .line 560
    :try_start_2
    const-string v1, "java.security.AccessController"

    .line 562
    invoke-static {v1}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v1

    const-string v2, "doPrivileged"

    const/4 v3, 0x1

    new-array v3, v3, [Ljava/lang/Class;

    const-class v4, Ljava/security/PrivilegedExceptionAction;

    const/4 v5, 0x0

    aput-object v4, v3, v5

    .line 563
    invoke-virtual {v1, v2, v3}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v1

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v2

    const/4 v3, 0x0

    .line 564
    invoke-virtual {v1, v3, v2}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lsun/misc/Unsafe;
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    move-object v0, v1

    goto :goto_0

    .line 566
    :catch_1
    :try_start_3
    invoke-interface {v0}, Ljava/security/PrivilegedExceptionAction;->run()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 573
    :goto_0
    :try_start_4
    const-class v1, Lcom/google/common/util/concurrent/AbstractFutureState;

    .line 574
    const-string v2, "waitersField"

    .line 575
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v0, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    sput-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITERS_OFFSET:J

    .line 576
    const-string v2, "listenersField"

    .line 577
    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v0, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    sput-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->LISTENERS_OFFSET:J

    .line 578
    const-string v2, "valueField"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v1

    sput-wide v1, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->VALUE_OFFSET:J

    .line 579
    const-class v1, Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    const-string v2, "thread"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v2

    invoke-virtual {v0, v2}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v2

    sput-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITER_THREAD_OFFSET:J

    .line 580
    const-string v2, "next"

    invoke-virtual {v1, v2}, Ljava/lang/Class;->getDeclaredField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v1

    invoke-virtual {v0, v1}, Lsun/misc/Unsafe;->objectFieldOffset(Ljava/lang/reflect/Field;)J

    move-result-wide v1

    sput-wide v1, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITER_NEXT_OFFSET:J

    .line 581
    sput-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;
    :try_end_4
    .catch Ljava/lang/NoSuchFieldException; {:try_start_4 .. :try_end_4} :catch_2

    return-void

    :catch_2
    move-exception v0

    .line 583
    new-instance v1, Ljava/lang/RuntimeException;

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/Throwable;)V

    throw v1

    :catch_3
    move-exception v0

    .line 569
    new-instance v1, Ljava/lang/RuntimeException;

    const-string v2, "Could not initialize intrinsics"

    invoke-direct {v1, v2, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v1
.end method

.method private constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    .line 533
    invoke-direct {p0, v0}, Lcom/google/common/util/concurrent/AbstractFutureState$AtomicHelper;-><init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/util/concurrent/AbstractFutureState$1;)V
    .registers 2

    .line 533
    invoke-direct {p0}, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;-><init>()V

    return-void
.end method

.method static synthetic lambda$static$0()Lsun/misc/Unsafe;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 549
    const-class v0, Lsun/misc/Unsafe;

    .line 550
    invoke-virtual {v0}, Ljava/lang/Class;->getDeclaredFields()[Ljava/lang/reflect/Field;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_0
    if-ge v3, v2, :cond_1

    aget-object v4, v1, v3

    const/4 v5, 0x1

    .line 551
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->setAccessible(Z)V

    const/4 v5, 0x0

    .line 552
    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 553
    invoke-virtual {v0, v4}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_0

    .line 554
    invoke-virtual {v0, v4}, Ljava/lang/Class;->cast(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lsun/misc/Unsafe;

    return-object v0

    :cond_0
    add-int/lit8 v3, v3, 0x1

    goto :goto_0

    .line 557
    :cond_1
    new-instance v0, Ljava/lang/NoSuchFieldError;

    const-string v1, "the Unsafe"

    invoke-direct {v0, v1}, Ljava/lang/NoSuchFieldError;-><init>(Ljava/lang/String;)V

    throw v0
.end method


# virtual methods
.method atomicHelperTypeForTest()Ljava/lang/String;
    .registers 1

    .line 642
    const-string p0, "UnsafeAtomicHelper"

    return-object p0
.end method

.method casListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Z
    .registers 10
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
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            ")Z"
        }
    .end annotation

    .line 606
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->LISTENERS_OFFSET:J

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/google/common/util/concurrent/ClosingFuture$0;->m(Lsun/misc/Unsafe;Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method casValue(Lcom/google/common/util/concurrent/AbstractFutureState;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 10
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

    .line 637
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->VALUE_OFFSET:J

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/google/common/util/concurrent/ClosingFuture$0;->m(Lsun/misc/Unsafe;Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z
    .registers 10
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
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            ")Z"
        }
    .end annotation

    .line 600
    sget-object v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v2, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITERS_OFFSET:J

    move-object v1, p1

    move-object v4, p2

    move-object v5, p3

    invoke-static/range {v0 .. v5}, Lcom/google/common/util/concurrent/ClosingFuture$0;->m(Lsun/misc/Unsafe;Ljava/lang/Object;JLjava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method gasListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Lcom/google/common/util/concurrent/AbstractFuture$Listener;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;",
            ")",
            "Lcom/google/common/util/concurrent/AbstractFuture$Listener;"
        }
    .end annotation

    .line 612
    :cond_0
    iget-object v0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->listenersField:Lcom/google/common/util/concurrent/AbstractFuture$Listener;

    if-eq p2, v0, :cond_1

    .line 616
    invoke-virtual {p0, p1, v0, p2}, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->casListeners(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFuture$Listener;Lcom/google/common/util/concurrent/AbstractFuture$Listener;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_1
    return-object v0
.end method

.method gasWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "update"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFutureState<",
            "*>;",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;",
            ")",
            "Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;"
        }
    .end annotation

    .line 625
    :cond_0
    iget-object v0, p1, Lcom/google/common/util/concurrent/AbstractFutureState;->waitersField:Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;

    if-eq p2, v0, :cond_1

    .line 629
    invoke-virtual {p0, p1, v0, p2}, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->casWaiters(Lcom/google/common/util/concurrent/AbstractFutureState;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)Z

    move-result v1

    if-eqz v1, :cond_0

    :cond_1
    return-object v0
.end method

.method putNext(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;)V
    .registers 5
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

    .line 594
    sget-object p0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITER_NEXT_OFFSET:J

    invoke-virtual {p0, p1, v0, v1, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    return-void
.end method

.method putThread(Lcom/google/common/util/concurrent/AbstractFutureState$Waiter;Ljava/lang/Thread;)V
    .registers 5
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

    .line 589
    sget-object p0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->UNSAFE:Lsun/misc/Unsafe;

    sget-wide v0, Lcom/google/common/util/concurrent/AbstractFutureState$UnsafeAtomicHelper;->WAITER_THREAD_OFFSET:J

    invoke-virtual {p0, p1, v0, v1, p2}, Lsun/misc/Unsafe;->putObject(Ljava/lang/Object;JLjava/lang/Object;)V

    return-void
.end method
