.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/kotlin/coroutines/Continuation;
.implements Lnicoid/network238/kotlin/coroutines/jvm/internal/CoroutineStackFrame;
.implements Ljava/io/Serializable;


# instance fields
.field private final completion:Lnicoid/network238/kotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 2

    .line 15
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 18
    iput-object p1, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->completion:Lnicoid/network238/kotlin/coroutines/Continuation;

    return-void
.end method


# virtual methods
.method public create(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")",
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 64
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "create(Any?;Continuation) has not been overridden"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public create(Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/kotlin/coroutines/Continuation;",
            ")",
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "create(Continuation) has not been overridden"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public getCallerFrame()Lnicoid/network238/kotlin/coroutines/jvm/internal/CoroutineStackFrame;
    .registers 3

    .line 73
    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->completion:Lnicoid/network238/kotlin/coroutines/Continuation;

    instance-of v1, v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/CoroutineStackFrame;

    if-eqz v1, :cond_0

    check-cast v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/CoroutineStackFrame;

    return-object v0

    :cond_0
    const/4 v0, 0x0

    return-object v0
.end method

.method public final getCompletion()Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/coroutines/Continuation;"
        }
    .end annotation

    .line 18
    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->completion:Lnicoid/network238/kotlin/coroutines/Continuation;

    return-object v0
.end method

.method public getStackTraceElement()Ljava/lang/StackTraceElement;
    .registers 2

    .line 76
    invoke-static {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugMetadataKt;->getStackTraceElement(Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;)Ljava/lang/StackTraceElement;

    move-result-object v0

    return-object v0
.end method

.method protected abstract invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
.end method

.method protected releaseIntercepted()V
    .registers 1

    return-void
.end method

.method public final resumeWith(Ljava/lang/Object;)V
    .registers 5

    move-object v0, p0

    .line 28
    :goto_0
    invoke-static {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineResumed(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    .line 29
    check-cast v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;

    .line 30
    iget-object v1, v0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->completion:Lnicoid/network238/kotlin/coroutines/Continuation;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    :try_start_0
    invoke-virtual {v0, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 34
    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v2

    if-ne p1, v2, :cond_0

    return-void

    .line 35
    :cond_0
    invoke-static {p1}, Lnicoid/network238/kotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_1

    .line 37
    :catchall_0
    move-exception p1

    sget-object v2, Lnicoid/network238/kotlin/Result;->Companion:Lnicoid/network238/kotlin/Result$Companion;

    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->createFailure(Ljava/lang/Throwable;)Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/kotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 39
    :goto_1
    invoke-virtual {v0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->releaseIntercepted()V

    .line 40
    instance-of v0, v1, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;

    if-eqz v0, :cond_1

    move-object v0, v1

    goto :goto_0

    .line 46
    :cond_1
    invoke-interface {v1, p1}, Lnicoid/network238/kotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Continuation at "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->getStackTraceElement()Ljava/lang/StackTraceElement;

    move-result-object v1

    if-nez v1, :cond_0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v1

    :cond_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
