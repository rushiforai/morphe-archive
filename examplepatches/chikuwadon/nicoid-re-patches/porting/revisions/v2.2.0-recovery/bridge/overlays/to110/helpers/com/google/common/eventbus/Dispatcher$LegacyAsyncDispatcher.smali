.class final Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher;
.super Lcom/google/common/eventbus/Dispatcher;
.source "Dispatcher.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/eventbus/Dispatcher;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "LegacyAsyncDispatcher"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;
    }
.end annotation


# instance fields
.field private final queue:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 134
    invoke-direct {p0}, Lcom/google/common/eventbus/Dispatcher;-><init>()V

    .line 155
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    iput-object v0, p0, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/eventbus/Dispatcher$1;)V
    .registers 2

    .line 134
    invoke-direct {p0}, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher;-><init>()V

    return-void
.end method


# virtual methods
.method dispatch(Ljava/lang/Object;Ljava/util/Iterator;)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "event",
            "subscribers"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/util/Iterator<",
            "Lcom/google/common/eventbus/Subscriber;",
            ">;)V"
        }
    .end annotation

    .line 159
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 160
    :goto_0
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 161
    iget-object v0, p0, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    new-instance v1, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/google/common/eventbus/Subscriber;

    const/4 v3, 0x0

    invoke-direct {v1, p1, v2, v3}, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;-><init>(Ljava/lang/Object;Lcom/google/common/eventbus/Subscriber;Lcom/google/common/eventbus/Dispatcher$1;)V

    invoke-virtual {v0, v1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 165
    :cond_0
    :goto_1
    iget-object p1, p0, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher;->queue:Ljava/util/concurrent/ConcurrentLinkedQueue;

    invoke-virtual {p1}, Ljava/util/concurrent/ConcurrentLinkedQueue;->poll()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;

    if-eqz p1, :cond_1

    .line 166
    # getter for: Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;->subscriber:Lcom/google/common/eventbus/Subscriber;
    invoke-static {p1}, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;->access$800(Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;)Lcom/google/common/eventbus/Subscriber;

    move-result-object p2

    # getter for: Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;->event:Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;->access$700(Lcom/google/common/eventbus/Dispatcher$LegacyAsyncDispatcher$EventWithSubscriber;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p2, p1}, Lcom/google/common/eventbus/Subscriber;->dispatchEvent(Ljava/lang/Object;)V

    goto :goto_1

    :cond_1
    return-void
.end method
