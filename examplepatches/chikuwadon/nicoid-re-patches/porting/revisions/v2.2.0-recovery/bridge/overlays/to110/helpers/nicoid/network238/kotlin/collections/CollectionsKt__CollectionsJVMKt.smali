.class abstract Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsJVMKt;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static build(Ljava/util/List;)Ljava/util/List;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 52
    check-cast p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->build()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static final copyToArrayOfAny([Ljava/lang/Object;Z)[Ljava/lang/Object;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-class v0, [Ljava/lang/Object;

    if-eqz p1, :cond_0

    .line 98
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {p1, v0}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    return-object p0

    .line 102
    :cond_0
    array-length p1, p0

    invoke-static {p0, p1, v0}, Ljava/util/Arrays;->copyOf([Ljava/lang/Object;ILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static createListBuilder()Ljava/util/List;
    .registers 4

    .line 40
    new-instance v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;-><init>(IILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-object v0
.end method

.method public static listOf(Ljava/lang/Object;)Ljava/util/List;
    .registers 1

    .line 21
    invoke-static {p0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p0
.end method

.method public static shuffled(Ljava/lang/Iterable;)Ljava/util/List;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 68
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/CollectionsKt___CollectionsKt;->toMutableList(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->shuffle(Ljava/util/List;)V

    return-object p0
.end method

.method public static terminateCollectionToArray(I[Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 89
    array-length v0, p1

    if-ge p0, v0, :cond_0

    .line 91
    const/4 v0, 0x0

    aput-object v0, p1, p0

    :cond_0
    return-object p1
.end method
