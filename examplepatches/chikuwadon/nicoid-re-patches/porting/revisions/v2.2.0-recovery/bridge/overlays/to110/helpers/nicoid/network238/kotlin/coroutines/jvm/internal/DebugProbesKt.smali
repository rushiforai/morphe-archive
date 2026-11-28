.class public abstract Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugProbesKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final probeCoroutineCreated(Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static final probeCoroutineResumed(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public static final probeCoroutineSuspended(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method
