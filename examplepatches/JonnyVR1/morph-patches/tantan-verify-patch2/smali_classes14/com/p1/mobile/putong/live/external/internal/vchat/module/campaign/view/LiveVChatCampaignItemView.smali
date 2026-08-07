.class public Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

.field public d:Landroid/view/View;

.field public e:Ll/w0c;

.field public f:Ll/liu;

.field public g:Lcom/p1/mobile/android/app/Act;

.field public h:Ll/kcg0;

.field public i:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

.field public j:Ll/ve4;

.field public k:Ll/bf4;


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

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Ll/bcg0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->p(Ll/bcg0;)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/liu;->r3(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic d(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "accessOutterToken "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    const-string v0, "[live]campaign"

    .line 20
    .line 21
    invoke-static {v0, p0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->m(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Lcom/p1/mobile/putong/data/AuthData;)V

    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->o(Ll/bcg0;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final g(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/xhu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getViewBitmap()Landroid/graphics/Bitmap;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->e:Ll/w0c;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/ffv;->a(Lcom/hellogroup/mk/business/base/ui/MKWebView;Ll/w0c;)V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j:Ll/ve4;

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->h:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public i()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/webkit/WebView;->stopLoading()V

    .line 6
    .line 7
    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j:Ll/ve4;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->h:Ll/kcg0;

    .line 12
    .line 13
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final j(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/liu;)V
    .locals 4

    .line 1
    new-instance v0, Ll/w0c;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w0c;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->e:Ll/w0c;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    check-cast v1, Landroid/app/Activity;

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 15
    .line 16
    invoke-virtual {v0, v1, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebViewHelper;->z(Landroid/app/Activity;Lcom/hellogroup/mk/business/base/ui/MKWebView;)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->e:Ll/w0c;

    .line 20
    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 22
    .line 23
    .line 24
    move-result-object v1

    .line 25
    check-cast v1, Lcom/p1/mobile/putong/app/PutongAct;

    .line 26
    .line 27
    const-string v2, ""

    .line 28
    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 30
    .line 31
    invoke-virtual {v0, v1, v2, v3, v2}, Ll/w0c;->M(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Landroid/view/View;->setBackgroundColor(I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 41
    .line 42
    new-instance v2, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView$a;

    .line 43
    .line 44
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->e:Ll/w0c;

    .line 45
    .line 46
    invoke-direct {v2, p0, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Ll/nxl;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {v0, v2}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->setMKWebLoadListener(Ll/ilw;)V

    .line 50
    .line 51
    .line 52
    iget-boolean v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isH5HandleClick:Z

    .line 53
    .line 54
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->d:Landroid/view/View;

    .line 55
    .line 56
    if-eqz v0, :cond_0

    .line 57
    .line 58
    invoke-static {v2, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->d:Landroid/view/View;

    .line 62
    .line 63
    const/4 p2, 0x0

    .line 64
    invoke-static {p1, p2}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 65
    .line 66
    .line 67
    goto :goto_0

    .line 68
    :cond_0
    const/4 v0, 0x1

    .line 69
    invoke-static {v2, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 70
    .line 71
    .line 72
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->d:Landroid/view/View;

    .line 73
    .line 74
    new-instance v1, Ll/thu;

    .line 75
    .line 76
    invoke-direct {v1, p2, p1}, Ll/thu;-><init>(Ll/liu;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 77
    .line 78
    .line 79
    invoke-static {v0, v1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 80
    .line 81
    .line 82
    :goto_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 83
    .line 84
    invoke-virtual {p0}, Landroid/webkit/WebView;->getSettings()Landroid/webkit/WebSettings;

    .line 85
    .line 86
    .line 87
    move-result-object p0

    .line 88
    const/4 p1, -0x1

    .line 89
    invoke-virtual {p0, p1}, Landroid/webkit/WebSettings;->setCacheMode(I)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public final k(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p3}, Ll/ntp0;->d(Ljava/lang/String;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "H5-Authorization"

    .line 13
    .line 14
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 15
    .line 16
    .line 17
    :cond_0
    invoke-virtual {p2, p3, p0}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;Ljava/util/Map;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final l()Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->g:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    instance-of v0, p0, Lcom/p1/mobile/putong/app/PutongAct;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    if-nez p0, :cond_0

    .line 14
    .line 15
    const/4 p0, 0x1

    .line 16
    return p0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    return p0
.end method

.method public final synthetic m(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->f:Ll/liu;

    .line 2
    .line 3
    iget-object v1, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/liu;->w3(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p2, p2, Lcom/p1/mobile/putong/data/AuthData;->accessToken:Ljava/lang/String;

    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 11
    .line 12
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {p0, p2, v0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->k(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic n(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;->getSubscribeType()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 8
    .line 9
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    return-object p0
.end method

.method public final synthetic o(Ll/bcg0;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget p1, p1, Ll/bcg0;->b:I

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/Object;->hashCode()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-ne p1, p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    return-object p0
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->g(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    invoke-virtual {p0, v0}, Landroid/view/View;->setDrawingCacheEnabled(Z)V

    .line 9
    .line 10
    .line 11
    new-instance v0, Ll/bf4;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->b:Landroid/widget/FrameLayout;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Ll/bf4;-><init>(Landroid/view/View;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->k:Ll/bf4;

    .line 19
    .line 20
    return-void
.end method

.method public final synthetic p(Ll/bcg0;)V
    .locals 1

    .line 1
    iget-object v0, p1, Ll/bcg0;->c:Ll/ve4;

    .line 2
    .line 3
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j:Ll/ve4;

    .line 4
    .line 5
    iget-object v0, p1, Ll/bcg0;->a:Ljava/lang/String;

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->campaignType:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    iget-object p1, p1, Ll/bcg0;->d:Ll/y20;

    .line 16
    .line 17
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-interface {p1, p0}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public final q(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->l()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->f:Ll/liu;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/liu;->e3()Ljava/lang/String;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 15
    .line 16
    .line 17
    move-result v1

    .line 18
    if-eqz v1, :cond_1

    .line 19
    .line 20
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->g:Lcom/p1/mobile/android/app/Act;

    .line 21
    .line 22
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 23
    .line 24
    invoke-virtual {v1}, Ll/wrv;->a()Lrx/c;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    new-instance v1, Ll/uhu;

    .line 33
    .line 34
    invoke-direct {v1, p0, p1}, Ll/uhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 35
    .line 36
    .line 37
    new-instance p0, Ll/vhu;

    .line 38
    .line 39
    invoke-direct {p0}, Ll/vhu;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v1, p0}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 51
    .line 52
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->k(Ljava/lang/String;Lcom/hellogroup/mk/business/base/ui/MKWebView;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    return-void
.end method

.method public r(Ljava/util/List;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j:Ll/ve4;

    .line 8
    .line 9
    if-eqz v0, :cond_2

    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 12
    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance v0, Ll/qhu;

    .line 17
    .line 18
    invoke-direct {v0, p0}, Ll/qhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;)V

    .line 19
    .line 20
    .line 21
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p1

    .line 25
    check-cast p1, Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;

    .line 26
    .line 27
    if-nez p1, :cond_1

    .line 28
    .line 29
    goto :goto_0

    .line 30
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j:Ll/ve4;

    .line 31
    .line 32
    invoke-interface {p0, p1}, Ll/ve4;->a(Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    :goto_0
    return-void
.end method

.method public final s()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->h:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->g:Lcom/p1/mobile/android/app/Act;

    .line 7
    .line 8
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->f:Ll/liu;

    .line 9
    .line 10
    invoke-virtual {v1}, Ll/ahu;->K2()Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    iget-object v1, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus;->LiveVChatBridgeImplEvent:Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;

    .line 15
    .line 16
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/LiveVChatEventBus$c;->c()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    check-cast v1, Lrx/c;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Lrx/c;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/rhu;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/rhu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    new-instance v1, Ll/shu;

    .line 48
    .line 49
    invoke-direct {v1, p0}, Ll/shu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;)V

    .line 50
    .line 51
    .line 52
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->h:Ll/kcg0;

    .line 61
    .line 62
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->h:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 7
    .line 8
    const-string v1, "about:blank"

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Lcom/hellogroup/mk/business/base/ui/MKWebView;->loadUrl(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public u(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/liu;)V
    .locals 1

    .line 1
    iput-object p2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->f:Ll/liu;

    .line 2
    .line 3
    invoke-virtual {p2}, Ll/ahu;->act()Lcom/p1/mobile/android/app/Act;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->g:Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->i:Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->s()V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->k:Ll/bf4;

    .line 15
    .line 16
    invoke-virtual {v0, p1}, Ll/bf4;->b(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->j(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;Ll/liu;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->q(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 23
    .line 24
    .line 25
    const/4 p1, 0x1

    .line 26
    invoke-static {p0, p1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 27
    .line 28
    .line 29
    return-void
.end method
