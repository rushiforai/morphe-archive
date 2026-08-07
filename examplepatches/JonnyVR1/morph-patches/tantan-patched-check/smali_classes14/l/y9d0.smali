.class public Ll/y9d0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;Landroid/view/View;)V
    .locals 3

    .line 1
    move-object v0, p1

    .line 2
    check-cast v0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 3
    .line 4
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->a:Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;

    .line 5
    .line 6
    check-cast p1, Landroid/view/ViewGroup;

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iput-object v1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->b:Landroid/view/View;

    .line 14
    .line 15
    const/4 v1, 0x1

    .line 16
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    check-cast v2, Landroidx/cardview/widget/CardView;

    .line 21
    .line 22
    iput-object v2, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->c:Landroidx/cardview/widget/CardView;

    .line 23
    .line 24
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    check-cast v2, Landroid/view/ViewGroup;

    .line 29
    .line 30
    invoke-virtual {v2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 35
    .line 36
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->d:Lcom/p1/mobile/putong/live/base/webview/LiveMkWebView;

    .line 37
    .line 38
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    check-cast p1, Landroid/view/ViewGroup;

    .line 43
    .line 44
    invoke-virtual {p1, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    check-cast p1, Lv/VImage;

    .line 49
    .line 50
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/page/rights/list/view/RightDetailDialogContentView;->e:Lv/VImage;

    .line 51
    .line 52
    return-void
.end method
