.class public Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"

# interfaces
.implements Ll/iam;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Landroid/widget/FrameLayout;",
        "Ll/iam<",
        "Ll/liu;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

.field public b:Lv/VPager;

.field public c:Lv/VLinear;

.field public d:Ll/liu;

.field public e:Ll/yhu;

.field public final f:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Ll/pd4;",
            ">;"
        }
    .end annotation
.end field

.field public final g:Landroid/os/Handler;

.field public h:I

.field public i:[Landroid/view/View;

.field public j:Z

.field public final k:Ljava/lang/Runnable;


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
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 10
    .line 11
    new-instance p1, Landroid/os/Handler;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 17
    .line 18
    const/4 p1, 0x1

    .line 19
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->j:Z

    .line 20
    .line 21
    new-instance p1, Ll/oiu;

    .line 22
    .line 23
    invoke-direct {p1, p0}, Ll/oiu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    .line 24
    .line 25
    .line 26
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    .line 27
    .line 28
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 29
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 31
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    const/4 p1, 0x1

    .line 32
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->j:Z

    .line 33
    new-instance p1, Ll/oiu;

    invoke-direct {p1, p0}, Ll/oiu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 34
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 35
    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 36
    new-instance p1, Landroid/os/Handler;

    invoke-direct {p1}, Landroid/os/Handler;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    const/4 p1, 0x1

    .line 37
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->j:Z

    .line 38
    new-instance p1, Ll/oiu;

    invoke-direct {p1, p0}, Ll/oiu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->v()V

    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->u()V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;Landroid/view/View;Landroid/view/MotionEvent;)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->w(Landroid/view/View;Landroid/view/MotionEvent;)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)Ljava/util/List;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    return-object p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->h:I

    return p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)[Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->i:[Landroid/view/View;

    return-object p0
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
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 2
    .line 3
    new-instance v0, Ll/piu;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/piu;-><init>()V

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

.method public static bridge synthetic i(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->h:I

    return-void
.end method

.method public static bridge synthetic j(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->y()V

    return-void
.end method

.method public static bridge synthetic k(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->E()V

    return-void
.end method

.method private setIndicator(I)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->i:[Landroid/view/View;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->c:Lv/VLinear;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->i:[Landroid/view/View;

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
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->i:[Landroid/view/View;

    .line 80
    .line 81
    aput-object v2, v3, v1

    .line 82
    .line 83
    iget-object v3, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->c:Lv/VLinear;

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

.method private synthetic u()V
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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


# virtual methods
.method public final A(Ljava/util/List;)V
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
    new-instance v0, Ll/tiu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/tiu;-><init>()V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->B()V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v1}, Ljava/util/List;->clear()V

    .line 24
    .line 25
    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 27
    .line 28
    new-instance v4, Ll/ze4;

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
    invoke-direct {v4, v3}, Ll/ze4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

    .line 42
    .line 43
    .line 44
    invoke-interface {v1, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 45
    .line 46
    .line 47
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 48
    .line 49
    invoke-interface {v1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 50
    .line 51
    .line 52
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 53
    .line 54
    new-instance v1, Ll/ze4;

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
    invoke-direct {v1, v2}, Ll/ze4;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;)V

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
    invoke-direct {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->setIndicator(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 77
    .line 78
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 81
    .line 82
    .line 83
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 84
    .line 85
    invoke-virtual {p1}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 86
    .line 87
    .line 88
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 89
    .line 90
    const/4 v1, 0x0

    .line 91
    invoke-virtual {p1, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 92
    .line 93
    .line 94
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 95
    .line 96
    invoke-interface {p1}, Ljava/util/List;->clear()V

    .line 97
    .line 98
    .line 99
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 100
    .line 101
    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 102
    .line 103
    .line 104
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 105
    .line 106
    invoke-virtual {p0, v2}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 107
    .line 108
    .line 109
    return-void
.end method

.method public final B()V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "ClickableViewAccessibility"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 2
    .line 3
    new-instance v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView$a;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView$a;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->d(Landroidx/viewpager/widget/ViewPager$j;)V

    .line 9
    .line 10
    .line 11
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 12
    .line 13
    new-instance v1, Ll/uiu;

    .line 14
    .line 15
    invoke-direct {v1, p0}, Ll/uiu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public final C()V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->getValidMaxRatio()Landroid/util/Pair;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, v0, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 6
    .line 7
    check-cast v1, Ljava/lang/Integer;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    iget-object v0, v0, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 14
    .line 15
    check-cast v0, Ljava/lang/Integer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/16 v2, 0x6e

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    if-gt v1, v2, :cond_0

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    move v1, v2

    .line 29
    :goto_0
    const/16 v2, 0x22

    .line 30
    .line 31
    if-eqz v0, :cond_1

    .line 32
    .line 33
    if-gt v0, v2, :cond_1

    .line 34
    .line 35
    goto :goto_1

    .line 36
    :cond_1
    move v0, v2

    .line 37
    :goto_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 38
    .line 39
    invoke-virtual {v2}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 40
    .line 41
    .line 42
    move-result-object v2

    .line 43
    int-to-float v1, v1

    .line 44
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    iput v1, v2, Landroid/view/ViewGroup$LayoutParams;->width:I

    .line 49
    .line 50
    int-to-float v0, v0

    .line 51
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    iput v0, v2, Landroid/view/ViewGroup$LayoutParams;->height:I

    .line 56
    .line 57
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 58
    .line 59
    invoke-virtual {p0, v2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 60
    .line 61
    .line 62
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

.method public final E()V
    .locals 4

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->p(I)Landroid/view/View;

    .line 3
    .line 4
    .line 5
    move-result-object v0

    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

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
    invoke-virtual {p0, v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->p(I)Landroid/view/View;

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
    instance-of v3, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 24
    .line 25
    if-eqz v3, :cond_0

    .line 26
    .line 27
    move-object v3, v1

    .line 28
    check-cast v3, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 29
    .line 30
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->getViewBitmap()Landroid/graphics/Bitmap;

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
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;

    .line 48
    .line 49
    invoke-virtual {v0, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;->setBg(Landroid/graphics/Bitmap;)V

    .line 50
    .line 51
    .line 52
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

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
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->p(I)Landroid/view/View;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {p0, v3}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->p(I)Landroid/view/View;

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
    instance-of p0, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 73
    .line 74
    if-eqz p0, :cond_3

    .line 75
    .line 76
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 77
    .line 78
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->getViewBitmap()Landroid/graphics/Bitmap;

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
    check-cast v0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;

    .line 94
    .line 95
    invoke-virtual {v0, v2}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignSnapShotItemView;->setBg(Landroid/graphics/Bitmap;)V

    .line 96
    .line 97
    .line 98
    :cond_5
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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->c:Lv/VLinear;

    .line 6
    .line 7
    invoke-static {v1, v0}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 11
    .line 12
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    .line 13
    .line 14
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-virtual {v0, v1}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroidx/viewpager/widget/ViewPager;->i()V

    .line 26
    .line 27
    .line 28
    new-instance v0, Ll/riu;

    .line 29
    .line 30
    invoke-direct {v0}, Ll/riu;-><init>()V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->q(Ll/y20;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->e:Ll/yhu;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/yhu;->r()V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public bridge synthetic i1(Ll/k3m;)V
    .locals 0

    .line 1
    check-cast p1, Ll/liu;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->n(Ll/liu;)V

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

.method public final l(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/viu;->a(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    new-instance v0, Ll/qiu;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/qiu;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->q(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->e:Ll/yhu;

    .line 10
    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    invoke-virtual {p0}, Ll/yhu;->q()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public n(Ll/liu;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->d:Ll/liu;

    .line 2
    .line 3
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->l(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public final p(I)Landroid/view/View;
    .locals 5
    .annotation build Landroidx/annotation/Nullable;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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

.method public final q(Ll/y20;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;",
            ">;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    instance-of v2, v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 28
    .line 29
    if-eqz v2, :cond_1

    .line 30
    .line 31
    check-cast v1, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

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

.method public s()Z
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 2
    .line 3
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    xor-int/lit8 p0, p0, 0x1

    .line 8
    .line 9
    return p0
.end method

.method public setAutoplay(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->j:Z

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->y()V

    .line 6
    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    .line 12
    .line 13
    invoke-virtual {p1, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic v()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->s()Z

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

.method public final synthetic w(Landroid/view/View;Landroid/view/MotionEvent;)Z
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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->y()V

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 22
    .line 23
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

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

.method public x(Ljava/util/List;)V
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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 11
    .line 12
    invoke-virtual {v2, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    instance-of v3, v2, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 17
    .line 18
    if-eqz v3, :cond_0

    .line 19
    .line 20
    check-cast v2, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;

    .line 21
    .line 22
    invoke-virtual {v2, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/view/LiveVChatCampaignItemView;->r(Ljava/util/List;)V

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

.method public final y()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->j:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 15
    .line 16
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 30
    .line 31
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

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
    check-cast v0, Ll/pd4;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/pd4;->a()Lcom/p1/mobile/putong/live/base/data/BLiveCampaign;

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
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 52
    .line 53
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

    .line 54
    .line 55
    invoke-virtual {v1, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 56
    .line 57
    .line 58
    iget-object v1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->g:Landroid/os/Handler;

    .line 59
    .line 60
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->k:Ljava/lang/Runnable;

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

.method public z(Ljava/util/List;)V
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
    invoke-static {p1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->a:Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;

    .line 9
    .line 10
    invoke-static {p1, v1}, Ll/bnl0;->M(Landroid/view/View;Z)V

    .line 11
    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 14
    .line 15
    invoke-interface {p0}, Ljava/util/List;->clear()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->e:Ll/yhu;

    .line 20
    .line 21
    if-nez v0, :cond_1

    .line 22
    .line 23
    new-instance v0, Ll/yhu;

    .line 24
    .line 25
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->d:Ll/liu;

    .line 26
    .line 27
    invoke-direct {v0, v2}, Ll/yhu;-><init>(Ll/liu;)V

    .line 28
    .line 29
    .line 30
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->e:Ll/yhu;

    .line 31
    .line 32
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Ll/cf60;)V

    .line 35
    .line 36
    .line 37
    :cond_1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->A(Ljava/util/List;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->C()V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 44
    .line 45
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 46
    .line 47
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setOffscreenPageLimit(I)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->e:Ll/yhu;

    .line 55
    .line 56
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ll/yhu;->s(Ljava/util/List;)V

    .line 59
    .line 60
    .line 61
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->f:Ljava/util/List;

    .line 62
    .line 63
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    const/4 v0, 0x1

    .line 68
    if-le p1, v0, :cond_2

    .line 69
    .line 70
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->b:Lv/VPager;

    .line 71
    .line 72
    invoke-virtual {p1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    .line 73
    .line 74
    .line 75
    iget-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;->i:[Landroid/view/View;

    .line 76
    .line 77
    aget-object p1, p1, v1

    .line 78
    .line 79
    invoke-virtual {p1, v0}, Landroid/view/View;->setSelected(Z)V

    .line 80
    .line 81
    .line 82
    :cond_2
    new-instance p1, Ll/siu;

    .line 83
    .line 84
    invoke-direct {p1, p0}, Ll/siu;-><init>(Lcom/p1/mobile/putong/live/external/internal/vchat/module/campaign/LiveVChatCampaignView;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p1}, Ll/l51;->G(Ljava/lang/Runnable;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method
