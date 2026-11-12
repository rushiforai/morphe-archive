.class public Lcu8;
.super Lha2;
.source "SourceFile"


# instance fields
.field public k:B

.field public l:Ltx7;


# direct methods
.method public constructor <init>(Ltni;)V
    .registers 2

    invoke-direct {p0, p1}, Lha2;-><init>(Ltni;)V

    const/4 p1, 0x1

    iput-byte p1, p0, Lcu8;->k:B

    new-instance p1, Lw4a;

    invoke-direct {p1}, Ltx7;-><init>()V

    iput-object p1, p0, Lcu8;->l:Ltx7;

    return-void
.end method


# virtual methods
.method public final T(Lab2;)V
    .registers 2

    instance-of p0, p1, Lza2;

    if-eqz p0, :cond_9

    check-cast p1, Lza2;

    invoke-interface {p1}, Lza2;->H()V

    :cond_9
    return-void
.end method

.method public final Y(Z)Z
    .registers 10

    iget-byte v0, p0, Lcu8;->k:B

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-ne v0, v2, :cond_7

    return v1

    :cond_7
    move v0, v1

    move v3, v0

    move v4, v3

    :goto_a
    iget-object v5, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v0, v6, :cond_5e

    iget-object v6, p0, Lcu8;->l:Ltx7;

    invoke-virtual {v6, v0}, Ltx7;->f(I)I

    move-result v6

    iget-byte v7, p0, Lcu8;->k:B

    if-ne v6, v2, :cond_25

    add-int/lit8 v7, v7, -0x1

    if-ne v3, v7, :cond_22

    move v3, v1

    goto :goto_5c

    :cond_22
    add-int/lit8 v3, v3, 0x1

    goto :goto_5c

    :cond_25
    if-ne v6, v7, :cond_29

    if-eqz v3, :cond_5c

    :cond_29
    iget-object v3, p0, Lcu8;->l:Ltx7;

    add-int/lit8 v6, v0, 0x1

    :goto_2d
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v7

    if-ge v6, v7, :cond_3c

    invoke-virtual {v3, v6}, Ltx7;->f(I)I

    move-result v7

    if-eq v7, v2, :cond_3d

    add-int/lit8 v6, v6, 0x1

    goto :goto_2d

    :cond_3c
    const/4 v6, -0x1

    :cond_3d
    if-ltz v6, :cond_5e

    move v3, v6

    :goto_40
    if-le v3, v0, :cond_50

    add-int/lit8 v4, v3, -0x1

    invoke-static {v5, v4, v3}, Ljava/util/Collections;->swap(Ljava/util/List;II)V

    if-eqz p1, :cond_4c

    invoke-virtual {p0, v4, v3}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    :cond_4c
    add-int/lit8 v3, v3, -0x1

    move v4, v2

    goto :goto_40

    :cond_50
    iget-object v0, p0, Lcu8;->l:Ltx7;

    invoke-virtual {v0}, Ltx7;->g()V

    iget-object v0, p0, Lcu8;->l:Ltx7;

    invoke-virtual {v0}, Ltx7;->h()V

    move v3, v1

    move v0, v6

    :cond_5c
    :goto_5c
    add-int/2addr v0, v2

    goto :goto_a

    :cond_5e
    return v4
.end method

.method public final Z(ILtx7;)V
    .registers 6

    iget-byte v0, p0, Lha2;->j:B

    if-eq v0, p1, :cond_30

    iput-byte p1, p0, Lha2;->j:B

    iget-object v0, p0, Lha2;->d:Lf1p;

    iget-object v0, v0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Li7f;

    const-class v1, Lbu8;

    invoke-static {v0, v1}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object v0

    invoke-virtual {v0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_16
    move-object v1, v0

    check-cast v1, Lbmb;

    invoke-virtual {v1}, Lbmb;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_30

    invoke-virtual {v1}, Lbmb;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lab2;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v1

    const/4 v2, -0x1

    if-eq v1, v2, :cond_16

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    goto :goto_16

    :cond_30
    iput-object p2, p0, Lcu8;->l:Ltx7;

    iget-byte p2, p0, Lcu8;->k:B

    if-eq p2, p1, :cond_3e

    iput-byte p1, p0, Lcu8;->k:B

    const/4 p2, 0x1

    if-le p1, p2, :cond_3e

    invoke-virtual {p0, p2}, Lcu8;->Y(Z)Z

    :cond_3e
    return-void
.end method

.method public final b0(Ljava/util/Collection;)V
    .registers 5

    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p1}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_12
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfa2;

    invoke-interface {v1}, Lfa2;->S()Laa2;

    move-result-object v1

    invoke-interface {v1, v2, v0}, Laa2;->d(ILjava/util/ArrayList;)V

    goto :goto_12

    :cond_27
    iget-object p1, p0, Lcu8;->l:Ltx7;

    invoke-virtual {p1}, Ltx7;->g()V

    iget-object p1, p0, Lcu8;->l:Ltx7;

    invoke-virtual {p1}, Ltx7;->h()V

    invoke-virtual {p0, v2}, Lcu8;->Y(Z)Z

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final bridge synthetic onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    check-cast p1, Lab2;

    invoke-virtual {p0, p1}, Lcu8;->T(Lab2;)V

    const/4 p0, 0x1

    return p0
.end method
