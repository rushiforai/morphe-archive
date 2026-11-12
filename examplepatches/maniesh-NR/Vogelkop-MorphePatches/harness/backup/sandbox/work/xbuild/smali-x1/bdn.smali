.class public final Lbdn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lndc;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lz0c;

.field public final c:Lydn;

.field public final d:Lpt1;

.field public final e:Z

.field public final f:Z

.field public final g:Ljava/lang/String;

.field public final h:Lcdn;

.field public final i:Lhv3;

.field public final j:Ladn;

.field public final k:Lxcn;

.field public final l:Lqdc;

.field public final m:Locn;


# direct methods
.method public constructor <init>(Landroid/view/ViewStub;Lz0c;Lydn;ZZLjava/lang/String;Lcdn;Lhv3;ZZ)V
    .registers 29

    move-object/from16 v0, p0

    move-object/from16 v1, p3

    move/from16 v2, p4

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    new-instance v3, Ladn;

    const/4 v4, 0x0

    invoke-direct {v3, v0, v4}, Ladn;-><init>(Lndc;B)V

    iput-object v3, v0, Lbdn;->j:Ladn;

    new-instance v3, Lxcn;

    invoke-direct {v3, v0}, Lxcn;-><init>(Lbdn;)V

    iput-object v3, v0, Lbdn;->k:Lxcn;

    new-instance v3, Lqdc;

    const/4 v5, 0x1

    invoke-direct {v3, v0, v5}, Lqdc;-><init>(Lndc;Z)V

    iput-object v3, v0, Lbdn;->l:Lqdc;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iput-object v6, v0, Lbdn;->a:Landroid/content/Context;

    move-object/from16 v6, p2

    iput-object v6, v0, Lbdn;->b:Lz0c;

    iput-object v1, v0, Lbdn;->c:Lydn;

    const v6, 0x7f0d0451

    move-object/from16 v7, p1

    invoke-virtual {v7, v6}, Landroid/view/ViewStub;->setLayoutResource(I)V

    invoke-virtual {v7}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v6

    const v7, 0x7f0a0108

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v11, v8

    check-cast v11, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    const/4 v8, 0x0

    if-eqz v11, :cond_131

    const v7, 0x7f0a061e

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v12, v9

    check-cast v12, Lcom/opera/android/vpn/LocationButton;

    if-eqz v12, :cond_131

    const v7, 0x7f0a081d

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v13, v9

    check-cast v13, Lcom/google/android/material/button/MaterialButton;

    if-eqz v13, :cond_131

    const v7, 0x7f0a08ed

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v14, v9

    check-cast v14, Lcom/google/android/material/button/MaterialButton;

    if-eqz v14, :cond_131

    const v7, 0x7f0a09ac

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object v15, v9

    check-cast v15, Lcom/google/android/material/button/MaterialButton;

    if-eqz v15, :cond_131

    const v7, 0x7f0a0cae

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v16, v9

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v16, :cond_131

    const v7, 0x7f0a0cc1

    invoke-static {v7, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    move-object/from16 v17, v9

    check-cast v17, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v17, :cond_131

    new-instance v9, Lpt1;

    move-object v10, v6

    check-cast v10, Landroid/widget/LinearLayout;

    invoke-direct/range {v9 .. v17}, Lpt1;-><init>(Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/vpn/LocationButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/google/android/material/button/MaterialButton;Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;Lcom/opera/android/ui/catalog/widget/OperaListItem;)V

    move-object v6, v9

    move-object/from16 v9, v17

    iput-object v6, v0, Lbdn;->d:Lpt1;

    iput-boolean v2, v0, Lbdn;->e:Z

    move/from16 v6, p5

    iput-boolean v6, v0, Lbdn;->f:Z

    move-object/from16 v6, p6

    iput-object v6, v0, Lbdn;->g:Ljava/lang/String;

    move-object/from16 v6, p7

    iput-object v6, v0, Lbdn;->h:Lcdn;

    move-object/from16 v6, p8

    iput-object v6, v0, Lbdn;->i:Lhv3;

    if-eqz p10, :cond_b3

    invoke-virtual {v11, v8}, Landroid/view/ViewGroup;->setLayoutTransition(Landroid/animation/LayoutTransition;)V

    :cond_b3
    new-instance v6, Lycn;

    invoke-direct {v6, v0, v4}, Lycn;-><init>(Lbdn;B)V

    invoke-virtual {v15, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v2, :cond_c2

    iget-object v6, v1, Lydn;->d:Lvdn;

    iget-boolean v6, v6, Lvdn;->a:Z

    goto :goto_c8

    :cond_c2
    iget-object v6, v1, Lydn;->d:Lvdn;

    invoke-virtual {v6}, Lvdn;->a()Z

    move-result v6

    :goto_c8
    invoke-virtual {v9, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v6, Lr2n;

    invoke-direct {v6, v0, v5}, Lr2n;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    new-instance v6, Lbpd;

    invoke-direct {v6, v12}, Lbpd;-><init>(Lcom/opera/android/vpn/LocationButton;)V

    new-instance v6, Lycn;

    invoke-direct {v6, v0, v5}, Lycn;-><init>(Lbdn;B)V

    invoke-virtual {v12, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz p9, :cond_eb

    new-instance v6, Lzcn;

    invoke-direct {v6, v0, v4}, Lzcn;-><init>(Lbdn;B)V

    const-wide/16 v7, 0x1f4

    invoke-virtual {v12, v6, v7, v8}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    :cond_eb
    new-instance v4, Lycn;

    const/4 v6, 0x2

    invoke-direct {v4, v0, v6}, Lycn;-><init>(Lbdn;B)V

    invoke-virtual {v13, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Lycn;

    const/4 v7, 0x3

    invoke-direct {v4, v0, v7}, Lycn;-><init>(Lbdn;B)V

    invoke-virtual {v14, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Lsvk;

    const/16 v7, 0x17

    invoke-direct {v4, v0, v7}, Lsvk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9}, Lq9n;->s(Landroid/view/View;)Ldll;

    move-result-object v7

    if-eqz v7, :cond_10d

    invoke-static {v7, v9, v4}, Lu8n;->b(Ldll;Landroid/view/View;Lr8n;)V

    :cond_10d
    new-instance v4, Locn;

    invoke-direct {v4, v9, v3, v1}, Locn;-><init>(Landroid/view/ViewGroup;Ltcc;Lydn;)V

    iput-object v4, v0, Lbdn;->m:Locn;

    iget-boolean v1, v4, Locn;->i:Z

    if-eq v2, v1, :cond_11d

    iput-boolean v2, v4, Locn;->i:Z

    invoke-virtual {v4}, Locn;->T()V

    :cond_11d
    new-instance v1, Lzcn;

    invoke-direct {v1, v0, v5}, Lzcn;-><init>(Lbdn;B)V

    new-instance v2, Lzcn;

    invoke-direct {v2, v0, v6}, Lzcn;-><init>(Lbdn;B)V

    new-instance v0, Ltu4;

    const/4 v3, 0x7

    invoke-direct {v0, v1, v2, v3}, Ltu4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v10, v0}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    return-void

    :cond_131
    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v7}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    throw v8
.end method


# virtual methods
.method public final a()I
    .registers 2

    iget-boolean v0, p0, Lbdn;->e:Z

    iget-object p0, p0, Lbdn;->c:Lydn;

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lydn;->q()I

    move-result p0

    return p0

    :cond_b
    invoke-virtual {p0}, Lydn;->r()I

    move-result p0

    return p0
.end method

.method public final b()V
    .registers 8

    iget-boolean v0, p0, Lbdn;->e:Z

    iget-object v1, p0, Lbdn;->c:Lydn;

    if-eqz v0, :cond_b

    iget-object v0, v1, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    goto :goto_11

    :cond_b
    iget-object v0, v1, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->a()Z

    move-result v0

    :goto_11
    invoke-virtual {p0}, Lbdn;->c()V

    const/16 v2, 0x8

    const/4 v3, 0x0

    iget-object v4, p0, Lbdn;->d:Lpt1;

    if-eqz v0, :cond_87

    iget-boolean v5, p0, Lbdn;->f:Z

    if-eqz v5, :cond_87

    iget-object v0, v4, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    iget-object v5, v4, Lpt1;->c:Landroid/view/View;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v4, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    sget-object v6, Lrlf;->h:Lrlf;

    invoke-virtual {v0, v6}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    iget-object v0, v4, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/vpn/LocationButton;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Lbdn;->g:Ljava/lang/String;

    invoke-static {v0}, LJ/N;->MpNM_Rhp(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_57

    iget-object v0, v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object v0, v0, Lei;->i:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f1413f7

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a4

    :cond_57
    invoke-static {v0}, LJ/N;->MYQRevfF(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_72

    iget-object v0, v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object v0, v0, Lei;->i:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f141397

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a4

    :cond_72
    iget-object v0, v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;->a:Lei;

    iget-object v0, v0, Lei;->i:Landroid/view/View;

    check-cast v0, Landroid/widget/TextView;

    invoke-virtual {v5}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    const v6, 0x7f1413f8

    invoke-virtual {v5, v6}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    goto :goto_a4

    :cond_87
    iget-object v5, v4, Lpt1;->c:Landroid/view/View;

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    iget-object v6, v4, Lpt1;->b:Landroid/view/View;

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v5, v2}, Landroid/view/View;->setVisibility(I)V

    new-instance v5, Ltlf;

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v6, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->y(Luup;)V

    invoke-virtual {v6, v0}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v0, v4, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/vpn/LocationButton;

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_a4
    invoke-virtual {p0}, Lbdn;->a()I

    move-result p0

    iget-object v0, v1, Lydn;->c:Lgfn;

    invoke-interface {v0}, Lgfn;->isEnabled()Z

    move-result v0

    const/4 v5, 0x1

    if-eqz v0, :cond_b6

    const/4 v0, 0x2

    if-ne p0, v0, :cond_b6

    move v0, v5

    goto :goto_b7

    :cond_b6
    move v0, v3

    :goto_b7
    iget-object v6, v1, Lydn;->c:Lgfn;

    invoke-interface {v6}, Lgfn;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_c9

    iget-object v1, v1, Lydn;->f:Lqq8;

    invoke-virtual {v1}, Lqq8;->g()Z

    move-result v1

    if-eqz v1, :cond_c9

    if-eq p0, v5, :cond_ca

    :cond_c9
    move v5, v3

    :cond_ca
    iget-object p0, v4, Lpt1;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v0, :cond_d2

    move v0, v3

    goto :goto_d3

    :cond_d2
    move v0, v2

    :goto_d3
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, v4, Lpt1;->f:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_dd

    move v2, v3

    :cond_dd
    invoke-virtual {p0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final c()V
    .registers 14

    iget-object v0, p0, Lbdn;->d:Lpt1;

    iget-object v1, v0, Lpt1;->b:Landroid/view/View;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->isChecked()Z

    move-result v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v2, p0, Lbdn;->a:Landroid/content/Context;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-virtual {p0}, Lbdn;->a()I

    move-result v4

    const/4 v5, 0x2

    const/4 v6, 0x3

    iget-boolean v7, p0, Lbdn;->f:Z

    const/4 v8, 0x1

    const/4 v9, 0x0

    const v10, 0x7f040316

    iget-object v11, p0, Lbdn;->c:Lydn;

    if-nez v1, :cond_52

    const-string v1, "compression"

    invoke-virtual {v3, v1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_52

    iget-object v1, v11, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    if-nez v1, :cond_52

    new-instance v1, Ldxh;

    invoke-direct {v1, v10}, Ldxh;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    new-instance v1, Lrxh;

    const v2, 0x7f141375

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    goto/16 :goto_fa

    :cond_52
    iget-object v1, p0, Lbdn;->h:Lcdn;

    iget v1, v1, Lcdn;->k:I

    invoke-static {v1}, Lvep;->A(I)I

    move-result v1

    const/4 v3, 0x4

    if-eqz v1, :cond_98

    if-eq v1, v8, :cond_8f

    if-eq v1, v5, :cond_85

    if-eq v1, v6, :cond_7b

    if-ne v1, v3, :cond_ed

    new-instance v1, Lrxh;

    const v2, 0x7f1401b7

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    new-instance v2, Lsxh;

    const v3, 0x7f141380

    invoke-direct {v2, v3, v1}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    goto/16 :goto_ef

    :cond_7b
    new-instance v2, Lrxh;

    const v1, 0x7f14137f

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto/16 :goto_ef

    :cond_85
    new-instance v2, Lrxh;

    const v1, 0x7f14137e

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto/16 :goto_ef

    :cond_8f
    new-instance v2, Lrxh;

    const v1, 0x7f14137d

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_ef

    :cond_98
    const v1, 0x7f1413fe

    const v10, 0x1010038

    if-eqz v7, :cond_a6

    new-instance v2, Lrxh;

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_ef

    :cond_a6
    const v12, 0x7f04021f

    if-ne v4, v8, :cond_c2

    iget-object v3, v11, Lydn;->f:Lqq8;

    invoke-virtual {v3}, Lqq8;->g()Z

    move-result v3

    if-eqz v3, :cond_bb

    iget-object v1, v11, Lydn;->f:Lqq8;

    invoke-virtual {v1, v2}, Lqq8;->f(Landroid/content/Context;)Lsxh;

    move-result-object v1

    move-object v2, v1

    goto :goto_c0

    :cond_bb
    new-instance v2, Lrxh;

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    :goto_c0
    move v10, v12

    goto :goto_ef

    :cond_c2
    if-ne v4, v6, :cond_d7

    iget-object v1, v11, Lydn;->e:Lsgi;

    iget-boolean v1, v1, Lsgi;->d:Z

    if-eqz v1, :cond_ce

    const v1, 0x7f141404

    goto :goto_d1

    :cond_ce
    const v1, 0x7f14117e

    :goto_d1
    new-instance v2, Lrxh;

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_ef

    :cond_d7
    if-ne v4, v5, :cond_e2

    new-instance v2, Lrxh;

    const v1, 0x7f1413ff

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_ef

    :cond_e2
    if-ne v4, v3, :cond_ed

    new-instance v2, Lrxh;

    const v1, 0x7f141403

    invoke-direct {v2, v1}, Lrxh;-><init>(I)V

    goto :goto_c0

    :cond_ed
    const/4 v2, 0x0

    move v10, v9

    :goto_ef
    new-instance v1, Ldxh;

    invoke-direct {v1, v10}, Ldxh;-><init>(I)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    invoke-virtual {v0, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    :goto_fa
    if-nez v7, :cond_108

    invoke-virtual {p0}, Lbdn;->a()I

    move-result v1

    if-eq v1, v5, :cond_109

    invoke-virtual {p0}, Lbdn;->a()I

    move-result v1

    if-eq v1, v6, :cond_109

    :cond_108
    move v8, v9

    :cond_109
    iget-object v1, v11, Lydn;->c:Lgfn;

    invoke-interface {v1}, Lgfn;->isEnabled()Z

    move-result v1

    iget-object p0, p0, Lbdn;->m:Locn;

    if-eqz v1, :cond_183

    iget-object p0, p0, Locn;->a:Lncn;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    const/high16 v2, 0x42200000    # 40.0f

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v2, v3}, Lfan;->a(FLandroid/content/res/Resources;)I

    move-result v2

    const v3, 0x7f06063b

    if-eqz v8, :cond_162

    const v4, 0x7f040a75

    invoke-static {v4, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v4

    const v5, 0x3df5c28f    # 0.12f

    invoke-static {v5, v4}, Lp37;->a0(FI)I

    move-result v4

    const v6, 0x7f040a76

    invoke-static {v6, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {v5, v1}, Lp37;->a0(FI)I

    move-result v1

    new-instance v3, Landroid/graphics/drawable/shapes/OvalShape;

    invoke-direct {v3}, Landroid/graphics/drawable/shapes/OvalShape;-><init>()V

    new-instance v5, Landroid/graphics/drawable/ShapeDrawable;

    invoke-direct {v5, v3}, Landroid/graphics/drawable/ShapeDrawable;-><init>(Landroid/graphics/drawable/shapes/Shape;)V

    new-instance v3, Landroid/graphics/Rect;

    invoke-direct {v3}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v5, v3}, Landroid/graphics/drawable/ShapeDrawable;->setPadding(Landroid/graphics/Rect;)V

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicWidth(I)V

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/ShapeDrawable;->setIntrinsicHeight(I)V

    new-instance v2, Lvcn;

    invoke-direct {v2, v4, v1}, Lvcn;-><init>(II)V

    invoke-virtual {v5, v2}, Landroid/graphics/drawable/ShapeDrawable;->setShaderFactory(Landroid/graphics/drawable/ShapeDrawable$ShaderFactory;)V

    goto :goto_17e

    :cond_162
    const p0, 0x7f0402ff

    invoke-static {p0, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    invoke-static {v2, p0}, Lj14;->D(II)Landroid/graphics/drawable/ShapeDrawable;

    move-result-object v5

    const p0, 0x7f08062d

    invoke-static {p0, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const v2, 0x7f0402c8

    invoke-static {v2, v1, v3}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v1

    invoke-static {p0, v1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    :goto_17e
    invoke-static {v5, p0}, Lj14;->p(Landroid/graphics/drawable/Drawable;Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    goto :goto_18d

    :cond_183
    iget-object p0, p0, Locn;->a:Lncn;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v8, p0, v1}, Lddh;->p(ZLandroid/graphics/drawable/Drawable;Landroid/content/Context;)Landroid/graphics/drawable/LayerDrawable;

    move-result-object p0

    :goto_18d
    new-instance v1, Lmxh;

    invoke-direct {v1, p0}, Lmxh;-><init>(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v0, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->z(Lb8h;)V

    return-void
.end method

.method public final getLifecycle()Ltcc;
    .registers 1

    iget-object p0, p0, Lbdn;->l:Lqdc;

    return-object p0
.end method
