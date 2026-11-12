.class public Lcve;
.super Llx8;
.source "SourceFile"

# interfaces
.implements Ly9n;
.implements Lrjm;
.implements Lya2;
.implements Lxa2;


# instance fields
.field public final d:Landroid/widget/TextView;

.field public final e:Landroidx/recyclerview/widget/RecyclerView;

.field public final f:Lcu8;

.field public final g:Lnu8;


# direct methods
.method public constructor <init>(Landroid/view/View;Lro9;Luqe;Lvue;Lvue;Ldmg;)V
    .registers 8

    new-instance v0, Leve;

    invoke-direct {v0, p3, p4, p5, p6}, Leve;-><init>(Luqe;Lvue;Lvue;Ldmg;)V

    invoke-direct {p0, p1}, Lab2;-><init>(Landroid/view/View;)V

    new-instance p3, Lcu8;

    sget-object p4, Ltni;->c:Ltni;

    invoke-direct {p3, p4}, Lcu8;-><init>(Ltni;)V

    iput-object p3, p0, Lcve;->f:Lcu8;

    invoke-virtual {p3, v0}, Lha2;->G(Lfa2;)V

    const p4, 0x7f0a0457

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Landroid/widget/TextView;

    iput-object p4, p0, Lcve;->d:Landroid/widget/TextView;

    const p4, 0x7f0a0456

    invoke-virtual {p1, p4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p4

    check-cast p4, Landroidx/recyclerview/widget/RecyclerView;

    iput-object p4, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Lcve;->e0()Lnu8;

    move-result-object p5

    iput-object p5, p0, Lcve;->g:Lnu8;

    if-eqz p5, :cond_35

    invoke-virtual {p4, p5}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    :cond_35
    invoke-virtual {p4, p3}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcve;->h0(Landroid/content/Context;)V

    const/4 p0, 0x0

    iput-boolean p0, p4, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    const/4 p0, 0x0

    invoke-virtual {p4, p0}, Landroidx/recyclerview/widget/RecyclerView;->B0(Landroidx/recyclerview/widget/e;)V

    invoke-virtual {p4, p2}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    return-void
.end method


# virtual methods
.method public J(Lwa2;)V
    .registers 9

    iget-object p1, p1, Lwa2;->b:Landroid/graphics/Rect;

    iget-object v0, p0, Lcve;->g:Lnu8;

    if-eqz v0, :cond_38

    iget v1, p1, Landroid/graphics/Rect;->left:I

    iget v2, p1, Landroid/graphics/Rect;->right:I

    invoke-static {v1, v2}, Ljava/lang/Math;->max(II)I

    move-result v1

    iget v2, v0, Lnu8;->d:I

    const/4 v3, 0x0

    if-eq v2, v1, :cond_34

    iput v1, v0, Lnu8;->d:I

    iget-object v0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    invoke-virtual {p0}, Lcve;->f0()[Landroid/view/View;

    move-result-object p0

    array-length v0, p0

    move v2, v3

    :goto_20
    if-ge v2, v0, :cond_34

    aget-object v4, p0, v2

    if-eqz v4, :cond_31

    invoke-virtual {v4}, Landroid/view/View;->getPaddingTop()I

    move-result v5

    invoke-virtual {v4}, Landroid/view/View;->getPaddingBottom()I

    move-result v6

    invoke-virtual {v4, v1, v5, v1, v6}, Landroid/view/View;->setPadding(IIII)V

    :cond_31
    add-int/lit8 v2, v2, 0x1

    goto :goto_20

    :cond_34
    iput v3, p1, Landroid/graphics/Rect;->left:I

    iput v3, p1, Landroid/graphics/Rect;->right:I

    :cond_38
    return-void
.end method

.method public R()V
    .registers 4

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object v0

    invoke-virtual {v0}, Lja2;->d()Z

    move-result v1

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v1, :cond_15

    iget-object v1, v0, Lja2;->a:Lu0g;

    const/4 v2, 0x0

    iput-object v2, v0, Lja2;->a:Lu0g;

    invoke-virtual {p0, v1}, Landroid/view/View;->restoreHierarchyState(Landroid/util/SparseArray;)V

    return-void

    :cond_15
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void
.end method

.method public T(Landroid/view/View;II)V
    .registers 4

    iget-object p0, p0, Lcve;->f:Lcu8;

    iget-object p0, p0, Lha2;->c:Laan;

    invoke-virtual {p0}, Lcan;->d()V

    return-void
.end method

.method public final U()I
    .registers 1

    const/4 p0, -0x1

    return p0
.end method

.method public V(Lja2;Z)V
    .registers 7

    if-eqz p2, :cond_3

    return-void

    :cond_3
    invoke-virtual {p0}, Lcve;->i0()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object p2

    iget-object p2, p2, Lj82;->d:Ljava/lang/String;

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object v0

    iget-boolean v1, v0, Lfve;->j:Z

    new-instance v2, Lvw;

    const/16 v3, 0xb

    invoke-direct {v2, v3, p2, v1}, Lvw;-><init>(BLjava/lang/Object;Z)V

    iget-boolean p2, v0, Lfve;->g:Z

    iget-object v0, v0, Lfve;->f:Ljava/util/List;

    if-eqz p2, :cond_25

    const/4 p2, 0x5

    invoke-static {v0, p2}, Lsfe;->p0(Ljava/lang/Iterable;I)Lamb;

    move-result-object v0

    :cond_25
    new-instance p2, Lqw8;

    const/4 v1, 0x2

    invoke-direct {p2, v2, v1}, Lqw8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, p2}, Lsfe;->M0(Ljava/lang/Iterable;Lxq9;)Lzlb;

    move-result-object p2

    new-instance v0, Lzlb;

    sget-object v1, Lbsg;->b:Lasg;

    const/4 v2, 0x0

    invoke-direct {v0, p2, v1, v2}, Lzlb;-><init>(Ljava/lang/Iterable;Ljava/lang/Object;B)V

    invoke-static {v0}, Lh1b;->r(Ljava/lang/Iterable;)Lh1b;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    iget-object v1, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v3, p0, Lcve;->d:Landroid/widget/TextView;

    if-eqz v0, :cond_50

    const/16 p0, 0x8

    if-eqz v3, :cond_4c

    invoke-virtual {v3, p0}, Landroid/view/View;->setVisibility(I)V

    :cond_4c
    invoke-virtual {v1, p0}, Landroid/view/View;->setVisibility(I)V

    return-void

    :cond_50
    if-eqz v3, :cond_58

    invoke-virtual {v3, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_58
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lcve;->f:Lcu8;

    invoke-virtual {p0, p2}, Lcu8;->b0(Ljava/util/Collection;)V

    return-void
.end method

.method public final X(Z)V
    .registers 2

    invoke-virtual {p0}, Lcve;->R()V

    return-void
.end method

.method public final Y()V
    .registers 2

    invoke-virtual {p0}, Lcve;->t()V

    iget-object p0, p0, Lcve;->f:Lcu8;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    invoke-virtual {p0, v0}, Lcu8;->b0(Ljava/util/Collection;)V

    return-void
.end method

.method public final b(Lsjm;)V
    .registers 2

    iget-object p0, p0, Lcve;->f:Lcu8;

    invoke-virtual {p0, p1}, Lha2;->b(Lsjm;)V

    return-void
.end method

.method public final b0()I
    .registers 1

    const/4 p0, 0x2

    return p0
.end method

.method public e0()Lnu8;
    .registers 4

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const/high16 v1, 0x41800000    # 16.0f

    invoke-static {v1, v0}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v0

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v1, 0x7f0408e0

    const/4 v2, 0x0

    invoke-static {v1, p0, v2}, Lf03;->w(ILandroid/content/Context;I)I

    move-result p0

    new-instance v1, Lnu8;

    invoke-direct {v1, v0, p0}, Lnu8;-><init>(II)V

    return-object v1
.end method

.method public f0()[Landroid/view/View;
    .registers 3

    const/4 v0, 0x0

    iget-object p0, p0, Lcve;->d:Landroid/widget/TextView;

    if-eqz p0, :cond_b

    const/4 v1, 0x1

    new-array v1, v1, [Landroid/view/View;

    aput-object p0, v1, v0

    return-object v1

    :cond_b
    new-array p0, v0, [Landroid/view/View;

    return-object p0
.end method

.method public final g0()Lfve;
    .registers 1

    invoke-virtual {p0}, Lab2;->a0()Lja2;

    move-result-object p0

    check-cast p0, Lj82;

    check-cast p0, Lfve;

    return-object p0
.end method

.method public h0(Landroid/content/Context;)V
    .registers 3

    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    const/4 v0, 0x0

    invoke-direct {p1, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    iget-object p0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    return-void
.end method

.method public i0()Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object v0

    iget-object v0, v0, Lj82;->c:Loqe;

    invoke-virtual {v0}, Loqe;->a()Z

    move-result v1

    if-eqz v1, :cond_1a

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    const v0, 0x7f140e92

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :cond_1a
    iget-object p0, v0, Loqe;->b:Ljava/lang/String;

    return-object p0
.end method

.method public onDestroy()V
    .registers 3

    iget-object v0, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p0, p0, Lcve;->f:Lcu8;

    invoke-virtual {p0}, Lha2;->onDestroy()V

    return-void
.end method

.method public final t()V
    .registers 3

    new-instance v0, Lu0g;

    invoke-direct {v0}, Landroid/util/SparseArray;-><init>()V

    iget-object v1, p0, Lcve;->e:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/view/View;->saveHierarchyState(Landroid/util/SparseArray;)V

    invoke-virtual {p0}, Lcve;->g0()Lfve;

    move-result-object p0

    iput-object v0, p0, Lja2;->a:Lu0g;

    return-void
.end method
