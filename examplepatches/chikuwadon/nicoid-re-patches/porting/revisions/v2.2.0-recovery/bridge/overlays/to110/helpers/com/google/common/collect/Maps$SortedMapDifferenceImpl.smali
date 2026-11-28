.class final Lcom/google/common/collect/Maps$SortedMapDifferenceImpl;
.super Lcom/google/common/collect/Maps$MapDifferenceImpl;
.source "Maps.java"

# interfaces
.implements Lcom/google/common/collect/SortedMapDifference;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SortedMapDifferenceImpl"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Maps$MapDifferenceImpl<",
        "TK;TV;>;",
        "Lcom/google/common/collect/SortedMapDifference<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/SortedMap;Ljava/util/SortedMap;Ljava/util/SortedMap;Ljava/util/SortedMap;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "onlyOnLeft",
            "onlyOnRight",
            "onBoth",
            "differences"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedMap<",
            "TK;TV;>;",
            "Ljava/util/SortedMap<",
            "TK;TV;>;",
            "Ljava/util/SortedMap<",
            "TK;TV;>;",
            "Ljava/util/SortedMap<",
            "TK;",
            "Lcom/google/common/collect/MapDifference$ValueDifference<",
            "TV;>;>;)V"
        }
    .end annotation

    .line 748
    invoke-direct {p0, p1, p2, p3, p4}, Lcom/google/common/collect/Maps$MapDifferenceImpl;-><init>(Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic entriesDiffering()Ljava/util/Map;
    .registers 1

    .line 740
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedMapDifferenceImpl;->entriesDiffering()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public entriesDiffering()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;",
            "Lcom/google/common/collect/MapDifference$ValueDifference<",
            "TV;>;>;"
        }
    .end annotation

    .line 753
    invoke-super {p0}, Lcom/google/common/collect/Maps$MapDifferenceImpl;->entriesDiffering()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method

.method public bridge synthetic entriesInCommon()Ljava/util/Map;
    .registers 1

    .line 740
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedMapDifferenceImpl;->entriesInCommon()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public entriesInCommon()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 758
    invoke-super {p0}, Lcom/google/common/collect/Maps$MapDifferenceImpl;->entriesInCommon()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method

.method public bridge synthetic entriesOnlyOnLeft()Ljava/util/Map;
    .registers 1

    .line 740
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedMapDifferenceImpl;->entriesOnlyOnLeft()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public entriesOnlyOnLeft()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 763
    invoke-super {p0}, Lcom/google/common/collect/Maps$MapDifferenceImpl;->entriesOnlyOnLeft()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method

.method public bridge synthetic entriesOnlyOnRight()Ljava/util/Map;
    .registers 1

    .line 740
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$SortedMapDifferenceImpl;->entriesOnlyOnRight()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public entriesOnlyOnRight()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 768
    invoke-super {p0}, Lcom/google/common/collect/Maps$MapDifferenceImpl;->entriesOnlyOnRight()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method
