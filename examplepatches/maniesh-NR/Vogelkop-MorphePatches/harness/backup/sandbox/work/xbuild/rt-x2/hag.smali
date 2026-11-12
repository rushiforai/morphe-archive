.class public final Lhag;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Luoj;

.field public final c:Ljava/util/ArrayList;

.field public final d:Llag;

.field public e:Ljava/lang/String;


# direct methods
.method public constructor <init>(Landroid/content/Context;Llag;Luoj;)V
    .registers 5

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lhag;->c:Ljava/util/ArrayList;

    iput-object p1, p0, Lhag;->a:Landroid/content/Context;

    iput-object p2, p0, Lhag;->d:Llag;

    iput-object p3, p0, Lhag;->b:Luoj;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lhag;->H(Ljava/lang/String;)V

    return-void
.end method


# virtual methods
.method public final G(ILjava/util/ArrayList;)V
    .registers 5

    invoke-virtual {p2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    new-instance v0, Leag;

    iget-object v1, p0, Lhag;->a:Landroid/content/Context;

    invoke-virtual {v1, p1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lgag;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-void
.end method

.method public final H(Ljava/lang/String;)V
    .registers 12

    iput-object p1, p0, Lhag;->e:Ljava/lang/String;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    sget-object v3, Ls9g;->h:Ls9g;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_21
    :goto_21
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_72

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    sget-object v6, Ls9g;->h:Ls9g;

    invoke-virtual {v6, v5, v4}, Ls9g;->f(Ljava/lang/String;Z)Ljag;

    move-result-object v6

    const/4 v7, 0x0

    if-eqz v6, :cond_4e

    iget-object v8, p0, Lhag;->d:Llag;

    invoke-virtual {v6, v8, v7}, Ljag;->a(Llag;Lkag;)Lkag;

    move-result-object v9

    if-eqz v9, :cond_4e

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v6, v8}, Ljag;->b(Llag;)Ljava/lang/Boolean;

    move-result-object v6

    invoke-virtual {v7, v6}, Ljava/lang/Boolean;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_4c

    move-object v7, v9

    goto :goto_4e

    :cond_4c
    sget-object v7, Lkag;->d:Lkag;

    :cond_4e
    :goto_4e
    if-eqz v7, :cond_21

    invoke-virtual {v7}, Ljava/lang/Enum;->ordinal()I

    move-result v6

    if-eqz v6, :cond_60

    const/4 v7, 0x1

    if-eq v6, v7, :cond_5e

    const/4 v7, 0x2

    if-ne v6, v7, :cond_21

    move-object v6, v2

    goto :goto_61

    :cond_5e
    move-object v6, v1

    goto :goto_61

    :cond_60
    move-object v6, v0

    :goto_61
    if-eqz p1, :cond_69

    invoke-virtual {v5, p1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v7

    if-eqz v7, :cond_21

    :cond_69
    new-instance v7, Lgag;

    invoke-direct {v7, v5}, Lgag;-><init>(Ljava/lang/String;)V

    invoke-interface {v6, v7}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_21

    :cond_72
    const p1, 0x7f140cca

    invoke-virtual {p0, p1, v0}, Lhag;->G(ILjava/util/ArrayList;)V

    const p1, 0x7f140cc9

    invoke-virtual {p0, p1, v1}, Lhag;->G(ILjava/util/ArrayList;)V

    const p1, 0x7f140cc6

    invoke-virtual {p0, p1, v2}, Lhag;->G(ILjava/util/ArrayList;)V

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lhag;->c:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgag;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p0, Leag;

    if-eqz p0, :cond_15

    sget p0, Lfag;->c:I

    const p0, 0x7f0d0200

    return p0

    :cond_15
    sget p0, Lpmj;->d:I

    const p0, 0x7f0d03a9

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 5

    invoke-virtual {p0, p2}, Lhag;->getItemViewType(I)I

    move-result v0

    const v1, 0x7f0d0200

    iget-object p0, p0, Lhag;->c:Ljava/util/ArrayList;

    if-ne v0, v1, :cond_1b

    check-cast p1, Lfag;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgag;

    iget-object p0, p0, Lgag;->a:Ljava/lang/String;

    iget-object p1, p1, Lfag;->b:Landroid/widget/TextView;

    invoke-virtual {p1, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_1b
    check-cast p1, Lpmj;

    invoke-virtual {p0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgag;

    iget-object p0, p0, Lgag;->a:Ljava/lang/String;

    iget-object p2, p1, Lpmj;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p2, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const/4 p0, 0x0

    iput-object p0, p1, Lpmj;->c:Ljava/lang/String;

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 6

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    sget v1, Lfag;->c:I

    const v1, 0x7f0d0200

    const/4 v2, 0x0

    if-ne p2, v1, :cond_1a

    invoke-virtual {v0, p2, p1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    new-instance p1, Lfag;

    invoke-direct {p1, p0}, Lfag;-><init>(Landroid/view/View;)V

    return-object p1

    :cond_1a
    invoke-static {v0, p1}, Lkf;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object p1

    new-instance p2, Lpmj;

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p2, v0, p1}, Lpmj;-><init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/custom_views/StylingTextView;)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Lj5g;

    const/4 v1, 0x1

    invoke-direct {v0, p0, p2, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lohi;

    invoke-direct {p0, v0, v2}, Lohi;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2
.end method
