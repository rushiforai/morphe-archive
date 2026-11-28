.class abstract Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt;
.super Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesJvmKt;
.source "SourceFile"


# direct methods
.method public static asIterable(Lnicoid/network238/kotlin/sequences/Sequence;)Ljava/lang/Iterable;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3033
    new-instance v0, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt$asIterable$$inlined$Iterable$1;-><init>(Lnicoid/network238/kotlin/sequences/Sequence;)V

    return-object v0
.end method

.method public static drop(Lnicoid/network238/kotlin/sequences/Sequence;I)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    if-ltz p1, :cond_2

    if-nez p1, :cond_0

    return-object p0

    .line 411
    :cond_0
    instance-of v0, p0, Lnicoid/network238/kotlin/sequences/DropTakeSequence;

    if-eqz v0, :cond_1

    check-cast p0, Lnicoid/network238/kotlin/sequences/DropTakeSequence;

    invoke-interface {p0, p1}, Lnicoid/network238/kotlin/sequences/DropTakeSequence;->drop(I)Lnicoid/network238/kotlin/sequences/Sequence;

    move-result-object p0

    return-object p0

    .line 412
    :cond_1
    new-instance v0, Lnicoid/network238/kotlin/sequences/DropSequence;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/sequences/DropSequence;-><init>(Lnicoid/network238/kotlin/sequences/Sequence;I)V

    return-object v0

    .line 408
    :cond_2
    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Requested element count "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    const-string p1, " is less than zero."

    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    new-instance p1, Ljava/lang/IllegalArgumentException;

    invoke-virtual {p0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {p1, p0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public static final joinTo(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/Appendable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Appendable;
    .registers 10

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3002
    invoke-interface {p1, p3}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 3004
    invoke-interface {p0}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 p3, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    add-int/lit8 p3, p3, 0x1

    const/4 v1, 0x1

    if-le p3, v1, :cond_0

    .line 3005
    invoke-interface {p1, p2}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    :cond_0
    if-ltz p5, :cond_1

    if-le p3, p5, :cond_1

    goto :goto_1

    .line 3007
    :cond_1
    invoke-static {p1, v0, p7}, Lnicoid/network238/kotlin/text/StringsKt;->appendElement(Ljava/lang/Appendable;Ljava/lang/Object;Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    goto :goto_0

    :cond_2
    :goto_1
    if-ltz p5, :cond_3

    if-le p3, p5, :cond_3

    .line 3010
    invoke-interface {p1, p6}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    .line 3011
    :cond_3
    invoke-interface {p1, p4}, Ljava/lang/Appendable;->append(Ljava/lang/CharSequence;)Ljava/lang/Appendable;

    return-object p1
.end method

.method public static final joinToString(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/String;
    .registers 15

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 3026
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    move-object v0, p0

    move-object v2, p1

    move-object v3, p2

    move-object v4, p3

    move v5, p4

    move-object v6, p5

    move-object v7, p6

    invoke-static/range {v0 .. v7}, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt;->joinTo(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/Appendable;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/Appendable;

    move-result-object p0

    check-cast p0, Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic joinToString$default(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;ILjava/lang/Object;)Ljava/lang/String;
    .registers 10

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    .line 3025
    const-string p1, ", "

    :cond_0
    and-int/lit8 p8, p7, 0x2

    const-string v0, ""

    if-eqz p8, :cond_1

    move-object p2, v0

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    move-object p3, v0

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    const/4 p4, -0x1

    :cond_3
    and-int/lit8 p8, p7, 0x10

    if-eqz p8, :cond_4

    const-string p5, "..."

    :cond_4
    and-int/lit8 p7, p7, 0x20

    if-eqz p7, :cond_5

    const/4 p6, 0x0

    :cond_5
    move-object p8, p6

    move p6, p4

    move-object p7, p5

    move-object p4, p2

    move-object p5, p3

    move-object p2, p0

    move-object p3, p1

    invoke-static/range {p2 .. p8}, Lnicoid/network238/kotlin/sequences/SequencesKt___SequencesKt;->joinToString(Lnicoid/network238/kotlin/sequences/Sequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/CharSequence;ILjava/lang/CharSequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public static map(Lnicoid/network238/kotlin/sequences/Sequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)Lnicoid/network238/kotlin/sequences/Sequence;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 1078
    new-instance v0, Lnicoid/network238/kotlin/sequences/TransformingSequence;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/sequences/TransformingSequence;-><init>(Lnicoid/network238/kotlin/sequences/Sequence;Lnicoid/network238/kotlin/jvm/functions/Function1;)V

    return-object v0
.end method

.method public static toList(Lnicoid/network238/kotlin/sequences/Sequence;)Ljava/util/List;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 816
    invoke-interface {p0}, Lnicoid/network238/kotlin/sequences/Sequence;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 817
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    .line 818
    invoke-static {}, Lnicoid/network238/kotlin/collections/CollectionsKt;->emptyList()Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 819
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 820
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-nez v1, :cond_1

    .line 821
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/CollectionsKt;->listOf(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0

    .line 822
    :cond_1
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 823
    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    .line 824
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v1, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_0

    :cond_2
    return-object v1
.end method
