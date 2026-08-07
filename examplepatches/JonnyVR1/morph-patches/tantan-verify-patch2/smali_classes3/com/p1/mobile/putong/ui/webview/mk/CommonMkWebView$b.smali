.class public Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/rx3$a;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->getPageListener()Ll/rx3$a;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public a(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "about:blank"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 10
    .line 11
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->f(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/ProgressBar;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const/4 p1, 0x0

    .line 16
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public b(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "about:blank"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_0

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->c(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/LinearLayout;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-static {p1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->h(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 28
    .line 29
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->f(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/ProgressBar;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    const/4 p1, 0x1

    .line 34
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void
.end method

.method public c(ILjava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p1, "about:blank"

    .line 2
    .line 3
    invoke-static {p3, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-nez p1, :cond_1

    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 10
    .line 11
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->f(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/ProgressBar;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    const/4 p2, 0x0

    .line 16
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 20
    .line 21
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->g(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z

    .line 22
    .line 23
    .line 24
    move-result p1

    .line 25
    if-eqz p1, :cond_0

    .line 26
    .line 27
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 28
    .line 29
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->c(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Landroid/widget/LinearLayout;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    const/4 p2, 0x1

    .line 34
    invoke-static {p1, p2}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 35
    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 38
    .line 39
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->a(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Z

    .line 40
    .line 41
    .line 42
    move-result p1

    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 46
    .line 47
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->e(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    if-eqz p1, :cond_1

    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView$b;->a:Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;

    .line 54
    .line 55
    invoke-static {p0}, Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;->e(Lcom/p1/mobile/putong/ui/webview/mk/CommonMkWebView;)Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const/4 p1, -0x1

    .line 60
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method
