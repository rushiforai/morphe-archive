.class final Lcom/google/common/collect/Multisets$FilteredMultiset;
.super Lcom/google/common/collect/Multisets$ViewMultiset;
.source "Multisets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multisets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "FilteredMultiset"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Multisets$ViewMultiset<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final predicate:Lcom/google/common/base/Predicate;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/base/Predicate<",
            "-TE;>;"
        }
    .end annotation
.end field

.field final unfiltered:Lcom/google/common/collect/Multiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Multiset<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multiset;Lcom/google/common/base/Predicate;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "unfiltered",
            "predicate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multiset<",
            "TE;>;",
            "Lcom/google/common/base/Predicate<",
            "-TE;>;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 317
    invoke-direct {p0, v0}, Lcom/google/common/collect/Multisets$ViewMultiset;-><init>(Lcom/google/common/collect/Multisets$1;)V

    .line 318
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/Multiset;

    iput-object p1, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    .line 319
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/base/Predicate;

    iput-object p1, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;I)I
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .line 360
    iget-object v0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    .line 361
    invoke-interface {v0, p1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Element %s does not match predicate %s"

    iget-object v2, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    .line 360
    invoke-static {v0, v1, p1, v2}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 362
    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/Multiset;->add(Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method public count(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .line 349
    iget-object v0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multiset;->count(Ljava/lang/Object;)I

    move-result v0

    const/4 v1, 0x0

    if-lez v0, :cond_0

    .line 353
    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    invoke-interface {p0, p1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    return v0

    :cond_0
    return v1
.end method

.method elementIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 334
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "should never be called"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public elementSet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 329
    iget-object v0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v0, p0}, Lcom/google/common/collect/Sets;->filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 339
    iget-object v0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object v0

    new-instance v1, Lcom/google/common/collect/Multisets$FilteredMultiset$0;

    invoke-direct {v1, p0}, Lcom/google/common/collect/Multisets$FilteredMultiset$0;-><init>(Lcom/google/common/collect/Multisets$FilteredMultiset;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Sets;->filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method internalEntryIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 344
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "should never be called"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 324
    iget-object v0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    invoke-static {v0, p0}, Lcom/google/common/collect/Iterators;->filter(Ljava/util/Iterator;Lcom/google/common/base/Predicate;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 313
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$FilteredMultiset;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$entrySet$0$com-google-common-collect-Multisets$FilteredMultiset(Lcom/google/common/collect/Multiset$Entry;)Z
    .registers 2

    .line 339
    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->predicate:Lcom/google/common/base/Predicate;

    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/common/base/Predicate;->apply(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public remove(Ljava/lang/Object;I)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    .line 367
    const-string v0, "occurrences"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    if-nez p2, :cond_0

    .line 369
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multisets$FilteredMultiset;->count(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 371
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multisets$FilteredMultiset;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    iget-object p0, p0, Lcom/google/common/collect/Multisets$FilteredMultiset;->unfiltered:Lcom/google/common/collect/Multiset;

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/Multiset;->remove(Ljava/lang/Object;I)I

    move-result p0

    return p0

    :cond_1
    const/4 p0, 0x0

    return p0
.end method
