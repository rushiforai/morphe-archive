.class public Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;
.super Lg53;
.source "SourceFile"

# interfaces
.implements Lm24;


# static fields
.field public static final synthetic T:I


# instance fields
.field public final P:Lpad;

.field public Q:Lov0;

.field public R:Ls14;

.field public S:Z


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Lrz4;-><init>(I)V

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->P:Lpad;

    return-void
.end method


# virtual methods
.method public final F0()Landroid/net/Uri;
    .registers 6

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v0

    const/4 v1, 0x0

    if-nez v0, :cond_c

    return-object v1

    :cond_c
    invoke-static {}, Ldgh;->h()Landroid/net/Uri;

    move-result-object v2

    invoke-virtual {v0}, Landroid/net/Uri;->isAbsolute()Z

    move-result v3

    if-nez v3, :cond_3b

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v3

    const-string v4, "/"

    invoke-virtual {v3, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_33

    invoke-virtual {v2}, Landroid/net/Uri;->buildUpon()Landroid/net/Uri$Builder;

    move-result-object v3

    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v3, v0}, Landroid/net/Uri$Builder;->encodedPath(Ljava/lang/String;)Landroid/net/Uri$Builder;

    move-result-object v0

    invoke-virtual {v0}, Landroid/net/Uri$Builder;->build()Landroid/net/Uri;

    move-result-object v0

    goto :goto_3b

    :cond_33
    invoke-virtual {v0}, Landroid/net/Uri;->getEncodedPath()Ljava/lang/String;

    move-result-object v0

    invoke-static {v2, v0}, Landroid/net/Uri;->withAppendedPath(Landroid/net/Uri;Ljava/lang/String;)Landroid/net/Uri;

    move-result-object v0

    :cond_3b
    :goto_3b
    invoke-virtual {v0}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    invoke-static {v3, v4}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_58

    invoke-virtual {v0}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v2

    invoke-static {v3, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_58

    return-object v0

    :cond_58
    invoke-virtual {p0}, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->M0()V

    return-object v1
.end method

.method public final G0()Ljava/lang/String;
    .registers 2

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    const v0, 0x7f1406a5

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final H0()Landroid/view/View;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->Q:Lov0;

    iget-object p0, p0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    return-object p0
.end method

.method public final I0()V
    .registers 1

    invoke-virtual {p0}, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->M0()V

    return-void
.end method

.method public final J0()V
    .registers 1

    return-void
.end method

.method public final K0()V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->S:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->S:Z

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v1

    new-instance v2, Lzzh;

    const/16 v3, 0x1d

    invoke-direct {v2, p0, v3}, Lzzh;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2, v0}, Lbf9;->y(Lcom/opera/api/Callback;Z)Lih4;

    return-void
.end method

.method public final L0(Landroid/view/View;)V
    .registers 2

    return-void
.end method

.method public final M0()V
    .registers 3

    iget-object v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->R:Ls14;

    if-eqz v0, :cond_16

    iget-object v0, v0, Ls14;->d:Ljava/lang/Object;

    check-cast v0, Lmgh;

    iget-object v1, v0, Lmgh;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/api/Callback;

    if-eqz v1, :cond_13

    const-string v1, "2fa error"

    invoke-virtual {v0, v1}, Lmgh;->e(Ljava/lang/Object;)V

    :cond_13
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->R:Ls14;

    :cond_16
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->P:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->P:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    return-object p0

    :cond_9
    invoke-super {p0, p1}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final interfaceCall(Ljava/lang/String;Lcom/opera/api/Callback;)V
    .registers 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p2    # Lcom/opera/api/Callback;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Lcom/opera/api/Callback;",
            ")V"
        }
    .end annotation

    if-nez p1, :cond_6

    invoke-virtual {p0}, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->M0()V

    return-void

    :cond_6
    iget-object v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->R:Ls14;

    if-nez v0, :cond_e

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_e
    :try_start_e
    new-instance v0, Lorb;

    invoke-direct {v0, p1}, Lorb;-><init>(Ljava/lang/String;)V

    iget-object p1, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->R:Ls14;

    new-instance v1, Liyk;

    const/4 v2, 0x3

    invoke-direct {v1, p0, p2, v2}, Liyk;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p2, p1, Ls14;->d:Ljava/lang/Object;

    check-cast p2, Lmgh;

    iget-object p2, p2, Lmgh;->c:Ljava/lang/Object;

    check-cast p2, Lcom/opera/api/Callback;

    const/4 v2, 0x0

    if-nez p2, :cond_2a

    invoke-virtual {v1, v2}, Liyk;->run(Ljava/lang/Object;)V

    return-void

    :cond_2a
    iget-boolean p2, p1, Ls14;->b:Z

    if-eqz p2, :cond_3a

    iget-object p2, p1, Ls14;->e:Ljava/lang/Object;

    check-cast p2, Liyk;

    if-nez p2, :cond_3a

    iput-object v1, p1, Ls14;->e:Ljava/lang/Object;

    invoke-virtual {p1, v0}, Ls14;->s(Lorb;)V

    return-void

    :cond_3a
    invoke-virtual {v1, v2}, Liyk;->run(Ljava/lang/Object;)V
    :try_end_3d
    .catch Lorg/json/JSONException; {:try_start_e .. :try_end_3d} :catch_3e

    return-void

    :catch_3e
    invoke-virtual {p0}, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->M0()V

    return-void
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d030a

    return p0
.end method

.method public final t0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;
    .registers 3

    invoke-static {p0, p2}, LJ/N;->ML2Ly2B9(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-super {p0, p1, p2}, Lcom/opera/android/FullscreenWebActivity;->t0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;

    move-result-object p0

    return-object p0
.end method

.method public final u0(Landroid/view/View;)V
    .registers 7

    move-object v0, p1

    check-cast v0, Lcom/opera/android/custom_views/FitWindowsFrameLayoutWithToolbar;

    const v1, 0x7f0a0129

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Landroid/widget/FrameLayout;

    if-eqz v2, :cond_4d

    const v1, 0x7f0a04f5

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    if-eqz v2, :cond_4d

    const v1, 0x7f0a0bba

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v2, :cond_4d

    const v1, 0x7f0a0bbb

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/FrameLayout;

    if-eqz v3, :cond_4d

    const v1, 0x7f0a0bbe

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_4d

    const v1, 0x7f0a0cda

    invoke-static {v1, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_4d

    new-instance p1, Lov0;

    const/16 v1, 0x1c

    invoke-direct {p1, v0, v2, v3, v1}, Lov0;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object p1, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->Q:Lov0;

    return-void

    :cond_4d
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

.method public final v0()V
    .registers 2

    sget-object v0, Lf8m;->e:Ls14;

    iput-object v0, p0, Lcom/opera/android/account/auth/TwoFactorAuthenticationActivity;->R:Ls14;

    if-nez v0, :cond_a

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    return-void

    :cond_a
    invoke-super {p0}, Lg53;->v0()V

    return-void
.end method
