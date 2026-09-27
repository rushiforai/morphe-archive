.class final Lkotlin/text/Regex$splitToSequence$1;
.super Lkotlin/coroutines/jvm/internal/RestrictedSuspendLambda;
.source "Regex.kt"

# interfaces
.implements Lkotlin/jvm/functions/Function2;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lkotlin/text/Regex;->splitToSequence(Ljava/lang/CharSequence;I)Lkotlin/sequences/Sequence;
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
        "-",
        "Ljava/lang/String;",
        ">;",
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
        "\u0000\u000e\n\u0000\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u000e\u0010\u0000\u001a\u00020\u0001*\u0008\u0012\u0004\u0012\u00020\u00030\u0002H\n"
    }
    d2 = {
        "<anonymous>",
        "",
        "Lkotlin/sequences/SequenceScope;",
        ""
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
    c = "kotlin.text.Regex$splitToSequence$1"
    f = "Regex.kt"
    i = {
        0x0,
        0x0,
        0x1,
        0x1,
        0x1,
        0x1,
        0x2,
        0x2,
        0x2,
        0x2
    }
    l = {
        0x128,
        0x130,
        0x134
    }
    m = "invokeSuspend"
    n = {
        "$this$sequence",
        "matcher",
        "$this$sequence",
        "matcher",
        "nextStart",
        "splitCount",
        "$this$sequence",
        "matcher",
        "nextStart",
        "splitCount"
    }
    nl = {
        0x129,
        0x131,
        0x135
    }
    s = {
        "L$0",
        "L$1",
        "L$0",
        "L$1",
        "I$0",
        "I$1",
        "L$0",
        "L$1",
        "I$0",
        "I$1"
    }
    v = 0x2
.end annotation


# instance fields
.field final synthetic $input:Ljava/lang/CharSequence;

.field final synthetic $limit:I

.field I$0:I

.field I$1:I

.field private synthetic L$0:Ljava/lang/Object;

.field L$1:Ljava/lang/Object;

.field label:I

.field final synthetic this$0:Lkotlin/text/Regex;


# direct methods
.method constructor <init>(Lkotlin/text/Regex;Ljava/lang/CharSequence;ILkotlin/coroutines/Continuation;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/text/Regex;",
            "Ljava/lang/CharSequence;",
            "I",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/text/Regex$splitToSequence$1;",
            ">;)V"
        }
    .end annotation

    iput-object p1, p0, Lkotlin/text/Regex$splitToSequence$1;->this$0:Lkotlin/text/Regex;

    iput-object p2, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    iput p3, p0, Lkotlin/text/Regex$splitToSequence$1;->$limit:I

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

    new-instance v0, Lkotlin/text/Regex$splitToSequence$1;

    iget-object v1, p0, Lkotlin/text/Regex$splitToSequence$1;->this$0:Lkotlin/text/Regex;

    iget-object v2, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    iget p0, p0, Lkotlin/text/Regex$splitToSequence$1;->$limit:I

    invoke-direct {v0, v1, v2, p0, p2}, Lkotlin/text/Regex$splitToSequence$1;-><init>(Lkotlin/text/Regex;Ljava/lang/CharSequence;ILkotlin/coroutines/Continuation;)V

    iput-object p1, v0, Lkotlin/text/Regex$splitToSequence$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/coroutines/Continuation;

    return-object v0
.end method

.method public bridge synthetic invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    check-cast p1, Lkotlin/sequences/SequenceScope;

    check-cast p2, Lkotlin/coroutines/Continuation;

    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex$splitToSequence$1;->invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invoke(Lkotlin/sequences/SequenceScope;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/sequences/SequenceScope<",
            "-",
            "Ljava/lang/String;",
            ">;",
            "Lkotlin/coroutines/Continuation<",
            "-",
            "Lkotlin/Unit;",
            ">;)",
            "Ljava/lang/Object;"
        }
    .end annotation

    invoke-virtual {p0, p1, p2}, Lkotlin/text/Regex$splitToSequence$1;->create(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Lkotlin/coroutines/Continuation;

    move-result-object p0

    check-cast p0, Lkotlin/text/Regex$splitToSequence$1;

    sget-object p1, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    invoke-virtual {p0, p1}, Lkotlin/text/Regex$splitToSequence$1;->invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final invokeSuspend(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 12

    iget-object v0, p0, Lkotlin/text/Regex$splitToSequence$1;->L$0:Ljava/lang/Object;

    check-cast v0, Lkotlin/sequences/SequenceScope;

    invoke-static {}, Lkotlin/coroutines/intrinsics/IntrinsicsKt;->getCOROUTINE_SUSPENDED()Ljava/lang/Object;

    move-result-object v1

    .line 293
    iget v2, p0, Lkotlin/text/Regex$splitToSequence$1;->label:I

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eqz v2, :cond_39

    if-eq v2, v5, :cond_30

    if-eq v2, v4, :cond_26

    if-ne v2, v3, :cond_1e

    iget-object p0, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    check-cast p0, Ljava/util/regex/Matcher;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_b9

    :cond_1e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "call to \'resume\' before \'invoke\' with coroutine"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_26
    iget v2, p0, Lkotlin/text/Regex$splitToSequence$1;->I$1:I

    iget-object v6, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    check-cast v6, Ljava/util/regex/Matcher;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto :goto_7a

    :cond_30
    iget-object p0, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    check-cast p0, Ljava/util/regex/Matcher;

    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    goto/16 :goto_da

    :cond_39
    invoke-static {p1}, Lkotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    .line 294
    iget-object p1, p0, Lkotlin/text/Regex$splitToSequence$1;->this$0:Lkotlin/text/Regex;

    # getter for: Lkotlin/text/Regex;->nativePattern:Ljava/util/regex/Pattern;
    invoke-static {p1}, Lkotlin/text/Regex;->access$getNativePattern$p(Lkotlin/text/Regex;)Ljava/util/regex/Pattern;

    move-result-object p1

    iget-object v2, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    invoke-virtual {p1, v2}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    .line 295
    iget v2, p0, Lkotlin/text/Regex$splitToSequence$1;->$limit:I

    if-eq v2, v5, :cond_bc

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v2

    if-nez v2, :cond_54

    goto/16 :goto_bc

    :cond_54
    const/4 v2, 0x0

    move-object v6, p1

    move p1, v2

    .line 304
    :goto_57
    iget-object v7, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->start()I

    move-result v8

    invoke-interface {v7, v2, v8}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v7

    move-object v8, p0

    check-cast v8, Lkotlin/coroutines/Continuation;

    iput-object v0, p0, Lkotlin/text/Regex$splitToSequence$1;->L$0:Ljava/lang/Object;

    iput-object v6, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    iput v2, p0, Lkotlin/text/Regex$splitToSequence$1;->I$0:I

    iput p1, p0, Lkotlin/text/Regex$splitToSequence$1;->I$1:I

    iput v4, p0, Lkotlin/text/Regex$splitToSequence$1;->label:I

    invoke-virtual {v0, v7, v8}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object v2

    if-ne v2, v1, :cond_79

    goto :goto_d9

    :cond_79
    move v2, p1

    .line 305
    :goto_7a
    invoke-virtual {v6}, Ljava/util/regex/Matcher;->end()I

    move-result p1

    add-int/2addr v2, v5

    .line 306
    iget v7, p0, Lkotlin/text/Regex$splitToSequence$1;->$limit:I

    sub-int/2addr v7, v5

    if-eq v2, v7, :cond_8f

    invoke-virtual {v6}, Ljava/util/regex/Matcher;->find()Z

    move-result v7

    if-nez v7, :cond_8b

    goto :goto_8f

    :cond_8b
    move v9, v2

    move v2, p1

    move p1, v9

    goto :goto_57

    .line 308
    :cond_8f
    :goto_8f
    iget-object v4, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    invoke-interface {v4}, Ljava/lang/CharSequence;->length()I

    move-result v5

    invoke-interface {v4, p1, v5}, Ljava/lang/CharSequence;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v4

    move-object v5, p0

    check-cast v5, Lkotlin/coroutines/Continuation;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v7

    iput-object v7, p0, Lkotlin/text/Regex$splitToSequence$1;->L$0:Ljava/lang/Object;

    invoke-static {v6}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    iput-object v6, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    iput p1, p0, Lkotlin/text/Regex$splitToSequence$1;->I$0:I

    iput v2, p0, Lkotlin/text/Regex$splitToSequence$1;->I$1:I

    iput v3, p0, Lkotlin/text/Regex$splitToSequence$1;->label:I

    invoke-virtual {v0, v4, v5}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_b9

    goto :goto_d9

    .line 309
    :cond_b9
    :goto_b9
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0

    .line 296
    :cond_bc
    :goto_bc
    iget-object v2, p0, Lkotlin/text/Regex$splitToSequence$1;->$input:Ljava/lang/CharSequence;

    invoke-virtual {v2}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v2

    move-object v3, p0

    check-cast v3, Lkotlin/coroutines/Continuation;

    invoke-static {v0}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    iput-object v4, p0, Lkotlin/text/Regex$splitToSequence$1;->L$0:Ljava/lang/Object;

    invoke-static {p1}, Lkotlin/coroutines/jvm/internal/SpillingKt;->nullOutSpilledVariable(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lkotlin/text/Regex$splitToSequence$1;->L$1:Ljava/lang/Object;

    iput v5, p0, Lkotlin/text/Regex$splitToSequence$1;->label:I

    invoke-virtual {v0, v2, v3}, Lkotlin/sequences/SequenceScope;->yield(Ljava/lang/Object;Lkotlin/coroutines/Continuation;)Ljava/lang/Object;

    move-result-object p0

    if-ne p0, v1, :cond_da

    :goto_d9
    return-object v1

    .line 297
    :cond_da
    :goto_da
    sget-object p0, Lkotlin/Unit;->INSTANCE:Lkotlin/Unit;

    return-object p0
.end method
