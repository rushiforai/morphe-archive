.class public final Lwk;
.super Li93;
.source "SourceFile"

# interfaces
.implements Lp5j;
.implements Lo37;


# instance fields
.field public final A:Ljava/util/ArrayList;

.field public final B:Lua7;

.field public C:Lrf2;

.field public D:Z

.field public final t:Luk;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Ltk;

.field public final w:Lbi;

.field public final x:Ltni;

.field public final y:Lxi5;

.field public final z:Lrj;


# direct methods
.method public constructor <init>(Lgjm;Lcom/opera/android/settings/SettingsManager;Ltni;Lxi5;Ld8j;Lrj;)V
    .registers 11

    const v0, 0x7f140f50

    const v1, 0x7f10002f

    const/4 v2, 0x2

    const/4 v3, 0x0

    invoke-direct {p0, v0, v1, v2, v3}, Li93;-><init>(IIIZ)V

    new-instance v0, Luk;

    invoke-direct {v0, p0, v3}, Luk;-><init>(Li93;B)V

    iput-object v0, p0, Lwk;->t:Luk;

    new-instance v0, Ltk;

    invoke-direct {v0, p0, v3}, Ltk;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwk;->v:Ltk;

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lwk;->A:Ljava/util/ArrayList;

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Lwk;->B:Lua7;

    iput-object p2, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p3, p0, Lwk;->x:Ltni;

    iput-object p4, p0, Lwk;->y:Lxi5;

    iput-object p6, p0, Lwk;->z:Lrj;

    invoke-static {p5}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lbi;

    const/4 p2, 0x1

    invoke-direct {p1, p5, p2}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lwk;->w:Lbi;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lwk;->w:Lbi;

    return-object p0
.end method

.method public final H0()V
    .registers 10

    iget-object v0, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "ad_blocking"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz v0, :cond_12

    iget-boolean v0, p0, Lwk;->D:Z

    if-eqz v0, :cond_12

    move v0, v1

    goto :goto_13

    :cond_12
    move v0, v2

    :goto_13
    iget-object v3, p0, Lwk;->C:Lrf2;

    iget-object v3, v3, Lrf2;->b:Ljava/lang/Object;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v3, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v3, p0, Lwk;->C:Lrf2;

    iget-object v3, v3, Lrf2;->f:Landroid/view/View;

    check-cast v3, Lcom/opera/android/settings/SettingsStatisticView;

    iget-object v4, p0, Lwk;->y:Lxi5;

    invoke-virtual {v4}, Lxi5;->b()J

    move-result-wide v5

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v7

    invoke-virtual {v7, v5, v6}, Ljava/text/NumberFormat;->format(J)Ljava/lang/String;

    move-result-object v7

    iget-object v8, v3, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v8, v8, Lq5g;->d:Ljava/lang/Object;

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v8, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsStatisticView;->setActivated(Z)V

    iget-object v0, p0, Lwk;->C:Lrf2;

    iget-object v0, v0, Lrf2;->k:Landroid/view/View;

    check-cast v0, Lcom/opera/android/widget/GraphView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v7, 0x7f0404e7

    const v8, 0x7f0600a8

    invoke-static {v7, v3, v8}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/opera/android/widget/GraphView;->i:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Landroid/view/View;->invalidate()V

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v7, 0x7f0404e5

    invoke-static {v7, v3, v8}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v3

    iput-object v3, v0, Lcom/opera/android/widget/GraphView;->h:Landroid/content/res/ColorStateList;

    invoke-virtual {v0}, Lcom/opera/android/widget/GraphView;->a()V

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-lez v3, :cond_6d

    move v3, v2

    goto :goto_6e

    :cond_6d
    const/4 v3, 0x4

    :goto_6e
    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    new-instance v3, Lxa;

    const/4 v5, 0x2

    invoke-direct {v3, p0, v0, v5}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v0, v3}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    const v0, 0x7f0a08e5

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-virtual {v4}, Lxi5;->b()J

    move-result-wide v3

    cmp-long v0, v3, v7

    if-gtz v0, :cond_8a

    move v1, v2

    :cond_8a
    invoke-interface {p0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final I0()V
    .registers 14

    const-string v0, "ad_blocking"

    iget-object v1, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v1, v0}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-eqz v0, :cond_12

    iget-boolean v0, p0, Lwk;->D:Z

    if-eqz v0, :cond_12

    move v0, v2

    goto :goto_13

    :cond_12
    move v0, v3

    :goto_13
    iget-object v4, p0, Lwk;->C:Lrf2;

    iget-object v4, v4, Lrf2;->g:Landroid/view/View;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    const/4 v5, 0x3

    if-eqz v0, :cond_1e

    move v6, v5

    goto :goto_1f

    :cond_1e
    move v6, v3

    :goto_1f
    invoke-virtual {v4, v6}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v6, Lnf;

    const/4 v7, 0x2

    invoke-direct {v6, p0, v4, v7}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, p0, Lwk;->C:Lrf2;

    iget-object v6, v4, Lrf2;->i:Ljava/lang/Object;

    check-cast v6, Lcom/opera/android/custom_views/SeparatorView;

    iget-object v8, v4, Lrf2;->e:Landroid/view/View;

    check-cast v8, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v9, v4, Lrf2;->h:Landroid/view/View;

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v10, v4, Lrf2;->j:Landroid/view/View;

    check-cast v10, Lcom/opera/android/custom_views/SeparatorView;

    iget-object v4, v4, Lrf2;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v11, 0x5

    new-array v12, v11, [Landroid/view/View;

    aput-object v6, v12, v3

    aput-object v8, v12, v2

    aput-object v9, v12, v7

    aput-object v10, v12, v5

    const/4 v6, 0x4

    aput-object v4, v12, v6

    move v4, v3

    :goto_50
    const/16 v6, 0x8

    if-ge v4, v11, :cond_5f

    aget-object v8, v12, v4

    if-eqz v0, :cond_59

    move v6, v3

    :cond_59
    invoke-virtual {v8, v6}, Landroid/view/View;->setVisibility(I)V

    add-int/lit8 v4, v4, 0x1

    goto :goto_50

    :cond_5f
    iget-object v4, p0, Lwk;->C:Lrf2;

    if-eqz v0, :cond_d7

    iget-object v4, v4, Lrf2;->g:Landroid/view/View;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v5, Lrxh;

    const v8, 0x7f140f51

    invoke-direct {v5, v8}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    new-instance v5, Lrxh;

    const v8, 0x7f1400d3

    invoke-direct {v5, v8}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    iget-object v4, p0, Lwk;->C:Lrf2;

    iget-object v4, v4, Lrf2;->e:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->b()La7j;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/Enum;->ordinal()I

    move-result v5

    if-eqz v5, :cond_ad

    if-eq v5, v2, :cond_a4

    if-ne v5, v7, :cond_9d

    new-instance v5, Lrxh;

    const v8, 0x7f140092

    invoke-direct {v5, v8}, Lrxh;-><init>(I)V

    goto :goto_b5

    :cond_9d
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_a4
    new-instance v5, Lrxh;

    const v8, 0x7f140094

    invoke-direct {v5, v8}, Lrxh;-><init>(I)V

    goto :goto_b5

    :cond_ad
    new-instance v5, Lrxh;

    const v8, 0x7f14008e

    invoke-direct {v5, v8}, Lrxh;-><init>(I)V

    :goto_b5
    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    new-instance v5, Lrk;

    invoke-direct {v5, p0, v2}, Lrk;-><init>(Lwk;B)V

    invoke-virtual {v4, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v4, p0, Lwk;->C:Lrf2;

    iget-object v4, v4, Lrf2;->h:Landroid/view/View;

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const-string v5, "banner_blocker"

    invoke-virtual {v1, v5}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    invoke-virtual {v4, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setChecked(Z)V

    new-instance v1, Lbi;

    invoke-direct {v1, p0, v7}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    goto :goto_f4

    :cond_d7
    iget-object v1, v4, Lrf2;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    new-instance v4, Lrxh;

    const v5, 0x7f140f4f

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    new-instance v4, Lrxh;

    const v5, 0x7f1400d2

    invoke-direct {v4, v5}, Lrxh;-><init>(I)V

    invoke-virtual {v1, v4}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    :goto_f4
    iget-object p0, p0, Lwk;->C:Lrf2;

    iget-object p0, p0, Lrf2;->e:Landroid/view/View;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-array v1, v2, [Landroid/view/View;

    aput-object p0, v1, v3

    aget-object p0, v1, v3

    if-nez v0, :cond_103

    move v3, v6

    :cond_103
    invoke-virtual {p0, v3}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    const-string v0, "ad_blocking"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "banner_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "tracker_blocker"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_21

    const-string v0, "ad_blocking_mode"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_21

    return-void

    :cond_21
    invoke-virtual {p0}, Lwk;->I0()V

    invoke-virtual {p0}, Lwk;->H0()V

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Lwk;->A:Ljava/util/ArrayList;

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

    iget-object v0, p0, Lwk;->t:Luk;

    iget-object v1, p0, Lwk;->y:Lxi5;

    iget-object v1, v1, Lxi5;->i:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lwk;->x:Ltni;

    iget-object v1, p0, Lwk;->v:Ltk;

    invoke-virtual {v0, v1}, Ltni;->c(Lsni;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lwk;->C:Lrf2;

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

    if-ne p1, v0, :cond_2b

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p1

    new-instance v0, Lsk;

    invoke-direct {v0, p0, v2}, Lsk;-><init>(Ljava/lang/Object;B)V

    const v3, 0x7f140f4d

    const v4, 0x7f140f4e

    invoke-static {p1, v2, v3, v4, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    move-result-object p1

    iget-object p0, p0, Lwk;->A:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return v1

    :cond_2b
    return v2
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lwk;->x:Ltni;

    iget-object p2, p0, Lwk;->v:Ltk;

    invoke-virtual {p1, p2}, Ltni;->a(Lsni;)V

    iget-object p1, p0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    iget-object p1, p0, Lwk;->t:Luk;

    iget-object p2, p0, Lwk;->y:Lxi5;

    iget-object p2, p2, Lxi5;->i:Lh7f;

    invoke-virtual {p2, p1}, Lh7f;->b(Ljava/lang/Object;)Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    const/4 p1, 0x1

    iput-boolean p1, p0, Lwk;->D:Z

    iget-object p1, p0, Lwk;->C:Lrf2;

    iget-object p1, p1, Lrf2;->b:Ljava/lang/Object;

    check-cast p1, Landroid/widget/FrameLayout;

    new-instance p2, Lu7;

    const/4 v0, 0x3

    invoke-direct {p2, p0, v0}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v0

    if-eqz v0, :cond_33

    invoke-static {v0, p1, p2}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_33
    iget-object p1, p0, Lwk;->C:Lrf2;

    iget-object p1, p1, Lrf2;->c:Landroid/view/View;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lrk;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lrk;-><init>(Lwk;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Lwk;->I0()V

    invoke-virtual {p0}, Lwk;->H0()V

    iget-object p1, p0, Lwk;->C:Lrf2;

    iget-object p1, p1, Lrf2;->g:Landroid/view/View;

    check-cast p1, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p1}, Lcom/opera/android/settings/BigSwitchButton;->jumpDrawablesToCurrentState()V

    iget-object p1, p0, Lwk;->C:Lrf2;

    iget-object p1, p1, Lrf2;->d:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance p2, Landroid/animation/LayoutTransition;

    invoke-direct {p2}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p1, p2}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    iget-object p0, p0, Li93;->s:Lrn9;

    invoke-virtual {p0}, Lrn9;->F()V

    return-void
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Lwk;->B:Lua7;

    return-object p0
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 15

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v0, 0x7f0d037e

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0073

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v3, :cond_90

    const p2, 0x7f0a0085

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_90

    const p2, 0x7f0a0086

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v5, :cond_90

    const p2, 0x7f0a0158

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/settings/BigSwitchButton;

    if-eqz v6, :cond_90

    const p2, 0x7f0a015b

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v7, :cond_90

    const p2, 0x7f0a028e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v8, :cond_90

    const p2, 0x7f0a03c4

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v9, v0

    check-cast v9, Lcom/opera/android/custom_views/SeparatorView;

    if-eqz v9, :cond_90

    const p2, 0x7f0a0553

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v10, v0

    check-cast v10, Landroid/widget/FrameLayout;

    if-eqz v10, :cond_90

    const p2, 0x7f0a059b

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v0, :cond_90

    const p2, 0x7f0a0c6a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lcom/opera/android/widget/GraphView;

    if-eqz v11, :cond_90

    new-instance v1, Lrf2;

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-direct/range {v1 .. v11}, Lrf2;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/settings/SettingsStatisticView;Lcom/opera/android/settings/BigSwitchButton;Lcom/opera/android/ui/catalog/widget/OperaListItem;Lcom/opera/android/custom_views/SeparatorView;Lcom/opera/android/custom_views/SeparatorView;Landroid/widget/FrameLayout;Lcom/opera/android/widget/GraphView;)V

    iput-object v1, p0, Lwk;->C:Lrf2;

    return-void

    :cond_90
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
