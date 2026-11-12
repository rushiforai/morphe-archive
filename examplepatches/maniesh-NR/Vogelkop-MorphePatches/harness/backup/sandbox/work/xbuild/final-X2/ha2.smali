.class public Lha2;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lrjm;


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:Ljava/util/LinkedHashMap;

.field public final c:Laan;

.field public final d:Lf1p;

.field public final e:Lix5;

.field public final f:Ltni;

.field public final g:Ltk;

.field public final h:Lga2;

.field public i:Landroidx/recyclerview/widget/RecyclerView;

.field public j:B


# direct methods
.method public constructor <init>(Ltni;)V
    .registers 6

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    iput-object v0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    new-instance v0, Laan;

    invoke-direct {v0}, Laan;-><init>()V

    iput-object v0, p0, Lha2;->c:Laan;

    new-instance v0, Lf1p;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lf1p;-><init>(B)V

    iput-object v0, p0, Lha2;->d:Lf1p;

    new-instance v1, Lix5;

    const/16 v2, 0x1b

    invoke-direct {v1, v2}, Lix5;-><init>(B)V

    new-instance v2, Landroid/util/SparseArray;

    iput-object v1, p0, Lha2;->e:Lix5;

    new-instance v1, Ltk;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ltk;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lha2;->g:Ltk;

    new-instance v3, Lga2;

    invoke-direct {v3, p0}, Lga2;-><init>(Lha2;)V

    iput-object v3, p0, Lha2;->h:Lga2;

    iput-byte v2, p0, Lha2;->j:B

    iput-object p1, p0, Lha2;->f:Ltni;

    invoke-virtual {p1, v1}, Ltni;->a(Lsni;)V

    iget-object p1, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast p1, Ljava/util/HashMap;

    const-class v0, Lrjm;

    invoke-virtual {p1, v0, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v2}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method

.method public static M(Landroid/view/ViewGroup;II)Landroid/view/View;
    .registers 5

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    if-eqz p2, :cond_c

    new-instance v1, Ldkf;

    invoke-direct {v1, v0, p2}, Ldkf;-><init>(Landroid/content/Context;I)V

    move-object v0, v1

    :cond_c
    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, p1, p0, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public static X(Lab2;)V
    .registers 5

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    move-result-object v0

    instance-of v1, v0, Ly2k;

    if-eqz v1, :cond_1b

    move-object v1, v0

    check-cast v1, Ly2k;

    invoke-virtual {p0}, Lab2;->U()I

    move-result v2

    const/4 v3, -0x1

    if-ne v2, v3, :cond_16

    const/4 v2, 0x1

    goto :goto_17

    :cond_16
    const/4 v2, 0x0

    :goto_17
    iget-boolean v3, v1, Ly2k;->f:Z

    if-ne v3, v2, :cond_1c

    :cond_1b
    return-void

    :cond_1c
    iput-boolean v2, v1, Ly2k;->f:Z

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    return-void
.end method


# virtual methods
.method public final G(Lfa2;)V
    .registers 5

    invoke-interface {p1}, Lfa2;->S()Laa2;

    move-result-object v0

    iget-object v1, p0, Lha2;->a:Ljava/util/ArrayList;

    const/4 v2, 0x0

    invoke-interface {v0, v2, v1}, Laa2;->d(ILjava/util/ArrayList;)V

    iget-object v0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-interface {p1}, Lfa2;->g()Ljava/lang/Class;

    move-result-object v1

    invoke-interface {v0, v1, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final H(ILja2;)V
    .registers 4

    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemInserted(I)V

    return-void
.end method

.method public final I(Lu0g;)V
    .registers 7

    iget-object v0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfa2;

    invoke-interface {v1}, Lfa2;->v()V

    goto :goto_10

    :cond_20
    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :goto_27
    if-ge v2, v1, :cond_42

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lja2;

    if-nez p1, :cond_35

    const/4 v4, 0x0

    goto :goto_3f

    :cond_35
    invoke-virtual {v3}, Ljava/lang/Object;->hashCode()I

    move-result v4

    invoke-virtual {p1, v4}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lu0g;

    :goto_3f
    iput-object v4, v3, Lja2;->a:Lu0g;

    goto :goto_27

    :cond_42
    iget-object p0, p0, Lha2;->d:Lf1p;

    iget-object p0, p0, Lf1p;->a:Ljava/lang/Object;

    check-cast p0, Li7f;

    const-class p1, Lya2;

    invoke-static {p0, p1}, Lsfe;->R(Ljava/lang/Iterable;Ljava/lang/Class;)Lzlb;

    move-result-object p0

    invoke-virtual {p0}, Lzlb;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_52
    move-object p1, p0

    check-cast p1, Lbmb;

    invoke-virtual {p1}, Lbmb;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_65

    invoke-virtual {p1}, Lbmb;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lya2;

    invoke-interface {p1}, Lya2;->R()V

    goto :goto_52

    :cond_65
    return-void
.end method

.method public final J(I)Lja2;
    .registers 2

    iget-object p0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lja2;

    return-object p0
.end method

.method public final K(Ljava/lang/Class;)Z
    .registers 6

    iget-object p0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_8
    if-ge v2, v0, :cond_1e

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lja2;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v3

    invoke-virtual {p1, v3}, Ljava/lang/Class;->isAssignableFrom(Ljava/lang/Class;)Z

    move-result v3

    if-eqz v3, :cond_8

    const/4 p0, 0x1

    return p0

    :cond_1e
    return v1
.end method

.method public final L(Ljava/lang/Class;)I
    .registers 6

    iget-object p0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_1c

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lja2;

    invoke-virtual {p1, v3}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_19

    return v1

    :cond_19
    add-int/lit8 v1, v1, 0x1

    goto :goto_8

    :cond_1c
    const/4 p0, -0x1

    return p0
.end method

.method public P(Landroid/view/ViewGroup;I)Lab2;
    .registers 4

    iget-object p0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_a
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfa2;

    invoke-interface {v0}, Lfa2;->j()Lea2;

    move-result-object v0

    invoke-interface {v0, p1, p2}, Lea2;->k(Landroid/view/ViewGroup;I)Lab2;

    move-result-object v0

    if-eqz v0, :cond_a

    return-object v0

    :cond_21
    invoke-static {p2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    if-eqz p2, :cond_2f

    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceEntryName(I)Ljava/lang/String;

    move-result-object p0

    :cond_2f
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    move-result-object p1

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p2

    filled-new-array {p2, p0}, [Ljava/lang/Object;

    move-result-object p0

    const-string p2, "No view holder for layout number = [ %d ], layout name = [ %s ]"

    invoke-static {p1, p2, p0}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0
.end method

.method public T(Lab2;)V
    .registers 2

    return-void
.end method

.method public final U(Lab2;)V
    .registers 6

    iget-object v0, p0, Lha2;->d:Lf1p;

    iget-object v1, v0, Lf1p;->a:Ljava/lang/Object;

    check-cast v1, Li7f;

    invoke-virtual {v1, p1}, Li7f;->c(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_d

    return-void

    :cond_d
    iget-object v0, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast v0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_19
    :goto_19
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4b

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map$Entry;

    invoke-interface {v1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Class;

    invoke-virtual {v2, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_19

    invoke-interface {v1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lga2;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v2, p1

    check-cast v2, Lrjm;

    iget-object v1, v1, Lga2;->a:Lsjm;

    sget-object v3, Lsjm;->b:Lqjm;

    invoke-virtual {v1, v3}, Lsjm;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_19

    invoke-interface {v2, v3}, Lrjm;->b(Lsjm;)V

    goto :goto_19

    :cond_4b
    iget-object p0, p0, Lha2;->c:Laan;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Ly9n;

    if-eqz v0, :cond_59

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v0}, Lcan;->a(Landroid/view/View;)V

    :cond_59
    iget-object p0, p1, Lab2;->c:Lkze;

    sget-object v0, Log;->a:Log;

    invoke-static {p0, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lab2;->Y()V

    const/4 p0, 0x0

    iput-object p0, p1, Lab2;->b:Lja2;

    return-void
.end method

.method public final V(Lja2;)V
    .registers 4

    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    const/4 v1, -0x1

    if-ne p1, v1, :cond_a

    return-void

    :cond_a
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemRemoved(I)V

    return-void
.end method

.method public final W(Lja2;Lja2;)V
    .registers 6

    iget-object v0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->indexOf(Ljava/lang/Object;)I

    move-result v1

    if-gez v1, :cond_9

    return-void

    :cond_9
    iget-object v2, p0, Lha2;->i:Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v2, :cond_20

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->b0()Z

    move-result v2

    if-eqz v2, :cond_20

    iget-object v0, p0, Lha2;->i:Landroidx/recyclerview/widget/RecyclerView;

    new-instance v1, Lk3;

    const/16 v2, 0xc

    invoke-direct {v1, p0, p1, p2, v2}, Lk3;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    return-void

    :cond_20
    invoke-virtual {v0, v1, p2}, Ljava/util/ArrayList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    return-void
.end method

.method public final b(Lsjm;)V
    .registers 4

    iget-object v0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_10
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_20

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfa2;

    invoke-interface {v1, p1}, Lfa2;->b(Lsjm;)V

    goto :goto_10

    :cond_20
    iget-object v0, p0, Lha2;->h:Lga2;

    invoke-virtual {v0, p1}, Lga2;->b(Lsjm;)V

    iget-object p0, p0, Lha2;->c:Laan;

    iget-boolean p1, p1, Lsjm;->a:Z

    invoke-virtual {p0, p1}, Lcan;->b(Z)V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    invoke-virtual {p0, p1}, Lha2;->J(I)Lja2;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    int-to-long p0, p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 7

    invoke-virtual {p0, p1}, Lha2;->J(I)Lja2;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    move-object v2, v1

    :goto_9
    const-class v3, Lja2;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_20

    iget-object v3, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v3, v2}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lfa2;

    if-nez v3, :cond_21

    invoke-virtual {v2}, Ljava/lang/Class;->getSuperclass()Ljava/lang/Class;

    move-result-object v2

    goto :goto_9

    :cond_20
    const/4 v3, 0x0

    :cond_21
    if-eqz v3, :cond_66

    invoke-interface {v3}, Lfa2;->j()Lea2;

    move-result-object v2

    new-instance v3, Lca2;

    iget-object v4, p0, Lha2;->f:Ltni;

    iget-boolean v4, v4, Ltni;->b:Z

    iget-byte p0, p0, Lha2;->j:B

    invoke-direct {v3, v4, p0}, Lca2;-><init>(ZI)V

    invoke-interface {v2, v0, p1, v3}, Lea2;->q(Lja2;ILca2;)I

    move-result p0

    if-eqz p0, :cond_39

    return p0

    :cond_39
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object v0

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "No layout for item "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " in "

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p1, " view factory"

    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_66
    invoke-virtual {v1}, Ljava/lang/Class;->getName()Ljava/lang/String;

    move-result-object p0

    const-string p1, "Unsupported item: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lyt7;->k(Ljava/lang/String;)V

    const/4 p0, 0x0

    return p0
.end method

.method public final onAttachedToRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 2

    iput-object p1, p0, Lha2;->i:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p0, p0, Lha2;->c:Laan;

    invoke-virtual {p0, p1}, Laan;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 7

    check-cast p1, Lab2;

    invoke-static {p1}, Lha2;->X(Lab2;)V

    iget-object v0, p1, Lab2;->c:Lkze;

    invoke-virtual {p0, p2}, Lha2;->J(I)Lja2;

    move-result-object p2

    iget-object v1, p1, Lab2;->b:Lja2;

    const/4 v2, 0x0

    if-eqz v1, :cond_23

    invoke-virtual {v1, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_22

    sget-object v1, Log;->a:Log;

    invoke-static {v0, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lab2;->Y()V

    const/4 v1, 0x0

    iput-object v1, p1, Lab2;->b:Lja2;

    goto :goto_23

    :cond_22
    const/4 v2, 0x1

    :cond_23
    :goto_23
    iput-object p2, p1, Lab2;->b:Lja2;

    invoke-virtual {p1, p2, v2}, Lab2;->V(Lja2;Z)V

    sget-object p2, Lng;->a:Lng;

    invoke-static {v0, p2}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p1, v2}, Lab2;->X(Z)V

    iget-object p2, p0, Lha2;->c:Laan;

    invoke-virtual {p2, p1}, Laan;->f(Landroidx/recyclerview/widget/i;)V

    iget-object p2, p0, Lha2;->d:Lf1p;

    iget-object v0, p2, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_81

    iget-object p2, p2, Lf1p;->b:Ljava/lang/Object;

    check-cast p2, Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->entrySet()Ljava/util/Set;

    move-result-object p2

    invoke-interface {p2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_4d
    :goto_4d
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_81

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Class;

    invoke-virtual {v1, p1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4d

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lga2;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v1, p1

    check-cast v1, Lrjm;

    iget-object v2, v0, Lga2;->a:Lsjm;

    sget-object v3, Lsjm;->b:Lqjm;

    invoke-virtual {v2, v3}, Lsjm;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_4d

    iget-object v0, v0, Lga2;->a:Lsjm;

    invoke-interface {v1, v0}, Lrjm;->b(Lsjm;)V

    goto :goto_4d

    :cond_81
    iget-object p0, p0, Lha2;->e:Lix5;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-void
.end method

.method public bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lha2;->P(Landroid/view/ViewGroup;I)Lab2;

    move-result-object p0

    return-object p0
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Lha2;->f:Ltni;

    iget-object v1, p0, Lha2;->g:Ltk;

    invoke-virtual {v0, v1}, Ltni;->c(Lsni;)V

    iget-object p0, p0, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {p0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableCollection(Ljava/util/Collection;)Ljava/util/Collection;

    move-result-object p0

    check-cast p0, Ljava/util/Collection;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_17
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_27

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lfa2;

    invoke-interface {v0}, Lfa2;->onDestroy()V

    goto :goto_17

    :cond_27
    return-void
.end method

.method public final onDetachedFromRecyclerView(Landroidx/recyclerview/widget/RecyclerView;)V
    .registers 6

    iget-object v0, p0, Lha2;->c:Laan;

    iget-object v1, v0, Laan;->d:Lyc3;

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    iget-object v1, v0, Laan;->e:Lz61;

    const/4 v2, 0x0

    if-eqz v1, :cond_22

    invoke-virtual {p1, v1}, Landroid/view/View;->removeOnAttachStateChangeListener(Landroid/view/View$OnAttachStateChangeListener;)V

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->isAttachedToWindow()Z

    move-result v3

    if-eqz v3, :cond_20

    invoke-virtual {p1}, Landroid/view/View;->getViewTreeObserver()Landroid/view/ViewTreeObserver;

    move-result-object p1

    iget-object v1, v1, Lz61;->b:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;

    invoke-virtual {p1, v1}, Landroid/view/ViewTreeObserver;->removeOnGlobalLayoutListener(Landroid/view/ViewTreeObserver$OnGlobalLayoutListener;)V

    :cond_20
    iput-object v2, v0, Laan;->e:Lz61;

    :cond_22
    iput-object v2, p0, Lha2;->i:Landroidx/recyclerview/widget/RecyclerView;

    return-void
.end method

.method public bridge synthetic onFailedToRecycleView(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    check-cast p1, Lab2;

    invoke-virtual {p0, p1}, Lha2;->T(Lab2;)V

    const/4 p0, 0x1

    return p0
.end method

.method public final onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V
    .registers 3

    check-cast p1, Lab2;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewAttachedToWindow(Landroidx/recyclerview/widget/i;)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p0

    const/4 v0, -0x1

    if-eq p0, v0, :cond_12

    invoke-static {p1}, Lha2;->X(Lab2;)V

    :cond_12
    return-void
.end method

.method public final onViewDetachedFromWindow(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lab2;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewDetachedFromWindow(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public final bridge synthetic onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lab2;

    invoke-virtual {p0, p1}, Lha2;->U(Lab2;)V

    return-void
.end method
