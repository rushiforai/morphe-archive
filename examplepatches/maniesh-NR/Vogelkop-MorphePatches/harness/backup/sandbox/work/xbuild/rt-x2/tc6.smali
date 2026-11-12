.class public final Ltc6;
.super Li93;
.source "SourceFile"

# interfaces
.implements Ljbl;
.implements Lp5j;


# instance fields
.field public A:Z

.field public final t:Lbi;

.field public final u:Lcom/opera/android/settings/SettingsManager;

.field public final v:Lydn;

.field public final w:Lorm;

.field public final x:Lxi5;

.field public final y:Lz77;

.field public z:Ly83;


# direct methods
.method public constructor <init>(Lcom/opera/android/settings/SettingsManager;Lydn;Lorm;Lxi5;Lz77;Ld8j;)V
    .registers 9

    const v0, 0x7f140fbe

    const v1, 0x7f100014

    invoke-direct {p0, v0, v1}, Li93;-><init>(II)V

    iput-object p1, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    iput-object p2, p0, Ltc6;->v:Lydn;

    iput-object p3, p0, Ltc6;->w:Lorm;

    iput-object p4, p0, Ltc6;->x:Lxi5;

    iput-object p5, p0, Ltc6;->y:Lz77;

    invoke-static {p6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance p1, Lbi;

    const/4 p2, 0x1

    invoke-direct {p1, p6, p2}, Lbi;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ltc6;->t:Lbi;

    return-void
.end method


# virtual methods
.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Ltc6;->t:Lbi;

    return-object p0
.end method

.method public final H0()V
    .registers 8

    iget-object v0, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "compression"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    iget-object v1, p0, Ltc6;->z:Ly83;

    iget-object v1, v1, Ly83;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    invoke-virtual {v1, v0}, Landroid/view/View;->setEnabled(Z)V

    iget-object v1, p0, Ltc6;->z:Ly83;

    iget-object v1, v1, Ly83;->h:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/GraphView;

    iget-object v2, p0, Ltc6;->x:Lxi5;

    invoke-virtual {v2}, Lxi5;->c()Lui5;

    move-result-object v2

    invoke-virtual {v2}, Lui5;->g()J

    move-result-wide v2

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    const/4 v3, 0x0

    if-nez v2, :cond_2d

    const/4 v4, 0x4

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    goto :goto_30

    :cond_2d
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_30
    iget-object v4, p0, Ltc6;->z:Ly83;

    if-eqz v0, :cond_5f

    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    const/4 v5, 0x3

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    iget-object v4, p0, Ltc6;->z:Ly83;

    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    new-instance v5, Lrxh;

    const v6, 0x7f140fbd

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    iget-object v4, p0, Ltc6;->z:Ly83;

    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    new-instance v5, Lrxh;

    const v6, 0x7f14053d

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    goto :goto_88

    :cond_5f
    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/BigSwitchButton;->d(I)V

    iget-object v4, p0, Ltc6;->z:Ly83;

    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    new-instance v5, Lrxh;

    const v6, 0x7f140fbb

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->b(Lpxh;)V

    iget-object v4, p0, Ltc6;->z:Ly83;

    iget-object v4, v4, Ly83;->c:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/BigSwitchButton;

    new-instance v5, Lrxh;

    const v6, 0x7f140539

    invoke-direct {v5, v6}, Lrxh;-><init>(I)V

    invoke-virtual {v4, v5}, Lcom/opera/android/settings/BigSwitchButton;->c(Lpxh;)V

    :goto_88
    iget-object v4, p0, Ltc6;->z:Ly83;

    iget-object v4, v4, Ly83;->f:Ljava/lang/Object;

    check-cast v4, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {v4, v0}, Lcom/opera/android/settings/SettingsStatisticView;->setActivated(Z)V

    invoke-virtual {p0}, Ltc6;->I0()V

    const v0, 0x7f0a08e5

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    if-lez v2, :cond_9e

    const/4 v3, 0x1

    :cond_9e
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    new-instance v0, Lfh4;

    const/16 v2, 0xf

    invoke-direct {v0, p0, v1, v2}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v0}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    return-void
.end method

.method public final I0()V
    .registers 7

    iget-object v0, p0, Ltc6;->z:Ly83;

    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object v1, p0, Ltc6;->x:Lxi5;

    invoke-virtual {v1}, Lxi5;->c()Lui5;

    move-result-object v1

    invoke-virtual {v1}, Lui5;->g()J

    move-result-wide v2

    iget-boolean v4, p0, Ltc6;->A:Z

    iget-object v5, p0, Ltc6;->z:Ly83;

    if-eqz v4, :cond_3b

    iget-object v0, v5, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-virtual {v1}, Lui5;->f()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v2, 0x7f140544

    invoke-virtual {p0, v2, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object v0, v0, Lq5g;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_3b
    iget-object p0, v5, Ly83;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/settings/SettingsStatisticView;

    invoke-static {v2, v3, v0}, Laik;->h(JLandroid/content/Context;)Ljava/lang/String;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/settings/SettingsStatisticView;->f:Lq5g;

    iget-object p0, p0, Lq5g;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final J0()V
    .registers 7

    iget-object v0, p0, Ltc6;->v:Lydn;

    iget-object v1, v0, Lydn;->d:Lvdn;

    iget-boolean v1, v1, Lvdn;->a:Z

    const/16 v2, 0x8

    const/4 v3, 0x0

    const-string v4, "compression"

    iget-object v5, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    if-eqz v1, :cond_1f

    iget-object v0, v0, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    if-nez v0, :cond_1f

    invoke-virtual {v5, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1f

    move v0, v3

    goto :goto_20

    :cond_1f
    move v0, v2

    :goto_20
    iget-object v1, p0, Ltc6;->z:Ly83;

    iget-object v1, v1, Ly83;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-virtual {v1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ltc6;->z:Ly83;

    iget-object v0, v0, Ly83;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v5, v4}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_36

    move v2, v3

    :cond_36
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5}, Lcom/opera/android/settings/SettingsManager;->getTurboImageQualityMode()I

    move-result v1

    const/4 v2, 0x1

    sget-object v3, Lm7j;->b:Lm7j;

    if-eq v1, v2, :cond_53

    const/4 v2, 0x2

    if-eq v1, v2, :cond_51

    const/4 v2, 0x3

    if-eq v1, v2, :cond_4e

    const/4 v2, 0x4

    if-ne v1, v2, :cond_53

    sget-object v3, Lm7j;->e:Lm7j;

    goto :goto_53

    :cond_4e
    sget-object v3, Lm7j;->d:Lm7j;

    goto :goto_53

    :cond_51
    sget-object v3, Lm7j;->c:Lm7j;

    :cond_53
    :goto_53
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    iget v1, v3, Lm7j;->a:I

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-static {v0, p0}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    return-void
.end method

.method public final M(Ljava/lang/String;)V
    .registers 3

    invoke-virtual {p0}, Ltc6;->J0()V

    const-string v0, "compression"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_e

    invoke-virtual {p0}, Ltc6;->H0()V

    :cond_e
    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 5

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    iget-object p1, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p1, p0}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_2c

    const-string v0, "extra_show_free_data_dialog"

    const/4 v1, 0x0

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    if-eqz v2, :cond_2c

    invoke-virtual {p1, v0}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    const-string v0, "extra_enable_compression"

    invoke-virtual {p1, v0, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Ly73;

    invoke-direct {v1, p0, p1}, Ly73;-><init>(Ltc6;Z)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    :cond_2c
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Lltl;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Ltc6;->H0()V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ltc6;->z:Ly83;

    return-void
.end method

.method public final onDetach()V
    .registers 2

    iget-object v0, p0, Ltc6;->u:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v0, p0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    invoke-super {p0}, Lk24;->onDetach()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a08e5

    if-ne p1, v0, :cond_2e

    new-instance p1, Lol5;

    new-instance v0, Ljl4;

    const/16 v2, 0x1a

    invoke-direct {v0, p0, v2}, Ljl4;-><init>(Ljava/lang/Object;B)V

    const v2, 0x7f14043a

    const v3, 0x7f140436

    invoke-direct {p1, v2, v3, v0}, Lol5;-><init>(IILnl5;)V

    iget-object p0, p0, Ltc6;->y:Lz77;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, v0}, Lr22;->b(Ljjm;Lijm;)V

    return v1

    :cond_2e
    const/4 p0, 0x0

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->h:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/widget/GraphView;

    new-instance p2, Lpc5;

    invoke-direct {p2, p0, p1}, Lpc5;-><init>(Ltc6;Lcom/opera/android/widget/GraphView;)V

    invoke-static {p1, p2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {p2, p1}, Lpc5;->a(Landroid/view/View;)V

    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/BigSwitchButton;

    new-instance p2, Lsc6;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lsc6;-><init>(Ltc6;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Ltc6;->J0()V

    invoke-virtual {p0}, Ltc6;->H0()V

    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/SettingsStatisticView;

    new-instance p2, Lsc6;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lsc6;-><init>(Ltc6;B)V

    invoke-virtual {p1, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->d:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance p2, Lnf;

    const/16 v0, 0x1d

    invoke-direct {p2, p0, p1, v0}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p0, Ltc6;->z:Ly83;

    iget-object p1, p1, Ly83;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/settings/BigSwitchButton;

    invoke-virtual {p1}, Lcom/opera/android/settings/BigSwitchButton;->jumpDrawablesToCurrentState()V

    iget-object p0, p0, Ltc6;->z:Ly83;

    iget-object p0, p0, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p0, Landroid/widget/LinearLayout;

    new-instance p1, Landroid/animation/LayoutTransition;

    invoke-direct {p1}, Landroid/animation/LayoutTransition;-><init>()V

    invoke-virtual {p0, p1}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    return-void
.end method

.method public final v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V
    .registers 13

    invoke-super {p0, p1, p2}, Lltl;->v0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    const v0, 0x7f0d0384

    const/4 v1, 0x0

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-virtual {p2, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p2, 0x7f0a0158

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/settings/BigSwitchButton;

    if-eqz v3, :cond_63

    const p2, 0x7f0a0258

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v4, :cond_63

    const p2, 0x7f0a02bc

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v5, :cond_63

    const p2, 0x7f0a02bd

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/settings/SettingsStatisticView;

    if-eqz v6, :cond_63

    const p2, 0x7f0a0553

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/custom_views/LayoutDirectionFrameLayout;

    if-eqz v7, :cond_63

    const p2, 0x7f0a091d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/widget/GraphView;

    if-eqz v8, :cond_63

    new-instance v1, Ly83;

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const/16 v9, 0xa

    invoke-direct/range {v1 .. v9}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v1, p0, Ltc6;->z:Ly83;

    return-void

    :cond_63
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

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "data-savings"

    return-object p0
.end method
