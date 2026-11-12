.class public final Lpte;
.super Li93;
.source "SourceFile"


# instance fields
.field public A:Lp85;

.field public B:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public C:Lnte;

.field public D:Lzxf;

.field public E:Z

.field public F:Lsa2;

.field public final G:Lyqa;

.field public final H:Lq65;

.field public final I:Lumi;

.field public final J:Lorm;

.field public final t:Lgjm;

.field public final u:Lskm;

.field public final v:Ljte;

.field public w:Ljava/util/List;

.field public x:Ljava/util/List;

.field public y:Lx93;

.field public final z:Lwte;


# direct methods
.method public constructor <init>(Lgjm;Lskm;Lwte;Lyqa;Lumi;Lorm;)V
    .registers 10

    const v0, 0x7f14101a

    invoke-direct {p0, v0}, Li93;-><init>(I)V

    new-instance v0, Ljte;

    invoke-direct {v0, p0}, Ljte;-><init>(Lpte;)V

    iput-object v0, p0, Lpte;->v:Ljte;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lpte;->w:Ljava/util/List;

    sget-object v0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    iput-object v0, p0, Lpte;->x:Ljava/util/List;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lpte;->E:Z

    new-instance v0, Lyqd;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lyqd;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Lq65;

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v1, p0, Lpte;->H:Lq65;

    iput-object p1, p0, Lpte;->t:Lgjm;

    iput-object p2, p0, Lpte;->u:Lskm;

    iput-object p3, p0, Lpte;->z:Lwte;

    iput-object p4, p0, Lpte;->G:Lyqa;

    iput-object p5, p0, Lpte;->I:Lumi;

    iput-object p6, p0, Lpte;->J:Lorm;

    return-void
.end method

.method public static I0(Landroid/view/View;Z)V
    .registers 2

    if-eqz p1, :cond_4

    const/4 p1, 0x0

    goto :goto_6

    :cond_4
    const/16 p1, 0x8

    :goto_6
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public static M0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V
    .registers 3

    if-eqz p1, :cond_4

    const/4 v0, 0x1

    goto :goto_5

    :cond_4
    const/4 v0, 0x0

    :goto_5
    invoke-static {p0, v0}, Lpte;->I0(Landroid/view/View;Z)V

    if-eqz p1, :cond_10

    new-instance v0, Lqxh;

    invoke-direct {v0, p1}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_11

    :cond_10
    const/4 v0, 0x0

    :goto_11
    invoke-virtual {p0, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lpte;->v:Ljte;

    return-object p0
.end method

.method public final H0()V
    .registers 9

    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_e7

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    const-string v1, "enable_newsfeed"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_e7

    iget-object v0, p0, Lpte;->D:Lzxf;

    if-nez v0, :cond_4b

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object v0

    iget-object v1, v0, Ldyf;->j:Ljava/lang/ref/WeakReference;

    if-eqz v1, :cond_3c

    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lzxf;

    if-eqz v1, :cond_3c

    :goto_3a
    move-object v0, v1

    goto :goto_49

    :cond_3c
    new-instance v1, Lyxf;

    invoke-direct {v1, v0}, Lzxf;-><init>(Ldyf;)V

    new-instance v2, Ljava/lang/ref/WeakReference;

    invoke-direct {v2, v1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v2, v0, Ldyf;->j:Ljava/lang/ref/WeakReference;

    goto :goto_3a

    :goto_49
    iput-object v0, p0, Lpte;->D:Lzxf;

    :cond_4b
    invoke-virtual {v0}, Lzxf;->e()Ljava/util/List;

    move-result-object v0

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    iget-object v3, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v3

    :cond_5f
    :goto_5f
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_82

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcwf;

    instance-of v5, v4, Lcwf;

    if-eqz v5, :cond_5f

    iget-object v5, v4, Lcwf;->f:Lbwf;

    invoke-interface {v0, v5}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_5f

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-boolean v4, v4, Lcwf;->b:Z

    if-eqz v4, :cond_5f

    invoke-virtual {v2, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_5f

    :cond_82
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object p0

    iget-object v0, p0, Ldyf;->f:Lcue;

    sget-object v3, Lcue;->c:Lcue;

    if-ne v0, v3, :cond_e7

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-direct {v0, v3}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v3, Ljava/util/HashSet;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v3, v4}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_a9
    :goto_a9
    if-ge v5, v4, :cond_d0

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lbwf;

    instance-of v7, v6, Lzqe;

    if-eqz v7, :cond_bd

    move-object v7, v6

    check-cast v7, Lzqe;

    iget-object v7, v7, Lzqe;->a:Lyqe;

    goto :goto_c3

    :cond_bd
    instance-of v7, v6, Ljvl;

    if-eqz v7, :cond_a9

    sget-object v7, Lyqe;->d:Lyqe;

    :goto_c3
    invoke-virtual {v0, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_a9

    invoke-virtual {v3, v7}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_a9

    :cond_d0
    iget-object p0, p0, Ldyf;->a:Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p0

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    iget-object p0, p0, Luqe;->l:Lip4;

    invoke-virtual {p0, v0, v3}, Lip4;->g(Ljava/util/List;Ljava/util/Set;)V

    :cond_e7
    return-void
.end method

.method public final J0()V
    .registers 6

    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_7
    :goto_7
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcwf;

    iget-boolean v2, v2, Lcwf;->b:Z

    if-eqz v2, :cond_7

    add-int/lit8 v1, v1, 0x1

    goto :goto_7

    :cond_1a
    iget-object v0, p0, Lpte;->w:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v2, p0, Lpte;->A:Lp85;

    iget-object v2, v2, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v3, p0, Lpte;->A:Lp85;

    iget-object v3, v3, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v4, v0}, [Ljava/lang/Object;

    move-result-object v0

    const v4, 0x7f140756

    invoke-virtual {v2, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p0, p0, Lpte;->A:Lp85;

    iget-object p0, p0, Lp85;->c:Lcom/opera/android/custom_views/StylingTextView;

    if-nez v1, :cond_4c

    const v0, 0x7f04021f

    goto :goto_4f

    :cond_4c
    const v0, 0x1010038

    :goto_4f
    const v1, 0x7f06063b

    invoke-static {v0, v2, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v0

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setTextColor(I)V

    return-void
.end method

.method public final K0(Lcs5;)V
    .registers 6

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->g:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    sget-object v1, Lheb;->m:Lheb;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v1, p1, :cond_e

    move v1, v2

    goto :goto_f

    :cond_e
    move v1, v3

    :goto_f
    xor-int/2addr v1, v3

    invoke-static {v0, v1}, Lpte;->I0(Landroid/view/View;Z)V

    iget-object v0, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    instance-of v1, p1, Lieb;

    invoke-static {v0, v1}, Lpte;->I0(Landroid/view/View;Z)V

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->d:Landroid/widget/FrameLayout;

    sget-object v1, Ljeb;->m:Ljeb;

    if-eq v1, p1, :cond_24

    move v1, v2

    goto :goto_25

    :cond_24
    move v1, v3

    :goto_25
    invoke-static {v0, v1}, Lpte;->I0(Landroid/view/View;Z)V

    iget-object p0, p0, Lpte;->A:Lp85;

    iget-object p0, p0, Lp85;->f:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    sget-object v0, Lkeb;->m:Lkeb;

    if-ne v0, p1, :cond_33

    move v2, v3

    :cond_33
    invoke-static {p0, v2}, Lpte;->I0(Landroid/view/View;Z)V

    return-void
.end method

.method public final L0(Lste;)V
    .registers 9

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->l:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v1, p1, Lste;->a:Z

    iget-object v2, p1, Lste;->e:Ladg;

    iget-object v3, p1, Lste;->d:Lbre;

    iget-object v4, p1, Lste;->c:Ljrh;

    iget-object v5, p1, Lste;->f:Lcs5;

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->k:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/SeparatorView;

    iget-object p1, p1, Lste;->b:Lo7j;

    const/4 v1, 0x1

    if-nez p1, :cond_26

    if-nez v4, :cond_26

    if-nez v3, :cond_26

    if-nez v2, :cond_26

    const/4 v6, 0x0

    goto :goto_27

    :cond_26
    move v6, v1

    :goto_27
    invoke-static {v0, v6}, Lpte;->I0(Landroid/view/View;Z)V

    const/4 v0, 0x0

    if-eqz p1, :cond_38

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    iget p1, p1, Lo7j;->a:I

    invoke-virtual {v6, p1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p1

    goto :goto_39

    :cond_38
    move-object p1, v0

    :goto_39
    iget-object v6, p0, Lpte;->A:Lp85;

    iget-object v6, v6, Lp85;->j:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v6, p1}, Lpte;->M0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    if-eqz v4, :cond_47

    iget-object p1, v4, Ljrh;->a:Ljava/lang/String;

    goto :goto_48

    :cond_47
    move-object p1, v0

    :goto_48
    iget-object v4, p0, Lpte;->A:Lp85;

    iget-object v4, v4, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v4, p1}, Lpte;->M0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-boolean p1, p0, Lpte;->E:Z

    if-eqz p1, :cond_5a

    if-eqz v3, :cond_5a

    iget-object p1, v3, Lbre;->b:Ljava/lang/String;

    goto :goto_5b

    :cond_5a
    move-object p1, v0

    :goto_5b
    iget-object v3, p0, Lpte;->A:Lp85;

    iget-object v3, v3, Lp85;->h:Landroid/view/View;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v3, p1}, Lpte;->M0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    if-eqz v2, :cond_6c

    iget p1, v2, Ladg;->a:I

    invoke-virtual {p0, p1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    :cond_6c
    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {p1, v0}, Lpte;->M0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    instance-of p1, v5, Lieb;

    iget-object v0, p0, Lpte;->H:Lq65;

    if-eqz p1, :cond_99

    invoke-virtual {v0}, Ln1;->S()V

    move-object p1, v5

    check-cast p1, Lieb;

    iget-object p1, p1, Lieb;->m:Ljava/util/List;

    iget-object v2, p0, Lpte;->x:Ljava/util/List;

    invoke-interface {v2, p1}, Ljava/util/List;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_99

    iput-object p1, p0, Lpte;->x:Ljava/util/List;

    iput-object p1, p0, Lpte;->w:Ljava/util/List;

    iput-boolean v1, p0, Lpte;->E:Z

    iget-object p1, p0, Lpte;->y:Lx93;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lpte;->J0()V

    :cond_99
    instance-of p1, v5, Ljeb;

    if-eqz p1, :cond_a6

    const-wide/16 v1, 0xf

    sget-object p1, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object v3, p0, Lpte;->I:Lumi;

    invoke-virtual {v0, v3, v1, v2, p1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    :cond_a6
    instance-of p1, v5, Lheb;

    if-eqz p1, :cond_ad

    invoke-virtual {v0}, Ln1;->S()V

    :cond_ad
    invoke-virtual {p0, v5}, Lpte;->K0(Lcs5;)V

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    invoke-static {p1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/BrowserActivity;->n0:Lsa2;

    iput-object p1, p0, Lpte;->F:Lsa2;

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lpte;->C:Lnte;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lnte;->h()V

    :cond_a
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    iget-object v0, p0, Lpte;->H:Lq65;

    invoke-virtual {v0}, Ln1;->S()V

    iget-object v0, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iput-object v1, p0, Lpte;->y:Lx93;

    iget-object v0, p0, Lpte;->G:Lyqa;

    iput-object v1, v0, Lyqa;->c:Ljava/lang/Object;

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->h:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v1, p0, Lpte;->C:Lnte;

    iput-object v1, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, p0, Lpte;->A:Lp85;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onDetach()V
    .registers 2

    invoke-super {p0}, Lk24;->onDetach()V

    new-instance p0, Lj06;

    const/16 v0, 0x14

    invoke-direct {p0, v0}, Lj06;-><init>(B)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final onStart()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object p0, p0, Lpte;->F:Lsa2;

    iget v0, p0, Lsa2;->b:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lsa2;->b:I

    return-void
.end method

.method public final onStop()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object v0, p0, Lpte;->F:Lsa2;

    iget v1, v0, Lsa2;->b:I

    if-eqz v1, :cond_d

    add-int/lit8 v1, v1, -0x1

    iput v1, v0, Lsa2;->b:I

    :cond_d
    invoke-virtual {p0}, Lpte;->H0()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance p1, Lx93;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lx93;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lpte;->y:Lx93;

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->m:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/PullSpinner;

    new-instance v0, Lhz0;

    invoke-direct {v0, p2}, Lhz0;-><init>(B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object p2

    if-eqz p2, :cond_1f

    invoke-static {p2, p1, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_1f
    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->m:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/PullSpinner;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Lf03;->C(Landroid/content/Context;)I

    move-result p2

    iget-object v0, p1, Lcom/opera/android/custom_views/PullSpinner;->e:Lz9h;

    iput p2, v0, Lz9h;->c:I

    invoke-virtual {p1}, Landroid/view/View;->invalidate()V

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->m:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/PullSpinner;

    invoke-virtual {p1}, Lcom/opera/android/custom_views/PullSpinner;->d()V

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->m:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/PullSpinner;

    const/4 p2, 0x2

    invoke-virtual {p1, p2}, Lcom/opera/android/custom_views/PullSpinner;->b(I)V

    new-instance p1, Lnte;

    invoke-direct {p1, p0}, Lnte;-><init>(Lpte;)V

    iput-object p1, p0, Lpte;->C:Lnte;

    new-instance p1, Lcom/opera/android/custom_views/LayoutDirectionGridLayoutManager;

    iget-object v0, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-direct {p1, v0}, Lcom/opera/android/custom_views/LayoutDirectionGridLayoutManager;-><init>(Lcom/opera/android/custom_views/FadingRecyclerView;)V

    iget-object v0, p0, Lpte;->C:Lnte;

    iput-object v0, p1, Landroidx/recyclerview/widget/GridLayoutManager;->g:Ltx7;

    iget-object v0, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v1, p0, Lpte;->y:Lx93;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    const/4 v0, 0x1

    iput-short v0, p1, Landroidx/recyclerview/widget/e;->f:S

    new-instance p1, Lglb;

    new-instance v1, Lmte;

    invoke-direct {v1, p0}, Lmte;-><init>(Lpte;)V

    invoke-direct {p1, v1}, Lglb;-><init>(Lclb;)V

    iget-object v1, p0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p1, v1}, Lglb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance p1, Ljte;

    invoke-direct {p1, p0}, Ljte;-><init>(Lpte;)V

    iget-object v1, p0, Lpte;->G:Lyqa;

    iput-object p1, v1, Lyqa;->c:Ljava/lang/Object;

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object v1, p1, Lp85;->l:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Ljte;

    invoke-direct {v2, p0}, Ljte;-><init>(Lpte;)V

    iput-object v2, v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    iget-object p1, p1, Lp85;->j:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {p1}, Landroid/view/View;->getTag()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v1, p0, Lpte;->A:Lp85;

    iget-object v1, v1, Lp85;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Llte;

    const/4 v3, 0x0

    invoke-direct {v2, p0, p1, v3}, Llte;-><init>(Lndc;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->e:Landroidx/constraintlayout/widget/ConstraintLayout;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lkte;

    invoke-direct {v1, p0, v3}, Lkte;-><init>(Lpte;B)V

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lkte;

    invoke-direct {v1, p0, p2}, Lkte;-><init>(Lpte;B)V

    invoke-virtual {p1, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lpte;->A:Lp85;

    iget-object p1, p1, Lp85;->i:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lkte;

    invoke-direct {p2, p0, v0}, Lkte;-><init>(Lpte;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Lpte;->z:Lwte;

    iget-object p1, p1, Lwte;->e:Lv9j;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    iget-object v0, p0, Lpte;->A:Lp85;

    iget-object v0, v0, Lp85;->b:Landroid/widget/LinearLayout;

    new-instance v1, Ld8d;

    const/16 v2, 0xb

    invoke-direct {v1, p0, v2}, Ld8d;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, p2, v0, p0, v1}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p2

    invoke-super/range {p0 .. p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v2, 0x7f0d010d

    const/4 v3, 0x0

    move-object/from16 v4, p1

    invoke-virtual {v4, v2, v1, v3}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v1, 0x7f0a02ec

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v6, v3

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_cf

    const v1, 0x7f0a0375

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v7, v3

    check-cast v7, Landroid/widget/LinearLayout;

    if-eqz v7, :cond_cf

    const v1, 0x7f0a0599

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v8, v3

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_cf

    const v1, 0x7f0a059a

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v9, v3

    check-cast v9, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v9, :cond_cf

    const v1, 0x7f0a061c

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v10, v3

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_cf

    const v1, 0x7f0a06b5

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v3, :cond_cf

    const v1, 0x7f0a082b

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v11, v3

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_cf

    const v1, 0x7f0a08a2

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v12, v3

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v12, :cond_cf

    const v1, 0x7f0a08c0

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v13, :cond_cf

    const v1, 0x7f0a097d

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v14, v3

    check-cast v14, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v14, :cond_cf

    move-object v5, v2

    check-cast v5, Landroid/widget/LinearLayout;

    const v1, 0x7f0a09dc

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object v15, v3

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_cf

    const v1, 0x7f0a0aad

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v16, v3

    check-cast v16, Lcom/opera/android/custom_views/PullSpinner;

    if-eqz v16, :cond_cf

    const v1, 0x7f0a0aaf

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    move-object/from16 v17, v3

    check-cast v17, Landroid/widget/FrameLayout;

    if-eqz v17, :cond_cf

    new-instance v4, Lp85;

    invoke-direct/range {v4 .. v17}, Lp85;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Landroid/widget/LinearLayout;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/FadingRecyclerView;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/PullSpinner;Landroid/widget/FrameLayout;)V

    iput-object v4, v0, Lpte;->A:Lp85;

    iput-object v13, v0, Lpte;->B:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v1, Llzb;

    const/16 v2, 0x14

    invoke-direct {v1, v0, v2}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-nez v0, :cond_cb

    return-void

    :cond_cb
    invoke-static {v0, v9, v1}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    return-void

    :cond_cf
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
