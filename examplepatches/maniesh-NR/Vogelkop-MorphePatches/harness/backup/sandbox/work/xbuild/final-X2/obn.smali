.class public final synthetic Lobn;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lobn;->a:B

    iput-object p1, p0, Lobn;->b:Ljava/lang/Object;

    iput-object p2, p0, Lobn;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lobn;->a:B

    const/4 v3, 0x1

    iget-object v4, v0, Lobn;->c:Ljava/lang/Object;

    iget-object v0, v0, Lobn;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_316

    check-cast v0, Lqjo;

    check-cast v4, Lp12;

    iget-object v1, v0, Lqjo;->e:Ljvg;

    iget-object v5, v0, Ln1;->b:Ljava/lang/Object;

    check-cast v5, Lcom/opera/ad/interstitial/AdActivity;

    iget-object v6, v4, Lp12;->a:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    iget-object v7, v4, Lp12;->b:Ljava/lang/Object;

    check-cast v7, Ljava/lang/String;

    iget-object v8, v4, Lp12;->c:Ljava/lang/Object;

    check-cast v8, Ljava/lang/String;

    iget-object v9, v4, Lp12;->e:Ljava/lang/Object;

    check-cast v9, Ljava/lang/String;

    iget-object v10, v4, Lp12;->f:Ljava/lang/Object;

    check-cast v10, Ljava/lang/String;

    iget-object v11, v4, Lp12;->g:Ljava/lang/Object;

    check-cast v11, Ljava/lang/String;

    iget-object v12, v4, Lp12;->h:Ljava/lang/Object;

    check-cast v12, Ljava/util/ArrayList;

    new-instance v13, Lroj;

    const/16 v14, 0x18

    invoke-direct {v13, v0, v4, v14}, Lroj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4a

    invoke-static {v8}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_4a

    move v0, v3

    goto :goto_4b

    :cond_4a
    const/4 v0, 0x0

    :goto_4b
    iget-object v4, v1, Ljvg;->c:Ljava/lang/Object;

    check-cast v4, Lmcj;

    if-nez v4, :cond_f5

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    if-eqz v0, :cond_5b

    const v15, 0x7f1400f6

    goto :goto_5e

    :cond_5b
    const v15, 0x7f1400f1

    :goto_5e
    invoke-virtual {v4, v15}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    if-nez v0, :cond_65

    move-object v11, v10

    :cond_65
    invoke-static {v11}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v15

    if-nez v15, :cond_6c

    move-object v4, v11

    :cond_6c
    new-instance v11, Lmcj;

    const v15, 0x7f0d003c

    invoke-direct {v11, v5, v15}, Lmcj;-><init>(Lcom/opera/ad/interstitial/AdActivity;I)V

    iget-object v15, v11, Lmcj;->b:Ljava/lang/Object;

    check-cast v15, Landroid/view/ViewGroup;

    const v2, 0x7f0a00cf

    invoke-virtual {v15, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/TextView;

    invoke-virtual {v2, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    if-eqz v12, :cond_90

    invoke-virtual {v12}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_90

    invoke-static {v15, v12, v13}, Ljvg;->o(Landroid/view/ViewGroup;Ljava/util/ArrayList;Lroj;)V

    goto :goto_f2

    :cond_90
    sget-object v2, Lp12;->i:Ljava/util/ArrayList;

    if-eqz v2, :cond_9a

    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v2

    if-eqz v2, :cond_ed

    :cond_9a
    new-instance v2, Ljava/util/ArrayList;

    const/4 v4, 0x4

    invoke-direct {v2, v4}, Ljava/util/ArrayList;-><init>(I)V

    sput-object v2, Lp12;->i:Ljava/util/ArrayList;

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    sget-object v12, Lp12;->i:Ljava/util/ArrayList;

    new-instance v14, Lrmo;

    const v4, 0x7f1400f4

    invoke-virtual {v2, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-direct {v14, v4, v3}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v12, v14}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Lp12;->i:Ljava/util/ArrayList;

    new-instance v4, Lrmo;

    const v12, 0x7f1400f3

    invoke-virtual {v2, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x3

    invoke-direct {v4, v12, v14}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Lp12;->i:Ljava/util/ArrayList;

    new-instance v4, Lrmo;

    const v12, 0x7f1400f5

    invoke-virtual {v2, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v12

    const/4 v14, 0x4

    invoke-direct {v4, v12, v14}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    sget-object v3, Lp12;->i:Ljava/util/ArrayList;

    new-instance v4, Lrmo;

    const v12, 0x7f1400f2

    invoke-virtual {v2, v12}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    const/4 v12, 0x2

    invoke-direct {v4, v2, v12}, Lrmo;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v3, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_ed
    sget-object v2, Lp12;->i:Ljava/util/ArrayList;

    invoke-static {v15, v2, v13}, Ljvg;->o(Landroid/view/ViewGroup;Ljava/util/ArrayList;Lroj;)V

    :goto_f2
    iput-object v11, v1, Ljvg;->c:Ljava/lang/Object;

    move-object v4, v11

    :cond_f5
    if-eqz v0, :cond_191

    iget-object v0, v1, Ljvg;->b:Ljava/lang/Object;

    check-cast v0, Lmcj;

    if-nez v0, :cond_189

    invoke-static {v10}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_10e

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f1400f1

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v10

    :cond_10e
    invoke-static {v9}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_11f

    invoke-virtual {v5}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v2, 0x7f1400f8

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    :cond_11f
    iget-object v0, v1, Ljvg;->c:Ljava/lang/Object;

    check-cast v0, Lmcj;

    new-instance v2, Lmcj;

    const v3, 0x7f0d003d

    invoke-direct {v2, v5, v3}, Lmcj;-><init>(Lcom/opera/ad/interstitial/AdActivity;I)V

    iget-object v3, v2, Lmcj;->b:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewGroup;

    invoke-static {v6}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v4

    if-nez v4, :cond_14a

    const v4, 0x7f0a007a

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/ImageView;

    const/4 v11, 0x0

    invoke-virtual {v4, v11}, Landroid/widget/ImageView;->setVisibility(I)V

    new-instance v11, Lugo;

    invoke-direct {v11, v4, v5}, Lugo;-><init>(Landroid/widget/ImageView;Lcom/opera/ad/interstitial/AdActivity;)V

    invoke-static {v5, v6, v11}, Lfip;->b(Landroid/content/Context;Ljava/lang/String;Lzhp;)V

    :cond_14a
    const v4, 0x7f0a0078

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    invoke-virtual {v4, v7}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    const v4, 0x7f0a0079

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    invoke-virtual {v6, v9}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    new-instance v6, Lobn;

    const/16 v7, 0xe

    invoke-direct {v6, v8, v5, v7}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v4, 0x7f0a0526

    invoke-virtual {v3, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    invoke-virtual {v3, v10}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    new-instance v4, Lobn;

    const/16 v5, 0xf

    invoke-direct {v4, v2, v0, v5}, Lobn;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v4}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iput-object v2, v1, Ljvg;->b:Ljava/lang/Object;

    move-object v0, v2

    :cond_189
    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    :goto_18b
    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    goto :goto_194

    :cond_191
    iget-object v0, v4, Lmcj;->a:Ljava/lang/Object;

    goto :goto_18b

    :goto_194
    return-void

    :pswitch_195
    check-cast v0, Luuj;

    check-cast v4, Lcom/opera/ad/interstitial/AdActivity;

    iget-object v0, v0, Luuj;->c:Ljava/lang/Object;

    check-cast v0, Lzgb;

    if-eqz v0, :cond_1b8

    iget-object v0, v0, Lzgb;->b:Lchb;

    iget-object v0, v0, Lchb;->p:Lqb7;

    if-eqz v0, :cond_1b8

    iget-object v1, v0, Lqb7;->a:Ljava/lang/Object;

    check-cast v1, Lh10;

    iget-object v1, v1, Lh10;->v:Ldl;

    iget-object v2, v0, Lqb7;->c:Ljava/lang/Object;

    check-cast v2, Lyz;

    iget-object v0, v0, Lqb7;->b:Ljava/lang/Object;

    check-cast v0, Lj10;

    iget-object v0, v0, Lj10;->a:Lyl;

    invoke-virtual {v0, v2, v1}, Ln1;->x(Lyz;Ldl;)V

    :cond_1b8
    invoke-virtual {v4}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_1bc
    check-cast v0, Lmcj;

    check-cast v4, Lmcj;

    iget-object v0, v0, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->dismiss()V

    iget-object v0, v4, Lmcj;->a:Ljava/lang/Object;

    check-cast v0, Landroid/app/Dialog;

    invoke-virtual {v0}, Landroid/app/Dialog;->show()V

    return-void

    :pswitch_1cf
    check-cast v0, Ljava/lang/String;

    check-cast v4, Lcom/opera/ad/interstitial/AdActivity;

    new-instance v1, Landroid/content/Intent;

    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    const-string v2, "android.intent.action.VIEW"

    invoke-direct {v1, v2, v0}, Landroid/content/Intent;-><init>(Ljava/lang/String;Landroid/net/Uri;)V

    const/high16 v0, 0x10000000

    invoke-virtual {v1, v0}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    invoke-virtual {v4, v1}, Lcom/opera/ad/interstitial/AdActivity;->startActivity(Landroid/content/Intent;)V

    return-void

    :pswitch_1e7
    check-cast v0, Lroj;

    check-cast v4, Lrmo;

    iget v1, v4, Lrmo;->b:I

    invoke-virtual {v0, v1}, Lroj;->a(I)V

    return-void

    :pswitch_1f1
    check-cast v0, Lrn9;

    check-cast v4, Lkdo;

    sget-object v1, Lkf0;->c:Lkf0;

    invoke-virtual {v0, v1}, Lrn9;->J(Lkf0;)V

    iget-object v0, v4, Lkdo;->i:Lqt3;

    invoke-virtual {v0}, Lqt3;->run()V

    return-void

    :pswitch_200
    check-cast v0, Lo6o;

    check-cast v4, Lz6o;

    iget-object v0, v0, Lo6o;->h:Lgil;

    iget-object v1, v4, Lz6o;->b:Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v0, v1}, Lgil;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_210
    check-cast v0, Lyw;

    check-cast v4, Lsqn;

    iget-object v0, v0, Lyw;->e:Ljava/lang/Object;

    check-cast v0, Lz4k;

    iget-object v1, v4, Lsqn;->a:Ljava/lang/String;

    iget-object v0, v0, Lz4k;->b:Ljava/lang/Object;

    check-cast v0, Lmrn;

    iget-object v0, v0, Lmrn;->p:Lkrn;

    new-instance v2, Lgrn;

    invoke-direct {v2, v1}, Lgrn;-><init>(Ljava/lang/String;)V

    invoke-interface {v0, v2}, Lkrn;->f(Ltc2;)V

    return-void

    :pswitch_229
    check-cast v0, Ls6h;

    check-cast v4, Lmqn;

    invoke-virtual {v0}, Ls6h;->I()Z

    move-result v0

    if-eqz v0, :cond_23b

    iget-object v0, v4, Lmqn;->T:Lvl6;

    if-nez v0, :cond_238

    const/4 v0, 0x0

    :cond_238
    invoke-virtual {v0}, Lvl6;->S()Z

    :cond_23b
    return-void

    :pswitch_23c
    check-cast v0, Ljl6;

    move-object v8, v4

    check-cast v8, Lk15;

    iget-object v1, v0, Ljl6;->g:Ljava/lang/Object;

    check-cast v1, Ljmn;

    iget-object v5, v1, Ljmn;->I:Le4i;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v6

    sget-object v7, Lo3i;->e:Lo3i;

    sget-object v9, Lq4i;->a:Lq4i;

    new-instance v10, Lqfl;

    const/16 v1, 0x16

    invoke-direct {v10, v0, v1}, Lqfl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual/range {v5 .. v10}, Le4i;->b(Lndc;Lo3i;Lk15;Lq4i;Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_25a
    check-cast v0, Lpk5;

    check-cast v4, Lqf;

    iget-object v0, v0, Lpk5;->l:Ljava/lang/Object;

    check-cast v0, Ld8j;

    sget-object v1, Lc8j;->d:Lc8j;

    const/4 v11, 0x0

    new-array v2, v11, [I

    check-cast v0, Lg8j;

    invoke-virtual {v0, v1, v2}, Lg8j;->j(Lc8j;[I)V

    invoke-virtual {v4}, Ldej;->b()V

    return-void

    :pswitch_270
    check-cast v0, Lukn;

    check-cast v4, Lr3i;

    iget-boolean v1, v0, Lukn;->I:Z

    iget-object v0, v0, Lukn;->B:Lcom/opera/android/custom_views/StylingImageButton;

    iput-boolean v1, v4, Lr3i;->k:Z

    invoke-virtual {v4, v0}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_27e
    check-cast v0, Lcgn;

    check-cast v4, Ldgh;

    instance-of v1, v4, Lbfn;

    iget-object v2, v0, Lcgn;->C:Lx5f;

    const/16 v3, 0x11

    if-eqz v1, :cond_2a8

    sget-object v1, Lkcn;->a:[Lkcn;

    iget-boolean v1, v2, Lx5f;->h:Z

    if-eqz v1, :cond_2c5

    iget-object v1, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-static {v1, v4}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    new-instance v5, Lzbe;

    invoke-direct {v5, v3}, Lzbe;-><init>(B)V

    const-string v3, "vpn_pro_paused"

    invoke-virtual {v1, v3, v5}, Lhi0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    goto :goto_2c5

    :cond_2a8
    sget-object v1, Lkcn;->a:[Lkcn;

    iget-boolean v1, v2, Lx5f;->h:Z

    if-eqz v1, :cond_2c5

    iget-object v1, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    invoke-static {v1, v4}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v1

    new-instance v5, Lzbe;

    invoke-direct {v5, v3}, Lzbe;-><init>(B)V

    const-string v3, "vpn_pro_canceled"

    invoke-virtual {v1, v3, v5}, Lhi0;->b(Ljava/lang/String;Lkotlin/jvm/functions/Function1;)V

    invoke-virtual {v2, v4}, Lx5f;->U0(Lx56;)V

    :cond_2c5
    :goto_2c5
    invoke-virtual {v0}, Lcgn;->L0()V

    return-void

    :pswitch_2c9
    check-cast v0, Ljdn;

    check-cast v4, Lfdn;

    iget-object v0, v0, Ljdn;->h:Lhdn;

    invoke-virtual {v0, v4}, Lhdn;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2d3
    check-cast v0, Lidn;

    check-cast v4, Lfdn;

    iget-object v0, v0, Lidn;->l:Lcom/opera/api/Callback;

    check-cast v0, Lhdn;

    invoke-virtual {v0, v4}, Lhdn;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_2df
    check-cast v0, Lysj;

    check-cast v4, Lgjm;

    invoke-virtual/range {p1 .. p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    new-instance v2, Lqcn;

    invoke-direct {v2, v1, v0, v4}, Lqcn;-><init>(Lydn;Lysj;Lgjm;)V

    invoke-virtual {v1, v2}, Lydn;->b(Ltdn;)V

    invoke-virtual {v1, v3}, Lydn;->C(Z)V

    return-void

    :pswitch_2ff
    check-cast v0, Lev5;

    check-cast v4, Lfdn;

    iget-object v0, v0, Lev5;->c:Ljava/lang/Object;

    check-cast v0, Ltah;

    invoke-virtual {v0, v4}, Ltah;->M(Lfdn;)V

    return-void

    :pswitch_30b
    check-cast v0, Lpbn;

    check-cast v4, Llbn;

    iget-object v0, v0, Lpbn;->c:Llrk;

    invoke-virtual {v0, v4}, Llrk;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_316
    .packed-switch 0x0
        :pswitch_30b
        :pswitch_2ff
        :pswitch_2df
        :pswitch_2d3
        :pswitch_2c9
        :pswitch_27e
        :pswitch_270
        :pswitch_25a
        :pswitch_23c
        :pswitch_229
        :pswitch_210
        :pswitch_200
        :pswitch_1f1
        :pswitch_1e7
        :pswitch_1cf
        :pswitch_1bc
        :pswitch_195
    .end packed-switch
.end method
