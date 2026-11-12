.class public final Lise;
.super Lmse;
.source "SourceFile"


# virtual methods
.method public final c(Ljava/util/List;)Z
    .registers 10

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    move v3, v2

    :cond_9
    :goto_9
    if-ge v3, v0, :cond_47

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    check-cast v4, Lhse;

    iget-object v5, v4, Lhse;->a:Ljava/lang/String;

    invoke-static {p0, v5}, Lhd;->h(Lmse;Ljava/lang/String;)Lhse;

    move-result-object v5

    const/4 v6, 0x1

    if-eqz v5, :cond_42

    iget-object v7, v5, Lhse;->c:Lnse;

    iget-object v7, v7, Lnse;->b:Ljava/io/Serializable;

    check-cast v7, Ljava/util/ArrayList;

    iget-object v4, v4, Lhse;->c:Lnse;

    iget-object v4, v4, Lnse;->b:Ljava/io/Serializable;

    check-cast v4, Ljava/util/ArrayList;

    invoke-static {v4}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v4

    invoke-virtual {v7, v4}, Ljava/util/ArrayList;->removeAll(Ljava/util/Collection;)Z

    move-result v4

    invoke-virtual {v7}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v7

    if-eqz v7, :cond_43

    iget-object v7, p0, Lnse;->b:Ljava/io/Serializable;

    check-cast v7, Ljava/util/ArrayList;

    invoke-virtual {v7, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_43

    move v4, v6

    goto :goto_43

    :cond_42
    move v4, v1

    :cond_43
    :goto_43
    if-eqz v4, :cond_9

    move v2, v6

    goto :goto_9

    :cond_47
    return v2
.end method
