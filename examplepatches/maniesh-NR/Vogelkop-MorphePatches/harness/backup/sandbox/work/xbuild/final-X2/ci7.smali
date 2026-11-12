.class public final synthetic Lci7;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Lci7;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 20

    move-object/from16 v0, p0

    iget-byte v1, v0, Lci7;->a:B

    const-string v2, ""

    const/4 v3, 0x2

    const/4 v4, 0x3

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v7, 0x1

    packed-switch v1, :pswitch_data_7e4

    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lfrd;

    iget-object v0, v0, Lfrd;->b:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "media_background_play"

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_24
    move-object/from16 v1, p1

    check-cast v1, Landroid/content/Intent;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Li8d;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :try_start_2f
    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->startActivity(Landroid/content/Intent;)V
    :try_end_32
    .catch Landroid/content/ActivityNotFoundException; {:try_start_2f .. :try_end_32} :catch_32

    :catch_32
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_35
    move-object/from16 v1, p1

    check-cast v1, Lp7d;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lr7d;

    iget-object v2, v0, Lr7d;->b:Lp12;

    iget-object v3, v2, Lp12;->d:Ljava/lang/Object;

    check-cast v3, Lx79;

    if-eqz v1, :cond_f2

    iget-boolean v4, v1, Lp7d;->b:Z

    iget-object v8, v0, Lr7d;->c:Lor2;

    if-nez v8, :cond_f2

    iget-object v8, v0, Lr7d;->a:Lt02;

    invoke-static {v4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v9

    invoke-virtual {v8, v9}, Lt02;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/view/ViewStub;

    invoke-virtual {v8}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v8

    const v9, 0x7f0a0322

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v13, v10

    check-cast v13, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v13, :cond_e0

    const v9, 0x7f0a06b5

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v14, v10

    check-cast v14, Landroid/widget/TextView;

    if-eqz v14, :cond_e0

    const v9, 0x7f0a06c5

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object v15, v10

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_e0

    const v9, 0x7f0a0cbb

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v16, v10

    check-cast v16, Landroid/widget/FrameLayout;

    if-eqz v16, :cond_e0

    const v9, 0x7f0a0cd6

    invoke-static {v9, v8}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    move-object/from16 v17, v10

    check-cast v17, Lcom/opera/android/custom_views/CornerRadiusLayout;

    if-eqz v17, :cond_e0

    new-instance v11, Lor2;

    move-object v12, v8

    check-cast v12, Landroid/widget/FrameLayout;

    invoke-direct/range {v11 .. v17}, Lor2;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Landroid/widget/TextView;Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/CornerRadiusLayout;)V

    move-object/from16 v10, v16

    move-object/from16 v8, v17

    new-instance v9, Lq7d;

    invoke-direct {v9, v11, v6}, Lq7d;-><init>(Lor2;B)V

    invoke-static {v13, v9}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v9, v13}, Lq7d;->a(Landroid/view/View;)V

    new-instance v9, Lq7d;

    invoke-direct {v9, v11, v7}, Lq7d;-><init>(Lor2;B)V

    invoke-static {v8, v9}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v9, v8}, Lq7d;->a(Landroid/view/View;)V

    new-instance v8, Lsma;

    const/16 v9, 0x16

    invoke-direct {v8, v0, v9}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v12, v8}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    if-eqz v4, :cond_dd

    new-instance v4, Lyzb;

    const/16 v8, 0xf

    invoke-direct {v4, v2, v8}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v3, Lx79;->a:Ljava/lang/Object;

    check-cast v2, Lcan;

    new-instance v8, Lu3b;

    invoke-direct {v8, v4}, Lu3b;-><init>(Lyzb;)V

    invoke-virtual {v2, v10, v8}, Lcan;->c(Landroid/view/View;Ly9n;)V

    invoke-virtual {v3}, Lx79;->O()V

    :cond_dd
    iput-object v11, v0, Lr7d;->c:Lor2;

    goto :goto_f2

    :cond_e0
    invoke-virtual {v8}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v9}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_13c

    :cond_f2
    :goto_f2
    iget-object v0, v0, Lr7d;->c:Lor2;

    if-eqz v0, :cond_13a

    iget-object v2, v0, Lor2;->c:Landroid/view/View;

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v1, :cond_fe

    move v4, v7

    goto :goto_ff

    :cond_fe
    move v4, v6

    :goto_ff
    invoke-virtual {v2}, Landroid/view/View;->getVisibility()I

    move-result v8

    if-eqz v8, :cond_106

    move v7, v6

    :cond_106
    if-eq v7, v4, :cond_112

    if-nez v4, :cond_10c

    const/16 v6, 0x8

    :cond_10c
    invoke-virtual {v2, v6}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3}, Lx79;->O()V

    :cond_112
    iget-object v3, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    if-eqz v1, :cond_123

    iget-object v4, v1, Lp7d;->c:Lrxh;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    invoke-virtual {v4, v6}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v4

    goto :goto_124

    :cond_123
    move-object v4, v5

    :goto_124
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextView;

    if-eqz v1, :cond_137

    iget-object v1, v1, Lp7d;->d:Lpxh;

    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v1, v2}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v5

    :cond_137
    invoke-virtual {v0, v5}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_13a
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_13c
    return-object v5

    :pswitch_13d
    move-object/from16 v1, p1

    check-cast v1, Lfum;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v2, v0, Lr6d;->h:Lnak;

    :cond_149
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lfum;

    invoke-static {v3, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_157

    move-object v3, v5

    :cond_157
    invoke-virtual {v2, v0, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_149

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_160
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lu5d;

    check-cast v0, Lr6d;

    iget-object v0, v0, Lr6d;->d:Lv5d;

    iget-object v0, v0, Lv5d;->d:Lo7i;

    invoke-static {v1}, Luyg;->a(Ljava/lang/String;)Lgpm;

    move-result-object v1

    sget-object v2, Lcc;->c:Lcc;

    invoke-virtual {v0, v1, v2}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_17a
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lwse;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v0, Lwse;->o:Lbte;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Lbte;->c:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljava/lang/Boolean;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lwse;->b0(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, v0, Lha2;->a:Ljava/util/ArrayList;

    invoke-static {v3, v4}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_1ba

    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1}, Lwse;->b0(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    check-cast v1, Ljava/util/Collection;

    invoke-virtual {v4, v1}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_1ef

    :cond_1ba
    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->size()I

    move-result v1

    :goto_1c0
    if-ge v6, v1, :cond_1ef

    iget-object v2, v0, Lwse;->q:Lavc;

    if-nez v2, :cond_1c7

    move-object v2, v5

    :cond_1c7
    iget-object v2, v2, Lavc;->c:Ljava/lang/Object;

    check-cast v2, Lwse;

    invoke-virtual {v2, v6}, Lha2;->J(I)Lja2;

    move-result-object v2

    instance-of v3, v2, Lewc;

    if-eqz v3, :cond_1d6

    check-cast v2, Lewc;

    goto :goto_1d7

    :cond_1d6
    move-object v2, v5

    :goto_1d7
    if-eqz v2, :cond_1ec

    iget-object v2, v2, Lewc;->c:Lhwc;

    if-eqz v2, :cond_1ec

    iget-byte v3, v2, Lhwc;->f:B

    packed-switch v3, :pswitch_data_822

    goto :goto_1ec

    :pswitch_1e3
    invoke-virtual {v2}, Lab2;->a0()Lja2;

    move-result-object v3

    check-cast v3, Liwc;

    invoke-virtual {v2, v3}, Lhwc;->e0(Liwc;)V

    :cond_1ec
    :goto_1ec
    add-int/lit8 v6, v6, 0x1

    goto :goto_1c0

    :cond_1ef
    :goto_1ef
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_1f2
    move-object/from16 v1, p1

    check-cast v1, Lzmc;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lokc;

    invoke-virtual {v0, v1}, Lokc;->b(Lzmc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_200
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lpkc;

    iget-object v0, v0, Lpkc;->a:Lqkc;

    iget-object v0, v0, Lqkc;->b:Ljs6;

    iput-boolean v7, v0, Ljs6;->b:Z

    sget-object v0, Llqm;->x:Llqm;

    invoke-static {v1, v0, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    iput v3, v0, Lvx3;->b:I

    invoke-static {v0, v7, v0}, Lo18;->t(Lvx3;ZLvx3;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_21c
    move-object/from16 v1, p1

    check-cast v1, Ltmc;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lpkc;

    invoke-virtual {v0, v1}, Lpkc;->a(Ltmc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_22a
    move-object/from16 v1, p1

    check-cast v1, Ltmc;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lpkc;

    invoke-virtual {v0, v1}, Lpkc;->a(Ltmc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_238
    move-object/from16 v1, p1

    check-cast v1, Ltmc;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lpkc;

    invoke-virtual {v0, v1}, Lpkc;->a(Ltmc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_246
    move-object/from16 v1, p1

    check-cast v1, Lzmc;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lokc;

    invoke-virtual {v0, v1}, Lokc;->b(Lzmc;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_254
    move-object/from16 v8, p1

    check-cast v8, Lw27;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lgcc;

    move-object v6, v0

    check-cast v6, Ljcc;

    iget-object v0, v6, Ljcc;->h:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map;

    iget-object v1, v8, Lw27;->a:Ljava/lang/String;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_2a2

    iget-object v7, v8, Lw27;->g:Ljava/util/List;

    if-nez v7, :cond_293

    iget-object v0, v6, Ljcc;->g:Lnak;

    :cond_277
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v3, v1

    check-cast v3, Ljbg;

    iget-object v4, v8, Lw27;->a:Ljava/lang/String;

    invoke-static {v4, v2}, Ljava/util/Collections;->singletonMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Map;

    move-result-object v4

    invoke-static {v3, v4}, Lrbd;->e(Ljava/util/Map;Ljava/util/Map;)Ljava/util/LinkedHashMap;

    move-result-object v3

    invoke-static {v3}, Lrm5;->V(Ljava/util/Map;)Ljbg;

    move-result-object v3

    invoke-virtual {v0, v1, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_277

    goto :goto_2a2

    :cond_293
    invoke-static {v6}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v0

    new-instance v5, Lmz9;

    const/16 v10, 0x8

    const/4 v9, 0x0

    invoke-direct/range {v5 .. v10}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v9, v9, v5, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_2a2
    :goto_2a2
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2a5
    move-object/from16 v1, p1

    check-cast v1, Ll7c;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lp7c;

    check-cast v0, Lu7c;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v1, Ll7c;->d:Lec;

    if-eqz v1, :cond_2d9

    iget-object v2, v1, Lec;->b:Lgpm;

    sget-object v3, Lv7c;->a:Lzyk;

    iget-object v3, v2, Lgpm;->g:Ljava/lang/String;

    const-string v7, "minipay"

    invoke-static {v3, v7, v6}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v3

    if-eqz v3, :cond_2d0

    invoke-static {v0}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v3

    new-instance v7, Lr7c;

    invoke-direct {v7, v0, v5, v6}, Lr7c;-><init>(Lu7c;Lmt5;B)V

    invoke-static {v3, v5, v5, v7, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_2d0
    iget-object v0, v0, Lu7c;->c:Lq7c;

    iget-object v0, v0, Lq7c;->b:Lo7i;

    iget-object v1, v1, Lec;->c:Lcc;

    invoke-virtual {v0, v2, v1}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2d9
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2dc
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Throwable;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ljob;

    invoke-virtual {v0, v1}, Ljob;->p(Ljava/lang/Throwable;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_2ea
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/Set;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lpjb;

    iget-object v2, v0, Lpjb;->d:Ljava/util/concurrent/locks/ReentrantLock;

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->lock()V

    :try_start_2f7
    iget-object v0, v0, Lpjb;->c:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0
    :try_end_303
    .catchall {:try_start_2f7 .. :try_end_303} :catchall_36d

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_30c
    :goto_30c
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36a

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll7f;

    iget-object v3, v2, Ll7f;->b:[I

    array-length v4, v3

    if-eqz v4, :cond_359

    if-eq v4, v7, :cond_347

    new-instance v4, Lp4j;

    invoke-direct {v4}, Lp4j;-><init>()V

    array-length v5, v3

    move v8, v6

    move v9, v8

    :goto_327
    if-ge v8, v5, :cond_342

    aget v10, v3, v8

    add-int/lit8 v11, v9, 0x1

    invoke-static {v10}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v10

    invoke-interface {v1, v10}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_33e

    iget-object v10, v2, Ll7f;->c:[Ljava/lang/String;

    aget-object v9, v10, v9

    invoke-virtual {v4, v9}, Lp4j;->add(Ljava/lang/Object;)Z

    :cond_33e
    add-int/lit8 v8, v8, 0x1

    move v9, v11

    goto :goto_327

    :cond_342
    invoke-static {v4}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object v3

    goto :goto_35b

    :cond_347
    aget v3, v3, v6

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_356

    iget-object v3, v2, Ll7f;->d:Ljava/util/Set;

    goto :goto_35b

    :cond_356
    sget-object v3, Lv08;->a:Lv08;

    goto :goto_35b

    :cond_359
    sget-object v3, Lv08;->a:Lv08;

    :goto_35b
    move-object v4, v3

    check-cast v4, Ljava/util/Collection;

    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_30c

    iget-object v2, v2, Ll7f;->a:Lnjb;

    invoke-virtual {v2, v3}, Lnjb;->a(Ljava/util/Set;)V

    goto :goto_30c

    :cond_36a
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :catchall_36d
    move-exception v0

    invoke-virtual {v2}, Ljava/util/concurrent/locks/ReentrantLock;->unlock()V

    throw v0

    :pswitch_372
    move-object/from16 v1, p1

    check-cast v1, Lcya;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldya;

    iget-object v0, v0, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_380
    if-ge v6, v2, :cond_38e

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v6, v6, 0x1

    check-cast v3, Lit7;

    invoke-virtual {v3, v1}, Lit7;->b(Lcya;)V

    goto :goto_380

    :cond_38e
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_391
    move-object/from16 v1, p1

    check-cast v1, Lcya;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ldya;

    iget-object v0, v0, Ldya;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    :goto_39f
    if-ge v6, v2, :cond_3ad

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v6, v6, 0x1

    check-cast v3, Lit7;

    invoke-virtual {v3, v1}, Lit7;->b(Lcya;)V

    goto :goto_39f

    :cond_3ad
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_3b0
    move-object/from16 v1, p1

    check-cast v1, Lhea;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    move-object v13, v0

    check-cast v13, Lpca;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v0, v1, Lhea;->f:Ldea;

    const/4 v8, -0x1

    if-nez v0, :cond_3c5

    move v0, v8

    goto :goto_3cd

    :cond_3c5
    sget-object v9, Lkca;->a:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v9, v0

    :goto_3cd
    if-eq v0, v8, :cond_53c

    const/4 v12, 0x0

    if-eq v0, v7, :cond_4ea

    if-eq v0, v3, :cond_488

    if-ne v0, v4, :cond_483

    iget-object v0, v1, Lhea;->i:Lkotlinx/serialization/json/b;

    if-eqz v0, :cond_44c

    :try_start_3da
    sget-object v3, Lt0i;->b:Lp0i;

    sget-object v3, Lgrb;->a:Lcrb;

    sget-object v4, Ltj1;->Companion:Lpj1;

    invoke-virtual {v4}, Lpj1;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v4

    check-cast v4, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v3, v0, v4, v12}, Ljym;->w(Lrpb;Lkotlinx/serialization/json/b;Lkotlinx/serialization/KSerializer;Lmng;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ltj1;

    invoke-static {v0}, Lfac;->H(Ltj1;)Lnz5;

    move-result-object v0
    :try_end_3f3
    .catchall {:try_start_3da .. :try_end_3f3} :catchall_3f4

    goto :goto_3fd

    :catchall_3f4
    move-exception v0

    sget-object v3, Lt0i;->b:Lp0i;

    new-instance v3, Lq0i;

    invoke-direct {v3, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v3

    :goto_3fd
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v3

    if-eqz v3, :cond_419

    sget-object v4, Lhzc;->c:Lgzc;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Leaj;->e:Leaj;

    iget-object v6, v4, Lhzc;->a:Letb;

    iget-object v6, v6, Letb;->a:Leaj;

    invoke-virtual {v6, v5}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v6

    if-gtz v6, :cond_419

    const-string v6, "Failed to parse the coupon campaign history entry `extra` property"

    invoke-virtual {v4, v5, v2, v6, v3}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_419
    instance-of v2, v0, Lq0i;

    if-eqz v2, :cond_41e

    move-object v0, v12

    :cond_41e
    check-cast v0, Lnz5;

    if-eqz v0, :cond_44c

    iget-object v1, v1, Lhea;->g:Lfea;

    if-eqz v1, :cond_42d

    iget v1, v1, Lfea;->b:I

    invoke-static {v1}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object v1

    goto :goto_42e

    :cond_42d
    move-object v1, v12

    :goto_42e
    sget-object v2, Lje8;->e:Lje8;

    iget-object v3, v13, Lpca;->d:Lt3e;

    new-instance v4, Lwa8;

    invoke-direct {v4, v2, v1}, Lwa8;-><init>(Lje8;Ljava/lang/String;)V

    check-cast v3, Lh5e;

    invoke-virtual {v3, v4}, Lh5e;->t(Lfb8;)V

    iget-object v2, v13, Lpca;->t:Lnak;

    iget-object v3, v13, Lpca;->e:Lfi6;

    invoke-static {v0, v1, v3}, Lqbe;->T(Lnz5;Ljava/lang/String;Lfi6;)Lhz5;

    move-result-object v0

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v12, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    goto/16 :goto_53c

    :cond_44c
    iget-object v0, v13, Lpca;->f:Lhzc;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->e:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_461

    const-string v3, "Coupon claim button clicked for item without valid voucher data."

    invoke-virtual {v0, v2, v1, v3, v12}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_461
    iget-object v0, v13, Lpca;->n:Lnak;

    :cond_463
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lfum;

    new-instance v2, Ldum;

    sget-object v3, Ldhk;->m:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lshk;

    invoke-static {v3}, Lynh;->i(Lshk;)Ludk;

    move-result-object v3

    invoke-direct {v2, v3, v12}, Ldum;-><init>(Lsdk;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_463

    goto/16 :goto_53c

    :cond_483
    invoke-static {}, Lh9o;->p()V

    goto/16 :goto_53e

    :cond_488
    iget-object v0, v1, Lhea;->h:Leea;

    if-nez v0, :cond_4c3

    iget-object v0, v13, Lpca;->f:Lhzc;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->e:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_4a1

    const-string v3, "Crypto claim button clicked for item without crypto data. Button should not be visible."

    invoke-virtual {v0, v2, v1, v3, v12}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_4a1
    iget-object v1, v13, Lpca;->n:Lnak;

    :cond_4a3
    invoke-virtual {v1}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lfum;

    new-instance v2, Ldum;

    sget-object v3, Ldhk;->m:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lshk;

    invoke-static {v3}, Lynh;->i(Lshk;)Ludk;

    move-result-object v3

    invoke-direct {v2, v3, v12}, Ldum;-><init>(Lsdk;Ljava/lang/Throwable;)V

    invoke-virtual {v1, v0, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4a3

    goto/16 :goto_53c

    :cond_4c3
    iget-wide v10, v0, Leea;->a:J

    iget-object v0, v13, Lpca;->u:Ld3k;

    if-eqz v0, :cond_4cc

    invoke-virtual {v0, v12}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_4cc
    iget-object v0, v13, Lpca;->r:Lnak;

    new-instance v1, Lrek;

    invoke-direct {v1, v7}, Lrek;-><init>(Z)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v12, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-static {v13}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v0

    new-instance v8, Lic1;

    const/4 v9, 0x1

    invoke-direct/range {v8 .. v13}, Lic1;-><init>(BJLmt5;Ljava/lang/Object;)V

    invoke-static {v0, v12, v12, v8, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v0

    iput-object v0, v13, Lpca;->u:Ld3k;

    goto :goto_53c

    :cond_4ea
    iget-object v0, v1, Lhea;->g:Lfea;

    if-eqz v0, :cond_507

    iget v0, v0, Lfea;->b:I

    iget-object v1, v13, Lpca;->p:Lnak;

    sget-object v2, Leca;->a:Leca;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v12, v2}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-static {v13}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v1

    new-instance v2, Loca;

    invoke-direct {v2, v13, v0, v12, v6}, Loca;-><init>(Ljava/lang/Object;ILmt5;B)V

    invoke-static {v1, v12, v12, v2, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_53c

    :cond_507
    iget-object v0, v13, Lpca;->f:Lhzc;

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->e:Leaj;

    iget-object v3, v0, Lhzc;->a:Letb;

    iget-object v3, v3, Letb;->a:Leaj;

    invoke-virtual {v3, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v3

    if-gtz v3, :cond_51c

    const-string v3, "Spotify button clicked for item without marketItem data. Button should not be visible."

    invoke-virtual {v0, v2, v1, v3, v12}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_51c
    iget-object v0, v13, Lpca;->n:Lnak;

    :cond_51e
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lfum;

    new-instance v2, Ldum;

    sget-object v3, Ldhk;->m:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lshk;

    invoke-static {v3}, Lynh;->i(Lshk;)Ludk;

    move-result-object v3

    invoke-direct {v2, v3, v12}, Ldum;-><init>(Lsdk;Ljava/lang/Throwable;)V

    invoke-virtual {v0, v1, v2}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_51e

    :cond_53c
    :goto_53c
    sget-object v5, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_53e
    return-object v5

    :pswitch_53f
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v1

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->w:Lnak;

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v5, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_55c
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/String;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v1}, Lbwg;->H(Ljava/lang/String;)Lgpm;

    move-result-object v2

    if-eqz v2, :cond_57c

    iget-object v3, v0, Lpca;->c:Lica;

    iget-object v3, v3, Lica;->b:Lo7i;

    sget-object v4, Lcc;->c:Lcc;

    invoke-virtual {v3, v2, v4}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lt0i;

    goto :goto_57d

    :cond_57c
    move-object v2, v5

    :goto_57d
    if-eqz v2, :cond_586

    iget-object v2, v2, Lt0i;->a:Ljava/lang/Object;

    instance-of v2, v2, Lq0i;

    xor-int/2addr v2, v7

    if-eq v2, v7, :cond_5ab

    :cond_586
    iget-object v2, v0, Lpca;->n:Lnak;

    :cond_588
    invoke-virtual {v2}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lfum;

    new-instance v3, Ldum;

    sget-object v4, Lahk;->d0:Lzyk;

    invoke-virtual {v4}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lshk;

    invoke-static {v1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v6

    new-instance v7, Ludk;

    invoke-direct {v7, v4, v6}, Ludk;-><init>(Lshk;Ljava/util/List;)V

    invoke-direct {v3, v7, v5}, Ldum;-><init>(Lsdk;Ljava/lang/Throwable;)V

    invoke-virtual {v2, v0, v3}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_588

    :cond_5ab
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5ae
    move-object/from16 v1, p1

    check-cast v1, Lzca;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhca;

    check-cast v0, Lpca;

    iget-object v0, v0, Lpca;->g:Lnak;

    invoke-virtual {v0, v1}, Lnak;->j(Ljava/lang/Object;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5c0
    move-object/from16 v1, p1

    check-cast v1, Lcof;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Leaa;

    iget-object v0, v0, Leaa;->c:Lg8j;

    iget-object v2, v0, Lg8j;->e:Ldu3;

    invoke-virtual {v2}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lpgf;

    iget-object v3, v1, Lcof;->c:Ljava/lang/String;

    new-instance v4, Leof;

    const/16 v5, 0x11

    invoke-direct {v4, v1, v0, v5}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v4}, Lpgf;->d(Ljava/lang/String;Lcom/opera/api/Callback;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_5e1
    move-object/from16 v1, p1

    check-cast v1, Ljava/util/List;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ld3a;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_5f0
    :goto_5f0
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_61c

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly2a;

    instance-of v3, v2, Ls2a;

    if-eqz v3, :cond_608

    check-cast v2, Ls2a;

    iget-object v2, v2, Ls2a;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, v2}, Ld3a;->h(Ljava/util/ArrayList;)V

    goto :goto_5f0

    :cond_608
    instance-of v3, v2, Lw2a;

    if-eqz v3, :cond_5f0

    iget-object v3, v0, Ld3a;->e:Lnx5;

    sget-object v4, Lrx5;->d:Lrx5;

    new-instance v6, Lrf4;

    check-cast v2, Lw2a;

    const/4 v8, 0x6

    invoke-direct {v6, v8, v5, v2}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v3, v5, v4, v6, v7}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_5f0

    :cond_61c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_61f
    move-object/from16 v1, p1

    check-cast v1, Lb2l;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Llp9;

    iget-object v2, v0, Llp9;->g:Lpf;

    if-nez v2, :cond_63c

    new-instance v2, Lpf;

    invoke-direct {v2, v0, v1, v7}, Lpf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v1, v0, Llp9;->d:Lnej;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Lijm;->b:Lijm;

    invoke-virtual {v1, v2, v3}, Lr22;->b(Ljjm;Lijm;)V

    iput-object v2, v0, Llp9;->g:Lpf;

    :cond_63c
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_63f
    move-object/from16 v1, p1

    check-cast v1, Lb2l;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Llp9;

    iget-object v2, v0, Llp9;->e:Lji;

    iget-object v4, v0, Llp9;->c:Lru9;

    iget-object v2, v2, Lji;->b:Lcom/opera/android/OperaApplication;

    iget-object v5, v0, Llp9;->a:Lwv1;

    iget-object v5, v5, Lwv1;->b:Lb6h;

    iget-object v0, v0, Llp9;->f:Lq2;

    invoke-virtual {v0}, Lq2;->invoke()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-nez v0, :cond_6d8

    invoke-static {v2}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->j()Z

    move-result v0

    if-eqz v0, :cond_6d8

    invoke-static {v2}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcj9;

    iget-object v0, v0, Lcj9;->b:Ljava/lang/String;

    const-string v2, "id"

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_6d8

    invoke-interface {v5}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lydn;

    iget-object v0, v0, Lydn;->d:Lvdn;

    iget-boolean v0, v0, Lvdn;->a:Z

    if-nez v0, :cond_6d8

    invoke-interface {v5}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lydn;

    iget-object v0, v0, Lydn;->d:Lvdn;

    invoke-virtual {v0}, Lvdn;->b()Z

    move-result v0

    if-eqz v0, :cond_6a2

    move-object v0, v1

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0}, Lb9l;->m()Z

    move-result v0

    if-eqz v0, :cond_6d8

    :cond_6a2
    invoke-interface {v5}, Lvtb;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lydn;

    check-cast v1, Ld7l;

    invoke-virtual {v1}, Ld7l;->i0()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Lydn;->t(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_6d8

    iget-object v0, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v1, "vpn.free_promo.1.show_count"

    invoke-interface {v0, v1, v6}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    if-ge v0, v3, :cond_6d8

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iget-object v2, v4, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v3, "vpn.free_promo.1.show_timestamp"

    const-wide/16 v4, 0x0

    invoke-interface {v2, v3, v4, v5}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v2

    sub-long/2addr v0, v2

    const-wide/32 v2, 0x5265c00

    div-long/2addr v0, v2

    const-wide/16 v2, 0x7

    cmp-long v0, v0, v2

    if-ltz v0, :cond_6d8

    move v6, v7

    :cond_6d8
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_6dd
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Le29;

    iget-object v0, v0, Le29;->c:Lcom/opera/android/settings/SettingsManager;

    const-string v2, "ask_before_downloading"

    invoke-virtual {v0, v1, v2}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_6f3
    move-object/from16 v1, p1

    check-cast v1, Landroid/view/View;

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Ld18;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1}, Landroid/view/View;->isShown()Z

    move-result v0

    if-eqz v0, :cond_72c

    new-instance v0, Landroid/graphics/Rect;

    invoke-direct {v0}, Landroid/graphics/Rect;-><init>()V

    invoke-virtual {v1, v0}, Landroid/view/View;->getGlobalVisibleRect(Landroid/graphics/Rect;)Z

    move-result v2

    if-eqz v2, :cond_72c

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v2, Landroid/graphics/Rect;

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v3

    iget v3, v3, Landroid/util/DisplayMetrics;->widthPixels:I

    invoke-virtual {v1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v1

    iget v1, v1, Landroid/util/DisplayMetrics;->heightPixels:I

    invoke-direct {v2, v6, v6, v3, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    invoke-static {v0, v2}, Landroid/graphics/Rect;->intersects(Landroid/graphics/Rect;Landroid/graphics/Rect;)Z

    move-result v6

    :cond_72c
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_731
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lrdb;

    invoke-virtual {v0, v1}, Lrdb;->a(Z)V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_743
    move-object/from16 v1, p1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    iget-object v0, v0, Lz84;->receiver:Ljava/lang/Object;

    check-cast v0, Lhi7;

    iget-object v2, v0, Lhi7;->e:Ligi;

    iget-object v3, v2, Ligi;->d:Ljava/lang/Object;

    check-cast v3, Landroid/view/View;

    const/4 v5, 0x0

    if-eqz v1, :cond_7b3

    sget-wide v6, Lhi7;->s:J

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v6

    iget-object v1, v2, Ligi;->e:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v8, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v8}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v8}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    iget-object v1, v2, Ligi;->g:Ljava/lang/Object;

    check-cast v1, Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->scaleX(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->scaleY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Lai7;

    invoke-direct {v2, v0, v4}, Lai7;-><init>(Lhi7;B)V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    goto :goto_7e1

    :cond_7b3
    invoke-virtual {v0}, Lhi7;->b()V

    sget-wide v6, Lhi7;->r:J

    invoke-static {v6, v7}, Lpn7;->f(J)J

    move-result-wide v6

    iget-object v1, v2, Ligi;->f:Ljava/lang/Object;

    check-cast v1, Landroid/view/View;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    new-instance v2, Landroid/view/animation/DecelerateInterpolator;

    invoke-direct {v2}, Landroid/view/animation/DecelerateInterpolator;-><init>()V

    invoke-virtual {v1, v2}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget v0, v0, Lhi7;->j:F

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    invoke-virtual {v3}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v6, v7}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0, v5}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    :goto_7e1
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_data_7e4
    .packed-switch 0x0
        :pswitch_743
        :pswitch_731
        :pswitch_6f3
        :pswitch_6dd
        :pswitch_63f
        :pswitch_61f
        :pswitch_5e1
        :pswitch_5c0
        :pswitch_5ae
        :pswitch_55c
        :pswitch_53f
        :pswitch_3b0
        :pswitch_391
        :pswitch_372
        :pswitch_2ea
        :pswitch_2dc
        :pswitch_2a5
        :pswitch_254
        :pswitch_246
        :pswitch_238
        :pswitch_22a
        :pswitch_21c
        :pswitch_200
        :pswitch_1f2
        :pswitch_17a
        :pswitch_160
        :pswitch_13d
        :pswitch_35
        :pswitch_24
    .end packed-switch

    :pswitch_data_822
    .packed-switch 0x1
        :pswitch_1e3
    .end packed-switch
.end method
