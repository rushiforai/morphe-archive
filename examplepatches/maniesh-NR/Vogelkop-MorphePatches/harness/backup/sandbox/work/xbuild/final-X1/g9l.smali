.class public final synthetic Lg9l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lf7f;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lg9l;->a:B

    iput-object p1, p0, Lg9l;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 19

    move-object/from16 v0, p0

    iget-byte v1, v0, Lg9l;->a:B

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x1

    iget-object v0, v0, Lg9l;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_324

    check-cast v0, Ljmn;

    move-object/from16 v1, p1

    check-cast v1, Landroid/util/Size;

    iget-object v2, v0, Ljmn;->z:Lkmn;

    iget-object v2, v2, Lkmn;->b:Lcom/opera/android/widget/AspectRatioLayout;

    iget-object v3, v2, Lcom/opera/android/widget/AspectRatioLayout;->a:Landroid/util/Size;

    invoke-static {v1, v3}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_24

    iput-object v1, v2, Lcom/opera/android/widget/AspectRatioLayout;->a:Landroid/util/Size;

    invoke-virtual {v2}, Landroid/view/View;->requestLayout()V

    :cond_24
    iget-object v1, v0, Ljmn;->z:Lkmn;

    iget-object v1, v1, Lkmn;->j:Landroid/view/View;

    invoke-virtual {v0, v1}, Ljmn;->I0(Landroid/view/View;)V

    return-void

    :pswitch_2c
    check-cast v0, Ltln;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Ltln;->B:Lqkn;

    if-eqz v0, :cond_3b

    iget-object v0, v0, Lqkn;->j:Lujn;

    invoke-virtual {v0, v1}, Lujn;->T(Ljava/util/List;)V

    :cond_3b
    return-void

    :pswitch_3c
    check-cast v0, Lukn;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v1, v0, Lukn;->D:Lqkn;

    if-eqz v1, :cond_d6

    iget-object v1, v0, Lukn;->w:Lk3i;

    invoke-virtual {v1}, Lk3i;->c()Z

    move-result v1

    if-eqz v1, :cond_55

    iget-object v1, v0, Lukn;->B:Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v1, :cond_55

    invoke-virtual {v1, v5}, Landroid/view/View;->setEnabled(Z)V

    :cond_55
    iget-object v1, v0, Lukn;->v:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Lrkn;

    iget-object v1, v1, Lrkn;->b:Landroid/os/Bundle;

    if-eqz v1, :cond_71

    const-string v2, "category"

    invoke-virtual {v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "premium_only"

    invoke-virtual {v1, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v1, v2}, Landroid/os/Bundle;->remove(Ljava/lang/String;)V

    goto :goto_72

    :cond_71
    move-object v6, v4

    :goto_72
    iget-object v1, v0, Lukn;->D:Lqkn;

    if-eqz v1, :cond_c5

    iget-boolean v2, v0, Lukn;->J:Z

    if-nez v2, :cond_c5

    if-eqz v4, :cond_b1

    iget-object v2, v1, Lqkn;->j:Lujn;

    iget-object v2, v2, Ldt1;->d:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    :cond_86
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_af

    invoke-interface {v2}, Ljava/util/ListIterator;->nextIndex()I

    move-result v7

    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lmkb;

    instance-of v9, v8, Lbkb;

    if-eqz v9, :cond_86

    check-cast v8, Lbkb;

    iget v8, v8, Lbkb;->a:I

    invoke-static {v8}, Lam2;->c(I)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v8, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_86

    iget-object v1, v1, Lqkn;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v1, v7}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    move v1, v5

    goto :goto_b5

    :cond_af
    move v1, v3

    goto :goto_b5

    :cond_b1
    invoke-virtual {v1}, Lqkn;->d()Z

    move-result v1

    :goto_b5
    if-eqz v1, :cond_c5

    iput-boolean v5, v0, Lukn;->J:Z

    iget-object v1, v0, Lukn;->C:Lcom/google/android/material/appbar/AppBarLayout;

    if-eqz v1, :cond_c5

    invoke-virtual {v1, v5, v5}, Lcom/google/android/material/appbar/AppBarLayout;->l(ZZ)Z

    iget-object v1, v0, Lukn;->C:Lcom/google/android/material/appbar/AppBarLayout;

    invoke-virtual {v1, v3, v3, v5}, Lcom/google/android/material/appbar/AppBarLayout;->k(ZZZ)V

    :cond_c5
    if-eqz v6, :cond_cf

    const-string v1, "true"

    invoke-virtual {v6, v1}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v1

    iput-boolean v1, v0, Lukn;->I:Z

    :cond_cf
    iget-object v1, v0, Lukn;->D:Lqkn;

    iget-boolean v0, v0, Lukn;->I:Z

    invoke-virtual {v1, v0}, Lqkn;->c(Z)V

    :cond_d6
    return-void

    :pswitch_d7
    check-cast v0, Lnkn;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lnkn;->B:Lqkn;

    if-eqz v0, :cond_e6

    iget-object v0, v0, Lqkn;->j:Lujn;

    invoke-virtual {v0, v1}, Lujn;->T(Ljava/util/List;)V

    :cond_e6
    return-void

    :pswitch_e7
    check-cast v0, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;

    move-object/from16 v1, p1

    check-cast v1, Lxen;

    sget v2, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->b:I

    invoke-virtual {v0}, Landroid/service/quicksettings/TileService;->getQsTile()Landroid/service/quicksettings/Tile;

    move-result-object v2

    if-eqz v2, :cond_122

    iget v4, v1, Lxen;->b:I

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/service/quicksettings/Tile;->setSubtitle(Ljava/lang/CharSequence;)V

    invoke-virtual {v2}, Landroid/service/quicksettings/Tile;->getLabel()Ljava/lang/CharSequence;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/service/quicksettings/Tile;->setContentDescription(Ljava/lang/CharSequence;)V

    iget-byte v4, v1, Lxen;->a:B

    invoke-virtual {v2, v4}, Landroid/service/quicksettings/Tile;->setState(I)V

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    iget v6, v1, Lxen;->c:I

    invoke-static {v4, v6}, Landroid/graphics/drawable/Icon;->createWithResource(Landroid/content/Context;I)Landroid/graphics/drawable/Icon;

    move-result-object v4

    invoke-virtual {v2, v4}, Landroid/service/quicksettings/Tile;->setIcon(Landroid/graphics/drawable/Icon;)V

    invoke-virtual {v2}, Landroid/service/quicksettings/Tile;->updateTile()V

    sget-object v2, Lxen;->d:Lxen;

    if-eq v1, v2, :cond_11f

    move v3, v5

    :cond_11f
    invoke-virtual {v0, v3}, Lcom/opera/android/vpn/quick_settings_tile/VpnProQuickSettingsTileService;->a(Z)V

    :cond_122
    return-void

    :pswitch_123
    check-cast v0, Lxbf;

    move-object/from16 v1, p1

    check-cast v1, Lhbn;

    iget-object v1, v0, Lxbf;->f:Ljava/lang/Object;

    check-cast v1, Lvbn;

    invoke-interface {v1}, Lvbn;->j()Lo2g;

    move-result-object v1

    if-eqz v1, :cond_149

    iget-object v2, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v2, Lo2g;

    if-eq v1, v2, :cond_149

    iput-object v1, v0, Lxbf;->c:Ljava/lang/Object;

    iget-object v2, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v2}, Ln2d;->invalidate()V

    iget-object v1, v1, Lo2g;->c:Ljava/lang/Object;

    check-cast v1, Ls75;

    invoke-virtual {v0, v1, v4}, Lxbf;->E(Ls75;Ljava/lang/Runnable;)V

    :cond_149
    return-void

    :pswitch_14a
    check-cast v0, Lxpm;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v0, Lxpm;->c:Lpde;

    invoke-static {v0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void

    :pswitch_159
    check-cast v0, Lr4m;

    move-object/from16 v1, p1

    check-cast v1, Ld5m;

    invoke-virtual {v0, v1}, Lr4m;->e0(Ld5m;)V

    return-void

    :pswitch_163
    check-cast v0, Lb4m;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0}, Lb4m;->a()V

    return-void

    :pswitch_16d
    check-cast v0, Lpr;

    move-object/from16 v1, p1

    check-cast v1, Lzul;

    iget-object v0, v0, Lpr;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/BrowserFragment;

    iget v2, v1, Lzul;->a:I

    iget v1, v1, Lzul;->b:I

    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    invoke-virtual {v0, v2, v1}, Lckf;->e(II)V

    return-void

    :pswitch_183
    check-cast v0, Lapl;

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lapl;->b:Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;

    iget-boolean v2, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    if-eq v2, v1, :cond_198

    iput-boolean v1, v0, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->f:Z

    invoke-virtual {v0}, Lcom/opera/android/mainmenu/tiles/MainMenuTileLayout;->b()V

    :cond_198
    return-void

    :pswitch_199
    check-cast v0, Lh5k;

    move-object/from16 v1, p1

    check-cast v1, Leyj;

    invoke-virtual {v0}, Lh5k;->e()V

    return-void

    :pswitch_1a3
    check-cast v0, Lzkk;

    iget-object v0, v0, Lzkk;->a:Lx5f;

    move-object/from16 v1, p1

    check-cast v1, Lb3c;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v3, 0x6

    if-eqz v1, :cond_207

    if-eq v1, v5, :cond_1e2

    if-eq v1, v2, :cond_1bd

    const/4 v0, 0x3

    if-eq v1, v0, :cond_22b

    invoke-static {}, Lh9o;->p()V

    goto :goto_22b

    :cond_1bd
    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_22b

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v4, Lck0;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbs0;

    iget-object v1, v1, Lbs0;->a:Lc66;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lwr0;->c:Lwr0;

    invoke-virtual {v1, v3, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    goto :goto_22b

    :cond_1e2
    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_22b

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v4, Lck0;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbs0;

    iget-object v1, v1, Lbs0;->a:Lc66;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lwr0;->b:Lwr0;

    invoke-virtual {v1, v3, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    goto :goto_22b

    :cond_207
    iget-boolean v1, v0, Lx5f;->h:Z

    if-eqz v1, :cond_22b

    iget-object v1, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v2

    new-instance v4, Lck0;

    invoke-direct {v4, v1, v2}, Lck0;-><init>(Lzpa;Lx56;)V

    iget-object v1, v4, Lck0;->k:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lbs0;

    iget-object v1, v1, Lbs0;->a:Lc66;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lwr0;->d:Lwr0;

    invoke-virtual {v1, v3, v5, v4}, Ljf0;->q(IILjava/lang/Object;)V

    invoke-virtual {v0, v2}, Lx5f;->U0(Lx56;)V

    :cond_22b
    :goto_22b
    return-void

    :pswitch_22c
    check-cast v0, Lcom/opera/android/tabui2/FadeoutRecyclerView;

    move-object/from16 v1, p1

    check-cast v1, Lfo8;

    iget-object v0, v0, Lcom/opera/android/tabui2/FadeoutRecyclerView;->G0:Lvzk;

    iget-object v5, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/tabui2/FadeoutRecyclerView;

    iget-object v6, v0, Lvzk;->d:Ljava/lang/Object;

    check-cast v6, Lfo8;

    invoke-static {v6, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_2d6

    iput-object v1, v0, Lvzk;->d:Ljava/lang/Object;

    iget-object v6, v1, Lfo8;->a:Lfvl;

    iget-object v1, v1, Lfo8;->b:Lqp3;

    invoke-virtual {v6}, Lfvl;->a()Z

    move-result v7

    if-nez v7, :cond_259

    invoke-virtual {v1}, Lqp3;->a()Z

    move-result v7

    if-nez v7, :cond_259

    invoke-virtual {v5, v3, v4}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    goto/16 :goto_2d3

    :cond_259
    invoke-virtual {v5, v2, v4}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    invoke-virtual {v6}, Lfvl;->a()Z

    move-result v2

    const v4, 0x3c23d70a    # 0.01f

    if-eqz v2, :cond_281

    iget-object v2, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v2, Landroid/graphics/Paint;

    new-instance v7, Landroid/graphics/LinearGradient;

    iget v8, v6, Lfvl;->a:I

    int-to-float v9, v8

    add-float v11, v9, v4

    iget v6, v6, Lfvl;->b:F

    invoke-static {v6, v3}, Lp37;->j0(FI)I

    move-result v12

    const/4 v13, 0x0

    sget-object v14, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v8, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v7 .. v14}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v2, v7}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_281
    invoke-virtual {v1}, Lqp3;->a()Z

    move-result v2

    if-eqz v2, :cond_2d3

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    iget v6, v1, Lqp3;->c:F

    const/4 v7, 0x4

    new-array v13, v7, [I

    new-array v14, v7, [F

    :goto_293
    if-ge v3, v7, :cond_2b8

    int-to-float v8, v3

    const/high16 v9, 0x3f800000    # 1.0f

    mul-float/2addr v8, v9

    const/high16 v9, 0x40400000    # 3.0f

    div-float/2addr v8, v9

    invoke-virtual {v2, v8}, Landroid/view/animation/DecelerateInterpolator;->getInterpolation(F)F

    move-result v9

    mul-float/2addr v9, v6

    float-to-double v9, v9

    const-wide v11, 0x40019999a0000000L    # 2.200000047683716

    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->pow(DD)D

    move-result-wide v9

    double-to-float v9, v9

    aput v8, v14, v3

    const/4 v8, 0x0

    invoke-static {v9, v8, v8, v8}, Landroid/graphics/Color;->argb(FFFF)I

    move-result v8

    aput v8, v13, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_293

    :cond_2b8
    iget-object v0, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Landroid/graphics/Paint;

    new-instance v8, Landroid/graphics/LinearGradient;

    iget v1, v1, Lqp3;->a:I

    int-to-float v1, v1

    cmpg-float v2, v1, v4

    if-gez v2, :cond_2c7

    move v12, v4

    goto :goto_2c8

    :cond_2c7
    move v12, v1

    :goto_2c8
    sget-object v15, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    const/4 v9, 0x0

    const/4 v10, 0x0

    const/4 v11, 0x0

    invoke-direct/range {v8 .. v15}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    invoke-virtual {v0, v8}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    :cond_2d3
    :goto_2d3
    invoke-virtual {v5}, Landroid/view/View;->invalidate()V

    :cond_2d6
    return-void

    :pswitch_2d7
    check-cast v0, Lr05;

    move-object/from16 v1, p1

    check-cast v1, Lg03;

    iget v2, v0, Lr05;->b:I

    iget v3, v1, Lg03;->a:I

    add-int/2addr v2, v3

    iget v3, v1, Lg03;->b:I

    invoke-static {v2, v3}, Ljava/lang/Math;->max(II)I

    move-result v2

    iget-object v3, v0, Lr05;->e:Ljava/lang/Object;

    check-cast v3, Lebl;

    iget-object v4, v3, Lebl;->j:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-static {v2, v4}, Lp37;->p0(ILandroid/view/View;)V

    iget-object v4, v3, Lebl;->g:Lcom/opera/android/tabui2/FadeoutRecyclerView;

    invoke-static {v2, v4}, Lp37;->p0(ILandroid/view/View;)V

    iget-object v5, v3, Lebl;->b:Lcom/opera/android/custom_views/EqualWidthLinearLayout;

    iget v2, v0, Lr05;->c:I

    iget v1, v1, Lg03;->a:I

    add-int v9, v2, v1

    const/4 v10, 0x7

    const/4 v6, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-static/range {v5 .. v10}, Lp37;->o0(Landroid/view/View;IIIII)V

    iget-object v11, v3, Lebl;->A:Lcom/google/android/material/floatingactionbutton/FloatingActionButton;

    iget v0, v0, Lr05;->d:I

    add-int v15, v0, v1

    const/16 v16, 0x7

    const/4 v12, 0x0

    const/4 v13, 0x0

    const/4 v14, 0x0

    invoke-static/range {v11 .. v16}, Lp37;->o0(Landroid/view/View;IIIII)V

    return-void

    :pswitch_314
    check-cast v0, Ls9i;

    move-object/from16 v1, p1

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-virtual {v1}, Ljava/util/AbstractCollection;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_323

    invoke-virtual {v0}, Ls9i;->h0()V

    :cond_323
    return-void

    :pswitch_data_324
    .packed-switch 0x0
        :pswitch_314
        :pswitch_2d7
        :pswitch_22c
        :pswitch_1a3
        :pswitch_199
        :pswitch_183
        :pswitch_16d
        :pswitch_163
        :pswitch_159
        :pswitch_14a
        :pswitch_123
        :pswitch_e7
        :pswitch_d7
        :pswitch_3c
        :pswitch_2c
    .end packed-switch
.end method
