.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;
.source "SourceFile"


# instance fields
.field private final _context:Lnicoid/network238/kotlin/coroutines/CoroutineContext;

.field private transient intercepted:Lnicoid/network238/kotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 3

    if-eqz p1, :cond_0

    .line 102
    invoke-interface {p1}, Lnicoid/network238/kotlin/coroutines/Continuation;->getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    move-result-object v0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-direct {p0, p1, v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/coroutines/CoroutineContext;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/coroutines/CoroutineContext;)V
    .registers 3

    .line 101
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    .line 100
    iput-object p2, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->_context:Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    return-void
.end method


# virtual methods
.method public getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;
    .registers 2

    .line 105
    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->_context:Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public final intercepted()Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation

    .line 111
    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->intercepted:Lnicoid/network238/kotlin/coroutines/Continuation;

    if-nez v0, :cond_0

    .line 112
    invoke-virtual {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    move-result-object v0

    sget-object v1, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor;->Key:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    invoke-interface {v0, v1}, Lnicoid/network238/kotlin/coroutines/CoroutineContext;->get(Lnicoid/network238/kotlin/coroutines/CoroutineContext$Key;)Lnicoid/network238/kotlin/coroutines/CoroutineContext$Element;

    .line 113
    iput-object p0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->intercepted:Lnicoid/network238/kotlin/coroutines/Continuation;

    return-object p0

    :cond_0
    return-object v0
.end method

.method protected releaseIntercepted()V
    .registers 3

    .line 116
    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->intercepted:Lnicoid/network238/kotlin/coroutines/Continuation;

    if-eqz v0, :cond_0

    if-eq v0, p0, :cond_0

    .line 118
    invoke-virtual {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    move-result-object v0

    sget-object v1, Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor;->Key:Lnicoid/network238/kotlin/coroutines/ContinuationInterceptor$Key;

    invoke-interface {v0, v1}, Lnicoid/network238/kotlin/coroutines/CoroutineContext;->get(Lnicoid/network238/kotlin/coroutines/CoroutineContext$Key;)Lnicoid/network238/kotlin/coroutines/CoroutineContext$Element;

    const/4 v0, 0x0

    throw v0

    .line 120
    :cond_0
    sget-object v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;->INSTANCE:Lnicoid/network238/kotlin/coroutines/jvm/internal/CompletedContinuation;

    iput-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;->intercepted:Lnicoid/network238/kotlin/coroutines/Continuation;

    return-void
.end method
