.class public final synthetic Liwa;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;
.implements Lkr9;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Liwa;->a:B

    iput-object p1, p0, Liwa;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 9

    iget-byte v0, p0, Liwa;->a:B

    iget-object p0, p0, Liwa;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_9a

    check-cast p0, Lrmg;

    return-object p0

    :pswitch_a
    check-cast p0, Lwtd;

    return-object p0

    :pswitch_d
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_10
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_13
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_16
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lknh;

    const-string v5, "onRecentlyClosedTabsItemsChanged(Ljava/util/List;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lknh;

    const-string v4, "onRecentlyClosedTabsItemsChanged"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_27
    check-cast p0, Lldh;

    return-object p0

    :pswitch_2a
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_2d
    check-cast p0, Ljjh;

    return-object p0

    :pswitch_30
    check-cast p0, Lnfh;

    return-object p0

    :pswitch_33
    check-cast p0, Lveh;

    return-object p0

    :pswitch_36
    check-cast p0, Lrmg;

    return-object p0

    :pswitch_39
    check-cast p0, Lo5f;

    return-object p0

    :pswitch_3c
    check-cast p0, Lo5f;

    return-object p0

    :pswitch_3f
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lf6g;

    const-string v5, "updateState(Lcom/opera/android/autofill/passwords/settings/PasswordsSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lf6g;

    const-string v4, "updateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_50
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lt5g;

    const-string v6, "onStateUpdated(Lcom/opera/android/autofill/passwords/PasswordsState;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lt5g;

    const-string v5, "onStateUpdated"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_61
    check-cast p0, Lzbe;

    return-object p0

    :pswitch_64
    check-cast p0, Lmwc;

    return-object p0

    :pswitch_67
    check-cast p0, Lx9e;

    return-object p0

    :pswitch_6a
    check-cast p0, Lg0e;

    return-object p0

    :pswitch_6d
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_70
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_73
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_76
    check-cast p0, Lci7;

    return-object p0

    :pswitch_79
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_7c
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_7f
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_82
    check-cast p0, Lrkc;

    return-object p0

    :pswitch_85
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lo2b;

    const-string v5, "onImportUIStateUpdated(Lcom/opera/android/import_data/ImportUIState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lo2b;

    const-string v4, "onImportUIStateUpdated"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_96
    check-cast p0, Lnna;

    return-object p0

    nop

    :pswitch_data_9a
    .packed-switch 0x0
        :pswitch_96
        :pswitch_85
        :pswitch_82
        :pswitch_7f
        :pswitch_7c
        :pswitch_79
        :pswitch_76
        :pswitch_73
        :pswitch_70
        :pswitch_6d
        :pswitch_6a
        :pswitch_67
        :pswitch_64
        :pswitch_61
        :pswitch_50
        :pswitch_3f
        :pswitch_3c
        :pswitch_39
        :pswitch_36
        :pswitch_33
        :pswitch_30
        :pswitch_2d
        :pswitch_2a
        :pswitch_27
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 21

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Liwa;->a:B

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/16 v5, 0x8

    const/4 v6, 0x0

    iget-object v0, v0, Liwa;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_386

    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_16
    check-cast v0, Lwtd;

    invoke-virtual {v0, v1}, Lwtd;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1c
    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_22
    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_28
    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2e
    check-cast v1, Ljava/util/List;

    check-cast v0, Lknh;

    iget-object v2, v0, Lknh;->F:Lumh;

    if-nez v2, :cond_37

    move-object v2, v3

    :cond_37
    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v2, v1}, Ldt1;->K(Ljava/util/Collection;)V

    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    move-result v1

    iget-object v2, v0, Lknh;->A:Ly83;

    if-nez v2, :cond_45

    move-object v2, v3

    :cond_45
    iget-object v2, v2, Ly83;->d:Ljava/lang/Object;

    check-cast v2, Lkf;

    iget-object v2, v2, Lkf;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingImageButton;

    if-nez v1, :cond_51

    move v7, v6

    goto :goto_52

    :cond_51
    move v7, v5

    :goto_52
    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v0, Lknh;->A:Ly83;

    if-eqz v0, :cond_5a

    move-object v3, v0

    :cond_5a
    iget-object v0, v3, Ly83;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;

    if-nez v1, :cond_63

    sget-object v1, Lmnh;->a:Lmnh;

    goto :goto_65

    :cond_63
    sget-object v1, Lmnh;->b:Lmnh;

    :goto_65
    iget-object v2, v0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a:Lmnh;

    if-eq v2, v1, :cond_136

    iput-object v1, v0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a:Lmnh;

    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v2

    iget-object v2, v2, Lkf;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_124

    if-ne v1, v4, :cond_120

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0402ed

    const v3, 0x7f06063b

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v2

    const v5, 0x7f0402af

    invoke-static {v5, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v2, v1}, Lp37;->r(II)I

    move-result v1

    iput v1, v0, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->b:I

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    new-instance v2, Ldvb;

    const-string v3, "IconTheme"

    const-string v5, "**"

    filled-new-array {v5, v3, v5}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v7, Llnh;

    invoke-direct {v7, v0, v6}, Llnh;-><init>(Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;B)V

    invoke-virtual {v1, v2, v3, v7}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    new-instance v2, Ldvb;

    const-string v3, "IconThemeStroke"

    filled-new-array {v5, v3, v5}, [Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ldvb;-><init>([Ljava/lang/String;)V

    const/4 v3, 0x2

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    new-instance v5, Llnh;

    invoke-direct {v5, v0, v4}, Llnh;-><init>(Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;B)V

    invoke-virtual {v1, v2, v3, v5}, Lcom/opera/android/widget/ThemeableLottieAnimationView;->v(Ldvb;Ljava/lang/Object;Lykj;)V

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v0

    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    iget-object v1, v0, Ln2d;->d:Lf3d;

    iget-object v2, v1, Lf3d;->a:Lp2d;

    if-nez v2, :cond_112

    iget-object v2, v1, Lf3d;->e:Ljava/util/ArrayList;

    new-instance v3, Lc3d;

    invoke-direct {v3, v1, v6, v6}, Lc3d;-><init>(Lf3d;IB)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11c

    :cond_112
    iget-object v1, v1, Lf3d;->b:Lp3d;

    iget v2, v1, Lp3d;->k:F

    float-to-int v2, v2

    int-to-float v2, v2

    const/4 v3, 0x0

    invoke-virtual {v1, v3, v2}, Lp3d;->l(FF)V

    :goto_11c
    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    goto :goto_136

    :cond_120
    invoke-static {}, Lh9o;->p()V

    goto :goto_136

    :cond_124
    invoke-virtual {v0, v6}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v1, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;->a()Lkf;

    move-result-object v0

    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :cond_136
    :goto_136
    return-void

    :pswitch_137
    check-cast v0, Lldh;

    invoke-virtual {v0, v1}, Lldh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_13d
    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_143
    check-cast v0, Ljjh;

    invoke-virtual {v0, v1}, Ljjh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_149
    check-cast v0, Lnfh;

    invoke-virtual {v0, v1}, Lnfh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_14f
    check-cast v0, Lveh;

    invoke-virtual {v0, v1}, Lveh;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_155
    check-cast v0, Lrmg;

    invoke-virtual {v0, v1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_15b
    check-cast v0, Lo5f;

    invoke-virtual {v0, v1}, Lo5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_161
    check-cast v0, Lo5f;

    invoke-virtual {v0, v1}, Lo5f;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_167
    check-cast v1, Lh6g;

    check-cast v0, Lf6g;

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v1, Lh6g;->a:Ljji;

    iget-object v4, v1, Lh6g;->d:Lryc;

    iget v3, v3, Ljji;->a:I

    new-instance v7, Lrxh;

    invoke-direct {v7, v3}, Lrxh;-><init>(I)V

    invoke-virtual {v2, v7}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v1, Lh6g;->b:Z

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v1, Lh6g;->c:Lns2;

    iget-boolean v7, v3, Lns2;->a:Z

    if-eqz v7, :cond_198

    move v7, v6

    goto :goto_199

    :cond_198
    move v7, v5

    :goto_199
    invoke-virtual {v2, v7}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v3, v3, Lns2;->b:Z

    invoke-virtual {v2, v3}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v4, Lryc;->a:Z

    if-eqz v3, :cond_1ad

    move v3, v6

    goto :goto_1ae

    :cond_1ad
    move v3, v5

    :goto_1ae
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v4, Lryc;->b:Ln7j;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v3, v4}, Ln7j;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v2, v3}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget-object v2, v1, Lh6g;->e:Llxk;

    iget-boolean v2, v2, Llxk;->c:Z

    if-eqz v2, :cond_1ce

    const v2, 0x7f141204

    goto :goto_1d1

    :cond_1ce
    const v2, 0x7f140f8e

    :goto_1d1
    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v3

    iget-object v3, v3, Lim9;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v4, Lrxh;

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    iget v4, v1, Lh6g;->f:I

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    filled-new-array {v7}, [Ljava/lang/Object;

    move-result-object v7

    const v8, 0x7f120061

    invoke-virtual {v3, v8, v4, v7}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    new-instance v4, Lqxh;

    invoke-direct {v4, v3}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    invoke-virtual {v2, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v2

    iget-object v2, v2, Lim9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v3, v1, Lh6g;->g:Z

    if-eqz v3, :cond_20e

    move v3, v6

    goto :goto_20f

    :cond_20e
    move v3, v5

    :goto_20f
    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lf6g;->I0()Lim9;

    move-result-object v0

    iget-object v0, v0, Lim9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v1, v1, Lh6g;->h:Z

    if-nez v1, :cond_21d

    move v5, v6

    :cond_21d
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_221
    check-cast v1, Lq6g;

    check-cast v0, Lt5g;

    sget-object v2, Lo6g;->h:Lo6g;

    invoke-static {v1, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    const v3, 0x7f0a0819

    const v7, 0x7f0a0932

    const v8, 0x7f0a0096

    if-eqz v2, :cond_26c

    iget-object v2, v0, Lt5g;->v:Lrf2;

    iget-object v9, v2, Lrf2;->f:Landroid/view/View;

    check-cast v9, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-boolean v10, v1, Lq6g;->c:Z

    if-nez v10, :cond_241

    move v6, v5

    :cond_241
    invoke-virtual {v9, v6, v4}, Lsan;->a(IZ)V

    iget-object v2, v2, Lrf2;->d:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v8}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_256

    iget-boolean v5, v1, Lq6g;->d:Z

    invoke-interface {v2, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_256
    invoke-virtual {v0, v7}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_261

    iget-boolean v1, v1, Lq6g;->e:Z

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_261
    invoke-virtual {v0, v3}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_326

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto/16 :goto_326

    :cond_26c
    instance-of v2, v1, Lp6g;

    if-eqz v2, :cond_323

    invoke-virtual {v0}, Lt5g;->H0()Ln5g;

    move-result-object v2

    move-object v9, v1

    check-cast v9, Lp6g;

    iget-object v10, v2, Ln5g;->f:Ld5g;

    new-instance v11, Ld5g;

    iget-object v12, v9, Lp6g;->h:Ljava/util/List;

    iget-object v13, v9, Lp6g;->i:Lu3g;

    iget-boolean v15, v9, Lq6g;->a:Z

    iget-boolean v14, v9, Lq6g;->b:Z

    iget-boolean v5, v9, Lq6g;->f:Z

    iget-boolean v9, v9, Lq6g;->g:Z

    move/from16 v16, v14

    const/4 v14, 0x1

    move/from16 v17, v5

    move/from16 v18, v9

    invoke-direct/range {v11 .. v18}, Ld5g;-><init>(Ljava/util/List;Lu3g;ZZZZZ)V

    iget-object v5, v2, Ln5g;->e:Lpad;

    iput-object v10, v5, Lpad;->c:Ljava/lang/Object;

    iput-object v11, v5, Lpad;->b:Ljava/lang/Object;

    iget-object v9, v10, Ld5g;->a:Ljava/util/List;

    invoke-virtual {v5, v9, v12}, Lpad;->r(Ljava/util/List;Ljava/util/List;)Lj87;

    move-result-object v5

    iput-object v11, v2, Ln5g;->f:Ld5g;

    invoke-virtual {v5, v2}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    iget-object v2, v0, Lt5g;->v:Lrf2;

    iget-object v5, v2, Lrf2;->f:Landroid/view/View;

    check-cast v5, Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget-object v9, v2, Lrf2;->g:Landroid/view/View;

    check-cast v9, Lcom/opera/android/downloads/DownloadFilterChip;

    iget-object v10, v2, Lrf2;->k:Landroid/view/View;

    check-cast v10, Lcom/opera/android/downloads/DownloadFilterChip;

    iget-object v11, v2, Lrf2;->e:Landroid/view/View;

    check-cast v11, Lcom/opera/android/downloads/DownloadFilterChip;

    iget-boolean v12, v1, Lq6g;->c:Z

    if-eqz v12, :cond_2ba

    move v12, v6

    goto :goto_2bc

    :cond_2ba
    const/16 v12, 0x8

    :goto_2bc
    invoke-virtual {v5, v12, v4}, Lsan;->a(IZ)V

    invoke-virtual {v11}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v5

    if-nez v5, :cond_2c8

    const/16 v5, 0x8

    goto :goto_2c9

    :cond_2c8
    move v5, v6

    :goto_2c9
    invoke-virtual {v11, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v10}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v5

    if-nez v5, :cond_2d5

    const/16 v5, 0x8

    goto :goto_2d6

    :cond_2d5
    move v5, v6

    :goto_2d6
    invoke-virtual {v10, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9}, Landroid/widget/CompoundButton;->isChecked()Z

    move-result v5

    if-nez v5, :cond_2e2

    const/16 v5, 0x8

    goto :goto_2e3

    :cond_2e2
    move v5, v6

    :goto_2e3
    invoke-virtual {v9, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, v2, Lrf2;->d:Landroid/view/View;

    check-cast v2, Landroid/widget/LinearLayout;

    invoke-virtual {v11}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_2fc

    invoke-virtual {v10}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-eqz v5, :cond_2fc

    invoke-virtual {v9}, Landroid/view/View;->getVisibility()I

    move-result v5

    if-nez v5, :cond_2fe

    :cond_2fc
    move v5, v6

    goto :goto_300

    :cond_2fe
    const/16 v5, 0x8

    :goto_300
    invoke-virtual {v2, v5}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0, v8}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_30e

    iget-boolean v5, v1, Lq6g;->d:Z

    invoke-interface {v2, v5}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_30e
    invoke-virtual {v0, v7}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    if-eqz v2, :cond_319

    iget-boolean v1, v1, Lq6g;->e:Z

    invoke-interface {v2, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_319
    invoke-virtual {v0, v3}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_326

    invoke-interface {v0, v4}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    goto :goto_326

    :cond_323
    invoke-static {}, Lh9o;->p()V

    :cond_326
    :goto_326
    return-void

    :pswitch_327
    move-object v0, v1

    check-cast v0, Lw0f;

    return-void

    :pswitch_32b
    check-cast v0, Lmwc;

    invoke-virtual {v0, v1}, Lmwc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_331
    check-cast v0, Lx9e;

    invoke-virtual {v0, v1}, Lx9e;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_337
    check-cast v0, Lg0e;

    invoke-virtual {v0, v1}, Lg0e;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_33d
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_343
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_349
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_34f
    check-cast v0, Lci7;

    invoke-virtual {v0, v1}, Lci7;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_355
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_35b
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_361
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_367
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_36d
    check-cast v1, Ln3b;

    check-cast v0, Lo2b;

    iget-object v0, v0, Lo2b;->s:Ls9i;

    if-eqz v0, :cond_376

    move-object v3, v0

    :cond_376
    iget-object v0, v3, Ls9i;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    iget-boolean v1, v1, Ln3b;->c:Z

    invoke-virtual {v0, v1}, Landroid/view/View;->setEnabled(Z)V

    return-void

    :pswitch_380
    check-cast v0, Lnna;

    invoke-virtual {v0, v1}, Lnna;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_data_386
    .packed-switch 0x0
        :pswitch_380
        :pswitch_36d
        :pswitch_367
        :pswitch_361
        :pswitch_35b
        :pswitch_355
        :pswitch_34f
        :pswitch_349
        :pswitch_343
        :pswitch_33d
        :pswitch_337
        :pswitch_331
        :pswitch_32b
        :pswitch_327
        :pswitch_221
        :pswitch_167
        :pswitch_161
        :pswitch_15b
        :pswitch_155
        :pswitch_14f
        :pswitch_149
        :pswitch_143
        :pswitch_13d
        :pswitch_137
        :pswitch_2e
        :pswitch_28
        :pswitch_22
        :pswitch_1c
        :pswitch_16
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Liwa;->a:B

    const/4 v1, 0x0

    packed-switch v0, :pswitch_data_2b8

    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1c
    return v1

    :pswitch_1d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_33

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_33

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_33
    return v1

    :pswitch_34
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_4a

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_4a

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_4a
    return v1

    :pswitch_4b
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_61

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_61

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_61
    return v1

    :pswitch_62
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_78

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_78

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_78
    return v1

    :pswitch_79
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_8f

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_8f

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_8f
    return v1

    :pswitch_90
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_a6

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_a6

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_a6
    return v1

    :pswitch_a7
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_bd

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_bd

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_bd
    return v1

    :pswitch_be
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_d4

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_d4

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_d4
    return v1

    :pswitch_d5
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_eb

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_eb

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_eb
    return v1

    :pswitch_ec
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_102

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_102

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_102
    return v1

    :pswitch_103
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_119

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_119

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_119
    return v1

    :pswitch_11a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_130

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_130

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_130
    return v1

    :pswitch_131
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_147

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_147

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_147
    return v1

    :pswitch_148
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_15e

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_15e

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_15e
    return v1

    :pswitch_15f
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_175

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_175

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_175
    return v1

    :pswitch_176
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_18c

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_18c

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_18c
    return v1

    :pswitch_18d
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1a3

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1a3

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1a3
    return v1

    :pswitch_1a4
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ba

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ba

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ba
    return v1

    :pswitch_1bb
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1d1

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1d1

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1d1
    return v1

    :pswitch_1d2
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1e8

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1e8

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1e8
    return v1

    :pswitch_1e9
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_1ff

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_1ff

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_1ff
    return v1

    :pswitch_200
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_216

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_216

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_216
    return v1

    :pswitch_217
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_22d

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_22d

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_22d
    return v1

    :pswitch_22e
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_244

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_244

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_244
    return v1

    :pswitch_245
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_25b

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_25b

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_25b
    return v1

    :pswitch_25c
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_272

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_272

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_272
    return v1

    :pswitch_273
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_289

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_289

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_289
    return v1

    :pswitch_28a
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2a0

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2a0

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2a0
    return v1

    :pswitch_2a1
    instance-of v0, p1, Lf7f;

    if-eqz v0, :cond_2b7

    instance-of v0, p1, Lkr9;

    if-eqz v0, :cond_2b7

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    check-cast p1, Lkr9;

    invoke-interface {p1}, Lkr9;->a()Lbr9;

    move-result-object p1

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    :cond_2b7
    return v1

    :pswitch_data_2b8
    .packed-switch 0x0
        :pswitch_2a1
        :pswitch_28a
        :pswitch_273
        :pswitch_25c
        :pswitch_245
        :pswitch_22e
        :pswitch_217
        :pswitch_200
        :pswitch_1e9
        :pswitch_1d2
        :pswitch_1bb
        :pswitch_1a4
        :pswitch_18d
        :pswitch_176
        :pswitch_15f
        :pswitch_148
        :pswitch_131
        :pswitch_11a
        :pswitch_103
        :pswitch_ec
        :pswitch_d5
        :pswitch_be
        :pswitch_a7
        :pswitch_90
        :pswitch_79
        :pswitch_62
        :pswitch_4b
        :pswitch_34
        :pswitch_1d
    .end packed-switch
.end method

.method public final hashCode()I
    .registers 2

    iget-byte v0, p0, Liwa;->a:B

    packed-switch v0, :pswitch_data_114

    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_17
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_20
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_29
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_32
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_3b
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_44
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_4d
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_56
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_5f
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_68
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_71
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_7a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_83
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_8c
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_95
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_9e
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_a7
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b0
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_b9
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_c2
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_cb
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_d4
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_dd
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_e6
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_ef
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_f8
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_101
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    :pswitch_10a
    invoke-interface {p0}, Lkr9;->a()Lbr9;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    move-result p0

    return p0

    nop

    :pswitch_data_114
    .packed-switch 0x0
        :pswitch_10a
        :pswitch_101
        :pswitch_f8
        :pswitch_ef
        :pswitch_e6
        :pswitch_dd
        :pswitch_d4
        :pswitch_cb
        :pswitch_c2
        :pswitch_b9
        :pswitch_b0
        :pswitch_a7
        :pswitch_9e
        :pswitch_95
        :pswitch_8c
        :pswitch_83
        :pswitch_7a
        :pswitch_71
        :pswitch_68
        :pswitch_5f
        :pswitch_56
        :pswitch_4d
        :pswitch_44
        :pswitch_3b
        :pswitch_32
        :pswitch_29
        :pswitch_20
        :pswitch_17
        :pswitch_e
    .end packed-switch
.end method
