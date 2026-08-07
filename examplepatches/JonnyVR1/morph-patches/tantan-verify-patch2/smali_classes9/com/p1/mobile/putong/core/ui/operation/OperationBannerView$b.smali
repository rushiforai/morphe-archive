.class public Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;
.super Ll/cf60;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = "b"
.end annotation


# instance fields
.field public final synthetic a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 2
    .line 3
    invoke-direct {p0}, Ll/cf60;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic j(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->k(Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V

    return-void
.end method


# virtual methods
.method public destroyItem(Landroid/view/ViewGroup;ILjava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p3, Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p1, p3}, Landroid/view/ViewGroup;->removeView(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public getCount()I
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->s(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ljava/util/List;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Ljava/util/List;->size()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    const/4 v0, 0x6

    .line 12
    invoke-static {p0, v0}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    return p0
.end method

.method public instantiateItem(Landroid/view/ViewGroup;I)Ljava/lang/Object;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->w(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    sget v1, Ll/kec0;->y8:I

    .line 12
    .line 13
    const/4 v2, 0x0

    .line 14
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    sget v1, Ll/adc0;->N5:I

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lv/VDraweeView;

    .line 25
    .line 26
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 27
    .line 28
    invoke-static {v2}, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;->s(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;)Ljava/util/List;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-interface {v2, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    check-cast p2, Lcom/p1/mobile/putong/data/IntlOperationBanner;

    .line 37
    .line 38
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    sget-object v2, Ll/uqb0;->G:Ll/fsb0;

    .line 45
    .line 46
    iget-object v3, p2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->banner:Lcom/p1/mobile/putong/data/UrlParentData;

    .line 47
    .line 48
    iget-object v3, v3, Lcom/p1/mobile/putong/data/UrlParentData;->url:Ljava/lang/String;

    .line 49
    .line 50
    invoke-virtual {v2, v1, v3}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_0
    new-instance v2, Ll/yy50;

    .line 54
    .line 55
    invoke-direct {v2, p0, p2}, Ll/yy50;-><init>(Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;Lcom/p1/mobile/putong/data/IntlOperationBanner;)V

    .line 56
    .line 57
    .line 58
    invoke-static {v1, v2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1, v0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 62
    .line 63
    .line 64
    const-string p0, "intl_campaign_id"

    .line 65
    .line 66
    iget-object p1, p2, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 67
    .line 68
    invoke-static {p0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    filled-new-array {p0}, [Ll/pf60;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    const-string p1, "e_campaign_banner"

    .line 77
    .line 78
    const-string p2, "p_community_page"

    .line 79
    .line 80
    invoke-static {p1, p2, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 81
    .line 82
    .line 83
    return-object v0
.end method

.method public isViewFromObject(Landroid/view/View;Ljava/lang/Object;)Z
    .locals 0
    .param p1    # Landroid/view/View;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Ljava/lang/Object;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    if-ne p1, p2, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public final synthetic k(Lcom/p1/mobile/putong/data/IntlOperationBanner;Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    const-string p2, "intl_campaign_id"

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->id:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    filled-new-array {p2}, [Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "e_campaign_banner"

    .line 20
    .line 21
    const-string v1, "p_community_page"

    .line 22
    .line 23
    invoke-static {v0, v1, p2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 24
    .line 25
    .line 26
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 27
    .line 28
    invoke-virtual {p2}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    const-string v0, ""

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/data/IntlOperationBanner;->jumpUrl:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p2, v0, p1}, Lcom/p1/mobile/putong/ui/webview/AccessTokenWebViewAct;->a2(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView$b;->a:Lcom/p1/mobile/putong/core/ui/operation/OperationBannerView;

    .line 41
    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 47
    .line 48
    .line 49
    :cond_0
    return-void
.end method
