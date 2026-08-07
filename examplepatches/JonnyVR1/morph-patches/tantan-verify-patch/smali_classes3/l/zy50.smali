.class public Ll/zy50;
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

.method public static a(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;Landroid/view/View;)V
    .locals 2

    .line 1
    check-cast p1, Landroid/view/ViewGroup;

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 5
    .line 6
    .line 7
    move-result-object v1

    .line 8
    check-cast v1, Landroidx/cardview/widget/CardView;

    .line 9
    .line 10
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->a:Landroidx/cardview/widget/CardView;

    .line 11
    .line 12
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    check-cast v1, Landroid/view/ViewGroup;

    .line 17
    .line 18
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/AspectRatioViewPager;

    .line 23
    .line 24
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->b:Lv/AspectRatioViewPager;

    .line 25
    .line 26
    const/4 v0, 0x1

    .line 27
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lv/VPagerCircleIndicator;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->c:Lv/VPagerCircleIndicator;

    .line 34
    .line 35
    return-void
.end method
