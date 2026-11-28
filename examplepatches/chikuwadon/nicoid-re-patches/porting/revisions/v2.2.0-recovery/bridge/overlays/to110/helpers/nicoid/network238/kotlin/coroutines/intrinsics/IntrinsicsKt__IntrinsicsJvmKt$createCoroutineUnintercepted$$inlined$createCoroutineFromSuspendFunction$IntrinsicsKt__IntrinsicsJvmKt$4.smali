.class public final Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;
.super Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt;->createCoroutineUnintercepted(Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation


# instance fields
.field final synthetic $receiver$inlined:Ljava/lang/Object;

.field final synthetic $this_createCoroutineUnintercepted$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

.field private label:I


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/coroutines/CoroutineContext;Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;)V
    .registers 5

    iput-object p3, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->$this_createCoroutineUnintercepted$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

    iput-object p4, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->$receiver$inlined:Ljava/lang/Object;

    .line 225
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {p0, p1, p2}, Lnicoid/network238/kotlin/coroutines/jvm/internal/ContinuationImpl;-><init>(Lnicoid/network238/kotlin/coroutines/Continuation;Lnicoid/network238/kotlin/coroutines/CoroutineContext;)V

    return-void
.end method


# virtual methods
.method protected invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 229
    iget v0, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->label:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-eqz v0, :cond_1

    if-ne v0, v2, :cond_0

    .line 236
    iput v1, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->label:I

    .line 237
    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    return-object p1

    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    .line 239
    const-string v0, "This coroutine had already completed"

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_1
    nop

    .line 231
    iput v2, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->label:I

    .line 232
    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 241
    iget-object p1, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->$this_createCoroutineUnintercepted$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->$this_createCoroutineUnintercepted$inlined:Lnicoid/network238/kotlin/jvm/functions/Function2;

    invoke-static {p1, v1}, Lnicoid/network238/kotlin/jvm/internal/TypeIntrinsics;->beforeCheckcastToFunctionOfArity(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lnicoid/network238/kotlin/jvm/functions/Function2;

    iget-object v0, p0, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt__IntrinsicsJvmKt$createCoroutineUnintercepted$$inlined$createCoroutineFromSuspendFunction$IntrinsicsKt__IntrinsicsJvmKt$4;->$receiver$inlined:Ljava/lang/Object;

    invoke-interface {p1, v0, p0}, Lnicoid/network238/kotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
