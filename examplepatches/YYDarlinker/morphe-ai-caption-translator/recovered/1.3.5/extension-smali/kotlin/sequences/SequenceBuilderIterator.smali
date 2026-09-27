.class final Lkotlin/sequences/SequenceBuilderIterator;
.super Lkotlin/sequences/SequenceScope;
.source "SequenceBuilder.kt"

# interfaces
.implements Ljava/util/Iterator;
.implements Lkotlin/coroutines/Continuation;
.implements Lkotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lkotlin/sequences/SequenceScope<",
        "TT;>;",
        "Ljava/util/Iterator<",
        "TT;>;",
        "Lkotlin/coroutines/Continuation<",
        "Lkotlin/Unit;",
        ">;",
        "Lkotlin/jvm/internal/markers/KMappedMarker;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000F\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010(\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0002\u0018\u0002\n\u0002\u0008\t\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0003\n\u0002\u0008\u0008\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008\u0002\u0018\u0000*\u0004\u0008\u0000\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u00022\u0008\u0012\u0004\u0012\u0002H\u00010\u00032\u0008\u0012\u0004\u0012\u00020\u00050\u0004B\t\u0008F\u00a2\u0006\u0004\u0008\u0006\u0010\u0007J\n\u0010\u0013\u001a\u00020\u0014H\u0096\u0082\u0004J\u000f\u0010\u0015\u001a\u00028\u0000H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0016J\u000f\u0010\u0017\u001a\u00028\u0000H\u0082\u0080\u0004\u00a2\u0006\u0002\u0010\u0016J\n\u0010\u0018\u001a\u00020\u0019H\u0082\u0080\u0004J\u0017\u0010\u001a\u001a\u00020\u00052\u0006\u0010\u001b\u001a\u00028\u0000H\u0096\u00c0\u0004\u00a2\u0006\u0002\u0010\u001cJ\u001d\u0010\u001d\u001a\u00020\u00052\u000c\u0010\u001e\u001a\u0008\u0012\u0004\u0012\u00028\u00000\u0003H\u0096\u00c0\u0004\u00a2\u0006\u0002\u0010\u001fJ\u001d\u0010 \u001a\u00020\u00052\u000c\u0010!\u001a\u0008\u0012\u0004\u0012\u00020\u00050\"H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010#R\u0013\u0010\u0008\u001a\u00060\tj\u0002`\nX\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u0013\u0010\u000b\u001a\u0004\u0018\u00018\u0000X\u0082\u008e\u0008\u00a2\u0006\u0004\n\u0002\u0010\u000cR\u0017\u0010\r\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u0003X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R#\u0010\u000e\u001a\n\u0012\u0004\u0012\u00020\u0005\u0018\u00010\u0004X\u0086\u008e\u0008\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u000f\u0010\u0010\"\u0004\u0008\u0011\u0010\u0012R\u0015\u0010$\u001a\u00020%8VX\u0096\u0084\u0008\u00a2\u0006\u0006\u001a\u0004\u0008&\u0010\'\u00a8\u0006("
    }
    d2 = {
        "Lkotlin/sequences/SequenceBuilderIterator;",
        "T",
        "Lkotlin/sequences/SequenceScope;",
        "",
        "Lkotlin/coroutines/Continuation;",
        "",
        "<init>",
        "()V",
        "state",
        "",
        "Lkotlin/sequences/State;",
        "nextValue",
        "Ljava/lang/Object;",
        "nextIterator",
        "nextStep",
        "getNextStep",
        "()Lkotlin/coroutines/Continuation;",
        "setNextStep",
        "(Lkotlin/coroutines/Continuation;)V",
        "hasNext",
        "",
        "next",
        "()Ljava/lang/Object;",
        "nextNotReady",
        "exceptionalState",
        "",
        "yield",
        "value",
        "(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "yieldAll",
        "iterator",
        "(Ljava/util/Iterator;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;",
        "resumeWith",
        "result",
        "Lkotlin/Result;",
        "(Ljava/lang/Object;)V",
        "context",
        "Lkotlin/coroutines/CoroutineContext;",
        "getContext",
        "()Lkotlin/coroutines/CoroutineContext;",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private nextIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+TT;>;"
        }
    .end annotation
.end field

.field private nextStep:Lkotlin/coroutines/Continuation;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation
.end field

.field private nextValue:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TT;"
        }
    .end annotation
.end field

.field private state:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 140
    invoke-direct {p0}, Lkotlin/sequences/SequenceScope;-><init>()V

    return-void
.end method

.method private final exceptionalState()Ljava/lang/Throwable;
    .registers 4

    .line 191
    iget v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2a

    const/4 v1, 0x5

    if-eq v0, v1, :cond_20

    .line 194
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected state of the iterator: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    check-cast v0, Ljava/lang/Throwable;

    return-object v0

    .line 193
    :cond_20
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Iterator has failed."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    check-cast p0, Ljava/lang/Throwable;

    return-object p0

    .line 192
    :cond_2a
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    check-cast p0, Ljava/lang/Throwable;

    return-object p0
.end method

.method private final nextNotReady()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 188
    invoke-virtual {p0}, Lkotlin/sequences/SequenceBuilderIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lkotlin/sequences/SequenceBuilderIterator;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_b
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method


# virtual methods
.method public getContext()Lkotlin/coroutines/CoroutineContext;
    .registers 1

    .line 224
    sget-object p0, Lkotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lkotlin/coroutines/EmptyCoroutineContext;

    check-cast p0, Lkotlin/coroutines/CoroutineContext;

    return-object p0
.end method

.method public final getNextStep()Lkotlin/coroutines/Continuation;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    .line 144
    iget-object p0, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    return-object p0
.end method

.method public hasNext()Z
    .registers 5

    .line 148
    :goto_0
    iget v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    const/4 v1, 0x0

    if-eqz v0, :cond_29

    const/4 v2, 0x2

    const/4 v3, 0x1

    if-eq v0, v3, :cond_19

    if-eq v0, v2, :cond_18

    const/4 v1, 0x3

    if-eq v0, v1, :cond_18

    const/4 v1, 0x4

    if-ne v0, v1, :cond_13

    const/4 p0, 0x0

    return p0

    .line 159
    :cond_13
    invoke-direct {p0}, Lkotlin/sequences/SequenceBuilderIterator;->exceptionalState()Ljava/lang/Throwable;

    move-result-object p0

    throw p0

    :cond_18
    return v3

    .line 151
    :cond_19
    iget-object v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    .line 152
    iput v2, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    return v3

    .line 155
    :cond_27
    iput-object v1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    :cond_29
    const/4 v0, 0x5

    .line 162
    iput v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    .line 163
    iget-object v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    invoke-static {v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    .line 164
    iput-object v1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    .line 165
    sget-object v1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    sget-object v2, Lkotlin/Result;->Companion:Lkotlin/Result$Companion;

    invoke-static {v1}, Lkotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lkotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    goto :goto_0
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 170
    iget v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    if-eqz v0, :cond_27

    const/4 v1, 0x1

    if-eq v0, v1, :cond_27

    const/4 v2, 0x2

    if-eq v0, v2, :cond_1b

    const/4 v1, 0x3

    if-ne v0, v1, :cond_16

    const/4 v0, 0x0

    .line 177
    iput v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    .line 179
    iget-object v0, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    const/4 v1, 0x0

    .line 180
    iput-object v1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    return-object v0

    .line 183
    :cond_16
    invoke-direct {p0}, Lkotlin/sequences/SequenceBuilderIterator;->exceptionalState()Ljava/lang/Throwable;

    move-result-object p0

    throw p0

    .line 173
    :cond_1b
    iput v1, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    .line 174
    iget-object p0, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    invoke-static {p0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNull(Ljava/lang/Object;)V

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 171
    :cond_27
    invoke-direct {p0}, Lkotlin/sequences/SequenceBuilderIterator;->nextNotReady()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove()V
    .registers 2

    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p0, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 2

    .line 219
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    const/4 p1, 0x4

    .line 220
    iput p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    return-void
.end method

.method public final setNextStep(Lkotlin/coroutines/Continuation;)V
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)V"
        }
    .end annotation

    .line 144
    iput-object p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    return-void
.end method

.method public yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 199
    iput-object p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    const/4 p1, 0x3

    .line 200
    iput p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    .line 202
    iput-object p2, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    .line 203
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    .line 201
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_14

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_14
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_1b

    return-object p0

    :cond_1b
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method

.method public yieldAll(Ljava/util/Iterator;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Iterator<",
            "+TT;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    .line 208
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_9

    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    .line 209
    :cond_9
    iput-object p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    const/4 p1, 0x2

    .line 210
    iput p1, p0, Lkotlin/sequences/SequenceBuilderIterator;->state:I

    .line 212
    iput-object p2, p0, Lkotlin/sequences/SequenceBuilderIterator;->nextStep:Lkotlin/coroutines/Continuation;

    .line 213
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p0

    .line 211
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_1d

    invoke-static {p2}, Lkotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lkotlin/coroutines/Continuation;)V

    :cond_1d
    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    if-ne p0, p1, :cond_24

    return-object p0

    :cond_24
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
