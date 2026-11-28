.class final Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;
.super Lcom/google/common/collect/Maps$FilteredEntryMap$KeySet;
.source "Maps.java"

# interfaces
.implements Ljava/util/SortedSet;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps$FilteredEntrySortedMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x10
    name = "SortedKeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$FilteredEntryMap<",
        "TK;TV;>.KeySet;",
        "Ljava/util/SortedSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Maps$FilteredEntrySortedMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 3016
    iput-object p1, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-direct {p0, p1}, Lcom/google/common/collect/Maps$FilteredEntryMap$KeySet;-><init>(Lcom/google/common/collect/Maps$FilteredEntryMap;)V

    return-void
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TK;>;"
        }
    .end annotation

    .line 3019
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->sortedMap()Ljava/util/SortedMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedMap;->comparator()Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method public first()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 3041
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->firstKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public headSet(Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "toElement"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedSet<",
            "TK;>;"
        }
    .end annotation

    .line 3030
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->headMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/SortedSet;

    return-object p0
.end method

.method public last()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 3047
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->lastKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public subSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "toElement"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedSet<",
            "TK;>;"
        }
    .end annotation

    .line 3025
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->subMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/SortedSet;

    return-object p0
.end method

.method public tailSet(Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fromElement"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedSet<",
            "TK;>;"
        }
    .end annotation

    .line 3035
    iget-object p0, p0, Lcom/google/common/collect/Maps$FilteredEntrySortedMap$SortedKeySet;->this$0:Lcom/google/common/collect/Maps$FilteredEntrySortedMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/Maps$FilteredEntrySortedMap;->tailMap(Ljava/lang/Object;)Ljava/util/SortedMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/SortedMap;->keySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/SortedSet;

    return-object p0
.end method
