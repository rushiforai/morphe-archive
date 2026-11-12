.class public final synthetic Lh4i;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lami;Lgfh;)V
    .registers 3

    const/4 p1, 0x2

    iput-byte p1, p0, Lh4i;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lh4i;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lh4i;->a:B

    iput-object p1, p0, Lh4i;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final onClick(Landroid/view/View;)V
    .registers 12

    iget-byte v0, p0, Lh4i;->a:B

    const/4 v1, 0x4

    const/16 v2, 0xd

    const/4 v3, 0x2

    const-string v4, "SyncAuthPortalFragment_request"

    const-string v5, ""

    const/16 v6, 0x1003

    const/4 v7, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x1

    iget-object p0, p0, Lh4i;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3e8

    check-cast p0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;

    iget-object p0, p0, Lcom/usercentrics/sdk/ui/secondLayer/component/header/UCSecondLayerHeader;->B:Lbfm;

    if-eqz p0, :cond_1b

    move-object v7, p0

    :cond_1b
    check-cast v7, Ldfm;

    iget-object p0, v7, Ldfm;->c:Lkfm;

    iget-object p1, p0, Lkfm;->c:Li3j;

    new-instance v0, Lcom/usercentrics/sdk/ui/PredefinedUIResponse;

    sget-object v1, Lmqg;->d:Lmqg;

    iget-object v2, p1, Li3j;->b:Ljava/lang/Object;

    check-cast v2, Laxm;

    invoke-virtual {v2}, Laxm;->o()Ljava/util/ArrayList;

    move-result-object v2

    iget-object p1, p1, Li3j;->a:Ljava/lang/Object;

    check-cast p1, Ljava/lang/String;

    invoke-direct {v0, v1, v2, p1}, Lcom/usercentrics/sdk/ui/PredefinedUIResponse;-><init>(Lmqg;Ljava/util/ArrayList;Ljava/lang/String;)V

    iget-object p0, p0, Lkfm;->m:Lcom/usercentrics/sdk/c;

    invoke-static {v0}, Llah;->z(Lcom/usercentrics/sdk/ui/PredefinedUIResponse;)Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/usercentrics/sdk/c;->a(Lcom/usercentrics/sdk/UsercentricsConsentUserResponse;)V

    return-void

    :pswitch_3e
    check-cast p0, Lcom/usercentrics/sdk/ui/secondLayer/component/footer/UCSecondLayerFooter;

    sget p1, Lcom/usercentrics/sdk/ui/secondLayer/component/footer/UCSecondLayerFooter;->w:I

    invoke-virtual {p0}, Lcom/usercentrics/sdk/ui/secondLayer/component/footer/UCSecondLayerFooter;->r()Lcom/usercentrics/sdk/ui/components/UCToggle;

    move-result-object p0

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    return-void

    :pswitch_4a
    check-cast p0, Llem;

    iget-object p0, p0, Llem;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_52
    check-cast p0, Lcom/usercentrics/sdk/ui/components/UCToggle;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    return-void

    :pswitch_58
    check-cast p0, Lrzg;

    invoke-virtual {p0}, Lrzg;->dismiss()V

    return-void

    :pswitch_5e
    check-cast p0, Lk8;

    invoke-virtual {p0}, Lk8;->m0()Z

    move-result p1

    invoke-virtual {p0}, Lk8;->isEnabled()Z

    move-result v0

    xor-int/2addr v0, v9

    new-instance v1, Lqrl;

    invoke-direct {v1, p0, v0, p1, v8}, Lqrl;-><init>(Ljava/lang/Object;ZZB)V

    invoke-virtual {p0, v1}, Lk8;->r0(Lqrl;)V

    return-void

    :pswitch_72
    check-cast p0, Lapl;

    iget-object p1, p0, Lapl;->d:Lwol;

    if-eqz p1, :cond_18e

    iget-object p0, p0, Lapl;->c:Ly53;

    iget-object v0, p0, Ly53;->b:Lh73;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    packed-switch p1, :pswitch_data_426

    goto/16 :goto_18e

    :pswitch_85
    sget-object p1, Lmh0;->I:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object p1

    const-string v0, "android.intent.action.MAIN"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "android.intent.category.LAUNCHER"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->addCategory(Ljava/lang/String;)Landroid/content/Intent;

    const-string v0, "DESTINATION_VIEW_ID"

    const/16 v1, 0x28

    invoke-static {v1}, Lj7c;->f(I)B

    move-result v1

    invoke-virtual {p1, v0, v1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v0, "ACTION_DESTINATION_VIEW"

    invoke-virtual {p1, v0}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    goto/16 :goto_18e

    :pswitch_b1
    sget-object p1, Lmh0;->H:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p1, p0, Lf7d;->c:Le4i;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lo3i;->b:Lo3i;

    invoke-virtual {p1, p0, v0, v7}, Le4i;->a(Lndc;Lo3i;Ljava/lang/String;)V

    goto/16 :goto_18e

    :pswitch_c3
    sget-object p1, Lmh0;->f:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance p1, Lwrk;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    invoke-virtual {p0, p1, v8}, Lgjm;->e(Ln37;Z)V

    goto/16 :goto_18e

    :pswitch_d6
    sget-object p1, Lmh0;->G:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    sget-object p1, Ljzd;->b:Ljzd;

    invoke-static {p0, p1}, Llcp;->C(Landroid/content/Context;Ljzd;)V

    goto/16 :goto_18e

    :pswitch_e6
    sget-object p1, Lmh0;->y:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    new-instance p1, Lfge;

    iget-object v0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lf7d;->d:Lumi;

    iget-object v2, p0, Lf7d;->e:Lx5f;

    invoke-direct {p1, v0, v1, v2}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    invoke-static {p1, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    goto/16 :goto_18e

    :pswitch_103
    sget-object p1, Lmh0;->n:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p1, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    new-instance v0, Lnlh;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v1

    iget-object v2, p0, Lf7d;->e:Lx5f;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p1

    invoke-direct {v0, v1, v2, p1}, Lnlh;-><init>(Lglh;Lx5f;Lcom/opera/android/settings/SettingsManager;)V

    invoke-static {v0, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_18e

    :pswitch_12d
    sget-object p1, Lmh0;->j:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance p1, Ltca;

    invoke-direct {p1, v8}, Ltca;-><init>(I)V

    invoke-virtual {p0, p1, v8}, Lgjm;->e(Ln37;Z)V

    goto :goto_18e

    :pswitch_13f
    sget-object p1, Lmh0;->g:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    const-class p1, Lwg7;

    invoke-virtual {p0, p1}, Lf7d;->a(Ljava/lang/Class;)V

    goto :goto_18e

    :pswitch_14c
    sget-object p1, Lmh0;->e:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p0, p0, Lf7d;->b:Lgjm;

    new-instance p1, Lxl3;

    invoke-direct {p1, v7}, Lxl3;-><init>(Ljava/lang/Long;)V

    invoke-virtual {p0, p1, v8}, Lgjm;->e(Ln37;Z)V

    goto :goto_18e

    :pswitch_15e
    iget-object p1, p0, Ly53;->a:Li7d;

    invoke-virtual {p1}, Lryl;->g0()V

    sget-object p1, Lmh0;->F:Lmh0;

    invoke-virtual {p0, p1}, Ly53;->T(Lmh0;)V

    iget-object p0, v0, Lh73;->a:Lf7d;

    iget-object p1, p0, Lf7d;->a:Lcom/opera/android/BrowserActivity;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object p1

    const-wide v0, 0x7ffffffffffffffdL

    invoke-virtual {p1, v0, v1}, Lq6e;->c(J)Ll6e;

    move-result-object p1

    if-eqz p1, :cond_18e

    iget-object p0, p0, Lf7d;->k:Lpt3;

    invoke-virtual {p0, p1, v5, v8, v9}, Lpt3;->b(Leri;Ljava/lang/String;ZZ)V

    goto :goto_18e

    :pswitch_189
    iget-object p0, v0, Lh73;->a:Lf7d;

    invoke-virtual {p0}, Lf7d;->b()V

    :cond_18e
    :goto_18e
    return-void

    :pswitch_18f
    check-cast p0, Lvyk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    invoke-static {p1}, Lxih;->u(Landroidx/fragment/app/w;)V

    invoke-virtual {p1, v4, p0, p0}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    return-void

    :pswitch_19c
    check-cast p0, Lsyk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    invoke-static {p1}, Lxih;->u(Landroidx/fragment/app/w;)V

    invoke-virtual {p1, v4, p0, p0}, Landroidx/fragment/app/w;->i0(Ljava/lang/String;Lndc;Lmm9;)V

    return-void

    :pswitch_1a9
    check-cast p0, Lxrk;

    iget-object p1, p0, Lxrk;->s:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lyrk;

    iget-object v0, p1, Lyrk;->c:Lojn;

    new-instance v1, Ld7k;

    const/16 v2, 0xa

    invoke-direct {v1, p1, p0, v2}, Ld7k;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lojn;->c:Lfjn;

    iget-object p1, p0, Lfjn;->b:Lru9;

    iget-object p1, p1, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v4, "crypto.wallet.has_new_wallet"

    invoke-interface {p1, v4, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p1

    if-eqz p1, :cond_1e0

    iget-object p0, v0, Lojn;->d:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lvj2;

    new-instance p1, Lkjn;

    invoke-direct {p1, v1, v8}, Lkjn;-><init>(Ld7k;B)V

    new-instance v0, Lkjn;

    invoke-direct {v0, v1, v9}, Lkjn;-><init>(Ld7k;B)V

    invoke-virtual {p0, p1, v0}, Lvj2;->b(Lcom/opera/api/Callback;Lcom/opera/api/Callback;)V

    goto :goto_222

    :cond_1e0
    iget-object p0, p0, Lfjn;->b:Lru9;

    iget-object p0, p0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string p1, "crypto.wallet.has_wallet"

    invoke-interface {p0, p1, v8}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result p0

    if-eqz p0, :cond_21d

    new-instance p0, Lr62;

    iget-object p1, v0, Lojn;->e:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lra3;

    iget-object p1, p1, Lra3;->a:Lk32;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lsin;

    iget-object p1, p1, Lsin;->a:Lcom/opera/android/wallet/WalletDatabase_Impl;

    iget-object p1, p1, Ly5i;->f:Lpjb;

    if-eqz p1, :cond_205

    move-object v7, p1

    :cond_205
    const-string p1, "wallets"

    filled-new-array {p1}, [Ljava/lang/String;

    move-result-object p1

    new-instance v4, Lq0n;

    invoke-direct {v4, v3}, Lq0n;-><init>(B)V

    invoke-virtual {v7, p1, v9, v4}, Lpjb;->a([Ljava/lang/String;ZLkotlin/jvm/functions/Function1;)Lb6i;

    move-result-object p1

    new-instance v3, Liyk;

    invoke-direct {v3, v1, v0, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, p1, v3, v9}, Lr62;-><init>(Lekc;Lcom/opera/api/Callback;B)V

    goto :goto_222

    :cond_21d
    sget-object p0, Lljn;->c:Lljn;

    invoke-virtual {v1, p0}, Ld7k;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    :goto_222
    return-void

    :pswitch_223
    check-cast p0, Lurk;

    invoke-virtual {p0}, Lurk;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_229
    check-cast p0, Lurk;

    invoke-virtual {p0}, Lurk;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_22f
    check-cast p0, Lqrk;

    iget-object p1, p0, Lqrk;->t:Lzyk;

    invoke-virtual {p1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lrrk;

    iget-object v0, p1, Lrrk;->b:Lgjm;

    new-instance v1, Ltrk;

    invoke-direct {v1}, Ltrk;-><init>()V

    new-instance v3, Ln6k;

    invoke-direct {v3, p1, v2}, Ln6k;-><init>(Ljava/lang/Object;B)V

    new-instance p1, Lw4i;

    const/16 v2, 0x11

    invoke-direct {p1, v3, v2}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, p0, p1}, Lgjm;->c(Lr37;Lndc;Lf7f;)V

    return-void

    :pswitch_250
    check-cast p0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;

    sget v0, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->c:I

    instance-of v0, p1, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    if-eqz v0, :cond_25d

    check-cast p1, Lcom/opera/android/premium/ui/view/PremiumPricingCard;

    invoke-virtual {p0, p1}, Lcom/opera/android/premium/ui/view/SubscriptionPlanList;->e(Lcom/opera/android/premium/ui/view/PremiumPricingCard;)V

    :cond_25d
    return-void

    :pswitch_25e
    check-cast p0, Ljri;

    invoke-virtual {p0}, Ljri;->run()V

    return-void

    :pswitch_264
    check-cast p0, Lcom/opera/android/custom_views/StylingImageCheckableWithText;

    sget-object p1, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->x:[I

    invoke-virtual {p0}, Lcom/opera/android/custom_views/StylingImageCheckableWithText;->toggle()V

    return-void

    :pswitch_26c
    check-cast p0, Lo9k;

    invoke-virtual {p0}, Lo9k;->g0()Ld0n;

    move-result-object p1

    if-eqz p1, :cond_277

    invoke-virtual {p0, p1, v9}, Lo9k;->f0(Ld0n;Z)V

    :cond_277
    return-void

    :pswitch_278
    check-cast p0, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;

    sget p1, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->v:I

    invoke-virtual {p0, v9}, Lcom/opera/android/settings/speed_dial/SpeedDialShapePreview;->setSelected(Z)V

    return-void

    :pswitch_280
    check-cast p0, Ljuj;

    iget-object p1, p0, Ljuj;->s:Landroid/net/Uri;

    invoke-virtual {p1}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object p1

    sget-object v0, Laik;->a:[Ljava/lang/String;

    if-eqz p1, :cond_28d

    move-object v5, p1

    :cond_28d
    const-string p1, "snapshot_"

    const-string v0, "_"

    invoke-static {p1, v5, v0}, Lp3p;->s(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    iget-object v0, p0, Ljuj;->u:Ldx3;

    iget-object v0, v0, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->d:Lnej;

    new-instance v1, Lzfe;

    invoke-direct {v1, p0, p1, v3}, Lzfe;-><init>(Lltl;Ljava/lang/Object;B)V

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v0, v1, p0}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :pswitch_2b7
    check-cast p0, Lbsj;

    iget-object p0, p0, Lbsj;->b:Lkotlin/jvm/functions/Function0;

    invoke-interface {p0}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_2bf
    check-cast p0, Luoj;

    iget-object p0, p0, Luoj;->t:Llag;

    sget-object p1, Ls9g;->h:Ls9g;

    invoke-virtual {p1, v8}, Ls9g;->i(Z)Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_2cd
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2df

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    sget-object v2, Ls9g;->h:Ls9g;

    invoke-virtual {v2, p0, v0, v8}, Ls9g;->b(Llag;Ljava/lang/String;Z)V

    goto :goto_2cd

    :cond_2df
    invoke-virtual {p0}, Ljava/lang/Enum;->ordinal()I

    move-result p0

    if-eq p0, v1, :cond_2ec

    const/4 p1, 0x5

    if-ne p0, p1, :cond_2ef

    invoke-static {}, LJ/N;->MCsTD9Tv()V

    goto :goto_2ef

    :cond_2ec
    invoke-static {}, LJ/N;->MZtcCH9M()V

    :cond_2ef
    :goto_2ef
    return-void

    :pswitch_2f0
    check-cast p0, Le6g;

    invoke-virtual {p0}, Le6g;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_2f6
    check-cast p0, Lo9j;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p1, Lk9j;

    invoke-direct {p1, p0, v9}, Lk9j;-><init>(Lo9j;B)V

    invoke-virtual {p0, p1}, Lo9j;->f(Ln5o;)V

    return-void

    :pswitch_304
    check-cast p0, Lqt;

    iget-object p0, p0, Lqt;->d:Ljava/lang/Object;

    check-cast p0, Lf1j;

    new-instance p1, Lfge;

    iget-object v0, p0, Lf1j;->a:Lcom/opera/android/BrowserActivity;

    iget-object v1, p0, Lf1j;->b:Lumi;

    iget-object p0, p0, Lf1j;->e:Lx5f;

    invoke-direct {p1, v0, v1, p0}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    invoke-static {p1, v6}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void

    :pswitch_31d
    check-cast p0, Lyzi;

    invoke-virtual {p0}, Lyzi;->Y()Z

    move-result p1

    if-eqz p1, :cond_330

    iget-object p1, p0, Lyzi;->b:Ltzi;

    iget-object p1, p1, Ltzi;->a:Le5d;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v0

    invoke-virtual {p1, v0, v1}, Le5d;->d(J)V

    :cond_330
    return-void

    :pswitch_331
    check-cast p0, Lvxi;

    iget-object p1, p0, Lvxi;->f:Ljava/lang/Object;

    check-cast p1, Llz8;

    iget-object v0, p0, Lvxi;->e:Ljava/lang/Object;

    check-cast v0, Ljava/util/ArrayList;

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;

    invoke-virtual {v0}, Lcom/google/android/gms/fido/fido2/api/common/FidoCredentialDetails;->getCredentialId()[B

    move-result-object v0

    invoke-virtual {p1, v0}, Llz8;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p1, Lhjm;->a:Lhjm;

    iget-object p0, p0, Ldej;->b:Lmej;

    invoke-interface {p0, p1}, Lmej;->Q(Lhjm;)V

    return-void

    :pswitch_350
    check-cast p0, Ldqi;

    iget-object p0, p0, Ldqi;->s:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lgqi;

    iget-object p1, p0, Lgqi;->d:Lpqi;

    sget-object v0, Ln08;->a:Ln08;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MphJ2uhp()Z

    move-result v3

    if-eqz v3, :cond_36a

    invoke-virtual {p1, v0, v8}, Lpqi;->c(Ljava/util/Map;Z)V

    :cond_36a
    iget-object p1, p0, Lgqi;->c:Lsqi;

    sget-object v0, Ll08;->a:Ll08;

    new-instance v3, Ltji;

    invoke-direct {v3, p0, v1}, Ltji;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lzg;

    iget-object v1, p1, Lsqi;->a:Llld;

    iget-object v4, p1, Lsqi;->h:Ltvk;

    iget-object v5, p1, Lsqi;->m:Llv1;

    new-instance v6, Lf23;

    invoke-direct {v6, v3, p1, v0, v2}, Lf23;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {p0, v1, v4, v5, v6}, Lzg;-><init>(Llld;Ltvk;Llv1;Lf23;)V

    return-void

    :pswitch_384
    check-cast p0, Lgfh;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    check-cast p0, Lffh;

    iget-object p0, p0, Lffh;->a:Lhmi;

    iget-object p0, p0, Lhmi;->d:Lfmi;

    instance-of v0, p0, Lbmi;

    if-eqz v0, :cond_39c

    check-cast p0, Lbmi;

    iget-object p0, p0, Lbmi;->a:Ljava/lang/String;

    invoke-static {p1, p0, v8}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_3c9

    :cond_39c
    instance-of v0, p0, Ldmi;

    if-eqz v0, :cond_3a8

    check-cast p0, Ldmi;

    iget-object p0, p0, Ldmi;->a:Ljava/lang/String;

    invoke-static {p1, p0, v8}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_3c9

    :cond_3a8
    instance-of v0, p0, Lcmi;

    if-eqz v0, :cond_3b4

    check-cast p0, Lcmi;

    iget-object p0, p0, Lcmi;->a:Ljava/lang/String;

    invoke-static {p1, p0, v8}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_3c9

    :cond_3b4
    instance-of v0, p0, Lemi;

    if-eqz v0, :cond_3c6

    check-cast p0, Lemi;

    iget-object v0, p0, Lemi;->b:Ll1o;

    iget-object v0, v0, Ll1o;->c:Ljava/lang/String;

    if-nez v0, :cond_3c2

    iget-object v0, p0, Lemi;->a:Ljava/lang/String;

    :cond_3c2
    invoke-static {p1, v0, v8}, Llcp;->F(Landroid/content/Context;Ljava/lang/String;Z)V

    goto :goto_3c9

    :cond_3c6
    invoke-static {}, Lh9o;->p()V

    :goto_3c9
    return-void

    :pswitch_3ca
    check-cast p0, Lami;

    iget-object p0, p0, Lami;->f:Ljava/lang/Object;

    check-cast p0, Lqli;

    invoke-virtual {p0}, Lqli;->invoke()Ljava/lang/Object;

    return-void

    :pswitch_3d4
    check-cast p0, Lk4i;

    iget-boolean p1, p0, Lk4i;->w:Z

    if-nez p1, :cond_3e6

    iput-boolean v9, p0, Lk4i;->w:Z

    iget-object p0, p0, Lk4i;->r:Lua7;

    new-instance p1, Lm4i;

    invoke-direct {p1, v9}, Lm4i;-><init>(I)V

    invoke-static {p0, p1}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    :cond_3e6
    return-void

    nop

    :pswitch_data_3e8
    .packed-switch 0x0
        :pswitch_3d4
        :pswitch_3ca
        :pswitch_384
        :pswitch_350
        :pswitch_331
        :pswitch_31d
        :pswitch_304
        :pswitch_2f6
        :pswitch_2f0
        :pswitch_2bf
        :pswitch_2b7
        :pswitch_280
        :pswitch_278
        :pswitch_26c
        :pswitch_264
        :pswitch_25e
        :pswitch_250
        :pswitch_22f
        :pswitch_229
        :pswitch_223
        :pswitch_1a9
        :pswitch_19c
        :pswitch_18f
        :pswitch_72
        :pswitch_5e
        :pswitch_58
        :pswitch_52
        :pswitch_4a
        :pswitch_3e
    .end packed-switch

    :pswitch_data_426
    .packed-switch 0x0
        :pswitch_189
        :pswitch_189
        :pswitch_15e
        :pswitch_14c
        :pswitch_13f
        :pswitch_12d
        :pswitch_103
        :pswitch_e6
        :pswitch_d6
        :pswitch_c3
        :pswitch_b1
        :pswitch_85
    .end packed-switch
.end method
