.class final Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;
.super Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;
.source "Multimaps.java"

# interfaces
.implements Lcom/google/common/collect/ListMultimap;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multimaps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TransformedEntriesListMultimap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V1:",
        "Ljava/lang/Object;",
        "V2:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap<",
        "TK;TV1;TV2;>;",
        "Lcom/google/common/collect/ListMultimap<",
        "TK;TV2;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/google/common/collect/ListMultimap;Lcom/google/common/collect/Maps$EntryTransformer;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromMultimap",
            "transformer"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ListMultimap<",
            "TK;TV1;>;",
            "Lcom/google/common/collect/Maps$EntryTransformer<",
            "-TK;-TV1;TV2;>;)V"
        }
    .end annotation

    .line 1573
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesMultimap;-><init>(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Maps$EntryTransformer;)V

    return-void
.end method


# virtual methods
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

    .line 1567
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->get(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
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
            "Ljava/util/List<",
            "TV2;>;"
        }
    .end annotation

    .line 1583
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->get(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$transform$0$com-google-common-collect-Multimaps$TransformedEntriesListMultimap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 1578
    iget-object p0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->transformer:Lcom/google/common/collect/Maps$EntryTransformer;

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/Maps$EntryTransformer;->transformEntry(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

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

    .line 1567
    invoke-virtual {p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->removeAll(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public removeAll(Ljava/lang/Object;)Ljava/util/List;
    .registers 3
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
            "Ljava/util/List<",
            "TV2;>;"
        }
    .end annotation

    .line 1589
    iget-object v0, p0, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->fromMultimap:Lcom/google/common/collect/Multimap;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multimap;->removeAll(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object v0

    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/List;

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

    .line 1567
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public replaceValues(Ljava/lang/Object;Ljava/lang/Iterable;)Ljava/util/List;
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
            "+TV2;>;)",
            "Ljava/util/List<",
            "TV2;>;"
        }
    .end annotation

    .line 1594
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method bridge synthetic transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/Collection;
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

    .line 1567
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;->transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method transform(Ljava/lang/Object;Ljava/util/Collection;)Ljava/util/List;
    .registers 4
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
            "Ljava/util/Collection<",
            "TV1;>;)",
            "Ljava/util/List<",
            "TV2;>;"
        }
    .end annotation

    .line 1578
    check-cast p2, Ljava/util/List;

    new-instance v0, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap$0;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap$0;-><init>(Lcom/google/common/collect/Multimaps$TransformedEntriesListMultimap;Ljava/lang/Object;)V

    invoke-static {p2, v0}, Lcom/google/common/collect/Lists;->transform(Ljava/util/List;Lcom/google/common/base/Function;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
