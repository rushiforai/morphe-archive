.class abstract Lnicoid/network238/kotlin/collections/CollectionsKt__MutableCollectionsJVMKt;
.super Lnicoid/network238/kotlin/collections/CollectionsKt__IteratorsKt;
.source "SourceFile"


# direct methods
.method public static sort(Ljava/util/List;)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-static {p0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    :cond_0
    return-void
.end method

.method public static final sortWith(Ljava/util/List;Ljava/util/Comparator;)V
    .registers 4

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    invoke-static {p0, p1}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    :cond_0
    return-void
.end method
