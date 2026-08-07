.class public Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;
.super Lv/VRelative;
.source "SourceFile"


# instance fields
.field public d:Landroid/widget/RelativeLayout;

.field public e:Lv/VText;

.field public f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

.field public g:Landroid/widget/FrameLayout;

.field public h:Landroid/animation/ObjectAnimator;

.field public i:Ll/us80;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lv/VRelative;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Lv/VRelative;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic p(Ll/x20;Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-interface {p0}, Ll/x20;->call()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic q(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;I)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->campaignLinks:Ljava/util/List;

    .line 4
    .line 5
    invoke-interface {p1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;

    .line 10
    .line 11
    invoke-interface {p0, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic z(Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;->text:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public final B(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ddt;->a(Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public H(Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;Ll/y20;Ll/x20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaignLink;",
            ">;",
            "Ll/x20;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->e:Lv/VText;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->title:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;->campaignLinks:Ljava/util/List;

    .line 9
    .line 10
    new-instance v1, Ll/adt;

    .line 11
    .line 12
    invoke-direct {v1}, Ll/adt;-><init>()V

    .line 13
    .line 14
    .line 15
    invoke-static {v0, v1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

    .line 20
    .line 21
    invoke-virtual {v1, v0}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;->setTextList(Ljava/util/List;)V

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

    .line 25
    .line 26
    const-wide/16 v1, 0xbb8

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;->setTextStillTime(J)V

    .line 29
    .line 30
    .line 31
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

    .line 32
    .line 33
    const-wide/16 v1, 0x258

    .line 34
    .line 35
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;->setAnimTime(J)V

    .line 36
    .line 37
    .line 38
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;->h()V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->f:Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;

    .line 44
    .line 45
    new-instance v1, Ll/bdt;

    .line 46
    .line 47
    invoke-direct {v1, p2, p1}, Ll/bdt;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLivePageCampaign;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView;->setOnItemClickListener(Lcom/p1/mobile/putong/live/livingroom/view/AutoRollView$a;)V

    .line 51
    .line 52
    .line 53
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->g:Landroid/widget/FrameLayout;

    .line 54
    .line 55
    new-instance p1, Ll/cdt;

    .line 56
    .line 57
    invoke-direct {p1, p3}, Ll/cdt;-><init>(Ll/x20;)V

    .line 58
    .line 59
    .line 60
    invoke-static {p0, p1}, Ll/bnl0;->E0(Landroid/view/View;Landroid/view/View$OnClickListener;)V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public onDetachedFromWindow()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->h:Landroid/animation/ObjectAnimator;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/animation/Animator;->isRunning()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->h:Landroid/animation/ObjectAnimator;

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/animation/Animator;->cancel()V

    .line 18
    .line 19
    .line 20
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->h:Landroid/animation/ObjectAnimator;

    .line 21
    .line 22
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->i:Ll/us80;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iput-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->i:Ll/us80;

    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/view/LivePreviewCampaignView;->B(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
