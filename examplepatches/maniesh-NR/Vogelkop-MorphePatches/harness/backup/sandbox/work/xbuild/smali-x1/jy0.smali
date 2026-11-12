.class public final Ljy0;
.super Lbca;
.source "SourceFile"


# instance fields
.field public final a:Ltzi;

.field public final b:Lnv6;

.field public final c:I

.field public final d:Lj4c;

.field public final e:Ljava/util/LinkedHashSet;

.field public f:Lwjh;

.field public final g:Ljava/lang/String;

.field public final h:Ljava/lang/String;

.field public final i:Ljava/lang/String;

.field public j:Landroidx/recyclerview/widget/RecyclerView;


# direct methods
.method public constructor <init>(Landroidx/fragment/app/r;Ltzi;Lnv6;)V
    .registers 5

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p2, p0, Ljy0;->a:Ltzi;

    iput-object p3, p0, Ljy0;->b:Lnv6;

    const p2, 0x7f1400fb

    iput p2, p0, Ljy0;->c:I

    new-instance p2, Lvx;

    const/4 p3, 0x1

    invoke-direct {p2, p0, p3}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lj4c;

    invoke-direct {v0, p2, p3}, Lj4c;-><init>(Lesk;B)V

    iput-object v0, p0, Ljy0;->d:Lj4c;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Ljy0;->e:Ljava/util/LinkedHashSet;

    new-instance p2, Lwjh;

    sget-object p3, Ll08;->a:Ll08;

    invoke-direct {p2, p3}, Lwjh;-><init>(Ljava/util/List;)V

    iput-object p2, p0, Ljy0;->f:Lwjh;

    const p2, 0x7f140835

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Ljy0;->g:Ljava/lang/String;

    const p2, 0x7f140836

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p2

    iput-object p2, p0, Ljy0;->h:Ljava/lang/String;

    const p2, 0x7f140833

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p0, Ljy0;->i:Ljava/lang/String;

    return-void
.end method


# virtual methods
.method public final G()I
    .registers 1

    iget p0, p0, Ljy0;->c:I

    return p0
.end method

.method public final H(J)Laca;
    .registers 3

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashMap;

    invoke-static {p1, p2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p1

    invoke-virtual {p0, p1}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgy0;

    return-object p0
.end method

.method public final I()Lj4c;
    .registers 1

    iget-object p0, p0, Ljy0;->d:Lj4c;

    return-object p0
.end method

.method public final J()Z
    .registers 1

    invoke-virtual {p0}, Ljy0;->getItemCount()I

    move-result p0

    if-nez p0, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_8
    const/4 p0, 0x0

    return p0
.end method

.method public final K(Landroidx/recyclerview/widget/i;)V
    .registers 5

    instance-of v0, p1, Lqy0;

    if-eqz v0, :cond_1a

    check-cast p1, Lqy0;

    iget-object p1, p1, Lsy0;->f:Lfy0;

    check-cast p1, Lgy0;

    if-eqz p1, :cond_1a

    iget-object v0, p0, Ljy0;->j:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_1a

    new-instance v1, Lxa;

    const/16 v2, 0xa

    invoke-direct {v1, p0, p1, v2}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_1a
    return-void
.end method

.method public final L(Ljava/util/List;)V
    .registers 7

    iget-object v0, p0, Ljy0;->e:Ljava/util/LinkedHashSet;

    move-object v1, p1

    check-cast v1, Ljava/util/Collection;

    invoke-interface {v0, v1}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    iget-object v0, p0, Ljy0;->b:Lnv6;

    iget-object v0, v0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Ldda;

    iget-object v0, v0, Ldda;->D:Lcom/opera/android/undo/UndoBar;

    if-nez v0, :cond_13

    const/4 v0, 0x0

    :cond_13
    invoke-virtual {v0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    iget-object v0, p0, Ljy0;->j:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v0, :cond_24

    new-instance v1, Lc4;

    const/16 v2, 0x11

    invoke-direct {v1, p0, v2}, Lc4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_24
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_28
    :goto_28
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_4f

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Number;

    invoke-virtual {v0}, Ljava/lang/Number;->longValue()J

    move-result-wide v0

    iget-object v2, p0, Ljy0;->a:Ltzi;

    iget-object v2, v2, Ltzi;->a:Le5d;

    iget-object v3, v2, Le5d;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashSet;

    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/util/AbstractCollection;->remove(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_28

    const/4 v3, 0x0

    invoke-virtual {v2, v0, v1, v3}, Le5d;->c(JZ)V

    goto :goto_28

    :cond_4f
    return-void
.end method

.method public final M()V
    .registers 10

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_1a
    :goto_1a
    iget-object v5, p0, Ljy0;->e:Ljava/util/LinkedHashSet;

    if-ge v4, v2, :cond_39

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    move-object v7, v6

    check-cast v7, Lfy0;

    invoke-virtual {v7}, Lfy0;->b()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1a

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1a

    :cond_39
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_58

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v2, Lhy0;

    iget-object v4, p0, Ljy0;->g:Ljava/lang/String;

    invoke-direct {v2, v4}, Lhy0;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_58
    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v4, v3

    :cond_68
    :goto_68
    if-ge v4, v2, :cond_85

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    move-object v7, v6

    check-cast v7, Lfy0;

    invoke-virtual {v7}, Lfy0;->b()J

    move-result-wide v7

    invoke-static {v7, v8}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-interface {v5, v7}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_68

    invoke-virtual {v1, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_68

    :cond_85
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_a4

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v2, Lhy0;

    iget-object v4, p0, Ljy0;->h:Ljava/lang/String;

    invoke-direct {v2, v4}, Lhy0;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_a4
    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->f:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :cond_b3
    :goto_b3
    if-ge v3, v2, :cond_d0

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v3, v3, 0x1

    move-object v6, v4

    check-cast v6, Lfy0;

    invoke-virtual {v6}, Lfy0;->b()J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v6

    invoke-interface {v5, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_b3

    invoke-virtual {v1, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_b3

    :cond_d0
    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_ef

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    new-instance v2, Lhy0;

    iget-object v3, p0, Ljy0;->i:Ljava/lang/String;

    invoke-direct {v2, v3}, Lhy0;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object v0, p0, Ljy0;->f:Lwjh;

    iget-object v0, v0, Lwjh;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_ef
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    invoke-virtual {p0}, Ljy0;->J()Z

    move-result v0

    if-eqz v0, :cond_101

    iget-object p0, p0, Ljy0;->a:Ltzi;

    iget-boolean v0, p0, Ltzi;->g:Z

    if-eqz v0, :cond_101

    invoke-virtual {p0}, Ltzi;->d()V

    :cond_101
    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfy0;

    invoke-virtual {p0}, Lfy0;->b()J

    move-result-wide p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfy0;

    invoke-virtual {p0}, Lfy0;->c()Ley0;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Lqic;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, v1}, Lqic;-><init>(Landroid/content/Context;)V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iput-object p1, p0, Ljy0;->j:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Lsy0;

    iget-object p0, p0, Ljy0;->f:Lwjh;

    iget-object p0, p0, Lwjh;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/ArrayList;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lfy0;

    invoke-virtual {p1, p0}, Lsy0;->j0(Lfy0;)V

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 8

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget-object v1, Ley0;->a:Ley0;

    iget-object v1, p0, Ljy0;->a:Ltzi;

    if-nez p2, :cond_18

    new-instance p0, Lry0;

    invoke-static {v0, p1}, Lkf;->f(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object p1

    invoke-direct {p0, p1, v1}, Lry0;-><init>(Lkf;Ltzi;)V

    return-object p0

    :cond_18
    new-instance p2, Lqy0;

    const v2, 0x7f0d0048

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a05b8

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v2, :cond_43

    const v0, 0x7f0a05bf

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v4, :cond_43

    new-instance v0, Lov0;

    check-cast p1, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-direct {v0, p1, v2, v4, v3}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p2, v0, v1, p0}, Lqy0;-><init>(Lov0;Ltzi;Ljy0;)V

    return-object p2

    :cond_43
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lsy0;

    invoke-virtual {p1}, Lsy0;->e0()V

    return-void
.end method
