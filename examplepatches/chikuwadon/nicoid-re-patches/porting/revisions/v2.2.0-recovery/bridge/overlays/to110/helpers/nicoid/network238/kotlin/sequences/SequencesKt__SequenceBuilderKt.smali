.class abstract Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static final iterator(Lnicoid/network238/kotlin/jvm/functions/Function2;)Ljava/util/Iterator;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    new-instance v0, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;

    invoke-direct {v0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;-><init>()V

    .line 38
    invoke-static {p0, v0, v0}, Lnicoid/network238/kotlin/coroutines/intrinsics/IntrinsicsKt;->createCoroutineUnintercepted(Lnicoid/network238/kotlin/jvm/functions/Function2;Ljava/lang/Object;Lnicoid/network238/kotlin/coroutines/Continuation;)Lnicoid/network238/kotlin/coroutines/Continuation;

    move-result-object p0

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/sequences/SequenceBuilderIterator;->setNextStep(Lnicoid/network238/kotlin/coroutines/Continuation;)V

    return-object v0
.end method

.method public static sequence(Lnicoid/network238/kotlin/jvm/functions/Function2;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    new-instance v0, Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/sequences/SequencesKt__SequenceBuilderKt$sequence$$inlined$Sequence$1;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function2;)V

    return-object v0
.end method
