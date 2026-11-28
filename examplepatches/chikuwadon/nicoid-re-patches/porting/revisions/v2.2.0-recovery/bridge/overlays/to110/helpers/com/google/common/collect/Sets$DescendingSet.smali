.class Lcom/google/common/collect/Sets$DescendingSet;
.super Lcom/google/common/collect/ForwardingNavigableSet;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Sets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x8
    name = "DescendingSet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingNavigableSet<",
        "TE;>;"
    }
.end annotation


# instance fields
.field private final forward:Ljava/util/NavigableSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/NavigableSet;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "forward"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/NavigableSet<",
            "TE;>;)V"
        }
    .end annotation

    .line 2085
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingNavigableSet;-><init>()V

    .line 2086
    iput-object p1, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    return-void
.end method

.method private static reverse(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "forward"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "TT;>;)",
            "Lcom/google/common/collect/Ordering<",
            "TT;>;"
        }
    .end annotation

    .line 2181
    invoke-static {p0}, Lcom/google/common/collect/Ordering;->from(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/Ordering;->reverse()Lcom/google/common/collect/Ordering;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public ceiling(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .line 2106
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1}, Ljava/util/NavigableSet;->floor(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public comparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TE;>;"
        }
    .end annotation

    .line 2171
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->comparator()Ljava/util/Comparator;

    move-result-object p0

    if-nez p0, :cond_0

    .line 2173
    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/Ordering;->reverse()Lcom/google/common/collect/Ordering;

    move-result-object p0

    return-object p0

    .line 2175
    :cond_0
    invoke-static {p0}, Lcom/google/common/collect/Sets$DescendingSet;->reverse(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 2081
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->delegate()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .registers 1

    .line 2081
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->delegate()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 2091
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Set;
    .registers 1

    .line 2081
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->delegate()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/SortedSet;
    .registers 1

    .line 2081
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->delegate()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public descendingIterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 2131
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public descendingSet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 2126
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    return-object p0
.end method

.method public first()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 2187
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->last()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public floor(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .line 2101
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1}, Ljava/util/NavigableSet;->ceiling(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "toElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 2150
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1, p2}, Ljava/util/NavigableSet;->tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableSet;->descendingSet()Ljava/util/NavigableSet;

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
            "(TE;)",
            "Ljava/util/SortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 2155
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Sets$DescendingSet;->standardHeadSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public higher(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .line 2111
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1}, Ljava/util/NavigableSet;->lower(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 2198
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->descendingIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public last()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 2193
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->first()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public lower(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    .line 2096
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1}, Ljava/util/NavigableSet;->higher(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public pollFirst()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 2116
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->pollLast()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public pollLast()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 2121
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0}, Ljava/util/NavigableSet;->pollFirst()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "fromInclusive",
            "toElement",
            "toInclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;ZTE;Z)",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 2140
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p3, p4, p1, p2}, Ljava/util/NavigableSet;->subSet(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableSet;->descendingSet()Ljava/util/NavigableSet;

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
            "(TE;TE;)",
            "Ljava/util/SortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 2145
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Sets$DescendingSet;->standardSubSet(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public tailSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 2160
    iget-object p0, p0, Lcom/google/common/collect/Sets$DescendingSet;->forward:Ljava/util/NavigableSet;

    invoke-interface {p0, p1, p2}, Ljava/util/NavigableSet;->headSet(Ljava/lang/Object;Z)Ljava/util/NavigableSet;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableSet;->descendingSet()Ljava/util/NavigableSet;

    move-result-object p0

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
            "(TE;)",
            "Ljava/util/SortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 2165
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Sets$DescendingSet;->standardTailSet(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 1

    .line 2203
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->standardToArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "array"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 2209
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Sets$DescendingSet;->standardToArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 2214
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$DescendingSet;->standardToString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
