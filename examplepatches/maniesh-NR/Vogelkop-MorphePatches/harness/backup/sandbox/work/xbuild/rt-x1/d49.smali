.class public final Ld49;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field public final a:Ldb;

.field public final b:Lfv2;


# direct methods
.method public constructor <init>(Ldb;Lfv2;)V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    iput-object p1, p0, Ld49;->a:Ldb;

    iput-object p2, p0, Ld49;->b:Lfv2;

    return-void
.end method


# virtual methods
.method public final onActivityResult(IILandroid/content/Intent;)V
    .registers 6

    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onActivityResult(IILandroid/content/Intent;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    const-string p3, "base-account-onboarding-fragment"

    invoke-virtual {p1, p3}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    const/4 v1, 0x1

    if-eqz v0, :cond_12

    move v0, v1

    goto :goto_13

    :cond_12
    const/4 v0, 0x0

    :goto_13
    if-eqz v0, :cond_19

    invoke-virtual {p1, v1, p3}, Landroidx/fragment/app/w;->V(ILjava/lang/String;)V

    goto :goto_32

    :cond_19
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result p3

    if-nez p3, :cond_32

    iget-boolean p3, p1, Landroidx/fragment/app/w;->L:Z

    if-nez p3, :cond_32

    new-instance p3, Landroidx/fragment/app/a;

    invoke-direct {p3, p1}, Landroidx/fragment/app/a;-><init>(Landroidx/fragment/app/w;)V

    invoke-virtual {p3, p0}, Landroidx/fragment/app/a;->m(Landroidx/fragment/app/Fragment;)Landroidx/fragment/app/a;

    invoke-virtual {p3, v1, v1}, Landroidx/fragment/app/a;->i(ZZ)I

    :cond_32
    :goto_32
    iget-object p1, p0, Ld49;->b:Lfv2;

    if-eqz p1, :cond_39

    invoke-virtual {p1}, Lfv2;->run()V

    :cond_39
    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    const-string p3, "result_code"

    invoke-virtual {p1, p3, p2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    const-string p3, "FinishAccountSetupAuthPortalFragment_request"

    invoke-static {p1, p0, p3}, Lvtp;->V(Landroid/os/Bundle;Landroidx/fragment/app/Fragment;Ljava/lang/String;)V

    const/4 p1, -0x1

    if-ne p2, p1, :cond_63

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getArguments()Landroid/os/Bundle;

    move-result-object p1

    if-eqz p1, :cond_57

    const-string p2, "SHOW_EDIT_PROFILE_ON_SUCCESS"

    invoke-virtual {p1, p2, v1}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    :cond_57
    if-eqz v1, :cond_63

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object p0, p0, Ld49;->a:Ldb;

    const/4 p2, 0x0

    invoke-static {p1, p0, p2, p2}, Lxih;->v(Landroidx/fragment/app/w;Ldb;Ljava/lang/String;Lmni;)V

    :cond_63
    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    const/4 v3, 0x0

    const/4 v4, 0x1

    const-class v1, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;

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
    const v1, 0xbeef

    invoke-virtual {v0}, Landroid/app/ActivityOptions;->toBundle()Landroid/os/Bundle;

    move-result-object v0

    invoke-virtual {p0, p1, v1, v0}, Landroidx/fragment/app/Fragment;->startActivityForResult(Landroid/content/Intent;ILandroid/os/Bundle;)V

    return-void
.end method
