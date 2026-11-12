.class public final Lwyl;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lp5j;


# instance fields
.field public A:Z

.field public final t:Luk;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Ltni;

.field public final w:Ltk;

.field public final x:Ljava/util/ArrayList;

.field public final y:Lcrk;

.field public z:Lpt1;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Ltni;)V
    .registers 5

    const v0, 0x7f1412d8

    const v1, 0x7f10002f

    invoke-direct {p0, v0, v1}, Li93;-><init>(II)V

    new-instance v0, Luk;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Luk;-><init>(Li93;B)V

    iput-object v0, p0, Lwyl;->t:Luk;

    new-instance v0, Ltk;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Ltk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwyl;->w:Ltk;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwyl;->x:Ljava/util/ArrayList;

    new-instance v0, Lcrk;

    const/16 v1, 0x14

    invoke-direct {v0, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwyl;->y:Lcrk;

    iput-object p1, p0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Lwyl;->v:Ltni;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lwyl;->y:Lcrk;

    return-object p0
.end method

.method public final H0()V
    .registers 9

    iget-object v0, p0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "tracker_blocker"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_12

    iget-boolean v0, p0, Lwyl;->A:Z

    if-eqz v0, :cond_12

    move v0, v1

    goto :goto_13

    :cond_12
    move v0, v2

    :goto_13
    iget-object v3, p0, Lwyl;->z:Lpt1;

    iget-object v3, v3, Lpt1;->b:Landroid/view/View;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v3, p0, Lwyl;->z:Lpt1;

    iget-object v3, v3, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v4

    invoke-virtual {v4}, Lxi5;->e()J

    move-result-wide v4

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v6

    invoke-virtual {v6, v4, v5}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v6

    iget-object v7, v3, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v7, v7, Lq5g;->d:Ljava/lang/Object;

    check-cast v7, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v7, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsStatisticView;->setActivated(Z)V

    iget-object v0, p0, Lwyl;->z:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/GraphView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f0404e7

    const v7, 0x7f0600a8

    invoke-static {v6, v3, v7}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/opera/android/widget/GraphView;->i:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v6, 0x7f0404e5

    invoke-static {v6, v3, v7}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/opera/android/widget/GraphView;->h:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Lcom/opera/android/widget/GraphView;->a()V

    const-wide/16 v6, 0x0

    cmp-long v3, v4, v6

    if-lez v3, :cond_73

    move v3, v2

    goto :goto_74

    :cond_73
    const/4 v3, 0x4

    :goto_74
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v3, Lcbl;

    const/16 v4, 0x10

    invoke-direct {v3, v0, v4}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v3}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    const v0, 0x7f0a08e5

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object p0

    invoke-virtual {p0}, Lxi5;->e()J

    move-result-wide v3

    cmp-long p0, v3, v6

    if-gtz p0, :cond_99

    move v1, v2

    :cond_99
    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final I0()V
    .registers 8

    iget-object v0, p0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "tracker_blocker"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_12

    iget-boolean v0, p0, Lwyl;->A:Z

    if-eqz v0, :cond_12

    move v0, v1

    goto :goto_13

    :cond_12
    move v0, v2

    :goto_13
    iget-object v3, p0, Lwyl;->z:Lpt1;

    iget-object v3, v3, Lpt1;->d:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/settings/BigSwitchButton;

    const/4 v4, 0x3

    if-eqz v0, :cond_1e

    move v5, v4

    goto :goto_1f

    :cond_1e
    move v5, v2

    :goto_1f
    invoke-virtual {v3, v5}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v5, Lj5g;

    const/16 v6, 0x16

    invoke-direct {v5, p0, v3, v6}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v3, p0, Lwyl;->z:Lpt1;

    iget-object v3, v3, Lpt1;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-array v1, v1, [Landroid/view/View;

    aput-object v3, v1, v2

    aget-object v1, v1, v2

    if-eqz v0, :cond_3c

    move v3, v2

    goto :goto_3e

    :cond_3c
    const/16 v3, 0x8

    :goto_3e
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lwyl;->z:Lpt1;

    if-eqz v0, :cond_63

    iget-object p0, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p0, v4}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v0, Lrxh;

    const v1, 0x7f1410d4

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    new-instance v0, Lrxh;

    const v1, 0x7f140d4e

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    return-void

    :cond_63
    iget-object p0, p0, Lpt1;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p0, v2}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v0, Lrxh;

    const v1, 0x7f1410d3

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    new-instance v0, Lrxh;

    const v1, 0x7f140691

    invoke-direct {v0, v1}, Lrxh;-><init>(I)V

    invoke-virtual {p0, v0}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "tracker_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Lwyl;->I0()V

    invoke-virtual {p0}, Lwyl;->H0()V

    :cond_e
    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Lwyl;->x:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1a

    invoke-virtual {p0, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lb87;

    sget-object v3, Lhjm;->b:Lhjm;

    invoke-interface {v2, v3}, Ljjm;->finish(Lhjm;)V

    goto :goto_a

    :cond_1a
    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lxi5;->a(Landroid/content/Context;)Lxi5;

    move-result-object v0

    iget-object v1, p0, Lwyl;->t:Luk;

    iget-object v0, v0, Lxi5;->i:Lh7f;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lwyl;->v:Ltni;

    iget-object v1, p0, Lwyl;->w:Ltk;

    invoke-virtual {v0, v1}, Ltni;->c(Lsni;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lwyl;->z:Lpt1;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08e5

    const/4 v2, 0x0

    if-ne p1, v0, :cond_2d

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lsk;

    const/16 v3, 0xd

    invoke-direct {v0, p0, v3}, Lsk;-><init>(Ljava/lang/Object;B)V

    const v3, 0x7f1410ce

    const v4, 0x7f1410cf

    invoke-static {p1, v2, v3, v4, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    move-result-object p1

    iget-object p0, p0, Lwyl;->x:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return v1

    :cond_2d
    return v2
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lwyl;->v:Ltni;

    iget-object p2, p0, Lwyl;->w:Ltk;

    invoke-virtual {p1, p2}, Ltni;->a(Lsni;)V

    iget-object p1, p0, Lwyl;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwyl;->A:Z

    iget-object p1, p0, Lwyl;->z:Lpt1;

    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p2, Lsvk;

    const/16 v0, 0x9

    invoke-direct {p2, p0, v0}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_2b

    invoke-static {v0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_2b
    iget-object p1, p0, Lwyl;->z:Lpt1;

    iget-object p1, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lic;

    const/16 v0, 0xf

    invoke-direct {p2, p0, v0}, Lic;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lwyl;->I0()V

    invoke-virtual {p0}, Lwyl;->H0()V

    iget-object p1, p0, Lwyl;->z:Lpt1;

    iget-object p1, p1, Lpt1;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p1}, Lcom/opera/android/settings/BigSwitchButton;->jumpDrawablesToCurrentState()V

    iget-object p0, p0, Lwyl;->z:Lpt1;

    iget-object p0, p0, Lpt1;->g:Landroid/view/View;

    check-cast p0, Landroid/widget/LinearLayout;

    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 11

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v0, 0x7f0d0396

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0158

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/settings/BigSwitchButton;

    if-eqz v3, :cond_55

    const p2, 0x7f0a0553

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_55

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const p2, 0x7f0a0bda

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_55

    const p2, 0x7f0a0bdc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v6, :cond_55

    const p2, 0x7f0a0c6a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/widget/GraphView;

    if-eqz v7, :cond_55

    new-instance v1, Lpt1;

    invoke-direct/range {v1 .. v7}, Lpt1;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/settings/BigSwitchButton;Landroid/widget/FrameLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/settings/SettingsStatisticView;Lcom/opera/android/widget/GraphView;)V

    iput-object v1, p0, Lwyl;->z:Lpt1;

    return-void

    :cond_55
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
