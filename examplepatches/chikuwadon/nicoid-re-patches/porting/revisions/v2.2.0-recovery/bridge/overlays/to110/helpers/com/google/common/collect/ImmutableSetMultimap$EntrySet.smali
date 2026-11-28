.class final Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;
.super Lcom/google/common/collect/ImmutableSet;
.source "ImmutableSetMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSetMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSet<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field private final transient multimap:Lcom/google/common/collect/ImmutableSetMultimap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableSetMultimap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "multimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 622
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableSet;-><init>()V

    .line 623
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;->multimap:Lcom/google/common/collect/ImmutableSetMultimap;

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 628
    instance-of v0, p1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    .line 629
    check-cast p1, Ljava/util/Map$Entry;

    .line 630
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;->multimap:Lcom/google/common/collect/ImmutableSetMultimap;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/ImmutableSetMultimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 642
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;->multimap:Lcom/google/common/collect/ImmutableSetMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSetMultimap;->entryIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 619
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 637
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSetMultimap$EntrySet;->multimap:Lcom/google/common/collect/ImmutableSetMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSetMultimap;->size()I

    move-result p0

    return p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 656
    invoke-super {p0}, Lcom/google/common/collect/ImmutableSet;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
