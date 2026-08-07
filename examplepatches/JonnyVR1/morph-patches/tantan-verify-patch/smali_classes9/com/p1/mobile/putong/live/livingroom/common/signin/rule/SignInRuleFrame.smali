.class public Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

.field public b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

.field public c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;


# direct methods
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

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->d(Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xcf0;->a(Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/live/livingroom/common/signin/a;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    return-void
.end method

.method public final synthetic d(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->c:Lcom/p1/mobile/putong/live/livingroom/common/signin/a;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/signin/a;->r4(Z)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public e()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 8
    .line 9
    const/4 v1, 0x1

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    sget-object v2, Ll/efv;->q:Ljava/lang/String;

    .line 13
    .line 14
    sget-object v3, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2, v3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 20
    .line 21
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 25
    .line 26
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->w(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 30
    .line 31
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ld:I

    .line 32
    .line 33
    invoke-virtual {v0, v2, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->d(IZ)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 37
    .line 38
    new-instance v2, Ll/wcf0;

    .line 39
    .line 40
    invoke-direct {v2, p0}, Ll/wcf0;-><init>(Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setBackListener(Landroid/view/View$OnClickListener;)V

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setLeftView(I)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/signin/rule/SignInRuleFrame;->a:Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;

    .line 52
    .line 53
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/view/DialogTitleBar;->setDivider(Z)V

    .line 54
    .line 55
    .line 56
    return-void
.end method
