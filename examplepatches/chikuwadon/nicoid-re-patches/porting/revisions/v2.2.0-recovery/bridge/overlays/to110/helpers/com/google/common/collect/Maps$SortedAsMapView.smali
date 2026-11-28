.class final Lcom/google/common/collect/Maps$SortedAsMapView;
.super Lcom/google/common/collect/Maps$AsMapView;
.source "Maps.java"

# interfaces
.implements Ljava/util/SortedMap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SortedAsMapView"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Maps$AsMapView<",
        "TK;TV;>;",
        "Ljava/util/SortedMap<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/SortedSet;Lcom/google/common/base/Function;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "set",
            "function"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedSet<",
            "TK;>;",
            "Lcom/google/common/base/Function<",
            "-TK;TV;>;)V"
        }
    .end annotation

    .line 965
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/Maps$AsMapView;-><init>(Ljava/util/Set;Lcom/google/common/base/Function;)V

    return-void
.end method


# virtual methods
.method bridge synthetic backingSet()Ljava/util/Set;
    .registers 1

    .line 961
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method backingSet()Ljava/util/SortedSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet<",
            "TK;>;"
        }
    .end annotation

    .line 970
    invoke-super {p0}, Lcom/google/common/collect/Maps$AsMapView;->backingSet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/SortedSet;

    return-object p0
.end method

.method public comparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TK;>;"
        }
    .end annotation

    .line 975
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedSet;->comparator()Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method public firstKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1001
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedSet;->first()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public headMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "toKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 990
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->headSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/Maps$SortedAsMapView;->function:Lcom/google/common/base/Function;

    invoke-static {p1, p0}, Lcom/google/common/collect/Maps;->asMap(Ljava/util/SortedSet;Lcom/google/common/base/Function;)Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public keySet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 980
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object p0

    # invokes: Lcom/google/common/collect/Maps;->removeOnlySortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;
    invoke-static {p0}, Lcom/google/common/collect/Maps;->access$200(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public lastKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 1007
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedSet;->last()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromKey",
            "toKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 985
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Ljava/util/SortedSet;->subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/Maps$SortedAsMapView;->function:Lcom/google/common/base/Function;

    invoke-static {p1, p0}, Lcom/google/common/collect/Maps;->asMap(Ljava/util/SortedSet;Lcom/google/common/base/Function;)Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fromKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 995
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedAsMapView;->backingSet()Ljava/util/SortedSet;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/SortedSet;->tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/Maps$SortedAsMapView;->function:Lcom/google/common/base/Function;

    invoke-static {p1, p0}, Lcom/google/common/collect/Maps;->asMap(Ljava/util/SortedSet;Lcom/google/common/base/Function;)Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method
