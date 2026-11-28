.class abstract Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static createCoroutineUnintercepted(Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 161
    invoke-static {p2}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineCreated(Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;

    move-result-object p2

    .line 162
    instance-of v0, p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;

    if-eqz v0, :cond_0

    .line 163
    check-cast p0, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;

    invoke-virtual {p0, p1, p2}, Lnicoid/network238/kotlin/coroutines/jvm/internal/BaseContinuationImpl;->create(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;

    move-result-object p0

    return-object p0

    .line 275
    :cond_0
    invoke-interface {p2}, Lnicoid/network238/kotlin/coroutines/Continuation;->getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;

    move-result-object v0

    .line 277
    sget-object v1, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    if-ne v0, v1, :cond_1

    .line 278
    new-instance v0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$3;

    invoke-direct {v0, p2, p0, p1}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$3;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;)V

    return-object v0

    .line 279
    :cond_1
    new-instance v1, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;

    invoke-direct {v1, p2, v0, p0, p1}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/coroutines/CoroutineContext;Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;)V

    return-object v1
.end method
