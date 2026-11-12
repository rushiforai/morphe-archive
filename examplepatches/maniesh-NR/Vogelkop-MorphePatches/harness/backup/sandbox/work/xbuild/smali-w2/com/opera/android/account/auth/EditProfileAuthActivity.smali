.class public Lcom/opera/android/account/auth/EditProfileAuthActivity;
.super Lg53;
.source "SourceFile"


# static fields
.field public static final synthetic V:I


# instance fields
.field public P:Lov0;

.field public Q:Z

.field public R:Z

.field public S:Z

.field public T:Z

.field public U:Z


# direct methods
.method public constructor <init>()V
    .registers 2

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lrz4;-><init>(I)V

    return-void
.end method


# virtual methods
.method public F0()Landroid/net/Uri;
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->R:Z

    if-eqz v0, :cond_33

    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    const/4 v1, 0x2

    invoke-static {v1}, Lvep;->h(I)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/net/Uri$Builder;->appendEncodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    const-string v1, "ARGUMENT_HIGHLIGHT_SECTION"

    invoke-virtual {p0, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_32

    invoke-virtual {v0}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0, p0}, Landroid/net/Uri$Builder;->fragment(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object p0

    invoke-virtual {p0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object p0

    return-object p0

    :cond_32
    return-object v0

    :cond_33
    const/4 p0, 0x0

    return-object p0
.end method

.method public final G0()Ljava/lang/String;
    .registers 1

    const-string p0, ""

    return-object p0
.end method

.method public final H0()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lov0;

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    return-object p0
.end method

.method public final I0()V
    .registers 3

    new-instance v0, Lbn7;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lbn7;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    return-void
.end method

.method public final J0()V
    .registers 6

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->R:Z

    if-eqz v0, :cond_2c

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v0

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v1

    new-instance v2, Lrl;

    const/16 v3, 0x10

    invoke-direct {v2, v3}, Lrl;-><init>(B)V

    new-instance v3, Lsu;

    const/16 v4, 0x16

    invoke-direct {v3, p0, v0, v1, v4}, Lsu;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    const/4 p0, 0x1

    invoke-virtual {v0, p0, v2, v3}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    :cond_2c
    return-void
.end method

.method public final K0()V
    .registers 4

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->S:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->S:Z

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v1

    new-instance v2, Lbw7;

    invoke-direct {v2, p0, v0}, Lbw7;-><init>(Lcom/opera/android/account/auth/EditProfileAuthActivity;B)V

    invoke-virtual {v1, v2, v0}, Lbf9;->y(Lcom/opera/api/Callback;Z)Lih4;

    return-void
.end method

.method public final L0(Landroid/view/View;)V
    .registers 4

    invoke-virtual {p0}, Lhjf;->z()Z

    move-result v0

    iget-object v1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    if-eqz v0, :cond_17

    iget-object v0, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const v1, 0x7f0806dd

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    goto :goto_25

    :cond_17
    iget-object v0, v1, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const v1, 0x7f0806de

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    :goto_25
    iget-object p0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lov0;

    iget-object p0, p0, Lov0;->b:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const v0, 0x7f04007e

    const v1, 0x7f061084

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    return-void
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d006a

    return p0
.end method

.method public final onDestroy()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->U:Z

    invoke-super {p0}, Lg53;->onDestroy()V

    return-void
.end method

.method public final onStop()V
    .registers 2

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onStop()V

    const/4 v0, 0x0

    iput-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->Q:Z

    return-void
.end method

.method public final p0()V
    .registers 3

    iget-boolean v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->T:Z

    const/4 v1, 0x1

    if-nez v0, :cond_a

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    iput-boolean v1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->T:Z

    :cond_a
    iput-boolean v1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->Q:Z

    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .registers 9

    move-object v0, p1

    check-cast v0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    const v1, 0x7f0a04f5

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    const-string v3, "Missing required view with ID: "

    if-eqz v2, :cond_71

    const v1, 0x7f0a0bba

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    if-eqz v2, :cond_71

    const v1, 0x7f0a07be

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v4, :cond_61

    const v1, 0x7f0a0a66

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/google/android/material/button/MaterialButton;

    if-eqz v5, :cond_61

    new-instance v1, Lov0;

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    const/4 v6, 0x3

    invoke-direct {v1, v2, v4, v5, v6}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    const v2, 0x7f0a0bbb

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_5f

    const v2, 0x7f0a0bbe

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    if-eqz v4, :cond_5f

    const v2, 0x7f0a0cda

    invoke-static {v2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/LinearLayout;

    if-eqz v5, :cond_5f

    new-instance p1, Lov0;

    const/4 v2, 0x1

    invoke-direct {p1, v0, v1, v4, v2}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    return-void

    :cond_5f
    move v1, v2

    goto :goto_71

    :cond_61
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_71
    :goto_71
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v1}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v3, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final v0()V
    .registers 4

    invoke-super {p0}, Lg53;->v0()V

    iget-object v0, p0, Lcom/opera/android/account/auth/EditProfileAuthActivity;->P:Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    new-instance v1, Lyk4;

    const/16 v2, 0x10

    invoke-direct {v1, p0, v2}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v0

    new-instance v1, Lbw7;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lbw7;-><init>(Lcom/opera/android/account/auth/EditProfileAuthActivity;B)V

    invoke-virtual {v0, v1, v2}, Lbf9;->y(Lcom/opera/api/Callback;Z)Lih4;

    return-void
.end method
