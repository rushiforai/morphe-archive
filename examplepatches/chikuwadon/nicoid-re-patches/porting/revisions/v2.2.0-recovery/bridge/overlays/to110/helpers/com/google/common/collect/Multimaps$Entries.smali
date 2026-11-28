.class abstract Lcom/google/common/collect/Multimaps$Entries;
.super Ljava/util/AbstractCollection;
.source "Multimaps.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "Entries"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractCollection<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 1781
    invoke-direct {p0}, Ljava/util/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public final clear()V
    .registers 1

    .line 1810
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Entries;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/Multimap;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1792
    instance-of v0, p1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    .line 1793
    check-cast p1, Ljava/util/Map$Entry;

    .line 1794
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Entries;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Lcom/google/common/collect/Multimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method abstract multimap()Lcom/google/common/collect/Multimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multimap<",
            "TK;TV;>;"
        }
    .end annotation
.end method

.method public final remove(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1801
    instance-of v0, p1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    .line 1802
    check-cast p1, Ljava/util/Map$Entry;

    .line 1803
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Entries;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, v0, p1}, Lcom/google/common/collect/Multimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final size()I
    .registers 1

    .line 1787
    invoke-virtual {p0}, Lcom/google/common/collect/Multimaps$Entries;->multimap()Lcom/google/common/collect/Multimap;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/Multimap;->size()I

    move-result p0

    return p0
.end method
