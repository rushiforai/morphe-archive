.class public final Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:J

.field public b:Lk73;

.field public final c:Lorg/chromium/content_public/browser/WebContents;


# direct methods
.method public constructor <init>(JLorg/chromium/content_public/browser/WebContents;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-wide p1, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a:J

    iput-object p3, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->c:Lorg/chromium/content_public/browser/WebContents;

    return-void
.end method

.method public static create(JLorg/chromium/content_public/browser/WebContents;)Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;
    .registers 4

    new-instance v0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;

    invoke-direct {v0, p0, p1, p2}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;-><init>(JLorg/chromium/content_public/browser/WebContents;)V

    return-object v0
.end method


# virtual methods
.method public final a()V
    .registers 3

    iget-object v0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    if-nez v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x0

    iput-object v0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    iget-wide v0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a:J

    invoke-static {v0, v1}, LJ/N;->MsJMWxq0(J)V

    return-void
.end method

.method public final closeDialog()V
    .registers 4

    iget-object v0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v1, v0, Lk73;->f:Ljava/lang/Object;

    check-cast v1, Landroidx/fragment/app/i;

    const/4 v2, 0x0

    if-eqz v1, :cond_11

    invoke-virtual {v1}, Landroidx/fragment/app/i;->dismiss()V

    iput-object v2, v0, Lk73;->f:Ljava/lang/Object;

    :cond_11
    iput-object v2, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    return-void
.end method

.method public final isShowingDialog()Z
    .registers 1

    iget-object p0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    if-eqz p0, :cond_12

    iget-object p0, p0, Lk73;->f:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/i;

    if-eqz p0, :cond_12

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isVisible()Z

    move-result p0

    if-eqz p0, :cond_12

    const/4 p0, 0x1

    return p0

    :cond_12
    const/4 p0, 0x0

    return p0
.end method

.method public final openRouteChooserDialog([Ljava/lang/String;)V
    .registers 7

    invoke-virtual {p0}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->isShowingDialog()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    array-length v0, p1

    const/4 v1, 0x0

    const/4 v2, 0x0

    move-object v3, v1

    :goto_b
    if-ge v2, v0, :cond_20

    aget-object v3, p1, v2

    invoke-static {v3}, Lfo4;->e(Ljava/lang/String;)Lfo4;

    move-result-object v4

    if-nez v4, :cond_1a

    invoke-static {v3}, Lauh;->d(Ljava/lang/String;)Lauh;

    move-result-object v3

    goto :goto_1b

    :cond_1a
    move-object v3, v4

    :goto_1b
    if-nez v3, :cond_20

    add-int/lit8 v2, v2, 0x1

    goto :goto_b

    :cond_20
    if-eqz v3, :cond_26

    invoke-interface {v3}, Llrd;->a()Lvnd;

    move-result-object v1

    :cond_26
    if-nez v1, :cond_2e

    iget-wide p0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a:J

    invoke-static {p0, p1}, LJ/N;->MY1J7b0i(J)V

    return-void

    :cond_2e
    new-instance p1, Lqmd;

    invoke-interface {v3}, Llrd;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p1, v0, v1, p0}, Lk73;-><init>(Ljava/lang/String;Lvnd;Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;)V

    iput-object p1, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    invoke-virtual {p1}, Lk73;->p()V

    return-void
.end method

.method public final openRouteControllerDialog(Ljava/lang/String;Ljava/lang/String;)V
    .registers 5

    invoke-virtual {p0}, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->isShowingDialog()Z

    move-result v0

    if-eqz v0, :cond_7

    return-void

    :cond_7
    invoke-static {p1}, Lfo4;->e(Ljava/lang/String;)Lfo4;

    move-result-object v0

    if-nez v0, :cond_11

    invoke-static {p1}, Lauh;->d(Ljava/lang/String;)Lauh;

    move-result-object v0

    :cond_11
    if-nez v0, :cond_15

    const/4 p1, 0x0

    goto :goto_19

    :cond_15
    invoke-interface {v0}, Llrd;->a()Lvnd;

    move-result-object p1

    :goto_19
    if-nez p1, :cond_21

    iget-wide p0, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->a:J

    invoke-static {p0, p1}, LJ/N;->MY1J7b0i(J)V

    return-void

    :cond_21
    new-instance v1, Land;

    invoke-interface {v0}, Llrd;->b()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0, p1, p2, p0}, Land;-><init>(Ljava/lang/String;Lvnd;Ljava/lang/String;Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;)V

    iput-object v1, p0, Lorg/chromium/components/media_router/BrowserMediaRouterDialogController;->b:Lk73;

    invoke-virtual {v1}, Lk73;->p()V

    return-void
.end method
