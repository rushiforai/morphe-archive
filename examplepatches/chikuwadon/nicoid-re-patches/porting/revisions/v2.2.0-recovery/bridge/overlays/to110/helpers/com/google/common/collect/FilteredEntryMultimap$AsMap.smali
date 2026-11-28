.class final Lcom/google/common/collect/FilteredEntryMultimap$AsMap;
.super Ljava/util/AbstractMap;
.source "FilteredEntryMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/FilteredEntryMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "AsMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractMap<",
        "TK;",
        "Ljava/util/Collection<",
        "TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/FilteredEntryMultimap;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/FilteredEntryMultimap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 221
    iput-object p1, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/FilteredEntryMultimap;Lcom/google/common/collect/FilteredEntryMultimap$1;)V
    .registers 3

    .line 221
    invoke-direct {p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;-><init>(Lcom/google/common/collect/FilteredEntryMultimap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 229
    iget-object p0, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    invoke-virtual {p0}, Lcom/google/common/collect/FilteredEntryMultimap;->clear()V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 224
    invoke-virtual {p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;>;"
        }
    .end annotation

    .line 340
    new-instance v0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1EntrySetImpl;

    invoke-direct {v0, p0}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1EntrySetImpl;-><init>(Lcom/google/common/collect/FilteredEntryMultimap$AsMap;)V

    return-object v0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 221
    invoke-virtual {p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 5
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
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 234
    iget-object v0, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    iget-object v0, v0, Lcom/google/common/collect/FilteredEntryMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 240
    :cond_0
    new-instance v2, Lcom/google/common/collect/FilteredEntryMultimap$ValuePredicate;

    iget-object p0, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    invoke-direct {v2, p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$ValuePredicate;-><init>(Lcom/google/common/collect/FilteredEntryMultimap;Ljava/lang/Object;)V

    invoke-static {v0, v2}, Lcom/google/common/collect/FilteredEntryMultimap;->filterCollection(Ljava/util/Collection;Lcom/google/common/base/Predicate;)Ljava/util/Collection;

    move-result-object p0

    .line 241
    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    return-object v1

    :cond_1
    return-object p0
.end method

.method public keySet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 292
    new-instance v0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1KeySetImpl;

    invoke-direct {v0, p0}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1KeySetImpl;-><init>(Lcom/google/common/collect/FilteredEntryMultimap$AsMap;)V

    return-object v0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 221
    invoke-virtual {p0, p1}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->remove(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 7
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
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 246
    iget-object v0, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    iget-object v0, v0, Lcom/google/common/collect/FilteredEntryMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    invoke-interface {v0}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return-object v1

    .line 252
    :cond_0
    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    .line 253
    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 254
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2

    .line 255
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 256
    iget-object v4, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    # invokes: Lcom/google/common/collect/FilteredEntryMultimap;->satisfies(Ljava/lang/Object;Ljava/lang/Object;)Z
    invoke-static {v4, p1, v3}, Lcom/google/common/collect/FilteredEntryMultimap;->access$000(Lcom/google/common/collect/FilteredEntryMultimap;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_1

    .line 257
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 258
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_0

    .line 261
    :cond_2
    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_3

    return-object v1

    .line 263
    :cond_3
    iget-object p0, p0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap;->this$0:Lcom/google/common/collect/FilteredEntryMultimap;

    iget-object p0, p0, Lcom/google/common/collect/FilteredEntryMultimap;->unfiltered:Lcom/google/common/collect/Multimap;

    instance-of p0, p0, Lcom/google/common/collect/SetMultimap;

    if-eqz p0, :cond_4

    .line 264
    new-instance p0, Ljava/util/LinkedHashSet;

    invoke-direct {p0, v2}, Ljava/util/LinkedHashSet;-><init>(Ljava/util/Collection;)V

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    return-object p0

    .line 266
    :cond_4
    invoke-static {v2}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public values()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 389
    new-instance v0, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1ValuesImpl;

    invoke-direct {v0, p0}, Lcom/google/common/collect/FilteredEntryMultimap$AsMap$1ValuesImpl;-><init>(Lcom/google/common/collect/FilteredEntryMultimap$AsMap;)V

    return-object v0
.end method
