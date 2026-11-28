.class abstract Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;
.super Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;
.source "SourceFile"


# direct methods
.method public static emptyMap()Ljava/util/Map;
    .registers 1

    .line 40
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptyMap;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptyMap;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object v0
.end method

.method public static varargs mutableMapOf([Lnicoid/network238/kotlin/Pair;)Ljava/util/Map;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 99
    new-instance v0, Ljava/util/LinkedHashMap;

    array-length v1, p0

    invoke-static {v1}, Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;->mapCapacity(I)I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-static {v0, p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->putAll(Ljava/util/Map;[Lnicoid/network238/kotlin/Pair;)V

    return-object v0
.end method

.method public static final optimizeReadOnlyMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 811
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return-object p0

    .line 813
    :cond_0
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;->toSingletonMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 812
    :cond_1
    invoke-static {}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static final putAll(Ljava/util/Map;Ljava/lang/Iterable;)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 442
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnicoid/network238/kotlin/Pair;

    invoke-virtual {v0}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v0

    .line 443
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static final putAll(Ljava/util/Map;[Lnicoid/network238/kotlin/Pair;)V
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 433
    array-length v0, p1

    const/4 v1, 0x0

    :goto_0
    if-ge v1, v0, :cond_0

    aget-object v2, p1, v1

    invoke-virtual {v2}, Lnicoid/network238/kotlin/Pair;->component1()Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v2}, Lnicoid/network238/kotlin/Pair;->component2()Ljava/lang/Object;

    move-result-object v2

    .line 434
    invoke-interface {p0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    return-void
.end method

.method public static toMap(Ljava/lang/Iterable;)Ljava/util/Map;
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 573
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_3

    .line 574
    move-object v0, p0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v1

    if-eqz v1, :cond_2

    const/4 v2, 0x1

    if-eq v1, v2, :cond_0

    .line 577
    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result v0

    invoke-static {v0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;->mapCapacity(I)I

    move-result v0

    invoke-direct {v1, v0}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-static {p0, v1}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->toMap(Ljava/lang/Iterable;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 576
    :cond_0
    instance-of v1, p0, Ljava/util/List;

    if-eqz v1, :cond_1

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    goto :goto_0

    :cond_1
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    :goto_0
    check-cast p0, Lnicoid/network238/kotlin/Pair;

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;->mapOf(Lnicoid/network238/kotlin/Pair;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 575
    :cond_2
    invoke-static {}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 580
    :cond_3
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-static {p0, v0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->toMap(Ljava/lang/Iterable;Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->optimizeReadOnlyMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static final toMap(Ljava/lang/Iterable;Ljava/util/Map;)Ljava/util/Map;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 587
    invoke-static {p1, p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->putAll(Ljava/util/Map;Ljava/lang/Iterable;)V

    return-object p1
.end method

.method public static toMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 627
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    .line 630
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->toMutableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 629
    :cond_0
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/MapsKt__MapsJVMKt;->toSingletonMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object p0

    return-object p0

    .line 628
    :cond_1
    invoke-static {}, Lnicoid/network238/kotlin/collections/MapsKt__MapsKt;->emptyMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public static toMutableMap(Ljava/util/Map;)Ljava/util/Map;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 639
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0, p0}, Ljava/util/LinkedHashMap;-><init>(Ljava/util/Map;)V

    return-object v0
.end method
