.class public final Lwt2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lc7d;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lwt2;->a:B

    iput-object p1, p0, Lwt2;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a(I)V
    .registers 2

    return-void
.end method

.method private final b(I)V
    .registers 2

    return-void
.end method

.method private final d(I)V
    .registers 2

    return-void
.end method

.method private final e()V
    .registers 1

    return-void
.end method


# virtual methods
.method public final c(I)V
    .registers 7

    iget-byte v0, p0, Lwt2;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object v3, p0, Lwt2;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_58

    return-void

    :pswitch_a
    check-cast v3, Lu9k;

    iget-object p0, v3, Lu9k;->a:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    instance-of v0, v0, Lr9k;

    if-eqz v0, :cond_3b

    iget-object v0, v3, Lu9k;->b:Ltn;

    const/4 v4, 0x1

    if-eqz v0, :cond_2b

    iput-object v2, v3, Lu9k;->b:Ltn;

    iput-boolean v4, v0, Ltn;->a:Z

    iget-object v0, v0, Ltn;->b:Ljava/lang/Object;

    check-cast v0, Ls03;

    sget-object v2, Lcak;->d:Lavj;

    invoke-static {v0}, Lavj;->f(Ljava/lang/Runnable;)V

    invoke-virtual {v0}, Ls03;->run()V

    :cond_2b
    new-instance v0, Lq9k;

    invoke-static {p1}, Lvep;->A(I)I

    move-result p1

    const/4 v2, 0x2

    if-ne p1, v2, :cond_35

    move v1, v4

    :cond_35
    invoke-direct {v0, v1}, Lq9k;-><init>(I)V

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    :cond_3b
    return-void

    :pswitch_3c
    const/4 p0, -0x1

    invoke-static {p0}, Ljava/lang/System;->exit(I)V

    return-void

    :pswitch_41
    check-cast v3, Lwyd;

    invoke-virtual {v3, v1}, Lwyd;->d(Z)V

    return-void

    :pswitch_47
    check-cast v3, Lcom/opera/android/FullscreenWebActivity;

    iput-object v2, v3, Lcom/opera/android/FullscreenWebActivity;->x:Lwt2;

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    :pswitch_4e
    return-void

    :pswitch_4f
    invoke-static {p0}, Le7d;->c(Lc7d;)V

    check-cast v3, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->finish()V

    return-void

    :pswitch_data_58
    .packed-switch 0x0
        :pswitch_4f
        :pswitch_4e
        :pswitch_4e
        :pswitch_47
        :pswitch_41
        :pswitch_3c
        :pswitch_a
    .end packed-switch
.end method

.method public final onSuccess()V
    .registers 18

    move-object/from16 v0, p0

    iget-byte v1, v0, Lwt2;->a:B

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object v5, v0, Lwt2;->b:Ljava/lang/Object;

    packed-switch v1, :pswitch_data_25a

    check-cast v5, Lcom/opera/android/webapps/WebappActivity;

    iget-object v0, v5, Lcom/opera/android/webapps/WebappActivity;->H:Lxi5;

    invoke-static {v5, v0}, Lfsp;->u(Landroid/app/Activity;Lxi5;)V

    const v0, 0x7f0a0ae5

    invoke-virtual {v5, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v5}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Lenf;

    invoke-direct {v1, v5}, Lenf;-><init>(Ldx3;)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    invoke-virtual {v5}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const v1, 0x7f0a01a3

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->E(I)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/BrowserFragment;

    iget-object v1, v5, Ldx3;->o:Lqim;

    iget-object v1, v1, Lqim;->f:Laal;

    iput-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->k:Laal;

    iget-object v6, v0, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iput-object v1, v6, Lxbf;->f:Ljava/lang/Object;

    iget-object v1, v5, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-boolean v1, v1, Lryn;->o:Z

    const/4 v6, 0x3

    if-eqz v1, :cond_5b

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result v1

    if-ne v1, v6, :cond_5b

    move v1, v4

    goto :goto_5c

    :cond_5b
    move v1, v3

    :goto_5c
    iget-object v7, v5, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget v8, v7, Lryn;->l:I

    const/16 v9, 0x9

    if-eqz v8, :cond_8a

    if-eq v8, v4, :cond_75

    const/4 v10, 0x2

    if-eq v8, v10, :cond_75

    if-eq v8, v6, :cond_8a

    const/4 v6, 0x4

    if-eq v8, v6, :cond_8a

    const/4 v6, 0x5

    if-eq v8, v6, :cond_8a

    if-eq v8, v9, :cond_8a

    goto/16 :goto_138

    :cond_75
    iget-object v0, v7, Lryn;->h:Ljava/lang/String;

    new-instance v2, Lxgf;

    invoke-direct {v2, v0}, Lxgf;-><init>(Ljava/lang/String;)V

    iput-boolean v1, v2, Lxgf;->o:Z

    iput-boolean v4, v2, Lxgf;->p:Z

    iput-boolean v4, v2, Lxgf;->n:Z

    invoke-static {v5, v2}, Lzi4;->u(Landroid/content/Context;Lic4;)V

    invoke-virtual {v5}, Landroid/app/Activity;->finish()V

    goto/16 :goto_138

    :cond_8a
    if-ne v8, v9, :cond_8e

    move v6, v4

    goto :goto_8f

    :cond_8e
    move v6, v3

    :goto_8f
    if-eqz v6, :cond_c9

    const v7, 0x7f0a0cdd

    invoke-virtual {v5, v7}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v7, v3}, Landroid/view/View;->setVisibility(I)V

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v9

    const v10, 0x7f040003

    const v11, 0x7f0804f2

    invoke-static {v10, v9, v11}, Lf03;->E(ILandroid/content/Context;I)I

    move-result v10

    invoke-static {v10, v9}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v10

    const v11, 0x7f040216

    const v12, 0x7f0600b1

    invoke-static {v11, v9, v12}, Lf03;->u(ILandroid/content/Context;I)Landroid/content/res/ColorStateList;

    move-result-object v9

    invoke-static {v10, v9}, Lj14;->o0(Landroid/graphics/drawable/Drawable;Landroid/content/res/ColorStateList;)V

    invoke-virtual {v7, v10}, Landroidx/appcompat/widget/Toolbar;->A(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v5, v7}, Lfp1;->setSupportActionBar(Landroidx/appcompat/widget/Toolbar;)V

    invoke-virtual {v5}, Lfp1;->getSupportActionBar()Lgc;

    move-result-object v7

    invoke-virtual {v7}, Lgc;->o()V

    :cond_c9
    invoke-virtual {v5}, Lcom/opera/android/webapps/WebappActivity;->g0()V

    sget-object v7, Luni;->a:Lorg/chromium/content/browser/ScreenOrientationProviderImpl;

    iget-object v9, v5, Ldx3;->j:Lqi;

    iget-object v10, v5, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget v10, v10, Lryn;->k:I

    int-to-byte v10, v10

    invoke-virtual {v7, v9, v10}, Lorg/chromium/content/browser/ScreenOrientationProviderImpl;->d(Lorg/chromium/ui/base/WindowAndroid;B)V

    iget-object v7, v0, Lcom/opera/android/browser/BrowserFragment;->i:Lhz4;

    invoke-virtual {v7, v1, v2}, Lhz4;->a(ZLorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/chromium/ChromiumContent;

    move-result-object v1

    iget-object v7, v5, Lcom/opera/android/webapps/WebappActivity;->y:Lryn;

    iget-object v7, v7, Lryn;->h:Ljava/lang/String;

    sget-object v9, Llqm;->a:Llqm;

    invoke-static {v7, v2, v9}, Lwqm;->f(Ljava/lang/String;Lsqh;Llqm;)Llsc;

    move-result-object v7

    if-eqz v7, :cond_ed

    invoke-virtual {v1, v7}, Lcom/opera/android/browser/chromium/ChromiumContent;->v(Llsc;)V

    :cond_ed
    iget-object v10, v0, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    invoke-static {}, Lcom/opera/android/browser/TabInfo;->b()Lcom/opera/android/browser/TabInfo;

    move-result-object v7

    iget-object v11, v10, Lxbf;->b:Ljava/lang/Object;

    check-cast v11, Lvzk;

    invoke-virtual {v11, v7, v1}, Lvzk;->t(Lcom/opera/android/browser/TabInfo;Lcom/opera/android/browser/chromium/ChromiumContent;)Luy3;

    move-result-object v11

    move-object/from16 v16, v9

    new-instance v9, Ld7l;

    iget-object v7, v10, Lxbf;->e:Ljava/lang/Object;

    move-object v12, v7

    check-cast v12, Ltw2;

    iget-object v7, v10, Lxbf;->f:Ljava/lang/Object;

    move-object v13, v7

    check-cast v13, Laal;

    iget-object v7, v10, Lxbf;->c:Ljava/lang/Object;

    move-object v14, v7

    check-cast v14, Liga;

    iget-object v7, v10, Lxbf;->d:Ljava/lang/Object;

    move-object v15, v7

    check-cast v15, Lrc6;

    invoke-direct/range {v9 .. v16}, Ld7l;-><init>(Lxbf;Luy3;Ltw2;Laal;Liga;Lrc6;Llqm;)V

    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual {v0, v2, v9, v4}, Lk6l;->f(Lb2l;Ld7l;Z)V

    new-instance v0, Lty3;

    const/16 v2, 0xa

    invoke-direct {v0, v5, v2}, Lty3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->k(Liz4;)V

    new-instance v0, Lwci;

    iget-object v2, v5, Ldx3;->o:Lqim;

    iget-object v2, v2, Lqim;->f:Laal;

    const/4 v7, 0x6

    invoke-direct {v0, v9, v2, v7}, Lwci;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    if-nez v6, :cond_134

    move v3, v8

    :cond_134
    iput v3, v1, Lcom/opera/android/browser/chromium/ChromiumContent;->D:I

    iput-object v1, v5, Lcom/opera/android/webapps/WebappActivity;->x:Lcom/opera/android/browser/chromium/ChromiumContent;

    :goto_138
    iget-object v0, v5, Lcom/opera/android/webapps/WebappActivity;->A:Lcv3;

    invoke-virtual {v5, v0}, Ldx3;->Y(Lcv3;)V

    iput-boolean v4, v5, Lcom/opera/android/webapps/WebappActivity;->E:Z

    iget-boolean v0, v5, Lcom/opera/android/webapps/WebappActivity;->F:Z

    if-eqz v0, :cond_14b

    iget-object v0, v5, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v0, v4}, Lqim;->i(Z)V

    :cond_14b
    :pswitch_14b
    return-void

    :pswitch_14c
    check-cast v5, Les9;

    invoke-static {v5}, Lorg/chromium/components/gcm_driver/GCMDriver;->a(Les9;)V

    return-void

    :pswitch_152
    check-cast v5, Lwyd;

    iget-boolean v0, v5, Lwyd;->h:Z

    if-eqz v0, :cond_15c

    invoke-virtual {v5, v3}, Lwyd;->d(Z)V

    goto :goto_166

    :cond_15c
    iget-object v0, v5, Lwyd;->c:Lglh;

    new-instance v1, Ltyd;

    invoke-direct {v1, v5, v4}, Ltyd;-><init>(Lwyd;B)V

    invoke-virtual {v0, v1}, Lglh;->f(Lcom/opera/api/Callback;)V

    :goto_166
    return-void

    :pswitch_167
    check-cast v5, Lcom/opera/android/FullscreenWebActivity;

    iput-object v2, v5, Lcom/opera/android/FullscreenWebActivity;->x:Lwt2;

    invoke-virtual {v5}, Landroid/app/Activity;->isFinishing()Z

    move-result v0

    if-nez v0, :cond_174

    invoke-virtual {v5}, Lcom/opera/android/FullscreenWebActivity;->v0()V

    :cond_174
    return-void

    :pswitch_175
    check-cast v5, Lcom/opera/android/downloads/DownloadService;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object v1

    new-instance v2, Lbl6;

    const/16 v3, 0x17

    invoke-direct {v2, v0, v3}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lag7;->a(Ljava/lang/Runnable;)V

    return-void

    :pswitch_18e
    check-cast v5, Lcom/opera/android/downloads/DownloadJobService;

    iget-object v0, v5, Lcom/opera/android/downloads/DownloadJobService;->b:Landroid/app/job/JobParameters;

    if-eqz v0, :cond_1aa

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->n()Lag7;

    move-result-object v0

    new-instance v1, Lbl6;

    const/16 v2, 0x14

    invoke-direct {v1, v5, v2}, Lbl6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lag7;->a(Ljava/lang/Runnable;)V

    :cond_1aa
    return-void

    :pswitch_1ab
    invoke-static {v0}, Le7d;->c(Lc7d;)V

    check-cast v5, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;

    sget v0, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->o:I

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_250

    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    move-result v1

    const v2, -0x39572baf

    if-eq v1, v2, :cond_225

    const v2, 0x208311c2

    if-eq v1, v2, :cond_200

    const v2, 0x4867ab72

    if-ne v1, v2, :cond_250

    const-string v1, "AutofillIntent.Action.FILL_IN_BROWSER"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_250

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    const-string v1, "AutofillIntent.EXTRA_FRAME_CHILD_ID"

    const/4 v2, -0x1

    invoke-virtual {v0, v1, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v0

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v1

    const-string v4, "AutofillIntent.EXTRA_FRAME_ROUTING_ID"

    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    if-ltz v0, :cond_1f7

    if-ltz v1, :cond_1f7

    new-instance v2, Liz9;

    invoke-direct {v2, v0, v1}, Liz9;-><init>(II)V

    iput-object v2, v5, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->n:Liz9;

    :cond_1f7
    new-instance v0, Lut2;

    invoke-direct {v0, v5, v3}, Lut2;-><init>(Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;B)V

    invoke-virtual {v5, v0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->H(Lkotlin/jvm/functions/Function0;)V

    goto :goto_258

    :cond_200
    const-string v1, "AutofillIntent.Action.EDIT"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_250

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_258

    const-string v1, "AutofillIntent.EXTRA_PASSWORD_ID"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_258

    new-instance v1, Lx2;

    const/16 v2, 0x1b

    invoke-direct {v1, v5, v0, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->H(Lkotlin/jvm/functions/Function0;)V

    goto :goto_258

    :cond_225
    const-string v1, "AutofillIntent.Action.ADD_PASSWORD"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_250

    invoke-virtual {v5}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_258

    const-string v1, "AutofillIntent.EXTRA_DOMAIN"

    const-class v2, Lj2g;

    invoke-static {v0, v1, v2}, Lj14;->T(Landroid/os/Bundle;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/os/Parcelable;

    check-cast v0, Lj2g;

    if-eqz v0, :cond_258

    new-instance v1, Lx2;

    const/16 v2, 0x1a

    invoke-direct {v1, v5, v0, v2}, Lx2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v5, v1}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->H(Lkotlin/jvm/functions/Function0;)V

    goto :goto_258

    :cond_250
    new-instance v0, Lut2;

    invoke-direct {v0, v5, v4}, Lut2;-><init>(Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;B)V

    invoke-virtual {v5, v0}, Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerActivity;->H(Lkotlin/jvm/functions/Function0;)V

    :cond_258
    :goto_258
    return-void

    nop

    :pswitch_data_25a
    .packed-switch 0x0
        :pswitch_1ab
        :pswitch_18e
        :pswitch_175
        :pswitch_167
        :pswitch_152
        :pswitch_14c
        :pswitch_14b
    .end packed-switch
.end method
