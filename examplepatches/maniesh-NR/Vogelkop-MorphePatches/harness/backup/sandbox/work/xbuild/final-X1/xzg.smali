.class public final Lxzg;
.super Luim;
.source "SourceFile"

# interfaces
.implements Lam9;


# instance fields
.field public final d:Lumi;

.field public final e:Lp0h;

.field public final f:Lwzg;

.field public g:Landroid/view/ViewGroup;

.field public h:Lei;

.field public final i:Lbp;

.field public final j:Lx5f;

.field public final k:Lgjm;

.field public final l:Lwt3;

.field public final m:Z

.field public final n:Z


# direct methods
.method public constructor <init>(Lbp;Lumi;Lp0h;Lx5f;Lgjm;Lwt3;ZI)V
    .registers 11

    invoke-direct {p0}, Luim;-><init>()V

    new-instance v0, Lwzg;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lwzg;-><init>(B)V

    iput-object v0, p0, Lxzg;->f:Lwzg;

    iput-object p1, p0, Lxzg;->i:Lbp;

    iput-object p2, p0, Lxzg;->d:Lumi;

    iput-object p3, p0, Lxzg;->e:Lp0h;

    iput-object p4, p0, Lxzg;->j:Lx5f;

    iput-object p5, p0, Lxzg;->k:Lgjm;

    iput-object p6, p0, Lxzg;->l:Lwt3;

    iput-boolean p7, p0, Lxzg;->m:Z

    iput-boolean p8, p0, Lxzg;->n:Z

    return-void
.end method

.method public static j0(Landroidx/fragment/app/w;Lj83;Z)V
    .registers 7

    invoke-static {p0, p0}, Lu35;->f(Landroidx/fragment/app/w;Landroidx/fragment/app/w;)Landroidx/fragment/app/a;

    move-result-object v0

    const/4 v1, 0x2

    const v2, 0x7f0a04d1

    const/4 v3, 0x0

    invoke-virtual {v0, v2, p1, v3, v1}, Landroidx/fragment/app/a;->e(ILandroidx/fragment/app/Fragment;Ljava/lang/String;I)V

    const-string v1, "PrivacyMonitorFragment"

    invoke-virtual {v0, v1}, Lym9;->c(Ljava/lang/String;)V

    if-eqz p2, :cond_1d

    invoke-virtual {p0, v2}, Landroidx/fragment/app/w;->E(I)Landroidx/fragment/app/Fragment;

    move-result-object p0

    if-eqz p0, :cond_1d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v3

    :cond_1d
    if-eqz v3, :cond_82

    new-instance p0, Lzzg;

    invoke-direct {p0}, Ly2m;-><init>()V

    invoke-virtual {p1, p0}, Landroidx/fragment/app/Fragment;->setSharedElementEnterTransition(Ljava/lang/Object;)V

    const/4 p0, 0x1

    iput-boolean p0, v0, Lym9;->r:Z

    invoke-virtual {v3}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Lan9;->a:Lfn9;

    sget-object p1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {v3}, Landroid/view/View;->getTransitionName()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_7c

    iget-object p2, v0, Lym9;->p:Ljava/util/ArrayList;

    if-nez p2, :cond_4b

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v0, Lym9;->p:Ljava/util/ArrayList;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    iput-object p2, v0, Lym9;->q:Ljava/util/ArrayList;

    goto :goto_5d

    :cond_4b
    iget-object p2, v0, Lym9;->q:Ljava/util/ArrayList;

    invoke-virtual {p2, p0}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    const-string v1, "\' has already been added to the transaction."

    if-nez p2, :cond_72

    iget-object p2, v0, Lym9;->p:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_68

    :goto_5d
    iget-object p2, v0, Lym9;->p:Ljava/util/ArrayList;

    invoke-virtual {p2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget-object p1, v0, Lym9;->q:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_86

    :cond_68
    const-string p0, "A shared element with the source name \'"

    invoke-static {p0, p1, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_72
    const-string p1, "A shared element with the target name \'"

    invoke-static {p1, p0, v1}, Lsko;->k(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_7c
    const-string p0, "Unique transitionNames are required for all sharedElements"

    invoke-static {p0}, Lqp2;->o(Ljava/lang/String;)V

    return-void

    :cond_82
    const/16 p0, 0x1003

    iput p0, v0, Lym9;->h:I

    :goto_86
    invoke-virtual {v0}, Landroidx/fragment/app/a;->h()I

    return-void
.end method


# virtual methods
.method public final g0(Landroid/os/Bundle;)Landroid/app/Dialog;
    .registers 5

    iget-object p1, p0, Lxzg;->i:Lbp;

    if-nez p1, :cond_24

    iget-boolean p1, p0, Lxzg;->n:Z

    if-nez p1, :cond_12

    new-instance p1, Lrzg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    invoke-direct {p1, p0, v0}, Lrzg;-><init>(Lxzg;Landroid/content/Context;)V

    return-object p1

    :cond_12
    new-instance p1, Lszg;

    new-instance v0, Ls8n;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f040557

    invoke-direct {v0, v1, v2}, Ls8n;-><init>(Landroid/content/Context;I)V

    invoke-direct {p1, p0, v0}, Lszg;-><init>(Lxzg;Ls8n;)V

    return-object p1

    :cond_24
    new-instance v0, Ltzg;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-direct {v0, p0, v1, p1}, Ltzg;-><init>(Lxzg;Landroid/content/Context;Lbp;)V

    return-object v0
.end method

.method public final i0()V
    .registers 13

    iget-object v0, p0, Lxzg;->h:Lei;

    iget-object v0, v0, Lei;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const v1, 0x7f14129d

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Ln1h;->n(Landroid/view/View;II)V

    iget-object v0, p0, Lxzg;->e:Lp0h;

    iget-object v1, v0, Lp0h;->e:Lkze;

    new-instance v3, Lhze;

    invoke-direct {v3, p0}, Lhze;-><init>(Lxzg;)V

    invoke-virtual {v1, p0, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v1, v0, Lp0h;->f:Lkze;

    new-instance v3, Lqzg;

    invoke-direct {v3, p0, v2}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p0, v3}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v4, Lghf;

    iget-object v1, p0, Lxzg;->h:Lei;

    iget-object v3, v1, Lei;->h:Landroid/view/View;

    move-object v5, v3

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    iget-object v3, v1, Lei;->e:Landroid/view/View;

    move-object v6, v3

    check-cast v6, Landroidx/constraintlayout/widget/Group;

    iget-object v1, v1, Lei;->g:Landroid/view/View;

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/FadingScrollView;

    iget-object v9, v0, Lp0h;->g:Lkze;

    iget-object v10, v0, Lp0h;->e:Lkze;

    iget-object v8, p0, Lxzg;->f:Lwzg;

    move-object v11, p0

    invoke-direct/range {v4 .. v11}, Lghf;-><init>(Landroid/view/View;Landroid/view/View;Lcom/opera/android/custom_views/FadingScrollView;Lwzg;Lkze;Lkze;Lxzg;)V

    iget-object p0, v11, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->h:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    new-instance v0, Lpzg;

    const/4 v1, 0x2

    invoke-direct {v0, v11, v1}, Lpzg;-><init>(Lxzg;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v11, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    new-instance v0, Lpzg;

    const/4 v1, 0x3

    invoke-direct {v0, v11, v1}, Lpzg;-><init>(Lxzg;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, v11, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->i:Landroid/view/View;

    check-cast p0, Landroid/widget/TextSwitcher;

    new-instance v0, Lpzg;

    const/4 v3, 0x4

    invoke-direct {v0, v11, v3}, Lpzg;-><init>(Lxzg;B)V

    invoke-virtual {p0, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v11}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    iget-object p0, p0, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p0, v11}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v11}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    new-instance v3, Lf0h;

    iget-boolean v8, v11, Lxzg;->m:Z

    iget-object v9, v11, Lxzg;->k:Lgjm;

    iget-object v4, v11, Lxzg;->d:Lumi;

    iget-object v5, v11, Lxzg;->e:Lp0h;

    iget-object v6, v11, Lxzg;->f:Lwzg;

    iget-object v7, v11, Lxzg;->j:Lx5f;

    invoke-direct/range {v3 .. v9}, Lf0h;-><init>(Lumi;Lp0h;Lwzg;Lx5f;ZLgjm;)V

    invoke-static {p0, v3, v2}, Lxzg;->j0(Landroidx/fragment/app/w;Lj83;Z)V

    iget-object p0, v11, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v0, Lkkf;

    invoke-direct {v0, v11, v1}, Lkkf;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v1

    if-eqz v1, :cond_a2

    invoke-static {v1, p0, v0}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_a2
    invoke-virtual {v11}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "privacy_monitor.shown"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void
.end method

.method public final k0(Ljava/lang/String;Lnwi;)V
    .registers 16

    iget-object p0, p0, Lxzg;->h:Lei;

    iget-object p0, p0, Lei;->d:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f0402eb

    const v2, 0x7f060b0b

    invoke-static {v1, v0, v2}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v1

    const v2, 0x7f04021f

    const v3, 0x7f060ade

    invoke-static {v2, v0, v3}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v2

    const v3, 0x1010038

    const v4, 0x7f0600b2

    invoke-static {v3, v0, v4}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    move-result v0

    invoke-virtual {p1}, Ljava/lang/String;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lkpm;->a(Ljava/lang/String;)Lkpm;

    move-result-object v3

    iget v4, v3, Lkpm;->a:I

    iget v5, v3, Lkpm;->b:I

    add-int v6, v4, v5

    iget v7, v3, Lkpm;->c:I

    iget v3, v3, Lkpm;->d:I

    add-int v8, v7, v3

    new-instance v9, Landroid/text/SpannableStringBuilder;

    invoke-direct {v9, p1}, Landroid/text/SpannableStringBuilder;-><init>(Ljava/lang/CharSequence;)V

    const-string v10, "data"

    const/16 v11, 0x21

    if-lez v5, :cond_a4

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_84

    const/4 v12, 0x1

    if-eq p2, v12, :cond_73

    const/4 v1, 0x2

    if-eq p2, v1, :cond_84

    const/4 v1, 0x3

    if-ne p2, v1, :cond_9a

    new-instance p2, Llpm;

    invoke-direct {p2, v2}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v9, p2, v4, v6, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance p2, Lmpm;

    invoke-direct {p2}, Landroid/text/style/StrikethroughSpan;-><init>()V

    invoke-virtual {v9, p2, v4, v6, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_9a

    :cond_73
    new-instance p2, Llpm;

    invoke-direct {p2, v1}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v9, p2, v4, v6, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    new-instance p2, Ljpm;

    invoke-direct {p2, v12}, Landroid/text/style/StyleSpan;-><init>(I)V

    invoke-virtual {v9, p2, v4, v6, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_9a

    :cond_84
    invoke-virtual {p1, v4, v6}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v10, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-nez p2, :cond_9a

    new-instance p2, Llpm;

    invoke-direct {p2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v9, p2, v4, v6, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_9a
    :goto_9a
    if-lez v3, :cond_a4

    new-instance p2, Llpm;

    invoke-direct {p2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {v9, p2, v6, v7, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_a4
    if-lez v3, :cond_b3

    new-instance p2, Llpm;

    invoke-direct {p2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v9, p2, v8, p1, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    goto :goto_cf

    :cond_b3
    if-lez v5, :cond_cf

    invoke-virtual {p1, v4, v6}, Ljava/lang/String;->subSequence(II)Ljava/lang/CharSequence;

    move-result-object p2

    invoke-interface {p2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {v10, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_cf

    new-instance p2, Llpm;

    invoke-direct {p2, v0}, Landroid/text/style/ForegroundColorSpan;-><init>(I)V

    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result p1

    invoke-virtual {v9, p2, v6, p1, v11}, Landroid/text/SpannableStringBuilder;->setSpan(Ljava/lang/Object;III)V

    :cond_cf
    :goto_cf
    invoke-virtual {p0, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final onBackStackChanged()V
    .registers 5

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v0}, Landroidx/fragment/app/w;->J()I

    move-result v0

    if-nez v0, :cond_e

    invoke-virtual {p0}, Landroidx/fragment/app/i;->dismiss()V

    return-void

    :cond_e
    iget-object v1, p0, Lxzg;->h:Lei;

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v3, :cond_1e

    iget-object v0, v1, Lei;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    goto :goto_25

    :cond_1e
    iget-object v0, v1, Lei;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_25
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const v1, 0x7f0a04d1

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->E(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    instance-of v0, v0, Li0h;

    iget-object v1, p0, Lxzg;->h:Lei;

    if-eqz v0, :cond_4f

    iget-object v0, v1, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    const v1, 0x7f141139

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lxzg;->h:Lei;

    iget-object v0, v0, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lpzg;

    invoke-direct {v1, p0, v2}, Lpzg;-><init>(Lxzg;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void

    :cond_4f
    iget-object v0, v1, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    const v1, 0x7f1410a4

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Lxzg;->h:Lei;

    iget-object v0, v0, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lpzg;

    invoke-direct {v1, p0, v3}, Lpzg;-><init>(Lxzg;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getChildFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v0, v0, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    const/4 v0, 0x0

    iput-object v0, p0, Lxzg;->h:Lei;

    iput-object v0, p0, Lxzg;->g:Landroid/view/ViewGroup;

    invoke-super {p0}, Luim;->onDestroy()V

    return-void
.end method
