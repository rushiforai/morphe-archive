.class abstract Lnicoid/network238/kotlin/collections/SetsKt__SetsKt;
.super Lnicoid/network238/kotlin/collections/SetsKt__SetsJVMKt;
.source "SourceFile"


# direct methods
.method public static emptySet()Ljava/util/Set;
    .registers 1

    .line 36
    sget-object v0, Lnicoid/network238/kotlin/collections/EmptySet;->INSTANCE:Lnicoid/network238/kotlin/collections/EmptySet;

    return-object v0
.end method

.method public static final optimizeReadOnlySet(Ljava/util/Set;)Ljava/util/Set;
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 185
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-eq v0, v1, :cond_0

    return-object p0

    .line 187
    :cond_0
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/kotlin/collections/SetsKt__SetsJVMKt;->setOf(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    .line 186
    :cond_1
    invoke-static {}, Lnicoid/network238/kotlin/collections/SetsKt__SetsKt;->emptySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public static varargs setOf([Ljava/lang/Object;)Ljava/util/Set;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 44
    invoke-static {p0}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysKt;->toSet([Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
