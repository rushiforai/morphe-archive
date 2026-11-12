.class public final Lvrl;
.super Lk8;
.source "SourceFile"

# interfaces
.implements Ltdn;


# instance fields
.field public final o:Lydn;

.field public final p:Lxt8;

.field public final q:Li3j;

.field public final r:Lro9;


# direct methods
.method public constructor <init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;Lydn;Lxt8;Li3j;)V
    .registers 6

    invoke-direct {p0, p1, p2}, Lk8;-><init>(Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;Lcrk;)V

    iput-object p3, p0, Lvrl;->o:Lydn;

    iput-object p4, p0, Lvrl;->p:Lxt8;

    iput-object p5, p0, Lvrl;->q:Li3j;

    new-instance p2, Lro9;

    iget-object p4, p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object p4, p4, Lvs;->c:Ljava/lang/Object;

    check-cast p4, Lcom/opera/android/mainmenu/ToggleAnimationView;

    invoke-direct {p2, p4}, Lro9;-><init>(Lcom/opera/android/mainmenu/ToggleAnimationView;)V

    iput-object p2, p0, Lvrl;->r:Lro9;

    invoke-virtual {p0}, Lvrl;->u0()Z

    iget-object p2, p3, Lydn;->c:Lgfn;

    invoke-interface {p2}, Lgfn;->isEnabled()Z

    move-result p2

    iget-object p1, p1, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object p1, p1, Lvs;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean p3, p1, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-eq p2, p3, :cond_2e

    iput-boolean p2, p1, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    invoke-virtual {p1}, Ln2d;->invalidate()V

    :cond_2e
    invoke-virtual {p0}, Lvrl;->t0()V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 1

    invoke-virtual {p0}, Lvrl;->t0()V

    return-void
.end method

.method public final P()V
    .registers 3

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, p0, Lvrl;->o:Lydn;

    invoke-virtual {v0, p0}, Lydn;->A(Ltdn;)V

    return-void
.end method

.method public final W()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final isEnabled()Z
    .registers 1

    iget-object p0, p0, Lvrl;->o:Lydn;

    iget-object p0, p0, Lydn;->d:Lvdn;

    iget-boolean p0, p0, Lvdn;->a:Z

    return p0
.end method

.method public final k0(Z)V
    .registers 2

    iget-object p0, p0, Lvrl;->o:Lydn;

    invoke-virtual {p0, p1}, Lydn;->C(Z)V

    return-void
.end method

.method public final m0()Z
    .registers 6

    iget-object v0, p0, Lvrl;->p:Lxt8;

    const/4 v1, 0x0

    invoke-static {v0, v1}, Luup;->K(Lxt8;I)Z

    move-result v2

    iget-object v3, p0, Lvrl;->o:Lydn;

    invoke-virtual {v3}, Lydn;->p()Lwdn;

    move-result-object v3

    iget-boolean v3, v3, Lwdn;->e:Z

    const/4 v4, 0x1

    if-eqz v3, :cond_33

    iget-object p0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-static {p0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object p0

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lsvg;

    const/4 v3, 0x2

    invoke-virtual {p0, v3}, Lsvg;->a(I)Z

    move-result p0

    if-eqz p0, :cond_33

    invoke-static {v0, v3}, Luup;->K(Lxt8;I)Z

    move-result p0

    if-eqz p0, :cond_33

    move p0, v4

    goto :goto_34

    :cond_33
    move p0, v1

    :goto_34
    if-nez v2, :cond_39

    if-nez p0, :cond_39

    return v1

    :cond_39
    return v4
.end method

.method public final q0()V
    .registers 4

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object p0, p0, Lvrl;->o:Lydn;

    invoke-virtual {p0}, Lydn;->q()I

    move-result v1

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_4d

    const/4 v2, 0x2

    if-eq v1, v2, :cond_39

    const/4 v2, 0x3

    if-eq v1, v2, :cond_30

    iget-object p0, p0, Lydn;->d:Lvdn;

    invoke-virtual {p0}, Lvdn;->b()Z

    move-result p0

    if-eqz p0, :cond_27

    new-instance p0, Lrxh;

    const v1, 0x7f1409d4

    invoke-direct {p0, v1}, Lrxh;-><init>(I)V

    goto :goto_68

    :cond_27
    new-instance p0, Lrxh;

    const v1, 0x7f1412eb

    invoke-direct {p0, v1}, Lrxh;-><init>(I)V

    goto :goto_68

    :cond_30
    new-instance p0, Lrxh;

    const v1, 0x7f141403

    invoke-direct {p0, v1}, Lrxh;-><init>(I)V

    goto :goto_68

    :cond_39
    iget-object p0, p0, Lydn;->e:Lsgi;

    iget-boolean p0, p0, Lsgi;->d:Z

    if-eqz p0, :cond_43

    const p0, 0x7f141404

    goto :goto_46

    :cond_43
    const p0, 0x7f14117e

    :goto_46
    new-instance v1, Lrxh;

    invoke-direct {v1, p0}, Lrxh;-><init>(I)V

    move-object p0, v1

    goto :goto_68

    :cond_4d
    iget-object v1, p0, Lydn;->f:Lqq8;

    invoke-virtual {v1}, Lqq8;->g()Z

    move-result v1

    if-eqz v1, :cond_60

    iget-object p0, p0, Lydn;->f:Lqq8;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {p0, v1}, Lqq8;->f(Landroid/content/Context;)Lsxh;

    move-result-object p0

    goto :goto_68

    :cond_60
    new-instance p0, Lrxh;

    const v1, 0x7f1412ea

    invoke-direct {p0, v1}, Lrxh;-><init>(I)V

    :goto_68
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p0, v1}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    iput-object p0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->d:Ljava/lang/CharSequence;

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a()V

    return-void
.end method

.method public final r0(Lqrl;)V
    .registers 10

    iget-object p0, p0, Lvrl;->q:Li3j;

    iget-object v0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    iget-object v1, p0, Li3j;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/settings/SettingsManager;

    const-string v2, "compression"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v2

    const-string v3, "show_conflicting_settings_warning"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_57

    if-eqz v2, :cond_57

    iget-object v1, p0, Li3j;->c:Ljava/lang/Object;

    check-cast v1, Lydn;

    iget-object v1, v1, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_57

    const v1, 0x7f140548

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v3

    const v1, 0x7f141376

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-object v0, p0, Li3j;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    const v1, 0x7f1409d3

    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v0, p0, Li3j;->d:Ljava/lang/Object;

    check-cast v0, Lz77;

    new-instance v2, Lql5;

    iget-object p0, p0, Li3j;->b:Ljava/lang/Object;

    move-object v6, p0

    check-cast v6, Lcom/opera/android/settings/SettingsManager;

    move-object v7, p1

    invoke-direct/range {v2 .. v7}, Lql5;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lcom/opera/android/settings/SettingsManager;Lqrl;)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v2, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_57
    move-object v7, p1

    invoke-virtual {v7}, Lqrl;->run()V

    return-void
.end method

.method public final s()V
    .registers 3

    invoke-virtual {p0}, Lvrl;->u0()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Lvrl;->s0()V

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object p0, p0, Lvrl;->o:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    iget-object v0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v0, v0, Lvs;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-boolean v1, v0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    if-eq p0, v1, :cond_24

    iput-boolean p0, v0, Lcom/opera/android/mainmenu/ToggleAnimationView;->y:Z

    invoke-virtual {v0}, Ln2d;->invalidate()V

    :cond_24
    return-void
.end method

.method public final s0()V
    .registers 7

    sget-object v0, Lro9;->g:Lk2d;

    invoke-virtual {p0}, Lvrl;->q0()V

    iget-object v1, p0, Lvrl;->o:Lydn;

    invoke-virtual {v1}, Lydn;->q()I

    move-result v1

    iget-object v2, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-static {v1}, Lvep;->A(I)I

    move-result v3

    const/4 v4, 0x2

    const/4 v5, 0x1

    if-eq v3, v5, :cond_1b

    if-eq v3, v4, :cond_1b

    const/4 v3, 0x0

    goto :goto_1c

    :cond_1b
    move v3, v5

    :goto_1c
    iput-boolean v3, v2, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->c:Z

    invoke-virtual {v2}, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a()V

    iget-object p0, p0, Lvrl;->r:Lro9;

    iget v2, p0, Lro9;->b:I

    if-eq v1, v2, :cond_40

    iput v1, p0, Lro9;->b:I

    sget-object v2, Lro9;->f:Lk2d;

    iget-object v3, p0, Lro9;->c:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/mainmenu/ToggleAnimationView;

    iget-object v3, v3, Ln2d;->m:Lp2d;

    if-eqz v3, :cond_40

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    if-eqz v1, :cond_61

    if-eq v1, v5, :cond_4d

    if-eq v1, v4, :cond_41

    const/4 v0, 0x3

    if-eq v1, v0, :cond_61

    :cond_40
    return-void

    :cond_41
    iget-object v1, p0, Lro9;->d:Ljava/lang/Object;

    check-cast v1, Lk2d;

    if-eq v1, v2, :cond_4c

    if-eq v1, v0, :cond_4c

    invoke-virtual {p0, v2}, Lro9;->D(Lk2d;)V

    :cond_4c
    return-void

    :cond_4d
    iget-object v1, p0, Lro9;->d:Ljava/lang/Object;

    check-cast v1, Lk2d;

    if-ne v1, v0, :cond_59

    sget-object v0, Lro9;->h:Lk2d;

    invoke-virtual {p0, v0}, Lro9;->D(Lk2d;)V

    return-void

    :cond_59
    if-eq v1, v2, :cond_60

    if-eq v1, v0, :cond_60

    invoke-virtual {p0, v2}, Lro9;->D(Lk2d;)V

    :cond_60
    return-void

    :cond_61
    sget-object v0, Lro9;->j:Lk2d;

    invoke-virtual {p0, v0}, Lro9;->D(Lk2d;)V

    return-void
.end method

.method public final t()V
    .registers 1

    return-void
.end method

.method public final t0()V
    .registers 3

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    iget-object p0, p0, Lvrl;->o:Lydn;

    iget-object p0, p0, Lydn;->c:Lgfn;

    invoke-interface {p0}, Lgfn;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_16

    const p0, 0x7f1413ee

    goto :goto_19

    :cond_16
    const p0, 0x7f141408

    :goto_19
    invoke-virtual {v1, p0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p0

    iget-object v0, v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;->a:Lvs;

    iget-object v0, v0, Lvs;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final u0()Z
    .registers 8

    iget-object v0, p0, Lk8;->a:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/mainmenu/MainMenuSheetToggleLayout;

    iget-object p0, p0, Lvrl;->o:Lydn;

    invoke-virtual {p0}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->a:Z

    const/4 v2, 0x0

    if-eqz v1, :cond_27

    iget-object p0, p0, Lydn;->o:Lufn;

    invoke-virtual {p0}, Lno7;->i()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ltfn;

    iget-wide v3, p0, Ltfn;->a:J

    const-wide/16 v5, 0x8

    and-long/2addr v3, v5

    const-wide/16 v5, 0x0

    cmp-long p0, v3, v5

    if-eqz p0, :cond_27

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    const/4 p0, 0x1

    return p0

    :cond_27
    const/16 p0, 0x8

    invoke-virtual {v0, p0}, Landroid/view/View;->setVisibility(I)V

    return v2
.end method
