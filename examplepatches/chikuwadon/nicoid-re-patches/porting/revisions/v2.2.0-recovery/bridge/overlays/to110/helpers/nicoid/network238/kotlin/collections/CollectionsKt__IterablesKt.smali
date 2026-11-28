.class abstract Lnicoid/network238/kotlin/collections/CollectionsKt__IterablesKt;
.super Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsKt;
.source "SourceFile"


# direct methods
.method public static collectionSizeOrDefault(Ljava/lang/Iterable;I)I
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 39
    instance-of v0, p0, Ljava/util/Collection;

    if-eqz v0, :cond_0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->size()I

    move-result p0

    return p0

    :cond_0
    return p1
.end method
