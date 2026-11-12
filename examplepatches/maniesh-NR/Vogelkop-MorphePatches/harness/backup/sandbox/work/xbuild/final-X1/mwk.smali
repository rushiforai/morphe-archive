.class public Lmwk;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .registers 1

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 10

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string p3, "base-account-onboarding-fragment"

    invoke-virtual {p1, p3}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz v0, :cond_13

    move v0, v2

    goto :goto_14

    :cond_13
    move v0, v1

    :goto_14
    if-eqz v0, :cond_1a

    invoke-virtual {p1, v2, p3}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    goto :goto_33

    :cond_1a
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result p3

    if-nez p3, :cond_33

    iget-boolean p3, p1, Landroidx/fragment/app/w;->L:Z

    if-nez p3, :cond_33

    new-instance p3, Landroidx/fragment/app/a;

    invoke-direct {p3, p1}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {p3, p0}, Landroidx/fragment/app/a;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    invoke-virtual {p3, v2, v2}, Landroidx/fragment/app/a;->i(ZZ)I

    :cond_33
    :goto_33
    const-string p1, "SyncAuthPortalFragment_request"

    const-string p3, "result_code"

    const/4 v0, -0x1

    if-ne p2, v0, :cond_92

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p2

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p2

    check-cast p2, Lcom/opera/android/OperaApplication;

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v3

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v4

    invoke-virtual {p2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object p2

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v5, Lcak;->d:Lavj;

    invoke-static {v2}, Lavj;->b(I)Z

    move-result v5

    if-eqz v5, :cond_61

    invoke-static {}, LJ/N;->MhJnoDjg()I

    move-result v1

    :cond_61
    const/4 v5, 0x2

    if-ne v1, v5, :cond_68

    invoke-static {v3, v4, p2}, Lxih;->q(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V

    goto :goto_70

    :cond_68
    new-instance v1, Lnyk;

    invoke-direct {v1, v3, v4, p2}, Lnyk;-><init>(Ldb;Lzwk;Lcom/opera/android/settings/SettingsManager;)V

    invoke-virtual {v4, v1}, Lzwk;->a(Lywk;)V

    :goto_70
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p2

    if-eqz p2, :cond_7c

    const-string v1, "SHOW_EDIT_PROFILE_ON_SUCCESS"

    invoke-virtual {p2, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v2

    :cond_7c
    if-eqz v2, :cond_86

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p2

    const/4 v1, 0x0

    invoke-static {p2, v3, v1, v1}, Lxih;->v(Landroidx/fragment/app/w;Ldb;Ljava/lang/String;Lmni;)V

    :cond_86
    new-instance p2, Landroid/os/Bundle;

    invoke-direct {p2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {p2, p3, v0}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {p2, p0, p1}, Lvtp;->V(Landroid/os/Bundle;Landroidx/fragment/app/Fragment;Ljava/lang/String;)V

    return-void

    :cond_92
    new-instance v0, Landroid/os/Bundle;

    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v0, p3, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-static {v0, p0, p1}, Lvtp;->V(Landroid/os/Bundle;Landroidx/fragment/app/Fragment;Ljava/lang/String;)V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/account/auth/OperaAuthPortalActivity;

    const/4 v2, 0x0

    sget-object v5, Llqm;->d:Llqm;

    invoke-static/range {v0 .. v5}, Lcom/opera/android/FullscreenWebActivity;->e0(Landroid/content/Context;Ljava/lang/Class;Ljava/lang/String;Lpxh;ZLlqm;)Landroid/content/Intent;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const v1, 0x7f010049

    const/4 v2, 0x0

    invoke-static {v0, v1, v2}, Landroid/app/ActivityOptions;->makeCustomAnimation(Landroid/content/Context;II)Landroid/app/ActivityOptions;

    move-result-object v0

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_2f

    new-instance v2, Landroid/os/Bundle;

    invoke-direct {v2}, Landroid/os/Bundle;-><init>()V

    invoke-virtual {v2, v1}, Landroid/os/Bundle;->putAll(Landroid/os/Bundle;)V

    invoke-virtual {p1, v2}, Landroid/content/Intent;->putExtras(Landroid/os/Bundle;)Landroid/content/Intent;

    :cond_2f
    const v1, 0xfffe

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method
