.class public Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/ue4;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

.field public b:Lv/VPager;

.field public c:Lv/VLinear;

.field public d:Ll/ue4;

.field public e:Ll/zd4;

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/od4;",
            ">;"
        }
    .end annotation
.end field

.field public g:F

.field public h:F

.field public i:Z

.field public final j:Landroid/os/Handler;

.field public k:I

.field public l:[Landroid/view/View;

.field public m:Z

.field public n:Z

.field public final o:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/ArrayList;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 13
    .line 14
    new-instance p1, Landroid/os/Handler;

    .line 15
    .line 16
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 17
    .line 18
    .line 19
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 20
    .line 21
    const/4 p1, 0x1

    .line 22
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n:Z

    .line 23
    .line 24
    new-instance p1, Ll/p3s;

    .line 25
    .line 26
    invoke-direct {p1, p0}, Ll/p3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 33
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    const/4 p1, 0x0

    .line 34
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 35
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    const/4 p1, 0x1

    .line 36
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n:Z

    .line 37
    new-instance p1, Ll/p3s;

    invoke-direct {p1, p0}, Ll/p3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 38
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 39
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    const/4 p1, 0x0

    .line 40
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 41
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n:Z

    .line 43
    new-instance p1, Ll/p3s;

    invoke-direct {p1, p0}, Ll/p3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    return-void
.end method

.method private B()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_2

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 21
    .line 22
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    if-gt v0, v1, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 32
    .line 33
    invoke-virtual {v1}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/od4;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/od4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    iget v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->carouselSeconds:I

    .line 48
    .line 49
    mul-int/lit16 v0, v0, 0x3e8

    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 61
    .line 62
    int-to-long v2, v0

    .line 63
    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 64
    .line 65
    .line 66
    :cond_2
    :goto_0
    return-void
.end method

.method private E(Ljava/util/List;)V
    .locals 6
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;)V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/v3s;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/v3s;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x0

    .line 15
    const/4 v3, 0x1

    .line 16
    if-le v1, v3, :cond_0

    .line 17
    .line 18
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->F()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 27
    .line 28
    new-instance v4, Ll/ye4;

    .line 29
    .line 30
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    sub-int/2addr v5, v3

    .line 35
    invoke-interface {p1, v5}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 40
    .line 41
    invoke-direct {v4, v3}, Ll/ye4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 53
    .line 54
    new-instance v1, Ll/ye4;

    .line 55
    .line 56
    invoke-interface {p1, v2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v2

    .line 60
    check-cast v2, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 61
    .line 62
    invoke-direct {v1, v2}, Ll/ye4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 63
    .line 64
    .line 65
    invoke-interface {v0, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->setIndicator(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method private F()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView$a;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 12
    .line 13
    new-instance v1, Ll/w3s;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/w3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private G()V
    .locals 4

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->getMaxWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->getMaxHeight()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->getValidMaxRatio()Landroid/util/Pair;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v3, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 22
    .line 23
    check-cast v2, Ljava/lang/Integer;

    .line 24
    .line 25
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    if-eqz v3, :cond_0

    .line 30
    .line 31
    if-gt v3, v0, :cond_0

    .line 32
    .line 33
    move v0, v3

    .line 34
    :cond_0
    if-eqz v2, :cond_1

    .line 35
    .line 36
    if-gt v2, v1, :cond_1

    .line 37
    .line 38
    move v1, v2

    .line 39
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 40
    .line 41
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 42
    .line 43
    .line 44
    move-result-object v2

    .line 45
    int-to-float v0, v0

    .line 46
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 51
    .line 52
    int-to-float v0, v1

    .line 53
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 60
    .line 61
    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method private I()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->s(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 7
    .line 8
    invoke-interface {v1}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    add-int/lit8 v1, v1, -0x2

    .line 13
    .line 14
    invoke-direct {p0, v1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->s(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v1

    .line 18
    const/4 v2, 0x0

    .line 19
    if-eqz v0, :cond_2

    .line 20
    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    instance-of v3, v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    move-object v3, v1

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->getViewBitmap()Landroid/graphics/Bitmap;

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    instance-of v3, v1, Lv/VDraweeView;

    .line 36
    .line 37
    if-eqz v3, :cond_1

    .line 38
    .line 39
    invoke-virtual {v1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    goto :goto_0

    .line 44
    :cond_1
    move-object v3, v2

    .line 45
    :goto_0
    if-eqz v3, :cond_2

    .line 46
    .line 47
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;->setBg(Landroid/graphics/Bitmap;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 53
    .line 54
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    const/4 v3, 0x1

    .line 59
    sub-int/2addr v0, v3

    .line 60
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->s(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-direct {p0, v3}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->s(I)Landroid/view/View;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    if-eqz p0, :cond_5

    .line 71
    .line 72
    instance-of p0, v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 73
    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->getViewBitmap()Landroid/graphics/Bitmap;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    goto :goto_1

    .line 83
    :cond_3
    instance-of p0, v1, Lv/VDraweeView;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    invoke-virtual {v1}, Landroid/view/View;->getDrawingCache()Landroid/graphics/Bitmap;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    :cond_4
    :goto_1
    if-eqz v2, :cond_5

    .line 92
    .line 93
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignSnapShotItemView;->setBg(Landroid/graphics/Bitmap;)V

    .line 96
    .line 97
    .line 98
    :cond_5
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;Z)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->y(Z)V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)Ll/od4;
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->isImageType()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    new-instance v0, Ll/nd4;

    .line 15
    .line 16
    invoke-direct {v0, p0}, Ll/nd4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 17
    .line 18
    .line 19
    return-object v0

    .line 20
    :cond_0
    new-instance v0, Ll/ef4;

    .line 21
    .line 22
    invoke-direct {v0, p0}, Ll/ef4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 23
    .line 24
    .line 25
    return-object v0
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->w()V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->x()V

    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->z(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    return-object p0
.end method

.method private getMaxHeight()I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->m:Z

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/16 p0, 0x6b

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/16 p0, 0x7e

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    if-eqz p0, :cond_2

    .line 19
    .line 20
    const/16 p0, 0x60

    .line 21
    .line 22
    return p0

    .line 23
    :cond_2
    const/16 p0, 0x90

    .line 24
    .line 25
    return p0
.end method

.method private getMaxWidth()I
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    invoke-static {v0}, Ll/wft;->b(I)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    iget-boolean p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->m:Z

    .line 7
    .line 8
    if-nez v0, :cond_1

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const/16 p0, 0x51

    .line 13
    .line 14
    return p0

    .line 15
    :cond_0
    const/16 p0, 0x5f

    .line 16
    .line 17
    return p0

    .line 18
    :cond_1
    if-eqz p0, :cond_2

    .line 19
    .line 20
    const/16 p0, 0x49

    .line 21
    .line 22
    return p0

    .line 23
    :cond_2
    const/16 p0, 0x6e

    .line 24
    .line 25
    return p0
.end method

.method private getValidMaxRatio()Landroid/util/Pair;
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Landroid/util/Pair<",
            "Ljava/lang/Integer;",
            "Ljava/lang/Integer;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/q3s;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/q3s;-><init>()V

    .line 6
    .line 7
    .line 8
    invoke-static {p0, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    const/4 v0, 0x0

    .line 17
    move v1, v0

    .line 18
    move v2, v1

    .line 19
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    if-eqz v3, :cond_2

    .line 24
    .line 25
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    check-cast v3, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

    .line 30
    .line 31
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;->entranceSize:Ljava/util/List;

    .line 32
    .line 33
    invoke-interface {v3}, Ljava/util/List;->size()I

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    const/4 v5, 0x2

    .line 38
    if-ne v4, v5, :cond_0

    .line 39
    .line 40
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v4

    .line 44
    check-cast v4, Ljava/lang/Integer;

    .line 45
    .line 46
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v4

    .line 50
    if-ge v1, v4, :cond_1

    .line 51
    .line 52
    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    check-cast v1, Ljava/lang/Integer;

    .line 57
    .line 58
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 59
    .line 60
    .line 61
    move-result v1

    .line 62
    :cond_1
    const/4 v4, 0x1

    .line 63
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v5

    .line 67
    check-cast v5, Ljava/lang/Integer;

    .line 68
    .line 69
    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v5

    .line 73
    if-ge v2, v5, :cond_0

    .line 74
    .line 75
    invoke-interface {v3, v4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ljava/lang/Integer;

    .line 80
    .line 81
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 82
    .line 83
    .line 84
    move-result v2

    .line 85
    goto :goto_0

    .line 86
    :cond_2
    new-instance p0, Landroid/util/Pair;

    .line 87
    .line 88
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    invoke-direct {p0, v0, v1}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    return-object p0
.end method

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->k:I

    return p0
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)[Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l:[Landroid/view/View;

    return-object p0
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->k:I

    return-void
.end method

.method public static bridge synthetic l(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->B()V

    return-void
.end method

.method public static bridge synthetic m(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->I()V

    return-void
.end method

.method private s(I)Landroid/view/View;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    sget v3, Ll/mdc0;->v3:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/view/View;->getTag(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    instance-of v4, v3, Ljava/lang/Integer;

    .line 23
    .line 24
    if-eqz v4, :cond_0

    .line 25
    .line 26
    check-cast v3, Ljava/lang/Integer;

    .line 27
    .line 28
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 29
    .line 30
    .line 31
    move-result v3

    .line 32
    if-ne v3, p1, :cond_0

    .line 33
    .line 34
    return-object v2

    .line 35
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    const/4 p0, 0x0

    .line 39
    return-object p0
.end method

.method private setIndicator(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l:[Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->c:Lv/VLinear;

    .line 6
    .line 7
    invoke-virtual {v0}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 8
    .line 9
    .line 10
    :cond_0
    new-array v0, p1, [Landroid/view/View;

    .line 11
    .line 12
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l:[Landroid/view/View;

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    move v1, v0

    .line 16
    :goto_0
    if-ge v1, p1, :cond_2

    .line 17
    .line 18
    new-instance v2, Landroid/view/View;

    .line 19
    .line 20
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-direct {v2, v3}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 25
    .line 26
    .line 27
    new-instance v3, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 28
    .line 29
    const/high16 v4, 0x40c00000    # 6.0f

    .line 30
    .line 31
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    invoke-direct {v3, v5, v4}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 40
    .line 41
    .line 42
    const/high16 v4, 0x40a00000    # 5.0f

    .line 43
    .line 44
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v5

    .line 48
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    invoke-virtual {v3, v5, v0, v4, v0}, Landroid/view/ViewGroup$MarginLayoutParams;->setMargins(IIII)V

    .line 53
    .line 54
    .line 55
    invoke-virtual {v2, v3}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 56
    .line 57
    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 59
    .line 60
    .line 61
    move-result-object v3

    .line 62
    sget v4, Ll/obc0;->W6:I

    .line 63
    .line 64
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 65
    .line 66
    .line 67
    move-result-object v3

    .line 68
    invoke-virtual {v2, v3}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    .line 69
    .line 70
    .line 71
    if-nez v1, :cond_1

    .line 72
    .line 73
    const/4 v3, 0x1

    .line 74
    goto :goto_1

    .line 75
    :cond_1
    move v3, v0

    .line 76
    :goto_1
    invoke-virtual {v2, v3}, Landroid/view/View;->setSelected(Z)V

    .line 77
    .line 78
    .line 79
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l:[Landroid/view/View;

    .line 80
    .line 81
    aput-object v2, v3, v1

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->c:Lv/VLinear;

    .line 84
    .line 85
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 86
    .line 87
    .line 88
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_2
    return-void
.end method

.method private u(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    if-eqz v0, :cond_2

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto :goto_1

    .line 12
    :cond_0
    const/4 v0, 0x0

    .line 13
    :goto_0
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 14
    .line 15
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-ge v0, v1, :cond_2

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v2, v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 32
    .line 33
    invoke-interface {p1, v1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    add-int/lit8 v0, v0, 0x1

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    :goto_1
    return-void
.end method

.method private synthetic w()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    add-int/lit8 v0, v0, 0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method private synthetic x()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->v()Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {v0, p0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public A(Ljava/util/List;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/longlink/msg/gift/LongLinkGiftMessage$LiveCampaignInfo;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    :goto_0
    if-ge v1, v0, :cond_1

    .line 9
    .line 10
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    instance-of v3, v2, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    check-cast v2, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->r(Ljava/util/List;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    add-int/lit8 v1, v1, 0x1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    return-void
.end method

.method public C(Ljava/util/List;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {v0}, Ll/oo2;->A0()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const-string v1, "voice-live"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->m:Z

    .line 18
    .line 19
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    const/4 v1, 0x0

    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->a:Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;

    .line 27
    .line 28
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 29
    .line 30
    .line 31
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 32
    .line 33
    invoke-virtual {p1, v1}, Ll/ue4;->A4(Z)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void

    .line 44
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->e:Ll/zd4;

    .line 45
    .line 46
    if-nez v0, :cond_2

    .line 47
    .line 48
    new-instance v0, Ll/zd4;

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 51
    .line 52
    invoke-direct {v0, v2}, Ll/zd4;-><init>(Ll/ue4;)V

    .line 53
    .line 54
    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->e:Ll/zd4;

    .line 56
    .line 57
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 58
    .line 59
    invoke-virtual {v2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 60
    .line 61
    .line 62
    :cond_2
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->E(Ljava/util/List;)V

    .line 63
    .line 64
    .line 65
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->G()V

    .line 66
    .line 67
    .line 68
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 69
    .line 70
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 71
    .line 72
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 77
    .line 78
    .line 79
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->e:Ll/zd4;

    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 82
    .line 83
    invoke-virtual {p1, v0}, Ll/zd4;->u(Ljava/util/List;)V

    .line 84
    .line 85
    .line 86
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 87
    .line 88
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->v()Z

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-virtual {p1, v0}, Ll/ue4;->A4(Z)V

    .line 93
    .line 94
    .line 95
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 96
    .line 97
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    const/4 v0, 0x1

    .line 102
    if-le p1, v0, :cond_3

    .line 103
    .line 104
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 107
    .line 108
    .line 109
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->l:[Landroid/view/View;

    .line 110
    .line 111
    aget-object p1, p1, v1

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 114
    .line 115
    .line 116
    :cond_3
    new-instance p1, Ll/t3s;

    .line 117
    .line 118
    invoke-direct {p1, p0}, Ll/t3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;)V

    .line 119
    .line 120
    .line 121
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 122
    .line 123
    .line 124
    return-void
.end method

.method public C0()Landroid/content/Context;
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public H(Z)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->c:Lv/VLinear;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz p1, :cond_1

    .line 5
    .line 6
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    const/4 p1, 0x1

    .line 13
    if-le p0, p1, :cond_0

    .line 14
    .line 15
    move v1, p1

    .line 16
    :cond_0
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    invoke-static {v0, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public J()V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->v()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public destroy()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-static {p0, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 3
    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->c:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/u3s;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/u3s;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->u(Ll/y20;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->e:Ll/zd4;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/zd4;->t()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 2
    .line 3
    if-eqz v0, :cond_6

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/xzs;->L2()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_2

    .line 12
    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 14
    .line 15
    invoke-static {v0}, Ll/dkt;->a(Ll/i6t;)Lcom/p1/mobile/putong/live/livingroom/view/LiveScrollView;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    if-nez v0, :cond_1

    .line 20
    .line 21
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_1
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    const/4 v2, 0x1

    .line 31
    if-eqz v1, :cond_5

    .line 32
    .line 33
    const/4 v3, 0x0

    .line 34
    if-eq v1, v2, :cond_4

    .line 35
    .line 36
    const/4 v4, 0x2

    .line 37
    if-eq v1, v4, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x3

    .line 40
    if-eq v1, v0, :cond_4

    .line 41
    .line 42
    goto :goto_1

    .line 43
    :cond_2
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->h:F

    .line 44
    .line 45
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 46
    .line 47
    .line 48
    move-result v4

    .line 49
    sub-float/2addr v1, v4

    .line 50
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 51
    .line 52
    .line 53
    move-result v1

    .line 54
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->g:F

    .line 55
    .line 56
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 57
    .line 58
    .line 59
    move-result v5

    .line 60
    sub-float/2addr v4, v5

    .line 61
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 62
    .line 63
    .line 64
    move-result v4

    .line 65
    div-float/2addr v1, v4

    .line 66
    iget v4, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->g:F

    .line 67
    .line 68
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    sub-float/2addr v4, v5

    .line 73
    invoke-static {v4}, Ljava/lang/Math;->abs(F)F

    .line 74
    .line 75
    .line 76
    move-result v4

    .line 77
    iget v5, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->h:F

    .line 78
    .line 79
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 80
    .line 81
    .line 82
    move-result v6

    .line 83
    sub-float/2addr v5, v6

    .line 84
    invoke-static {v5}, Ljava/lang/Math;->abs(F)F

    .line 85
    .line 86
    .line 87
    move-result v5

    .line 88
    div-float/2addr v4, v5

    .line 89
    const/high16 v5, 0x40000000    # 2.0f

    .line 90
    .line 91
    cmpl-float v1, v1, v5

    .line 92
    .line 93
    if-lez v1, :cond_3

    .line 94
    .line 95
    iget-boolean v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 96
    .line 97
    if-nez v1, :cond_3

    .line 98
    .line 99
    invoke-virtual {v0, v3}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_3
    cmpl-float v1, v4, v5

    .line 104
    .line 105
    if-lez v1, :cond_4

    .line 106
    .line 107
    iput-boolean v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 108
    .line 109
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 110
    .line 111
    .line 112
    :cond_4
    :goto_0
    iput-boolean v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->i:Z

    .line 113
    .line 114
    goto :goto_1

    .line 115
    :cond_5
    invoke-virtual {v0, v2}, Landroid/view/ViewGroup;->requestDisallowInterceptTouchEvent(Z)V

    .line 116
    .line 117
    .line 118
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawX()F

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->g:F

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getRawY()F

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->h:F

    .line 129
    .line 130
    :goto_1
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    return p0

    .line 135
    :cond_6
    :goto_2
    invoke-super {p0, p1}, Landroid/view/View;->dispatchTouchEvent(Landroid/view/MotionEvent;)Z

    .line 136
    .line 137
    .line 138
    move-result p0

    .line 139
    return p0
.end method

.method public getMKWebViewList()Ljava/util/List;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/hellogroup/mk/business/base/ui/MKWebView;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 7
    .line 8
    invoke-virtual {v1}, Landroid/view/ViewGroup;->getChildCount()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    const/4 v2, 0x0

    .line 13
    :goto_0
    if-ge v2, v1, :cond_1

    .line 14
    .line 15
    iget-object v3, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->b:Lv/VPager;

    .line 16
    .line 17
    invoke-virtual {v3, v2}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    instance-of v4, v3, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 22
    .line 23
    if-eqz v4, :cond_0

    .line 24
    .line 25
    check-cast v3, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;

    .line 26
    .line 27
    iget-object v3, v3, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/view/CampaignItemView;->c:Lcom/hellogroup/mk/business/base/ui/MKWebView;

    .line 28
    .line 29
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    :cond_0
    add-int/lit8 v2, v2, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-object v0
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ue4;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->q(Ll/ue4;)V

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

.method public final n(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/x3s;->a(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    new-instance v0, Ll/s3s;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/s3s;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-direct {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->u(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->e:Ll/zd4;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/zd4;->r()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public q(Ll/ue4;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 2
    .line 3
    return-void
.end method

.method public setAutoplay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->n:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->B()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public setLiveCampaignLocation(Z)V
    .locals 1

    .line 1
    new-instance v0, Ll/r3s;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/r3s;-><init>(Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;Z)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public v()Z
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/ue4;->f4()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->f:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public final synthetic y(Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    instance-of v1, v0, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 6
    .line 7
    if-eqz v1, :cond_1

    .line 8
    .line 9
    move-object v1, v0

    .line 10
    check-cast v1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 11
    .line 12
    if-eqz p1, :cond_0

    .line 13
    .line 14
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->d:Ll/ue4;

    .line 15
    .line 16
    invoke-virtual {p1}, Ll/ue4;->i4()I

    .line 17
    .line 18
    .line 19
    move-result p1

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const/high16 p1, 0x428c0000    # 70.0f

    .line 22
    .line 23
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    :goto_0
    iput p1, v1, Landroid/view/ViewGroup$MarginLayoutParams;->bottomMargin:I

    .line 28
    .line 29
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public final synthetic z(Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p2}, Landroid/view/MotionEvent;->getAction()I

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_1

    .line 6
    .line 7
    const/4 p2, 0x1

    .line 8
    if-eq p1, p2, :cond_0

    .line 9
    .line 10
    const/4 p2, 0x2

    .line 11
    if-eq p1, p2, :cond_1

    .line 12
    .line 13
    const/4 p2, 0x3

    .line 14
    if-eq p1, p2, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->B()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->j:Landroid/os/Handler;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/campaign/LiveCampaignView;->o:Ljava/lang/Runnable;

    .line 24
    .line 25
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 26
    .line 27
    .line 28
    :goto_0
    const/4 p0, 0x0

    .line 29
    return p0
.end method
