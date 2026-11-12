.class public final synthetic Ld8d;
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

    iput-byte p2, p0, Ld8d;->a:B

    iput-object p1, p0, Ld8d;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final d0(Ljava/lang/Object;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    iget-byte v2, v0, Ld8d;->a:B

    const/4 v3, 0x3

    const/4 v4, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    iget-object v0, v0, Ld8d;->b:Ljava/lang/Object;

    packed-switch v2, :pswitch_data_8b0

    check-cast v0, Lozg;

    iget-object v2, v0, Lozg;->b:Lp0h;

    check-cast v1, Lqwi;

    iget-object v8, v0, Lozg;->f:Lor2;

    iget-object v8, v8, Lor2;->c:Landroid/view/View;

    check-cast v8, Landroid/widget/LinearLayout;

    invoke-virtual {v8}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v8

    iget-object v1, v1, Lqwi;->b:Lhwi;

    iget-object v9, v0, Lozg;->f:Lor2;

    if-eqz v9, :cond_35

    iget-object v9, v9, Lor2;->e:Ljava/lang/Object;

    check-cast v9, Landroid/widget/FrameLayout;

    invoke-virtual {v9}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v9, v0, Lozg;->f:Lor2;

    iget-object v9, v9, Lor2;->d:Ljava/lang/Object;

    check-cast v9, Landroid/widget/FrameLayout;

    invoke-virtual {v9}, Landroid/view/ViewGroup;->removeAllViews()V

    :cond_35
    invoke-static {v8}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v8

    iget-object v9, v0, Lozg;->f:Lor2;

    iget-object v10, v9, Lor2;->e:Ljava/lang/Object;

    check-cast v10, Landroid/widget/FrameLayout;

    iget-object v11, v9, Lor2;->f:Ljava/lang/Object;

    check-cast v11, Landroid/widget/FrameLayout;

    iget-object v9, v9, Lor2;->d:Ljava/lang/Object;

    check-cast v9, Landroid/widget/FrameLayout;

    iget-object v12, v1, Lk8;->a:Ljava/lang/Object;

    iget-object v1, v1, Lk8;->b:Ljava/lang/Object;

    check-cast v1, Lnwi;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_3a5

    const v14, 0x7f0a0897

    const v15, 0x7f0a01f8

    const-string v13, "Missing required view with ID: "

    if-eq v1, v6, :cond_241

    if-eq v1, v4, :cond_20c

    if-ne v1, v3, :cond_3d8

    check-cast v12, Ljwi;

    const v1, 0x7f0d03a7

    invoke-virtual {v8, v1, v10, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_1fb

    const v15, 0x7f0a059f

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/TextView;

    if-eqz v4, :cond_1fb

    check-cast v1, Landroid/widget/LinearLayout;

    const v1, 0x7f0d0357

    invoke-virtual {v8, v1, v11, v7}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    check-cast v10, Landroid/widget/TextView;

    if-eqz v10, :cond_1ea

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {v8, v9}, Lvs;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object v8

    iget-object v9, v12, Ljwi;->l:Lcom/opera/android/browser/chromium/SSLError;

    iget-object v11, v12, Llwi;->h:[[B

    iget-wide v13, v9, Lcom/opera/android/browser/chromium/SSLError;->d:J

    iget-wide v5, v9, Lcom/opera/android/browser/chromium/SSLError;->c:J

    iget v15, v9, Lcom/opera/android/browser/chromium/SSLError;->a:I

    packed-switch v15, :pswitch_data_8ee

    :pswitch_a7
    move v5, v7

    :goto_a8
    move-object/from16 p0, v8

    goto/16 :goto_11b

    :pswitch_ac
    const v5, 0x7f140408

    goto :goto_a8

    :pswitch_b0
    const v5, 0x7f1403fe

    goto :goto_a8

    :pswitch_b4
    const v5, 0x7f14117c

    goto :goto_a8

    :pswitch_b8
    const v5, 0x7f1403f7

    goto :goto_a8

    :pswitch_bc
    const v5, 0x7f140405

    goto :goto_a8

    :pswitch_c0
    const v5, 0x7f140402

    goto :goto_a8

    :pswitch_c4
    const v5, 0x7f140404

    goto :goto_a8

    :pswitch_c8
    const v5, 0x7f1403fc

    goto :goto_a8

    :pswitch_cc
    const v5, 0x7f140406

    goto :goto_a8

    :pswitch_d0
    const v5, 0x7f140407

    goto :goto_a8

    :pswitch_d4
    const v5, 0x7f1403fb

    goto :goto_a8

    :pswitch_d8
    const v5, 0x7f140401

    goto :goto_a8

    :pswitch_dc
    const v5, 0x7f140403

    goto :goto_a8

    :pswitch_e0
    const v5, 0x7f1403fd

    goto :goto_a8

    :pswitch_e4
    const v5, 0x7f1403f9

    goto :goto_a8

    :pswitch_e8
    const v5, 0x7f1403f6

    goto :goto_a8

    :pswitch_ec
    move-object/from16 p0, v8

    iget-wide v7, v9, Lcom/opera/android/browser/chromium/SSLError;->b:J

    const-wide/16 v16, -0x1

    cmp-long v9, v7, v16

    if-eqz v9, :cond_106

    cmp-long v9, v5, v16

    if-eqz v9, :cond_106

    cmp-long v9, v13, v16

    if-eqz v9, :cond_106

    cmp-long v9, v13, v5

    if-lez v9, :cond_106

    const v5, 0x7f1403fa

    goto :goto_11b

    :cond_106
    cmp-long v7, v13, v7

    if-ltz v7, :cond_112

    cmp-long v5, v13, v5

    if-gtz v5, :cond_112

    const v5, 0x7f1403ff

    goto :goto_11b

    :cond_112
    const v5, 0x7f140400

    goto :goto_11b

    :pswitch_116
    move-object/from16 p0, v8

    const v5, 0x7f1403f8

    :goto_11b
    invoke-virtual {v4, v5}, Landroid/widget/TextView;->setText(I)V

    if-eqz v11, :cond_138

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v5

    invoke-interface {v5}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lphj;->D0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    new-instance v6, Lnzg;

    invoke-direct {v6, v0, v11, v3, v4}, Lnzg;-><init>(Lozg;[[BLandroid/widget/TextView;B)V

    invoke-static {v3, v5, v6}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    :cond_138
    iget-object v3, v12, Llwi;->k:[[B

    array-length v4, v3

    if-lez v4, :cond_143

    invoke-virtual {v0, v3, v10}, Lozg;->h0([[BLandroid/widget/TextView;)V

    :goto_140
    move-object/from16 v1, p0

    goto :goto_151

    :cond_143
    iget-boolean v3, v12, Llwi;->i:Z

    if-eqz v3, :cond_14b

    invoke-virtual {v0, v11, v10}, Lozg;->h0([[BLandroid/widget/TextView;)V

    goto :goto_140

    :cond_14b
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_140

    :goto_151
    iget-object v3, v1, Lvs;->e:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, v12, Llwi;->b:Ljava/lang/String;

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f1404b1

    invoke-virtual {v0, v5, v4}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v3, v1, Lvs;->c:Ljava/lang/Object;

    check-cast v3, Landroid/widget/TextView;

    iget-object v4, v12, Llwi;->c:Ljava/lang/String;

    iget-object v5, v12, Llwi;->g:Ljava/lang/String;

    iget-object v6, v12, Llwi;->d:Ljava/lang/String;

    iget-boolean v7, v12, Llwi;->e:Z

    if-eqz v7, :cond_17f

    filled-new-array {v4, v6}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f1404b0

    invoke-virtual {v0, v5, v4}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    goto :goto_193

    :cond_17f
    if-nez v5, :cond_188

    const v7, 0x7f14040b

    invoke-virtual {v0, v7}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v5

    :cond_188
    filled-new-array {v4, v5, v6}, [Ljava/lang/Object;

    move-result-object v4

    const v5, 0x7f1404af

    invoke-virtual {v0, v5, v4}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    :goto_193
    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v1, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iget-boolean v3, v12, Llwi;->f:Z

    if-eqz v3, :cond_1c2

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f14069a

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_1e5

    :cond_1c2
    const/4 v4, 0x1

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f14069b

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_1e5
    invoke-virtual {v1, v2}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    goto/16 :goto_3d8

    :cond_1ea
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_3f4

    :cond_1fb
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto/16 :goto_3f4

    :cond_20c
    check-cast v12, Liwi;

    invoke-static {v8, v10}, Lwnj;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    invoke-static {v8, v9}, Lkf;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1404b2

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    goto/16 :goto_3d8

    :cond_241
    check-cast v12, Lkwi;

    const v1, 0x7f0d03a8

    const/4 v4, 0x0

    invoke-virtual {v8, v1, v10, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v10, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/TextView;

    if-eqz v3, :cond_395

    const v15, 0x7f0a04a8

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    if-eqz v5, :cond_395

    check-cast v1, Landroid/widget/LinearLayout;

    const v1, 0x7f0d0358

    invoke-virtual {v8, v1, v11, v4}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    invoke-virtual {v11, v1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v15, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    if-eqz v4, :cond_384

    invoke-static {v14, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroid/widget/TextView;

    if-eqz v6, :cond_385

    check-cast v1, Landroid/widget/LinearLayout;

    invoke-static {v8, v9}, Lvs;->g(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lvs;

    move-result-object v7

    iget-object v8, v12, Lkwi;->l:Ljava/lang/String;

    iget-object v9, v12, Llwi;->j:Ljava/lang/String;

    const v10, 0x7f141351

    filled-new-array {v8}, [Ljava/lang/Object;

    move-result-object v8

    invoke-virtual {v0, v10, v8}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v8

    invoke-virtual {v5, v8}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    iget-object v5, v12, Llwi;->h:[[B

    if-eqz v5, :cond_2b1

    const/4 v8, 0x0

    invoke-virtual {v3, v8}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v3}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v10

    invoke-interface {v10}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v10

    invoke-static {v10}, Lphj;->D0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    new-instance v11, Lnzg;

    invoke-direct {v11, v0, v5, v3, v8}, Lnzg;-><init>(Lozg;[[BLandroid/widget/TextView;B)V

    invoke-static {v3, v10, v11}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    :cond_2b1
    iget-object v3, v12, Llwi;->k:[[B

    array-length v8, v3

    const v10, 0x7f140d7c

    if-lez v8, :cond_2ce

    if-eqz v9, :cond_2ce

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v3, v6}, Lozg;->h0([[BLandroid/widget/TextView;)V

    goto :goto_2ec

    :cond_2ce
    iget-boolean v3, v12, Llwi;->i:Z

    if-eqz v3, :cond_2e7

    if-eqz v9, :cond_2e7

    filled-new-array {v9}, [Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v10, v1}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lphj;->y(Ljava/lang/String;)Landroid/text/SpannableString;

    move-result-object v1

    invoke-virtual {v4, v1}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    invoke-virtual {v0, v5, v6}, Lozg;->h0([[BLandroid/widget/TextView;)V

    goto :goto_2ec

    :cond_2e7
    const/16 v3, 0x8

    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_2ec
    iget-object v1, v7, Lvs;->e:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, v12, Llwi;->b:Ljava/lang/String;

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    const v5, 0x7f1404b1

    invoke-virtual {v0, v5, v3}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v7, Lvs;->c:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v3, v12, Llwi;->c:Ljava/lang/String;

    iget-object v4, v12, Llwi;->g:Ljava/lang/String;

    iget-object v5, v12, Llwi;->d:Ljava/lang/String;

    iget-boolean v6, v12, Llwi;->e:Z

    if-eqz v6, :cond_31a

    filled-new-array {v3, v5}, [Ljava/lang/Object;

    move-result-object v3

    const v5, 0x7f1404b0

    invoke-virtual {v0, v5, v3}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    goto :goto_32e

    :cond_31a
    if-nez v4, :cond_323

    const v6, 0x7f14040b

    invoke-virtual {v0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v4

    :cond_323
    filled-new-array {v3, v4, v5}, [Ljava/lang/Object;

    move-result-object v3

    const v5, 0x7f1404af

    invoke-virtual {v0, v5, v3}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v3

    :goto_32e
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object v1, v7, Lvs;->d:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iget-boolean v3, v12, Llwi;->f:Z

    if-eqz v3, :cond_35d

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f14069a

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    goto :goto_380

    :cond_35d
    const/4 v4, 0x1

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f14069b

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    :goto_380
    invoke-virtual {v1, v2}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    goto :goto_3d8

    :cond_384
    move v14, v15

    :cond_385
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v14}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_3f4

    :cond_395
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v15}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v13, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    goto :goto_3f4

    :cond_3a5
    check-cast v12, Lmwi;

    invoke-static {v8, v10}, Lwnj;->a(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)V

    invoke-static {v8, v9}, Lkf;->i(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object v1

    iget-object v1, v1, Lkf;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;

    iget-object v2, v2, Lp0h;->e:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    new-instance v3, Lorg/chromium/url/GURL;

    invoke-static {v2}, Lcom/opera/android/browser/BrowserUtils;->getExternalUrlWithFallback(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {v3, v2}, Lorg/chromium/url/GURL;-><init>(Ljava/lang/String;)V

    const/4 v4, 0x1

    invoke-static {v3, v4}, LJ/N;->MN7bz_Mm(Ljava/lang/Object;I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f1404b2

    invoke-virtual {v0, v3, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/opera/android/privacy_monitor/views/TextCenteredLayout;->a(Ljava/lang/CharSequence;)V

    :cond_3d8
    :goto_3d8
    iget-object v1, v0, Lozg;->f:Lor2;

    iget-object v1, v1, Lor2;->b:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    invoke-virtual {v1}, Landroid/widget/TextView;->getText()Ljava/lang/CharSequence;

    move-result-object v2

    invoke-interface {v2}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v2}, Lphj;->D0(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    new-instance v3, Lo8f;

    const/16 v4, 0x1a

    invoke-direct {v3, v0, v4}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v2, v3}, Lphj;->b0(Landroid/widget/TextView;Ljava/lang/String;Lcom/opera/api/Callback;)V

    :goto_3f4
    return-void

    :pswitch_3f5
    check-cast v0, Lazg;

    check-cast v1, Lczg;

    iget-object v2, v1, Lczg;->a:Lign;

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->m:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v4, v2, Lign;->a:Z

    if-eqz v4, :cond_407

    const/4 v5, 0x0

    goto :goto_409

    :cond_407
    const/16 v5, 0x8

    :goto_409
    invoke-virtual {v3, v5}, Landroid/view/View;->setVisibility(I)V

    if-eqz v4, :cond_42c

    iget-boolean v4, v2, Lign;->b:Z

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget v4, v2, Lign;->c:I

    new-instance v5, Lrxh;

    invoke-direct {v5, v4}, Lrxh;-><init>(I)V

    invoke-virtual {v3, v5}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->E(Lpxh;)V

    iget v4, v2, Lign;->d:I

    invoke-static {v4, v3}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget v2, v2, Lign;->e:I

    new-instance v4, Ldxh;

    invoke-direct {v4, v2}, Ldxh;-><init>(I)V

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->D(Lcxh;)V

    :cond_42c
    iget-object v2, v1, Lczg;->b:Lsj;

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v4, v2, Lsj;->a:Z

    iget v5, v2, Lsj;->b:I

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v4, v2, Lsj;->c:Z

    if-eqz v4, :cond_45f

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const/high16 v6, 0x7f120000

    invoke-virtual {v2, v6, v5, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lqxh;

    invoke-direct {v4, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_466

    :cond_45f
    iget v2, v2, Lsj;->d:I

    new-instance v4, Lrxh;

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    :goto_466
    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object v2, v1, Lczg;->c:Ltyl;

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->l:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-boolean v4, v2, Ltyl;->a:Z

    iget v5, v2, Ltyl;->b:I

    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-boolean v4, v2, Ltyl;->c:Z

    if-eqz v4, :cond_49d

    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-static {}, Ljava/text/NumberFormat;->getNumberInstance()Ljava/text/NumberFormat;

    move-result-object v4

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-virtual {v4, v6}, Ljava/text/Format;->format(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v4

    filled-new-array {v4}, [Ljava/lang/Object;

    move-result-object v4

    const v6, 0x7f12006d

    invoke-virtual {v2, v6, v5, v4}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    new-instance v4, Lqxh;

    invoke-direct {v4, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_4a4

    :cond_49d
    iget v2, v2, Ltyl;->d:I

    new-instance v4, Lrxh;

    invoke-direct {v4, v2}, Lrxh;-><init>(I)V

    :goto_4a4
    invoke-virtual {v3, v4}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    iget-object v2, v1, Lczg;->d:Lj7j;

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v4

    iget v2, v2, Lj7j;->a:I

    invoke-virtual {v4, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Lv0g;->m(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljava/lang/String;)V

    iget v2, v1, Lczg;->f:I

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-static {v2, v3}, Lu35;->k(ILcom/opera/android/ui/catalog/widget/OperaListItem;)V

    iget-object v2, v1, Lczg;->e:Lcgh;

    sget-object v3, Lhwk;->a:Lhwk;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_4dd

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v2

    iget-object v2, v2, Llm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    goto :goto_4f8

    :cond_4dd
    instance-of v3, v2, Liwk;

    if-eqz v3, :cond_547

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    check-cast v2, Liwk;

    iget-boolean v2, v2, Liwk;->a:Z

    invoke-virtual {v3, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    :goto_4f8
    iget-boolean v2, v1, Lczg;->g:Z

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v3

    iget-object v3, v3, Llm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    invoke-virtual {v3, v2}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->t(Z)V

    iget-object v1, v1, Lczg;->h:Lkfo;

    invoke-virtual {v0}, Lazg;->H0()Llm9;

    move-result-object v2

    iget-object v2, v2, Llm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v3, v2, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    iget-object v3, v3, Lbpd;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaTextView;

    const/4 v4, 0x1

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setMaxLines(I)V

    instance-of v3, v1, Lg35;

    if-eqz v3, :cond_52b

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    check-cast v1, Lg35;

    iget-object v1, v1, Lg35;->k:[Lr25;

    invoke-static {v0, v1}, Lz4o;->V(Landroid/content/Context;[Lr25;)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_53f

    :cond_52b
    sget-object v3, Lh35;->k:Lh35;

    invoke-virtual {v1, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_543

    const v1, 0x7f14043e

    invoke-virtual {v0, v1}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    :goto_53f
    invoke-virtual {v2, v1}, Lcom/opera/android/ui/catalog/widget/OperaListItem;->C(Lpxh;)V

    goto :goto_54a

    :cond_543
    invoke-static {}, Lh9o;->p()V

    goto :goto_54a

    :cond_547
    invoke-static {}, Lh9o;->p()V

    :goto_54a
    return-void

    :pswitch_54b
    check-cast v0, Lhze;

    check-cast v1, Lylk;

    iget-object v0, v0, Lhze;->c:Ljava/lang/Object;

    check-cast v0, Ltah;

    invoke-virtual {v1, v0}, Lylk;->s0(Ldmk;)V

    return-void

    :pswitch_557
    check-cast v0, Ltah;

    check-cast v1, Lylk;

    invoke-virtual {v1, v0}, Lylk;->s0(Ldmk;)V

    return-void

    :pswitch_55f
    check-cast v0, Lcvg;

    check-cast v1, Lgvg;

    invoke-virtual {v0, v1}, Lcvg;->H0(Lgvg;)V

    return-void

    :pswitch_567
    check-cast v0, Lktg;

    check-cast v1, Luvg;

    sget-object v2, Luvg;->g:Luvg;

    if-eq v1, v2, :cond_584

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    const/4 v2, 0x1

    if-eq v1, v2, :cond_57a

    if-eq v1, v4, :cond_57a

    const/4 v6, 0x0

    goto :goto_57b

    :cond_57a
    const/4 v6, 0x1

    :goto_57b
    iget-object v0, v0, Lktg;->b:Lkze;

    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    :cond_584
    return-void

    :pswitch_585
    check-cast v0, Ls14;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0}, Ls14;->M()V

    return-void

    :pswitch_590
    check-cast v0, Lkcg;

    check-cast v1, Ldpf;

    new-instance v2, Li4d;

    const/16 v3, 0xf

    invoke-direct {v2, v0, v3}, Li4d;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Ldpf;->a(Lhpf;)V

    return-void

    :pswitch_59f
    check-cast v0, Lhcg;

    check-cast v1, Ljcg;

    iget-object v2, v1, Ljcg;->a:Lzi4;

    sget-object v3, Lub;->x:Lub;

    invoke-virtual {v2, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_5dd

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->f:Lcom/opera/android/custom_views/StylingTextView;

    const v3, 0x7f14120b

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->e:Lcom/opera/android/custom_views/StylingTextView;

    const v3, 0x7f1409cd

    invoke-virtual {v2, v3}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->d:Landroid/widget/ImageView;

    const/16 v3, 0x8

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->c:Lcom/opera/android/custom_views/CircleImageView;

    const v3, 0x7f08042e

    invoke-virtual {v2, v3}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_611

    :cond_5dd
    instance-of v3, v2, Lvb;

    if-eqz v3, :cond_64f

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v3

    iget-object v3, v3, Lkm9;->f:Lcom/opera/android/custom_views/StylingTextView;

    check-cast v2, Lvb;

    iget-object v4, v2, Lvb;->x:Ljava/lang/String;

    invoke-virtual {v3, v4}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v3

    iget-object v3, v3, Lkm9;->e:Lcom/opera/android/custom_views/StylingTextView;

    iget-object v4, v2, Lvb;->y:Ljava/lang/String;

    invoke-static {v3, v4}, Lna2;->S(Landroid/widget/TextView;Ljava/lang/CharSequence;)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v3

    iget-object v3, v3, Lkm9;->d:Landroid/widget/ImageView;

    const/4 v4, 0x0

    invoke-virtual {v3, v4}, Landroid/view/View;->setVisibility(I)V

    iget-object v3, v0, Lhcg;->t:Ld7h;

    iget-object v2, v2, Lvb;->z:Ljava/lang/String;

    new-instance v4, Lo8f;

    const/16 v5, 0x14

    invoke-direct {v4, v0, v5}, Lo8f;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2, v4}, Ld7h;->c(Ljava/lang/String;Lcom/opera/api/Callback;)V

    :goto_611
    iget v2, v1, Ljcg;->b:I

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v3

    iget-object v3, v3, Lkm9;->k:Lcom/opera/android/widget/MenuSettingsListItem;

    iget-object v3, v3, Lcom/opera/android/widget/MenuSettingsListItem;->b:Lor2;

    iget-object v3, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v3, v2}, Landroid/widget/TextView;->setText(I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->j:Lcom/opera/android/widget/MenuSettingsListItem;

    iget v3, v1, Ljcg;->c:I

    invoke-virtual {v0, v2, v3}, Lhcg;->J0(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->h:Lcom/opera/android/widget/MenuSettingsListItem;

    iget v3, v1, Ljcg;->d:I

    invoke-virtual {v0, v2, v3}, Lhcg;->J0(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->g:Lcom/opera/android/widget/MenuSettingsListItem;

    iget v3, v1, Ljcg;->e:I

    invoke-virtual {v0, v2, v3}, Lhcg;->J0(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    invoke-virtual {v0}, Lhcg;->H0()Lkm9;

    move-result-object v2

    iget-object v2, v2, Lkm9;->i:Lcom/opera/android/widget/MenuSettingsListItem;

    iget v1, v1, Ljcg;->f:I

    invoke-virtual {v0, v2, v1}, Lhcg;->J0(Lcom/opera/android/widget/MenuSettingsListItem;I)V

    goto :goto_652

    :cond_64f
    invoke-static {}, Lh9o;->p()V

    :goto_652
    return-void

    :pswitch_653
    check-cast v0, Lq4g;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-nez v1, :cond_684

    invoke-virtual {v0}, Lq4g;->H0()Z

    move-result v1

    if-eqz v1, :cond_684

    iget-object v1, v0, Lq4g;->D:Lo4g;

    iget-object v1, v1, Lo4g;->j:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingImageButton;

    const v2, 0x7f080625

    invoke-virtual {v1, v2}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object v1, v0, Lq4g;->D:Lo4g;

    iget-object v1, v1, Lo4g;->f:Landroid/view/View;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    const/4 v4, 0x0

    invoke-static {v1, v4}, Lc5g;->a(Landroid/widget/TextView;Z)V

    iget-object v0, v0, Lq4g;->D:Lo4g;

    iget-object v0, v0, Lo4g;->f:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const-string v1, "fakepass"

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_684
    return-void

    :pswitch_685
    check-cast v0, Lkwf;

    check-cast v1, Lpeg;

    invoke-virtual {v0}, Lo73;->f()Lr9i;

    move-result-object v1

    if-eqz v1, :cond_6ae

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lm66;

    const v2, 0x7f0a07eb

    invoke-virtual {v1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v1

    if-eqz v1, :cond_6ae

    iget-object v0, v0, Lkwf;->D:Lkze;

    if-eqz v0, :cond_6aa

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    sget-object v2, Lpeg;->c:Lpeg;

    if-ne v0, v2, :cond_6aa

    const/4 v6, 0x1

    goto :goto_6ab

    :cond_6aa
    const/4 v6, 0x0

    :goto_6ab
    invoke-interface {v1, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_6ae
    return-void

    :pswitch_6af
    check-cast v0, Lshf;

    check-cast v1, Lmnf;

    iget-object v1, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmnf;

    iget-object v0, v0, Lshf;->b:Ljava/lang/Object;

    check-cast v0, Landroid/widget/ScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v2

    iget v3, v1, Lmnf;->a:I

    invoke-virtual {v0}, Landroid/view/View;->getPaddingRight()I

    move-result v4

    iget v1, v1, Lmnf;->b:I

    invoke-virtual {v0, v2, v3, v4, v1}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :pswitch_6d1
    check-cast v0, Lqgf;

    check-cast v1, Logf;

    iput-object v1, v0, Lqgf;->i:Logf;

    iget-object v1, v0, Lqgf;->b:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    invoke-virtual {v0, v1}, Lqgf;->W(Lb2l;)V

    return-void

    :pswitch_6df
    check-cast v0, Lvbf;

    check-cast v1, Ljava/util/List;

    invoke-virtual {v0}, Lvbf;->q()V

    iget-object v0, v0, Lvbf;->t:Ltbf;

    iput-object v1, v0, Ltbf;->f:Ljava/util/List;

    return-void

    :pswitch_6eb
    check-cast v0, La3f;

    check-cast v1, Lb3f;

    sget-object v2, La3f;->w:Li06;

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v5

    iget-object v5, v5, Lfm9;->f:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v6, v1, Lb3f;->a:Ljwk;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v5, v6}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->i:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->b:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->e:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->c:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->g:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->d:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->d:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->e:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->c:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->f:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v2

    iget-object v2, v2, Lfm9;->h:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v5, v1, Lb3f;->g:Ljwk;

    invoke-static {v2, v5}, Li06;->b(Lcom/opera/android/ui/catalog/widget/OperaListItem;Ljwk;)V

    invoke-virtual {v0}, La3f;->H0()Lfm9;

    move-result-object v0

    iget-object v0, v0, Lfm9;->j:Lcom/opera/android/ui/catalog/widget/OperaListItem;

    iget-object v0, v0, Lcom/opera/android/ui/catalog/widget/OperaListItem;->B:Ldmf;

    iget-object v1, v1, Lb3f;->h:Lw0f;

    if-nez v1, :cond_750

    const/4 v1, -0x1

    :goto_74e
    const/4 v2, 0x1

    goto :goto_759

    :cond_750
    sget-object v2, Lz2f;->a:[I

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    aget v1, v2, v1

    goto :goto_74e

    :goto_759
    if-eq v1, v2, :cond_779

    if-eq v1, v4, :cond_770

    if-eq v1, v3, :cond_767

    new-instance v1, Lqxh;

    const-string v2, ""

    invoke-direct {v1, v2}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_781

    :cond_767
    new-instance v1, Lrxh;

    const v2, 0x7f140b76

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    goto :goto_781

    :cond_770
    new-instance v1, Lrxh;

    const v2, 0x7f140b74

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    goto :goto_781

    :cond_779
    new-instance v1, Lrxh;

    const v2, 0x7f140b75

    invoke-direct {v1, v2}, Lrxh;-><init>(I)V

    :goto_781
    invoke-virtual {v0, v1}, Ldmf;->V(Lpxh;)V

    return-void

    :pswitch_785
    check-cast v0, Lu1f;

    check-cast v1, Lm18;

    invoke-virtual {v0}, Lp1f;->b()V

    return-void

    :pswitch_78d
    check-cast v0, Lf1p;

    check-cast v1, Ljava/lang/Integer;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lf1p;->b:Ljava/lang/Object;

    check-cast v1, Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Number;

    invoke-virtual {v1}, Ljava/lang/Number;->intValue()I

    move-result v3

    iget-object v0, v0, Lf1p;->a:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    move-object v2, v0

    check-cast v2, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/4 v6, 0x0

    const/16 v7, 0xa

    const/4 v4, 0x0

    move v5, v3

    invoke-static/range {v2 .. v7}, Lp37;->o0(Landroid/view/View;IIIII)V

    return-void

    :pswitch_7b4
    check-cast v0, Lk5o;

    check-cast v1, Lv8k;

    iget-object v1, v0, Lk5o;->b:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    iget-object v0, v0, Lk5o;->c:Ljava/lang/Object;

    check-cast v0, Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv8k;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0, v2}, Lv8k;->d(Landroid/content/Context;)I

    move-result v0

    invoke-static {v0}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object v0

    invoke-virtual {v1, v0}, Landroid/view/View;->setBackgroundTintList(Landroid/content/res/ColorStateList;)V

    return-void

    :pswitch_7da
    check-cast v0, Lpte;

    check-cast v1, Lste;

    invoke-virtual {v0, v1}, Lpte;->L0(Lste;)V

    return-void

    :pswitch_7e2
    check-cast v0, Lrn9;

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0}, Lrn9;->M()V

    return-void

    :pswitch_7ea
    check-cast v0, Ls6h;

    check-cast v1, Ljava/util/Set;

    invoke-virtual {v0}, Ls6h;->Q()V

    return-void

    :pswitch_7f2
    check-cast v0, Lf0e;

    check-cast v1, Leyj;

    iget-object v1, v0, Lf0e;->c:Lpde;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leyj;

    iget-object v1, v1, Leyj;->l:Ltxj;

    if-eqz v1, :cond_813

    iget-object v1, v1, Ltxj;->e:Landroid/util/Size;

    iget-object v2, v0, Lf0e;->b:Lsf2;

    iget-object v2, v2, Lsf2;->b:Landroid/widget/ImageView;

    invoke-virtual {v1}, Landroid/util/Size;->getWidth()I

    move-result v3

    invoke-virtual {v1}, Landroid/util/Size;->getHeight()I

    move-result v1

    invoke-static {v2, v3, v1}, Lp37;->s0(Landroid/view/View;II)V

    :cond_813
    invoke-virtual {v0}, Lf0e;->U()V

    return-void

    :pswitch_817
    check-cast v0, Le0e;

    check-cast v1, Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Le0e;->X()V

    return-void

    :pswitch_81f
    check-cast v0, Lb0e;

    check-cast v1, Lxzd;

    iget-object v0, v0, Lb0e;->k:Lrn9;

    invoke-virtual {v0}, Lrn9;->N()V

    return-void

    :pswitch_829
    check-cast v0, Lrld;

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eqz v1, :cond_84a

    iget-boolean v1, v0, Lrld;->r:Z

    if-nez v1, :cond_84a

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1606

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_84a
    return-void

    :pswitch_84b
    check-cast v0, Lgld;

    check-cast v1, Liig;

    invoke-virtual {v0}, Lgld;->H0()V

    invoke-virtual {v0}, Lgld;->G0()V

    return-void

    :pswitch_856
    check-cast v0, Lwcd;

    check-cast v1, Ljava/util/List;

    new-instance v2, Landroid/util/SparseArray;

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v3

    invoke-direct {v2, v3}, Landroid/util/SparseArray;-><init>(I)V

    check-cast v1, Ljava/lang/Iterable;

    invoke-interface {v1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_869
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_87b

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ll2g;

    iget v4, v3, Ll2g;->a:I

    invoke-virtual {v2, v4, v3}, Landroid/util/SparseArray;->put(ILjava/lang/Object;)V

    goto :goto_869

    :cond_87b
    iput-object v2, v0, Lwcd;->e:Landroid/util/SparseArray;

    return-void

    :pswitch_87e
    check-cast v0, Lrkc;

    invoke-virtual {v0, v1}, Lrkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    :pswitch_884
    check-cast v0, La9d;

    check-cast v1, Lwvg;

    iput-object v1, v0, La9d;->r:Lwvg;

    iget-object v1, v0, La9d;->v:Ld3k;

    if-eqz v1, :cond_895

    invoke-virtual {v1}, Lxob;->isActive()Z

    move-result v1

    const/4 v4, 0x1

    if-eq v1, v4, :cond_8a6

    :cond_895
    invoke-static {v0}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v1

    new-instance v2, Lx8d;

    const/4 v4, 0x0

    const/4 v8, 0x0

    invoke-direct {v2, v0, v4, v8}, Lx8d;-><init>(La9d;Lmt5;B)V

    invoke-static {v1, v4, v4, v2, v3}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-result-object v1

    iput-object v1, v0, La9d;->v:Ld3k;

    :cond_8a6
    return-void

    :pswitch_8a7
    check-cast v0, Lh8d;

    check-cast v1, Lylk;

    invoke-virtual {v1, v0}, Lylk;->s0(Ldmk;)V

    return-void

    nop

    :pswitch_data_8b0
    .packed-switch 0x0
        :pswitch_8a7
        :pswitch_884
        :pswitch_87e
        :pswitch_856
        :pswitch_84b
        :pswitch_829
        :pswitch_81f
        :pswitch_817
        :pswitch_7f2
        :pswitch_7ea
        :pswitch_7e2
        :pswitch_7da
        :pswitch_7b4
        :pswitch_78d
        :pswitch_785
        :pswitch_6eb
        :pswitch_6df
        :pswitch_6d1
        :pswitch_6af
        :pswitch_685
        :pswitch_653
        :pswitch_59f
        :pswitch_590
        :pswitch_585
        :pswitch_567
        :pswitch_55f
        :pswitch_557
        :pswitch_54b
        :pswitch_3f5
    .end packed-switch

    :pswitch_data_8ee
    .packed-switch 0x0
        :pswitch_116
        :pswitch_ec
        :pswitch_e8
        :pswitch_e4
        :pswitch_e0
        :pswitch_dc
        :pswitch_d8
        :pswitch_d4
        :pswitch_d0
        :pswitch_cc
        :pswitch_c8
        :pswitch_c4
        :pswitch_a7
        :pswitch_c0
        :pswitch_bc
        :pswitch_b8
        :pswitch_e8
        :pswitch_e8
        :pswitch_b4
        :pswitch_b0
        :pswitch_ac
    .end packed-switch
.end method
