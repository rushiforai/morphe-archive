.class public final Lyj5;
.super Lb23;
.source "SourceFile"


# instance fields
.field public final b:Lwj5;

.field public final c:Lx5f;

.field public final d:Lwtm;

.field public e:Z


# direct methods
.method public constructor <init>(Lwj5;Lx5f;Lwtm;)V
    .registers 5

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lb23;-><init>(B)V

    iput-object p1, p0, Lyj5;->b:Lwj5;

    iput-object p2, p0, Lyj5;->c:Lx5f;

    iput-object p3, p0, Lyj5;->d:Lwtm;

    return-void
.end method


# virtual methods
.method public final f(Landroid/content/Context;)Landroid/view/View;
    .registers 10

    invoke-static {p1}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const v1, 0x7f0d00d0

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-virtual {v0, v1, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_e0

    check-cast v1, Landroid/widget/LinearLayout;

    iget-object p0, p0, Lyj5;->b:Lwj5;

    iget-object v4, p0, Lwj5;->q:Ljava/util/List;

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    const/16 v6, 0xa

    invoke-static {v4, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v6

    invoke-direct {v5, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :goto_26
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_65

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ly5j;

    if-eqz v6, :cond_61

    instance-of v7, v6, Lx5j;

    if-nez v7, :cond_3c

    instance-of v7, v6, Lw5j;

    if-eqz v7, :cond_3f

    :cond_3c
    sget-object v6, Lxj5;->b:Lxj5;

    goto :goto_5d

    :cond_3f
    instance-of v7, v6, Lr5j;

    if-eqz v7, :cond_50

    check-cast v6, Lr5j;

    iget-boolean v6, v6, Lr5j;->b:Z

    const/4 v7, 0x1

    if-ne v6, v7, :cond_4d

    sget-object v6, Lxj5;->f:Lxj5;

    goto :goto_5d

    :cond_4d
    sget-object v6, Lxj5;->d:Lxj5;

    goto :goto_5d

    :cond_50
    instance-of v7, v6, Lu5j;

    if-eqz v7, :cond_57

    sget-object v6, Lxj5;->g:Lxj5;

    goto :goto_5d

    :cond_57
    instance-of v6, v6, Lv5j;

    if-eqz v6, :cond_61

    sget-object v6, Lxj5;->g:Lxj5;

    :goto_5d
    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_61
    invoke-static {}, Lh9o;->p()V

    return-object v2

    :cond_65
    new-instance v4, Ljava/util/ArrayList;

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iget-boolean v5, p0, Lwj5;->t:Z

    if-eqz v5, :cond_73

    sget-object v5, Lxj5;->e:Lxj5;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_73
    iget-object v5, p0, Lwj5;->s:Lffb;

    invoke-interface {v5}, Ljava/util/Collection;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_80

    sget-object v5, Lxj5;->c:Lxj5;

    invoke-virtual {v4, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_80
    iget-boolean p0, p0, Lwj5;->u:Z

    if-eqz p0, :cond_89

    sget-object p0, Lxj5;->h:Lxj5;

    invoke-virtual {v4, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_89
    new-instance p0, Lyg9;

    const/16 v5, 0x14

    invoke-direct {p0, v5}, Lyg9;-><init>(B)V

    invoke-static {p0, v4}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-static {p0}, Lkotlin/collections/CollectionsKt;->F(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p0

    check-cast p0, Ljava/lang/Iterable;

    invoke-interface {p0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :goto_a0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_df

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lxj5;

    iget v4, v4, Lxj5;->a:I

    invoke-virtual {p1, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f0d00af

    invoke-virtual {v0, v5, v2, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v5

    const v6, 0x7f0a069d

    invoke-static {v6, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/TextView;

    if-eqz v7, :cond_cd

    check-cast v5, Landroid/widget/LinearLayout;

    invoke-virtual {v7, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v1, v5}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    goto :goto_a0

    :cond_cd
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2

    :cond_df
    return-object v1

    :cond_e0
    const-string p0, "rootView"

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v2
.end method

.method public final g(Landroid/content/Context;)Ljava/lang/CharSequence;
    .registers 2

    const p0, 0x7f14049f

    invoke-virtual {p1, p0}, Landroid/content/Context;->getText(I)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final getNegativeButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1403bf

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getPositiveButtonText(Landroid/content/Context;)Ljava/lang/String;
    .registers 2

    const p0, 0x7f1401bc

    invoke-virtual {p1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final getTheme()I
    .registers 1

    const p0, 0x7f150295

    return p0
.end method

.method public final onFinished(Lhjm;)V
    .registers 10

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x1

    if-eqz p1, :cond_10

    if-ne p1, v0, :cond_c

    sget-object p1, Lvb0;->d:Lvb0;

    goto :goto_19

    :cond_c
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_10
    iget-boolean p1, p0, Lyj5;->e:Z

    if-eqz p1, :cond_17

    sget-object p1, Lvb0;->b:Lvb0;

    goto :goto_19

    :cond_17
    sget-object p1, Lvb0;->c:Lvb0;

    :goto_19
    iget-object v1, p0, Lyj5;->b:Lwj5;

    iget-object v1, v1, Lwj5;->p:Ljava/lang/String;

    iget-object v2, p0, Lyj5;->c:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    if-eqz v3, :cond_6a

    iget-object v3, v2, Lx5f;->d:Lzpa;

    new-instance v4, Lu90;

    const/4 v5, -0x1

    const/4 v6, 0x2

    const/16 v7, 0x98b

    invoke-direct {v4, v7, v5, v6}, Ljf0;-><init>(III)V

    const/4 v5, 0x0

    invoke-virtual {v4, v5, v0, p1}, Ljf0;->q(IILjava/lang/Object;)V

    if-eqz v1, :cond_35

    move v5, v0

    :cond_35
    invoke-virtual {v4, v0, v5, v1}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p1

    invoke-virtual {p1, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object v1

    invoke-virtual {v1, v3}, Lqd0;->x(Lzpa;)Lxb0;

    move-result-object v1

    const/16 v3, 0x25

    invoke-virtual {v1, v3}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    if-eqz v5, :cond_5a

    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    move-result v6

    if-nez v6, :cond_5a

    new-instance v0, Lhf0;

    invoke-direct {v0, v1, v3, v5}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_64

    :cond_5a
    invoke-static {v1, v3, v0}, Lam2;->q(Lxb0;II)Ljava/util/ArrayList;

    move-result-object v0

    new-instance v5, Lhf0;

    invoke-direct {v5, v1, v3, v0}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    move-object v0, v5

    :goto_64
    invoke-virtual {v0, v4}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, p1}, Lx5f;->U0(Lx56;)V

    :cond_6a
    iget-boolean p1, p0, Lyj5;->e:Z

    if-nez p1, :cond_82

    iget-object p0, p0, Lyj5;->d:Lwtm;

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lsu;

    sget-object p1, Lxle;->e:Lxle;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    new-instance v0, Lrw7;

    invoke-direct {v0, p1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lsu;->run(Ljava/lang/Object;)V

    :cond_82
    return-void
.end method

.method public final onPositiveButtonClicked(Lbz0;)V
    .registers 6

    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Landroid/app/Dialog;->setCancelable(Z)V

    const/4 v1, -0x1

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v1

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1, v0}, Landroid/view/View;->setClickable(Z)V

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    const/4 v1, -0x2

    invoke-virtual {p1, v1}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    iput-boolean v2, p0, Lyj5;->e:Z

    sget-object v0, Lhjm;->a:Lhjm;

    iput-object v0, p0, Ld63;->mDismissReason:Lhjm;

    new-instance v0, Ljl4;

    const/16 v1, 0x10

    invoke-direct {v0, p1, v1}, Ljl4;-><init>(Ljava/lang/Object;B)V

    iget-object p0, p0, Lyj5;->d:Lwtm;

    iget-object p1, p0, Lwtm;->a:Ljava/lang/Object;

    check-cast p1, Lagm;

    iget-object p1, p1, Lagm;->c:Ljava/lang/Object;

    check-cast p1, Lr9i;

    iget-object v1, p0, Lwtm;->b:Ljava/lang/Object;

    check-cast v1, Lwj5;

    iget-object p0, p0, Lwtm;->c:Ljava/lang/Object;

    check-cast p0, Lsu;

    new-instance v2, Liyk;

    const/4 v3, 0x5

    invoke-direct {v2, v0, p0, v3}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, v1, v2}, Lr9i;->k(Lwj5;Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final onShowDialog(Lbz0;)V
    .registers 4

    invoke-super {p0, p1}, Lb23;->onShowDialog(Lbz0;)V

    new-instance v0, Lnf;

    const/16 v1, 0x19

    invoke-direct {v0, p0, p1, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, -0x1

    invoke-virtual {p1, p0}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method
