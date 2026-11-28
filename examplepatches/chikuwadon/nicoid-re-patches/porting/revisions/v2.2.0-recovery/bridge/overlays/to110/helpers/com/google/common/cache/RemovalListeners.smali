.class public final Lcom/google/common/cache/RemovalListeners;
.super Ljava/lang/Object;
.source "RemovalListeners.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static asynchronous(Lcom/google/common/cache/RemovalListener;Ljava/util/concurrent/Executor;)Lcom/google/common/cache/RemovalListener;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "listener",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/cache/RemovalListener<",
            "TK;TV;>;",
            "Ljava/util/concurrent/Executor;",
            ")",
            "Lcom/google/common/cache/RemovalListener<",
            "TK;TV;>;"
        }
    .end annotation

    .line 42
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    new-instance v0, Lcom/google/common/cache/RemovalListeners$0;

    invoke-direct {v0, p1, p0}, Lcom/google/common/cache/RemovalListeners$0;-><init>(Ljava/util/concurrent/Executor;Lcom/google/common/cache/RemovalListener;)V

    return-object v0
.end method

.method static synthetic lambda$asynchronous$0(Ljava/util/concurrent/Executor;Lcom/google/common/cache/RemovalListener;Lcom/google/common/cache/RemovalNotification;)V
    .registers 4

    .line 45
    new-instance v0, Lcom/google/common/cache/RemovalListeners$1;

    invoke-direct {v0, p1, p2}, Lcom/google/common/cache/RemovalListeners$1;-><init>(Lcom/google/common/cache/RemovalListener;Lcom/google/common/cache/RemovalNotification;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method static synthetic lambda$asynchronous$1(Lcom/google/common/cache/RemovalListener;Lcom/google/common/cache/RemovalNotification;)V
    .registers 2

    .line 45
    invoke-interface {p0, p1}, Lcom/google/common/cache/RemovalListener;->onRemoval(Lcom/google/common/cache/RemovalNotification;)V

    return-void
.end method
