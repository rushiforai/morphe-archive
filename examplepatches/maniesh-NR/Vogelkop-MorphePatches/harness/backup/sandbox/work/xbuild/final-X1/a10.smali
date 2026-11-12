.class public final La10;
.super Ld10;
.source "SourceFile"


# instance fields
.field public L:Ljava/util/HashMap;


# virtual methods
.method public final v0()Z
    .registers 1

    iget-object p0, p0, La10;->L:Ljava/util/HashMap;

    if-eqz p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public final w0(Llgh;Ljava/lang/String;)Lc10;
    .registers 7

    new-instance v0, Lz00;

    iget-object p1, p1, Llgh;->c:Ljava/util/List;

    invoke-interface {p1, p2}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    iget-object v1, p0, Lg10;->E:Landroid/widget/LinearLayout;

    const/4 v2, 0x0

    const v3, 0x7f0d0156

    invoke-static {v1, v3, v2}, Lha2;->M(Landroid/view/ViewGroup;II)Landroid/view/View;

    move-result-object v1

    invoke-direct {v0, p0, p1, p2, v1}, Lz00;-><init>(La10;ILjava/lang/String;Landroid/view/View;)V

    return-object v0
.end method

.method public final y0(I)Llgh;
    .registers 12

    invoke-virtual {p0}, Ll00;->l0()Lw10;

    move-result-object v0

    iget-object v0, v0, Lw10;->u:Lcie;

    iget-object v0, v0, Lcie;->B:Ljava/util/HashMap;

    sget-object v1, Ljava/util/Collections;->EMPTY_MAP:Ljava/util/Map;

    if-nez v0, :cond_d

    move-object v0, v1

    :cond_d
    check-cast v0, Ljava/util/Map;

    iget-object v1, p0, Ld10;->H:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llgh;

    iget-object v1, v1, Llgh;->c:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_b4

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_b4

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v2

    invoke-interface {v0}, Ljava/util/Map;->size()I

    move-result v4

    if-ne v2, v4, :cond_b4

    invoke-interface {v0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/4 v4, 0x0

    move v5, v4

    :goto_3a
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_4c

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/Integer;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v6

    add-int/2addr v5, v6

    goto :goto_3a

    :cond_4c
    new-instance v2, Ljava/util/HashMap;

    invoke-direct {v2}, Ljava/util/HashMap;-><init>()V

    move v6, v4

    move v7, v6

    :goto_53
    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v8

    if-ge v6, v8, :cond_88

    invoke-static {v6}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v8

    invoke-interface {v0, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Ljava/lang/Integer;

    if-eqz v8, :cond_b4

    if-nez v5, :cond_69

    move v8, v4

    goto :goto_77

    :cond_69
    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v8

    int-to-float v8, v8

    const/high16 v9, 0x42c80000    # 100.0f

    mul-float/2addr v8, v9

    int-to-float v9, v5

    div-float/2addr v8, v9

    invoke-static {v8}, Ljava/lang/Math;->round(F)I

    move-result v8

    :goto_77
    add-int/2addr v7, v8

    invoke-interface {v1, v6}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/lang/String;

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    invoke-virtual {v2, v9, v8}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    add-int/lit8 v6, v6, 0x1

    goto :goto_53

    :cond_88
    rsub-int/lit8 v0, v7, 0x64

    :goto_8a
    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v3

    if-lez v3, :cond_b3

    invoke-static {v0}, Ljava/lang/Math;->abs(I)I

    move-result v3

    const/4 v4, 0x1

    sub-int/2addr v3, v4

    invoke-interface {v1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/String;

    if-gtz v0, :cond_9f

    const/4 v4, -0x1

    :cond_9f
    invoke-virtual {v2, v3}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v2, v3, v5}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sub-int/2addr v0, v4

    goto :goto_8a

    :cond_b3
    move-object v3, v2

    :cond_b4
    iput-object v3, p0, La10;->L:Ljava/util/HashMap;

    invoke-super {p0, p1}, Ld10;->y0(I)Llgh;

    move-result-object p0

    return-object p0
.end method
