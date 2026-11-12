.class public final synthetic Lw4i;
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

    iput-byte p2, p0, Lw4i;->a:B

    iput-object p1, p0, Lw4i;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final a()Lbr9;
    .registers 9

    iget-byte v0, p0, Lw4i;->a:B

    iget-object p0, p0, Lw4i;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_a8

    check-cast p0, Lqfl;

    return-object p0

    :pswitch_a
    check-cast p0, Lcvl;

    return-object p0

    :pswitch_d
    check-cast p0, Lqfl;

    return-object p0

    :pswitch_10
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_13
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_16
    check-cast p0, Lf9l;

    return-object p0

    :pswitch_19
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_1c
    check-cast p0, Le5l;

    return-object p0

    :pswitch_1f
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lg4l;

    const-string v5, "onIncognitoFadeFractChanged(F)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lg4l;

    const-string v4, "onIncognitoFadeFractChanged"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_30
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Ldyk;

    const-string v6, "updateUser(Lcom/opera/android/account/OperaUser$Container;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Ldyk;

    const-string v5, "updateUser"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_41
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_44
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_47
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_4a
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_4d
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_50
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_53
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_56
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_59
    check-cast p0, Ln6k;

    return-object p0

    :pswitch_5c
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lv7k;

    const-string v5, "updateState(Lcom/opera/android/settings/start_page/StartPageSettingsState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lv7k;

    const-string v4, "updateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_6d
    new-instance v1, Lnr9;

    move-object v3, p0

    check-cast v3, Lszj;

    const-string v6, "updateState(Lcom/opera/android/settings/speed_dial/SpeedDialSettingsState;)V"

    const/4 v7, 0x0

    const/4 v2, 0x1

    const-class v4, Lszj;

    const-string v5, "updateState"

    invoke-direct/range {v1 .. v7}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v1

    :pswitch_7e
    check-cast p0, Ltji;

    return-object p0

    :pswitch_81
    new-instance v0, Lnr9;

    move-object v2, p0

    check-cast v2, Lc9j;

    const-string v5, "onUpdateState(Lcom/opera/android/settings/settings_search/SettingsSearchState;)V"

    const/4 v6, 0x0

    const/4 v1, 0x1

    const-class v3, Lc9j;

    const-string v4, "onUpdateState"

    invoke-direct/range {v0 .. v6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-object v0

    :pswitch_92
    check-cast p0, Ltji;

    return-object p0

    :pswitch_95
    check-cast p0, Ltji;

    return-object p0

    :pswitch_98
    check-cast p0, Ltmi;

    return-object p0

    :pswitch_9b
    check-cast p0, Lpli;

    return-object p0

    :pswitch_9e
    check-cast p0, Ltji;

    return-object p0

    :pswitch_a1
    check-cast p0, Lvvf;

    return-object p0

    :pswitch_a4
    check-cast p0, Lrmg;

    return-object p0

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_a4
        :pswitch_a1
        :pswitch_9e
        :pswitch_9b
        :pswitch_98
        :pswitch_95
        :pswitch_92
        :pswitch_81
        :pswitch_7e
        :pswitch_6d
        :pswitch_5c
        :pswitch_59
        :pswitch_56
        :pswitch_53
        :pswitch_50
        :pswitch_4d
        :pswitch_4a
        :pswitch_47
        :pswitch_44
        :pswitch_41
        :pswitch_30
        :pswitch_1f
        :pswitch_1c
        :pswitch_19
        :pswitch_16
        :pswitch_13
        :pswitch_10
        :pswitch_d
        :pswitch_a
    .end packed-switch
.end method

.method public final d0(Ljava/lang/Object;)V
    .registers 15

    iget-byte v0, p0, Lw4i;->a:B

    const/16 v1, 0x8

    const/4 v2, 0x0

    const/4 v3, 0x1

    iget-object p0, p0, Lw4i;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2d2

    check-cast p0, Lqfl;

    invoke-virtual {p0, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_11
    check-cast p0, Lcvl;

    invoke-virtual {p0, p1}, Lcvl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_17
    check-cast p0, Lqfl;

    invoke-virtual {p0, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1d
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_23
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_29
    check-cast p0, Lf9l;

    invoke-virtual {p0, p1}, Lf9l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2f
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_35
    check-cast p0, Le5l;

    invoke-virtual {p0, p1}, Le5l;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3b
    check-cast p1, Ljava/lang/Number;

    invoke-virtual {p1}, Ljava/lang/Number;->floatValue()F

    move-result p1

    check-cast p0, Lg4l;

    iget v0, p0, Lg4l;->n:F

    cmpg-float v1, p1, v0

    if-eqz v1, :cond_76

    const/4 v1, 0x0

    cmpg-float v4, v0, v1

    if-nez v4, :cond_54

    cmpl-float v4, p1, v1

    if-lez v4, :cond_54

    move v4, v3

    goto :goto_55

    :cond_54
    move v4, v2

    :goto_55
    cmpl-float v0, v0, v1

    if-lez v0, :cond_5e

    cmpg-float v0, p1, v1

    if-nez v0, :cond_5e

    move v2, v3

    :cond_5e
    if-eqz v4, :cond_6a

    new-instance v0, Ld4l;

    const/4 v1, 0x7

    invoke-direct {v0, p0, v1}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    goto :goto_74

    :cond_6a
    if-eqz v2, :cond_74

    new-instance v0, Ld4l;

    invoke-direct {v0, p0, v3}, Ld4l;-><init>(Lg4l;B)V

    invoke-virtual {p0, v0}, Lg4l;->d(Lkotlin/jvm/functions/Function0;)V

    :cond_74
    :goto_74
    iput p1, p0, Lg4l;->n:F

    :cond_76
    return-void

    :pswitch_77
    check-cast p1, Ldpf;

    check-cast p0, Ldyk;

    new-instance v0, Lrii;

    const/16 v1, 0xa

    invoke-direct {v0, p0, v1}, Lrii;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_86
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_8c
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_92
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_98
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_9e
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_a4
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_aa
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_b0
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_b6
    check-cast p0, Ln6k;

    invoke-virtual {p0, p1}, Ln6k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_bc
    check-cast p1, Lz7k;

    check-cast p0, Lv7k;

    iget-object v0, p1, Lz7k;->a:Lknn;

    iget-object v4, p1, Lz7k;->f:Lrsi;

    iget-object v5, p1, Lz7k;->e:Lrsi;

    iget-object v0, v0, Lknn;->a:Ljava/util/List;

    iget-object v6, p0, Lv7k;->x:Ljava/util/List;

    invoke-static {v6, v0}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_e8

    iput-object v0, p0, Lv7k;->x:Ljava/util/List;

    iget-object v6, p0, Lv7k;->y:Ljp3;

    sget-object v7, Lv7k;->A:[Lxtb;

    aget-object v3, v7, v3

    invoke-virtual {v6, p0, v3}, Ljp3;->a(Landroidx/fragment/app/Fragment;Lxtb;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lvkn;

    iget-object v6, v3, Lvkn;->a:Lujn;

    invoke-virtual {v6, v0}, Lujn;->T(Ljava/util/List;)V

    iget-object v0, v3, Lvkn;->b:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    :cond_e8
    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->b:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->c:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->k:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->k:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->l:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->g:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->h:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->i:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, p1, Lz7k;->j:Lyt8;

    invoke-static {v0, v3}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object v0

    iget-object v0, v0, Lsm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object p1, p1, Lz7k;->d:Lyt8;

    invoke-static {v0, p1}, Lv7k;->J0(Lcom/opera/android/ui/catalog/widget/OperaListItem;Lyt8;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p1

    iget-object p1, p1, Lsm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v0, v5, Lrsi;->a:Z

    if-eqz v0, :cond_157

    move v0, v2

    goto :goto_158

    :cond_157
    move v0, v1

    :goto_158
    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    iget-boolean v0, v5, Lrsi;->b:Z

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, v5, Lrsi;->c:Lrxh;

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object v0, v5, Lrsi;->d:Llxh;

    invoke-virtual {p1, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    invoke-virtual {p0}, Lv7k;->H0()Lsm9;

    move-result-object p0

    iget-object p0, p0, Lsm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean p1, v4, Lrsi;->a:Z

    if-eqz p1, :cond_175

    move v1, v2

    :cond_175
    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p1, v4, Lrsi;->b:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object p1, v4, Lrsi;->c:Lrxh;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object p1, v4, Lrsi;->d:Llxh;

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void

    :pswitch_188
    check-cast p1, Luzj;

    check-cast p0, Lszj;

    sget-object v0, Lszj;->w:[Lxtb;

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object v0

    iget-object v0, v0, Lrm9;->b:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v4, p1, Luzj;->a:Z

    invoke-virtual {v0, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object v0

    iget-object v0, v0, Lrm9;->f:Landroid/widget/LinearLayout;

    iget-boolean v4, p1, Luzj;->a:Z

    if-eqz v4, :cond_1a4

    move v1, v2

    :cond_1a4
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p1, Luzj;->b:Lp7j;

    iget-object v1, p0, Lszj;->v:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/List;

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_1b7
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_1ce

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    iget-object v5, v4, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->p:Lp7j;

    if-ne v5, v0, :cond_1c9

    move v5, v3

    goto :goto_1ca

    :cond_1c9
    move v5, v2

    :goto_1ca
    invoke-virtual {v4, v5}, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->setSelected(Z)V

    goto :goto_1b7

    :cond_1ce
    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object v0

    iget-object v0, v0, Lrm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v1, p1, Luzj;->c:Z

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    invoke-virtual {p0}, Lszj;->H0()Lrm9;

    move-result-object p0

    iget-object p0, p0, Lrm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean p1, p1, Luzj;->d:Z

    invoke-virtual {p0, p1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    return-void

    :pswitch_1e5
    check-cast p0, Ltji;

    invoke-virtual {p0, p1}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_1eb
    check-cast p1, Lj9j;

    check-cast p0, Lc9j;

    sget-object v0, Lc9j;->w:[Lxtb;

    iget-boolean v0, p1, Lj9j;->c:Z

    iget-boolean v1, p1, Lj9j;->c:Z

    iget-object v4, p1, Lj9j;->b:Ljava/util/List;

    if-eqz v0, :cond_202

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_202

    invoke-virtual {p0, v2}, Lc9j;->J0(Z)V

    :cond_202
    iget-object v0, p0, Lc9j;->s:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ly8j;

    new-instance v10, Lu8j;

    const/4 v5, 0x2

    invoke-direct {v10, p0, v5}, Lu8j;-><init>(Lc9j;B)V

    iget-object v5, v0, Ly8j;->a:Ljk7;

    iget-object p0, v5, Ljk7;->e:Ljava/lang/Object;

    check-cast p0, Ly8j;

    iget-object v0, p0, Ly8j;->b:Lc9j;

    iget-wide v6, v5, Ljk7;->b:J

    const-wide/16 v8, 0x1

    add-long/2addr v6, v8

    iput-wide v6, v5, Ljk7;->b:J

    if-eqz v1, :cond_229

    invoke-interface {v4}, Ljava/util/List;->isEmpty()Z

    move-result v8

    if-eqz v8, :cond_229

    move v8, v3

    goto :goto_22a

    :cond_229
    move v8, v2

    :goto_22a
    if-eqz v8, :cond_241

    iget-object p1, v5, Ljk7;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-boolean v0, v5, Ljk7;->a:Z

    add-int/2addr p1, v0

    sget-object v0, Ll08;->a:Ll08;

    iput-object v0, v5, Ljk7;->c:Ljava/lang/Object;

    iput-boolean v2, v5, Ljk7;->a:Z

    invoke-virtual {p0, v2, p1}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    goto :goto_2a6

    :cond_241
    iget-boolean v8, v5, Ljk7;->a:Z

    if-ne v8, v1, :cond_253

    iget-object v8, v5, Ljk7;->c:Ljava/lang/Object;

    check-cast v8, Ljava/util/List;

    invoke-static {v8, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_253

    invoke-virtual {v0, v3}, Lc9j;->J0(Z)V

    goto :goto_2a6

    :cond_253
    move v8, v2

    iget-boolean v2, v5, Ljk7;->a:Z

    move-object v9, v4

    iget-boolean v4, p1, Lj9j;->c:Z

    invoke-interface {v9}, Ljava/util/List;->isEmpty()Z

    move-result v11

    iget-object v12, v5, Ljk7;->c:Ljava/lang/Object;

    check-cast v12, Ljava/util/List;

    if-eqz v11, :cond_273

    invoke-interface {v12}, Ljava/util/List;->size()I

    move-result p1

    add-int/2addr p1, v2

    iput-boolean v1, v5, Ljk7;->a:Z

    iput-object v9, v5, Ljk7;->c:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Lc9j;->J0(Z)V

    invoke-virtual {p0, v4, p1}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    goto :goto_2a6

    :cond_273
    invoke-interface {v12}, Ljava/util/List;->isEmpty()Z

    move-result v11

    if-eqz v11, :cond_289

    invoke-interface {v9}, Ljava/util/List;->size()I

    move-result p1

    add-int/2addr p1, v4

    iput-boolean v1, v5, Ljk7;->a:Z

    iput-object v9, v5, Ljk7;->c:Ljava/lang/Object;

    invoke-virtual {v0, v3}, Lc9j;->J0(Z)V

    invoke-virtual {p0, v8, p1}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    goto :goto_2a6

    :cond_289
    iget-object p0, v5, Ljk7;->c:Ljava/lang/Object;

    move-object v1, p0

    check-cast v1, Ljava/util/List;

    iget-object p0, v5, Ljk7;->d:Ljava/lang/Object;

    check-cast p0, Lc37;

    iget-object p0, p0, Lc37;->a:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/ExecutorService;

    iget-object v0, v5, Ljk7;->e:Ljava/lang/Object;

    move-object v9, v0

    check-cast v9, Ly8j;

    iget-object v8, v9, Ly8j;->b:Lc9j;

    new-instance v0, Lv8j;

    move-object v3, p1

    invoke-direct/range {v0 .. v10}, Lv8j;-><init>(Ljava/util/List;ILj9j;ILjk7;JLc9j;Ly8j;Lu8j;)V

    invoke-interface {p0, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    :goto_2a6
    return-void

    :pswitch_2a7
    check-cast p0, Ltji;

    invoke-virtual {p0, p1}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2ad
    check-cast p0, Ltji;

    invoke-virtual {p0, p1}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2b3
    check-cast p0, Ltmi;

    invoke-virtual {p0, p1}, Ltmi;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2b9
    check-cast p0, Lpli;

    invoke-virtual {p0, p1}, Lpli;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2bf
    check-cast p0, Ltji;

    invoke-virtual {p0, p1}, Ltji;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2c5
    check-cast p0, Lvvf;

    invoke-virtual {p0, p1}, Lvvf;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_2cb
    check-cast p0, Lrmg;

    invoke-virtual {p0, p1}, Lrmg;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_2d2
    .packed-switch 0x0
        :pswitch_2cb
        :pswitch_2c5
        :pswitch_2bf
        :pswitch_2b9
        :pswitch_2b3
        :pswitch_2ad
        :pswitch_2a7
        :pswitch_1eb
        :pswitch_1e5
        :pswitch_188
        :pswitch_bc
        :pswitch_b6
        :pswitch_b0
        :pswitch_aa
        :pswitch_a4
        :pswitch_9e
        :pswitch_98
        :pswitch_92
        :pswitch_8c
        :pswitch_86
        :pswitch_77
        :pswitch_3b
        :pswitch_35
        :pswitch_2f
        :pswitch_29
        :pswitch_23
        :pswitch_1d
        :pswitch_17
        :pswitch_11
    .end packed-switch
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 4

    iget-byte v0, p0, Lw4i;->a:B

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

    iget-byte v0, p0, Lw4i;->a:B

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
