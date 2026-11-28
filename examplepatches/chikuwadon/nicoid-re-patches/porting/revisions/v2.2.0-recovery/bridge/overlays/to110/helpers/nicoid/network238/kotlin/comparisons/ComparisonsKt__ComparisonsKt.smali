.class abstract Lnicoid/network238/kotlin/comparisons/ComparisonsKt__ComparisonsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static compareValues(Ljava/lang/Comparable;Ljava/lang/Comparable;)I
    .registers 2

    if-ne p0, p1, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    if-nez p0, :cond_1

    const/4 p0, -0x1

    return p0

    :cond_1
    if-nez p1, :cond_2

    const/4 p0, 0x1

    return p0

    .line 78
    :cond_2
    invoke-interface {p0, p1}, Ljava/lang/Comparable;->compareTo(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public static naturalOrder()Ljava/util/Comparator;
    .registers 1

    .line 286
    sget-object v0, Lnicoid/network238/kotlin/comparisons/NaturalOrderComparator;->INSTANCE:Lnicoid/network238/kotlin/comparisons/NaturalOrderComparator;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method
