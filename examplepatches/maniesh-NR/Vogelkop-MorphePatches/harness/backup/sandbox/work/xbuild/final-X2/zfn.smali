.class public final synthetic Lzfn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcgn;


# direct methods
.method public synthetic constructor <init>(Lcgn;B)V
    .registers 3

    iput-byte p2, p0, Lzfn;->a:B

    iput-object p1, p0, Lzfn;->b:Lcgn;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 29

    move-object/from16 v0, p0

    iget-byte v1, v0, Lzfn;->a:B

    iget-object v0, v0, Lzfn;->b:Lcgn;

    packed-switch v1, :pswitch_data_5ee

    iget-object v1, v0, Lcgn;->v:Lydn;

    move-object/from16 v4, p1

    check-cast v4, Legn;

    iget-boolean v5, v4, Legn;->c:Z

    iget-object v6, v4, Legn;->a:Luvg;

    iget-boolean v7, v4, Legn;->d:Z

    iget-byte v8, v4, Legn;->b:B

    if-eqz v5, :cond_1d

    const v5, 0x7f1413ee

    goto :goto_20

    :cond_1d
    const v5, 0x7f141408

    :goto_20
    invoke-virtual {v0, v5}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    iget-object v9, v0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v9, v5}, Landroidx/appcompat/widget/Toolbar;->D(Ljava/lang/CharSequence;)V

    iget-object v5, v0, Lcgn;->y:Lxt8;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v9

    const/4 v10, 0x2

    const/4 v11, 0x1

    const v12, 0x7f0a0cb3

    const v13, 0x7f0a0cb2

    const/16 v15, 0x8

    const v2, 0x7f0a04d4

    if-eqz v8, :cond_a2

    if-eq v8, v11, :cond_73

    if-ne v8, v10, :cond_d7

    iget-object v11, v0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    iget-boolean v3, v4, Legn;->c:Z

    iget-boolean v14, v11, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    if-eq v3, v14, :cond_4f

    iput-boolean v3, v11, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    invoke-virtual {v11}, Lcom/opera/android/settings/BigSwitchButton;->a()V

    :cond_4f
    invoke-virtual {v5, v10}, Lxt8;->S(I)V

    invoke-virtual {v9, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v15}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v15}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v15}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f0a0cb4

    invoke-virtual {v9, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    const/4 v11, 0x0

    invoke-virtual {v3, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_d7

    :cond_73
    const/4 v11, 0x0

    iget-object v3, v0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    iget-boolean v14, v3, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    if-eqz v14, :cond_7f

    iput-boolean v11, v3, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    invoke-virtual {v3}, Lcom/opera/android/settings/BigSwitchButton;->a()V

    :cond_7f
    invoke-virtual {v5, v10}, Lxt8;->S(I)V

    invoke-virtual {v9, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v15}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f0a0cb4

    invoke-virtual {v9, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v15}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    goto :goto_d7

    :cond_a2
    const/4 v11, 0x0

    iget-object v3, v0, Lcgn;->L:Lcom/opera/android/settings/BigSwitchButton;

    iget-boolean v5, v3, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    if-eqz v5, :cond_ae

    iput-boolean v11, v3, Lcom/opera/android/settings/BigSwitchButton;->i:Z

    invoke-virtual {v3}, Lcom/opera/android/settings/BigSwitchButton;->a()V

    :cond_ae
    invoke-virtual {v9, v13}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v15}, Landroid/view/View;->setVisibility(I)V

    const v3, 0x7f0a0cb4

    invoke-virtual {v9, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    invoke-virtual {v5, v15}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v3, v11}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v9, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-virtual {v2, v11}, Landroid/view/View;->setVisibility(I)V

    const v2, 0x7f0a0594

    invoke-virtual {v0, v2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    invoke-interface {v2, v11}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_d7
    :goto_d7
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_f2

    if-eqz v8, :cond_566

    const v17, 0x7f140ebb

    const-string v14, "Missing required view with ID: "

    const v11, 0x7f0a0cbc

    const v13, 0x7f0a0cb0

    const v9, 0x7f0a0124

    const/4 v3, 0x1

    if-eq v8, v3, :cond_423

    if-eq v8, v10, :cond_fc

    :cond_f2
    move-object/from16 v25, v1

    move-object v11, v6

    move/from16 v21, v7

    move/from16 v22, v8

    move v5, v15

    goto/16 :goto_587

    :cond_fc
    const v3, 0x7f0a0cb4

    invoke-virtual {v2, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    invoke-static {v9, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v3, :cond_411

    const v9, 0x7f0a063e

    invoke-static {v9, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v16

    move-object/from16 v9, v16

    check-cast v9, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v9, :cond_40d

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v16

    move-object/from16 v13, v16

    check-cast v13, Lcom/opera/android/widget/FaqItemView;

    if-eqz v13, :cond_409

    const v12, 0x7f0a0cb1

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v12, v18

    check-cast v12, Lcom/opera/android/widget/FaqItemView;

    if-eqz v12, :cond_405

    const v15, 0x7f0a0cb5

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v15, v18

    check-cast v15, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v15, :cond_401

    const v5, 0x7f0a0cb8

    invoke-static {v5, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v5, v18

    check-cast v5, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v5, :cond_3fd

    const v10, 0x7f0a0cb9

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v10, v18

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_3f9

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v11, v18

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v11, :cond_3f5

    move/from16 v21, v7

    const v7, 0x7f0a0cbd

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v7, v18

    check-cast v7, Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v7, :cond_3f1

    move/from16 v22, v8

    iget-object v8, v7, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    move-object/from16 v23, v6

    const v6, 0x7f0a0cc3

    invoke-static {v6, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v18

    move-object/from16 v6, v18

    check-cast v6, Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v6, :cond_3ed

    iget-object v14, v6, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    check-cast v2, Landroid/widget/LinearLayout;

    iget-boolean v2, v4, Legn;->e:Z

    move/from16 v18, v2

    iget-boolean v2, v4, Legn;->f:Z

    move/from16 v19, v2

    iget-boolean v2, v4, Legn;->g:Z

    move/from16 v20, v2

    iget-object v2, v4, Legn;->h:Lnfn;

    iget-object v4, v4, Legn;->i:Ldgh;

    move-object/from16 v24, v12

    iget-object v12, v1, Lydn;->l:Landroid/content/Context;

    invoke-static {v12}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v12

    iget-object v12, v12, Lru9;->a:Landroid/content/SharedPreferences;

    move-object/from16 v25, v1

    const-string v1, "vpn.vpnpro_auto_connect"

    move-object/from16 v26, v13

    const/4 v13, 0x0

    invoke-interface {v12, v1, v13}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v1

    const/4 v12, 0x1

    if-ne v1, v12, :cond_1b0

    const/4 v1, 0x1

    goto :goto_1b1

    :cond_1b0
    move v1, v13

    :goto_1b1
    invoke-virtual {v3, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    new-instance v1, Lxfn;

    invoke-direct {v1, v0, v13}, Lxfn;-><init>(Lcgn;B)V

    iput-object v1, v3, Lcom/opera/android/ui/catalog/widget/OperaListItem;->u:Lvlf;

    new-instance v1, Lyfn;

    invoke-direct {v1, v0, v13}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v9, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v20, :cond_1c7

    const/4 v1, 0x0

    goto :goto_1c9

    :cond_1c7
    const/16 v1, 0x8

    :goto_1c9
    invoke-virtual {v9, v1}, Landroid/view/View;->setVisibility(I)V

    iput-object v11, v0, Lcgn;->N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v1, Lyfn;

    const/4 v3, 0x1

    invoke-direct {v1, v0, v3}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v15, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v21, :cond_1db

    const/4 v1, 0x0

    goto :goto_1dd

    :cond_1db
    const/16 v1, 0x8

    :goto_1dd
    invoke-virtual {v15, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lyfn;

    const/4 v3, 0x2

    invoke-direct {v1, v0, v3}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v10, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v18, :cond_1ed

    const/4 v1, 0x0

    goto :goto_1ef

    :cond_1ed
    const/16 v1, 0x8

    :goto_1ef
    invoke-virtual {v10, v1}, Landroid/view/View;->setVisibility(I)V

    new-instance v1, Lyfn;

    const/4 v3, 0x3

    invoke-direct {v1, v0, v3}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v5, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v19, :cond_1ff

    const/4 v1, 0x0

    goto :goto_201

    :cond_1ff
    const/16 v1, 0x8

    :goto_201
    invoke-virtual {v5, v1}, Landroid/view/View;->setVisibility(I)V

    const/4 v1, 0x5

    const/4 v3, -0x1

    if-nez v4, :cond_227

    iget-object v4, v0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    if-nez v4, :cond_20e

    const/4 v4, 0x0

    goto :goto_21e

    :cond_20e
    iget-object v5, v0, Lltl;->g:Lwjj;

    if-nez v5, :cond_214

    :goto_212
    const/4 v4, 0x0

    goto :goto_21c

    :cond_214
    iget-object v5, v5, Lwjj;->d:Ljava/lang/Object;

    check-cast v5, Lcan;

    invoke-virtual {v5, v4}, Lcan;->a(Landroid/view/View;)V

    goto :goto_212

    :goto_21c
    iput-object v4, v0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    :goto_21e
    iput-object v4, v0, Lcgn;->R:Ljava/lang/Class;

    const/16 v4, 0x8

    invoke-virtual {v7, v4}, Landroid/view/View;->setVisibility(I)V

    goto/16 :goto_2f8

    :cond_227
    instance-of v5, v4, Lafn;

    if-eqz v5, :cond_230

    const v9, 0x7f1411d8

    :goto_22e
    const/4 v11, 0x0

    goto :goto_23b

    :cond_230
    instance-of v9, v4, Lzen;

    if-eqz v9, :cond_237

    move/from16 v9, v17

    goto :goto_22e

    :cond_237
    const v9, 0x7f1409d6

    goto :goto_22e

    :goto_23b
    invoke-virtual {v7, v11}, Landroid/view/View;->setVisibility(I)V

    if-eqz v5, :cond_248

    const/4 v10, 0x0

    invoke-virtual {v7, v10}, Lcom/opera/android/custom_views/VpnProBanner;->r(Ljava/lang/String;)V

    const v11, 0x7f1411d7

    goto :goto_255

    :cond_248
    const v10, 0x7f1413ac

    invoke-virtual {v0, v10}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v7, v10}, Lcom/opera/android/custom_views/VpnProBanner;->r(Ljava/lang/String;)V

    const v11, 0x7f1407e6

    :goto_255
    invoke-virtual {v0, v11}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v10

    iget-object v11, v8, Lpt1;->c:Landroid/view/View;

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v11, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v9}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v9

    iget-object v10, v8, Lpt1;->f:Ljava/lang/Object;

    check-cast v10, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v10, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v5, :cond_274

    new-instance v9, Lyfn;

    const/4 v10, 0x6

    invoke-direct {v9, v0, v10}, Lyfn;-><init>(Lcgn;B)V

    goto :goto_279

    :cond_274
    new-instance v9, Lobn;

    invoke-direct {v9, v0, v4, v1}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    :goto_279
    iget-object v8, v8, Lpt1;->f:Ljava/lang/Object;

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v8, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v7, v9}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v8

    iget-object v9, v0, Lcgn;->R:Ljava/lang/Class;

    if-eq v8, v9, :cond_2f8

    iget-object v8, v0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    if-nez v8, :cond_291

    const/4 v10, 0x0

    goto :goto_2a1

    :cond_291
    iget-object v9, v0, Lltl;->g:Lwjj;

    if-nez v9, :cond_297

    :goto_295
    const/4 v10, 0x0

    goto :goto_29f

    :cond_297
    iget-object v9, v9, Lwjj;->d:Ljava/lang/Object;

    check-cast v9, Lcan;

    invoke-virtual {v9, v8}, Lcan;->a(Landroid/view/View;)V

    goto :goto_295

    :goto_29f
    iput-object v10, v0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    :goto_2a1
    iput-object v10, v0, Lcgn;->R:Ljava/lang/Class;

    iget-object v8, v0, Lltl;->g:Lwjj;

    if-eqz v8, :cond_2cb

    iget-object v8, v8, Lwjj;->d:Ljava/lang/Object;

    check-cast v8, Lcan;

    iget-object v8, v8, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v9

    const/4 v10, 0x0

    const/4 v11, 0x0

    :goto_2b3
    if-ge v11, v9, :cond_2c8

    invoke-virtual {v8, v11}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v12

    add-int/lit8 v11, v11, 0x1

    check-cast v12, Lban;

    iget-object v12, v12, Lban;->a:Landroid/view/View;

    invoke-virtual {v12, v7}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v12

    if-nez v12, :cond_2c9

    add-int/lit8 v10, v10, 0x1

    goto :goto_2b3

    :cond_2c8
    move v10, v3

    :cond_2c9
    if-ne v10, v3, :cond_2f8

    :cond_2cb
    iput-object v7, v0, Lcgn;->Q:Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v5, :cond_2d4

    sget-object v5, Lkcn;->a:[Lkcn;

    const-string v5, "vpn_pro_still_active_reminder"

    goto :goto_2e1

    :cond_2d4
    instance-of v5, v4, Lbfn;

    if-eqz v5, :cond_2dd

    sget-object v5, Lkcn;->a:[Lkcn;

    const-string v5, "vpn_pro_paused"

    goto :goto_2e1

    :cond_2dd
    sget-object v5, Lkcn;->a:[Lkcn;

    const-string v5, "vpn_pro_canceled"

    :goto_2e1
    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    new-instance v8, Lagn;

    invoke-direct {v8, v0, v5, v4}, Lagn;-><init>(Lcgn;Ljava/lang/String;Ljava/lang/Class;)V

    iget-object v4, v0, Lltl;->g:Lwjj;

    if-eqz v4, :cond_2f8

    iget-object v4, v4, Lwjj;->d:Ljava/lang/Object;

    check-cast v4, Lcan;

    invoke-virtual {v4, v7, v8}, Lcan;->c(Landroid/view/View;Ly9n;)V

    invoke-virtual {v4}, Lcan;->d()V

    :cond_2f8
    :goto_2f8
    if-nez v2, :cond_318

    iget-object v1, v0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    if-nez v1, :cond_301

    :goto_2fe
    const/16 v5, 0x8

    goto :goto_312

    :cond_301
    iget-object v2, v0, Lltl;->g:Lwjj;

    if-nez v2, :cond_307

    :goto_305
    const/4 v10, 0x0

    goto :goto_30f

    :cond_307
    iget-object v2, v2, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Lcan;

    invoke-virtual {v2, v1}, Lcan;->a(Landroid/view/View;)V

    goto :goto_305

    :goto_30f
    iput-object v10, v0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    goto :goto_2fe

    :goto_312
    invoke-virtual {v6, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_315
    :goto_315
    const/4 v3, 0x2

    goto/16 :goto_3bc

    :cond_318
    const/16 v5, 0x8

    const/4 v11, 0x0

    invoke-virtual {v6, v11}, Landroid/view/View;->setVisibility(I)V

    new-instance v4, Lyfn;

    const/4 v7, 0x4

    invoke-direct {v4, v0, v7}, Lyfn;-><init>(Lcgn;B)V

    iget-object v8, v14, Lpt1;->f:Ljava/lang/Object;

    check-cast v8, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v8, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Lyfn;

    invoke-direct {v4, v0, v7}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v6, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v4, Lyfn;

    invoke-direct {v4, v0, v1}, Lyfn;-><init>(Lcgn;B)V

    iget-object v1, v14, Lpt1;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    const/4 v11, 0x0

    invoke-virtual {v1, v11}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v14, Lpt1;->g:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v2, Lnfn;->a:Ljava/lang/String;

    invoke-virtual {v6, v1}, Lcom/opera/android/custom_views/VpnProBanner;->r(Ljava/lang/String;)V

    iget-object v1, v2, Lnfn;->b:Ljava/lang/String;

    iget-object v4, v14, Lpt1;->c:Landroid/view/View;

    check-cast v4, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v4, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v2, Lnfn;->c:Ljava/lang/String;

    iget-object v2, v14, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    if-eq v6, v1, :cond_315

    if-eqz v1, :cond_374

    iget-object v2, v0, Lltl;->g:Lwjj;

    if-nez v2, :cond_36a

    :goto_368
    const/4 v10, 0x0

    goto :goto_372

    :cond_36a
    iget-object v2, v2, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Lcan;

    invoke-virtual {v2, v1}, Lcan;->a(Landroid/view/View;)V

    goto :goto_368

    :goto_372
    iput-object v10, v0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    :cond_374
    iget-object v1, v0, Lcgn;->F:Lpfn;

    iget-object v1, v1, Lpfn;->n:Lmfn;

    iget-boolean v1, v1, Lmfn;->d:Z

    if-nez v1, :cond_315

    iget-object v1, v0, Lltl;->g:Lwjj;

    if-eqz v1, :cond_3a4

    iget-object v1, v1, Lwjj;->d:Ljava/lang/Object;

    check-cast v1, Lcan;

    iget-object v1, v1, Lcan;->a:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x0

    const/4 v7, 0x0

    :goto_38c
    if-ge v7, v2, :cond_3a1

    invoke-virtual {v1, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    check-cast v8, Lban;

    iget-object v8, v8, Lban;->a:Landroid/view/View;

    invoke-virtual {v8, v6}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-nez v8, :cond_3a2

    add-int/lit8 v4, v4, 0x1

    goto :goto_38c

    :cond_3a1
    move v4, v3

    :cond_3a2
    if-ne v4, v3, :cond_315

    :cond_3a4
    iput-object v6, v0, Lcgn;->P:Lcom/opera/android/custom_views/VpnProBanner;

    new-instance v1, Lsvi;

    const/4 v3, 0x1

    invoke-direct {v1, v0, v3}, Lsvi;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v0, Lltl;->g:Lwjj;

    if-eqz v2, :cond_315

    iget-object v2, v2, Lwjj;->d:Ljava/lang/Object;

    check-cast v2, Lcan;

    invoke-virtual {v2, v6, v1}, Lcan;->c(Landroid/view/View;Ly9n;)V

    invoke-virtual {v2}, Lcan;->d()V

    goto/16 :goto_315

    :goto_3bc
    invoke-virtual {v0, v3}, Lcgn;->I0(I)Ljava/lang/String;

    move-result-object v1

    move-object/from16 v2, v26

    iget-object v2, v2, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-nez v2, :cond_3c7

    const/4 v2, 0x0

    :cond_3c7
    iget-object v2, v2, Lvs;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v2, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    move-object/from16 v1, v24

    const v2, 0x7f0a041d

    invoke-virtual {v1, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const v2, 0x7f14138e

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lwfn;

    const/4 v12, 0x1

    invoke-direct {v3, v0, v12}, Lwfn;-><init>(Lcgn;B)V

    invoke-static {v1, v2, v3}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    move-object/from16 v11, v23

    goto/16 :goto_587

    :cond_3ed
    const v11, 0x7f0a0cc3

    goto :goto_412

    :cond_3f1
    const v11, 0x7f0a0cbd

    goto :goto_412

    :cond_3f5
    const v11, 0x7f0a0cbc

    goto :goto_412

    :cond_3f9
    const v11, 0x7f0a0cb9

    goto :goto_412

    :cond_3fd
    const v11, 0x7f0a0cb8

    goto :goto_412

    :cond_401
    const v11, 0x7f0a0cb5

    goto :goto_412

    :cond_405
    const v11, 0x7f0a0cb1

    goto :goto_412

    :cond_409
    const v11, 0x7f0a0cb0

    goto :goto_412

    :cond_40d
    const v11, 0x7f0a063e

    goto :goto_412

    :cond_411
    move v11, v9

    :goto_412
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_5d8

    :cond_423
    move-object/from16 v25, v1

    move-object/from16 v23, v6

    move/from16 v21, v7

    move/from16 v22, v8

    move v5, v15

    const v1, 0x7f0a0cb2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v2, :cond_554

    const v3, 0x7f0a02c4

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_552

    const v3, 0x7f0a08ec

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v6, :cond_552

    const v7, 0x7f0a0cb0

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/opera/android/widget/FaqItemView;

    if-eqz v3, :cond_550

    const v7, 0x7f0a0cba

    invoke-static {v7, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/VpnProBanner;

    if-eqz v8, :cond_550

    iget-object v7, v8, Lcom/opera/android/custom_views/VpnProBanner;->p:Lpt1;

    const v9, 0x7f0a0cbc

    invoke-static {v9, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v10, :cond_554

    check-cast v1, Landroid/widget/LinearLayout;

    iget-boolean v4, v4, Legn;->j:Z

    new-instance v9, Lbgn;

    move-object/from16 v11, v23

    const/4 v12, 0x3

    invoke-direct {v9, v0, v11, v12}, Lbgn;-><init>(Lcgn;Luvg;B)V

    invoke-virtual {v2, v9}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v6, v0, Lcgn;->O:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Lyfn;

    const/16 v9, 0x9

    invoke-direct {v2, v0, v9}, Lyfn;-><init>(Lcgn;B)V

    invoke-virtual {v6, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v10, v0, Lcgn;->N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    new-instance v2, Lbgn;

    const/4 v13, 0x0

    invoke-direct {v2, v0, v11, v13}, Lbgn;-><init>(Lcgn;Luvg;B)V

    iget-object v6, v7, Lpt1;->f:Ljava/lang/Object;

    check-cast v6, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v6, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lbgn;

    const/4 v12, 0x1

    invoke-direct {v2, v0, v11, v12}, Lbgn;-><init>(Lcgn;Luvg;B)V

    invoke-virtual {v8, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v11}, Ljava/lang/Enum;->ordinal()I

    move-result v2

    const/4 v12, 0x3

    if-eq v2, v12, :cond_4bf

    const/4 v6, 0x4

    if-eq v2, v6, :cond_4bb

    if-eqz v4, :cond_4b7

    const v14, 0x7f1413aa

    goto :goto_4c1

    :cond_4b7
    const v14, 0x7f140809

    goto :goto_4c1

    :cond_4bb
    const v14, 0x7f1409d6

    goto :goto_4c1

    :cond_4bf
    move/from16 v14, v17

    :goto_4c1
    iget-object v2, v7, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    invoke-virtual {v6, v14}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v2, v6}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v10, 0x7f1413ac

    if-eqz v4, :cond_4e1

    invoke-virtual {v0, v10}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    const v2, 0x7f1407e6

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    goto :goto_50a

    :cond_4e1
    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v2

    invoke-virtual {v2}, Lno7;->i()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbxc;

    const/4 v13, 0x0

    invoke-virtual {v2, v13, v1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v4

    const/4 v12, 0x1

    invoke-virtual {v2, v12, v1}, Lbxc;->a(ILandroid/content/Context;)Ljava/lang/String;

    move-result-object v2

    if-nez v4, :cond_500

    invoke-virtual {v0, v10}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_501

    :cond_500
    move-object v1, v4

    :goto_501
    if-nez v2, :cond_50a

    const v2, 0x7f1413ab

    invoke-virtual {v0, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    :cond_50a
    :goto_50a
    invoke-virtual {v8, v1}, Lcom/opera/android/custom_views/VpnProBanner;->r(Ljava/lang/String;)V

    iget-object v1, v7, Lpt1;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v7, Lpt1;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    const v4, 0x7f0807ad

    invoke-static {v4, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    new-instance v1, Lso5;

    invoke-direct {v1}, Lso5;-><init>()V

    invoke-virtual {v1, v8}, Lso5;->d(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    const v2, 0x7f0a056f

    const/4 v12, 0x3

    const/4 v13, 0x0

    invoke-virtual {v1, v2, v12, v13, v12}, Lso5;->e(IIII)V

    invoke-virtual {v1, v8}, Lso5;->a(Landroidx/constraintlayout/widget/ConstraintLayout;)V

    const v2, 0x7f0a041d

    invoke-virtual {v3, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/TextView;

    const/4 v12, 0x1

    invoke-virtual {v0, v12}, Lcgn;->I0(I)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lwfn;

    invoke-direct {v3, v0, v12}, Lwfn;-><init>(Lcgn;B)V

    invoke-static {v1, v2, v3}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    goto :goto_587

    :cond_550
    move v11, v7

    goto :goto_555

    :cond_552
    move v11, v3

    goto :goto_555

    :cond_554
    move v11, v9

    :goto_555
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v11}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v14, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_5d8

    :cond_566
    move-object/from16 v25, v1

    move-object v11, v6

    move/from16 v21, v7

    move/from16 v22, v8

    move v5, v15

    invoke-virtual {v2, v12}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_5d3

    check-cast v1, Lcom/opera/android/widget/FaqItemView;

    const/4 v13, 0x0

    invoke-virtual {v0, v13}, Lcgn;->I0(I)Ljava/lang/String;

    move-result-object v2

    iget-object v1, v1, Lcom/opera/android/widget/FaqItemView;->q:Lvs;

    if-nez v1, :cond_580

    const/4 v1, 0x0

    :cond_580
    iget-object v1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v1, v2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :goto_587
    iget-object v1, v0, Lcgn;->N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_5b7

    new-instance v2, Lbgn;

    const/4 v3, 0x2

    invoke-direct {v2, v0, v11, v3}, Lbgn;-><init>(Lcgn;Luvg;B)V

    invoke-virtual {v1, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v1, v0, Lcgn;->N:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_5b7

    move-object/from16 v2, v25

    iget-object v2, v2, Lydn;->c:Lgfn;

    invoke-interface {v2}, Lgfn;->getProtocol()I

    move-result v2

    if-eqz v2, :cond_5b1

    const/4 v12, 0x1

    if-eq v2, v12, :cond_5ad

    if-eq v2, v3, :cond_5a9

    const/4 v11, 0x0

    goto :goto_5b4

    :cond_5a9
    const v11, 0x7f1413fd

    goto :goto_5b4

    :cond_5ad
    const v11, 0x7f1413fc

    goto :goto_5b4

    :cond_5b1
    const v11, 0x7f1413fb

    :goto_5b4
    invoke-static {v11, v1}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    :cond_5b7
    if-eqz v21, :cond_5c0

    move/from16 v1, v22

    const/4 v12, 0x1

    if-ne v1, v12, :cond_5c0

    move v11, v12

    goto :goto_5c1

    :cond_5c0
    const/4 v11, 0x0

    :goto_5c1
    iget-object v1, v0, Lcgn;->O:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    if-eqz v1, :cond_5cd

    if-eqz v11, :cond_5c9

    const/4 v3, 0x0

    goto :goto_5ca

    :cond_5c9
    move v3, v5

    :goto_5ca
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_5cd
    iget-object v0, v0, Lcgn;->J:Lrn9;

    invoke-virtual {v0}, Lrn9;->F()V

    goto :goto_5d8

    :cond_5d3
    const-string v0, "rootView"

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_5d8
    return-void

    :pswitch_5d9
    move-object/from16 v1, p1

    check-cast v1, Lpkj;

    sget-object v2, Lpkj;->a:Lpkj;

    if-ne v1, v2, :cond_5ec

    iget-object v0, v0, Lcgn;->B:Lhxk;

    check-cast v0, Lkxk;

    iget-object v0, v0, Lkxk;->f:Landroidx/fragment/app/w;

    const/4 v10, 0x0

    const/4 v13, 0x0

    invoke-static {v0, v13, v10}, Lxih;->t(Landroidx/fragment/app/w;ZLtvh;)V

    :cond_5ec
    return-void

    nop

    :pswitch_data_5ee
    .packed-switch 0x0
        :pswitch_5d9
    .end packed-switch
.end method
