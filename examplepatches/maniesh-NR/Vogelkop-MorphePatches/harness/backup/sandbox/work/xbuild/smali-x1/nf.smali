.class public final synthetic Lnf;
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

    iput-byte p3, p0, Lnf;->a:B

    iput-object p1, p0, Lnf;->b:Ljava/lang/Object;

    iput-object p2, p0, Lnf;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 26

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lnf;->a:B

    const/4 v3, 0x3

    const/16 v4, 0x1a

    const/16 v5, 0x8

    const/4 v6, 0x2

    sget-object v7, Lijm;->b:Lijm;

    const/4 v8, -0x1

    const/4 v9, 0x0

    const/4 v10, 0x1

    const/4 v11, 0x0

    iget-object v12, v0, Lnf;->c:Ljava/lang/Object;

    iget-object v0, v0, Lnf;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_41c

    check-cast v0, Ltc6;

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v1, v12, Lcom/opera/android/ui/catalog/widget/OperaListItem;->A:Lbpd;

    invoke-virtual {v1}, Lbpd;->D()Ljava/lang/String;

    move-result-object v1

    const-string v2, "image_mode"

    invoke-static {v2, v1}, Lnrf;->l0(Ljava/lang/String;Ljava/lang/String;)Ltim;

    move-result-object v1

    iget-object v0, v0, Ltc6;->y:Lz77;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, v1, v7}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_32
    check-cast v0, Lxt5;

    check-cast v12, Lwg5;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    if-eq v0, v8, :cond_41

    move-object v9, v1

    :cond_41
    if-eqz v9, :cond_46

    invoke-virtual {v12, v9}, Lwg5;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_46
    return-void

    :pswitch_47
    check-cast v0, Lat5;

    check-cast v12, Li4d;

    new-instance v1, Lghf;

    invoke-direct {v1, v12}, Lghf;-><init>(Li4d;)V

    iget-object v0, v0, Ldej;->b:Lmej;

    invoke-interface {v0}, Lmej;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Lghf;->I(Landroid/content/Context;)Ljjm;

    return-void

    :pswitch_5a
    check-cast v0, Lfk5;

    check-cast v12, Lgom;

    iget-object v0, v0, Lfk5;->a:Lt5d;

    invoke-static {v0, v12}, Lmom;->b(Lt5d;Lgom;)V

    return-void

    :pswitch_64
    check-cast v0, Lyj5;

    check-cast v12, Lbz0;

    invoke-virtual {v0, v12}, Lyj5;->onPositiveButtonClicked(Lbz0;)V

    return-void

    :pswitch_6c
    check-cast v0, Lyw;

    check-cast v12, Lcom/opera/android/autofill/CreditCard;

    iget-object v0, v0, Lyw;->e:Ljava/lang/Object;

    check-cast v0, Lole;

    iget-object v0, v0, Lole;->a:Ljava/lang/Object;

    check-cast v0, Lzk4;

    invoke-virtual {v0}, Lzk4;->I0()Ldl4;

    move-result-object v0

    iget-object v1, v0, Ldl4;->g:Lwh2;

    new-instance v2, Lfh4;

    invoke-direct {v2, v12, v0, v6}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, v1, Lwh2;->i:Lhjf;

    invoke-virtual {v1, v0, v2}, Llj2;->b(Landroid/content/Context;Ljava/lang/Runnable;)V

    return-void

    :pswitch_89
    check-cast v0, Lgy3;

    check-cast v12, Luup;

    invoke-virtual {v0}, Lgy3;->I0()Loy3;

    move-result-object v15

    check-cast v12, Lpab;

    iget-object v0, v12, Lpab;->i:Lrxh;

    iget-object v1, v15, Loy3;->d:Lg8j;

    new-instance v13, Lr2;

    const/16 v19, 0x0

    const/16 v20, 0xf

    const/4 v14, 0x1

    const-class v16, Loy3;

    const-string v17, "onResetLocationDialogClosed"

    const-string v18, "onResetLocationDialogClosed(Lcom/opera/android/view/SimpleDialogDestination$DialogResult;)V"

    invoke-direct/range {v13 .. v20}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v2, Lpqh;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    sget-object v3, Lpkj;->c:Lpkj;

    iput-object v3, v2, Lpqh;->a:Ljava/lang/Object;

    iget-object v3, v1, Lg8j;->c:Ldu3;

    invoke-virtual {v3}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lqim;

    iget-object v3, v3, Lqim;->c:Lz77;

    iget-object v1, v1, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    invoke-virtual {v0, v4}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    const v4, 0x7f140887

    invoke-virtual {v1, v4, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v0

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    new-instance v0, Lqu3;

    invoke-direct {v0, v2, v10}, Lqu3;-><init>(Lpqh;B)V

    new-instance v4, Lqu3;

    invoke-direct {v4, v2, v6}, Lqu3;-><init>(Lpqh;B)V

    new-instance v5, Lmgf;

    const/16 v6, 0x1b

    invoke-direct {v5, v13, v2, v6}, Lmgf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lgkj;

    invoke-direct {v2, v11, v11}, Lnz0;-><init>(ZZ)V

    iput-object v9, v2, Lgkj;->a:Ljava/lang/String;

    iput-object v9, v2, Lgkj;->b:Ljava/lang/String;

    iput-object v9, v2, Lgkj;->c:Ljava/lang/String;

    iput-object v9, v2, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v5, v2, Lgkj;->e:Lekj;

    iput-object v9, v2, Lgkj;->f:Lfkj;

    iput-object v9, v2, Lgkj;->g:Lqp2;

    iput-object v0, v2, Lgkj;->h:Ldkj;

    iput-object v4, v2, Lgkj;->i:Ldkj;

    iput-object v9, v2, Lgkj;->j:Lql;

    const v0, 0x7f140eb4

    iput v0, v2, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, v2, Lgkj;->l:I

    const v0, 0x7f14088a

    iput v0, v2, Lgkj;->m:I

    iput-boolean v10, v2, Lgkj;->n:Z

    iput-object v1, v2, Lgkj;->o:Lpxh;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v2, v7}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_11f
    check-cast v0, Lbv3;

    check-cast v12, Landroid/view/View;

    iget-object v1, v0, Lbv3;->c:Lolh;

    invoke-virtual {v12}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-wide v3, v0, Lbv3;->d:J

    new-instance v5, Liu2;

    const/4 v6, 0x6

    invoke-direct {v5, v0, v6}, Liu2;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v1, Lolh;->a:Lglh;

    new-instance v1, Leof;

    const/16 v6, 0xd

    invoke-direct {v1, v2, v5, v6}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v3, v4}, Lglh;->c(Lcom/opera/api/Callback;J)V

    return-void

    :pswitch_13e
    check-cast v0, Ln3l;

    check-cast v12, Lcom/opera/android/BrowserActivity;

    iget-object v0, v0, Ln3l;->c:Ljava/lang/Integer;

    if-eqz v0, :cond_15b

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v12}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    move-result v0

    invoke-virtual {v1, v0}, Lx5f;->S(I)V

    :cond_15b
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v12, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_162

    move-object v9, v0

    :cond_162
    invoke-virtual {v9}, Lk6l;->A()Lb2l;

    move-result-object v0

    invoke-interface {v0}, Lb9l;->T()Lp6l;

    move-result-object v0

    invoke-virtual {v12, v0}, Lcom/opera/android/BrowserActivity;->g1(Lp6l;)V

    return-void

    :pswitch_16e
    check-cast v0, Lv3l;

    check-cast v12, Lef;

    iget-object v0, v0, Lrc;->b:Ljf;

    iget-object v0, v0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, v1, v12}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_17a
    check-cast v0, Ljf;

    check-cast v12, Lef;

    iget-object v0, v0, Ljf;->a:Lkotlin/jvm/functions/Function2;

    invoke-interface {v0, v1, v12}, Lkotlin/jvm/functions/Function2;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_184
    check-cast v0, Lan3;

    check-cast v12, Lgn3;

    iget-object v1, v12, Lgn3;->s:Lxm3;

    iget-object v0, v0, Le7n;->i:Lqhc;

    invoke-virtual {v1, v0}, Lxm3;->K(Lqhc;)V

    iget-object v0, v12, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->j()V

    return-void

    :pswitch_195
    check-cast v0, Lam3;

    check-cast v12, Lwl3;

    iget-object v0, v0, Lam3;->m:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->j()V

    iget-object v0, v12, Lwl3;->a:Lpt1;

    iget-object v1, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v10, v12, Lwl3;->b:Z

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {v12}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v1

    invoke-virtual {v12, v1}, Lwl3;->a(Landroid/content/res/Configuration;)Z

    move-result v1

    if-eqz v1, :cond_1bc

    move v5, v11

    :cond_1bc
    invoke-virtual {v0, v5}, Lcom/opera/android/custom_views/AnimationEmptyListView;->setVisibility(I)V

    return-void

    :pswitch_1c0
    check-cast v0, Lul3;

    check-cast v12, Lpl3;

    invoke-virtual {v0, v12}, Lul3;->b(Lal3;)V

    return-void

    :pswitch_1c8
    check-cast v0, Lv93;

    check-cast v12, Ly93;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/i;->getBindingAdapterPosition()I

    move-result v0

    if-eq v0, v8, :cond_1d7

    iget-object v1, v12, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_1d7
    return-void

    :pswitch_1d8
    check-cast v0, Ld83;

    move-object v15, v12

    check-cast v15, Lw3g;

    iget-object v1, v0, Ld83;->d:Ljava/lang/Object;

    check-cast v1, Lwth;

    if-eqz v1, :cond_1e7

    iput-object v9, v1, Lwth;->b:Ljava/lang/Object;

    iput-object v9, v0, Ld83;->d:Ljava/lang/Object;

    :cond_1e7
    iget-object v1, v0, Ld83;->b:Ljava/lang/Object;

    check-cast v1, La4g;

    if-eqz v1, :cond_233

    iget-object v1, v0, Ld83;->f:Ljava/lang/Object;

    check-cast v1, Ljh3;

    new-instance v2, Lwth;

    iget-object v3, v1, Ljh3;->v:Ld83;

    const/16 v4, 0x10

    invoke-direct {v2, v4}, Lwth;-><init>(B)V

    iput-object v3, v2, Lwth;->b:Ljava/lang/Object;

    new-instance v13, Lq4g;

    iget-object v3, v3, Ld83;->b:Ljava/lang/Object;

    move-object v14, v3

    check-cast v14, La4g;

    iget-boolean v3, v1, Ljh3;->u:Z

    iget v4, v1, Ljh3;->t:I

    iget v5, v1, Ljh3;->x:I

    iget v6, v1, Ljh3;->y:I

    iget-object v7, v1, Ljh3;->A:Lyu2;

    iget-object v8, v1, Ljh3;->B:Lw4g;

    iget-object v9, v1, Ljh3;->H:Lz77;

    move-object/from16 v18, v2

    move/from16 v16, v3

    move/from16 v17, v4

    move/from16 v19, v5

    move/from16 v20, v6

    move-object/from16 v21, v7

    move-object/from16 v22, v8

    move-object/from16 v23, v9

    invoke-direct/range {v13 .. v23}, Lq4g;-><init>(La4g;Lw3g;ZILp4g;IILyu2;Lw4g;Lz77;)V

    const/16 v3, 0x1003

    invoke-static {v13, v3}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v3

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v3, v1}, Lzhj;->c(Landroid/content/Context;)V

    iput-object v2, v0, Ld83;->d:Ljava/lang/Object;

    :cond_233
    return-void

    :pswitch_234
    check-cast v0, Landroid/view/View$OnClickListener;

    check-cast v12, Lq73;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    invoke-virtual {v12}, Ldej;->b()V

    return-void

    :pswitch_23f
    check-cast v0, Lf73;

    check-cast v12, Lfdn;

    iget-object v0, v0, Lf73;->e:Ltah;

    invoke-virtual {v0, v12}, Ltah;->M(Lfdn;)V

    return-void

    :pswitch_249
    check-cast v0, Lrkj;

    check-cast v12, Landroid/app/Dialog;

    invoke-virtual {v0}, Lrkj;->invoke()Ljava/lang/Object;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_25b

    invoke-virtual {v12}, Landroid/app/Dialog;->dismiss()V

    :cond_25b
    return-void

    :pswitch_25c
    check-cast v0, Lrkj;

    check-cast v12, Landroid/app/Dialog;

    invoke-virtual {v0}, Lrkj;->invoke()Ljava/lang/Object;

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v0

    if-eqz v0, :cond_26e

    invoke-virtual {v12}, Landroid/app/Dialog;->dismiss()V

    :cond_26e
    return-void

    :pswitch_26f
    check-cast v0, Lzs2;

    check-cast v12, Lole;

    iget-object v0, v0, Lzs2;->d:Lru2;

    if-eqz v0, :cond_2b9

    iget-object v1, v12, Lole;->a:Ljava/lang/Object;

    check-cast v1, Lbt2;

    iget-object v2, v1, Lbt2;->e:Lhp2;

    invoke-virtual {v2}, Lhp2;->a()Z

    move-result v2

    if-nez v2, :cond_2b9

    iget-object v1, v1, Lbt2;->g:Li7f;

    invoke-static {v1, v1}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v1

    :cond_289
    invoke-virtual {v1}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_2b9

    invoke-virtual {v1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lss2;

    iget-object v2, v2, Lss2;->a:Lts2;

    iget-object v2, v2, Lts2;->d:Li7f;

    invoke-static {v2, v2}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v2

    :cond_29d
    :goto_29d
    invoke-virtual {v2}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_289

    invoke-virtual {v2}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lpu2;

    iget v4, v0, Lru2;->a:I

    iget-object v3, v3, Lpu2;->a:Lcom/opera/android/browser/autofill/AutofillPopupView;

    iget-wide v5, v3, Lcom/opera/android/browser/autofill/AutofillPopupView;->a:J

    const-wide/16 v7, 0x0

    cmp-long v3, v5, v7

    if-eqz v3, :cond_29d

    invoke-static {v5, v6, v4}, LJ/N;->MzF9Ta1m(JI)Z

    goto :goto_29d

    :cond_2b9
    return-void

    :pswitch_2ba
    check-cast v0, Landroid/view/View;

    check-cast v12, Lmr2;

    new-instance v2, Llr2;

    invoke-direct {v2, v11}, Llr2;-><init>(B)V

    new-instance v3, Lkr2;

    new-instance v6, Lw5f;

    invoke-direct {v6, v5}, Lw5f;-><init>(B)V

    invoke-direct {v3, v1, v2, v6}, Ltjf;-><init>(Landroid/view/View;Lx1p;Lkotlin/jvm/functions/Function1;)V

    new-instance v1, Lq02;

    invoke-direct {v1, v3, v4}, Lq02;-><init>(Ljava/lang/Object;B)V

    const-wide/16 v4, 0xfa0

    invoke-virtual {v0, v1, v4, v5}, Landroid/view/View;->postDelayed(Ljava/lang/Runnable;J)Z

    iget-object v0, v12, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v3, v0}, Ltjf;->j(Landroid/view/ViewGroup;)V

    return-void

    :pswitch_2dd
    check-cast v0, Landroid/view/View$OnClickListener;

    check-cast v12, Lqb7;

    invoke-interface {v0, v1}, Landroid/view/View$OnClickListener;->onClick(Landroid/view/View;)V

    iget-object v0, v12, Lqb7;->c:Ljava/lang/Object;

    check-cast v0, Lpa;

    invoke-virtual {v0}, Lpa;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_2ec
    check-cast v0, Lww;

    check-cast v12, Lcom/opera/android/autofill/Address;

    new-instance v2, Lxw;

    iget-object v0, v0, Lww;->c:Lyw;

    invoke-direct {v2, v0, v12, v11}, Lxw;-><init>(Ljava/lang/Object;Lcom/opera/android/autofill/Address;B)V

    invoke-virtual {v2, v1}, Lo73;->p(Landroid/view/View;)V

    return-void

    :pswitch_2fb
    check-cast v0, Lyw;

    check-cast v12, Lcom/opera/android/autofill/Address;

    iget-object v0, v0, Lyw;->e:Ljava/lang/Object;

    check-cast v0, Lwth;

    iget-object v0, v0, Lwth;->b:Ljava/lang/Object;

    check-cast v0, Luw;

    invoke-virtual {v0}, Luw;->I0()Lcx;

    move-result-object v0

    iget-object v1, v0, Lcx;->d:Lot2;

    new-instance v2, Lax;

    invoke-direct {v2, v0, v11}, Lax;-><init>(Lcx;B)V

    invoke-virtual {v1, v12, v2}, Lot2;->c(Lcom/opera/android/autofill/Address;Lkotlin/jvm/functions/Function1;)V

    return-void

    :pswitch_316
    check-cast v0, Lmv;

    check-cast v12, Lbz0;

    const v1, 0x7f0a0362

    invoke-virtual {v12, v1}, Lzp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/EditText;

    if-nez v1, :cond_329

    invoke-virtual {v12}, Lzp1;->dismiss()V

    goto :goto_371

    :cond_329
    invoke-virtual {v12}, Landroid/app/Dialog;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    iget-boolean v3, v2, Lx5f;->h:Z

    if-eqz v3, :cond_34b

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    const/16 v4, 0x17

    invoke-virtual {v3, v4, v10}, Ljf0;->d(II)V

    invoke-virtual {v2, v3}, Lx5f;->U0(Lx56;)V

    :cond_34b
    invoke-virtual {v1, v11}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {v12, v8}, Lbz0;->f(I)Landroid/widget/Button;

    move-result-object v2

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v2, v11}, Landroid/view/View;->setClickable(Z)V

    invoke-virtual {v2, v10}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    invoke-virtual {v12, v11}, Landroid/app/Dialog;->setCancelable(Z)V

    iget-object v0, v0, Lmv;->b:Ljava/lang/Object;

    check-cast v0, Lfv;

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljv;

    invoke-direct {v2, v12, v11}, Ljv;-><init>(Lbz0;B)V

    invoke-interface {v0, v1, v2}, Lfv;->a(Ljava/lang/String;Ljv;)V

    :goto_371
    return-void

    :pswitch_372
    check-cast v0, Ldp;

    check-cast v12, Lxz;

    iget-object v1, v0, Ldp;->c:Lmq;

    iget-object v2, v1, Lmq;->d:Lyz;

    if-eqz v2, :cond_38d

    iget-object v3, v1, Lmq;->g:Lkm;

    iget-object v4, v1, Lmq;->c:Ldl;

    invoke-interface {v3, v12, v2, v4}, Lkm;->v(Lxz;Lyz;Ldl;)V

    invoke-virtual {v12}, Lxz;->c()V

    iget-object v2, v1, Lmq;->l:Lkq;

    if-eqz v2, :cond_38d

    invoke-interface {v2, v1}, Lkq;->r(Lmq;)V

    :cond_38d
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_391
    check-cast v0, Lwk;

    check-cast v12, Lcom/opera/android/settings/BigSwitchButton;

    iget-byte v1, v12, Lcom/opera/android/settings/BigSwitchButton;->c:B

    if-ne v1, v3, :cond_39a

    move v10, v11

    :cond_39a
    iget-boolean v1, v0, Lwk;->D:Z

    if-nez v1, :cond_3b3

    if-eqz v10, :cond_3ba

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Lgpk;

    invoke-direct {v1, v4}, Lgpk;-><init>(B)V

    const v2, 0x7f14008b

    const v3, 0x7f14008a

    invoke-static {v0, v1, v2, v3}, Lxf8;->s0(Landroid/content/Context;Lekj;II)V

    goto :goto_3ba

    :cond_3b3
    iget-object v0, v0, Lwk;->u:Lcom/opera/android/settings/SettingsManager;

    const-string v1, "ad_blocking"

    invoke-virtual {v0, v10, v1}, Lcom/opera/android/settings/SettingsManager;->V(ILjava/lang/String;)V

    :cond_3ba
    :goto_3ba
    return-void

    :pswitch_3bb
    check-cast v0, Llk;

    check-cast v12, Lak;

    invoke-virtual {v0}, Llk;->H0()Lpk;

    move-result-object v0

    iget-object v1, v12, Lak;->Z:Landroid/net/Uri;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, La8j;->a:La8j;

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Llqm;->E:Llqm;

    invoke-static {v1, v2, v11}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v1

    iput v3, v1, Lvx3;->b:I

    invoke-virtual {v1, v10}, Lvx3;->a(Z)V

    iput-boolean v10, v1, Lvx3;->f:Z

    new-instance v2, Lay3;

    invoke-direct {v2, v1}, Lay3;-><init>(Lvx3;)V

    invoke-virtual {v0, v2}, La8j;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_3e4
    check-cast v0, Lqf;

    check-cast v12, Landroid/content/Context;

    iget-object v1, v0, Lqf;->d:Ljava/lang/Object;

    check-cast v1, Lyu2;

    invoke-virtual {v1}, Lyu2;->b()Z

    move-result v1

    if-eqz v1, :cond_418

    new-instance v1, Landroid/content/Intent;

    invoke-direct {v1}, Landroid/content/Intent;-><init>()V

    const-string v2, "android.settings.REQUEST_SET_AUTOFILL_SERVICE"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {v12}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    move-result-object v2

    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "package:"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setData(Landroid/net/Uri;)Landroid/content/Intent;

    :try_start_415
    invoke-virtual {v12, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V
    :try_end_418
    .catch Landroid/content/ActivityNotFoundException; {:try_start_415 .. :try_end_418} :catch_418

    :catch_418
    :cond_418
    invoke-virtual {v0}, Ldej;->b()V

    return-void

    :pswitch_data_41c
    .packed-switch 0x0
        :pswitch_3e4
        :pswitch_3bb
        :pswitch_391
        :pswitch_372
        :pswitch_316
        :pswitch_2fb
        :pswitch_2ec
        :pswitch_2dd
        :pswitch_2ba
        :pswitch_26f
        :pswitch_25c
        :pswitch_249
        :pswitch_23f
        :pswitch_234
        :pswitch_1d8
        :pswitch_1c8
        :pswitch_1c0
        :pswitch_195
        :pswitch_184
        :pswitch_17a
        :pswitch_16e
        :pswitch_13e
        :pswitch_11f
        :pswitch_89
        :pswitch_6c
        :pswitch_64
        :pswitch_5a
        :pswitch_47
        :pswitch_32
    .end packed-switch
.end method
