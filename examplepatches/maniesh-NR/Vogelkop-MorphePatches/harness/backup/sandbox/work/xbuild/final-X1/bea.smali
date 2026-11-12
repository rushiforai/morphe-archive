.class public final synthetic Lbea;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Ldr9;


# virtual methods
.method public final j(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 9

    check-cast p1, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    check-cast p2, [Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;

    check-cast p3, Ljava/util/List;

    check-cast p4, Ljava/util/List;

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/history/e;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_15

    move v2, v1

    goto :goto_16

    :cond_15
    move v2, v0

    :goto_16
    iput-boolean v2, p0, Lcom/opera/android/history/e;->d:Z

    iget-object v2, p0, Lcom/opera/android/history/e;->e:Laea;

    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_7f

    if-ne v2, v1, :cond_7b

    iget-object p0, p0, Lcom/opera/android/history/e;->j:Lesi;

    const/16 p1, 0xa

    if-eqz p0, :cond_4f

    if-eqz p4, :cond_75

    check-cast p4, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {p4, p1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p0

    invoke-direct {v3, p0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_3a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_75

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljz1;

    new-instance p2, Lyda;

    invoke-direct {p2, p1}, Lyda;-><init>(Ljz1;)V

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_3a

    :cond_4f
    if-eqz p3, :cond_75

    check-cast p3, Ljava/lang/Iterable;

    new-instance v3, Ljava/util/ArrayList;

    invoke-static {p3, p1}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result p0

    invoke-direct {v3, p0}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p3}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_60
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_75

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljz1;

    new-instance p2, Lyda;

    invoke-direct {p2, p1}, Lyda;-><init>(Ljz1;)V

    invoke-virtual {v3, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_60

    :cond_75
    if-nez v3, :cond_7a

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_7a
    return-object v3

    :cond_7b
    invoke-static {}, Lh9o;->p()V

    return-object v3

    :cond_7f
    iget-object p0, p0, Lcom/opera/android/history/e;->j:Lesi;

    if-eqz p0, :cond_a8

    if-eqz p2, :cond_ce

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    array-length p1, p2

    :goto_8b
    if-ge v0, p1, :cond_cd

    aget-object p3, p2, v0

    invoke-interface {p3}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_9b

    move-object p4, v3

    goto :goto_a0

    :cond_9b
    new-instance p4, Lcom/opera/android/history/c;

    invoke-direct {p4, p3}, Lcom/opera/android/history/c;-><init>(Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;)V

    :goto_a0
    if-eqz p4, :cond_a5

    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_a5
    add-int/lit8 v0, v0, 0x1

    goto :goto_8b

    :cond_a8
    if-eqz p1, :cond_ce

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    array-length p2, p1

    :goto_b0
    if-ge v0, p2, :cond_cd

    aget-object p3, p1, v0

    invoke-interface {p3}, Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;->getUrl()Ljava/lang/String;

    move-result-object p4

    invoke-static {p4}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result p4

    if-eqz p4, :cond_c0

    move-object p4, v3

    goto :goto_c5

    :cond_c0
    new-instance p4, Lcom/opera/android/history/c;

    invoke-direct {p4, p3}, Lcom/opera/android/history/c;-><init>(Lcom/opera/android/history/HistoryManager$NativeHistoryEntry;)V

    :goto_c5
    if-eqz p4, :cond_ca

    invoke-virtual {p0, p4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ca
    add-int/lit8 v0, v0, 0x1

    goto :goto_b0

    :cond_cd
    move-object v3, p0

    :cond_ce
    if-nez v3, :cond_d3

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_d3
    return-object v3
.end method
