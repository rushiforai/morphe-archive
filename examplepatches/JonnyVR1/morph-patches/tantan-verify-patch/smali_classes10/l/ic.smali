.class public Ll/ic;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ll/iam<",
        "Ll/jc;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

.field public b:Ll/jc;

.field public c:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/android/app/Act;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 5
    .line 6
    invoke-direct {v0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;-><init>(Landroid/content/Context;)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 10
    .line 11
    sget p0, Ll/n9c0;->f:I

    .line 12
    .line 13
    invoke-static {p0}, Ll/n3d0;->a(I)I

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    invoke-virtual {v0, p0}, Landroid/view/View;->setBackgroundColor(I)V

    .line 18
    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object p0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public a(Ll/jc;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ic;->b:Ll/jc;

    .line 2
    .line 3
    return-void
.end method

.method public b()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    return-object p0
.end method

.method public c(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, "_bid"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/net/Uri;->getQueryParameter(Ljava/lang/String;)Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iget-object v1, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 18
    .line 19
    invoke-virtual {v1, v0, p1, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 23
    .line 24
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 25
    .line 26
    .line 27
    iget-object v0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 28
    .line 29
    const/4 v1, 0x1

    .line 30
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setOnCheckIsTextEditorFlag(Z)V

    .line 31
    .line 32
    .line 33
    iget-object v0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 34
    .line 35
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->w(Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Ll/ic;->c:Ljava/lang/String;

    .line 39
    .line 40
    return-void
.end method

.method public d()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    iget-object p0, p0, Ll/ic;->c:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->w(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ic;->a:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->p()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/jc;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ic;->a(Ll/jc;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public init()V
    .locals 0

    .line 1
    return-void
.end method
