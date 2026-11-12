.class public Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;
.super Lyij;
.source "SourceFile"


# static fields
.field public static final synthetic W:I


# instance fields
.field public final S:Lnj2;

.field public T:Lov0;

.field public U:Z

.field public V:Landroid/os/CancellationSignal;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lyij;-><init>()V

    new-instance v0, Lnj2;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lnj2;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->S:Lnj2;

    return-void
.end method


# virtual methods
.method public final H0()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->T:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/Toolbar;

    return-object p0
.end method

.method public final K0()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->V:Landroid/os/CancellationSignal;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    new-instance v1, Lbn7;

    const/16 v2, 0x19

    invoke-direct {v1, p0, v2}, Lbn7;-><init>(Ljava/lang/Object;B)V

    sget-object v2, Lzpa;->c:Lvk2;

    const/4 v3, 0x1

    invoke-virtual {v0, v3, v1, v2}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->V:Landroid/os/CancellationSignal;

    return-void
.end method

.method public final N0()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->U:Z

    if-nez v0, :cond_22

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    invoke-virtual {v0}, Ldb;->d()Z

    move-result v0

    if-nez v0, :cond_22

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    invoke-virtual {v0}, Ldb;->e()Z

    move-result v0

    if-nez v0, :cond_22

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->U:Z

    const/4 v0, -0x1

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setResult(I)V

    invoke-virtual {p0}, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->finish()V

    :cond_22
    return-void
.end method

.method public final finish()V
    .registers 3

    invoke-super {p0}, Landroid/app/Activity;->finish()V

    const/4 v0, 0x0

    const v1, 0x7f010048

    invoke-virtual {p0, v0, v1}, Landroid/app/Activity;->overridePendingTransition(II)V

    return-void
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d006b

    return p0
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lyij;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->V:Landroid/os/CancellationSignal;

    const/4 v1, 0x0

    if-eqz v0, :cond_d

    invoke-virtual {v0}, Landroid/os/CancellationSignal;->cancel()V

    iput-object v1, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->V:Landroid/os/CancellationSignal;

    :cond_d
    iput-object v1, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->T:Lov0;

    return-void
.end method

.method public final onPause()V
    .registers 2

    invoke-super {p0}, Lrz4;->onPause()V

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->S:Lnj2;

    invoke-virtual {v0, p0}, Ldb;->h(Lcb;)V

    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Lrz4;->onResume()V

    invoke-virtual {p0}, Lyij;->M0()Ldb;

    move-result-object v0

    iget-object v1, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->S:Lnj2;

    invoke-virtual {v0, v1}, Ldb;->a(Lcb;)V

    invoke-virtual {p0}, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->N0()V

    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .registers 7

    move-object v0, p1

    check-cast v0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    const v1, 0x7f0a04f5

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    if-eqz v2, :cond_41

    const v1, 0x7f0a0bba

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    if-eqz v2, :cond_41

    const v1, 0x7f0a0bbb

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_41

    const v1, 0x7f0a0bbe

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_41

    const v1, 0x7f0a0cda

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_41

    new-instance p1, Lov0;

    const/4 v1, 0x2

    invoke-direct {p1, v0, v2, v3, v1}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/account/auth/FinishAccountSetupAuthActivity;->T:Lov0;

    return-void

    :cond_41
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
