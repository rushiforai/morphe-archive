.class public Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/util/HashMap;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Ljava/util/HashMap;

    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    sput-object v0, Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;->a:Ljava/util/HashMap;

    return-void
.end method

.method public static getDelegate(J)Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;
    .registers 3

    sget-object v0, Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;->a:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    if-nez p0, :cond_10

    const/4 p0, 0x0

    return-object p0

    :cond_10
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;

    return-object p0
.end method

.method public static handleKeyboardEventFallback(Lorg/chromium/ui/base/WindowAndroid;Landroid/view/KeyEvent;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public static preHandleKeyboardEvent(Lorg/chromium/ui/base/WindowAndroid;Landroid/view/KeyEvent;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public static registerRef(JLorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;)V
    .registers 5

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v0

    new-instance v1, Ljava/lang/ref/WeakReference;

    invoke-direct {v1, p2}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    sget-object p2, Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;->a:Ljava/util/HashMap;

    invoke-virtual {p2, v0, v1}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Ljava/lang/ref/WeakReference;

    if-nez p2, :cond_14

    return-void

    :cond_14
    const-string p2, "WebContentsDelegateAndroid already exists for native pointer: "

    invoke-static {p0, p1, p2}, Lp3p;->l(JLjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    return-void
.end method

.method public static unregisterRef(J)V
    .registers 3

    sget-object v0, Lorg/chromium/components/embedder_support/delegate/WebContentsDelegateAndroid;->a:Ljava/util/HashMap;

    invoke-static {p0, p1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public activateContents()V
    .registers 1

    return-void
.end method

.method public final addMessageToConsole(ILjava/lang/String;ILjava/lang/String;)Z
    .registers 5

    const/4 p0, 0x0

    return p0
.end method

.method public final canDownload(Lorg/chromium/url/GURL;Ljava/lang/String;)Z
    .registers 3

    const/4 p0, 0x1

    return p0
.end method

.method public final canEnterFullscreenModeForTab(Lorg/chromium/content_public/browser/RenderFrameHost;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final cancelKeyboardLockRequest()V
    .registers 1

    return-void
.end method

.method public closeContents()V
    .registers 1

    return-void
.end method

.method public contentsZoomChange(Z)V
    .registers 2

    return-void
.end method

.method public controlsResizeView()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final didBackForwardTransitionAnimationChange()V
    .registers 1

    return-void
.end method

.method public final didChangeCloseSignalInterceptStatus()V
    .registers 1

    return-void
.end method

.method public enterFullscreenModeForTab(Lorg/chromium/content_public/browser/RenderFrameHost;ZZJ)V
    .registers 6

    return-void
.end method

.method public exitFullscreenModeForTab()V
    .registers 1

    return-void
.end method

.method public final fullscreenStateChangedForTab(Lorg/chromium/content_public/browser/RenderFrameHost;ZZJ)V
    .registers 6

    return-void
.end method

.method public final getBackForwardTransitionFallbackUXFaviconBackgroundColor()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getBackForwardTransitionFallbackUXInternalPageIcon()Landroid/graphics/Bitmap;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final getBackForwardTransitionFallbackUXPageBackgroundColor()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public getBottomControlsHeight()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public getBottomControlsMinHeight()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getDisplayModeChecked()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final getFullscreenTargetDisplay()J
    .registers 3

    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public getTopControlsHeight()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public getTopControlsMinHeight()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public getVirtualKeyboardHeight()I
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public handleKeyboardEvent(Landroid/view/KeyEvent;)V
    .registers 2

    return-void
.end method

.method public isFullscreenForTabOrPending()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public loadingStateChanged(Z)V
    .registers 2

    return-void
.end method

.method public final maybeCopyContentAreaAsBitmap(Lorg/chromium/base/JniOnceCallback;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/JniOnceCallback;",
            ")Z"
        }
    .end annotation

    invoke-interface {p1}, Ls37;->destroy()V

    const/4 p0, 0x0

    return p0
.end method

.method public final maybeCopyContentAreaAsBitmapSync()Landroid/graphics/Bitmap;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final maybeCopyContentAreaAsHardwareBuffer(Lorg/chromium/base/JniOnceCallback;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lorg/chromium/base/JniOnceCallback;",
            ")Z"
        }
    .end annotation

    invoke-interface {p1}, Ls37;->destroy()V

    const/4 p0, 0x0

    return p0
.end method

.method public navigationStateChanged(I)V
    .registers 2

    return-void
.end method

.method public final onUpdateTargetUrl(Lorg/chromium/url/GURL;)V
    .registers 2

    return-void
.end method

.method public final openNewTab(Lorg/chromium/url/GURL;Ljava/lang/String;Lorg/chromium/content_public/common/ResourceRequestBody;IZ)V
    .registers 6

    return-void
.end method

.method public rendererResponsive()V
    .registers 1

    return-void
.end method

.method public rendererUnresponsive()V
    .registers 1

    return-void
.end method

.method public final requestImmersivePlaybackConfirmation(III)V
    .registers 4

    if-eqz p3, :cond_7

    const/4 p0, 0x3

    const/4 p1, 0x0

    invoke-static {p3, p0, p1, p1, p1}, LJ/N;->MFwGQEih(IIIIZ)V

    :cond_7
    return-void
.end method

.method public final requestKeyboardLock(Z)V
    .registers 2

    return-void
.end method

.method public final setContentsBounds(Lorg/chromium/content_public/browser/WebContents;Landroid/graphics/Rect;)V
    .registers 3

    return-void
.end method

.method public final shouldAnimateBrowserControlsHeightChanges()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public final shouldBlockMediaRequest(Lorg/chromium/url/GURL;)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public shouldCreateWebContents(Lorg/chromium/url/GURL;)Z
    .registers 2

    const/4 p0, 0x1

    return p0
.end method

.method public final shouldOverrideUserAgentForPreloading(Lorg/chromium/url/GURL;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final showRepostFormWarningDialog()V
    .registers 1

    return-void
.end method

.method public final takeFocus(Z)Z
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public visibleSSLStateChanged()V
    .registers 1

    return-void
.end method
