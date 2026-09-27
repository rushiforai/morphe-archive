.class final Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;
.super Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "_Sequences.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/sequences/SequencesKt___SequencesKt;->runningFoldIndexed(Lkotlin/sequences/Sequence;Ljava/lang/Object;Lkotlin/jvm/functions/Function3;)Lkotlin/sequences/Sequence;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;",
        "Lkotlin/jvm/functions/Function2<",
        "Lkotlin/sequences/SequenceScope<",
        "-TR;>;",
        "Lkotlin/coroutines/Continuation<",
        "-",
        "Lkotlin/Unit;",
        ">;",
        "Ljava/lang/Object;",
        ">;"
    }
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\u0010\u0000\u001a\u00020\u0001\"\u0004\u0008\u0000\u0010\u0002*\u0008\u0012\u0004\u0012\u0002H\u00020\u0003H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "R",
        "Lkotlin/sequences/SequenceScope;"
    }
    k = 0x3
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation

.annotation runtime Lkotlin/coroutines/jvm/internal/DebugMetadata;
    c = "kotlin.sequences.SequencesKt___SequencesKt$runningFoldIndexed$1"
    f = "_Sequences.kt"
    i = {
        0x0,
        0x1,
        0x1,
        0x1,
        0x1
    }
    l = {
        0xa4b,
        0xa50
    }
    m = "invokeSuspend"
    n = {
        "$this$sequence",
        "$this$sequence",
        "accumulator",
        "element",
        "index"
    }
    nl = {
        0xa4c,
        0xa52
    }
    s = {
        "L$0",
        "L$0",
        "L$1",
        "L$3",
        "I$0"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $initial:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field final synthetic $operation:Lkotlin/jvm/functions/Function3;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/jvm/functions/Function3<",
            "Ljava/lang/Integer;",
            "TR;TT;TR;>;"
        }
    .end annotation
.end field

.field final synthetic $this_runningFoldIndexed:Lkotlin/sequences/Sequence;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/sequences/Sequence<",
            "TT;>;"
        }
    .end annotation
.end field

.field I$0:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field L$2:Ljava/lang/Object;

.field L$3:Ljava/lang/Object;

.field label:I


# direct methods
.method constructor <init>(Ljava/lang/Object;Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function3;Lkotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;",
            "Lkotlin/sequences/Sequence<",
            "+TT;>;",
            "Lkotlin/jvm/functions/Function3<",
            "-",
            "Ljava/lang/Integer;",
            "-TR;-TT;+TR;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$initial:Ljava/lang/Object;

    iput-object p2, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$this_runningFoldIndexed:Lkotlin/sequences/Sequence;

    iput-object p3, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$operation:Lkotlin/jvm/functions/Function3;

    const/4 p1, 0x2

    invoke-direct {p0, p1, p4}, Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;-><init>(ILkotlin/coroutines/Continuation;)V

    return-void
.end method


# virtual methods
.method public final create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Lkotlin/coroutines/Continuation<",
            "*>;)",
            "Lkotlin/coroutines/Continuation<",
            "Lkotlin/Unit;",
            ">;"
        }
    .end annotation

    new-instance v0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;

    iget-object v1, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$initial:Ljava/lang/Object;

    iget-object v2, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$this_runningFoldIndexed:Lkotlin/sequences/Sequence;

    iget-object p0, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$operation:Lkotlin/jvm/functions/Function3;

    invoke-direct {v0, v1, v2, p0, p2}, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;-><init>(Ljava/lang/Object;Lkotlin/sequences/Sequence;Lkotlin/jvm/functions/Function3;Lkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lkotlin/sequences/SequenceScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/SequenceScope<",
            "-TR;>;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-object v0, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/sequences/SequenceScope;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 2634
    iget v2, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->label:I

    const/4 v3, 0x2

    const/4 v4, 0x1

    if-eqz v2, :cond_2b

    if-eq v2, v4, :cond_27

    if-ne v2, v3, :cond_1f

    iget v2, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->I$0:I

    iget-object v4, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$2:Ljava/lang/Object;

    check-cast v4, Ljava/util/Iterator;

    iget-object v5, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$1:Ljava/lang/Object;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    move-object p1, v5

    goto :goto_4a

    :cond_1f
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_27
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_3e

    :cond_2b
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 2635
    iget-object p1, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$initial:Ljava/lang/Object;

    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    iput-object v0, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$0:Ljava/lang/Object;

    iput v4, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->label:I

    invoke-virtual {v0, p1, v2}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p1

    if-ne p1, v1, :cond_3e

    goto :goto_7e

    .line 2637
    :cond_3e
    :goto_3e
    iget-object p1, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$initial:Ljava/lang/Object;

    .line 2638
    iget-object v2, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$this_runningFoldIndexed:Lkotlin/sequences/Sequence;

    invoke-interface {v2}, Lkotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    move v8, v4

    move-object v4, v2

    move v2, v8

    :goto_4a
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_81

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 2639
    iget-object v6, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->$operation:Lkotlin/jvm/functions/Function3;

    add-int/lit8 v7, v2, 0x1

    if-gez v2, :cond_5d

    invoke-static {}, Lkotlin/collections/CollectionsKt;->throwIndexOverflow()V

    :cond_5d
    invoke-static {v2}, Lkotlin/coroutines/jvm/internal/Boxing;->boxInt(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-interface {v6, v2, p1, v5}, Lkotlin/jvm/functions/Function3;->invoke(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 2640
    move-object v2, p0

    check-cast v2, Lkotlin/coroutines/Continuation;

    iput-object v0, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$0:Ljava/lang/Object;

    iput-object p1, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$1:Ljava/lang/Object;

    iput-object v4, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$2:Ljava/lang/Object;

    invoke-static {v5}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    iput-object v5, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->L$3:Ljava/lang/Object;

    iput v7, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->I$0:I

    iput v3, p0, Lkotlin/sequences/SequencesKt___SequencesKt$runningFoldIndexed$1;->label:I

    invoke-virtual {v0, p1, v2}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_7f

    :goto_7e
    return-object v1

    :cond_7f
    move v2, v7

    goto :goto_4a

    .line 2642
    :cond_81
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
