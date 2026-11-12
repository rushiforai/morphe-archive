.class public abstract Lft;
.super Lns;
.source "SourceFile"


# direct methods
.method public constructor <init>(Lumi;Lkotlin/jvm/functions/Function1;I)V
    .registers 5

    and-int/lit8 v0, p3, 0x2

    if-eqz v0, :cond_8

    const v0, 0x7fffffff

    goto :goto_9

    :cond_8
    const/4 v0, 0x5

    :goto_9
    and-int/lit8 p3, p3, 0x4

    if-eqz p3, :cond_f

    const/4 p3, 0x0

    goto :goto_10

    :cond_f
    const/4 p3, 0x1

    :goto_10
    invoke-direct {p0, p1, v0, p3, p2}, Lns;-><init>(Lumi;IZLkotlin/jvm/functions/Function1;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic a(Ljava/lang/Object;Ljava/util/Set;I)Ljava/lang/Object;
    .registers 4

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1, p2, p3}, Lft;->f(Ljava/util/List;Ljava/util/Set;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public f(Ljava/util/List;Ljava/util/Set;I)Ljava/util/List;
    .registers 6

    move-object p0, p2

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/util/Collection;->isEmpty()Z

    move-result p0

    if-nez p0, :cond_2e

    check-cast p1, Ljava/lang/Iterable;

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_14
    :goto_14
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lst;

    iget-object v1, v1, Lst;->b:Ljava/lang/String;

    invoke-interface {p2, v1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_14

    invoke-interface {p0, v0}, Ljava/util/Collection;->add(Ljava/lang/Object;)Z

    goto :goto_14

    :cond_2d
    move-object p1, p0

    :cond_2e
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1, p3}, Lkotlin/collections/CollectionsKt;->e0(Ljava/lang/Iterable;I)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method
