.class Lcom/google/common/eventbus/Subscriber;
.super Ljava/lang/Object;
.source "Subscriber.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/eventbus/Subscriber$SynchronizedSubscriber;
    }
.end annotation


# instance fields
.field private final bus:Lcom/google/common/eventbus/EventBus;

.field private final executor:Ljava/util/concurrent/Executor;

.field private final method:Ljava/lang/reflect/Method;

.field final target:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bus",
            "target",
            "method"
        }
    .end annotation

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 57
    iput-object p1, p0, Lcom/google/common/eventbus/Subscriber;->bus:Lcom/google/common/eventbus/EventBus;

    .line 58
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    iput-object p2, p0, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    .line 59
    iput-object p3, p0, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    const/4 p2, 0x1

    .line 60
    invoke-virtual {p3, p2}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    .line 62
    invoke-virtual {p1}, Lcom/google/common/eventbus/EventBus;->executor()Ljava/util/concurrent/Executor;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/eventbus/Subscriber;->executor:Ljava/util/concurrent/Executor;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;Lcom/google/common/eventbus/Subscriber$1;)V
    .registers 5

    .line 35
    invoke-direct {p0, p1, p2, p3}, Lcom/google/common/eventbus/Subscriber;-><init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    return-void
.end method

.method private context(Ljava/lang/Object;)Lcom/google/common/eventbus/SubscriberExceptionContext;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 99
    new-instance v0, Lcom/google/common/eventbus/SubscriberExceptionContext;

    iget-object v1, p0, Lcom/google/common/eventbus/Subscriber;->bus:Lcom/google/common/eventbus/EventBus;

    iget-object v2, p0, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    invoke-direct {v0, v1, p1, v2, p0}, Lcom/google/common/eventbus/SubscriberExceptionContext;-><init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    return-object v0
.end method

.method static create(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;)Lcom/google/common/eventbus/Subscriber;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "bus",
            "listener",
            "method"
        }
    .end annotation

    .line 39
    invoke-static {p2}, Lcom/google/common/eventbus/Subscriber;->isDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 40
    new-instance v0, Lcom/google/common/eventbus/Subscriber;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/common/eventbus/Subscriber;-><init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;)V

    return-object v0

    .line 41
    :cond_0
    new-instance v0, Lcom/google/common/eventbus/Subscriber$SynchronizedSubscriber;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p1, p2, v1}, Lcom/google/common/eventbus/Subscriber$SynchronizedSubscriber;-><init>(Lcom/google/common/eventbus/EventBus;Ljava/lang/Object;Ljava/lang/reflect/Method;Lcom/google/common/eventbus/Subscriber$1;)V

    return-object v0
.end method

.method private static isDeclaredThreadSafe(Ljava/lang/reflect/Method;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "method"
        }
    .end annotation

    .line 125
    const-class v0, Lcom/google/common/eventbus/AllowConcurrentEvents;

    invoke-virtual {p0, v0}, Ljava/lang/reflect/Method;->getAnnotation(Ljava/lang/Class;)Ljava/lang/annotation/Annotation;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method final dispatchEvent(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .line 67
    iget-object v0, p0, Lcom/google/common/eventbus/Subscriber;->executor:Ljava/util/concurrent/Executor;

    new-instance v1, Lcom/google/common/eventbus/Subscriber$0;

    invoke-direct {v1, p0, p1}, Lcom/google/common/eventbus/Subscriber$0;-><init>(Lcom/google/common/eventbus/Subscriber;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 110
    instance-of v0, p1, Lcom/google/common/eventbus/Subscriber;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 111
    check-cast p1, Lcom/google/common/eventbus/Subscriber;

    .line 115
    iget-object v0, p0, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    iget-object v2, p1, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    if-ne v0, v2, :cond_0

    iget-object p0, p0, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    iget-object p1, p1, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    invoke-virtual {p0, p1}, Ljava/lang/reflect/Method;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method public final hashCode()I
    .registers 2

    .line 104
    iget-object v0, p0, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    invoke-virtual {v0}, Ljava/lang/reflect/Method;->hashCode()I

    move-result v0

    add-int/lit8 v0, v0, 0x1f

    mul-int/lit8 v0, v0, 0x1f

    iget-object p0, p0, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    invoke-static {p0}, Ljava/lang/System;->identityHashCode(Ljava/lang/Object;)I

    move-result p0

    add-int/2addr v0, p0

    return v0
.end method

.method invokeSubscriberMethod(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "event"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/reflect/InvocationTargetException;
        }
    .end annotation

    .line 84
    :try_start_0
    iget-object v0, p0, Lcom/google/common/eventbus/Subscriber;->method:Ljava/lang/reflect/Method;

    iget-object p0, p0, Lcom/google/common/eventbus/Subscriber;->target:Ljava/lang/Object;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, p0, v1}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_2
    .catch Ljava/lang/IllegalAccessException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception p0

    .line 90
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p1

    instance-of p1, p1, Ljava/lang/Error;

    if-eqz p1, :cond_0

    .line 91
    invoke-virtual {p0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object p0

    check-cast p0, Ljava/lang/Error;

    throw p0

    .line 93
    :cond_0
    throw p0

    :catch_1
    move-exception p0

    .line 88
    new-instance v0, Ljava/lang/Error;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Method became inaccessible: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0

    :catch_2
    move-exception p0

    .line 86
    new-instance v0, Ljava/lang/Error;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Method rejected target/argument: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1, p0}, Ljava/lang/Error;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw v0
.end method

.method synthetic lambda$dispatchEvent$0$com-google-common-eventbus-Subscriber(Ljava/lang/Object;)V
    .registers 4

    .line 70
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/common/eventbus/Subscriber;->invokeSubscriberMethod(Ljava/lang/Object;)V
    :try_end_0
    .catch Ljava/lang/reflect/InvocationTargetException; {:try_start_0 .. :try_end_0} :catch_0

    return-void

    :catch_0
    move-exception v0

    .line 72
    iget-object v1, p0, Lcom/google/common/eventbus/Subscriber;->bus:Lcom/google/common/eventbus/EventBus;

    invoke-virtual {v0}, Ljava/lang/reflect/InvocationTargetException;->getCause()Ljava/lang/Throwable;

    move-result-object v0

    invoke-direct {p0, p1}, Lcom/google/common/eventbus/Subscriber;->context(Ljava/lang/Object;)Lcom/google/common/eventbus/SubscriberExceptionContext;

    move-result-object p0

    invoke-virtual {v1, v0, p0}, Lcom/google/common/eventbus/EventBus;->handleSubscriberException(Ljava/lang/Throwable;Lcom/google/common/eventbus/SubscriberExceptionContext;)V

    return-void
.end method
