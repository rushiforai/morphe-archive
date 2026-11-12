.class public final synthetic Lyk4;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lyk4;->a:B

    iput-object p1, p0, Lyk4;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ll18;Lbz0;)V
    .registers 3

    const/16 p2, 0x13

    iput-byte p2, p0, Lyk4;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lyk4;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 24

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Lyk4;->a:B

    const/4 v3, 0x4

    const/16 v4, 0x8

    const/4 v5, 0x0

    const/4 v6, 0x1

    sget-object v7, Lijm;->b:Lijm;

    const/4 v8, 0x0

    iget-object v0, v0, Lyk4;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_2c6

    check-cast v0, Lks3;

    iget-object v0, v0, Lks3;->h:Ljava/lang/Object;

    check-cast v0, Lld9;

    invoke-virtual {v0}, Lld9;->run()V

    return-void

    :pswitch_1d
    check-cast v0, Lfw9;

    invoke-virtual {v0}, Lfw9;->I0()Liw9;

    move-result-object v0

    iget-object v0, v0, Lj93;->c:Ld8j;

    check-cast v0, Lg8j;

    iget-object v2, v0, Lg8j;->c:Ldu3;

    invoke-virtual {v2}, Ldu3;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqim;

    iget-object v2, v2, Lqim;->d:Lnej;

    iget-object v0, v0, Lg8j;->d:Lcom/opera/android/Lazy;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lswf;

    new-instance v3, Lqp2;

    const/16 v4, 0x13

    invoke-direct {v3, v4}, Lqp2;-><init>(B)V

    new-instance v4, Lim6;

    const/4 v5, 0x7

    invoke-direct {v4, v0, v3, v1, v5}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v2, v4, v7}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_4d
    check-cast v0, Ljd9;

    new-array v2, v6, [Ltc9;

    sget-object v3, Ltc9;->b:Ltc9;

    aput-object v3, v2, v8

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v4

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v4

    invoke-virtual {v4}, Ldb;->f()Z

    move-result v4

    if-nez v4, :cond_74

    const/4 v2, 0x2

    new-array v2, v2, [Ltc9;

    aput-object v3, v2, v8

    sget-object v3, Ltc9;->c:Ltc9;

    aput-object v3, v2, v6

    :cond_74
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v3

    invoke-static {v3}, La4h;->f(Landroid/content/Context;)Lnej;

    move-result-object v3

    new-instance v4, Lim6;

    const/4 v5, 0x3

    invoke-direct {v4, v0, v2, v1, v5}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v3, v4, v7}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_89
    check-cast v0, Led9;

    new-instance v1, Ljd9;

    invoke-direct {v1}, Ljd9;-><init>()V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v1, v0}, Ls63;->w0(Landroid/content/Context;)V

    return-void

    :pswitch_98
    check-cast v0, Lwb9;

    iget-object v0, v0, Lxb9;->h:Lcom/opera/android/flow/MyFlowMessageRoot;

    invoke-virtual {v0}, Landroid/view/View;->performClick()Z

    return-void

    :pswitch_a0
    check-cast v0, Ltu8;

    iget-object v0, v0, Lab2;->b:Lja2;

    check-cast v0, Luu8;

    if-eqz v0, :cond_ad

    iget-object v0, v0, Luu8;->c:Lnw8;

    invoke-virtual {v0}, Lnw8;->run()V

    :cond_ad
    return-void

    :pswitch_ae
    check-cast v0, Lkj8;

    iget-object v1, v0, Lkj8;->b:Lypd;

    iget-object v0, v0, Lkj8;->c:Ll2l;

    iget v0, v0, Ll2l;->b:I

    invoke-virtual {v1, v0}, Lypd;->q(I)V

    return-void

    :pswitch_ba
    check-cast v0, Lv88;

    iget-object v0, v0, Lv88;->c:Landroid/widget/TextView;

    invoke-virtual {v0, v8}, Landroid/view/View;->setVisibility(I)V

    return-void

    :pswitch_c2
    check-cast v0, Lcom/opera/android/esim/ui/EsimActivity;

    sget v1, Lcom/opera/android/esim/ui/EsimActivity;->f0:I

    iget-object v0, v0, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_cd

    invoke-virtual {v0, v8}, Lcom/opera/android/browser/chromium/ChromiumContent;->x(Z)V

    :cond_cd
    return-void

    :pswitch_ce
    check-cast v0, Lb38;

    iget-object v1, v0, Lb38;->b:Lypd;

    iget v0, v0, Lb38;->c:I

    invoke-virtual {v1, v0}, Lypd;->E(I)Lb2l;

    return-void

    :pswitch_d8
    check-cast v0, Ll18;

    iget-object v1, v0, Ll18;->f:Landroid/widget/EditText;

    if-eqz v1, :cond_e6

    invoke-virtual {v1}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lo1e;->m0(Ljava/lang/CharSequence;)V

    goto :goto_e9

    :cond_e6
    invoke-virtual {v0}, Luim;->h0()V

    :goto_e9
    return-void

    :pswitch_ea
    check-cast v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v1

    if-nez v1, :cond_ff

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->isDestroyed()Z

    move-result v1

    if-nez v1, :cond_ff

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->z1()V

    :cond_ff
    return-void

    :pswitch_100
    check-cast v0, Lmz7;

    const/16 v2, 0x4000

    invoke-virtual {v1, v2}, Landroid/view/View;->sendAccessibilityEvent(I)V

    iget-object v1, v0, Lmz7;->c:Liy7;

    iget-object v2, v0, Lmz7;->g:Lnz7;

    if-eqz v2, :cond_10e

    move-object v5, v2

    :cond_10e
    invoke-virtual {v1, v0, v5}, Liy7;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_112
    check-cast v0, Lcom/opera/android/account/auth/EditProfileAuthActivity;

    sget v2, Lcom/opera/android/account/auth/EditProfileAuthActivity;->V:I

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object v1

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v2

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v3

    new-instance v5, Lga6;

    invoke-direct {v5, v0, v4}, Lga6;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Lhy4;

    invoke-direct {v0, v2, v3, v5}, Lhy4;-><init>(Ldb;Lbf9;Luif;)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v1, v0, v7}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_145
    check-cast v0, Ligi;

    new-instance v2, Lakg;

    iget-object v3, v0, Ligi;->c:Ljava/lang/Object;

    check-cast v3, Liv7;

    iget-object v4, v3, Liv7;->d:Lpde;

    iget-object v3, v3, Liv7;->f:Lpde;

    new-instance v5, Ld06;

    invoke-direct {v5, v0}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {v2, v4, v3, v5}, Lakg;-><init>(Lpde;Lpde;Lori;)V

    iget-object v0, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v0, Lwzg;

    iget-object v0, v0, Lwzg;->b:Ljava/lang/Object;

    check-cast v0, Lmrk;

    iget-object v0, v0, Lmrk;->v:Ligi;

    invoke-virtual {v0}, Ligi;->y0()V

    invoke-virtual {v2, v1}, Lo73;->o(Landroid/view/View;)V

    return-void

    :pswitch_16a
    check-cast v0, Llv7;

    invoke-virtual {v0}, Llv7;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_170
    check-cast v0, Lwt7;

    iget-object v0, v0, Lwt7;->h:Lp8f;

    iget-object v1, v0, Lp8f;->c:Ljava/lang/Object;

    check-cast v1, Lmrk;

    iget-object v1, v1, Lmrk;->K:Lj55;

    iget-object v2, v1, Lj55;->p:Li55;

    iget-object v2, v2, Li55;->b:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v2, :cond_196

    iget-object v3, v1, Lj55;->e:Landroid/content/Context;

    invoke-virtual {v2}, Lcom/opera/android/suggestion/Suggestion;->b()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2, v8}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    iput-boolean v6, v1, Lj55;->l:Z

    iget-object v2, v1, Lj55;->p:Li55;

    iget-object v2, v2, Li55;->a:Ljava/lang/String;

    invoke-virtual {v1, v2}, Lj55;->h(Ljava/lang/String;)Li55;

    move-result-object v2

    invoke-virtual {v1, v2, v6}, Lj55;->j(Li55;Z)V

    :cond_196
    iget-object v0, v0, Lp8f;->d:Ljava/lang/Object;

    check-cast v0, Ldbf;

    sget-object v1, Lqk0;->H:Lqk0;

    invoke-virtual {v0, v1}, Ldbf;->A(Lqk0;)V

    return-void

    :pswitch_1a0
    check-cast v0, Lym7;

    invoke-virtual {v0}, Lym7;->t()V

    return-void

    :pswitch_1a6
    check-cast v0, Lcf7;

    new-array v1, v8, [Ln6h;

    new-instance v7, Lwzg;

    const-class v2, Lwg7;

    invoke-direct {v7, v5, v2, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v8, Landroid/os/Bundle;

    invoke-direct {v8}, Landroid/os/Bundle;-><init>()V

    iget-object v2, v0, Lcf7;->d:Ljava/lang/Object;

    check-cast v2, Lre7;

    iget-wide v2, v2, Lre7;->o:J

    const-string v4, "download"

    invoke-virtual {v8, v4, v2, v3}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    iget-object v0, v0, Lcf7;->e:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    new-instance v6, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v13

    const/4 v9, 0x2

    const/16 v10, 0x1003

    const/4 v11, 0x0

    const/4 v12, 0x0

    invoke-direct/range {v6 .. v13}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v6, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_1d7
    check-cast v0, Ligi;

    iget-object v1, v0, Ligi;->c:Ljava/lang/Object;

    check-cast v1, Lbbf;

    iget-object v1, v1, Lbbf;->a:Labf;

    invoke-interface {v1}, Labf;->dismiss()V

    const-class v1, Ltc6;

    invoke-static {v1}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object v1

    iget-object v0, v0, Ligi;->b:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    invoke-virtual {v1, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_1f0
    check-cast v0, Lsb6;

    iget-object v10, v0, Lsb6;->v:Lumi;

    iget-object v11, v0, Lsb6;->w:Lr65;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lhjf;->v(Landroid/content/Context;)Ldll;

    move-result-object v12

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v9, Lx65;

    const/4 v13, 0x0

    const/4 v14, 0x0

    const/4 v15, 0x0

    const/16 v16, 0x0

    const/16 v17, 0x1

    const/16 v18, 0x0

    const/16 v19, 0x1

    const/16 v20, 0x0

    const/16 v21, 0x1

    invoke-direct/range {v9 .. v21}, Lx65;-><init>(Lumi;Lr65;Ldll;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function0;ZLp10;ZZZZZ)V

    new-array v1, v8, [Ln6h;

    new-instance v11, Lwzg;

    const-class v2, Lx65;

    invoke-direct {v11, v9, v2, v3}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v0

    new-instance v10, Lzhj;

    invoke-static {v1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v17

    const/4 v12, 0x0

    const/4 v13, 0x2

    const/16 v14, 0x1003

    const/4 v15, 0x0

    const/16 v16, 0x0

    invoke-direct/range {v10 .. v17}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v10, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_236
    check-cast v0, Ltxi;

    invoke-virtual {v0}, Ltxi;->j()V

    return-void

    :pswitch_23c
    check-cast v0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;

    invoke-virtual {v0}, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->e()V

    iget-wide v0, v0, Lorg/chromium/content/browser/webcontents/WebContentsImpl;->b:J

    invoke-static {v0, v1}, LJ/N;->MYRJ_nNk(J)V

    return-void

    :pswitch_247
    check-cast v0, Lor2;

    iget-object v1, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextSwitcher;

    invoke-virtual {v1}, Landroid/widget/ViewAnimator;->showNext()V

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Landroid/widget/TextSwitcher;

    invoke-virtual {v0}, Landroid/widget/ViewAnimator;->showNext()V

    return-void

    :pswitch_258
    check-cast v0, Lyl5;

    iget-object v1, v0, Lyl5;->g:Ljava/lang/String;

    if-eqz v1, :cond_271

    iget-object v1, v0, Lyl5;->e:Landroid/view/View;

    invoke-virtual {v1, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lyl5;->f:Landroid/view/View;

    invoke-virtual {v1, v8}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, v0, Lyl5;->h:Lam5;

    iget-object v1, v1, Lam5;->s:Lbf9;

    iget-object v0, v0, Lyl5;->g:Ljava/lang/String;

    invoke-virtual {v1, v0}, Lbf9;->i(Ljava/lang/String;)V

    :cond_271
    return-void

    :pswitch_272
    check-cast v0, Ll55;

    iget-boolean v1, v0, Ll55;->g:Z

    xor-int/2addr v1, v6

    iput-boolean v1, v0, Ll55;->g:Z

    invoke-virtual {v0}, Ll55;->a0()V

    return-void

    :pswitch_27d
    check-cast v0, Lt35;

    iget-object v2, v0, Lt35;->i:Landroid/widget/EditText;

    if-eqz v2, :cond_29a

    invoke-virtual {v2}, Landroid/widget/EditText;->getText()Landroid/text/Editable;

    move-result-object v2

    invoke-virtual {v1}, Landroid/view/View;->hasFocus()Z

    move-result v1

    if-eqz v1, :cond_292

    iget-object v1, v0, Lt35;->i:Landroid/widget/EditText;

    invoke-virtual {v1}, Landroid/view/View;->requestFocus()Z

    :cond_292
    if-eqz v2, :cond_297

    invoke-interface {v2}, Landroid/text/Editable;->clear()V

    :cond_297
    invoke-virtual {v0}, La38;->p()V

    :cond_29a
    return-void

    :pswitch_29b
    check-cast v0, Lp35;

    invoke-virtual {v0}, Lp35;->H0()V

    return-void

    :pswitch_2a1
    check-cast v0, Lkl4;

    iget-object v1, v0, Lkl4;->f:Lcom/opera/android/suggestion/Suggestion;

    if-eqz v1, :cond_2b1

    iget-object v2, v0, Lkl4;->e:Lnv6;

    invoke-virtual {v2, v1}, Lnv6;->C(Lcom/opera/android/suggestion/Suggestion;)V

    iget-object v0, v0, Lkl4;->c:Lil4;

    invoke-virtual {v0, v1}, Lil4;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :cond_2b1
    return-void

    :pswitch_2b2
    check-cast v0, Lzk4;

    invoke-virtual {v0}, Lzk4;->I0()Ldl4;

    move-result-object v0

    iget-object v0, v0, Ldl4;->d:Lot2;

    iget-object v0, v0, Lot2;->b:Lgjm;

    new-instance v1, Llp2;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v0, v1, v8}, Lgjm;->e(Ln37;Z)V

    return-void

    nop

    :pswitch_data_2c6
    .packed-switch 0x0
        :pswitch_2b2
        :pswitch_2a1
        :pswitch_29b
        :pswitch_27d
        :pswitch_272
        :pswitch_258
        :pswitch_247
        :pswitch_23c
        :pswitch_236
        :pswitch_1f0
        :pswitch_1d7
        :pswitch_1a6
        :pswitch_1a0
        :pswitch_170
        :pswitch_16a
        :pswitch_145
        :pswitch_112
        :pswitch_100
        :pswitch_ea
        :pswitch_d8
        :pswitch_ce
        :pswitch_c2
        :pswitch_ba
        :pswitch_ae
        :pswitch_a0
        :pswitch_98
        :pswitch_89
        :pswitch_4d
        :pswitch_1d
    .end packed-switch
.end method
