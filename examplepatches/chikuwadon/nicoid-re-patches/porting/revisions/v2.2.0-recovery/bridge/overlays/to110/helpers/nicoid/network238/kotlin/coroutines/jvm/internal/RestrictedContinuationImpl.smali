.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/RestrictedContinuationImpl;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 3

    .line 83
    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    if-eqz p1, :cond_0

    .line 86
    invoke-interface {p1}, Lnicoid/network238/kotlin/coroutines/Continuation;->getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    move-result-object p1

    sget-object v0, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    if-eq p1, v0, :cond_0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string v0, "Coroutines with restricted suspension must have EmptyCoroutineContext"

    invoke-direct {p1, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    return-void
.end method


# virtual methods
.method public getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;
    .registers 2

    .line 93
    sget-object v0, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    return-object v0
.end method
