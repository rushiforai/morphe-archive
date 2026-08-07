.class public Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;
.super Landroid/widget/LinearLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/LinearLayout;",
        "Ll/iam<",
        "Ll/q6g0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lv/VImage;

.field public b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
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

.method public static synthetic a(Ll/q6g0;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/q6g0;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public C0()Landroid/content/Context;
    .locals 0
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public final b(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/s6g0;->a(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public c(Ll/q6g0;)V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->a:Lv/VImage;

    .line 2
    .line 3
    new-instance v0, Ll/r6g0;

    .line 4
    .line 5
    invoke-direct {v0, p1}, Ll/r6g0;-><init>(Ll/q6g0;)V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

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

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/q6g0;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->c(Ll/q6g0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public onFinishInflate()V
    .locals 4

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->b(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v1, Ll/efv;->r:Ljava/lang/String;

    .line 12
    .line 13
    sget-object v2, Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;->TRAN_BG:Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    invoke-virtual {v0, v3, v1, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->y(ZLjava/lang/String;Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 20
    .line 21
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->setWebViewBg(Lcom/p1/mobile/putong/ui/webview/mk/CommonH5Builder$BgType;)V

    .line 22
    .line 23
    .line 24
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuRuleViewModel;->b:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;->w(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method
