.class final Lnicoid/network238/kotlin/SynchronizedLazyImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/Lazy;
.implements Ljava/io/Serializable;


# instance fields
.field private volatile _value:Ljava/lang/Object;

.field private initializer:Lnicoid/network238/kotlin/jvm/functions/Function0;

.field private final lock:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Ljava/lang/Object;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 61
    iput-object p1, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->initializer:Lnicoid/network238/kotlin/jvm/functions/Function0;

    .line 64
    sget-object p1, Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;->INSTANCE:Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;

    iput-object p1, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->_value:Ljava/lang/Object;

    if-nez p2, :cond_0

    move-object p2, p0

    .line 68
    :cond_0
    iput-object p2, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->lock:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Ljava/lang/Object;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 5

    and-int/lit8 p3, p3, 0x2

    if-eqz p3, :cond_0

    const/4 p2, 0x0

    .line 60
    :cond_0
    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/SynchronizedLazyImpl;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public getValue()Ljava/lang/Object;
    .registers 4

    .line 72
    iget-object v0, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->_value:Ljava/lang/Object;

    .line 73
    sget-object v1, Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;->INSTANCE:Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;

    if-eq v0, v1, :cond_0

    return-object v0

    .line 78
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->lock:Ljava/lang/Object;

    monitor-enter v0

    .line 79
    :try_start_0
    iget-object v2, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->_value:Ljava/lang/Object;

    if-eq v2, v1, :cond_1

    goto :goto_0

    .line 83
    :cond_1
    iget-object v1, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->initializer:Lnicoid/network238/kotlin/jvm/functions/Function0;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Lnicoid/network238/kotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v2

    .line 84
    iput-object v2, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->_value:Ljava/lang/Object;

    .line 85
    const/4 v1, 0x0

    iput-object v1, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->initializer:Lnicoid/network238/kotlin/jvm/functions/Function0;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    :goto_0
    monitor-exit v0

    return-object v2

    :catchall_0
    move-exception v1

    monitor-exit v0

    throw v1
.end method

.method public isInitialized()Z
    .registers 3

    .line 91
    iget-object v0, p0, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->_value:Ljava/lang/Object;

    sget-object v1, Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;->INSTANCE:Lnicoid/network238/kotlin/UNINITIALIZED_VALUE;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public toString()Ljava/lang/String;
    .registers 2

    .line 93
    invoke-virtual {p0}, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->isInitialized()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/SynchronizedLazyImpl;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    return-object v0

    :cond_0
    const-string v0, "Lazy value not initialized yet."

    return-object v0
.end method
