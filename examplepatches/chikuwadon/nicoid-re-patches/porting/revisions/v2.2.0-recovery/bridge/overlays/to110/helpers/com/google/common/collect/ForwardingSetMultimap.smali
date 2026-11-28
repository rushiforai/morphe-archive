.class public abstract Lcom/google/common/collect/ForwardingSetMultimap;
.super Lcom/google/common/collect/ForwardingMultimap;
.source "ForwardingSetMultimap.java"

# interfaces
.implements Lcom/google/common/collect/SetMultimap;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMultimap<",
        "TK;TV;>;",
        "Lcom/google/common/collect/SetMultimap<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 41
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMultimap;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Lcom/google/common/collect/Multimap;
    .registers 1

    .line 37
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Lcom/google/common/collect/SetMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SetMultimap<",
            "TK;TV;>;"
        }
    .end annotation
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 37
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic entries()Ljava/util/Collection;
    .registers 1

    .line 37
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->entries()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public entries()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 48
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SetMultimap;->entries()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 37
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingSetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 53
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/collect/SetMultimap;->get(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic removeAll(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 37
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingSetMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public removeAll(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 59
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/collect/SetMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Collection;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .line 37
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ForwardingSetMultimap;->replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable<",
            "+TV;>;)",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 65
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSetMultimap;->delegate()Lcom/google/common/collect/SetMultimap;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/SetMultimap;->replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
