.class public Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

.field public b:Landroid/view/View;

.field public c:Landroidx/cardview/widget/CardView;

.field public d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

.field public e:Lv/VImage;

.field public f:Ll/cad0;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->f(Landroid/view/View;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->e(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final c(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/y9d0;->a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public d()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->v()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final synthetic e(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->f:Ll/cad0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cad0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic f(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->f:Ll/cad0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/cad0;->d()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public g()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->p()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public h(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ll/cad0;)V
    .locals 2

    .line 1
    iput-object p4, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->f:Ll/cad0;

    .line 2
    .line 3
    invoke-static {p2}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 4
    .line 5
    .line 6
    move-result-object p4

    .line 7
    const-string v0, "_bid"

    .line 8
    .line 9
    invoke-virtual {p4, v0}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p4

    .line 13
    invoke-static {p4}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p4

    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->p()V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 23
    .line 24
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 28
    .line 29
    sget-object v1, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 30
    .line 31
    invoke-virtual {v0, p4, p2, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 32
    .line 33
    .line 34
    iget-object p4, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 35
    .line 36
    invoke-virtual {p4, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 40
    .line 41
    check-cast p1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 42
    .line 43
    invoke-virtual {p0, p1, p3, p2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->k(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->c(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->e:Lv/VImage;

    .line 8
    .line 9
    new-instance v1, Ll/w9d0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/w9d0;-><init>(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->b:Landroid/view/View;

    .line 18
    .line 19
    new-instance v1, Ll/x9d0;

    .line 20
    .line 21
    invoke-direct {v1, p0}, Ll/x9d0;-><init>(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method
