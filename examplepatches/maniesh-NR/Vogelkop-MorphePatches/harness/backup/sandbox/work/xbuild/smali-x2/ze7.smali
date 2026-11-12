.class public final Lze7;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lkkm;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public b:Lxvj;

.field public c:Ljg7;

.field public final d:Lbp;

.field public final e:Lbp;

.field public final f:Ltzi;

.field public final g:Lwe7;

.field public final h:Lxbf;

.field public i:Landroidx/recyclerview/widget/RecyclerView;

.field public j:Lvvj;

.field public k:Lkg7;

.field public l:Ldg7;

.field public m:Ljava/lang/ref/WeakReference;

.field public n:Lvg7;


# direct methods
.method public constructor <init>(Ltzi;Lxbf;)V
    .registers 9

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lze7;->a:Ljava/util/ArrayList;

    new-instance v0, Lbp;

    new-instance v1, Lxe7;

    const-wide/16 v2, -0x1

    const/4 v4, 0x0

    invoke-direct {v1, v2, v3, v4}, Lxe7;-><init>(JZ)V

    invoke-direct {v0, v1}, Lbp;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lze7;->d:Lbp;

    new-instance v0, Lbp;

    new-instance v1, Lxe7;

    const-wide/16 v2, -0x2

    const/4 v5, 0x1

    invoke-direct {v1, v2, v3, v5}, Lxe7;-><init>(JZ)V

    invoke-direct {v0, v1}, Lbp;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lze7;->e:Lbp;

    new-instance v0, Lve7;

    invoke-direct {v0, p0, v4}, Lve7;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lwe7;

    invoke-direct {v1, p0, v0, v4}, Lwe7;-><init>(Ljava/lang/Object;Leig;B)V

    iput-object v1, p0, Lze7;->g:Lwe7;

    iput-object p1, p0, Lze7;->f:Ltzi;

    iput-object p2, p0, Lze7;->h:Lxbf;

    invoke-virtual {p0, v5}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance p1, Lxvj;

    new-instance p2, Lye7;

    sget-object v0, Lvvj;->c:Lvvj;

    invoke-direct {p2, p0, v0}, Lye7;-><init>(Lze7;Lvvj;)V

    const-class v0, Lxe7;

    invoke-direct {p1, v0, p2}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object p1, p0, Lze7;->b:Lxvj;

    return-void
.end method


# virtual methods
.method public final G(Ljava/util/List;)V
    .registers 10

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_d
    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_8e

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lre7;

    iget-object v3, p0, Lze7;->k:Lkg7;

    if-eqz v3, :cond_40

    sget-object v3, Llg7;->a:[[I

    invoke-static {v2}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Lre7;->f()Ljava/lang/String;

    move-result-object v4

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v5

    invoke-virtual {v5, v4, v3}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v3

    invoke-static {v3}, Llg7;->g(Lo29;)Lkg7;

    move-result-object v3

    iget-object v4, p0, Lze7;->k:Lkg7;

    sget-object v5, Lkg7;->m:Lkg7;

    if-ne v3, v5, :cond_3e

    sget-object v3, Lkg7;->l:Lkg7;

    if-ne v4, v3, :cond_d

    goto :goto_40

    :cond_3e
    if-ne v4, v3, :cond_d

    :cond_40
    :goto_40
    new-instance v3, Lxe7;

    invoke-direct {v3, v2}, Lxe7;-><init>(Lre7;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean v2, v3, Lxe7;->c:Z

    iget-object v3, p0, Lze7;->d:Lbp;

    iget-object v4, p0, Lze7;->e:Lbp;

    if-eqz v2, :cond_52

    move-object v2, v4

    goto :goto_53

    :cond_52
    move-object v2, v3

    :goto_53
    iget v5, v2, Lbp;->a:I

    const/4 v6, 0x1

    add-int/2addr v5, v6

    iput v5, v2, Lbp;->a:I

    iget-object v7, p0, Lze7;->k:Lkg7;

    if-nez v7, :cond_d

    if-ne v5, v6, :cond_d

    if-ne v2, v3, :cond_80

    iget-object v2, p0, Lze7;->b:Lxvj;

    iget-object v3, v3, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Lxe7;

    invoke-virtual {v2, v3}, Lxvj;->a(Ljava/lang/Object;)I

    iget-object v2, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v2, :cond_72

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_72
    iget v2, v4, Lbp;->a:I

    if-lez v2, :cond_d

    iget-object v2, p0, Lze7;->b:Lxvj;

    iget-object v3, v4, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Lxe7;

    invoke-virtual {v2, v3}, Lxvj;->a(Ljava/lang/Object;)I

    goto :goto_d

    :cond_80
    iget v2, v3, Lbp;->a:I

    if-lez v2, :cond_d

    iget-object v2, p0, Lze7;->b:Lxvj;

    iget-object v3, v4, Lbp;->b:Ljava/lang/Object;

    check-cast v3, Lxe7;

    invoke-virtual {v2, v3}, Lxvj;->a(Ljava/lang/Object;)I

    goto :goto_d

    :cond_8e
    iget-object v1, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p1, p0, Lze7;->b:Lxvj;

    invoke-virtual {p1, v0}, Lxvj;->c(Ljava/util/Collection;)V

    iget-object p1, p0, Lze7;->l:Ldg7;

    if-nez p1, :cond_9d

    return-void

    :cond_9d
    invoke-virtual {p0}, Lze7;->H()Ljava/util/HashSet;

    move-result-object p0

    invoke-virtual {p1, p0}, Ldg7;->run(Ljava/lang/Object;)V

    return-void
.end method

.method public final H()Ljava/util/HashSet;
    .registers 7

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iget-object p0, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_c
    if-ge v2, v1, :cond_36

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lre7;

    sget-object v4, Llg7;->a:[[I

    invoke-static {v3}, Lrf7;->h(Lre7;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3}, Lre7;->f()Ljava/lang/String;

    move-result-object v3

    invoke-static {}, Lc5o;->m()Lc5o;

    move-result-object v5

    invoke-virtual {v5, v3, v4}, Lc5o;->o(Ljava/lang/String;Ljava/lang/String;)Lo29;

    move-result-object v3

    invoke-static {v3}, Llg7;->g(Lo29;)Lkg7;

    move-result-object v3

    sget-object v4, Lkg7;->m:Lkg7;

    if-ne v3, v4, :cond_32

    sget-object v3, Lkg7;->l:Lkg7;

    :cond_32
    invoke-virtual {v0, v3}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_c

    :cond_36
    return-object v0
.end method

.method public final I(J)Lre7;
    .registers 8

    iget-object p0, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :cond_7
    if-ge v1, v0, :cond_18

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lre7;

    iget-wide v3, v2, Lre7;->o:J

    cmp-long v3, v3, p1

    if-nez v3, :cond_7

    return-object v2

    :cond_18
    const/4 p0, 0x0

    return-object p0
.end method

.method public final J(Ljava/util/List;Lvvj;)V
    .registers 6

    iget-object v0, p0, Lze7;->d:Lbp;

    const/4 v1, 0x0

    iput v1, v0, Lbp;->a:I

    iget-object v2, p0, Lze7;->b:Lxvj;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lxe7;

    invoke-virtual {v2, v0}, Lxvj;->g(Ljava/lang/Object;)V

    iget-object v0, p0, Lze7;->e:Lbp;

    iput v1, v0, Lbp;->a:I

    iget-object v1, p0, Lze7;->b:Lxvj;

    iget-object v0, v0, Lbp;->b:Ljava/lang/Object;

    check-cast v0, Lxe7;

    invoke-virtual {v1, v0}, Lxvj;->g(Ljava/lang/Object;)V

    iget-object v0, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Lze7;->b:Lxvj;

    invoke-virtual {v0}, Lxvj;->d()V

    new-instance v0, Lxvj;

    new-instance v1, Lye7;

    invoke-direct {v1, p0, p2}, Lye7;-><init>(Lze7;Lvvj;)V

    const-class v2, Lxe7;

    invoke-direct {v0, v2, v1}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object v0, p0, Lze7;->b:Lxvj;

    iput-object p2, p0, Lze7;->j:Lvvj;

    check-cast p1, Ljava/util/List;

    invoke-virtual {p0, p1}, Lze7;->G(Ljava/util/List;)V

    return-void
.end method

.method public final K()V
    .registers 4

    iget-object v0, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_29

    const/4 v0, 0x0

    :goto_5
    iget-object v1, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    move-result v1

    if-ge v0, v1, :cond_29

    iget-object v1, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->T(Landroid/view/View;)Landroidx/recyclerview/widget/i;

    move-result-object v1

    if-eqz v1, :cond_26

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result v2

    if-nez v2, :cond_26

    invoke-virtual {v1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result v1

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_26
    add-int/lit8 v0, v0, 0x1

    goto :goto_5

    :cond_29
    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 11

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_81

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lre7;

    iget-object v2, p0, Lze7;->a:Ljava/util/ArrayList;

    invoke-virtual {v2, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_78

    iget-wide v4, v1, Lre7;->o:J

    move v2, v3

    :goto_25
    iget-object v6, p0, Lze7;->b:Lxvj;

    iget v7, v6, Lxvj;->h:I

    const/4 v8, -0x1

    if-ge v2, v7, :cond_3b

    invoke-virtual {v6, v2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lxe7;

    iget-wide v6, v6, Lxe7;->a:J

    cmp-long v6, v6, v4

    if-eqz v6, :cond_3c

    add-int/lit8 v2, v2, 0x1

    goto :goto_25

    :cond_3b
    move v2, v8

    :cond_3c
    if-eq v2, v8, :cond_78

    iget-object v4, p0, Lze7;->b:Lxvj;

    invoke-virtual {v4, v2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lxe7;

    iget-object v5, p0, Lze7;->b:Lxvj;

    invoke-virtual {v5}, Lxvj;->i()V

    invoke-virtual {v5, v2}, Lxvj;->f(I)Ljava/lang/Object;

    const/4 v6, 0x1

    invoke-virtual {v5, v2, v6}, Lxvj;->h(IZ)V

    iget-boolean v2, v4, Lxe7;->c:Z

    iget-object v4, p0, Lze7;->d:Lbp;

    iget-object v5, p0, Lze7;->e:Lbp;

    if-eqz v2, :cond_5c

    move-object v2, v5

    goto :goto_5d

    :cond_5c
    move-object v2, v4

    :goto_5d
    iget v7, v2, Lbp;->a:I

    sub-int/2addr v7, v6

    iput v7, v2, Lbp;->a:I

    if-nez v7, :cond_78

    iget-object v6, p0, Lze7;->b:Lxvj;

    iget-object v7, v2, Lbp;->b:Ljava/lang/Object;

    check-cast v7, Lxe7;

    invoke-virtual {v6, v7}, Lxvj;->g(Ljava/lang/Object;)V

    if-ne v2, v4, :cond_78

    iget-object v2, p0, Lze7;->b:Lxvj;

    iget-object v4, v5, Lbp;->b:Ljava/lang/Object;

    check-cast v4, Lxe7;

    invoke-virtual {v2, v4}, Lxvj;->g(Ljava/lang/Object;)V

    :cond_78
    new-instance v2, Lguh;

    invoke-direct {v2, v1, v3}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_81
    iget-object p1, p0, Lze7;->l:Ldg7;

    if-eqz p1, :cond_8c

    invoke-virtual {p0}, Lze7;->H()Ljava/util/HashSet;

    move-result-object p0

    invoke-virtual {p1, p0}, Ldg7;->run(Ljava/lang/Object;)V

    :cond_8c
    new-instance p0, Le5d;

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x2

    invoke-direct {p0, v0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lze7;->b:Lxvj;

    iget p0, p0, Lxvj;->h:I

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lze7;->b:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxe7;

    iget-wide p0, p0, Lxe7;->a:J

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lze7;->b:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lxe7;

    iget-boolean p0, p0, Lxe7;->b:Z

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object p1, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    new-instance p0, Lqic;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p0, v0}, Lqic;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    iget-object v0, p0, Lze7;->b:Lxvj;

    invoke-virtual {v0, p2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lxe7;

    iget-boolean v0, p2, Lxe7;->b:Z

    if-nez v0, :cond_a1

    check-cast p1, Lqg7;

    iget-object p0, p2, Lxe7;->d:Lre7;

    iget-object p2, p1, Lqg7;->g:Landroid/widget/TextView;

    iget-object v0, p1, Lqg7;->h:Landroid/view/View;

    iget-object v1, p1, Lqg7;->k:Lcom/opera/android/custom_views/StylingImageButton;

    iput-object p0, p1, Lqg7;->p:Lre7;

    iget-object v2, p1, Lqg7;->q:Lpg7;

    if-eqz v2, :cond_1f

    invoke-virtual {v2}, Lpg7;->a()V

    :cond_1f
    iget-object v2, p1, Lqg7;->t:Lng7;

    iget-object v3, p0, Lre7;->u:Lh7f;

    invoke-virtual {v3, v2}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v2, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v2, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v1, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Landroid/view/View;->setTag(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lre7;->f()Ljava/lang/String;

    move-result-object v2

    sget-object v3, Laik;->a:[Ljava/lang/String;

    invoke-static {v2}, Lehi;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {p2, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget v2, p0, Lre7;->f:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    const/4 v3, 0x2

    const/4 v4, 0x1

    const/4 v5, 0x0

    if-eqz v2, :cond_57

    if-eq v2, v4, :cond_53

    if-eq v2, v3, :cond_4f

    move v2, v5

    goto :goto_5a

    :cond_4f
    const v2, 0x7f0805d4

    goto :goto_5a

    :cond_53
    const v2, 0x7f080543

    goto :goto_5a

    :cond_57
    const v2, 0x7f0805af

    :goto_5a
    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget v2, p0, Lre7;->f:I

    invoke-static {v2}, Lvep;->A(I)I

    move-result v2

    if-eqz v2, :cond_73

    if-eq v2, v4, :cond_6f

    if-eq v2, v3, :cond_6b

    move v2, v5

    goto :goto_76

    :cond_6b
    const v2, 0x7f1412e1

    goto :goto_76

    :cond_6f
    const v2, 0x7f1405db

    goto :goto_76

    :cond_73
    const v2, 0x7f1405c9

    :goto_76
    invoke-static {v1, v2, v5}, Ln1h;->n(Landroid/view/View;II)V

    iget-object v1, p1, Lqg7;->l:Lz;

    iget v2, p0, Lre7;->f:I

    iput v2, v1, Lz;->b:I

    invoke-virtual {v1}, Lz;->s()V

    invoke-virtual {p1, p0}, Lqg7;->m0(Lre7;)V

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p2}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object p2

    filled-new-array {p2}, [Ljava/lang/Object;

    move-result-object p2

    const v1, 0x7f1412a6

    invoke-virtual {p0, v1, p2}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Landroid/view/View;->setContentDescription(Ljava/lang/CharSequence;)V

    invoke-virtual {p1}, Lyzi;->U()V

    return-void

    :cond_a1
    iget-wide v0, p2, Lxe7;->a:J

    const-wide/16 v2, -0x1

    cmp-long p2, v0, v2

    if-nez p2, :cond_c0

    check-cast p1, La9a;

    iget-object p2, p0, Lze7;->n:Lvg7;

    iget-object v0, p1, La9a;->b:Landroid/widget/TextView;

    const v1, 0x7f140616

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {p1, p2}, La9a;->U(Lvg7;)V

    new-instance p2, Ljava/lang/ref/WeakReference;

    invoke-direct {p2, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lze7;->m:Ljava/lang/ref/WeakReference;

    return-void

    :cond_c0
    const-wide/16 v2, -0x2

    cmp-long p0, v0, v2

    if-nez p0, :cond_d4

    check-cast p1, La9a;

    iget-object p0, p1, La9a;->b:Landroid/widget/TextView;

    const p2, 0x7f140615

    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    const/4 p0, 0x0

    invoke-virtual {p1, p0}, La9a;->U(Lvg7;)V

    :cond_d4
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-ne p2, v0, :cond_11

    new-instance p0, La9a;

    const p2, 0x7f0d0230

    invoke-static {p1, p2, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-direct {p0, p1}, La9a;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_11
    new-instance p2, Lqg7;

    const v0, 0x7f0d0112

    invoke-static {p1, v0, p1, v1}, Lj7c;->n(Landroid/view/ViewGroup;ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lze7;->c:Ljg7;

    iget-object v1, p0, Lze7;->f:Ltzi;

    iget-object p0, p0, Lze7;->h:Lxbf;

    invoke-direct {p2, p1, v0, v1, p0}, Lqg7;-><init>(Landroid/view/View;Ljg7;Ltzi;Lxbf;)V

    return-object p2
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 3

    const/4 v0, 0x0

    iput-object v0, p0, Lze7;->i:Landroidx/recyclerview/widget/RecyclerView;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    instance-of p0, p1, Lqg7;

    if-eqz p0, :cond_9

    check-cast p1, Lqg7;

    invoke-virtual {p1}, Lqg7;->e0()V

    :cond_9
    return-void
.end method

.method public final t(Le5d;)V
    .registers 3

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1e

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    check-cast v0, Lre7;

    invoke-static {v0}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    check-cast v0, Ljava/util/List;

    invoke-virtual {p0, v0}, Lze7;->G(Ljava/util/List;)V

    goto :goto_4

    :cond_1e
    return-void
.end method
