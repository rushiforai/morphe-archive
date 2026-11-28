.class abstract Lnicoid/network238/kotlin/sequences/SequencesKt__SequencesKt;
.super Lnicoid/network238/kotlin/sequences/SequencesKt__SequencesJVMKt;
.source "SourceFile"


# direct methods
.method public static synthetic $r8$lambda$25ni0aU1ETnphMQDOvfd00B9RQ4(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    invoke-static {p0}, Lnicoid/network238/kotlin/sequences/SequencesKt__SequencesKt;->generateSequence$lambda$5$SequencesKt__SequencesKt(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public static generateSequence(Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-nez p0, :cond_0

    .line 678
    sget-object p0, Lnicoid/network238/kotlin/sequences/EmptySequence;->INSTANCE:Lnicoid/network238/kotlin/sequences/EmptySequence;

    return-object p0

    .line 680
    :cond_0
    new-instance v0, Lnicoid/network238/kotlin/sequences/GeneratorSequence;

    new-instance v1, Lnicoid/network238/kotlin/sequences/SequencesKt__SequencesKt$0;

    invoke-direct {v1, p0}, Lnicoid/network238/kotlin/sequences/SequencesKt__SequencesKt$0;-><init>(Ljava/lang/Object;)V

    invoke-direct {v0, v1, p1}, Lnicoid/network238/kotlin/sequences/GeneratorSequence;-><init>(Lnicoid/network238/kotlin/jvm/functions/Function0;Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method private static final generateSequence$lambda$5$SequencesKt__SequencesKt(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 1

    return-object p0
.end method
