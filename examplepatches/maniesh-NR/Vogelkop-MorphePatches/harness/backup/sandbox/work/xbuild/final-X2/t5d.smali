.class public abstract Lt5d;
.super Ldx3;
.source "SourceFile"

# interfaces
.implements Lm24;


# instance fields
.field public final u:Lpad;

.field public final v:Lb7f;

.field public w:Lgwi;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Ldx3;-><init>()V

    new-instance v0, Lpad;

    const/4 v1, 0x7

    invoke-direct {v0, v1}, Lpad;-><init>(B)V

    iput-object v0, p0, Lt5d;->u:Lpad;

    new-instance v0, Ldtl;

    invoke-direct {v0}, Ldtl;-><init>()V

    invoke-static {v0}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object v0

    iput-object v0, p0, Lt5d;->v:Lb7f;

    return-void
.end method


# virtual methods
.method public final a(Ll24;)V
    .registers 2

    iget-object p0, p0, Lt5d;->u:Lpad;

    invoke-virtual {p0, p1}, Lpad;->t(Ll24;)V

    return-void
.end method

.method public final c(Ll24;)V
    .registers 2

    iget-object p0, p0, Lt5d;->u:Lpad;

    invoke-virtual {p0, p1}, Lpad;->A(Ll24;)V

    return-void
.end method

.method public d0()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public dispatchKeyEvent(Landroid/view/KeyEvent;)Z
    .registers 4

    invoke-static {}, Lc37;->r()Lc37;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1, p1}, Lc37;->l(ILandroid/view/KeyEvent;)Z

    move-result v0

    if-eqz v0, :cond_d

    const/4 p0, 0x1

    return p0

    :cond_d
    invoke-super {p0, p1}, Lfp1;->dispatchKeyEvent(Landroid/view/KeyEvent;)Z

    move-result p0

    return p0
.end method

.method public e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;
    .registers 2

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object p0

    invoke-virtual {p0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object p0

    const v0, 0x7f0a0218

    invoke-static {v0, p0}, Lq9n;->y(ILandroid/view/View;)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContainerView;

    return-object p0
.end method

.method public final getSystemService(Ljava/lang/String;)Ljava/lang/Object;
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v0, "com.opera.android.ui.SECURE_WINDOW_SERVICE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_18

    const-string v0, "com.opera.android.BPR_SERVICE"

    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_17

    invoke-super {p0, p1}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    :cond_17
    return-object p0

    :cond_18
    iget-object p0, p0, Lt5d;->w:Lgwi;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object p0
.end method

.method public onCreate(Landroid/os/Bundle;)V
    .registers 4

    invoke-super {p0, p1}, Ldx3;->onCreate(Landroid/os/Bundle;)V

    invoke-static {p0}, Lsfe;->g0(Landroid/content/Context;)Z

    move-result p1

    if-eqz p1, :cond_a

    return-void

    :cond_a
    new-instance p1, Lgwi;

    invoke-virtual {p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-direct {p1, v0}, Lgwi;-><init>(Landroid/view/Window;)V

    iput-object p1, p0, Lt5d;->w:Lgwi;

    new-instance p1, Lju2;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->d:Lx5f;

    invoke-direct {p1, p0, v0}, Lju2;-><init>(Lt5d;Lx5f;)V

    invoke-virtual {p0}, Lxd5;->getOnBackPressedDispatcher()Lkcf;

    move-result-object p1

    new-instance v0, Lxt2;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lxt2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v0}, Lkcf;->a(Lndc;Lgcf;)V

    return-void
.end method

.method public onSaveInstanceState(Landroid/os/Bundle;)V
    .registers 3

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object p0

    check-cast p0, Lqdc;

    sget-object p1, Lqcc;->c:Lqcc;

    const-string v0, "markState"

    invoke-virtual {p0, v0}, Lqdc;->d(Ljava/lang/String;)V

    invoke-virtual {p0, p1}, Lqdc;->g(Lqcc;)V

    return-void
.end method
