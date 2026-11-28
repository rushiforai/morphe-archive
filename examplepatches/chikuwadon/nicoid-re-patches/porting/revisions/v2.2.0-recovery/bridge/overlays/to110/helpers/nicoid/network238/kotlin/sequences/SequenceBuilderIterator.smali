.class final Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;
.super Lnicoid/network238/kotlin/sequences/SequenceScope;
.source "SourceFile"

# interfaces
.implements Ljava/util/Iterator;
.implements Lnicoid/network238/kotlin/coroutines/Continuation;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# instance fields
.field private nextIterator:Ljava/util/Iterator;

.field private nextStep:Lnicoid/network238/kotlin/coroutines/Continuation;

.field private nextValue:Ljava/lang/Object;

.field private state:I


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 104
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/SequenceScope;-><init>()V

    return-void
.end method

.method private final exceptionalState()Ljava/lang/Throwable;
    .registers 4

    .line 155
    iget v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    const/4 v1, 0x4

    if-eq v0, v1, :cond_1

    const/4 v1, 0x5

    if-eq v0, v1, :cond_0

    .line 158
    new-instance v0, Ljava/lang/IllegalStateException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected state of the iterator: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v2, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 157
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Iterator has failed."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    return-object v0

    .line 156
    :cond_1
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    return-object v0
.end method

.method private final nextNotReady()Ljava/lang/Object;
    .registers 2

    .line 152
    invoke-virtual {p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method


# virtual methods
.method public getContext()Lnicoid/network238/kotlin/coroutines/CoroutineContext;
    .registers 2

    .line 188
    sget-object v0, Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;->INSTANCE:Lnicoid/network238/kotlin/coroutines/EmptyCoroutineContext;

    return-object v0
.end method

.method public hasNext()Z
    .registers 4

    .line 112
    :goto_0
    iget v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    packed-switch v0, :pswitch_data_0

    .line 123
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->exceptionalState()Ljava/lang/Throwable;

    move-result-object v0

    throw v0

    :pswitch_0
    const/4 v0, 0x0

    return v0

    :pswitch_1
    return v1

    .line 115
    :pswitch_2
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 116
    const/4 v0, 0x2

    iput v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    return v1

    :cond_0
    nop

    .line 119
    iput-object v2, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    :pswitch_3
    nop

    .line 126
    const/4 v0, 0x5

    iput v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    .line 127
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextStep:Lnicoid/network238/kotlin/coroutines/Continuation;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 128
    iput-object v2, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextStep:Lnicoid/network238/kotlin/coroutines/Continuation;

    .line 129
    sget-object v1, Lnicoid/network238/kotlin/Result;->Companion:Lnicoid/network238/kotlin/Result$Companion;

    sget-object v1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    invoke-static {v1}, Lnicoid/network238/kotlin/Result;->constructor-impl(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0, v1}, Lnicoid/network238/kotlin/coroutines/Continuation;->resumeWith(Ljava/lang/Object;)V

    goto :goto_0

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .line 134
    iget v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    packed-switch v0, :pswitch_data_0

    .line 147
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->exceptionalState()Ljava/lang/Throwable;

    move-result-object v0

    throw v0

    :pswitch_0
    nop

    .line 141
    const/4 v0, 0x0

    iput v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    .line 143
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    .line 144
    const/4 v1, 0x0

    iput-object v1, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    return-object v0

    :pswitch_1
    nop

    .line 137
    const/4 v0, 0x1

    iput v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    .line 138
    iget-object v0, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextIterator:Ljava/util/Iterator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 135
    :pswitch_2
    invoke-direct {p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextNotReady()Ljava/lang/Object;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public remove()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public resumeWith(Ljava/lang/Object;)V
    .registers 2

    .line 183
    invoke-static {p1}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 184
    const/4 p1, 0x4

    iput p1, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    return-void
.end method

.method public final setNextStep(Lnicoid/network238/kotlin/coroutines/Continuation;)V
    .registers 2

    .line 108
    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextStep:Lnicoid/network238/kotlin/coroutines/Continuation;

    return-void
.end method

.method public yield(Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 4

    .line 163
    iput-object p1, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextValue:Ljava/lang/Object;

    .line 164
    const/4 p1, 0x3

    iput p1, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->state:I

    .line 166
    iput-object p2, p0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->nextStep:Lnicoid/network238/kotlin/coroutines/Continuation;

    .line 167
    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p1

    .line 165
    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v0

    if-ne p1, v0, :cond_0

    invoke-static {p2}, Lnicoid/network238/kotlin/coroutines/jvm/internal/DebugProbesKt;->probeCoroutineSuspended(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    :cond_0
    invoke-static {}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object p2

    if-ne p1, p2, :cond_1

    return-object p1

    :cond_1
    sget-object p1, Lnicoid/network238/kotlin/Unit;->INSTANCE:Lnicoid/network238/kotlin/Unit;

    return-object p1
.end method
