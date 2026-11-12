.class public final Lqbn;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Ljbn;

.field public final b:Llrk;

.field public final c:Z

.field public final d:Ljava/util/ArrayList;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljbn;Lcq5;Llrk;)V
    .registers 11

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p2, p0, Lqbn;->a:Ljbn;

    iput-object p4, p0, Lqbn;->b:Llrk;

    invoke-static {}, Lywc;->d()V

    sget-object p2, Lywc;->a:Ljava/util/HashMap;

    invoke-virtual {p2}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object p2

    check-cast p2, Ljava/util/Set;

    invoke-static {}, Lywc;->c()Ljava/util/ArrayList;

    move-result-object p4

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p2}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_1f
    :goto_1f
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_4a

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    invoke-virtual {p4, v1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_1f

    invoke-static {v1}, Lywc;->a(Ljava/lang/String;)Lxwc;

    move-result-object v2

    new-instance v3, Llbn;

    invoke-static {v1}, Lsfe;->S(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    iget v4, v2, Lxwc;->b:I

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v2, v2, Lxwc;->a:Ljava/lang/String;

    invoke-direct {v3, v1, v4, v2}, Llbn;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_4a
    new-instance p1, Lrp2;

    const/4 p2, 0x2

    invoke-direct {p1, p2}, Lrp2;-><init>(B)V

    invoke-static {p1, v0}, Ln95;->r(Ljava/util/Comparator;Ljava/util/List;)V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    sget-object p2, Lmbn;->a:Lmbn;

    const/4 v1, 0x0

    invoke-virtual {p1, v1, p2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iget-object v2, p0, Lqbn;->a:Ljbn;

    invoke-virtual {v2}, Ljbn;->b()Ljava/util/ArrayList;

    move-result-object v2

    invoke-virtual {p2, v2}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {p3}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Lnok;

    invoke-virtual {p3}, Lnok;->d()Lffb;

    move-result-object p3

    invoke-virtual {p2, p3}, Ljava/util/AbstractCollection;->addAll(Ljava/util/Collection;)Z

    invoke-static {p4}, Lkotlin/collections/CollectionsKt;->n0(Ljava/lang/Iterable;)Ljava/util/Set;

    move-result-object p3

    check-cast p3, Ljava/util/Collection;

    invoke-virtual {p2, p3}, Ljava/util/AbstractCollection;->removeAll(Ljava/util/Collection;)Z

    invoke-virtual {p2}, Ljava/util/AbstractCollection;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :cond_86
    :goto_86
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_bd

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Ljava/lang/String;

    invoke-static {p3}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object p3

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result p4

    move v2, v1

    :cond_9b
    if-ge v2, p4, :cond_86

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Llbn;

    iget-object v4, v3, Llbn;->a:Ljava/lang/String;

    invoke-static {v4}, Lwwc;->f(Ljava/lang/String;)Ljava/util/Locale;

    move-result-object v4

    invoke-static {v4}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v4

    invoke-static {p3}, Lwwc;->d(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v4, v5}, Lwwc;->b(Ljava/lang/String;Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_9b

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_86

    :cond_bd
    sget-object p2, Lkbn;->a:Lkbn;

    invoke-virtual {p1, p2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iput-object p1, p0, Lqbn;->d:Ljava/util/ArrayList;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lqbn;->c:Z

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    return-void
.end method


# virtual methods
.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lqbn;->d:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    int-to-long p0, p1

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lqbn;->d:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lnbn;

    if-eqz p0, :cond_1c

    instance-of p1, p0, Lmbn;

    if-eqz p1, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    instance-of p1, p0, Lkbn;

    if-eqz p1, :cond_16

    const/4 p0, 0x2

    return p0

    :cond_16
    instance-of p0, p0, Llbn;

    if-eqz p0, :cond_1c

    const/4 p0, 0x3

    return p0

    :cond_1c
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 7

    instance-of v0, p1, Lpbn;

    if-eqz v0, :cond_43

    check-cast p1, Lpbn;

    iget-object v0, p0, Lqbn;->d:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llbn;

    iget-boolean p0, p0, Lqbn;->c:Z

    const/4 v1, 0x0

    if-ne p2, p0, :cond_15

    const/4 p0, 0x1

    goto :goto_16

    :cond_15
    move p0, v1

    :goto_16
    iget-object p2, p1, Lpbn;->b:Ly83;

    iget-object v2, p2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, v0, Llbn;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p2, Ly83;->c:Ljava/lang/Object;

    check-cast v2, Landroid/widget/TextView;

    iget-object v3, v0, Llbn;->c:Ljava/lang/String;

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v2, p2, Ly83;->e:Ljava/lang/Object;

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz p0, :cond_32

    move p0, v1

    goto :goto_34

    :cond_32
    const/16 p0, 0x8

    :goto_34
    invoke-virtual {v2, p0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    new-instance p2, Lobn;

    invoke-direct {p2, p1, v0, v1}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_43
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x3

    if-ne p2, v1, :cond_17

    invoke-static {v0, p1}, Ly83;->e(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Ly83;

    move-result-object p1

    new-instance p2, Lpbn;

    iget-object p0, p0, Lqbn;->b:Llrk;

    invoke-direct {p2, p1, p0}, Lpbn;-><init>(Ly83;Llrk;)V

    return-object p2

    :cond_17
    const p0, 0x7f0d0385

    const/4 v1, 0x0

    invoke-virtual {v0, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Lmn5;->a(Landroid/view/View;)Lmn5;

    move-result-object p0

    iget-object p0, p0, Lmn5;->b:Lcom/opera/android/custom_views/StylingTextView;

    new-instance p1, Lzl5;

    const/4 v0, 0x2

    if-ne p2, v0, :cond_2b

    const/4 v1, 0x1

    :cond_2b
    invoke-direct {p1, p0}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    if-eqz v1, :cond_34

    const p2, 0x7f1408af

    goto :goto_37

    :cond_34
    const p2, 0x7f1408b0

    :goto_37
    invoke-virtual {p0, p2}, Landroid/widget/TextView;->setText(I)V

    return-object p1
.end method
