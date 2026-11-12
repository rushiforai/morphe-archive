.class public final Lk5k;
.super Loph;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Lh5k;

.field public final c:Ljava/util/HashMap;

.field public final d:Lwy;

.field public final e:Lg5k;

.field public final f:Lf5k;

.field public g:Leu8;

.field public h:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;Lwy;Lbi;Lx5f;Ls9i;Z)V
    .registers 14

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lk5k;->a:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p0, Lk5k;->c:Ljava/util/HashMap;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lk5k;->h:Z

    iput-object p2, p0, Lk5k;->d:Lwy;

    new-instance p2, Lh5k;

    invoke-direct {p2}, Ljava/lang/Object;-><init>()V

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    iput-object v0, p2, Lh5k;->b:Ljava/lang/Object;

    new-instance v0, Ljava/util/HashSet;

    invoke-direct {v0}, Ljava/util/HashSet;-><init>()V

    iput-object v0, p2, Lh5k;->c:Ljava/lang/Object;

    iput-object p3, p2, Lh5k;->d:Ljava/lang/Object;

    iput-object p2, p0, Lk5k;->b:Lh5k;

    new-instance v1, Lg5k;

    invoke-static {p1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v3

    move-object v2, p0

    move-object v4, p4

    move-object v5, p5

    move v6, p6

    invoke-direct/range {v1 .. v6}, Lg5k;-><init>(Lk5k;Lxnh;Lx5f;Ls9i;Z)V

    iput-object v1, v2, Lk5k;->e:Lg5k;

    new-instance p0, Lf5k;

    invoke-direct {p0, v2}, Lf5k;-><init>(Lk5k;)V

    iput-object p0, v2, Lk5k;->f:Lf5k;

    return-void
.end method


# virtual methods
.method public final a(Ljava/util/List;Ljava/util/List;)Lmq;
    .registers 7

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const/4 v0, 0x0

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Luo;

    iget-object v1, v0, Luo;->b:Ldl;

    iget v2, v1, Ldl;->a:I

    const/4 v3, 0x2

    if-ne v2, v3, :cond_20

    invoke-static {}, Lsfh;->d()Lsfh;

    move-result-object v2

    sget-object v3, Lsfh;->b:Lsfh;

    if-ne v2, v3, :cond_20

    const/4 v2, 0x3

    goto :goto_22

    :cond_20
    iget v2, v1, Ldl;->a:I

    :goto_22
    iget v1, v1, Ldl;->a:I

    if-eq v1, v2, :cond_3d

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_2a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3d

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Luo;

    iget-object v3, v1, Luo;->b:Ldl;

    iget v3, v3, Ldl;->a:I

    if-ne v3, v2, :cond_2a

    move-object v0, v1

    :cond_3d
    iget-object p1, v0, Luo;->a:Lbz;

    iget-object v1, v0, Luo;->b:Ldl;

    iget-object v2, p0, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {v2, v0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lj5k;

    if-nez v3, :cond_53

    new-instance v3, Lj5k;

    invoke-direct {v3, p0, v1, p1}, Lj5k;-><init>(Lk5k;Ldl;Lbz;)V

    invoke-virtual {v2, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_53
    new-instance p1, Lno;

    iget-object v1, p0, Lk5k;->d:Lwy;

    iget-object v1, v1, Lwy;->l:Lyl;

    iget-object v2, p0, Lk5k;->e:Lg5k;

    invoke-direct {p1, v0, v1, v2, p2}, Lno;-><init>(Luo;Lkm;Lk8;Ljava/util/List;)V

    iget-object p0, p0, Lk5k;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p0, v3, Lj5k;->a:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    return-object p1
.end method

.method public final f(Lmq;)V
    .registers 8

    invoke-virtual {p1}, Lmq;->j()Z

    move-result v0

    if-nez v0, :cond_47

    iget-object p0, p0, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {p0}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_47

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lj5k;

    iget-object v1, v0, Lj5k;->a:Ljava/util/Set;

    invoke-interface {v1, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_10

    iget-object p0, v0, Lj5k;->d:Lbz;

    iget-object v1, v0, Lj5k;->c:Ldl;

    iget-object v2, v1, Ldl;->c:Ljava/lang/String;

    iget-object v3, p1, Lmq;->f:Ljava/util/List;

    new-instance v4, Lm43;

    const/4 v5, 0x0

    invoke-direct {v4, v1, v2, v5, v3}, Lm43;-><init>(Ldl;Ljava/lang/String;ILjava/util/List;)V

    invoke-interface {p0, v4}, Lbz;->d(Laz;)Lyz;

    move-result-object p0

    if-eqz p0, :cond_47

    iget-object v1, v0, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v1, p1}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Lj5k;->a(Lyz;Lmq;Ltxi;)Z

    move-result p1

    if-nez p1, :cond_47

    invoke-virtual {p0}, Lyz;->b()V

    :cond_47
    return-void
.end method

.method public final onScrollStateChanged(Landroidx/recyclerview/widget/RecyclerView;I)V
    .registers 6

    const/4 v0, 0x1

    const/4 v1, 0x0

    if-eqz p2, :cond_6

    move p2, v0

    goto :goto_7

    :cond_6
    move p2, v1

    :goto_7
    iget-object v2, p0, Lk5k;->b:Lh5k;

    invoke-virtual {v2, p2}, Lh5k;->j(Z)V

    if-nez p2, :cond_25

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->M(I)Landroidx/recyclerview/widget/i;

    move-result-object p2

    if-eqz p2, :cond_1c

    iget-object p2, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p2}, Landroid/view/View;->getTop()I

    move-result p2

    if-eqz p2, :cond_22

    :cond_1c
    const/4 p2, -0x1

    invoke-virtual {p1, p2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result p1

    xor-int/2addr v0, p1

    :cond_22
    iput-boolean v0, p0, Lk5k;->h:Z

    return-void

    :cond_25
    iput-boolean v1, p0, Lk5k;->h:Z

    return-void
.end method
