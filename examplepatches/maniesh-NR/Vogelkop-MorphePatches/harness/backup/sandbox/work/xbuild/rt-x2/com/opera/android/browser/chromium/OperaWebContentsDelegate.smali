.class public final Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;
.super Lqtn;
.source "SourceFile"


# instance fields
.field public final b:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public final c:Lype;

.field public d:Ljava/lang/String;

.field public e:Z


# direct methods
.method public constructor <init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lype;Lqp2;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->c:Lype;

    iput-object p1, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    return-void
.end method


# virtual methods
.method public final activateContents()V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    invoke-interface {v0}, Lez4;->d()V

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    invoke-static {v0}, Lorg/chromium/base/ApplicationStatus;->b(Landroid/app/Activity;)I

    move-result v1

    const/4 v2, 0x5

    if-ne v1, v2, :cond_2f

    instance-of v1, v0, Lcom/opera/android/webapps/WebappActivity;

    if-eqz v1, :cond_1b

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object p0

    goto :goto_2c

    :cond_1b
    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v1

    const-string v2, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v1, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    const-string v2, "tabId"

    iget p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    invoke-virtual {v1, v2, p0}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    move-object p0, v1

    :goto_2c
    invoke-virtual {v0, p0}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    :cond_2f
    return-void
.end method

.method public final closeContents()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->e:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->e:Z

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    invoke-interface {p0}, Lez4;->close()V

    return-void
.end method

.method public final contentsZoomChange(Z)V
    .registers 16

    if-eqz p1, :cond_6

    const/high16 p1, 0x3fa00000    # 1.25f

    :goto_4
    move v5, p1

    goto :goto_a

    :cond_6
    const p1, 0x3f4ccccd    # 0.8f

    goto :goto_4

    :goto_a
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v9

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object p0

    invoke-interface {p0}, Lorg/chromium/content_public/browser/WebContents;->d1()Lorg/chromium/ui/base/EventForwarder;

    move-result-object p0

    iget-wide v6, p0, Lorg/chromium/ui/base/EventForwarder;->h:J

    const-wide/16 v12, 0x0

    cmp-long p1, v6, v12

    const/4 v11, 0x0

    if-eqz p1, :cond_26

    const/16 v8, 0xc

    invoke-static/range {v6 .. v11}, LJ/N;->MtyC4Bd2(JIJF)Z

    :cond_26
    iget-wide v0, p0, Lorg/chromium/ui/base/EventForwarder;->h:J

    cmp-long p1, v0, v12

    if-eqz p1, :cond_32

    const/16 v2, 0xd

    move-wide v3, v9

    invoke-static/range {v0 .. v5}, LJ/N;->MtyC4Bd2(JIJF)Z

    :cond_32
    iget-wide v6, p0, Lorg/chromium/ui/base/EventForwarder;->h:J

    cmp-long p0, v6, v12

    if-nez p0, :cond_39

    return-void

    :cond_39
    const/16 v8, 0xe

    invoke-static/range {v6 .. v11}, LJ/N;->MtyC4Bd2(JIJF)Z

    return-void
.end method

.method public final controlsResizeView()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->j()Z

    move-result p0

    return p0
.end method

.method public final enterFullscreenModeForTab(Lorg/chromium/content_public/browser/RenderFrameHost;ZZJ)V
    .registers 6

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p1, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p1, p1}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_8
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result p3

    if-eqz p3, :cond_18

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p3

    check-cast p3, Liz4;

    invoke-virtual {p3, p0, p2}, Liz4;->r(Lcom/opera/android/browser/chromium/ChromiumContent;Z)V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final exitFullscreenModeForTab()V
    .registers 3

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_18

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1, p0}, Liz4;->s(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final getBottomControlsHeight()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->g()I

    move-result p0

    return p0
.end method

.method public final getBottomControlsMinHeight()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->c()I

    move-result p0

    return p0
.end method

.method public final getTopControlsHeight()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->h()I

    move-result p0

    return p0
.end method

.method public final getTopControlsMinHeight()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0}, Ljz4;->a()I

    move-result p0

    return p0
.end method

.method public final getVirtualKeyboardHeight()I
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    if-eqz v0, :cond_18

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->getRootView()Landroid/view/View;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/browser/WebContentsWrapper;->b:Lqi;

    if-nez p0, :cond_1a

    :cond_18
    const/4 p0, 0x0

    return p0

    :cond_1a
    iget-object p0, p0, Lorg/chromium/ui/base/WindowAndroid;->b:Lxvb;

    check-cast p0, Lkh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lj14;->o(Landroid/view/View;)I

    move-result p0

    return p0
.end method

.method public final isFullscreenForTabOrPending()Z
    .registers 1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object p0

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    iget-object p0, p0, Leq9;->a:Ld37;

    invoke-virtual {p0}, Ld37;->p()Z

    move-result p0

    return p0
.end method

.method public final loadingStateChanged(Z)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->H:Lnp1;

    iput-boolean p1, p0, Lnp1;->c:Z

    return-void
.end method

.method public final navigationStateChanged(I)V
    .registers 9

    and-int/lit8 v0, p1, 0x2

    const/4 v1, 0x1

    iget-object v2, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_5f

    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->u()Z

    move-result v0

    const/4 v3, 0x0

    if-eqz v0, :cond_1a

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MCn_w1lD(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1a

    move v0, v1

    goto :goto_1b

    :cond_1a
    move v0, v3

    :goto_1b
    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->u()Z

    move-result v4

    if-eqz v4, :cond_2d

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v4

    invoke-static {v4}, LJ/N;->Ms95kDda(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_2d

    move v4, v1

    goto :goto_2e

    :cond_2d
    move v4, v3

    :goto_2e
    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->u()Z

    move-result v5

    if-eqz v5, :cond_40

    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v5

    invoke-static {v5}, LJ/N;->MPTM5WWo(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_40

    move v5, v1

    goto :goto_41

    :cond_40
    move v5, v3

    :goto_41
    sget v6, Lcom/opera/android/media/MediaCaptureNotificationService;->e:I

    if-eqz v5, :cond_47

    const/4 v3, 0x4

    goto :goto_52

    :cond_47
    if-eqz v0, :cond_4f

    if-eqz v4, :cond_4d

    move v3, v1

    goto :goto_52

    :cond_4d
    const/4 v3, 0x3

    goto :goto_52

    :cond_4f
    if-eqz v4, :cond_52

    const/4 v3, 0x2

    :cond_52
    :goto_52
    invoke-virtual {v2}, Lcom/opera/android/browser/WebContentsWrapper;->c()Ldx3;

    move-result-object v0

    iget v4, v2, Lcom/opera/android/browser/WebContentsWrapper;->i:I

    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object v5

    invoke-static {v0, v4, v3, v5}, Lcom/opera/android/media/MediaCaptureNotificationService;->b(Ldx3;IILjava/lang/String;)V

    :cond_5f
    iget-object v0, v2, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    and-int/lit8 v3, p1, 0x8

    if-eqz v3, :cond_79

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v3

    :goto_69
    invoke-virtual {v3}, Lg7f;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_79

    invoke-virtual {v3}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Liz4;

    invoke-virtual {v4, v2}, Liz4;->C(Lcom/opera/android/browser/chromium/ChromiumContent;)V

    goto :goto_69

    :cond_79
    and-int/2addr p1, v1

    if-eqz p1, :cond_90

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p1

    :goto_80
    invoke-virtual {p1}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_90

    invoke-virtual {p1}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_80

    :cond_90
    invoke-virtual {v2}, Lcom/opera/android/browser/chromium/ChromiumContent;->r()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_b4

    iget-object v1, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->d:Ljava/lang/String;

    invoke-virtual {p1, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_b4

    iput-object p1, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->d:Ljava/lang/String;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_a4
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_b4

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Liz4;

    invoke-virtual {p1}, Liz4;->E()V

    goto :goto_a4

    :cond_b4
    return-void
.end method

.method public final onFileSelected(Ljava/lang/String;Ljava/lang/String;J)V
    .registers 5
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result p0

    if-eqz p0, :cond_c

    invoke-static {p1, p2, p3, p4}, LJ/N;->MB_oX76V(Ljava/lang/Object;Ljava/lang/Object;J)V

    return-void

    :cond_c
    const/4 p0, 0x0

    invoke-static {p0, p0, p3, p4}, LJ/N;->MB_oX76V(Ljava/lang/Object;Ljava/lang/Object;J)V

    return-void
.end method

.method public final onWebContentsCreated(Lorg/chromium/content_public/browser/WebContents;JLjava/lang/String;Lorg/chromium/url/GURL;Lorg/chromium/content_public/browser/WebContents;)V
    .registers 7
    .param p1    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p4    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p5    # Lorg/chromium/url/GURL;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p6    # Lorg/chromium/content_public/browser/WebContents;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p2

    if-eqz p2, :cond_18

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Liz4;

    invoke-virtual {p2, p1, p6}, Liz4;->I(Lorg/chromium/content_public/browser/WebContents;Lorg/chromium/content_public/browser/WebContents;)V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final rendererResponsive()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final rendererUnresponsive()V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Liz4;

    invoke-virtual {v0}, Liz4;->B()V

    goto :goto_8

    :cond_18
    return-void
.end method

.method public final setOverlayMode(Z)V
    .registers 2

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object p0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->o:Ljz4;

    invoke-interface {p0, p1}, Ljz4;->t(Z)V

    return-void
.end method

.method public final shouldCreateWebContents(Lorg/chromium/url/GURL;)Z
    .registers 3

    const/4 v0, 0x1

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->c:Lype;

    if-eqz p0, :cond_d

    invoke-interface {p0, p1}, Lype;->a(Lorg/chromium/url/GURL;)Z

    move-result p0

    if-eqz p0, :cond_d

    move p0, v0

    goto :goto_e

    :cond_d
    const/4 p0, 0x0

    :goto_e
    xor-int/2addr p0, v0

    return p0
.end method

.method public final visibleSSLStateChanged()V
    .registers 8

    iget-object p0, p0, Lcom/opera/android/browser/chromium/OperaWebContentsDelegate;->b:Lcom/opera/android/browser/chromium/ChromiumContent;

    iget-object v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->C:Lh7f;

    invoke-static {v0, v0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v0

    :goto_8
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2e

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Liz4;

    new-instance v2, Lqwi;

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->o()Lnwi;

    move-result-object v3

    new-instance v4, Lhwi;

    iget-wide v5, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    invoke-static {v5, v6}, LJ/N;->MCHF1Vfr(J)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/opera/android/browser/SecurityInfo;

    invoke-direct {v4, v5}, Lhwi;-><init>(Lcom/opera/android/browser/SecurityInfo;)V

    invoke-direct {v2, v3, v4}, Lqwi;-><init>(Lnwi;Lhwi;)V

    invoke-virtual {v1, p0, v2}, Liz4;->H(Lcom/opera/android/browser/chromium/ChromiumContent;Lqwi;)V

    goto :goto_8

    :cond_2e
    return-void
.end method
