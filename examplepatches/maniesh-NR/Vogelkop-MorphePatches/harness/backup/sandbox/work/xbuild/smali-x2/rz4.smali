.class public abstract Lrz4;
.super Lcom/opera/android/FullscreenWebActivity;
.source "SourceFile"


# instance fields
.field public final J:B

.field public final K:Lqz4;

.field public final L:Lu59;

.field public final M:Lpz4;

.field public N:Lcom/opera/android/browser/chromium/ChromiumContent;


# direct methods
.method public constructor <init>(I)V
    .registers 3

    invoke-direct {p0}, Lcom/opera/android/FullscreenWebActivity;-><init>()V

    iput-byte p1, p0, Lrz4;->J:B

    new-instance p1, Lqz4;

    const/4 v0, 0x0

    invoke-direct {p1, p0, v0}, Lqz4;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lrz4;->K:Lqz4;

    new-instance p1, Lu59;

    const/16 v0, 0x19

    invoke-direct {p1, p0, v0}, Lu59;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lrz4;->L:Lu59;

    new-instance p1, Lpz4;

    invoke-direct {p1, p0}, Lpz4;-><init>(Lrz4;)V

    iput-object p1, p0, Lrz4;->M:Lpz4;

    return-void
.end method


# virtual methods
.method public B0()Lcom/opera/android/browser/dialog/DialogDelegate;
    .registers 2

    new-instance p0, Loz4;

    const/4 v0, 0x0

    invoke-direct {p0, v0}, Loz4;-><init>(B)V

    return-object p0
.end method

.method public C0(Lcom/opera/android/browser/chromium/ChromiumContent;)Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
    .registers 2

    iget-object p0, p0, Lrz4;->M:Lpz4;

    return-object p0
.end method

.method public D0(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 2

    sget-object p0, Lcom/opera/android/account/AuthExtension;->a:Li7f;

    invoke-static {p1}, LJ/N;->MjTR_eId(Ljava/lang/Object;)V

    return-void
.end method

.method public E0(Lorg/chromium/content_public/browser/NavigationHandle;Lorg/chromium/url/GURL;ZZ)Z
    .registers 5

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p3

    invoke-static {p3}, Lwqm;->v(Ljava/lang/String;)Z

    move-result p3

    if-eqz p3, :cond_2a

    iget-boolean p1, p1, Lorg/chromium/content_public/browser/NavigationHandle;->a:Z

    const/4 p3, 0x1

    if-eqz p1, :cond_29

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    sget-object p2, Llk6;->a:Llk6;

    sget-object p2, Lik6;->b:Lik6;

    sget-object p4, Llqm;->d:Llqm;

    invoke-static {p3, p2, p4, p0, p1}, Llk6;->f(ILik6;Llqm;Landroid/content/Context;Landroid/net/Uri;)Z

    move-result p2

    if-eqz p2, :cond_29

    invoke-static {p1, p4, p3, p0}, Llk6;->a(Landroid/net/Uri;Llqm;ILandroid/content/Context;)Z

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    :cond_29
    return p3

    :cond_2a
    const/4 p0, 0x0

    return p0
.end method

.method public final f0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;
    .registers 14

    new-instance v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v5, 0x0

    iget-byte v6, p0, Lrz4;->J:B

    iget-object v1, p0, Lrz4;->L:Lu59;

    const/4 v4, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/browser/chromium/ChromiumContent;-><init>(Ljz4;Lqi;Lorg/chromium/content_public/browser/WebContents;ZZI)V

    invoke-virtual {p0, v3}, Lrz4;->D0(Lorg/chromium/content_public/browser/WebContents;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    new-instance v1, Lqy4;

    new-instance v2, Lvk2;

    const/4 p2, 0x7

    invoke-direct {v2, p2}, Lvk2;-><init>(B)V

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p2

    iget-object v4, p2, Ld6j;->c:Lx5f;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v5

    move-object v3, v0

    move-object v0, v1

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lqy4;-><init>(ILcom/opera/api/Callback;Lcom/opera/android/browser/chromium/ChromiumContent;Lx5f;Lru9;)V

    move-object v1, v0

    move-object v0, v3

    new-instance v2, Lrbe;

    const/16 p2, 0x19

    invoke-direct {v2, p2}, Lrbe;-><init>(B)V

    new-instance v9, Lqii;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lqp2;

    const/16 v4, 0x14

    invoke-direct {v3, v4}, Lqp2;-><init>(B)V

    invoke-virtual {p0, v0}, Lrz4;->C0(Lcom/opera/android/browser/chromium/ChromiumContent;)Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;

    move-result-object v4

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v6, v5, Ld6j;->c:Lx5f;

    invoke-virtual {p0}, Ldx3;->O()Leej;

    move-result-object v7

    const/4 v8, 0x0

    move-object v10, v9

    const/4 v9, 0x0

    iget-object v5, p0, Lrz4;->K:Lqz4;

    invoke-virtual/range {v0 .. v10}, Lcom/opera/android/browser/chromium/ChromiumContent;->t(Lqy4;Lg1j;Lqp2;Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;Lype;Lx5f;Leej;Lpt3;Ld7h;Ljv0;)V

    invoke-virtual {p0}, Lrz4;->B0()Lcom/opera/android/browser/dialog/DialogDelegate;

    move-result-object v1

    iput-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object v4

    move-object v6, v2

    new-instance v2, Lue;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lyw3;

    invoke-direct {v5, p0}, Lyw3;-><init>(Ldx3;)V

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v7

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object v8, p1, Ld6j;->c:Lx5f;

    move-object v9, v10

    sget-object v10, Lte;->Bo:Lqii;

    move-object v3, p0

    invoke-direct/range {v2 .. v10}, Lue;-><init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V

    iput-object v2, v4, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->f:Lve;

    new-instance p0, Lpjn;

    invoke-direct {p0, v3, p2}, Lpjn;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    return-object v0
.end method

.method public final g0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 2

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->l()V

    return-void
.end method

.method public onPause()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/r;->onPause()V

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqim;->p:Z

    iget-object p0, p0, Lqim;->b:Lll9;

    iget v1, p0, Lll9;->h:I

    add-int/2addr v1, v0

    iput v1, p0, Lll9;->h:I

    return-void
.end method

.method public onResume()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lqim;->i(Z)V

    return-void
.end method

.method public x0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 4

    iget-object v0, p0, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->z(Z)V

    :cond_8
    invoke-super {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    instance-of v0, p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_17

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p1, p0, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->z(Z)V

    :cond_17
    return-void
.end method
